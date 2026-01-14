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

// Print integer
void print_int(int value) {
    printf("%d", value);
}

// Print integer with newline
void println_int(int value) {
    printf("%d\n", value);
}

// Print boolean
void print_bool(int value) {
    printf("%s", value ? "true" : "false");
}

// Print boolean with newline
void println_bool(int value) {
    printf("%s\n", value ? "true" : "false");
}

// Print character
void print_char(char c) {
    printf("%c", c);
}

// Print character with newline
void println_char(char c) {
    printf("%c\n", c);
}