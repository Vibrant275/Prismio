#ifndef PRISMIO_EXTENSION_H
#define PRISMIO_EXTENSION_H

#include "token.h"

void displayError(const std::string& error);
void displayError(std::string, Token errorToken);

void displaySuccess(const std::string& message);
#endif
