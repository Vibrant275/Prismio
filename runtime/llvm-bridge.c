// ============================================
// String-Based LLVM IR Generator for Prismio
// No LLVM dependencies - generates IR as text
// ============================================

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// ============================================
// Global State
// ============================================

#define MAX_IR_SIZE 1048576  // 1MB buffer for IR
#define MAX_LABEL_COUNT 10000

static char ir_buffer[MAX_IR_SIZE];
static int ir_position = 0;
static int next_temp = 0;
static int next_label = 0;
static FILE* output_file = NULL;

// Type representations (as strings)
static const char* TYPE_VOID = "void";
static const char* TYPE_I1 = "i1";
static const char* TYPE_I8 = "i8";
static const char* TYPE_I32 = "i32";
static const char* TYPE_I64 = "i64";
static const char* TYPE_I8_PTR = "i8*";

// ============================================
// Buffer Management
// ============================================

void ir_reset() {
    ir_position = 0;
    next_temp = 0;
    next_label = 0;
    memset(ir_buffer, 0, MAX_IR_SIZE);
}

void ir_append(const char* str) {
    int len = strlen(str);
    if (ir_position + len < MAX_IR_SIZE) {
        strcpy(ir_buffer + ir_position, str);
        ir_position += len;
    }
}

void ir_append_line(const char* str) {
    ir_append(str);
    ir_append("\n");
}

const char* ir_get_buffer() {
    return ir_buffer;
}

int ir_get_temp() {
    return next_temp++;
}

int ir_get_label() {
    return next_label++;
}

// ============================================
// File Operations
// ============================================

void ir_open_file(const char* filename) {
    output_file = fopen(filename, "w");
}

void ir_close_file() {
    if (output_file) {
        fclose(output_file);
        output_file = NULL;
    }
}

void ir_write_to_file() {
    if (output_file) {
        fprintf(output_file, "%s", ir_buffer);
    }
}

void ir_flush() {
    if (output_file) {
        ir_write_to_file();
        fflush(output_file);
    }
}

// ============================================
// Module Management
// ============================================

void ir_module_start(const char* module_name) {
    ir_reset();

    // Add module header comments
    ir_append("; ModuleID = '");
    ir_append(module_name);
    ir_append_line("'");
    ir_append_line("source_filename = \"prismio_generated\"");
    ir_append_line("target datalayout = \"e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128\"");
    ir_append_line("target triple = \"x86_64-pc-windows-msvc\"");
    ir_append_line("");
}

void ir_module_end() {
    // Nothing special needed
}

// ============================================
// Type Helpers
// ============================================

const char* ir_type_void() { return TYPE_VOID; }
const char* ir_type_i1() { return TYPE_I1; }
const char* ir_type_i8() { return TYPE_I8; }
const char* ir_type_i32() { return TYPE_I32; }
const char* ir_type_i64() { return TYPE_I64; }
const char* ir_type_i8_ptr() { return TYPE_I8_PTR; }

// Store pointer type as string (caller must manage memory)
void ir_type_pointer(const char* element_type, char* out_buffer) {
    sprintf(out_buffer, "%s*", element_type);
}

void ir_type_array(const char* element_type, int count, char* out_buffer) {
    sprintf(out_buffer, "[%d x %s]", count, element_type);
}

// ============================================
// Function Declaration
// ============================================

void ir_declare_function(const char* name, const char* return_type,
                         const char** param_types, int param_count) {
    ir_append("declare ");
    ir_append(return_type);
    ir_append(" @");
    ir_append(name);
    ir_append("(");

    for (int i = 0; i < param_count; i++) {
        if (i > 0) ir_append(", ");
        ir_append(param_types[i]);
    }

    ir_append_line(")");
}

void ir_function_start(const char* name, const char* return_type,
                       const char** param_types, const char** param_names,
                       int param_count) {
    ir_append("define ");
    ir_append(return_type);
    ir_append(" @");
    ir_append(name);
    ir_append("(");

    for (int i = 0; i < param_count; i++) {
        if (i > 0) ir_append(", ");
        ir_append(param_types[i]);
        ir_append(" %");
        ir_append(param_names[i]);
    }

    ir_append_line(") {");
}

void ir_function_end() {
    ir_append_line("}");
    ir_append_line("");
}

// ============================================
// Basic Blocks
// ============================================

void ir_label(const char* label_name) {
    ir_append(label_name);
    ir_append_line(":");
}

void ir_label_numbered(int label_num) {
    char buffer[64];
    sprintf(buffer, "label_%d:", label_num);
    ir_append_line(buffer);
}

// ============================================
// Memory Instructions
// ============================================

int ir_alloca(const char* type, const char* name) {
    int temp = ir_get_temp();
    char buffer[256];
    sprintf(buffer, "  %%%s = alloca %s", name, type);
    ir_append_line(buffer);
    return temp;
}

int ir_load(const char* type, const char* ptr_name) {
    int temp = ir_get_temp();
    char buffer[256];
    sprintf(buffer, "  %%t%d = load %s, %s* %%%s", temp, type, type, ptr_name);
    ir_append_line(buffer);
    return temp;
}

void ir_store(const char* type, const char* value, const char* ptr_name) {
    char buffer[256];
    sprintf(buffer, "  store %s %s, %s* %%%s", type, value, type, ptr_name);
    ir_append_line(buffer);
}

// ============================================
// Arithmetic Instructions
// ============================================

int ir_add(const char* type, const char* lhs, const char* rhs) {
    int temp = ir_get_temp();
    char buffer[256];
    sprintf(buffer, "  %%t%d = add %s %s, %s", temp, type, lhs, rhs);
    ir_append_line(buffer);
    return temp;
}

int ir_sub(const char* type, const char* lhs, const char* rhs) {
    int temp = ir_get_temp();
    char buffer[256];
    sprintf(buffer, "  %%t%d = sub %s %s, %s", temp, type, lhs, rhs);
    ir_append_line(buffer);
    return temp;
}

int ir_mul(const char* type, const char* lhs, const char* rhs) {
    int temp = ir_get_temp();
    char buffer[256];
    sprintf(buffer, "  %%t%d = mul %s %s, %s", temp, type, lhs, rhs);
    ir_append_line(buffer);
    return temp;
}

int ir_sdiv(const char* type, const char* lhs, const char* rhs) {
    int temp = ir_get_temp();
    char buffer[256];
    sprintf(buffer, "  %%t%d = sdiv %s %s, %s", temp, type, lhs, rhs);
    ir_append_line(buffer);
    return temp;
}

int ir_srem(const char* type, const char* lhs, const char* rhs) {
    int temp = ir_get_temp();
    char buffer[256];
    sprintf(buffer, "  %%t%d = srem %s %s, %s", temp, type, lhs, rhs);
    ir_append_line(buffer);
    return temp;
}

int ir_neg(const char* type, const char* value) {
    int temp = ir_get_temp();
    char buffer[256];
    sprintf(buffer, "  %%t%d = sub %s 0, %s", temp, type, value);
    ir_append_line(buffer);
    return temp;
}

// ============================================
// Comparison Instructions
// ============================================

int ir_icmp(const char* predicate, const char* type, const char* lhs, const char* rhs) {
    int temp = ir_get_temp();
    char buffer[256];
    sprintf(buffer, "  %%t%d = icmp %s %s %s, %s", temp, predicate, type, lhs, rhs);
    ir_append_line(buffer);
    return temp;
}

int ir_icmp_eq(const char* type, const char* lhs, const char* rhs) {
    return ir_icmp("eq", type, lhs, rhs);
}

int ir_icmp_ne(const char* type, const char* lhs, const char* rhs) {
    return ir_icmp("ne", type, lhs, rhs);
}

int ir_icmp_slt(const char* type, const char* lhs, const char* rhs) {
    return ir_icmp("slt", type, lhs, rhs);
}

int ir_icmp_sle(const char* type, const char* lhs, const char* rhs) {
    return ir_icmp("sle", type, lhs, rhs);
}

int ir_icmp_sgt(const char* type, const char* lhs, const char* rhs) {
    return ir_icmp("sgt", type, lhs, rhs);
}

int ir_icmp_sge(const char* type, const char* lhs, const char* rhs) {
    return ir_icmp("sge", type, lhs, rhs);
}

// ============================================
// Control Flow Instructions
// ============================================

void ir_ret(const char* type, const char* value) {
    char buffer[256];
    sprintf(buffer, "  ret %s %s", type, value);
    ir_append_line(buffer);
}

void ir_ret_void() {
    ir_append_line("  ret void");
}

void ir_br(const char* label) {
    char buffer[256];
    sprintf(buffer, "  br label %%%s", label);
    ir_append_line(buffer);
}

void ir_br_numbered(int label_num) {
    char buffer[256];
    sprintf(buffer, "  br label %%label_%d", label_num);
    ir_append_line(buffer);
}

void ir_cond_br(const char* condition, const char* true_label, const char* false_label) {
    char buffer[256];
    sprintf(buffer, "  br i1 %s, label %%%s, label %%%s", condition, true_label, false_label);
    ir_append_line(buffer);
}

void ir_cond_br_numbered(const char* condition, int true_label, int false_label) {
    char buffer[256];
    sprintf(buffer, "  br i1 %s, label %%label_%d, label %%label_%d",
            condition, true_label, false_label);
    ir_append_line(buffer);
}

// ============================================
// Call Instructions
// ============================================

int ir_call_void(const char* function_name, const char** arg_types,
                 const char** arg_values, int arg_count) {
    char buffer[512];
    sprintf(buffer, "  call void @%s(", function_name);
    ir_append(buffer);

    for (int i = 0; i < arg_count; i++) {
        if (i > 0) ir_append(", ");
        ir_append(arg_types[i]);
        ir_append(" ");
        ir_append(arg_values[i]);
    }

    ir_append_line(")");
    return -1;  // void call has no return value
}

int ir_call(const char* return_type, const char* function_name,
            const char** arg_types, const char** arg_values, int arg_count) {
    int temp = ir_get_temp();
    char buffer[512];
    sprintf(buffer, "  %%t%d = call %s @%s(", temp, return_type, function_name);
    ir_append(buffer);

    for (int i = 0; i < arg_count; i++) {
        if (i > 0) ir_append(", ");
        ir_append(arg_types[i]);
        ir_append(" ");
        ir_append(arg_values[i]);
    }

    ir_append_line(")");
    return temp;
}

// ============================================
// Type Conversion Instructions
// ============================================

int ir_zext(const char* from_type, const char* value, const char* to_type) {
    int temp = ir_get_temp();
    char buffer[256];
    sprintf(buffer, "  %%t%d = zext %s %s to %s", temp, from_type, value, to_type);
    ir_append_line(buffer);
    return temp;
}

int ir_sext(const char* from_type, const char* value, const char* to_type) {
    int temp = ir_get_temp();
    char buffer[256];
    sprintf(buffer, "  %%t%d = sext %s %s to %s", temp, from_type, value, to_type);
    ir_append_line(buffer);
    return temp;
}

int ir_trunc(const char* from_type, const char* value, const char* to_type) {
    int temp = ir_get_temp();
    char buffer[256];
    sprintf(buffer, "  %%t%d = trunc %s %s to %s", temp, from_type, value, to_type);
    ir_append_line(buffer);
    return temp;
}

int ir_bitcast(const char* from_type, const char* value, const char* to_type) {
    int temp = ir_get_temp();
    char buffer[256];
    sprintf(buffer, "  %%t%d = bitcast %s %s to %s", temp, from_type, value, to_type);
    ir_append_line(buffer);
    return temp;
}

// ============================================
// Global Variables
// ============================================

void ir_global_string(const char* name, const char* str_content) {
    int len = strlen(str_content);
    char buffer[512];

    // Escape special characters in string
    sprintf(buffer, "@%s = private unnamed_addr constant [%d x i8] c\"%s\\00\"",
            name, len + 1, str_content);
    ir_append_line(buffer);
}

void ir_global_var(const char* name, const char* type, const char* init_value, int is_const) {
    char buffer[256];
    sprintf(buffer, "@%s = %s global %s %s",
            name,
            is_const ? "constant" : "",
            type,
            init_value);
    ir_append_line(buffer);
}

// ============================================
// Helper Functions for String Building
// ============================================

void ir_build_temp_name(int temp_num, char* out_buffer) {
    sprintf(out_buffer, "%%t%d", temp_num);
}

void ir_build_label_name(int label_num, char* out_buffer) {
    sprintf(out_buffer, "label_%d", label_num);
}

// ============================================
// High-level Helper Functions
// ============================================

void ir_comment(const char* comment) {
    ir_append("; ");
    ir_append_line(comment);
}

void ir_blank_line() {
    ir_append_line("");
}

// Print current IR buffer to stdout
void ir_print() {
    printf("%s", ir_buffer);
}

// Write IR to file and close
int ir_write_file(const char* filename) {
    ir_open_file(filename);
    if (!output_file) return 1;

    ir_write_to_file();
    ir_close_file();
    return 0;
}

// ============================================
// Example: Generate a simple function
// ============================================

void ir_example_generate_add_function() {
    ir_module_start("example");

    // Function: i32 @add(i32 %a, i32 %b)
    const char* param_types[] = {"i32", "i32"};
    const char* param_names[] = {"a", "b"};

    ir_function_start("add", "i32", param_types, param_names, 2);
    ir_label("entry");

    int result = ir_add("i32", "%a", "%b");

    char ret_value[32];
    sprintf(ret_value, "%%t%d", result);
    ir_ret("i32", ret_value);

    ir_function_end();
}