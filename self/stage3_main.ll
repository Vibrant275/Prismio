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
  %t494 = load ptr, ptr %lex
  call void @lexer_skip_whitespace(ptr %t494)
  %t495 = load ptr, ptr %lex
  %t496 = getelementptr inbounds %Lexer, ptr %t495, i32 0, i32 1
  %t497 = load i32, ptr %t496
  %t498 = load ptr, ptr %lex
  %t499 = getelementptr inbounds %Lexer, ptr %t498, i32 0, i32 0
  %t500 = load ptr, ptr %t499
  %t501 = call i32 @str_length(ptr %t500)
  %t502 = icmp sge i32 %t497, %t501
  br i1 %t502, label %label_465, label %label_467
label_465:
  %t503 = getelementptr %Token, ptr null, i32 1
  %t504 = ptrtoint ptr %t503 to i64
  %t505 = call ptr @malloc(i64 %t504)
  %t506 = getelementptr inbounds %Token, ptr %t505, i32 0, i32 0
  store i32 18, ptr %t506
  %t507 = getelementptr inbounds [4 x i8], ptr @.str.s39, i64 0, i64 0
  %t508 = getelementptr inbounds %Token, ptr %t505, i32 0, i32 1
  store ptr %t507, ptr %t508
  %t509 = load ptr, ptr %lex
  %t510 = getelementptr inbounds %Lexer, ptr %t509, i32 0, i32 2
  %t511 = load i32, ptr %t510
  %t512 = getelementptr inbounds %Token, ptr %t505, i32 0, i32 2
  store i32 %t511, ptr %t512
  %t513 = getelementptr inbounds [1 x i8], ptr @.str.s40, i64 0, i64 0
  %t514 = getelementptr inbounds %Token, ptr %t505, i32 0, i32 3
  store ptr %t513, ptr %t514
  ret ptr %t505
label_467:
  %t515 = load ptr, ptr %lex
  %t516 = call i8 @lexer_current(ptr %t515)
  store i8 %t516, ptr %c
  %t517 = load i8, ptr %c
  %t518 = call i1 @is_alpha(i8 %t517)
  br i1 %t518, label %label_468, label %label_470
label_468:
  %t519 = load ptr, ptr %lex
  %t520 = getelementptr inbounds %Lexer, ptr %t519, i32 0, i32 1
  %t521 = load i32, ptr %t520
  store i32 %t521, ptr %start
  br label %label_471
label_471:
  %t522 = load ptr, ptr %lex
  %t523 = call i8 @lexer_current(ptr %t522)
  %t524 = call i1 @is_alnum(i8 %t523)
  br i1 %t524, label %label_472, label %label_473
label_472:
  %t525 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t525)
  br label %label_471
label_473:
  %t526 = load ptr, ptr %lex
  %t527 = getelementptr inbounds %Lexer, ptr %t526, i32 0, i32 1
  %t528 = load i32, ptr %t527
  %t529 = load i32, ptr %start
  %t530 = sub i32 %t528, %t529
  store i32 %t530, ptr %length
  %t531 = load ptr, ptr %lex
  %t532 = getelementptr inbounds %Lexer, ptr %t531, i32 0, i32 0
  %t533 = load ptr, ptr %t532
  %t534 = load i32, ptr %start
  %t535 = load i32, ptr %length
  %t536 = call ptr @str_substring(ptr %t533, i32 %t534, i32 %t535)
  store ptr %t536, ptr %value
  %t537 = load ptr, ptr %value
  %t538 = call i1 @is_keyword(ptr %t537)
  br i1 %t538, label %label_474, label %label_476
label_474:
  %t539 = load ptr, ptr %value
  %t540 = call i1 @is_boolean(ptr %t539)
  br i1 %t540, label %label_477, label %label_479
label_477:
  %t541 = getelementptr %Token, ptr null, i32 1
  %t542 = ptrtoint ptr %t541 to i64
  %t543 = call ptr @malloc(i64 %t542)
  %t544 = getelementptr inbounds %Token, ptr %t543, i32 0, i32 0
  store i32 3, ptr %t544
  %t545 = load ptr, ptr %value
  %t546 = getelementptr inbounds %Token, ptr %t543, i32 0, i32 1
  store ptr %t545, ptr %t546
  %t547 = load ptr, ptr %lex
  %t548 = getelementptr inbounds %Lexer, ptr %t547, i32 0, i32 2
  %t549 = load i32, ptr %t548
  %t550 = getelementptr inbounds %Token, ptr %t543, i32 0, i32 2
  store i32 %t549, ptr %t550
  %t551 = getelementptr inbounds [1 x i8], ptr @.str.s41, i64 0, i64 0
  %t552 = getelementptr inbounds %Token, ptr %t543, i32 0, i32 3
  store ptr %t551, ptr %t552
  ret ptr %t543
label_479:
  %t553 = getelementptr %Token, ptr null, i32 1
  %t554 = ptrtoint ptr %t553 to i64
  %t555 = call ptr @malloc(i64 %t554)
  %t556 = getelementptr inbounds %Token, ptr %t555, i32 0, i32 0
  store i32 16, ptr %t556
  %t557 = load ptr, ptr %value
  %t558 = getelementptr inbounds %Token, ptr %t555, i32 0, i32 1
  store ptr %t557, ptr %t558
  %t559 = load ptr, ptr %lex
  %t560 = getelementptr inbounds %Lexer, ptr %t559, i32 0, i32 2
  %t561 = load i32, ptr %t560
  %t562 = getelementptr inbounds %Token, ptr %t555, i32 0, i32 2
  store i32 %t561, ptr %t562
  %t563 = getelementptr inbounds [1 x i8], ptr @.str.s42, i64 0, i64 0
  %t564 = getelementptr inbounds %Token, ptr %t555, i32 0, i32 3
  store ptr %t563, ptr %t564
  ret ptr %t555
label_476:
  %t565 = getelementptr %Token, ptr null, i32 1
  %t566 = ptrtoint ptr %t565 to i64
  %t567 = call ptr @malloc(i64 %t566)
  %t568 = getelementptr inbounds %Token, ptr %t567, i32 0, i32 0
  store i32 4, ptr %t568
  %t569 = load ptr, ptr %value
  %t570 = getelementptr inbounds %Token, ptr %t567, i32 0, i32 1
  store ptr %t569, ptr %t570
  %t571 = load ptr, ptr %lex
  %t572 = getelementptr inbounds %Lexer, ptr %t571, i32 0, i32 2
  %t573 = load i32, ptr %t572
  %t574 = getelementptr inbounds %Token, ptr %t567, i32 0, i32 2
  store i32 %t573, ptr %t574
  %t575 = getelementptr inbounds [1 x i8], ptr @.str.s43, i64 0, i64 0
  %t576 = getelementptr inbounds %Token, ptr %t567, i32 0, i32 3
  store ptr %t575, ptr %t576
  ret ptr %t567
label_470:
  %t577 = load i8, ptr %c
  %t578 = call i1 @is_digit(i8 %t577)
  br i1 %t578, label %label_480, label %label_482
label_480:
  %t579 = load ptr, ptr %lex
  %t580 = getelementptr inbounds %Lexer, ptr %t579, i32 0, i32 1
  %t581 = load i32, ptr %t580
  store i32 %t581, ptr %start
  br label %label_483
label_483:
  %t582 = load ptr, ptr %lex
  %t583 = call i8 @lexer_current(ptr %t582)
  %t584 = call i1 @is_digit(i8 %t583)
  br i1 %t584, label %label_484, label %label_485
label_484:
  %t585 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t585)
  br label %label_483
label_485:
  %t586 = load ptr, ptr %lex
  %t587 = call i8 @lexer_current(ptr %t586)
  %t588 = icmp eq i8 %t587, 46
  br i1 %t588, label %label_486, label %label_488
label_486:
  %t589 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t589)
  br label %label_489
label_489:
  %t590 = load ptr, ptr %lex
  %t591 = call i8 @lexer_current(ptr %t590)
  %t592 = call i1 @is_digit(i8 %t591)
  br i1 %t592, label %label_490, label %label_491
label_490:
  %t593 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t593)
  br label %label_489
label_491:
  br label %label_488
label_488:
  %t594 = load ptr, ptr %lex
  %t595 = getelementptr inbounds %Lexer, ptr %t594, i32 0, i32 1
  %t596 = load i32, ptr %t595
  %t597 = load i32, ptr %start
  %t598 = sub i32 %t596, %t597
  store i32 %t598, ptr %length
  %t599 = load ptr, ptr %lex
  %t600 = getelementptr inbounds %Lexer, ptr %t599, i32 0, i32 0
  %t601 = load ptr, ptr %t600
  %t602 = load i32, ptr %start
  %t603 = load i32, ptr %length
  %t604 = call ptr @str_substring(ptr %t601, i32 %t602, i32 %t603)
  store ptr %t604, ptr %value
  %t605 = getelementptr %Token, ptr null, i32 1
  %t606 = ptrtoint ptr %t605 to i64
  %t607 = call ptr @malloc(i64 %t606)
  %t608 = getelementptr inbounds %Token, ptr %t607, i32 0, i32 0
  store i32 2, ptr %t608
  %t609 = load ptr, ptr %value
  %t610 = getelementptr inbounds %Token, ptr %t607, i32 0, i32 1
  store ptr %t609, ptr %t610
  %t611 = load ptr, ptr %lex
  %t612 = getelementptr inbounds %Lexer, ptr %t611, i32 0, i32 2
  %t613 = load i32, ptr %t612
  %t614 = getelementptr inbounds %Token, ptr %t607, i32 0, i32 2
  store i32 %t613, ptr %t614
  %t615 = getelementptr inbounds [1 x i8], ptr @.str.s44, i64 0, i64 0
  %t616 = getelementptr inbounds %Token, ptr %t607, i32 0, i32 3
  store ptr %t615, ptr %t616
  ret ptr %t607
label_482:
  %t617 = load i8, ptr %c
  %t618 = icmp eq i8 %t617, 34
  br i1 %t618, label %label_492, label %label_494
label_492:
  %t619 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t619)
  %t620 = load ptr, ptr %lex
  %t621 = getelementptr inbounds %Lexer, ptr %t620, i32 0, i32 1
  %t622 = load i32, ptr %t621
  store i32 %t622, ptr %start
  br label %label_495
label_495:
  %t623 = load ptr, ptr %lex
  %t624 = call i8 @lexer_current(ptr %t623)
  %t625 = icmp ne i8 %t624, 34
  %t626 = load ptr, ptr %lex
  %t627 = getelementptr inbounds %Lexer, ptr %t626, i32 0, i32 1
  %t628 = load i32, ptr %t627
  %t629 = load ptr, ptr %lex
  %t630 = getelementptr inbounds %Lexer, ptr %t629, i32 0, i32 0
  %t631 = load ptr, ptr %t630
  %t632 = call i32 @str_length(ptr %t631)
  %t633 = icmp slt i32 %t628, %t632
  %t634 = and i1 %t625, %t633
  br i1 %t634, label %label_496, label %label_497
label_496:
  %t635 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t635)
  br label %label_495
label_497:
  %t636 = load ptr, ptr %lex
  %t637 = getelementptr inbounds %Lexer, ptr %t636, i32 0, i32 1
  %t638 = load i32, ptr %t637
  %t639 = load i32, ptr %start
  %t640 = sub i32 %t638, %t639
  store i32 %t640, ptr %length
  %t641 = load ptr, ptr %lex
  %t642 = getelementptr inbounds %Lexer, ptr %t641, i32 0, i32 0
  %t643 = load ptr, ptr %t642
  %t644 = load i32, ptr %start
  %t645 = load i32, ptr %length
  %t646 = call ptr @str_substring(ptr %t643, i32 %t644, i32 %t645)
  store ptr %t646, ptr %value
  %t647 = load ptr, ptr %lex
  %t648 = call i8 @lexer_current(ptr %t647)
  %t649 = icmp eq i8 %t648, 34
  br i1 %t649, label %label_498, label %label_500
label_498:
  %t650 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t650)
  br label %label_500
label_500:
  %t651 = getelementptr %Token, ptr null, i32 1
  %t652 = ptrtoint ptr %t651 to i64
  %t653 = call ptr @malloc(i64 %t652)
  %t654 = getelementptr inbounds %Token, ptr %t653, i32 0, i32 0
  store i32 0, ptr %t654
  %t655 = load ptr, ptr %value
  %t656 = getelementptr inbounds %Token, ptr %t653, i32 0, i32 1
  store ptr %t655, ptr %t656
  %t657 = load ptr, ptr %lex
  %t658 = getelementptr inbounds %Lexer, ptr %t657, i32 0, i32 2
  %t659 = load i32, ptr %t658
  %t660 = getelementptr inbounds %Token, ptr %t653, i32 0, i32 2
  store i32 %t659, ptr %t660
  %t661 = getelementptr inbounds [1 x i8], ptr @.str.s45, i64 0, i64 0
  %t662 = getelementptr inbounds %Token, ptr %t653, i32 0, i32 3
  store ptr %t661, ptr %t662
  ret ptr %t653
label_494:
  %t663 = load i8, ptr %c
  %t664 = icmp eq i8 %t663, 39
  br i1 %t664, label %label_501, label %label_503
label_501:
  %t665 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t665)
  %t666 = load ptr, ptr %lex
  %t667 = call i8 @lexer_current(ptr %t666)
  store i8 %t667, ptr %value_char
  %t668 = load i8, ptr %value_char
  %t669 = icmp eq i8 %t668, 92
  br i1 %t669, label %label_504, label %label_506
label_504:
  %t670 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t670)
  %t671 = load ptr, ptr %lex
  %t672 = call i8 @lexer_current(ptr %t671)
  store i8 %t672, ptr %esc
  %t673 = load i8, ptr %esc
  %t674 = icmp eq i8 %t673, 110
  br i1 %t674, label %label_507, label %label_509
label_507:
  store i8 10, ptr %value_char
  br label %label_509
label_509:
  %t675 = load i8, ptr %esc
  %t676 = icmp eq i8 %t675, 116
  br i1 %t676, label %label_510, label %label_512
label_510:
  store i8 9, ptr %value_char
  br label %label_512
label_512:
  %t677 = load i8, ptr %esc
  %t678 = icmp eq i8 %t677, 114
  br i1 %t678, label %label_513, label %label_515
label_513:
  store i8 13, ptr %value_char
  br label %label_515
label_515:
  %t679 = load i8, ptr %esc
  %t680 = icmp eq i8 %t679, 48
  br i1 %t680, label %label_516, label %label_518
label_516:
  store i8 0, ptr %value_char
  br label %label_518
label_518:
  %t681 = load i8, ptr %esc
  %t682 = icmp eq i8 %t681, 92
  br i1 %t682, label %label_519, label %label_521
label_519:
  store i8 92, ptr %value_char
  br label %label_521
label_521:
  %t683 = load i8, ptr %esc
  %t684 = icmp eq i8 %t683, 39
  br i1 %t684, label %label_522, label %label_524
label_522:
  store i8 39, ptr %value_char
  br label %label_524
label_524:
  %t685 = load i8, ptr %esc
  %t686 = icmp eq i8 %t685, 34
  br i1 %t686, label %label_525, label %label_527
label_525:
  store i8 34, ptr %value_char
  br label %label_527
label_527:
  br label %label_506
label_506:
  %t687 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t687)
  %t688 = load ptr, ptr %lex
  %t689 = call i8 @lexer_current(ptr %t688)
  %t690 = icmp eq i8 %t689, 39
  br i1 %t690, label %label_528, label %label_530
label_528:
  %t691 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t691)
  br label %label_530
label_530:
  %t692 = getelementptr %Token, ptr null, i32 1
  %t693 = ptrtoint ptr %t692 to i64
  %t694 = call ptr @malloc(i64 %t693)
  %t695 = getelementptr inbounds %Token, ptr %t694, i32 0, i32 0
  store i32 1, ptr %t695
  %t696 = load i8, ptr %value_char
  %t697 = call i32 @char_code(i8 %t696)
  %t698 = call ptr @int_to_str(i32 %t697)
  %t699 = getelementptr inbounds %Token, ptr %t694, i32 0, i32 1
  store ptr %t698, ptr %t699
  %t700 = load ptr, ptr %lex
  %t701 = getelementptr inbounds %Lexer, ptr %t700, i32 0, i32 2
  %t702 = load i32, ptr %t701
  %t703 = getelementptr inbounds %Token, ptr %t694, i32 0, i32 2
  store i32 %t702, ptr %t703
  %t704 = getelementptr inbounds [1 x i8], ptr @.str.s46, i64 0, i64 0
  %t705 = getelementptr inbounds %Token, ptr %t694, i32 0, i32 3
  store ptr %t704, ptr %t705
  ret ptr %t694
label_503:
  %t706 = load i8, ptr %c
  %t707 = call i1 @is_operator(i8 %t706)
  br i1 %t707, label %label_531, label %label_533
label_531:
  %t708 = load ptr, ptr %lex
  %t709 = getelementptr inbounds %Lexer, ptr %t708, i32 0, i32 1
  %t710 = load i32, ptr %t709
  store i32 %t710, ptr %start
  %t711 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t711)
  %t712 = load ptr, ptr %lex
  %t713 = call i8 @lexer_current(ptr %t712)
  store i8 %t713, ptr %next
  %t714 = load i8, ptr %c
  %t715 = icmp eq i8 %t714, 61
  %t716 = load i8, ptr %next
  %t717 = icmp eq i8 %t716, 61
  %t718 = and i1 %t715, %t717
  br i1 %t718, label %label_534, label %label_536
label_534:
  %t719 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t719)
  br label %label_536
label_536:
  %t720 = load i8, ptr %c
  %t721 = icmp eq i8 %t720, 33
  %t722 = load i8, ptr %next
  %t723 = icmp eq i8 %t722, 61
  %t724 = and i1 %t721, %t723
  br i1 %t724, label %label_537, label %label_539
label_537:
  %t725 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t725)
  br label %label_539
label_539:
  %t726 = load i8, ptr %c
  %t727 = icmp eq i8 %t726, 60
  %t728 = load i8, ptr %next
  %t729 = icmp eq i8 %t728, 61
  %t730 = and i1 %t727, %t729
  br i1 %t730, label %label_540, label %label_542
label_540:
  %t731 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t731)
  br label %label_542
label_542:
  %t732 = load i8, ptr %c
  %t733 = icmp eq i8 %t732, 62
  %t734 = load i8, ptr %next
  %t735 = icmp eq i8 %t734, 61
  %t736 = and i1 %t733, %t735
  br i1 %t736, label %label_543, label %label_545
label_543:
  %t737 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t737)
  br label %label_545
label_545:
  %t738 = load i8, ptr %c
  %t739 = icmp eq i8 %t738, 38
  %t740 = load i8, ptr %next
  %t741 = icmp eq i8 %t740, 38
  %t742 = and i1 %t739, %t741
  br i1 %t742, label %label_546, label %label_548
label_546:
  %t743 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t743)
  br label %label_548
label_548:
  %t744 = load i8, ptr %c
  %t745 = icmp eq i8 %t744, 124
  %t746 = load i8, ptr %next
  %t747 = icmp eq i8 %t746, 124
  %t748 = and i1 %t745, %t747
  br i1 %t748, label %label_549, label %label_551
label_549:
  %t749 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t749)
  br label %label_551
label_551:
  %t750 = load i8, ptr %c
  %t751 = icmp eq i8 %t750, 45
  %t752 = load i8, ptr %next
  %t753 = icmp eq i8 %t752, 62
  %t754 = and i1 %t751, %t753
  br i1 %t754, label %label_552, label %label_554
label_552:
  %t755 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t755)
  br label %label_554
label_554:
  %t756 = load i8, ptr %c
  %t757 = icmp eq i8 %t756, 61
  %t758 = load i8, ptr %next
  %t759 = icmp eq i8 %t758, 62
  %t760 = and i1 %t757, %t759
  br i1 %t760, label %label_555, label %label_557
label_555:
  %t761 = load ptr, ptr %lex
  call void @lexer_advance(ptr %t761)
  br label %label_557
label_557:
  %t762 = load ptr, ptr %lex
  %t763 = getelementptr inbounds %Lexer, ptr %t762, i32 0, i32 1
  %t764 = load i32, ptr %t763
  %t765 = load i32, ptr %start
  %t766 = sub i32 %t764, %t765
  store i32 %t766, ptr %length
  %t767 = load ptr, ptr %lex
  %t768 = getelementptr inbounds %Lexer, ptr %t767, i32 0, i32 0
  %t769 = load ptr, ptr %t768
  %t770 = load i32, ptr %start
  %t771 = load i32, ptr %length
  %t772 = call ptr @str_substring(ptr %t769, i32 %t770, i32 %t771)
  store ptr %t772, ptr %value
  store i32 7, ptr %type
  %t773 = load i32, ptr %length
  %t774 = icmp eq i32 %t773, 2
  br i1 %t774, label %label_558, label %label_559
label_558:
  %t775 = load ptr, ptr %value
  %t776 = getelementptr inbounds [3 x i8], ptr @.str.s47, i64 0, i64 0
  %t777 = call i32 @str_equals(ptr %t775, ptr %t776)
  %t778 = icmp eq i32 %t777, 1
  %t779 = load ptr, ptr %value
  %t780 = getelementptr inbounds [3 x i8], ptr @.str.s48, i64 0, i64 0
  %t781 = call i32 @str_equals(ptr %t779, ptr %t780)
  %t782 = icmp eq i32 %t781, 1
  %t783 = or i1 %t778, %t782
  %t784 = load ptr, ptr %value
  %t785 = getelementptr inbounds [3 x i8], ptr @.str.s49, i64 0, i64 0
  %t786 = call i32 @str_equals(ptr %t784, ptr %t785)
  %t787 = icmp eq i32 %t786, 1
  %t788 = or i1 %t783, %t787
  %t789 = load ptr, ptr %value
  %t790 = getelementptr inbounds [3 x i8], ptr @.str.s50, i64 0, i64 0
  %t791 = call i32 @str_equals(ptr %t789, ptr %t790)
  %t792 = icmp eq i32 %t791, 1
  %t793 = or i1 %t788, %t792
  br i1 %t793, label %label_561, label %label_563
label_561:
  store i32 8, ptr %type
  br label %label_563
label_563:
  %t794 = load ptr, ptr %value
  %t795 = getelementptr inbounds [3 x i8], ptr @.str.s51, i64 0, i64 0
  %t796 = call i32 @str_equals(ptr %t794, ptr %t795)
  %t797 = icmp eq i32 %t796, 1
  %t798 = load ptr, ptr %value
  %t799 = getelementptr inbounds [3 x i8], ptr @.str.s52, i64 0, i64 0
  %t800 = call i32 @str_equals(ptr %t798, ptr %t799)
  %t801 = icmp eq i32 %t800, 1
  %t802 = or i1 %t797, %t801
  br i1 %t802, label %label_564, label %label_566
label_564:
  store i32 14, ptr %type
  %t803 = load ptr, ptr %value
  %t804 = getelementptr inbounds [3 x i8], ptr @.str.s53, i64 0, i64 0
  %t805 = call i32 @str_equals(ptr %t803, ptr %t804)
  %t806 = icmp eq i32 %t805, 1
  br i1 %t806, label %label_567, label %label_569
label_567:
  store i32 15, ptr %type
  br label %label_569
label_569:
  br label %label_566
label_566:
  br label %label_560
label_559:
  %t807 = load i8, ptr %c
  %t808 = icmp eq i8 %t807, 60
  %t809 = load i8, ptr %c
  %t810 = icmp eq i8 %t809, 62
  %t811 = or i1 %t808, %t810
  br i1 %t811, label %label_570, label %label_572
label_570:
  store i32 8, ptr %type
  br label %label_572
label_572:
  %t812 = load i8, ptr %c
  %t813 = icmp eq i8 %t812, 61
  br i1 %t813, label %label_573, label %label_575
label_573:
  store i32 11, ptr %type
  br label %label_575
label_575:
  %t814 = load i8, ptr %c
  %t815 = icmp eq i8 %t814, 33
  br i1 %t815, label %label_576, label %label_578
label_576:
  store i32 9, ptr %type
  br label %label_578
label_578:
  br label %label_560
label_560:
  %t816 = getelementptr %Token, ptr null, i32 1
  %t817 = ptrtoint ptr %t816 to i64
  %t818 = call ptr @malloc(i64 %t817)
  %t819 = load i32, ptr %type
  %t820 = getelementptr inbounds %Token, ptr %t818, i32 0, i32 0
  store i32 %t819, ptr %t820
  %t821 = load ptr, ptr %value
  %t822 = getelementptr inbounds %Token, ptr %t818, i32 0, i32 1
  store ptr %t821, ptr %t822
  %t823 = load ptr, ptr %lex
  %t824 = getelementptr inbounds %Lexer, ptr %t823, i32 0, i32 2
  %t825 = load i32, ptr %t824
  %t826 = getelementptr inbounds %Token, ptr %t818, i32 0, i32 2
  store i32 %t825, ptr %t826
  %t827 = getelementptr inbounds [1 x i8], ptr @.str.s54, i64 0, i64 0
  %t828 = getelementptr inbounds %Token, ptr %t818, i32 0, i32 3
  store ptr %t827, ptr %t828
  ret ptr %t818
label_533:
  %t829 = load i8, ptr %c
  %t830 = call i1 @is_separator(i8 %t829)
  br i1 %t830, label %label_579, label %label_581
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
  %t868 = load ptr, ptr %lex
  %t869 = call ptr @lexer_next_token(ptr %t868)
  store ptr %t869, ptr %head
  %t870 = load ptr, ptr %head
  store ptr %t870, ptr %current
  br label %label_582
label_582:
  %t871 = load ptr, ptr %current
  %t872 = getelementptr inbounds %Token, ptr %t871, i32 0, i32 0
  %t873 = load i32, ptr %t872
  %t874 = icmp ne i32 %t873, 18
  br i1 %t874, label %label_583, label %label_584
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
  %t1150 = load ptr, ptr %p
  %t1151 = getelementptr inbounds [7 x i8], ptr @.str.s89, i64 0, i64 0
  %t1152 = getelementptr inbounds [10 x i8], ptr @.str.s90, i64 0, i64 0
  call void @parser_expect_val(ptr %t1150, i32 16, ptr %t1151, ptr %t1152)
  %t1153 = load ptr, ptr %p
  %t1154 = getelementptr inbounds [3 x i8], ptr @.str.s91, i64 0, i64 0
  %t1155 = getelementptr inbounds [10 x i8], ptr @.str.s92, i64 0, i64 0
  call void @parser_expect_val(ptr %t1153, i32 16, ptr %t1154, ptr %t1155)
  %t1156 = call ptr @create_node(i32 2)
  store ptr %t1156, ptr %ext_node
  %t1157 = load ptr, ptr %p
  %t1158 = call ptr @parser_current(ptr %t1157)
  store ptr %t1158, ptr %curr
  %t1159 = load ptr, ptr %ext_node
  %t1160 = load ptr, ptr %curr
  %t1161 = getelementptr inbounds %Token, ptr %t1160, i32 0, i32 1
  %t1162 = load ptr, ptr %t1161
  %t1163 = getelementptr inbounds %ASTNode, ptr %t1159, i32 0, i32 1
  store ptr %t1162, ptr %t1163
  %t1164 = load ptr, ptr %p
  %t1165 = getelementptr inbounds [14 x i8], ptr @.str.s93, i64 0, i64 0
  call void @parser_expect(ptr %t1164, i32 4, ptr %t1165)
  %t1166 = load ptr, ptr %p
  %t1167 = getelementptr inbounds [2 x i8], ptr @.str.s94, i64 0, i64 0
  %t1168 = getelementptr inbounds [7 x i8], ptr @.str.s95, i64 0, i64 0
  call void @parser_expect_val(ptr %t1166, i32 5, ptr %t1167, ptr %t1168)
  %t1169 = getelementptr inbounds [1 x i8], ptr @.str.s96, i64 0, i64 0
  store ptr %t1169, ptr %last_param
  %t1170 = load ptr, ptr %p
  %t1171 = getelementptr inbounds [2 x i8], ptr @.str.s97, i64 0, i64 0
  %t1172 = call i1 @parser_check_val(ptr %t1170, i32 5, ptr %t1171)
  %t1173 = icmp eq i1 %t1172, 0
  br i1 %t1173, label %label_636, label %label_638
label_636:
  store i1 1, ptr %is_looping
  br label %label_639
label_639:
  %t1174 = load i1, ptr %is_looping
  br i1 %t1174, label %label_640, label %label_641
label_640:
  %t1175 = call ptr @create_node(i32 29)
  store ptr %t1175, ptr %param
  %t1176 = load ptr, ptr %p
  %t1177 = call ptr @parser_current(ptr %t1176)
  store ptr %t1177, ptr %curr
  %t1178 = load ptr, ptr %param
  %t1179 = load ptr, ptr %curr
  %t1180 = getelementptr inbounds %Token, ptr %t1179, i32 0, i32 1
  %t1181 = load ptr, ptr %t1180
  %t1182 = getelementptr inbounds %ASTNode, ptr %t1178, i32 0, i32 1
  store ptr %t1181, ptr %t1182
  %t1183 = load ptr, ptr %p
  %t1184 = getelementptr inbounds [15 x i8], ptr @.str.s98, i64 0, i64 0
  call void @parser_expect(ptr %t1183, i32 4, ptr %t1184)
  %t1185 = load ptr, ptr %p
  %t1186 = getelementptr inbounds [2 x i8], ptr @.str.s99, i64 0, i64 0
  %t1187 = getelementptr inbounds [15 x i8], ptr @.str.s100, i64 0, i64 0
  call void @parser_expect_val(ptr %t1185, i32 5, ptr %t1186, ptr %t1187)
  %t1188 = load ptr, ptr %param
  %t1189 = load ptr, ptr %p
  %t1190 = call ptr @parse_type_annotation(ptr %t1189)
  %t1191 = call ptr @node_to_ptr(ptr %t1190)
  %t1192 = getelementptr inbounds %ASTNode, ptr %t1188, i32 0, i32 5
  store ptr %t1191, ptr %t1192
  %t1193 = load ptr, ptr %ext_node
  %t1194 = getelementptr inbounds %ASTNode, ptr %t1193, i32 0, i32 5
  %t1195 = load ptr, ptr %t1194
  %t1196 = getelementptr inbounds [1 x i8], ptr @.str.s101, i64 0, i64 0
  %t1197 = call i32 @str_equals(ptr %t1195, ptr %t1196)
  %t1198 = icmp eq i32 %t1197, 1
  br i1 %t1198, label %label_642, label %label_643
label_642:
  %t1199 = load ptr, ptr %ext_node
  %t1200 = load ptr, ptr %param
  %t1201 = call ptr @node_to_ptr(ptr %t1200)
  %t1202 = getelementptr inbounds %ASTNode, ptr %t1199, i32 0, i32 5
  store ptr %t1201, ptr %t1202
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
  %t1234 = load ptr, ptr %p
  %t1235 = getelementptr inbounds [3 x i8], ptr @.str.s106, i64 0, i64 0
  %t1236 = getelementptr inbounds [9 x i8], ptr @.str.s107, i64 0, i64 0
  call void @parser_expect_val(ptr %t1234, i32 16, ptr %t1235, ptr %t1236)
  %t1237 = call ptr @create_node(i32 4)
  store ptr %t1237, ptr %fn_node
  %t1238 = load ptr, ptr %p
  %t1239 = call ptr @parser_current(ptr %t1238)
  store ptr %t1239, ptr %curr
  %t1240 = load ptr, ptr %fn_node
  %t1241 = load ptr, ptr %curr
  %t1242 = getelementptr inbounds %Token, ptr %t1241, i32 0, i32 1
  %t1243 = load ptr, ptr %t1242
  %t1244 = getelementptr inbounds %ASTNode, ptr %t1240, i32 0, i32 1
  store ptr %t1243, ptr %t1244
  %t1245 = load ptr, ptr %p
  %t1246 = getelementptr inbounds [14 x i8], ptr @.str.s108, i64 0, i64 0
  call void @parser_expect(ptr %t1245, i32 4, ptr %t1246)
  %t1247 = load ptr, ptr %p
  %t1248 = getelementptr inbounds [2 x i8], ptr @.str.s109, i64 0, i64 0
  %t1249 = getelementptr inbounds [7 x i8], ptr @.str.s110, i64 0, i64 0
  call void @parser_expect_val(ptr %t1247, i32 5, ptr %t1248, ptr %t1249)
  %t1250 = getelementptr inbounds [1 x i8], ptr @.str.s111, i64 0, i64 0
  store ptr %t1250, ptr %last_param
  %t1251 = load ptr, ptr %p
  %t1252 = getelementptr inbounds [2 x i8], ptr @.str.s112, i64 0, i64 0
  %t1253 = call i1 @parser_check_val(ptr %t1251, i32 5, ptr %t1252)
  %t1254 = icmp eq i1 %t1253, 0
  br i1 %t1254, label %label_651, label %label_653
label_651:
  store i1 1, ptr %is_looping
  br label %label_654
label_654:
  %t1255 = load i1, ptr %is_looping
  br i1 %t1255, label %label_655, label %label_656
label_655:
  %t1256 = call ptr @create_node(i32 29)
  store ptr %t1256, ptr %param
  %t1257 = load ptr, ptr %p
  %t1258 = call ptr @parser_current(ptr %t1257)
  store ptr %t1258, ptr %curr
  %t1259 = load ptr, ptr %param
  %t1260 = load ptr, ptr %curr
  %t1261 = getelementptr inbounds %Token, ptr %t1260, i32 0, i32 1
  %t1262 = load ptr, ptr %t1261
  %t1263 = getelementptr inbounds %ASTNode, ptr %t1259, i32 0, i32 1
  store ptr %t1262, ptr %t1263
  %t1264 = load ptr, ptr %p
  %t1265 = getelementptr inbounds [15 x i8], ptr @.str.s113, i64 0, i64 0
  call void @parser_expect(ptr %t1264, i32 4, ptr %t1265)
  %t1266 = load ptr, ptr %p
  %t1267 = getelementptr inbounds [2 x i8], ptr @.str.s114, i64 0, i64 0
  %t1268 = getelementptr inbounds [15 x i8], ptr @.str.s115, i64 0, i64 0
  call void @parser_expect_val(ptr %t1266, i32 5, ptr %t1267, ptr %t1268)
  %t1269 = load ptr, ptr %param
  %t1270 = load ptr, ptr %p
  %t1271 = call ptr @parse_type_annotation(ptr %t1270)
  %t1272 = call ptr @node_to_ptr(ptr %t1271)
  %t1273 = getelementptr inbounds %ASTNode, ptr %t1269, i32 0, i32 5
  store ptr %t1272, ptr %t1273
  %t1274 = load ptr, ptr %fn_node
  %t1275 = getelementptr inbounds %ASTNode, ptr %t1274, i32 0, i32 5
  %t1276 = load ptr, ptr %t1275
  %t1277 = getelementptr inbounds [1 x i8], ptr @.str.s116, i64 0, i64 0
  %t1278 = call i32 @str_equals(ptr %t1276, ptr %t1277)
  %t1279 = icmp eq i32 %t1278, 1
  br i1 %t1279, label %label_657, label %label_658
label_657:
  %t1280 = load ptr, ptr %fn_node
  %t1281 = load ptr, ptr %param
  %t1282 = call ptr @node_to_ptr(ptr %t1281)
  %t1283 = getelementptr inbounds %ASTNode, ptr %t1280, i32 0, i32 5
  store ptr %t1282, ptr %t1283
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
  %t1319 = load ptr, ptr %p
  %t1320 = getelementptr inbounds [7 x i8], ptr @.str.s121, i64 0, i64 0
  %t1321 = getelementptr inbounds [7 x i8], ptr @.str.s122, i64 0, i64 0
  call void @parser_expect_val(ptr %t1319, i32 16, ptr %t1320, ptr %t1321)
  %t1322 = call ptr @create_node(i32 5)
  store ptr %t1322, ptr %struct_node
  %t1323 = load ptr, ptr %p
  %t1324 = call ptr @parser_current(ptr %t1323)
  store ptr %t1324, ptr %curr
  %t1325 = load ptr, ptr %struct_node
  %t1326 = load ptr, ptr %curr
  %t1327 = getelementptr inbounds %Token, ptr %t1326, i32 0, i32 1
  %t1328 = load ptr, ptr %t1327
  %t1329 = getelementptr inbounds %ASTNode, ptr %t1325, i32 0, i32 1
  store ptr %t1328, ptr %t1329
  %t1330 = load ptr, ptr %p
  %t1331 = getelementptr inbounds [12 x i8], ptr @.str.s123, i64 0, i64 0
  call void @parser_expect(ptr %t1330, i32 4, ptr %t1331)
  %t1332 = load ptr, ptr %p
  %t1333 = getelementptr inbounds [2 x i8], ptr @.str.s124, i64 0, i64 0
  %t1334 = getelementptr inbounds [12 x i8], ptr @.str.s125, i64 0, i64 0
  call void @parser_expect_val(ptr %t1332, i32 5, ptr %t1333, ptr %t1334)
  %t1335 = getelementptr inbounds [1 x i8], ptr @.str.s126, i64 0, i64 0
  store ptr %t1335, ptr %last_field
  br label %label_666
label_666:
  %t1336 = load ptr, ptr %p
  %t1337 = getelementptr inbounds [2 x i8], ptr @.str.s127, i64 0, i64 0
  %t1338 = call i1 @parser_check_val(ptr %t1336, i32 5, ptr %t1337)
  %t1339 = icmp eq i1 %t1338, 0
  br i1 %t1339, label %label_667, label %label_668
label_667:
  %t1340 = call ptr @create_node(i32 31)
  store ptr %t1340, ptr %field
  %t1341 = load ptr, ptr %p
  %t1342 = call ptr @parser_current(ptr %t1341)
  store ptr %t1342, ptr %curr
  %t1343 = load ptr, ptr %field
  %t1344 = load ptr, ptr %curr
  %t1345 = getelementptr inbounds %Token, ptr %t1344, i32 0, i32 1
  %t1346 = load ptr, ptr %t1345
  %t1347 = getelementptr inbounds %ASTNode, ptr %t1343, i32 0, i32 1
  store ptr %t1346, ptr %t1347
  %t1348 = load ptr, ptr %p
  %t1349 = getelementptr inbounds [11 x i8], ptr @.str.s128, i64 0, i64 0
  call void @parser_expect(ptr %t1348, i32 4, ptr %t1349)
  %t1350 = load ptr, ptr %p
  %t1351 = getelementptr inbounds [2 x i8], ptr @.str.s129, i64 0, i64 0
  %t1352 = getelementptr inbounds [11 x i8], ptr @.str.s130, i64 0, i64 0
  call void @parser_expect_val(ptr %t1350, i32 5, ptr %t1351, ptr %t1352)
  %t1353 = load ptr, ptr %field
  %t1354 = load ptr, ptr %p
  %t1355 = call ptr @parse_type_annotation(ptr %t1354)
  %t1356 = call ptr @node_to_ptr(ptr %t1355)
  %t1357 = getelementptr inbounds %ASTNode, ptr %t1353, i32 0, i32 5
  store ptr %t1356, ptr %t1357
  %t1358 = load ptr, ptr %struct_node
  %t1359 = getelementptr inbounds %ASTNode, ptr %t1358, i32 0, i32 5
  %t1360 = load ptr, ptr %t1359
  %t1361 = getelementptr inbounds [1 x i8], ptr @.str.s131, i64 0, i64 0
  %t1362 = call i32 @str_equals(ptr %t1360, ptr %t1361)
  %t1363 = icmp eq i32 %t1362, 1
  br i1 %t1363, label %label_669, label %label_670
label_669:
  %t1364 = load ptr, ptr %struct_node
  %t1365 = load ptr, ptr %field
  %t1366 = call ptr @node_to_ptr(ptr %t1365)
  %t1367 = getelementptr inbounds %ASTNode, ptr %t1364, i32 0, i32 5
  store ptr %t1366, ptr %t1367
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
  %t1389 = load ptr, ptr %p
  %t1390 = getelementptr inbounds [5 x i8], ptr @.str.s135, i64 0, i64 0
  %t1391 = getelementptr inbounds [5 x i8], ptr @.str.s136, i64 0, i64 0
  call void @parser_expect_val(ptr %t1389, i32 16, ptr %t1390, ptr %t1391)
  %t1392 = call ptr @create_node(i32 6)
  store ptr %t1392, ptr %enum_node
  %t1393 = load ptr, ptr %p
  %t1394 = call ptr @parser_current(ptr %t1393)
  store ptr %t1394, ptr %curr
  %t1395 = load ptr, ptr %enum_node
  %t1396 = load ptr, ptr %curr
  %t1397 = getelementptr inbounds %Token, ptr %t1396, i32 0, i32 1
  %t1398 = load ptr, ptr %t1397
  %t1399 = getelementptr inbounds %ASTNode, ptr %t1395, i32 0, i32 1
  store ptr %t1398, ptr %t1399
  %t1400 = load ptr, ptr %p
  %t1401 = getelementptr inbounds [10 x i8], ptr @.str.s137, i64 0, i64 0
  call void @parser_expect(ptr %t1400, i32 4, ptr %t1401)
  %t1402 = load ptr, ptr %p
  %t1403 = getelementptr inbounds [2 x i8], ptr @.str.s138, i64 0, i64 0
  %t1404 = getelementptr inbounds [10 x i8], ptr @.str.s139, i64 0, i64 0
  call void @parser_expect_val(ptr %t1402, i32 5, ptr %t1403, ptr %t1404)
  %t1405 = getelementptr inbounds [1 x i8], ptr @.str.s140, i64 0, i64 0
  store ptr %t1405, ptr %last_var
  br label %label_672
label_672:
  %t1406 = load ptr, ptr %p
  %t1407 = getelementptr inbounds [2 x i8], ptr @.str.s141, i64 0, i64 0
  %t1408 = call i1 @parser_check_val(ptr %t1406, i32 5, ptr %t1407)
  %t1409 = icmp eq i1 %t1408, 0
  br i1 %t1409, label %label_673, label %label_674
label_673:
  %t1410 = call ptr @create_node(i32 32)
  store ptr %t1410, ptr %variant
  %t1411 = load ptr, ptr %p
  %t1412 = call ptr @parser_current(ptr %t1411)
  store ptr %t1412, ptr %curr
  %t1413 = load ptr, ptr %variant
  %t1414 = load ptr, ptr %curr
  %t1415 = getelementptr inbounds %Token, ptr %t1414, i32 0, i32 1
  %t1416 = load ptr, ptr %t1415
  %t1417 = getelementptr inbounds %ASTNode, ptr %t1413, i32 0, i32 1
  store ptr %t1416, ptr %t1417
  %t1418 = load ptr, ptr %p
  %t1419 = getelementptr inbounds [13 x i8], ptr @.str.s142, i64 0, i64 0
  call void @parser_expect(ptr %t1418, i32 4, ptr %t1419)
  %t1420 = load ptr, ptr %enum_node
  %t1421 = getelementptr inbounds %ASTNode, ptr %t1420, i32 0, i32 5
  %t1422 = load ptr, ptr %t1421
  %t1423 = getelementptr inbounds [1 x i8], ptr @.str.s143, i64 0, i64 0
  %t1424 = call i32 @str_equals(ptr %t1422, ptr %t1423)
  %t1425 = icmp eq i32 %t1424, 1
  br i1 %t1425, label %label_675, label %label_676
label_675:
  %t1426 = load ptr, ptr %enum_node
  %t1427 = load ptr, ptr %variant
  %t1428 = call ptr @node_to_ptr(ptr %t1427)
  %t1429 = getelementptr inbounds %ASTNode, ptr %t1426, i32 0, i32 5
  store ptr %t1428, ptr %t1429
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
  %t1450 = load ptr, ptr %p
  %t1451 = getelementptr inbounds [2 x i8], ptr @.str.s147, i64 0, i64 0
  %t1452 = getelementptr inbounds [6 x i8], ptr @.str.s148, i64 0, i64 0
  call void @parser_expect_val(ptr %t1450, i32 5, ptr %t1451, ptr %t1452)
  %t1453 = call ptr @create_node(i32 9)
  store ptr %t1453, ptr %block_node
  %t1454 = getelementptr inbounds [1 x i8], ptr @.str.s149, i64 0, i64 0
  store ptr %t1454, ptr %last_stmt
  br label %label_678
label_678:
  %t1455 = load ptr, ptr %p
  %t1456 = getelementptr inbounds [2 x i8], ptr @.str.s150, i64 0, i64 0
  %t1457 = call i1 @parser_check_val(ptr %t1455, i32 5, ptr %t1456)
  %t1458 = icmp eq i1 %t1457, 0
  br i1 %t1458, label %label_679, label %label_680
label_679:
  %t1459 = load ptr, ptr %p
  %t1460 = call ptr @parse_statement(ptr %t1459)
  store ptr %t1460, ptr %stmt
  %t1461 = load ptr, ptr %block_node
  %t1462 = getelementptr inbounds %ASTNode, ptr %t1461, i32 0, i32 5
  %t1463 = load ptr, ptr %t1462
  %t1464 = getelementptr inbounds [1 x i8], ptr @.str.s151, i64 0, i64 0
  %t1465 = call i32 @str_equals(ptr %t1463, ptr %t1464)
  %t1466 = icmp eq i32 %t1465, 1
  br i1 %t1466, label %label_681, label %label_682
label_681:
  %t1467 = load ptr, ptr %block_node
  %t1468 = load ptr, ptr %stmt
  %t1469 = call ptr @node_to_ptr(ptr %t1468)
  %t1470 = getelementptr inbounds %ASTNode, ptr %t1467, i32 0, i32 5
  store ptr %t1469, ptr %t1470
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
  %ret_node = alloca ptr
  %curr = alloca ptr
  %expr = alloca ptr
  %assign_stmt = alloca ptr
  %stmt = alloca ptr
  store ptr %p_p, ptr %p
  %t1551 = load ptr, ptr %p
  %t1552 = getelementptr inbounds [3 x i8], ptr @.str.s168, i64 0, i64 0
  %t1553 = call i1 @parser_check_val(ptr %t1551, i32 16, ptr %t1552)
  br i1 %t1553, label %label_690, label %label_692
label_690:
  %t1554 = load ptr, ptr %p
  %t1555 = call ptr @parse_if_statement(ptr %t1554)
  ret ptr %t1555
label_692:
  %t1556 = load ptr, ptr %p
  %t1557 = getelementptr inbounds [6 x i8], ptr @.str.s169, i64 0, i64 0
  %t1558 = call i1 @parser_check_val(ptr %t1556, i32 16, ptr %t1557)
  br i1 %t1558, label %label_693, label %label_695
label_693:
  %t1559 = load ptr, ptr %p
  %t1560 = call ptr @parse_while_statement(ptr %t1559)
  ret ptr %t1560
label_695:
  %t1561 = load ptr, ptr %p
  %t1562 = getelementptr inbounds [7 x i8], ptr @.str.s170, i64 0, i64 0
  %t1563 = call i1 @parser_match_val(ptr %t1561, i32 16, ptr %t1562)
  br i1 %t1563, label %label_696, label %label_698
label_696:
  %t1564 = call ptr @create_node(i32 15)
  store ptr %t1564, ptr %ret_node
  %t1565 = load ptr, ptr %p
  %t1566 = call ptr @parser_current(ptr %t1565)
  store ptr %t1566, ptr %curr
  %t1567 = load ptr, ptr %curr
  %t1568 = getelementptr inbounds %Token, ptr %t1567, i32 0, i32 0
  %t1569 = load i32, ptr %t1568
  %t1570 = icmp ne i32 %t1569, 5
  %t1571 = load ptr, ptr %curr
  %t1572 = getelementptr inbounds %Token, ptr %t1571, i32 0, i32 1
  %t1573 = load ptr, ptr %t1572
  %t1574 = getelementptr inbounds [2 x i8], ptr @.str.s171, i64 0, i64 0
  %t1575 = call i32 @str_equals(ptr %t1573, ptr %t1574)
  %t1576 = icmp eq i32 %t1575, 0
  %t1577 = or i1 %t1570, %t1576
  br i1 %t1577, label %label_699, label %label_701
label_699:
  %t1578 = load ptr, ptr %ret_node
  %t1579 = load ptr, ptr %p
  %t1580 = call ptr @parse_expression(ptr %t1579, i32 0)
  %t1581 = call ptr @node_to_ptr(ptr %t1580)
  %t1582 = getelementptr inbounds %ASTNode, ptr %t1578, i32 0, i32 5
  store ptr %t1581, ptr %t1582
  br label %label_701
label_701:
  %t1583 = load ptr, ptr %ret_node
  ret ptr %t1583
label_698:
  %t1584 = load ptr, ptr %p
  %t1585 = getelementptr inbounds [4 x i8], ptr @.str.s172, i64 0, i64 0
  %t1586 = call i1 @parser_check_val(ptr %t1584, i32 16, ptr %t1585)
  br i1 %t1586, label %label_702, label %label_704
label_702:
  %t1587 = load ptr, ptr %p
  %t1588 = call ptr @parse_variable_decl(ptr %t1587)
  ret ptr %t1588
label_704:
  %t1589 = load ptr, ptr %p
  %t1590 = call ptr @parse_expression(ptr %t1589, i32 0)
  store ptr %t1590, ptr %expr
  %t1591 = load ptr, ptr %p
  %t1592 = getelementptr inbounds [2 x i8], ptr @.str.s173, i64 0, i64 0
  %t1593 = call i1 @parser_match_val(ptr %t1591, i32 11, ptr %t1592)
  br i1 %t1593, label %label_705, label %label_707
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
  %t1711 = load ptr, ptr %p
  %t1712 = call ptr @parse_primary(ptr %t1711)
  store ptr %t1712, ptr %left
  store i1 1, ptr %is_looping
  br label %label_729
label_729:
  %t1713 = load i1, ptr %is_looping
  br i1 %t1713, label %label_730, label %label_731
label_730:
  %t1714 = load ptr, ptr %p
  %t1715 = call ptr @parser_current(ptr %t1714)
  store ptr %t1715, ptr %curr
  %t1716 = load ptr, ptr %curr
  %t1717 = getelementptr inbounds %Token, ptr %t1716, i32 0, i32 0
  %t1718 = load i32, ptr %t1717
  %t1719 = icmp eq i32 %t1718, 7
  %t1720 = load ptr, ptr %curr
  %t1721 = getelementptr inbounds %Token, ptr %t1720, i32 0, i32 0
  %t1722 = load i32, ptr %t1721
  %t1723 = icmp eq i32 %t1722, 8
  %t1724 = or i1 %t1719, %t1723
  %t1725 = load ptr, ptr %curr
  %t1726 = getelementptr inbounds %Token, ptr %t1725, i32 0, i32 1
  %t1727 = load ptr, ptr %t1726
  %t1728 = getelementptr inbounds [4 x i8], ptr @.str.s187, i64 0, i64 0
  %t1729 = call i32 @str_equals(ptr %t1727, ptr %t1728)
  %t1730 = icmp eq i32 %t1729, 1
  %t1731 = or i1 %t1724, %t1730
  %t1732 = load ptr, ptr %curr
  %t1733 = getelementptr inbounds %Token, ptr %t1732, i32 0, i32 1
  %t1734 = load ptr, ptr %t1733
  %t1735 = getelementptr inbounds [3 x i8], ptr @.str.s188, i64 0, i64 0
  %t1736 = call i32 @str_equals(ptr %t1734, ptr %t1735)
  %t1737 = icmp eq i32 %t1736, 1
  %t1738 = or i1 %t1731, %t1737
  store i1 %t1738, ptr %is_operator
  %t1739 = load i1, ptr %is_operator
  %t1740 = icmp eq i1 %t1739, 0
  br i1 %t1740, label %label_732, label %label_733
label_732:
  store i1 0, ptr %is_looping
  br label %label_734
label_733:
  %t1741 = load ptr, ptr %curr
  %t1742 = call i32 @get_operator_precedence(ptr %t1741)
  store i32 %t1742, ptr %current_precedence
  %t1743 = load i32, ptr %current_precedence
  %t1744 = icmp eq i32 %t1743, 0
  %t1745 = load i32, ptr %current_precedence
  %t1746 = load i32, ptr %precedence
  %t1747 = icmp slt i32 %t1745, %t1746
  %t1748 = or i1 %t1744, %t1747
  br i1 %t1748, label %label_735, label %label_736
label_735:
  store i1 0, ptr %is_looping
  br label %label_737
label_736:
  %t1749 = load ptr, ptr %curr
  %t1750 = getelementptr inbounds %Token, ptr %t1749, i32 0, i32 1
  %t1751 = load ptr, ptr %t1750
  store ptr %t1751, ptr %op
  %t1752 = load ptr, ptr %p
  call void @parser_advance(ptr %t1752)
  %t1753 = load ptr, ptr %p
  %t1754 = load i32, ptr %current_precedence
  %t1755 = add i32 %t1754, 1
  %t1756 = call ptr @parse_expression(ptr %t1753, i32 %t1755)
  store ptr %t1756, ptr %right
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
  %t1794 = load ptr, ptr %p
  %t1795 = call ptr @parser_current(ptr %t1794)
  store ptr %t1795, ptr %curr
  %t1796 = load ptr, ptr %curr
  %t1797 = getelementptr inbounds %Token, ptr %t1796, i32 0, i32 0
  %t1798 = load i32, ptr %t1797
  %t1799 = icmp eq i32 %t1798, 2
  %t1800 = load ptr, ptr %curr
  %t1801 = getelementptr inbounds %Token, ptr %t1800, i32 0, i32 0
  %t1802 = load i32, ptr %t1801
  %t1803 = icmp eq i32 %t1802, 0
  %t1804 = or i1 %t1799, %t1803
  %t1805 = load ptr, ptr %curr
  %t1806 = getelementptr inbounds %Token, ptr %t1805, i32 0, i32 0
  %t1807 = load i32, ptr %t1806
  %t1808 = icmp eq i32 %t1807, 3
  %t1809 = or i1 %t1804, %t1808
  %t1810 = load ptr, ptr %curr
  %t1811 = getelementptr inbounds %Token, ptr %t1810, i32 0, i32 0
  %t1812 = load i32, ptr %t1811
  %t1813 = icmp eq i32 %t1812, 1
  %t1814 = or i1 %t1809, %t1813
  br i1 %t1814, label %label_738, label %label_740
label_738:
  %t1815 = call ptr @create_node(i32 22)
  store ptr %t1815, ptr %lit
  %t1816 = load ptr, ptr %lit
  %t1817 = load ptr, ptr %curr
  %t1818 = getelementptr inbounds %Token, ptr %t1817, i32 0, i32 0
  %t1819 = load i32, ptr %t1818
  %t1820 = getelementptr inbounds %ASTNode, ptr %t1816, i32 0, i32 3
  store i32 %t1819, ptr %t1820
  %t1821 = load ptr, ptr %lit
  %t1822 = load ptr, ptr %curr
  %t1823 = getelementptr inbounds %Token, ptr %t1822, i32 0, i32 1
  %t1824 = load ptr, ptr %t1823
  %t1825 = getelementptr inbounds %ASTNode, ptr %t1821, i32 0, i32 1
  store ptr %t1824, ptr %t1825
  %t1826 = load ptr, ptr %p
  call void @parser_advance(ptr %t1826)
  %t1827 = load ptr, ptr %lit
  ret ptr %t1827
label_740:
  %t1828 = load ptr, ptr %curr
  %t1829 = getelementptr inbounds %Token, ptr %t1828, i32 0, i32 0
  %t1830 = load i32, ptr %t1829
  %t1831 = icmp eq i32 %t1830, 4
  br i1 %t1831, label %label_741, label %label_743
label_741:
  %t1832 = load ptr, ptr %p
  %t1833 = call ptr @parser_peek(ptr %t1832)
  store ptr %t1833, ptr %next_tok
  %t1834 = load ptr, ptr %next_tok
  %t1835 = getelementptr inbounds %Token, ptr %t1834, i32 0, i32 0
  %t1836 = load i32, ptr %t1835
  %t1837 = icmp eq i32 %t1836, 5
  %t1838 = load ptr, ptr %next_tok
  %t1839 = getelementptr inbounds %Token, ptr %t1838, i32 0, i32 1
  %t1840 = load ptr, ptr %t1839
  %t1841 = getelementptr inbounds [2 x i8], ptr @.str.s189, i64 0, i64 0
  %t1842 = call i32 @str_equals(ptr %t1840, ptr %t1841)
  %t1843 = icmp eq i32 %t1842, 1
  %t1844 = and i1 %t1837, %t1843
  br i1 %t1844, label %label_744, label %label_746
label_744:
  %t1845 = call ptr @create_node(i32 28)
  store ptr %t1845, ptr %struct_lit
  %t1846 = load ptr, ptr %struct_lit
  %t1847 = load ptr, ptr %curr
  %t1848 = getelementptr inbounds %Token, ptr %t1847, i32 0, i32 1
  %t1849 = load ptr, ptr %t1848
  %t1850 = getelementptr inbounds %ASTNode, ptr %t1846, i32 0, i32 1
  store ptr %t1849, ptr %t1850
  %t1851 = load ptr, ptr %p
  call void @parser_advance(ptr %t1851)
  %t1852 = load ptr, ptr %p
  %t1853 = getelementptr inbounds [2 x i8], ptr @.str.s190, i64 0, i64 0
  %t1854 = getelementptr inbounds [15 x i8], ptr @.str.s191, i64 0, i64 0
  call void @parser_expect_val(ptr %t1852, i32 5, ptr %t1853, ptr %t1854)
  %t1855 = getelementptr inbounds [1 x i8], ptr @.str.s192, i64 0, i64 0
  store ptr %t1855, ptr %last_field
  br label %label_747
label_747:
  %t1856 = load ptr, ptr %p
  %t1857 = getelementptr inbounds [2 x i8], ptr @.str.s193, i64 0, i64 0
  %t1858 = call i1 @parser_check_val(ptr %t1856, i32 5, ptr %t1857)
  %t1859 = icmp eq i1 %t1858, 0
  br i1 %t1859, label %label_748, label %label_749
label_748:
  %t1860 = call ptr @create_node(i32 31)
  store ptr %t1860, ptr %field
  %t1861 = load ptr, ptr %p
  %t1862 = call ptr @parser_current(ptr %t1861)
  store ptr %t1862, ptr %field_tok
  %t1863 = load ptr, ptr %field
  %t1864 = load ptr, ptr %field_tok
  %t1865 = getelementptr inbounds %Token, ptr %t1864, i32 0, i32 1
  %t1866 = load ptr, ptr %t1865
  %t1867 = getelementptr inbounds %ASTNode, ptr %t1863, i32 0, i32 1
  store ptr %t1866, ptr %t1867
  %t1868 = load ptr, ptr %p
  %t1869 = getelementptr inbounds [21 x i8], ptr @.str.s194, i64 0, i64 0
  call void @parser_expect(ptr %t1868, i32 4, ptr %t1869)
  %t1870 = load ptr, ptr %p
  %t1871 = getelementptr inbounds [2 x i8], ptr @.str.s195, i64 0, i64 0
  %t1872 = getelementptr inbounds [15 x i8], ptr @.str.s196, i64 0, i64 0
  call void @parser_expect_val(ptr %t1870, i32 5, ptr %t1871, ptr %t1872)
  %t1873 = load ptr, ptr %field
  %t1874 = load ptr, ptr %p
  %t1875 = call ptr @parse_expression(ptr %t1874, i32 0)
  %t1876 = call ptr @node_to_ptr(ptr %t1875)
  %t1877 = getelementptr inbounds %ASTNode, ptr %t1873, i32 0, i32 5
  store ptr %t1876, ptr %t1877
  %t1878 = load ptr, ptr %struct_lit
  %t1879 = getelementptr inbounds %ASTNode, ptr %t1878, i32 0, i32 5
  %t1880 = load ptr, ptr %t1879
  %t1881 = getelementptr inbounds [1 x i8], ptr @.str.s197, i64 0, i64 0
  %t1882 = call i32 @str_equals(ptr %t1880, ptr %t1881)
  %t1883 = icmp eq i32 %t1882, 1
  br i1 %t1883, label %label_750, label %label_751
label_750:
  %t1884 = load ptr, ptr %struct_lit
  %t1885 = load ptr, ptr %field
  %t1886 = call ptr @node_to_ptr(ptr %t1885)
  %t1887 = getelementptr inbounds %ASTNode, ptr %t1884, i32 0, i32 5
  store ptr %t1886, ptr %t1887
  br label %label_752
label_751:
  %t1888 = load ptr, ptr %last_field
  %t1889 = call ptr @ptr_to_node(ptr %t1888)
  store ptr %t1889, ptr %last
  %t1890 = load ptr, ptr %last
  %t1891 = load ptr, ptr %field
  %t1892 = call ptr @node_to_ptr(ptr %t1891)
  %t1893 = getelementptr inbounds %ASTNode, ptr %t1890, i32 0, i32 8
  store ptr %t1892, ptr %t1893
  br label %label_752
label_752:
  %t1894 = load ptr, ptr %field
  %t1895 = call ptr @node_to_ptr(ptr %t1894)
  store ptr %t1895, ptr %last_field
  %t1896 = load ptr, ptr %p
  %t1897 = getelementptr inbounds [2 x i8], ptr @.str.s198, i64 0, i64 0
  %t1898 = call i1 @parser_match_val(ptr %t1896, i32 5, ptr %t1897)
  br label %label_747
label_749:
  %t1899 = load ptr, ptr %p
  %t1900 = getelementptr inbounds [2 x i8], ptr @.str.s199, i64 0, i64 0
  %t1901 = getelementptr inbounds [15 x i8], ptr @.str.s200, i64 0, i64 0
  call void @parser_expect_val(ptr %t1899, i32 5, ptr %t1900, ptr %t1901)
  %t1902 = load ptr, ptr %struct_lit
  ret ptr %t1902
label_746:
  br label %label_743
label_743:
  %t1903 = load ptr, ptr %curr
  %t1904 = getelementptr inbounds %Token, ptr %t1903, i32 0, i32 0
  %t1905 = load i32, ptr %t1904
  %t1906 = icmp eq i32 %t1905, 4
  br i1 %t1906, label %label_753, label %label_755
label_753:
  %t1907 = call ptr @create_node(i32 23)
  store ptr %t1907, ptr %ident
  %t1908 = load ptr, ptr %ident
  %t1909 = load ptr, ptr %curr
  %t1910 = getelementptr inbounds %Token, ptr %t1909, i32 0, i32 1
  %t1911 = load ptr, ptr %t1910
  %t1912 = getelementptr inbounds %ASTNode, ptr %t1908, i32 0, i32 1
  store ptr %t1911, ptr %t1912
  %t1913 = load ptr, ptr %p
  call void @parser_advance(ptr %t1913)
  %t1914 = load ptr, ptr %ident
  store ptr %t1914, ptr %expr
  store i1 1, ptr %is_looping
  br label %label_756
label_756:
  %t1915 = load i1, ptr %is_looping
  br i1 %t1915, label %label_757, label %label_758
label_757:
  %t1916 = load ptr, ptr %p
  %t1917 = getelementptr inbounds [2 x i8], ptr @.str.s201, i64 0, i64 0
  %t1918 = call i1 @parser_match_val(ptr %t1916, i32 5, ptr %t1917)
  br i1 %t1918, label %label_759, label %label_760
label_759:
  %t1919 = call ptr @create_node(i32 24)
  store ptr %t1919, ptr %call
  %t1920 = load ptr, ptr %call
  %t1921 = load ptr, ptr %expr
  %t1922 = call ptr @node_to_ptr(ptr %t1921)
  %t1923 = getelementptr inbounds %ASTNode, ptr %t1920, i32 0, i32 5
  store ptr %t1922, ptr %t1923
  %t1924 = getelementptr inbounds [1 x i8], ptr @.str.s202, i64 0, i64 0
  store ptr %t1924, ptr %last_arg
  %t1925 = load ptr, ptr %p
  %t1926 = getelementptr inbounds [2 x i8], ptr @.str.s203, i64 0, i64 0
  %t1927 = call i1 @parser_check_val(ptr %t1925, i32 5, ptr %t1926)
  %t1928 = icmp eq i1 %t1927, 0
  br i1 %t1928, label %label_762, label %label_764
label_762:
  store i1 1, ptr %is_arg_looping
  br label %label_765
label_765:
  %t1929 = load i1, ptr %is_arg_looping
  br i1 %t1929, label %label_766, label %label_767
label_766:
  %t1930 = load ptr, ptr %p
  %t1931 = call ptr @parse_expression(ptr %t1930, i32 0)
  store ptr %t1931, ptr %arg
  %t1932 = load ptr, ptr %call
  %t1933 = getelementptr inbounds %ASTNode, ptr %t1932, i32 0, i32 6
  %t1934 = load ptr, ptr %t1933
  %t1935 = getelementptr inbounds [1 x i8], ptr @.str.s204, i64 0, i64 0
  %t1936 = call i32 @str_equals(ptr %t1934, ptr %t1935)
  %t1937 = icmp eq i32 %t1936, 1
  br i1 %t1937, label %label_768, label %label_769
label_768:
  %t1938 = load ptr, ptr %call
  %t1939 = load ptr, ptr %arg
  %t1940 = call ptr @node_to_ptr(ptr %t1939)
  %t1941 = getelementptr inbounds %ASTNode, ptr %t1938, i32 0, i32 6
  store ptr %t1940, ptr %t1941
  br label %label_770
label_769:
  %t1942 = load ptr, ptr %last_arg
  %t1943 = call ptr @ptr_to_node(ptr %t1942)
  store ptr %t1943, ptr %last
  %t1944 = load ptr, ptr %last
  %t1945 = load ptr, ptr %arg
  %t1946 = call ptr @node_to_ptr(ptr %t1945)
  %t1947 = getelementptr inbounds %ASTNode, ptr %t1944, i32 0, i32 8
  store ptr %t1946, ptr %t1947
  br label %label_770
label_770:
  %t1948 = load ptr, ptr %arg
  %t1949 = call ptr @node_to_ptr(ptr %t1948)
  store ptr %t1949, ptr %last_arg
  %t1950 = load ptr, ptr %p
  %t1951 = getelementptr inbounds [2 x i8], ptr @.str.s205, i64 0, i64 0
  %t1952 = call i1 @parser_match_val(ptr %t1950, i32 5, ptr %t1951)
  %t1953 = icmp eq i1 %t1952, 0
  br i1 %t1953, label %label_771, label %label_773
label_771:
  store i1 0, ptr %is_arg_looping
  br label %label_773
label_773:
  br label %label_765
label_767:
  br label %label_764
label_764:
  %t1954 = load ptr, ptr %p
  %t1955 = getelementptr inbounds [2 x i8], ptr @.str.s206, i64 0, i64 0
  %t1956 = getelementptr inbounds [14 x i8], ptr @.str.s207, i64 0, i64 0
  call void @parser_expect_val(ptr %t1954, i32 5, ptr %t1955, ptr %t1956)
  %t1957 = load ptr, ptr %call
  store ptr %t1957, ptr %expr
  br label %label_761
label_760:
  %t1958 = load ptr, ptr %p
  %t1959 = getelementptr inbounds [2 x i8], ptr @.str.s208, i64 0, i64 0
  %t1960 = call i1 @parser_match_val(ptr %t1958, i32 5, ptr %t1959)
  br i1 %t1960, label %label_774, label %label_775
label_774:
  %t1961 = call ptr @create_node(i32 26)
  store ptr %t1961, ptr %index_node
  %t1962 = load ptr, ptr %index_node
  %t1963 = load ptr, ptr %expr
  %t1964 = call ptr @node_to_ptr(ptr %t1963)
  %t1965 = getelementptr inbounds %ASTNode, ptr %t1962, i32 0, i32 5
  store ptr %t1964, ptr %t1965
  %t1966 = load ptr, ptr %index_node
  %t1967 = load ptr, ptr %p
  %t1968 = call ptr @parse_expression(ptr %t1967, i32 0)
  %t1969 = call ptr @node_to_ptr(ptr %t1968)
  %t1970 = getelementptr inbounds %ASTNode, ptr %t1966, i32 0, i32 6
  store ptr %t1969, ptr %t1970
  %t1971 = load ptr, ptr %p
  %t1972 = getelementptr inbounds [2 x i8], ptr @.str.s209, i64 0, i64 0
  %t1973 = getelementptr inbounds [12 x i8], ptr @.str.s210, i64 0, i64 0
  call void @parser_expect_val(ptr %t1971, i32 5, ptr %t1972, ptr %t1973)
  %t1974 = load ptr, ptr %index_node
  store ptr %t1974, ptr %expr
  br label %label_776
label_775:
  %t1975 = load ptr, ptr %p
  %t1976 = getelementptr inbounds [2 x i8], ptr @.str.s211, i64 0, i64 0
  %t1977 = call i1 @parser_match_val(ptr %t1975, i32 5, ptr %t1976)
  br i1 %t1977, label %label_777, label %label_778
label_777:
  %t1978 = call ptr @create_node(i32 25)
  store ptr %t1978, ptr %member_node
  %t1979 = load ptr, ptr %member_node
  %t1980 = load ptr, ptr %expr
  %t1981 = call ptr @node_to_ptr(ptr %t1980)
  %t1982 = getelementptr inbounds %ASTNode, ptr %t1979, i32 0, i32 5
  store ptr %t1981, ptr %t1982
  %t1983 = load ptr, ptr %p
  %t1984 = call ptr @parser_current(ptr %t1983)
  store ptr %t1984, ptr %curr_mem
  %t1985 = load ptr, ptr %member_node
  %t1986 = load ptr, ptr %curr_mem
  %t1987 = getelementptr inbounds %Token, ptr %t1986, i32 0, i32 1
  %t1988 = load ptr, ptr %t1987
  %t1989 = getelementptr inbounds %ASTNode, ptr %t1985, i32 0, i32 1
  store ptr %t1988, ptr %t1989
  %t1990 = load ptr, ptr %p
  %t1991 = getelementptr inbounds [12 x i8], ptr @.str.s212, i64 0, i64 0
  call void @parser_expect(ptr %t1990, i32 4, ptr %t1991)
  %t1992 = load ptr, ptr %member_node
  store ptr %t1992, ptr %expr
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
  %t1993 = load ptr, ptr %expr
  ret ptr %t1993
label_755:
  %t1994 = load ptr, ptr %p
  %t1995 = getelementptr inbounds [2 x i8], ptr @.str.s213, i64 0, i64 0
  %t1996 = call i1 @parser_match_val(ptr %t1994, i32 5, ptr %t1995)
  br i1 %t1996, label %label_780, label %label_782
label_780:
  %t1997 = load ptr, ptr %p
  %t1998 = call ptr @parse_expression(ptr %t1997, i32 0)
  store ptr %t1998, ptr %expr_inner
  %t1999 = load ptr, ptr %p
  %t2000 = getelementptr inbounds [2 x i8], ptr @.str.s214, i64 0, i64 0
  %t2001 = getelementptr inbounds [25 x i8], ptr @.str.s215, i64 0, i64 0
  call void @parser_expect_val(ptr %t1999, i32 5, ptr %t2000, ptr %t2001)
  %t2002 = load ptr, ptr %expr_inner
  ret ptr %t2002
label_782:
  %t2003 = load ptr, ptr %p
  %t2004 = getelementptr inbounds [2 x i8], ptr @.str.s216, i64 0, i64 0
  %t2005 = call i1 @parser_match_val(ptr %t2003, i32 5, ptr %t2004)
  br i1 %t2005, label %label_783, label %label_785
label_783:
  %t2006 = call ptr @create_node(i32 27)
  store ptr %t2006, ptr %array_lit
  %t2007 = getelementptr inbounds [1 x i8], ptr @.str.s217, i64 0, i64 0
  store ptr %t2007, ptr %last_elem
  %t2008 = load ptr, ptr %p
  %t2009 = getelementptr inbounds [2 x i8], ptr @.str.s218, i64 0, i64 0
  %t2010 = call i1 @parser_check_val(ptr %t2008, i32 5, ptr %t2009)
  %t2011 = icmp eq i1 %t2010, 0
  br i1 %t2011, label %label_786, label %label_788
label_786:
  store i1 1, ptr %is_looping
  br label %label_789
label_789:
  %t2012 = load i1, ptr %is_looping
  br i1 %t2012, label %label_790, label %label_791
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
  %t2059 = call ptr @create_node(i32 0)
  store ptr %t2059, ptr %module
  %t2060 = getelementptr inbounds [1 x i8], ptr @.str.s226, i64 0, i64 0
  store ptr %t2060, ptr %last_stmt
  store i1 1, ptr %is_looping
  br label %label_798
label_798:
  %t2061 = load i1, ptr %is_looping
  br i1 %t2061, label %label_799, label %label_800
label_799:
  %t2062 = load ptr, ptr %p
  %t2063 = call ptr @parser_current(ptr %t2062)
  store ptr %t2063, ptr %curr
  %t2064 = load ptr, ptr %curr
  %t2065 = getelementptr inbounds %Token, ptr %t2064, i32 0, i32 0
  %t2066 = load i32, ptr %t2065
  %t2067 = icmp eq i32 %t2066, 18
  br i1 %t2067, label %label_801, label %label_802
label_801:
  store i1 0, ptr %is_looping
  br label %label_803
label_802:
  %t2068 = load ptr, ptr %p
  %t2069 = call ptr @parse_declaration(ptr %t2068)
  store ptr %t2069, ptr %stmt
  %t2070 = load ptr, ptr %module
  %t2071 = getelementptr inbounds %ASTNode, ptr %t2070, i32 0, i32 5
  %t2072 = load ptr, ptr %t2071
  %t2073 = getelementptr inbounds [1 x i8], ptr @.str.s227, i64 0, i64 0
  %t2074 = call i32 @str_equals(ptr %t2072, ptr %t2073)
  %t2075 = icmp eq i32 %t2074, 1
  br i1 %t2075, label %label_804, label %label_805
label_804:
  %t2076 = load ptr, ptr %module
  %t2077 = load ptr, ptr %stmt
  %t2078 = call ptr @node_to_ptr(ptr %t2077)
  %t2079 = getelementptr inbounds %ASTNode, ptr %t2076, i32 0, i32 5
  store ptr %t2078, ptr %t2079
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
  %t2141 = load ptr, ptr %tn
  %t2142 = getelementptr inbounds %ASTNode, ptr %t2141, i32 0, i32 3
  %t2143 = load i32, ptr %t2142
  %t2144 = icmp eq i32 %t2143, 1
  br i1 %t2144, label %label_825, label %label_827
label_825:
  %t2145 = load ptr, ptr %tn
  %t2146 = getelementptr inbounds %ASTNode, ptr %t2145, i32 0, i32 5
  %t2147 = load ptr, ptr %t2146
  %t2148 = getelementptr inbounds [1 x i8], ptr @.str.s242, i64 0, i64 0
  %t2149 = call i32 @str_equals(ptr %t2147, ptr %t2148)
  %t2150 = icmp eq i32 %t2149, 0
  br i1 %t2150, label %label_828, label %label_830
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
  %t2188 = load ptr, ptr %first_ptr
  store ptr %t2188, ptr %curr
  br label %label_843
label_843:
  %t2189 = load ptr, ptr %curr
  %t2190 = getelementptr inbounds [1 x i8], ptr @.str.s248, i64 0, i64 0
  %t2191 = call i32 @str_equals(ptr %t2189, ptr %t2190)
  %t2192 = icmp eq i32 %t2191, 0
  br i1 %t2192, label %label_844, label %label_845
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
  %t2208 = load ptr, ptr %ret_child
  %t2209 = getelementptr inbounds [1 x i8], ptr @.str.s250, i64 0, i64 0
  %t2210 = call i32 @str_equals(ptr %t2208, ptr %t2209)
  %t2211 = icmp eq i32 %t2210, 0
  br i1 %t2211, label %label_846, label %label_848
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
  %t2225 = load ptr, ptr %expr
  %t2226 = getelementptr inbounds %ASTNode, ptr %t2225, i32 0, i32 0
  %t2227 = load i32, ptr %t2226
  %t2228 = icmp eq i32 %t2227, 22
  br i1 %t2228, label %label_849, label %label_851
label_849:
  %t2229 = load ptr, ptr %expr
  %t2230 = getelementptr inbounds %ASTNode, ptr %t2229, i32 0, i32 3
  %t2231 = load i32, ptr %t2230
  %t2232 = icmp eq i32 %t2231, 2
  br i1 %t2232, label %label_852, label %label_854
label_852:
  %t2233 = getelementptr inbounds [4 x i8], ptr @.str.s252, i64 0, i64 0
  ret ptr %t2233
label_854:
  %t2234 = load ptr, ptr %expr
  %t2235 = getelementptr inbounds %ASTNode, ptr %t2234, i32 0, i32 3
  %t2236 = load i32, ptr %t2235
  %t2237 = icmp eq i32 %t2236, 3
  br i1 %t2237, label %label_855, label %label_857
label_855:
  %t2238 = getelementptr inbounds [3 x i8], ptr @.str.s253, i64 0, i64 0
  ret ptr %t2238
label_857:
  %t2239 = load ptr, ptr %expr
  %t2240 = getelementptr inbounds %ASTNode, ptr %t2239, i32 0, i32 3
  %t2241 = load i32, ptr %t2240
  %t2242 = icmp eq i32 %t2241, 1
  br i1 %t2242, label %label_858, label %label_860
label_858:
  %t2243 = getelementptr inbounds [3 x i8], ptr @.str.s254, i64 0, i64 0
  ret ptr %t2243
label_860:
  %t2244 = load ptr, ptr %expr
  %t2245 = getelementptr inbounds %ASTNode, ptr %t2244, i32 0, i32 3
  %t2246 = load i32, ptr %t2245
  %t2247 = icmp eq i32 %t2246, 0
  br i1 %t2247, label %label_861, label %label_863
label_861:
  %t2248 = getelementptr inbounds [4 x i8], ptr @.str.s255, i64 0, i64 0
  ret ptr %t2248
label_863:
  br label %label_851
label_851:
  %t2249 = load ptr, ptr %expr
  %t2250 = getelementptr inbounds %ASTNode, ptr %t2249, i32 0, i32 0
  %t2251 = load i32, ptr %t2250
  %t2252 = icmp eq i32 %t2251, 23
  br i1 %t2252, label %label_864, label %label_866
label_864:
  %t2253 = load ptr, ptr %expr
  %t2254 = getelementptr inbounds %ASTNode, ptr %t2253, i32 0, i32 1
  %t2255 = load ptr, ptr %t2254
  %t2256 = call ptr @ir_get_var_type(ptr %t2255)
  ret ptr %t2256
label_866:
  %t2257 = load ptr, ptr %expr
  %t2258 = getelementptr inbounds %ASTNode, ptr %t2257, i32 0, i32 0
  %t2259 = load i32, ptr %t2258
  %t2260 = icmp eq i32 %t2259, 20
  br i1 %t2260, label %label_867, label %label_869
label_867:
  %t2261 = load ptr, ptr %expr
  %t2262 = getelementptr inbounds %ASTNode, ptr %t2261, i32 0, i32 1
  %t2263 = load ptr, ptr %t2262
  store ptr %t2263, ptr %op
  %t2264 = load ptr, ptr %op
  %t2265 = getelementptr inbounds [3 x i8], ptr @.str.s256, i64 0, i64 0
  %t2266 = call i32 @str_equals(ptr %t2264, ptr %t2265)
  %t2267 = icmp eq i32 %t2266, 1
  %t2268 = load ptr, ptr %op
  %t2269 = getelementptr inbounds [3 x i8], ptr @.str.s257, i64 0, i64 0
  %t2270 = call i32 @str_equals(ptr %t2268, ptr %t2269)
  %t2271 = icmp eq i32 %t2270, 1
  %t2272 = or i1 %t2267, %t2271
  br i1 %t2272, label %label_870, label %label_872
label_870:
  %t2273 = getelementptr inbounds [3 x i8], ptr @.str.s258, i64 0, i64 0
  ret ptr %t2273
label_872:
  %t2274 = load ptr, ptr %op
  %t2275 = getelementptr inbounds [2 x i8], ptr @.str.s259, i64 0, i64 0
  %t2276 = call i32 @str_equals(ptr %t2274, ptr %t2275)
  %t2277 = icmp eq i32 %t2276, 1
  %t2278 = load ptr, ptr %op
  %t2279 = getelementptr inbounds [3 x i8], ptr @.str.s260, i64 0, i64 0
  %t2280 = call i32 @str_equals(ptr %t2278, ptr %t2279)
  %t2281 = icmp eq i32 %t2280, 1
  %t2282 = or i1 %t2277, %t2281
  br i1 %t2282, label %label_873, label %label_875
label_873:
  %t2283 = getelementptr inbounds [3 x i8], ptr @.str.s261, i64 0, i64 0
  ret ptr %t2283
label_875:
  %t2284 = load ptr, ptr %op
  %t2285 = getelementptr inbounds [2 x i8], ptr @.str.s262, i64 0, i64 0
  %t2286 = call i32 @str_equals(ptr %t2284, ptr %t2285)
  %t2287 = icmp eq i32 %t2286, 1
  %t2288 = load ptr, ptr %op
  %t2289 = getelementptr inbounds [3 x i8], ptr @.str.s263, i64 0, i64 0
  %t2290 = call i32 @str_equals(ptr %t2288, ptr %t2289)
  %t2291 = icmp eq i32 %t2290, 1
  %t2292 = or i1 %t2287, %t2291
  br i1 %t2292, label %label_876, label %label_878
label_876:
  %t2293 = getelementptr inbounds [3 x i8], ptr @.str.s264, i64 0, i64 0
  ret ptr %t2293
label_878:
  %t2294 = load ptr, ptr %op
  %t2295 = getelementptr inbounds [4 x i8], ptr @.str.s265, i64 0, i64 0
  %t2296 = call i32 @str_equals(ptr %t2294, ptr %t2295)
  %t2297 = icmp eq i32 %t2296, 1
  %t2298 = load ptr, ptr %op
  %t2299 = getelementptr inbounds [3 x i8], ptr @.str.s266, i64 0, i64 0
  %t2300 = call i32 @str_equals(ptr %t2298, ptr %t2299)
  %t2301 = icmp eq i32 %t2300, 1
  %t2302 = or i1 %t2297, %t2301
  br i1 %t2302, label %label_879, label %label_881
label_879:
  %t2303 = getelementptr inbounds [3 x i8], ptr @.str.s267, i64 0, i64 0
  ret ptr %t2303
label_881:
  %t2304 = load ptr, ptr %expr
  %t2305 = getelementptr inbounds %ASTNode, ptr %t2304, i32 0, i32 5
  %t2306 = load ptr, ptr %t2305
  %t2307 = call ptr @ptr_to_node(ptr %t2306)
  %t2308 = call ptr @get_expr_type(ptr %t2307)
  ret ptr %t2308
label_869:
  %t2309 = load ptr, ptr %expr
  %t2310 = getelementptr inbounds %ASTNode, ptr %t2309, i32 0, i32 0
  %t2311 = load i32, ptr %t2310
  %t2312 = icmp eq i32 %t2311, 24
  br i1 %t2312, label %label_882, label %label_884
label_882:
  %t2313 = load ptr, ptr %expr
  %t2314 = getelementptr inbounds %ASTNode, ptr %t2313, i32 0, i32 5
  %t2315 = load ptr, ptr %t2314
  %t2316 = call ptr @ptr_to_node(ptr %t2315)
  store ptr %t2316, ptr %callee
  %t2317 = load ptr, ptr %callee
  %t2318 = getelementptr inbounds %ASTNode, ptr %t2317, i32 0, i32 1
  %t2319 = load ptr, ptr %t2318
  store ptr %t2319, ptr %func_name
  %t2320 = load ptr, ptr %func_name
  %t2321 = getelementptr inbounds [6 x i8], ptr @.str.s268, i64 0, i64 0
  %t2322 = call i32 @str_equals(ptr %t2320, ptr %t2321)
  %t2323 = icmp eq i32 %t2322, 1
  %t2324 = load ptr, ptr %func_name
  %t2325 = getelementptr inbounds [8 x i8], ptr @.str.s269, i64 0, i64 0
  %t2326 = call i32 @str_equals(ptr %t2324, ptr %t2325)
  %t2327 = icmp eq i32 %t2326, 1
  %t2328 = or i1 %t2323, %t2327
  br i1 %t2328, label %label_885, label %label_887
label_885:
  %t2329 = getelementptr inbounds [5 x i8], ptr @.str.s270, i64 0, i64 0
  ret ptr %t2329
label_887:
  %t2330 = load ptr, ptr %func_name
  %t2331 = getelementptr inbounds [10 x i8], ptr @.str.s271, i64 0, i64 0
  %t2332 = call i32 @str_equals(ptr %t2330, ptr %t2331)
  %t2333 = icmp eq i32 %t2332, 1
  %t2334 = load ptr, ptr %func_name
  %t2335 = getelementptr inbounds [12 x i8], ptr @.str.s272, i64 0, i64 0
  %t2336 = call i32 @str_equals(ptr %t2334, ptr %t2335)
  %t2337 = icmp eq i32 %t2336, 1
  %t2338 = or i1 %t2333, %t2337
  br i1 %t2338, label %label_888, label %label_890
label_888:
  %t2339 = getelementptr inbounds [5 x i8], ptr @.str.s273, i64 0, i64 0
  ret ptr %t2339
label_890:
  %t2340 = load ptr, ptr %func_name
  %t2341 = getelementptr inbounds [13 x i8], ptr @.str.s274, i64 0, i64 0
  %t2342 = call i32 @str_equals(ptr %t2340, ptr %t2341)
  %t2343 = icmp eq i32 %t2342, 1
  %t2344 = load ptr, ptr %func_name
  %t2345 = getelementptr inbounds [11 x i8], ptr @.str.s275, i64 0, i64 0
  %t2346 = call i32 @str_equals(ptr %t2344, ptr %t2345)
  %t2347 = icmp eq i32 %t2346, 1
  %t2348 = or i1 %t2343, %t2347
  br i1 %t2348, label %label_891, label %label_893
label_891:
  %t2349 = getelementptr inbounds [5 x i8], ptr @.str.s276, i64 0, i64 0
  ret ptr %t2349
label_893:
  %t2350 = load ptr, ptr %func_name
  %t2351 = getelementptr inbounds [13 x i8], ptr @.str.s277, i64 0, i64 0
  %t2352 = call i32 @str_equals(ptr %t2350, ptr %t2351)
  %t2353 = icmp eq i32 %t2352, 1
  %t2354 = load ptr, ptr %func_name
  %t2355 = getelementptr inbounds [11 x i8], ptr @.str.s278, i64 0, i64 0
  %t2356 = call i32 @str_equals(ptr %t2354, ptr %t2355)
  %t2357 = icmp eq i32 %t2356, 1
  %t2358 = or i1 %t2353, %t2357
  br i1 %t2358, label %label_894, label %label_896
label_894:
  %t2359 = getelementptr inbounds [5 x i8], ptr @.str.s279, i64 0, i64 0
  ret ptr %t2359
label_896:
  %t2360 = load ptr, ptr %func_name
  %t2361 = call ptr @fn_key(ptr %t2360)
  %t2362 = call ptr @ir_get_var_type(ptr %t2361)
  ret ptr %t2362
label_884:
  %t2363 = load ptr, ptr %expr
  %t2364 = getelementptr inbounds %ASTNode, ptr %t2363, i32 0, i32 0
  %t2365 = load i32, ptr %t2364
  %t2366 = icmp eq i32 %t2365, 26
  br i1 %t2366, label %label_897, label %label_899
label_897:
  %t2367 = load ptr, ptr %expr
  %t2368 = getelementptr inbounds %ASTNode, ptr %t2367, i32 0, i32 5
  %t2369 = load ptr, ptr %t2368
  %t2370 = call ptr @ptr_to_node(ptr %t2369)
  %t2371 = call ptr @get_expr_type(ptr %t2370)
  store ptr %t2371, ptr %obj_type
  %t2372 = load ptr, ptr %obj_type
  %t2373 = getelementptr inbounds [7 x i8], ptr @.str.s280, i64 0, i64 0
  %t2374 = call i32 @str_equals(ptr %t2372, ptr %t2373)
  %t2375 = icmp eq i32 %t2374, 1
  br i1 %t2375, label %label_900, label %label_902
label_900:
  %t2376 = getelementptr inbounds [4 x i8], ptr @.str.s281, i64 0, i64 0
  ret ptr %t2376
label_902:
  %t2377 = getelementptr inbounds [4 x i8], ptr @.str.s282, i64 0, i64 0
  ret ptr %t2377
label_899:
  %t2378 = load ptr, ptr %expr
  %t2379 = getelementptr inbounds %ASTNode, ptr %t2378, i32 0, i32 0
  %t2380 = load i32, ptr %t2379
  %t2381 = icmp eq i32 %t2380, 25
  br i1 %t2381, label %label_903, label %label_905
label_903:
  %t2382 = load ptr, ptr %expr
  %t2383 = getelementptr inbounds %ASTNode, ptr %t2382, i32 0, i32 5
  %t2384 = load ptr, ptr %t2383
  %t2385 = call ptr @ptr_to_node(ptr %t2384)
  store ptr %t2385, ptr %object_node
  %t2386 = load ptr, ptr %object_node
  %t2387 = getelementptr inbounds %ASTNode, ptr %t2386, i32 0, i32 0
  %t2388 = load i32, ptr %t2387
  %t2389 = icmp eq i32 %t2388, 23
  br i1 %t2389, label %label_906, label %label_908
label_906:
  %t2390 = load ptr, ptr %object_node
  %t2391 = getelementptr inbounds %ASTNode, ptr %t2390, i32 0, i32 1
  %t2392 = load ptr, ptr %t2391
  %t2393 = load ptr, ptr %expr
  %t2394 = getelementptr inbounds %ASTNode, ptr %t2393, i32 0, i32 1
  %t2395 = load ptr, ptr %t2394
  %t2396 = call i32 @ir_get_enum_variant(ptr %t2392, ptr %t2395)
  store i32 %t2396, ptr %enum_val
  %t2397 = load i32, ptr %enum_val
  %t2398 = icmp sge i32 %t2397, 0
  br i1 %t2398, label %label_909, label %label_911
label_909:
  %t2399 = getelementptr inbounds [4 x i8], ptr @.str.s283, i64 0, i64 0
  ret ptr %t2399
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
  %t2495 = load ptr, ptr %expr
  %t2496 = getelementptr inbounds %ASTNode, ptr %t2495, i32 0, i32 0
  %t2497 = load i32, ptr %t2496
  %t2498 = icmp eq i32 %t2497, 22
  br i1 %t2498, label %label_921, label %label_923
label_921:
  %t2499 = load ptr, ptr %expr
  %t2500 = getelementptr inbounds %ASTNode, ptr %t2499, i32 0, i32 3
  %t2501 = load i32, ptr %t2500
  %t2502 = icmp eq i32 %t2501, 2
  br i1 %t2502, label %label_924, label %label_926
label_924:
  %t2503 = load ptr, ptr %expr
  %t2504 = getelementptr inbounds %ASTNode, ptr %t2503, i32 0, i32 1
  %t2505 = load ptr, ptr %t2504
  ret ptr %t2505
label_926:
  %t2506 = load ptr, ptr %expr
  %t2507 = getelementptr inbounds %ASTNode, ptr %t2506, i32 0, i32 3
  %t2508 = load i32, ptr %t2507
  %t2509 = icmp eq i32 %t2508, 3
  br i1 %t2509, label %label_927, label %label_929
label_927:
  %t2510 = load ptr, ptr %expr
  %t2511 = getelementptr inbounds %ASTNode, ptr %t2510, i32 0, i32 1
  %t2512 = load ptr, ptr %t2511
  %t2513 = getelementptr inbounds [5 x i8], ptr @.str.s287, i64 0, i64 0
  %t2514 = call i32 @str_equals(ptr %t2512, ptr %t2513)
  %t2515 = icmp eq i32 %t2514, 1
  br i1 %t2515, label %label_930, label %label_932
label_930:
  %t2516 = getelementptr inbounds [2 x i8], ptr @.str.s288, i64 0, i64 0
  ret ptr %t2516
label_932:
  %t2517 = getelementptr inbounds [2 x i8], ptr @.str.s289, i64 0, i64 0
  ret ptr %t2517
label_929:
  %t2518 = load ptr, ptr %expr
  %t2519 = getelementptr inbounds %ASTNode, ptr %t2518, i32 0, i32 3
  %t2520 = load i32, ptr %t2519
  %t2521 = icmp eq i32 %t2520, 1
  br i1 %t2521, label %label_933, label %label_935
label_933:
  %t2522 = load ptr, ptr %expr
  %t2523 = getelementptr inbounds %ASTNode, ptr %t2522, i32 0, i32 1
  %t2524 = load ptr, ptr %t2523
  ret ptr %t2524
label_935:
  %t2525 = load ptr, ptr %expr
  %t2526 = getelementptr inbounds %ASTNode, ptr %t2525, i32 0, i32 3
  %t2527 = load i32, ptr %t2526
  %t2528 = icmp eq i32 %t2527, 0
  br i1 %t2528, label %label_936, label %label_938
label_936:
  %t2529 = load ptr, ptr %expr
  %t2530 = getelementptr inbounds %ASTNode, ptr %t2529, i32 0, i32 2
  %t2531 = load ptr, ptr %t2530
  store ptr %t2531, ptr %str_name
  %t2532 = load ptr, ptr %expr
  %t2533 = getelementptr inbounds %ASTNode, ptr %t2532, i32 0, i32 1
  %t2534 = load ptr, ptr %t2533
  %t2535 = call i32 @str_length(ptr %t2534)
  store i32 %t2535, ptr %str_len
  %t2536 = load i32, ptr %str_len
  %t2537 = add i32 %t2536, 1
  store i32 %t2537, ptr %len_plus_one
  %t2538 = call i32 @ir_get_temp()
  store i32 %t2538, ptr %temp
  %t2539 = load i32, ptr %temp
  %t2540 = call ptr @ir_get_temp_name(i32 %t2539)
  store ptr %t2540, ptr %tname
  %t2541 = getelementptr inbounds [3 x i8], ptr @.str.s290, i64 0, i64 0
  call void @ir_append(ptr %t2541)
  %t2542 = load ptr, ptr %tname
  call void @ir_append(ptr %t2542)
  %t2543 = getelementptr inbounds [28 x i8], ptr @.str.s291, i64 0, i64 0
  call void @ir_append(ptr %t2543)
  %t2544 = load i32, ptr %len_plus_one
  %t2545 = call ptr @int_to_str(i32 %t2544)
  call void @ir_append(ptr %t2545)
  %t2546 = getelementptr inbounds [14 x i8], ptr @.str.s292, i64 0, i64 0
  call void @ir_append(ptr %t2546)
  %t2547 = load ptr, ptr %str_name
  call void @ir_append(ptr %t2547)
  %t2548 = getelementptr inbounds [15 x i8], ptr @.str.s293, i64 0, i64 0
  call void @ir_append_line(ptr %t2548)
  %t2549 = load ptr, ptr %tname
  ret ptr %t2549
label_938:
  br label %label_923
label_923:
  %t2550 = load ptr, ptr %expr
  %t2551 = getelementptr inbounds %ASTNode, ptr %t2550, i32 0, i32 0
  %t2552 = load i32, ptr %t2551
  %t2553 = icmp eq i32 %t2552, 28
  br i1 %t2553, label %label_939, label %label_941
label_939:
  %t2554 = load ptr, ptr %expr
  %t2555 = getelementptr inbounds %ASTNode, ptr %t2554, i32 0, i32 1
  %t2556 = load ptr, ptr %t2555
  store ptr %t2556, ptr %struct_name
  %t2557 = call i32 @ir_get_temp()
  store i32 %t2557, ptr %size_ptr_temp
  %t2558 = load i32, ptr %size_ptr_temp
  %t2559 = call ptr @ir_get_temp_name(i32 %t2558)
  store ptr %t2559, ptr %size_ptr_name
  %t2560 = getelementptr inbounds [3 x i8], ptr @.str.s294, i64 0, i64 0
  call void @ir_append(ptr %t2560)
  %t2561 = load ptr, ptr %size_ptr_name
  call void @ir_append(ptr %t2561)
  %t2562 = getelementptr inbounds [18 x i8], ptr @.str.s295, i64 0, i64 0
  call void @ir_append(ptr %t2562)
  %t2563 = getelementptr inbounds [2 x i8], ptr @.str.s296, i64 0, i64 0
  %t2564 = load ptr, ptr %struct_name
  %t2565 = call ptr @str_concat(ptr %t2563, ptr %t2564)
  call void @ir_append(ptr %t2565)
  %t2566 = getelementptr inbounds [18 x i8], ptr @.str.s297, i64 0, i64 0
  call void @ir_append_line(ptr %t2566)
  %t2567 = call i32 @ir_get_temp()
  store i32 %t2567, ptr %size_temp
  %t2568 = load i32, ptr %size_temp
  %t2569 = call ptr @ir_get_temp_name(i32 %t2568)
  store ptr %t2569, ptr %size_name
  %t2570 = getelementptr inbounds [3 x i8], ptr @.str.s298, i64 0, i64 0
  call void @ir_append(ptr %t2570)
  %t2571 = load ptr, ptr %size_name
  call void @ir_append(ptr %t2571)
  %t2572 = getelementptr inbounds [17 x i8], ptr @.str.s299, i64 0, i64 0
  call void @ir_append(ptr %t2572)
  %t2573 = load ptr, ptr %size_ptr_name
  call void @ir_append(ptr %t2573)
  %t2574 = getelementptr inbounds [8 x i8], ptr @.str.s300, i64 0, i64 0
  call void @ir_append_line(ptr %t2574)
  %t2575 = call i32 @ir_get_temp()
  store i32 %t2575, ptr %mem_temp
  %t2576 = load i32, ptr %mem_temp
  %t2577 = call ptr @ir_get_temp_name(i32 %t2576)
  store ptr %t2577, ptr %mem_name
  %t2578 = getelementptr inbounds [3 x i8], ptr @.str.s301, i64 0, i64 0
  call void @ir_append(ptr %t2578)
  %t2579 = load ptr, ptr %mem_name
  call void @ir_append(ptr %t2579)
  %t2580 = getelementptr inbounds [25 x i8], ptr @.str.s302, i64 0, i64 0
  call void @ir_append(ptr %t2580)
  %t2581 = load ptr, ptr %size_name
  call void @ir_append(ptr %t2581)
  %t2582 = getelementptr inbounds [2 x i8], ptr @.str.s303, i64 0, i64 0
  call void @ir_append_line(ptr %t2582)
  %t2583 = load ptr, ptr %expr
  %t2584 = getelementptr inbounds %ASTNode, ptr %t2583, i32 0, i32 5
  %t2585 = load ptr, ptr %t2584
  store ptr %t2585, ptr %field_ptr
  br label %label_942
label_942:
  %t2586 = load ptr, ptr %field_ptr
  %t2587 = getelementptr inbounds [1 x i8], ptr @.str.s304, i64 0, i64 0
  %t2588 = call i32 @str_equals(ptr %t2586, ptr %t2587)
  %t2589 = icmp eq i32 %t2588, 0
  br i1 %t2589, label %label_943, label %label_944
label_943:
  %t2590 = load ptr, ptr %field_ptr
  %t2591 = call ptr @ptr_to_node(ptr %t2590)
  store ptr %t2591, ptr %field
  %t2592 = load ptr, ptr %field
  %t2593 = getelementptr inbounds %ASTNode, ptr %t2592, i32 0, i32 5
  %t2594 = load ptr, ptr %t2593
  %t2595 = call ptr @ptr_to_node(ptr %t2594)
  %t2596 = call ptr @generate_expression(ptr %t2595)
  store ptr %t2596, ptr %field_val
  %t2597 = load ptr, ptr %struct_name
  %t2598 = load ptr, ptr %field
  %t2599 = getelementptr inbounds %ASTNode, ptr %t2598, i32 0, i32 1
  %t2600 = load ptr, ptr %t2599
  %t2601 = call ptr @ir_get_struct_field_type(ptr %t2597, ptr %t2600)
  %t2602 = call ptr @storage_type(ptr %t2601)
  store ptr %t2602, ptr %field_type
  %t2603 = load ptr, ptr %struct_name
  %t2604 = load ptr, ptr %field
  %t2605 = getelementptr inbounds %ASTNode, ptr %t2604, i32 0, i32 1
  %t2606 = load ptr, ptr %t2605
  %t2607 = call i32 @ir_get_struct_field_index(ptr %t2603, ptr %t2606)
  store i32 %t2607, ptr %field_index
  %t2608 = call i32 @ir_get_temp()
  store i32 %t2608, ptr %gep_temp
  %t2609 = load i32, ptr %gep_temp
  %t2610 = call ptr @ir_get_temp_name(i32 %t2609)
  store ptr %t2610, ptr %gep_name
  %t2611 = getelementptr inbounds [3 x i8], ptr @.str.s305, i64 0, i64 0
  call void @ir_append(ptr %t2611)
  %t2612 = load ptr, ptr %gep_name
  call void @ir_append(ptr %t2612)
  %t2613 = getelementptr inbounds [27 x i8], ptr @.str.s306, i64 0, i64 0
  call void @ir_append(ptr %t2613)
  %t2614 = getelementptr inbounds [2 x i8], ptr @.str.s307, i64 0, i64 0
  %t2615 = load ptr, ptr %struct_name
  %t2616 = call ptr @str_concat(ptr %t2614, ptr %t2615)
  call void @ir_append(ptr %t2616)
  %t2617 = getelementptr inbounds [7 x i8], ptr @.str.s308, i64 0, i64 0
  call void @ir_append(ptr %t2617)
  %t2618 = load ptr, ptr %mem_name
  call void @ir_append(ptr %t2618)
  %t2619 = getelementptr inbounds [14 x i8], ptr @.str.s309, i64 0, i64 0
  call void @ir_append(ptr %t2619)
  %t2620 = load i32, ptr %field_index
  %t2621 = call ptr @int_to_str(i32 %t2620)
  call void @ir_append_line(ptr %t2621)
  %t2622 = getelementptr inbounds [9 x i8], ptr @.str.s310, i64 0, i64 0
  call void @ir_append(ptr %t2622)
  %t2623 = load ptr, ptr %field_type
  call void @ir_append(ptr %t2623)
  %t2624 = getelementptr inbounds [2 x i8], ptr @.str.s311, i64 0, i64 0
  call void @ir_append(ptr %t2624)
  %t2625 = load ptr, ptr %field_val
  call void @ir_append(ptr %t2625)
  %t2626 = getelementptr inbounds [7 x i8], ptr @.str.s312, i64 0, i64 0
  call void @ir_append(ptr %t2626)
  %t2627 = load ptr, ptr %gep_name
  call void @ir_append_line(ptr %t2627)
  %t2628 = load ptr, ptr %field
  %t2629 = getelementptr inbounds %ASTNode, ptr %t2628, i32 0, i32 8
  %t2630 = load ptr, ptr %t2629
  store ptr %t2630, ptr %field_ptr
  br label %label_942
label_944:
  %t2631 = load ptr, ptr %mem_name
  ret ptr %t2631
label_941:
  %t2632 = load ptr, ptr %expr
  %t2633 = getelementptr inbounds %ASTNode, ptr %t2632, i32 0, i32 0
  %t2634 = load i32, ptr %t2633
  %t2635 = icmp eq i32 %t2634, 23
  br i1 %t2635, label %label_945, label %label_947
label_945:
  %t2636 = load ptr, ptr %expr
  %t2637 = getelementptr inbounds %ASTNode, ptr %t2636, i32 0, i32 1
  %t2638 = load ptr, ptr %t2637
  %t2639 = call ptr @ir_get_var_type(ptr %t2638)
  store ptr %t2639, ptr %val_type
  %t2640 = load ptr, ptr %val_type
  %t2641 = call ptr @storage_type(ptr %t2640)
  store ptr %t2641, ptr %load_type
  %t2642 = load ptr, ptr %expr
  %t2643 = getelementptr inbounds %ASTNode, ptr %t2642, i32 0, i32 1
  %t2644 = load ptr, ptr %t2643
  %t2645 = call i32 @ir_is_global_name(ptr %t2644)
  %t2646 = icmp eq i32 %t2645, 1
  br i1 %t2646, label %label_948, label %label_949
label_948:
  %t2647 = load ptr, ptr %load_type
  %t2648 = load ptr, ptr %expr
  %t2649 = getelementptr inbounds %ASTNode, ptr %t2648, i32 0, i32 1
  %t2650 = load ptr, ptr %t2649
  %t2651 = call i32 @ir_load_global(ptr %t2647, ptr %t2650)
  store i32 %t2651, ptr %temp_id
  %t2652 = load i32, ptr %temp_id
  %t2653 = call ptr @ir_get_temp_name(i32 %t2652)
  ret ptr %t2653
label_949:
  %t2654 = load ptr, ptr %load_type
  %t2655 = load ptr, ptr %expr
  %t2656 = getelementptr inbounds %ASTNode, ptr %t2655, i32 0, i32 1
  %t2657 = load ptr, ptr %t2656
  %t2658 = call i32 @ir_load(ptr %t2654, ptr %t2657)
  store i32 %t2658, ptr %temp_id
  %t2659 = load i32, ptr %temp_id
  %t2660 = call ptr @ir_get_temp_name(i32 %t2659)
  ret ptr %t2660
label_950:
  br label %label_947
label_947:
  %t2661 = load ptr, ptr %expr
  %t2662 = getelementptr inbounds %ASTNode, ptr %t2661, i32 0, i32 0
  %t2663 = load i32, ptr %t2662
  %t2664 = icmp eq i32 %t2663, 25
  br i1 %t2664, label %label_951, label %label_953
label_951:
  %t2665 = load ptr, ptr %expr
  %t2666 = getelementptr inbounds %ASTNode, ptr %t2665, i32 0, i32 5
  %t2667 = load ptr, ptr %t2666
  %t2668 = call ptr @ptr_to_node(ptr %t2667)
  store ptr %t2668, ptr %object_node
  %t2669 = load ptr, ptr %object_node
  %t2670 = getelementptr inbounds %ASTNode, ptr %t2669, i32 0, i32 0
  %t2671 = load i32, ptr %t2670
  %t2672 = icmp eq i32 %t2671, 23
  br i1 %t2672, label %label_954, label %label_956
label_954:
  %t2673 = load ptr, ptr %object_node
  %t2674 = getelementptr inbounds %ASTNode, ptr %t2673, i32 0, i32 1
  %t2675 = load ptr, ptr %t2674
  %t2676 = load ptr, ptr %expr
  %t2677 = getelementptr inbounds %ASTNode, ptr %t2676, i32 0, i32 1
  %t2678 = load ptr, ptr %t2677
  %t2679 = call i32 @ir_get_enum_variant(ptr %t2675, ptr %t2678)
  store i32 %t2679, ptr %enum_val
  %t2680 = load i32, ptr %enum_val
  %t2681 = icmp sge i32 %t2680, 0
  br i1 %t2681, label %label_957, label %label_959
label_957:
  %t2682 = load i32, ptr %enum_val
  %t2683 = call ptr @int_to_str(i32 %t2682)
  ret ptr %t2683
label_959:
  br label %label_956
label_956:
  %t2684 = load ptr, ptr %object_node
  %t2685 = call ptr @generate_expression(ptr %t2684)
  store ptr %t2685, ptr %object_val
  %t2686 = load ptr, ptr %object_node
  %t2687 = call ptr @get_expr_type(ptr %t2686)
  store ptr %t2687, ptr %object_type
  %t2688 = load ptr, ptr %object_type
  %t2689 = call ptr @struct_type_name(ptr %t2688)
  store ptr %t2689, ptr %struct_name
  %t2690 = load ptr, ptr %struct_name
  %t2691 = load ptr, ptr %expr
  %t2692 = getelementptr inbounds %ASTNode, ptr %t2691, i32 0, i32 1
  %t2693 = load ptr, ptr %t2692
  %t2694 = call i32 @ir_get_struct_field_index(ptr %t2690, ptr %t2693)
  store i32 %t2694, ptr %field_index
  %t2695 = load ptr, ptr %struct_name
  %t2696 = load ptr, ptr %expr
  %t2697 = getelementptr inbounds %ASTNode, ptr %t2696, i32 0, i32 1
  %t2698 = load ptr, ptr %t2697
  %t2699 = call ptr @ir_get_struct_field_type(ptr %t2695, ptr %t2698)
  %t2700 = call ptr @storage_type(ptr %t2699)
  store ptr %t2700, ptr %field_type
  %t2701 = call i32 @ir_get_temp()
  store i32 %t2701, ptr %gep_temp
  %t2702 = load i32, ptr %gep_temp
  %t2703 = call ptr @ir_get_temp_name(i32 %t2702)
  store ptr %t2703, ptr %gep_name
  %t2704 = getelementptr inbounds [3 x i8], ptr @.str.s313, i64 0, i64 0
  call void @ir_append(ptr %t2704)
  %t2705 = load ptr, ptr %gep_name
  call void @ir_append(ptr %t2705)
  %t2706 = getelementptr inbounds [27 x i8], ptr @.str.s314, i64 0, i64 0
  call void @ir_append(ptr %t2706)
  %t2707 = getelementptr inbounds [2 x i8], ptr @.str.s315, i64 0, i64 0
  %t2708 = load ptr, ptr %struct_name
  %t2709 = call ptr @str_concat(ptr %t2707, ptr %t2708)
  call void @ir_append(ptr %t2709)
  %t2710 = getelementptr inbounds [7 x i8], ptr @.str.s316, i64 0, i64 0
  call void @ir_append(ptr %t2710)
  %t2711 = load ptr, ptr %object_val
  call void @ir_append(ptr %t2711)
  %t2712 = getelementptr inbounds [14 x i8], ptr @.str.s317, i64 0, i64 0
  call void @ir_append(ptr %t2712)
  %t2713 = load i32, ptr %field_index
  %t2714 = call ptr @int_to_str(i32 %t2713)
  call void @ir_append_line(ptr %t2714)
  %t2715 = call i32 @ir_get_temp()
  store i32 %t2715, ptr %load_temp
  %t2716 = load i32, ptr %load_temp
  %t2717 = call ptr @ir_get_temp_name(i32 %t2716)
  store ptr %t2717, ptr %load_name
  %t2718 = getelementptr inbounds [3 x i8], ptr @.str.s318, i64 0, i64 0
  call void @ir_append(ptr %t2718)
  %t2719 = load ptr, ptr %load_name
  call void @ir_append(ptr %t2719)
  %t2720 = getelementptr inbounds [9 x i8], ptr @.str.s319, i64 0, i64 0
  call void @ir_append(ptr %t2720)
  %t2721 = load ptr, ptr %field_type
  call void @ir_append(ptr %t2721)
  %t2722 = getelementptr inbounds [7 x i8], ptr @.str.s320, i64 0, i64 0
  call void @ir_append(ptr %t2722)
  %t2723 = load ptr, ptr %gep_name
  call void @ir_append_line(ptr %t2723)
  %t2724 = load ptr, ptr %load_name
  ret ptr %t2724
label_953:
  %t2725 = load ptr, ptr %expr
  %t2726 = getelementptr inbounds %ASTNode, ptr %t2725, i32 0, i32 0
  %t2727 = load i32, ptr %t2726
  %t2728 = icmp eq i32 %t2727, 27
  br i1 %t2728, label %label_960, label %label_962
label_960:
  %t2729 = load ptr, ptr %expr
  %t2730 = getelementptr inbounds %ASTNode, ptr %t2729, i32 0, i32 5
  %t2731 = load ptr, ptr %t2730
  %t2732 = call i32 @count_list_nodes(ptr %t2731)
  store i32 %t2732, ptr %elem_count
  %t2733 = load ptr, ptr %expr
  %t2734 = getelementptr inbounds %ASTNode, ptr %t2733, i32 0, i32 5
  %t2735 = load ptr, ptr %t2734
  %t2736 = call ptr @ptr_to_node(ptr %t2735)
  store ptr %t2736, ptr %first_elem
  store i32 0, ptr %is_nested
  %t2737 = load ptr, ptr %first_elem
  %t2738 = getelementptr inbounds %ASTNode, ptr %t2737, i32 0, i32 0
  %t2739 = load i32, ptr %t2738
  %t2740 = icmp eq i32 %t2739, 27
  br i1 %t2740, label %label_963, label %label_965
label_963:
  store i32 1, ptr %is_nested
  br label %label_965
label_965:
  %t2741 = load i32, ptr %is_nested
  %t2742 = icmp eq i32 %t2741, 1
  br i1 %t2742, label %label_966, label %label_968
label_966:
  %t2743 = call i32 @ir_get_temp()
  store i32 %t2743, ptr %arr_temp
  %t2744 = load i32, ptr %arr_temp
  %t2745 = call ptr @ir_get_temp_name(i32 %t2744)
  store ptr %t2745, ptr %arr_name
  %t2746 = getelementptr inbounds [3 x i8], ptr @.str.s321, i64 0, i64 0
  call void @ir_append(ptr %t2746)
  %t2747 = load ptr, ptr %arr_name
  call void @ir_append(ptr %t2747)
  %t2748 = getelementptr inbounds [12 x i8], ptr @.str.s322, i64 0, i64 0
  call void @ir_append(ptr %t2748)
  %t2749 = load i32, ptr %elem_count
  %t2750 = call ptr @int_to_str(i32 %t2749)
  call void @ir_append(ptr %t2750)
  %t2751 = getelementptr inbounds [8 x i8], ptr @.str.s323, i64 0, i64 0
  call void @ir_append_line(ptr %t2751)
  %t2752 = load ptr, ptr %expr
  %t2753 = getelementptr inbounds %ASTNode, ptr %t2752, i32 0, i32 5
  %t2754 = load ptr, ptr %t2753
  store ptr %t2754, ptr %elem_ptr
  store i32 0, ptr %elem_index
  br label %label_969
label_969:
  %t2755 = load ptr, ptr %elem_ptr
  %t2756 = getelementptr inbounds [1 x i8], ptr @.str.s324, i64 0, i64 0
  %t2757 = call i32 @str_equals(ptr %t2755, ptr %t2756)
  %t2758 = icmp eq i32 %t2757, 0
  br i1 %t2758, label %label_970, label %label_971
label_970:
  %t2759 = load ptr, ptr %elem_ptr
  %t2760 = call ptr @ptr_to_node(ptr %t2759)
  store ptr %t2760, ptr %elem_node
  %t2761 = load ptr, ptr %elem_node
  %t2762 = call ptr @generate_expression(ptr %t2761)
  store ptr %t2762, ptr %inner_ptr
  %t2763 = call i32 @ir_get_temp()
  store i32 %t2763, ptr %slot_temp
  %t2764 = load i32, ptr %slot_temp
  %t2765 = call ptr @ir_get_temp_name(i32 %t2764)
  store ptr %t2765, ptr %slot_name
  %t2766 = getelementptr inbounds [3 x i8], ptr @.str.s325, i64 0, i64 0
  call void @ir_append(ptr %t2766)
  %t2767 = load ptr, ptr %slot_name
  call void @ir_append(ptr %t2767)
  %t2768 = getelementptr inbounds [28 x i8], ptr @.str.s326, i64 0, i64 0
  call void @ir_append(ptr %t2768)
  %t2769 = load i32, ptr %elem_count
  %t2770 = call ptr @int_to_str(i32 %t2769)
  call void @ir_append(ptr %t2770)
  %t2771 = getelementptr inbounds [14 x i8], ptr @.str.s327, i64 0, i64 0
  call void @ir_append(ptr %t2771)
  %t2772 = load ptr, ptr %arr_name
  call void @ir_append(ptr %t2772)
  %t2773 = getelementptr inbounds [14 x i8], ptr @.str.s328, i64 0, i64 0
  call void @ir_append(ptr %t2773)
  %t2774 = load i32, ptr %elem_index
  %t2775 = call ptr @int_to_str(i32 %t2774)
  call void @ir_append_line(ptr %t2775)
  %t2776 = getelementptr inbounds [13 x i8], ptr @.str.s329, i64 0, i64 0
  call void @ir_append(ptr %t2776)
  %t2777 = load ptr, ptr %inner_ptr
  call void @ir_append(ptr %t2777)
  %t2778 = getelementptr inbounds [7 x i8], ptr @.str.s330, i64 0, i64 0
  call void @ir_append(ptr %t2778)
  %t2779 = load ptr, ptr %slot_name
  call void @ir_append_line(ptr %t2779)
  %t2780 = load i32, ptr %elem_index
  %t2781 = add i32 %t2780, 1
  store i32 %t2781, ptr %elem_index
  %t2782 = load ptr, ptr %elem_node
  %t2783 = getelementptr inbounds %ASTNode, ptr %t2782, i32 0, i32 8
  %t2784 = load ptr, ptr %t2783
  store ptr %t2784, ptr %elem_ptr
  br label %label_969
label_971:
  %t2785 = call i32 @ir_get_temp()
  store i32 %t2785, ptr %ret_temp
  %t2786 = load i32, ptr %ret_temp
  %t2787 = call ptr @ir_get_temp_name(i32 %t2786)
  store ptr %t2787, ptr %ret_name
  %t2788 = getelementptr inbounds [3 x i8], ptr @.str.s331, i64 0, i64 0
  call void @ir_append(ptr %t2788)
  %t2789 = load ptr, ptr %ret_name
  call void @ir_append(ptr %t2789)
  %t2790 = getelementptr inbounds [28 x i8], ptr @.str.s332, i64 0, i64 0
  call void @ir_append(ptr %t2790)
  %t2791 = load i32, ptr %elem_count
  %t2792 = call ptr @int_to_str(i32 %t2791)
  call void @ir_append(ptr %t2792)
  %t2793 = getelementptr inbounds [14 x i8], ptr @.str.s333, i64 0, i64 0
  call void @ir_append(ptr %t2793)
  %t2794 = load ptr, ptr %arr_name
  call void @ir_append(ptr %t2794)
  %t2795 = getelementptr inbounds [15 x i8], ptr @.str.s334, i64 0, i64 0
  call void @ir_append_line(ptr %t2795)
  %t2796 = load ptr, ptr %ret_name
  ret ptr %t2796
label_968:
  %t2797 = call i32 @ir_get_temp()
  store i32 %t2797, ptr %arr_temp2
  %t2798 = load i32, ptr %arr_temp2
  %t2799 = call ptr @ir_get_temp_name(i32 %t2798)
  store ptr %t2799, ptr %arr_name2
  %t2800 = getelementptr inbounds [3 x i8], ptr @.str.s335, i64 0, i64 0
  call void @ir_append(ptr %t2800)
  %t2801 = load ptr, ptr %arr_name2
  call void @ir_append(ptr %t2801)
  %t2802 = getelementptr inbounds [12 x i8], ptr @.str.s336, i64 0, i64 0
  call void @ir_append(ptr %t2802)
  %t2803 = load i32, ptr %elem_count
  %t2804 = call ptr @int_to_str(i32 %t2803)
  call void @ir_append(ptr %t2804)
  %t2805 = getelementptr inbounds [8 x i8], ptr @.str.s337, i64 0, i64 0
  call void @ir_append_line(ptr %t2805)
  %t2806 = load ptr, ptr %expr
  %t2807 = getelementptr inbounds %ASTNode, ptr %t2806, i32 0, i32 5
  %t2808 = load ptr, ptr %t2807
  store ptr %t2808, ptr %elem_ptr2
  store i32 0, ptr %elem_index2
  br label %label_972
label_972:
  %t2809 = load ptr, ptr %elem_ptr2
  %t2810 = getelementptr inbounds [1 x i8], ptr @.str.s338, i64 0, i64 0
  %t2811 = call i32 @str_equals(ptr %t2809, ptr %t2810)
  %t2812 = icmp eq i32 %t2811, 0
  br i1 %t2812, label %label_973, label %label_974
label_973:
  %t2813 = load ptr, ptr %elem_ptr2
  %t2814 = call ptr @ptr_to_node(ptr %t2813)
  store ptr %t2814, ptr %elem_node2
  %t2815 = load ptr, ptr %elem_node2
  %t2816 = call ptr @generate_expression(ptr %t2815)
  store ptr %t2816, ptr %elem_val
  %t2817 = call i32 @ir_get_temp()
  store i32 %t2817, ptr %elem_slot_temp
  %t2818 = load i32, ptr %elem_slot_temp
  %t2819 = call ptr @ir_get_temp_name(i32 %t2818)
  store ptr %t2819, ptr %elem_slot_name
  %t2820 = getelementptr inbounds [3 x i8], ptr @.str.s339, i64 0, i64 0
  call void @ir_append(ptr %t2820)
  %t2821 = load ptr, ptr %elem_slot_name
  call void @ir_append(ptr %t2821)
  %t2822 = getelementptr inbounds [28 x i8], ptr @.str.s340, i64 0, i64 0
  call void @ir_append(ptr %t2822)
  %t2823 = load i32, ptr %elem_count
  %t2824 = call ptr @int_to_str(i32 %t2823)
  call void @ir_append(ptr %t2824)
  %t2825 = getelementptr inbounds [14 x i8], ptr @.str.s341, i64 0, i64 0
  call void @ir_append(ptr %t2825)
  %t2826 = load ptr, ptr %arr_name2
  call void @ir_append(ptr %t2826)
  %t2827 = getelementptr inbounds [14 x i8], ptr @.str.s342, i64 0, i64 0
  call void @ir_append(ptr %t2827)
  %t2828 = load i32, ptr %elem_index2
  %t2829 = call ptr @int_to_str(i32 %t2828)
  call void @ir_append_line(ptr %t2829)
  %t2830 = getelementptr inbounds [13 x i8], ptr @.str.s343, i64 0, i64 0
  call void @ir_append(ptr %t2830)
  %t2831 = load ptr, ptr %elem_val
  call void @ir_append(ptr %t2831)
  %t2832 = getelementptr inbounds [7 x i8], ptr @.str.s344, i64 0, i64 0
  call void @ir_append(ptr %t2832)
  %t2833 = load ptr, ptr %elem_slot_name
  call void @ir_append_line(ptr %t2833)
  %t2834 = load i32, ptr %elem_index2
  %t2835 = add i32 %t2834, 1
  store i32 %t2835, ptr %elem_index2
  %t2836 = load ptr, ptr %elem_node2
  %t2837 = getelementptr inbounds %ASTNode, ptr %t2836, i32 0, i32 8
  %t2838 = load ptr, ptr %t2837
  store ptr %t2838, ptr %elem_ptr2
  br label %label_972
label_974:
  %t2839 = call i32 @ir_get_temp()
  store i32 %t2839, ptr %ret_temp2
  %t2840 = load i32, ptr %ret_temp2
  %t2841 = call ptr @ir_get_temp_name(i32 %t2840)
  store ptr %t2841, ptr %ret_name2
  %t2842 = getelementptr inbounds [3 x i8], ptr @.str.s345, i64 0, i64 0
  call void @ir_append(ptr %t2842)
  %t2843 = load ptr, ptr %ret_name2
  call void @ir_append(ptr %t2843)
  %t2844 = getelementptr inbounds [28 x i8], ptr @.str.s346, i64 0, i64 0
  call void @ir_append(ptr %t2844)
  %t2845 = load i32, ptr %elem_count
  %t2846 = call ptr @int_to_str(i32 %t2845)
  call void @ir_append(ptr %t2846)
  %t2847 = getelementptr inbounds [14 x i8], ptr @.str.s347, i64 0, i64 0
  call void @ir_append(ptr %t2847)
  %t2848 = load ptr, ptr %arr_name2
  call void @ir_append(ptr %t2848)
  %t2849 = getelementptr inbounds [15 x i8], ptr @.str.s348, i64 0, i64 0
  call void @ir_append_line(ptr %t2849)
  %t2850 = load ptr, ptr %ret_name2
  ret ptr %t2850
label_962:
  %t2851 = load ptr, ptr %expr
  %t2852 = getelementptr inbounds %ASTNode, ptr %t2851, i32 0, i32 0
  %t2853 = load i32, ptr %t2852
  %t2854 = icmp eq i32 %t2853, 26
  br i1 %t2854, label %label_975, label %label_977
label_975:
  %t2855 = load ptr, ptr %expr
  %t2856 = getelementptr inbounds %ASTNode, ptr %t2855, i32 0, i32 5
  %t2857 = load ptr, ptr %t2856
  %t2858 = call ptr @ptr_to_node(ptr %t2857)
  %t2859 = call ptr @generate_expression(ptr %t2858)
  store ptr %t2859, ptr %array_val
  %t2860 = load ptr, ptr %expr
  %t2861 = getelementptr inbounds %ASTNode, ptr %t2860, i32 0, i32 6
  %t2862 = load ptr, ptr %t2861
  %t2863 = call ptr @ptr_to_node(ptr %t2862)
  %t2864 = call ptr @generate_expression(ptr %t2863)
  store ptr %t2864, ptr %index_val
  %t2865 = load ptr, ptr %expr
  %t2866 = getelementptr inbounds %ASTNode, ptr %t2865, i32 0, i32 5
  %t2867 = load ptr, ptr %t2866
  %t2868 = call ptr @ptr_to_node(ptr %t2867)
  %t2869 = call ptr @get_expr_type(ptr %t2868)
  store ptr %t2869, ptr %obj_type
  %t2870 = getelementptr inbounds [4 x i8], ptr @.str.s349, i64 0, i64 0
  store ptr %t2870, ptr %elem_type
  %t2871 = load ptr, ptr %obj_type
  %t2872 = getelementptr inbounds [7 x i8], ptr @.str.s350, i64 0, i64 0
  %t2873 = call i32 @str_equals(ptr %t2871, ptr %t2872)
  %t2874 = icmp eq i32 %t2873, 1
  br i1 %t2874, label %label_978, label %label_980
label_978:
  %t2875 = getelementptr inbounds [4 x i8], ptr @.str.s351, i64 0, i64 0
  store ptr %t2875, ptr %elem_type
  br label %label_980
label_980:
  %t2876 = call i32 @ir_get_temp()
  store i32 %t2876, ptr %ptr_temp
  %t2877 = load i32, ptr %ptr_temp
  %t2878 = call ptr @ir_get_temp_name(i32 %t2877)
  store ptr %t2878, ptr %ptr_name
  %t2879 = getelementptr inbounds [3 x i8], ptr @.str.s352, i64 0, i64 0
  call void @ir_append(ptr %t2879)
  %t2880 = load ptr, ptr %ptr_name
  call void @ir_append(ptr %t2880)
  %t2881 = getelementptr inbounds [27 x i8], ptr @.str.s353, i64 0, i64 0
  call void @ir_append(ptr %t2881)
  %t2882 = load ptr, ptr %elem_type
  call void @ir_append(ptr %t2882)
  %t2883 = getelementptr inbounds [7 x i8], ptr @.str.s354, i64 0, i64 0
  call void @ir_append(ptr %t2883)
  %t2884 = load ptr, ptr %array_val
  call void @ir_append(ptr %t2884)
  %t2885 = getelementptr inbounds [7 x i8], ptr @.str.s355, i64 0, i64 0
  call void @ir_append(ptr %t2885)
  %t2886 = load ptr, ptr %index_val
  call void @ir_append_line(ptr %t2886)
  %t2887 = call i32 @ir_get_temp()
  store i32 %t2887, ptr %load_temp
  %t2888 = load i32, ptr %load_temp
  %t2889 = call ptr @ir_get_temp_name(i32 %t2888)
  store ptr %t2889, ptr %load_name
  %t2890 = getelementptr inbounds [3 x i8], ptr @.str.s356, i64 0, i64 0
  call void @ir_append(ptr %t2890)
  %t2891 = load ptr, ptr %load_name
  call void @ir_append(ptr %t2891)
  %t2892 = getelementptr inbounds [9 x i8], ptr @.str.s357, i64 0, i64 0
  call void @ir_append(ptr %t2892)
  %t2893 = load ptr, ptr %elem_type
  call void @ir_append(ptr %t2893)
  %t2894 = getelementptr inbounds [7 x i8], ptr @.str.s358, i64 0, i64 0
  call void @ir_append(ptr %t2894)
  %t2895 = load ptr, ptr %ptr_name
  call void @ir_append_line(ptr %t2895)
  %t2896 = load ptr, ptr %load_name
  ret ptr %t2896
label_977:
  %t2897 = load ptr, ptr %expr
  %t2898 = getelementptr inbounds %ASTNode, ptr %t2897, i32 0, i32 0
  %t2899 = load i32, ptr %t2898
  %t2900 = icmp eq i32 %t2899, 20
  br i1 %t2900, label %label_981, label %label_983
label_981:
  %t2901 = load ptr, ptr %expr
  %t2902 = getelementptr inbounds %ASTNode, ptr %t2901, i32 0, i32 5
  %t2903 = load ptr, ptr %t2902
  %t2904 = call ptr @ptr_to_node(ptr %t2903)
  %t2905 = call ptr @generate_expression(ptr %t2904)
  store ptr %t2905, ptr %left_val
  %t2906 = load ptr, ptr %expr
  %t2907 = getelementptr inbounds %ASTNode, ptr %t2906, i32 0, i32 6
  %t2908 = load ptr, ptr %t2907
  %t2909 = call ptr @ptr_to_node(ptr %t2908)
  %t2910 = call ptr @generate_expression(ptr %t2909)
  store ptr %t2910, ptr %right_val
  %t2911 = load ptr, ptr %expr
  %t2912 = getelementptr inbounds %ASTNode, ptr %t2911, i32 0, i32 1
  %t2913 = load ptr, ptr %t2912
  store ptr %t2913, ptr %op
  store i32 0, ptr %temp_id
  %t2914 = load ptr, ptr %expr
  %t2915 = getelementptr inbounds %ASTNode, ptr %t2914, i32 0, i32 5
  %t2916 = load ptr, ptr %t2915
  %t2917 = call ptr @ptr_to_node(ptr %t2916)
  %t2918 = call ptr @get_expr_type(ptr %t2917)
  store ptr %t2918, ptr %op_type
  %t2919 = load ptr, ptr %op
  %t2920 = getelementptr inbounds [2 x i8], ptr @.str.s359, i64 0, i64 0
  %t2921 = call i32 @str_equals(ptr %t2919, ptr %t2920)
  %t2922 = icmp eq i32 %t2921, 1
  br i1 %t2922, label %label_984, label %label_986
label_984:
  %t2923 = load ptr, ptr %op_type
  %t2924 = load ptr, ptr %left_val
  %t2925 = load ptr, ptr %right_val
  %t2926 = call i32 @ir_add(ptr %t2923, ptr %t2924, ptr %t2925)
  store i32 %t2926, ptr %temp_id
  br label %label_986
label_986:
  %t2927 = load ptr, ptr %op
  %t2928 = getelementptr inbounds [2 x i8], ptr @.str.s360, i64 0, i64 0
  %t2929 = call i32 @str_equals(ptr %t2927, ptr %t2928)
  %t2930 = icmp eq i32 %t2929, 1
  br i1 %t2930, label %label_987, label %label_989
label_987:
  %t2931 = load ptr, ptr %op_type
  %t2932 = load ptr, ptr %left_val
  %t2933 = load ptr, ptr %right_val
  %t2934 = call i32 @ir_sub(ptr %t2931, ptr %t2932, ptr %t2933)
  store i32 %t2934, ptr %temp_id
  br label %label_989
label_989:
  %t2935 = load ptr, ptr %op
  %t2936 = getelementptr inbounds [2 x i8], ptr @.str.s361, i64 0, i64 0
  %t2937 = call i32 @str_equals(ptr %t2935, ptr %t2936)
  %t2938 = icmp eq i32 %t2937, 1
  br i1 %t2938, label %label_990, label %label_992
label_990:
  %t2939 = load ptr, ptr %op_type
  %t2940 = load ptr, ptr %left_val
  %t2941 = load ptr, ptr %right_val
  %t2942 = call i32 @ir_mul(ptr %t2939, ptr %t2940, ptr %t2941)
  store i32 %t2942, ptr %temp_id
  br label %label_992
label_992:
  %t2943 = load ptr, ptr %op
  %t2944 = getelementptr inbounds [2 x i8], ptr @.str.s362, i64 0, i64 0
  %t2945 = call i32 @str_equals(ptr %t2943, ptr %t2944)
  %t2946 = icmp eq i32 %t2945, 1
  br i1 %t2946, label %label_993, label %label_995
label_993:
  %t2947 = load ptr, ptr %op_type
  %t2948 = load ptr, ptr %left_val
  %t2949 = load ptr, ptr %right_val
  %t2950 = call i32 @ir_sdiv(ptr %t2947, ptr %t2948, ptr %t2949)
  store i32 %t2950, ptr %temp_id
  br label %label_995
label_995:
  %t2951 = load ptr, ptr %op
  %t2952 = getelementptr inbounds [2 x i8], ptr @.str.s363, i64 0, i64 0
  %t2953 = call i32 @str_equals(ptr %t2951, ptr %t2952)
  %t2954 = icmp eq i32 %t2953, 1
  br i1 %t2954, label %label_996, label %label_998
label_996:
  %t2955 = load ptr, ptr %op_type
  %t2956 = load ptr, ptr %left_val
  %t2957 = load ptr, ptr %right_val
  %t2958 = call i32 @ir_srem(ptr %t2955, ptr %t2956, ptr %t2957)
  store i32 %t2958, ptr %temp_id
  br label %label_998
label_998:
  %t2959 = load ptr, ptr %op
  %t2960 = getelementptr inbounds [3 x i8], ptr @.str.s364, i64 0, i64 0
  %t2961 = call i32 @str_equals(ptr %t2959, ptr %t2960)
  %t2962 = icmp eq i32 %t2961, 1
  br i1 %t2962, label %label_999, label %label_1001
label_999:
  %t2963 = load ptr, ptr %op_type
  %t2964 = load ptr, ptr %left_val
  %t2965 = load ptr, ptr %right_val
  %t2966 = call i32 @ir_icmp_eq(ptr %t2963, ptr %t2964, ptr %t2965)
  store i32 %t2966, ptr %temp_id
  br label %label_1001
label_1001:
  %t2967 = load ptr, ptr %op
  %t2968 = getelementptr inbounds [3 x i8], ptr @.str.s365, i64 0, i64 0
  %t2969 = call i32 @str_equals(ptr %t2967, ptr %t2968)
  %t2970 = icmp eq i32 %t2969, 1
  br i1 %t2970, label %label_1002, label %label_1004
label_1002:
  %t2971 = load ptr, ptr %op_type
  %t2972 = load ptr, ptr %left_val
  %t2973 = load ptr, ptr %right_val
  %t2974 = call i32 @ir_icmp_ne(ptr %t2971, ptr %t2972, ptr %t2973)
  store i32 %t2974, ptr %temp_id
  br label %label_1004
label_1004:
  %t2975 = load ptr, ptr %op
  %t2976 = getelementptr inbounds [2 x i8], ptr @.str.s366, i64 0, i64 0
  %t2977 = call i32 @str_equals(ptr %t2975, ptr %t2976)
  %t2978 = icmp eq i32 %t2977, 1
  br i1 %t2978, label %label_1005, label %label_1007
label_1005:
  %t2979 = load ptr, ptr %op_type
  %t2980 = load ptr, ptr %left_val
  %t2981 = load ptr, ptr %right_val
  %t2982 = call i32 @ir_icmp_slt(ptr %t2979, ptr %t2980, ptr %t2981)
  store i32 %t2982, ptr %temp_id
  br label %label_1007
label_1007:
  %t2983 = load ptr, ptr %op
  %t2984 = getelementptr inbounds [3 x i8], ptr @.str.s367, i64 0, i64 0
  %t2985 = call i32 @str_equals(ptr %t2983, ptr %t2984)
  %t2986 = icmp eq i32 %t2985, 1
  br i1 %t2986, label %label_1008, label %label_1010
label_1008:
  %t2987 = load ptr, ptr %op_type
  %t2988 = load ptr, ptr %left_val
  %t2989 = load ptr, ptr %right_val
  %t2990 = call i32 @ir_icmp_sle(ptr %t2987, ptr %t2988, ptr %t2989)
  store i32 %t2990, ptr %temp_id
  br label %label_1010
label_1010:
  %t2991 = load ptr, ptr %op
  %t2992 = getelementptr inbounds [2 x i8], ptr @.str.s368, i64 0, i64 0
  %t2993 = call i32 @str_equals(ptr %t2991, ptr %t2992)
  %t2994 = icmp eq i32 %t2993, 1
  br i1 %t2994, label %label_1011, label %label_1013
label_1011:
  %t2995 = load ptr, ptr %op_type
  %t2996 = load ptr, ptr %left_val
  %t2997 = load ptr, ptr %right_val
  %t2998 = call i32 @ir_icmp_sgt(ptr %t2995, ptr %t2996, ptr %t2997)
  store i32 %t2998, ptr %temp_id
  br label %label_1013
label_1013:
  %t2999 = load ptr, ptr %op
  %t3000 = getelementptr inbounds [3 x i8], ptr @.str.s369, i64 0, i64 0
  %t3001 = call i32 @str_equals(ptr %t2999, ptr %t3000)
  %t3002 = icmp eq i32 %t3001, 1
  br i1 %t3002, label %label_1014, label %label_1016
label_1014:
  %t3003 = load ptr, ptr %op_type
  %t3004 = load ptr, ptr %left_val
  %t3005 = load ptr, ptr %right_val
  %t3006 = call i32 @ir_icmp_sge(ptr %t3003, ptr %t3004, ptr %t3005)
  store i32 %t3006, ptr %temp_id
  br label %label_1016
label_1016:
  %t3007 = load ptr, ptr %op
  %t3008 = getelementptr inbounds [4 x i8], ptr @.str.s370, i64 0, i64 0
  %t3009 = call i32 @str_equals(ptr %t3007, ptr %t3008)
  %t3010 = icmp eq i32 %t3009, 1
  br i1 %t3010, label %label_1017, label %label_1019
label_1017:
  %t3011 = getelementptr inbounds [3 x i8], ptr @.str.s371, i64 0, i64 0
  %t3012 = load ptr, ptr %left_val
  %t3013 = load ptr, ptr %right_val
  %t3014 = call i32 @ir_and(ptr %t3011, ptr %t3012, ptr %t3013)
  store i32 %t3014, ptr %temp_id
  br label %label_1019
label_1019:
  %t3015 = load ptr, ptr %op
  %t3016 = getelementptr inbounds [3 x i8], ptr @.str.s372, i64 0, i64 0
  %t3017 = call i32 @str_equals(ptr %t3015, ptr %t3016)
  %t3018 = icmp eq i32 %t3017, 1
  br i1 %t3018, label %label_1020, label %label_1022
label_1020:
  %t3019 = getelementptr inbounds [3 x i8], ptr @.str.s373, i64 0, i64 0
  %t3020 = load ptr, ptr %left_val
  %t3021 = load ptr, ptr %right_val
  %t3022 = call i32 @ir_or(ptr %t3019, ptr %t3020, ptr %t3021)
  store i32 %t3022, ptr %temp_id
  br label %label_1022
label_1022:
  %t3023 = load i32, ptr %temp_id
  %t3024 = call ptr @ir_get_temp_name(i32 %t3023)
  ret ptr %t3024
label_983:
  %t3025 = load ptr, ptr %expr
  %t3026 = getelementptr inbounds %ASTNode, ptr %t3025, i32 0, i32 0
  %t3027 = load i32, ptr %t3026
  %t3028 = icmp eq i32 %t3027, 24
  br i1 %t3028, label %label_1023, label %label_1025
label_1023:
  %t3029 = load ptr, ptr %expr
  %t3030 = getelementptr inbounds %ASTNode, ptr %t3029, i32 0, i32 5
  %t3031 = load ptr, ptr %t3030
  %t3032 = call ptr @ptr_to_node(ptr %t3031)
  store ptr %t3032, ptr %callee
  %t3033 = load ptr, ptr %callee
  %t3034 = getelementptr inbounds %ASTNode, ptr %t3033, i32 0, i32 1
  %t3035 = load ptr, ptr %t3034
  store ptr %t3035, ptr %func_name
  store i32 0, ptr %is_print
  %t3036 = load ptr, ptr %func_name
  %t3037 = getelementptr inbounds [6 x i8], ptr @.str.s374, i64 0, i64 0
  %t3038 = call i32 @str_equals(ptr %t3036, ptr %t3037)
  %t3039 = icmp eq i32 %t3038, 1
  br i1 %t3039, label %label_1026, label %label_1028
label_1026:
  store i32 1, ptr %is_print
  br label %label_1028
label_1028:
  %t3040 = load ptr, ptr %func_name
  %t3041 = getelementptr inbounds [8 x i8], ptr @.str.s375, i64 0, i64 0
  %t3042 = call i32 @str_equals(ptr %t3040, ptr %t3041)
  %t3043 = icmp eq i32 %t3042, 1
  br i1 %t3043, label %label_1029, label %label_1031
label_1029:
  store i32 2, ptr %is_print
  br label %label_1031
label_1031:
  %t3044 = load i32, ptr %is_print
  %t3045 = icmp sgt i32 %t3044, 0
  br i1 %t3045, label %label_1032, label %label_1034
label_1032:
  %t3046 = load ptr, ptr %expr
  %t3047 = getelementptr inbounds %ASTNode, ptr %t3046, i32 0, i32 6
  %t3048 = load ptr, ptr %t3047
  store ptr %t3048, ptr %arg_ptr
  %t3049 = load ptr, ptr %arg_ptr
  %t3050 = getelementptr inbounds [1 x i8], ptr @.str.s376, i64 0, i64 0
  %t3051 = call i32 @str_equals(ptr %t3049, ptr %t3050)
  %t3052 = icmp eq i32 %t3051, 0
  br i1 %t3052, label %label_1035, label %label_1037
label_1035:
  %t3053 = load ptr, ptr %arg_ptr
  %t3054 = call ptr @ptr_to_node(ptr %t3053)
  store ptr %t3054, ptr %arg_node
  %t3055 = load ptr, ptr %arg_node
  %t3056 = call ptr @generate_expression(ptr %t3055)
  store ptr %t3056, ptr %arg_val
  %t3057 = load ptr, ptr %arg_node
  %t3058 = call ptr @get_expr_type(ptr %t3057)
  store ptr %t3058, ptr %arg_type
  call void @ir_call_begin()
  %t3059 = load ptr, ptr %arg_type
  %t3060 = getelementptr inbounds [4 x i8], ptr @.str.s377, i64 0, i64 0
  %t3061 = call i32 @str_equals(ptr %t3059, ptr %t3060)
  %t3062 = icmp eq i32 %t3061, 1
  br i1 %t3062, label %label_1038, label %label_1039
label_1038:
  %t3063 = getelementptr inbounds [4 x i8], ptr @.str.s378, i64 0, i64 0
  %t3064 = load ptr, ptr %arg_val
  call void @ir_call_arg(ptr %t3063, ptr %t3064)
  %t3065 = load i32, ptr %is_print
  %t3066 = icmp eq i32 %t3065, 1
  br i1 %t3066, label %label_1041, label %label_1042
label_1041:
  %t3067 = getelementptr inbounds [5 x i8], ptr @.str.s379, i64 0, i64 0
  %t3068 = getelementptr inbounds [6 x i8], ptr @.str.s380, i64 0, i64 0
  %t3069 = call i32 @ir_call_end(ptr %t3067, ptr %t3068)
  br label %label_1043
label_1042:
  %t3070 = getelementptr inbounds [5 x i8], ptr @.str.s381, i64 0, i64 0
  %t3071 = getelementptr inbounds [8 x i8], ptr @.str.s382, i64 0, i64 0
  %t3072 = call i32 @ir_call_end(ptr %t3070, ptr %t3071)
  br label %label_1043
label_1043:
  br label %label_1040
label_1039:
  %t3073 = load ptr, ptr %arg_type
  %t3074 = call ptr @storage_type(ptr %t3073)
  %t3075 = load ptr, ptr %arg_val
  call void @ir_call_arg(ptr %t3074, ptr %t3075)
  %t3076 = load i32, ptr %is_print
  %t3077 = icmp eq i32 %t3076, 1
  br i1 %t3077, label %label_1044, label %label_1045
label_1044:
  %t3078 = getelementptr inbounds [5 x i8], ptr @.str.s383, i64 0, i64 0
  %t3079 = getelementptr inbounds [10 x i8], ptr @.str.s384, i64 0, i64 0
  %t3080 = call i32 @ir_call_end(ptr %t3078, ptr %t3079)
  br label %label_1046
label_1045:
  %t3081 = getelementptr inbounds [5 x i8], ptr @.str.s385, i64 0, i64 0
  %t3082 = getelementptr inbounds [12 x i8], ptr @.str.s386, i64 0, i64 0
  %t3083 = call i32 @ir_call_end(ptr %t3081, ptr %t3082)
  br label %label_1046
label_1046:
  br label %label_1040
label_1040:
  br label %label_1037
label_1037:
  %t3084 = getelementptr inbounds [1 x i8], ptr @.str.s387, i64 0, i64 0
  ret ptr %t3084
label_1034:
  call void @ir_call_begin()
  %t3085 = load ptr, ptr %expr
  %t3086 = getelementptr inbounds %ASTNode, ptr %t3085, i32 0, i32 6
  %t3087 = load ptr, ptr %t3086
  store ptr %t3087, ptr %arg_ptr
  br label %label_1047
label_1047:
  %t3088 = load ptr, ptr %arg_ptr
  %t3089 = getelementptr inbounds [1 x i8], ptr @.str.s388, i64 0, i64 0
  %t3090 = call i32 @str_equals(ptr %t3088, ptr %t3089)
  %t3091 = icmp eq i32 %t3090, 0
  br i1 %t3091, label %label_1048, label %label_1049
label_1048:
  %t3092 = load ptr, ptr %arg_ptr
  %t3093 = call ptr @ptr_to_node(ptr %t3092)
  store ptr %t3093, ptr %arg_node
  %t3094 = load ptr, ptr %arg_node
  %t3095 = call ptr @generate_expression(ptr %t3094)
  store ptr %t3095, ptr %arg_val
  %t3096 = load ptr, ptr %arg_node
  %t3097 = call ptr @get_expr_type(ptr %t3096)
  %t3098 = call ptr @storage_type(ptr %t3097)
  %t3099 = load ptr, ptr %arg_val
  call void @ir_call_arg(ptr %t3098, ptr %t3099)
  %t3100 = load ptr, ptr %arg_node
  %t3101 = getelementptr inbounds %ASTNode, ptr %t3100, i32 0, i32 8
  %t3102 = load ptr, ptr %t3101
  store ptr %t3102, ptr %arg_ptr
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
  %t3144 = load ptr, ptr %stmt
  %t3145 = getelementptr inbounds %ASTNode, ptr %t3144, i32 0, i32 0
  %t3146 = load i32, ptr %t3145
  %t3147 = icmp eq i32 %t3146, 3
  br i1 %t3147, label %label_1053, label %label_1055
label_1053:
  %t3148 = load ptr, ptr %stmt
  %t3149 = getelementptr inbounds %ASTNode, ptr %t3148, i32 0, i32 1
  %t3150 = load ptr, ptr %t3149
  store ptr %t3150, ptr %var_name
  %t3151 = getelementptr inbounds [4 x i8], ptr @.str.s393, i64 0, i64 0
  store ptr %t3151, ptr %var_type
  %t3152 = load ptr, ptr %stmt
  %t3153 = getelementptr inbounds %ASTNode, ptr %t3152, i32 0, i32 5
  %t3154 = load ptr, ptr %t3153
  %t3155 = getelementptr inbounds [1 x i8], ptr @.str.s394, i64 0, i64 0
  %t3156 = call i32 @str_equals(ptr %t3154, ptr %t3155)
  %t3157 = icmp eq i32 %t3156, 0
  br i1 %t3157, label %label_1056, label %label_1057
label_1056:
  %t3158 = load ptr, ptr %stmt
  %t3159 = getelementptr inbounds %ASTNode, ptr %t3158, i32 0, i32 5
  %t3160 = load ptr, ptr %t3159
  %t3161 = call ptr @ptr_to_node(ptr %t3160)
  store ptr %t3161, ptr %type_node
  %t3162 = load ptr, ptr %type_node
  %t3163 = call ptr @map_type_node(ptr %t3162)
  store ptr %t3163, ptr %var_type
  br label %label_1058
label_1057:
  %t3164 = load ptr, ptr %stmt
  %t3165 = getelementptr inbounds %ASTNode, ptr %t3164, i32 0, i32 6
  %t3166 = load ptr, ptr %t3165
  %t3167 = getelementptr inbounds [1 x i8], ptr @.str.s395, i64 0, i64 0
  %t3168 = call i32 @str_equals(ptr %t3166, ptr %t3167)
  %t3169 = icmp eq i32 %t3168, 0
  br i1 %t3169, label %label_1059, label %label_1061
label_1059:
  %t3170 = load ptr, ptr %stmt
  %t3171 = getelementptr inbounds %ASTNode, ptr %t3170, i32 0, i32 6
  %t3172 = load ptr, ptr %t3171
  %t3173 = call ptr @ptr_to_node(ptr %t3172)
  %t3174 = call ptr @get_expr_type(ptr %t3173)
  store ptr %t3174, ptr %var_type
  br label %label_1061
label_1061:
  br label %label_1058
label_1058:
  %t3175 = load ptr, ptr %var_name
  %t3176 = load ptr, ptr %var_type
  call void @ir_set_var_type(ptr %t3175, ptr %t3176)
  %t3177 = load ptr, ptr %var_type
  %t3178 = call ptr @storage_type(ptr %t3177)
  store ptr %t3178, ptr %store_type
  %t3179 = load ptr, ptr %store_type
  %t3180 = load ptr, ptr %var_name
  %t3181 = call i32 @ir_alloca(ptr %t3179, ptr %t3180)
  %t3182 = load ptr, ptr %stmt
  %t3183 = getelementptr inbounds %ASTNode, ptr %t3182, i32 0, i32 6
  %t3184 = load ptr, ptr %t3183
  %t3185 = getelementptr inbounds [1 x i8], ptr @.str.s396, i64 0, i64 0
  %t3186 = call i32 @str_equals(ptr %t3184, ptr %t3185)
  %t3187 = icmp eq i32 %t3186, 0
  br i1 %t3187, label %label_1062, label %label_1064
label_1062:
  %t3188 = load ptr, ptr %stmt
  %t3189 = getelementptr inbounds %ASTNode, ptr %t3188, i32 0, i32 6
  %t3190 = load ptr, ptr %t3189
  %t3191 = call ptr @ptr_to_node(ptr %t3190)
  %t3192 = call ptr @generate_expression(ptr %t3191)
  store ptr %t3192, ptr %init_val
  %t3193 = load ptr, ptr %store_type
  %t3194 = load ptr, ptr %init_val
  %t3195 = load ptr, ptr %var_name
  call void @ir_store(ptr %t3193, ptr %t3194, ptr %t3195)
  br label %label_1064
label_1064:
  br label %label_1055
label_1055:
  %t3196 = load ptr, ptr %stmt
  %t3197 = getelementptr inbounds %ASTNode, ptr %t3196, i32 0, i32 0
  %t3198 = load i32, ptr %t3197
  %t3199 = icmp eq i32 %t3198, 16
  br i1 %t3199, label %label_1065, label %label_1067
label_1065:
  %t3200 = load ptr, ptr %stmt
  %t3201 = getelementptr inbounds %ASTNode, ptr %t3200, i32 0, i32 5
  %t3202 = load ptr, ptr %t3201
  %t3203 = call ptr @ptr_to_node(ptr %t3202)
  store ptr %t3203, ptr %target_node
  %t3204 = load ptr, ptr %target_node
  %t3205 = getelementptr inbounds %ASTNode, ptr %t3204, i32 0, i32 0
  %t3206 = load i32, ptr %t3205
  %t3207 = icmp eq i32 %t3206, 23
  br i1 %t3207, label %label_1068, label %label_1070
label_1068:
  %t3208 = load ptr, ptr %target_node
  %t3209 = getelementptr inbounds %ASTNode, ptr %t3208, i32 0, i32 1
  %t3210 = load ptr, ptr %t3209
  store ptr %t3210, ptr %var_name
  %t3211 = load ptr, ptr %var_name
  %t3212 = call ptr @ir_get_var_type(ptr %t3211)
  store ptr %t3212, ptr %var_type
  %t3213 = load ptr, ptr %var_type
  %t3214 = call ptr @storage_type(ptr %t3213)
  store ptr %t3214, ptr %store_type
  %t3215 = load ptr, ptr %stmt
  %t3216 = getelementptr inbounds %ASTNode, ptr %t3215, i32 0, i32 6
  %t3217 = load ptr, ptr %t3216
  %t3218 = call ptr @ptr_to_node(ptr %t3217)
  %t3219 = call ptr @generate_expression(ptr %t3218)
  store ptr %t3219, ptr %val
  %t3220 = load ptr, ptr %var_name
  %t3221 = call i32 @ir_is_global_name(ptr %t3220)
  %t3222 = icmp eq i32 %t3221, 1
  br i1 %t3222, label %label_1071, label %label_1072
label_1071:
  %t3223 = load ptr, ptr %store_type
  %t3224 = load ptr, ptr %val
  %t3225 = load ptr, ptr %var_name
  call void @ir_store_global(ptr %t3223, ptr %t3224, ptr %t3225)
  br label %label_1073
label_1072:
  %t3226 = load ptr, ptr %store_type
  %t3227 = load ptr, ptr %val
  %t3228 = load ptr, ptr %var_name
  call void @ir_store(ptr %t3226, ptr %t3227, ptr %t3228)
  br label %label_1073
label_1073:
  br label %label_1070
label_1070:
  %t3229 = load ptr, ptr %target_node
  %t3230 = getelementptr inbounds %ASTNode, ptr %t3229, i32 0, i32 0
  %t3231 = load i32, ptr %t3230
  %t3232 = icmp eq i32 %t3231, 25
  br i1 %t3232, label %label_1074, label %label_1076
label_1074:
  %t3233 = load ptr, ptr %target_node
  %t3234 = getelementptr inbounds %ASTNode, ptr %t3233, i32 0, i32 5
  %t3235 = load ptr, ptr %t3234
  %t3236 = call ptr @ptr_to_node(ptr %t3235)
  store ptr %t3236, ptr %object_node
  %t3237 = load ptr, ptr %object_node
  %t3238 = call ptr @generate_expression(ptr %t3237)
  store ptr %t3238, ptr %object_val
  %t3239 = load ptr, ptr %object_node
  %t3240 = call ptr @get_expr_type(ptr %t3239)
  store ptr %t3240, ptr %object_type
  %t3241 = load ptr, ptr %object_type
  %t3242 = call ptr @struct_type_name(ptr %t3241)
  store ptr %t3242, ptr %struct_name
  %t3243 = load ptr, ptr %struct_name
  %t3244 = load ptr, ptr %target_node
  %t3245 = getelementptr inbounds %ASTNode, ptr %t3244, i32 0, i32 1
  %t3246 = load ptr, ptr %t3245
  %t3247 = call i32 @ir_get_struct_field_index(ptr %t3243, ptr %t3246)
  store i32 %t3247, ptr %field_index
  %t3248 = load ptr, ptr %struct_name
  %t3249 = load ptr, ptr %target_node
  %t3250 = getelementptr inbounds %ASTNode, ptr %t3249, i32 0, i32 1
  %t3251 = load ptr, ptr %t3250
  %t3252 = call ptr @ir_get_struct_field_type(ptr %t3248, ptr %t3251)
  %t3253 = call ptr @storage_type(ptr %t3252)
  store ptr %t3253, ptr %field_type
  %t3254 = load ptr, ptr %stmt
  %t3255 = getelementptr inbounds %ASTNode, ptr %t3254, i32 0, i32 6
  %t3256 = load ptr, ptr %t3255
  %t3257 = call ptr @ptr_to_node(ptr %t3256)
  %t3258 = call ptr @generate_expression(ptr %t3257)
  store ptr %t3258, ptr %val
  %t3259 = call i32 @ir_get_temp()
  store i32 %t3259, ptr %gep_temp
  %t3260 = load i32, ptr %gep_temp
  %t3261 = call ptr @ir_get_temp_name(i32 %t3260)
  store ptr %t3261, ptr %gep_name
  %t3262 = getelementptr inbounds [3 x i8], ptr @.str.s397, i64 0, i64 0
  call void @ir_append(ptr %t3262)
  %t3263 = load ptr, ptr %gep_name
  call void @ir_append(ptr %t3263)
  %t3264 = getelementptr inbounds [27 x i8], ptr @.str.s398, i64 0, i64 0
  call void @ir_append(ptr %t3264)
  %t3265 = getelementptr inbounds [2 x i8], ptr @.str.s399, i64 0, i64 0
  %t3266 = load ptr, ptr %struct_name
  %t3267 = call ptr @str_concat(ptr %t3265, ptr %t3266)
  call void @ir_append(ptr %t3267)
  %t3268 = getelementptr inbounds [7 x i8], ptr @.str.s400, i64 0, i64 0
  call void @ir_append(ptr %t3268)
  %t3269 = load ptr, ptr %object_val
  call void @ir_append(ptr %t3269)
  %t3270 = getelementptr inbounds [14 x i8], ptr @.str.s401, i64 0, i64 0
  call void @ir_append(ptr %t3270)
  %t3271 = load i32, ptr %field_index
  %t3272 = call ptr @int_to_str(i32 %t3271)
  call void @ir_append_line(ptr %t3272)
  %t3273 = getelementptr inbounds [9 x i8], ptr @.str.s402, i64 0, i64 0
  call void @ir_append(ptr %t3273)
  %t3274 = load ptr, ptr %field_type
  call void @ir_append(ptr %t3274)
  %t3275 = getelementptr inbounds [2 x i8], ptr @.str.s403, i64 0, i64 0
  call void @ir_append(ptr %t3275)
  %t3276 = load ptr, ptr %val
  call void @ir_append(ptr %t3276)
  %t3277 = getelementptr inbounds [7 x i8], ptr @.str.s404, i64 0, i64 0
  call void @ir_append(ptr %t3277)
  %t3278 = load ptr, ptr %gep_name
  call void @ir_append_line(ptr %t3278)
  br label %label_1076
label_1076:
  br label %label_1067
label_1067:
  %t3279 = load ptr, ptr %stmt
  %t3280 = getelementptr inbounds %ASTNode, ptr %t3279, i32 0, i32 0
  %t3281 = load i32, ptr %t3280
  %t3282 = icmp eq i32 %t3281, 15
  br i1 %t3282, label %label_1077, label %label_1079
label_1077:
  %t3283 = load ptr, ptr %stmt
  %t3284 = getelementptr inbounds %ASTNode, ptr %t3283, i32 0, i32 5
  %t3285 = load ptr, ptr %t3284
  %t3286 = getelementptr inbounds [1 x i8], ptr @.str.s405, i64 0, i64 0
  %t3287 = call i32 @str_equals(ptr %t3285, ptr %t3286)
  %t3288 = icmp eq i32 %t3287, 0
  br i1 %t3288, label %label_1080, label %label_1081
label_1080:
  %t3289 = load ptr, ptr %stmt
  %t3290 = getelementptr inbounds %ASTNode, ptr %t3289, i32 0, i32 5
  %t3291 = load ptr, ptr %t3290
  %t3292 = call ptr @ptr_to_node(ptr %t3291)
  %t3293 = call ptr @generate_expression(ptr %t3292)
  store ptr %t3293, ptr %ret_val
  %t3294 = load ptr, ptr %stmt
  %t3295 = getelementptr inbounds %ASTNode, ptr %t3294, i32 0, i32 5
  %t3296 = load ptr, ptr %t3295
  %t3297 = call ptr @ptr_to_node(ptr %t3296)
  %t3298 = call ptr @get_expr_type(ptr %t3297)
  %t3299 = call ptr @storage_type(ptr %t3298)
  %t3300 = load ptr, ptr %ret_val
  call void @ir_ret(ptr %t3299, ptr %t3300)
  br label %label_1082
label_1081:
  call void @ir_ret_void()
  br label %label_1082
label_1082:
  call void @ir_set_returned()
  br label %label_1079
label_1079:
  %t3301 = load ptr, ptr %stmt
  %t3302 = getelementptr inbounds %ASTNode, ptr %t3301, i32 0, i32 0
  %t3303 = load i32, ptr %t3302
  %t3304 = icmp eq i32 %t3303, 17
  br i1 %t3304, label %label_1083, label %label_1085
label_1083:
  %t3305 = load ptr, ptr %stmt
  %t3306 = getelementptr inbounds %ASTNode, ptr %t3305, i32 0, i32 5
  %t3307 = load ptr, ptr %t3306
  %t3308 = getelementptr inbounds [1 x i8], ptr @.str.s406, i64 0, i64 0
  %t3309 = call i32 @str_equals(ptr %t3307, ptr %t3308)
  %t3310 = icmp eq i32 %t3309, 0
  br i1 %t3310, label %label_1086, label %label_1088
label_1086:
  %t3311 = load ptr, ptr %stmt
  %t3312 = getelementptr inbounds %ASTNode, ptr %t3311, i32 0, i32 5
  %t3313 = load ptr, ptr %t3312
  %t3314 = call ptr @ptr_to_node(ptr %t3313)
  %t3315 = call ptr @generate_expression(ptr %t3314)
  br label %label_1088
label_1088:
  br label %label_1085
label_1085:
  %t3316 = load ptr, ptr %stmt
  %t3317 = getelementptr inbounds %ASTNode, ptr %t3316, i32 0, i32 0
  %t3318 = load i32, ptr %t3317
  %t3319 = icmp eq i32 %t3318, 10
  br i1 %t3319, label %label_1089, label %label_1091
label_1089:
  %t3320 = load ptr, ptr %stmt
  %t3321 = getelementptr inbounds %ASTNode, ptr %t3320, i32 0, i32 5
  %t3322 = load ptr, ptr %t3321
  %t3323 = call ptr @ptr_to_node(ptr %t3322)
  %t3324 = call ptr @generate_expression(ptr %t3323)
  store ptr %t3324, ptr %cond_val
  %t3325 = call i32 @ir_get_label()
  store i32 %t3325, ptr %then_label
  %t3326 = call i32 @ir_get_label()
  store i32 %t3326, ptr %else_label
  %t3327 = call i32 @ir_get_label()
  store i32 %t3327, ptr %end_label
  %t3328 = load ptr, ptr %stmt
  %t3329 = getelementptr inbounds %ASTNode, ptr %t3328, i32 0, i32 7
  %t3330 = load ptr, ptr %t3329
  %t3331 = getelementptr inbounds [1 x i8], ptr @.str.s407, i64 0, i64 0
  %t3332 = call i32 @str_equals(ptr %t3330, ptr %t3331)
  %t3333 = icmp eq i32 %t3332, 0
  br i1 %t3333, label %label_1092, label %label_1093
label_1092:
  %t3334 = load ptr, ptr %cond_val
  %t3335 = load i32, ptr %then_label
  %t3336 = load i32, ptr %else_label
  call void @ir_cond_br_numbered(ptr %t3334, i32 %t3335, i32 %t3336)
  br label %label_1094
label_1093:
  %t3337 = load ptr, ptr %cond_val
  %t3338 = load i32, ptr %then_label
  %t3339 = load i32, ptr %end_label
  call void @ir_cond_br_numbered(ptr %t3337, i32 %t3338, i32 %t3339)
  br label %label_1094
label_1094:
  %t3340 = load i32, ptr %then_label
  call void @ir_label_numbered(i32 %t3340)
  %t3341 = load ptr, ptr %stmt
  %t3342 = getelementptr inbounds %ASTNode, ptr %t3341, i32 0, i32 6
  %t3343 = load ptr, ptr %t3342
  %t3344 = call ptr @ptr_to_node(ptr %t3343)
  call void @generate_block(ptr %t3344)
  %t3345 = call i32 @ir_has_returned()
  %t3346 = icmp eq i32 %t3345, 0
  br i1 %t3346, label %label_1095, label %label_1097
label_1095:
  %t3347 = load i32, ptr %end_label
  call void @ir_br_numbered(i32 %t3347)
  br label %label_1097
label_1097:
  call void @ir_clear_returned()
  %t3348 = load ptr, ptr %stmt
  %t3349 = getelementptr inbounds %ASTNode, ptr %t3348, i32 0, i32 7
  %t3350 = load ptr, ptr %t3349
  %t3351 = getelementptr inbounds [1 x i8], ptr @.str.s408, i64 0, i64 0
  %t3352 = call i32 @str_equals(ptr %t3350, ptr %t3351)
  %t3353 = icmp eq i32 %t3352, 0
  br i1 %t3353, label %label_1098, label %label_1100
label_1098:
  %t3354 = load i32, ptr %else_label
  call void @ir_label_numbered(i32 %t3354)
  %t3355 = load ptr, ptr %stmt
  %t3356 = getelementptr inbounds %ASTNode, ptr %t3355, i32 0, i32 7
  %t3357 = load ptr, ptr %t3356
  %t3358 = call ptr @ptr_to_node(ptr %t3357)
  store ptr %t3358, ptr %else_node
  %t3359 = load ptr, ptr %else_node
  %t3360 = getelementptr inbounds %ASTNode, ptr %t3359, i32 0, i32 0
  %t3361 = load i32, ptr %t3360
  %t3362 = icmp eq i32 %t3361, 10
  br i1 %t3362, label %label_1101, label %label_1102
label_1101:
  %t3363 = load ptr, ptr %else_node
  call void @generate_statement(ptr %t3363)
  br label %label_1103
label_1102:
  %t3364 = load ptr, ptr %else_node
  call void @generate_block(ptr %t3364)
  br label %label_1103
label_1103:
  %t3365 = call i32 @ir_has_returned()
  %t3366 = icmp eq i32 %t3365, 0
  br i1 %t3366, label %label_1104, label %label_1106
label_1104:
  %t3367 = load i32, ptr %end_label
  call void @ir_br_numbered(i32 %t3367)
  br label %label_1106
label_1106:
  call void @ir_clear_returned()
  br label %label_1100
label_1100:
  %t3368 = load i32, ptr %end_label
  call void @ir_label_numbered(i32 %t3368)
  br label %label_1091
label_1091:
  %t3369 = load ptr, ptr %stmt
  %t3370 = getelementptr inbounds %ASTNode, ptr %t3369, i32 0, i32 0
  %t3371 = load i32, ptr %t3370
  %t3372 = icmp eq i32 %t3371, 13
  br i1 %t3372, label %label_1107, label %label_1109
label_1107:
  %t3373 = call i32 @ir_get_label()
  store i32 %t3373, ptr %cond_label
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
  %t3398 = load ptr, ptr %block
  %t3399 = getelementptr inbounds %ASTNode, ptr %t3398, i32 0, i32 5
  %t3400 = load ptr, ptr %t3399
  store ptr %t3400, ptr %stmt_ptr
  br label %label_1113
label_1113:
  %t3401 = load ptr, ptr %stmt_ptr
  %t3402 = getelementptr inbounds [1 x i8], ptr @.str.s409, i64 0, i64 0
  %t3403 = call i32 @str_equals(ptr %t3401, ptr %t3402)
  %t3404 = icmp eq i32 %t3403, 0
  br i1 %t3404, label %label_1114, label %label_1115
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
  %t3414 = getelementptr inbounds [4 x i8], ptr @.str.s410, i64 0, i64 0
  store ptr %t3414, ptr %var_type
  %t3415 = load ptr, ptr %stmt
  %t3416 = getelementptr inbounds %ASTNode, ptr %t3415, i32 0, i32 5
  %t3417 = load ptr, ptr %t3416
  %t3418 = getelementptr inbounds [1 x i8], ptr @.str.s411, i64 0, i64 0
  %t3419 = call i32 @str_equals(ptr %t3417, ptr %t3418)
  %t3420 = icmp eq i32 %t3419, 0
  br i1 %t3420, label %label_1116, label %label_1117
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
  %t3442 = load ptr, ptr %stmt
  %t3443 = getelementptr inbounds %ASTNode, ptr %t3442, i32 0, i32 0
  %t3444 = load i32, ptr %t3443
  %t3445 = icmp eq i32 %t3444, 3
  br i1 %t3445, label %label_1122, label %label_1124
label_1122:
  %t3446 = load ptr, ptr %stmt
  %t3447 = call ptr @get_variable_decl_type(ptr %t3446)
  store ptr %t3447, ptr %var_type
  %t3448 = load ptr, ptr %stmt
  %t3449 = getelementptr inbounds %ASTNode, ptr %t3448, i32 0, i32 1
  %t3450 = load ptr, ptr %t3449
  %t3451 = load ptr, ptr %var_type
  call void @ir_set_var_type(ptr %t3450, ptr %t3451)
  %t3452 = load ptr, ptr %var_type
  %t3453 = call ptr @storage_type(ptr %t3452)
  %t3454 = load ptr, ptr %stmt
  %t3455 = getelementptr inbounds %ASTNode, ptr %t3454, i32 0, i32 1
  %t3456 = load ptr, ptr %t3455
  %t3457 = call i32 @ir_alloca(ptr %t3453, ptr %t3456)
  br label %label_1124
label_1124:
  %t3458 = load ptr, ptr %stmt
  %t3459 = getelementptr inbounds %ASTNode, ptr %t3458, i32 0, i32 0
  %t3460 = load i32, ptr %t3459
  %t3461 = icmp eq i32 %t3460, 10
  br i1 %t3461, label %label_1125, label %label_1127
label_1125:
  %t3462 = load ptr, ptr %stmt
  %t3463 = getelementptr inbounds %ASTNode, ptr %t3462, i32 0, i32 6
  %t3464 = load ptr, ptr %t3463
  %t3465 = getelementptr inbounds [1 x i8], ptr @.str.s413, i64 0, i64 0
  %t3466 = call i32 @str_equals(ptr %t3464, ptr %t3465)
  %t3467 = icmp eq i32 %t3466, 0
  br i1 %t3467, label %label_1128, label %label_1130
label_1128:
  %t3468 = load ptr, ptr %stmt
  %t3469 = getelementptr inbounds %ASTNode, ptr %t3468, i32 0, i32 6
  %t3470 = load ptr, ptr %t3469
  %t3471 = call ptr @ptr_to_node(ptr %t3470)
  call void @predeclare_locals_block(ptr %t3471)
  br label %label_1130
label_1130:
  %t3472 = load ptr, ptr %stmt
  %t3473 = getelementptr inbounds %ASTNode, ptr %t3472, i32 0, i32 7
  %t3474 = load ptr, ptr %t3473
  %t3475 = getelementptr inbounds [1 x i8], ptr @.str.s414, i64 0, i64 0
  %t3476 = call i32 @str_equals(ptr %t3474, ptr %t3475)
  %t3477 = icmp eq i32 %t3476, 0
  br i1 %t3477, label %label_1131, label %label_1133
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
  %t3519 = load ptr, ptr %block
  %t3520 = getelementptr inbounds %ASTNode, ptr %t3519, i32 0, i32 5
  %t3521 = load ptr, ptr %t3520
  store ptr %t3521, ptr %stmt_ptr
  br label %label_1149
label_1149:
  %t3522 = load ptr, ptr %stmt_ptr
  %t3523 = getelementptr inbounds [1 x i8], ptr @.str.s417, i64 0, i64 0
  %t3524 = call i32 @str_equals(ptr %t3522, ptr %t3523)
  %t3525 = icmp eq i32 %t3524, 0
  br i1 %t3525, label %label_1150, label %label_1151
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
  %ret_node = alloca ptr
  %is_main = alloca i32
  %ret_sig_type = alloca ptr
  %param_ptr = alloca ptr
  %param_node = alloca ptr
  %p_type_node = alloca ptr
  %param_ptr2 = alloca ptr
  %p_type_str = alloca ptr
  %p_store_type = alloca ptr
  store ptr %p_func, ptr %func
  %t3544 = load ptr, ptr %func
  %t3545 = getelementptr inbounds %ASTNode, ptr %t3544, i32 0, i32 1
  %t3546 = load ptr, ptr %t3545
  store ptr %t3546, ptr %func_name
  %t3547 = getelementptr inbounds [5 x i8], ptr @.str.s418, i64 0, i64 0
  store ptr %t3547, ptr %ret_type
  %t3548 = load ptr, ptr %func
  %t3549 = getelementptr inbounds %ASTNode, ptr %t3548, i32 0, i32 7
  %t3550 = load ptr, ptr %t3549
  %t3551 = getelementptr inbounds [1 x i8], ptr @.str.s419, i64 0, i64 0
  %t3552 = call i32 @str_equals(ptr %t3550, ptr %t3551)
  %t3553 = icmp eq i32 %t3552, 0
  br i1 %t3553, label %label_1152, label %label_1154
label_1152:
  %t3554 = load ptr, ptr %func
  %t3555 = getelementptr inbounds %ASTNode, ptr %t3554, i32 0, i32 7
  %t3556 = load ptr, ptr %t3555
  %t3557 = call ptr @ptr_to_node(ptr %t3556)
  store ptr %t3557, ptr %ret_node
  %t3558 = load ptr, ptr %ret_node
  %t3559 = call ptr @map_type_node(ptr %t3558)
  store ptr %t3559, ptr %ret_type
  br label %label_1154
label_1154:
  store i32 0, ptr %is_main
  %t3560 = load ptr, ptr %func_name
  %t3561 = getelementptr inbounds [5 x i8], ptr @.str.s420, i64 0, i64 0
  %t3562 = call i32 @str_equals(ptr %t3560, ptr %t3561)
  %t3563 = icmp eq i32 %t3562, 1
  br i1 %t3563, label %label_1155, label %label_1157
label_1155:
  %t3564 = getelementptr inbounds [4 x i8], ptr @.str.s421, i64 0, i64 0
  store ptr %t3564, ptr %ret_type
  store i32 1, ptr %is_main
  br label %label_1157
label_1157:
  %t3565 = load ptr, ptr %ret_type
  %t3566 = call ptr @storage_type(ptr %t3565)
  store ptr %t3566, ptr %ret_sig_type
  %t3567 = load ptr, ptr %func_name
  %t3568 = load ptr, ptr %ret_sig_type
  call void @ir_function_begin(ptr %t3567, ptr %t3568)
  %t3569 = load ptr, ptr %func
  %t3570 = getelementptr inbounds %ASTNode, ptr %t3569, i32 0, i32 5
  %t3571 = load ptr, ptr %t3570
  store ptr %t3571, ptr %param_ptr
  br label %label_1158
label_1158:
  %t3572 = load ptr, ptr %param_ptr
  %t3573 = getelementptr inbounds [1 x i8], ptr @.str.s422, i64 0, i64 0
  %t3574 = call i32 @str_equals(ptr %t3572, ptr %t3573)
  %t3575 = icmp eq i32 %t3574, 0
  br i1 %t3575, label %label_1159, label %label_1160
label_1159:
  %t3576 = load ptr, ptr %param_ptr
  %t3577 = call ptr @ptr_to_node(ptr %t3576)
  store ptr %t3577, ptr %param_node
  %t3578 = load ptr, ptr %param_node
  %t3579 = getelementptr inbounds %ASTNode, ptr %t3578, i32 0, i32 5
  %t3580 = load ptr, ptr %t3579
  %t3581 = call ptr @ptr_to_node(ptr %t3580)
  store ptr %t3581, ptr %p_type_node
  %t3582 = load ptr, ptr %p_type_node
  %t3583 = call ptr @map_type_node(ptr %t3582)
  %t3584 = call ptr @storage_type(ptr %t3583)
  %t3585 = getelementptr inbounds [3 x i8], ptr @.str.s423, i64 0, i64 0
  %t3586 = load ptr, ptr %param_node
  %t3587 = getelementptr inbounds %ASTNode, ptr %t3586, i32 0, i32 1
  %t3588 = load ptr, ptr %t3587
  %t3589 = call ptr @str_concat(ptr %t3585, ptr %t3588)
  call void @ir_function_param(ptr %t3584, ptr %t3589)
  %t3590 = load ptr, ptr %param_node
  %t3591 = getelementptr inbounds %ASTNode, ptr %t3590, i32 0, i32 8
  %t3592 = load ptr, ptr %t3591
  store ptr %t3592, ptr %param_ptr
  br label %label_1158
label_1160:
  call void @ir_function_body_start()
  call void @ir_clear_local_var_types()
  call void @ir_clear_returned()
  %t3593 = load ptr, ptr %func
  %t3594 = getelementptr inbounds %ASTNode, ptr %t3593, i32 0, i32 5
  %t3595 = load ptr, ptr %t3594
  store ptr %t3595, ptr %param_ptr2
  br label %label_1161
label_1161:
  %t3596 = load ptr, ptr %param_ptr2
  %t3597 = getelementptr inbounds [1 x i8], ptr @.str.s424, i64 0, i64 0
  %t3598 = call i32 @str_equals(ptr %t3596, ptr %t3597)
  %t3599 = icmp eq i32 %t3598, 0
  br i1 %t3599, label %label_1162, label %label_1163
label_1162:
  %t3600 = load ptr, ptr %param_ptr2
  %t3601 = call ptr @ptr_to_node(ptr %t3600)
  store ptr %t3601, ptr %param_node
  %t3602 = load ptr, ptr %param_node
  %t3603 = getelementptr inbounds %ASTNode, ptr %t3602, i32 0, i32 5
  %t3604 = load ptr, ptr %t3603
  %t3605 = call ptr @ptr_to_node(ptr %t3604)
  store ptr %t3605, ptr %p_type_node
  %t3606 = load ptr, ptr %p_type_node
  %t3607 = call ptr @map_type_node(ptr %t3606)
  store ptr %t3607, ptr %p_type_str
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
  %t3671 = load ptr, ptr %expr
  %t3672 = getelementptr inbounds %ASTNode, ptr %t3671, i32 0, i32 0
  %t3673 = load i32, ptr %t3672
  %t3674 = icmp eq i32 %t3673, 22
  br i1 %t3674, label %label_1179, label %label_1181
label_1179:
  %t3675 = load ptr, ptr %expr
  %t3676 = getelementptr inbounds %ASTNode, ptr %t3675, i32 0, i32 3
  %t3677 = load i32, ptr %t3676
  %t3678 = icmp eq i32 %t3677, 0
  br i1 %t3678, label %label_1182, label %label_1184
label_1182:
  %t3679 = getelementptr inbounds [7 x i8], ptr @.str.s432, i64 0, i64 0
  %t3680 = load i32, ptr @ir_string_counter
  %t3681 = call ptr @int_to_str(i32 %t3680)
  %t3682 = call ptr @str_concat(ptr %t3679, ptr %t3681)
  store ptr %t3682, ptr %str_name
  %t3683 = load i32, ptr @ir_string_counter
  %t3684 = add i32 %t3683, 1
  store i32 %t3684, ptr @ir_string_counter
  %t3685 = load ptr, ptr %str_name
  %t3686 = load ptr, ptr %expr
  %t3687 = getelementptr inbounds %ASTNode, ptr %t3686, i32 0, i32 1
  %t3688 = load ptr, ptr %t3687
  call void @ir_global_string(ptr %t3685, ptr %t3688)
  %t3689 = load ptr, ptr %expr
  %t3690 = load ptr, ptr %str_name
  %t3691 = getelementptr inbounds %ASTNode, ptr %t3689, i32 0, i32 2
  store ptr %t3690, ptr %t3691
  br label %label_1184
label_1184:
  br label %label_1181
label_1181:
  %t3692 = load ptr, ptr %expr
  %t3693 = getelementptr inbounds %ASTNode, ptr %t3692, i32 0, i32 0
  %t3694 = load i32, ptr %t3693
  %t3695 = icmp eq i32 %t3694, 20
  br i1 %t3695, label %label_1185, label %label_1187
label_1185:
  %t3696 = load ptr, ptr %expr
  %t3697 = getelementptr inbounds %ASTNode, ptr %t3696, i32 0, i32 5
  %t3698 = load ptr, ptr %t3697
  %t3699 = getelementptr inbounds [1 x i8], ptr @.str.s433, i64 0, i64 0
  %t3700 = call i32 @str_equals(ptr %t3698, ptr %t3699)
  %t3701 = icmp eq i32 %t3700, 0
  br i1 %t3701, label %label_1188, label %label_1190
label_1188:
  %t3702 = load ptr, ptr %expr
  %t3703 = getelementptr inbounds %ASTNode, ptr %t3702, i32 0, i32 5
  %t3704 = load ptr, ptr %t3703
  %t3705 = call ptr @ptr_to_node(ptr %t3704)
  call void @collect_strings_expr(ptr %t3705)
  br label %label_1190
label_1190:
  %t3706 = load ptr, ptr %expr
  %t3707 = getelementptr inbounds %ASTNode, ptr %t3706, i32 0, i32 6
  %t3708 = load ptr, ptr %t3707
  %t3709 = getelementptr inbounds [1 x i8], ptr @.str.s434, i64 0, i64 0
  %t3710 = call i32 @str_equals(ptr %t3708, ptr %t3709)
  %t3711 = icmp eq i32 %t3710, 0
  br i1 %t3711, label %label_1191, label %label_1193
label_1191:
  %t3712 = load ptr, ptr %expr
  %t3713 = getelementptr inbounds %ASTNode, ptr %t3712, i32 0, i32 6
  %t3714 = load ptr, ptr %t3713
  %t3715 = call ptr @ptr_to_node(ptr %t3714)
  call void @collect_strings_expr(ptr %t3715)
  br label %label_1193
label_1193:
  br label %label_1187
label_1187:
  %t3716 = load ptr, ptr %expr
  %t3717 = getelementptr inbounds %ASTNode, ptr %t3716, i32 0, i32 0
  %t3718 = load i32, ptr %t3717
  %t3719 = icmp eq i32 %t3718, 24
  br i1 %t3719, label %label_1194, label %label_1196
label_1194:
  %t3720 = load ptr, ptr %expr
  %t3721 = getelementptr inbounds %ASTNode, ptr %t3720, i32 0, i32 6
  %t3722 = load ptr, ptr %t3721
  store ptr %t3722, ptr %arg_ptr
  br label %label_1197
label_1197:
  %t3723 = load ptr, ptr %arg_ptr
  %t3724 = getelementptr inbounds [1 x i8], ptr @.str.s435, i64 0, i64 0
  %t3725 = call i32 @str_equals(ptr %t3723, ptr %t3724)
  %t3726 = icmp eq i32 %t3725, 0
  br i1 %t3726, label %label_1198, label %label_1199
label_1198:
  %t3727 = load ptr, ptr %arg_ptr
  %t3728 = call ptr @ptr_to_node(ptr %t3727)
  store ptr %t3728, ptr %arg_node
  %t3729 = load ptr, ptr %arg_node
  call void @collect_strings_expr(ptr %t3729)
  %t3730 = load ptr, ptr %arg_node
  %t3731 = getelementptr inbounds %ASTNode, ptr %t3730, i32 0, i32 8
  %t3732 = load ptr, ptr %t3731
  store ptr %t3732, ptr %arg_ptr
  br label %label_1197
label_1199:
  br label %label_1196
label_1196:
  %t3733 = load ptr, ptr %expr
  %t3734 = getelementptr inbounds %ASTNode, ptr %t3733, i32 0, i32 0
  %t3735 = load i32, ptr %t3734
  %t3736 = icmp eq i32 %t3735, 27
  br i1 %t3736, label %label_1200, label %label_1202
label_1200:
  %t3737 = load ptr, ptr %expr
  %t3738 = getelementptr inbounds %ASTNode, ptr %t3737, i32 0, i32 5
  %t3739 = load ptr, ptr %t3738
  store ptr %t3739, ptr %elem_ptr
  br label %label_1203
label_1203:
  %t3740 = load ptr, ptr %elem_ptr
  %t3741 = getelementptr inbounds [1 x i8], ptr @.str.s436, i64 0, i64 0
  %t3742 = call i32 @str_equals(ptr %t3740, ptr %t3741)
  %t3743 = icmp eq i32 %t3742, 0
  br i1 %t3743, label %label_1204, label %label_1205
label_1204:
  %t3744 = load ptr, ptr %elem_ptr
  %t3745 = call ptr @ptr_to_node(ptr %t3744)
  store ptr %t3745, ptr %elem_node
  %t3746 = load ptr, ptr %elem_node
  call void @collect_strings_expr(ptr %t3746)
  %t3747 = load ptr, ptr %elem_node
  %t3748 = getelementptr inbounds %ASTNode, ptr %t3747, i32 0, i32 8
  %t3749 = load ptr, ptr %t3748
  store ptr %t3749, ptr %elem_ptr
  br label %label_1203
label_1205:
  br label %label_1202
label_1202:
  %t3750 = load ptr, ptr %expr
  %t3751 = getelementptr inbounds %ASTNode, ptr %t3750, i32 0, i32 0
  %t3752 = load i32, ptr %t3751
  %t3753 = icmp eq i32 %t3752, 26
  br i1 %t3753, label %label_1206, label %label_1208
label_1206:
  %t3754 = load ptr, ptr %expr
  %t3755 = getelementptr inbounds %ASTNode, ptr %t3754, i32 0, i32 5
  %t3756 = load ptr, ptr %t3755
  %t3757 = getelementptr inbounds [1 x i8], ptr @.str.s437, i64 0, i64 0
  %t3758 = call i32 @str_equals(ptr %t3756, ptr %t3757)
  %t3759 = icmp eq i32 %t3758, 0
  br i1 %t3759, label %label_1209, label %label_1211
label_1209:
  %t3760 = load ptr, ptr %expr
  %t3761 = getelementptr inbounds %ASTNode, ptr %t3760, i32 0, i32 5
  %t3762 = load ptr, ptr %t3761
  %t3763 = call ptr @ptr_to_node(ptr %t3762)
  call void @collect_strings_expr(ptr %t3763)
  br label %label_1211
label_1211:
  %t3764 = load ptr, ptr %expr
  %t3765 = getelementptr inbounds %ASTNode, ptr %t3764, i32 0, i32 6
  %t3766 = load ptr, ptr %t3765
  %t3767 = getelementptr inbounds [1 x i8], ptr @.str.s438, i64 0, i64 0
  %t3768 = call i32 @str_equals(ptr %t3766, ptr %t3767)
  %t3769 = icmp eq i32 %t3768, 0
  br i1 %t3769, label %label_1212, label %label_1214
label_1212:
  %t3770 = load ptr, ptr %expr
  %t3771 = getelementptr inbounds %ASTNode, ptr %t3770, i32 0, i32 6
  %t3772 = load ptr, ptr %t3771
  %t3773 = call ptr @ptr_to_node(ptr %t3772)
  call void @collect_strings_expr(ptr %t3773)
  br label %label_1214
label_1214:
  br label %label_1208
label_1208:
  %t3774 = load ptr, ptr %expr
  %t3775 = getelementptr inbounds %ASTNode, ptr %t3774, i32 0, i32 0
  %t3776 = load i32, ptr %t3775
  %t3777 = icmp eq i32 %t3776, 25
  br i1 %t3777, label %label_1215, label %label_1217
label_1215:
  %t3778 = load ptr, ptr %expr
  %t3779 = getelementptr inbounds %ASTNode, ptr %t3778, i32 0, i32 5
  %t3780 = load ptr, ptr %t3779
  %t3781 = getelementptr inbounds [1 x i8], ptr @.str.s439, i64 0, i64 0
  %t3782 = call i32 @str_equals(ptr %t3780, ptr %t3781)
  %t3783 = icmp eq i32 %t3782, 0
  br i1 %t3783, label %label_1218, label %label_1220
label_1218:
  %t3784 = load ptr, ptr %expr
  %t3785 = getelementptr inbounds %ASTNode, ptr %t3784, i32 0, i32 5
  %t3786 = load ptr, ptr %t3785
  %t3787 = call ptr @ptr_to_node(ptr %t3786)
  call void @collect_strings_expr(ptr %t3787)
  br label %label_1220
label_1220:
  br label %label_1217
label_1217:
  %t3788 = load ptr, ptr %expr
  %t3789 = getelementptr inbounds %ASTNode, ptr %t3788, i32 0, i32 0
  %t3790 = load i32, ptr %t3789
  %t3791 = icmp eq i32 %t3790, 28
  br i1 %t3791, label %label_1221, label %label_1223
label_1221:
  %t3792 = load ptr, ptr %expr
  %t3793 = getelementptr inbounds %ASTNode, ptr %t3792, i32 0, i32 5
  %t3794 = load ptr, ptr %t3793
  store ptr %t3794, ptr %field_ptr
  br label %label_1224
label_1224:
  %t3795 = load ptr, ptr %field_ptr
  %t3796 = getelementptr inbounds [1 x i8], ptr @.str.s440, i64 0, i64 0
  %t3797 = call i32 @str_equals(ptr %t3795, ptr %t3796)
  %t3798 = icmp eq i32 %t3797, 0
  br i1 %t3798, label %label_1225, label %label_1226
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
  %t3819 = load ptr, ptr %ext
  %t3820 = load ptr, ptr %ext
  %t3821 = getelementptr inbounds %ASTNode, ptr %t3820, i32 0, i32 6
  %t3822 = load ptr, ptr %t3821
  %t3823 = call ptr @get_declared_return_type(ptr %t3819, ptr %t3822)
  store ptr %t3823, ptr %ret_type
  %t3824 = load ptr, ptr %ext
  %t3825 = getelementptr inbounds %ASTNode, ptr %t3824, i32 0, i32 1
  %t3826 = load ptr, ptr %t3825
  %t3827 = call ptr @fn_key(ptr %t3826)
  %t3828 = load ptr, ptr %ret_type
  call void @ir_set_var_type(ptr %t3827, ptr %t3828)
  %t3829 = load ptr, ptr %ext
  %t3830 = getelementptr inbounds %ASTNode, ptr %t3829, i32 0, i32 1
  %t3831 = load ptr, ptr %t3830
  %t3832 = load ptr, ptr %ret_type
  %t3833 = call ptr @storage_type(ptr %t3832)
  call void @ir_declare_function_begin(ptr %t3831, ptr %t3833)
  %t3834 = load ptr, ptr %ext
  %t3835 = getelementptr inbounds %ASTNode, ptr %t3834, i32 0, i32 5
  %t3836 = load ptr, ptr %t3835
  store ptr %t3836, ptr %param_ptr
  br label %label_1230
label_1230:
  %t3837 = load ptr, ptr %param_ptr
  %t3838 = getelementptr inbounds [1 x i8], ptr @.str.s442, i64 0, i64 0
  %t3839 = call i32 @str_equals(ptr %t3837, ptr %t3838)
  %t3840 = icmp eq i32 %t3839, 0
  br i1 %t3840, label %label_1231, label %label_1232
label_1231:
  %t3841 = load ptr, ptr %param_ptr
  %t3842 = call ptr @ptr_to_node(ptr %t3841)
  store ptr %t3842, ptr %param_node
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
  %t3857 = load ptr, ptr %module
  %t3858 = getelementptr inbounds %ASTNode, ptr %t3857, i32 0, i32 5
  %t3859 = load ptr, ptr %t3858
  store ptr %t3859, ptr %stmt_ptr
  br label %label_1233
label_1233:
  %t3860 = load ptr, ptr %stmt_ptr
  %t3861 = getelementptr inbounds [1 x i8], ptr @.str.s443, i64 0, i64 0
  %t3862 = call i32 @str_equals(ptr %t3860, ptr %t3861)
  %t3863 = icmp eq i32 %t3862, 0
  br i1 %t3863, label %label_1234, label %label_1235
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
  %t3884 = load ptr, ptr %enum_node
  %t3885 = getelementptr inbounds %ASTNode, ptr %t3884, i32 0, i32 5
  %t3886 = load ptr, ptr %t3885
  store ptr %t3886, ptr %variant_ptr
  store i32 0, ptr %value
  br label %label_1239
label_1239:
  %t3887 = load ptr, ptr %variant_ptr
  %t3888 = getelementptr inbounds [1 x i8], ptr @.str.s444, i64 0, i64 0
  %t3889 = call i32 @str_equals(ptr %t3887, ptr %t3888)
  %t3890 = icmp eq i32 %t3889, 0
  br i1 %t3890, label %label_1240, label %label_1241
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
  %first_field = alloca ptr
  %field_ptr = alloca ptr
  %field_count = alloca i32
  %field = alloca ptr
  %type_node = alloca ptr
  %field_type = alloca ptr
  store ptr %p_struct_node, ptr %struct_node
  %t3917 = load ptr, ptr %struct_node
  %t3918 = getelementptr inbounds %ASTNode, ptr %t3917, i32 0, i32 5
  %t3919 = load ptr, ptr %t3918
  store ptr %t3919, ptr %first_field_ptr
  %t3920 = load ptr, ptr %first_field_ptr
  %t3921 = getelementptr inbounds [1 x i8], ptr @.str.s445, i64 0, i64 0
  %t3922 = call i32 @str_equals(ptr %t3920, ptr %t3921)
  %t3923 = icmp eq i32 %t3922, 0
  br i1 %t3923, label %label_1242, label %label_1244
label_1242:
  %t3924 = load ptr, ptr %first_field_ptr
  %t3925 = call ptr @ptr_to_node(ptr %t3924)
  store ptr %t3925, ptr %first_field
  %t3926 = load ptr, ptr %struct_node
  %t3927 = getelementptr inbounds %ASTNode, ptr %t3926, i32 0, i32 1
  %t3928 = load ptr, ptr %t3927
  %t3929 = load ptr, ptr %first_field
  %t3930 = getelementptr inbounds %ASTNode, ptr %t3929, i32 0, i32 1
  %t3931 = load ptr, ptr %t3930
  %t3932 = call i32 @ir_get_struct_field_index(ptr %t3928, ptr %t3931)
  %t3933 = icmp sge i32 %t3932, 0
  br i1 %t3933, label %label_1245, label %label_1247
label_1245:
  ret void
label_1247:
  br label %label_1244
label_1244:
  %t3934 = getelementptr inbounds [2 x i8], ptr @.str.s446, i64 0, i64 0
  call void @ir_append(ptr %t3934)
  %t3935 = load ptr, ptr %struct_node
  %t3936 = getelementptr inbounds %ASTNode, ptr %t3935, i32 0, i32 1
  %t3937 = load ptr, ptr %t3936
  call void @ir_append(ptr %t3937)
  %t3938 = getelementptr inbounds [11 x i8], ptr @.str.s447, i64 0, i64 0
  call void @ir_append(ptr %t3938)
  %t3939 = load ptr, ptr %struct_node
  %t3940 = getelementptr inbounds %ASTNode, ptr %t3939, i32 0, i32 5
  %t3941 = load ptr, ptr %t3940
  store ptr %t3941, ptr %field_ptr
  store i32 0, ptr %field_count
  br label %label_1248
label_1248:
  %t3942 = load ptr, ptr %field_ptr
  %t3943 = getelementptr inbounds [1 x i8], ptr @.str.s448, i64 0, i64 0
  %t3944 = call i32 @str_equals(ptr %t3942, ptr %t3943)
  %t3945 = icmp eq i32 %t3944, 0
  br i1 %t3945, label %label_1249, label %label_1250
label_1249:
  %t3946 = load ptr, ptr %field_ptr
  %t3947 = call ptr @ptr_to_node(ptr %t3946)
  store ptr %t3947, ptr %field
  %t3948 = load ptr, ptr %field
  %t3949 = getelementptr inbounds %ASTNode, ptr %t3948, i32 0, i32 5
  %t3950 = load ptr, ptr %t3949
  %t3951 = call ptr @ptr_to_node(ptr %t3950)
  store ptr %t3951, ptr %type_node
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
  %t3974 = load ptr, ptr %stmt
  %t3975 = getelementptr inbounds %ASTNode, ptr %t3974, i32 0, i32 0
  %t3976 = load i32, ptr %t3975
  %t3977 = icmp eq i32 %t3976, 3
  br i1 %t3977, label %label_1254, label %label_1256
label_1254:
  %t3978 = load ptr, ptr %stmt
  %t3979 = getelementptr inbounds %ASTNode, ptr %t3978, i32 0, i32 6
  %t3980 = load ptr, ptr %t3979
  %t3981 = getelementptr inbounds [1 x i8], ptr @.str.s451, i64 0, i64 0
  %t3982 = call i32 @str_equals(ptr %t3980, ptr %t3981)
  %t3983 = icmp eq i32 %t3982, 0
  br i1 %t3983, label %label_1257, label %label_1259
label_1257:
  %t3984 = load ptr, ptr %stmt
  %t3985 = getelementptr inbounds %ASTNode, ptr %t3984, i32 0, i32 6
  %t3986 = load ptr, ptr %t3985
  %t3987 = call ptr @ptr_to_node(ptr %t3986)
  call void @collect_strings_expr(ptr %t3987)
  br label %label_1259
label_1259:
  br label %label_1256
label_1256:
  %t3988 = load ptr, ptr %stmt
  %t3989 = getelementptr inbounds %ASTNode, ptr %t3988, i32 0, i32 0
  %t3990 = load i32, ptr %t3989
  %t3991 = icmp eq i32 %t3990, 17
  br i1 %t3991, label %label_1260, label %label_1262
label_1260:
  %t3992 = load ptr, ptr %stmt
  %t3993 = getelementptr inbounds %ASTNode, ptr %t3992, i32 0, i32 5
  %t3994 = load ptr, ptr %t3993
  %t3995 = getelementptr inbounds [1 x i8], ptr @.str.s452, i64 0, i64 0
  %t3996 = call i32 @str_equals(ptr %t3994, ptr %t3995)
  %t3997 = icmp eq i32 %t3996, 0
  br i1 %t3997, label %label_1263, label %label_1265
label_1263:
  %t3998 = load ptr, ptr %stmt
  %t3999 = getelementptr inbounds %ASTNode, ptr %t3998, i32 0, i32 5
  %t4000 = load ptr, ptr %t3999
  %t4001 = call ptr @ptr_to_node(ptr %t4000)
  call void @collect_strings_expr(ptr %t4001)
  br label %label_1265
label_1265:
  br label %label_1262
label_1262:
  %t4002 = load ptr, ptr %stmt
  %t4003 = getelementptr inbounds %ASTNode, ptr %t4002, i32 0, i32 0
  %t4004 = load i32, ptr %t4003
  %t4005 = icmp eq i32 %t4004, 15
  br i1 %t4005, label %label_1266, label %label_1268
label_1266:
  %t4006 = load ptr, ptr %stmt
  %t4007 = getelementptr inbounds %ASTNode, ptr %t4006, i32 0, i32 5
  %t4008 = load ptr, ptr %t4007
  %t4009 = getelementptr inbounds [1 x i8], ptr @.str.s453, i64 0, i64 0
  %t4010 = call i32 @str_equals(ptr %t4008, ptr %t4009)
  %t4011 = icmp eq i32 %t4010, 0
  br i1 %t4011, label %label_1269, label %label_1271
label_1269:
  %t4012 = load ptr, ptr %stmt
  %t4013 = getelementptr inbounds %ASTNode, ptr %t4012, i32 0, i32 5
  %t4014 = load ptr, ptr %t4013
  %t4015 = call ptr @ptr_to_node(ptr %t4014)
  call void @collect_strings_expr(ptr %t4015)
  br label %label_1271
label_1271:
  br label %label_1268
label_1268:
  %t4016 = load ptr, ptr %stmt
  %t4017 = getelementptr inbounds %ASTNode, ptr %t4016, i32 0, i32 0
  %t4018 = load i32, ptr %t4017
  %t4019 = icmp eq i32 %t4018, 16
  br i1 %t4019, label %label_1272, label %label_1274
label_1272:
  %t4020 = load ptr, ptr %stmt
  %t4021 = getelementptr inbounds %ASTNode, ptr %t4020, i32 0, i32 6
  %t4022 = load ptr, ptr %t4021
  %t4023 = getelementptr inbounds [1 x i8], ptr @.str.s454, i64 0, i64 0
  %t4024 = call i32 @str_equals(ptr %t4022, ptr %t4023)
  %t4025 = icmp eq i32 %t4024, 0
  br i1 %t4025, label %label_1275, label %label_1277
label_1275:
  %t4026 = load ptr, ptr %stmt
  %t4027 = getelementptr inbounds %ASTNode, ptr %t4026, i32 0, i32 6
  %t4028 = load ptr, ptr %t4027
  %t4029 = call ptr @ptr_to_node(ptr %t4028)
  call void @collect_strings_expr(ptr %t4029)
  br label %label_1277
label_1277:
  br label %label_1274
label_1274:
  %t4030 = load ptr, ptr %stmt
  %t4031 = getelementptr inbounds %ASTNode, ptr %t4030, i32 0, i32 0
  %t4032 = load i32, ptr %t4031
  %t4033 = icmp eq i32 %t4032, 10
  br i1 %t4033, label %label_1278, label %label_1280
label_1278:
  %t4034 = load ptr, ptr %stmt
  %t4035 = getelementptr inbounds %ASTNode, ptr %t4034, i32 0, i32 5
  %t4036 = load ptr, ptr %t4035
  %t4037 = call ptr @ptr_to_node(ptr %t4036)
  call void @collect_strings_expr(ptr %t4037)
  %t4038 = load ptr, ptr %stmt
  %t4039 = getelementptr inbounds %ASTNode, ptr %t4038, i32 0, i32 6
  %t4040 = load ptr, ptr %t4039
  %t4041 = call ptr @ptr_to_node(ptr %t4040)
  call void @collect_strings_block(ptr %t4041)
  %t4042 = load ptr, ptr %stmt
  %t4043 = getelementptr inbounds %ASTNode, ptr %t4042, i32 0, i32 7
  %t4044 = load ptr, ptr %t4043
  %t4045 = getelementptr inbounds [1 x i8], ptr @.str.s455, i64 0, i64 0
  %t4046 = call i32 @str_equals(ptr %t4044, ptr %t4045)
  %t4047 = icmp eq i32 %t4046, 0
  br i1 %t4047, label %label_1281, label %label_1283
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
  %t4073 = load ptr, ptr %block
  %t4074 = getelementptr inbounds %ASTNode, ptr %t4073, i32 0, i32 5
  %t4075 = load ptr, ptr %t4074
  store ptr %t4075, ptr %s_ptr
  br label %label_1290
label_1290:
  %t4076 = load ptr, ptr %s_ptr
  %t4077 = getelementptr inbounds [1 x i8], ptr @.str.s456, i64 0, i64 0
  %t4078 = call i32 @str_equals(ptr %t4076, ptr %t4077)
  %t4079 = icmp eq i32 %t4078, 0
  br i1 %t4079, label %label_1291, label %label_1292
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
  %type_stmt = alloca ptr
  %struct_stmt_ptr = alloca ptr
  %struct_stmt = alloca ptr
  %stmt_ptr = alloca ptr
  %stmt = alloca ptr
  %init_val = alloca ptr
  %var_type = alloca ptr
  %type_node = alloca ptr
  %init_node = alloca ptr
  %ret_type = alloca ptr
  %stmt_ptr2 = alloca ptr
  %stmt2 = alloca ptr
  store ptr %p_module, ptr %module
  call void @ir_reset_globals()
  call void @ir_reset_types()
  call void @ir_clear_var_types()
  %t4111 = getelementptr inbounds [19 x i8], ptr @.str.s458, i64 0, i64 0
  call void @ir_module_start(ptr %t4111)
  %t4112 = load ptr, ptr %module
  %t4113 = getelementptr inbounds %ASTNode, ptr %t4112, i32 0, i32 5
  %t4114 = load ptr, ptr %t4113
  store ptr %t4114, ptr %type_stmt_ptr
  br label %label_1296
label_1296:
  %t4115 = load ptr, ptr %type_stmt_ptr
  %t4116 = getelementptr inbounds [1 x i8], ptr @.str.s459, i64 0, i64 0
  %t4117 = call i32 @str_equals(ptr %t4115, ptr %t4116)
  %t4118 = icmp eq i32 %t4117, 0
  br i1 %t4118, label %label_1297, label %label_1298
label_1297:
  %t4119 = load ptr, ptr %type_stmt_ptr
  %t4120 = call ptr @ptr_to_node(ptr %t4119)
  store ptr %t4120, ptr %type_stmt
  %t4121 = load ptr, ptr %type_stmt
  %t4122 = getelementptr inbounds %ASTNode, ptr %t4121, i32 0, i32 0
  %t4123 = load i32, ptr %t4122
  %t4124 = icmp eq i32 %t4123, 6
  br i1 %t4124, label %label_1299, label %label_1301
label_1299:
  %t4125 = load ptr, ptr %type_stmt
  call void @register_enum_decl(ptr %t4125)
  br label %label_1301
label_1301:
  %t4126 = load ptr, ptr %type_stmt
  %t4127 = getelementptr inbounds %ASTNode, ptr %t4126, i32 0, i32 0
  %t4128 = load i32, ptr %t4127
  %t4129 = icmp eq i32 %t4128, 5
  br i1 %t4129, label %label_1302, label %label_1304
label_1302:
  %t4130 = load ptr, ptr %type_stmt
  call void @register_struct_name(ptr %t4130)
  br label %label_1304
label_1304:
  %t4131 = load ptr, ptr %type_stmt
  %t4132 = getelementptr inbounds %ASTNode, ptr %t4131, i32 0, i32 8
  %t4133 = load ptr, ptr %t4132
  store ptr %t4133, ptr %type_stmt_ptr
  br label %label_1296
label_1298:
  %t4134 = load ptr, ptr %module
  %t4135 = getelementptr inbounds %ASTNode, ptr %t4134, i32 0, i32 5
  %t4136 = load ptr, ptr %t4135
  store ptr %t4136, ptr %struct_stmt_ptr
  br label %label_1305
label_1305:
  %t4137 = load ptr, ptr %struct_stmt_ptr
  %t4138 = getelementptr inbounds [1 x i8], ptr @.str.s460, i64 0, i64 0
  %t4139 = call i32 @str_equals(ptr %t4137, ptr %t4138)
  %t4140 = icmp eq i32 %t4139, 0
  br i1 %t4140, label %label_1306, label %label_1307
label_1306:
  %t4141 = load ptr, ptr %struct_stmt_ptr
  %t4142 = call ptr @ptr_to_node(ptr %t4141)
  store ptr %t4142, ptr %struct_stmt
  %t4143 = load ptr, ptr %struct_stmt
  %t4144 = getelementptr inbounds %ASTNode, ptr %t4143, i32 0, i32 0
  %t4145 = load i32, ptr %t4144
  %t4146 = icmp eq i32 %t4145, 5
  br i1 %t4146, label %label_1308, label %label_1310
label_1308:
  %t4147 = load ptr, ptr %struct_stmt
  call void @generate_struct_decl(ptr %t4147)
  br label %label_1310
label_1310:
  %t4148 = load ptr, ptr %struct_stmt
  %t4149 = getelementptr inbounds %ASTNode, ptr %t4148, i32 0, i32 8
  %t4150 = load ptr, ptr %t4149
  store ptr %t4150, ptr %struct_stmt_ptr
  br label %label_1305
label_1307:
  call void @ir_blank_line()
  %t4151 = getelementptr inbounds [7 x i8], ptr @.str.s461, i64 0, i64 0
  %t4152 = getelementptr inbounds [4 x i8], ptr @.str.s462, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4151, ptr %t4152)
  %t4153 = getelementptr inbounds [4 x i8], ptr @.str.s463, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4153)
  call void @ir_declare_function_end()
  %t4154 = getelementptr inbounds [8 x i8], ptr @.str.s464, i64 0, i64 0
  %t4155 = getelementptr inbounds [5 x i8], ptr @.str.s465, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4154, ptr %t4155)
  %t4156 = getelementptr inbounds [4 x i8], ptr @.str.s466, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4156)
  call void @ir_declare_function_end()
  %t4157 = getelementptr inbounds [6 x i8], ptr @.str.s467, i64 0, i64 0
  %t4158 = getelementptr inbounds [5 x i8], ptr @.str.s468, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4157, ptr %t4158)
  %t4159 = getelementptr inbounds [4 x i8], ptr @.str.s469, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4159)
  call void @ir_declare_function_end()
  %t4160 = getelementptr inbounds [12 x i8], ptr @.str.s470, i64 0, i64 0
  %t4161 = getelementptr inbounds [5 x i8], ptr @.str.s471, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4160, ptr %t4161)
  %t4162 = getelementptr inbounds [4 x i8], ptr @.str.s472, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4162)
  call void @ir_declare_function_end()
  %t4163 = getelementptr inbounds [10 x i8], ptr @.str.s473, i64 0, i64 0
  %t4164 = getelementptr inbounds [5 x i8], ptr @.str.s474, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4163, ptr %t4164)
  %t4165 = getelementptr inbounds [4 x i8], ptr @.str.s475, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4165)
  call void @ir_declare_function_end()
  %t4166 = getelementptr inbounds [13 x i8], ptr @.str.s476, i64 0, i64 0
  %t4167 = getelementptr inbounds [5 x i8], ptr @.str.s477, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4166, ptr %t4167)
  %t4168 = getelementptr inbounds [4 x i8], ptr @.str.s478, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4168)
  call void @ir_declare_function_end()
  %t4169 = getelementptr inbounds [11 x i8], ptr @.str.s479, i64 0, i64 0
  %t4170 = getelementptr inbounds [5 x i8], ptr @.str.s480, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4169, ptr %t4170)
  %t4171 = getelementptr inbounds [4 x i8], ptr @.str.s481, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4171)
  call void @ir_declare_function_end()
  %t4172 = getelementptr inbounds [13 x i8], ptr @.str.s482, i64 0, i64 0
  %t4173 = getelementptr inbounds [5 x i8], ptr @.str.s483, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4172, ptr %t4173)
  %t4174 = getelementptr inbounds [3 x i8], ptr @.str.s484, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4174)
  call void @ir_declare_function_end()
  %t4175 = getelementptr inbounds [11 x i8], ptr @.str.s485, i64 0, i64 0
  %t4176 = getelementptr inbounds [5 x i8], ptr @.str.s486, i64 0, i64 0
  call void @ir_declare_function_begin(ptr %t4175, ptr %t4176)
  %t4177 = getelementptr inbounds [3 x i8], ptr @.str.s487, i64 0, i64 0
  call void @ir_declare_function_param(ptr %t4177)
  call void @ir_declare_function_end()
  call void @ir_blank_line()
  %t4178 = load ptr, ptr %module
  %t4179 = getelementptr inbounds %ASTNode, ptr %t4178, i32 0, i32 5
  %t4180 = load ptr, ptr %t4179
  store ptr %t4180, ptr %stmt_ptr
  br label %label_1311
label_1311:
  %t4181 = load ptr, ptr %stmt_ptr
  %t4182 = getelementptr inbounds [1 x i8], ptr @.str.s488, i64 0, i64 0
  %t4183 = call i32 @str_equals(ptr %t4181, ptr %t4182)
  %t4184 = icmp eq i32 %t4183, 0
  br i1 %t4184, label %label_1312, label %label_1313
label_1312:
  %t4185 = load ptr, ptr %stmt_ptr
  %t4186 = call ptr @ptr_to_node(ptr %t4185)
  store ptr %t4186, ptr %stmt
  %t4187 = load ptr, ptr %stmt
  %t4188 = getelementptr inbounds %ASTNode, ptr %t4187, i32 0, i32 0
  %t4189 = load i32, ptr %t4188
  %t4190 = icmp eq i32 %t4189, 2
  br i1 %t4190, label %label_1314, label %label_1316
label_1314:
  %t4191 = load ptr, ptr %module
  %t4192 = load ptr, ptr %stmt
  %t4193 = getelementptr inbounds %ASTNode, ptr %t4192, i32 0, i32 1
  %t4194 = load ptr, ptr %t4193
  %t4195 = call i1 @module_has_function(ptr %t4191, ptr %t4194)
  %t4196 = icmp eq i1 %t4195, 0
  br i1 %t4196, label %label_1317, label %label_1319
label_1317:
  %t4197 = load ptr, ptr %stmt
  call void @declare_extern_function(ptr %t4197)
  br label %label_1319
label_1319:
  br label %label_1316
label_1316:
  %t4198 = load ptr, ptr %stmt
  %t4199 = getelementptr inbounds %ASTNode, ptr %t4198, i32 0, i32 0
  %t4200 = load i32, ptr %t4199
  %t4201 = icmp eq i32 %t4200, 3
  br i1 %t4201, label %label_1320, label %label_1322
label_1320:
  %t4202 = getelementptr inbounds [2 x i8], ptr @.str.s489, i64 0, i64 0
  store ptr %t4202, ptr %init_val
  %t4203 = getelementptr inbounds [4 x i8], ptr @.str.s490, i64 0, i64 0
  store ptr %t4203, ptr %var_type
  %t4204 = load ptr, ptr %stmt
  %t4205 = getelementptr inbounds %ASTNode, ptr %t4204, i32 0, i32 5
  %t4206 = load ptr, ptr %t4205
  %t4207 = getelementptr inbounds [1 x i8], ptr @.str.s491, i64 0, i64 0
  %t4208 = call i32 @str_equals(ptr %t4206, ptr %t4207)
  %t4209 = icmp eq i32 %t4208, 0
  br i1 %t4209, label %label_1323, label %label_1325
label_1323:
  %t4210 = load ptr, ptr %stmt
  %t4211 = getelementptr inbounds %ASTNode, ptr %t4210, i32 0, i32 5
  %t4212 = load ptr, ptr %t4211
  %t4213 = call ptr @ptr_to_node(ptr %t4212)
  store ptr %t4213, ptr %type_node
  %t4214 = load ptr, ptr %type_node
  %t4215 = call ptr @map_type_node(ptr %t4214)
  store ptr %t4215, ptr %var_type
  br label %label_1325
label_1325:
  %t4216 = load ptr, ptr %stmt
  %t4217 = getelementptr inbounds %ASTNode, ptr %t4216, i32 0, i32 6
  %t4218 = load ptr, ptr %t4217
  %t4219 = getelementptr inbounds [1 x i8], ptr @.str.s492, i64 0, i64 0
  %t4220 = call i32 @str_equals(ptr %t4218, ptr %t4219)
  %t4221 = icmp eq i32 %t4220, 0
  br i1 %t4221, label %label_1326, label %label_1328
label_1326:
  %t4222 = load ptr, ptr %stmt
  %t4223 = getelementptr inbounds %ASTNode, ptr %t4222, i32 0, i32 6
  %t4224 = load ptr, ptr %t4223
  %t4225 = call ptr @ptr_to_node(ptr %t4224)
  store ptr %t4225, ptr %init_node
  %t4226 = load ptr, ptr %init_node
  %t4227 = call ptr @get_expr_type(ptr %t4226)
  store ptr %t4227, ptr %var_type
  %t4228 = load ptr, ptr %init_node
  %t4229 = getelementptr inbounds %ASTNode, ptr %t4228, i32 0, i32 0
  %t4230 = load i32, ptr %t4229
  %t4231 = icmp eq i32 %t4230, 22
  br i1 %t4231, label %label_1329, label %label_1331
label_1329:
  %t4232 = load ptr, ptr %init_node
  %t4233 = getelementptr inbounds %ASTNode, ptr %t4232, i32 0, i32 1
  %t4234 = load ptr, ptr %t4233
  store ptr %t4234, ptr %init_val
  br label %label_1331
label_1331:
  br label %label_1328
label_1328:
  %t4235 = load ptr, ptr %stmt
  %t4236 = getelementptr inbounds %ASTNode, ptr %t4235, i32 0, i32 1
  %t4237 = load ptr, ptr %t4236
  %t4238 = load ptr, ptr %var_type
  %t4239 = call ptr @storage_type(ptr %t4238)
  %t4240 = load ptr, ptr %init_val
  call void @ir_global_var(ptr %t4237, ptr %t4239, ptr %t4240, i32 0)
  %t4241 = load ptr, ptr %stmt
  %t4242 = getelementptr inbounds %ASTNode, ptr %t4241, i32 0, i32 1
  %t4243 = load ptr, ptr %t4242
  call void @ir_register_global_name(ptr %t4243)
  %t4244 = load ptr, ptr %stmt
  %t4245 = getelementptr inbounds %ASTNode, ptr %t4244, i32 0, i32 1
  %t4246 = load ptr, ptr %t4245
  %t4247 = load ptr, ptr %var_type
  call void @ir_set_var_type(ptr %t4246, ptr %t4247)
  br label %label_1322
label_1322:
  %t4248 = load ptr, ptr %stmt
  %t4249 = getelementptr inbounds %ASTNode, ptr %t4248, i32 0, i32 0
  %t4250 = load i32, ptr %t4249
  %t4251 = icmp eq i32 %t4250, 4
  br i1 %t4251, label %label_1332, label %label_1334
label_1332:
  %t4252 = load ptr, ptr %stmt
  %t4253 = load ptr, ptr %stmt
  %t4254 = getelementptr inbounds %ASTNode, ptr %t4253, i32 0, i32 7
  %t4255 = load ptr, ptr %t4254
  %t4256 = call ptr @get_declared_return_type(ptr %t4252, ptr %t4255)
  store ptr %t4256, ptr %ret_type
  %t4257 = load ptr, ptr %stmt
  %t4258 = getelementptr inbounds %ASTNode, ptr %t4257, i32 0, i32 1
  %t4259 = load ptr, ptr %t4258
  %t4260 = getelementptr inbounds [5 x i8], ptr @.str.s493, i64 0, i64 0
  %t4261 = call i32 @str_equals(ptr %t4259, ptr %t4260)
  %t4262 = icmp eq i32 %t4261, 1
  br i1 %t4262, label %label_1335, label %label_1337
label_1335:
  %t4263 = getelementptr inbounds [4 x i8], ptr @.str.s494, i64 0, i64 0
  store ptr %t4263, ptr %ret_type
  br label %label_1337
label_1337:
  %t4264 = load ptr, ptr %stmt
  %t4265 = getelementptr inbounds %ASTNode, ptr %t4264, i32 0, i32 1
  %t4266 = load ptr, ptr %t4265
  %t4267 = call ptr @fn_key(ptr %t4266)
  %t4268 = load ptr, ptr %ret_type
  call void @ir_set_var_type(ptr %t4267, ptr %t4268)
  %t4269 = load ptr, ptr %stmt
  call void @collect_strings_function(ptr %t4269)
  br label %label_1334
label_1334:
  %t4270 = load ptr, ptr %stmt
  %t4271 = getelementptr inbounds %ASTNode, ptr %t4270, i32 0, i32 8
  %t4272 = load ptr, ptr %t4271
  store ptr %t4272, ptr %stmt_ptr
  br label %label_1311
label_1313:
  call void @ir_blank_line()
  %t4273 = load ptr, ptr %module
  %t4274 = getelementptr inbounds %ASTNode, ptr %t4273, i32 0, i32 5
  %t4275 = load ptr, ptr %t4274
  store ptr %t4275, ptr %stmt_ptr2
  br label %label_1338
label_1338:
  %t4276 = load ptr, ptr %stmt_ptr2
  %t4277 = getelementptr inbounds [1 x i8], ptr @.str.s495, i64 0, i64 0
  %t4278 = call i32 @str_equals(ptr %t4276, ptr %t4277)
  %t4279 = icmp eq i32 %t4278, 0
  br i1 %t4279, label %label_1339, label %label_1340
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
  %t4315 = load ptr, ptr %stmt
  %t4316 = call i1 @is_named_top_level(ptr %t4315)
  %t4317 = icmp eq i1 %t4316, 0
  br i1 %t4317, label %label_1359, label %label_1361
label_1359:
  ret i1 0
label_1361:
  %t4318 = load ptr, ptr %module
  %t4319 = getelementptr inbounds %ASTNode, ptr %t4318, i32 0, i32 5
  %t4320 = load ptr, ptr %t4319
  store ptr %t4320, ptr %scan_ptr
  br label %label_1362
label_1362:
  %t4321 = load ptr, ptr %scan_ptr
  %t4322 = getelementptr inbounds [1 x i8], ptr @.str.s496, i64 0, i64 0
  %t4323 = call i32 @str_equals(ptr %t4321, ptr %t4322)
  %t4324 = icmp eq i32 %t4323, 0
  br i1 %t4324, label %label_1363, label %label_1364
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
  %t4363 = load ptr, ptr %module
  %t4364 = load ptr, ptr %stmt
  %t4365 = call i1 @has_named_top_level(ptr %t4363, ptr %t4364)
  br i1 %t4365, label %label_1368, label %label_1370
label_1368:
  ret void
label_1370:
  %t4366 = load ptr, ptr %module
  %t4367 = getelementptr inbounds %ASTNode, ptr %t4366, i32 0, i32 5
  %t4368 = load ptr, ptr %t4367
  %t4369 = getelementptr inbounds [1 x i8], ptr @.str.s497, i64 0, i64 0
  %t4370 = call i32 @str_equals(ptr %t4368, ptr %t4369)
  %t4371 = icmp eq i32 %t4370, 1
  br i1 %t4371, label %label_1371, label %label_1373
label_1371:
  %t4372 = load ptr, ptr %module
  %t4373 = load ptr, ptr %stmt
  %t4374 = call ptr @node_to_ptr(ptr %t4373)
  %t4375 = getelementptr inbounds %ASTNode, ptr %t4372, i32 0, i32 5
  store ptr %t4374, ptr %t4375
  ret void
label_1373:
  %t4376 = load ptr, ptr %module
  %t4377 = getelementptr inbounds %ASTNode, ptr %t4376, i32 0, i32 5
  %t4378 = load ptr, ptr %t4377
  store ptr %t4378, ptr %tail_ptr
  store i1 1, ptr %searching
  br label %label_1374
label_1374:
  %t4379 = load i1, ptr %searching
  br i1 %t4379, label %label_1375, label %label_1376
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
  %t4400 = load ptr, ptr %source
  %t4401 = getelementptr inbounds %ASTNode, ptr %t4400, i32 0, i32 5
  %t4402 = load ptr, ptr %t4401
  store ptr %t4402, ptr %stmt_ptr
  br label %label_1380
label_1380:
  %t4403 = load ptr, ptr %stmt_ptr
  %t4404 = getelementptr inbounds [1 x i8], ptr @.str.s499, i64 0, i64 0
  %t4405 = call i32 @str_equals(ptr %t4403, ptr %t4404)
  %t4406 = icmp eq i32 %t4405, 0
  br i1 %t4406, label %label_1381, label %label_1382
label_1381:
  %t4407 = load ptr, ptr %stmt_ptr
  %t4408 = call ptr @ptr_to_node(ptr %t4407)
  store ptr %t4408, ptr %stmt
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
  %t4448 = call ptr @create_node(i32 0)
  store ptr %t4448, ptr %merged
  %t4449 = load ptr, ptr %module
  %t4450 = getelementptr inbounds %ASTNode, ptr %t4449, i32 0, i32 5
  %t4451 = load ptr, ptr %t4450
  store ptr %t4451, ptr %stmt_ptr
  br label %label_1389
label_1389:
  %t4452 = load ptr, ptr %stmt_ptr
  %t4453 = getelementptr inbounds [1 x i8], ptr @.str.s504, i64 0, i64 0
  %t4454 = call i32 @str_equals(ptr %t4452, ptr %t4453)
  %t4455 = icmp eq i32 %t4454, 0
  br i1 %t4455, label %label_1390, label %label_1391
label_1390:
  %t4456 = load ptr, ptr %stmt_ptr
  %t4457 = call ptr @ptr_to_node(ptr %t4456)
  store ptr %t4457, ptr %stmt
  %t4458 = load ptr, ptr %stmt
  %t4459 = getelementptr inbounds %ASTNode, ptr %t4458, i32 0, i32 8
  %t4460 = load ptr, ptr %t4459
  store ptr %t4460, ptr %next_stmt
  %t4461 = load ptr, ptr %stmt
  %t4462 = getelementptr inbounds [1 x i8], ptr @.str.s505, i64 0, i64 0
  %t4463 = getelementptr inbounds %ASTNode, ptr %t4461, i32 0, i32 8
  store ptr %t4462, ptr %t4463
  %t4464 = load ptr, ptr %stmt
  %t4465 = getelementptr inbounds %ASTNode, ptr %t4464, i32 0, i32 0
  %t4466 = load i32, ptr %t4465
  %t4467 = icmp eq i32 %t4466, 1
  br i1 %t4467, label %label_1392, label %label_1393
label_1392:
  %t4468 = load ptr, ptr %base_dir
  %t4469 = load ptr, ptr %stmt
  %t4470 = getelementptr inbounds %ASTNode, ptr %t4469, i32 0, i32 1
  %t4471 = load ptr, ptr %t4470
  %t4472 = call ptr @join_import_path(ptr %t4468, ptr %t4471)
  store ptr %t4472, ptr %import_path
  %t4473 = load ptr, ptr %import_path
  %t4474 = call ptr @read_file(ptr %t4473)
  store ptr %t4474, ptr %import_content
  %t4475 = load ptr, ptr %import_content
  %t4476 = getelementptr inbounds [1 x i8], ptr @.str.s506, i64 0, i64 0
  %t4477 = call i32 @str_equals(ptr %t4475, ptr %t4476)
  %t4478 = icmp eq i32 %t4477, 1
  br i1 %t4478, label %label_1395, label %label_1397
label_1395:
  %t4479 = getelementptr inbounds [25 x i8], ptr @.str.s507, i64 0, i64 0
  call void @print(ptr %t4479)
  %t4480 = load ptr, ptr %import_path
  call void @println(ptr %t4480)
  call void @exit(i32 1)
  br label %label_1397
label_1397:
  %t4481 = load ptr, ptr %import_content
  %t4482 = call ptr @parse_source(ptr %t4481)
  store ptr %t4482, ptr %imported_module
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

