#ifndef MODULE_RESOLVER_H
#define MODULE_RESOLVER_H

#include <string>
#include <vector>
#include <map>
#include <memory>
#include <set>

#include "../parser/node.h"
#include "../lexer/lexer.h"
#include "../parser/parser.h"

// Module resolver for handling imports
class ModuleResolver {
public:
    ModuleResolver(const std::string& basePath);
    
    // Resolve and load a module from an import path
    // e.g., "file.FileHinter" -> loads file/FileHinter.psm or file.psm
    std::unique_ptr<ModuleNode> resolveModule(const std::vector<std::string>& modulePath);
    
    // Get the base path for module resolution
    std::string getBasePath() const { return basePath; }
    
    // Set the base path (typically the directory of the current file)
    void setBasePath(const std::string& path) { basePath = path; }
    
private:
    std::string basePath;
    std::map<std::string, std::string> cachedSources; // Cache source code instead of parsed modules

    std::map<std::string, std::unique_ptr<ModuleNode>> moduleCache; // Cache parsed modules
    std::set<std::string> importStack; // Track circular imports
    
    // Convert module path to file path
    std::string modulePathToFilePath(const std::vector<std::string>& modulePath);
    
    // Read source code from file
    std::string readSourceCodeFromFile(const std::string& filePath);
    
    // Check if file exists
    bool fileExists(const std::string& filePath);
};

#endif // MODULE_RESOLVER_H
