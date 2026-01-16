#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

// Array structure
typedef struct {
    void* data;
    int length;
    int capacity;
} Array;

// Create array
Array* array_new(int element_size, int initial_capacity) {
    Array* arr = (Array*)malloc(sizeof(Array));
    arr->length = 0;
    arr->capacity = initial_capacity;
    arr->data = malloc(element_size * initial_capacity);
    return arr;
}

// Free array
void array_free(Array* arr) {
    free(arr->data);
    free(arr);
}

// Push element (generic)
void array_push(Array* arr, void* element, int element_size) {
    if (arr->length >= arr->capacity) {
        // Resize
        arr->capacity *= 2;
        arr->data = realloc(arr->data, element_size * arr->capacity);
    }

    // Copy element to end
    char* dest = (char*)arr->data + (arr->length * element_size);
    memcpy(dest, element, element_size);
    arr->length++;
}

// Get element
void* array_get(Array* arr, int index, int element_size) {
    if (index < 0 || index >= arr->length) {
        return NULL;
    }
    return (char*)arr->data + (index * element_size);
}

// Array length
int array_len(Array* arr) {
    return arr->length;
}

// ============================================
// String Comparison
// ============================================

int str_equals(const char* s1, const char* s2) {
    return strcmp(s1, s2) == 0 ? 1 : 0;
}

int str_compare(const char* s1, const char* s2) {
    return strcmp(s1, s2);
}

// ============================================
// String Length
// ============================================

int str_length(const char* s) {
    return strlen(s);
}

// ============================================
// String Concatenation
// ============================================

char* str_concat(const char* s1, const char* s2) {
    int len1 = strlen(s1);
    int len2 = strlen(s2);
    char* result = (char*)malloc(len1 + len2 + 1);

    strcpy(result, s1);
    strcat(result, s2);

    return result;
}

// ============================================
// String Substring
// ============================================

char* str_substring(const char* s, int start, int length) {
    int str_len = strlen(s);

    if (start < 0 || start >= str_len) {
        return "";
    }

    if (start + length > str_len) {
        length = str_len - start;
    }

    char* result = (char*)malloc(length + 1);
    strncpy(result, s + start, length);
    result[length] = '\0';

    return result;
}

// ============================================
// String Character At
// ============================================

char str_char_at(const char* s, int index) {
    int len = strlen(s);

    if (index < 0 || index >= len) {
        return '\0';
    }

    return s[index];
}

// ============================================
// String Contains
// ============================================

int str_contains(const char* haystack, const char* needle) {
    return strstr(haystack, needle) != NULL ? 1 : 0;
}

// ============================================
// String Starts With
// ============================================

int str_starts_with(const char* s, const char* prefix) {
    int s_len = strlen(s);
    int prefix_len = strlen(prefix);

    if (prefix_len > s_len) {
        return 0;
    }

    return strncmp(s, prefix, prefix_len) == 0 ? 1 : 0;
}

// ============================================
// String Ends With
// ============================================

int str_ends_with(const char* s, const char* suffix) {
    int s_len = strlen(s);
    int suffix_len = strlen(suffix);

    if (suffix_len > s_len) {
        return 0;
    }

    return strcmp(s + (s_len - suffix_len), suffix) == 0 ? 1 : 0;
}

// ============================================
// String Index Of
// ============================================

int str_index_of(const char* haystack, const char* needle) {
    const char* pos = strstr(haystack, needle);

    if (pos == NULL) {
        return -1;
    }

    return pos - haystack;
}

// ============================================
// String Replace (first occurrence)
// ============================================

char* str_replace(const char* s, const char* old_str, const char* new_str) {
    const char* pos = strstr(s, old_str);

    if (pos == NULL) {
        // No match, return copy
        char* result = (char*)malloc(strlen(s) + 1);
        strcpy(result, s);
        return result;
    }

    int old_len = strlen(old_str);
    int new_len = strlen(new_str);
    int prefix_len = pos - s;
    int suffix_len = strlen(pos + old_len);

    char* result = (char*)malloc(prefix_len + new_len + suffix_len + 1);

    // Copy prefix
    strncpy(result, s, prefix_len);
    result[prefix_len] = '\0';

    // Copy new string
    strcat(result, new_str);

    // Copy suffix
    strcat(result, pos + old_len);

    return result;
}

// ============================================
// String To Integer
// ============================================

int str_to_int(const char* s) {
    return atoi(s);
}

// ============================================
// Integer To String
// ============================================

char* int_to_str(int n) {
    char* result = (char*)malloc(32);  // enough for any int
    sprintf(result, "%d", n);
    return result;
}

// ============================================
// String Clone/Copy
// ============================================

char* str_clone(const char* s) {
    int len = strlen(s);
    char* result = (char*)malloc(len + 1);
    strcpy(result, s);
    return result;
}

// ============================================
// String Trim (whitespace)
// ============================================

char* str_trim(const char* s) {
    // Find start (skip leading whitespace)
    while (*s == ' ' || *s == '\t' || *s == '\n' || *s == '\r') {
        s++;
    }

    if (*s == '\0') {
        return "";
    }

    // Find end (skip trailing whitespace)
    const char* end = s + strlen(s) - 1;
    while (end > s && (*end == ' ' || *end == '\t' || *end == '\n' || *end == '\r')) {
        end--;
    }

    int len = end - s + 1;
    char* result = (char*)malloc(len + 1);
    strncpy(result, s, len);
    result[len] = '\0';

    return result;
}

// ============================================
// String Split (simplified - single delimiter)
// ============================================

typedef struct {
    char** parts;
    int count;
} StringArray;

StringArray* str_split(const char* s, char delimiter) {
    // Count delimiters
    int count = 1;
    for (const char* p = s; *p; p++) {
        if (*p == delimiter) count++;
    }

    StringArray* result = (StringArray*)malloc(sizeof(StringArray));
    result->parts = (char**)malloc(count * sizeof(char*));
    result->count = count;

    int part_index = 0;
    const char* start = s;
    const char* p = s;

    while (1) {
        if (*p == delimiter || *p == '\0') {
            int len = p - start;
            result->parts[part_index] = (char*)malloc(len + 1);
            strncpy(result->parts[part_index], start, len);
            result->parts[part_index][len] = '\0';
            part_index++;

            if (*p == '\0') break;
            start = p + 1;
        }
        p++;
    }

    return result;
}

void str_split_free(StringArray* arr) {
    for (int i = 0; i < arr->count; i++) {
        free(arr->parts[i]);
    }
    free(arr->parts);
    free(arr);
}