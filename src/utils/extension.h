#ifndef PRISMIO_EXTENSION_H
#define PRISMIO_EXTENSION_H

#include "token.h"

void displayError(const std::string& error);
void displayError(std::string, Token errorToken);

void displaySuccess(const std::string& message);
std::string invalidTokenError(std::string error, char errorToken, int line);
#endif
