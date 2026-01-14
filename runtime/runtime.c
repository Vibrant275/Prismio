#include <stdio.h>
#include <stdlib.h>

// Println function - prints a string and adds a newline
void println(const char* str) {
    printf("%s\n", str);
}

// Print function - prints a string without newline
void print(const char* str) {
    printf("%s", str);
}