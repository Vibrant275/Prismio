#include "module_resolver.h"
#include <fstream>
#include <sstream>
#include <filesystem>
#include <iostream>
#include "extension.h"

ModuleResolver::ModuleResolver(const std::string& basePath) : basePath(basePath) {
    // Normalize the base path
    if (!basePath.empty() && basePath.back() != '/' && basePath.back() != '\\') {
        this->basePath = basePath;
    }
}

std::string ModuleResolver::modulePathToFilePath(const std::vector<std::string>& modulePath) {
    if (modulePath.empty()) {
        return "";
    }

    std::stringstream path;

    // Start with base path
    if (!basePath.empty()) {
        path << basePath;
        // Ensure path separator
        if (basePath.back() != '/' && basePath.back() != '\\') {
            path << "/";
        }
    }

    // Convert module path to file path
    // e.g., ["file", "FileHinter"] -> "file/FileHinter.psm"
    // or ["file"] -> "file.psm"

    if (modulePath.size() == 1) {
        // Simple module: "file" -> "file.psm"
        path << modulePath[0] << ".psm";
    } else {
        // Nested module: "file.FileHinter" -> "file/FileHinter.psm"
        for (size_t i = 0; i < modulePath.size() - 1; i++) {
            path << modulePath[i] << "/";
        }
        path << modulePath.back() << ".psm";
    }

    return path.str();
}

std::string ModuleResolver::readSourceCodeFromFile(const std::string& filePath) {
    std::ifstream file(filePath, std::ios::in | std::ios::binary | std::ios::ate);
    if (!file) {
        throw std::runtime_error("Error: Could not open file " + filePath);
    }

    std::streamsize size = file.tellg();
    if (size < 0) {
        throw std::runtime_error("Error: Could not determine file size: " + filePath);
    }

    std::string buffer(static_cast<size_t>(size), '\0');
    file.seekg(0);
    if (!file.read(buffer.data(), size)) {
        throw std::runtime_error("Error: Could not read file: " + filePath);
    }

    return buffer;
}

bool ModuleResolver::fileExists(const std::string& filePath) {
    std::ifstream file(filePath);
    return file.good();
}

std::unique_ptr<ModuleNode> ModuleResolver::resolveModule(const std::vector<std::string>& modulePath) {
    // Create cache key
    std::string cacheKey;
    for (size_t i = 0; i < modulePath.size(); i++) {
        if (i > 0) cacheKey += ".";
        cacheKey += modulePath[i];
    }

    std::cout << "[DEBUG] Resolving module: " << cacheKey << std::endl;

    // Check if already in cache
    auto cachedIt = moduleCache.find(cacheKey);
    if (cachedIt != moduleCache.end()) {
        std::cout << "[DEBUG] Module found in cache" << std::endl;
        // Return the cached module
    }

    // Check for circular imports
    if (importStack.find(cacheKey) != importStack.end()) {
        std::cerr << "[ERROR] Circular import detected: " << cacheKey << std::endl;
        return nullptr;
    }

    std::cout << "[DEBUG] Adding to import stack: " << cacheKey << std::endl;
    // Add to import stack
    importStack.insert(cacheKey);

    // Resolve file path
    std::string filePath = modulePathToFilePath(modulePath);
    std::cout << "[DEBUG] Initial file path: " << filePath << std::endl;

    // Try multiple resolution strategies
    std::vector<std::string> pathsToTry;

    // Strategy 1: Direct path from base
    pathsToTry.push_back(basePath.empty() ? filePath : basePath + "/" + filePath);

    // Strategy 2: Try .psm extension directly
    if (modulePath.size() == 1) {
        pathsToTry.push_back(basePath + "/" + modulePath[0] + ".psm");
    }

    // Strategy 3: Try as directory with same name .psm
    if (modulePath.size() > 1) {
        std::string dirPath = basePath + "/" + modulePath[0] + "/" + modulePath[1] + ".psm";
        pathsToTry.push_back(dirPath);
    }

    // Strategy 4: Try in a lib/ directory
    pathsToTry.push_back(basePath + "/lib/" + filePath);

    // Find existing file
    std::string resolvedPath;
    std::cout << "[DEBUG] Trying paths:" << std::endl;
    for (const auto& path : pathsToTry) {
        std::cout << "[DEBUG]   Checking: " << path << std::endl;
        if (fileExists(path)) {
            resolvedPath = path;
            std::cout << "[DEBUG]   ✓ Found!" << std::endl;
            break;
        } else {
            std::cout << "[DEBUG]   ✗ Not found" << std::endl;
        }
    }

    if (resolvedPath.empty()) {
        std::cerr << "[ERROR] Could not resolve module: ";
        for (size_t i = 0; i < modulePath.size(); i++) {
            if (i > 0) std::cerr << ".";
            std::cerr << modulePath[i];
        }
        std::cerr << std::endl;
        std::cerr << "Tried paths:" << std::endl;
        for (const auto& path : pathsToTry) {
            std::cerr << "  - " << path << std::endl;
        }

        // Remove from import stack
        importStack.erase(cacheKey);
        return nullptr;
    }

    std::cout << "[DEBUG] Resolved path: " << resolvedPath << std::endl;

    // Read and parse the file
    try {
        std::cout << "[DEBUG] Reading file..." << std::endl;
        std::string source = readSourceCodeFromFile(resolvedPath);
        std::cout << "[DEBUG] File read successfully. Size: " << source.size() << " bytes" << std::endl;

        // Tokenize
        std::cout << "[DEBUG] Tokenizing..." << std::endl;
        Lexer lexer(source);
        auto lexResult = lexer.tokenize();
        std::cout << "[DEBUG] Tokenization complete. Tokens: " << lexResult.tokens.size() << std::endl;

        if (!lexResult.errors.empty()) {
            std::cerr << "[ERROR] Tokenization errors in module " << cacheKey << ":" << std::endl;
            for (const auto& error : lexResult.errors) {
                displayError(error.message);
            }

            // Remove from import stack
            importStack.erase(cacheKey);
            return nullptr;
        }

        // Parse
        std::cout << "[DEBUG] Parsing..." << std::endl;
        Parser parser(lexResult.tokens);
        ModuleNode parsedModule = parser.parse();
        std::cout << "[DEBUG] Parsing complete. Statements: " << parsedModule.statements.size() << std::endl;

        // Create new module to return
        std::cout << "[DEBUG] Creating result module..." << std::endl;
        auto moduleResult = std::make_unique<ModuleNode>();

        // Move all statements to the result module
        std::cout << "[DEBUG] Moving statements..." << std::endl;
        for (auto& stmt : parsedModule.statements) {
            std::cout << "[DEBUG]   Moving statement type: " << getNodeTypeString(stmt->type) << std::endl;
            moduleResult->statements.push_back(std::move(stmt));
        }

        std::cout << "[DEBUG] Result module has " << moduleResult->statements.size() << " statements" << std::endl;

        // Cache the module path (for future reference)
        cachedSources[cacheKey] = source;

        // Remove from import stack
        std::cout << "[DEBUG] Removing from import stack: " << cacheKey << std::endl;
        importStack.erase(cacheKey);

        std::cout << "[DEBUG] Successfully resolved module: " << cacheKey << std::endl;
        return moduleResult;

    } catch (const std::exception& e) {
        std::cerr << "[ERROR] Exception loading module " << cacheKey << ": " << e.what() << std::endl;

        // Remove from import stack
        importStack.erase(cacheKey);
        return nullptr;
    } catch (...) {
        std::cerr << "[ERROR] Unknown exception loading module " << cacheKey << std::endl;

        // Remove from import stack
        importStack.erase(cacheKey);
        return nullptr;
    }
}