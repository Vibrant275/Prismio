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
    
    // Check if we've seen this module before (for cycle detection)
    // We'll always re-parse to avoid issues with moved statements
    
    // Resolve file path
    std::string filePath = modulePathToFilePath(modulePath);
    
    // Try multiple resolution strategies
    std::vector<std::string> pathsToTry;
    
    // Strategy 1: Direct path
    pathsToTry.push_back(filePath);
    
    // Strategy 2: Relative to current directory
    if (!basePath.empty()) {
        pathsToTry.push_back(basePath + "/" + filePath);
    }
    
    // Strategy 3: Try as a directory with index.psm
    if (modulePath.size() == 1) {
        std::string dirPath = basePath + "/" + modulePath[0] + "/index.psm";
        pathsToTry.push_back(dirPath);
    }
    
    // Strategy 4: Try in a lib/ directory
    pathsToTry.push_back(basePath + "/lib/" + filePath);
    
    // Try each path
    std::string resolvedPath;
    for (const auto& path : pathsToTry) {
        if (fileExists(path)) {
            resolvedPath = path;
            break;
        }
    }
    
    if (resolvedPath.empty()) {
        std::cerr << "Error: Could not resolve module: ";
        for (size_t i = 0; i < modulePath.size(); i++) {
            if (i > 0) std::cerr << ".";
            std::cerr << modulePath[i];
        }
        std::cerr << std::endl;
        std::cerr << "Tried paths:" << std::endl;
        for (const auto& path : pathsToTry) {
            std::cerr << "  - " << path << std::endl;
        }
        return nullptr;
    }
    
    // Read and parse the file
    try {
        std::string source = readSourceCodeFromFile(resolvedPath);
        
        // Tokenize
        Lexer lexer(source);
        auto result = lexer.tokenize();
        
        if (!result.errors.empty()) {
            std::cerr << "Error tokenizing module " << cacheKey << ":" << std::endl;
            for (const auto& error : result.errors) {
                displayError(error.message);
            }
            return nullptr;
        }
        
        // Parse
        Parser parser(result.tokens);
        ModuleNode parsedModule = parser.parse();
        
        // Cache the source code for future reference (though we'll re-parse each time)
        cachedSources[cacheKey] = source;
        
        // Return a new module with the parsed statements
        auto module = std::make_unique<ModuleNode>();
        for (auto& stmt : parsedModule.statements) {
            module->statements.push_back(std::move(stmt));
        }
        
        return module;
    } catch (const std::exception& e) {
        std::cerr << "Error loading module " << cacheKey << ": " << e.what() << std::endl;
        return nullptr;
    }
}
