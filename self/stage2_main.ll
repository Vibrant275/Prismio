; ModuleID = 'self_hosted_module'
source_filename = "prismio_generated"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc"

%Token = type { i32, ptr, i32, ptr }
%Lexer = type { ptr, i32, i32, i32 }
%ASTNode = type { i32, ptr, ptr, i32, i32, ptr, ptr, ptr, ptr }
%Parser = type { ptr }

declare ptr @malloc(i64)
declare void @println(ptr)
declare void @print(ptr)
declare void @println_int(i32)
declare void @print_int(i32)
declare void @println_bool(i32)
declare void @print_bool(i32)
declare void @println_char(i8)
declare void @print_char(i8)

@.str.s0 = private unnamed_addr constant [7 x i8] c"STRING\00"
@.str.s1 = private unnamed_addr constant [5 x i8] c"CHAR\00"
@.str.s2 = private unnamed_addr constant [7 x i8] c"NUMBER\00"
@.str.s3 = private unnamed_addr constant [5 x i8] c"BOOL\00"
@.str.s4 = private unnamed_addr constant [11 x i8] c"IDENTIFIER\00"
@.str.s5 = private unnamed_addr constant [8 x i8] c"KEYWORD\00"
@.str.s6 = private unnamed_addr constant [10 x i8] c"SEPARATOR\00"
@.str.s7 = private unnamed_addr constant [9 x i8] c"OPERATOR\00"
@.str.s8 = private unnamed_addr constant [7 x i8] c"REL_OP\00"
@.str.s9 = private unnamed_addr constant [10 x i8] c"ASSIGN_OP\00"
@.str.s10 = private unnamed_addr constant [6 x i8] c"ARROW\00"
@.str.s11 = private unnamed_addr constant [4 x i8] c"EOF\00"
@.str.s12 = private unnamed_addr constant [6 x i8] c"TOKEN\00"
declare i32 @str_equals(ptr, ptr)
declare i32 @str_length(ptr)
declare ptr @str_concat(ptr, ptr)
declare ptr @str_substring(ptr, i32, i32)
declare i8 @str_char_at(ptr, i32)
declare i32 @str_contains(ptr, ptr)
declare i32 @str_starts_with(ptr, ptr)
declare i32 @str_index_of(ptr, ptr)
declare ptr @int_to_str(i32)
declare i32 @str_to_int(ptr)
@.str.s13 = private unnamed_addr constant [7 x i8] c"import\00"
@.str.s14 = private unnamed_addr constant [6 x i8] c"match\00"
@.str.s15 = private unnamed_addr constant [3 x i8] c"if\00"
@.str.s16 = private unnamed_addr constant [5 x i8] c"else\00"
@.str.s17 = private unnamed_addr constant [4 x i8] c"and\00"
@.str.s18 = private unnamed_addr constant [3 x i8] c"or\00"
@.str.s19 = private unnamed_addr constant [5 x i8] c"true\00"
@.str.s20 = private unnamed_addr constant [6 x i8] c"false\00"
@.str.s21 = private unnamed_addr constant [6 x i8] c"break\00"
@.str.s22 = private unnamed_addr constant [9 x i8] c"continue\00"
@.str.s23 = private unnamed_addr constant [7 x i8] c"return\00"
@.str.s24 = private unnamed_addr constant [6 x i8] c"throw\00"
@.str.s25 = private unnamed_addr constant [6 x i8] c"while\00"
@.str.s26 = private unnamed_addr constant [5 x i8] c"loop\00"
@.str.s27 = private unnamed_addr constant [4 x i8] c"for\00"
@.str.s28 = private unnamed_addr constant [3 x i8] c"in\00"
@.str.s29 = private unnamed_addr constant [4 x i8] c"let\00"
@.str.s30 = private unnamed_addr constant [7 x i8] c"struct\00"
@.str.s31 = private unnamed_addr constant [5 x i8] c"impl\00"
@.str.s32 = private unnamed_addr constant [5 x i8] c"enum\00"
@.str.s33 = private unnamed_addr constant [6 x i8] c"trait\00"
@.str.s34 = private unnamed_addr constant [3 x i8] c"fn\00"
@.str.s35 = private unnamed_addr constant [7 x i8] c"extern\00"
@.str.s36 = private unnamed_addr constant [4 x i8] c"mut\00"
@.str.s37 = private unnamed_addr constant [5 x i8] c"true\00"
@.str.s38 = private unnamed_addr constant [6 x i8] c"false\00"
@.str.s39 = private unnamed_addr constant [4 x i8] c"EOF\00"
@.str.s40 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s41 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s42 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s43 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s44 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s45 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s46 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s47 = private unnamed_addr constant [3 x i8] c"==\00"
@.str.s48 = private unnamed_addr constant [3 x i8] c"!=\00"
@.str.s49 = private unnamed_addr constant [3 x i8] c"<=\00"
@.str.s50 = private unnamed_addr constant [3 x i8] c">=\00"
@.str.s51 = private unnamed_addr constant [3 x i8] c"->\00"
@.str.s52 = private unnamed_addr constant [3 x i8] c"=>\00"
@.str.s53 = private unnamed_addr constant [3 x i8] c"=>\00"
@.str.s54 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s55 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s56 = private unnamed_addr constant [2 x i8] c"?\00"
@.str.s57 = private unnamed_addr constant [1 x i8] c"\00"
declare ptr @ptr_to_token(ptr)
declare ptr @token_to_ptr(ptr)
declare ptr @ptr_to_node(ptr)
declare ptr @node_to_ptr(ptr)
@.str.s58 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s59 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s60 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s61 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s62 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s63 = private unnamed_addr constant [1 x i8] c"\00"
declare void @exit(i32)
@.str.s64 = private unnamed_addr constant [10 x i8] c"Error in \00"
@.str.s65 = private unnamed_addr constant [23 x i8] c": Expected token type \00"
@.str.s66 = private unnamed_addr constant [10 x i8] c"Error in \00"
@.str.s67 = private unnamed_addr constant [19 x i8] c": Expected token '\00"
@.str.s68 = private unnamed_addr constant [2 x i8] c"'\00"
@.str.s69 = private unnamed_addr constant [7 x i8] c"import\00"
@.str.s70 = private unnamed_addr constant [17 x i8] c"import statement\00"
@.str.s71 = private unnamed_addr constant [21 x i8] c"Expected module name\00"
@.str.s72 = private unnamed_addr constant [7 x i8] c"import\00"
@.str.s73 = private unnamed_addr constant [4 x i8] c"let\00"
@.str.s74 = private unnamed_addr constant [7 x i8] c"extern\00"
@.str.s75 = private unnamed_addr constant [3 x i8] c"fn\00"
@.str.s76 = private unnamed_addr constant [7 x i8] c"struct\00"
@.str.s77 = private unnamed_addr constant [5 x i8] c"enum\00"
@.str.s78 = private unnamed_addr constant [20 x i8] c"Unknown declaration\00"
@.str.s79 = private unnamed_addr constant [2 x i8] c"[\00"
@.str.s80 = private unnamed_addr constant [2 x i8] c"]\00"
@.str.s81 = private unnamed_addr constant [11 x i8] c"array type\00"
@.str.s82 = private unnamed_addr constant [19 x i8] c"Expected type name\00"
@.str.s83 = private unnamed_addr constant [4 x i8] c"let\00"
@.str.s84 = private unnamed_addr constant [21 x i8] c"variable declaration\00"
@.str.s85 = private unnamed_addr constant [4 x i8] c"mut\00"
@.str.s86 = private unnamed_addr constant [14 x i8] c"variable name\00"
@.str.s87 = private unnamed_addr constant [2 x i8] c":\00"
@.str.s88 = private unnamed_addr constant [2 x i8] c"=\00"
@.str.s89 = private unnamed_addr constant [7 x i8] c"extern\00"
@.str.s90 = private unnamed_addr constant [10 x i8] c"extern fn\00"
@.str.s91 = private unnamed_addr constant [3 x i8] c"fn\00"
@.str.s92 = private unnamed_addr constant [10 x i8] c"extern fn\00"
@.str.s93 = private unnamed_addr constant [14 x i8] c"function name\00"
@.str.s94 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.s95 = private unnamed_addr constant [7 x i8] c"params\00"
@.str.s96 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s97 = private unnamed_addr constant [2 x i8] c")\00"
@.str.s98 = private unnamed_addr constant [15 x i8] c"parameter name\00"
@.str.s99 = private unnamed_addr constant [2 x i8] c":\00"
@.str.s100 = private unnamed_addr constant [15 x i8] c"parameter type\00"
@.str.s101 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s102 = private unnamed_addr constant [2 x i8] c",\00"
@.str.s103 = private unnamed_addr constant [2 x i8] c")\00"
@.str.s104 = private unnamed_addr constant [7 x i8] c"params\00"
@.str.s105 = private unnamed_addr constant [3 x i8] c"->\00"
@.str.s106 = private unnamed_addr constant [3 x i8] c"fn\00"
@.str.s107 = private unnamed_addr constant [9 x i8] c"function\00"
@.str.s108 = private unnamed_addr constant [14 x i8] c"function name\00"
@.str.s109 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.s110 = private unnamed_addr constant [7 x i8] c"params\00"
@.str.s111 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s112 = private unnamed_addr constant [2 x i8] c")\00"
@.str.s113 = private unnamed_addr constant [15 x i8] c"parameter name\00"
@.str.s114 = private unnamed_addr constant [2 x i8] c":\00"
@.str.s115 = private unnamed_addr constant [15 x i8] c"parameter type\00"
@.str.s116 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s117 = private unnamed_addr constant [2 x i8] c",\00"
@.str.s118 = private unnamed_addr constant [2 x i8] c")\00"
@.str.s119 = private unnamed_addr constant [7 x i8] c"params\00"
@.str.s120 = private unnamed_addr constant [3 x i8] c"->\00"
@.str.s121 = private unnamed_addr constant [7 x i8] c"struct\00"
@.str.s122 = private unnamed_addr constant [7 x i8] c"struct\00"
@.str.s123 = private unnamed_addr constant [12 x i8] c"struct name\00"
@.str.s124 = private unnamed_addr constant [2 x i8] c"{\00"
@.str.s125 = private unnamed_addr constant [12 x i8] c"struct body\00"
@.str.s126 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s127 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.s128 = private unnamed_addr constant [11 x i8] c"field name\00"
@.str.s129 = private unnamed_addr constant [2 x i8] c":\00"
@.str.s130 = private unnamed_addr constant [11 x i8] c"field type\00"
@.str.s131 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s132 = private unnamed_addr constant [2 x i8] c",\00"
@.str.s133 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.s134 = private unnamed_addr constant [12 x i8] c"struct body\00"
@.str.s135 = private unnamed_addr constant [5 x i8] c"enum\00"
@.str.s136 = private unnamed_addr constant [5 x i8] c"enum\00"
@.str.s137 = private unnamed_addr constant [10 x i8] c"enum name\00"
@.str.s138 = private unnamed_addr constant [2 x i8] c"{\00"
@.str.s139 = private unnamed_addr constant [10 x i8] c"enum body\00"
@.str.s140 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s141 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.s142 = private unnamed_addr constant [13 x i8] c"variant name\00"
@.str.s143 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s144 = private unnamed_addr constant [2 x i8] c",\00"
@.str.s145 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.s146 = private unnamed_addr constant [10 x i8] c"enum body\00"
@.str.s147 = private unnamed_addr constant [2 x i8] c"{\00"
@.str.s148 = private unnamed_addr constant [6 x i8] c"block\00"
@.str.s149 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s150 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.s151 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s152 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.s153 = private unnamed_addr constant [6 x i8] c"block\00"
@.str.s154 = private unnamed_addr constant [3 x i8] c"if\00"
@.str.s155 = private unnamed_addr constant [13 x i8] c"if statement\00"
@.str.s156 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.s157 = private unnamed_addr constant [13 x i8] c"if condition\00"
@.str.s158 = private unnamed_addr constant [2 x i8] c")\00"
@.str.s159 = private unnamed_addr constant [13 x i8] c"if condition\00"
@.str.s160 = private unnamed_addr constant [5 x i8] c"else\00"
@.str.s161 = private unnamed_addr constant [3 x i8] c"if\00"
@.str.s162 = private unnamed_addr constant [6 x i8] c"while\00"
@.str.s163 = private unnamed_addr constant [16 x i8] c"while statement\00"
@.str.s164 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.s165 = private unnamed_addr constant [16 x i8] c"while condition\00"
@.str.s166 = private unnamed_addr constant [2 x i8] c")\00"
@.str.s167 = private unnamed_addr constant [16 x i8] c"while condition\00"
@.str.s168 = private unnamed_addr constant [3 x i8] c"if\00"
@.str.s169 = private unnamed_addr constant [6 x i8] c"while\00"
@.str.s170 = private unnamed_addr constant [7 x i8] c"return\00"
@.str.s171 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.s172 = private unnamed_addr constant [4 x i8] c"let\00"
@.str.s173 = private unnamed_addr constant [2 x i8] c"=\00"
@.str.s174 = private unnamed_addr constant [3 x i8] c"or\00"
@.str.s175 = private unnamed_addr constant [4 x i8] c"and\00"
@.str.s176 = private unnamed_addr constant [3 x i8] c"==\00"
@.str.s177 = private unnamed_addr constant [3 x i8] c"!=\00"
@.str.s178 = private unnamed_addr constant [2 x i8] c"<\00"
@.str.s179 = private unnamed_addr constant [2 x i8] c">\00"
@.str.s180 = private unnamed_addr constant [3 x i8] c"<=\00"
@.str.s181 = private unnamed_addr constant [3 x i8] c">=\00"
@.str.s182 = private unnamed_addr constant [2 x i8] c"+\00"
@.str.s183 = private unnamed_addr constant [2 x i8] c"-\00"
@.str.s184 = private unnamed_addr constant [2 x i8] c"*\00"
@.str.s185 = private unnamed_addr constant [2 x i8] c"/\00"
@.str.s186 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.s187 = private unnamed_addr constant [4 x i8] c"and\00"
@.str.s188 = private unnamed_addr constant [3 x i8] c"or\00"
@.str.s189 = private unnamed_addr constant [2 x i8] c"{\00"
@.str.s190 = private unnamed_addr constant [2 x i8] c"{\00"
@.str.s191 = private unnamed_addr constant [15 x i8] c"struct literal\00"
@.str.s192 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s193 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.s194 = private unnamed_addr constant [21 x i8] c"struct literal field\00"
@.str.s195 = private unnamed_addr constant [2 x i8] c":\00"
@.str.s196 = private unnamed_addr constant [15 x i8] c"struct literal\00"
@.str.s197 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s198 = private unnamed_addr constant [2 x i8] c",\00"
@.str.s199 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.s200 = private unnamed_addr constant [15 x i8] c"struct literal\00"
@.str.s201 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.s202 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s203 = private unnamed_addr constant [2 x i8] c")\00"
@.str.s204 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s205 = private unnamed_addr constant [2 x i8] c",\00"
@.str.s206 = private unnamed_addr constant [2 x i8] c")\00"
@.str.s207 = private unnamed_addr constant [14 x i8] c"function call\00"
@.str.s208 = private unnamed_addr constant [2 x i8] c"[\00"
@.str.s209 = private unnamed_addr constant [2 x i8] c"]\00"
@.str.s210 = private unnamed_addr constant [12 x i8] c"array index\00"
@.str.s211 = private unnamed_addr constant [2 x i8] c".\00"
@.str.s212 = private unnamed_addr constant [12 x i8] c"member name\00"
@.str.s213 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.s214 = private unnamed_addr constant [2 x i8] c")\00"
@.str.s215 = private unnamed_addr constant [25 x i8] c"parenthesized expression\00"
@.str.s216 = private unnamed_addr constant [2 x i8] c"[\00"
@.str.s217 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s218 = private unnamed_addr constant [2 x i8] c"]\00"
@.str.s219 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s220 = private unnamed_addr constant [2 x i8] c",\00"
@.str.s221 = private unnamed_addr constant [2 x i8] c"]\00"
@.str.s222 = private unnamed_addr constant [14 x i8] c"array literal\00"
@.str.s223 = private unnamed_addr constant [33 x i8] c"Unexpected token in expression: \00"
@.str.s224 = private unnamed_addr constant [3 x i8] c" '\00"
@.str.s225 = private unnamed_addr constant [2 x i8] c"'\00"
@.str.s226 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s227 = private unnamed_addr constant [1 x i8] c"\00"
declare void @ir_reset()
declare void @ir_print()
declare i32 @ir_write_file(ptr)
declare void @ir_append(ptr)
declare void @ir_append_line(ptr)
declare i32 @ir_get_temp()
declare void @ir_module_start(ptr)
declare void @ir_module_end()
declare ptr @ir_type_void()
declare ptr @ir_type_i1()
declare ptr @ir_type_i8()
declare ptr @ir_type_i32()
declare ptr @ir_type_i64()
declare ptr @ir_type_i8_ptr()
declare void @ir_declare_function_begin(ptr, ptr)
declare void @ir_declare_function_param(ptr)
declare void @ir_declare_function_end()
declare void @ir_function_begin(ptr, ptr)
declare void @ir_function_param(ptr, ptr)
declare void @ir_function_body_start()
declare void @ir_function_end()
declare void @ir_call_begin()
declare void @ir_call_arg(ptr, ptr)
declare i32 @ir_call_end(ptr, ptr)
declare i32 @ir_get_label()
declare void @ir_label(ptr)
declare void @ir_label_numbered(i32)
declare i32 @ir_alloca(ptr, ptr)
declare i32 @ir_load(ptr, ptr)
declare void @ir_store(ptr, ptr, ptr)
declare i32 @ir_load_global(ptr, ptr)
declare void @ir_store_global(ptr, ptr, ptr)
declare i32 @ir_add(ptr, ptr, ptr)
declare i32 @ir_sub(ptr, ptr, ptr)
declare i32 @ir_mul(ptr, ptr, ptr)
declare i32 @ir_sdiv(ptr, ptr, ptr)
declare i32 @ir_srem(ptr, ptr, ptr)
declare i32 @ir_neg(ptr, ptr)
declare i32 @ir_and(ptr, ptr, ptr)
declare i32 @ir_or(ptr, ptr, ptr)
declare i32 @ir_icmp_eq(ptr, ptr, ptr)
declare i32 @ir_icmp_ne(ptr, ptr, ptr)
declare i32 @ir_icmp_slt(ptr, ptr, ptr)
declare i32 @ir_icmp_sle(ptr, ptr, ptr)
declare i32 @ir_icmp_sgt(ptr, ptr, ptr)
declare i32 @ir_icmp_sge(ptr, ptr, ptr)
declare void @ir_ret(ptr, ptr)
declare void @ir_ret_void()
declare void @ir_br(ptr)
declare void @ir_br_numbered(i32)
declare void @ir_cond_br(ptr, ptr, ptr)
declare void @ir_cond_br_numbered(ptr, i32, i32)
declare void @ir_global_string(ptr, ptr)
declare void @ir_global_var(ptr, ptr, ptr, i32)
declare ptr @ir_get_temp_name(i32)
declare ptr @ir_get_label_name(i32)
declare void @ir_register_global_name(ptr)
declare i32 @ir_is_global_name(ptr)
declare void @ir_reset_globals()
declare void @ir_reset_types()
declare void @ir_register_struct(ptr)
declare void @ir_register_struct_field(ptr, ptr, ptr)
declare i32 @ir_is_struct_type_name(ptr)
declare i32 @ir_get_struct_field_index(ptr, ptr)
declare ptr @ir_get_struct_field_type(ptr, ptr)
declare void @ir_register_enum_variant(ptr, ptr, i32)
declare i32 @ir_get_enum_variant(ptr, ptr)
declare void @ir_set_var_type(ptr, ptr)
declare ptr @ir_get_var_type(ptr)
declare void @ir_clear_var_types()
declare void @ir_clear_local_var_types()
declare void @ir_set_returned()
declare i32 @ir_has_returned()
declare void @ir_clear_returned()
declare void @ir_comment(ptr)
declare void @ir_blank_line()
@ir_string_counter =  global i32 0
@.str.s228 = private unnamed_addr constant [4 x i8] c"Int\00"
@.str.s229 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s230 = private unnamed_addr constant [5 x i8] c"Bool\00"
@.str.s231 = private unnamed_addr constant [3 x i8] c"i1\00"
@.str.s232 = private unnamed_addr constant [7 x i8] c"String\00"
@.str.s233 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.s234 = private unnamed_addr constant [5 x i8] c"Char\00"
@.str.s235 = private unnamed_addr constant [3 x i8] c"i8\00"
@.str.s236 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s237 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s238 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s239 = private unnamed_addr constant [8 x i8] c"struct:\00"
@.str.s240 = private unnamed_addr constant [8 x i8] c"struct:\00"
@.str.s241 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.s242 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s243 = private unnamed_addr constant [7 x i8] c"ptrptr\00"
@.str.s244 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.s245 = private unnamed_addr constant [7 x i8] c"ptrptr\00"
@.str.s246 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.s247 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.s248 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s249 = private unnamed_addr constant [5 x i8] c"$fn$\00"
@.str.s250 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s251 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s252 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s253 = private unnamed_addr constant [3 x i8] c"i1\00"
@.str.s254 = private unnamed_addr constant [3 x i8] c"i8\00"
@.str.s255 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.s256 = private unnamed_addr constant [3 x i8] c"==\00"
@.str.s257 = private unnamed_addr constant [3 x i8] c"!=\00"
@.str.s258 = private unnamed_addr constant [3 x i8] c"i1\00"
@.str.s259 = private unnamed_addr constant [2 x i8] c"<\00"
@.str.s260 = private unnamed_addr constant [3 x i8] c"<=\00"
@.str.s261 = private unnamed_addr constant [3 x i8] c"i1\00"
@.str.s262 = private unnamed_addr constant [2 x i8] c">\00"
@.str.s263 = private unnamed_addr constant [3 x i8] c">=\00"
@.str.s264 = private unnamed_addr constant [3 x i8] c"i1\00"
@.str.s265 = private unnamed_addr constant [4 x i8] c"and\00"
@.str.s266 = private unnamed_addr constant [3 x i8] c"or\00"
@.str.s267 = private unnamed_addr constant [3 x i8] c"i1\00"
@.str.s268 = private unnamed_addr constant [6 x i8] c"print\00"
@.str.s269 = private unnamed_addr constant [8 x i8] c"println\00"
@.str.s270 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s271 = private unnamed_addr constant [10 x i8] c"print_int\00"
@.str.s272 = private unnamed_addr constant [12 x i8] c"println_int\00"
@.str.s273 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s274 = private unnamed_addr constant [13 x i8] c"println_char\00"
@.str.s275 = private unnamed_addr constant [11 x i8] c"print_char\00"
@.str.s276 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s277 = private unnamed_addr constant [13 x i8] c"println_bool\00"
@.str.s278 = private unnamed_addr constant [11 x i8] c"print_bool\00"
@.str.s279 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s280 = private unnamed_addr constant [7 x i8] c"ptrptr\00"
@.str.s281 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.s282 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s283 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s284 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s285 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.s286 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s287 = private unnamed_addr constant [5 x i8] c"true\00"
@.str.s288 = private unnamed_addr constant [2 x i8] c"1\00"
@.str.s289 = private unnamed_addr constant [2 x i8] c"0\00"
@.str.s290 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.s291 = private unnamed_addr constant [28 x i8] c" = getelementptr inbounds [\00"
@.str.s292 = private unnamed_addr constant [14 x i8] c" x i8], ptr @\00"
@.str.s293 = private unnamed_addr constant [15 x i8] c", i64 0, i64 0\00"
@.str.s294 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.s295 = private unnamed_addr constant [18 x i8] c" = getelementptr \00"
@.str.s296 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.s297 = private unnamed_addr constant [18 x i8] c", ptr null, i32 1\00"
@.str.s298 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.s299 = private unnamed_addr constant [17 x i8] c" = ptrtoint ptr \00"
@.str.s300 = private unnamed_addr constant [8 x i8] c" to i64\00"
@.str.s301 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.s302 = private unnamed_addr constant [25 x i8] c" = call ptr @malloc(i64 \00"
@.str.s303 = private unnamed_addr constant [2 x i8] c")\00"
@.str.s304 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s305 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.s306 = private unnamed_addr constant [27 x i8] c" = getelementptr inbounds \00"
@.str.s307 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.s308 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.s309 = private unnamed_addr constant [14 x i8] c", i32 0, i32 \00"
@.str.s310 = private unnamed_addr constant [9 x i8] c"  store \00"
@.str.s311 = private unnamed_addr constant [2 x i8] c" \00"
@.str.s312 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.s313 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.s314 = private unnamed_addr constant [27 x i8] c" = getelementptr inbounds \00"
@.str.s315 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.s316 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.s317 = private unnamed_addr constant [14 x i8] c", i32 0, i32 \00"
@.str.s318 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.s319 = private unnamed_addr constant [9 x i8] c" = load \00"
@.str.s320 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.s321 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.s322 = private unnamed_addr constant [12 x i8] c" = alloca [\00"
@.str.s323 = private unnamed_addr constant [8 x i8] c" x ptr]\00"
@.str.s324 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s325 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.s326 = private unnamed_addr constant [28 x i8] c" = getelementptr inbounds [\00"
@.str.s327 = private unnamed_addr constant [14 x i8] c" x ptr], ptr \00"
@.str.s328 = private unnamed_addr constant [14 x i8] c", i64 0, i64 \00"
@.str.s329 = private unnamed_addr constant [13 x i8] c"  store ptr \00"
@.str.s330 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.s331 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.s332 = private unnamed_addr constant [28 x i8] c" = getelementptr inbounds [\00"
@.str.s333 = private unnamed_addr constant [14 x i8] c" x ptr], ptr \00"
@.str.s334 = private unnamed_addr constant [15 x i8] c", i64 0, i64 0\00"
@.str.s335 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.s336 = private unnamed_addr constant [12 x i8] c" = alloca [\00"
@.str.s337 = private unnamed_addr constant [8 x i8] c" x i32]\00"
@.str.s338 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s339 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.s340 = private unnamed_addr constant [28 x i8] c" = getelementptr inbounds [\00"
@.str.s341 = private unnamed_addr constant [14 x i8] c" x i32], ptr \00"
@.str.s342 = private unnamed_addr constant [14 x i8] c", i64 0, i64 \00"
@.str.s343 = private unnamed_addr constant [13 x i8] c"  store i32 \00"
@.str.s344 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.s345 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.s346 = private unnamed_addr constant [28 x i8] c" = getelementptr inbounds [\00"
@.str.s347 = private unnamed_addr constant [14 x i8] c" x i32], ptr \00"
@.str.s348 = private unnamed_addr constant [15 x i8] c", i64 0, i64 0\00"
@.str.s349 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s350 = private unnamed_addr constant [7 x i8] c"ptrptr\00"
@.str.s351 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.s352 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.s353 = private unnamed_addr constant [27 x i8] c" = getelementptr inbounds \00"
@.str.s354 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.s355 = private unnamed_addr constant [7 x i8] c", i32 \00"
@.str.s356 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.s357 = private unnamed_addr constant [9 x i8] c" = load \00"
@.str.s358 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.s359 = private unnamed_addr constant [2 x i8] c"+\00"
@.str.s360 = private unnamed_addr constant [2 x i8] c"-\00"
@.str.s361 = private unnamed_addr constant [2 x i8] c"*\00"
@.str.s362 = private unnamed_addr constant [2 x i8] c"/\00"
@.str.s363 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.s364 = private unnamed_addr constant [3 x i8] c"==\00"
@.str.s365 = private unnamed_addr constant [3 x i8] c"!=\00"
@.str.s366 = private unnamed_addr constant [2 x i8] c"<\00"
@.str.s367 = private unnamed_addr constant [3 x i8] c"<=\00"
@.str.s368 = private unnamed_addr constant [2 x i8] c">\00"
@.str.s369 = private unnamed_addr constant [3 x i8] c">=\00"
@.str.s370 = private unnamed_addr constant [4 x i8] c"and\00"
@.str.s371 = private unnamed_addr constant [3 x i8] c"i1\00"
@.str.s372 = private unnamed_addr constant [3 x i8] c"or\00"
@.str.s373 = private unnamed_addr constant [3 x i8] c"i1\00"
@.str.s374 = private unnamed_addr constant [6 x i8] c"print\00"
@.str.s375 = private unnamed_addr constant [8 x i8] c"println\00"
@.str.s376 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s377 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.s378 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.s379 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s380 = private unnamed_addr constant [6 x i8] c"print\00"
@.str.s381 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s382 = private unnamed_addr constant [8 x i8] c"println\00"
@.str.s383 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s384 = private unnamed_addr constant [10 x i8] c"print_int\00"
@.str.s385 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s386 = private unnamed_addr constant [12 x i8] c"println_int\00"
@.str.s387 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s388 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s389 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s390 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s391 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s392 = private unnamed_addr constant [2 x i8] c"0\00"
@.str.s393 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s394 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s395 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s396 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s397 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.s398 = private unnamed_addr constant [27 x i8] c" = getelementptr inbounds \00"
@.str.s399 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.s400 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.s401 = private unnamed_addr constant [14 x i8] c", i32 0, i32 \00"
@.str.s402 = private unnamed_addr constant [9 x i8] c"  store \00"
@.str.s403 = private unnamed_addr constant [2 x i8] c" \00"
@.str.s404 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.s405 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s406 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s407 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s408 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s409 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s410 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s411 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s412 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s413 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s414 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s415 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s416 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s417 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s418 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s419 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s420 = private unnamed_addr constant [5 x i8] c"main\00"
@.str.s421 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s422 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s423 = private unnamed_addr constant [3 x i8] c"p_\00"
@.str.s424 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s425 = private unnamed_addr constant [4 x i8] c"%p_\00"
@.str.s426 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s427 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s428 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s429 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s430 = private unnamed_addr constant [2 x i8] c"0\00"
@.str.s431 = private unnamed_addr constant [2 x i8] c"0\00"
@.str.s432 = private unnamed_addr constant [7 x i8] c".str.s\00"
@.str.s433 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s434 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s435 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s436 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s437 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s438 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s439 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s440 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s441 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s442 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s443 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s444 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s445 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s446 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.s447 = private unnamed_addr constant [11 x i8] c" = type { \00"
@.str.s448 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s449 = private unnamed_addr constant [3 x i8] c", \00"
@.str.s450 = private unnamed_addr constant [3 x i8] c" }\00"
@.str.s451 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s452 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s453 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s454 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s455 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s456 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s457 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s458 = private unnamed_addr constant [19 x i8] c"self_hosted_module\00"
@.str.s459 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s460 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s461 = private unnamed_addr constant [7 x i8] c"malloc\00"
@.str.s462 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.s463 = private unnamed_addr constant [4 x i8] c"i64\00"
@.str.s464 = private unnamed_addr constant [8 x i8] c"println\00"
@.str.s465 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s466 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.s467 = private unnamed_addr constant [6 x i8] c"print\00"
@.str.s468 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s469 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.s470 = private unnamed_addr constant [12 x i8] c"println_int\00"
@.str.s471 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s472 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s473 = private unnamed_addr constant [10 x i8] c"print_int\00"
@.str.s474 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s475 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s476 = private unnamed_addr constant [13 x i8] c"println_bool\00"
@.str.s477 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s478 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s479 = private unnamed_addr constant [11 x i8] c"print_bool\00"
@.str.s480 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s481 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s482 = private unnamed_addr constant [13 x i8] c"println_char\00"
@.str.s483 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s484 = private unnamed_addr constant [3 x i8] c"i8\00"
@.str.s485 = private unnamed_addr constant [11 x i8] c"print_char\00"
@.str.s486 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.s487 = private unnamed_addr constant [3 x i8] c"i8\00"
@.str.s488 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s489 = private unnamed_addr constant [2 x i8] c"0\00"
@.str.s490 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s491 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s492 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s493 = private unnamed_addr constant [5 x i8] c"main\00"
@.str.s494 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.s495 = private unnamed_addr constant [1 x i8] c"\00"
declare ptr @read_file(ptr)
declare ptr @get_directory(ptr)
declare i32 @cli_arg_count()
declare ptr @cli_arg(i32)
@.str.s496 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s497 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s498 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s499 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s500 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s501 = private unnamed_addr constant [5 x i8] c".psm\00"
@.str.s502 = private unnamed_addr constant [2 x i8] c".\00"
@.str.s503 = private unnamed_addr constant [3 x i8] c"\5C\5C\00"
@.str.s504 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s505 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s506 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s507 = private unnamed_addr constant [25 x i8] c"ERROR: Could not import \00"
@.str.s508 = private unnamed_addr constant [29 x i8] c"=== Self-Hosted Compiler ===\00"
@.str.s509 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s510 = private unnamed_addr constant [7 x i8] c"out.ll\00"
@.str.s511 = private unnamed_addr constant [1 x i8] c"\00"
@.str.s512 = private unnamed_addr constant [27 x i8] c"ERROR: Could not read file\00"
@.str.s513 = private unnamed_addr constant [14 x i8] c"File content:\00"
@.str.s514 = private unnamed_addr constant [20 x i8] c"✓ Lexing complete\00"
@.str.s515 = private unnamed_addr constant [21 x i8] c"✓ Parsing complete\00"
@.str.s516 = private unnamed_addr constant [17 x i8] c"Generating IR...\00"
@.str.s517 = private unnamed_addr constant [19 x i8] c"✓ IR written to \00"
@.str.s518 = private unnamed_addr constant [13 x i8] c"=== Done ===\00"

define ptr @type_to_string(i32 %p_t) {
  %t = alloca i32
  store i32 %p_t, ptr %t
  %t1 = load i32, ptr %t
  %t2 = icmp eq i32 %t1, 0
  br i1 %t2, label %label_0, label %label_2
label_0:
  %t3 = getelementptr inbounds [7 x i8], ptr @.str.s0, i64 0, i64 0
  ret ptr %t3
label_2:
  %t4 = load i32, ptr %t
  %t5 = icmp eq i32 %t4, 1
  br i1 %t5, label %label_3, label %label_5
label_3:
  %t6 = getelementptr inbounds [5 x i8], ptr @.str.s1, i64 0, i64 0
  ret ptr %t6
label_5:
  %t7 = load i32, ptr %t
  %t8 = icmp eq i32 %t7, 2
  br i1 %t8, label %label_6, label %label_8
label_6:
  %t9 = getelementptr inbounds [7 x i8], ptr @.str.s2, i64 0, i64 0
  ret ptr %t9
label_8:
  %t10 = load i32, ptr %t
  %t11 = icmp eq i32 %t10, 3
  br i1 %t11, label %label_9, label %label_11
label_9:
  %t12 = getelementptr inbounds [5 x i8], ptr @.str.s3, i64 0, i64 0
  ret ptr %t12
label_11:
  %t13 = load i32, ptr %t
  %t14 = icmp eq i32 %t13, 4
  br i1 %t14, label %label_12, label %label_14
label_12:
  %t15 = getelementptr inbounds [11 x i8], ptr @.str.s4, i64 0, i64 0
  ret ptr %t15
label_14:
  %t16 = load i32, ptr %t
  %t17 = icmp eq i32 %t16, 16
  br i1 %t17, label %label_15, label %label_17
label_15:
  %t18 = getelementptr inbounds [8 x i8], ptr @.str.s5, i64 0, i64 0
  ret ptr %t18
label_17:
  %t19 = load i32, ptr %t
  %t20 = icmp eq i32 %t19, 5
  br i1 %t20, label %label_18, label %label_20
label_18:
  %t21 = getelementptr inbounds [10 x i8], ptr @.str.s6, i64 0, i64 0
  ret ptr %t21
label_20:
  %t22 = load i32, ptr %t
  %t23 = icmp eq i32 %t22, 7
  br i1 %t23, label %label_21, label %label_23
label_21:
  %t24 = getelementptr inbounds [9 x i8], ptr @.str.s7, i64 0, i64 0
  ret ptr %t24
label_23:
  %t25 = load i32, ptr %t
  %t26 = icmp eq i32 %t25, 8
  br i1 %t26, label %label_24, label %label_26
label_24:
  %t27 = getelementptr inbounds [7 x i8], ptr @.str.s8, i64 0, i64 0
  ret ptr %t27
label_26:
  %t28 = load i32, ptr %t
  %t29 = icmp eq i32 %t28, 11
  br i1 %t29, label %label_27, label %label_29
label_27:
  %t30 = getelementptr inbounds [10 x i8], ptr @.str.s9, i64 0, i64 0
  ret ptr %t30
label_29:
  %t31 = load i32, ptr %t
  %t32 = icmp eq i32 %t31, 14
  br i1 %t32, label %label_30, label %label_32
label_30:
  %t33 = getelementptr inbounds [6 x i8], ptr @.str.s10, i64 0, i64 0
  ret ptr %t33
label_32:
  %t34 = load i32, ptr %t
  %t35 = icmp eq i32 %t34, 18
  br i1 %t35, label %label_33, label %label_35
label_33:
  %t36 = getelementptr inbounds [4 x i8], ptr @.str.s11, i64 0, i64 0
  ret ptr %t36
label_35:
  %t37 = getelementptr inbounds [6 x i8], ptr @.str.s12, i64 0, i64 0
  ret ptr %t37
}

define i1 @is_digit(i8 %p_c) {
  %c = alloca i8
  store i8 %p_c, ptr %c
  %t39 = load i8, ptr %c
  %t40 = icmp sge i8 %t39, 48
  %t41 = load i8, ptr %c
  %t42 = icmp sle i8 %t41, 57
  %t43 = and i1 %t40, %t42
  ret i1 %t43
}

define i1 @is_alpha(i8 %p_c) {
  %c = alloca i8
  store i8 %p_c, ptr %c
  %t45 = load i8, ptr %c
  %t46 = icmp sge i8 %t45, 97
  %t47 = load i8, ptr %c
  %t48 = icmp sle i8 %t47, 122
  %t49 = and i1 %t46, %t48
  %t50 = load i8, ptr %c
  %t51 = icmp sge i8 %t50, 65
  %t52 = load i8, ptr %c
  %t53 = icmp sle i8 %t52, 90
  %t54 = and i1 %t51, %t53
  %t55 = or i1 %t49, %t54
  %t56 = load i8, ptr %c
  %t57 = icmp eq i8 %t56, 95
  %t58 = or i1 %t55, %t57
  ret i1 %t58
}

define i1 @is_alnum(i8 %p_c) {
  %c = alloca i8
  store i8 %p_c, ptr %c
  %t60 = load i8, ptr %c
  %t61 = call i1 @is_alpha(i8 %t60)
  %t62 = load i8, ptr %c
  %t63 = call i1 @is_digit(i8 %t62)
  %t64 = or i1 %t61, %t63
  ret i1 %t64
}

define i1 @is_space(i8 %p_c) {
  %c = alloca i8
  store i8 %p_c, ptr %c
  %t66 = load i8, ptr %c
  %t67 = icmp eq i8 %t66, 32
  %t68 = load i8, ptr %c
  %t69 = icmp eq i8 %t68, 9
  %t70 = or i1 %t67, %t69
  %t71 = load i8, ptr %c
  %t72 = icmp eq i8 %t71, 10
  %t73 = or i1 %t70, %t72
  %t74 = load i8, ptr %c
  %t75 = icmp eq i8 %t74, 13
  %t76 = or i1 %t73, %t75
  ret i1 %t76
}

define i1 @is_separator(i8 %p_c) {
  %c = alloca i8
  store i8 %p_c, ptr %c
  %t78 = load i8, ptr %c
  %t79 = icmp eq i8 %t78, 40
  br i1 %t79, label %label_36, label %label_38
label_36:
  ret i1 1
label_38:
  %t80 = load i8, ptr %c
  %t81 = icmp eq i8 %t80, 41
  br i1 %t81, label %label_39, label %label_41
label_39:
  ret i1 1
label_41:
  %t82 = load i8, ptr %c
  %t83 = icmp eq i8 %t82, 123
  br i1 %t83, label %label_42, label %label_44
label_42:
  ret i1 1
label_44:
  %t84 = load i8, ptr %c
  %t85 = icmp eq i8 %t84, 125
  br i1 %t85, label %label_45, label %label_47
label_45:
  ret i1 1
label_47:
  %t86 = load i8, ptr %c
  %t87 = icmp eq i8 %t86, 91
  br i1 %t87, label %label_48, label %label_50
label_48:
  ret i1 1
label_50:
  %t88 = load i8, ptr %c
  %t89 = icmp eq i8 %t88, 93
  br i1 %t89, label %label_51, label %label_53
label_51:
  ret i1 1
label_53:
  %t90 = load i8, ptr %c
  %t91 = icmp eq i8 %t90, 44
  br i1 %t91, label %label_54, label %label_56
label_54:
  ret i1 1
label_56:
  %t92 = load i8, ptr %c
  %t93 = icmp eq i8 %t92, 46
  br i1 %t93, label %label_57, label %label_59
label_57:
  ret i1 1
label_59:
  %t94 = load i8, ptr %c
  %t95 = icmp eq i8 %t94, 58
  br i1 %t95, label %label_60, label %label_62
label_60:
  ret i1 1
label_62:
  ret i1 0
}

define i1 @is_operator(i8 %p_c) {
  %c = alloca i8
  store i8 %p_c, ptr %c
  %t97 = load i8, ptr %c
  %t98 = icmp eq i8 %t97, 43
  br i1 %t98, label %label_63, label %label_65
label_63:
  ret i1 1
label_65:
  %t99 = load i8, ptr %c
  %t100 = icmp eq i8 %t99, 45
  br i1 %t100, label %label_66, label %label_68
label_66:
  ret i1 1
label_68:
  %t101 = load i8, ptr %c
  %t102 = icmp eq i8 %t101, 42
  br i1 %t102, label %label_69, label %label_71
label_69:
  ret i1 1
label_71:
  %t103 = load i8, ptr %c
  %t104 = icmp eq i8 %t103, 47
  br i1 %t104, label %label_72, label %label_74
label_72:
  ret i1 1
label_74:
  %t105 = load i8, ptr %c
  %t106 = icmp eq i8 %t105, 37
  br i1 %t106, label %label_75, label %label_77
label_75:
  ret i1 1
label_77:
  %t107 = load i8, ptr %c
  %t108 = icmp eq i8 %t107, 60
  br i1 %t108, label %label_78, label %label_80
label_78:
  ret i1 1
label_80:
  %t109 = load i8, ptr %c
  %t110 = icmp eq i8 %t109, 62
  br i1 %t110, label %label_81, label %label_83
label_81:
  ret i1 1
label_83:
  %t111 = load i8, ptr %c
  %t112 = icmp eq i8 %t111, 33
  br i1 %t112, label %label_84, label %label_86
label_84:
  ret i1 1
label_86:
  %t113 = load i8, ptr %c
  %t114 = icmp eq i8 %t113, 38
  br i1 %t114, label %label_87, label %label_89
label_87:
  ret i1 1
label_89:
  %t115 = load i8, ptr %c
  %t116 = icmp eq i8 %t115, 124
  br i1 %t116, label %label_90, label %label_92
label_90:
  ret i1 1
label_92:
  %t117 = load i8, ptr %c
  %t118 = icmp eq i8 %t117, 61
  br i1 %t118, label %label_93, label %label_95
label_93:
  ret i1 1
label_95:
  %t119 = load i8, ptr %c
  %t120 = icmp eq i8 %t119, 95
  br i1 %t120, label %label_96, label %label_98
label_96:
  ret i1 1
label_98:
  ret i1 0
}

define i32 @char_code(i8 %p_c) {
  %c = alloca i8
  store i8 %p_c, ptr %c
  %t122 = load i8, ptr %c
  %t123 = icmp eq i8 %t122, 0
  br i1 %t123, label %label_99, label %label_101
label_99:
  ret i32 0
label_101:
  %t124 = load i8, ptr %c
  %t125 = icmp eq i8 %t124, 9
  br i1 %t125, label %label_102, label %label_104
label_102:
  ret i32 9
label_104:
  %t126 = load i8, ptr %c
  %t127 = icmp eq i8 %t126, 10
  br i1 %t127, label %label_105, label %label_107
label_105:
  ret i32 10
label_107:
  %t128 = load i8, ptr %c
  %t129 = icmp eq i8 %t128, 13
  br i1 %t129, label %label_108, label %label_110
label_108:
  ret i32 13
label_110:
  %t130 = load i8, ptr %c
  %t131 = icmp eq i8 %t130, 32
  br i1 %t131, label %label_111, label %label_113
label_111:
  ret i32 32
label_113:
  %t132 = load i8, ptr %c
  %t133 = icmp eq i8 %t132, 33
  br i1 %t133, label %label_114, label %label_116
label_114:
  ret i32 33
label_116:
  %t134 = load i8, ptr %c
  %t135 = icmp eq i8 %t134, 34
  br i1 %t135, label %label_117, label %label_119
label_117:
  ret i32 34
label_119:
  %t136 = load i8, ptr %c
  %t137 = icmp eq i8 %t136, 37
  br i1 %t137, label %label_120, label %label_122
label_120:
  ret i32 37
label_122:
  %t138 = load i8, ptr %c
  %t139 = icmp eq i8 %t138, 38
  br i1 %t139, label %label_123, label %label_125
label_123:
  ret i32 38
label_125:
  %t140 = load i8, ptr %c
  %t141 = icmp eq i8 %t140, 39
  br i1 %t141, label %label_126, label %label_128
label_126:
  ret i32 39
label_128:
  %t142 = load i8, ptr %c
  %t143 = icmp eq i8 %t142, 40
  br i1 %t143, label %label_129, label %label_131
label_129:
  ret i32 40
label_131:
  %t144 = load i8, ptr %c
  %t145 = icmp eq i8 %t144, 41
  br i1 %t145, label %label_132, label %label_134
label_132:
  ret i32 41
label_134:
  %t146 = load i8, ptr %c
  %t147 = icmp eq i8 %t146, 42
  br i1 %t147, label %label_135, label %label_137
label_135:
  ret i32 42
label_137:
  %t148 = load i8, ptr %c
  %t149 = icmp eq i8 %t148, 43
  br i1 %t149, label %label_138, label %label_140
label_138:
  ret i32 43
label_140:
  %t150 = load i8, ptr %c
  %t151 = icmp eq i8 %t150, 44
  br i1 %t151, label %label_141, label %label_143
label_141:
  ret i32 44
label_143:
  %t152 = load i8, ptr %c
  %t153 = icmp eq i8 %t152, 45
  br i1 %t153, label %label_144, label %label_146
label_144:
  ret i32 45
label_146:
  %t154 = load i8, ptr %c
  %t155 = icmp eq i8 %t154, 46
  br i1 %t155, label %label_147, label %label_149
label_147:
  ret i32 46
label_149:
  %t156 = load i8, ptr %c
  %t157 = icmp eq i8 %t156, 47
  br i1 %t157, label %label_150, label %label_152
label_150:
  ret i32 47
label_152:
  %t158 = load i8, ptr %c
  %t159 = icmp eq i8 %t158, 48
  br i1 %t159, label %label_153, label %label_155
label_153:
  ret i32 48
label_155:
  %t160 = load i8, ptr %c
  %t161 = icmp eq i8 %t160, 49
  br i1 %t161, label %label_156, label %label_158
label_156:
  ret i32 49
label_158:
  %t162 = load i8, ptr %c
  %t163 = icmp eq i8 %t162, 50
  br i1 %t163, label %label_159, label %label_161
label_159:
  ret i32 50
label_161:
  %t164 = load i8, ptr %c
  %t165 = icmp eq i8 %t164, 51
  br i1 %t165, label %label_162, label %label_164
label_162:
  ret i32 51
label_164:
  %t166 = load i8, ptr %c
  %t167 = icmp eq i8 %t166, 52
  br i1 %t167, label %label_165, label %label_167
label_165:
  ret i32 52
label_167:
  %t168 = load i8, ptr %c
  %t169 = icmp eq i8 %t168, 53
  br i1 %t169, label %label_168, label %label_170
label_168:
  ret i32 53
label_170:
  %t170 = load i8, ptr %c
  %t171 = icmp eq i8 %t170, 54
  br i1 %t171, label %label_171, label %label_173
label_171:
  ret i32 54
label_173:
  %t172 = load i8, ptr %c
  %t173 = icmp eq i8 %t172, 55
  br i1 %t173, label %label_174, label %label_176
label_174:
  ret i32 55
label_176:
  %t174 = load i8, ptr %c
  %t175 = icmp eq i8 %t174, 56
  br i1 %t175, label %label_177, label %label_179
label_177:
  ret i32 56
label_179:
  %t176 = load i8, ptr %c
  %t177 = icmp eq i8 %t176, 57
  br i1 %t177, label %label_180, label %label_182
label_180:
  ret i32 57
label_182:
  %t178 = load i8, ptr %c
  %t179 = icmp eq i8 %t178, 58
  br i1 %t179, label %label_183, label %label_185
label_183:
  ret i32 58
label_185:
  %t180 = load i8, ptr %c
  %t181 = icmp eq i8 %t180, 60
  br i1 %t181, label %label_186, label %label_188
label_186:
  ret i32 60
label_188:
  %t182 = load i8, ptr %c
  %t183 = icmp eq i8 %t182, 61
  br i1 %t183, label %label_189, label %label_191
label_189:
  ret i32 61
label_191:
  %t184 = load i8, ptr %c
  %t185 = icmp eq i8 %t184, 62
  br i1 %t185, label %label_192, label %label_194
label_192:
  ret i32 62
label_194:
  %t186 = load i8, ptr %c
  %t187 = icmp eq i8 %t186, 65
  br i1 %t187, label %label_195, label %label_197
label_195:
  ret i32 65
label_197:
  %t188 = load i8, ptr %c
  %t189 = icmp eq i8 %t188, 66
  br i1 %t189, label %label_198, label %label_200
label_198:
  ret i32 66
label_200:
  %t190 = load i8, ptr %c
  %t191 = icmp eq i8 %t190, 67
  br i1 %t191, label %label_201, label %label_203
label_201:
  ret i32 67
label_203:
  %t192 = load i8, ptr %c
  %t193 = icmp eq i8 %t192, 68
  br i1 %t193, label %label_204, label %label_206
label_204:
  ret i32 68
label_206:
  %t194 = load i8, ptr %c
  %t195 = icmp eq i8 %t194, 69
  br i1 %t195, label %label_207, label %label_209
label_207:
  ret i32 69
label_209:
  %t196 = load i8, ptr %c
  %t197 = icmp eq i8 %t196, 70
  br i1 %t197, label %label_210, label %label_212
label_210:
  ret i32 70
label_212:
  %t198 = load i8, ptr %c
  %t199 = icmp eq i8 %t198, 71
  br i1 %t199, label %label_213, label %label_215
label_213:
  ret i32 71
label_215:
  %t200 = load i8, ptr %c
  %t201 = icmp eq i8 %t200, 72
  br i1 %t201, label %label_216, label %label_218
label_216:
  ret i32 72
label_218:
  %t202 = load i8, ptr %c
  %t203 = icmp eq i8 %t202, 73
  br i1 %t203, label %label_219, label %label_221
label_219:
  ret i32 73
label_221:
  %t204 = load i8, ptr %c
  %t205 = icmp eq i8 %t204, 74
  br i1 %t205, label %label_222, label %label_224
label_222:
  ret i32 74
label_224:
  %t206 = load i8, ptr %c
  %t207 = icmp eq i8 %t206, 75
  br i1 %t207, label %label_225, label %label_227
label_225:
  ret i32 75
label_227:
  %t208 = load i8, ptr %c
  %t209 = icmp eq i8 %t208, 76
  br i1 %t209, label %label_228, label %label_230
label_228:
  ret i32 76
label_230:
  %t210 = load i8, ptr %c
  %t211 = icmp eq i8 %t210, 77
  br i1 %t211, label %label_231, label %label_233
label_231:
  ret i32 77
label_233:
  %t212 = load i8, ptr %c
  %t213 = icmp eq i8 %t212, 78
  br i1 %t213, label %label_234, label %label_236
label_234:
  ret i32 78
label_236:
  %t214 = load i8, ptr %c
  %t215 = icmp eq i8 %t214, 79
  br i1 %t215, label %label_237, label %label_239
label_237:
  ret i32 79
label_239:
  %t216 = load i8, ptr %c
  %t217 = icmp eq i8 %t216, 80
  br i1 %t217, label %label_240, label %label_242
label_240:
  ret i32 80
label_242:
  %t218 = load i8, ptr %c
  %t219 = icmp eq i8 %t218, 81
  br i1 %t219, label %label_243, label %label_245
label_243:
  ret i32 81
label_245:
  %t220 = load i8, ptr %c
  %t221 = icmp eq i8 %t220, 82
  br i1 %t221, label %label_246, label %label_248
label_246:
  ret i32 82
label_248:
  %t222 = load i8, ptr %c
  %t223 = icmp eq i8 %t222, 83
  br i1 %t223, label %label_249, label %label_251
label_249:
  ret i32 83
label_251:
  %t224 = load i8, ptr %c
  %t225 = icmp eq i8 %t224, 84
  br i1 %t225, label %label_252, label %label_254
label_252:
  ret i32 84
label_254:
  %t226 = load i8, ptr %c
  %t227 = icmp eq i8 %t226, 85
  br i1 %t227, label %label_255, label %label_257
label_255:
  ret i32 85
label_257:
  %t228 = load i8, ptr %c
  %t229 = icmp eq i8 %t228, 86
  br i1 %t229, label %label_258, label %label_260
label_258:
  ret i32 86
label_260:
  %t230 = load i8, ptr %c
  %t231 = icmp eq i8 %t230, 87
  br i1 %t231, label %label_261, label %label_263
label_261:
  ret i32 87
label_263:
  %t232 = load i8, ptr %c
  %t233 = icmp eq i8 %t232, 88
  br i1 %t233, label %label_264, label %label_266
label_264:
  ret i32 88
label_266:
  %t234 = load i8, ptr %c
  %t235 = icmp eq i8 %t234, 89
  br i1 %t235, label %label_267, label %label_269
label_267:
  ret i32 89
label_269:
  %t236 = load i8, ptr %c
  %t237 = icmp eq i8 %t236, 90
  br i1 %t237, label %label_270, label %label_272
label_270:
  ret i32 90
label_272:
  %t238 = load i8, ptr %c
  %t239 = icmp eq i8 %t238, 91
  br i1 %t239, label %label_273, label %label_275
label_273:
  ret i32 91
label_275:
  %t240 = load i8, ptr %c
  %t241 = icmp eq i8 %t240, 92
  br i1 %t241, label %label_276, label %label_278
label_276:
  ret i32 92
label_278:
  %t242 = load i8, ptr %c
  %t243 = icmp eq i8 %t242, 93
  br i1 %t243, label %label_279, label %label_281
label_279:
  ret i32 93
label_281:
  %t244 = load i8, ptr %c
  %t245 = icmp eq i8 %t244, 95
  br i1 %t245, label %label_282, label %label_284
label_282:
  ret i32 95
label_284:
  %t246 = load i8, ptr %c
  %t247 = icmp eq i8 %t246, 97
  br i1 %t247, label %label_285, label %label_287
label_285:
  ret i32 97
label_287:
  %t248 = load i8, ptr %c
  %t249 = icmp eq i8 %t248, 98
  br i1 %t249, label %label_288, label %label_290
label_288:
  ret i32 98
label_290:
  %t250 = load i8, ptr %c
  %t251 = icmp eq i8 %t250, 99
  br i1 %t251, label %label_291, label %label_293
label_291:
  ret i32 99
label_293:
  %t252 = load i8, ptr %c
  %t253 = icmp eq i8 %t252, 100
  br i1 %t253, label %label_294, label %label_296
label_294:
  ret i32 100
label_296:
  %t254 = load i8, ptr %c
  %t255 = icmp eq i8 %t254, 101
  br i1 %t255, label %label_297, label %label_299
label_297:
  ret i32 101
label_299:
  %t256 = load i8, ptr %c
  %t257 = icmp eq i8 %t256, 102
  br i1 %t257, label %label_300, label %label_302
label_300:
  ret i32 102
label_302:
  %t258 = load i8, ptr %c
  %t259 = icmp eq i8 %t258, 103
  br i1 %t259, label %label_303, label %label_305
label_303:
  ret i32 103
label_305:
  %t260 = load i8, ptr %c
  %t261 = icmp eq i8 %t260, 104
  br i1 %t261, label %label_306, label %label_308
label_306:
  ret i32 104
label_308:
  %t262 = load i8, ptr %c
  %t263 = icmp eq i8 %t262, 105
  br i1 %t263, label %label_309, label %label_311
label_309:
  ret i32 105
label_311:
  %t264 = load i8, ptr %c
  %t265 = icmp eq i8 %t264, 106
  br i1 %t265, label %label_312, label %label_314
label_312:
  ret i32 106
label_314:
  %t266 = load i8, ptr %c
  %t267 = icmp eq i8 %t266, 107
  br i1 %t267, label %label_315, label %label_317
label_315:
  ret i32 107
label_317:
  %t268 = load i8, ptr %c
  %t269 = icmp eq i8 %t268, 108
  br i1 %t269, label %label_318, label %label_320
label_318:
  ret i32 108
label_320:
  %t270 = load i8, ptr %c
  %t271 = icmp eq i8 %t270, 109
  br i1 %t271, label %label_321, label %label_323
label_321:
  ret i32 109
label_323:
  %t272 = load i8, ptr %c
  %t273 = icmp eq i8 %t272, 110
  br i1 %t273, label %label_324, label %label_326
label_324:
  ret i32 110
label_326:
  %t274 = load i8, ptr %c
  %t275 = icmp eq i8 %t274, 111
  br i1 %t275, label %label_327, label %label_329
label_327:
  ret i32 111
label_329:
  %t276 = load i8, ptr %c
  %t277 = icmp eq i8 %t276, 112
  br i1 %t277, label %label_330, label %label_332
label_330:
  ret i32 112
label_332:
  %t278 = load i8, ptr %c
  %t279 = icmp eq i8 %t278, 113
  br i1 %t279, label %label_333, label %label_335
label_333:
  ret i32 113
label_335:
  %t280 = load i8, ptr %c
  %t281 = icmp eq i8 %t280, 114
  br i1 %t281, label %label_336, label %label_338
label_336:
  ret i32 114
label_338:
  %t282 = load i8, ptr %c
  %t283 = icmp eq i8 %t282, 115
  br i1 %t283, label %label_339, label %label_341
label_339:
  ret i32 115
label_341:
  %t284 = load i8, ptr %c
  %t285 = icmp eq i8 %t284, 116
  br i1 %t285, label %label_342, label %label_344
label_342:
  ret i32 116
label_344:
  %t286 = load i8, ptr %c
  %t287 = icmp eq i8 %t286, 117
  br i1 %t287, label %label_345, label %label_347
label_345:
  ret i32 117
label_347:
  %t288 = load i8, ptr %c
  %t289 = icmp eq i8 %t288, 118
  br i1 %t289, label %label_348, label %label_350
label_348:
  ret i32 118
label_350:
  %t290 = load i8, ptr %c
  %t291 = icmp eq i8 %t290, 119
  br i1 %t291, label %label_351, label %label_353
label_351:
  ret i32 119
label_353:
  %t292 = load i8, ptr %c
  %t293 = icmp eq i8 %t292, 120
  br i1 %t293, label %label_354, label %label_356
label_354:
  ret i32 120
label_356:
  %t294 = load i8, ptr %c
  %t295 = icmp eq i8 %t294, 121
  br i1 %t295, label %label_357, label %label_359
label_357:
  ret i32 121
label_359:
  %t296 = load i8, ptr %c
  %t297 = icmp eq i8 %t296, 122
  br i1 %t297, label %label_360, label %label_362
label_360:
  ret i32 122
label_362:
  %t298 = load i8, ptr %c
  %t299 = icmp eq i8 %t298, 123
  br i1 %t299, label %label_363, label %label_365
label_363:
  ret i32 123
label_365:
  %t300 = load i8, ptr %c
  %t301 = icmp eq i8 %t300, 124
  br i1 %t301, label %label_366, label %label_368
label_366:
  ret i32 124
label_368:
  %t302 = load i8, ptr %c
  %t303 = icmp eq i8 %t302, 125
  br i1 %t303, label %label_369, label %label_371
label_369:
  ret i32 125
label_371:
  ret i32 0
}

define i1 @is_keyword(ptr %p_s) {
  %s = alloca ptr
  store ptr %p_s, ptr %s
  %t305 = load ptr, ptr %s
  %t306 = getelementptr inbounds [7 x i8], ptr @.str.s13, i64 0, i64 0
  %t307 = call i32 @str_equals(ptr %t305, ptr %t306)
  %t308 = icmp eq i32 %t307, 1
  br i1 %t308, label %label_372, label %label_374
label_372:
  ret i1 1
label_374:
  %t309 = load ptr, ptr %s
  %t310 = getelementptr inbounds [6 x i8], ptr @.str.s14, i64 0, i64 0
  %t311 = call i32 @str_equals(ptr %t309, ptr %t310)
  %t312 = icmp eq i32 %t311, 1
  br i1 %t312, label %label_375, label %label_377
label_375:
  ret i1 1
label_377:
  %t313 = load ptr, ptr %s
  %t314 = getelementptr inbounds [3 x i8], ptr @.str.s15, i64 0, i64 0
  %t315 = call i32 @str_equals(ptr %t313, ptr %t314)
  %t316 = icmp eq i32 %t315, 1
  br i1 %t316, label %label_378, label %label_380
label_378:
  ret i1 1
label_380:
  %t317 = load ptr, ptr %s
  %t318 = getelementptr inbounds [5 x i8], ptr @.str.s16, i64 0, i64 0
  %t319 = call i32 @str_equals(ptr %t317, ptr %t318)
  %t320 = icmp eq i32 %t319, 1
  br i1 %t320, label %label_381, label %label_383
label_381:
  ret i1 1
label_383:
  %t321 = load ptr, ptr %s
  %t322 = getelementptr inbounds [4 x i8], ptr @.str.s17, i64 0, i64 0
  %t323 = call i32 @str_equals(ptr %t321, ptr %t322)
  %t324 = icmp eq i32 %t323, 1
  br i1 %t324, label %label_384, label %label_386
label_384:
  ret i1 1
label_386:
  %t325 = load ptr, ptr %s
  %t326 = getelementptr inbounds [3 x i8], ptr @.str.s18, i64 0, i64 0
  %t327 = call i32 @str_equals(ptr %t325, ptr %t326)
  %t328 = icmp eq i32 %t327, 1
  br i1 %t328, label %label_387, label %label_389
label_387:
  ret i1 1
label_389:
  %t329 = load ptr, ptr %s
  %t330 = getelementptr inbounds [5 x i8], ptr @.str.s19, i64 0, i64 0
  %t331 = call i32 @str_equals(ptr %t329, ptr %t330)
  %t332 = icmp eq i32 %t331, 1
  br i1 %t332, label %label_390, label %label_392
label_390:
  ret i1 1
label_392:
  %t333 = load ptr, ptr %s
  %t334 = getelementptr inbounds [6 x i8], ptr @.str.s20, i64 0, i64 0
  %t335 = call i32 @str_equals(ptr %t333, ptr %t334)
  %t336 = icmp eq i32 %t335, 1
  br i1 %t336, label %label_393, label %label_395
label_393:
  ret i1 1
label_395:
  %t337 = load ptr, ptr %s
  %t338 = getelementptr inbounds [6 x i8], ptr @.str.s21, i64 0, i64 0
  %t339 = call i32 @str_equals(ptr %t337, ptr %t338)
  %t340 = icmp eq i32 %t339, 1
  br i1 %t340, label %label_396, label %label_398
label_396:
  ret i1 1
label_398:
  %t341 = load ptr, ptr %s
  %t342 = getelementptr inbounds [9 x i8], ptr @.str.s22, i64 0, i64 0
  %t343 = call i32 @str_equals(ptr %t341, ptr %t342)
  %t344 = icmp eq i32 %t343, 1
  br i1 %t344, label %label_399, label %label_401
label_399:
  ret i1 1
label_401:
  %t345 = load ptr, ptr %s
  %t346 = getelementptr inbounds [7 x i8], ptr @.str.s23, i64 0, i64 0
  %t347 = call i32 @str_equals(ptr %t345, ptr %t346)
  %t348 = icmp eq i32 %t347, 1
  br i1 %t348, label %label_402, label %label_404
label_402:
  ret i1 1
label_404:
  %t349 = load ptr, ptr %s
  %t350 = getelementptr inbounds [6 x i8], ptr @.str.s24, i64 0, i64 0
  %t351 = call i32 @str_equals(ptr %t349, ptr %t350)
  %t352 = icmp eq i32 %t351, 1
  br i1 %t352, label %label_405, label %label_407
label_405:
  ret i1 1
label_407:
  %t353 = load ptr, ptr %s
  %t354 = getelementptr inbounds [6 x i8], ptr @.str.s25, i64 0, i64 0
  %t355 = call i32 @str_equals(ptr %t353, ptr %t354)
  %t356 = icmp eq i32 %t355, 1
  br i1 %t356, label %label_408, label %label_410
label_408:
  ret i1 1
label_410:
  %t357 = load ptr, ptr %s
  %t358 = getelementptr inbounds [5 x i8], ptr @.str.s26, i64 0, i64 0
  %t359 = call i32 @str_equals(ptr %t357, ptr %t358)
  %t360 = icmp eq i32 %t359, 1
  br i1 %t360, label %label_411, label %label_413
label_411:
  ret i1 1
label_413:
  %t361 = load ptr, ptr %s
  %t362 = getelementptr inbounds [4 x i8], ptr @.str.s27, i64 0, i64 0
  %t363 = call i32 @str_equals(ptr %t361, ptr %t362)
  %t364 = icmp eq i32 %t363, 1
  br i1 %t364, label %label_414, label %label_416
label_414:
  ret i1 1
label_416:
  %t365 = load ptr, ptr %s
  %t366 = getelementptr inbounds [3 x i8], ptr @.str.s28, i64 0, i64 0
  %t367 = call i32 @str_equals(ptr %t365, ptr %t366)
  %t368 = icmp eq i32 %t367, 1
  br i1 %t368, label %label_417, label %label_419
label_417:
  ret i1 1
label_419:
  %t369 = load ptr, ptr %s
  %t370 = getelementptr inbounds [4 x i8], ptr @.str.s29, i64 0, i64 0
  %t371 = call i32 @str_equals(ptr %t369, ptr %t370)
  %t372 = icmp eq i32 %t371, 1
  br i1 %t372, label %label_420, label %label_422
label_420:
  ret i1 1
label_422:
  %t373 = load ptr, ptr %s
  %t374 = getelementptr inbounds [7 x i8], ptr @.str.s30, i64 0, i64 0
  %t375 = call i32 @str_equals(ptr %t373, ptr %t374)
  %t376 = icmp eq i32 %t375, 1
  br i1 %t376, label %label_423, label %label_425
label_423:
  ret i1 1
label_425:
  %t377 = load ptr, ptr %s
  %t378 = getelementptr inbounds [5 x i8], ptr @.str.s31, i64 0, i64 0
  %t379 = call i32 @str_equals(ptr %t377, ptr %t378)
  %t380 = icmp eq i32 %t379, 1
  br i1 %t380, label %label_426, label %label_428
label_426:
  ret i1 1
label_428:
  %t381 = load ptr, ptr %s
  %t382 = getelementptr inbounds [5 x i8], ptr @.str.s32, i64 0, i64 0
  %t383 = call i32 @str_equals(ptr %t381, ptr %t382)
  %t384 = icmp eq i32 %t383, 1
  br i1 %t384, label %label_429, label %label_431
label_429:
  ret i1 1
label_431:
  %t385 = load ptr, ptr %s
  %t386 = getelementptr inbounds [6 x i8], ptr @.str.s33, i64 0, i64 0
  %t387 = call i32 @str_equals(ptr %t385, ptr %t386)
  %t388 = icmp eq i32 %t387, 1
  br i1 %t388, label %label_432, label %label_434
label_432:
  ret i1 1
label_434:
  %t389 = load ptr, ptr %s
  %t390 = getelementptr inbounds [3 x i8], ptr @.str.s34, i64 0, i64 0
  %t391 = call i32 @str_equals(ptr %t389, ptr %t390)
  %t392 = icmp eq i32 %t391, 1
  br i1 %t392, label %label_435, label %label_437
label_435:
  ret i1 1
label_437:
  %t393 = load ptr, ptr %s
  %t394 = getelementptr inbounds [7 x i8], ptr @.str.s35, i64 0, i64 0
  %t395 = call i32 @str_equals(ptr %t393, ptr %t394)
  %t396 = icmp eq i32 %t395, 1
  br i1 %t396, label %label_438, label %label_440
label_438:
  ret i1 1
label_440:
  %t397 = load ptr, ptr %s
  %t398 = getelementptr inbounds [4 x i8], ptr @.str.s36, i64 0, i64 0
  %t399 = call i32 @str_equals(ptr %t397, ptr %t398)
  %t400 = icmp eq i32 %t399, 1
  br i1 %t400, label %label_441, label %label_443
label_441:
  ret i1 1
label_443:
  ret i1 0
}

define i1 @is_boolean(ptr %p_s) {
  %s = alloca ptr
  store ptr %p_s, ptr %s
  %t402 = load ptr, ptr %s
  %t403 = getelementptr inbounds [5 x i8], ptr @.str.s37, i64 0, i64 0
  %t404 = call i32 @str_equals(ptr %t402, ptr %t403)
  %t405 = icmp eq i32 %t404, 1
  br i1 %t405, label %label_444, label %label_446
label_444:
  ret i1 1
label_446:
  %t406 = load ptr, ptr %s
  %t407 = getelementptr inbounds [6 x i8], ptr @.str.s38, i64 0, i64 0
  %t408 = call i32 @str_equals(ptr %t406, ptr %t407)
  %t409 = icmp eq i32 %t408, 1
  br i1 %t409, label %label_447, label %label_449
label_447:
  ret i1 1
label_449:
  ret i1 0
}

define ptr @create_lexer(ptr %p_input) {
  %input = alloca ptr
  store ptr %p_input, ptr %input
  %t411 = getelementptr %Lexer, ptr null, i32 1
  %t412 = ptrtoint ptr %t411 to i64
  %t413 = call ptr @malloc(i64 %t412)
  %t414 = load ptr, ptr %input
  %t415 = getelementptr inbounds %Lexer, ptr %t413, i32 0, i32 0
  store ptr %t414, ptr %t415
  %t416 = getelementptr inbounds %Lexer, ptr %t413, i32 0, i32 1
  store i32 0, ptr %t416
  %t417 = getelementptr inbounds %Lexer, ptr %t413, i32 0, i32 2
  store i32 1, ptr %t417
  %t418 = getelementptr inbounds %Lexer, ptr %t413, i32 0, i32 3
  store i32 1, ptr %t418
  ret ptr %t413
}

define i8 @lexer_peek(ptr %p_lex, i32 %p_offset) {
  %lex = alloca ptr
  %offset = alloca i32
  store ptr %p_lex, ptr %lex
  store i32 %p_offset, ptr %offset
  %t421 = load ptr, ptr %lex
  %t422 = getelementptr inbounds %Lexer, ptr %t421, i32 0, i32 0
  %t423 = load ptr, ptr %t422
  %t424 = load ptr, ptr %lex
  %t425 = getelementptr inbounds %Lexer, ptr %t424, i32 0, i32 1
  %t426 = load i32, ptr %t425
  %t427 = load i32, ptr %offset
  %t428 = add i32 %t426, %t427
  %t429 = call i8 @str_char_at(ptr %t423, i32 %t428)
  ret i8 %t429
}

define i8 @lexer_current(ptr %p_lex) {
  %lex = alloca ptr
  store ptr %p_lex, ptr %lex
  %t431 = load ptr, ptr %lex
  %t432 = getelementptr inbounds %Lexer, ptr %t431, i32 0, i32 0
  %t433 = load ptr, ptr %t432
  %t434 = load ptr, ptr %lex
  %t435 = getelementptr inbounds %Lexer, ptr %t434, i32 0, i32 1
  %t436 = load i32, ptr %t435
  %t437 = call i8 @str_char_at(ptr %t433, i32 %t436)
  ret i8 %t437
}

define void @lexer_advance(ptr %p_lex) {
  %lex = alloca ptr
  store ptr %p_lex, ptr %lex
  %t439 = load ptr, ptr %lex
  %t440 = load ptr, ptr %lex
  %t441 = getelementptr inbounds %Lexer, ptr %t440, i32 0, i32 1
  %t442 = load i32, ptr %t441
  %t443 = add i32 %t442, 1
  %t444 = getelementptr inbounds %Lexer, ptr %t439, i32 0, i32 1
  store i32 %t443, ptr %t444
  %t445 = load ptr, ptr %lex
  %t446 = load ptr, ptr %lex
  %t447 = getelementptr inbounds %Lexer, ptr %t446, i32 0, i32 3
  %t448 = load i32, ptr %t447
  %t449 = add i32 %t448, 1
  %t450 = getelementptr inbounds %Lexer, ptr %t445, i32 0, i32 3
  store i32 %t449, ptr %t450
  ret void
}

define void @lexer_skip_whitespace(ptr %p_lex) {
  %lex = alloca ptr
  %is_looping = alloca i1
  store ptr %p_lex, ptr %lex
  store i1 1, ptr %is_looping
  br label %label_450
label_450:
  %t453 = load i1, ptr %is_looping
  br i1 %t453, label %label_451, label %label_452
label_451:
  %t454 = load ptr, ptr %lex
  %t455 = call i8 @lexer_current(ptr %t454)
  %t456 = call i1 @is_space(i8 %t455)
  br i1 %t456, label %label_453, label %label_454
label_453:
  %t457 = load ptr, ptr %lex
  %t458 = call i8 @lexer_current(ptr %t457)
  %t459 = icmp eq i8 %t458, 10
  br i1 %t459, label %label_456, label %label_458
label_456:
  %t460 = load ptr, ptr %lex
  %t461 = load ptr, ptr %lex
  %t462 = getelementptr inbounds %Lexer, ptr %t461, i32 0, i32 2
  %t463 = load i32, ptr %t462
  %t464 = add i32 %t463, 1
  %t465 = getelementptr inbounds %Lexer, ptr %t460, i32 0, i32 2
  store i32 %t464, ptr %t465
  %t466 = load ptr, ptr %lex
  %t467 = getelementptr inbounds %Lexer, ptr %t466, i32 0, i32 3
  store i32 0, ptr %t467
  br label %label_458
label_458:
  %t468 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t468)
  br label %label_455
label_454:
  %t469 = load ptr, ptr %lex
  %t470 = call i8 @lexer_current(ptr %t469)
  %t471 = icmp eq i8 %t470, 47
  %t472 = load ptr, ptr %lex
  %t473 = call i8 @lexer_peek(ptr %t472, i32 1)
  %t474 = icmp eq i8 %t473, 47
  %t475 = and i1 %t471, %t474
  br i1 %t475, label %label_459, label %label_460
label_459:
  br label %label_462
label_462:
  %t476 = load ptr, ptr %lex
  %t477 = call i8 @lexer_current(ptr %t476)
  %t478 = icmp ne i8 %t477, 10
  %t479 = load ptr, ptr %lex
  %t480 = call i8 @lexer_current(ptr %t479)
  %t481 = icmp ne i8 %t480, 0
  %t482 = and i1 %t478, %t481
  br i1 %t482, label %label_463, label %label_464
label_463:
  %t483 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t483)
  br label %label_462
label_464:
  br label %label_461
label_460:
  store i1 0, ptr %is_looping
  br label %label_461
label_461:
  br label %label_455
label_455:
  br label %label_450
label_452:
  ret void
}

define ptr @lexer_next_token(ptr %p_lex) {
  %lex = alloca ptr
  %c = alloca i8
  %start = alloca i32
  %length = alloca i32
  %value = alloca ptr
  %value_char = alloca i8
  %esc = alloca i8
  %next = alloca i8
  %type = alloca i32
  %val = alloca ptr
  store ptr %p_lex, ptr %lex
  %t486 = load ptr, ptr %lex
  call void @lexer_skip_whitespace(ptr %t486)
  %t487 = load ptr, ptr %lex
  %t488 = getelementptr inbounds %Lexer, ptr %t487, i32 0, i32 1
  %t489 = load i32, ptr %t488
  %t490 = load ptr, ptr %lex
  %t491 = getelementptr inbounds %Lexer, ptr %t490, i32 0, i32 0
  %t492 = load ptr, ptr %t491
  %t493 = call i32 @str_length(ptr %t492)
  %t494 = icmp sge i32 %t489, %t493
  br i1 %t494, label %label_465, label %label_467
label_465:
  %t495 = getelementptr %Token, ptr null, i32 1
  %t496 = ptrtoint ptr %t495 to i64
  %t497 = call ptr @malloc(i64 %t496)
  %t498 = getelementptr inbounds %Token, ptr %t497, i32 0, i32 0
  store i32 18, ptr %t498
  %t499 = getelementptr inbounds [4 x i8], ptr @.str.s39, i64 0, i64 0
  %t500 = getelementptr inbounds %Token, ptr %t497, i32 0, i32 1
  store ptr %t499, ptr %t500
  %t501 = load ptr, ptr %lex
  %t502 = getelementptr inbounds %Lexer, ptr %t501, i32 0, i32 2
  %t503 = load i32, ptr %t502
  %t504 = getelementptr inbounds %Token, ptr %t497, i32 0, i32 2
  store i32 %t503, ptr %t504
  %t505 = getelementptr inbounds [1 x i8], ptr @.str.s40, i64 0, i64 0
  %t506 = getelementptr inbounds %Token, ptr %t497, i32 0, i32 3
  store ptr %t505, ptr %t506
  ret ptr %t497
label_467:
  %t507 = load ptr, ptr %lex
  %t508 = call i8 @lexer_current(ptr %t507)
  store i8 %t508, ptr %c
  %t509 = load i8, ptr %c
  %t510 = call i1 @is_alpha(i8 %t509)
  br i1 %t510, label %label_468, label %label_470
label_468:
  %t512 = load ptr, ptr %lex
  %t513 = getelementptr inbounds %Lexer, ptr %t512, i32 0, i32 1
  %t514 = load i32, ptr %t513
  store i32 %t514, ptr %start
  br label %label_471
label_471:
  %t515 = load ptr, ptr %lex
  %t516 = call i8 @lexer_current(ptr %t515)
  %t517 = call i1 @is_alnum(i8 %t516)
  br i1 %t517, label %label_472, label %label_473
label_472:
  %t518 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t518)
  br label %label_471
label_473:
  %t520 = load ptr, ptr %lex
  %t521 = getelementptr inbounds %Lexer, ptr %t520, i32 0, i32 1
  %t522 = load i32, ptr %t521
  %t523 = load i32, ptr %start
  %t524 = sub i32 %t522, %t523
  store i32 %t524, ptr %length
  %t526 = load ptr, ptr %lex
  %t527 = getelementptr inbounds %Lexer, ptr %t526, i32 0, i32 0
  %t528 = load ptr, ptr %t527
  %t529 = load i32, ptr %start
  %t530 = load i32, ptr %length
  %t531 = call ptr @str_substring(ptr %t528, i32 %t529, i32 %t530)
  store ptr %t531, ptr %value
  %t532 = load ptr, ptr %value
  %t533 = call i1 @is_keyword(ptr %t532)
  br i1 %t533, label %label_474, label %label_476
label_474:
  %t534 = load ptr, ptr %value
  %t535 = call i1 @is_boolean(ptr %t534)
  br i1 %t535, label %label_477, label %label_479
label_477:
  %t536 = getelementptr %Token, ptr null, i32 1
  %t537 = ptrtoint ptr %t536 to i64
  %t538 = call ptr @malloc(i64 %t537)
  %t539 = getelementptr inbounds %Token, ptr %t538, i32 0, i32 0
  store i32 3, ptr %t539
  %t540 = load ptr, ptr %value
  %t541 = getelementptr inbounds %Token, ptr %t538, i32 0, i32 1
  store ptr %t540, ptr %t541
  %t542 = load ptr, ptr %lex
  %t543 = getelementptr inbounds %Lexer, ptr %t542, i32 0, i32 2
  %t544 = load i32, ptr %t543
  %t545 = getelementptr inbounds %Token, ptr %t538, i32 0, i32 2
  store i32 %t544, ptr %t545
  %t546 = getelementptr inbounds [1 x i8], ptr @.str.s41, i64 0, i64 0
  %t547 = getelementptr inbounds %Token, ptr %t538, i32 0, i32 3
  store ptr %t546, ptr %t547
  ret ptr %t538
label_479:
  %t548 = getelementptr %Token, ptr null, i32 1
  %t549 = ptrtoint ptr %t548 to i64
  %t550 = call ptr @malloc(i64 %t549)
  %t551 = getelementptr inbounds %Token, ptr %t550, i32 0, i32 0
  store i32 16, ptr %t551
  %t552 = load ptr, ptr %value
  %t553 = getelementptr inbounds %Token, ptr %t550, i32 0, i32 1
  store ptr %t552, ptr %t553
  %t554 = load ptr, ptr %lex
  %t555 = getelementptr inbounds %Lexer, ptr %t554, i32 0, i32 2
  %t556 = load i32, ptr %t555
  %t557 = getelementptr inbounds %Token, ptr %t550, i32 0, i32 2
  store i32 %t556, ptr %t557
  %t558 = getelementptr inbounds [1 x i8], ptr @.str.s42, i64 0, i64 0
  %t559 = getelementptr inbounds %Token, ptr %t550, i32 0, i32 3
  store ptr %t558, ptr %t559
  ret ptr %t550
label_476:
  %t560 = getelementptr %Token, ptr null, i32 1
  %t561 = ptrtoint ptr %t560 to i64
  %t562 = call ptr @malloc(i64 %t561)
  %t563 = getelementptr inbounds %Token, ptr %t562, i32 0, i32 0
  store i32 4, ptr %t563
  %t564 = load ptr, ptr %value
  %t565 = getelementptr inbounds %Token, ptr %t562, i32 0, i32 1
  store ptr %t564, ptr %t565
  %t566 = load ptr, ptr %lex
  %t567 = getelementptr inbounds %Lexer, ptr %t566, i32 0, i32 2
  %t568 = load i32, ptr %t567
  %t569 = getelementptr inbounds %Token, ptr %t562, i32 0, i32 2
  store i32 %t568, ptr %t569
  %t570 = getelementptr inbounds [1 x i8], ptr @.str.s43, i64 0, i64 0
  %t571 = getelementptr inbounds %Token, ptr %t562, i32 0, i32 3
  store ptr %t570, ptr %t571
  ret ptr %t562
label_470:
  %t572 = load i8, ptr %c
  %t573 = call i1 @is_digit(i8 %t572)
  br i1 %t573, label %label_480, label %label_482
label_480:
  %t574 = load ptr, ptr %lex
  %t575 = getelementptr inbounds %Lexer, ptr %t574, i32 0, i32 1
  %t576 = load i32, ptr %t575
  store i32 %t576, ptr %start
  br label %label_483
label_483:
  %t577 = load ptr, ptr %lex
  %t578 = call i8 @lexer_current(ptr %t577)
  %t579 = call i1 @is_digit(i8 %t578)
  br i1 %t579, label %label_484, label %label_485
label_484:
  %t580 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t580)
  br label %label_483
label_485:
  %t581 = load ptr, ptr %lex
  %t582 = call i8 @lexer_current(ptr %t581)
  %t583 = icmp eq i8 %t582, 46
  br i1 %t583, label %label_486, label %label_488
label_486:
  %t584 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t584)
  br label %label_489
label_489:
  %t585 = load ptr, ptr %lex
  %t586 = call i8 @lexer_current(ptr %t585)
  %t587 = call i1 @is_digit(i8 %t586)
  br i1 %t587, label %label_490, label %label_491
label_490:
  %t588 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t588)
  br label %label_489
label_491:
  br label %label_488
label_488:
  %t589 = load ptr, ptr %lex
  %t590 = getelementptr inbounds %Lexer, ptr %t589, i32 0, i32 1
  %t591 = load i32, ptr %t590
  %t592 = load i32, ptr %start
  %t593 = sub i32 %t591, %t592
  store i32 %t593, ptr %length
  %t594 = load ptr, ptr %lex
  %t595 = getelementptr inbounds %Lexer, ptr %t594, i32 0, i32 0
  %t596 = load ptr, ptr %t595
  %t597 = load i32, ptr %start
  %t598 = load i32, ptr %length
  %t599 = call ptr @str_substring(ptr %t596, i32 %t597, i32 %t598)
  store ptr %t599, ptr %value
  %t600 = getelementptr %Token, ptr null, i32 1
  %t601 = ptrtoint ptr %t600 to i64
  %t602 = call ptr @malloc(i64 %t601)
  %t603 = getelementptr inbounds %Token, ptr %t602, i32 0, i32 0
  store i32 2, ptr %t603
  %t604 = load ptr, ptr %value
  %t605 = getelementptr inbounds %Token, ptr %t602, i32 0, i32 1
  store ptr %t604, ptr %t605
  %t606 = load ptr, ptr %lex
  %t607 = getelementptr inbounds %Lexer, ptr %t606, i32 0, i32 2
  %t608 = load i32, ptr %t607
  %t609 = getelementptr inbounds %Token, ptr %t602, i32 0, i32 2
  store i32 %t608, ptr %t609
  %t610 = getelementptr inbounds [1 x i8], ptr @.str.s44, i64 0, i64 0
  %t611 = getelementptr inbounds %Token, ptr %t602, i32 0, i32 3
  store ptr %t610, ptr %t611
  ret ptr %t602
label_482:
  %t612 = load i8, ptr %c
  %t613 = icmp eq i8 %t612, 34
  br i1 %t613, label %label_492, label %label_494
label_492:
  %t614 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t614)
  %t615 = load ptr, ptr %lex
  %t616 = getelementptr inbounds %Lexer, ptr %t615, i32 0, i32 1
  %t617 = load i32, ptr %t616
  store i32 %t617, ptr %start
  br label %label_495
label_495:
  %t618 = load ptr, ptr %lex
  %t619 = call i8 @lexer_current(ptr %t618)
  %t620 = icmp ne i8 %t619, 34
  %t621 = load ptr, ptr %lex
  %t622 = getelementptr inbounds %Lexer, ptr %t621, i32 0, i32 1
  %t623 = load i32, ptr %t622
  %t624 = load ptr, ptr %lex
  %t625 = getelementptr inbounds %Lexer, ptr %t624, i32 0, i32 0
  %t626 = load ptr, ptr %t625
  %t627 = call i32 @str_length(ptr %t626)
  %t628 = icmp slt i32 %t623, %t627
  %t629 = and i1 %t620, %t628
  br i1 %t629, label %label_496, label %label_497
label_496:
  %t630 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t630)
  br label %label_495
label_497:
  %t631 = load ptr, ptr %lex
  %t632 = getelementptr inbounds %Lexer, ptr %t631, i32 0, i32 1
  %t633 = load i32, ptr %t632
  %t634 = load i32, ptr %start
  %t635 = sub i32 %t633, %t634
  store i32 %t635, ptr %length
  %t636 = load ptr, ptr %lex
  %t637 = getelementptr inbounds %Lexer, ptr %t636, i32 0, i32 0
  %t638 = load ptr, ptr %t637
  %t639 = load i32, ptr %start
  %t640 = load i32, ptr %length
  %t641 = call ptr @str_substring(ptr %t638, i32 %t639, i32 %t640)
  store ptr %t641, ptr %value
  %t642 = load ptr, ptr %lex
  %t643 = call i8 @lexer_current(ptr %t642)
  %t644 = icmp eq i8 %t643, 34
  br i1 %t644, label %label_498, label %label_500
label_498:
  %t645 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t645)
  br label %label_500
label_500:
  %t646 = getelementptr %Token, ptr null, i32 1
  %t647 = ptrtoint ptr %t646 to i64
  %t648 = call ptr @malloc(i64 %t647)
  %t649 = getelementptr inbounds %Token, ptr %t648, i32 0, i32 0
  store i32 0, ptr %t649
  %t650 = load ptr, ptr %value
  %t651 = getelementptr inbounds %Token, ptr %t648, i32 0, i32 1
  store ptr %t650, ptr %t651
  %t652 = load ptr, ptr %lex
  %t653 = getelementptr inbounds %Lexer, ptr %t652, i32 0, i32 2
  %t654 = load i32, ptr %t653
  %t655 = getelementptr inbounds %Token, ptr %t648, i32 0, i32 2
  store i32 %t654, ptr %t655
  %t656 = getelementptr inbounds [1 x i8], ptr @.str.s45, i64 0, i64 0
  %t657 = getelementptr inbounds %Token, ptr %t648, i32 0, i32 3
  store ptr %t656, ptr %t657
  ret ptr %t648
label_494:
  %t658 = load i8, ptr %c
  %t659 = icmp eq i8 %t658, 39
  br i1 %t659, label %label_501, label %label_503
label_501:
  %t660 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t660)
  %t662 = load ptr, ptr %lex
  %t663 = call i8 @lexer_current(ptr %t662)
  store i8 %t663, ptr %value_char
  %t664 = load i8, ptr %value_char
  %t665 = icmp eq i8 %t664, 92
  br i1 %t665, label %label_504, label %label_506
label_504:
  %t666 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t666)
  %t668 = load ptr, ptr %lex
  %t669 = call i8 @lexer_current(ptr %t668)
  store i8 %t669, ptr %esc
  %t670 = load i8, ptr %esc
  %t671 = icmp eq i8 %t670, 110
  br i1 %t671, label %label_507, label %label_509
label_507:
  store i8 10, ptr %value_char
  br label %label_509
label_509:
  %t672 = load i8, ptr %esc
  %t673 = icmp eq i8 %t672, 116
  br i1 %t673, label %label_510, label %label_512
label_510:
  store i8 9, ptr %value_char
  br label %label_512
label_512:
  %t674 = load i8, ptr %esc
  %t675 = icmp eq i8 %t674, 114
  br i1 %t675, label %label_513, label %label_515
label_513:
  store i8 13, ptr %value_char
  br label %label_515
label_515:
  %t676 = load i8, ptr %esc
  %t677 = icmp eq i8 %t676, 48
  br i1 %t677, label %label_516, label %label_518
label_516:
  store i8 0, ptr %value_char
  br label %label_518
label_518:
  %t678 = load i8, ptr %esc
  %t679 = icmp eq i8 %t678, 92
  br i1 %t679, label %label_519, label %label_521
label_519:
  store i8 92, ptr %value_char
  br label %label_521
label_521:
  %t680 = load i8, ptr %esc
  %t681 = icmp eq i8 %t680, 39
  br i1 %t681, label %label_522, label %label_524
label_522:
  store i8 39, ptr %value_char
  br label %label_524
label_524:
  %t682 = load i8, ptr %esc
  %t683 = icmp eq i8 %t682, 34
  br i1 %t683, label %label_525, label %label_527
label_525:
  store i8 34, ptr %value_char
  br label %label_527
label_527:
  br label %label_506
label_506:
  %t684 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t684)
  %t685 = load ptr, ptr %lex
  %t686 = call i8 @lexer_current(ptr %t685)
  %t687 = icmp eq i8 %t686, 39
  br i1 %t687, label %label_528, label %label_530
label_528:
  %t688 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t688)
  br label %label_530
label_530:
  %t689 = getelementptr %Token, ptr null, i32 1
  %t690 = ptrtoint ptr %t689 to i64
  %t691 = call ptr @malloc(i64 %t690)
  %t692 = getelementptr inbounds %Token, ptr %t691, i32 0, i32 0
  store i32 1, ptr %t692
  %t693 = load i8, ptr %value_char
  %t694 = call i32 @char_code(i8 %t693)
  %t695 = call ptr @int_to_str(i32 %t694)
  %t696 = getelementptr inbounds %Token, ptr %t691, i32 0, i32 1
  store ptr %t695, ptr %t696
  %t697 = load ptr, ptr %lex
  %t698 = getelementptr inbounds %Lexer, ptr %t697, i32 0, i32 2
  %t699 = load i32, ptr %t698
  %t700 = getelementptr inbounds %Token, ptr %t691, i32 0, i32 2
  store i32 %t699, ptr %t700
  %t701 = getelementptr inbounds [1 x i8], ptr @.str.s46, i64 0, i64 0
  %t702 = getelementptr inbounds %Token, ptr %t691, i32 0, i32 3
  store ptr %t701, ptr %t702
  ret ptr %t691
label_503:
  %t703 = load i8, ptr %c
  %t704 = call i1 @is_operator(i8 %t703)
  br i1 %t704, label %label_531, label %label_533
label_531:
  %t705 = load ptr, ptr %lex
  %t706 = getelementptr inbounds %Lexer, ptr %t705, i32 0, i32 1
  %t707 = load i32, ptr %t706
  store i32 %t707, ptr %start
  %t708 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t708)
  %t710 = load ptr, ptr %lex
  %t711 = call i8 @lexer_current(ptr %t710)
  store i8 %t711, ptr %next
  %t712 = load i8, ptr %c
  %t713 = icmp eq i8 %t712, 61
  %t714 = load i8, ptr %next
  %t715 = icmp eq i8 %t714, 61
  %t716 = and i1 %t713, %t715
  br i1 %t716, label %label_534, label %label_536
label_534:
  %t717 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t717)
  br label %label_536
label_536:
  %t718 = load i8, ptr %c
  %t719 = icmp eq i8 %t718, 33
  %t720 = load i8, ptr %next
  %t721 = icmp eq i8 %t720, 61
  %t722 = and i1 %t719, %t721
  br i1 %t722, label %label_537, label %label_539
label_537:
  %t723 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t723)
  br label %label_539
label_539:
  %t724 = load i8, ptr %c
  %t725 = icmp eq i8 %t724, 60
  %t726 = load i8, ptr %next
  %t727 = icmp eq i8 %t726, 61
  %t728 = and i1 %t725, %t727
  br i1 %t728, label %label_540, label %label_542
label_540:
  %t729 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t729)
  br label %label_542
label_542:
  %t730 = load i8, ptr %c
  %t731 = icmp eq i8 %t730, 62
  %t732 = load i8, ptr %next
  %t733 = icmp eq i8 %t732, 61
  %t734 = and i1 %t731, %t733
  br i1 %t734, label %label_543, label %label_545
label_543:
  %t735 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t735)
  br label %label_545
label_545:
  %t736 = load i8, ptr %c
  %t737 = icmp eq i8 %t736, 38
  %t738 = load i8, ptr %next
  %t739 = icmp eq i8 %t738, 38
  %t740 = and i1 %t737, %t739
  br i1 %t740, label %label_546, label %label_548
label_546:
  %t741 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t741)
  br label %label_548
label_548:
  %t742 = load i8, ptr %c
  %t743 = icmp eq i8 %t742, 124
  %t744 = load i8, ptr %next
  %t745 = icmp eq i8 %t744, 124
  %t746 = and i1 %t743, %t745
  br i1 %t746, label %label_549, label %label_551
label_549:
  %t747 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t747)
  br label %label_551
label_551:
  %t748 = load i8, ptr %c
  %t749 = icmp eq i8 %t748, 45
  %t750 = load i8, ptr %next
  %t751 = icmp eq i8 %t750, 62
  %t752 = and i1 %t749, %t751
  br i1 %t752, label %label_552, label %label_554
label_552:
  %t753 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t753)
  br label %label_554
label_554:
  %t754 = load i8, ptr %c
  %t755 = icmp eq i8 %t754, 61
  %t756 = load i8, ptr %next
  %t757 = icmp eq i8 %t756, 62
  %t758 = and i1 %t755, %t757
  br i1 %t758, label %label_555, label %label_557
label_555:
  %t759 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t759)
  br label %label_557
label_557:
  %t760 = load ptr, ptr %lex
  %t761 = getelementptr inbounds %Lexer, ptr %t760, i32 0, i32 1
  %t762 = load i32, ptr %t761
  %t763 = load i32, ptr %start
  %t764 = sub i32 %t762, %t763
  store i32 %t764, ptr %length
  %t765 = load ptr, ptr %lex
  %t766 = getelementptr inbounds %Lexer, ptr %t765, i32 0, i32 0
  %t767 = load ptr, ptr %t766
  %t768 = load i32, ptr %start
  %t769 = load i32, ptr %length
  %t770 = call ptr @str_substring(ptr %t767, i32 %t768, i32 %t769)
  store ptr %t770, ptr %value
  store i32 7, ptr %type
  %t772 = load i32, ptr %length
  %t773 = icmp eq i32 %t772, 2
  br i1 %t773, label %label_558, label %label_559
label_558:
  %t774 = load ptr, ptr %value
  %t775 = getelementptr inbounds [3 x i8], ptr @.str.s47, i64 0, i64 0
  %t776 = call i32 @str_equals(ptr %t774, ptr %t775)
  %t777 = icmp eq i32 %t776, 1
  %t778 = load ptr, ptr %value
  %t779 = getelementptr inbounds [3 x i8], ptr @.str.s48, i64 0, i64 0
  %t780 = call i32 @str_equals(ptr %t778, ptr %t779)
  %t781 = icmp eq i32 %t780, 1
  %t782 = or i1 %t777, %t781
  %t783 = load ptr, ptr %value
  %t784 = getelementptr inbounds [3 x i8], ptr @.str.s49, i64 0, i64 0
  %t785 = call i32 @str_equals(ptr %t783, ptr %t784)
  %t786 = icmp eq i32 %t785, 1
  %t787 = or i1 %t782, %t786
  %t788 = load ptr, ptr %value
  %t789 = getelementptr inbounds [3 x i8], ptr @.str.s50, i64 0, i64 0
  %t790 = call i32 @str_equals(ptr %t788, ptr %t789)
  %t791 = icmp eq i32 %t790, 1
  %t792 = or i1 %t787, %t791
  br i1 %t792, label %label_561, label %label_563
label_561:
  store i32 8, ptr %type
  br label %label_563
label_563:
  %t793 = load ptr, ptr %value
  %t794 = getelementptr inbounds [3 x i8], ptr @.str.s51, i64 0, i64 0
  %t795 = call i32 @str_equals(ptr %t793, ptr %t794)
  %t796 = icmp eq i32 %t795, 1
  %t797 = load ptr, ptr %value
  %t798 = getelementptr inbounds [3 x i8], ptr @.str.s52, i64 0, i64 0
  %t799 = call i32 @str_equals(ptr %t797, ptr %t798)
  %t800 = icmp eq i32 %t799, 1
  %t801 = or i1 %t796, %t800
  br i1 %t801, label %label_564, label %label_566
label_564:
  store i32 14, ptr %type
  %t802 = load ptr, ptr %value
  %t803 = getelementptr inbounds [3 x i8], ptr @.str.s53, i64 0, i64 0
  %t804 = call i32 @str_equals(ptr %t802, ptr %t803)
  %t805 = icmp eq i32 %t804, 1
  br i1 %t805, label %label_567, label %label_569
label_567:
  store i32 15, ptr %type
  br label %label_569
label_569:
  br label %label_566
label_566:
  br label %label_560
label_559:
  %t806 = load i8, ptr %c
  %t807 = icmp eq i8 %t806, 60
  %t808 = load i8, ptr %c
  %t809 = icmp eq i8 %t808, 62
  %t810 = or i1 %t807, %t809
  br i1 %t810, label %label_570, label %label_572
label_570:
  store i32 8, ptr %type
  br label %label_572
label_572:
  %t811 = load i8, ptr %c
  %t812 = icmp eq i8 %t811, 61
  br i1 %t812, label %label_573, label %label_575
label_573:
  store i32 11, ptr %type
  br label %label_575
label_575:
  %t813 = load i8, ptr %c
  %t814 = icmp eq i8 %t813, 33
  br i1 %t814, label %label_576, label %label_578
label_576:
  store i32 9, ptr %type
  br label %label_578
label_578:
  br label %label_560
label_560:
  %t815 = getelementptr %Token, ptr null, i32 1
  %t816 = ptrtoint ptr %t815 to i64
  %t817 = call ptr @malloc(i64 %t816)
  %t818 = load i32, ptr %type
  %t819 = getelementptr inbounds %Token, ptr %t817, i32 0, i32 0
  store i32 %t818, ptr %t819
  %t820 = load ptr, ptr %value
  %t821 = getelementptr inbounds %Token, ptr %t817, i32 0, i32 1
  store ptr %t820, ptr %t821
  %t822 = load ptr, ptr %lex
  %t823 = getelementptr inbounds %Lexer, ptr %t822, i32 0, i32 2
  %t824 = load i32, ptr %t823
  %t825 = getelementptr inbounds %Token, ptr %t817, i32 0, i32 2
  store i32 %t824, ptr %t825
  %t826 = getelementptr inbounds [1 x i8], ptr @.str.s54, i64 0, i64 0
  %t827 = getelementptr inbounds %Token, ptr %t817, i32 0, i32 3
  store ptr %t826, ptr %t827
  ret ptr %t817
label_533:
  %t828 = load i8, ptr %c
  %t829 = call i1 @is_separator(i8 %t828)
  br i1 %t829, label %label_579, label %label_581
label_579:
  %t831 = load ptr, ptr %lex
  %t832 = getelementptr inbounds %Lexer, ptr %t831, i32 0, i32 0
  %t833 = load ptr, ptr %t832
  %t834 = load ptr, ptr %lex
  %t835 = getelementptr inbounds %Lexer, ptr %t834, i32 0, i32 1
  %t836 = load i32, ptr %t835
  %t837 = call ptr @str_substring(ptr %t833, i32 %t836, i32 1)
  store ptr %t837, ptr %val
  %t838 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t838)
  %t839 = getelementptr %Token, ptr null, i32 1
  %t840 = ptrtoint ptr %t839 to i64
  %t841 = call ptr @malloc(i64 %t840)
  %t842 = getelementptr inbounds %Token, ptr %t841, i32 0, i32 0
  store i32 5, ptr %t842
  %t843 = load ptr, ptr %val
  %t844 = getelementptr inbounds %Token, ptr %t841, i32 0, i32 1
  store ptr %t843, ptr %t844
  %t845 = load ptr, ptr %lex
  %t846 = getelementptr inbounds %Lexer, ptr %t845, i32 0, i32 2
  %t847 = load i32, ptr %t846
  %t848 = getelementptr inbounds %Token, ptr %t841, i32 0, i32 2
  store i32 %t847, ptr %t848
  %t849 = getelementptr inbounds [1 x i8], ptr @.str.s55, i64 0, i64 0
  %t850 = getelementptr inbounds %Token, ptr %t841, i32 0, i32 3
  store ptr %t849, ptr %t850
  ret ptr %t841
label_581:
  %t851 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t851)
  %t852 = getelementptr %Token, ptr null, i32 1
  %t853 = ptrtoint ptr %t852 to i64
  %t854 = call ptr @malloc(i64 %t853)
  %t855 = getelementptr inbounds %Token, ptr %t854, i32 0, i32 0
  store i32 17, ptr %t855
  %t856 = getelementptr inbounds [2 x i8], ptr @.str.s56, i64 0, i64 0
  %t857 = getelementptr inbounds %Token, ptr %t854, i32 0, i32 1
  store ptr %t856, ptr %t857
  %t858 = load ptr, ptr %lex
  %t859 = getelementptr inbounds %Lexer, ptr %t858, i32 0, i32 2
  %t860 = load i32, ptr %t859
  %t861 = getelementptr inbounds %Token, ptr %t854, i32 0, i32 2
  store i32 %t860, ptr %t861
  %t862 = getelementptr inbounds [1 x i8], ptr @.str.s57, i64 0, i64 0
  %t863 = getelementptr inbounds %Token, ptr %t854, i32 0, i32 3
  store ptr %t862, ptr %t863
  ret ptr %t854
}

define ptr @lex_all_tokens(ptr %p_lex) {
  %lex = alloca ptr
  %head = alloca ptr
  %current = alloca ptr
  %next_tok = alloca ptr
  store ptr %p_lex, ptr %lex
  %t867 = load ptr, ptr %lex
  %t868 = call ptr @lexer_next_token(ptr %t867)
  store ptr %t868, ptr %head
  %t869 = load ptr, ptr %head
  store ptr %t869, ptr %current
  br label %label_582
label_582:
  %t870 = load ptr, ptr %current
  %t871 = getelementptr inbounds %Token, ptr %t870, i32 0, i32 0
  %t872 = load i32, ptr %t871
  %t873 = icmp ne i32 %t872, 18
  br i1 %t873, label %label_583, label %label_584
label_583:
  %t875 = load ptr, ptr %lex
  %t876 = call ptr @lexer_next_token(ptr %t875)
  store ptr %t876, ptr %next_tok
  %t877 = load ptr, ptr %current
  %t878 = load ptr, ptr %next_tok
  %t879 = call ptr @token_to_ptr(ptr %t878)
  %t880 = getelementptr inbounds %Token, ptr %t877, i32 0, i32 3
  store ptr %t879, ptr %t880
  %t881 = load ptr, ptr %next_tok
  store ptr %t881, ptr %current
  br label %label_582
label_584:
  %t882 = load ptr, ptr %head
  ret ptr %t882
}

define ptr @create_node(i32 %p_kind) {
  %kind = alloca i32
  store i32 %p_kind, ptr %kind
  %t884 = getelementptr %ASTNode, ptr null, i32 1
  %t885 = ptrtoint ptr %t884 to i64
  %t886 = call ptr @malloc(i64 %t885)
  %t887 = load i32, ptr %kind
  %t888 = getelementptr inbounds %ASTNode, ptr %t886, i32 0, i32 0
  store i32 %t887, ptr %t888
  %t889 = getelementptr inbounds [1 x i8], ptr @.str.s58, i64 0, i64 0
  %t890 = getelementptr inbounds %ASTNode, ptr %t886, i32 0, i32 1
  store ptr %t889, ptr %t890
  %t891 = getelementptr inbounds [1 x i8], ptr @.str.s59, i64 0, i64 0
  %t892 = getelementptr inbounds %ASTNode, ptr %t886, i32 0, i32 2
  store ptr %t891, ptr %t892
  %t893 = getelementptr inbounds %ASTNode, ptr %t886, i32 0, i32 3
  store i32 0, ptr %t893
  %t894 = getelementptr inbounds %ASTNode, ptr %t886, i32 0, i32 4
  store i32 0, ptr %t894
  %t895 = getelementptr inbounds [1 x i8], ptr @.str.s60, i64 0, i64 0
  %t896 = getelementptr inbounds %ASTNode, ptr %t886, i32 0, i32 5
  store ptr %t895, ptr %t896
  %t897 = getelementptr inbounds [1 x i8], ptr @.str.s61, i64 0, i64 0
  %t898 = getelementptr inbounds %ASTNode, ptr %t886, i32 0, i32 6
  store ptr %t897, ptr %t898
  %t899 = getelementptr inbounds [1 x i8], ptr @.str.s62, i64 0, i64 0
  %t900 = getelementptr inbounds %ASTNode, ptr %t886, i32 0, i32 7
  store ptr %t899, ptr %t900
  %t901 = getelementptr inbounds [1 x i8], ptr @.str.s63, i64 0, i64 0
  %t902 = getelementptr inbounds %ASTNode, ptr %t886, i32 0, i32 8
  store ptr %t901, ptr %t902
  ret ptr %t886
}

define ptr @parser_create(ptr %p_tokens) {
  %tokens = alloca ptr
  store ptr %p_tokens, ptr %tokens
  %t904 = getelementptr %Parser, ptr null, i32 1
  %t905 = ptrtoint ptr %t904 to i64
  %t906 = call ptr @malloc(i64 %t905)
  %t907 = load ptr, ptr %tokens
  %t908 = call ptr @token_to_ptr(ptr %t907)
  %t909 = getelementptr inbounds %Parser, ptr %t906, i32 0, i32 0
  store ptr %t908, ptr %t909
  ret ptr %t906
}

define ptr @parser_current(ptr %p_p) {
  %p = alloca ptr
  store ptr %p_p, ptr %p
  %t911 = load ptr, ptr %p
  %t912 = getelementptr inbounds %Parser, ptr %t911, i32 0, i32 0
  %t913 = load ptr, ptr %t912
  %t914 = call ptr @ptr_to_token(ptr %t913)
  ret ptr %t914
}

define ptr @parser_peek(ptr %p_p) {
  %p = alloca ptr
  %curr = alloca ptr
  store ptr %p_p, ptr %p
  %t917 = load ptr, ptr %p
  %t918 = getelementptr inbounds %Parser, ptr %t917, i32 0, i32 0
  %t919 = load ptr, ptr %t918
  %t920 = call ptr @ptr_to_token(ptr %t919)
  store ptr %t920, ptr %curr
  %t921 = load ptr, ptr %curr
  %t922 = getelementptr inbounds %Token, ptr %t921, i32 0, i32 3
  %t923 = load ptr, ptr %t922
  %t924 = call ptr @ptr_to_token(ptr %t923)
  ret ptr %t924
}

define void @parser_advance(ptr %p_p) {
  %p = alloca ptr
  %curr = alloca ptr
  store ptr %p_p, ptr %p
  %t927 = load ptr, ptr %p
  %t928 = getelementptr inbounds %Parser, ptr %t927, i32 0, i32 0
  %t929 = load ptr, ptr %t928
  %t930 = call ptr @ptr_to_token(ptr %t929)
  store ptr %t930, ptr %curr
  %t931 = load ptr, ptr %curr
  %t932 = getelementptr inbounds %Token, ptr %t931, i32 0, i32 0
  %t933 = load i32, ptr %t932
  %t934 = icmp ne i32 %t933, 18
  br i1 %t934, label %label_585, label %label_587
label_585:
  %t935 = load ptr, ptr %p
  %t936 = load ptr, ptr %curr
  %t937 = getelementptr inbounds %Token, ptr %t936, i32 0, i32 3
  %t938 = load ptr, ptr %t937
  %t939 = getelementptr inbounds %Parser, ptr %t935, i32 0, i32 0
  store ptr %t938, ptr %t939
  br label %label_587
label_587:
  ret void
}

define i1 @parser_check(ptr %p_p, i32 %p_t) {
  %p = alloca ptr
  %t = alloca i32
  %curr = alloca ptr
  store ptr %p_p, ptr %p
  store i32 %p_t, ptr %t
  %t943 = load ptr, ptr %p
  %t944 = call ptr @parser_current(ptr %t943)
  store ptr %t944, ptr %curr
  %t945 = load ptr, ptr %curr
  %t946 = getelementptr inbounds %Token, ptr %t945, i32 0, i32 0
  %t947 = load i32, ptr %t946
  %t948 = load i32, ptr %t
  %t949 = icmp eq i32 %t947, %t948
  ret i1 %t949
}

define i1 @parser_check_val(ptr %p_p, i32 %p_t, ptr %p_val) {
  %p = alloca ptr
  %t = alloca i32
  %val = alloca ptr
  %curr = alloca ptr
  store ptr %p_p, ptr %p
  store i32 %p_t, ptr %t
  store ptr %p_val, ptr %val
  %t954 = load ptr, ptr %p
  %t955 = call ptr @parser_current(ptr %t954)
  store ptr %t955, ptr %curr
  %t956 = load ptr, ptr %curr
  %t957 = getelementptr inbounds %Token, ptr %t956, i32 0, i32 0
  %t958 = load i32, ptr %t957
  %t959 = load i32, ptr %t
  %t960 = icmp eq i32 %t958, %t959
  %t961 = load ptr, ptr %curr
  %t962 = getelementptr inbounds %Token, ptr %t961, i32 0, i32 1
  %t963 = load ptr, ptr %t962
  %t964 = load ptr, ptr %val
  %t965 = call i32 @str_equals(ptr %t963, ptr %t964)
  %t966 = icmp eq i32 %t965, 1
  %t967 = and i1 %t960, %t966
  ret i1 %t967
}

define i1 @parser_match(ptr %p_p, i32 %p_t) {
  %p = alloca ptr
  %t = alloca i32
  store ptr %p_p, ptr %p
  store i32 %p_t, ptr %t
  %t970 = load ptr, ptr %p
  %t971 = load i32, ptr %t
  %t972 = call i1 @parser_check(ptr %t970, i32 %t971)
  br i1 %t972, label %label_588, label %label_590
label_588:
  %t973 = load ptr, ptr %p
  call void @parser_advance(ptr %t973)
  ret i1 1
label_590:
  ret i1 0
}

define i1 @parser_match_val(ptr %p_p, i32 %p_t, ptr %p_val) {
  %p = alloca ptr
  %t = alloca i32
  %val = alloca ptr
  store ptr %p_p, ptr %p
  store i32 %p_t, ptr %t
  store ptr %p_val, ptr %val
  %t977 = load ptr, ptr %p
  %t978 = load i32, ptr %t
  %t979 = load ptr, ptr %val
  %t980 = call i1 @parser_check_val(ptr %t977, i32 %t978, ptr %t979)
  br i1 %t980, label %label_591, label %label_593
label_591:
  %t981 = load ptr, ptr %p
  call void @parser_advance(ptr %t981)
  ret i1 1
label_593:
  ret i1 0
}

define void @parser_expect(ptr %p_p, i32 %p_t, ptr %p_context) {
  %p = alloca ptr
  %t = alloca i32
  %context = alloca ptr
  store ptr %p_p, ptr %p
  store i32 %p_t, ptr %t
  store ptr %p_context, ptr %context
  %t985 = load ptr, ptr %p
  %t986 = load i32, ptr %t
  %t987 = call i1 @parser_check(ptr %t985, i32 %t986)
  %t988 = icmp eq i1 %t987, 0
  br i1 %t988, label %label_594, label %label_596
label_594:
  %t989 = getelementptr inbounds [10 x i8], ptr @.str.s64, i64 0, i64 0
  call void @print(ptr %t989)
  %t990 = load ptr, ptr %context
  call void @print(ptr %t990)
  %t991 = getelementptr inbounds [23 x i8], ptr @.str.s65, i64 0, i64 0
  call void @print(ptr %t991)
  %t992 = load i32, ptr %t
  call void @println_int(i32 %t992)
  call void @exit(i32 1)
  br label %label_596
label_596:
  %t993 = load ptr, ptr %p
  call void @parser_advance(ptr %t993)
  ret void
}

define void @parser_expect_val(ptr %p_p, i32 %p_t, ptr %p_val, ptr %p_context) {
  %p = alloca ptr
  %t = alloca i32
  %val = alloca ptr
  %context = alloca ptr
  store ptr %p_p, ptr %p
  store i32 %p_t, ptr %t
  store ptr %p_val, ptr %val
  store ptr %p_context, ptr %context
  %t998 = load ptr, ptr %p
  %t999 = load i32, ptr %t
  %t1000 = load ptr, ptr %val
  %t1001 = call i1 @parser_check_val(ptr %t998, i32 %t999, ptr %t1000)
  %t1002 = icmp eq i1 %t1001, 0
  br i1 %t1002, label %label_597, label %label_599
label_597:
  %t1003 = getelementptr inbounds [10 x i8], ptr @.str.s66, i64 0, i64 0
  call void @print(ptr %t1003)
  %t1004 = load ptr, ptr %context
  call void @print(ptr %t1004)
  %t1005 = getelementptr inbounds [19 x i8], ptr @.str.s67, i64 0, i64 0
  call void @print(ptr %t1005)
  %t1006 = load ptr, ptr %val
  call void @print(ptr %t1006)
  %t1007 = getelementptr inbounds [2 x i8], ptr @.str.s68, i64 0, i64 0
  call void @println(ptr %t1007)
  call void @exit(i32 1)
  br label %label_599
label_599:
  %t1008 = load ptr, ptr %p
  call void @parser_advance(ptr %t1008)
  ret void
}

define ptr @parse_import_statement(ptr %p_p) {
  %p = alloca ptr
  %import_node = alloca ptr
  %curr = alloca ptr
  store ptr %p_p, ptr %p
  %t1012 = load ptr, ptr %p
  %t1013 = getelementptr inbounds [7 x i8], ptr @.str.s69, i64 0, i64 0
  %t1014 = getelementptr inbounds [17 x i8], ptr @.str.s70, i64 0, i64 0
  call void @parser_expect_val(ptr %t1012, i32 16, ptr %t1013, ptr %t1014)
  %t1015 = call ptr @create_node(i32 1)
  store ptr %t1015, ptr %import_node
  %t1016 = load ptr, ptr %p
  %t1017 = call ptr @parser_current(ptr %t1016)
  store ptr %t1017, ptr %curr
  %t1018 = load ptr, ptr %import_node
  %t1019 = load ptr, ptr %curr
  %t1020 = getelementptr inbounds %Token, ptr %t1019, i32 0, i32 1
  %t1021 = load ptr, ptr %t1020
  %t1022 = getelementptr inbounds %ASTNode, ptr %t1018, i32 0, i32 1
  store ptr %t1021, ptr %t1022
  %t1023 = load ptr, ptr %curr
  %t1024 = getelementptr inbounds %Token, ptr %t1023, i32 0, i32 0
  %t1025 = load i32, ptr %t1024
  %t1026 = icmp eq i32 %t1025, 4
  %t1027 = load ptr, ptr %curr
  %t1028 = getelementptr inbounds %Token, ptr %t1027, i32 0, i32 0
  %t1029 = load i32, ptr %t1028
  %t1030 = icmp eq i32 %t1029, 16
  %t1031 = or i1 %t1026, %t1030
  br i1 %t1031, label %label_600, label %label_601
label_600:
  %t1032 = load ptr, ptr %p
  call void @parser_advance(ptr %t1032)
  br label %label_602
label_601:
  %t1033 = getelementptr inbounds [21 x i8], ptr @.str.s71, i64 0, i64 0
  call void @println(ptr %t1033)
  call void @exit(i32 1)
  br label %label_602
label_602:
  %t1034 = load ptr, ptr %import_node
  ret ptr %t1034
}

define ptr @parse_declaration(ptr %p_p) {
  %p = alloca ptr
  store ptr %p_p, ptr %p
  %t1036 = load ptr, ptr %p
  %t1037 = getelementptr inbounds [7 x i8], ptr @.str.s72, i64 0, i64 0
  %t1038 = call i1 @parser_check_val(ptr %t1036, i32 16, ptr %t1037)
  br i1 %t1038, label %label_603, label %label_605
label_603:
  %t1039 = load ptr, ptr %p
  %t1040 = call ptr @parse_import_statement(ptr %t1039)
  ret ptr %t1040
label_605:
  %t1041 = load ptr, ptr %p
  %t1042 = getelementptr inbounds [4 x i8], ptr @.str.s73, i64 0, i64 0
  %t1043 = call i1 @parser_check_val(ptr %t1041, i32 16, ptr %t1042)
  br i1 %t1043, label %label_606, label %label_608
label_606:
  %t1044 = load ptr, ptr %p
  %t1045 = call ptr @parse_variable_decl(ptr %t1044)
  ret ptr %t1045
label_608:
  %t1046 = load ptr, ptr %p
  %t1047 = getelementptr inbounds [7 x i8], ptr @.str.s74, i64 0, i64 0
  %t1048 = call i1 @parser_check_val(ptr %t1046, i32 16, ptr %t1047)
  br i1 %t1048, label %label_609, label %label_611
label_609:
  %t1049 = load ptr, ptr %p
  %t1050 = call ptr @parse_extern_fn_decl(ptr %t1049)
  ret ptr %t1050
label_611:
  %t1051 = load ptr, ptr %p
  %t1052 = getelementptr inbounds [3 x i8], ptr @.str.s75, i64 0, i64 0
  %t1053 = call i1 @parser_check_val(ptr %t1051, i32 16, ptr %t1052)
  br i1 %t1053, label %label_612, label %label_614
label_612:
  %t1054 = load ptr, ptr %p
  %t1055 = call ptr @parse_function_decl(ptr %t1054)
  ret ptr %t1055
label_614:
  %t1056 = load ptr, ptr %p
  %t1057 = getelementptr inbounds [7 x i8], ptr @.str.s76, i64 0, i64 0
  %t1058 = call i1 @parser_check_val(ptr %t1056, i32 16, ptr %t1057)
  br i1 %t1058, label %label_615, label %label_617
label_615:
  %t1059 = load ptr, ptr %p
  %t1060 = call ptr @parse_struct_decl(ptr %t1059)
  ret ptr %t1060
label_617:
  %t1061 = load ptr, ptr %p
  %t1062 = getelementptr inbounds [5 x i8], ptr @.str.s77, i64 0, i64 0
  %t1063 = call i1 @parser_check_val(ptr %t1061, i32 16, ptr %t1062)
  br i1 %t1063, label %label_618, label %label_620
label_618:
  %t1064 = load ptr, ptr %p
  %t1065 = call ptr @parse_enum_decl(ptr %t1064)
  ret ptr %t1065
label_620:
  %t1066 = getelementptr inbounds [20 x i8], ptr @.str.s78, i64 0, i64 0
  call void @println(ptr %t1066)
  call void @exit(i32 1)
  %t1067 = call ptr @create_node(i32 0)
  ret ptr %t1067
}

define ptr @parse_type_annotation(ptr %p_p) {
  %p = alloca ptr
  %type_node = alloca ptr
  %curr = alloca ptr
  store ptr %p_p, ptr %p
  %t1071 = call ptr @create_node(i32 30)
  store ptr %t1071, ptr %type_node
  %t1072 = load ptr, ptr %p
  %t1073 = getelementptr inbounds [2 x i8], ptr @.str.s79, i64 0, i64 0
  %t1074 = call i1 @parser_match_val(ptr %t1072, i32 5, ptr %t1073)
  br i1 %t1074, label %label_621, label %label_623
label_621:
  %t1075 = load ptr, ptr %type_node
  %t1076 = getelementptr inbounds %ASTNode, ptr %t1075, i32 0, i32 3
  store i32 1, ptr %t1076
  %t1077 = load ptr, ptr %type_node
  %t1078 = load ptr, ptr %p
  %t1079 = call ptr @parse_type_annotation(ptr %t1078)
  %t1080 = call ptr @node_to_ptr(ptr %t1079)
  %t1081 = getelementptr inbounds %ASTNode, ptr %t1077, i32 0, i32 5
  store ptr %t1080, ptr %t1081
  %t1082 = load ptr, ptr %p
  %t1083 = getelementptr inbounds [2 x i8], ptr @.str.s80, i64 0, i64 0
  %t1084 = getelementptr inbounds [11 x i8], ptr @.str.s81, i64 0, i64 0
  call void @parser_expect_val(ptr %t1082, i32 5, ptr %t1083, ptr %t1084)
  %t1085 = load ptr, ptr %type_node
  ret ptr %t1085
label_623:
  %t1086 = load ptr, ptr %p
  %t1087 = call ptr @parser_current(ptr %t1086)
  store ptr %t1087, ptr %curr
  %t1088 = load ptr, ptr %curr
  %t1089 = getelementptr inbounds %Token, ptr %t1088, i32 0, i32 0
  %t1090 = load i32, ptr %t1089
  %t1091 = icmp eq i32 %t1090, 4
  %t1092 = load ptr, ptr %curr
  %t1093 = getelementptr inbounds %Token, ptr %t1092, i32 0, i32 0
  %t1094 = load i32, ptr %t1093
  %t1095 = icmp eq i32 %t1094, 16
  %t1096 = or i1 %t1091, %t1095
  br i1 %t1096, label %label_624, label %label_625
label_624:
  %t1097 = load ptr, ptr %type_node
  %t1098 = load ptr, ptr %curr
  %t1099 = getelementptr inbounds %Token, ptr %t1098, i32 0, i32 1
  %t1100 = load ptr, ptr %t1099
  %t1101 = getelementptr inbounds %ASTNode, ptr %t1097, i32 0, i32 1
  store ptr %t1100, ptr %t1101
  %t1102 = load ptr, ptr %p
  call void @parser_advance(ptr %t1102)
  br label %label_626
label_625:
  %t1103 = getelementptr inbounds [19 x i8], ptr @.str.s82, i64 0, i64 0
  call void @println(ptr %t1103)
  call void @exit(i32 1)
  br label %label_626
label_626:
  %t1104 = load ptr, ptr %type_node
  ret ptr %t1104
}

define ptr @parse_variable_decl(ptr %p_p) {
  %p = alloca ptr
  %var_node = alloca ptr
  %curr = alloca ptr
  store ptr %p_p, ptr %p
  %t1108 = load ptr, ptr %p
  %t1109 = getelementptr inbounds [4 x i8], ptr @.str.s83, i64 0, i64 0
  %t1110 = getelementptr inbounds [21 x i8], ptr @.str.s84, i64 0, i64 0
  call void @parser_expect_val(ptr %t1108, i32 16, ptr %t1109, ptr %t1110)
  %t1111 = call ptr @create_node(i32 3)
  store ptr %t1111, ptr %var_node
  %t1112 = load ptr, ptr %p
  %t1113 = getelementptr inbounds [4 x i8], ptr @.str.s85, i64 0, i64 0
  %t1114 = call i1 @parser_match_val(ptr %t1112, i32 16, ptr %t1113)
  br i1 %t1114, label %label_627, label %label_629
label_627:
  %t1115 = load ptr, ptr %var_node
  %t1116 = getelementptr inbounds %ASTNode, ptr %t1115, i32 0, i32 3
  store i32 1, ptr %t1116
  br label %label_629
label_629:
  %t1117 = load ptr, ptr %p
  %t1118 = call ptr @parser_current(ptr %t1117)
  store ptr %t1118, ptr %curr
  %t1119 = load ptr, ptr %var_node
  %t1120 = load ptr, ptr %curr
  %t1121 = getelementptr inbounds %Token, ptr %t1120, i32 0, i32 1
  %t1122 = load ptr, ptr %t1121
  %t1123 = getelementptr inbounds %ASTNode, ptr %t1119, i32 0, i32 1
  store ptr %t1122, ptr %t1123
  %t1124 = load ptr, ptr %p
  %t1125 = getelementptr inbounds [14 x i8], ptr @.str.s86, i64 0, i64 0
  call void @parser_expect(ptr %t1124, i32 4, ptr %t1125)
  %t1126 = load ptr, ptr %p
  %t1127 = getelementptr inbounds [2 x i8], ptr @.str.s87, i64 0, i64 0
  %t1128 = call i1 @parser_match_val(ptr %t1126, i32 5, ptr %t1127)
  br i1 %t1128, label %label_630, label %label_632
label_630:
  %t1129 = load ptr, ptr %var_node
  %t1130 = load ptr, ptr %p
  %t1131 = call ptr @parse_type_annotation(ptr %t1130)
  %t1132 = call ptr @node_to_ptr(ptr %t1131)
  %t1133 = getelementptr inbounds %ASTNode, ptr %t1129, i32 0, i32 5
  store ptr %t1132, ptr %t1133
  br label %label_632
label_632:
  %t1134 = load ptr, ptr %p
  %t1135 = getelementptr inbounds [2 x i8], ptr @.str.s88, i64 0, i64 0
  %t1136 = call i1 @parser_match_val(ptr %t1134, i32 11, ptr %t1135)
  br i1 %t1136, label %label_633, label %label_635
label_633:
  %t1137 = load ptr, ptr %var_node
  %t1138 = load ptr, ptr %p
  %t1139 = call ptr @parse_expression(ptr %t1138, i32 0)
  %t1140 = call ptr @node_to_ptr(ptr %t1139)
  %t1141 = getelementptr inbounds %ASTNode, ptr %t1137, i32 0, i32 6
  store ptr %t1140, ptr %t1141
  br label %label_635
label_635:
  %t1142 = load ptr, ptr %var_node
  ret ptr %t1142
}

define ptr @parse_extern_fn_decl(ptr %p_p) {
  %p = alloca ptr
  %ext_node = alloca ptr
  %curr = alloca ptr
  %last_param = alloca ptr
  %is_looping = alloca i1
  %param = alloca ptr
  %last = alloca ptr
  store ptr %p_p, ptr %p
  %t1147 = load ptr, ptr %p
  %t1148 = getelementptr inbounds [7 x i8], ptr @.str.s89, i64 0, i64 0
  %t1149 = getelementptr inbounds [10 x i8], ptr @.str.s90, i64 0, i64 0
  call void @parser_expect_val(ptr %t1147, i32 16, ptr %t1148, ptr %t1149)
  %t1150 = load ptr, ptr %p
  %t1151 = getelementptr inbounds [3 x i8], ptr @.str.s91, i64 0, i64 0
  %t1152 = getelementptr inbounds [10 x i8], ptr @.str.s92, i64 0, i64 0
  call void @parser_expect_val(ptr %t1150, i32 16, ptr %t1151, ptr %t1152)
  %t1153 = call ptr @create_node(i32 2)
  store ptr %t1153, ptr %ext_node
  %t1154 = load ptr, ptr %p
  %t1155 = call ptr @parser_current(ptr %t1154)
  store ptr %t1155, ptr %curr
  %t1156 = load ptr, ptr %ext_node
  %t1157 = load ptr, ptr %curr
  %t1158 = getelementptr inbounds %Token, ptr %t1157, i32 0, i32 1
  %t1159 = load ptr, ptr %t1158
  %t1160 = getelementptr inbounds %ASTNode, ptr %t1156, i32 0, i32 1
  store ptr %t1159, ptr %t1160
  %t1161 = load ptr, ptr %p
  %t1162 = getelementptr inbounds [14 x i8], ptr @.str.s93, i64 0, i64 0
  call void @parser_expect(ptr %t1161, i32 4, ptr %t1162)
  %t1163 = load ptr, ptr %p
  %t1164 = getelementptr inbounds [2 x i8], ptr @.str.s94, i64 0, i64 0
  %t1165 = getelementptr inbounds [7 x i8], ptr @.str.s95, i64 0, i64 0
  call void @parser_expect_val(ptr %t1163, i32 5, ptr %t1164, ptr %t1165)
  %t1166 = getelementptr inbounds [1 x i8], ptr @.str.s96, i64 0, i64 0
  store ptr %t1166, ptr %last_param
  %t1167 = load ptr, ptr %p
  %t1168 = getelementptr inbounds [2 x i8], ptr @.str.s97, i64 0, i64 0
  %t1169 = call i1 @parser_check_val(ptr %t1167, i32 5, ptr %t1168)
  %t1170 = icmp eq i1 %t1169, 0
  br i1 %t1170, label %label_636, label %label_638
label_636:
  store i1 1, ptr %is_looping
  br label %label_639
label_639:
  %t1172 = load i1, ptr %is_looping
  br i1 %t1172, label %label_640, label %label_641
label_640:
  %t1174 = call ptr @create_node(i32 29)
  store ptr %t1174, ptr %param
  %t1175 = load ptr, ptr %p
  %t1176 = call ptr @parser_current(ptr %t1175)
  store ptr %t1176, ptr %curr
  %t1177 = load ptr, ptr %param
  %t1178 = load ptr, ptr %curr
  %t1179 = getelementptr inbounds %Token, ptr %t1178, i32 0, i32 1
  %t1180 = load ptr, ptr %t1179
  %t1181 = getelementptr inbounds %ASTNode, ptr %t1177, i32 0, i32 1
  store ptr %t1180, ptr %t1181
  %t1182 = load ptr, ptr %p
  %t1183 = getelementptr inbounds [15 x i8], ptr @.str.s98, i64 0, i64 0
  call void @parser_expect(ptr %t1182, i32 4, ptr %t1183)
  %t1184 = load ptr, ptr %p
  %t1185 = getelementptr inbounds [2 x i8], ptr @.str.s99, i64 0, i64 0
  %t1186 = getelementptr inbounds [15 x i8], ptr @.str.s100, i64 0, i64 0
  call void @parser_expect_val(ptr %t1184, i32 5, ptr %t1185, ptr %t1186)
  %t1187 = load ptr, ptr %param
  %t1188 = load ptr, ptr %p
  %t1189 = call ptr @parse_type_annotation(ptr %t1188)
  %t1190 = call ptr @node_to_ptr(ptr %t1189)
  %t1191 = getelementptr inbounds %ASTNode, ptr %t1187, i32 0, i32 5
  store ptr %t1190, ptr %t1191
  %t1192 = load ptr, ptr %ext_node
  %t1193 = getelementptr inbounds %ASTNode, ptr %t1192, i32 0, i32 5
  %t1194 = load ptr, ptr %t1193
  %t1195 = getelementptr inbounds [1 x i8], ptr @.str.s101, i64 0, i64 0
  %t1196 = call i32 @str_equals(ptr %t1194, ptr %t1195)
  %t1197 = icmp eq i32 %t1196, 1
  br i1 %t1197, label %label_642, label %label_643
label_642:
  %t1198 = load ptr, ptr %ext_node
  %t1199 = load ptr, ptr %param
  %t1200 = call ptr @node_to_ptr(ptr %t1199)
  %t1201 = getelementptr inbounds %ASTNode, ptr %t1198, i32 0, i32 5
  store ptr %t1200, ptr %t1201
  br label %label_644
label_643:
  %t1203 = load ptr, ptr %last_param
  %t1204 = call ptr @ptr_to_node(ptr %t1203)
  store ptr %t1204, ptr %last
  %t1205 = load ptr, ptr %last
  %t1206 = load ptr, ptr %param
  %t1207 = call ptr @node_to_ptr(ptr %t1206)
  %t1208 = getelementptr inbounds %ASTNode, ptr %t1205, i32 0, i32 8
  store ptr %t1207, ptr %t1208
  br label %label_644
label_644:
  %t1209 = load ptr, ptr %param
  %t1210 = call ptr @node_to_ptr(ptr %t1209)
  store ptr %t1210, ptr %last_param
  %t1211 = load ptr, ptr %p
  %t1212 = getelementptr inbounds [2 x i8], ptr @.str.s102, i64 0, i64 0
  %t1213 = call i1 @parser_match_val(ptr %t1211, i32 5, ptr %t1212)
  %t1214 = icmp eq i1 %t1213, 0
  br i1 %t1214, label %label_645, label %label_647
label_645:
  store i1 0, ptr %is_looping
  br label %label_647
label_647:
  br label %label_639
label_641:
  br label %label_638
label_638:
  %t1215 = load ptr, ptr %p
  %t1216 = getelementptr inbounds [2 x i8], ptr @.str.s103, i64 0, i64 0
  %t1217 = getelementptr inbounds [7 x i8], ptr @.str.s104, i64 0, i64 0
  call void @parser_expect_val(ptr %t1215, i32 5, ptr %t1216, ptr %t1217)
  %t1218 = load ptr, ptr %p
  %t1219 = getelementptr inbounds [3 x i8], ptr @.str.s105, i64 0, i64 0
  %t1220 = call i1 @parser_match_val(ptr %t1218, i32 14, ptr %t1219)
  br i1 %t1220, label %label_648, label %label_650
label_648:
  %t1221 = load ptr, ptr %ext_node
  %t1222 = load ptr, ptr %p
  %t1223 = call ptr @parse_type_annotation(ptr %t1222)
  %t1224 = call ptr @node_to_ptr(ptr %t1223)
  %t1225 = getelementptr inbounds %ASTNode, ptr %t1221, i32 0, i32 6
  store ptr %t1224, ptr %t1225
  br label %label_650
label_650:
  %t1226 = load ptr, ptr %ext_node
  ret ptr %t1226
}

define ptr @parse_function_decl(ptr %p_p) {
  %p = alloca ptr
  %fn_node = alloca ptr
  %curr = alloca ptr
  %last_param = alloca ptr
  %is_looping = alloca i1
  %param = alloca ptr
  %last = alloca ptr
  store ptr %p_p, ptr %p
  %t1231 = load ptr, ptr %p
  %t1232 = getelementptr inbounds [3 x i8], ptr @.str.s106, i64 0, i64 0
  %t1233 = getelementptr inbounds [9 x i8], ptr @.str.s107, i64 0, i64 0
  call void @parser_expect_val(ptr %t1231, i32 16, ptr %t1232, ptr %t1233)
  %t1234 = call ptr @create_node(i32 4)
  store ptr %t1234, ptr %fn_node
  %t1235 = load ptr, ptr %p
  %t1236 = call ptr @parser_current(ptr %t1235)
  store ptr %t1236, ptr %curr
  %t1237 = load ptr, ptr %fn_node
  %t1238 = load ptr, ptr %curr
  %t1239 = getelementptr inbounds %Token, ptr %t1238, i32 0, i32 1
  %t1240 = load ptr, ptr %t1239
  %t1241 = getelementptr inbounds %ASTNode, ptr %t1237, i32 0, i32 1
  store ptr %t1240, ptr %t1241
  %t1242 = load ptr, ptr %p
  %t1243 = getelementptr inbounds [14 x i8], ptr @.str.s108, i64 0, i64 0
  call void @parser_expect(ptr %t1242, i32 4, ptr %t1243)
  %t1244 = load ptr, ptr %p
  %t1245 = getelementptr inbounds [2 x i8], ptr @.str.s109, i64 0, i64 0
  %t1246 = getelementptr inbounds [7 x i8], ptr @.str.s110, i64 0, i64 0
  call void @parser_expect_val(ptr %t1244, i32 5, ptr %t1245, ptr %t1246)
  %t1247 = getelementptr inbounds [1 x i8], ptr @.str.s111, i64 0, i64 0
  store ptr %t1247, ptr %last_param
  %t1248 = load ptr, ptr %p
  %t1249 = getelementptr inbounds [2 x i8], ptr @.str.s112, i64 0, i64 0
  %t1250 = call i1 @parser_check_val(ptr %t1248, i32 5, ptr %t1249)
  %t1251 = icmp eq i1 %t1250, 0
  br i1 %t1251, label %label_651, label %label_653
label_651:
  store i1 1, ptr %is_looping
  br label %label_654
label_654:
  %t1253 = load i1, ptr %is_looping
  br i1 %t1253, label %label_655, label %label_656
label_655:
  %t1255 = call ptr @create_node(i32 29)
  store ptr %t1255, ptr %param
  %t1256 = load ptr, ptr %p
  %t1257 = call ptr @parser_current(ptr %t1256)
  store ptr %t1257, ptr %curr
  %t1258 = load ptr, ptr %param
  %t1259 = load ptr, ptr %curr
  %t1260 = getelementptr inbounds %Token, ptr %t1259, i32 0, i32 1
  %t1261 = load ptr, ptr %t1260
  %t1262 = getelementptr inbounds %ASTNode, ptr %t1258, i32 0, i32 1
  store ptr %t1261, ptr %t1262
  %t1263 = load ptr, ptr %p
  %t1264 = getelementptr inbounds [15 x i8], ptr @.str.s113, i64 0, i64 0
  call void @parser_expect(ptr %t1263, i32 4, ptr %t1264)
  %t1265 = load ptr, ptr %p
  %t1266 = getelementptr inbounds [2 x i8], ptr @.str.s114, i64 0, i64 0
  %t1267 = getelementptr inbounds [15 x i8], ptr @.str.s115, i64 0, i64 0
  call void @parser_expect_val(ptr %t1265, i32 5, ptr %t1266, ptr %t1267)
  %t1268 = load ptr, ptr %param
  %t1269 = load ptr, ptr %p
  %t1270 = call ptr @parse_type_annotation(ptr %t1269)
  %t1271 = call ptr @node_to_ptr(ptr %t1270)
  %t1272 = getelementptr inbounds %ASTNode, ptr %t1268, i32 0, i32 5
  store ptr %t1271, ptr %t1272
  %t1273 = load ptr, ptr %fn_node
  %t1274 = getelementptr inbounds %ASTNode, ptr %t1273, i32 0, i32 5
  %t1275 = load ptr, ptr %t1274
  %t1276 = getelementptr inbounds [1 x i8], ptr @.str.s116, i64 0, i64 0
  %t1277 = call i32 @str_equals(ptr %t1275, ptr %t1276)
  %t1278 = icmp eq i32 %t1277, 1
  br i1 %t1278, label %label_657, label %label_658
label_657:
  %t1279 = load ptr, ptr %fn_node
  %t1280 = load ptr, ptr %param
  %t1281 = call ptr @node_to_ptr(ptr %t1280)
  %t1282 = getelementptr inbounds %ASTNode, ptr %t1279, i32 0, i32 5
  store ptr %t1281, ptr %t1282
  br label %label_659
label_658:
  %t1284 = load ptr, ptr %last_param
  %t1285 = call ptr @ptr_to_node(ptr %t1284)
  store ptr %t1285, ptr %last
  %t1286 = load ptr, ptr %last
  %t1287 = load ptr, ptr %param
  %t1288 = call ptr @node_to_ptr(ptr %t1287)
  %t1289 = getelementptr inbounds %ASTNode, ptr %t1286, i32 0, i32 8
  store ptr %t1288, ptr %t1289
  br label %label_659
label_659:
  %t1290 = load ptr, ptr %param
  %t1291 = call ptr @node_to_ptr(ptr %t1290)
  store ptr %t1291, ptr %last_param
  %t1292 = load ptr, ptr %p
  %t1293 = getelementptr inbounds [2 x i8], ptr @.str.s117, i64 0, i64 0
  %t1294 = call i1 @parser_match_val(ptr %t1292, i32 5, ptr %t1293)
  %t1295 = icmp eq i1 %t1294, 0
  br i1 %t1295, label %label_660, label %label_662
label_660:
  store i1 0, ptr %is_looping
  br label %label_662
label_662:
  br label %label_654
label_656:
  br label %label_653
label_653:
  %t1296 = load ptr, ptr %p
  %t1297 = getelementptr inbounds [2 x i8], ptr @.str.s118, i64 0, i64 0
  %t1298 = getelementptr inbounds [7 x i8], ptr @.str.s119, i64 0, i64 0
  call void @parser_expect_val(ptr %t1296, i32 5, ptr %t1297, ptr %t1298)
  %t1299 = load ptr, ptr %p
  %t1300 = getelementptr inbounds [3 x i8], ptr @.str.s120, i64 0, i64 0
  %t1301 = call i1 @parser_match_val(ptr %t1299, i32 14, ptr %t1300)
  br i1 %t1301, label %label_663, label %label_665
label_663:
  %t1302 = load ptr, ptr %fn_node
  %t1303 = load ptr, ptr %p
  %t1304 = call ptr @parse_type_annotation(ptr %t1303)
  %t1305 = call ptr @node_to_ptr(ptr %t1304)
  %t1306 = getelementptr inbounds %ASTNode, ptr %t1302, i32 0, i32 7
  store ptr %t1305, ptr %t1306
  br label %label_665
label_665:
  %t1307 = load ptr, ptr %fn_node
  %t1308 = load ptr, ptr %p
  %t1309 = call ptr @parse_block(ptr %t1308)
  %t1310 = call ptr @node_to_ptr(ptr %t1309)
  %t1311 = getelementptr inbounds %ASTNode, ptr %t1307, i32 0, i32 6
  store ptr %t1310, ptr %t1311
  %t1312 = load ptr, ptr %fn_node
  ret ptr %t1312
}

define ptr @parse_struct_decl(ptr %p_p) {
  %p = alloca ptr
  %struct_node = alloca ptr
  %curr = alloca ptr
  %last_field = alloca ptr
  %field = alloca ptr
  %last = alloca ptr
  store ptr %p_p, ptr %p
  %t1317 = load ptr, ptr %p
  %t1318 = getelementptr inbounds [7 x i8], ptr @.str.s121, i64 0, i64 0
  %t1319 = getelementptr inbounds [7 x i8], ptr @.str.s122, i64 0, i64 0
  call void @parser_expect_val(ptr %t1317, i32 16, ptr %t1318, ptr %t1319)
  %t1320 = call ptr @create_node(i32 5)
  store ptr %t1320, ptr %struct_node
  %t1321 = load ptr, ptr %p
  %t1322 = call ptr @parser_current(ptr %t1321)
  store ptr %t1322, ptr %curr
  %t1323 = load ptr, ptr %struct_node
  %t1324 = load ptr, ptr %curr
  %t1325 = getelementptr inbounds %Token, ptr %t1324, i32 0, i32 1
  %t1326 = load ptr, ptr %t1325
  %t1327 = getelementptr inbounds %ASTNode, ptr %t1323, i32 0, i32 1
  store ptr %t1326, ptr %t1327
  %t1328 = load ptr, ptr %p
  %t1329 = getelementptr inbounds [12 x i8], ptr @.str.s123, i64 0, i64 0
  call void @parser_expect(ptr %t1328, i32 4, ptr %t1329)
  %t1330 = load ptr, ptr %p
  %t1331 = getelementptr inbounds [2 x i8], ptr @.str.s124, i64 0, i64 0
  %t1332 = getelementptr inbounds [12 x i8], ptr @.str.s125, i64 0, i64 0
  call void @parser_expect_val(ptr %t1330, i32 5, ptr %t1331, ptr %t1332)
  %t1333 = getelementptr inbounds [1 x i8], ptr @.str.s126, i64 0, i64 0
  store ptr %t1333, ptr %last_field
  br label %label_666
label_666:
  %t1334 = load ptr, ptr %p
  %t1335 = getelementptr inbounds [2 x i8], ptr @.str.s127, i64 0, i64 0
  %t1336 = call i1 @parser_check_val(ptr %t1334, i32 5, ptr %t1335)
  %t1337 = icmp eq i1 %t1336, 0
  br i1 %t1337, label %label_667, label %label_668
label_667:
  %t1339 = call ptr @create_node(i32 31)
  store ptr %t1339, ptr %field
  %t1340 = load ptr, ptr %p
  %t1341 = call ptr @parser_current(ptr %t1340)
  store ptr %t1341, ptr %curr
  %t1342 = load ptr, ptr %field
  %t1343 = load ptr, ptr %curr
  %t1344 = getelementptr inbounds %Token, ptr %t1343, i32 0, i32 1
  %t1345 = load ptr, ptr %t1344
  %t1346 = getelementptr inbounds %ASTNode, ptr %t1342, i32 0, i32 1
  store ptr %t1345, ptr %t1346
  %t1347 = load ptr, ptr %p
  %t1348 = getelementptr inbounds [11 x i8], ptr @.str.s128, i64 0, i64 0
  call void @parser_expect(ptr %t1347, i32 4, ptr %t1348)
  %t1349 = load ptr, ptr %p
  %t1350 = getelementptr inbounds [2 x i8], ptr @.str.s129, i64 0, i64 0
  %t1351 = getelementptr inbounds [11 x i8], ptr @.str.s130, i64 0, i64 0
  call void @parser_expect_val(ptr %t1349, i32 5, ptr %t1350, ptr %t1351)
  %t1352 = load ptr, ptr %field
  %t1353 = load ptr, ptr %p
  %t1354 = call ptr @parse_type_annotation(ptr %t1353)
  %t1355 = call ptr @node_to_ptr(ptr %t1354)
  %t1356 = getelementptr inbounds %ASTNode, ptr %t1352, i32 0, i32 5
  store ptr %t1355, ptr %t1356
  %t1357 = load ptr, ptr %struct_node
  %t1358 = getelementptr inbounds %ASTNode, ptr %t1357, i32 0, i32 5
  %t1359 = load ptr, ptr %t1358
  %t1360 = getelementptr inbounds [1 x i8], ptr @.str.s131, i64 0, i64 0
  %t1361 = call i32 @str_equals(ptr %t1359, ptr %t1360)
  %t1362 = icmp eq i32 %t1361, 1
  br i1 %t1362, label %label_669, label %label_670
label_669:
  %t1363 = load ptr, ptr %struct_node
  %t1364 = load ptr, ptr %field
  %t1365 = call ptr @node_to_ptr(ptr %t1364)
  %t1366 = getelementptr inbounds %ASTNode, ptr %t1363, i32 0, i32 5
  store ptr %t1365, ptr %t1366
  br label %label_671
label_670:
  %t1368 = load ptr, ptr %last_field
  %t1369 = call ptr @ptr_to_node(ptr %t1368)
  store ptr %t1369, ptr %last
  %t1370 = load ptr, ptr %last
  %t1371 = load ptr, ptr %field
  %t1372 = call ptr @node_to_ptr(ptr %t1371)
  %t1373 = getelementptr inbounds %ASTNode, ptr %t1370, i32 0, i32 8
  store ptr %t1372, ptr %t1373
  br label %label_671
label_671:
  %t1374 = load ptr, ptr %field
  %t1375 = call ptr @node_to_ptr(ptr %t1374)
  store ptr %t1375, ptr %last_field
  %t1376 = load ptr, ptr %p
  %t1377 = getelementptr inbounds [2 x i8], ptr @.str.s132, i64 0, i64 0
  %t1378 = call i1 @parser_match_val(ptr %t1376, i32 5, ptr %t1377)
  br label %label_666
label_668:
  %t1379 = load ptr, ptr %p
  %t1380 = getelementptr inbounds [2 x i8], ptr @.str.s133, i64 0, i64 0
  %t1381 = getelementptr inbounds [12 x i8], ptr @.str.s134, i64 0, i64 0
  call void @parser_expect_val(ptr %t1379, i32 5, ptr %t1380, ptr %t1381)
  %t1382 = load ptr, ptr %struct_node
  ret ptr %t1382
}

define ptr @parse_enum_decl(ptr %p_p) {
  %p = alloca ptr
  %enum_node = alloca ptr
  %curr = alloca ptr
  %last_var = alloca ptr
  %variant = alloca ptr
  %last = alloca ptr
  store ptr %p_p, ptr %p
  %t1387 = load ptr, ptr %p
  %t1388 = getelementptr inbounds [5 x i8], ptr @.str.s135, i64 0, i64 0
  %t1389 = getelementptr inbounds [5 x i8], ptr @.str.s136, i64 0, i64 0
  call void @parser_expect_val(ptr %t1387, i32 16, ptr %t1388, ptr %t1389)
  %t1390 = call ptr @create_node(i32 6)
  store ptr %t1390, ptr %enum_node
  %t1391 = load ptr, ptr %p
  %t1392 = call ptr @parser_current(ptr %t1391)
  store ptr %t1392, ptr %curr
  %t1393 = load ptr, ptr %enum_node
  %t1394 = load ptr, ptr %curr
  %t1395 = getelementptr inbounds %Token, ptr %t1394, i32 0, i32 1
  %t1396 = load ptr, ptr %t1395
  %t1397 = getelementptr inbounds %ASTNode, ptr %t1393, i32 0, i32 1
  store ptr %t1396, ptr %t1397
  %t1398 = load ptr, ptr %p
  %t1399 = getelementptr inbounds [10 x i8], ptr @.str.s137, i64 0, i64 0
  call void @parser_expect(ptr %t1398, i32 4, ptr %t1399)
  %t1400 = load ptr, ptr %p
  %t1401 = getelementptr inbounds [2 x i8], ptr @.str.s138, i64 0, i64 0
  %t1402 = getelementptr inbounds [10 x i8], ptr @.str.s139, i64 0, i64 0
  call void @parser_expect_val(ptr %t1400, i32 5, ptr %t1401, ptr %t1402)
  %t1403 = getelementptr inbounds [1 x i8], ptr @.str.s140, i64 0, i64 0
  store ptr %t1403, ptr %last_var
  br label %label_672
label_672:
  %t1404 = load ptr, ptr %p
  %t1405 = getelementptr inbounds [2 x i8], ptr @.str.s141, i64 0, i64 0
  %t1406 = call i1 @parser_check_val(ptr %t1404, i32 5, ptr %t1405)
  %t1407 = icmp eq i1 %t1406, 0
  br i1 %t1407, label %label_673, label %label_674
label_673:
  %t1409 = call ptr @create_node(i32 32)
  store ptr %t1409, ptr %variant
  %t1410 = load ptr, ptr %p
  %t1411 = call ptr @parser_current(ptr %t1410)
  store ptr %t1411, ptr %curr
  %t1412 = load ptr, ptr %variant
  %t1413 = load ptr, ptr %curr
  %t1414 = getelementptr inbounds %Token, ptr %t1413, i32 0, i32 1
  %t1415 = load ptr, ptr %t1414
  %t1416 = getelementptr inbounds %ASTNode, ptr %t1412, i32 0, i32 1
  store ptr %t1415, ptr %t1416
  %t1417 = load ptr, ptr %p
  %t1418 = getelementptr inbounds [13 x i8], ptr @.str.s142, i64 0, i64 0
  call void @parser_expect(ptr %t1417, i32 4, ptr %t1418)
  %t1419 = load ptr, ptr %enum_node
  %t1420 = getelementptr inbounds %ASTNode, ptr %t1419, i32 0, i32 5
  %t1421 = load ptr, ptr %t1420
  %t1422 = getelementptr inbounds [1 x i8], ptr @.str.s143, i64 0, i64 0
  %t1423 = call i32 @str_equals(ptr %t1421, ptr %t1422)
  %t1424 = icmp eq i32 %t1423, 1
  br i1 %t1424, label %label_675, label %label_676
label_675:
  %t1425 = load ptr, ptr %enum_node
  %t1426 = load ptr, ptr %variant
  %t1427 = call ptr @node_to_ptr(ptr %t1426)
  %t1428 = getelementptr inbounds %ASTNode, ptr %t1425, i32 0, i32 5
  store ptr %t1427, ptr %t1428
  br label %label_677
label_676:
  %t1430 = load ptr, ptr %last_var
  %t1431 = call ptr @ptr_to_node(ptr %t1430)
  store ptr %t1431, ptr %last
  %t1432 = load ptr, ptr %last
  %t1433 = load ptr, ptr %variant
  %t1434 = call ptr @node_to_ptr(ptr %t1433)
  %t1435 = getelementptr inbounds %ASTNode, ptr %t1432, i32 0, i32 8
  store ptr %t1434, ptr %t1435
  br label %label_677
label_677:
  %t1436 = load ptr, ptr %variant
  %t1437 = call ptr @node_to_ptr(ptr %t1436)
  store ptr %t1437, ptr %last_var
  %t1438 = load ptr, ptr %p
  %t1439 = getelementptr inbounds [2 x i8], ptr @.str.s144, i64 0, i64 0
  %t1440 = call i1 @parser_match_val(ptr %t1438, i32 5, ptr %t1439)
  br label %label_672
label_674:
  %t1441 = load ptr, ptr %p
  %t1442 = getelementptr inbounds [2 x i8], ptr @.str.s145, i64 0, i64 0
  %t1443 = getelementptr inbounds [10 x i8], ptr @.str.s146, i64 0, i64 0
  call void @parser_expect_val(ptr %t1441, i32 5, ptr %t1442, ptr %t1443)
  %t1444 = load ptr, ptr %enum_node
  ret ptr %t1444
}

define ptr @parse_block(ptr %p_p) {
  %p = alloca ptr
  %block_node = alloca ptr
  %last_stmt = alloca ptr
  %stmt = alloca ptr
  %last = alloca ptr
  store ptr %p_p, ptr %p
  %t1448 = load ptr, ptr %p
  %t1449 = getelementptr inbounds [2 x i8], ptr @.str.s147, i64 0, i64 0
  %t1450 = getelementptr inbounds [6 x i8], ptr @.str.s148, i64 0, i64 0
  call void @parser_expect_val(ptr %t1448, i32 5, ptr %t1449, ptr %t1450)
  %t1451 = call ptr @create_node(i32 9)
  store ptr %t1451, ptr %block_node
  %t1452 = getelementptr inbounds [1 x i8], ptr @.str.s149, i64 0, i64 0
  store ptr %t1452, ptr %last_stmt
  br label %label_678
label_678:
  %t1453 = load ptr, ptr %p
  %t1454 = getelementptr inbounds [2 x i8], ptr @.str.s150, i64 0, i64 0
  %t1455 = call i1 @parser_check_val(ptr %t1453, i32 5, ptr %t1454)
  %t1456 = icmp eq i1 %t1455, 0
  br i1 %t1456, label %label_679, label %label_680
label_679:
  %t1458 = load ptr, ptr %p
  %t1459 = call ptr @parse_statement(ptr %t1458)
  store ptr %t1459, ptr %stmt
  %t1460 = load ptr, ptr %block_node
  %t1461 = getelementptr inbounds %ASTNode, ptr %t1460, i32 0, i32 5
  %t1462 = load ptr, ptr %t1461
  %t1463 = getelementptr inbounds [1 x i8], ptr @.str.s151, i64 0, i64 0
  %t1464 = call i32 @str_equals(ptr %t1462, ptr %t1463)
  %t1465 = icmp eq i32 %t1464, 1
  br i1 %t1465, label %label_681, label %label_682
label_681:
  %t1466 = load ptr, ptr %block_node
  %t1467 = load ptr, ptr %stmt
  %t1468 = call ptr @node_to_ptr(ptr %t1467)
  %t1469 = getelementptr inbounds %ASTNode, ptr %t1466, i32 0, i32 5
  store ptr %t1468, ptr %t1469
  br label %label_683
label_682:
  %t1471 = load ptr, ptr %last_stmt
  %t1472 = call ptr @ptr_to_node(ptr %t1471)
  store ptr %t1472, ptr %last
  %t1473 = load ptr, ptr %last
  %t1474 = load ptr, ptr %stmt
  %t1475 = call ptr @node_to_ptr(ptr %t1474)
  %t1476 = getelementptr inbounds %ASTNode, ptr %t1473, i32 0, i32 8
  store ptr %t1475, ptr %t1476
  br label %label_683
label_683:
  %t1477 = load ptr, ptr %stmt
  %t1478 = call ptr @node_to_ptr(ptr %t1477)
  store ptr %t1478, ptr %last_stmt
  br label %label_678
label_680:
  %t1479 = load ptr, ptr %p
  %t1480 = getelementptr inbounds [2 x i8], ptr @.str.s152, i64 0, i64 0
  %t1481 = getelementptr inbounds [6 x i8], ptr @.str.s153, i64 0, i64 0
  call void @parser_expect_val(ptr %t1479, i32 5, ptr %t1480, ptr %t1481)
  %t1482 = load ptr, ptr %block_node
  ret ptr %t1482
}

define ptr @parse_if_statement(ptr %p_p) {
  %p = alloca ptr
  %if_node = alloca ptr
  store ptr %p_p, ptr %p
  %t1485 = load ptr, ptr %p
  %t1486 = getelementptr inbounds [3 x i8], ptr @.str.s154, i64 0, i64 0
  %t1487 = getelementptr inbounds [13 x i8], ptr @.str.s155, i64 0, i64 0
  call void @parser_expect_val(ptr %t1485, i32 16, ptr %t1486, ptr %t1487)
  %t1488 = call ptr @create_node(i32 10)
  store ptr %t1488, ptr %if_node
  %t1489 = load ptr, ptr %p
  %t1490 = getelementptr inbounds [2 x i8], ptr @.str.s156, i64 0, i64 0
  %t1491 = getelementptr inbounds [13 x i8], ptr @.str.s157, i64 0, i64 0
  call void @parser_expect_val(ptr %t1489, i32 5, ptr %t1490, ptr %t1491)
  %t1492 = load ptr, ptr %if_node
  %t1493 = load ptr, ptr %p
  %t1494 = call ptr @parse_expression(ptr %t1493, i32 0)
  %t1495 = call ptr @node_to_ptr(ptr %t1494)
  %t1496 = getelementptr inbounds %ASTNode, ptr %t1492, i32 0, i32 5
  store ptr %t1495, ptr %t1496
  %t1497 = load ptr, ptr %p
  %t1498 = getelementptr inbounds [2 x i8], ptr @.str.s158, i64 0, i64 0
  %t1499 = getelementptr inbounds [13 x i8], ptr @.str.s159, i64 0, i64 0
  call void @parser_expect_val(ptr %t1497, i32 5, ptr %t1498, ptr %t1499)
  %t1500 = load ptr, ptr %if_node
  %t1501 = load ptr, ptr %p
  %t1502 = call ptr @parse_block(ptr %t1501)
  %t1503 = call ptr @node_to_ptr(ptr %t1502)
  %t1504 = getelementptr inbounds %ASTNode, ptr %t1500, i32 0, i32 6
  store ptr %t1503, ptr %t1504
  %t1505 = load ptr, ptr %p
  %t1506 = getelementptr inbounds [5 x i8], ptr @.str.s160, i64 0, i64 0
  %t1507 = call i1 @parser_match_val(ptr %t1505, i32 16, ptr %t1506)
  br i1 %t1507, label %label_684, label %label_686
label_684:
  %t1508 = load ptr, ptr %p
  %t1509 = getelementptr inbounds [3 x i8], ptr @.str.s161, i64 0, i64 0
  %t1510 = call i1 @parser_check_val(ptr %t1508, i32 16, ptr %t1509)
  br i1 %t1510, label %label_687, label %label_688
label_687:
  %t1511 = load ptr, ptr %if_node
  %t1512 = load ptr, ptr %p
  %t1513 = call ptr @parse_if_statement(ptr %t1512)
  %t1514 = call ptr @node_to_ptr(ptr %t1513)
  %t1515 = getelementptr inbounds %ASTNode, ptr %t1511, i32 0, i32 7
  store ptr %t1514, ptr %t1515
  br label %label_689
label_688:
  %t1516 = load ptr, ptr %if_node
  %t1517 = load ptr, ptr %p
  %t1518 = call ptr @parse_block(ptr %t1517)
  %t1519 = call ptr @node_to_ptr(ptr %t1518)
  %t1520 = getelementptr inbounds %ASTNode, ptr %t1516, i32 0, i32 7
  store ptr %t1519, ptr %t1520
  br label %label_689
label_689:
  br label %label_686
label_686:
  %t1521 = load ptr, ptr %if_node
  ret ptr %t1521
}

define ptr @parse_while_statement(ptr %p_p) {
  %p = alloca ptr
  %while_node = alloca ptr
  store ptr %p_p, ptr %p
  %t1524 = load ptr, ptr %p
  %t1525 = getelementptr inbounds [6 x i8], ptr @.str.s162, i64 0, i64 0
  %t1526 = getelementptr inbounds [16 x i8], ptr @.str.s163, i64 0, i64 0
  call void @parser_expect_val(ptr %t1524, i32 16, ptr %t1525, ptr %t1526)
  %t1527 = call ptr @create_node(i32 13)
  store ptr %t1527, ptr %while_node
  %t1528 = load ptr, ptr %p
  %t1529 = getelementptr inbounds [2 x i8], ptr @.str.s164, i64 0, i64 0
  %t1530 = getelementptr inbounds [16 x i8], ptr @.str.s165, i64 0, i64 0
  call void @parser_expect_val(ptr %t1528, i32 5, ptr %t1529, ptr %t1530)
  %t1531 = load ptr, ptr %while_node
  %t1532 = load ptr, ptr %p
  %t1533 = call ptr @parse_expression(ptr %t1532, i32 0)
  %t1534 = call ptr @node_to_ptr(ptr %t1533)
  %t1535 = getelementptr inbounds %ASTNode, ptr %t1531, i32 0, i32 5
  store ptr %t1534, ptr %t1535
  %t1536 = load ptr, ptr %p
  %t1537 = getelementptr inbounds [2 x i8], ptr @.str.s166, i64 0, i64 0
  %t1538 = getelementptr inbounds [16 x i8], ptr @.str.s167, i64 0, i64 0
  call void @parser_expect_val(ptr %t1536, i32 5, ptr %t1537, ptr %t1538)
  %t1539 = load ptr, ptr %while_node
  %t1540 = load ptr, ptr %p
  %t1541 = call ptr @parse_block(ptr %t1540)
  %t1542 = call ptr @node_to_ptr(ptr %t1541)
  %t1543 = getelementptr inbounds %ASTNode, ptr %t1539, i32 0, i32 6
  store ptr %t1542, ptr %t1543
  %t1544 = load ptr, ptr %while_node
  ret ptr %t1544
}

define ptr @parse_statement(ptr %p_p) {
  %p = alloca ptr
  %expr = alloca ptr
  %stmt = alloca ptr
  %ret_node = alloca ptr
  %curr = alloca ptr
  %assign_stmt = alloca ptr
  store ptr %p_p, ptr %p
  %t1548 = load ptr, ptr %p
  %t1549 = getelementptr inbounds [3 x i8], ptr @.str.s168, i64 0, i64 0
  %t1550 = call i1 @parser_check_val(ptr %t1548, i32 16, ptr %t1549)
  br i1 %t1550, label %label_690, label %label_692
label_690:
  %t1551 = load ptr, ptr %p
  %t1552 = call ptr @parse_if_statement(ptr %t1551)
  ret ptr %t1552
label_692:
  %t1553 = load ptr, ptr %p
  %t1554 = getelementptr inbounds [6 x i8], ptr @.str.s169, i64 0, i64 0
  %t1555 = call i1 @parser_check_val(ptr %t1553, i32 16, ptr %t1554)
  br i1 %t1555, label %label_693, label %label_695
label_693:
  %t1556 = load ptr, ptr %p
  %t1557 = call ptr @parse_while_statement(ptr %t1556)
  ret ptr %t1557
label_695:
  %t1558 = load ptr, ptr %p
  %t1559 = getelementptr inbounds [7 x i8], ptr @.str.s170, i64 0, i64 0
  %t1560 = call i1 @parser_match_val(ptr %t1558, i32 16, ptr %t1559)
  br i1 %t1560, label %label_696, label %label_698
label_696:
  %t1562 = call ptr @create_node(i32 15)
  store ptr %t1562, ptr %ret_node
  %t1564 = load ptr, ptr %p
  %t1565 = call ptr @parser_current(ptr %t1564)
  store ptr %t1565, ptr %curr
  %t1566 = load ptr, ptr %curr
  %t1567 = getelementptr inbounds %Token, ptr %t1566, i32 0, i32 0
  %t1568 = load i32, ptr %t1567
  %t1569 = icmp ne i32 %t1568, 5
  %t1570 = load ptr, ptr %curr
  %t1571 = getelementptr inbounds %Token, ptr %t1570, i32 0, i32 1
  %t1572 = load ptr, ptr %t1571
  %t1573 = getelementptr inbounds [2 x i8], ptr @.str.s171, i64 0, i64 0
  %t1574 = call i32 @str_equals(ptr %t1572, ptr %t1573)
  %t1575 = icmp eq i32 %t1574, 0
  %t1576 = or i1 %t1569, %t1575
  br i1 %t1576, label %label_699, label %label_701
label_699:
  %t1577 = load ptr, ptr %ret_node
  %t1578 = load ptr, ptr %p
  %t1579 = call ptr @parse_expression(ptr %t1578, i32 0)
  %t1580 = call ptr @node_to_ptr(ptr %t1579)
  %t1581 = getelementptr inbounds %ASTNode, ptr %t1577, i32 0, i32 5
  store ptr %t1580, ptr %t1581
  br label %label_701
label_701:
  %t1582 = load ptr, ptr %ret_node
  ret ptr %t1582
label_698:
  %t1583 = load ptr, ptr %p
  %t1584 = getelementptr inbounds [4 x i8], ptr @.str.s172, i64 0, i64 0
  %t1585 = call i1 @parser_check_val(ptr %t1583, i32 16, ptr %t1584)
  br i1 %t1585, label %label_702, label %label_704
label_702:
  %t1586 = load ptr, ptr %p
  %t1587 = call ptr @parse_variable_decl(ptr %t1586)
  ret ptr %t1587
label_704:
  %t1588 = load ptr, ptr %p
  %t1589 = call ptr @parse_expression(ptr %t1588, i32 0)
  store ptr %t1589, ptr %expr
  %t1590 = load ptr, ptr %p
  %t1591 = getelementptr inbounds [2 x i8], ptr @.str.s173, i64 0, i64 0
  %t1592 = call i1 @parser_match_val(ptr %t1590, i32 11, ptr %t1591)
  br i1 %t1592, label %label_705, label %label_707
label_705:
  %t1594 = call ptr @create_node(i32 16)
  store ptr %t1594, ptr %assign_stmt
  %t1595 = load ptr, ptr %assign_stmt
  %t1596 = load ptr, ptr %expr
  %t1597 = call ptr @node_to_ptr(ptr %t1596)
  %t1598 = getelementptr inbounds %ASTNode, ptr %t1595, i32 0, i32 5
  store ptr %t1597, ptr %t1598
  %t1599 = load ptr, ptr %assign_stmt
  %t1600 = load ptr, ptr %p
  %t1601 = call ptr @parse_expression(ptr %t1600, i32 0)
  %t1602 = call ptr @node_to_ptr(ptr %t1601)
  %t1603 = getelementptr inbounds %ASTNode, ptr %t1599, i32 0, i32 6
  store ptr %t1602, ptr %t1603
  %t1604 = load ptr, ptr %assign_stmt
  ret ptr %t1604
label_707:
  %t1605 = call ptr @create_node(i32 17)
  store ptr %t1605, ptr %stmt
  %t1606 = load ptr, ptr %stmt
  %t1607 = load ptr, ptr %expr
  %t1608 = call ptr @node_to_ptr(ptr %t1607)
  %t1609 = getelementptr inbounds %ASTNode, ptr %t1606, i32 0, i32 5
  store ptr %t1608, ptr %t1609
  %t1610 = load ptr, ptr %stmt
  ret ptr %t1610
}

define i32 @get_operator_precedence(ptr %p_t) {
  %t = alloca ptr
  store ptr %p_t, ptr %t
  %t1612 = load ptr, ptr %t
  %t1613 = getelementptr inbounds %Token, ptr %t1612, i32 0, i32 1
  %t1614 = load ptr, ptr %t1613
  %t1615 = getelementptr inbounds [3 x i8], ptr @.str.s174, i64 0, i64 0
  %t1616 = call i32 @str_equals(ptr %t1614, ptr %t1615)
  %t1617 = icmp eq i32 %t1616, 1
  br i1 %t1617, label %label_708, label %label_710
label_708:
  ret i32 1
label_710:
  %t1618 = load ptr, ptr %t
  %t1619 = getelementptr inbounds %Token, ptr %t1618, i32 0, i32 1
  %t1620 = load ptr, ptr %t1619
  %t1621 = getelementptr inbounds [4 x i8], ptr @.str.s175, i64 0, i64 0
  %t1622 = call i32 @str_equals(ptr %t1620, ptr %t1621)
  %t1623 = icmp eq i32 %t1622, 1
  br i1 %t1623, label %label_711, label %label_713
label_711:
  ret i32 2
label_713:
  %t1624 = load ptr, ptr %t
  %t1625 = getelementptr inbounds %Token, ptr %t1624, i32 0, i32 0
  %t1626 = load i32, ptr %t1625
  %t1627 = icmp eq i32 %t1626, 16
  br i1 %t1627, label %label_714, label %label_716
label_714:
  ret i32 0
label_716:
  %t1628 = load ptr, ptr %t
  %t1629 = getelementptr inbounds %Token, ptr %t1628, i32 0, i32 1
  %t1630 = load ptr, ptr %t1629
  %t1631 = getelementptr inbounds [3 x i8], ptr @.str.s176, i64 0, i64 0
  %t1632 = call i32 @str_equals(ptr %t1630, ptr %t1631)
  %t1633 = icmp eq i32 %t1632, 1
  %t1634 = load ptr, ptr %t
  %t1635 = getelementptr inbounds %Token, ptr %t1634, i32 0, i32 1
  %t1636 = load ptr, ptr %t1635
  %t1637 = getelementptr inbounds [3 x i8], ptr @.str.s177, i64 0, i64 0
  %t1638 = call i32 @str_equals(ptr %t1636, ptr %t1637)
  %t1639 = icmp eq i32 %t1638, 1
  %t1640 = or i1 %t1633, %t1639
  br i1 %t1640, label %label_717, label %label_719
label_717:
  ret i32 3
label_719:
  %t1641 = load ptr, ptr %t
  %t1642 = getelementptr inbounds %Token, ptr %t1641, i32 0, i32 1
  %t1643 = load ptr, ptr %t1642
  %t1644 = getelementptr inbounds [2 x i8], ptr @.str.s178, i64 0, i64 0
  %t1645 = call i32 @str_equals(ptr %t1643, ptr %t1644)
  %t1646 = icmp eq i32 %t1645, 1
  %t1647 = load ptr, ptr %t
  %t1648 = getelementptr inbounds %Token, ptr %t1647, i32 0, i32 1
  %t1649 = load ptr, ptr %t1648
  %t1650 = getelementptr inbounds [2 x i8], ptr @.str.s179, i64 0, i64 0
  %t1651 = call i32 @str_equals(ptr %t1649, ptr %t1650)
  %t1652 = icmp eq i32 %t1651, 1
  %t1653 = or i1 %t1646, %t1652
  %t1654 = load ptr, ptr %t
  %t1655 = getelementptr inbounds %Token, ptr %t1654, i32 0, i32 1
  %t1656 = load ptr, ptr %t1655
  %t1657 = getelementptr inbounds [3 x i8], ptr @.str.s180, i64 0, i64 0
  %t1658 = call i32 @str_equals(ptr %t1656, ptr %t1657)
  %t1659 = icmp eq i32 %t1658, 1
  %t1660 = or i1 %t1653, %t1659
  %t1661 = load ptr, ptr %t
  %t1662 = getelementptr inbounds %Token, ptr %t1661, i32 0, i32 1
  %t1663 = load ptr, ptr %t1662
  %t1664 = getelementptr inbounds [3 x i8], ptr @.str.s181, i64 0, i64 0
  %t1665 = call i32 @str_equals(ptr %t1663, ptr %t1664)
  %t1666 = icmp eq i32 %t1665, 1
  %t1667 = or i1 %t1660, %t1666
  br i1 %t1667, label %label_720, label %label_722
label_720:
  ret i32 4
label_722:
  %t1668 = load ptr, ptr %t
  %t1669 = getelementptr inbounds %Token, ptr %t1668, i32 0, i32 1
  %t1670 = load ptr, ptr %t1669
  %t1671 = getelementptr inbounds [2 x i8], ptr @.str.s182, i64 0, i64 0
  %t1672 = call i32 @str_equals(ptr %t1670, ptr %t1671)
  %t1673 = icmp eq i32 %t1672, 1
  %t1674 = load ptr, ptr %t
  %t1675 = getelementptr inbounds %Token, ptr %t1674, i32 0, i32 1
  %t1676 = load ptr, ptr %t1675
  %t1677 = getelementptr inbounds [2 x i8], ptr @.str.s183, i64 0, i64 0
  %t1678 = call i32 @str_equals(ptr %t1676, ptr %t1677)
  %t1679 = icmp eq i32 %t1678, 1
  %t1680 = or i1 %t1673, %t1679
  br i1 %t1680, label %label_723, label %label_725
label_723:
  ret i32 5
label_725:
  %t1681 = load ptr, ptr %t
  %t1682 = getelementptr inbounds %Token, ptr %t1681, i32 0, i32 1
  %t1683 = load ptr, ptr %t1682
  %t1684 = getelementptr inbounds [2 x i8], ptr @.str.s184, i64 0, i64 0
  %t1685 = call i32 @str_equals(ptr %t1683, ptr %t1684)
  %t1686 = icmp eq i32 %t1685, 1
  %t1687 = load ptr, ptr %t
  %t1688 = getelementptr inbounds %Token, ptr %t1687, i32 0, i32 1
  %t1689 = load ptr, ptr %t1688
  %t1690 = getelementptr inbounds [2 x i8], ptr @.str.s185, i64 0, i64 0
  %t1691 = call i32 @str_equals(ptr %t1689, ptr %t1690)
  %t1692 = icmp eq i32 %t1691, 1
  %t1693 = or i1 %t1686, %t1692
  %t1694 = load ptr, ptr %t
  %t1695 = getelementptr inbounds %Token, ptr %t1694, i32 0, i32 1
  %t1696 = load ptr, ptr %t1695
  %t1697 = getelementptr inbounds [2 x i8], ptr @.str.s186, i64 0, i64 0
  %t1698 = call i32 @str_equals(ptr %t1696, ptr %t1697)
  %t1699 = icmp eq i32 %t1698, 1
  %t1700 = or i1 %t1693, %t1699
  br i1 %t1700, label %label_726, label %label_728
label_726:
  ret i32 6
label_728:
  ret i32 0
}

define ptr @parse_expression(ptr %p_p, i32 %p_precedence) {
  %p = alloca ptr
  %precedence = alloca i32
  %left = alloca ptr
  %is_looping = alloca i1
  %curr = alloca ptr
  %is_operator = alloca i1
  %current_precedence = alloca i32
  %op = alloca ptr
  %right = alloca ptr
  %bin_expr = alloca ptr
  store ptr %p_p, ptr %p
  store i32 %p_precedence, ptr %precedence
  %t1705 = load ptr, ptr %p
  %t1706 = call ptr @parse_primary(ptr %t1705)
  store ptr %t1706, ptr %left
  store i1 1, ptr %is_looping
  br label %label_729
label_729:
  %t1707 = load i1, ptr %is_looping
  br i1 %t1707, label %label_730, label %label_731
label_730:
  %t1709 = load ptr, ptr %p
  %t1710 = call ptr @parser_current(ptr %t1709)
  store ptr %t1710, ptr %curr
  %t1712 = load ptr, ptr %curr
  %t1713 = getelementptr inbounds %Token, ptr %t1712, i32 0, i32 0
  %t1714 = load i32, ptr %t1713
  %t1715 = icmp eq i32 %t1714, 7
  %t1716 = load ptr, ptr %curr
  %t1717 = getelementptr inbounds %Token, ptr %t1716, i32 0, i32 0
  %t1718 = load i32, ptr %t1717
  %t1719 = icmp eq i32 %t1718, 8
  %t1720 = or i1 %t1715, %t1719
  %t1721 = load ptr, ptr %curr
  %t1722 = getelementptr inbounds %Token, ptr %t1721, i32 0, i32 1
  %t1723 = load ptr, ptr %t1722
  %t1724 = getelementptr inbounds [4 x i8], ptr @.str.s187, i64 0, i64 0
  %t1725 = call i32 @str_equals(ptr %t1723, ptr %t1724)
  %t1726 = icmp eq i32 %t1725, 1
  %t1727 = or i1 %t1720, %t1726
  %t1728 = load ptr, ptr %curr
  %t1729 = getelementptr inbounds %Token, ptr %t1728, i32 0, i32 1
  %t1730 = load ptr, ptr %t1729
  %t1731 = getelementptr inbounds [3 x i8], ptr @.str.s188, i64 0, i64 0
  %t1732 = call i32 @str_equals(ptr %t1730, ptr %t1731)
  %t1733 = icmp eq i32 %t1732, 1
  %t1734 = or i1 %t1727, %t1733
  store i1 %t1734, ptr %is_operator
  %t1735 = load i1, ptr %is_operator
  %t1736 = icmp eq i1 %t1735, 0
  br i1 %t1736, label %label_732, label %label_733
label_732:
  store i1 0, ptr %is_looping
  br label %label_734
label_733:
  %t1738 = load ptr, ptr %curr
  %t1739 = call i32 @get_operator_precedence(ptr %t1738)
  store i32 %t1739, ptr %current_precedence
  %t1740 = load i32, ptr %current_precedence
  %t1741 = icmp eq i32 %t1740, 0
  %t1742 = load i32, ptr %current_precedence
  %t1743 = load i32, ptr %precedence
  %t1744 = icmp slt i32 %t1742, %t1743
  %t1745 = or i1 %t1741, %t1744
  br i1 %t1745, label %label_735, label %label_736
label_735:
  store i1 0, ptr %is_looping
  br label %label_737
label_736:
  %t1747 = load ptr, ptr %curr
  %t1748 = getelementptr inbounds %Token, ptr %t1747, i32 0, i32 1
  %t1749 = load ptr, ptr %t1748
  store ptr %t1749, ptr %op
  %t1750 = load ptr, ptr %p
  call void @parser_advance(ptr %t1750)
  %t1752 = load ptr, ptr %p
  %t1753 = load i32, ptr %current_precedence
  %t1754 = add i32 %t1753, 1
  %t1755 = call ptr @parse_expression(ptr %t1752, i32 %t1754)
  store ptr %t1755, ptr %right
  %t1757 = call ptr @create_node(i32 20)
  store ptr %t1757, ptr %bin_expr
  %t1758 = load ptr, ptr %bin_expr
  %t1759 = load ptr, ptr %op
  %t1760 = getelementptr inbounds %ASTNode, ptr %t1758, i32 0, i32 1
  store ptr %t1759, ptr %t1760
  %t1761 = load ptr, ptr %bin_expr
  %t1762 = load ptr, ptr %left
  %t1763 = call ptr @node_to_ptr(ptr %t1762)
  %t1764 = getelementptr inbounds %ASTNode, ptr %t1761, i32 0, i32 5
  store ptr %t1763, ptr %t1764
  %t1765 = load ptr, ptr %bin_expr
  %t1766 = load ptr, ptr %right
  %t1767 = call ptr @node_to_ptr(ptr %t1766)
  %t1768 = getelementptr inbounds %ASTNode, ptr %t1765, i32 0, i32 6
  store ptr %t1767, ptr %t1768
  %t1769 = load ptr, ptr %bin_expr
  store ptr %t1769, ptr %left
  br label %label_737
label_737:
  br label %label_734
label_734:
  br label %label_729
label_731:
  %t1770 = load ptr, ptr %left
  ret ptr %t1770
}

define ptr @parse_primary(ptr %p_p) {
  %p = alloca ptr
  %curr = alloca ptr
  %lit = alloca ptr
  %next_tok = alloca ptr
  %struct_lit = alloca ptr
  %last_field = alloca ptr
  %field = alloca ptr
  %field_tok = alloca ptr
  %last = alloca ptr
  %ident = alloca ptr
  %expr = alloca ptr
  %is_looping = alloca i1
  %call = alloca ptr
  %last_arg = alloca ptr
  %is_arg_looping = alloca i1
  %arg = alloca ptr
  %index_node = alloca ptr
  %member_node = alloca ptr
  %curr_mem = alloca ptr
  %expr_inner = alloca ptr
  %array_lit = alloca ptr
  %last_elem = alloca ptr
  %elem = alloca ptr
  store ptr %p_p, ptr %p
  %t1773 = load ptr, ptr %p
  %t1774 = call ptr @parser_current(ptr %t1773)
  store ptr %t1774, ptr %curr
  %t1775 = load ptr, ptr %curr
  %t1776 = getelementptr inbounds %Token, ptr %t1775, i32 0, i32 0
  %t1777 = load i32, ptr %t1776
  %t1778 = icmp eq i32 %t1777, 2
  %t1779 = load ptr, ptr %curr
  %t1780 = getelementptr inbounds %Token, ptr %t1779, i32 0, i32 0
  %t1781 = load i32, ptr %t1780
  %t1782 = icmp eq i32 %t1781, 0
  %t1783 = or i1 %t1778, %t1782
  %t1784 = load ptr, ptr %curr
  %t1785 = getelementptr inbounds %Token, ptr %t1784, i32 0, i32 0
  %t1786 = load i32, ptr %t1785
  %t1787 = icmp eq i32 %t1786, 3
  %t1788 = or i1 %t1783, %t1787
  %t1789 = load ptr, ptr %curr
  %t1790 = getelementptr inbounds %Token, ptr %t1789, i32 0, i32 0
  %t1791 = load i32, ptr %t1790
  %t1792 = icmp eq i32 %t1791, 1
  %t1793 = or i1 %t1788, %t1792
  br i1 %t1793, label %label_738, label %label_740
label_738:
  %t1795 = call ptr @create_node(i32 22)
  store ptr %t1795, ptr %lit
  %t1796 = load ptr, ptr %lit
  %t1797 = load ptr, ptr %curr
  %t1798 = getelementptr inbounds %Token, ptr %t1797, i32 0, i32 0
  %t1799 = load i32, ptr %t1798
  %t1800 = getelementptr inbounds %ASTNode, ptr %t1796, i32 0, i32 3
  store i32 %t1799, ptr %t1800
  %t1801 = load ptr, ptr %lit
  %t1802 = load ptr, ptr %curr
  %t1803 = getelementptr inbounds %Token, ptr %t1802, i32 0, i32 1
  %t1804 = load ptr, ptr %t1803
  %t1805 = getelementptr inbounds %ASTNode, ptr %t1801, i32 0, i32 1
  store ptr %t1804, ptr %t1805
  %t1806 = load ptr, ptr %p
  call void @parser_advance(ptr %t1806)
  %t1807 = load ptr, ptr %lit
  ret ptr %t1807
label_740:
  %t1808 = load ptr, ptr %curr
  %t1809 = getelementptr inbounds %Token, ptr %t1808, i32 0, i32 0
  %t1810 = load i32, ptr %t1809
  %t1811 = icmp eq i32 %t1810, 4
  br i1 %t1811, label %label_741, label %label_743
label_741:
  %t1813 = load ptr, ptr %p
  %t1814 = call ptr @parser_peek(ptr %t1813)
  store ptr %t1814, ptr %next_tok
  %t1815 = load ptr, ptr %next_tok
  %t1816 = getelementptr inbounds %Token, ptr %t1815, i32 0, i32 0
  %t1817 = load i32, ptr %t1816
  %t1818 = icmp eq i32 %t1817, 5
  %t1819 = load ptr, ptr %next_tok
  %t1820 = getelementptr inbounds %Token, ptr %t1819, i32 0, i32 1
  %t1821 = load ptr, ptr %t1820
  %t1822 = getelementptr inbounds [2 x i8], ptr @.str.s189, i64 0, i64 0
  %t1823 = call i32 @str_equals(ptr %t1821, ptr %t1822)
  %t1824 = icmp eq i32 %t1823, 1
  %t1825 = and i1 %t1818, %t1824
  br i1 %t1825, label %label_744, label %label_746
label_744:
  %t1827 = call ptr @create_node(i32 28)
  store ptr %t1827, ptr %struct_lit
  %t1828 = load ptr, ptr %struct_lit
  %t1829 = load ptr, ptr %curr
  %t1830 = getelementptr inbounds %Token, ptr %t1829, i32 0, i32 1
  %t1831 = load ptr, ptr %t1830
  %t1832 = getelementptr inbounds %ASTNode, ptr %t1828, i32 0, i32 1
  store ptr %t1831, ptr %t1832
  %t1833 = load ptr, ptr %p
  call void @parser_advance(ptr %t1833)
  %t1834 = load ptr, ptr %p
  %t1835 = getelementptr inbounds [2 x i8], ptr @.str.s190, i64 0, i64 0
  %t1836 = getelementptr inbounds [15 x i8], ptr @.str.s191, i64 0, i64 0
  call void @parser_expect_val(ptr %t1834, i32 5, ptr %t1835, ptr %t1836)
  %t1838 = getelementptr inbounds [1 x i8], ptr @.str.s192, i64 0, i64 0
  store ptr %t1838, ptr %last_field
  br label %label_747
label_747:
  %t1839 = load ptr, ptr %p
  %t1840 = getelementptr inbounds [2 x i8], ptr @.str.s193, i64 0, i64 0
  %t1841 = call i1 @parser_check_val(ptr %t1839, i32 5, ptr %t1840)
  %t1842 = icmp eq i1 %t1841, 0
  br i1 %t1842, label %label_748, label %label_749
label_748:
  %t1844 = call ptr @create_node(i32 31)
  store ptr %t1844, ptr %field
  %t1846 = load ptr, ptr %p
  %t1847 = call ptr @parser_current(ptr %t1846)
  store ptr %t1847, ptr %field_tok
  %t1848 = load ptr, ptr %field
  %t1849 = load ptr, ptr %field_tok
  %t1850 = getelementptr inbounds %Token, ptr %t1849, i32 0, i32 1
  %t1851 = load ptr, ptr %t1850
  %t1852 = getelementptr inbounds %ASTNode, ptr %t1848, i32 0, i32 1
  store ptr %t1851, ptr %t1852
  %t1853 = load ptr, ptr %p
  %t1854 = getelementptr inbounds [21 x i8], ptr @.str.s194, i64 0, i64 0
  call void @parser_expect(ptr %t1853, i32 4, ptr %t1854)
  %t1855 = load ptr, ptr %p
  %t1856 = getelementptr inbounds [2 x i8], ptr @.str.s195, i64 0, i64 0
  %t1857 = getelementptr inbounds [15 x i8], ptr @.str.s196, i64 0, i64 0
  call void @parser_expect_val(ptr %t1855, i32 5, ptr %t1856, ptr %t1857)
  %t1858 = load ptr, ptr %field
  %t1859 = load ptr, ptr %p
  %t1860 = call ptr @parse_expression(ptr %t1859, i32 0)
  %t1861 = call ptr @node_to_ptr(ptr %t1860)
  %t1862 = getelementptr inbounds %ASTNode, ptr %t1858, i32 0, i32 5
  store ptr %t1861, ptr %t1862
  %t1863 = load ptr, ptr %struct_lit
  %t1864 = getelementptr inbounds %ASTNode, ptr %t1863, i32 0, i32 5
  %t1865 = load ptr, ptr %t1864
  %t1866 = getelementptr inbounds [1 x i8], ptr @.str.s197, i64 0, i64 0
  %t1867 = call i32 @str_equals(ptr %t1865, ptr %t1866)
  %t1868 = icmp eq i32 %t1867, 1
  br i1 %t1868, label %label_750, label %label_751
label_750:
  %t1869 = load ptr, ptr %struct_lit
  %t1870 = load ptr, ptr %field
  %t1871 = call ptr @node_to_ptr(ptr %t1870)
  %t1872 = getelementptr inbounds %ASTNode, ptr %t1869, i32 0, i32 5
  store ptr %t1871, ptr %t1872
  br label %label_752
label_751:
  %t1874 = load ptr, ptr %last_field
  %t1875 = call ptr @ptr_to_node(ptr %t1874)
  store ptr %t1875, ptr %last
  %t1876 = load ptr, ptr %last
  %t1877 = load ptr, ptr %field
  %t1878 = call ptr @node_to_ptr(ptr %t1877)
  %t1879 = getelementptr inbounds %ASTNode, ptr %t1876, i32 0, i32 8
  store ptr %t1878, ptr %t1879
  br label %label_752
label_752:
  %t1880 = load ptr, ptr %field
  %t1881 = call ptr @node_to_ptr(ptr %t1880)
  store ptr %t1881, ptr %last_field
  %t1882 = load ptr, ptr %p
  %t1883 = getelementptr inbounds [2 x i8], ptr @.str.s198, i64 0, i64 0
  %t1884 = call i1 @parser_match_val(ptr %t1882, i32 5, ptr %t1883)
  br label %label_747
label_749:
  %t1885 = load ptr, ptr %p
  %t1886 = getelementptr inbounds [2 x i8], ptr @.str.s199, i64 0, i64 0
  %t1887 = getelementptr inbounds [15 x i8], ptr @.str.s200, i64 0, i64 0
  call void @parser_expect_val(ptr %t1885, i32 5, ptr %t1886, ptr %t1887)
  %t1888 = load ptr, ptr %struct_lit
  ret ptr %t1888
label_746:
  br label %label_743
label_743:
  %t1889 = load ptr, ptr %curr
  %t1890 = getelementptr inbounds %Token, ptr %t1889, i32 0, i32 0
  %t1891 = load i32, ptr %t1890
  %t1892 = icmp eq i32 %t1891, 4
  br i1 %t1892, label %label_753, label %label_755
label_753:
  %t1894 = call ptr @create_node(i32 23)
  store ptr %t1894, ptr %ident
  %t1895 = load ptr, ptr %ident
  %t1896 = load ptr, ptr %curr
  %t1897 = getelementptr inbounds %Token, ptr %t1896, i32 0, i32 1
  %t1898 = load ptr, ptr %t1897
  %t1899 = getelementptr inbounds %ASTNode, ptr %t1895, i32 0, i32 1
  store ptr %t1898, ptr %t1899
  %t1900 = load ptr, ptr %p
  call void @parser_advance(ptr %t1900)
  %t1902 = load ptr, ptr %ident
  store ptr %t1902, ptr %expr
  store i1 1, ptr %is_looping
  br label %label_756
label_756:
  %t1904 = load i1, ptr %is_looping
  br i1 %t1904, label %label_757, label %label_758
label_757:
  %t1905 = load ptr, ptr %p
  %t1906 = getelementptr inbounds [2 x i8], ptr @.str.s201, i64 0, i64 0
  %t1907 = call i1 @parser_match_val(ptr %t1905, i32 5, ptr %t1906)
  br i1 %t1907, label %label_759, label %label_760
label_759:
  %t1909 = call ptr @create_node(i32 24)
  store ptr %t1909, ptr %call
  %t1910 = load ptr, ptr %call
  %t1911 = load ptr, ptr %expr
  %t1912 = call ptr @node_to_ptr(ptr %t1911)
  %t1913 = getelementptr inbounds %ASTNode, ptr %t1910, i32 0, i32 5
  store ptr %t1912, ptr %t1913
  %t1915 = getelementptr inbounds [1 x i8], ptr @.str.s202, i64 0, i64 0
  store ptr %t1915, ptr %last_arg
  %t1916 = load ptr, ptr %p
  %t1917 = getelementptr inbounds [2 x i8], ptr @.str.s203, i64 0, i64 0
  %t1918 = call i1 @parser_check_val(ptr %t1916, i32 5, ptr %t1917)
  %t1919 = icmp eq i1 %t1918, 0
  br i1 %t1919, label %label_762, label %label_764
label_762:
  store i1 1, ptr %is_arg_looping
  br label %label_765
label_765:
  %t1921 = load i1, ptr %is_arg_looping
  br i1 %t1921, label %label_766, label %label_767
label_766:
  %t1923 = load ptr, ptr %p
  %t1924 = call ptr @parse_expression(ptr %t1923, i32 0)
  store ptr %t1924, ptr %arg
  %t1925 = load ptr, ptr %call
  %t1926 = getelementptr inbounds %ASTNode, ptr %t1925, i32 0, i32 6
  %t1927 = load ptr, ptr %t1926
  %t1928 = getelementptr inbounds [1 x i8], ptr @.str.s204, i64 0, i64 0
  %t1929 = call i32 @str_equals(ptr %t1927, ptr %t1928)
  %t1930 = icmp eq i32 %t1929, 1
  br i1 %t1930, label %label_768, label %label_769
label_768:
  %t1931 = load ptr, ptr %call
  %t1932 = load ptr, ptr %arg
  %t1933 = call ptr @node_to_ptr(ptr %t1932)
  %t1934 = getelementptr inbounds %ASTNode, ptr %t1931, i32 0, i32 6
  store ptr %t1933, ptr %t1934
  br label %label_770
label_769:
  %t1935 = load ptr, ptr %last_arg
  %t1936 = call ptr @ptr_to_node(ptr %t1935)
  store ptr %t1936, ptr %last
  %t1937 = load ptr, ptr %last
  %t1938 = load ptr, ptr %arg
  %t1939 = call ptr @node_to_ptr(ptr %t1938)
  %t1940 = getelementptr inbounds %ASTNode, ptr %t1937, i32 0, i32 8
  store ptr %t1939, ptr %t1940
  br label %label_770
label_770:
  %t1941 = load ptr, ptr %arg
  %t1942 = call ptr @node_to_ptr(ptr %t1941)
  store ptr %t1942, ptr %last_arg
  %t1943 = load ptr, ptr %p
  %t1944 = getelementptr inbounds [2 x i8], ptr @.str.s205, i64 0, i64 0
  %t1945 = call i1 @parser_match_val(ptr %t1943, i32 5, ptr %t1944)
  %t1946 = icmp eq i1 %t1945, 0
  br i1 %t1946, label %label_771, label %label_773
label_771:
  store i1 0, ptr %is_arg_looping
  br label %label_773
label_773:
  br label %label_765
label_767:
  br label %label_764
label_764:
  %t1947 = load ptr, ptr %p
  %t1948 = getelementptr inbounds [2 x i8], ptr @.str.s206, i64 0, i64 0
  %t1949 = getelementptr inbounds [14 x i8], ptr @.str.s207, i64 0, i64 0
  call void @parser_expect_val(ptr %t1947, i32 5, ptr %t1948, ptr %t1949)
  %t1950 = load ptr, ptr %call
  store ptr %t1950, ptr %expr
  br label %label_761
label_760:
  %t1951 = load ptr, ptr %p
  %t1952 = getelementptr inbounds [2 x i8], ptr @.str.s208, i64 0, i64 0
  %t1953 = call i1 @parser_match_val(ptr %t1951, i32 5, ptr %t1952)
  br i1 %t1953, label %label_774, label %label_775
label_774:
  %t1955 = call ptr @create_node(i32 26)
  store ptr %t1955, ptr %index_node
  %t1956 = load ptr, ptr %index_node
  %t1957 = load ptr, ptr %expr
  %t1958 = call ptr @node_to_ptr(ptr %t1957)
  %t1959 = getelementptr inbounds %ASTNode, ptr %t1956, i32 0, i32 5
  store ptr %t1958, ptr %t1959
  %t1960 = load ptr, ptr %index_node
  %t1961 = load ptr, ptr %p
  %t1962 = call ptr @parse_expression(ptr %t1961, i32 0)
  %t1963 = call ptr @node_to_ptr(ptr %t1962)
  %t1964 = getelementptr inbounds %ASTNode, ptr %t1960, i32 0, i32 6
  store ptr %t1963, ptr %t1964
  %t1965 = load ptr, ptr %p
  %t1966 = getelementptr inbounds [2 x i8], ptr @.str.s209, i64 0, i64 0
  %t1967 = getelementptr inbounds [12 x i8], ptr @.str.s210, i64 0, i64 0
  call void @parser_expect_val(ptr %t1965, i32 5, ptr %t1966, ptr %t1967)
  %t1968 = load ptr, ptr %index_node
  store ptr %t1968, ptr %expr
  br label %label_776
label_775:
  %t1969 = load ptr, ptr %p
  %t1970 = getelementptr inbounds [2 x i8], ptr @.str.s211, i64 0, i64 0
  %t1971 = call i1 @parser_match_val(ptr %t1969, i32 5, ptr %t1970)
  br i1 %t1971, label %label_777, label %label_778
label_777:
  %t1973 = call ptr @create_node(i32 25)
  store ptr %t1973, ptr %member_node
  %t1974 = load ptr, ptr %member_node
  %t1975 = load ptr, ptr %expr
  %t1976 = call ptr @node_to_ptr(ptr %t1975)
  %t1977 = getelementptr inbounds %ASTNode, ptr %t1974, i32 0, i32 5
  store ptr %t1976, ptr %t1977
  %t1979 = load ptr, ptr %p
  %t1980 = call ptr @parser_current(ptr %t1979)
  store ptr %t1980, ptr %curr_mem
  %t1981 = load ptr, ptr %member_node
  %t1982 = load ptr, ptr %curr_mem
  %t1983 = getelementptr inbounds %Token, ptr %t1982, i32 0, i32 1
  %t1984 = load ptr, ptr %t1983
  %t1985 = getelementptr inbounds %ASTNode, ptr %t1981, i32 0, i32 1
  store ptr %t1984, ptr %t1985
  %t1986 = load ptr, ptr %p
  %t1987 = getelementptr inbounds [12 x i8], ptr @.str.s212, i64 0, i64 0
  call void @parser_expect(ptr %t1986, i32 4, ptr %t1987)
  %t1988 = load ptr, ptr %member_node
  store ptr %t1988, ptr %expr
  br label %label_779
label_778:
  store i1 0, ptr %is_looping
  br label %label_779
label_779:
  br label %label_776
label_776:
  br label %label_761
label_761:
  br label %label_756
label_758:
  %t1989 = load ptr, ptr %expr
  ret ptr %t1989
label_755:
  %t1990 = load ptr, ptr %p
  %t1991 = getelementptr inbounds [2 x i8], ptr @.str.s213, i64 0, i64 0
  %t1992 = call i1 @parser_match_val(ptr %t1990, i32 5, ptr %t1991)
  br i1 %t1992, label %label_780, label %label_782
label_780:
  %t1994 = load ptr, ptr %p
  %t1995 = call ptr @parse_expression(ptr %t1994, i32 0)
  store ptr %t1995, ptr %expr_inner
  %t1996 = load ptr, ptr %p
  %t1997 = getelementptr inbounds [2 x i8], ptr @.str.s214, i64 0, i64 0
  %t1998 = getelementptr inbounds [25 x i8], ptr @.str.s215, i64 0, i64 0
  call void @parser_expect_val(ptr %t1996, i32 5, ptr %t1997, ptr %t1998)
  %t1999 = load ptr, ptr %expr_inner
  ret ptr %t1999
label_782:
  %t2000 = load ptr, ptr %p
  %t2001 = getelementptr inbounds [2 x i8], ptr @.str.s216, i64 0, i64 0
  %t2002 = call i1 @parser_match_val(ptr %t2000, i32 5, ptr %t2001)
  br i1 %t2002, label %label_783, label %label_785
label_783:
  %t2004 = call ptr @create_node(i32 27)
  store ptr %t2004, ptr %array_lit
  %t2006 = getelementptr inbounds [1 x i8], ptr @.str.s217, i64 0, i64 0
  store ptr %t2006, ptr %last_elem
  %t2007 = load ptr, ptr %p
  %t2008 = getelementptr inbounds [2 x i8], ptr @.str.s218, i64 0, i64 0
  %t2009 = call i1 @parser_check_val(ptr %t2007, i32 5, ptr %t2008)
  %t2010 = icmp eq i1 %t2009, 0
  br i1 %t2010, label %label_786, label %label_788
label_786:
  store i1 1, ptr %is_looping
  br label %label_789
label_789:
  %t2011 = load i1, ptr %is_looping
  br i1 %t2011, label %label_790, label %label_791
label_790:
  %t2013 = load ptr, ptr %p
  %t2014 = call ptr @parse_expression(ptr %t2013, i32 0)
  store ptr %t2014, ptr %elem
  %t2015 = load ptr, ptr %array_lit
  %t2016 = getelementptr inbounds %ASTNode, ptr %t2015, i32 0, i32 5
  %t2017 = load ptr, ptr %t2016
  %t2018 = getelementptr inbounds [1 x i8], ptr @.str.s219, i64 0, i64 0
  %t2019 = call i32 @str_equals(ptr %t2017, ptr %t2018)
  %t2020 = icmp eq i32 %t2019, 1
  br i1 %t2020, label %label_792, label %label_793
label_792:
  %t2021 = load ptr, ptr %array_lit
  %t2022 = load ptr, ptr %elem
  %t2023 = call ptr @node_to_ptr(ptr %t2022)
  %t2024 = getelementptr inbounds %ASTNode, ptr %t2021, i32 0, i32 5
  store ptr %t2023, ptr %t2024
  br label %label_794
label_793:
  %t2025 = load ptr, ptr %last_elem
  %t2026 = call ptr @ptr_to_node(ptr %t2025)
  store ptr %t2026, ptr %last
  %t2027 = load ptr, ptr %last
  %t2028 = load ptr, ptr %elem
  %t2029 = call ptr @node_to_ptr(ptr %t2028)
  %t2030 = getelementptr inbounds %ASTNode, ptr %t2027, i32 0, i32 8
  store ptr %t2029, ptr %t2030
  br label %label_794
label_794:
  %t2031 = load ptr, ptr %elem
  %t2032 = call ptr @node_to_ptr(ptr %t2031)
  store ptr %t2032, ptr %last_elem
  %t2033 = load ptr, ptr %p
  %t2034 = getelementptr inbounds [2 x i8], ptr @.str.s220, i64 0, i64 0
  %t2035 = call i1 @parser_match_val(ptr %t2033, i32 5, ptr %t2034)
  %t2036 = icmp eq i1 %t2035, 0
  br i1 %t2036, label %label_795, label %label_797
label_795:
  store i1 0, ptr %is_looping
  br label %label_797
label_797:
  br label %label_789
label_791:
  br label %label_788
label_788:
  %t2037 = load ptr, ptr %p
  %t2038 = getelementptr inbounds [2 x i8], ptr @.str.s221, i64 0, i64 0
  %t2039 = getelementptr inbounds [14 x i8], ptr @.str.s222, i64 0, i64 0
  call void @parser_expect_val(ptr %t2037, i32 5, ptr %t2038, ptr %t2039)
  %t2040 = load ptr, ptr %array_lit
  ret ptr %t2040
label_785:
  %t2041 = getelementptr inbounds [33 x i8], ptr @.str.s223, i64 0, i64 0
  call void @print(ptr %t2041)
  %t2042 = load ptr, ptr %curr
  %t2043 = getelementptr inbounds %Token, ptr %t2042, i32 0, i32 0
  %t2044 = load i32, ptr %t2043
  %t2045 = call ptr @type_to_string(i32 %t2044)
  call void @print(ptr %t2045)
  %t2046 = getelementptr inbounds [3 x i8], ptr @.str.s224, i64 0, i64 0
  call void @print(ptr %t2046)
  %t2047 = load ptr, ptr %curr
  %t2048 = getelementptr inbounds %Token, ptr %t2047, i32 0, i32 1
  %t2049 = load ptr, ptr %t2048
  call void @print(ptr %t2049)
  %t2050 = getelementptr inbounds [2 x i8], ptr @.str.s225, i64 0, i64 0
  call void @println(ptr %t2050)
  call void @exit(i32 1)
  %t2051 = call ptr @create_node(i32 0)
  ret ptr %t2051
}

define ptr @parse_module(ptr %p_p) {
  %p = alloca ptr
  %module = alloca ptr
  %last_stmt = alloca ptr
  %is_looping = alloca i1
  %curr = alloca ptr
  %stmt = alloca ptr
  %last = alloca ptr
  store ptr %p_p, ptr %p
  %t2056 = call ptr @create_node(i32 0)
  store ptr %t2056, ptr %module
  %t2057 = getelementptr inbounds [1 x i8], ptr @.str.s226, i64 0, i64 0
  store ptr %t2057, ptr %last_stmt
  store i1 1, ptr %is_looping
  br label %label_798
label_798:
  %t2058 = load i1, ptr %is_looping
  br i1 %t2058, label %label_799, label %label_800
label_799:
  %t2060 = load ptr, ptr %p
  %t2061 = call ptr @parser_current(ptr %t2060)
  store ptr %t2061, ptr %curr
  %t2062 = load ptr, ptr %curr
  %t2063 = getelementptr inbounds %Token, ptr %t2062, i32 0, i32 0
  %t2064 = load i32, ptr %t2063
  %t2065 = icmp eq i32 %t2064, 18
  br i1 %t2065, label %label_801, label %label_802
label_801:
  store i1 0, ptr %is_looping
  br label %label_803
label_802:
  %t2067 = load ptr, ptr %p
  %t2068 = call ptr @parse_declaration(ptr %t2067)
  store ptr %t2068, ptr %stmt
  %t2069 = load ptr, ptr %module
  %t2070 = getelementptr inbounds %ASTNode, ptr %t2069, i32 0, i32 5
  %t2071 = load ptr, ptr %t2070
  %t2072 = getelementptr inbounds [1 x i8], ptr @.str.s227, i64 0, i64 0
  %t2073 = call i32 @str_equals(ptr %t2071, ptr %t2072)
  %t2074 = icmp eq i32 %t2073, 1
  br i1 %t2074, label %label_804, label %label_805
label_804:
  %t2075 = load ptr, ptr %module
  %t2076 = load ptr, ptr %stmt
  %t2077 = call ptr @node_to_ptr(ptr %t2076)
  %t2078 = getelementptr inbounds %ASTNode, ptr %t2075, i32 0, i32 5
  store ptr %t2077, ptr %t2078
  br label %label_806
label_805:
  %t2080 = load ptr, ptr %last_stmt
  %t2081 = call ptr @ptr_to_node(ptr %t2080)
  store ptr %t2081, ptr %last
  %t2082 = load ptr, ptr %last
  %t2083 = load ptr, ptr %stmt
  %t2084 = call ptr @node_to_ptr(ptr %t2083)
  %t2085 = getelementptr inbounds %ASTNode, ptr %t2082, i32 0, i32 8
  store ptr %t2084, ptr %t2085
  br label %label_806
label_806:
  %t2086 = load ptr, ptr %stmt
  %t2087 = call ptr @node_to_ptr(ptr %t2086)
  store ptr %t2087, ptr %last_stmt
  br label %label_803
label_803:
  br label %label_798
label_800:
  %t2088 = load ptr, ptr %module
  ret ptr %t2088
}

define ptr @map_type(ptr %p_t) {
  %t = alloca ptr
  store ptr %p_t, ptr %t
  %t2090 = load ptr, ptr %t
  %t2091 = getelementptr inbounds [4 x i8], ptr @.str.s228, i64 0, i64 0
  %t2092 = call i32 @str_equals(ptr %t2090, ptr %t2091)
  %t2093 = icmp eq i32 %t2092, 1
  br i1 %t2093, label %label_807, label %label_809
label_807:
  %t2094 = getelementptr inbounds [4 x i8], ptr @.str.s229, i64 0, i64 0
  ret ptr %t2094
label_809:
  %t2095 = load ptr, ptr %t
  %t2096 = getelementptr inbounds [5 x i8], ptr @.str.s230, i64 0, i64 0
  %t2097 = call i32 @str_equals(ptr %t2095, ptr %t2096)
  %t2098 = icmp eq i32 %t2097, 1
  br i1 %t2098, label %label_810, label %label_812
label_810:
  %t2099 = getelementptr inbounds [3 x i8], ptr @.str.s231, i64 0, i64 0
  ret ptr %t2099
label_812:
  %t2100 = load ptr, ptr %t
  %t2101 = getelementptr inbounds [7 x i8], ptr @.str.s232, i64 0, i64 0
  %t2102 = call i32 @str_equals(ptr %t2100, ptr %t2101)
  %t2103 = icmp eq i32 %t2102, 1
  br i1 %t2103, label %label_813, label %label_815
label_813:
  %t2104 = getelementptr inbounds [4 x i8], ptr @.str.s233, i64 0, i64 0
  ret ptr %t2104
label_815:
  %t2105 = load ptr, ptr %t
  %t2106 = getelementptr inbounds [5 x i8], ptr @.str.s234, i64 0, i64 0
  %t2107 = call i32 @str_equals(ptr %t2105, ptr %t2106)
  %t2108 = icmp eq i32 %t2107, 1
  br i1 %t2108, label %label_816, label %label_818
label_816:
  %t2109 = getelementptr inbounds [3 x i8], ptr @.str.s235, i64 0, i64 0
  ret ptr %t2109
label_818:
  %t2110 = load ptr, ptr %t
  %t2111 = getelementptr inbounds [1 x i8], ptr @.str.s236, i64 0, i64 0
  %t2112 = call i32 @str_equals(ptr %t2110, ptr %t2111)
  %t2113 = icmp eq i32 %t2112, 1
  br i1 %t2113, label %label_819, label %label_821
label_819:
  %t2114 = getelementptr inbounds [5 x i8], ptr @.str.s237, i64 0, i64 0
  ret ptr %t2114
label_821:
  %t2115 = getelementptr inbounds [4 x i8], ptr @.str.s238, i64 0, i64 0
  ret ptr %t2115
}

define ptr @struct_type_key(ptr %p_name) {
  %name = alloca ptr
  store ptr %p_name, ptr %name
  %t2117 = getelementptr inbounds [8 x i8], ptr @.str.s239, i64 0, i64 0
  %t2118 = load ptr, ptr %name
  %t2119 = call ptr @str_concat(ptr %t2117, ptr %t2118)
  ret ptr %t2119
}

define i1 @is_struct_type_key(ptr %p_t) {
  %t = alloca ptr
  store ptr %p_t, ptr %t
  %t2121 = load ptr, ptr %t
  %t2122 = getelementptr inbounds [8 x i8], ptr @.str.s240, i64 0, i64 0
  %t2123 = call i32 @str_starts_with(ptr %t2121, ptr %t2122)
  %t2124 = icmp eq i32 %t2123, 1
  ret i1 %t2124
}

define ptr @struct_type_name(ptr %p_t) {
  %t = alloca ptr
  store ptr %p_t, ptr %t
  %t2126 = load ptr, ptr %t
  %t2127 = load ptr, ptr %t
  %t2128 = call i32 @str_length(ptr %t2127)
  %t2129 = sub i32 %t2128, 7
  %t2130 = call ptr @str_substring(ptr %t2126, i32 7, i32 %t2129)
  ret ptr %t2130
}

define ptr @llvm_type_name(ptr %p_t) {
  %t = alloca ptr
  store ptr %p_t, ptr %t
  %t2132 = load ptr, ptr %t
  %t2133 = call i1 @is_struct_type_key(ptr %t2132)
  br i1 %t2133, label %label_822, label %label_824
label_822:
  %t2134 = getelementptr inbounds [2 x i8], ptr @.str.s241, i64 0, i64 0
  %t2135 = load ptr, ptr %t
  %t2136 = call ptr @struct_type_name(ptr %t2135)
  %t2137 = call ptr @str_concat(ptr %t2134, ptr %t2136)
  ret ptr %t2137
label_824:
  %t2138 = load ptr, ptr %t
  ret ptr %t2138
}

define ptr @map_type_node(ptr %p_tn) {
  %tn = alloca ptr
  %elem = alloca ptr
  store ptr %p_tn, ptr %tn
  %t2140 = load ptr, ptr %tn
  %t2141 = getelementptr inbounds %ASTNode, ptr %t2140, i32 0, i32 3
  %t2142 = load i32, ptr %t2141
  %t2143 = icmp eq i32 %t2142, 1
  br i1 %t2143, label %label_825, label %label_827
label_825:
  %t2144 = load ptr, ptr %tn
  %t2145 = getelementptr inbounds %ASTNode, ptr %t2144, i32 0, i32 5
  %t2146 = load ptr, ptr %t2145
  %t2147 = getelementptr inbounds [1 x i8], ptr @.str.s242, i64 0, i64 0
  %t2148 = call i32 @str_equals(ptr %t2146, ptr %t2147)
  %t2149 = icmp eq i32 %t2148, 0
  br i1 %t2149, label %label_828, label %label_830
label_828:
  %t2151 = load ptr, ptr %tn
  %t2152 = getelementptr inbounds %ASTNode, ptr %t2151, i32 0, i32 5
  %t2153 = load ptr, ptr %t2152
  %t2154 = call ptr @ptr_to_node(ptr %t2153)
  store ptr %t2154, ptr %elem
  %t2155 = load ptr, ptr %elem
  %t2156 = getelementptr inbounds %ASTNode, ptr %t2155, i32 0, i32 3
  %t2157 = load i32, ptr %t2156
  %t2158 = icmp eq i32 %t2157, 1
  br i1 %t2158, label %label_831, label %label_833
label_831:
  %t2159 = getelementptr inbounds [7 x i8], ptr @.str.s243, i64 0, i64 0
  ret ptr %t2159
label_833:
  br label %label_830
label_830:
  %t2160 = getelementptr inbounds [4 x i8], ptr @.str.s244, i64 0, i64 0
  ret ptr %t2160
label_827:
  %t2161 = load ptr, ptr %tn
  %t2162 = getelementptr inbounds %ASTNode, ptr %t2161, i32 0, i32 1
  %t2163 = load ptr, ptr %t2162
  %t2164 = call i32 @ir_is_struct_type_name(ptr %t2163)
  %t2165 = icmp eq i32 %t2164, 1
  br i1 %t2165, label %label_834, label %label_836
label_834:
  %t2166 = load ptr, ptr %tn
  %t2167 = getelementptr inbounds %ASTNode, ptr %t2166, i32 0, i32 1
  %t2168 = load ptr, ptr %t2167
  %t2169 = call ptr @struct_type_key(ptr %t2168)
  ret ptr %t2169
label_836:
  %t2170 = load ptr, ptr %tn
  %t2171 = getelementptr inbounds %ASTNode, ptr %t2170, i32 0, i32 1
  %t2172 = load ptr, ptr %t2171
  %t2173 = call ptr @map_type(ptr %t2172)
  ret ptr %t2173
}

define ptr @storage_type(ptr %p_t) {
  %t = alloca ptr
  store ptr %p_t, ptr %t
  %t2175 = load ptr, ptr %t
  %t2176 = getelementptr inbounds [7 x i8], ptr @.str.s245, i64 0, i64 0
  %t2177 = call i32 @str_equals(ptr %t2175, ptr %t2176)
  %t2178 = icmp eq i32 %t2177, 1
  br i1 %t2178, label %label_837, label %label_839
label_837:
  %t2179 = getelementptr inbounds [4 x i8], ptr @.str.s246, i64 0, i64 0
  ret ptr %t2179
label_839:
  %t2180 = load ptr, ptr %t
  %t2181 = call i1 @is_struct_type_key(ptr %t2180)
  br i1 %t2181, label %label_840, label %label_842
label_840:
  %t2182 = getelementptr inbounds [4 x i8], ptr @.str.s247, i64 0, i64 0
  ret ptr %t2182
label_842:
  %t2183 = load ptr, ptr %t
  ret ptr %t2183
}

define i32 @count_list_nodes(ptr %p_first_ptr) {
  %first_ptr = alloca ptr
  %count = alloca i32
  %curr = alloca ptr
  %node = alloca ptr
  store ptr %p_first_ptr, ptr %first_ptr
  store i32 0, ptr %count
  %t2187 = load ptr, ptr %first_ptr
  store ptr %t2187, ptr %curr
  br label %label_843
label_843:
  %t2188 = load ptr, ptr %curr
  %t2189 = getelementptr inbounds [1 x i8], ptr @.str.s248, i64 0, i64 0
  %t2190 = call i32 @str_equals(ptr %t2188, ptr %t2189)
  %t2191 = icmp eq i32 %t2190, 0
  br i1 %t2191, label %label_844, label %label_845
label_844:
  %t2193 = load ptr, ptr %curr
  %t2194 = call ptr @ptr_to_node(ptr %t2193)
  store ptr %t2194, ptr %node
  %t2195 = load i32, ptr %count
  %t2196 = add i32 %t2195, 1
  store i32 %t2196, ptr %count
  %t2197 = load ptr, ptr %node
  %t2198 = getelementptr inbounds %ASTNode, ptr %t2197, i32 0, i32 8
  %t2199 = load ptr, ptr %t2198
  store ptr %t2199, ptr %curr
  br label %label_843
label_845:
  %t2200 = load i32, ptr %count
  ret i32 %t2200
}

define ptr @fn_key(ptr %p_name) {
  %name = alloca ptr
  store ptr %p_name, ptr %name
  %t2202 = getelementptr inbounds [5 x i8], ptr @.str.s249, i64 0, i64 0
  %t2203 = load ptr, ptr %name
  %t2204 = call ptr @str_concat(ptr %t2202, ptr %t2203)
  ret ptr %t2204
}

define ptr @get_declared_return_type(ptr %p_node, ptr %p_ret_child) {
  %node = alloca ptr
  %ret_child = alloca ptr
  %ret_node = alloca ptr
  store ptr %p_node, ptr %node
  store ptr %p_ret_child, ptr %ret_child
  %t2207 = load ptr, ptr %ret_child
  %t2208 = getelementptr inbounds [1 x i8], ptr @.str.s250, i64 0, i64 0
  %t2209 = call i32 @str_equals(ptr %t2207, ptr %t2208)
  %t2210 = icmp eq i32 %t2209, 0
  br i1 %t2210, label %label_846, label %label_848
label_846:
  %t2212 = load ptr, ptr %ret_child
  %t2213 = call ptr @ptr_to_node(ptr %t2212)
  store ptr %t2213, ptr %ret_node
  %t2214 = load ptr, ptr %ret_node
  %t2215 = call ptr @map_type_node(ptr %t2214)
  ret ptr %t2215
label_848:
  %t2216 = getelementptr inbounds [5 x i8], ptr @.str.s251, i64 0, i64 0
  ret ptr %t2216
}

define ptr @get_expr_type(ptr %p_expr) {
  %expr = alloca ptr
  %op = alloca ptr
  %callee = alloca ptr
  %func_name = alloca ptr
  %obj_type = alloca ptr
  %object_node = alloca ptr
  %enum_val = alloca i32
  %object_type = alloca ptr
  store ptr %p_expr, ptr %expr
  %t2218 = load ptr, ptr %expr
  %t2219 = getelementptr inbounds %ASTNode, ptr %t2218, i32 0, i32 0
  %t2220 = load i32, ptr %t2219
  %t2221 = icmp eq i32 %t2220, 22
  br i1 %t2221, label %label_849, label %label_851
label_849:
  %t2222 = load ptr, ptr %expr
  %t2223 = getelementptr inbounds %ASTNode, ptr %t2222, i32 0, i32 3
  %t2224 = load i32, ptr %t2223
  %t2225 = icmp eq i32 %t2224, 2
  br i1 %t2225, label %label_852, label %label_854
label_852:
  %t2226 = getelementptr inbounds [4 x i8], ptr @.str.s252, i64 0, i64 0
  ret ptr %t2226
label_854:
  %t2227 = load ptr, ptr %expr
  %t2228 = getelementptr inbounds %ASTNode, ptr %t2227, i32 0, i32 3
  %t2229 = load i32, ptr %t2228
  %t2230 = icmp eq i32 %t2229, 3
  br i1 %t2230, label %label_855, label %label_857
label_855:
  %t2231 = getelementptr inbounds [3 x i8], ptr @.str.s253, i64 0, i64 0
  ret ptr %t2231
label_857:
  %t2232 = load ptr, ptr %expr
  %t2233 = getelementptr inbounds %ASTNode, ptr %t2232, i32 0, i32 3
  %t2234 = load i32, ptr %t2233
  %t2235 = icmp eq i32 %t2234, 1
  br i1 %t2235, label %label_858, label %label_860
label_858:
  %t2236 = getelementptr inbounds [3 x i8], ptr @.str.s254, i64 0, i64 0
  ret ptr %t2236
label_860:
  %t2237 = load ptr, ptr %expr
  %t2238 = getelementptr inbounds %ASTNode, ptr %t2237, i32 0, i32 3
  %t2239 = load i32, ptr %t2238
  %t2240 = icmp eq i32 %t2239, 0
  br i1 %t2240, label %label_861, label %label_863
label_861:
  %t2241 = getelementptr inbounds [4 x i8], ptr @.str.s255, i64 0, i64 0
  ret ptr %t2241
label_863:
  br label %label_851
label_851:
  %t2242 = load ptr, ptr %expr
  %t2243 = getelementptr inbounds %ASTNode, ptr %t2242, i32 0, i32 0
  %t2244 = load i32, ptr %t2243
  %t2245 = icmp eq i32 %t2244, 23
  br i1 %t2245, label %label_864, label %label_866
label_864:
  %t2246 = load ptr, ptr %expr
  %t2247 = getelementptr inbounds %ASTNode, ptr %t2246, i32 0, i32 1
  %t2248 = load ptr, ptr %t2247
  %t2249 = call ptr @ir_get_var_type(ptr %t2248)
  ret ptr %t2249
label_866:
  %t2250 = load ptr, ptr %expr
  %t2251 = getelementptr inbounds %ASTNode, ptr %t2250, i32 0, i32 0
  %t2252 = load i32, ptr %t2251
  %t2253 = icmp eq i32 %t2252, 20
  br i1 %t2253, label %label_867, label %label_869
label_867:
  %t2255 = load ptr, ptr %expr
  %t2256 = getelementptr inbounds %ASTNode, ptr %t2255, i32 0, i32 1
  %t2257 = load ptr, ptr %t2256
  store ptr %t2257, ptr %op
  %t2258 = load ptr, ptr %op
  %t2259 = getelementptr inbounds [3 x i8], ptr @.str.s256, i64 0, i64 0
  %t2260 = call i32 @str_equals(ptr %t2258, ptr %t2259)
  %t2261 = icmp eq i32 %t2260, 1
  %t2262 = load ptr, ptr %op
  %t2263 = getelementptr inbounds [3 x i8], ptr @.str.s257, i64 0, i64 0
  %t2264 = call i32 @str_equals(ptr %t2262, ptr %t2263)
  %t2265 = icmp eq i32 %t2264, 1
  %t2266 = or i1 %t2261, %t2265
  br i1 %t2266, label %label_870, label %label_872
label_870:
  %t2267 = getelementptr inbounds [3 x i8], ptr @.str.s258, i64 0, i64 0
  ret ptr %t2267
label_872:
  %t2268 = load ptr, ptr %op
  %t2269 = getelementptr inbounds [2 x i8], ptr @.str.s259, i64 0, i64 0
  %t2270 = call i32 @str_equals(ptr %t2268, ptr %t2269)
  %t2271 = icmp eq i32 %t2270, 1
  %t2272 = load ptr, ptr %op
  %t2273 = getelementptr inbounds [3 x i8], ptr @.str.s260, i64 0, i64 0
  %t2274 = call i32 @str_equals(ptr %t2272, ptr %t2273)
  %t2275 = icmp eq i32 %t2274, 1
  %t2276 = or i1 %t2271, %t2275
  br i1 %t2276, label %label_873, label %label_875
label_873:
  %t2277 = getelementptr inbounds [3 x i8], ptr @.str.s261, i64 0, i64 0
  ret ptr %t2277
label_875:
  %t2278 = load ptr, ptr %op
  %t2279 = getelementptr inbounds [2 x i8], ptr @.str.s262, i64 0, i64 0
  %t2280 = call i32 @str_equals(ptr %t2278, ptr %t2279)
  %t2281 = icmp eq i32 %t2280, 1
  %t2282 = load ptr, ptr %op
  %t2283 = getelementptr inbounds [3 x i8], ptr @.str.s263, i64 0, i64 0
  %t2284 = call i32 @str_equals(ptr %t2282, ptr %t2283)
  %t2285 = icmp eq i32 %t2284, 1
  %t2286 = or i1 %t2281, %t2285
  br i1 %t2286, label %label_876, label %label_878
label_876:
  %t2287 = getelementptr inbounds [3 x i8], ptr @.str.s264, i64 0, i64 0
  ret ptr %t2287
label_878:
  %t2288 = load ptr, ptr %op
  %t2289 = getelementptr inbounds [4 x i8], ptr @.str.s265, i64 0, i64 0
  %t2290 = call i32 @str_equals(ptr %t2288, ptr %t2289)
  %t2291 = icmp eq i32 %t2290, 1
  %t2292 = load ptr, ptr %op
  %t2293 = getelementptr inbounds [3 x i8], ptr @.str.s266, i64 0, i64 0
  %t2294 = call i32 @str_equals(ptr %t2292, ptr %t2293)
  %t2295 = icmp eq i32 %t2294, 1
  %t2296 = or i1 %t2291, %t2295
  br i1 %t2296, label %label_879, label %label_881
label_879:
  %t2297 = getelementptr inbounds [3 x i8], ptr @.str.s267, i64 0, i64 0
  ret ptr %t2297
label_881:
  %t2298 = load ptr, ptr %expr
  %t2299 = getelementptr inbounds %ASTNode, ptr %t2298, i32 0, i32 5
  %t2300 = load ptr, ptr %t2299
  %t2301 = call ptr @ptr_to_node(ptr %t2300)
  %t2302 = call ptr @get_expr_type(ptr %t2301)
  ret ptr %t2302
label_869:
  %t2303 = load ptr, ptr %expr
  %t2304 = getelementptr inbounds %ASTNode, ptr %t2303, i32 0, i32 0
  %t2305 = load i32, ptr %t2304
  %t2306 = icmp eq i32 %t2305, 24
  br i1 %t2306, label %label_882, label %label_884
label_882:
  %t2308 = load ptr, ptr %expr
  %t2309 = getelementptr inbounds %ASTNode, ptr %t2308, i32 0, i32 5
  %t2310 = load ptr, ptr %t2309
  %t2311 = call ptr @ptr_to_node(ptr %t2310)
  store ptr %t2311, ptr %callee
  %t2313 = load ptr, ptr %callee
  %t2314 = getelementptr inbounds %ASTNode, ptr %t2313, i32 0, i32 1
  %t2315 = load ptr, ptr %t2314
  store ptr %t2315, ptr %func_name
  %t2316 = load ptr, ptr %func_name
  %t2317 = getelementptr inbounds [6 x i8], ptr @.str.s268, i64 0, i64 0
  %t2318 = call i32 @str_equals(ptr %t2316, ptr %t2317)
  %t2319 = icmp eq i32 %t2318, 1
  %t2320 = load ptr, ptr %func_name
  %t2321 = getelementptr inbounds [8 x i8], ptr @.str.s269, i64 0, i64 0
  %t2322 = call i32 @str_equals(ptr %t2320, ptr %t2321)
  %t2323 = icmp eq i32 %t2322, 1
  %t2324 = or i1 %t2319, %t2323
  br i1 %t2324, label %label_885, label %label_887
label_885:
  %t2325 = getelementptr inbounds [5 x i8], ptr @.str.s270, i64 0, i64 0
  ret ptr %t2325
label_887:
  %t2326 = load ptr, ptr %func_name
  %t2327 = getelementptr inbounds [10 x i8], ptr @.str.s271, i64 0, i64 0
  %t2328 = call i32 @str_equals(ptr %t2326, ptr %t2327)
  %t2329 = icmp eq i32 %t2328, 1
  %t2330 = load ptr, ptr %func_name
  %t2331 = getelementptr inbounds [12 x i8], ptr @.str.s272, i64 0, i64 0
  %t2332 = call i32 @str_equals(ptr %t2330, ptr %t2331)
  %t2333 = icmp eq i32 %t2332, 1
  %t2334 = or i1 %t2329, %t2333
  br i1 %t2334, label %label_888, label %label_890
label_888:
  %t2335 = getelementptr inbounds [5 x i8], ptr @.str.s273, i64 0, i64 0
  ret ptr %t2335
label_890:
  %t2336 = load ptr, ptr %func_name
  %t2337 = getelementptr inbounds [13 x i8], ptr @.str.s274, i64 0, i64 0
  %t2338 = call i32 @str_equals(ptr %t2336, ptr %t2337)
  %t2339 = icmp eq i32 %t2338, 1
  %t2340 = load ptr, ptr %func_name
  %t2341 = getelementptr inbounds [11 x i8], ptr @.str.s275, i64 0, i64 0
  %t2342 = call i32 @str_equals(ptr %t2340, ptr %t2341)
  %t2343 = icmp eq i32 %t2342, 1
  %t2344 = or i1 %t2339, %t2343
  br i1 %t2344, label %label_891, label %label_893
label_891:
  %t2345 = getelementptr inbounds [5 x i8], ptr @.str.s276, i64 0, i64 0
  ret ptr %t2345
label_893:
  %t2346 = load ptr, ptr %func_name
  %t2347 = getelementptr inbounds [13 x i8], ptr @.str.s277, i64 0, i64 0
  %t2348 = call i32 @str_equals(ptr %t2346, ptr %t2347)
  %t2349 = icmp eq i32 %t2348, 1
  %t2350 = load ptr, ptr %func_name
  %t2351 = getelementptr inbounds [11 x i8], ptr @.str.s278, i64 0, i64 0
  %t2352 = call i32 @str_equals(ptr %t2350, ptr %t2351)
  %t2353 = icmp eq i32 %t2352, 1
  %t2354 = or i1 %t2349, %t2353
  br i1 %t2354, label %label_894, label %label_896
label_894:
  %t2355 = getelementptr inbounds [5 x i8], ptr @.str.s279, i64 0, i64 0
  ret ptr %t2355
label_896:
  %t2356 = load ptr, ptr %func_name
  %t2357 = call ptr @fn_key(ptr %t2356)
  %t2358 = call ptr @ir_get_var_type(ptr %t2357)
  ret ptr %t2358
label_884:
  %t2359 = load ptr, ptr %expr
  %t2360 = getelementptr inbounds %ASTNode, ptr %t2359, i32 0, i32 0
  %t2361 = load i32, ptr %t2360
  %t2362 = icmp eq i32 %t2361, 26
  br i1 %t2362, label %label_897, label %label_899
label_897:
  %t2364 = load ptr, ptr %expr
  %t2365 = getelementptr inbounds %ASTNode, ptr %t2364, i32 0, i32 5
  %t2366 = load ptr, ptr %t2365
  %t2367 = call ptr @ptr_to_node(ptr %t2366)
  %t2368 = call ptr @get_expr_type(ptr %t2367)
  store ptr %t2368, ptr %obj_type
  %t2369 = load ptr, ptr %obj_type
  %t2370 = getelementptr inbounds [7 x i8], ptr @.str.s280, i64 0, i64 0
  %t2371 = call i32 @str_equals(ptr %t2369, ptr %t2370)
  %t2372 = icmp eq i32 %t2371, 1
  br i1 %t2372, label %label_900, label %label_902
label_900:
  %t2373 = getelementptr inbounds [4 x i8], ptr @.str.s281, i64 0, i64 0
  ret ptr %t2373
label_902:
  %t2374 = getelementptr inbounds [4 x i8], ptr @.str.s282, i64 0, i64 0
  ret ptr %t2374
label_899:
  %t2375 = load ptr, ptr %expr
  %t2376 = getelementptr inbounds %ASTNode, ptr %t2375, i32 0, i32 0
  %t2377 = load i32, ptr %t2376
  %t2378 = icmp eq i32 %t2377, 25
  br i1 %t2378, label %label_903, label %label_905
label_903:
  %t2380 = load ptr, ptr %expr
  %t2381 = getelementptr inbounds %ASTNode, ptr %t2380, i32 0, i32 5
  %t2382 = load ptr, ptr %t2381
  %t2383 = call ptr @ptr_to_node(ptr %t2382)
  store ptr %t2383, ptr %object_node
  %t2384 = load ptr, ptr %object_node
  %t2385 = getelementptr inbounds %ASTNode, ptr %t2384, i32 0, i32 0
  %t2386 = load i32, ptr %t2385
  %t2387 = icmp eq i32 %t2386, 23
  br i1 %t2387, label %label_906, label %label_908
label_906:
  %t2389 = load ptr, ptr %object_node
  %t2390 = getelementptr inbounds %ASTNode, ptr %t2389, i32 0, i32 1
  %t2391 = load ptr, ptr %t2390
  %t2392 = load ptr, ptr %expr
  %t2393 = getelementptr inbounds %ASTNode, ptr %t2392, i32 0, i32 1
  %t2394 = load ptr, ptr %t2393
  %t2395 = call i32 @ir_get_enum_variant(ptr %t2391, ptr %t2394)
  store i32 %t2395, ptr %enum_val
  %t2396 = load i32, ptr %enum_val
  %t2397 = icmp sge i32 %t2396, 0
  br i1 %t2397, label %label_909, label %label_911
label_909:
  %t2398 = getelementptr inbounds [4 x i8], ptr @.str.s283, i64 0, i64 0
  ret ptr %t2398
label_911:
  br label %label_908
label_908:
  %t2400 = load ptr, ptr %object_node
  %t2401 = call ptr @get_expr_type(ptr %t2400)
  store ptr %t2401, ptr %object_type
  %t2402 = load ptr, ptr %object_type
  %t2403 = call i1 @is_struct_type_key(ptr %t2402)
  br i1 %t2403, label %label_912, label %label_914
label_912:
  %t2404 = load ptr, ptr %object_type
  %t2405 = call ptr @struct_type_name(ptr %t2404)
  %t2406 = load ptr, ptr %expr
  %t2407 = getelementptr inbounds %ASTNode, ptr %t2406, i32 0, i32 1
  %t2408 = load ptr, ptr %t2407
  %t2409 = call ptr @ir_get_struct_field_type(ptr %t2405, ptr %t2408)
  ret ptr %t2409
label_914:
  %t2410 = getelementptr inbounds [4 x i8], ptr @.str.s284, i64 0, i64 0
  ret ptr %t2410
label_905:
  %t2411 = load ptr, ptr %expr
  %t2412 = getelementptr inbounds %ASTNode, ptr %t2411, i32 0, i32 0
  %t2413 = load i32, ptr %t2412
  %t2414 = icmp eq i32 %t2413, 27
  br i1 %t2414, label %label_915, label %label_917
label_915:
  %t2415 = getelementptr inbounds [4 x i8], ptr @.str.s285, i64 0, i64 0
  ret ptr %t2415
label_917:
  %t2416 = load ptr, ptr %expr
  %t2417 = getelementptr inbounds %ASTNode, ptr %t2416, i32 0, i32 0
  %t2418 = load i32, ptr %t2417
  %t2419 = icmp eq i32 %t2418, 28
  br i1 %t2419, label %label_918, label %label_920
label_918:
  %t2420 = load ptr, ptr %expr
  %t2421 = getelementptr inbounds %ASTNode, ptr %t2420, i32 0, i32 1
  %t2422 = load ptr, ptr %t2421
  %t2423 = call ptr @struct_type_key(ptr %t2422)
  ret ptr %t2423
label_920:
  %t2424 = getelementptr inbounds [4 x i8], ptr @.str.s286, i64 0, i64 0
  ret ptr %t2424
}

define ptr @generate_expression(ptr %p_expr) {
  %expr = alloca ptr
  %str_name = alloca ptr
  %str_len = alloca i32
  %len_plus_one = alloca i32
  %temp = alloca i32
  %tname = alloca ptr
  %struct_name = alloca ptr
  %size_ptr_temp = alloca i32
  %size_ptr_name = alloca ptr
  %size_temp = alloca i32
  %size_name = alloca ptr
  %mem_temp = alloca i32
  %mem_name = alloca ptr
  %field_ptr = alloca ptr
  %field = alloca ptr
  %field_val = alloca ptr
  %field_type = alloca ptr
  %field_index = alloca i32
  %gep_temp = alloca i32
  %gep_name = alloca ptr
  %val_type = alloca ptr
  %load_type = alloca ptr
  %temp_id = alloca i32
  %object_node = alloca ptr
  %enum_val = alloca i32
  %object_val = alloca ptr
  %object_type = alloca ptr
  %load_temp = alloca i32
  %load_name = alloca ptr
  %elem_count = alloca i32
  %first_elem = alloca ptr
  %is_nested = alloca i32
  %arr_temp = alloca i32
  %arr_name = alloca ptr
  %elem_ptr = alloca ptr
  %elem_index = alloca i32
  %elem_node = alloca ptr
  %inner_ptr = alloca ptr
  %slot_temp = alloca i32
  %slot_name = alloca ptr
  %ret_temp = alloca i32
  %ret_name = alloca ptr
  %arr_temp2 = alloca i32
  %arr_name2 = alloca ptr
  %elem_ptr2 = alloca ptr
  %elem_index2 = alloca i32
  %elem_node2 = alloca ptr
  %elem_val = alloca ptr
  %elem_slot_temp = alloca i32
  %elem_slot_name = alloca ptr
  %ret_temp2 = alloca i32
  %ret_name2 = alloca ptr
  %array_val = alloca ptr
  %index_val = alloca ptr
  %obj_type = alloca ptr
  %elem_type = alloca ptr
  %ptr_temp = alloca i32
  %ptr_name = alloca ptr
  %left_val = alloca ptr
  %right_val = alloca ptr
  %op = alloca ptr
  %op_type = alloca ptr
  %callee = alloca ptr
  %func_name = alloca ptr
  %is_print = alloca i32
  %arg_ptr = alloca ptr
  %arg_node = alloca ptr
  %arg_val = alloca ptr
  %arg_type = alloca ptr
  %ret_type = alloca ptr
  store ptr %p_expr, ptr %expr
  %t2426 = load ptr, ptr %expr
  %t2427 = getelementptr inbounds %ASTNode, ptr %t2426, i32 0, i32 0
  %t2428 = load i32, ptr %t2427
  %t2429 = icmp eq i32 %t2428, 22
  br i1 %t2429, label %label_921, label %label_923
label_921:
  %t2430 = load ptr, ptr %expr
  %t2431 = getelementptr inbounds %ASTNode, ptr %t2430, i32 0, i32 3
  %t2432 = load i32, ptr %t2431
  %t2433 = icmp eq i32 %t2432, 2
  br i1 %t2433, label %label_924, label %label_926
label_924:
  %t2434 = load ptr, ptr %expr
  %t2435 = getelementptr inbounds %ASTNode, ptr %t2434, i32 0, i32 1
  %t2436 = load ptr, ptr %t2435
  ret ptr %t2436
label_926:
  %t2437 = load ptr, ptr %expr
  %t2438 = getelementptr inbounds %ASTNode, ptr %t2437, i32 0, i32 3
  %t2439 = load i32, ptr %t2438
  %t2440 = icmp eq i32 %t2439, 3
  br i1 %t2440, label %label_927, label %label_929
label_927:
  %t2441 = load ptr, ptr %expr
  %t2442 = getelementptr inbounds %ASTNode, ptr %t2441, i32 0, i32 1
  %t2443 = load ptr, ptr %t2442
  %t2444 = getelementptr inbounds [5 x i8], ptr @.str.s287, i64 0, i64 0
  %t2445 = call i32 @str_equals(ptr %t2443, ptr %t2444)
  %t2446 = icmp eq i32 %t2445, 1
  br i1 %t2446, label %label_930, label %label_932
label_930:
  %t2447 = getelementptr inbounds [2 x i8], ptr @.str.s288, i64 0, i64 0
  ret ptr %t2447
label_932:
  %t2448 = getelementptr inbounds [2 x i8], ptr @.str.s289, i64 0, i64 0
  ret ptr %t2448
label_929:
  %t2449 = load ptr, ptr %expr
  %t2450 = getelementptr inbounds %ASTNode, ptr %t2449, i32 0, i32 3
  %t2451 = load i32, ptr %t2450
  %t2452 = icmp eq i32 %t2451, 1
  br i1 %t2452, label %label_933, label %label_935
label_933:
  %t2453 = load ptr, ptr %expr
  %t2454 = getelementptr inbounds %ASTNode, ptr %t2453, i32 0, i32 1
  %t2455 = load ptr, ptr %t2454
  ret ptr %t2455
label_935:
  %t2456 = load ptr, ptr %expr
  %t2457 = getelementptr inbounds %ASTNode, ptr %t2456, i32 0, i32 3
  %t2458 = load i32, ptr %t2457
  %t2459 = icmp eq i32 %t2458, 0
  br i1 %t2459, label %label_936, label %label_938
label_936:
  %t2461 = load ptr, ptr %expr
  %t2462 = getelementptr inbounds %ASTNode, ptr %t2461, i32 0, i32 2
  %t2463 = load ptr, ptr %t2462
  store ptr %t2463, ptr %str_name
  %t2465 = load ptr, ptr %expr
  %t2466 = getelementptr inbounds %ASTNode, ptr %t2465, i32 0, i32 1
  %t2467 = load ptr, ptr %t2466
  %t2468 = call i32 @str_length(ptr %t2467)
  store i32 %t2468, ptr %str_len
  %t2470 = load i32, ptr %str_len
  %t2471 = add i32 %t2470, 1
  store i32 %t2471, ptr %len_plus_one
  %t2473 = call i32 @ir_get_temp()
  store i32 %t2473, ptr %temp
  %t2475 = load i32, ptr %temp
  %t2476 = call ptr @ir_get_temp_name(i32 %t2475)
  store ptr %t2476, ptr %tname
  %t2477 = getelementptr inbounds [3 x i8], ptr @.str.s290, i64 0, i64 0
  call void @ir_append(ptr %t2477)
  %t2478 = load ptr, ptr %tname
  call void @ir_append(ptr %t2478)
  %t2479 = getelementptr inbounds [28 x i8], ptr @.str.s291, i64 0, i64 0
  call void @ir_append(ptr %t2479)
  %t2480 = load i32, ptr %len_plus_one
  %t2481 = call ptr @int_to_str(i32 %t2480)
  call void @ir_append(ptr %t2481)
  %t2482 = getelementptr inbounds [14 x i8], ptr @.str.s292, i64 0, i64 0
  call void @ir_append(ptr %t2482)
  %t2483 = load ptr, ptr %str_name
  call void @ir_append(ptr %t2483)
  %t2484 = getelementptr inbounds [15 x i8], ptr @.str.s293, i64 0, i64 0
  call void @ir_append_line(ptr %t2484)
  %t2485 = load ptr, ptr %tname
  ret ptr %t2485
label_938:
  br label %label_923
label_923:
  %t2486 = load ptr, ptr %expr
  %t2487 = getelementptr inbounds %ASTNode, ptr %t2486, i32 0, i32 0
  %t2488 = load i32, ptr %t2487
  %t2489 = icmp eq i32 %t2488, 28
  br i1 %t2489, label %label_939, label %label_941
label_939:
  %t2491 = load ptr, ptr %expr
  %t2492 = getelementptr inbounds %ASTNode, ptr %t2491, i32 0, i32 1
  %t2493 = load ptr, ptr %t2492
  store ptr %t2493, ptr %struct_name
  %t2495 = call i32 @ir_get_temp()
  store i32 %t2495, ptr %size_ptr_temp
  %t2497 = load i32, ptr %size_ptr_temp
  %t2498 = call ptr @ir_get_temp_name(i32 %t2497)
  store ptr %t2498, ptr %size_ptr_name
  %t2499 = getelementptr inbounds [3 x i8], ptr @.str.s294, i64 0, i64 0
  call void @ir_append(ptr %t2499)
  %t2500 = load ptr, ptr %size_ptr_name
  call void @ir_append(ptr %t2500)
  %t2501 = getelementptr inbounds [18 x i8], ptr @.str.s295, i64 0, i64 0
  call void @ir_append(ptr %t2501)
  %t2502 = getelementptr inbounds [2 x i8], ptr @.str.s296, i64 0, i64 0
  %t2503 = load ptr, ptr %struct_name
  %t2504 = call ptr @str_concat(ptr %t2502, ptr %t2503)
  call void @ir_append(ptr %t2504)
  %t2505 = getelementptr inbounds [18 x i8], ptr @.str.s297, i64 0, i64 0
  call void @ir_append_line(ptr %t2505)
  %t2507 = call i32 @ir_get_temp()
  store i32 %t2507, ptr %size_temp
  %t2509 = load i32, ptr %size_temp
  %t2510 = call ptr @ir_get_temp_name(i32 %t2509)
  store ptr %t2510, ptr %size_name
  %t2511 = getelementptr inbounds [3 x i8], ptr @.str.s298, i64 0, i64 0
  call void @ir_append(ptr %t2511)
  %t2512 = load ptr, ptr %size_name
  call void @ir_append(ptr %t2512)
  %t2513 = getelementptr inbounds [17 x i8], ptr @.str.s299, i64 0, i64 0
  call void @ir_append(ptr %t2513)
  %t2514 = load ptr, ptr %size_ptr_name
  call void @ir_append(ptr %t2514)
  %t2515 = getelementptr inbounds [8 x i8], ptr @.str.s300, i64 0, i64 0
  call void @ir_append_line(ptr %t2515)
  %t2517 = call i32 @ir_get_temp()
  store i32 %t2517, ptr %mem_temp
  %t2519 = load i32, ptr %mem_temp
  %t2520 = call ptr @ir_get_temp_name(i32 %t2519)
  store ptr %t2520, ptr %mem_name
  %t2521 = getelementptr inbounds [3 x i8], ptr @.str.s301, i64 0, i64 0
  call void @ir_append(ptr %t2521)
  %t2522 = load ptr, ptr %mem_name
  call void @ir_append(ptr %t2522)
  %t2523 = getelementptr inbounds [25 x i8], ptr @.str.s302, i64 0, i64 0
  call void @ir_append(ptr %t2523)
  %t2524 = load ptr, ptr %size_name
  call void @ir_append(ptr %t2524)
  %t2525 = getelementptr inbounds [2 x i8], ptr @.str.s303, i64 0, i64 0
  call void @ir_append_line(ptr %t2525)
  %t2527 = load ptr, ptr %expr
  %t2528 = getelementptr inbounds %ASTNode, ptr %t2527, i32 0, i32 5
  %t2529 = load ptr, ptr %t2528
  store ptr %t2529, ptr %field_ptr
  br label %label_942
label_942:
  %t2530 = load ptr, ptr %field_ptr
  %t2531 = getelementptr inbounds [1 x i8], ptr @.str.s304, i64 0, i64 0
  %t2532 = call i32 @str_equals(ptr %t2530, ptr %t2531)
  %t2533 = icmp eq i32 %t2532, 0
  br i1 %t2533, label %label_943, label %label_944
label_943:
  %t2535 = load ptr, ptr %field_ptr
  %t2536 = call ptr @ptr_to_node(ptr %t2535)
  store ptr %t2536, ptr %field
  %t2538 = load ptr, ptr %field
  %t2539 = getelementptr inbounds %ASTNode, ptr %t2538, i32 0, i32 5
  %t2540 = load ptr, ptr %t2539
  %t2541 = call ptr @ptr_to_node(ptr %t2540)
  %t2542 = call ptr @generate_expression(ptr %t2541)
  store ptr %t2542, ptr %field_val
  %t2544 = load ptr, ptr %struct_name
  %t2545 = load ptr, ptr %field
  %t2546 = getelementptr inbounds %ASTNode, ptr %t2545, i32 0, i32 1
  %t2547 = load ptr, ptr %t2546
  %t2548 = call ptr @ir_get_struct_field_type(ptr %t2544, ptr %t2547)
  %t2549 = call ptr @storage_type(ptr %t2548)
  store ptr %t2549, ptr %field_type
  %t2551 = load ptr, ptr %struct_name
  %t2552 = load ptr, ptr %field
  %t2553 = getelementptr inbounds %ASTNode, ptr %t2552, i32 0, i32 1
  %t2554 = load ptr, ptr %t2553
  %t2555 = call i32 @ir_get_struct_field_index(ptr %t2551, ptr %t2554)
  store i32 %t2555, ptr %field_index
  %t2557 = call i32 @ir_get_temp()
  store i32 %t2557, ptr %gep_temp
  %t2559 = load i32, ptr %gep_temp
  %t2560 = call ptr @ir_get_temp_name(i32 %t2559)
  store ptr %t2560, ptr %gep_name
  %t2561 = getelementptr inbounds [3 x i8], ptr @.str.s305, i64 0, i64 0
  call void @ir_append(ptr %t2561)
  %t2562 = load ptr, ptr %gep_name
  call void @ir_append(ptr %t2562)
  %t2563 = getelementptr inbounds [27 x i8], ptr @.str.s306, i64 0, i64 0
  call void @ir_append(ptr %t2563)
  %t2564 = getelementptr inbounds [2 x i8], ptr @.str.s307, i64 0, i64 0
  %t2565 = load ptr, ptr %struct_name
  %t2566 = call ptr @str_concat(ptr %t2564, ptr %t2565)
  call void @ir_append(ptr %t2566)
  %t2567 = getelementptr inbounds [7 x i8], ptr @.str.s308, i64 0, i64 0
  call void @ir_append(ptr %t2567)
  %t2568 = load ptr, ptr %mem_name
  call void @ir_append(ptr %t2568)
  %t2569 = getelementptr inbounds [14 x i8], ptr @.str.s309, i64 0, i64 0
  call void @ir_append(ptr %t2569)
  %t2570 = load i32, ptr %field_index
  %t2571 = call ptr @int_to_str(i32 %t2570)
  call void @ir_append_line(ptr %t2571)
  %t2572 = getelementptr inbounds [9 x i8], ptr @.str.s310, i64 0, i64 0
  call void @ir_append(ptr %t2572)
  %t2573 = load ptr, ptr %field_type
  call void @ir_append(ptr %t2573)
  %t2574 = getelementptr inbounds [2 x i8], ptr @.str.s311, i64 0, i64 0
  call void @ir_append(ptr %t2574)
  %t2575 = load ptr, ptr %field_val
  call void @ir_append(ptr %t2575)
  %t2576 = getelementptr inbounds [7 x i8], ptr @.str.s312, i64 0, i64 0
  call void @ir_append(ptr %t2576)
  %t2577 = load ptr, ptr %gep_name
  call void @ir_append_line(ptr %t2577)
  %t2578 = load ptr, ptr %field
  %t2579 = getelementptr inbounds %ASTNode, ptr %t2578, i32 0, i32 8
  %t2580 = load ptr, ptr %t2579
  store ptr %t2580, ptr %field_ptr
  br label %label_942
label_944:
  %t2581 = load ptr, ptr %mem_name
  ret ptr %t2581
label_941:
  %t2582 = load ptr, ptr %expr
  %t2583 = getelementptr inbounds %ASTNode, ptr %t2582, i32 0, i32 0
  %t2584 = load i32, ptr %t2583
  %t2585 = icmp eq i32 %t2584, 23
  br i1 %t2585, label %label_945, label %label_947
label_945:
  %t2587 = load ptr, ptr %expr
  %t2588 = getelementptr inbounds %ASTNode, ptr %t2587, i32 0, i32 1
  %t2589 = load ptr, ptr %t2588
  %t2590 = call ptr @ir_get_var_type(ptr %t2589)
  store ptr %t2590, ptr %val_type
  %t2592 = load ptr, ptr %val_type
  %t2593 = call ptr @storage_type(ptr %t2592)
  store ptr %t2593, ptr %load_type
  %t2594 = load ptr, ptr %expr
  %t2595 = getelementptr inbounds %ASTNode, ptr %t2594, i32 0, i32 1
  %t2596 = load ptr, ptr %t2595
  %t2597 = call i32 @ir_is_global_name(ptr %t2596)
  %t2598 = icmp eq i32 %t2597, 1
  br i1 %t2598, label %label_948, label %label_949
label_948:
  %t2600 = load ptr, ptr %load_type
  %t2601 = load ptr, ptr %expr
  %t2602 = getelementptr inbounds %ASTNode, ptr %t2601, i32 0, i32 1
  %t2603 = load ptr, ptr %t2602
  %t2604 = call i32 @ir_load_global(ptr %t2600, ptr %t2603)
  store i32 %t2604, ptr %temp_id
  %t2605 = load i32, ptr %temp_id
  %t2606 = call ptr @ir_get_temp_name(i32 %t2605)
  ret ptr %t2606
label_949:
  %t2607 = load ptr, ptr %load_type
  %t2608 = load ptr, ptr %expr
  %t2609 = getelementptr inbounds %ASTNode, ptr %t2608, i32 0, i32 1
  %t2610 = load ptr, ptr %t2609
  %t2611 = call i32 @ir_load(ptr %t2607, ptr %t2610)
  store i32 %t2611, ptr %temp_id
  %t2612 = load i32, ptr %temp_id
  %t2613 = call ptr @ir_get_temp_name(i32 %t2612)
  ret ptr %t2613
label_950:
  br label %label_947
label_947:
  %t2614 = load ptr, ptr %expr
  %t2615 = getelementptr inbounds %ASTNode, ptr %t2614, i32 0, i32 0
  %t2616 = load i32, ptr %t2615
  %t2617 = icmp eq i32 %t2616, 25
  br i1 %t2617, label %label_951, label %label_953
label_951:
  %t2619 = load ptr, ptr %expr
  %t2620 = getelementptr inbounds %ASTNode, ptr %t2619, i32 0, i32 5
  %t2621 = load ptr, ptr %t2620
  %t2622 = call ptr @ptr_to_node(ptr %t2621)
  store ptr %t2622, ptr %object_node
  %t2623 = load ptr, ptr %object_node
  %t2624 = getelementptr inbounds %ASTNode, ptr %t2623, i32 0, i32 0
  %t2625 = load i32, ptr %t2624
  %t2626 = icmp eq i32 %t2625, 23
  br i1 %t2626, label %label_954, label %label_956
label_954:
  %t2628 = load ptr, ptr %object_node
  %t2629 = getelementptr inbounds %ASTNode, ptr %t2628, i32 0, i32 1
  %t2630 = load ptr, ptr %t2629
  %t2631 = load ptr, ptr %expr
  %t2632 = getelementptr inbounds %ASTNode, ptr %t2631, i32 0, i32 1
  %t2633 = load ptr, ptr %t2632
  %t2634 = call i32 @ir_get_enum_variant(ptr %t2630, ptr %t2633)
  store i32 %t2634, ptr %enum_val
  %t2635 = load i32, ptr %enum_val
  %t2636 = icmp sge i32 %t2635, 0
  br i1 %t2636, label %label_957, label %label_959
label_957:
  %t2637 = load i32, ptr %enum_val
  %t2638 = call ptr @int_to_str(i32 %t2637)
  ret ptr %t2638
label_959:
  br label %label_956
label_956:
  %t2640 = load ptr, ptr %object_node
  %t2641 = call ptr @generate_expression(ptr %t2640)
  store ptr %t2641, ptr %object_val
  %t2643 = load ptr, ptr %object_node
  %t2644 = call ptr @get_expr_type(ptr %t2643)
  store ptr %t2644, ptr %object_type
  %t2645 = load ptr, ptr %object_type
  %t2646 = call ptr @struct_type_name(ptr %t2645)
  store ptr %t2646, ptr %struct_name
  %t2647 = load ptr, ptr %struct_name
  %t2648 = load ptr, ptr %expr
  %t2649 = getelementptr inbounds %ASTNode, ptr %t2648, i32 0, i32 1
  %t2650 = load ptr, ptr %t2649
  %t2651 = call i32 @ir_get_struct_field_index(ptr %t2647, ptr %t2650)
  store i32 %t2651, ptr %field_index
  %t2652 = load ptr, ptr %struct_name
  %t2653 = load ptr, ptr %expr
  %t2654 = getelementptr inbounds %ASTNode, ptr %t2653, i32 0, i32 1
  %t2655 = load ptr, ptr %t2654
  %t2656 = call ptr @ir_get_struct_field_type(ptr %t2652, ptr %t2655)
  %t2657 = call ptr @storage_type(ptr %t2656)
  store ptr %t2657, ptr %field_type
  %t2658 = call i32 @ir_get_temp()
  store i32 %t2658, ptr %gep_temp
  %t2659 = load i32, ptr %gep_temp
  %t2660 = call ptr @ir_get_temp_name(i32 %t2659)
  store ptr %t2660, ptr %gep_name
  %t2661 = getelementptr inbounds [3 x i8], ptr @.str.s313, i64 0, i64 0
  call void @ir_append(ptr %t2661)
  %t2662 = load ptr, ptr %gep_name
  call void @ir_append(ptr %t2662)
  %t2663 = getelementptr inbounds [27 x i8], ptr @.str.s314, i64 0, i64 0
  call void @ir_append(ptr %t2663)
  %t2664 = getelementptr inbounds [2 x i8], ptr @.str.s315, i64 0, i64 0
  %t2665 = load ptr, ptr %struct_name
  %t2666 = call ptr @str_concat(ptr %t2664, ptr %t2665)
  call void @ir_append(ptr %t2666)
  %t2667 = getelementptr inbounds [7 x i8], ptr @.str.s316, i64 0, i64 0
  call void @ir_append(ptr %t2667)
  %t2668 = load ptr, ptr %object_val
  call void @ir_append(ptr %t2668)
  %t2669 = getelementptr inbounds [14 x i8], ptr @.str.s317, i64 0, i64 0
  call void @ir_append(ptr %t2669)
  %t2670 = load i32, ptr %field_index
  %t2671 = call ptr @int_to_str(i32 %t2670)
  call void @ir_append_line(ptr %t2671)
  %t2673 = call i32 @ir_get_temp()
  store i32 %t2673, ptr %load_temp
  %t2675 = load i32, ptr %load_temp
  %t2676 = call ptr @ir_get_temp_name(i32 %t2675)
  store ptr %t2676, ptr %load_name
  %t2677 = getelementptr inbounds [3 x i8], ptr @.str.s318, i64 0, i64 0
  call void @ir_append(ptr %t2677)
  %t2678 = load ptr, ptr %load_name
  call void @ir_append(ptr %t2678)
  %t2679 = getelementptr inbounds [9 x i8], ptr @.str.s319, i64 0, i64 0
  call void @ir_append(ptr %t2679)
  %t2680 = load ptr, ptr %field_type
  call void @ir_append(ptr %t2680)
  %t2681 = getelementptr inbounds [7 x i8], ptr @.str.s320, i64 0, i64 0
  call void @ir_append(ptr %t2681)
  %t2682 = load ptr, ptr %gep_name
  call void @ir_append_line(ptr %t2682)
  %t2683 = load ptr, ptr %load_name
  ret ptr %t2683
label_953:
  %t2684 = load ptr, ptr %expr
  %t2685 = getelementptr inbounds %ASTNode, ptr %t2684, i32 0, i32 0
  %t2686 = load i32, ptr %t2685
  %t2687 = icmp eq i32 %t2686, 27
  br i1 %t2687, label %label_960, label %label_962
label_960:
  %t2689 = load ptr, ptr %expr
  %t2690 = getelementptr inbounds %ASTNode, ptr %t2689, i32 0, i32 5
  %t2691 = load ptr, ptr %t2690
  %t2692 = call i32 @count_list_nodes(ptr %t2691)
  store i32 %t2692, ptr %elem_count
  %t2694 = load ptr, ptr %expr
  %t2695 = getelementptr inbounds %ASTNode, ptr %t2694, i32 0, i32 5
  %t2696 = load ptr, ptr %t2695
  %t2697 = call ptr @ptr_to_node(ptr %t2696)
  store ptr %t2697, ptr %first_elem
  store i32 0, ptr %is_nested
  %t2699 = load ptr, ptr %first_elem
  %t2700 = getelementptr inbounds %ASTNode, ptr %t2699, i32 0, i32 0
  %t2701 = load i32, ptr %t2700
  %t2702 = icmp eq i32 %t2701, 27
  br i1 %t2702, label %label_963, label %label_965
label_963:
  store i32 1, ptr %is_nested
  br label %label_965
label_965:
  %t2703 = load i32, ptr %is_nested
  %t2704 = icmp eq i32 %t2703, 1
  br i1 %t2704, label %label_966, label %label_968
label_966:
  %t2706 = call i32 @ir_get_temp()
  store i32 %t2706, ptr %arr_temp
  %t2708 = load i32, ptr %arr_temp
  %t2709 = call ptr @ir_get_temp_name(i32 %t2708)
  store ptr %t2709, ptr %arr_name
  %t2710 = getelementptr inbounds [3 x i8], ptr @.str.s321, i64 0, i64 0
  call void @ir_append(ptr %t2710)
  %t2711 = load ptr, ptr %arr_name
  call void @ir_append(ptr %t2711)
  %t2712 = getelementptr inbounds [12 x i8], ptr @.str.s322, i64 0, i64 0
  call void @ir_append(ptr %t2712)
  %t2713 = load i32, ptr %elem_count
  %t2714 = call ptr @int_to_str(i32 %t2713)
  call void @ir_append(ptr %t2714)
  %t2715 = getelementptr inbounds [8 x i8], ptr @.str.s323, i64 0, i64 0
  call void @ir_append_line(ptr %t2715)
  %t2717 = load ptr, ptr %expr
  %t2718 = getelementptr inbounds %ASTNode, ptr %t2717, i32 0, i32 5
  %t2719 = load ptr, ptr %t2718
  store ptr %t2719, ptr %elem_ptr
  store i32 0, ptr %elem_index
  br label %label_969
label_969:
  %t2721 = load ptr, ptr %elem_ptr
  %t2722 = getelementptr inbounds [1 x i8], ptr @.str.s324, i64 0, i64 0
  %t2723 = call i32 @str_equals(ptr %t2721, ptr %t2722)
  %t2724 = icmp eq i32 %t2723, 0
  br i1 %t2724, label %label_970, label %label_971
label_970:
  %t2726 = load ptr, ptr %elem_ptr
  %t2727 = call ptr @ptr_to_node(ptr %t2726)
  store ptr %t2727, ptr %elem_node
  %t2729 = load ptr, ptr %elem_node
  %t2730 = call ptr @generate_expression(ptr %t2729)
  store ptr %t2730, ptr %inner_ptr
  %t2732 = call i32 @ir_get_temp()
  store i32 %t2732, ptr %slot_temp
  %t2734 = load i32, ptr %slot_temp
  %t2735 = call ptr @ir_get_temp_name(i32 %t2734)
  store ptr %t2735, ptr %slot_name
  %t2736 = getelementptr inbounds [3 x i8], ptr @.str.s325, i64 0, i64 0
  call void @ir_append(ptr %t2736)
  %t2737 = load ptr, ptr %slot_name
  call void @ir_append(ptr %t2737)
  %t2738 = getelementptr inbounds [28 x i8], ptr @.str.s326, i64 0, i64 0
  call void @ir_append(ptr %t2738)
  %t2739 = load i32, ptr %elem_count
  %t2740 = call ptr @int_to_str(i32 %t2739)
  call void @ir_append(ptr %t2740)
  %t2741 = getelementptr inbounds [14 x i8], ptr @.str.s327, i64 0, i64 0
  call void @ir_append(ptr %t2741)
  %t2742 = load ptr, ptr %arr_name
  call void @ir_append(ptr %t2742)
  %t2743 = getelementptr inbounds [14 x i8], ptr @.str.s328, i64 0, i64 0
  call void @ir_append(ptr %t2743)
  %t2744 = load i32, ptr %elem_index
  %t2745 = call ptr @int_to_str(i32 %t2744)
  call void @ir_append_line(ptr %t2745)
  %t2746 = getelementptr inbounds [13 x i8], ptr @.str.s329, i64 0, i64 0
  call void @ir_append(ptr %t2746)
  %t2747 = load ptr, ptr %inner_ptr
  call void @ir_append(ptr %t2747)
  %t2748 = getelementptr inbounds [7 x i8], ptr @.str.s330, i64 0, i64 0
  call void @ir_append(ptr %t2748)
  %t2749 = load ptr, ptr %slot_name
  call void @ir_append_line(ptr %t2749)
  %t2750 = load i32, ptr %elem_index
  %t2751 = add i32 %t2750, 1
  store i32 %t2751, ptr %elem_index
  %t2752 = load ptr, ptr %elem_node
  %t2753 = getelementptr inbounds %ASTNode, ptr %t2752, i32 0, i32 8
  %t2754 = load ptr, ptr %t2753
  store ptr %t2754, ptr %elem_ptr
  br label %label_969
label_971:
  %t2756 = call i32 @ir_get_temp()
  store i32 %t2756, ptr %ret_temp
  %t2758 = load i32, ptr %ret_temp
  %t2759 = call ptr @ir_get_temp_name(i32 %t2758)
  store ptr %t2759, ptr %ret_name
  %t2760 = getelementptr inbounds [3 x i8], ptr @.str.s331, i64 0, i64 0
  call void @ir_append(ptr %t2760)
  %t2761 = load ptr, ptr %ret_name
  call void @ir_append(ptr %t2761)
  %t2762 = getelementptr inbounds [28 x i8], ptr @.str.s332, i64 0, i64 0
  call void @ir_append(ptr %t2762)
  %t2763 = load i32, ptr %elem_count
  %t2764 = call ptr @int_to_str(i32 %t2763)
  call void @ir_append(ptr %t2764)
  %t2765 = getelementptr inbounds [14 x i8], ptr @.str.s333, i64 0, i64 0
  call void @ir_append(ptr %t2765)
  %t2766 = load ptr, ptr %arr_name
  call void @ir_append(ptr %t2766)
  %t2767 = getelementptr inbounds [15 x i8], ptr @.str.s334, i64 0, i64 0
  call void @ir_append_line(ptr %t2767)
  %t2768 = load ptr, ptr %ret_name
  ret ptr %t2768
label_968:
  %t2770 = call i32 @ir_get_temp()
  store i32 %t2770, ptr %arr_temp2
  %t2772 = load i32, ptr %arr_temp2
  %t2773 = call ptr @ir_get_temp_name(i32 %t2772)
  store ptr %t2773, ptr %arr_name2
  %t2774 = getelementptr inbounds [3 x i8], ptr @.str.s335, i64 0, i64 0
  call void @ir_append(ptr %t2774)
  %t2775 = load ptr, ptr %arr_name2
  call void @ir_append(ptr %t2775)
  %t2776 = getelementptr inbounds [12 x i8], ptr @.str.s336, i64 0, i64 0
  call void @ir_append(ptr %t2776)
  %t2777 = load i32, ptr %elem_count
  %t2778 = call ptr @int_to_str(i32 %t2777)
  call void @ir_append(ptr %t2778)
  %t2779 = getelementptr inbounds [8 x i8], ptr @.str.s337, i64 0, i64 0
  call void @ir_append_line(ptr %t2779)
  %t2781 = load ptr, ptr %expr
  %t2782 = getelementptr inbounds %ASTNode, ptr %t2781, i32 0, i32 5
  %t2783 = load ptr, ptr %t2782
  store ptr %t2783, ptr %elem_ptr2
  store i32 0, ptr %elem_index2
  br label %label_972
label_972:
  %t2785 = load ptr, ptr %elem_ptr2
  %t2786 = getelementptr inbounds [1 x i8], ptr @.str.s338, i64 0, i64 0
  %t2787 = call i32 @str_equals(ptr %t2785, ptr %t2786)
  %t2788 = icmp eq i32 %t2787, 0
  br i1 %t2788, label %label_973, label %label_974
label_973:
  %t2790 = load ptr, ptr %elem_ptr2
  %t2791 = call ptr @ptr_to_node(ptr %t2790)
  store ptr %t2791, ptr %elem_node2
  %t2793 = load ptr, ptr %elem_node2
  %t2794 = call ptr @generate_expression(ptr %t2793)
  store ptr %t2794, ptr %elem_val
  %t2796 = call i32 @ir_get_temp()
  store i32 %t2796, ptr %elem_slot_temp
  %t2798 = load i32, ptr %elem_slot_temp
  %t2799 = call ptr @ir_get_temp_name(i32 %t2798)
  store ptr %t2799, ptr %elem_slot_name
  %t2800 = getelementptr inbounds [3 x i8], ptr @.str.s339, i64 0, i64 0
  call void @ir_append(ptr %t2800)
  %t2801 = load ptr, ptr %elem_slot_name
  call void @ir_append(ptr %t2801)
  %t2802 = getelementptr inbounds [28 x i8], ptr @.str.s340, i64 0, i64 0
  call void @ir_append(ptr %t2802)
  %t2803 = load i32, ptr %elem_count
  %t2804 = call ptr @int_to_str(i32 %t2803)
  call void @ir_append(ptr %t2804)
  %t2805 = getelementptr inbounds [14 x i8], ptr @.str.s341, i64 0, i64 0
  call void @ir_append(ptr %t2805)
  %t2806 = load ptr, ptr %arr_name2
  call void @ir_append(ptr %t2806)
  %t2807 = getelementptr inbounds [14 x i8], ptr @.str.s342, i64 0, i64 0
  call void @ir_append(ptr %t2807)
  %t2808 = load i32, ptr %elem_index2
  %t2809 = call ptr @int_to_str(i32 %t2808)
  call void @ir_append_line(ptr %t2809)
  %t2810 = getelementptr inbounds [13 x i8], ptr @.str.s343, i64 0, i64 0
  call void @ir_append(ptr %t2810)
  %t2811 = load ptr, ptr %elem_val
  call void @ir_append(ptr %t2811)
  %t2812 = getelementptr inbounds [7 x i8], ptr @.str.s344, i64 0, i64 0
  call void @ir_append(ptr %t2812)
  %t2813 = load ptr, ptr %elem_slot_name
  call void @ir_append_line(ptr %t2813)
  %t2814 = load i32, ptr %elem_index2
  %t2815 = add i32 %t2814, 1
  store i32 %t2815, ptr %elem_index2
  %t2816 = load ptr, ptr %elem_node2
  %t2817 = getelementptr inbounds %ASTNode, ptr %t2816, i32 0, i32 8
  %t2818 = load ptr, ptr %t2817
  store ptr %t2818, ptr %elem_ptr2
  br label %label_972
label_974:
  %t2820 = call i32 @ir_get_temp()
  store i32 %t2820, ptr %ret_temp2
  %t2822 = load i32, ptr %ret_temp2
  %t2823 = call ptr @ir_get_temp_name(i32 %t2822)
  store ptr %t2823, ptr %ret_name2
  %t2824 = getelementptr inbounds [3 x i8], ptr @.str.s345, i64 0, i64 0
  call void @ir_append(ptr %t2824)
  %t2825 = load ptr, ptr %ret_name2
  call void @ir_append(ptr %t2825)
  %t2826 = getelementptr inbounds [28 x i8], ptr @.str.s346, i64 0, i64 0
  call void @ir_append(ptr %t2826)
  %t2827 = load i32, ptr %elem_count
  %t2828 = call ptr @int_to_str(i32 %t2827)
  call void @ir_append(ptr %t2828)
  %t2829 = getelementptr inbounds [14 x i8], ptr @.str.s347, i64 0, i64 0
  call void @ir_append(ptr %t2829)
  %t2830 = load ptr, ptr %arr_name2
  call void @ir_append(ptr %t2830)
  %t2831 = getelementptr inbounds [15 x i8], ptr @.str.s348, i64 0, i64 0
  call void @ir_append_line(ptr %t2831)
  %t2832 = load ptr, ptr %ret_name2
  ret ptr %t2832
label_962:
  %t2833 = load ptr, ptr %expr
  %t2834 = getelementptr inbounds %ASTNode, ptr %t2833, i32 0, i32 0
  %t2835 = load i32, ptr %t2834
  %t2836 = icmp eq i32 %t2835, 26
  br i1 %t2836, label %label_975, label %label_977
label_975:
  %t2838 = load ptr, ptr %expr
  %t2839 = getelementptr inbounds %ASTNode, ptr %t2838, i32 0, i32 5
  %t2840 = load ptr, ptr %t2839
  %t2841 = call ptr @ptr_to_node(ptr %t2840)
  %t2842 = call ptr @generate_expression(ptr %t2841)
  store ptr %t2842, ptr %array_val
  %t2844 = load ptr, ptr %expr
  %t2845 = getelementptr inbounds %ASTNode, ptr %t2844, i32 0, i32 6
  %t2846 = load ptr, ptr %t2845
  %t2847 = call ptr @ptr_to_node(ptr %t2846)
  %t2848 = call ptr @generate_expression(ptr %t2847)
  store ptr %t2848, ptr %index_val
  %t2850 = load ptr, ptr %expr
  %t2851 = getelementptr inbounds %ASTNode, ptr %t2850, i32 0, i32 5
  %t2852 = load ptr, ptr %t2851
  %t2853 = call ptr @ptr_to_node(ptr %t2852)
  %t2854 = call ptr @get_expr_type(ptr %t2853)
  store ptr %t2854, ptr %obj_type
  %t2856 = getelementptr inbounds [4 x i8], ptr @.str.s349, i64 0, i64 0
  store ptr %t2856, ptr %elem_type
  %t2857 = load ptr, ptr %obj_type
  %t2858 = getelementptr inbounds [7 x i8], ptr @.str.s350, i64 0, i64 0
  %t2859 = call i32 @str_equals(ptr %t2857, ptr %t2858)
  %t2860 = icmp eq i32 %t2859, 1
  br i1 %t2860, label %label_978, label %label_980
label_978:
  %t2861 = getelementptr inbounds [4 x i8], ptr @.str.s351, i64 0, i64 0
  store ptr %t2861, ptr %elem_type
  br label %label_980
label_980:
  %t2863 = call i32 @ir_get_temp()
  store i32 %t2863, ptr %ptr_temp
  %t2865 = load i32, ptr %ptr_temp
  %t2866 = call ptr @ir_get_temp_name(i32 %t2865)
  store ptr %t2866, ptr %ptr_name
  %t2867 = getelementptr inbounds [3 x i8], ptr @.str.s352, i64 0, i64 0
  call void @ir_append(ptr %t2867)
  %t2868 = load ptr, ptr %ptr_name
  call void @ir_append(ptr %t2868)
  %t2869 = getelementptr inbounds [27 x i8], ptr @.str.s353, i64 0, i64 0
  call void @ir_append(ptr %t2869)
  %t2870 = load ptr, ptr %elem_type
  call void @ir_append(ptr %t2870)
  %t2871 = getelementptr inbounds [7 x i8], ptr @.str.s354, i64 0, i64 0
  call void @ir_append(ptr %t2871)
  %t2872 = load ptr, ptr %array_val
  call void @ir_append(ptr %t2872)
  %t2873 = getelementptr inbounds [7 x i8], ptr @.str.s355, i64 0, i64 0
  call void @ir_append(ptr %t2873)
  %t2874 = load ptr, ptr %index_val
  call void @ir_append_line(ptr %t2874)
  %t2875 = call i32 @ir_get_temp()
  store i32 %t2875, ptr %load_temp
  %t2876 = load i32, ptr %load_temp
  %t2877 = call ptr @ir_get_temp_name(i32 %t2876)
  store ptr %t2877, ptr %load_name
  %t2878 = getelementptr inbounds [3 x i8], ptr @.str.s356, i64 0, i64 0
  call void @ir_append(ptr %t2878)
  %t2879 = load ptr, ptr %load_name
  call void @ir_append(ptr %t2879)
  %t2880 = getelementptr inbounds [9 x i8], ptr @.str.s357, i64 0, i64 0
  call void @ir_append(ptr %t2880)
  %t2881 = load ptr, ptr %elem_type
  call void @ir_append(ptr %t2881)
  %t2882 = getelementptr inbounds [7 x i8], ptr @.str.s358, i64 0, i64 0
  call void @ir_append(ptr %t2882)
  %t2883 = load ptr, ptr %ptr_name
  call void @ir_append_line(ptr %t2883)
  %t2884 = load ptr, ptr %load_name
  ret ptr %t2884
label_977:
  %t2885 = load ptr, ptr %expr
  %t2886 = getelementptr inbounds %ASTNode, ptr %t2885, i32 0, i32 0
  %t2887 = load i32, ptr %t2886
  %t2888 = icmp eq i32 %t2887, 20
  br i1 %t2888, label %label_981, label %label_983
label_981:
  %t2890 = load ptr, ptr %expr
  %t2891 = getelementptr inbounds %ASTNode, ptr %t2890, i32 0, i32 5
  %t2892 = load ptr, ptr %t2891
  %t2893 = call ptr @ptr_to_node(ptr %t2892)
  %t2894 = call ptr @generate_expression(ptr %t2893)
  store ptr %t2894, ptr %left_val
  %t2896 = load ptr, ptr %expr
  %t2897 = getelementptr inbounds %ASTNode, ptr %t2896, i32 0, i32 6
  %t2898 = load ptr, ptr %t2897
  %t2899 = call ptr @ptr_to_node(ptr %t2898)
  %t2900 = call ptr @generate_expression(ptr %t2899)
  store ptr %t2900, ptr %right_val
  %t2902 = load ptr, ptr %expr
  %t2903 = getelementptr inbounds %ASTNode, ptr %t2902, i32 0, i32 1
  %t2904 = load ptr, ptr %t2903
  store ptr %t2904, ptr %op
  store i32 0, ptr %temp_id
  %t2906 = load ptr, ptr %expr
  %t2907 = getelementptr inbounds %ASTNode, ptr %t2906, i32 0, i32 5
  %t2908 = load ptr, ptr %t2907
  %t2909 = call ptr @ptr_to_node(ptr %t2908)
  %t2910 = call ptr @get_expr_type(ptr %t2909)
  store ptr %t2910, ptr %op_type
  %t2911 = load ptr, ptr %op
  %t2912 = getelementptr inbounds [2 x i8], ptr @.str.s359, i64 0, i64 0
  %t2913 = call i32 @str_equals(ptr %t2911, ptr %t2912)
  %t2914 = icmp eq i32 %t2913, 1
  br i1 %t2914, label %label_984, label %label_986
label_984:
  %t2915 = load ptr, ptr %op_type
  %t2916 = load ptr, ptr %left_val
  %t2917 = load ptr, ptr %right_val
  %t2918 = call i32 @ir_add(ptr %t2915, ptr %t2916, ptr %t2917)
  store i32 %t2918, ptr %temp_id
  br label %label_986
label_986:
  %t2919 = load ptr, ptr %op
  %t2920 = getelementptr inbounds [2 x i8], ptr @.str.s360, i64 0, i64 0
  %t2921 = call i32 @str_equals(ptr %t2919, ptr %t2920)
  %t2922 = icmp eq i32 %t2921, 1
  br i1 %t2922, label %label_987, label %label_989
label_987:
  %t2923 = load ptr, ptr %op_type
  %t2924 = load ptr, ptr %left_val
  %t2925 = load ptr, ptr %right_val
  %t2926 = call i32 @ir_sub(ptr %t2923, ptr %t2924, ptr %t2925)
  store i32 %t2926, ptr %temp_id
  br label %label_989
label_989:
  %t2927 = load ptr, ptr %op
  %t2928 = getelementptr inbounds [2 x i8], ptr @.str.s361, i64 0, i64 0
  %t2929 = call i32 @str_equals(ptr %t2927, ptr %t2928)
  %t2930 = icmp eq i32 %t2929, 1
  br i1 %t2930, label %label_990, label %label_992
label_990:
  %t2931 = load ptr, ptr %op_type
  %t2932 = load ptr, ptr %left_val
  %t2933 = load ptr, ptr %right_val
  %t2934 = call i32 @ir_mul(ptr %t2931, ptr %t2932, ptr %t2933)
  store i32 %t2934, ptr %temp_id
  br label %label_992
label_992:
  %t2935 = load ptr, ptr %op
  %t2936 = getelementptr inbounds [2 x i8], ptr @.str.s362, i64 0, i64 0
  %t2937 = call i32 @str_equals(ptr %t2935, ptr %t2936)
  %t2938 = icmp eq i32 %t2937, 1
  br i1 %t2938, label %label_993, label %label_995
label_993:
  %t2939 = load ptr, ptr %op_type
  %t2940 = load ptr, ptr %left_val
  %t2941 = load ptr, ptr %right_val
  %t2942 = call i32 @ir_sdiv(ptr %t2939, ptr %t2940, ptr %t2941)
  store i32 %t2942, ptr %temp_id
  br label %label_995
label_995:
  %t2943 = load ptr, ptr %op
  %t2944 = getelementptr inbounds [2 x i8], ptr @.str.s363, i64 0, i64 0
  %t2945 = call i32 @str_equals(ptr %t2943, ptr %t2944)
  %t2946 = icmp eq i32 %t2945, 1
  br i1 %t2946, label %label_996, label %label_998
label_996:
  %t2947 = load ptr, ptr %op_type
  %t2948 = load ptr, ptr %left_val
  %t2949 = load ptr, ptr %right_val
  %t2950 = call i32 @ir_srem(ptr %t2947, ptr %t2948, ptr %t2949)
  store i32 %t2950, ptr %temp_id
  br label %label_998
label_998:
  %t2951 = load ptr, ptr %op
  %t2952 = getelementptr inbounds [3 x i8], ptr @.str.s364, i64 0, i64 0
  %t2953 = call i32 @str_equals(ptr %t2951, ptr %t2952)
  %t2954 = icmp eq i32 %t2953, 1
  br i1 %t2954, label %label_999, label %label_1001
label_999:
  %t2955 = load ptr, ptr %op_type
  %t2956 = load ptr, ptr %left_val
  %t2957 = load ptr, ptr %right_val
  %t2958 = call i32 @ir_icmp_eq(ptr %t2955, ptr %t2956, ptr %t2957)
  store i32 %t2958, ptr %temp_id
  br label %label_1001
label_1001:
  %t2959 = load ptr, ptr %op
  %t2960 = getelementptr inbounds [3 x i8], ptr @.str.s365, i64 0, i64 0
  %t2961 = call i32 @str_equals(ptr %t2959, ptr %t2960)
  %t2962 = icmp eq i32 %t2961, 1
  br i1 %t2962, label %label_1002, label %label_1004
label_1002:
  %t2963 = load ptr, ptr %op_type
  %t2964 = load ptr, ptr %left_val
  %t2965 = load ptr, ptr %right_val
  %t2966 = call i32 @ir_icmp_ne(ptr %t2963, ptr %t2964, ptr %t2965)
  store i32 %t2966, ptr %temp_id
  br label %label_1004
label_1004:
  %t2967 = load ptr, ptr %op
  %t2968 = getelementptr inbounds [2 x i8], ptr @.str.s366, i64 0, i64 0
  %t2969 = call i32 @str_equals(ptr %t2967, ptr %t2968)
  %t2970 = icmp eq i32 %t2969, 1
  br i1 %t2970, label %label_1005, label %label_1007
label_1005:
  %t2971 = load ptr, ptr %op_type
  %t2972 = load ptr, ptr %left_val
  %t2973 = load ptr, ptr %right_val
  %t2974 = call i32 @ir_icmp_slt(ptr %t2971, ptr %t2972, ptr %t2973)
  store i32 %t2974, ptr %temp_id
  br label %label_1007
label_1007:
  %t2975 = load ptr, ptr %op
  %t2976 = getelementptr inbounds [3 x i8], ptr @.str.s367, i64 0, i64 0
  %t2977 = call i32 @str_equals(ptr %t2975, ptr %t2976)
  %t2978 = icmp eq i32 %t2977, 1
  br i1 %t2978, label %label_1008, label %label_1010
label_1008:
  %t2979 = load ptr, ptr %op_type
  %t2980 = load ptr, ptr %left_val
  %t2981 = load ptr, ptr %right_val
  %t2982 = call i32 @ir_icmp_sle(ptr %t2979, ptr %t2980, ptr %t2981)
  store i32 %t2982, ptr %temp_id
  br label %label_1010
label_1010:
  %t2983 = load ptr, ptr %op
  %t2984 = getelementptr inbounds [2 x i8], ptr @.str.s368, i64 0, i64 0
  %t2985 = call i32 @str_equals(ptr %t2983, ptr %t2984)
  %t2986 = icmp eq i32 %t2985, 1
  br i1 %t2986, label %label_1011, label %label_1013
label_1011:
  %t2987 = load ptr, ptr %op_type
  %t2988 = load ptr, ptr %left_val
  %t2989 = load ptr, ptr %right_val
  %t2990 = call i32 @ir_icmp_sgt(ptr %t2987, ptr %t2988, ptr %t2989)
  store i32 %t2990, ptr %temp_id
  br label %label_1013
label_1013:
  %t2991 = load ptr, ptr %op
  %t2992 = getelementptr inbounds [3 x i8], ptr @.str.s369, i64 0, i64 0
  %t2993 = call i32 @str_equals(ptr %t2991, ptr %t2992)
  %t2994 = icmp eq i32 %t2993, 1
  br i1 %t2994, label %label_1014, label %label_1016
label_1014:
  %t2995 = load ptr, ptr %op_type
  %t2996 = load ptr, ptr %left_val
  %t2997 = load ptr, ptr %right_val
  %t2998 = call i32 @ir_icmp_sge(ptr %t2995, ptr %t2996, ptr %t2997)
  store i32 %t2998, ptr %temp_id
  br label %label_1016
label_1016:
  %t2999 = load ptr, ptr %op
  %t3000 = getelementptr inbounds [4 x i8], ptr @.str.s370, i64 0, i64 0
  %t3001 = call i32 @str_equals(ptr %t2999, ptr %t3000)
  %t3002 = icmp eq i32 %t3001, 1
  br i1 %t3002, label %label_1017, label %label_1019
label_1017:
  %t3003 = getelementptr inbounds [3 x i8], ptr @.str.s371, i64 0, i64 0
  %t3004 = load ptr, ptr %left_val
  %t3005 = load ptr, ptr %right_val
  %t3006 = call i32 @ir_and(ptr %t3003, ptr %t3004, ptr %t3005)
  store i32 %t3006, ptr %temp_id
  br label %label_1019
label_1019:
  %t3007 = load ptr, ptr %op
  %t3008 = getelementptr inbounds [3 x i8], ptr @.str.s372, i64 0, i64 0
  %t3009 = call i32 @str_equals(ptr %t3007, ptr %t3008)
  %t3010 = icmp eq i32 %t3009, 1
  br i1 %t3010, label %label_1020, label %label_1022
label_1020:
  %t3011 = getelementptr inbounds [3 x i8], ptr @.str.s373, i64 0, i64 0
  %t3012 = load ptr, ptr %left_val
  %t3013 = load ptr, ptr %right_val
  %t3014 = call i32 @ir_or(ptr %t3011, ptr %t3012, ptr %t3013)
  store i32 %t3014, ptr %temp_id
  br label %label_1022
label_1022:
  %t3015 = load i32, ptr %temp_id
  %t3016 = call ptr @ir_get_temp_name(i32 %t3015)
  ret ptr %t3016
label_983:
  %t3017 = load ptr, ptr %expr
  %t3018 = getelementptr inbounds %ASTNode, ptr %t3017, i32 0, i32 0
  %t3019 = load i32, ptr %t3018
  %t3020 = icmp eq i32 %t3019, 24
  br i1 %t3020, label %label_1023, label %label_1025
label_1023:
  %t3022 = load ptr, ptr %expr
  %t3023 = getelementptr inbounds %ASTNode, ptr %t3022, i32 0, i32 5
  %t3024 = load ptr, ptr %t3023
  %t3025 = call ptr @ptr_to_node(ptr %t3024)
  store ptr %t3025, ptr %callee
  %t3027 = load ptr, ptr %callee
  %t3028 = getelementptr inbounds %ASTNode, ptr %t3027, i32 0, i32 1
  %t3029 = load ptr, ptr %t3028
  store ptr %t3029, ptr %func_name
  store i32 0, ptr %is_print
  %t3031 = load ptr, ptr %func_name
  %t3032 = getelementptr inbounds [6 x i8], ptr @.str.s374, i64 0, i64 0
  %t3033 = call i32 @str_equals(ptr %t3031, ptr %t3032)
  %t3034 = icmp eq i32 %t3033, 1
  br i1 %t3034, label %label_1026, label %label_1028
label_1026:
  store i32 1, ptr %is_print
  br label %label_1028
label_1028:
  %t3035 = load ptr, ptr %func_name
  %t3036 = getelementptr inbounds [8 x i8], ptr @.str.s375, i64 0, i64 0
  %t3037 = call i32 @str_equals(ptr %t3035, ptr %t3036)
  %t3038 = icmp eq i32 %t3037, 1
  br i1 %t3038, label %label_1029, label %label_1031
label_1029:
  store i32 2, ptr %is_print
  br label %label_1031
label_1031:
  %t3039 = load i32, ptr %is_print
  %t3040 = icmp sgt i32 %t3039, 0
  br i1 %t3040, label %label_1032, label %label_1034
label_1032:
  %t3042 = load ptr, ptr %expr
  %t3043 = getelementptr inbounds %ASTNode, ptr %t3042, i32 0, i32 6
  %t3044 = load ptr, ptr %t3043
  store ptr %t3044, ptr %arg_ptr
  %t3045 = load ptr, ptr %arg_ptr
  %t3046 = getelementptr inbounds [1 x i8], ptr @.str.s376, i64 0, i64 0
  %t3047 = call i32 @str_equals(ptr %t3045, ptr %t3046)
  %t3048 = icmp eq i32 %t3047, 0
  br i1 %t3048, label %label_1035, label %label_1037
label_1035:
  %t3050 = load ptr, ptr %arg_ptr
  %t3051 = call ptr @ptr_to_node(ptr %t3050)
  store ptr %t3051, ptr %arg_node
  %t3053 = load ptr, ptr %arg_node
  %t3054 = call ptr @generate_expression(ptr %t3053)
  store ptr %t3054, ptr %arg_val
  %t3056 = load ptr, ptr %arg_node
  %t3057 = call ptr @get_expr_type(ptr %t3056)
  store ptr %t3057, ptr %arg_type
  call void @ir_call_begin()
  %t3058 = load ptr, ptr %arg_type
  %t3059 = getelementptr inbounds [4 x i8], ptr @.str.s377, i64 0, i64 0
  %t3060 = call i32 @str_equals(ptr %t3058, ptr %t3059)
  %t3061 = icmp eq i32 %t3060, 1
  br i1 %t3061, label %label_1038, label %label_1039
label_1038:
  %t3062 = getelementptr inbounds [4 x i8], ptr @.str.s378, i64 0, i64 0
  %t3063 = load ptr, ptr %arg_val
  call void @ir_call_arg(ptr %t3062, ptr %t3063)
  %t3064 = load i32, ptr %is_print
  %t3065 = icmp eq i32 %t3064, 1
  br i1 %t3065, label %label_1041, label %label_1042
label_1041:
  %t3066 = getelementptr inbounds [5 x i8], ptr @.str.s379, i64 0, i64 0
  %t3067 = getelementptr inbounds [6 x i8], ptr @.str.s380, i64 0, i64 0
  %t3068 = call i32 @ir_call_end(ptr %t3066, ptr %t3067)
  br label %label_1043
label_1042:
  %t3069 = getelementptr inbounds [5 x i8], ptr @.str.s381, i64 0, i64 0
  %t3070 = getelementptr inbounds [8 x i8], ptr @.str.s382, i64 0, i64 0
  %t3071 = call i32 @ir_call_end(ptr %t3069, ptr %t3070)
  br label %label_1043
label_1043:
  br label %label_1040
label_1039:
  %t3072 = load ptr, ptr %arg_type
  %t3073 = call ptr @storage_type(ptr %t3072)
  %t3074 = load ptr, ptr %arg_val
  call void @ir_call_arg(ptr %t3073, ptr %t3074)
  %t3075 = load i32, ptr %is_print
  %t3076 = icmp eq i32 %t3075, 1
  br i1 %t3076, label %label_1044, label %label_1045
label_1044:
  %t3077 = getelementptr inbounds [5 x i8], ptr @.str.s383, i64 0, i64 0
  %t3078 = getelementptr inbounds [10 x i8], ptr @.str.s384, i64 0, i64 0
  %t3079 = call i32 @ir_call_end(ptr %t3077, ptr %t3078)
  br label %label_1046
label_1045:
  %t3080 = getelementptr inbounds [5 x i8], ptr @.str.s385, i64 0, i64 0
  %t3081 = getelementptr inbounds [12 x i8], ptr @.str.s386, i64 0, i64 0
  %t3082 = call i32 @ir_call_end(ptr %t3080, ptr %t3081)
  br label %label_1046
label_1046:
  br label %label_1040
label_1040:
  br label %label_1037
label_1037:
  %t3083 = getelementptr inbounds [1 x i8], ptr @.str.s387, i64 0, i64 0
  ret ptr %t3083
label_1034:
  call void @ir_call_begin()
  %t3084 = load ptr, ptr %expr
  %t3085 = getelementptr inbounds %ASTNode, ptr %t3084, i32 0, i32 6
  %t3086 = load ptr, ptr %t3085
  store ptr %t3086, ptr %arg_ptr
  br label %label_1047
label_1047:
  %t3087 = load ptr, ptr %arg_ptr
  %t3088 = getelementptr inbounds [1 x i8], ptr @.str.s388, i64 0, i64 0
  %t3089 = call i32 @str_equals(ptr %t3087, ptr %t3088)
  %t3090 = icmp eq i32 %t3089, 0
  br i1 %t3090, label %label_1048, label %label_1049
label_1048:
  %t3091 = load ptr, ptr %arg_ptr
  %t3092 = call ptr @ptr_to_node(ptr %t3091)
  store ptr %t3092, ptr %arg_node
  %t3093 = load ptr, ptr %arg_node
  %t3094 = call ptr @generate_expression(ptr %t3093)
  store ptr %t3094, ptr %arg_val
  %t3095 = load ptr, ptr %arg_node
  %t3096 = call ptr @get_expr_type(ptr %t3095)
  %t3097 = call ptr @storage_type(ptr %t3096)
  %t3098 = load ptr, ptr %arg_val
  call void @ir_call_arg(ptr %t3097, ptr %t3098)
  %t3099 = load ptr, ptr %arg_node
  %t3100 = getelementptr inbounds %ASTNode, ptr %t3099, i32 0, i32 8
  %t3101 = load ptr, ptr %t3100
  store ptr %t3101, ptr %arg_ptr
  br label %label_1047
label_1049:
  %t3103 = load ptr, ptr %expr
  %t3104 = call ptr @get_expr_type(ptr %t3103)
  %t3105 = call ptr @storage_type(ptr %t3104)
  store ptr %t3105, ptr %ret_type
  %t3106 = load ptr, ptr %ret_type
  %t3107 = getelementptr inbounds [5 x i8], ptr @.str.s389, i64 0, i64 0
  %t3108 = call i32 @str_equals(ptr %t3106, ptr %t3107)
  %t3109 = icmp eq i32 %t3108, 1
  br i1 %t3109, label %label_1050, label %label_1052
label_1050:
  %t3110 = getelementptr inbounds [5 x i8], ptr @.str.s390, i64 0, i64 0
  %t3111 = load ptr, ptr %func_name
  %t3112 = call i32 @ir_call_end(ptr %t3110, ptr %t3111)
  %t3113 = getelementptr inbounds [1 x i8], ptr @.str.s391, i64 0, i64 0
  ret ptr %t3113
label_1052:
  %t3114 = load ptr, ptr %ret_type
  %t3115 = load ptr, ptr %func_name
  %t3116 = call i32 @ir_call_end(ptr %t3114, ptr %t3115)
  store i32 %t3116, ptr %temp_id
  %t3117 = load i32, ptr %temp_id
  %t3118 = call ptr @ir_get_temp_name(i32 %t3117)
  ret ptr %t3118
label_1025:
  %t3119 = getelementptr inbounds [2 x i8], ptr @.str.s392, i64 0, i64 0
  ret ptr %t3119
}

define void @generate_statement(ptr %p_stmt) {
  %stmt = alloca ptr
  %var_name = alloca ptr
  %var_type = alloca ptr
  %type_node = alloca ptr
  %store_type = alloca ptr
  %init_val = alloca ptr
  %target_node = alloca ptr
  %val = alloca ptr
  %object_node = alloca ptr
  %object_val = alloca ptr
  %object_type = alloca ptr
  %struct_name = alloca ptr
  %field_index = alloca i32
  %field_type = alloca ptr
  %gep_temp = alloca i32
  %gep_name = alloca ptr
  %ret_val = alloca ptr
  %cond_val = alloca ptr
  %then_label = alloca i32
  %else_label = alloca i32
  %end_label = alloca i32
  %else_node = alloca ptr
  %cond_label = alloca i32
  %body_label = alloca i32
  store ptr %p_stmt, ptr %stmt
  %t3121 = load ptr, ptr %stmt
  %t3122 = getelementptr inbounds %ASTNode, ptr %t3121, i32 0, i32 0
  %t3123 = load i32, ptr %t3122
  %t3124 = icmp eq i32 %t3123, 3
  br i1 %t3124, label %label_1053, label %label_1055
label_1053:
  %t3126 = load ptr, ptr %stmt
  %t3127 = getelementptr inbounds %ASTNode, ptr %t3126, i32 0, i32 1
  %t3128 = load ptr, ptr %t3127
  store ptr %t3128, ptr %var_name
  %t3130 = getelementptr inbounds [4 x i8], ptr @.str.s393, i64 0, i64 0
  store ptr %t3130, ptr %var_type
  %t3131 = load ptr, ptr %stmt
  %t3132 = getelementptr inbounds %ASTNode, ptr %t3131, i32 0, i32 5
  %t3133 = load ptr, ptr %t3132
  %t3134 = getelementptr inbounds [1 x i8], ptr @.str.s394, i64 0, i64 0
  %t3135 = call i32 @str_equals(ptr %t3133, ptr %t3134)
  %t3136 = icmp eq i32 %t3135, 0
  br i1 %t3136, label %label_1056, label %label_1057
label_1056:
  %t3138 = load ptr, ptr %stmt
  %t3139 = getelementptr inbounds %ASTNode, ptr %t3138, i32 0, i32 5
  %t3140 = load ptr, ptr %t3139
  %t3141 = call ptr @ptr_to_node(ptr %t3140)
  store ptr %t3141, ptr %type_node
  %t3142 = load ptr, ptr %type_node
  %t3143 = call ptr @map_type_node(ptr %t3142)
  store ptr %t3143, ptr %var_type
  br label %label_1058
label_1057:
  %t3144 = load ptr, ptr %stmt
  %t3145 = getelementptr inbounds %ASTNode, ptr %t3144, i32 0, i32 6
  %t3146 = load ptr, ptr %t3145
  %t3147 = getelementptr inbounds [1 x i8], ptr @.str.s395, i64 0, i64 0
  %t3148 = call i32 @str_equals(ptr %t3146, ptr %t3147)
  %t3149 = icmp eq i32 %t3148, 0
  br i1 %t3149, label %label_1059, label %label_1061
label_1059:
  %t3150 = load ptr, ptr %stmt
  %t3151 = getelementptr inbounds %ASTNode, ptr %t3150, i32 0, i32 6
  %t3152 = load ptr, ptr %t3151
  %t3153 = call ptr @ptr_to_node(ptr %t3152)
  %t3154 = call ptr @get_expr_type(ptr %t3153)
  store ptr %t3154, ptr %var_type
  br label %label_1061
label_1061:
  br label %label_1058
label_1058:
  %t3155 = load ptr, ptr %var_name
  %t3156 = load ptr, ptr %var_type
  call void @ir_set_var_type(ptr %t3155, ptr %t3156)
  %t3158 = load ptr, ptr %var_type
  %t3159 = call ptr @storage_type(ptr %t3158)
  store ptr %t3159, ptr %store_type
  %t3160 = load ptr, ptr %store_type
  %t3161 = load ptr, ptr %var_name
  %t3162 = call i32 @ir_alloca(ptr %t3160, ptr %t3161)
  %t3163 = load ptr, ptr %stmt
  %t3164 = getelementptr inbounds %ASTNode, ptr %t3163, i32 0, i32 6
  %t3165 = load ptr, ptr %t3164
  %t3166 = getelementptr inbounds [1 x i8], ptr @.str.s396, i64 0, i64 0
  %t3167 = call i32 @str_equals(ptr %t3165, ptr %t3166)
  %t3168 = icmp eq i32 %t3167, 0
  br i1 %t3168, label %label_1062, label %label_1064
label_1062:
  %t3170 = load ptr, ptr %stmt
  %t3171 = getelementptr inbounds %ASTNode, ptr %t3170, i32 0, i32 6
  %t3172 = load ptr, ptr %t3171
  %t3173 = call ptr @ptr_to_node(ptr %t3172)
  %t3174 = call ptr @generate_expression(ptr %t3173)
  store ptr %t3174, ptr %init_val
  %t3175 = load ptr, ptr %store_type
  %t3176 = load ptr, ptr %init_val
  %t3177 = load ptr, ptr %var_name
  call void @ir_store(ptr %t3175, ptr %t3176, ptr %t3177)
  br label %label_1064
label_1064:
  br label %label_1055
label_1055:
  %t3178 = load ptr, ptr %stmt
  %t3179 = getelementptr inbounds %ASTNode, ptr %t3178, i32 0, i32 0
  %t3180 = load i32, ptr %t3179
  %t3181 = icmp eq i32 %t3180, 16
  br i1 %t3181, label %label_1065, label %label_1067
label_1065:
  %t3183 = load ptr, ptr %stmt
  %t3184 = getelementptr inbounds %ASTNode, ptr %t3183, i32 0, i32 5
  %t3185 = load ptr, ptr %t3184
  %t3186 = call ptr @ptr_to_node(ptr %t3185)
  store ptr %t3186, ptr %target_node
  %t3187 = load ptr, ptr %target_node
  %t3188 = getelementptr inbounds %ASTNode, ptr %t3187, i32 0, i32 0
  %t3189 = load i32, ptr %t3188
  %t3190 = icmp eq i32 %t3189, 23
  br i1 %t3190, label %label_1068, label %label_1070
label_1068:
  %t3191 = load ptr, ptr %target_node
  %t3192 = getelementptr inbounds %ASTNode, ptr %t3191, i32 0, i32 1
  %t3193 = load ptr, ptr %t3192
  store ptr %t3193, ptr %var_name
  %t3194 = load ptr, ptr %var_name
  %t3195 = call ptr @ir_get_var_type(ptr %t3194)
  store ptr %t3195, ptr %var_type
  %t3196 = load ptr, ptr %var_type
  %t3197 = call ptr @storage_type(ptr %t3196)
  store ptr %t3197, ptr %store_type
  %t3199 = load ptr, ptr %stmt
  %t3200 = getelementptr inbounds %ASTNode, ptr %t3199, i32 0, i32 6
  %t3201 = load ptr, ptr %t3200
  %t3202 = call ptr @ptr_to_node(ptr %t3201)
  %t3203 = call ptr @generate_expression(ptr %t3202)
  store ptr %t3203, ptr %val
  %t3204 = load ptr, ptr %var_name
  %t3205 = call i32 @ir_is_global_name(ptr %t3204)
  %t3206 = icmp eq i32 %t3205, 1
  br i1 %t3206, label %label_1071, label %label_1072
label_1071:
  %t3207 = load ptr, ptr %store_type
  %t3208 = load ptr, ptr %val
  %t3209 = load ptr, ptr %var_name
  call void @ir_store_global(ptr %t3207, ptr %t3208, ptr %t3209)
  br label %label_1073
label_1072:
  %t3210 = load ptr, ptr %store_type
  %t3211 = load ptr, ptr %val
  %t3212 = load ptr, ptr %var_name
  call void @ir_store(ptr %t3210, ptr %t3211, ptr %t3212)
  br label %label_1073
label_1073:
  br label %label_1070
label_1070:
  %t3213 = load ptr, ptr %target_node
  %t3214 = getelementptr inbounds %ASTNode, ptr %t3213, i32 0, i32 0
  %t3215 = load i32, ptr %t3214
  %t3216 = icmp eq i32 %t3215, 25
  br i1 %t3216, label %label_1074, label %label_1076
label_1074:
  %t3218 = load ptr, ptr %target_node
  %t3219 = getelementptr inbounds %ASTNode, ptr %t3218, i32 0, i32 5
  %t3220 = load ptr, ptr %t3219
  %t3221 = call ptr @ptr_to_node(ptr %t3220)
  store ptr %t3221, ptr %object_node
  %t3223 = load ptr, ptr %object_node
  %t3224 = call ptr @generate_expression(ptr %t3223)
  store ptr %t3224, ptr %object_val
  %t3226 = load ptr, ptr %object_node
  %t3227 = call ptr @get_expr_type(ptr %t3226)
  store ptr %t3227, ptr %object_type
  %t3229 = load ptr, ptr %object_type
  %t3230 = call ptr @struct_type_name(ptr %t3229)
  store ptr %t3230, ptr %struct_name
  %t3232 = load ptr, ptr %struct_name
  %t3233 = load ptr, ptr %target_node
  %t3234 = getelementptr inbounds %ASTNode, ptr %t3233, i32 0, i32 1
  %t3235 = load ptr, ptr %t3234
  %t3236 = call i32 @ir_get_struct_field_index(ptr %t3232, ptr %t3235)
  store i32 %t3236, ptr %field_index
  %t3238 = load ptr, ptr %struct_name
  %t3239 = load ptr, ptr %target_node
  %t3240 = getelementptr inbounds %ASTNode, ptr %t3239, i32 0, i32 1
  %t3241 = load ptr, ptr %t3240
  %t3242 = call ptr @ir_get_struct_field_type(ptr %t3238, ptr %t3241)
  %t3243 = call ptr @storage_type(ptr %t3242)
  store ptr %t3243, ptr %field_type
  %t3244 = load ptr, ptr %stmt
  %t3245 = getelementptr inbounds %ASTNode, ptr %t3244, i32 0, i32 6
  %t3246 = load ptr, ptr %t3245
  %t3247 = call ptr @ptr_to_node(ptr %t3246)
  %t3248 = call ptr @generate_expression(ptr %t3247)
  store ptr %t3248, ptr %val
  %t3250 = call i32 @ir_get_temp()
  store i32 %t3250, ptr %gep_temp
  %t3252 = load i32, ptr %gep_temp
  %t3253 = call ptr @ir_get_temp_name(i32 %t3252)
  store ptr %t3253, ptr %gep_name
  %t3254 = getelementptr inbounds [3 x i8], ptr @.str.s397, i64 0, i64 0
  call void @ir_append(ptr %t3254)
  %t3255 = load ptr, ptr %gep_name
  call void @ir_append(ptr %t3255)
  %t3256 = getelementptr inbounds [27 x i8], ptr @.str.s398, i64 0, i64 0
  call void @ir_append(ptr %t3256)
  %t3257 = getelementptr inbounds [2 x i8], ptr @.str.s399, i64 0, i64 0
  %t3258 = load ptr, ptr %struct_name
  %t3259 = call ptr @str_concat(ptr %t3257, ptr %t3258)
  call void @ir_append(ptr %t3259)
  %t3260 = getelementptr inbounds [7 x i8], ptr @.str.s400, i64 0, i64 0
  call void @ir_append(ptr %t3260)
  %t3261 = load ptr, ptr %object_val
  call void @ir_append(ptr %t3261)
  %t3262 = getelementptr inbounds [14 x i8], ptr @.str.s401, i64 0, i64 0
  call void @ir_append(ptr %t3262)
  %t3263 = load i32, ptr %field_index
  %t3264 = call ptr @int_to_str(i32 %t3263)
  call void @ir_append_line(ptr %t3264)
  %t3265 = getelementptr inbounds [9 x i8], ptr @.str.s402, i64 0, i64 0
  call void @ir_append(ptr %t3265)
  %t3266 = load ptr, ptr %field_type
  call void @ir_append(ptr %t3266)
  %t3267 = getelementptr inbounds [2 x i8], ptr @.str.s403, i64 0, i64 0
  call void @ir_append(ptr %t3267)
  %t3268 = load ptr, ptr %val
  call void @ir_append(ptr %t3268)
  %t3269 = getelementptr inbounds [7 x i8], ptr @.str.s404, i64 0, i64 0
  call void @ir_append(ptr %t3269)
  %t3270 = load ptr, ptr %gep_name
  call void @ir_append_line(ptr %t3270)
  br label %label_1076
label_1076:
  br label %label_1067
label_1067:
  %t3271 = load ptr, ptr %stmt
  %t3272 = getelementptr inbounds %ASTNode, ptr %t3271, i32 0, i32 0
  %t3273 = load i32, ptr %t3272
  %t3274 = icmp eq i32 %t3273, 15
  br i1 %t3274, label %label_1077, label %label_1079
label_1077:
  %t3275 = load ptr, ptr %stmt
  %t3276 = getelementptr inbounds %ASTNode, ptr %t3275, i32 0, i32 5
  %t3277 = load ptr, ptr %t3276
  %t3278 = getelementptr inbounds [1 x i8], ptr @.str.s405, i64 0, i64 0
  %t3279 = call i32 @str_equals(ptr %t3277, ptr %t3278)
  %t3280 = icmp eq i32 %t3279, 0
  br i1 %t3280, label %label_1080, label %label_1081
label_1080:
  %t3282 = load ptr, ptr %stmt
  %t3283 = getelementptr inbounds %ASTNode, ptr %t3282, i32 0, i32 5
  %t3284 = load ptr, ptr %t3283
  %t3285 = call ptr @ptr_to_node(ptr %t3284)
  %t3286 = call ptr @generate_expression(ptr %t3285)
  store ptr %t3286, ptr %ret_val
  %t3287 = load ptr, ptr %stmt
  %t3288 = getelementptr inbounds %ASTNode, ptr %t3287, i32 0, i32 5
  %t3289 = load ptr, ptr %t3288
  %t3290 = call ptr @ptr_to_node(ptr %t3289)
  %t3291 = call ptr @get_expr_type(ptr %t3290)
  %t3292 = call ptr @storage_type(ptr %t3291)
  %t3293 = load ptr, ptr %ret_val
  call void @ir_ret(ptr %t3292, ptr %t3293)
  br label %label_1082
label_1081:
  call void @ir_ret_void()
  br label %label_1082
label_1082:
  call void @ir_set_returned()
  br label %label_1079
label_1079:
  %t3294 = load ptr, ptr %stmt
  %t3295 = getelementptr inbounds %ASTNode, ptr %t3294, i32 0, i32 0
  %t3296 = load i32, ptr %t3295
  %t3297 = icmp eq i32 %t3296, 17
  br i1 %t3297, label %label_1083, label %label_1085
label_1083:
  %t3298 = load ptr, ptr %stmt
  %t3299 = getelementptr inbounds %ASTNode, ptr %t3298, i32 0, i32 5
  %t3300 = load ptr, ptr %t3299
  %t3301 = getelementptr inbounds [1 x i8], ptr @.str.s406, i64 0, i64 0
  %t3302 = call i32 @str_equals(ptr %t3300, ptr %t3301)
  %t3303 = icmp eq i32 %t3302, 0
  br i1 %t3303, label %label_1086, label %label_1088
label_1086:
  %t3304 = load ptr, ptr %stmt
  %t3305 = getelementptr inbounds %ASTNode, ptr %t3304, i32 0, i32 5
  %t3306 = load ptr, ptr %t3305
  %t3307 = call ptr @ptr_to_node(ptr %t3306)
  %t3308 = call ptr @generate_expression(ptr %t3307)
  br label %label_1088
label_1088:
  br label %label_1085
label_1085:
  %t3309 = load ptr, ptr %stmt
  %t3310 = getelementptr inbounds %ASTNode, ptr %t3309, i32 0, i32 0
  %t3311 = load i32, ptr %t3310
  %t3312 = icmp eq i32 %t3311, 10
  br i1 %t3312, label %label_1089, label %label_1091
label_1089:
  %t3314 = load ptr, ptr %stmt
  %t3315 = getelementptr inbounds %ASTNode, ptr %t3314, i32 0, i32 5
  %t3316 = load ptr, ptr %t3315
  %t3317 = call ptr @ptr_to_node(ptr %t3316)
  %t3318 = call ptr @generate_expression(ptr %t3317)
  store ptr %t3318, ptr %cond_val
  %t3320 = call i32 @ir_get_label()
  store i32 %t3320, ptr %then_label
  %t3322 = call i32 @ir_get_label()
  store i32 %t3322, ptr %else_label
  %t3324 = call i32 @ir_get_label()
  store i32 %t3324, ptr %end_label
  %t3325 = load ptr, ptr %stmt
  %t3326 = getelementptr inbounds %ASTNode, ptr %t3325, i32 0, i32 7
  %t3327 = load ptr, ptr %t3326
  %t3328 = getelementptr inbounds [1 x i8], ptr @.str.s407, i64 0, i64 0
  %t3329 = call i32 @str_equals(ptr %t3327, ptr %t3328)
  %t3330 = icmp eq i32 %t3329, 0
  br i1 %t3330, label %label_1092, label %label_1093
label_1092:
  %t3331 = load ptr, ptr %cond_val
  %t3332 = load i32, ptr %then_label
  %t3333 = load i32, ptr %else_label
  call void @ir_cond_br_numbered(ptr %t3331, i32 %t3332, i32 %t3333)
  br label %label_1094
label_1093:
  %t3334 = load ptr, ptr %cond_val
  %t3335 = load i32, ptr %then_label
  %t3336 = load i32, ptr %end_label
  call void @ir_cond_br_numbered(ptr %t3334, i32 %t3335, i32 %t3336)
  br label %label_1094
label_1094:
  %t3337 = load i32, ptr %then_label
  call void @ir_label_numbered(i32 %t3337)
  %t3338 = load ptr, ptr %stmt
  %t3339 = getelementptr inbounds %ASTNode, ptr %t3338, i32 0, i32 6
  %t3340 = load ptr, ptr %t3339
  %t3341 = call ptr @ptr_to_node(ptr %t3340)
  call void @generate_block(ptr %t3341)
  %t3342 = call i32 @ir_has_returned()
  %t3343 = icmp eq i32 %t3342, 0
  br i1 %t3343, label %label_1095, label %label_1097
label_1095:
  %t3344 = load i32, ptr %end_label
  call void @ir_br_numbered(i32 %t3344)
  br label %label_1097
label_1097:
  call void @ir_clear_returned()
  %t3345 = load ptr, ptr %stmt
  %t3346 = getelementptr inbounds %ASTNode, ptr %t3345, i32 0, i32 7
  %t3347 = load ptr, ptr %t3346
  %t3348 = getelementptr inbounds [1 x i8], ptr @.str.s408, i64 0, i64 0
  %t3349 = call i32 @str_equals(ptr %t3347, ptr %t3348)
  %t3350 = icmp eq i32 %t3349, 0
  br i1 %t3350, label %label_1098, label %label_1100
label_1098:
  %t3351 = load i32, ptr %else_label
  call void @ir_label_numbered(i32 %t3351)
  %t3353 = load ptr, ptr %stmt
  %t3354 = getelementptr inbounds %ASTNode, ptr %t3353, i32 0, i32 7
  %t3355 = load ptr, ptr %t3354
  %t3356 = call ptr @ptr_to_node(ptr %t3355)
  store ptr %t3356, ptr %else_node
  %t3357 = load ptr, ptr %else_node
  %t3358 = getelementptr inbounds %ASTNode, ptr %t3357, i32 0, i32 0
  %t3359 = load i32, ptr %t3358
  %t3360 = icmp eq i32 %t3359, 10
  br i1 %t3360, label %label_1101, label %label_1102
label_1101:
  %t3361 = load ptr, ptr %else_node
  call void @generate_statement(ptr %t3361)
  br label %label_1103
label_1102:
  %t3362 = load ptr, ptr %else_node
  call void @generate_block(ptr %t3362)
  br label %label_1103
label_1103:
  %t3363 = call i32 @ir_has_returned()
  %t3364 = icmp eq i32 %t3363, 0
  br i1 %t3364, label %label_1104, label %label_1106
label_1104:
  %t3365 = load i32, ptr %end_label
  call void @ir_br_numbered(i32 %t3365)
  br label %label_1106
label_1106:
  call void @ir_clear_returned()
  br label %label_1100
label_1100:
  %t3366 = load i32, ptr %end_label
  call void @ir_label_numbered(i32 %t3366)
  br label %label_1091
label_1091:
  %t3367 = load ptr, ptr %stmt
  %t3368 = getelementptr inbounds %ASTNode, ptr %t3367, i32 0, i32 0
  %t3369 = load i32, ptr %t3368
  %t3370 = icmp eq i32 %t3369, 13
  br i1 %t3370, label %label_1107, label %label_1109
label_1107:
  %t3372 = call i32 @ir_get_label()
  store i32 %t3372, ptr %cond_label
  %t3374 = call i32 @ir_get_label()
  store i32 %t3374, ptr %body_label
  %t3375 = call i32 @ir_get_label()
  store i32 %t3375, ptr %end_label
  %t3376 = load i32, ptr %cond_label
  call void @ir_br_numbered(i32 %t3376)
  %t3377 = load i32, ptr %cond_label
  call void @ir_label_numbered(i32 %t3377)
  %t3378 = load ptr, ptr %stmt
  %t3379 = getelementptr inbounds %ASTNode, ptr %t3378, i32 0, i32 5
  %t3380 = load ptr, ptr %t3379
  %t3381 = call ptr @ptr_to_node(ptr %t3380)
  %t3382 = call ptr @generate_expression(ptr %t3381)
  store ptr %t3382, ptr %cond_val
  %t3383 = load ptr, ptr %cond_val
  %t3384 = load i32, ptr %body_label
  %t3385 = load i32, ptr %end_label
  call void @ir_cond_br_numbered(ptr %t3383, i32 %t3384, i32 %t3385)
  %t3386 = load i32, ptr %body_label
  call void @ir_label_numbered(i32 %t3386)
  %t3387 = load ptr, ptr %stmt
  %t3388 = getelementptr inbounds %ASTNode, ptr %t3387, i32 0, i32 6
  %t3389 = load ptr, ptr %t3388
  %t3390 = call ptr @ptr_to_node(ptr %t3389)
  call void @generate_block(ptr %t3390)
  %t3391 = call i32 @ir_has_returned()
  %t3392 = icmp eq i32 %t3391, 0
  br i1 %t3392, label %label_1110, label %label_1112
label_1110:
  %t3393 = load i32, ptr %cond_label
  call void @ir_br_numbered(i32 %t3393)
  br label %label_1112
label_1112:
  call void @ir_clear_returned()
  %t3394 = load i32, ptr %end_label
  call void @ir_label_numbered(i32 %t3394)
  br label %label_1109
label_1109:
  ret void
}

define void @generate_block(ptr %p_block) {
  %block = alloca ptr
  %stmt_ptr = alloca ptr
  %stmt = alloca ptr
  store ptr %p_block, ptr %block
  %t3397 = load ptr, ptr %block
  %t3398 = getelementptr inbounds %ASTNode, ptr %t3397, i32 0, i32 5
  %t3399 = load ptr, ptr %t3398
  store ptr %t3399, ptr %stmt_ptr
  br label %label_1113
label_1113:
  %t3400 = load ptr, ptr %stmt_ptr
  %t3401 = getelementptr inbounds [1 x i8], ptr @.str.s409, i64 0, i64 0
  %t3402 = call i32 @str_equals(ptr %t3400, ptr %t3401)
  %t3403 = icmp eq i32 %t3402, 0
  br i1 %t3403, label %label_1114, label %label_1115
label_1114:
  %t3405 = load ptr, ptr %stmt_ptr
  %t3406 = call ptr @ptr_to_node(ptr %t3405)
  store ptr %t3406, ptr %stmt
  %t3407 = load ptr, ptr %stmt
  call void @generate_statement(ptr %t3407)
  %t3408 = load ptr, ptr %stmt
  %t3409 = getelementptr inbounds %ASTNode, ptr %t3408, i32 0, i32 8
  %t3410 = load ptr, ptr %t3409
  store ptr %t3410, ptr %stmt_ptr
  br label %label_1113
label_1115:
  ret void
}

define ptr @get_variable_decl_type(ptr %p_stmt) {
  %stmt = alloca ptr
  %var_type = alloca ptr
  %type_node = alloca ptr
  store ptr %p_stmt, ptr %stmt
  %t3413 = getelementptr inbounds [4 x i8], ptr @.str.s410, i64 0, i64 0
  store ptr %t3413, ptr %var_type
  %t3414 = load ptr, ptr %stmt
  %t3415 = getelementptr inbounds %ASTNode, ptr %t3414, i32 0, i32 5
  %t3416 = load ptr, ptr %t3415
  %t3417 = getelementptr inbounds [1 x i8], ptr @.str.s411, i64 0, i64 0
  %t3418 = call i32 @str_equals(ptr %t3416, ptr %t3417)
  %t3419 = icmp eq i32 %t3418, 0
  br i1 %t3419, label %label_1116, label %label_1117
label_1116:
  %t3421 = load ptr, ptr %stmt
  %t3422 = getelementptr inbounds %ASTNode, ptr %t3421, i32 0, i32 5
  %t3423 = load ptr, ptr %t3422
  %t3424 = call ptr @ptr_to_node(ptr %t3423)
  store ptr %t3424, ptr %type_node
  %t3425 = load ptr, ptr %type_node
  %t3426 = call ptr @map_type_node(ptr %t3425)
  store ptr %t3426, ptr %var_type
  br label %label_1118
label_1117:
  %t3427 = load ptr, ptr %stmt
  %t3428 = getelementptr inbounds %ASTNode, ptr %t3427, i32 0, i32 6
  %t3429 = load ptr, ptr %t3428
  %t3430 = getelementptr inbounds [1 x i8], ptr @.str.s412, i64 0, i64 0
  %t3431 = call i32 @str_equals(ptr %t3429, ptr %t3430)
  %t3432 = icmp eq i32 %t3431, 0
  br i1 %t3432, label %label_1119, label %label_1121
label_1119:
  %t3433 = load ptr, ptr %stmt
  %t3434 = getelementptr inbounds %ASTNode, ptr %t3433, i32 0, i32 6
  %t3435 = load ptr, ptr %t3434
  %t3436 = call ptr @ptr_to_node(ptr %t3435)
  %t3437 = call ptr @get_expr_type(ptr %t3436)
  store ptr %t3437, ptr %var_type
  br label %label_1121
label_1121:
  br label %label_1118
label_1118:
  %t3438 = load ptr, ptr %var_type
  ret ptr %t3438
}

define void @predeclare_locals_stmt(ptr %p_stmt) {
  %stmt = alloca ptr
  %var_type = alloca ptr
  %else_node = alloca ptr
  store ptr %p_stmt, ptr %stmt
  %t3440 = load ptr, ptr %stmt
  %t3441 = getelementptr inbounds %ASTNode, ptr %t3440, i32 0, i32 0
  %t3442 = load i32, ptr %t3441
  %t3443 = icmp eq i32 %t3442, 3
  br i1 %t3443, label %label_1122, label %label_1124
label_1122:
  %t3445 = load ptr, ptr %stmt
  %t3446 = call ptr @get_variable_decl_type(ptr %t3445)
  store ptr %t3446, ptr %var_type
  %t3447 = load ptr, ptr %stmt
  %t3448 = getelementptr inbounds %ASTNode, ptr %t3447, i32 0, i32 1
  %t3449 = load ptr, ptr %t3448
  %t3450 = load ptr, ptr %var_type
  call void @ir_set_var_type(ptr %t3449, ptr %t3450)
  %t3451 = load ptr, ptr %var_type
  %t3452 = call ptr @storage_type(ptr %t3451)
  %t3453 = load ptr, ptr %stmt
  %t3454 = getelementptr inbounds %ASTNode, ptr %t3453, i32 0, i32 1
  %t3455 = load ptr, ptr %t3454
  %t3456 = call i32 @ir_alloca(ptr %t3452, ptr %t3455)
  br label %label_1124
label_1124:
  %t3457 = load ptr, ptr %stmt
  %t3458 = getelementptr inbounds %ASTNode, ptr %t3457, i32 0, i32 0
  %t3459 = load i32, ptr %t3458
  %t3460 = icmp eq i32 %t3459, 10
  br i1 %t3460, label %label_1125, label %label_1127
label_1125:
  %t3461 = load ptr, ptr %stmt
  %t3462 = getelementptr inbounds %ASTNode, ptr %t3461, i32 0, i32 6
  %t3463 = load ptr, ptr %t3462
  %t3464 = getelementptr inbounds [1 x i8], ptr @.str.s413, i64 0, i64 0
  %t3465 = call i32 @str_equals(ptr %t3463, ptr %t3464)
  %t3466 = icmp eq i32 %t3465, 0
  br i1 %t3466, label %label_1128, label %label_1130
label_1128:
  %t3467 = load ptr, ptr %stmt
  %t3468 = getelementptr inbounds %ASTNode, ptr %t3467, i32 0, i32 6
  %t3469 = load ptr, ptr %t3468
  %t3470 = call ptr @ptr_to_node(ptr %t3469)
  call void @predeclare_locals_block(ptr %t3470)
  br label %label_1130
label_1130:
  %t3471 = load ptr, ptr %stmt
  %t3472 = getelementptr inbounds %ASTNode, ptr %t3471, i32 0, i32 7
  %t3473 = load ptr, ptr %t3472
  %t3474 = getelementptr inbounds [1 x i8], ptr @.str.s414, i64 0, i64 0
  %t3475 = call i32 @str_equals(ptr %t3473, ptr %t3474)
  %t3476 = icmp eq i32 %t3475, 0
  br i1 %t3476, label %label_1131, label %label_1133
label_1131:
  %t3478 = load ptr, ptr %stmt
  %t3479 = getelementptr inbounds %ASTNode, ptr %t3478, i32 0, i32 7
  %t3480 = load ptr, ptr %t3479
  %t3481 = call ptr @ptr_to_node(ptr %t3480)
  store ptr %t3481, ptr %else_node
  %t3482 = load ptr, ptr %else_node
  %t3483 = getelementptr inbounds %ASTNode, ptr %t3482, i32 0, i32 0
  %t3484 = load i32, ptr %t3483
  %t3485 = icmp eq i32 %t3484, 9
  br i1 %t3485, label %label_1134, label %label_1135
label_1134:
  %t3486 = load ptr, ptr %else_node
  call void @predeclare_locals_block(ptr %t3486)
  br label %label_1136
label_1135:
  %t3487 = load ptr, ptr %else_node
  call void @predeclare_locals_stmt(ptr %t3487)
  br label %label_1136
label_1136:
  br label %label_1133
label_1133:
  br label %label_1127
label_1127:
  %t3488 = load ptr, ptr %stmt
  %t3489 = getelementptr inbounds %ASTNode, ptr %t3488, i32 0, i32 0
  %t3490 = load i32, ptr %t3489
  %t3491 = icmp eq i32 %t3490, 13
  br i1 %t3491, label %label_1137, label %label_1139
label_1137:
  %t3492 = load ptr, ptr %stmt
  %t3493 = getelementptr inbounds %ASTNode, ptr %t3492, i32 0, i32 6
  %t3494 = load ptr, ptr %t3493
  %t3495 = getelementptr inbounds [1 x i8], ptr @.str.s415, i64 0, i64 0
  %t3496 = call i32 @str_equals(ptr %t3494, ptr %t3495)
  %t3497 = icmp eq i32 %t3496, 0
  br i1 %t3497, label %label_1140, label %label_1142
label_1140:
  %t3498 = load ptr, ptr %stmt
  %t3499 = getelementptr inbounds %ASTNode, ptr %t3498, i32 0, i32 6
  %t3500 = load ptr, ptr %t3499
  %t3501 = call ptr @ptr_to_node(ptr %t3500)
  call void @predeclare_locals_block(ptr %t3501)
  br label %label_1142
label_1142:
  br label %label_1139
label_1139:
  %t3502 = load ptr, ptr %stmt
  %t3503 = getelementptr inbounds %ASTNode, ptr %t3502, i32 0, i32 0
  %t3504 = load i32, ptr %t3503
  %t3505 = icmp eq i32 %t3504, 14
  br i1 %t3505, label %label_1143, label %label_1145
label_1143:
  %t3506 = load ptr, ptr %stmt
  %t3507 = getelementptr inbounds %ASTNode, ptr %t3506, i32 0, i32 5
  %t3508 = load ptr, ptr %t3507
  %t3509 = getelementptr inbounds [1 x i8], ptr @.str.s416, i64 0, i64 0
  %t3510 = call i32 @str_equals(ptr %t3508, ptr %t3509)
  %t3511 = icmp eq i32 %t3510, 0
  br i1 %t3511, label %label_1146, label %label_1148
label_1146:
  %t3512 = load ptr, ptr %stmt
  %t3513 = getelementptr inbounds %ASTNode, ptr %t3512, i32 0, i32 5
  %t3514 = load ptr, ptr %t3513
  %t3515 = call ptr @ptr_to_node(ptr %t3514)
  call void @predeclare_locals_block(ptr %t3515)
  br label %label_1148
label_1148:
  br label %label_1145
label_1145:
  ret void
}

define void @predeclare_locals_block(ptr %p_block) {
  %block = alloca ptr
  %stmt_ptr = alloca ptr
  %stmt = alloca ptr
  store ptr %p_block, ptr %block
  %t3518 = load ptr, ptr %block
  %t3519 = getelementptr inbounds %ASTNode, ptr %t3518, i32 0, i32 5
  %t3520 = load ptr, ptr %t3519
  store ptr %t3520, ptr %stmt_ptr
  br label %label_1149
label_1149:
  %t3521 = load ptr, ptr %stmt_ptr
  %t3522 = getelementptr inbounds [1 x i8], ptr @.str.s417, i64 0, i64 0
  %t3523 = call i32 @str_equals(ptr %t3521, ptr %t3522)
  %t3524 = icmp eq i32 %t3523, 0
  br i1 %t3524, label %label_1150, label %label_1151
label_1150:
  %t3526 = load ptr, ptr %stmt_ptr
  %t3527 = call ptr @ptr_to_node(ptr %t3526)
  store ptr %t3527, ptr %stmt
  %t3528 = load ptr, ptr %stmt
  call void @predeclare_locals_stmt(ptr %t3528)
  %t3529 = load ptr, ptr %stmt
  %t3530 = getelementptr inbounds %ASTNode, ptr %t3529, i32 0, i32 8
  %t3531 = load ptr, ptr %t3530
  store ptr %t3531, ptr %stmt_ptr
  br label %label_1149
label_1151:
  ret void
}

define void @generate_function(ptr %p_func) {
  %func = alloca ptr
  %func_name = alloca ptr
  %ret_type = alloca ptr
  %is_main = alloca i32
  %ret_sig_type = alloca ptr
  %param_ptr = alloca ptr
  %param_ptr2 = alloca ptr
  %ret_node = alloca ptr
  %param_node = alloca ptr
  %p_type_node = alloca ptr
  %p_type_str = alloca ptr
  %p_store_type = alloca ptr
  store ptr %p_func, ptr %func
  %t3539 = load ptr, ptr %func
  %t3540 = getelementptr inbounds %ASTNode, ptr %t3539, i32 0, i32 1
  %t3541 = load ptr, ptr %t3540
  store ptr %t3541, ptr %func_name
  %t3542 = getelementptr inbounds [5 x i8], ptr @.str.s418, i64 0, i64 0
  store ptr %t3542, ptr %ret_type
  %t3543 = load ptr, ptr %func
  %t3544 = getelementptr inbounds %ASTNode, ptr %t3543, i32 0, i32 7
  %t3545 = load ptr, ptr %t3544
  %t3546 = getelementptr inbounds [1 x i8], ptr @.str.s419, i64 0, i64 0
  %t3547 = call i32 @str_equals(ptr %t3545, ptr %t3546)
  %t3548 = icmp eq i32 %t3547, 0
  br i1 %t3548, label %label_1152, label %label_1154
label_1152:
  %t3550 = load ptr, ptr %func
  %t3551 = getelementptr inbounds %ASTNode, ptr %t3550, i32 0, i32 7
  %t3552 = load ptr, ptr %t3551
  %t3553 = call ptr @ptr_to_node(ptr %t3552)
  store ptr %t3553, ptr %ret_node
  %t3554 = load ptr, ptr %ret_node
  %t3555 = call ptr @map_type_node(ptr %t3554)
  store ptr %t3555, ptr %ret_type
  br label %label_1154
label_1154:
  store i32 0, ptr %is_main
  %t3556 = load ptr, ptr %func_name
  %t3557 = getelementptr inbounds [5 x i8], ptr @.str.s420, i64 0, i64 0
  %t3558 = call i32 @str_equals(ptr %t3556, ptr %t3557)
  %t3559 = icmp eq i32 %t3558, 1
  br i1 %t3559, label %label_1155, label %label_1157
label_1155:
  %t3560 = getelementptr inbounds [4 x i8], ptr @.str.s421, i64 0, i64 0
  store ptr %t3560, ptr %ret_type
  store i32 1, ptr %is_main
  br label %label_1157
label_1157:
  %t3561 = load ptr, ptr %ret_type
  %t3562 = call ptr @storage_type(ptr %t3561)
  store ptr %t3562, ptr %ret_sig_type
  %t3563 = load ptr, ptr %func_name
  %t3564 = load ptr, ptr %ret_sig_type
  call void @ir_function_begin(ptr %t3563, ptr %t3564)
  %t3565 = load ptr, ptr %func
  %t3566 = getelementptr inbounds %ASTNode, ptr %t3565, i32 0, i32 5
  %t3567 = load ptr, ptr %t3566
  store ptr %t3567, ptr %param_ptr
  br label %label_1158
label_1158:
  %t3568 = load ptr, ptr %param_ptr
  %t3569 = getelementptr inbounds [1 x i8], ptr @.str.s422, i64 0, i64 0
  %t3570 = call i32 @str_equals(ptr %t3568, ptr %t3569)
  %t3571 = icmp eq i32 %t3570, 0
  br i1 %t3571, label %label_1159, label %label_1160
label_1159:
  %t3573 = load ptr, ptr %param_ptr
  %t3574 = call ptr @ptr_to_node(ptr %t3573)
  store ptr %t3574, ptr %param_node
  %t3576 = load ptr, ptr %param_node
  %t3577 = getelementptr inbounds %ASTNode, ptr %t3576, i32 0, i32 5
  %t3578 = load ptr, ptr %t3577
  %t3579 = call ptr @ptr_to_node(ptr %t3578)
  store ptr %t3579, ptr %p_type_node
  %t3580 = load ptr, ptr %p_type_node
  %t3581 = call ptr @map_type_node(ptr %t3580)
  %t3582 = call ptr @storage_type(ptr %t3581)
  %t3583 = getelementptr inbounds [3 x i8], ptr @.str.s423, i64 0, i64 0
  %t3584 = load ptr, ptr %param_node
  %t3585 = getelementptr inbounds %ASTNode, ptr %t3584, i32 0, i32 1
  %t3586 = load ptr, ptr %t3585
  %t3587 = call ptr @str_concat(ptr %t3583, ptr %t3586)
  call void @ir_function_param(ptr %t3582, ptr %t3587)
  %t3588 = load ptr, ptr %param_node
  %t3589 = getelementptr inbounds %ASTNode, ptr %t3588, i32 0, i32 8
  %t3590 = load ptr, ptr %t3589
  store ptr %t3590, ptr %param_ptr
  br label %label_1158
label_1160:
  call void @ir_function_body_start()
  call void @ir_clear_local_var_types()
  call void @ir_clear_returned()
  %t3591 = load ptr, ptr %func
  %t3592 = getelementptr inbounds %ASTNode, ptr %t3591, i32 0, i32 5
  %t3593 = load ptr, ptr %t3592
  store ptr %t3593, ptr %param_ptr2
  br label %label_1161
label_1161:
  %t3594 = load ptr, ptr %param_ptr2
  %t3595 = getelementptr inbounds [1 x i8], ptr @.str.s424, i64 0, i64 0
  %t3596 = call i32 @str_equals(ptr %t3594, ptr %t3595)
  %t3597 = icmp eq i32 %t3596, 0
  br i1 %t3597, label %label_1162, label %label_1163
label_1162:
  %t3598 = load ptr, ptr %param_ptr2
  %t3599 = call ptr @ptr_to_node(ptr %t3598)
  store ptr %t3599, ptr %param_node
  %t3600 = load ptr, ptr %param_node
  %t3601 = getelementptr inbounds %ASTNode, ptr %t3600, i32 0, i32 5
  %t3602 = load ptr, ptr %t3601
  %t3603 = call ptr @ptr_to_node(ptr %t3602)
  store ptr %t3603, ptr %p_type_node
  %t3605 = load ptr, ptr %p_type_node
  %t3606 = call ptr @map_type_node(ptr %t3605)
  store ptr %t3606, ptr %p_type_str
  %t3608 = load ptr, ptr %p_type_str
  %t3609 = call ptr @storage_type(ptr %t3608)
  store ptr %t3609, ptr %p_store_type
  %t3610 = load ptr, ptr %param_node
  %t3611 = getelementptr inbounds %ASTNode, ptr %t3610, i32 0, i32 1
  %t3612 = load ptr, ptr %t3611
  %t3613 = load ptr, ptr %p_type_str
  call void @ir_set_var_type(ptr %t3612, ptr %t3613)
  %t3614 = load ptr, ptr %p_store_type
  %t3615 = load ptr, ptr %param_node
  %t3616 = getelementptr inbounds %ASTNode, ptr %t3615, i32 0, i32 1
  %t3617 = load ptr, ptr %t3616
  %t3618 = call i32 @ir_alloca(ptr %t3614, ptr %t3617)
  %t3619 = load ptr, ptr %p_store_type
  %t3620 = getelementptr inbounds [4 x i8], ptr @.str.s425, i64 0, i64 0
  %t3621 = load ptr, ptr %param_node
  %t3622 = getelementptr inbounds %ASTNode, ptr %t3621, i32 0, i32 1
  %t3623 = load ptr, ptr %t3622
  %t3624 = call ptr @str_concat(ptr %t3620, ptr %t3623)
  %t3625 = load ptr, ptr %param_node
  %t3626 = getelementptr inbounds %ASTNode, ptr %t3625, i32 0, i32 1
  %t3627 = load ptr, ptr %t3626
  call void @ir_store(ptr %t3619, ptr %t3624, ptr %t3627)
  %t3628 = load ptr, ptr %param_node
  %t3629 = getelementptr inbounds %ASTNode, ptr %t3628, i32 0, i32 8
  %t3630 = load ptr, ptr %t3629
  store ptr %t3630, ptr %param_ptr2
  br label %label_1161
label_1163:
  %t3631 = load ptr, ptr %func
  %t3632 = getelementptr inbounds %ASTNode, ptr %t3631, i32 0, i32 6
  %t3633 = load ptr, ptr %t3632
  %t3634 = getelementptr inbounds [1 x i8], ptr @.str.s426, i64 0, i64 0
  %t3635 = call i32 @str_equals(ptr %t3633, ptr %t3634)
  %t3636 = icmp eq i32 %t3635, 0
  br i1 %t3636, label %label_1164, label %label_1166
label_1164:
  %t3637 = load ptr, ptr %func
  %t3638 = getelementptr inbounds %ASTNode, ptr %t3637, i32 0, i32 6
  %t3639 = load ptr, ptr %t3638
  %t3640 = call ptr @ptr_to_node(ptr %t3639)
  call void @predeclare_locals_block(ptr %t3640)
  br label %label_1166
label_1166:
  %t3641 = load ptr, ptr %func
  %t3642 = getelementptr inbounds %ASTNode, ptr %t3641, i32 0, i32 6
  %t3643 = load ptr, ptr %t3642
  %t3644 = getelementptr inbounds [1 x i8], ptr @.str.s427, i64 0, i64 0
  %t3645 = call i32 @str_equals(ptr %t3643, ptr %t3644)
  %t3646 = icmp eq i32 %t3645, 0
  br i1 %t3646, label %label_1167, label %label_1169
label_1167:
  %t3647 = load ptr, ptr %func
  %t3648 = getelementptr inbounds %ASTNode, ptr %t3647, i32 0, i32 6
  %t3649 = load ptr, ptr %t3648
  %t3650 = call ptr @ptr_to_node(ptr %t3649)
  call void @generate_block(ptr %t3650)
  br label %label_1169
label_1169:
  %t3651 = call i32 @ir_has_returned()
  %t3652 = icmp eq i32 %t3651, 0
  br i1 %t3652, label %label_1170, label %label_1172
label_1170:
  %t3653 = load ptr, ptr %ret_sig_type
  %t3654 = getelementptr inbounds [5 x i8], ptr @.str.s428, i64 0, i64 0
  %t3655 = call i32 @str_equals(ptr %t3653, ptr %t3654)
  %t3656 = icmp eq i32 %t3655, 1
  br i1 %t3656, label %label_1173, label %label_1174
label_1173:
  call void @ir_ret_void()
  br label %label_1175
label_1174:
  %t3657 = load i32, ptr %is_main
  %t3658 = icmp eq i32 %t3657, 1
  br i1 %t3658, label %label_1176, label %label_1177
label_1176:
  %t3659 = getelementptr inbounds [4 x i8], ptr @.str.s429, i64 0, i64 0
  %t3660 = getelementptr inbounds [2 x i8], ptr @.str.s430, i64 0, i64 0
  call void @ir_ret(ptr %t3659, ptr %t3660)
  br label %label_1178
label_1177:
  %t3661 = load ptr, ptr %ret_sig_type
  %t3662 = getelementptr inbounds [2 x i8], ptr @.str.s431, i64 0, i64 0
  call void @ir_ret(ptr %t3661, ptr %t3662)
  br label %label_1178
label_1178:
  br label %label_1175
label_1175:
  br label %label_1172
label_1172:
  call void @ir_function_end()
  ret void
}

define void @collect_strings_expr(ptr %p_expr) {
  %expr = alloca ptr
  %str_name = alloca ptr
  %arg_ptr = alloca ptr
  %arg_node = alloca ptr
  %elem_ptr = alloca ptr
  %elem_node = alloca ptr
  %field_ptr = alloca ptr
  %field = alloca ptr
  store ptr %p_expr, ptr %expr
  %t3664 = load ptr, ptr %expr
  %t3665 = getelementptr inbounds %ASTNode, ptr %t3664, i32 0, i32 0
  %t3666 = load i32, ptr %t3665
  %t3667 = icmp eq i32 %t3666, 22
  br i1 %t3667, label %label_1179, label %label_1181
label_1179:
  %t3668 = load ptr, ptr %expr
  %t3669 = getelementptr inbounds %ASTNode, ptr %t3668, i32 0, i32 3
  %t3670 = load i32, ptr %t3669
  %t3671 = icmp eq i32 %t3670, 0
  br i1 %t3671, label %label_1182, label %label_1184
label_1182:
  %t3673 = getelementptr inbounds [7 x i8], ptr @.str.s432, i64 0, i64 0
  %t3674 = load i32, ptr @ir_string_counter
  %t3675 = call ptr @int_to_str(i32 %t3674)
  %t3676 = call ptr @str_concat(ptr %t3673, ptr %t3675)
  store ptr %t3676, ptr %str_name
  %t3677 = load i32, ptr @ir_string_counter
  %t3678 = add i32 %t3677, 1
  store i32 %t3678, ptr @ir_string_counter
  %t3679 = load ptr, ptr %str_name
  %t3680 = load ptr, ptr %expr
  %t3681 = getelementptr inbounds %ASTNode, ptr %t3680, i32 0, i32 1
  %t3682 = load ptr, ptr %t3681
  call void @ir_global_string(ptr %t3679, ptr %t3682)
  %t3683 = load ptr, ptr %expr
  %t3684 = load ptr, ptr %str_name
  %t3685 = getelementptr inbounds %ASTNode, ptr %t3683, i32 0, i32 2
  store ptr %t3684, ptr %t3685
  br label %label_1184
label_1184:
  br label %label_1181
label_1181:
  %t3686 = load ptr, ptr %expr
  %t3687 = getelementptr inbounds %ASTNode, ptr %t3686, i32 0, i32 0
  %t3688 = load i32, ptr %t3687
  %t3689 = icmp eq i32 %t3688, 20
  br i1 %t3689, label %label_1185, label %label_1187
label_1185:
  %t3690 = load ptr, ptr %expr
  %t3691 = getelementptr inbounds %ASTNode, ptr %t3690, i32 0, i32 5
  %t3692 = load ptr, ptr %t3691
  %t3693 = getelementptr inbounds [1 x i8], ptr @.str.s433, i64 0, i64 0
  %t3694 = call i32 @str_equals(ptr %t3692, ptr %t3693)
  %t3695 = icmp eq i32 %t3694, 0
  br i1 %t3695, label %label_1188, label %label_1190
label_1188:
  %t3696 = load ptr, ptr %expr
  %t3697 = getelementptr inbounds %ASTNode, ptr %t3696, i32 0, i32 5
  %t3698 = load ptr, ptr %t3697
  %t3699 = call ptr @ptr_to_node(ptr %t3698)
  call void @collect_strings_expr(ptr %t3699)
  br label %label_1190
label_1190:
  %t3700 = load ptr, ptr %expr
  %t3701 = getelementptr inbounds %ASTNode, ptr %t3700, i32 0, i32 6
  %t3702 = load ptr, ptr %t3701
  %t3703 = getelementptr inbounds [1 x i8], ptr @.str.s434, i64 0, i64 0
  %t3704 = call i32 @str_equals(ptr %t3702, ptr %t3703)
  %t3705 = icmp eq i32 %t3704, 0
  br i1 %t3705, label %label_1191, label %label_1193
label_1191:
  %t3706 = load ptr, ptr %expr
  %t3707 = getelementptr inbounds %ASTNode, ptr %t3706, i32 0, i32 6
  %t3708 = load ptr, ptr %t3707
  %t3709 = call ptr @ptr_to_node(ptr %t3708)
  call void @collect_strings_expr(ptr %t3709)
  br label %label_1193
label_1193:
  br label %label_1187
label_1187:
  %t3710 = load ptr, ptr %expr
  %t3711 = getelementptr inbounds %ASTNode, ptr %t3710, i32 0, i32 0
  %t3712 = load i32, ptr %t3711
  %t3713 = icmp eq i32 %t3712, 24
  br i1 %t3713, label %label_1194, label %label_1196
label_1194:
  %t3715 = load ptr, ptr %expr
  %t3716 = getelementptr inbounds %ASTNode, ptr %t3715, i32 0, i32 6
  %t3717 = load ptr, ptr %t3716
  store ptr %t3717, ptr %arg_ptr
  br label %label_1197
label_1197:
  %t3718 = load ptr, ptr %arg_ptr
  %t3719 = getelementptr inbounds [1 x i8], ptr @.str.s435, i64 0, i64 0
  %t3720 = call i32 @str_equals(ptr %t3718, ptr %t3719)
  %t3721 = icmp eq i32 %t3720, 0
  br i1 %t3721, label %label_1198, label %label_1199
label_1198:
  %t3723 = load ptr, ptr %arg_ptr
  %t3724 = call ptr @ptr_to_node(ptr %t3723)
  store ptr %t3724, ptr %arg_node
  %t3725 = load ptr, ptr %arg_node
  call void @collect_strings_expr(ptr %t3725)
  %t3726 = load ptr, ptr %arg_node
  %t3727 = getelementptr inbounds %ASTNode, ptr %t3726, i32 0, i32 8
  %t3728 = load ptr, ptr %t3727
  store ptr %t3728, ptr %arg_ptr
  br label %label_1197
label_1199:
  br label %label_1196
label_1196:
  %t3729 = load ptr, ptr %expr
  %t3730 = getelementptr inbounds %ASTNode, ptr %t3729, i32 0, i32 0
  %t3731 = load i32, ptr %t3730
  %t3732 = icmp eq i32 %t3731, 27
  br i1 %t3732, label %label_1200, label %label_1202
label_1200:
  %t3734 = load ptr, ptr %expr
  %t3735 = getelementptr inbounds %ASTNode, ptr %t3734, i32 0, i32 5
  %t3736 = load ptr, ptr %t3735
  store ptr %t3736, ptr %elem_ptr
  br label %label_1203
label_1203:
  %t3737 = load ptr, ptr %elem_ptr
  %t3738 = getelementptr inbounds [1 x i8], ptr @.str.s436, i64 0, i64 0
  %t3739 = call i32 @str_equals(ptr %t3737, ptr %t3738)
  %t3740 = icmp eq i32 %t3739, 0
  br i1 %t3740, label %label_1204, label %label_1205
label_1204:
  %t3742 = load ptr, ptr %elem_ptr
  %t3743 = call ptr @ptr_to_node(ptr %t3742)
  store ptr %t3743, ptr %elem_node
  %t3744 = load ptr, ptr %elem_node
  call void @collect_strings_expr(ptr %t3744)
  %t3745 = load ptr, ptr %elem_node
  %t3746 = getelementptr inbounds %ASTNode, ptr %t3745, i32 0, i32 8
  %t3747 = load ptr, ptr %t3746
  store ptr %t3747, ptr %elem_ptr
  br label %label_1203
label_1205:
  br label %label_1202
label_1202:
  %t3748 = load ptr, ptr %expr
  %t3749 = getelementptr inbounds %ASTNode, ptr %t3748, i32 0, i32 0
  %t3750 = load i32, ptr %t3749
  %t3751 = icmp eq i32 %t3750, 26
  br i1 %t3751, label %label_1206, label %label_1208
label_1206:
  %t3752 = load ptr, ptr %expr
  %t3753 = getelementptr inbounds %ASTNode, ptr %t3752, i32 0, i32 5
  %t3754 = load ptr, ptr %t3753
  %t3755 = getelementptr inbounds [1 x i8], ptr @.str.s437, i64 0, i64 0
  %t3756 = call i32 @str_equals(ptr %t3754, ptr %t3755)
  %t3757 = icmp eq i32 %t3756, 0
  br i1 %t3757, label %label_1209, label %label_1211
label_1209:
  %t3758 = load ptr, ptr %expr
  %t3759 = getelementptr inbounds %ASTNode, ptr %t3758, i32 0, i32 5
  %t3760 = load ptr, ptr %t3759
  %t3761 = call ptr @ptr_to_node(ptr %t3760)
  call void @collect_strings_expr(ptr %t3761)
  br label %label_1211
label_1211:
  %t3762 = load ptr, ptr %expr
  %t3763 = getelementptr inbounds %ASTNode, ptr %t3762, i32 0, i32 6
  %t3764 = load ptr, ptr %t3763
  %t3765 = getelementptr inbounds [1 x i8], ptr @.str.s438, i64 0, i64 0
  %t3766 = call i32 @str_equals(ptr %t3764, ptr %t3765)
  %t3767 = icmp eq i32 %t3766, 0
  br i1 %t3767, label %label_1212, label %label_1214
label_1212:
  %t3768 = load ptr, ptr %expr
  %t3769 = getelementptr inbounds %ASTNode, ptr %t3768, i32 0, i32 6
  %t3770 = load ptr, ptr %t3769
  %t3771 = call ptr @ptr_to_node(ptr %t3770)
  call void @collect_strings_expr(ptr %t3771)
  br label %label_1214
label_1214:
  br label %label_1208
label_1208:
  %t3772 = load ptr, ptr %expr
  %t3773 = getelementptr inbounds %ASTNode, ptr %t3772, i32 0, i32 0
  %t3774 = load i32, ptr %t3773
  %t3775 = icmp eq i32 %t3774, 25
  br i1 %t3775, label %label_1215, label %label_1217
label_1215:
  %t3776 = load ptr, ptr %expr
  %t3777 = getelementptr inbounds %ASTNode, ptr %t3776, i32 0, i32 5
  %t3778 = load ptr, ptr %t3777
  %t3779 = getelementptr inbounds [1 x i8], ptr @.str.s439, i64 0, i64 0
  %t3780 = call i32 @str_equals(ptr %t3778, ptr %t3779)
  %t3781 = icmp eq i32 %t3780, 0
  br i1 %t3781, label %label_1218, label %label_1220
label_1218:
  %t3782 = load ptr, ptr %expr
  %t3783 = getelementptr inbounds %ASTNode, ptr %t3782, i32 0, i32 5
  %t3784 = load ptr, ptr %t3783
  %t3785 = call ptr @ptr_to_node(ptr %t3784)
  call void @collect_strings_expr(ptr %t3785)
  br label %label_1220
label_1220:
  br label %label_1217
label_1217:
  %t3786 = load ptr, ptr %expr
  %t3787 = getelementptr inbounds %ASTNode, ptr %t3786, i32 0, i32 0
  %t3788 = load i32, ptr %t3787
  %t3789 = icmp eq i32 %t3788, 28
  br i1 %t3789, label %label_1221, label %label_1223
label_1221:
  %t3791 = load ptr, ptr %expr
  %t3792 = getelementptr inbounds %ASTNode, ptr %t3791, i32 0, i32 5
  %t3793 = load ptr, ptr %t3792
  store ptr %t3793, ptr %field_ptr
  br label %label_1224
label_1224:
  %t3794 = load ptr, ptr %field_ptr
  %t3795 = getelementptr inbounds [1 x i8], ptr @.str.s440, i64 0, i64 0
  %t3796 = call i32 @str_equals(ptr %t3794, ptr %t3795)
  %t3797 = icmp eq i32 %t3796, 0
  br i1 %t3797, label %label_1225, label %label_1226
label_1225:
  %t3799 = load ptr, ptr %field_ptr
  %t3800 = call ptr @ptr_to_node(ptr %t3799)
  store ptr %t3800, ptr %field
  %t3801 = load ptr, ptr %field
  %t3802 = getelementptr inbounds %ASTNode, ptr %t3801, i32 0, i32 5
  %t3803 = load ptr, ptr %t3802
  %t3804 = getelementptr inbounds [1 x i8], ptr @.str.s441, i64 0, i64 0
  %t3805 = call i32 @str_equals(ptr %t3803, ptr %t3804)
  %t3806 = icmp eq i32 %t3805, 0
  br i1 %t3806, label %label_1227, label %label_1229
label_1227:
  %t3807 = load ptr, ptr %field
  %t3808 = getelementptr inbounds %ASTNode, ptr %t3807, i32 0, i32 5
  %t3809 = load ptr, ptr %t3808
  %t3810 = call ptr @ptr_to_node(ptr %t3809)
  call void @collect_strings_expr(ptr %t3810)
  br label %label_1229
label_1229:
  %t3811 = load ptr, ptr %field
  %t3812 = getelementptr inbounds %ASTNode, ptr %t3811, i32 0, i32 8
  %t3813 = load ptr, ptr %t3812
  store ptr %t3813, ptr %field_ptr
  br label %label_1224
label_1226:
  br label %label_1223
label_1223:
  ret void
}

define void @declare_extern_function(ptr %p_ext) {
  %ext = alloca ptr
  %ret_type = alloca ptr
  %param_ptr = alloca ptr
  %param_node = alloca ptr
  %p_type_node = alloca ptr
  store ptr %p_ext, ptr %ext
  %t3817 = load ptr, ptr %ext
  %t3818 = load ptr, ptr %ext
  %t3819 = getelementptr inbounds %ASTNode, ptr %t3818, i32 0, i32 6
  %t3820 = load ptr, ptr %t3819
  %t3821 = call ptr @get_declared_return_type(ptr %t3817, ptr %t3820)
  store ptr %t3821, ptr %ret_type
  %t3822 = load ptr, ptr %ext
  %t3823 = getelementptr inbounds %ASTNode, ptr %t3822, i32 0, i32 1
  %t3824 = load ptr, ptr %t3823
  %t3825 = call ptr @fn_key(ptr %t3824)
  %t3826 = load ptr, ptr %ret_type
  call void @ir_set_var_type(ptr %t3825, ptr %t3826)
  %t3827 = load ptr, ptr %ext
  %t3828 = getelementptr inbounds %ASTNode, ptr %t3827, i32 0, i32 1
  %t3829 = load ptr, ptr %t3828
  %t3830 = load ptr, ptr %ret_type
  %t3831 = call ptr @storage_type(ptr %t3830)
  call void @ir_declare_function_begin(ptr %t3829, ptr %t3831)
  %t3832 = load ptr, ptr %ext
  %t3833 = getelementptr inbounds %ASTNode, ptr %t3832, i32 0, i32 5
  %t3834 = load ptr, ptr %t3833
  store ptr %t3834, ptr %param_ptr
  br label %label_1230
label_1230:
  %t3835 = load ptr, ptr %param_ptr
  %t3836 = getelementptr inbounds [1 x i8], ptr @.str.s442, i64 0, i64 0
  %t3837 = call i32 @str_equals(ptr %t3835, ptr %t3836)
  %t3838 = icmp eq i32 %t3837, 0
  br i1 %t3838, label %label_1231, label %label_1232
label_1231:
  %t3840 = load ptr, ptr %param_ptr
  %t3841 = call ptr @ptr_to_node(ptr %t3840)
  store ptr %t3841, ptr %param_node
  %t3843 = load ptr, ptr %param_node
  %t3844 = getelementptr inbounds %ASTNode, ptr %t3843, i32 0, i32 5
  %t3845 = load ptr, ptr %t3844
  %t3846 = call ptr @ptr_to_node(ptr %t3845)
  store ptr %t3846, ptr %p_type_node
  %t3847 = load ptr, ptr %p_type_node
  %t3848 = call ptr @map_type_node(ptr %t3847)
  %t3849 = call ptr @storage_type(ptr %t3848)
  call void @ir_declare_function_param(ptr %t3849)
  %t3850 = load ptr, ptr %param_node
  %t3851 = getelementptr inbounds %ASTNode, ptr %t3850, i32 0, i32 8
  %t3852 = load ptr, ptr %t3851
  store ptr %t3852, ptr %param_ptr
  br label %label_1230
label_1232:
  call void @ir_declare_function_end()
  ret void
}

define i1 @module_has_function(ptr %p_module, ptr %p_name) {
  %module = alloca ptr
  %name = alloca ptr
  %stmt_ptr = alloca ptr
  %stmt = alloca ptr
  store ptr %p_module, ptr %module
  store ptr %p_name, ptr %name
  %t3856 = load ptr, ptr %module
  %t3857 = getelementptr inbounds %ASTNode, ptr %t3856, i32 0, i32 5
  %t3858 = load ptr, ptr %t3857
  store ptr %t3858, ptr %stmt_ptr
  br label %label_1233
label_1233:
  %t3859 = load ptr, ptr %stmt_ptr
  %t3860 = getelementptr inbounds [1 x i8], ptr @.str.s443, i64 0, i64 0
  %t3861 = call i32 @str_equals(ptr %t3859, ptr %t3860)
  %t3862 = icmp eq i32 %t3861, 0
  br i1 %t3862, label %label_1234, label %label_1235
label_1234:
  %t3864 = load ptr, ptr %stmt_ptr
  %t3865 = call ptr @ptr_to_node(ptr %t3864)
  store ptr %t3865, ptr %stmt
  %t3866 = load ptr, ptr %stmt
  %t3867 = getelementptr inbounds %ASTNode, ptr %t3866, i32 0, i32 0
  %t3868 = load i32, ptr %t3867
  %t3869 = icmp eq i32 %t3868, 4
  %t3870 = load ptr, ptr %stmt
  %t3871 = getelementptr inbounds %ASTNode, ptr %t3870, i32 0, i32 1
  %t3872 = load ptr, ptr %t3871
  %t3873 = load ptr, ptr %name
  %t3874 = call i32 @str_equals(ptr %t3872, ptr %t3873)
  %t3875 = icmp eq i32 %t3874, 1
  %t3876 = and i1 %t3869, %t3875
  br i1 %t3876, label %label_1236, label %label_1238
label_1236:
  ret i1 1
label_1238:
  %t3877 = load ptr, ptr %stmt
  %t3878 = getelementptr inbounds %ASTNode, ptr %t3877, i32 0, i32 8
  %t3879 = load ptr, ptr %t3878
  store ptr %t3879, ptr %stmt_ptr
  br label %label_1233
label_1235:
  ret i1 0
}

define void @register_enum_decl(ptr %p_enum_node) {
  %enum_node = alloca ptr
  %variant_ptr = alloca ptr
  %value = alloca i32
  %variant = alloca ptr
  store ptr %p_enum_node, ptr %enum_node
  %t3883 = load ptr, ptr %enum_node
  %t3884 = getelementptr inbounds %ASTNode, ptr %t3883, i32 0, i32 5
  %t3885 = load ptr, ptr %t3884
  store ptr %t3885, ptr %variant_ptr
  store i32 0, ptr %value
  br label %label_1239
label_1239:
  %t3886 = load ptr, ptr %variant_ptr
  %t3887 = getelementptr inbounds [1 x i8], ptr @.str.s444, i64 0, i64 0
  %t3888 = call i32 @str_equals(ptr %t3886, ptr %t3887)
  %t3889 = icmp eq i32 %t3888, 0
  br i1 %t3889, label %label_1240, label %label_1241
label_1240:
  %t3891 = load ptr, ptr %variant_ptr
  %t3892 = call ptr @ptr_to_node(ptr %t3891)
  store ptr %t3892, ptr %variant
  %t3893 = load ptr, ptr %enum_node
  %t3894 = getelementptr inbounds %ASTNode, ptr %t3893, i32 0, i32 1
  %t3895 = load ptr, ptr %t3894
  %t3896 = load ptr, ptr %variant
  %t3897 = getelementptr inbounds %ASTNode, ptr %t3896, i32 0, i32 1
  %t3898 = load ptr, ptr %t3897
  %t3899 = load i32, ptr %value
  call void @ir_register_enum_variant(ptr %t3895, ptr %t3898, i32 %t3899)
  %t3900 = load i32, ptr %value
  %t3901 = add i32 %t3900, 1
  store i32 %t3901, ptr %value
  %t3902 = load ptr, ptr %variant
  %t3903 = getelementptr inbounds %ASTNode, ptr %t3902, i32 0, i32 8
  %t3904 = load ptr, ptr %t3903
  store ptr %t3904, ptr %variant_ptr
  br label %label_1239
label_1241:
  ret void
}

define void @register_struct_name(ptr %p_struct_node) {
  %struct_node = alloca ptr
  store ptr %p_struct_node, ptr %struct_node
  %t3906 = load ptr, ptr %struct_node
  %t3907 = getelementptr inbounds %ASTNode, ptr %t3906, i32 0, i32 1
  %t3908 = load ptr, ptr %t3907
  call void @ir_register_struct(ptr %t3908)
  ret void
}

define void @generate_struct_decl(ptr %p_struct_node) {
  %struct_node = alloca ptr
  %first_field_ptr = alloca ptr
  %field_ptr = alloca ptr
  %field_count = alloca i32
  %first_field = alloca ptr
  %field = alloca ptr
  %type_node = alloca ptr
  %field_type = alloca ptr
  store ptr %p_struct_node, ptr %struct_node
  %t3913 = load ptr, ptr %struct_node
  %t3914 = getelementptr inbounds %ASTNode, ptr %t3913, i32 0, i32 5
  %t3915 = load ptr, ptr %t3914
  store ptr %t3915, ptr %first_field_ptr
  %t3916 = load ptr, ptr %first_field_ptr
  %t3917 = getelementptr inbounds [1 x i8], ptr @.str.s445, i64 0, i64 0
  %t3918 = call i32 @str_equals(ptr %t3916, ptr %t3917)
  %t3919 = icmp eq i32 %t3918, 0
  br i1 %t3919, label %label_1242, label %label_1244
label_1242:
  %t3921 = load ptr, ptr %first_field_ptr
  %t3922 = call ptr @ptr_to_node(ptr %t3921)
  store ptr %t3922, ptr %first_field
  %t3923 = load ptr, ptr %struct_node
  %t3924 = getelementptr inbounds %ASTNode, ptr %t3923, i32 0, i32 1
  %t3925 = load ptr, ptr %t3924
  %t3926 = load ptr, ptr %first_field
  %t3927 = getelementptr inbounds %ASTNode, ptr %t3926, i32 0, i32 1
  %t3928 = load ptr, ptr %t3927
  %t3929 = call i32 @ir_get_struct_field_index(ptr %t3925, ptr %t3928)
  %t3930 = icmp sge i32 %t3929, 0
  br i1 %t3930, label %label_1245, label %label_1247
label_1245:
  ret void
label_1247:
  br label %label_1244
label_1244:
  %t3931 = getelementptr inbounds [2 x i8], ptr @.str.s446, i64 0, i64 0
  call void @ir_append(ptr %t3931)
  %t3932 = load ptr, ptr %struct_node
  %t3933 = getelementptr inbounds %ASTNode, ptr %t3932, i32 0, i32 1
  %t3934 = load ptr, ptr %t3933
  call void @ir_append(ptr %t3934)
  %t3935 = getelementptr inbounds [11 x i8], ptr @.str.s447, i64 0, i64 0
  call void @ir_append(ptr %t3935)
  %t3936 = load ptr, ptr %struct_node
  %t3937 = getelementptr inbounds %ASTNode, ptr %t3936, i32 0, i32 5
  %t3938 = load ptr, ptr %t3937
  store ptr %t3938, ptr %field_ptr
  store i32 0, ptr %field_count
  br label %label_1248
label_1248:
  %t3939 = load ptr, ptr %field_ptr
  %t3940 = getelementptr inbounds [1 x i8], ptr @.str.s448, i64 0, i64 0
  %t3941 = call i32 @str_equals(ptr %t3939, ptr %t3940)
  %t3942 = icmp eq i32 %t3941, 0
  br i1 %t3942, label %label_1249, label %label_1250
label_1249:
  %t3944 = load ptr, ptr %field_ptr
  %t3945 = call ptr @ptr_to_node(ptr %t3944)
  store ptr %t3945, ptr %field
  %t3947 = load ptr, ptr %field
  %t3948 = getelementptr inbounds %ASTNode, ptr %t3947, i32 0, i32 5
  %t3949 = load ptr, ptr %t3948
  %t3950 = call ptr @ptr_to_node(ptr %t3949)
  store ptr %t3950, ptr %type_node
  %t3952 = load ptr, ptr %type_node
  %t3953 = call ptr @map_type_node(ptr %t3952)
  %t3954 = call ptr @storage_type(ptr %t3953)
  store ptr %t3954, ptr %field_type
  %t3955 = load ptr, ptr %struct_node
  %t3956 = getelementptr inbounds %ASTNode, ptr %t3955, i32 0, i32 1
  %t3957 = load ptr, ptr %t3956
  %t3958 = load ptr, ptr %field
  %t3959 = getelementptr inbounds %ASTNode, ptr %t3958, i32 0, i32 1
  %t3960 = load ptr, ptr %t3959
  %t3961 = load ptr, ptr %field_type
  call void @ir_register_struct_field(ptr %t3957, ptr %t3960, ptr %t3961)
  %t3962 = load i32, ptr %field_count
  %t3963 = icmp sgt i32 %t3962, 0
  br i1 %t3963, label %label_1251, label %label_1253
label_1251:
  %t3964 = getelementptr inbounds [3 x i8], ptr @.str.s449, i64 0, i64 0
  call void @ir_append(ptr %t3964)
  br label %label_1253
label_1253:
  %t3965 = load ptr, ptr %field_type
  call void @ir_append(ptr %t3965)
  %t3966 = load i32, ptr %field_count
  %t3967 = add i32 %t3966, 1
  store i32 %t3967, ptr %field_count
  %t3968 = load ptr, ptr %field
  %t3969 = getelementptr inbounds %ASTNode, ptr %t3968, i32 0, i32 8
  %t3970 = load ptr, ptr %t3969
  store ptr %t3970, ptr %field_ptr
  br label %label_1248
label_1250:
  %t3971 = getelementptr inbounds [3 x i8], ptr @.str.s450, i64 0, i64 0
  call void @ir_append_line(ptr %t3971)
  ret void
}

define void @collect_strings_stmt(ptr %p_stmt) {
  %stmt = alloca ptr
  %else_node = alloca ptr
  store ptr %p_stmt, ptr %stmt
  %t3973 = load ptr, ptr %stmt
  %t3974 = getelementptr inbounds %ASTNode, ptr %t3973, i32 0, i32 0
  %t3975 = load i32, ptr %t3974
  %t3976 = icmp eq i32 %t3975, 3
  br i1 %t3976, label %label_1254, label %label_1256
label_1254:
  %t3977 = load ptr, ptr %stmt
  %t3978 = getelementptr inbounds %ASTNode, ptr %t3977, i32 0, i32 6
  %t3979 = load ptr, ptr %t3978
  %t3980 = getelementptr inbounds [1 x i8], ptr @.str.s451, i64 0, i64 0
  %t3981 = call i32 @str_equals(ptr %t3979, ptr %t3980)
  %t3982 = icmp eq i32 %t3981, 0
  br i1 %t3982, label %label_1257, label %label_1259
label_1257:
  %t3983 = load ptr, ptr %stmt
  %t3984 = getelementptr inbounds %ASTNode, ptr %t3983, i32 0, i32 6
  %t3985 = load ptr, ptr %t3984
  %t3986 = call ptr @ptr_to_node(ptr %t3985)
  call void @collect_strings_expr(ptr %t3986)
  br label %label_1259
label_1259:
  br label %label_1256
label_1256:
  %t3987 = load ptr, ptr %stmt
  %t3988 = getelementptr inbounds %ASTNode, ptr %t3987, i32 0, i32 0
  %t3989 = load i32, ptr %t3988
  %t3990 = icmp eq i32 %t3989, 17
  br i1 %t3990, label %label_1260, label %label_1262
label_1260:
  %t3991 = load ptr, ptr %stmt
  %t3992 = getelementptr inbounds %ASTNode, ptr %t3991, i32 0, i32 5
  %t3993 = load ptr, ptr %t3992
  %t3994 = getelementptr inbounds [1 x i8], ptr @.str.s452, i64 0, i64 0
  %t3995 = call i32 @str_equals(ptr %t3993, ptr %t3994)
  %t3996 = icmp eq i32 %t3995, 0
  br i1 %t3996, label %label_1263, label %label_1265
label_1263:
  %t3997 = load ptr, ptr %stmt
  %t3998 = getelementptr inbounds %ASTNode, ptr %t3997, i32 0, i32 5
  %t3999 = load ptr, ptr %t3998
  %t4000 = call ptr @ptr_to_node(ptr %t3999)
  call void @collect_strings_expr(ptr %t4000)
  br label %label_1265
label_1265:
  br label %label_1262
label_1262:
  %t4001 = load ptr, ptr %stmt
  %t4002 = getelementptr inbounds %ASTNode, ptr %t4001, i32 0, i32 0
  %t4003 = load i32, ptr %t4002
  %t4004 = icmp eq i32 %t4003, 15
  br i1 %t4004, label %label_1266, label %label_1268
label_1266:
  %t4005 = load ptr, ptr %stmt
  %t4006 = getelementptr inbounds %ASTNode, ptr %t4005, i32 0, i32 5
  %t4007 = load ptr, ptr %t4006
  %t4008 = getelementptr inbounds [1 x i8], ptr @.str.s453, i64 0, i64 0
  %t4009 = call i32 @str_equals(ptr %t4007, ptr %t4008)
  %t4010 = icmp eq i32 %t4009, 0
  br i1 %t4010, label %label_1269, label %label_1271
label_1269:
  %t4011 = load ptr, ptr %stmt
  %t4012 = getelementptr inbounds %ASTNode, ptr %t4011, i32 0, i32 5
  %t4013 = load ptr, ptr %t4012
  %t4014 = call ptr @ptr_to_node(ptr %t4013)
  call void @collect_strings_expr(ptr %t4014)
  br label %label_1271
label_1271:
  br label %label_1268
label_1268:
  %t4015 = load ptr, ptr %stmt
  %t4016 = getelementptr inbounds %ASTNode, ptr %t4015, i32 0, i32 0
  %t4017 = load i32, ptr %t4016
  %t4018 = icmp eq i32 %t4017, 16
  br i1 %t4018, label %label_1272, label %label_1274
label_1272:
  %t4019 = load ptr, ptr %stmt
  %t4020 = getelementptr inbounds %ASTNode, ptr %t4019, i32 0, i32 6
  %t4021 = load ptr, ptr %t4020
  %t4022 = getelementptr inbounds [1 x i8], ptr @.str.s454, i64 0, i64 0
  %t4023 = call i32 @str_equals(ptr %t4021, ptr %t4022)
  %t4024 = icmp eq i32 %t4023, 0
  br i1 %t4024, label %label_1275, label %label_1277
label_1275:
  %t4025 = load ptr, ptr %stmt
  %t4026 = getelementptr inbounds %ASTNode, ptr %t4025, i32 0, i32 6
  %t4027 = load ptr, ptr %t4026
  %t4028 = call ptr @ptr_to_node(ptr %t4027)
  call void @collect_strings_expr(ptr %t4028)
  br label %label_1277
label_1277:
  br label %label_1274
label_1274:
  %t4029 = load ptr, ptr %stmt
  %t4030 = getelementptr inbounds %ASTNode, ptr %t4029, i32 0, i32 0
  %t4031 = load i32, ptr %t4030
  %t4032 = icmp eq i32 %t4031, 10
  br i1 %t4032, label %label_1278, label %label_1280
label_1278:
  %t4033 = load ptr, ptr %stmt
  %t4034 = getelementptr inbounds %ASTNode, ptr %t4033, i32 0, i32 5
  %t4035 = load ptr, ptr %t4034
  %t4036 = call ptr @ptr_to_node(ptr %t4035)
  call void @collect_strings_expr(ptr %t4036)
  %t4037 = load ptr, ptr %stmt
  %t4038 = getelementptr inbounds %ASTNode, ptr %t4037, i32 0, i32 6
  %t4039 = load ptr, ptr %t4038
  %t4040 = call ptr @ptr_to_node(ptr %t4039)
  call void @collect_strings_block(ptr %t4040)
  %t4041 = load ptr, ptr %stmt
  %t4042 = getelementptr inbounds %ASTNode, ptr %t4041, i32 0, i32 7
  %t4043 = load ptr, ptr %t4042
  %t4044 = getelementptr inbounds [1 x i8], ptr @.str.s455, i64 0, i64 0
  %t4045 = call i32 @str_equals(ptr %t4043, ptr %t4044)
  %t4046 = icmp eq i32 %t4045, 0
  br i1 %t4046, label %label_1281, label %label_1283
label_1281:
  %t4048 = load ptr, ptr %stmt
  %t4049 = getelementptr inbounds %ASTNode, ptr %t4048, i32 0, i32 7
  %t4050 = load ptr, ptr %t4049
  %t4051 = call ptr @ptr_to_node(ptr %t4050)
  store ptr %t4051, ptr %else_node
  %t4052 = load ptr, ptr %else_node
  %t4053 = getelementptr inbounds %ASTNode, ptr %t4052, i32 0, i32 0
  %t4054 = load i32, ptr %t4053
  %t4055 = icmp eq i32 %t4054, 10
  br i1 %t4055, label %label_1284, label %label_1285
label_1284:
  %t4056 = load ptr, ptr %else_node
  call void @collect_strings_stmt(ptr %t4056)
  br label %label_1286
label_1285:
  %t4057 = load ptr, ptr %else_node
  call void @collect_strings_block(ptr %t4057)
  br label %label_1286
label_1286:
  br label %label_1283
label_1283:
  br label %label_1280
label_1280:
  %t4058 = load ptr, ptr %stmt
  %t4059 = getelementptr inbounds %ASTNode, ptr %t4058, i32 0, i32 0
  %t4060 = load i32, ptr %t4059
  %t4061 = icmp eq i32 %t4060, 13
  br i1 %t4061, label %label_1287, label %label_1289
label_1287:
  %t4062 = load ptr, ptr %stmt
  %t4063 = getelementptr inbounds %ASTNode, ptr %t4062, i32 0, i32 5
  %t4064 = load ptr, ptr %t4063
  %t4065 = call ptr @ptr_to_node(ptr %t4064)
  call void @collect_strings_expr(ptr %t4065)
  %t4066 = load ptr, ptr %stmt
  %t4067 = getelementptr inbounds %ASTNode, ptr %t4066, i32 0, i32 6
  %t4068 = load ptr, ptr %t4067
  %t4069 = call ptr @ptr_to_node(ptr %t4068)
  call void @collect_strings_block(ptr %t4069)
  br label %label_1289
label_1289:
  ret void
}

define void @collect_strings_block(ptr %p_block) {
  %block = alloca ptr
  %s_ptr = alloca ptr
  %s = alloca ptr
  store ptr %p_block, ptr %block
  %t4072 = load ptr, ptr %block
  %t4073 = getelementptr inbounds %ASTNode, ptr %t4072, i32 0, i32 5
  %t4074 = load ptr, ptr %t4073
  store ptr %t4074, ptr %s_ptr
  br label %label_1290
label_1290:
  %t4075 = load ptr, ptr %s_ptr
  %t4076 = getelementptr inbounds [1 x i8], ptr @.str.s456, i64 0, i64 0
  %t4077 = call i32 @str_equals(ptr %t4075, ptr %t4076)
  %t4078 = icmp eq i32 %t4077, 0
  br i1 %t4078, label %label_1291, label %label_1292
label_1291:
  %t4080 = load ptr, ptr %s_ptr
  %t4081 = call ptr @ptr_to_node(ptr %t4080)
  store ptr %t4081, ptr %s
  %t4082 = load ptr, ptr %s
  call void @collect_strings_stmt(ptr %t4082)
  %t4083 = load ptr, ptr %s
  %t4084 = getelementptr inbounds %ASTNode, ptr %t4083, i32 0, i32 8
  %t4085 = load ptr, ptr %t4084
  store ptr %t4085, ptr %s_ptr
  br label %label_1290
label_1292:
  ret void
}

define void @collect_strings_function(ptr %p_func) {
  %func = alloca ptr
  store ptr %p_func, ptr %func
  %t4087 = load ptr, ptr %func
  %t4088 = getelementptr inbounds %ASTNode, ptr %t4087, i32 0, i32 6
  %t4089 = load ptr, ptr %t4088
  %t4090 = getelementptr inbounds [1 x i8], ptr @.str.s457, i64 0, i64 0
  %t4091 = call i32 @str_equals(ptr %t4089, ptr %t4090)
  %t4092 = icmp eq i32 %t4091, 0
  br i1 %t4092, label %label_1293, label %label_1295
label_1293:
  %t4093 = load ptr, ptr %func
  %t4094 = getelementptr inbounds %ASTNode, ptr %t4093, i32 0, i32 6
  %t4095 = load ptr, ptr %t4094
  %t4096 = call ptr @ptr_to_node(ptr %t4095)
  call void @collect_strings_block(ptr %t4096)
  br label %label_1295
label_1295:
  ret void
}

define void @generate_module(ptr %p_module) {
  %module = alloca ptr
  %type_stmt_ptr = alloca ptr
  %struct_stmt_ptr = alloca ptr
  %stmt_ptr = alloca ptr
  %stmt_ptr2 = alloca ptr
  %type_stmt = alloca ptr
  %struct_stmt = alloca ptr
  %stmt = alloca ptr
  %init_val = alloca ptr
  %var_type = alloca ptr
  %type_node = alloca ptr
  %init_node = alloca ptr
  %ret_type = alloca ptr
  %stmt2 = alloca ptr
  store ptr %p_module, ptr %module
  call void @ir_reset_globals()
  call void @ir_reset_types()
  call void @ir_clear_var_types()
  %t4102 = getelementptr inbounds [19 x i8], ptr @.str.s458, i64 0, i64 0
  call void @ir_module_start(ptr %t4102)
  %t4103 = load ptr, ptr %module
  %t4104 = getelementptr inbounds %ASTNode, ptr %t4103, i32 0, i32 5
  %t4105 = load ptr, ptr %t4104
  store ptr %t4105, ptr %type_stmt_ptr
  br label %label_1296
label_1296:
  %t4106 = load ptr, ptr %type_stmt_ptr
  %t4107 = getelementptr inbounds [1 x i8], ptr @.str.s459, i64 0, i64 0
  %t4108 = call i32 @str_equals(ptr %t4106, ptr %t4107)
  %t4109 = icmp eq i32 %t4108, 0
  br i1 %t4109, label %label_1297, label %label_1298
label_1297:
  %t4111 = load ptr, ptr %type_stmt_ptr
  %t4112 = call ptr @ptr_to_node(ptr %t4111)
  store ptr %t4112, ptr %type_stmt
  %t4113 = load ptr, ptr %type_stmt
  %t4114 = getelementptr inbounds %ASTNode, ptr %t4113, i32 0, i32 0
  %t4115 = load i32, ptr %t4114
  %t4116 = icmp eq i32 %t4115, 6
  br i1 %t4116, label %label_1299, label %label_1301
label_1299:
  %t4117 = load ptr, ptr %type_stmt
  call void @register_enum_decl(ptr %t4117)
  br label %label_1301
label_1301:
  %t4118 = load ptr, ptr %type_stmt
  %t4119 = getelementptr inbounds %ASTNode, ptr %t4118, i32 0, i32 0
  %t4120 = load i32, ptr %t4119
  %t4121 = icmp eq i32 %t4120, 5
  br i1 %t4121, label %label_1302, label %label_1304
label_1302:
  %t4122 = load ptr, ptr %type_stmt
  call void @register_struct_name(ptr %t4122)
  br label %label_1304
label_1304:
  %t4123 = load ptr, ptr %type_stmt
  %t4124 = getelementptr inbounds %ASTNode, ptr %t4123, i32 0, i32 8
  %t4125 = load ptr, ptr %t4124
  store ptr %t4125, ptr %type_stmt_ptr
  br label %label_1296
label_1298:
  %t4126 = load ptr, ptr %module
  %t4127 = getelementptr inbounds %ASTNode, ptr %t4126, i32 0, i32 5
  %t4128 = load ptr, ptr %t4127
  store ptr %t4128, ptr %struct_stmt_ptr
  br label %label_1305
label_1305:
  %t4129 = load ptr, ptr %struct_stmt_ptr
  %t4130 = getelementptr inbounds [1 x i8], ptr @.str.s460, i64 0, i64 0
  %t4131 = call i32 @str_equals(ptr %t4129, ptr %t4130)
  %t4132 = icmp eq i32 %t4131, 0
  br i1 %t4132, label %label_1306, label %label_1307
label_1306:
  %t4134 = load ptr, ptr %struct_stmt_ptr
  %t4135 = call ptr @ptr_to_node(ptr %t4134)
  store ptr %t4135, ptr %struct_stmt
  %t4136 = load ptr, ptr %struct_stmt
  %t4137 = getelementptr inbounds %ASTNode, ptr %t4136, i32 0, i32 0
  %t4138 = load i32, ptr %t4137
  %t4139 = icmp eq i32 %t4138, 5
  br i1 %t4139, label %label_1308, label %label_1310
label_1308:
  %t4140 = load ptr, ptr %struct_stmt
  call void @generate_struct_decl(ptr %t4140)
  br label %label_1310
label_1310:
  %t4141 = load ptr, ptr %struct_stmt
  %t4142 = getelementptr inbounds %ASTNode, ptr %t4141, i32 0, i32 8
  %t4143 = load ptr, ptr %t4142
  store ptr %t4143, ptr %struct_stmt_ptr
  br label %label_1305
label_1307:
  call void @ir_blank_line()
  %t4144 = getelementptr inbounds [7 x i8], ptr @.str.s461, i64 0, i64 0
  %t4145 = getelementptr inbounds [4 x i8], ptr @.str.s462, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4144, ptr %t4145)
  %t4146 = getelementptr inbounds [4 x i8], ptr @.str.s463, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4146)
  call void @ir_declare_function_end()
  %t4147 = getelementptr inbounds [8 x i8], ptr @.str.s464, i64 0, i64 0
  %t4148 = getelementptr inbounds [5 x i8], ptr @.str.s465, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4147, ptr %t4148)
  %t4149 = getelementptr inbounds [4 x i8], ptr @.str.s466, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4149)
  call void @ir_declare_function_end()
  %t4150 = getelementptr inbounds [6 x i8], ptr @.str.s467, i64 0, i64 0
  %t4151 = getelementptr inbounds [5 x i8], ptr @.str.s468, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4150, ptr %t4151)
  %t4152 = getelementptr inbounds [4 x i8], ptr @.str.s469, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4152)
  call void @ir_declare_function_end()
  %t4153 = getelementptr inbounds [12 x i8], ptr @.str.s470, i64 0, i64 0
  %t4154 = getelementptr inbounds [5 x i8], ptr @.str.s471, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4153, ptr %t4154)
  %t4155 = getelementptr inbounds [4 x i8], ptr @.str.s472, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4155)
  call void @ir_declare_function_end()
  %t4156 = getelementptr inbounds [10 x i8], ptr @.str.s473, i64 0, i64 0
  %t4157 = getelementptr inbounds [5 x i8], ptr @.str.s474, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4156, ptr %t4157)
  %t4158 = getelementptr inbounds [4 x i8], ptr @.str.s475, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4158)
  call void @ir_declare_function_end()
  %t4159 = getelementptr inbounds [13 x i8], ptr @.str.s476, i64 0, i64 0
  %t4160 = getelementptr inbounds [5 x i8], ptr @.str.s477, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4159, ptr %t4160)
  %t4161 = getelementptr inbounds [4 x i8], ptr @.str.s478, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4161)
  call void @ir_declare_function_end()
  %t4162 = getelementptr inbounds [11 x i8], ptr @.str.s479, i64 0, i64 0
  %t4163 = getelementptr inbounds [5 x i8], ptr @.str.s480, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4162, ptr %t4163)
  %t4164 = getelementptr inbounds [4 x i8], ptr @.str.s481, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4164)
  call void @ir_declare_function_end()
  %t4165 = getelementptr inbounds [13 x i8], ptr @.str.s482, i64 0, i64 0
  %t4166 = getelementptr inbounds [5 x i8], ptr @.str.s483, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4165, ptr %t4166)
  %t4167 = getelementptr inbounds [3 x i8], ptr @.str.s484, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4167)
  call void @ir_declare_function_end()
  %t4168 = getelementptr inbounds [11 x i8], ptr @.str.s485, i64 0, i64 0
  %t4169 = getelementptr inbounds [5 x i8], ptr @.str.s486, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4168, ptr %t4169)
  %t4170 = getelementptr inbounds [3 x i8], ptr @.str.s487, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4170)
  call void @ir_declare_function_end()
  call void @ir_blank_line()
  %t4171 = load ptr, ptr %module
  %t4172 = getelementptr inbounds %ASTNode, ptr %t4171, i32 0, i32 5
  %t4173 = load ptr, ptr %t4172
  store ptr %t4173, ptr %stmt_ptr
  br label %label_1311
label_1311:
  %t4174 = load ptr, ptr %stmt_ptr
  %t4175 = getelementptr inbounds [1 x i8], ptr @.str.s488, i64 0, i64 0
  %t4176 = call i32 @str_equals(ptr %t4174, ptr %t4175)
  %t4177 = icmp eq i32 %t4176, 0
  br i1 %t4177, label %label_1312, label %label_1313
label_1312:
  %t4179 = load ptr, ptr %stmt_ptr
  %t4180 = call ptr @ptr_to_node(ptr %t4179)
  store ptr %t4180, ptr %stmt
  %t4181 = load ptr, ptr %stmt
  %t4182 = getelementptr inbounds %ASTNode, ptr %t4181, i32 0, i32 0
  %t4183 = load i32, ptr %t4182
  %t4184 = icmp eq i32 %t4183, 2
  br i1 %t4184, label %label_1314, label %label_1316
label_1314:
  %t4185 = load ptr, ptr %module
  %t4186 = load ptr, ptr %stmt
  %t4187 = getelementptr inbounds %ASTNode, ptr %t4186, i32 0, i32 1
  %t4188 = load ptr, ptr %t4187
  %t4189 = call i1 @module_has_function(ptr %t4185, ptr %t4188)
  %t4190 = icmp eq i1 %t4189, 0
  br i1 %t4190, label %label_1317, label %label_1319
label_1317:
  %t4191 = load ptr, ptr %stmt
  call void @declare_extern_function(ptr %t4191)
  br label %label_1319
label_1319:
  br label %label_1316
label_1316:
  %t4192 = load ptr, ptr %stmt
  %t4193 = getelementptr inbounds %ASTNode, ptr %t4192, i32 0, i32 0
  %t4194 = load i32, ptr %t4193
  %t4195 = icmp eq i32 %t4194, 3
  br i1 %t4195, label %label_1320, label %label_1322
label_1320:
  %t4197 = getelementptr inbounds [2 x i8], ptr @.str.s489, i64 0, i64 0
  store ptr %t4197, ptr %init_val
  %t4199 = getelementptr inbounds [4 x i8], ptr @.str.s490, i64 0, i64 0
  store ptr %t4199, ptr %var_type
  %t4200 = load ptr, ptr %stmt
  %t4201 = getelementptr inbounds %ASTNode, ptr %t4200, i32 0, i32 5
  %t4202 = load ptr, ptr %t4201
  %t4203 = getelementptr inbounds [1 x i8], ptr @.str.s491, i64 0, i64 0
  %t4204 = call i32 @str_equals(ptr %t4202, ptr %t4203)
  %t4205 = icmp eq i32 %t4204, 0
  br i1 %t4205, label %label_1323, label %label_1325
label_1323:
  %t4207 = load ptr, ptr %stmt
  %t4208 = getelementptr inbounds %ASTNode, ptr %t4207, i32 0, i32 5
  %t4209 = load ptr, ptr %t4208
  %t4210 = call ptr @ptr_to_node(ptr %t4209)
  store ptr %t4210, ptr %type_node
  %t4211 = load ptr, ptr %type_node
  %t4212 = call ptr @map_type_node(ptr %t4211)
  store ptr %t4212, ptr %var_type
  br label %label_1325
label_1325:
  %t4213 = load ptr, ptr %stmt
  %t4214 = getelementptr inbounds %ASTNode, ptr %t4213, i32 0, i32 6
  %t4215 = load ptr, ptr %t4214
  %t4216 = getelementptr inbounds [1 x i8], ptr @.str.s492, i64 0, i64 0
  %t4217 = call i32 @str_equals(ptr %t4215, ptr %t4216)
  %t4218 = icmp eq i32 %t4217, 0
  br i1 %t4218, label %label_1326, label %label_1328
label_1326:
  %t4220 = load ptr, ptr %stmt
  %t4221 = getelementptr inbounds %ASTNode, ptr %t4220, i32 0, i32 6
  %t4222 = load ptr, ptr %t4221
  %t4223 = call ptr @ptr_to_node(ptr %t4222)
  store ptr %t4223, ptr %init_node
  %t4224 = load ptr, ptr %init_node
  %t4225 = call ptr @get_expr_type(ptr %t4224)
  store ptr %t4225, ptr %var_type
  %t4226 = load ptr, ptr %init_node
  %t4227 = getelementptr inbounds %ASTNode, ptr %t4226, i32 0, i32 0
  %t4228 = load i32, ptr %t4227
  %t4229 = icmp eq i32 %t4228, 22
  br i1 %t4229, label %label_1329, label %label_1331
label_1329:
  %t4230 = load ptr, ptr %init_node
  %t4231 = getelementptr inbounds %ASTNode, ptr %t4230, i32 0, i32 1
  %t4232 = load ptr, ptr %t4231
  store ptr %t4232, ptr %init_val
  br label %label_1331
label_1331:
  br label %label_1328
label_1328:
  %t4233 = load ptr, ptr %stmt
  %t4234 = getelementptr inbounds %ASTNode, ptr %t4233, i32 0, i32 1
  %t4235 = load ptr, ptr %t4234
  %t4236 = load ptr, ptr %var_type
  %t4237 = call ptr @storage_type(ptr %t4236)
  %t4238 = load ptr, ptr %init_val
  call void @ir_global_var(ptr %t4235, ptr %t4237, ptr %t4238, i32 0)
  %t4239 = load ptr, ptr %stmt
  %t4240 = getelementptr inbounds %ASTNode, ptr %t4239, i32 0, i32 1
  %t4241 = load ptr, ptr %t4240
  call void @ir_register_global_name(ptr %t4241)
  %t4242 = load ptr, ptr %stmt
  %t4243 = getelementptr inbounds %ASTNode, ptr %t4242, i32 0, i32 1
  %t4244 = load ptr, ptr %t4243
  %t4245 = load ptr, ptr %var_type
  call void @ir_set_var_type(ptr %t4244, ptr %t4245)
  br label %label_1322
label_1322:
  %t4246 = load ptr, ptr %stmt
  %t4247 = getelementptr inbounds %ASTNode, ptr %t4246, i32 0, i32 0
  %t4248 = load i32, ptr %t4247
  %t4249 = icmp eq i32 %t4248, 4
  br i1 %t4249, label %label_1332, label %label_1334
label_1332:
  %t4251 = load ptr, ptr %stmt
  %t4252 = load ptr, ptr %stmt
  %t4253 = getelementptr inbounds %ASTNode, ptr %t4252, i32 0, i32 7
  %t4254 = load ptr, ptr %t4253
  %t4255 = call ptr @get_declared_return_type(ptr %t4251, ptr %t4254)
  store ptr %t4255, ptr %ret_type
  %t4256 = load ptr, ptr %stmt
  %t4257 = getelementptr inbounds %ASTNode, ptr %t4256, i32 0, i32 1
  %t4258 = load ptr, ptr %t4257
  %t4259 = getelementptr inbounds [5 x i8], ptr @.str.s493, i64 0, i64 0
  %t4260 = call i32 @str_equals(ptr %t4258, ptr %t4259)
  %t4261 = icmp eq i32 %t4260, 1
  br i1 %t4261, label %label_1335, label %label_1337
label_1335:
  %t4262 = getelementptr inbounds [4 x i8], ptr @.str.s494, i64 0, i64 0
  store ptr %t4262, ptr %ret_type
  br label %label_1337
label_1337:
  %t4263 = load ptr, ptr %stmt
  %t4264 = getelementptr inbounds %ASTNode, ptr %t4263, i32 0, i32 1
  %t4265 = load ptr, ptr %t4264
  %t4266 = call ptr @fn_key(ptr %t4265)
  %t4267 = load ptr, ptr %ret_type
  call void @ir_set_var_type(ptr %t4266, ptr %t4267)
  %t4268 = load ptr, ptr %stmt
  call void @collect_strings_function(ptr %t4268)
  br label %label_1334
label_1334:
  %t4269 = load ptr, ptr %stmt
  %t4270 = getelementptr inbounds %ASTNode, ptr %t4269, i32 0, i32 8
  %t4271 = load ptr, ptr %t4270
  store ptr %t4271, ptr %stmt_ptr
  br label %label_1311
label_1313:
  call void @ir_blank_line()
  %t4272 = load ptr, ptr %module
  %t4273 = getelementptr inbounds %ASTNode, ptr %t4272, i32 0, i32 5
  %t4274 = load ptr, ptr %t4273
  store ptr %t4274, ptr %stmt_ptr2
  br label %label_1338
label_1338:
  %t4275 = load ptr, ptr %stmt_ptr2
  %t4276 = getelementptr inbounds [1 x i8], ptr @.str.s495, i64 0, i64 0
  %t4277 = call i32 @str_equals(ptr %t4275, ptr %t4276)
  %t4278 = icmp eq i32 %t4277, 0
  br i1 %t4278, label %label_1339, label %label_1340
label_1339:
  %t4280 = load ptr, ptr %stmt_ptr2
  %t4281 = call ptr @ptr_to_node(ptr %t4280)
  store ptr %t4281, ptr %stmt2
  %t4282 = load ptr, ptr %stmt2
  %t4283 = getelementptr inbounds %ASTNode, ptr %t4282, i32 0, i32 0
  %t4284 = load i32, ptr %t4283
  %t4285 = icmp eq i32 %t4284, 4
  br i1 %t4285, label %label_1341, label %label_1343
label_1341:
  %t4286 = load ptr, ptr %stmt2
  call void @generate_function(ptr %t4286)
  br label %label_1343
label_1343:
  %t4287 = load ptr, ptr %stmt2
  %t4288 = getelementptr inbounds %ASTNode, ptr %t4287, i32 0, i32 8
  %t4289 = load ptr, ptr %t4288
  store ptr %t4289, ptr %stmt_ptr2
  br label %label_1338
label_1340:
  call void @ir_module_end()
  ret void
}

define i1 @is_named_top_level(ptr %p_stmt) {
  %stmt = alloca ptr
  store ptr %p_stmt, ptr %stmt
  %t4291 = load ptr, ptr %stmt
  %t4292 = getelementptr inbounds %ASTNode, ptr %t4291, i32 0, i32 0
  %t4293 = load i32, ptr %t4292
  %t4294 = icmp eq i32 %t4293, 2
  br i1 %t4294, label %label_1344, label %label_1346
label_1344:
  ret i1 1
label_1346:
  %t4295 = load ptr, ptr %stmt
  %t4296 = getelementptr inbounds %ASTNode, ptr %t4295, i32 0, i32 0
  %t4297 = load i32, ptr %t4296
  %t4298 = icmp eq i32 %t4297, 3
  br i1 %t4298, label %label_1347, label %label_1349
label_1347:
  ret i1 1
label_1349:
  %t4299 = load ptr, ptr %stmt
  %t4300 = getelementptr inbounds %ASTNode, ptr %t4299, i32 0, i32 0
  %t4301 = load i32, ptr %t4300
  %t4302 = icmp eq i32 %t4301, 4
  br i1 %t4302, label %label_1350, label %label_1352
label_1350:
  ret i1 1
label_1352:
  %t4303 = load ptr, ptr %stmt
  %t4304 = getelementptr inbounds %ASTNode, ptr %t4303, i32 0, i32 0
  %t4305 = load i32, ptr %t4304
  %t4306 = icmp eq i32 %t4305, 5
  br i1 %t4306, label %label_1353, label %label_1355
label_1353:
  ret i1 1
label_1355:
  %t4307 = load ptr, ptr %stmt
  %t4308 = getelementptr inbounds %ASTNode, ptr %t4307, i32 0, i32 0
  %t4309 = load i32, ptr %t4308
  %t4310 = icmp eq i32 %t4309, 6
  br i1 %t4310, label %label_1356, label %label_1358
label_1356:
  ret i1 1
label_1358:
  ret i1 0
}

define i1 @has_named_top_level(ptr %p_module, ptr %p_stmt) {
  %module = alloca ptr
  %stmt = alloca ptr
  %scan_ptr = alloca ptr
  %scan = alloca ptr
  store ptr %p_module, ptr %module
  store ptr %p_stmt, ptr %stmt
  %t4314 = load ptr, ptr %stmt
  %t4315 = call i1 @is_named_top_level(ptr %t4314)
  %t4316 = icmp eq i1 %t4315, 0
  br i1 %t4316, label %label_1359, label %label_1361
label_1359:
  ret i1 0
label_1361:
  %t4317 = load ptr, ptr %module
  %t4318 = getelementptr inbounds %ASTNode, ptr %t4317, i32 0, i32 5
  %t4319 = load ptr, ptr %t4318
  store ptr %t4319, ptr %scan_ptr
  br label %label_1362
label_1362:
  %t4320 = load ptr, ptr %scan_ptr
  %t4321 = getelementptr inbounds [1 x i8], ptr @.str.s496, i64 0, i64 0
  %t4322 = call i32 @str_equals(ptr %t4320, ptr %t4321)
  %t4323 = icmp eq i32 %t4322, 0
  br i1 %t4323, label %label_1363, label %label_1364
label_1363:
  %t4325 = load ptr, ptr %scan_ptr
  %t4326 = call ptr @ptr_to_node(ptr %t4325)
  store ptr %t4326, ptr %scan
  %t4327 = load ptr, ptr %scan
  %t4328 = getelementptr inbounds %ASTNode, ptr %t4327, i32 0, i32 0
  %t4329 = load i32, ptr %t4328
  %t4330 = load ptr, ptr %stmt
  %t4331 = getelementptr inbounds %ASTNode, ptr %t4330, i32 0, i32 0
  %t4332 = load i32, ptr %t4331
  %t4333 = icmp eq i32 %t4329, %t4332
  %t4334 = load ptr, ptr %scan
  %t4335 = getelementptr inbounds %ASTNode, ptr %t4334, i32 0, i32 1
  %t4336 = load ptr, ptr %t4335
  %t4337 = load ptr, ptr %stmt
  %t4338 = getelementptr inbounds %ASTNode, ptr %t4337, i32 0, i32 1
  %t4339 = load ptr, ptr %t4338
  %t4340 = call i32 @str_equals(ptr %t4336, ptr %t4339)
  %t4341 = icmp eq i32 %t4340, 1
  %t4342 = and i1 %t4333, %t4341
  br i1 %t4342, label %label_1365, label %label_1367
label_1365:
  ret i1 1
label_1367:
  %t4343 = load ptr, ptr %scan
  %t4344 = getelementptr inbounds %ASTNode, ptr %t4343, i32 0, i32 8
  %t4345 = load ptr, ptr %t4344
  store ptr %t4345, ptr %scan_ptr
  br label %label_1362
label_1364:
  ret i1 0
}

define ptr @parse_source(ptr %p_content) {
  %content = alloca ptr
  %lex = alloca ptr
  %head_token = alloca ptr
  %p = alloca ptr
  store ptr %p_content, ptr %content
  %t4350 = load ptr, ptr %content
  %t4351 = call ptr @create_lexer(ptr %t4350)
  store ptr %t4351, ptr %lex
  %t4352 = load ptr, ptr %lex
  %t4353 = call ptr @lex_all_tokens(ptr %t4352)
  store ptr %t4353, ptr %head_token
  %t4354 = load ptr, ptr %head_token
  %t4355 = call ptr @parser_create(ptr %t4354)
  store ptr %t4355, ptr %p
  %t4356 = load ptr, ptr %p
  %t4357 = call ptr @parse_module(ptr %t4356)
  ret ptr %t4357
}

define void @append_statement(ptr %p_module, ptr %p_stmt) {
  %module = alloca ptr
  %stmt = alloca ptr
  %tail_ptr = alloca ptr
  %searching = alloca i1
  %tail = alloca ptr
  store ptr %p_module, ptr %module
  store ptr %p_stmt, ptr %stmt
  %t4362 = load ptr, ptr %module
  %t4363 = load ptr, ptr %stmt
  %t4364 = call i1 @has_named_top_level(ptr %t4362, ptr %t4363)
  br i1 %t4364, label %label_1368, label %label_1370
label_1368:
  ret void
label_1370:
  %t4365 = load ptr, ptr %module
  %t4366 = getelementptr inbounds %ASTNode, ptr %t4365, i32 0, i32 5
  %t4367 = load ptr, ptr %t4366
  %t4368 = getelementptr inbounds [1 x i8], ptr @.str.s497, i64 0, i64 0
  %t4369 = call i32 @str_equals(ptr %t4367, ptr %t4368)
  %t4370 = icmp eq i32 %t4369, 1
  br i1 %t4370, label %label_1371, label %label_1373
label_1371:
  %t4371 = load ptr, ptr %module
  %t4372 = load ptr, ptr %stmt
  %t4373 = call ptr @node_to_ptr(ptr %t4372)
  %t4374 = getelementptr inbounds %ASTNode, ptr %t4371, i32 0, i32 5
  store ptr %t4373, ptr %t4374
  ret void
label_1373:
  %t4375 = load ptr, ptr %module
  %t4376 = getelementptr inbounds %ASTNode, ptr %t4375, i32 0, i32 5
  %t4377 = load ptr, ptr %t4376
  store ptr %t4377, ptr %tail_ptr
  store i1 1, ptr %searching
  br label %label_1374
label_1374:
  %t4378 = load i1, ptr %searching
  br i1 %t4378, label %label_1375, label %label_1376
label_1375:
  %t4380 = load ptr, ptr %tail_ptr
  %t4381 = call ptr @ptr_to_node(ptr %t4380)
  store ptr %t4381, ptr %tail
  %t4382 = load ptr, ptr %tail
  %t4383 = getelementptr inbounds %ASTNode, ptr %t4382, i32 0, i32 8
  %t4384 = load ptr, ptr %t4383
  %t4385 = getelementptr inbounds [1 x i8], ptr @.str.s498, i64 0, i64 0
  %t4386 = call i32 @str_equals(ptr %t4384, ptr %t4385)
  %t4387 = icmp eq i32 %t4386, 1
  br i1 %t4387, label %label_1377, label %label_1378
label_1377:
  %t4388 = load ptr, ptr %tail
  %t4389 = load ptr, ptr %stmt
  %t4390 = call ptr @node_to_ptr(ptr %t4389)
  %t4391 = getelementptr inbounds %ASTNode, ptr %t4388, i32 0, i32 8
  store ptr %t4390, ptr %t4391
  store i1 0, ptr %searching
  br label %label_1379
label_1378:
  %t4392 = load ptr, ptr %tail
  %t4393 = getelementptr inbounds %ASTNode, ptr %t4392, i32 0, i32 8
  %t4394 = load ptr, ptr %t4393
  store ptr %t4394, ptr %tail_ptr
  br label %label_1379
label_1379:
  br label %label_1374
label_1376:
  ret void
}

define void @append_non_imports(ptr %p_target, ptr %p_source) {
  %target = alloca ptr
  %source = alloca ptr
  %stmt_ptr = alloca ptr
  %stmt = alloca ptr
  %next_stmt = alloca ptr
  store ptr %p_target, ptr %target
  store ptr %p_source, ptr %source
  %t4398 = load ptr, ptr %source
  %t4399 = getelementptr inbounds %ASTNode, ptr %t4398, i32 0, i32 5
  %t4400 = load ptr, ptr %t4399
  store ptr %t4400, ptr %stmt_ptr
  br label %label_1380
label_1380:
  %t4401 = load ptr, ptr %stmt_ptr
  %t4402 = getelementptr inbounds [1 x i8], ptr @.str.s499, i64 0, i64 0
  %t4403 = call i32 @str_equals(ptr %t4401, ptr %t4402)
  %t4404 = icmp eq i32 %t4403, 0
  br i1 %t4404, label %label_1381, label %label_1382
label_1381:
  %t4406 = load ptr, ptr %stmt_ptr
  %t4407 = call ptr @ptr_to_node(ptr %t4406)
  store ptr %t4407, ptr %stmt
  %t4409 = load ptr, ptr %stmt
  %t4410 = getelementptr inbounds %ASTNode, ptr %t4409, i32 0, i32 8
  %t4411 = load ptr, ptr %t4410
  store ptr %t4411, ptr %next_stmt
  %t4412 = load ptr, ptr %stmt
  %t4413 = getelementptr inbounds [1 x i8], ptr @.str.s500, i64 0, i64 0
  %t4414 = getelementptr inbounds %ASTNode, ptr %t4412, i32 0, i32 8
  store ptr %t4413, ptr %t4414
  %t4415 = load ptr, ptr %stmt
  %t4416 = getelementptr inbounds %ASTNode, ptr %t4415, i32 0, i32 0
  %t4417 = load i32, ptr %t4416
  %t4418 = icmp ne i32 %t4417, 1
  br i1 %t4418, label %label_1383, label %label_1385
label_1383:
  %t4419 = load ptr, ptr %target
  %t4420 = load ptr, ptr %stmt
  call void @append_statement(ptr %t4419, ptr %t4420)
  br label %label_1385
label_1385:
  %t4421 = load ptr, ptr %next_stmt
  store ptr %t4421, ptr %stmt_ptr
  br label %label_1380
label_1382:
  ret void
}

define ptr @join_import_path(ptr %p_base_dir, ptr %p_module_name) {
  %base_dir = alloca ptr
  %module_name = alloca ptr
  %module_file = alloca ptr
  store ptr %p_base_dir, ptr %base_dir
  store ptr %p_module_name, ptr %module_name
  %t4425 = load ptr, ptr %module_name
  %t4426 = getelementptr inbounds [5 x i8], ptr @.str.s501, i64 0, i64 0
  %t4427 = call ptr @str_concat(ptr %t4425, ptr %t4426)
  store ptr %t4427, ptr %module_file
  %t4428 = load ptr, ptr %base_dir
  %t4429 = getelementptr inbounds [2 x i8], ptr @.str.s502, i64 0, i64 0
  %t4430 = call i32 @str_equals(ptr %t4428, ptr %t4429)
  %t4431 = icmp eq i32 %t4430, 1
  br i1 %t4431, label %label_1386, label %label_1388
label_1386:
  %t4432 = load ptr, ptr %module_file
  ret ptr %t4432
label_1388:
  %t4433 = load ptr, ptr %base_dir
  %t4434 = getelementptr inbounds [3 x i8], ptr @.str.s503, i64 0, i64 0
  %t4435 = call ptr @str_concat(ptr %t4433, ptr %t4434)
  %t4436 = load ptr, ptr %module_file
  %t4437 = call ptr @str_concat(ptr %t4435, ptr %t4436)
  ret ptr %t4437
}

define ptr @resolve_imports(ptr %p_module, ptr %p_base_dir) {
  %module = alloca ptr
  %base_dir = alloca ptr
  %merged = alloca ptr
  %stmt_ptr = alloca ptr
  %stmt = alloca ptr
  %next_stmt = alloca ptr
  %import_path = alloca ptr
  %import_content = alloca ptr
  %imported_module = alloca ptr
  %resolved_import = alloca ptr
  store ptr %p_module, ptr %module
  store ptr %p_base_dir, ptr %base_dir
  %t4442 = call ptr @create_node(i32 0)
  store ptr %t4442, ptr %merged
  %t4443 = load ptr, ptr %module
  %t4444 = getelementptr inbounds %ASTNode, ptr %t4443, i32 0, i32 5
  %t4445 = load ptr, ptr %t4444
  store ptr %t4445, ptr %stmt_ptr
  br label %label_1389
label_1389:
  %t4446 = load ptr, ptr %stmt_ptr
  %t4447 = getelementptr inbounds [1 x i8], ptr @.str.s504, i64 0, i64 0
  %t4448 = call i32 @str_equals(ptr %t4446, ptr %t4447)
  %t4449 = icmp eq i32 %t4448, 0
  br i1 %t4449, label %label_1390, label %label_1391
label_1390:
  %t4451 = load ptr, ptr %stmt_ptr
  %t4452 = call ptr @ptr_to_node(ptr %t4451)
  store ptr %t4452, ptr %stmt
  %t4454 = load ptr, ptr %stmt
  %t4455 = getelementptr inbounds %ASTNode, ptr %t4454, i32 0, i32 8
  %t4456 = load ptr, ptr %t4455
  store ptr %t4456, ptr %next_stmt
  %t4457 = load ptr, ptr %stmt
  %t4458 = getelementptr inbounds [1 x i8], ptr @.str.s505, i64 0, i64 0
  %t4459 = getelementptr inbounds %ASTNode, ptr %t4457, i32 0, i32 8
  store ptr %t4458, ptr %t4459
  %t4460 = load ptr, ptr %stmt
  %t4461 = getelementptr inbounds %ASTNode, ptr %t4460, i32 0, i32 0
  %t4462 = load i32, ptr %t4461
  %t4463 = icmp eq i32 %t4462, 1
  br i1 %t4463, label %label_1392, label %label_1393
label_1392:
  %t4465 = load ptr, ptr %base_dir
  %t4466 = load ptr, ptr %stmt
  %t4467 = getelementptr inbounds %ASTNode, ptr %t4466, i32 0, i32 1
  %t4468 = load ptr, ptr %t4467
  %t4469 = call ptr @join_import_path(ptr %t4465, ptr %t4468)
  store ptr %t4469, ptr %import_path
  %t4471 = load ptr, ptr %import_path
  %t4472 = call ptr @read_file(ptr %t4471)
  store ptr %t4472, ptr %import_content
  %t4473 = load ptr, ptr %import_content
  %t4474 = getelementptr inbounds [1 x i8], ptr @.str.s506, i64 0, i64 0
  %t4475 = call i32 @str_equals(ptr %t4473, ptr %t4474)
  %t4476 = icmp eq i32 %t4475, 1
  br i1 %t4476, label %label_1395, label %label_1397
label_1395:
  %t4477 = getelementptr inbounds [25 x i8], ptr @.str.s507, i64 0, i64 0
  call void @print(ptr %t4477)
  %t4478 = load ptr, ptr %import_path
  call void @println(ptr %t4478)
  call void @exit(i32 1)
  br label %label_1397
label_1397:
  %t4480 = load ptr, ptr %import_content
  %t4481 = call ptr @parse_source(ptr %t4480)
  store ptr %t4481, ptr %imported_module
  %t4483 = load ptr, ptr %imported_module
  %t4484 = load ptr, ptr %base_dir
  %t4485 = call ptr @resolve_imports(ptr %t4483, ptr %t4484)
  store ptr %t4485, ptr %resolved_import
  %t4486 = load ptr, ptr %merged
  %t4487 = load ptr, ptr %resolved_import
  call void @append_non_imports(ptr %t4486, ptr %t4487)
  br label %label_1394
label_1393:
  %t4488 = load ptr, ptr %merged
  %t4489 = load ptr, ptr %stmt
  call void @append_statement(ptr %t4488, ptr %t4489)
  br label %label_1394
label_1394:
  %t4490 = load ptr, ptr %next_stmt
  store ptr %t4490, ptr %stmt_ptr
  br label %label_1389
label_1391:
  %t4491 = load ptr, ptr %merged
  ret ptr %t4491
}

define i32 @main() {
  %path = alloca ptr
  %out_file = alloca ptr
  %content = alloca ptr
  %lex = alloca ptr
  %head_token = alloca ptr
  %p = alloca ptr
  %ast_root = alloca ptr
  %base_dir = alloca ptr
  %merged_ast = alloca ptr
  %t4501 = getelementptr inbounds [29 x i8], ptr @.str.s508, i64 0, i64 0
  call void @println(ptr %t4501)
  %t4502 = getelementptr inbounds [1 x i8], ptr @.str.s509, i64 0, i64 0
  store ptr %t4502, ptr %path
  %t4503 = getelementptr inbounds [7 x i8], ptr @.str.s510, i64 0, i64 0
  store ptr %t4503, ptr %out_file
  %t4504 = call i32 @cli_arg_count()
  %t4505 = icmp sgt i32 %t4504, 1
  br i1 %t4505, label %label_1398, label %label_1400
label_1398:
  %t4506 = call ptr @cli_arg(i32 1)
  store ptr %t4506, ptr %path
  br label %label_1400
label_1400:
  %t4507 = call i32 @cli_arg_count()
  %t4508 = icmp sgt i32 %t4507, 2
  br i1 %t4508, label %label_1401, label %label_1403
label_1401:
  %t4509 = call ptr @cli_arg(i32 2)
  store ptr %t4509, ptr %out_file
  br label %label_1403
label_1403:
  %t4510 = load ptr, ptr %path
  %t4511 = call ptr @read_file(ptr %t4510)
  store ptr %t4511, ptr %content
  %t4512 = load ptr, ptr %content
  %t4513 = getelementptr inbounds [1 x i8], ptr @.str.s511, i64 0, i64 0
  %t4514 = call i32 @str_equals(ptr %t4512, ptr %t4513)
  %t4515 = icmp eq i32 %t4514, 1
  br i1 %t4515, label %label_1404, label %label_1406
label_1404:
  %t4516 = getelementptr inbounds [27 x i8], ptr @.str.s512, i64 0, i64 0
  call void @println(ptr %t4516)
  ret i32 1
label_1406:
  %t4517 = getelementptr inbounds [14 x i8], ptr @.str.s513, i64 0, i64 0
  call void @println(ptr %t4517)
  %t4518 = load ptr, ptr %content
  call void @println(ptr %t4518)
  %t4519 = load ptr, ptr %content
  %t4520 = call ptr @create_lexer(ptr %t4519)
  store ptr %t4520, ptr %lex
  %t4521 = load ptr, ptr %lex
  %t4522 = call ptr @lex_all_tokens(ptr %t4521)
  store ptr %t4522, ptr %head_token
  %t4523 = getelementptr inbounds [20 x i8], ptr @.str.s514, i64 0, i64 0
  call void @println(ptr %t4523)
  %t4524 = load ptr, ptr %head_token
  %t4525 = call ptr @parser_create(ptr %t4524)
  store ptr %t4525, ptr %p
  %t4526 = load ptr, ptr %p
  %t4527 = call ptr @parse_module(ptr %t4526)
  store ptr %t4527, ptr %ast_root
  %t4528 = getelementptr inbounds [21 x i8], ptr @.str.s515, i64 0, i64 0
  call void @println(ptr %t4528)
  %t4529 = load ptr, ptr %path
  %t4530 = call ptr @get_directory(ptr %t4529)
  store ptr %t4530, ptr %base_dir
  %t4531 = load ptr, ptr %ast_root
  %t4532 = load ptr, ptr %base_dir
  %t4533 = call ptr @resolve_imports(ptr %t4531, ptr %t4532)
  store ptr %t4533, ptr %merged_ast
  %t4534 = getelementptr inbounds [17 x i8], ptr @.str.s516, i64 0, i64 0
  call void @println(ptr %t4534)
  call void @ir_reset()
  %t4535 = load ptr, ptr %merged_ast
  call void @generate_module(ptr %t4535)
  call void @ir_print()
  %t4536 = load ptr, ptr %out_file
  %t4537 = call i32 @ir_write_file(ptr %t4536)
  %t4538 = getelementptr inbounds [19 x i8], ptr @.str.s517, i64 0, i64 0
  call void @print(ptr %t4538)
  %t4539 = load ptr, ptr %out_file
  call void @println(ptr %t4539)
  %t4540 = getelementptr inbounds [13 x i8], ptr @.str.s518, i64 0, i64 0
  call void @println(ptr %t4540)
  ret i32 0
}

