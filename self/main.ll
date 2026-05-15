; ModuleID = 'main_module'
source_filename = "main_module"

%Lexer = type { ptr, i32, i32, i32 }
%Token = type { i32, ptr, i32, ptr }
%ASTNode = type { i32, ptr, ptr, i32, i32, ptr, ptr, ptr, ptr }
%Parser = type { ptr }

@.str = private unnamed_addr constant [7 x i8] c"STRING\00"
@.str.1 = private unnamed_addr constant [7 x i8] c"NUMBER\00"
@.str.2 = private unnamed_addr constant [5 x i8] c"BOOL\00"
@.str.3 = private unnamed_addr constant [11 x i8] c"IDENTIFIER\00"
@.str.4 = private unnamed_addr constant [8 x i8] c"KEYWORD\00"
@.str.5 = private unnamed_addr constant [10 x i8] c"SEPARATOR\00"
@.str.6 = private unnamed_addr constant [9 x i8] c"OPERATOR\00"
@.str.7 = private unnamed_addr constant [7 x i8] c"REL_OP\00"
@.str.8 = private unnamed_addr constant [10 x i8] c"ASSIGN_OP\00"
@.str.9 = private unnamed_addr constant [6 x i8] c"ARROW\00"
@.str.10 = private unnamed_addr constant [4 x i8] c"EOF\00"
@.str.11 = private unnamed_addr constant [6 x i8] c"TOKEN\00"
@.str.12 = private unnamed_addr constant [7 x i8] c"import\00"
@.str.13 = private unnamed_addr constant [6 x i8] c"match\00"
@.str.14 = private unnamed_addr constant [3 x i8] c"if\00"
@.str.15 = private unnamed_addr constant [5 x i8] c"else\00"
@.str.16 = private unnamed_addr constant [4 x i8] c"and\00"
@.str.17 = private unnamed_addr constant [3 x i8] c"or\00"
@.str.18 = private unnamed_addr constant [5 x i8] c"true\00"
@.str.19 = private unnamed_addr constant [6 x i8] c"false\00"
@.str.20 = private unnamed_addr constant [6 x i8] c"break\00"
@.str.21 = private unnamed_addr constant [9 x i8] c"continue\00"
@.str.22 = private unnamed_addr constant [7 x i8] c"return\00"
@.str.23 = private unnamed_addr constant [6 x i8] c"throw\00"
@.str.24 = private unnamed_addr constant [6 x i8] c"while\00"
@.str.25 = private unnamed_addr constant [5 x i8] c"loop\00"
@.str.26 = private unnamed_addr constant [4 x i8] c"for\00"
@.str.27 = private unnamed_addr constant [3 x i8] c"in\00"
@.str.28 = private unnamed_addr constant [4 x i8] c"let\00"
@.str.29 = private unnamed_addr constant [7 x i8] c"struct\00"
@.str.30 = private unnamed_addr constant [5 x i8] c"impl\00"
@.str.31 = private unnamed_addr constant [5 x i8] c"enum\00"
@.str.32 = private unnamed_addr constant [6 x i8] c"trait\00"
@.str.33 = private unnamed_addr constant [3 x i8] c"fn\00"
@.str.34 = private unnamed_addr constant [7 x i8] c"extern\00"
@.str.35 = private unnamed_addr constant [4 x i8] c"mut\00"
@.str.36 = private unnamed_addr constant [5 x i8] c"true\00"
@.str.37 = private unnamed_addr constant [6 x i8] c"false\00"
@.str.38 = private unnamed_addr constant [4 x i8] c"EOF\00"
@.str.39 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.40 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.41 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.42 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.43 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.44 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.45 = private unnamed_addr constant [3 x i8] c"==\00"
@.str.46 = private unnamed_addr constant [3 x i8] c"!=\00"
@.str.47 = private unnamed_addr constant [3 x i8] c"<=\00"
@.str.48 = private unnamed_addr constant [3 x i8] c">=\00"
@.str.49 = private unnamed_addr constant [3 x i8] c"->\00"
@.str.50 = private unnamed_addr constant [3 x i8] c"=>\00"
@.str.51 = private unnamed_addr constant [3 x i8] c"=>\00"
@.str.52 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.53 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.54 = private unnamed_addr constant [2 x i8] c"?\00"
@.str.55 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.56 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.57 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.58 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.59 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.60 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.61 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.62 = private unnamed_addr constant [10 x i8] c"Error in \00"
@.str.63 = private unnamed_addr constant [23 x i8] c": Expected token type \00"
@.str.64 = private unnamed_addr constant [10 x i8] c"Error in \00"
@.str.65 = private unnamed_addr constant [19 x i8] c": Expected token '\00"
@.str.66 = private unnamed_addr constant [2 x i8] c"'\00"
@.str.67 = private unnamed_addr constant [7 x i8] c"import\00"
@.str.68 = private unnamed_addr constant [17 x i8] c"import statement\00"
@.str.69 = private unnamed_addr constant [21 x i8] c"Expected module name\00"
@.str.70 = private unnamed_addr constant [7 x i8] c"import\00"
@.str.71 = private unnamed_addr constant [4 x i8] c"let\00"
@.str.72 = private unnamed_addr constant [7 x i8] c"extern\00"
@.str.73 = private unnamed_addr constant [3 x i8] c"fn\00"
@.str.74 = private unnamed_addr constant [7 x i8] c"struct\00"
@.str.75 = private unnamed_addr constant [5 x i8] c"enum\00"
@.str.76 = private unnamed_addr constant [20 x i8] c"Unknown declaration\00"
@.str.77 = private unnamed_addr constant [2 x i8] c"[\00"
@.str.78 = private unnamed_addr constant [2 x i8] c"]\00"
@.str.79 = private unnamed_addr constant [11 x i8] c"array type\00"
@.str.80 = private unnamed_addr constant [19 x i8] c"Expected type name\00"
@.str.81 = private unnamed_addr constant [4 x i8] c"let\00"
@.str.82 = private unnamed_addr constant [21 x i8] c"variable declaration\00"
@.str.83 = private unnamed_addr constant [4 x i8] c"mut\00"
@.str.84 = private unnamed_addr constant [14 x i8] c"variable name\00"
@.str.85 = private unnamed_addr constant [2 x i8] c":\00"
@.str.86 = private unnamed_addr constant [2 x i8] c"=\00"
@.str.87 = private unnamed_addr constant [7 x i8] c"extern\00"
@.str.88 = private unnamed_addr constant [10 x i8] c"extern fn\00"
@.str.89 = private unnamed_addr constant [3 x i8] c"fn\00"
@.str.90 = private unnamed_addr constant [10 x i8] c"extern fn\00"
@.str.91 = private unnamed_addr constant [14 x i8] c"function name\00"
@.str.92 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.93 = private unnamed_addr constant [7 x i8] c"params\00"
@.str.94 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.95 = private unnamed_addr constant [2 x i8] c")\00"
@.str.96 = private unnamed_addr constant [15 x i8] c"parameter name\00"
@.str.97 = private unnamed_addr constant [2 x i8] c":\00"
@.str.98 = private unnamed_addr constant [15 x i8] c"parameter type\00"
@.str.99 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.100 = private unnamed_addr constant [2 x i8] c",\00"
@.str.101 = private unnamed_addr constant [2 x i8] c")\00"
@.str.102 = private unnamed_addr constant [7 x i8] c"params\00"
@.str.103 = private unnamed_addr constant [3 x i8] c"->\00"
@.str.104 = private unnamed_addr constant [3 x i8] c"fn\00"
@.str.105 = private unnamed_addr constant [9 x i8] c"function\00"
@.str.106 = private unnamed_addr constant [14 x i8] c"function name\00"
@.str.107 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.108 = private unnamed_addr constant [7 x i8] c"params\00"
@.str.109 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.110 = private unnamed_addr constant [2 x i8] c")\00"
@.str.111 = private unnamed_addr constant [15 x i8] c"parameter name\00"
@.str.112 = private unnamed_addr constant [2 x i8] c":\00"
@.str.113 = private unnamed_addr constant [15 x i8] c"parameter type\00"
@.str.114 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.115 = private unnamed_addr constant [2 x i8] c",\00"
@.str.116 = private unnamed_addr constant [2 x i8] c")\00"
@.str.117 = private unnamed_addr constant [7 x i8] c"params\00"
@.str.118 = private unnamed_addr constant [3 x i8] c"->\00"
@.str.119 = private unnamed_addr constant [7 x i8] c"struct\00"
@.str.120 = private unnamed_addr constant [7 x i8] c"struct\00"
@.str.121 = private unnamed_addr constant [12 x i8] c"struct name\00"
@.str.122 = private unnamed_addr constant [2 x i8] c"{\00"
@.str.123 = private unnamed_addr constant [12 x i8] c"struct body\00"
@.str.124 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.125 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.126 = private unnamed_addr constant [11 x i8] c"field name\00"
@.str.127 = private unnamed_addr constant [2 x i8] c":\00"
@.str.128 = private unnamed_addr constant [11 x i8] c"field type\00"
@.str.129 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.130 = private unnamed_addr constant [2 x i8] c",\00"
@.str.131 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.132 = private unnamed_addr constant [12 x i8] c"struct body\00"
@.str.133 = private unnamed_addr constant [5 x i8] c"enum\00"
@.str.134 = private unnamed_addr constant [5 x i8] c"enum\00"
@.str.135 = private unnamed_addr constant [10 x i8] c"enum name\00"
@.str.136 = private unnamed_addr constant [2 x i8] c"{\00"
@.str.137 = private unnamed_addr constant [10 x i8] c"enum body\00"
@.str.138 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.139 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.140 = private unnamed_addr constant [13 x i8] c"variant name\00"
@.str.141 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.142 = private unnamed_addr constant [2 x i8] c",\00"
@.str.143 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.144 = private unnamed_addr constant [10 x i8] c"enum body\00"
@.str.145 = private unnamed_addr constant [2 x i8] c"{\00"
@.str.146 = private unnamed_addr constant [6 x i8] c"block\00"
@.str.147 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.148 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.149 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.150 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.151 = private unnamed_addr constant [6 x i8] c"block\00"
@.str.152 = private unnamed_addr constant [3 x i8] c"if\00"
@.str.153 = private unnamed_addr constant [13 x i8] c"if statement\00"
@.str.154 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.155 = private unnamed_addr constant [13 x i8] c"if condition\00"
@.str.156 = private unnamed_addr constant [2 x i8] c")\00"
@.str.157 = private unnamed_addr constant [13 x i8] c"if condition\00"
@.str.158 = private unnamed_addr constant [5 x i8] c"else\00"
@.str.159 = private unnamed_addr constant [3 x i8] c"if\00"
@.str.160 = private unnamed_addr constant [6 x i8] c"while\00"
@.str.161 = private unnamed_addr constant [16 x i8] c"while statement\00"
@.str.162 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.163 = private unnamed_addr constant [16 x i8] c"while condition\00"
@.str.164 = private unnamed_addr constant [2 x i8] c")\00"
@.str.165 = private unnamed_addr constant [16 x i8] c"while condition\00"
@.str.166 = private unnamed_addr constant [3 x i8] c"if\00"
@.str.167 = private unnamed_addr constant [6 x i8] c"while\00"
@.str.168 = private unnamed_addr constant [7 x i8] c"return\00"
@.str.169 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.170 = private unnamed_addr constant [4 x i8] c"let\00"
@.str.171 = private unnamed_addr constant [2 x i8] c"=\00"
@.str.172 = private unnamed_addr constant [3 x i8] c"or\00"
@.str.173 = private unnamed_addr constant [4 x i8] c"and\00"
@.str.174 = private unnamed_addr constant [3 x i8] c"==\00"
@.str.175 = private unnamed_addr constant [3 x i8] c"!=\00"
@.str.176 = private unnamed_addr constant [2 x i8] c"<\00"
@.str.177 = private unnamed_addr constant [2 x i8] c">\00"
@.str.178 = private unnamed_addr constant [3 x i8] c"<=\00"
@.str.179 = private unnamed_addr constant [3 x i8] c">=\00"
@.str.180 = private unnamed_addr constant [2 x i8] c"+\00"
@.str.181 = private unnamed_addr constant [2 x i8] c"-\00"
@.str.182 = private unnamed_addr constant [2 x i8] c"*\00"
@.str.183 = private unnamed_addr constant [2 x i8] c"/\00"
@.str.184 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.185 = private unnamed_addr constant [4 x i8] c"and\00"
@.str.186 = private unnamed_addr constant [3 x i8] c"or\00"
@.str.187 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.188 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.189 = private unnamed_addr constant [2 x i8] c")\00"
@.str.190 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.191 = private unnamed_addr constant [2 x i8] c",\00"
@.str.192 = private unnamed_addr constant [2 x i8] c")\00"
@.str.193 = private unnamed_addr constant [14 x i8] c"function call\00"
@.str.194 = private unnamed_addr constant [2 x i8] c"[\00"
@.str.195 = private unnamed_addr constant [2 x i8] c"]\00"
@.str.196 = private unnamed_addr constant [12 x i8] c"array index\00"
@.str.197 = private unnamed_addr constant [2 x i8] c".\00"
@.str.198 = private unnamed_addr constant [12 x i8] c"member name\00"
@.str.199 = private unnamed_addr constant [33 x i8] c"Unexpected token in expression: \00"
@.str.200 = private unnamed_addr constant [3 x i8] c" '\00"
@.str.201 = private unnamed_addr constant [2 x i8] c"'\00"
@.str.202 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.203 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.204 = private unnamed_addr constant [32 x i8] c"=== Self-Hosted Parser Test ===\00"
@.str.205 = private unnamed_addr constant [9 x i8] c"main.psm\00"
@.str.206 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.207 = private unnamed_addr constant [27 x i8] c"ERROR: Could not read file\00"
@.str.208 = private unnamed_addr constant [14 x i8] c"File content:\00"
@.str.209 = private unnamed_addr constant [20 x i8] c"\E2\9C\93 Lexing complete\00"
@.str.210 = private unnamed_addr constant [4 x i8] c": '\00"
@.str.211 = private unnamed_addr constant [2 x i8] c"'\00"
@.str.212 = private unnamed_addr constant [4 x i8] c"---\00"
@.str.213 = private unnamed_addr constant [21 x i8] c"\E2\9C\93 Parsing complete\00"
@.str.214 = private unnamed_addr constant [17 x i8] c"AST Root: MODULE\00"
@.str.215 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.216 = private unnamed_addr constant [18 x i8] c"  VARIABLE_DECL: \00"
@.str.217 = private unnamed_addr constant [13 x i8] c"  FUNCTION: \00"
@.str.218 = private unnamed_addr constant [20 x i8] c"  EXTERN_FUNCTION: \00"
@.str.219 = private unnamed_addr constant [13 x i8] c"=== Done ===\00"

declare ptr @malloc(i64)

declare i32 @printf(ptr, ...)

declare void @println(ptr)

declare void @print(ptr)

declare void @println_int(i32)

declare void @print_int(i32)

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

declare void @println_bool(i32)

declare void @print_bool(i32)

declare void @println_char(i8)

declare void @print_char(i8)

define ptr @type_to_string(i32 %t) {
entry:
  %t1 = alloca i32, align 4
  store i32 %t, ptr %t1, align 4
  %t2 = load i32, ptr %t1, align 4
  %eqtmp = icmp eq i32 %t2, 0
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret ptr @.str

ifcont:                                           ; preds = %entry
  %t3 = load i32, ptr %t1, align 4
  %eqtmp4 = icmp eq i32 %t3, 2
  %ifcond5 = icmp ne i1 %eqtmp4, false
  br i1 %ifcond5, label %then6, label %ifcont7

then6:                                            ; preds = %ifcont
  ret ptr @.str.1

ifcont7:                                          ; preds = %ifcont
  %t8 = load i32, ptr %t1, align 4
  %eqtmp9 = icmp eq i32 %t8, 3
  %ifcond10 = icmp ne i1 %eqtmp9, false
  br i1 %ifcond10, label %then11, label %ifcont12

then11:                                           ; preds = %ifcont7
  ret ptr @.str.2

ifcont12:                                         ; preds = %ifcont7
  %t13 = load i32, ptr %t1, align 4
  %eqtmp14 = icmp eq i32 %t13, 4
  %ifcond15 = icmp ne i1 %eqtmp14, false
  br i1 %ifcond15, label %then16, label %ifcont17

then16:                                           ; preds = %ifcont12
  ret ptr @.str.3

ifcont17:                                         ; preds = %ifcont12
  %t18 = load i32, ptr %t1, align 4
  %eqtmp19 = icmp eq i32 %t18, 16
  %ifcond20 = icmp ne i1 %eqtmp19, false
  br i1 %ifcond20, label %then21, label %ifcont22

then21:                                           ; preds = %ifcont17
  ret ptr @.str.4

ifcont22:                                         ; preds = %ifcont17
  %t23 = load i32, ptr %t1, align 4
  %eqtmp24 = icmp eq i32 %t23, 5
  %ifcond25 = icmp ne i1 %eqtmp24, false
  br i1 %ifcond25, label %then26, label %ifcont27

then26:                                           ; preds = %ifcont22
  ret ptr @.str.5

ifcont27:                                         ; preds = %ifcont22
  %t28 = load i32, ptr %t1, align 4
  %eqtmp29 = icmp eq i32 %t28, 7
  %ifcond30 = icmp ne i1 %eqtmp29, false
  br i1 %ifcond30, label %then31, label %ifcont32

then31:                                           ; preds = %ifcont27
  ret ptr @.str.6

ifcont32:                                         ; preds = %ifcont27
  %t33 = load i32, ptr %t1, align 4
  %eqtmp34 = icmp eq i32 %t33, 8
  %ifcond35 = icmp ne i1 %eqtmp34, false
  br i1 %ifcond35, label %then36, label %ifcont37

then36:                                           ; preds = %ifcont32
  ret ptr @.str.7

ifcont37:                                         ; preds = %ifcont32
  %t38 = load i32, ptr %t1, align 4
  %eqtmp39 = icmp eq i32 %t38, 11
  %ifcond40 = icmp ne i1 %eqtmp39, false
  br i1 %ifcond40, label %then41, label %ifcont42

then41:                                           ; preds = %ifcont37
  ret ptr @.str.8

ifcont42:                                         ; preds = %ifcont37
  %t43 = load i32, ptr %t1, align 4
  %eqtmp44 = icmp eq i32 %t43, 14
  %ifcond45 = icmp ne i1 %eqtmp44, false
  br i1 %ifcond45, label %then46, label %ifcont47

then46:                                           ; preds = %ifcont42
  ret ptr @.str.9

ifcont47:                                         ; preds = %ifcont42
  %t48 = load i32, ptr %t1, align 4
  %eqtmp49 = icmp eq i32 %t48, 18
  %ifcond50 = icmp ne i1 %eqtmp49, false
  br i1 %ifcond50, label %then51, label %ifcont52

then51:                                           ; preds = %ifcont47
  ret ptr @.str.10

ifcont52:                                         ; preds = %ifcont47
  ret ptr @.str.11
}

define i1 @is_digit(i8 %c) {
entry:
  %c1 = alloca i8, align 1
  store i8 %c, ptr %c1, align 1
  %c2 = load i8, ptr %c1, align 1
  %getmp = icmp sge i8 %c2, 48
  %c3 = load i8, ptr %c1, align 1
  %letmp = icmp sle i8 %c3, 57
  %andtmp = and i1 %getmp, %letmp
  ret i1 %andtmp
}

define i1 @is_alpha(i8 %c) {
entry:
  %c1 = alloca i8, align 1
  store i8 %c, ptr %c1, align 1
  %c2 = load i8, ptr %c1, align 1
  %getmp = icmp sge i8 %c2, 97
  %c3 = load i8, ptr %c1, align 1
  %letmp = icmp sle i8 %c3, 122
  %andtmp = and i1 %getmp, %letmp
  %c4 = load i8, ptr %c1, align 1
  %getmp5 = icmp sge i8 %c4, 65
  %c6 = load i8, ptr %c1, align 1
  %letmp7 = icmp sle i8 %c6, 90
  %andtmp8 = and i1 %getmp5, %letmp7
  %c9 = load i8, ptr %c1, align 1
  %eqtmp = icmp eq i8 %c9, 95
  %ortmp = or i1 %andtmp8, %eqtmp
  %ortmp10 = or i1 %andtmp, %ortmp
  ret i1 %ortmp10
}

define i1 @is_alnum(i8 %c) {
entry:
  %c1 = alloca i8, align 1
  store i8 %c, ptr %c1, align 1
  %c2 = load i8, ptr %c1, align 1
  %calltmp = call i1 @is_alpha(i8 %c2)
  %c3 = load i8, ptr %c1, align 1
  %calltmp4 = call i1 @is_digit(i8 %c3)
  %ortmp = or i1 %calltmp, %calltmp4
  ret i1 %ortmp
}

define i1 @is_space(i8 %c) {
entry:
  %c1 = alloca i8, align 1
  store i8 %c, ptr %c1, align 1
  %c2 = load i8, ptr %c1, align 1
  %eqtmp = icmp eq i8 %c2, 32
  %c3 = load i8, ptr %c1, align 1
  %eqtmp4 = icmp eq i8 %c3, 9
  %c5 = load i8, ptr %c1, align 1
  %eqtmp6 = icmp eq i8 %c5, 10
  %c7 = load i8, ptr %c1, align 1
  %eqtmp8 = icmp eq i8 %c7, 13
  %ortmp = or i1 %eqtmp6, %eqtmp8
  %ortmp9 = or i1 %eqtmp4, %ortmp
  %ortmp10 = or i1 %eqtmp, %ortmp9
  ret i1 %ortmp10
}

define i1 @is_separator(i8 %c) {
entry:
  %c1 = alloca i8, align 1
  store i8 %c, ptr %c1, align 1
  %c2 = load i8, ptr %c1, align 1
  %eqtmp = icmp eq i8 %c2, 40
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i1 true

ifcont:                                           ; preds = %entry
  %c3 = load i8, ptr %c1, align 1
  %eqtmp4 = icmp eq i8 %c3, 41
  %ifcond5 = icmp ne i1 %eqtmp4, false
  br i1 %ifcond5, label %then6, label %ifcont7

then6:                                            ; preds = %ifcont
  ret i1 true

ifcont7:                                          ; preds = %ifcont
  %c8 = load i8, ptr %c1, align 1
  %eqtmp9 = icmp eq i8 %c8, 123
  %ifcond10 = icmp ne i1 %eqtmp9, false
  br i1 %ifcond10, label %then11, label %ifcont12

then11:                                           ; preds = %ifcont7
  ret i1 true

ifcont12:                                         ; preds = %ifcont7
  %c13 = load i8, ptr %c1, align 1
  %eqtmp14 = icmp eq i8 %c13, 125
  %ifcond15 = icmp ne i1 %eqtmp14, false
  br i1 %ifcond15, label %then16, label %ifcont17

then16:                                           ; preds = %ifcont12
  ret i1 true

ifcont17:                                         ; preds = %ifcont12
  %c18 = load i8, ptr %c1, align 1
  %eqtmp19 = icmp eq i8 %c18, 91
  %ifcond20 = icmp ne i1 %eqtmp19, false
  br i1 %ifcond20, label %then21, label %ifcont22

then21:                                           ; preds = %ifcont17
  ret i1 true

ifcont22:                                         ; preds = %ifcont17
  %c23 = load i8, ptr %c1, align 1
  %eqtmp24 = icmp eq i8 %c23, 93
  %ifcond25 = icmp ne i1 %eqtmp24, false
  br i1 %ifcond25, label %then26, label %ifcont27

then26:                                           ; preds = %ifcont22
  ret i1 true

ifcont27:                                         ; preds = %ifcont22
  %c28 = load i8, ptr %c1, align 1
  %eqtmp29 = icmp eq i8 %c28, 44
  %ifcond30 = icmp ne i1 %eqtmp29, false
  br i1 %ifcond30, label %then31, label %ifcont32

then31:                                           ; preds = %ifcont27
  ret i1 true

ifcont32:                                         ; preds = %ifcont27
  %c33 = load i8, ptr %c1, align 1
  %eqtmp34 = icmp eq i8 %c33, 46
  %ifcond35 = icmp ne i1 %eqtmp34, false
  br i1 %ifcond35, label %then36, label %ifcont37

then36:                                           ; preds = %ifcont32
  ret i1 true

ifcont37:                                         ; preds = %ifcont32
  %c38 = load i8, ptr %c1, align 1
  %eqtmp39 = icmp eq i8 %c38, 58
  %ifcond40 = icmp ne i1 %eqtmp39, false
  br i1 %ifcond40, label %then41, label %ifcont42

then41:                                           ; preds = %ifcont37
  ret i1 true

ifcont42:                                         ; preds = %ifcont37
  ret i1 false
}

define i1 @is_operator(i8 %c) {
entry:
  %c1 = alloca i8, align 1
  store i8 %c, ptr %c1, align 1
  %c2 = load i8, ptr %c1, align 1
  %eqtmp = icmp eq i8 %c2, 43
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i1 true

ifcont:                                           ; preds = %entry
  %c3 = load i8, ptr %c1, align 1
  %eqtmp4 = icmp eq i8 %c3, 45
  %ifcond5 = icmp ne i1 %eqtmp4, false
  br i1 %ifcond5, label %then6, label %ifcont7

then6:                                            ; preds = %ifcont
  ret i1 true

ifcont7:                                          ; preds = %ifcont
  %c8 = load i8, ptr %c1, align 1
  %eqtmp9 = icmp eq i8 %c8, 42
  %ifcond10 = icmp ne i1 %eqtmp9, false
  br i1 %ifcond10, label %then11, label %ifcont12

then11:                                           ; preds = %ifcont7
  ret i1 true

ifcont12:                                         ; preds = %ifcont7
  %c13 = load i8, ptr %c1, align 1
  %eqtmp14 = icmp eq i8 %c13, 47
  %ifcond15 = icmp ne i1 %eqtmp14, false
  br i1 %ifcond15, label %then16, label %ifcont17

then16:                                           ; preds = %ifcont12
  ret i1 true

ifcont17:                                         ; preds = %ifcont12
  %c18 = load i8, ptr %c1, align 1
  %eqtmp19 = icmp eq i8 %c18, 37
  %ifcond20 = icmp ne i1 %eqtmp19, false
  br i1 %ifcond20, label %then21, label %ifcont22

then21:                                           ; preds = %ifcont17
  ret i1 true

ifcont22:                                         ; preds = %ifcont17
  %c23 = load i8, ptr %c1, align 1
  %eqtmp24 = icmp eq i8 %c23, 60
  %ifcond25 = icmp ne i1 %eqtmp24, false
  br i1 %ifcond25, label %then26, label %ifcont27

then26:                                           ; preds = %ifcont22
  ret i1 true

ifcont27:                                         ; preds = %ifcont22
  %c28 = load i8, ptr %c1, align 1
  %eqtmp29 = icmp eq i8 %c28, 62
  %ifcond30 = icmp ne i1 %eqtmp29, false
  br i1 %ifcond30, label %then31, label %ifcont32

then31:                                           ; preds = %ifcont27
  ret i1 true

ifcont32:                                         ; preds = %ifcont27
  %c33 = load i8, ptr %c1, align 1
  %eqtmp34 = icmp eq i8 %c33, 33
  %ifcond35 = icmp ne i1 %eqtmp34, false
  br i1 %ifcond35, label %then36, label %ifcont37

then36:                                           ; preds = %ifcont32
  ret i1 true

ifcont37:                                         ; preds = %ifcont32
  %c38 = load i8, ptr %c1, align 1
  %eqtmp39 = icmp eq i8 %c38, 38
  %ifcond40 = icmp ne i1 %eqtmp39, false
  br i1 %ifcond40, label %then41, label %ifcont42

then41:                                           ; preds = %ifcont37
  ret i1 true

ifcont42:                                         ; preds = %ifcont37
  %c43 = load i8, ptr %c1, align 1
  %eqtmp44 = icmp eq i8 %c43, 124
  %ifcond45 = icmp ne i1 %eqtmp44, false
  br i1 %ifcond45, label %then46, label %ifcont47

then46:                                           ; preds = %ifcont42
  ret i1 true

ifcont47:                                         ; preds = %ifcont42
  %c48 = load i8, ptr %c1, align 1
  %eqtmp49 = icmp eq i8 %c48, 61
  %ifcond50 = icmp ne i1 %eqtmp49, false
  br i1 %ifcond50, label %then51, label %ifcont52

then51:                                           ; preds = %ifcont47
  ret i1 true

ifcont52:                                         ; preds = %ifcont47
  %c53 = load i8, ptr %c1, align 1
  %eqtmp54 = icmp eq i8 %c53, 95
  %ifcond55 = icmp ne i1 %eqtmp54, false
  br i1 %ifcond55, label %then56, label %ifcont57

then56:                                           ; preds = %ifcont52
  ret i1 true

ifcont57:                                         ; preds = %ifcont52
  ret i1 false
}

define i1 @is_keyword(ptr %s) {
entry:
  %s1 = alloca ptr, align 8
  store ptr %s, ptr %s1, align 8
  %s2 = load ptr, ptr %s1, align 8
  %calltmp = call i32 @str_equals(ptr %s2, ptr @.str.12)
  %eqtmp = icmp eq i32 %calltmp, 1
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i1 true

ifcont:                                           ; preds = %entry
  %s3 = load ptr, ptr %s1, align 8
  %calltmp4 = call i32 @str_equals(ptr %s3, ptr @.str.13)
  %eqtmp5 = icmp eq i32 %calltmp4, 1
  %ifcond6 = icmp ne i1 %eqtmp5, false
  br i1 %ifcond6, label %then7, label %ifcont8

then7:                                            ; preds = %ifcont
  ret i1 true

ifcont8:                                          ; preds = %ifcont
  %s9 = load ptr, ptr %s1, align 8
  %calltmp10 = call i32 @str_equals(ptr %s9, ptr @.str.14)
  %eqtmp11 = icmp eq i32 %calltmp10, 1
  %ifcond12 = icmp ne i1 %eqtmp11, false
  br i1 %ifcond12, label %then13, label %ifcont14

then13:                                           ; preds = %ifcont8
  ret i1 true

ifcont14:                                         ; preds = %ifcont8
  %s15 = load ptr, ptr %s1, align 8
  %calltmp16 = call i32 @str_equals(ptr %s15, ptr @.str.15)
  %eqtmp17 = icmp eq i32 %calltmp16, 1
  %ifcond18 = icmp ne i1 %eqtmp17, false
  br i1 %ifcond18, label %then19, label %ifcont20

then19:                                           ; preds = %ifcont14
  ret i1 true

ifcont20:                                         ; preds = %ifcont14
  %s21 = load ptr, ptr %s1, align 8
  %calltmp22 = call i32 @str_equals(ptr %s21, ptr @.str.16)
  %eqtmp23 = icmp eq i32 %calltmp22, 1
  %ifcond24 = icmp ne i1 %eqtmp23, false
  br i1 %ifcond24, label %then25, label %ifcont26

then25:                                           ; preds = %ifcont20
  ret i1 true

ifcont26:                                         ; preds = %ifcont20
  %s27 = load ptr, ptr %s1, align 8
  %calltmp28 = call i32 @str_equals(ptr %s27, ptr @.str.17)
  %eqtmp29 = icmp eq i32 %calltmp28, 1
  %ifcond30 = icmp ne i1 %eqtmp29, false
  br i1 %ifcond30, label %then31, label %ifcont32

then31:                                           ; preds = %ifcont26
  ret i1 true

ifcont32:                                         ; preds = %ifcont26
  %s33 = load ptr, ptr %s1, align 8
  %calltmp34 = call i32 @str_equals(ptr %s33, ptr @.str.18)
  %eqtmp35 = icmp eq i32 %calltmp34, 1
  %ifcond36 = icmp ne i1 %eqtmp35, false
  br i1 %ifcond36, label %then37, label %ifcont38

then37:                                           ; preds = %ifcont32
  ret i1 true

ifcont38:                                         ; preds = %ifcont32
  %s39 = load ptr, ptr %s1, align 8
  %calltmp40 = call i32 @str_equals(ptr %s39, ptr @.str.19)
  %eqtmp41 = icmp eq i32 %calltmp40, 1
  %ifcond42 = icmp ne i1 %eqtmp41, false
  br i1 %ifcond42, label %then43, label %ifcont44

then43:                                           ; preds = %ifcont38
  ret i1 true

ifcont44:                                         ; preds = %ifcont38
  %s45 = load ptr, ptr %s1, align 8
  %calltmp46 = call i32 @str_equals(ptr %s45, ptr @.str.20)
  %eqtmp47 = icmp eq i32 %calltmp46, 1
  %ifcond48 = icmp ne i1 %eqtmp47, false
  br i1 %ifcond48, label %then49, label %ifcont50

then49:                                           ; preds = %ifcont44
  ret i1 true

ifcont50:                                         ; preds = %ifcont44
  %s51 = load ptr, ptr %s1, align 8
  %calltmp52 = call i32 @str_equals(ptr %s51, ptr @.str.21)
  %eqtmp53 = icmp eq i32 %calltmp52, 1
  %ifcond54 = icmp ne i1 %eqtmp53, false
  br i1 %ifcond54, label %then55, label %ifcont56

then55:                                           ; preds = %ifcont50
  ret i1 true

ifcont56:                                         ; preds = %ifcont50
  %s57 = load ptr, ptr %s1, align 8
  %calltmp58 = call i32 @str_equals(ptr %s57, ptr @.str.22)
  %eqtmp59 = icmp eq i32 %calltmp58, 1
  %ifcond60 = icmp ne i1 %eqtmp59, false
  br i1 %ifcond60, label %then61, label %ifcont62

then61:                                           ; preds = %ifcont56
  ret i1 true

ifcont62:                                         ; preds = %ifcont56
  %s63 = load ptr, ptr %s1, align 8
  %calltmp64 = call i32 @str_equals(ptr %s63, ptr @.str.23)
  %eqtmp65 = icmp eq i32 %calltmp64, 1
  %ifcond66 = icmp ne i1 %eqtmp65, false
  br i1 %ifcond66, label %then67, label %ifcont68

then67:                                           ; preds = %ifcont62
  ret i1 true

ifcont68:                                         ; preds = %ifcont62
  %s69 = load ptr, ptr %s1, align 8
  %calltmp70 = call i32 @str_equals(ptr %s69, ptr @.str.24)
  %eqtmp71 = icmp eq i32 %calltmp70, 1
  %ifcond72 = icmp ne i1 %eqtmp71, false
  br i1 %ifcond72, label %then73, label %ifcont74

then73:                                           ; preds = %ifcont68
  ret i1 true

ifcont74:                                         ; preds = %ifcont68
  %s75 = load ptr, ptr %s1, align 8
  %calltmp76 = call i32 @str_equals(ptr %s75, ptr @.str.25)
  %eqtmp77 = icmp eq i32 %calltmp76, 1
  %ifcond78 = icmp ne i1 %eqtmp77, false
  br i1 %ifcond78, label %then79, label %ifcont80

then79:                                           ; preds = %ifcont74
  ret i1 true

ifcont80:                                         ; preds = %ifcont74
  %s81 = load ptr, ptr %s1, align 8
  %calltmp82 = call i32 @str_equals(ptr %s81, ptr @.str.26)
  %eqtmp83 = icmp eq i32 %calltmp82, 1
  %ifcond84 = icmp ne i1 %eqtmp83, false
  br i1 %ifcond84, label %then85, label %ifcont86

then85:                                           ; preds = %ifcont80
  ret i1 true

ifcont86:                                         ; preds = %ifcont80
  %s87 = load ptr, ptr %s1, align 8
  %calltmp88 = call i32 @str_equals(ptr %s87, ptr @.str.27)
  %eqtmp89 = icmp eq i32 %calltmp88, 1
  %ifcond90 = icmp ne i1 %eqtmp89, false
  br i1 %ifcond90, label %then91, label %ifcont92

then91:                                           ; preds = %ifcont86
  ret i1 true

ifcont92:                                         ; preds = %ifcont86
  %s93 = load ptr, ptr %s1, align 8
  %calltmp94 = call i32 @str_equals(ptr %s93, ptr @.str.28)
  %eqtmp95 = icmp eq i32 %calltmp94, 1
  %ifcond96 = icmp ne i1 %eqtmp95, false
  br i1 %ifcond96, label %then97, label %ifcont98

then97:                                           ; preds = %ifcont92
  ret i1 true

ifcont98:                                         ; preds = %ifcont92
  %s99 = load ptr, ptr %s1, align 8
  %calltmp100 = call i32 @str_equals(ptr %s99, ptr @.str.29)
  %eqtmp101 = icmp eq i32 %calltmp100, 1
  %ifcond102 = icmp ne i1 %eqtmp101, false
  br i1 %ifcond102, label %then103, label %ifcont104

then103:                                          ; preds = %ifcont98
  ret i1 true

ifcont104:                                        ; preds = %ifcont98
  %s105 = load ptr, ptr %s1, align 8
  %calltmp106 = call i32 @str_equals(ptr %s105, ptr @.str.30)
  %eqtmp107 = icmp eq i32 %calltmp106, 1
  %ifcond108 = icmp ne i1 %eqtmp107, false
  br i1 %ifcond108, label %then109, label %ifcont110

then109:                                          ; preds = %ifcont104
  ret i1 true

ifcont110:                                        ; preds = %ifcont104
  %s111 = load ptr, ptr %s1, align 8
  %calltmp112 = call i32 @str_equals(ptr %s111, ptr @.str.31)
  %eqtmp113 = icmp eq i32 %calltmp112, 1
  %ifcond114 = icmp ne i1 %eqtmp113, false
  br i1 %ifcond114, label %then115, label %ifcont116

then115:                                          ; preds = %ifcont110
  ret i1 true

ifcont116:                                        ; preds = %ifcont110
  %s117 = load ptr, ptr %s1, align 8
  %calltmp118 = call i32 @str_equals(ptr %s117, ptr @.str.32)
  %eqtmp119 = icmp eq i32 %calltmp118, 1
  %ifcond120 = icmp ne i1 %eqtmp119, false
  br i1 %ifcond120, label %then121, label %ifcont122

then121:                                          ; preds = %ifcont116
  ret i1 true

ifcont122:                                        ; preds = %ifcont116
  %s123 = load ptr, ptr %s1, align 8
  %calltmp124 = call i32 @str_equals(ptr %s123, ptr @.str.33)
  %eqtmp125 = icmp eq i32 %calltmp124, 1
  %ifcond126 = icmp ne i1 %eqtmp125, false
  br i1 %ifcond126, label %then127, label %ifcont128

then127:                                          ; preds = %ifcont122
  ret i1 true

ifcont128:                                        ; preds = %ifcont122
  %s129 = load ptr, ptr %s1, align 8
  %calltmp130 = call i32 @str_equals(ptr %s129, ptr @.str.34)
  %eqtmp131 = icmp eq i32 %calltmp130, 1
  %ifcond132 = icmp ne i1 %eqtmp131, false
  br i1 %ifcond132, label %then133, label %ifcont134

then133:                                          ; preds = %ifcont128
  ret i1 true

ifcont134:                                        ; preds = %ifcont128
  %s135 = load ptr, ptr %s1, align 8
  %calltmp136 = call i32 @str_equals(ptr %s135, ptr @.str.35)
  %eqtmp137 = icmp eq i32 %calltmp136, 1
  %ifcond138 = icmp ne i1 %eqtmp137, false
  br i1 %ifcond138, label %then139, label %ifcont140

then139:                                          ; preds = %ifcont134
  ret i1 true

ifcont140:                                        ; preds = %ifcont134
  ret i1 false
}

define i1 @is_boolean(ptr %s) {
entry:
  %s1 = alloca ptr, align 8
  store ptr %s, ptr %s1, align 8
  %s2 = load ptr, ptr %s1, align 8
  %calltmp = call i32 @str_equals(ptr %s2, ptr @.str.36)
  %eqtmp = icmp eq i32 %calltmp, 1
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i1 true

ifcont:                                           ; preds = %entry
  %s3 = load ptr, ptr %s1, align 8
  %calltmp4 = call i32 @str_equals(ptr %s3, ptr @.str.37)
  %eqtmp5 = icmp eq i32 %calltmp4, 1
  %ifcond6 = icmp ne i1 %eqtmp5, false
  br i1 %ifcond6, label %then7, label %ifcont8

then7:                                            ; preds = %ifcont
  ret i1 true

ifcont8:                                          ; preds = %ifcont
  ret i1 false
}

define ptr @create_lexer(ptr %input) {
entry:
  %input1 = alloca ptr, align 8
  store ptr %input, ptr %input1, align 8
  %structmem = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Lexer, ptr null, i32 1) to i64))
  %input2 = load ptr, ptr %input1, align 8
  %input_ptr = getelementptr inbounds %Lexer, ptr %structmem, i32 0, i32 0
  store ptr %input2, ptr %input_ptr, align 8
  %pos_ptr = getelementptr inbounds %Lexer, ptr %structmem, i32 0, i32 1
  store i32 0, ptr %pos_ptr, align 4
  %line_ptr = getelementptr inbounds %Lexer, ptr %structmem, i32 0, i32 2
  store i32 1, ptr %line_ptr, align 4
  %col_ptr = getelementptr inbounds %Lexer, ptr %structmem, i32 0, i32 3
  store i32 1, ptr %col_ptr, align 4
  ret ptr %structmem
}

define i8 @lexer_peek(ptr %lex, i32 %offset) {
entry:
  %offset2 = alloca i32, align 4
  %lex1 = alloca ptr, align 8
  store ptr %lex, ptr %lex1, align 8
  store i32 %offset, ptr %offset2, align 4
  %structptr = load ptr, ptr %lex1, align 8
  %input_ptr = getelementptr inbounds %Lexer, ptr %structptr, i32 0, i32 0
  %input = load ptr, ptr %input_ptr, align 8
  %structptr3 = load ptr, ptr %lex1, align 8
  %pos_ptr = getelementptr inbounds %Lexer, ptr %structptr3, i32 0, i32 1
  %pos = load i32, ptr %pos_ptr, align 4
  %offset4 = load i32, ptr %offset2, align 4
  %addtmp = add i32 %pos, %offset4
  %calltmp = call i8 @str_char_at(ptr %input, i32 %addtmp)
  ret i8 %calltmp
}

define i8 @lexer_current(ptr %lex) {
entry:
  %lex1 = alloca ptr, align 8
  store ptr %lex, ptr %lex1, align 8
  %structptr = load ptr, ptr %lex1, align 8
  %input_ptr = getelementptr inbounds %Lexer, ptr %structptr, i32 0, i32 0
  %input = load ptr, ptr %input_ptr, align 8
  %structptr2 = load ptr, ptr %lex1, align 8
  %pos_ptr = getelementptr inbounds %Lexer, ptr %structptr2, i32 0, i32 1
  %pos = load i32, ptr %pos_ptr, align 4
  %calltmp = call i8 @str_char_at(ptr %input, i32 %pos)
  ret i8 %calltmp
}

define void @lexer_advance(ptr %lex) {
entry:
  %lex1 = alloca ptr, align 8
  store ptr %lex, ptr %lex1, align 8
  %structptr = load ptr, ptr %lex1, align 8
  %pos_ptr = getelementptr inbounds %Lexer, ptr %structptr, i32 0, i32 1
  %pos = load i32, ptr %pos_ptr, align 4
  %addtmp = add i32 %pos, 1
  %structptr2 = load ptr, ptr %lex1, align 8
  %fieldptr = getelementptr inbounds %Lexer, ptr %structptr2, i32 0, i32 1
  store i32 %addtmp, ptr %fieldptr, align 4
  %structptr3 = load ptr, ptr %lex1, align 8
  %col_ptr = getelementptr inbounds %Lexer, ptr %structptr3, i32 0, i32 3
  %col = load i32, ptr %col_ptr, align 4
  %addtmp4 = add i32 %col, 1
  %structptr5 = load ptr, ptr %lex1, align 8
  %fieldptr6 = getelementptr inbounds %Lexer, ptr %structptr5, i32 0, i32 3
  store i32 %addtmp4, ptr %fieldptr6, align 4
  ret void
}

define void @lexer_skip_whitespace(ptr %lex) {
entry:
  %is_looping = alloca i1, align 1
  %lex1 = alloca ptr, align 8
  store ptr %lex, ptr %lex1, align 8
  store i1 true, ptr %is_looping, align 1
  br label %whilecond

whilecond:                                        ; preds = %ifcont32, %entry
  %is_looping2 = load i1, ptr %is_looping, align 1
  br i1 %is_looping2, label %whilebody, label %afterwhile33

whilebody:                                        ; preds = %whilecond
  %lex3 = load ptr, ptr %lex1, align 8
  %calltmp = call i8 @lexer_current(ptr %lex3)
  %calltmp4 = call i1 @is_space(i8 %calltmp)
  %ifcond = icmp ne i1 %calltmp4, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %whilebody
  %lex5 = load ptr, ptr %lex1, align 8
  %calltmp6 = call i8 @lexer_current(ptr %lex5)
  %eqtmp = icmp eq i8 %calltmp6, 10
  %ifcond7 = icmp ne i1 %eqtmp, false
  br i1 %ifcond7, label %then8, label %ifcont

then8:                                            ; preds = %then
  %structptr = load ptr, ptr %lex1, align 8
  %line_ptr = getelementptr inbounds %Lexer, ptr %structptr, i32 0, i32 2
  %line = load i32, ptr %line_ptr, align 4
  %addtmp = add i32 %line, 1
  %structptr9 = load ptr, ptr %lex1, align 8
  %fieldptr = getelementptr inbounds %Lexer, ptr %structptr9, i32 0, i32 2
  store i32 %addtmp, ptr %fieldptr, align 4
  %structptr10 = load ptr, ptr %lex1, align 8
  %fieldptr11 = getelementptr inbounds %Lexer, ptr %structptr10, i32 0, i32 3
  store i32 0, ptr %fieldptr11, align 4
  br label %ifcont

ifcont:                                           ; preds = %then8, %then
  %lex12 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex12)
  br label %ifcont32

else:                                             ; preds = %whilebody
  %lex13 = load ptr, ptr %lex1, align 8
  %calltmp14 = call i8 @lexer_current(ptr %lex13)
  %eqtmp15 = icmp eq i8 %calltmp14, 47
  %lex16 = load ptr, ptr %lex1, align 8
  %calltmp17 = call i8 @lexer_peek(ptr %lex16, i32 1)
  %eqtmp18 = icmp eq i8 %calltmp17, 47
  %andtmp = and i1 %eqtmp15, %eqtmp18
  %ifcond19 = icmp ne i1 %andtmp, false
  br i1 %ifcond19, label %then20, label %else30

then20:                                           ; preds = %else
  br label %whilecond21

whilecond21:                                      ; preds = %whilebody28, %then20
  %lex22 = load ptr, ptr %lex1, align 8
  %calltmp23 = call i8 @lexer_current(ptr %lex22)
  %neqtmp = icmp ne i8 %calltmp23, 10
  %lex24 = load ptr, ptr %lex1, align 8
  %calltmp25 = call i8 @lexer_current(ptr %lex24)
  %neqtmp26 = icmp ne i8 %calltmp25, 0
  %andtmp27 = and i1 %neqtmp, %neqtmp26
  br i1 %andtmp27, label %whilebody28, label %afterwhile

whilebody28:                                      ; preds = %whilecond21
  %lex29 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex29)
  br label %whilecond21

afterwhile:                                       ; preds = %whilecond21
  br label %ifcont31

else30:                                           ; preds = %else
  store i1 false, ptr %is_looping, align 1
  br label %ifcont31

ifcont31:                                         ; preds = %else30, %afterwhile
  br label %ifcont32

ifcont32:                                         ; preds = %ifcont31, %ifcont
  br label %whilecond

afterwhile33:                                     ; preds = %whilecond
  ret void
}

define ptr @lexer_next_token(ptr %lex) {
entry:
  %val = alloca ptr, align 8
  %type = alloca i32, align 4
  %value265 = alloca ptr, align 8
  %length258 = alloca i32, align 4
  %next = alloca i8, align 1
  %start177 = alloca i32, align 4
  %value152 = alloca ptr, align 8
  %length145 = alloca i32, align 4
  %start126 = alloca i32, align 4
  %value107 = alloca ptr, align 8
  %length100 = alloca i32, align 4
  %start74 = alloca i32, align 4
  %value = alloca ptr, align 8
  %length = alloca i32, align 4
  %start = alloca i32, align 4
  %c = alloca i8, align 1
  %lex1 = alloca ptr, align 8
  store ptr %lex, ptr %lex1, align 8
  %lex2 = load ptr, ptr %lex1, align 8
  call void @lexer_skip_whitespace(ptr %lex2)
  %structptr = load ptr, ptr %lex1, align 8
  %pos_ptr = getelementptr inbounds %Lexer, ptr %structptr, i32 0, i32 1
  %pos = load i32, ptr %pos_ptr, align 4
  %structptr3 = load ptr, ptr %lex1, align 8
  %input_ptr = getelementptr inbounds %Lexer, ptr %structptr3, i32 0, i32 0
  %input = load ptr, ptr %input_ptr, align 8
  %calltmp = call i32 @str_length(ptr %input)
  %getmp = icmp sge i32 %pos, %calltmp
  %ifcond = icmp ne i1 %getmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %structmem = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr = getelementptr inbounds %Token, ptr %structmem, i32 0, i32 0
  store i32 18, ptr %type_ptr, align 4
  %value_ptr = getelementptr inbounds %Token, ptr %structmem, i32 0, i32 1
  store ptr @.str.38, ptr %value_ptr, align 8
  %structptr4 = load ptr, ptr %lex1, align 8
  %line_ptr = getelementptr inbounds %Lexer, ptr %structptr4, i32 0, i32 2
  %line = load i32, ptr %line_ptr, align 4
  %line_ptr5 = getelementptr inbounds %Token, ptr %structmem, i32 0, i32 2
  store i32 %line, ptr %line_ptr5, align 4
  %tok_next_ptr = getelementptr inbounds %Token, ptr %structmem, i32 0, i32 3
  store ptr @.str.39, ptr %tok_next_ptr, align 8
  ret ptr %structmem

ifcont:                                           ; preds = %entry
  %lex6 = load ptr, ptr %lex1, align 8
  %calltmp7 = call i8 @lexer_current(ptr %lex6)
  store i8 %calltmp7, ptr %c, align 1
  %c8 = load i8, ptr %c, align 1
  %calltmp9 = call i1 @is_alpha(i8 %c8)
  %ifcond10 = icmp ne i1 %calltmp9, false
  br i1 %ifcond10, label %then11, label %ifcont66

then11:                                           ; preds = %ifcont
  %structptr12 = load ptr, ptr %lex1, align 8
  %pos_ptr13 = getelementptr inbounds %Lexer, ptr %structptr12, i32 0, i32 1
  %pos14 = load i32, ptr %pos_ptr13, align 4
  store i32 %pos14, ptr %start, align 4
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %then11
  %lex15 = load ptr, ptr %lex1, align 8
  %calltmp16 = call i8 @lexer_current(ptr %lex15)
  %calltmp17 = call i1 @is_alnum(i8 %calltmp16)
  br i1 %calltmp17, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %lex18 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex18)
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %structptr19 = load ptr, ptr %lex1, align 8
  %pos_ptr20 = getelementptr inbounds %Lexer, ptr %structptr19, i32 0, i32 1
  %pos21 = load i32, ptr %pos_ptr20, align 4
  %start22 = load i32, ptr %start, align 4
  %subtmp = sub i32 %pos21, %start22
  store i32 %subtmp, ptr %length, align 4
  %structptr23 = load ptr, ptr %lex1, align 8
  %input_ptr24 = getelementptr inbounds %Lexer, ptr %structptr23, i32 0, i32 0
  %input25 = load ptr, ptr %input_ptr24, align 8
  %start26 = load i32, ptr %start, align 4
  %length27 = load i32, ptr %length, align 4
  %calltmp28 = call ptr @str_substring(ptr %input25, i32 %start26, i32 %length27)
  store ptr %calltmp28, ptr %value, align 8
  %value29 = load ptr, ptr %value, align 8
  %calltmp30 = call i1 @is_keyword(ptr %value29)
  %ifcond31 = icmp ne i1 %calltmp30, false
  br i1 %ifcond31, label %then32, label %ifcont56

then32:                                           ; preds = %afterwhile
  %value33 = load ptr, ptr %value, align 8
  %calltmp34 = call i1 @is_boolean(ptr %value33)
  %ifcond35 = icmp ne i1 %calltmp34, false
  br i1 %ifcond35, label %then36, label %ifcont46

then36:                                           ; preds = %then32
  %structmem37 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr38 = getelementptr inbounds %Token, ptr %structmem37, i32 0, i32 0
  store i32 3, ptr %type_ptr38, align 4
  %value39 = load ptr, ptr %value, align 8
  %value_ptr40 = getelementptr inbounds %Token, ptr %structmem37, i32 0, i32 1
  store ptr %value39, ptr %value_ptr40, align 8
  %structptr41 = load ptr, ptr %lex1, align 8
  %line_ptr42 = getelementptr inbounds %Lexer, ptr %structptr41, i32 0, i32 2
  %line43 = load i32, ptr %line_ptr42, align 4
  %line_ptr44 = getelementptr inbounds %Token, ptr %structmem37, i32 0, i32 2
  store i32 %line43, ptr %line_ptr44, align 4
  %tok_next_ptr45 = getelementptr inbounds %Token, ptr %structmem37, i32 0, i32 3
  store ptr @.str.40, ptr %tok_next_ptr45, align 8
  ret ptr %structmem37

ifcont46:                                         ; preds = %then32
  %structmem47 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr48 = getelementptr inbounds %Token, ptr %structmem47, i32 0, i32 0
  store i32 16, ptr %type_ptr48, align 4
  %value49 = load ptr, ptr %value, align 8
  %value_ptr50 = getelementptr inbounds %Token, ptr %structmem47, i32 0, i32 1
  store ptr %value49, ptr %value_ptr50, align 8
  %structptr51 = load ptr, ptr %lex1, align 8
  %line_ptr52 = getelementptr inbounds %Lexer, ptr %structptr51, i32 0, i32 2
  %line53 = load i32, ptr %line_ptr52, align 4
  %line_ptr54 = getelementptr inbounds %Token, ptr %structmem47, i32 0, i32 2
  store i32 %line53, ptr %line_ptr54, align 4
  %tok_next_ptr55 = getelementptr inbounds %Token, ptr %structmem47, i32 0, i32 3
  store ptr @.str.41, ptr %tok_next_ptr55, align 8
  ret ptr %structmem47

ifcont56:                                         ; preds = %afterwhile
  %structmem57 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr58 = getelementptr inbounds %Token, ptr %structmem57, i32 0, i32 0
  store i32 4, ptr %type_ptr58, align 4
  %value59 = load ptr, ptr %value, align 8
  %value_ptr60 = getelementptr inbounds %Token, ptr %structmem57, i32 0, i32 1
  store ptr %value59, ptr %value_ptr60, align 8
  %structptr61 = load ptr, ptr %lex1, align 8
  %line_ptr62 = getelementptr inbounds %Lexer, ptr %structptr61, i32 0, i32 2
  %line63 = load i32, ptr %line_ptr62, align 4
  %line_ptr64 = getelementptr inbounds %Token, ptr %structmem57, i32 0, i32 2
  store i32 %line63, ptr %line_ptr64, align 4
  %tok_next_ptr65 = getelementptr inbounds %Token, ptr %structmem57, i32 0, i32 3
  store ptr @.str.42, ptr %tok_next_ptr65, align 8
  ret ptr %structmem57

ifcont66:                                         ; preds = %ifcont
  %c67 = load i8, ptr %c, align 1
  %calltmp68 = call i1 @is_digit(i8 %c67)
  %ifcond69 = icmp ne i1 %calltmp68, false
  br i1 %ifcond69, label %then70, label %ifcont117

then70:                                           ; preds = %ifcont66
  %structptr71 = load ptr, ptr %lex1, align 8
  %pos_ptr72 = getelementptr inbounds %Lexer, ptr %structptr71, i32 0, i32 1
  %pos73 = load i32, ptr %pos_ptr72, align 4
  store i32 %pos73, ptr %start74, align 4
  br label %whilecond75

whilecond75:                                      ; preds = %whilebody79, %then70
  %lex76 = load ptr, ptr %lex1, align 8
  %calltmp77 = call i8 @lexer_current(ptr %lex76)
  %calltmp78 = call i1 @is_digit(i8 %calltmp77)
  br i1 %calltmp78, label %whilebody79, label %afterwhile81

whilebody79:                                      ; preds = %whilecond75
  %lex80 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex80)
  br label %whilecond75

afterwhile81:                                     ; preds = %whilecond75
  %lex82 = load ptr, ptr %lex1, align 8
  %calltmp83 = call i8 @lexer_current(ptr %lex82)
  %eqtmp = icmp eq i8 %calltmp83, 46
  %ifcond84 = icmp ne i1 %eqtmp, false
  br i1 %ifcond84, label %then85, label %ifcont94

then85:                                           ; preds = %afterwhile81
  %lex86 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex86)
  br label %whilecond87

whilecond87:                                      ; preds = %whilebody91, %then85
  %lex88 = load ptr, ptr %lex1, align 8
  %calltmp89 = call i8 @lexer_current(ptr %lex88)
  %calltmp90 = call i1 @is_digit(i8 %calltmp89)
  br i1 %calltmp90, label %whilebody91, label %afterwhile93

whilebody91:                                      ; preds = %whilecond87
  %lex92 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex92)
  br label %whilecond87

afterwhile93:                                     ; preds = %whilecond87
  br label %ifcont94

ifcont94:                                         ; preds = %afterwhile93, %afterwhile81
  %structptr95 = load ptr, ptr %lex1, align 8
  %pos_ptr96 = getelementptr inbounds %Lexer, ptr %structptr95, i32 0, i32 1
  %pos97 = load i32, ptr %pos_ptr96, align 4
  %start98 = load i32, ptr %start74, align 4
  %subtmp99 = sub i32 %pos97, %start98
  store i32 %subtmp99, ptr %length100, align 4
  %structptr101 = load ptr, ptr %lex1, align 8
  %input_ptr102 = getelementptr inbounds %Lexer, ptr %structptr101, i32 0, i32 0
  %input103 = load ptr, ptr %input_ptr102, align 8
  %start104 = load i32, ptr %start74, align 4
  %length105 = load i32, ptr %length100, align 4
  %calltmp106 = call ptr @str_substring(ptr %input103, i32 %start104, i32 %length105)
  store ptr %calltmp106, ptr %value107, align 8
  %structmem108 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr109 = getelementptr inbounds %Token, ptr %structmem108, i32 0, i32 0
  store i32 2, ptr %type_ptr109, align 4
  %value110 = load ptr, ptr %value107, align 8
  %value_ptr111 = getelementptr inbounds %Token, ptr %structmem108, i32 0, i32 1
  store ptr %value110, ptr %value_ptr111, align 8
  %structptr112 = load ptr, ptr %lex1, align 8
  %line_ptr113 = getelementptr inbounds %Lexer, ptr %structptr112, i32 0, i32 2
  %line114 = load i32, ptr %line_ptr113, align 4
  %line_ptr115 = getelementptr inbounds %Token, ptr %structmem108, i32 0, i32 2
  store i32 %line114, ptr %line_ptr115, align 4
  %tok_next_ptr116 = getelementptr inbounds %Token, ptr %structmem108, i32 0, i32 3
  store ptr @.str.43, ptr %tok_next_ptr116, align 8
  ret ptr %structmem108

ifcont117:                                        ; preds = %ifcont66
  %c118 = load i8, ptr %c, align 1
  %eqtmp119 = icmp eq i8 %c118, 34
  %ifcond120 = icmp ne i1 %eqtmp119, false
  br i1 %ifcond120, label %then121, label %ifcont169

then121:                                          ; preds = %ifcont117
  %lex122 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex122)
  %structptr123 = load ptr, ptr %lex1, align 8
  %pos_ptr124 = getelementptr inbounds %Lexer, ptr %structptr123, i32 0, i32 1
  %pos125 = load i32, ptr %pos_ptr124, align 4
  store i32 %pos125, ptr %start126, align 4
  br label %whilecond127

whilecond127:                                     ; preds = %whilebody137, %then121
  %lex128 = load ptr, ptr %lex1, align 8
  %calltmp129 = call i8 @lexer_current(ptr %lex128)
  %neqtmp = icmp ne i8 %calltmp129, 34
  %structptr130 = load ptr, ptr %lex1, align 8
  %pos_ptr131 = getelementptr inbounds %Lexer, ptr %structptr130, i32 0, i32 1
  %pos132 = load i32, ptr %pos_ptr131, align 4
  %structptr133 = load ptr, ptr %lex1, align 8
  %input_ptr134 = getelementptr inbounds %Lexer, ptr %structptr133, i32 0, i32 0
  %input135 = load ptr, ptr %input_ptr134, align 8
  %calltmp136 = call i32 @str_length(ptr %input135)
  %lttmp = icmp slt i32 %pos132, %calltmp136
  %andtmp = and i1 %neqtmp, %lttmp
  br i1 %andtmp, label %whilebody137, label %afterwhile139

whilebody137:                                     ; preds = %whilecond127
  %lex138 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex138)
  br label %whilecond127

afterwhile139:                                    ; preds = %whilecond127
  %structptr140 = load ptr, ptr %lex1, align 8
  %pos_ptr141 = getelementptr inbounds %Lexer, ptr %structptr140, i32 0, i32 1
  %pos142 = load i32, ptr %pos_ptr141, align 4
  %start143 = load i32, ptr %start126, align 4
  %subtmp144 = sub i32 %pos142, %start143
  store i32 %subtmp144, ptr %length145, align 4
  %structptr146 = load ptr, ptr %lex1, align 8
  %input_ptr147 = getelementptr inbounds %Lexer, ptr %structptr146, i32 0, i32 0
  %input148 = load ptr, ptr %input_ptr147, align 8
  %start149 = load i32, ptr %start126, align 4
  %length150 = load i32, ptr %length145, align 4
  %calltmp151 = call ptr @str_substring(ptr %input148, i32 %start149, i32 %length150)
  store ptr %calltmp151, ptr %value152, align 8
  %lex153 = load ptr, ptr %lex1, align 8
  %calltmp154 = call i8 @lexer_current(ptr %lex153)
  %eqtmp155 = icmp eq i8 %calltmp154, 34
  %ifcond156 = icmp ne i1 %eqtmp155, false
  br i1 %ifcond156, label %then157, label %ifcont159

then157:                                          ; preds = %afterwhile139
  %lex158 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex158)
  br label %ifcont159

ifcont159:                                        ; preds = %then157, %afterwhile139
  %structmem160 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr161 = getelementptr inbounds %Token, ptr %structmem160, i32 0, i32 0
  store i32 0, ptr %type_ptr161, align 4
  %value162 = load ptr, ptr %value152, align 8
  %value_ptr163 = getelementptr inbounds %Token, ptr %structmem160, i32 0, i32 1
  store ptr %value162, ptr %value_ptr163, align 8
  %structptr164 = load ptr, ptr %lex1, align 8
  %line_ptr165 = getelementptr inbounds %Lexer, ptr %structptr164, i32 0, i32 2
  %line166 = load i32, ptr %line_ptr165, align 4
  %line_ptr167 = getelementptr inbounds %Token, ptr %structmem160, i32 0, i32 2
  store i32 %line166, ptr %line_ptr167, align 4
  %tok_next_ptr168 = getelementptr inbounds %Token, ptr %structmem160, i32 0, i32 3
  store ptr @.str.44, ptr %tok_next_ptr168, align 8
  ret ptr %structmem160

ifcont169:                                        ; preds = %ifcont117
  %c170 = load i8, ptr %c, align 1
  %calltmp171 = call i1 @is_operator(i8 %c170)
  %ifcond172 = icmp ne i1 %calltmp171, false
  br i1 %ifcond172, label %then173, label %ifcont332

then173:                                          ; preds = %ifcont169
  %structptr174 = load ptr, ptr %lex1, align 8
  %pos_ptr175 = getelementptr inbounds %Lexer, ptr %structptr174, i32 0, i32 1
  %pos176 = load i32, ptr %pos_ptr175, align 4
  store i32 %pos176, ptr %start177, align 4
  %lex178 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex178)
  %lex179 = load ptr, ptr %lex1, align 8
  %calltmp180 = call i8 @lexer_current(ptr %lex179)
  store i8 %calltmp180, ptr %next, align 1
  %c181 = load i8, ptr %c, align 1
  %eqtmp182 = icmp eq i8 %c181, 61
  %next183 = load i8, ptr %next, align 1
  %eqtmp184 = icmp eq i8 %next183, 61
  %andtmp185 = and i1 %eqtmp182, %eqtmp184
  %ifcond186 = icmp ne i1 %andtmp185, false
  br i1 %ifcond186, label %then187, label %ifcont189

then187:                                          ; preds = %then173
  %lex188 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex188)
  br label %ifcont189

ifcont189:                                        ; preds = %then187, %then173
  %c190 = load i8, ptr %c, align 1
  %eqtmp191 = icmp eq i8 %c190, 33
  %next192 = load i8, ptr %next, align 1
  %eqtmp193 = icmp eq i8 %next192, 61
  %andtmp194 = and i1 %eqtmp191, %eqtmp193
  %ifcond195 = icmp ne i1 %andtmp194, false
  br i1 %ifcond195, label %then196, label %ifcont198

then196:                                          ; preds = %ifcont189
  %lex197 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex197)
  br label %ifcont198

ifcont198:                                        ; preds = %then196, %ifcont189
  %c199 = load i8, ptr %c, align 1
  %eqtmp200 = icmp eq i8 %c199, 60
  %next201 = load i8, ptr %next, align 1
  %eqtmp202 = icmp eq i8 %next201, 61
  %andtmp203 = and i1 %eqtmp200, %eqtmp202
  %ifcond204 = icmp ne i1 %andtmp203, false
  br i1 %ifcond204, label %then205, label %ifcont207

then205:                                          ; preds = %ifcont198
  %lex206 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex206)
  br label %ifcont207

ifcont207:                                        ; preds = %then205, %ifcont198
  %c208 = load i8, ptr %c, align 1
  %eqtmp209 = icmp eq i8 %c208, 62
  %next210 = load i8, ptr %next, align 1
  %eqtmp211 = icmp eq i8 %next210, 61
  %andtmp212 = and i1 %eqtmp209, %eqtmp211
  %ifcond213 = icmp ne i1 %andtmp212, false
  br i1 %ifcond213, label %then214, label %ifcont216

then214:                                          ; preds = %ifcont207
  %lex215 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex215)
  br label %ifcont216

ifcont216:                                        ; preds = %then214, %ifcont207
  %c217 = load i8, ptr %c, align 1
  %eqtmp218 = icmp eq i8 %c217, 38
  %next219 = load i8, ptr %next, align 1
  %eqtmp220 = icmp eq i8 %next219, 38
  %andtmp221 = and i1 %eqtmp218, %eqtmp220
  %ifcond222 = icmp ne i1 %andtmp221, false
  br i1 %ifcond222, label %then223, label %ifcont225

then223:                                          ; preds = %ifcont216
  %lex224 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex224)
  br label %ifcont225

ifcont225:                                        ; preds = %then223, %ifcont216
  %c226 = load i8, ptr %c, align 1
  %eqtmp227 = icmp eq i8 %c226, 124
  %next228 = load i8, ptr %next, align 1
  %eqtmp229 = icmp eq i8 %next228, 124
  %andtmp230 = and i1 %eqtmp227, %eqtmp229
  %ifcond231 = icmp ne i1 %andtmp230, false
  br i1 %ifcond231, label %then232, label %ifcont234

then232:                                          ; preds = %ifcont225
  %lex233 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex233)
  br label %ifcont234

ifcont234:                                        ; preds = %then232, %ifcont225
  %c235 = load i8, ptr %c, align 1
  %eqtmp236 = icmp eq i8 %c235, 45
  %next237 = load i8, ptr %next, align 1
  %eqtmp238 = icmp eq i8 %next237, 62
  %andtmp239 = and i1 %eqtmp236, %eqtmp238
  %ifcond240 = icmp ne i1 %andtmp239, false
  br i1 %ifcond240, label %then241, label %ifcont243

then241:                                          ; preds = %ifcont234
  %lex242 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex242)
  br label %ifcont243

ifcont243:                                        ; preds = %then241, %ifcont234
  %c244 = load i8, ptr %c, align 1
  %eqtmp245 = icmp eq i8 %c244, 61
  %next246 = load i8, ptr %next, align 1
  %eqtmp247 = icmp eq i8 %next246, 62
  %andtmp248 = and i1 %eqtmp245, %eqtmp247
  %ifcond249 = icmp ne i1 %andtmp248, false
  br i1 %ifcond249, label %then250, label %ifcont252

then250:                                          ; preds = %ifcont243
  %lex251 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex251)
  br label %ifcont252

ifcont252:                                        ; preds = %then250, %ifcont243
  %structptr253 = load ptr, ptr %lex1, align 8
  %pos_ptr254 = getelementptr inbounds %Lexer, ptr %structptr253, i32 0, i32 1
  %pos255 = load i32, ptr %pos_ptr254, align 4
  %start256 = load i32, ptr %start177, align 4
  %subtmp257 = sub i32 %pos255, %start256
  store i32 %subtmp257, ptr %length258, align 4
  %structptr259 = load ptr, ptr %lex1, align 8
  %input_ptr260 = getelementptr inbounds %Lexer, ptr %structptr259, i32 0, i32 0
  %input261 = load ptr, ptr %input_ptr260, align 8
  %start262 = load i32, ptr %start177, align 4
  %length263 = load i32, ptr %length258, align 4
  %calltmp264 = call ptr @str_substring(ptr %input261, i32 %start262, i32 %length263)
  store ptr %calltmp264, ptr %value265, align 8
  store i32 7, ptr %type, align 4
  %length266 = load i32, ptr %length258, align 4
  %eqtmp267 = icmp eq i32 %length266, 2
  %ifcond268 = icmp ne i1 %eqtmp267, false
  br i1 %ifcond268, label %then269, label %else

then269:                                          ; preds = %ifcont252
  %value270 = load ptr, ptr %value265, align 8
  %calltmp271 = call i32 @str_equals(ptr %value270, ptr @.str.45)
  %eqtmp272 = icmp eq i32 %calltmp271, 1
  %value273 = load ptr, ptr %value265, align 8
  %calltmp274 = call i32 @str_equals(ptr %value273, ptr @.str.46)
  %eqtmp275 = icmp eq i32 %calltmp274, 1
  %value276 = load ptr, ptr %value265, align 8
  %calltmp277 = call i32 @str_equals(ptr %value276, ptr @.str.47)
  %eqtmp278 = icmp eq i32 %calltmp277, 1
  %value279 = load ptr, ptr %value265, align 8
  %calltmp280 = call i32 @str_equals(ptr %value279, ptr @.str.48)
  %eqtmp281 = icmp eq i32 %calltmp280, 1
  %ortmp = or i1 %eqtmp278, %eqtmp281
  %ortmp282 = or i1 %eqtmp275, %ortmp
  %ortmp283 = or i1 %eqtmp272, %ortmp282
  %ifcond284 = icmp ne i1 %ortmp283, false
  br i1 %ifcond284, label %then285, label %ifcont286

then285:                                          ; preds = %then269
  store i32 8, ptr %type, align 4
  br label %ifcont286

ifcont286:                                        ; preds = %then285, %then269
  %value287 = load ptr, ptr %value265, align 8
  %calltmp288 = call i32 @str_equals(ptr %value287, ptr @.str.49)
  %eqtmp289 = icmp eq i32 %calltmp288, 1
  %value290 = load ptr, ptr %value265, align 8
  %calltmp291 = call i32 @str_equals(ptr %value290, ptr @.str.50)
  %eqtmp292 = icmp eq i32 %calltmp291, 1
  %ortmp293 = or i1 %eqtmp289, %eqtmp292
  %ifcond294 = icmp ne i1 %ortmp293, false
  br i1 %ifcond294, label %then295, label %ifcont302

then295:                                          ; preds = %ifcont286
  store i32 14, ptr %type, align 4
  %value296 = load ptr, ptr %value265, align 8
  %calltmp297 = call i32 @str_equals(ptr %value296, ptr @.str.51)
  %eqtmp298 = icmp eq i32 %calltmp297, 1
  %ifcond299 = icmp ne i1 %eqtmp298, false
  br i1 %ifcond299, label %then300, label %ifcont301

then300:                                          ; preds = %then295
  store i32 15, ptr %type, align 4
  br label %ifcont301

ifcont301:                                        ; preds = %then300, %then295
  br label %ifcont302

ifcont302:                                        ; preds = %ifcont301, %ifcont286
  br label %ifcont321

else:                                             ; preds = %ifcont252
  %c303 = load i8, ptr %c, align 1
  %eqtmp304 = icmp eq i8 %c303, 60
  %c305 = load i8, ptr %c, align 1
  %eqtmp306 = icmp eq i8 %c305, 62
  %ortmp307 = or i1 %eqtmp304, %eqtmp306
  %ifcond308 = icmp ne i1 %ortmp307, false
  br i1 %ifcond308, label %then309, label %ifcont310

then309:                                          ; preds = %else
  store i32 8, ptr %type, align 4
  br label %ifcont310

ifcont310:                                        ; preds = %then309, %else
  %c311 = load i8, ptr %c, align 1
  %eqtmp312 = icmp eq i8 %c311, 61
  %ifcond313 = icmp ne i1 %eqtmp312, false
  br i1 %ifcond313, label %then314, label %ifcont315

then314:                                          ; preds = %ifcont310
  store i32 11, ptr %type, align 4
  br label %ifcont315

ifcont315:                                        ; preds = %then314, %ifcont310
  %c316 = load i8, ptr %c, align 1
  %eqtmp317 = icmp eq i8 %c316, 33
  %ifcond318 = icmp ne i1 %eqtmp317, false
  br i1 %ifcond318, label %then319, label %ifcont320

then319:                                          ; preds = %ifcont315
  store i32 9, ptr %type, align 4
  br label %ifcont320

ifcont320:                                        ; preds = %then319, %ifcont315
  br label %ifcont321

ifcont321:                                        ; preds = %ifcont320, %ifcont302
  %structmem322 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type323 = load i32, ptr %type, align 4
  %type_ptr324 = getelementptr inbounds %Token, ptr %structmem322, i32 0, i32 0
  store i32 %type323, ptr %type_ptr324, align 4
  %value325 = load ptr, ptr %value265, align 8
  %value_ptr326 = getelementptr inbounds %Token, ptr %structmem322, i32 0, i32 1
  store ptr %value325, ptr %value_ptr326, align 8
  %structptr327 = load ptr, ptr %lex1, align 8
  %line_ptr328 = getelementptr inbounds %Lexer, ptr %structptr327, i32 0, i32 2
  %line329 = load i32, ptr %line_ptr328, align 4
  %line_ptr330 = getelementptr inbounds %Token, ptr %structmem322, i32 0, i32 2
  store i32 %line329, ptr %line_ptr330, align 4
  %tok_next_ptr331 = getelementptr inbounds %Token, ptr %structmem322, i32 0, i32 3
  store ptr @.str.52, ptr %tok_next_ptr331, align 8
  ret ptr %structmem322

ifcont332:                                        ; preds = %ifcont169
  %c333 = load i8, ptr %c, align 1
  %calltmp334 = call i1 @is_separator(i8 %c333)
  %ifcond335 = icmp ne i1 %calltmp334, false
  br i1 %ifcond335, label %then336, label %ifcont354

then336:                                          ; preds = %ifcont332
  %structptr337 = load ptr, ptr %lex1, align 8
  %input_ptr338 = getelementptr inbounds %Lexer, ptr %structptr337, i32 0, i32 0
  %input339 = load ptr, ptr %input_ptr338, align 8
  %structptr340 = load ptr, ptr %lex1, align 8
  %pos_ptr341 = getelementptr inbounds %Lexer, ptr %structptr340, i32 0, i32 1
  %pos342 = load i32, ptr %pos_ptr341, align 4
  %calltmp343 = call ptr @str_substring(ptr %input339, i32 %pos342, i32 1)
  store ptr %calltmp343, ptr %val, align 8
  %lex344 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex344)
  %structmem345 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr346 = getelementptr inbounds %Token, ptr %structmem345, i32 0, i32 0
  store i32 5, ptr %type_ptr346, align 4
  %val347 = load ptr, ptr %val, align 8
  %value_ptr348 = getelementptr inbounds %Token, ptr %structmem345, i32 0, i32 1
  store ptr %val347, ptr %value_ptr348, align 8
  %structptr349 = load ptr, ptr %lex1, align 8
  %line_ptr350 = getelementptr inbounds %Lexer, ptr %structptr349, i32 0, i32 2
  %line351 = load i32, ptr %line_ptr350, align 4
  %line_ptr352 = getelementptr inbounds %Token, ptr %structmem345, i32 0, i32 2
  store i32 %line351, ptr %line_ptr352, align 4
  %tok_next_ptr353 = getelementptr inbounds %Token, ptr %structmem345, i32 0, i32 3
  store ptr @.str.53, ptr %tok_next_ptr353, align 8
  ret ptr %structmem345

ifcont354:                                        ; preds = %ifcont332
  %lex355 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex355)
  %structmem356 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr357 = getelementptr inbounds %Token, ptr %structmem356, i32 0, i32 0
  store i32 17, ptr %type_ptr357, align 4
  %value_ptr358 = getelementptr inbounds %Token, ptr %structmem356, i32 0, i32 1
  store ptr @.str.54, ptr %value_ptr358, align 8
  %structptr359 = load ptr, ptr %lex1, align 8
  %line_ptr360 = getelementptr inbounds %Lexer, ptr %structptr359, i32 0, i32 2
  %line361 = load i32, ptr %line_ptr360, align 4
  %line_ptr362 = getelementptr inbounds %Token, ptr %structmem356, i32 0, i32 2
  store i32 %line361, ptr %line_ptr362, align 4
  %tok_next_ptr363 = getelementptr inbounds %Token, ptr %structmem356, i32 0, i32 3
  store ptr @.str.55, ptr %tok_next_ptr363, align 8
  ret ptr %structmem356
}

declare ptr @ptr_to_token(ptr)

declare ptr @token_to_ptr(ptr)

define ptr @lex_all_tokens(ptr %lex) {
entry:
  %next_tok = alloca ptr, align 8
  %current = alloca ptr, align 8
  %head = alloca ptr, align 8
  %lex1 = alloca ptr, align 8
  store ptr %lex, ptr %lex1, align 8
  %lex2 = load ptr, ptr %lex1, align 8
  %calltmp = call ptr @lexer_next_token(ptr %lex2)
  store ptr %calltmp, ptr %head, align 8
  %head3 = load ptr, ptr %head, align 8
  store ptr %head3, ptr %current, align 8
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %entry
  %structptr = load ptr, ptr %current, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %neqtmp = icmp ne i32 %type, 18
  br i1 %neqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %lex4 = load ptr, ptr %lex1, align 8
  %calltmp5 = call ptr @lexer_next_token(ptr %lex4)
  store ptr %calltmp5, ptr %next_tok, align 8
  %next_tok6 = load ptr, ptr %next_tok, align 8
  %calltmp7 = call ptr @token_to_ptr(ptr %next_tok6)
  %structptr8 = load ptr, ptr %current, align 8
  %fieldptr = getelementptr inbounds %Token, ptr %structptr8, i32 0, i32 3
  store ptr %calltmp7, ptr %fieldptr, align 8
  %next_tok9 = load ptr, ptr %next_tok, align 8
  store ptr %next_tok9, ptr %current, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %head10 = load ptr, ptr %head, align 8
  ret ptr %head10
}

declare ptr @ptr_to_node(ptr)

declare ptr @node_to_ptr(ptr)

define ptr @create_node(i32 %kind) {
entry:
  %kind1 = alloca i32, align 4
  store i32 %kind, ptr %kind1, align 4
  %structmem = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%ASTNode, ptr null, i32 1) to i64))
  %kind2 = load i32, ptr %kind1, align 4
  %kind_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 0
  store i32 %kind2, ptr %kind_ptr, align 4
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 1
  store ptr @.str.56, ptr %s1_ptr, align 8
  %s2_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 2
  store ptr @.str.57, ptr %s2_ptr, align 8
  %i1_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 3
  store i32 0, ptr %i1_ptr, align 4
  %i2_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 4
  store i32 0, ptr %i2_ptr, align 4
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 5
  store ptr @.str.58, ptr %child1_ptr, align 8
  %child2_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 6
  store ptr @.str.59, ptr %child2_ptr, align 8
  %child3_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 7
  store ptr @.str.60, ptr %child3_ptr, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 8
  store ptr @.str.61, ptr %next_ptr, align 8
  ret ptr %structmem
}

define ptr @parser_create(ptr %tokens) {
entry:
  %tokens1 = alloca ptr, align 8
  store ptr %tokens, ptr %tokens1, align 8
  %structmem = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Parser, ptr null, i32 1) to i64))
  %tokens2 = load ptr, ptr %tokens1, align 8
  %calltmp = call ptr @token_to_ptr(ptr %tokens2)
  %current_ptr = getelementptr inbounds %Parser, ptr %structmem, i32 0, i32 0
  store ptr %calltmp, ptr %current_ptr, align 8
  ret ptr %structmem
}

define ptr @parser_current(ptr %p) {
entry:
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %structptr = load ptr, ptr %p1, align 8
  %current_ptr = getelementptr inbounds %Parser, ptr %structptr, i32 0, i32 0
  %current = load ptr, ptr %current_ptr, align 8
  %calltmp = call ptr @ptr_to_token(ptr %current)
  ret ptr %calltmp
}

define ptr @parser_peek(ptr %p) {
entry:
  %curr = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %structptr = load ptr, ptr %p1, align 8
  %current_ptr = getelementptr inbounds %Parser, ptr %structptr, i32 0, i32 0
  %current = load ptr, ptr %current_ptr, align 8
  %calltmp = call ptr @ptr_to_token(ptr %current)
  store ptr %calltmp, ptr %curr, align 8
  %structptr2 = load ptr, ptr %curr, align 8
  %tok_next_ptr = getelementptr inbounds %Token, ptr %structptr2, i32 0, i32 3
  %tok_next = load ptr, ptr %tok_next_ptr, align 8
  %calltmp3 = call ptr @ptr_to_token(ptr %tok_next)
  ret ptr %calltmp3
}

define void @parser_advance(ptr %p) {
entry:
  %curr = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %structptr = load ptr, ptr %p1, align 8
  %current_ptr = getelementptr inbounds %Parser, ptr %structptr, i32 0, i32 0
  %current = load ptr, ptr %current_ptr, align 8
  %calltmp = call ptr @ptr_to_token(ptr %current)
  store ptr %calltmp, ptr %curr, align 8
  %structptr2 = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr2, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %neqtmp = icmp ne i32 %type, 18
  %ifcond = icmp ne i1 %neqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %structptr3 = load ptr, ptr %curr, align 8
  %tok_next_ptr = getelementptr inbounds %Token, ptr %structptr3, i32 0, i32 3
  %tok_next = load ptr, ptr %tok_next_ptr, align 8
  %structptr4 = load ptr, ptr %p1, align 8
  %fieldptr = getelementptr inbounds %Parser, ptr %structptr4, i32 0, i32 0
  store ptr %tok_next, ptr %fieldptr, align 8
  br label %ifcont

ifcont:                                           ; preds = %then, %entry
  ret void
}

define i1 @parser_check(ptr %p, i32 %t) {
entry:
  %curr = alloca ptr, align 8
  %t2 = alloca i32, align 4
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  store i32 %t, ptr %t2, align 4
  %p3 = load ptr, ptr %p1, align 8
  %calltmp = call ptr @parser_current(ptr %p3)
  store ptr %calltmp, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %t4 = load i32, ptr %t2, align 4
  %eqtmp = icmp eq i32 %type, %t4
  ret i1 %eqtmp
}

define i1 @parser_check_val(ptr %p, i32 %t, ptr %val) {
entry:
  %curr = alloca ptr, align 8
  %val3 = alloca ptr, align 8
  %t2 = alloca i32, align 4
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  store i32 %t, ptr %t2, align 4
  store ptr %val, ptr %val3, align 8
  %p4 = load ptr, ptr %p1, align 8
  %calltmp = call ptr @parser_current(ptr %p4)
  store ptr %calltmp, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %t5 = load i32, ptr %t2, align 4
  %eqtmp = icmp eq i32 %type, %t5
  %structptr6 = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr6, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %val7 = load ptr, ptr %val3, align 8
  %calltmp8 = call i32 @str_equals(ptr %value, ptr %val7)
  %eqtmp9 = icmp eq i32 %calltmp8, 1
  %andtmp = and i1 %eqtmp, %eqtmp9
  ret i1 %andtmp
}

define i1 @parser_match(ptr %p, i32 %t) {
entry:
  %t2 = alloca i32, align 4
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  store i32 %t, ptr %t2, align 4
  %p3 = load ptr, ptr %p1, align 8
  %t4 = load i32, ptr %t2, align 4
  %calltmp = call i1 @parser_check(ptr %p3, i32 %t4)
  %ifcond = icmp ne i1 %calltmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %p5 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p5)
  ret i1 true

ifcont:                                           ; preds = %entry
  ret i1 false
}

define i1 @parser_match_val(ptr %p, i32 %t, ptr %val) {
entry:
  %val3 = alloca ptr, align 8
  %t2 = alloca i32, align 4
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  store i32 %t, ptr %t2, align 4
  store ptr %val, ptr %val3, align 8
  %p4 = load ptr, ptr %p1, align 8
  %t5 = load i32, ptr %t2, align 4
  %val6 = load ptr, ptr %val3, align 8
  %calltmp = call i1 @parser_check_val(ptr %p4, i32 %t5, ptr %val6)
  %ifcond = icmp ne i1 %calltmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %p7 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p7)
  ret i1 true

ifcont:                                           ; preds = %entry
  ret i1 false
}

declare void @exit(i32)

define void @parser_expect(ptr %p, i32 %t, ptr %context) {
entry:
  %context3 = alloca ptr, align 8
  %t2 = alloca i32, align 4
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  store i32 %t, ptr %t2, align 4
  store ptr %context, ptr %context3, align 8
  %p4 = load ptr, ptr %p1, align 8
  %t5 = load i32, ptr %t2, align 4
  %calltmp = call i1 @parser_check(ptr %p4, i32 %t5)
  %eqtmp = icmp eq i1 %calltmp, false
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  call void @print(ptr @.str.62)
  %context6 = load ptr, ptr %context3, align 8
  call void @print(ptr %context6)
  call void @print(ptr @.str.63)
  %t7 = load i32, ptr %t2, align 4
  call void @println_int(i32 %t7)
  call void @exit(i32 1)
  br label %ifcont

ifcont:                                           ; preds = %then, %entry
  %p8 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p8)
  ret void
}

define void @parser_expect_val(ptr %p, i32 %t, ptr %val, ptr %context) {
entry:
  %context4 = alloca ptr, align 8
  %val3 = alloca ptr, align 8
  %t2 = alloca i32, align 4
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  store i32 %t, ptr %t2, align 4
  store ptr %val, ptr %val3, align 8
  store ptr %context, ptr %context4, align 8
  %p5 = load ptr, ptr %p1, align 8
  %t6 = load i32, ptr %t2, align 4
  %val7 = load ptr, ptr %val3, align 8
  %calltmp = call i1 @parser_check_val(ptr %p5, i32 %t6, ptr %val7)
  %eqtmp = icmp eq i1 %calltmp, false
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  call void @print(ptr @.str.64)
  %context8 = load ptr, ptr %context4, align 8
  call void @print(ptr %context8)
  call void @print(ptr @.str.65)
  %val9 = load ptr, ptr %val3, align 8
  call void @print(ptr %val9)
  call void @println(ptr @.str.66)
  call void @exit(i32 1)
  br label %ifcont

ifcont:                                           ; preds = %then, %entry
  %p10 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p10)
  ret void
}

define ptr @parse_declaration(ptr %p) {
entry:
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  %calltmp = call i1 @parser_check_val(ptr %p2, i32 16, ptr @.str.70)
  %ifcond = icmp ne i1 %calltmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call ptr @parse_import_statement(ptr %p3)
  ret ptr %calltmp4

ifcont:                                           ; preds = %entry
  %p5 = load ptr, ptr %p1, align 8
  %calltmp6 = call i1 @parser_check_val(ptr %p5, i32 16, ptr @.str.71)
  %ifcond7 = icmp ne i1 %calltmp6, false
  br i1 %ifcond7, label %then8, label %ifcont11

then8:                                            ; preds = %ifcont
  %p9 = load ptr, ptr %p1, align 8
  %calltmp10 = call ptr @parse_variable_decl(ptr %p9)
  ret ptr %calltmp10

ifcont11:                                         ; preds = %ifcont
  %p12 = load ptr, ptr %p1, align 8
  %calltmp13 = call i1 @parser_check_val(ptr %p12, i32 16, ptr @.str.72)
  %ifcond14 = icmp ne i1 %calltmp13, false
  br i1 %ifcond14, label %then15, label %ifcont18

then15:                                           ; preds = %ifcont11
  %p16 = load ptr, ptr %p1, align 8
  %calltmp17 = call ptr @parse_extern_fn_decl(ptr %p16)
  ret ptr %calltmp17

ifcont18:                                         ; preds = %ifcont11
  %p19 = load ptr, ptr %p1, align 8
  %calltmp20 = call i1 @parser_check_val(ptr %p19, i32 16, ptr @.str.73)
  %ifcond21 = icmp ne i1 %calltmp20, false
  br i1 %ifcond21, label %then22, label %ifcont25

then22:                                           ; preds = %ifcont18
  %p23 = load ptr, ptr %p1, align 8
  %calltmp24 = call ptr @parse_function_decl(ptr %p23)
  ret ptr %calltmp24

ifcont25:                                         ; preds = %ifcont18
  %p26 = load ptr, ptr %p1, align 8
  %calltmp27 = call i1 @parser_check_val(ptr %p26, i32 16, ptr @.str.74)
  %ifcond28 = icmp ne i1 %calltmp27, false
  br i1 %ifcond28, label %then29, label %ifcont32

then29:                                           ; preds = %ifcont25
  %p30 = load ptr, ptr %p1, align 8
  %calltmp31 = call ptr @parse_struct_decl(ptr %p30)
  ret ptr %calltmp31

ifcont32:                                         ; preds = %ifcont25
  %p33 = load ptr, ptr %p1, align 8
  %calltmp34 = call i1 @parser_check_val(ptr %p33, i32 16, ptr @.str.75)
  %ifcond35 = icmp ne i1 %calltmp34, false
  br i1 %ifcond35, label %then36, label %ifcont39

then36:                                           ; preds = %ifcont32
  %p37 = load ptr, ptr %p1, align 8
  %calltmp38 = call ptr @parse_enum_decl(ptr %p37)
  ret ptr %calltmp38

ifcont39:                                         ; preds = %ifcont32
  call void @println(ptr @.str.76)
  call void @exit(i32 1)
  %calltmp40 = call ptr @create_node(i32 0)
  ret ptr %calltmp40
}

define ptr @parse_type_annotation(ptr %p) {
entry:
  %curr = alloca ptr, align 8
  %type_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %calltmp = call ptr @create_node(i32 30)
  store ptr %calltmp, ptr %type_node, align 8
  %p2 = load ptr, ptr %p1, align 8
  %calltmp3 = call i1 @parser_match_val(ptr %p2, i32 5, ptr @.str.77)
  %ifcond = icmp ne i1 %calltmp3, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %structptr = load ptr, ptr %type_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 3
  store i32 1, ptr %fieldptr, align 4
  %p4 = load ptr, ptr %p1, align 8
  %calltmp5 = call ptr @parse_type_annotation(ptr %p4)
  %calltmp6 = call ptr @node_to_ptr(ptr %calltmp5)
  %structptr7 = load ptr, ptr %type_node, align 8
  %fieldptr8 = getelementptr inbounds %ASTNode, ptr %structptr7, i32 0, i32 5
  store ptr %calltmp6, ptr %fieldptr8, align 8
  %p9 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p9, i32 5, ptr @.str.78, ptr @.str.79)
  %type_node10 = load ptr, ptr %type_node, align 8
  ret ptr %type_node10

ifcont:                                           ; preds = %entry
  %p11 = load ptr, ptr %p1, align 8
  %calltmp12 = call ptr @parser_current(ptr %p11)
  store ptr %calltmp12, ptr %curr, align 8
  %structptr13 = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr13, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %eqtmp = icmp eq i32 %type, 4
  %structptr14 = load ptr, ptr %curr, align 8
  %type_ptr15 = getelementptr inbounds %Token, ptr %structptr14, i32 0, i32 0
  %type16 = load i32, ptr %type_ptr15, align 4
  %eqtmp17 = icmp eq i32 %type16, 16
  %ortmp = or i1 %eqtmp, %eqtmp17
  %ifcond18 = icmp ne i1 %ortmp, false
  br i1 %ifcond18, label %then19, label %else

then19:                                           ; preds = %ifcont
  %structptr20 = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr20, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %structptr21 = load ptr, ptr %type_node, align 8
  %fieldptr22 = getelementptr inbounds %ASTNode, ptr %structptr21, i32 0, i32 1
  store ptr %value, ptr %fieldptr22, align 8
  %p23 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p23)
  br label %ifcont24

else:                                             ; preds = %ifcont
  call void @println(ptr @.str.80)
  call void @exit(i32 1)
  br label %ifcont24

ifcont24:                                         ; preds = %else, %then19
  %type_node25 = load ptr, ptr %type_node, align 8
  ret ptr %type_node25
}

define ptr @parse_variable_decl(ptr %p) {
entry:
  %curr = alloca ptr, align 8
  %var_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 16, ptr @.str.81, ptr @.str.82)
  %calltmp = call ptr @create_node(i32 3)
  store ptr %calltmp, ptr %var_node, align 8
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call i1 @parser_match_val(ptr %p3, i32 16, ptr @.str.83)
  %ifcond = icmp ne i1 %calltmp4, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %structptr = load ptr, ptr %var_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 3
  store i32 1, ptr %fieldptr, align 4
  br label %ifcont

ifcont:                                           ; preds = %then, %entry
  %p5 = load ptr, ptr %p1, align 8
  %calltmp6 = call ptr @parser_current(ptr %p5)
  store ptr %calltmp6, ptr %curr, align 8
  %structptr7 = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr7, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %structptr8 = load ptr, ptr %var_node, align 8
  %fieldptr9 = getelementptr inbounds %ASTNode, ptr %structptr8, i32 0, i32 1
  store ptr %value, ptr %fieldptr9, align 8
  %p10 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p10, i32 4, ptr @.str.84)
  %p11 = load ptr, ptr %p1, align 8
  %calltmp12 = call i1 @parser_match_val(ptr %p11, i32 5, ptr @.str.85)
  %ifcond13 = icmp ne i1 %calltmp12, false
  br i1 %ifcond13, label %then14, label %ifcont20

then14:                                           ; preds = %ifcont
  %p15 = load ptr, ptr %p1, align 8
  %calltmp16 = call ptr @parse_type_annotation(ptr %p15)
  %calltmp17 = call ptr @node_to_ptr(ptr %calltmp16)
  %structptr18 = load ptr, ptr %var_node, align 8
  %fieldptr19 = getelementptr inbounds %ASTNode, ptr %structptr18, i32 0, i32 5
  store ptr %calltmp17, ptr %fieldptr19, align 8
  br label %ifcont20

ifcont20:                                         ; preds = %then14, %ifcont
  %p21 = load ptr, ptr %p1, align 8
  %calltmp22 = call i1 @parser_match_val(ptr %p21, i32 11, ptr @.str.86)
  %ifcond23 = icmp ne i1 %calltmp22, false
  br i1 %ifcond23, label %then24, label %ifcont30

then24:                                           ; preds = %ifcont20
  %p25 = load ptr, ptr %p1, align 8
  %calltmp26 = call ptr @parse_expression(ptr %p25, i32 0)
  %calltmp27 = call ptr @node_to_ptr(ptr %calltmp26)
  %structptr28 = load ptr, ptr %var_node, align 8
  %fieldptr29 = getelementptr inbounds %ASTNode, ptr %structptr28, i32 0, i32 6
  store ptr %calltmp27, ptr %fieldptr29, align 8
  br label %ifcont30

ifcont30:                                         ; preds = %then24, %ifcont20
  %var_node31 = load ptr, ptr %var_node, align 8
  ret ptr %var_node31
}

define ptr @parse_extern_fn_decl(ptr %p) {
entry:
  %last = alloca ptr, align 8
  %curr15 = alloca ptr, align 8
  %param = alloca ptr, align 8
  %is_looping = alloca i1, align 1
  %last_param = alloca ptr, align 8
  %curr = alloca ptr, align 8
  %ext_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 16, ptr @.str.87, ptr @.str.88)
  %p3 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p3, i32 16, ptr @.str.89, ptr @.str.90)
  %calltmp = call ptr @create_node(i32 2)
  store ptr %calltmp, ptr %ext_node, align 8
  %p4 = load ptr, ptr %p1, align 8
  %calltmp5 = call ptr @parser_current(ptr %p4)
  store ptr %calltmp5, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %structptr6 = load ptr, ptr %ext_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr6, i32 0, i32 1
  store ptr %value, ptr %fieldptr, align 8
  %p7 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p7, i32 4, ptr @.str.91)
  %p8 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p8, i32 5, ptr @.str.92, ptr @.str.93)
  store ptr @.str.94, ptr %last_param, align 8
  %p9 = load ptr, ptr %p1, align 8
  %calltmp10 = call i1 @parser_check_val(ptr %p9, i32 5, ptr @.str.95)
  %eqtmp = icmp eq i1 %calltmp10, false
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont51

then:                                             ; preds = %entry
  store i1 true, ptr %is_looping, align 1
  br label %whilecond

whilecond:                                        ; preds = %ifcont50, %then
  %is_looping11 = load i1, ptr %is_looping, align 1
  br i1 %is_looping11, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %calltmp12 = call ptr @create_node(i32 29)
  store ptr %calltmp12, ptr %param, align 8
  %p13 = load ptr, ptr %p1, align 8
  %calltmp14 = call ptr @parser_current(ptr %p13)
  store ptr %calltmp14, ptr %curr15, align 8
  %structptr16 = load ptr, ptr %curr15, align 8
  %value_ptr17 = getelementptr inbounds %Token, ptr %structptr16, i32 0, i32 1
  %value18 = load ptr, ptr %value_ptr17, align 8
  %structptr19 = load ptr, ptr %param, align 8
  %fieldptr20 = getelementptr inbounds %ASTNode, ptr %structptr19, i32 0, i32 1
  store ptr %value18, ptr %fieldptr20, align 8
  %p21 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p21, i32 4, ptr @.str.96)
  %p22 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p22, i32 5, ptr @.str.97, ptr @.str.98)
  %p23 = load ptr, ptr %p1, align 8
  %calltmp24 = call ptr @parse_type_annotation(ptr %p23)
  %calltmp25 = call ptr @node_to_ptr(ptr %calltmp24)
  %structptr26 = load ptr, ptr %param, align 8
  %fieldptr27 = getelementptr inbounds %ASTNode, ptr %structptr26, i32 0, i32 5
  store ptr %calltmp25, ptr %fieldptr27, align 8
  %structptr28 = load ptr, ptr %ext_node, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr28, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp29 = call i32 @str_equals(ptr %child1, ptr @.str.99)
  %eqtmp30 = icmp eq i32 %calltmp29, 1
  %ifcond31 = icmp ne i1 %eqtmp30, false
  br i1 %ifcond31, label %then32, label %else

then32:                                           ; preds = %whilebody
  %param33 = load ptr, ptr %param, align 8
  %calltmp34 = call ptr @node_to_ptr(ptr %param33)
  %structptr35 = load ptr, ptr %ext_node, align 8
  %fieldptr36 = getelementptr inbounds %ASTNode, ptr %structptr35, i32 0, i32 5
  store ptr %calltmp34, ptr %fieldptr36, align 8
  br label %ifcont

else:                                             ; preds = %whilebody
  %last_param37 = load ptr, ptr %last_param, align 8
  %calltmp38 = call ptr @ptr_to_node(ptr %last_param37)
  store ptr %calltmp38, ptr %last, align 8
  %param39 = load ptr, ptr %param, align 8
  %calltmp40 = call ptr @node_to_ptr(ptr %param39)
  %structptr41 = load ptr, ptr %last, align 8
  %fieldptr42 = getelementptr inbounds %ASTNode, ptr %structptr41, i32 0, i32 8
  store ptr %calltmp40, ptr %fieldptr42, align 8
  br label %ifcont

ifcont:                                           ; preds = %else, %then32
  %param43 = load ptr, ptr %param, align 8
  %calltmp44 = call ptr @node_to_ptr(ptr %param43)
  store ptr %calltmp44, ptr %last_param, align 8
  %p45 = load ptr, ptr %p1, align 8
  %calltmp46 = call i1 @parser_match_val(ptr %p45, i32 5, ptr @.str.100)
  %eqtmp47 = icmp eq i1 %calltmp46, false
  %ifcond48 = icmp ne i1 %eqtmp47, false
  br i1 %ifcond48, label %then49, label %ifcont50

then49:                                           ; preds = %ifcont
  store i1 false, ptr %is_looping, align 1
  br label %ifcont50

ifcont50:                                         ; preds = %then49, %ifcont
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  br label %ifcont51

ifcont51:                                         ; preds = %afterwhile, %entry
  %p52 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p52, i32 5, ptr @.str.101, ptr @.str.102)
  %p53 = load ptr, ptr %p1, align 8
  %calltmp54 = call i1 @parser_match_val(ptr %p53, i32 14, ptr @.str.103)
  %ifcond55 = icmp ne i1 %calltmp54, false
  br i1 %ifcond55, label %then56, label %ifcont62

then56:                                           ; preds = %ifcont51
  %p57 = load ptr, ptr %p1, align 8
  %calltmp58 = call ptr @parse_type_annotation(ptr %p57)
  %calltmp59 = call ptr @node_to_ptr(ptr %calltmp58)
  %structptr60 = load ptr, ptr %ext_node, align 8
  %fieldptr61 = getelementptr inbounds %ASTNode, ptr %structptr60, i32 0, i32 6
  store ptr %calltmp59, ptr %fieldptr61, align 8
  br label %ifcont62

ifcont62:                                         ; preds = %then56, %ifcont51
  %ext_node63 = load ptr, ptr %ext_node, align 8
  ret ptr %ext_node63
}

define ptr @parse_function_decl(ptr %p) {
entry:
  %last = alloca ptr, align 8
  %curr14 = alloca ptr, align 8
  %param = alloca ptr, align 8
  %is_looping = alloca i1, align 1
  %last_param = alloca ptr, align 8
  %curr = alloca ptr, align 8
  %fn_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 16, ptr @.str.104, ptr @.str.105)
  %calltmp = call ptr @create_node(i32 4)
  store ptr %calltmp, ptr %fn_node, align 8
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call ptr @parser_current(ptr %p3)
  store ptr %calltmp4, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %structptr5 = load ptr, ptr %fn_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr5, i32 0, i32 1
  store ptr %value, ptr %fieldptr, align 8
  %p6 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p6, i32 4, ptr @.str.106)
  %p7 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p7, i32 5, ptr @.str.107, ptr @.str.108)
  store ptr @.str.109, ptr %last_param, align 8
  %p8 = load ptr, ptr %p1, align 8
  %calltmp9 = call i1 @parser_check_val(ptr %p8, i32 5, ptr @.str.110)
  %eqtmp = icmp eq i1 %calltmp9, false
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont50

then:                                             ; preds = %entry
  store i1 true, ptr %is_looping, align 1
  br label %whilecond

whilecond:                                        ; preds = %ifcont49, %then
  %is_looping10 = load i1, ptr %is_looping, align 1
  br i1 %is_looping10, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %calltmp11 = call ptr @create_node(i32 29)
  store ptr %calltmp11, ptr %param, align 8
  %p12 = load ptr, ptr %p1, align 8
  %calltmp13 = call ptr @parser_current(ptr %p12)
  store ptr %calltmp13, ptr %curr14, align 8
  %structptr15 = load ptr, ptr %curr14, align 8
  %value_ptr16 = getelementptr inbounds %Token, ptr %structptr15, i32 0, i32 1
  %value17 = load ptr, ptr %value_ptr16, align 8
  %structptr18 = load ptr, ptr %param, align 8
  %fieldptr19 = getelementptr inbounds %ASTNode, ptr %structptr18, i32 0, i32 1
  store ptr %value17, ptr %fieldptr19, align 8
  %p20 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p20, i32 4, ptr @.str.111)
  %p21 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p21, i32 5, ptr @.str.112, ptr @.str.113)
  %p22 = load ptr, ptr %p1, align 8
  %calltmp23 = call ptr @parse_type_annotation(ptr %p22)
  %calltmp24 = call ptr @node_to_ptr(ptr %calltmp23)
  %structptr25 = load ptr, ptr %param, align 8
  %fieldptr26 = getelementptr inbounds %ASTNode, ptr %structptr25, i32 0, i32 5
  store ptr %calltmp24, ptr %fieldptr26, align 8
  %structptr27 = load ptr, ptr %fn_node, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr27, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp28 = call i32 @str_equals(ptr %child1, ptr @.str.114)
  %eqtmp29 = icmp eq i32 %calltmp28, 1
  %ifcond30 = icmp ne i1 %eqtmp29, false
  br i1 %ifcond30, label %then31, label %else

then31:                                           ; preds = %whilebody
  %param32 = load ptr, ptr %param, align 8
  %calltmp33 = call ptr @node_to_ptr(ptr %param32)
  %structptr34 = load ptr, ptr %fn_node, align 8
  %fieldptr35 = getelementptr inbounds %ASTNode, ptr %structptr34, i32 0, i32 5
  store ptr %calltmp33, ptr %fieldptr35, align 8
  br label %ifcont

else:                                             ; preds = %whilebody
  %last_param36 = load ptr, ptr %last_param, align 8
  %calltmp37 = call ptr @ptr_to_node(ptr %last_param36)
  store ptr %calltmp37, ptr %last, align 8
  %param38 = load ptr, ptr %param, align 8
  %calltmp39 = call ptr @node_to_ptr(ptr %param38)
  %structptr40 = load ptr, ptr %last, align 8
  %fieldptr41 = getelementptr inbounds %ASTNode, ptr %structptr40, i32 0, i32 8
  store ptr %calltmp39, ptr %fieldptr41, align 8
  br label %ifcont

ifcont:                                           ; preds = %else, %then31
  %param42 = load ptr, ptr %param, align 8
  %calltmp43 = call ptr @node_to_ptr(ptr %param42)
  store ptr %calltmp43, ptr %last_param, align 8
  %p44 = load ptr, ptr %p1, align 8
  %calltmp45 = call i1 @parser_match_val(ptr %p44, i32 5, ptr @.str.115)
  %eqtmp46 = icmp eq i1 %calltmp45, false
  %ifcond47 = icmp ne i1 %eqtmp46, false
  br i1 %ifcond47, label %then48, label %ifcont49

then48:                                           ; preds = %ifcont
  store i1 false, ptr %is_looping, align 1
  br label %ifcont49

ifcont49:                                         ; preds = %then48, %ifcont
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  br label %ifcont50

ifcont50:                                         ; preds = %afterwhile, %entry
  %p51 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p51, i32 5, ptr @.str.116, ptr @.str.117)
  %p52 = load ptr, ptr %p1, align 8
  %calltmp53 = call i1 @parser_match_val(ptr %p52, i32 14, ptr @.str.118)
  %ifcond54 = icmp ne i1 %calltmp53, false
  br i1 %ifcond54, label %then55, label %ifcont61

then55:                                           ; preds = %ifcont50
  %p56 = load ptr, ptr %p1, align 8
  %calltmp57 = call ptr @parse_type_annotation(ptr %p56)
  %calltmp58 = call ptr @node_to_ptr(ptr %calltmp57)
  %structptr59 = load ptr, ptr %fn_node, align 8
  %fieldptr60 = getelementptr inbounds %ASTNode, ptr %structptr59, i32 0, i32 7
  store ptr %calltmp58, ptr %fieldptr60, align 8
  br label %ifcont61

ifcont61:                                         ; preds = %then55, %ifcont50
  %p62 = load ptr, ptr %p1, align 8
  %calltmp63 = call ptr @parse_block(ptr %p62)
  %calltmp64 = call ptr @node_to_ptr(ptr %calltmp63)
  %structptr65 = load ptr, ptr %fn_node, align 8
  %fieldptr66 = getelementptr inbounds %ASTNode, ptr %structptr65, i32 0, i32 6
  store ptr %calltmp64, ptr %fieldptr66, align 8
  %fn_node67 = load ptr, ptr %fn_node, align 8
  ret ptr %fn_node67
}

define ptr @parse_struct_decl(ptr %p) {
entry:
  %last = alloca ptr, align 8
  %curr13 = alloca ptr, align 8
  %field = alloca ptr, align 8
  %last_field = alloca ptr, align 8
  %curr = alloca ptr, align 8
  %struct_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 16, ptr @.str.119, ptr @.str.120)
  %calltmp = call ptr @create_node(i32 5)
  store ptr %calltmp, ptr %struct_node, align 8
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call ptr @parser_current(ptr %p3)
  store ptr %calltmp4, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %structptr5 = load ptr, ptr %struct_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr5, i32 0, i32 1
  store ptr %value, ptr %fieldptr, align 8
  %p6 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p6, i32 4, ptr @.str.121)
  %p7 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p7, i32 5, ptr @.str.122, ptr @.str.123)
  store ptr @.str.124, ptr %last_field, align 8
  br label %whilecond

whilecond:                                        ; preds = %ifcont, %entry
  %p8 = load ptr, ptr %p1, align 8
  %calltmp9 = call i1 @parser_check_val(ptr %p8, i32 5, ptr @.str.125)
  %eqtmp = icmp eq i1 %calltmp9, false
  br i1 %eqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %calltmp10 = call ptr @create_node(i32 31)
  store ptr %calltmp10, ptr %field, align 8
  %p11 = load ptr, ptr %p1, align 8
  %calltmp12 = call ptr @parser_current(ptr %p11)
  store ptr %calltmp12, ptr %curr13, align 8
  %structptr14 = load ptr, ptr %curr13, align 8
  %value_ptr15 = getelementptr inbounds %Token, ptr %structptr14, i32 0, i32 1
  %value16 = load ptr, ptr %value_ptr15, align 8
  %structptr17 = load ptr, ptr %field, align 8
  %fieldptr18 = getelementptr inbounds %ASTNode, ptr %structptr17, i32 0, i32 1
  store ptr %value16, ptr %fieldptr18, align 8
  %p19 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p19, i32 4, ptr @.str.126)
  %p20 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p20, i32 5, ptr @.str.127, ptr @.str.128)
  %p21 = load ptr, ptr %p1, align 8
  %calltmp22 = call ptr @parse_type_annotation(ptr %p21)
  %calltmp23 = call ptr @node_to_ptr(ptr %calltmp22)
  %structptr24 = load ptr, ptr %field, align 8
  %fieldptr25 = getelementptr inbounds %ASTNode, ptr %structptr24, i32 0, i32 5
  store ptr %calltmp23, ptr %fieldptr25, align 8
  %structptr26 = load ptr, ptr %struct_node, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr26, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp27 = call i32 @str_equals(ptr %child1, ptr @.str.129)
  %eqtmp28 = icmp eq i32 %calltmp27, 1
  %ifcond = icmp ne i1 %eqtmp28, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %whilebody
  %field29 = load ptr, ptr %field, align 8
  %calltmp30 = call ptr @node_to_ptr(ptr %field29)
  %structptr31 = load ptr, ptr %struct_node, align 8
  %fieldptr32 = getelementptr inbounds %ASTNode, ptr %structptr31, i32 0, i32 5
  store ptr %calltmp30, ptr %fieldptr32, align 8
  br label %ifcont

else:                                             ; preds = %whilebody
  %last_field33 = load ptr, ptr %last_field, align 8
  %calltmp34 = call ptr @ptr_to_node(ptr %last_field33)
  store ptr %calltmp34, ptr %last, align 8
  %field35 = load ptr, ptr %field, align 8
  %calltmp36 = call ptr @node_to_ptr(ptr %field35)
  %structptr37 = load ptr, ptr %last, align 8
  %fieldptr38 = getelementptr inbounds %ASTNode, ptr %structptr37, i32 0, i32 8
  store ptr %calltmp36, ptr %fieldptr38, align 8
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %field39 = load ptr, ptr %field, align 8
  %calltmp40 = call ptr @node_to_ptr(ptr %field39)
  store ptr %calltmp40, ptr %last_field, align 8
  %p41 = load ptr, ptr %p1, align 8
  %calltmp42 = call i1 @parser_match_val(ptr %p41, i32 5, ptr @.str.130)
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %p43 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p43, i32 5, ptr @.str.131, ptr @.str.132)
  %struct_node44 = load ptr, ptr %struct_node, align 8
  ret ptr %struct_node44
}

define ptr @parse_enum_decl(ptr %p) {
entry:
  %last = alloca ptr, align 8
  %curr13 = alloca ptr, align 8
  %variant = alloca ptr, align 8
  %last_var = alloca ptr, align 8
  %curr = alloca ptr, align 8
  %enum_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 16, ptr @.str.133, ptr @.str.134)
  %calltmp = call ptr @create_node(i32 6)
  store ptr %calltmp, ptr %enum_node, align 8
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call ptr @parser_current(ptr %p3)
  store ptr %calltmp4, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %structptr5 = load ptr, ptr %enum_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr5, i32 0, i32 1
  store ptr %value, ptr %fieldptr, align 8
  %p6 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p6, i32 4, ptr @.str.135)
  %p7 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p7, i32 5, ptr @.str.136, ptr @.str.137)
  store ptr @.str.138, ptr %last_var, align 8
  br label %whilecond

whilecond:                                        ; preds = %ifcont, %entry
  %p8 = load ptr, ptr %p1, align 8
  %calltmp9 = call i1 @parser_check_val(ptr %p8, i32 5, ptr @.str.139)
  %eqtmp = icmp eq i1 %calltmp9, false
  br i1 %eqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %calltmp10 = call ptr @create_node(i32 32)
  store ptr %calltmp10, ptr %variant, align 8
  %p11 = load ptr, ptr %p1, align 8
  %calltmp12 = call ptr @parser_current(ptr %p11)
  store ptr %calltmp12, ptr %curr13, align 8
  %structptr14 = load ptr, ptr %curr13, align 8
  %value_ptr15 = getelementptr inbounds %Token, ptr %structptr14, i32 0, i32 1
  %value16 = load ptr, ptr %value_ptr15, align 8
  %structptr17 = load ptr, ptr %variant, align 8
  %fieldptr18 = getelementptr inbounds %ASTNode, ptr %structptr17, i32 0, i32 1
  store ptr %value16, ptr %fieldptr18, align 8
  %p19 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p19, i32 4, ptr @.str.140)
  %structptr20 = load ptr, ptr %enum_node, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr20, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp21 = call i32 @str_equals(ptr %child1, ptr @.str.141)
  %eqtmp22 = icmp eq i32 %calltmp21, 1
  %ifcond = icmp ne i1 %eqtmp22, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %whilebody
  %variant23 = load ptr, ptr %variant, align 8
  %calltmp24 = call ptr @node_to_ptr(ptr %variant23)
  %structptr25 = load ptr, ptr %enum_node, align 8
  %fieldptr26 = getelementptr inbounds %ASTNode, ptr %structptr25, i32 0, i32 5
  store ptr %calltmp24, ptr %fieldptr26, align 8
  br label %ifcont

else:                                             ; preds = %whilebody
  %last_var27 = load ptr, ptr %last_var, align 8
  %calltmp28 = call ptr @ptr_to_node(ptr %last_var27)
  store ptr %calltmp28, ptr %last, align 8
  %variant29 = load ptr, ptr %variant, align 8
  %calltmp30 = call ptr @node_to_ptr(ptr %variant29)
  %structptr31 = load ptr, ptr %last, align 8
  %fieldptr32 = getelementptr inbounds %ASTNode, ptr %structptr31, i32 0, i32 8
  store ptr %calltmp30, ptr %fieldptr32, align 8
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %variant33 = load ptr, ptr %variant, align 8
  %calltmp34 = call ptr @node_to_ptr(ptr %variant33)
  store ptr %calltmp34, ptr %last_var, align 8
  %p35 = load ptr, ptr %p1, align 8
  %calltmp36 = call i1 @parser_match_val(ptr %p35, i32 5, ptr @.str.142)
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %p37 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p37, i32 5, ptr @.str.143, ptr @.str.144)
  %enum_node38 = load ptr, ptr %enum_node, align 8
  ret ptr %enum_node38
}

define ptr @parse_block(ptr %p) {
entry:
  %last = alloca ptr, align 8
  %stmt = alloca ptr, align 8
  %last_stmt = alloca ptr, align 8
  %block_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 5, ptr @.str.145, ptr @.str.146)
  %calltmp = call ptr @create_node(i32 9)
  store ptr %calltmp, ptr %block_node, align 8
  store ptr @.str.147, ptr %last_stmt, align 8
  br label %whilecond

whilecond:                                        ; preds = %ifcont, %entry
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call i1 @parser_check_val(ptr %p3, i32 5, ptr @.str.148)
  %eqtmp = icmp eq i1 %calltmp4, false
  br i1 %eqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %p5 = load ptr, ptr %p1, align 8
  %calltmp6 = call ptr @parse_statement(ptr %p5)
  store ptr %calltmp6, ptr %stmt, align 8
  %structptr = load ptr, ptr %block_node, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp7 = call i32 @str_equals(ptr %child1, ptr @.str.149)
  %eqtmp8 = icmp eq i32 %calltmp7, 1
  %ifcond = icmp ne i1 %eqtmp8, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %whilebody
  %stmt9 = load ptr, ptr %stmt, align 8
  %calltmp10 = call ptr @node_to_ptr(ptr %stmt9)
  %structptr11 = load ptr, ptr %block_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr11, i32 0, i32 5
  store ptr %calltmp10, ptr %fieldptr, align 8
  br label %ifcont

else:                                             ; preds = %whilebody
  %last_stmt12 = load ptr, ptr %last_stmt, align 8
  %calltmp13 = call ptr @ptr_to_node(ptr %last_stmt12)
  store ptr %calltmp13, ptr %last, align 8
  %stmt14 = load ptr, ptr %stmt, align 8
  %calltmp15 = call ptr @node_to_ptr(ptr %stmt14)
  %structptr16 = load ptr, ptr %last, align 8
  %fieldptr17 = getelementptr inbounds %ASTNode, ptr %structptr16, i32 0, i32 8
  store ptr %calltmp15, ptr %fieldptr17, align 8
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %stmt18 = load ptr, ptr %stmt, align 8
  %calltmp19 = call ptr @node_to_ptr(ptr %stmt18)
  store ptr %calltmp19, ptr %last_stmt, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %p20 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p20, i32 5, ptr @.str.150, ptr @.str.151)
  %block_node21 = load ptr, ptr %block_node, align 8
  ret ptr %block_node21
}

define ptr @parse_statement(ptr %p) {
entry:
  %stmt = alloca ptr, align 8
  %assign_stmt = alloca ptr, align 8
  %expr = alloca ptr, align 8
  %curr = alloca ptr, align 8
  %ret_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  %calltmp = call i1 @parser_check_val(ptr %p2, i32 16, ptr @.str.166)
  %ifcond = icmp ne i1 %calltmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call ptr @parse_if_statement(ptr %p3)
  ret ptr %calltmp4

ifcont:                                           ; preds = %entry
  %p5 = load ptr, ptr %p1, align 8
  %calltmp6 = call i1 @parser_check_val(ptr %p5, i32 16, ptr @.str.167)
  %ifcond7 = icmp ne i1 %calltmp6, false
  br i1 %ifcond7, label %then8, label %ifcont11

then8:                                            ; preds = %ifcont
  %p9 = load ptr, ptr %p1, align 8
  %calltmp10 = call ptr @parse_while_statement(ptr %p9)
  ret ptr %calltmp10

ifcont11:                                         ; preds = %ifcont
  %p12 = load ptr, ptr %p1, align 8
  %calltmp13 = call i1 @parser_match_val(ptr %p12, i32 16, ptr @.str.168)
  %ifcond14 = icmp ne i1 %calltmp13, false
  br i1 %ifcond14, label %then15, label %ifcont29

then15:                                           ; preds = %ifcont11
  %calltmp16 = call ptr @create_node(i32 15)
  store ptr %calltmp16, ptr %ret_node, align 8
  %p17 = load ptr, ptr %p1, align 8
  %calltmp18 = call ptr @parser_current(ptr %p17)
  store ptr %calltmp18, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %neqtmp = icmp ne i32 %type, 5
  %structptr19 = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr19, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %calltmp20 = call i32 @str_equals(ptr %value, ptr @.str.169)
  %eqtmp = icmp eq i32 %calltmp20, 0
  %ortmp = or i1 %neqtmp, %eqtmp
  %ifcond21 = icmp ne i1 %ortmp, false
  br i1 %ifcond21, label %then22, label %ifcont27

then22:                                           ; preds = %then15
  %p23 = load ptr, ptr %p1, align 8
  %calltmp24 = call ptr @parse_expression(ptr %p23, i32 0)
  %calltmp25 = call ptr @node_to_ptr(ptr %calltmp24)
  %structptr26 = load ptr, ptr %ret_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr26, i32 0, i32 5
  store ptr %calltmp25, ptr %fieldptr, align 8
  br label %ifcont27

ifcont27:                                         ; preds = %then22, %then15
  %ret_node28 = load ptr, ptr %ret_node, align 8
  ret ptr %ret_node28

ifcont29:                                         ; preds = %ifcont11
  %p30 = load ptr, ptr %p1, align 8
  %calltmp31 = call i1 @parser_check_val(ptr %p30, i32 16, ptr @.str.170)
  %ifcond32 = icmp ne i1 %calltmp31, false
  br i1 %ifcond32, label %then33, label %ifcont36

then33:                                           ; preds = %ifcont29
  %p34 = load ptr, ptr %p1, align 8
  %calltmp35 = call ptr @parse_variable_decl(ptr %p34)
  ret ptr %calltmp35

ifcont36:                                         ; preds = %ifcont29
  %p37 = load ptr, ptr %p1, align 8
  %calltmp38 = call ptr @parse_expression(ptr %p37, i32 0)
  store ptr %calltmp38, ptr %expr, align 8
  %p39 = load ptr, ptr %p1, align 8
  %calltmp40 = call i1 @parser_match_val(ptr %p39, i32 11, ptr @.str.171)
  %ifcond41 = icmp ne i1 %calltmp40, false
  br i1 %ifcond41, label %then42, label %ifcont54

then42:                                           ; preds = %ifcont36
  %calltmp43 = call ptr @create_node(i32 16)
  store ptr %calltmp43, ptr %assign_stmt, align 8
  %expr44 = load ptr, ptr %expr, align 8
  %calltmp45 = call ptr @node_to_ptr(ptr %expr44)
  %structptr46 = load ptr, ptr %assign_stmt, align 8
  %fieldptr47 = getelementptr inbounds %ASTNode, ptr %structptr46, i32 0, i32 5
  store ptr %calltmp45, ptr %fieldptr47, align 8
  %p48 = load ptr, ptr %p1, align 8
  %calltmp49 = call ptr @parse_expression(ptr %p48, i32 0)
  %calltmp50 = call ptr @node_to_ptr(ptr %calltmp49)
  %structptr51 = load ptr, ptr %assign_stmt, align 8
  %fieldptr52 = getelementptr inbounds %ASTNode, ptr %structptr51, i32 0, i32 6
  store ptr %calltmp50, ptr %fieldptr52, align 8
  %assign_stmt53 = load ptr, ptr %assign_stmt, align 8
  ret ptr %assign_stmt53

ifcont54:                                         ; preds = %ifcont36
  %calltmp55 = call ptr @create_node(i32 17)
  store ptr %calltmp55, ptr %stmt, align 8
  %expr56 = load ptr, ptr %expr, align 8
  %calltmp57 = call ptr @node_to_ptr(ptr %expr56)
  %structptr58 = load ptr, ptr %stmt, align 8
  %fieldptr59 = getelementptr inbounds %ASTNode, ptr %structptr58, i32 0, i32 5
  store ptr %calltmp57, ptr %fieldptr59, align 8
  %stmt60 = load ptr, ptr %stmt, align 8
  ret ptr %stmt60
}

define ptr @parse_expression(ptr %p, i32 %precedence) {
entry:
  %bin_expr = alloca ptr, align 8
  %right = alloca ptr, align 8
  %op = alloca ptr, align 8
  %current_precedence = alloca i32, align 4
  %is_operator = alloca i1, align 1
  %curr = alloca ptr, align 8
  %is_looping = alloca i1, align 1
  %left = alloca ptr, align 8
  %precedence2 = alloca i32, align 4
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  store i32 %precedence, ptr %precedence2, align 4
  %p3 = load ptr, ptr %p1, align 8
  %calltmp = call ptr @parse_primary(ptr %p3)
  store ptr %calltmp, ptr %left, align 8
  store i1 true, ptr %is_looping, align 1
  br label %whilecond

whilecond:                                        ; preds = %ifcont52, %entry
  %is_looping4 = load i1, ptr %is_looping, align 1
  br i1 %is_looping4, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %p5 = load ptr, ptr %p1, align 8
  %calltmp6 = call ptr @parser_current(ptr %p5)
  store ptr %calltmp6, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %eqtmp = icmp eq i32 %type, 7
  %structptr7 = load ptr, ptr %curr, align 8
  %type_ptr8 = getelementptr inbounds %Token, ptr %structptr7, i32 0, i32 0
  %type9 = load i32, ptr %type_ptr8, align 4
  %eqtmp10 = icmp eq i32 %type9, 8
  %structptr11 = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr11, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %calltmp12 = call i32 @str_equals(ptr %value, ptr @.str.185)
  %eqtmp13 = icmp eq i32 %calltmp12, 1
  %structptr14 = load ptr, ptr %curr, align 8
  %value_ptr15 = getelementptr inbounds %Token, ptr %structptr14, i32 0, i32 1
  %value16 = load ptr, ptr %value_ptr15, align 8
  %calltmp17 = call i32 @str_equals(ptr %value16, ptr @.str.186)
  %eqtmp18 = icmp eq i32 %calltmp17, 1
  %ortmp = or i1 %eqtmp13, %eqtmp18
  %ortmp19 = or i1 %eqtmp10, %ortmp
  %ortmp20 = or i1 %eqtmp, %ortmp19
  store i1 %ortmp20, ptr %is_operator, align 1
  %is_operator21 = load i1, ptr %is_operator, align 1
  %eqtmp22 = icmp eq i1 %is_operator21, false
  %ifcond = icmp ne i1 %eqtmp22, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %whilebody
  store i1 false, ptr %is_looping, align 1
  br label %ifcont52

else:                                             ; preds = %whilebody
  %curr23 = load ptr, ptr %curr, align 8
  %calltmp24 = call i32 @get_operator_precedence(ptr %curr23)
  store i32 %calltmp24, ptr %current_precedence, align 4
  %current_precedence25 = load i32, ptr %current_precedence, align 4
  %eqtmp26 = icmp eq i32 %current_precedence25, 0
  %current_precedence27 = load i32, ptr %current_precedence, align 4
  %precedence28 = load i32, ptr %precedence2, align 4
  %lttmp = icmp slt i32 %current_precedence27, %precedence28
  %ortmp29 = or i1 %eqtmp26, %lttmp
  %ifcond30 = icmp ne i1 %ortmp29, false
  br i1 %ifcond30, label %then31, label %else32

then31:                                           ; preds = %else
  store i1 false, ptr %is_looping, align 1
  br label %ifcont

else32:                                           ; preds = %else
  %structptr33 = load ptr, ptr %curr, align 8
  %value_ptr34 = getelementptr inbounds %Token, ptr %structptr33, i32 0, i32 1
  %value35 = load ptr, ptr %value_ptr34, align 8
  store ptr %value35, ptr %op, align 8
  %p36 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p36)
  %p37 = load ptr, ptr %p1, align 8
  %current_precedence38 = load i32, ptr %current_precedence, align 4
  %addtmp = add i32 %current_precedence38, 1
  %calltmp39 = call ptr @parse_expression(ptr %p37, i32 %addtmp)
  store ptr %calltmp39, ptr %right, align 8
  %calltmp40 = call ptr @create_node(i32 20)
  store ptr %calltmp40, ptr %bin_expr, align 8
  %op41 = load ptr, ptr %op, align 8
  %structptr42 = load ptr, ptr %bin_expr, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr42, i32 0, i32 1
  store ptr %op41, ptr %fieldptr, align 8
  %left43 = load ptr, ptr %left, align 8
  %calltmp44 = call ptr @node_to_ptr(ptr %left43)
  %structptr45 = load ptr, ptr %bin_expr, align 8
  %fieldptr46 = getelementptr inbounds %ASTNode, ptr %structptr45, i32 0, i32 5
  store ptr %calltmp44, ptr %fieldptr46, align 8
  %right47 = load ptr, ptr %right, align 8
  %calltmp48 = call ptr @node_to_ptr(ptr %right47)
  %structptr49 = load ptr, ptr %bin_expr, align 8
  %fieldptr50 = getelementptr inbounds %ASTNode, ptr %structptr49, i32 0, i32 6
  store ptr %calltmp48, ptr %fieldptr50, align 8
  %bin_expr51 = load ptr, ptr %bin_expr, align 8
  store ptr %bin_expr51, ptr %left, align 8
  br label %ifcont

ifcont:                                           ; preds = %else32, %then31
  br label %ifcont52

ifcont52:                                         ; preds = %ifcont, %then
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %left53 = load ptr, ptr %left, align 8
  ret ptr %left53
}

define ptr @parse_primary(ptr %p) {
entry:
  %curr_mem = alloca ptr, align 8
  %member_node = alloca ptr, align 8
  %index_node = alloca ptr, align 8
  %last = alloca ptr, align 8
  %arg = alloca ptr, align 8
  %is_arg_looping = alloca i1, align 1
  %last_arg = alloca ptr, align 8
  %call = alloca ptr, align 8
  %is_looping = alloca i1, align 1
  %expr = alloca ptr, align 8
  %ident = alloca ptr, align 8
  %lit = alloca ptr, align 8
  %curr = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  %calltmp = call ptr @parser_current(ptr %p2)
  store ptr %calltmp, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %eqtmp = icmp eq i32 %type, 2
  %structptr3 = load ptr, ptr %curr, align 8
  %type_ptr4 = getelementptr inbounds %Token, ptr %structptr3, i32 0, i32 0
  %type5 = load i32, ptr %type_ptr4, align 4
  %eqtmp6 = icmp eq i32 %type5, 0
  %structptr7 = load ptr, ptr %curr, align 8
  %type_ptr8 = getelementptr inbounds %Token, ptr %structptr7, i32 0, i32 0
  %type9 = load i32, ptr %type_ptr8, align 4
  %eqtmp10 = icmp eq i32 %type9, 3
  %ortmp = or i1 %eqtmp6, %eqtmp10
  %ortmp11 = or i1 %eqtmp, %ortmp
  %ifcond = icmp ne i1 %ortmp11, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %calltmp12 = call ptr @create_node(i32 22)
  store ptr %calltmp12, ptr %lit, align 8
  %structptr13 = load ptr, ptr %curr, align 8
  %type_ptr14 = getelementptr inbounds %Token, ptr %structptr13, i32 0, i32 0
  %type15 = load i32, ptr %type_ptr14, align 4
  %structptr16 = load ptr, ptr %lit, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr16, i32 0, i32 3
  store i32 %type15, ptr %fieldptr, align 4
  %structptr17 = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr17, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %structptr18 = load ptr, ptr %lit, align 8
  %fieldptr19 = getelementptr inbounds %ASTNode, ptr %structptr18, i32 0, i32 1
  store ptr %value, ptr %fieldptr19, align 8
  %p20 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p20)
  %lit21 = load ptr, ptr %lit, align 8
  ret ptr %lit21

ifcont:                                           ; preds = %entry
  %structptr22 = load ptr, ptr %curr, align 8
  %type_ptr23 = getelementptr inbounds %Token, ptr %structptr22, i32 0, i32 0
  %type24 = load i32, ptr %type_ptr23, align 4
  %eqtmp25 = icmp eq i32 %type24, 4
  %ifcond26 = icmp ne i1 %eqtmp25, false
  br i1 %ifcond26, label %then27, label %ifcont125

then27:                                           ; preds = %ifcont
  %calltmp28 = call ptr @create_node(i32 23)
  store ptr %calltmp28, ptr %ident, align 8
  %structptr29 = load ptr, ptr %curr, align 8
  %value_ptr30 = getelementptr inbounds %Token, ptr %structptr29, i32 0, i32 1
  %value31 = load ptr, ptr %value_ptr30, align 8
  %structptr32 = load ptr, ptr %ident, align 8
  %fieldptr33 = getelementptr inbounds %ASTNode, ptr %structptr32, i32 0, i32 1
  store ptr %value31, ptr %fieldptr33, align 8
  %p34 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p34)
  %ident35 = load ptr, ptr %ident, align 8
  store ptr %ident35, ptr %expr, align 8
  store i1 true, ptr %is_looping, align 1
  br label %whilecond

whilecond:                                        ; preds = %ifcont122, %then27
  %is_looping36 = load i1, ptr %is_looping, align 1
  br i1 %is_looping36, label %whilebody, label %afterwhile123

whilebody:                                        ; preds = %whilecond
  %p37 = load ptr, ptr %p1, align 8
  %calltmp38 = call i1 @parser_match_val(ptr %p37, i32 5, ptr @.str.187)
  %ifcond39 = icmp ne i1 %calltmp38, false
  br i1 %ifcond39, label %then40, label %else83

then40:                                           ; preds = %whilebody
  %calltmp41 = call ptr @create_node(i32 24)
  store ptr %calltmp41, ptr %call, align 8
  %expr42 = load ptr, ptr %expr, align 8
  %calltmp43 = call ptr @node_to_ptr(ptr %expr42)
  %structptr44 = load ptr, ptr %call, align 8
  %fieldptr45 = getelementptr inbounds %ASTNode, ptr %structptr44, i32 0, i32 5
  store ptr %calltmp43, ptr %fieldptr45, align 8
  store ptr @.str.188, ptr %last_arg, align 8
  %p46 = load ptr, ptr %p1, align 8
  %calltmp47 = call i1 @parser_check_val(ptr %p46, i32 5, ptr @.str.189)
  %eqtmp48 = icmp eq i1 %calltmp47, false
  %ifcond49 = icmp ne i1 %eqtmp48, false
  br i1 %ifcond49, label %then50, label %ifcont80

then50:                                           ; preds = %then40
  store i1 true, ptr %is_arg_looping, align 1
  br label %whilecond51

whilecond51:                                      ; preds = %ifcont79, %then50
  %is_arg_looping52 = load i1, ptr %is_arg_looping, align 1
  br i1 %is_arg_looping52, label %whilebody53, label %afterwhile

whilebody53:                                      ; preds = %whilecond51
  %p54 = load ptr, ptr %p1, align 8
  %calltmp55 = call ptr @parse_expression(ptr %p54, i32 0)
  store ptr %calltmp55, ptr %arg, align 8
  %structptr56 = load ptr, ptr %call, align 8
  %child2_ptr = getelementptr inbounds %ASTNode, ptr %structptr56, i32 0, i32 6
  %child2 = load ptr, ptr %child2_ptr, align 8
  %calltmp57 = call i32 @str_equals(ptr %child2, ptr @.str.190)
  %eqtmp58 = icmp eq i32 %calltmp57, 1
  %ifcond59 = icmp ne i1 %eqtmp58, false
  br i1 %ifcond59, label %then60, label %else

then60:                                           ; preds = %whilebody53
  %arg61 = load ptr, ptr %arg, align 8
  %calltmp62 = call ptr @node_to_ptr(ptr %arg61)
  %structptr63 = load ptr, ptr %call, align 8
  %fieldptr64 = getelementptr inbounds %ASTNode, ptr %structptr63, i32 0, i32 6
  store ptr %calltmp62, ptr %fieldptr64, align 8
  br label %ifcont71

else:                                             ; preds = %whilebody53
  %last_arg65 = load ptr, ptr %last_arg, align 8
  %calltmp66 = call ptr @ptr_to_node(ptr %last_arg65)
  store ptr %calltmp66, ptr %last, align 8
  %arg67 = load ptr, ptr %arg, align 8
  %calltmp68 = call ptr @node_to_ptr(ptr %arg67)
  %structptr69 = load ptr, ptr %last, align 8
  %fieldptr70 = getelementptr inbounds %ASTNode, ptr %structptr69, i32 0, i32 8
  store ptr %calltmp68, ptr %fieldptr70, align 8
  br label %ifcont71

ifcont71:                                         ; preds = %else, %then60
  %arg72 = load ptr, ptr %arg, align 8
  %calltmp73 = call ptr @node_to_ptr(ptr %arg72)
  store ptr %calltmp73, ptr %last_arg, align 8
  %p74 = load ptr, ptr %p1, align 8
  %calltmp75 = call i1 @parser_match_val(ptr %p74, i32 5, ptr @.str.191)
  %eqtmp76 = icmp eq i1 %calltmp75, false
  %ifcond77 = icmp ne i1 %eqtmp76, false
  br i1 %ifcond77, label %then78, label %ifcont79

then78:                                           ; preds = %ifcont71
  store i1 false, ptr %is_arg_looping, align 1
  br label %ifcont79

ifcont79:                                         ; preds = %then78, %ifcont71
  br label %whilecond51

afterwhile:                                       ; preds = %whilecond51
  br label %ifcont80

ifcont80:                                         ; preds = %afterwhile, %then40
  %p81 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p81, i32 5, ptr @.str.192, ptr @.str.193)
  %call82 = load ptr, ptr %call, align 8
  store ptr %call82, ptr %expr, align 8
  br label %ifcont122

else83:                                           ; preds = %whilebody
  %p84 = load ptr, ptr %p1, align 8
  %calltmp85 = call i1 @parser_match_val(ptr %p84, i32 5, ptr @.str.194)
  %ifcond86 = icmp ne i1 %calltmp85, false
  br i1 %ifcond86, label %then87, label %else100

then87:                                           ; preds = %else83
  %calltmp88 = call ptr @create_node(i32 26)
  store ptr %calltmp88, ptr %index_node, align 8
  %expr89 = load ptr, ptr %expr, align 8
  %calltmp90 = call ptr @node_to_ptr(ptr %expr89)
  %structptr91 = load ptr, ptr %index_node, align 8
  %fieldptr92 = getelementptr inbounds %ASTNode, ptr %structptr91, i32 0, i32 5
  store ptr %calltmp90, ptr %fieldptr92, align 8
  %p93 = load ptr, ptr %p1, align 8
  %calltmp94 = call ptr @parse_expression(ptr %p93, i32 0)
  %calltmp95 = call ptr @node_to_ptr(ptr %calltmp94)
  %structptr96 = load ptr, ptr %index_node, align 8
  %fieldptr97 = getelementptr inbounds %ASTNode, ptr %structptr96, i32 0, i32 6
  store ptr %calltmp95, ptr %fieldptr97, align 8
  %p98 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p98, i32 5, ptr @.str.195, ptr @.str.196)
  %index_node99 = load ptr, ptr %index_node, align 8
  store ptr %index_node99, ptr %expr, align 8
  br label %ifcont121

else100:                                          ; preds = %else83
  %p101 = load ptr, ptr %p1, align 8
  %calltmp102 = call i1 @parser_match_val(ptr %p101, i32 5, ptr @.str.197)
  %ifcond103 = icmp ne i1 %calltmp102, false
  br i1 %ifcond103, label %then104, label %else119

then104:                                          ; preds = %else100
  %calltmp105 = call ptr @create_node(i32 25)
  store ptr %calltmp105, ptr %member_node, align 8
  %expr106 = load ptr, ptr %expr, align 8
  %calltmp107 = call ptr @node_to_ptr(ptr %expr106)
  %structptr108 = load ptr, ptr %member_node, align 8
  %fieldptr109 = getelementptr inbounds %ASTNode, ptr %structptr108, i32 0, i32 5
  store ptr %calltmp107, ptr %fieldptr109, align 8
  %p110 = load ptr, ptr %p1, align 8
  %calltmp111 = call ptr @parser_current(ptr %p110)
  store ptr %calltmp111, ptr %curr_mem, align 8
  %structptr112 = load ptr, ptr %curr_mem, align 8
  %value_ptr113 = getelementptr inbounds %Token, ptr %structptr112, i32 0, i32 1
  %value114 = load ptr, ptr %value_ptr113, align 8
  %structptr115 = load ptr, ptr %member_node, align 8
  %fieldptr116 = getelementptr inbounds %ASTNode, ptr %structptr115, i32 0, i32 1
  store ptr %value114, ptr %fieldptr116, align 8
  %p117 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p117, i32 4, ptr @.str.198)
  %member_node118 = load ptr, ptr %member_node, align 8
  store ptr %member_node118, ptr %expr, align 8
  br label %ifcont120

else119:                                          ; preds = %else100
  store i1 false, ptr %is_looping, align 1
  br label %ifcont120

ifcont120:                                        ; preds = %else119, %then104
  br label %ifcont121

ifcont121:                                        ; preds = %ifcont120, %then87
  br label %ifcont122

ifcont122:                                        ; preds = %ifcont121, %ifcont80
  br label %whilecond

afterwhile123:                                    ; preds = %whilecond
  %expr124 = load ptr, ptr %expr, align 8
  ret ptr %expr124

ifcont125:                                        ; preds = %ifcont
  call void @print(ptr @.str.199)
  %structptr126 = load ptr, ptr %curr, align 8
  %type_ptr127 = getelementptr inbounds %Token, ptr %structptr126, i32 0, i32 0
  %type128 = load i32, ptr %type_ptr127, align 4
  %calltmp129 = call ptr @type_to_string(i32 %type128)
  call void @print(ptr %calltmp129)
  call void @print(ptr @.str.200)
  %structptr130 = load ptr, ptr %curr, align 8
  %value_ptr131 = getelementptr inbounds %Token, ptr %structptr130, i32 0, i32 1
  %value132 = load ptr, ptr %value_ptr131, align 8
  call void @print(ptr %value132)
  call void @println(ptr @.str.201)
  call void @exit(i32 1)
  %calltmp133 = call ptr @create_node(i32 0)
  ret ptr %calltmp133
}

define ptr @parse_module(ptr %p) {
entry:
  %last = alloca ptr, align 8
  %stmt = alloca ptr, align 8
  %curr = alloca ptr, align 8
  %is_looping = alloca i1, align 1
  %last_stmt = alloca ptr, align 8
  %module = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %calltmp = call ptr @create_node(i32 0)
  store ptr %calltmp, ptr %module, align 8
  store ptr @.str.202, ptr %last_stmt, align 8
  store i1 true, ptr %is_looping, align 1
  br label %whilecond

whilecond:                                        ; preds = %ifcont24, %entry
  %is_looping2 = load i1, ptr %is_looping, align 1
  br i1 %is_looping2, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call ptr @parser_current(ptr %p3)
  store ptr %calltmp4, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %eqtmp = icmp eq i32 %type, 18
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %whilebody
  store i1 false, ptr %is_looping, align 1
  br label %ifcont24

else:                                             ; preds = %whilebody
  %p5 = load ptr, ptr %p1, align 8
  %calltmp6 = call ptr @parse_declaration(ptr %p5)
  store ptr %calltmp6, ptr %stmt, align 8
  %structptr7 = load ptr, ptr %module, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr7, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp8 = call i32 @str_equals(ptr %child1, ptr @.str.203)
  %eqtmp9 = icmp eq i32 %calltmp8, 1
  %ifcond10 = icmp ne i1 %eqtmp9, false
  br i1 %ifcond10, label %then11, label %else15

then11:                                           ; preds = %else
  %stmt12 = load ptr, ptr %stmt, align 8
  %calltmp13 = call ptr @node_to_ptr(ptr %stmt12)
  %structptr14 = load ptr, ptr %module, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr14, i32 0, i32 5
  store ptr %calltmp13, ptr %fieldptr, align 8
  br label %ifcont

else15:                                           ; preds = %else
  %last_stmt16 = load ptr, ptr %last_stmt, align 8
  %calltmp17 = call ptr @ptr_to_node(ptr %last_stmt16)
  store ptr %calltmp17, ptr %last, align 8
  %stmt18 = load ptr, ptr %stmt, align 8
  %calltmp19 = call ptr @node_to_ptr(ptr %stmt18)
  %structptr20 = load ptr, ptr %last, align 8
  %fieldptr21 = getelementptr inbounds %ASTNode, ptr %structptr20, i32 0, i32 8
  store ptr %calltmp19, ptr %fieldptr21, align 8
  br label %ifcont

ifcont:                                           ; preds = %else15, %then11
  %stmt22 = load ptr, ptr %stmt, align 8
  %calltmp23 = call ptr @node_to_ptr(ptr %stmt22)
  store ptr %calltmp23, ptr %last_stmt, align 8
  br label %ifcont24

ifcont24:                                         ; preds = %ifcont, %then
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %module25 = load ptr, ptr %module, align 8
  ret ptr %module25
}

define ptr @parse_import_statement(ptr %p) {
entry:
  %curr = alloca ptr, align 8
  %import_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 16, ptr @.str.67, ptr @.str.68)
  %calltmp = call ptr @create_node(i32 1)
  store ptr %calltmp, ptr %import_node, align 8
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call ptr @parser_current(ptr %p3)
  store ptr %calltmp4, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %structptr5 = load ptr, ptr %import_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr5, i32 0, i32 1
  store ptr %value, ptr %fieldptr, align 8
  %structptr6 = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr6, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %eqtmp = icmp eq i32 %type, 4
  %structptr7 = load ptr, ptr %curr, align 8
  %type_ptr8 = getelementptr inbounds %Token, ptr %structptr7, i32 0, i32 0
  %type9 = load i32, ptr %type_ptr8, align 4
  %eqtmp10 = icmp eq i32 %type9, 16
  %ortmp = or i1 %eqtmp, %eqtmp10
  %ifcond = icmp ne i1 %ortmp, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %entry
  %p11 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p11)
  br label %ifcont

else:                                             ; preds = %entry
  call void @println(ptr @.str.69)
  call void @exit(i32 1)
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %import_node12 = load ptr, ptr %import_node, align 8
  ret ptr %import_node12
}

define ptr @parse_if_statement(ptr %p) {
entry:
  %if_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 16, ptr @.str.152, ptr @.str.153)
  %calltmp = call ptr @create_node(i32 10)
  store ptr %calltmp, ptr %if_node, align 8
  %p3 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p3, i32 5, ptr @.str.154, ptr @.str.155)
  %p4 = load ptr, ptr %p1, align 8
  %calltmp5 = call ptr @parse_expression(ptr %p4, i32 0)
  %calltmp6 = call ptr @node_to_ptr(ptr %calltmp5)
  %structptr = load ptr, ptr %if_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  store ptr %calltmp6, ptr %fieldptr, align 8
  %p7 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p7, i32 5, ptr @.str.156, ptr @.str.157)
  %p8 = load ptr, ptr %p1, align 8
  %calltmp9 = call ptr @parse_block(ptr %p8)
  %calltmp10 = call ptr @node_to_ptr(ptr %calltmp9)
  %structptr11 = load ptr, ptr %if_node, align 8
  %fieldptr12 = getelementptr inbounds %ASTNode, ptr %structptr11, i32 0, i32 6
  store ptr %calltmp10, ptr %fieldptr12, align 8
  %p13 = load ptr, ptr %p1, align 8
  %calltmp14 = call i1 @parser_match_val(ptr %p13, i32 16, ptr @.str.158)
  %ifcond = icmp ne i1 %calltmp14, false
  br i1 %ifcond, label %then, label %ifcont29

then:                                             ; preds = %entry
  %p15 = load ptr, ptr %p1, align 8
  %calltmp16 = call i1 @parser_check_val(ptr %p15, i32 16, ptr @.str.159)
  %ifcond17 = icmp ne i1 %calltmp16, false
  br i1 %ifcond17, label %then18, label %else

then18:                                           ; preds = %then
  %p19 = load ptr, ptr %p1, align 8
  %calltmp20 = call ptr @parse_if_statement(ptr %p19)
  %calltmp21 = call ptr @node_to_ptr(ptr %calltmp20)
  %structptr22 = load ptr, ptr %if_node, align 8
  %fieldptr23 = getelementptr inbounds %ASTNode, ptr %structptr22, i32 0, i32 7
  store ptr %calltmp21, ptr %fieldptr23, align 8
  br label %ifcont

else:                                             ; preds = %then
  %p24 = load ptr, ptr %p1, align 8
  %calltmp25 = call ptr @parse_block(ptr %p24)
  %calltmp26 = call ptr @node_to_ptr(ptr %calltmp25)
  %structptr27 = load ptr, ptr %if_node, align 8
  %fieldptr28 = getelementptr inbounds %ASTNode, ptr %structptr27, i32 0, i32 7
  store ptr %calltmp26, ptr %fieldptr28, align 8
  br label %ifcont

ifcont:                                           ; preds = %else, %then18
  br label %ifcont29

ifcont29:                                         ; preds = %ifcont, %entry
  %if_node30 = load ptr, ptr %if_node, align 8
  ret ptr %if_node30
}

define ptr @parse_while_statement(ptr %p) {
entry:
  %while_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 16, ptr @.str.160, ptr @.str.161)
  %calltmp = call ptr @create_node(i32 13)
  store ptr %calltmp, ptr %while_node, align 8
  %p3 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p3, i32 5, ptr @.str.162, ptr @.str.163)
  %p4 = load ptr, ptr %p1, align 8
  %calltmp5 = call ptr @parse_expression(ptr %p4, i32 0)
  %calltmp6 = call ptr @node_to_ptr(ptr %calltmp5)
  %structptr = load ptr, ptr %while_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  store ptr %calltmp6, ptr %fieldptr, align 8
  %p7 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p7, i32 5, ptr @.str.164, ptr @.str.165)
  %p8 = load ptr, ptr %p1, align 8
  %calltmp9 = call ptr @parse_block(ptr %p8)
  %calltmp10 = call ptr @node_to_ptr(ptr %calltmp9)
  %structptr11 = load ptr, ptr %while_node, align 8
  %fieldptr12 = getelementptr inbounds %ASTNode, ptr %structptr11, i32 0, i32 6
  store ptr %calltmp10, ptr %fieldptr12, align 8
  %while_node13 = load ptr, ptr %while_node, align 8
  ret ptr %while_node13
}

define i32 @get_operator_precedence(ptr %t) {
entry:
  %t1 = alloca ptr, align 8
  store ptr %t, ptr %t1, align 8
  %structptr = load ptr, ptr %t1, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %calltmp = call i32 @str_equals(ptr %value, ptr @.str.172)
  %eqtmp = icmp eq i32 %calltmp, 1
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i32 1

ifcont:                                           ; preds = %entry
  %structptr2 = load ptr, ptr %t1, align 8
  %value_ptr3 = getelementptr inbounds %Token, ptr %structptr2, i32 0, i32 1
  %value4 = load ptr, ptr %value_ptr3, align 8
  %calltmp5 = call i32 @str_equals(ptr %value4, ptr @.str.173)
  %eqtmp6 = icmp eq i32 %calltmp5, 1
  %ifcond7 = icmp ne i1 %eqtmp6, false
  br i1 %ifcond7, label %then8, label %ifcont9

then8:                                            ; preds = %ifcont
  ret i32 2

ifcont9:                                          ; preds = %ifcont
  %structptr10 = load ptr, ptr %t1, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr10, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %eqtmp11 = icmp eq i32 %type, 16
  %ifcond12 = icmp ne i1 %eqtmp11, false
  br i1 %ifcond12, label %then13, label %ifcont14

then13:                                           ; preds = %ifcont9
  ret i32 0

ifcont14:                                         ; preds = %ifcont9
  %structptr15 = load ptr, ptr %t1, align 8
  %value_ptr16 = getelementptr inbounds %Token, ptr %structptr15, i32 0, i32 1
  %value17 = load ptr, ptr %value_ptr16, align 8
  %calltmp18 = call i32 @str_equals(ptr %value17, ptr @.str.174)
  %eqtmp19 = icmp eq i32 %calltmp18, 1
  %structptr20 = load ptr, ptr %t1, align 8
  %value_ptr21 = getelementptr inbounds %Token, ptr %structptr20, i32 0, i32 1
  %value22 = load ptr, ptr %value_ptr21, align 8
  %calltmp23 = call i32 @str_equals(ptr %value22, ptr @.str.175)
  %eqtmp24 = icmp eq i32 %calltmp23, 1
  %ortmp = or i1 %eqtmp19, %eqtmp24
  %ifcond25 = icmp ne i1 %ortmp, false
  br i1 %ifcond25, label %then26, label %ifcont27

then26:                                           ; preds = %ifcont14
  ret i32 3

ifcont27:                                         ; preds = %ifcont14
  %structptr28 = load ptr, ptr %t1, align 8
  %value_ptr29 = getelementptr inbounds %Token, ptr %structptr28, i32 0, i32 1
  %value30 = load ptr, ptr %value_ptr29, align 8
  %calltmp31 = call i32 @str_equals(ptr %value30, ptr @.str.176)
  %eqtmp32 = icmp eq i32 %calltmp31, 1
  %structptr33 = load ptr, ptr %t1, align 8
  %value_ptr34 = getelementptr inbounds %Token, ptr %structptr33, i32 0, i32 1
  %value35 = load ptr, ptr %value_ptr34, align 8
  %calltmp36 = call i32 @str_equals(ptr %value35, ptr @.str.177)
  %eqtmp37 = icmp eq i32 %calltmp36, 1
  %structptr38 = load ptr, ptr %t1, align 8
  %value_ptr39 = getelementptr inbounds %Token, ptr %structptr38, i32 0, i32 1
  %value40 = load ptr, ptr %value_ptr39, align 8
  %calltmp41 = call i32 @str_equals(ptr %value40, ptr @.str.178)
  %eqtmp42 = icmp eq i32 %calltmp41, 1
  %structptr43 = load ptr, ptr %t1, align 8
  %value_ptr44 = getelementptr inbounds %Token, ptr %structptr43, i32 0, i32 1
  %value45 = load ptr, ptr %value_ptr44, align 8
  %calltmp46 = call i32 @str_equals(ptr %value45, ptr @.str.179)
  %eqtmp47 = icmp eq i32 %calltmp46, 1
  %ortmp48 = or i1 %eqtmp42, %eqtmp47
  %ortmp49 = or i1 %eqtmp37, %ortmp48
  %ortmp50 = or i1 %eqtmp32, %ortmp49
  %ifcond51 = icmp ne i1 %ortmp50, false
  br i1 %ifcond51, label %then52, label %ifcont53

then52:                                           ; preds = %ifcont27
  ret i32 4

ifcont53:                                         ; preds = %ifcont27
  %structptr54 = load ptr, ptr %t1, align 8
  %value_ptr55 = getelementptr inbounds %Token, ptr %structptr54, i32 0, i32 1
  %value56 = load ptr, ptr %value_ptr55, align 8
  %calltmp57 = call i32 @str_equals(ptr %value56, ptr @.str.180)
  %eqtmp58 = icmp eq i32 %calltmp57, 1
  %structptr59 = load ptr, ptr %t1, align 8
  %value_ptr60 = getelementptr inbounds %Token, ptr %structptr59, i32 0, i32 1
  %value61 = load ptr, ptr %value_ptr60, align 8
  %calltmp62 = call i32 @str_equals(ptr %value61, ptr @.str.181)
  %eqtmp63 = icmp eq i32 %calltmp62, 1
  %ortmp64 = or i1 %eqtmp58, %eqtmp63
  %ifcond65 = icmp ne i1 %ortmp64, false
  br i1 %ifcond65, label %then66, label %ifcont67

then66:                                           ; preds = %ifcont53
  ret i32 5

ifcont67:                                         ; preds = %ifcont53
  %structptr68 = load ptr, ptr %t1, align 8
  %value_ptr69 = getelementptr inbounds %Token, ptr %structptr68, i32 0, i32 1
  %value70 = load ptr, ptr %value_ptr69, align 8
  %calltmp71 = call i32 @str_equals(ptr %value70, ptr @.str.182)
  %eqtmp72 = icmp eq i32 %calltmp71, 1
  %structptr73 = load ptr, ptr %t1, align 8
  %value_ptr74 = getelementptr inbounds %Token, ptr %structptr73, i32 0, i32 1
  %value75 = load ptr, ptr %value_ptr74, align 8
  %calltmp76 = call i32 @str_equals(ptr %value75, ptr @.str.183)
  %eqtmp77 = icmp eq i32 %calltmp76, 1
  %structptr78 = load ptr, ptr %t1, align 8
  %value_ptr79 = getelementptr inbounds %Token, ptr %structptr78, i32 0, i32 1
  %value80 = load ptr, ptr %value_ptr79, align 8
  %calltmp81 = call i32 @str_equals(ptr %value80, ptr @.str.184)
  %eqtmp82 = icmp eq i32 %calltmp81, 1
  %ortmp83 = or i1 %eqtmp77, %eqtmp82
  %ortmp84 = or i1 %eqtmp72, %ortmp83
  %ifcond85 = icmp ne i1 %ortmp84, false
  br i1 %ifcond85, label %then86, label %ifcont87

then86:                                           ; preds = %ifcont67
  ret i32 6

ifcont87:                                         ; preds = %ifcont67
  ret i32 0
}

declare ptr @read_file(ptr)

define void @main() {
entry:
  %stmt = alloca ptr, align 8
  %stmt_ptr = alloca ptr, align 8
  %ast = alloca ptr, align 8
  %p = alloca ptr, align 8
  %curr_tok = alloca ptr, align 8
  %head_token = alloca ptr, align 8
  %lex = alloca ptr, align 8
  %content = alloca ptr, align 8
  %path = alloca ptr, align 8
  call void @println(ptr @.str.204)
  store ptr @.str.205, ptr %path, align 8
  %path1 = load ptr, ptr %path, align 8
  %calltmp = call ptr @read_file(ptr %path1)
  store ptr %calltmp, ptr %content, align 8
  %content2 = load ptr, ptr %content, align 8
  %calltmp3 = call i32 @str_equals(ptr %content2, ptr @.str.206)
  %eqtmp = icmp eq i32 %calltmp3, 1
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  call void @println(ptr @.str.207)
  ret void

ifcont:                                           ; preds = %entry
  call void @println(ptr @.str.208)
  %content4 = load ptr, ptr %content, align 8
  call void @println(ptr %content4)
  %content5 = load ptr, ptr %content, align 8
  %calltmp6 = call ptr @create_lexer(ptr %content5)
  store ptr %calltmp6, ptr %lex, align 8
  %lex7 = load ptr, ptr %lex, align 8
  %calltmp8 = call ptr @lex_all_tokens(ptr %lex7)
  store ptr %calltmp8, ptr %head_token, align 8
  call void @println(ptr @.str.209)
  %head_token9 = load ptr, ptr %head_token, align 8
  store ptr %head_token9, ptr %curr_tok, align 8
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %ifcont
  %structptr = load ptr, ptr %curr_tok, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %neqtmp = icmp ne i32 %type, 18
  br i1 %neqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %structptr10 = load ptr, ptr %curr_tok, align 8
  %type_ptr11 = getelementptr inbounds %Token, ptr %structptr10, i32 0, i32 0
  %type12 = load i32, ptr %type_ptr11, align 4
  %calltmp13 = call ptr @type_to_string(i32 %type12)
  call void @print(ptr %calltmp13)
  call void @print(ptr @.str.210)
  %structptr14 = load ptr, ptr %curr_tok, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr14, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  call void @print(ptr %value)
  call void @println(ptr @.str.211)
  %structptr15 = load ptr, ptr %curr_tok, align 8
  %tok_next_ptr = getelementptr inbounds %Token, ptr %structptr15, i32 0, i32 3
  %tok_next = load ptr, ptr %tok_next_ptr, align 8
  %calltmp16 = call ptr @ptr_to_token(ptr %tok_next)
  store ptr %calltmp16, ptr %curr_tok, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  call void @println(ptr @.str.212)
  %head_token17 = load ptr, ptr %head_token, align 8
  %calltmp18 = call ptr @parser_create(ptr %head_token17)
  store ptr %calltmp18, ptr %p, align 8
  %p19 = load ptr, ptr %p, align 8
  %calltmp20 = call ptr @parse_module(ptr %p19)
  store ptr %calltmp20, ptr %ast, align 8
  call void @println(ptr @.str.213)
  %structptr21 = load ptr, ptr %ast, align 8
  %kind_ptr = getelementptr inbounds %ASTNode, ptr %structptr21, i32 0, i32 0
  %kind = load i32, ptr %kind_ptr, align 4
  %eqtmp22 = icmp eq i32 %kind, 0
  %ifcond23 = icmp ne i1 %eqtmp22, false
  br i1 %ifcond23, label %then24, label %ifcont63

then24:                                           ; preds = %afterwhile
  call void @println(ptr @.str.214)
  %structptr25 = load ptr, ptr %ast, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr25, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  store ptr %child1, ptr %stmt_ptr, align 8
  br label %whilecond26

whilecond26:                                      ; preds = %ifcont60, %then24
  %stmt_ptr27 = load ptr, ptr %stmt_ptr, align 8
  %calltmp28 = call i32 @str_equals(ptr %stmt_ptr27, ptr @.str.215)
  %eqtmp29 = icmp eq i32 %calltmp28, 0
  br i1 %eqtmp29, label %whilebody30, label %afterwhile62

whilebody30:                                      ; preds = %whilecond26
  %stmt_ptr31 = load ptr, ptr %stmt_ptr, align 8
  %calltmp32 = call ptr @ptr_to_node(ptr %stmt_ptr31)
  store ptr %calltmp32, ptr %stmt, align 8
  %structptr33 = load ptr, ptr %stmt, align 8
  %kind_ptr34 = getelementptr inbounds %ASTNode, ptr %structptr33, i32 0, i32 0
  %kind35 = load i32, ptr %kind_ptr34, align 4
  %eqtmp36 = icmp eq i32 %kind35, 3
  %ifcond37 = icmp ne i1 %eqtmp36, false
  br i1 %ifcond37, label %then38, label %ifcont40

then38:                                           ; preds = %whilebody30
  call void @print(ptr @.str.216)
  %structptr39 = load ptr, ptr %stmt, align 8
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structptr39, i32 0, i32 1
  %s1 = load ptr, ptr %s1_ptr, align 8
  call void @println(ptr %s1)
  br label %ifcont40

ifcont40:                                         ; preds = %then38, %whilebody30
  %structptr41 = load ptr, ptr %stmt, align 8
  %kind_ptr42 = getelementptr inbounds %ASTNode, ptr %structptr41, i32 0, i32 0
  %kind43 = load i32, ptr %kind_ptr42, align 4
  %eqtmp44 = icmp eq i32 %kind43, 4
  %ifcond45 = icmp ne i1 %eqtmp44, false
  br i1 %ifcond45, label %then46, label %ifcont50

then46:                                           ; preds = %ifcont40
  call void @print(ptr @.str.217)
  %structptr47 = load ptr, ptr %stmt, align 8
  %s1_ptr48 = getelementptr inbounds %ASTNode, ptr %structptr47, i32 0, i32 1
  %s149 = load ptr, ptr %s1_ptr48, align 8
  call void @println(ptr %s149)
  br label %ifcont50

ifcont50:                                         ; preds = %then46, %ifcont40
  %structptr51 = load ptr, ptr %stmt, align 8
  %kind_ptr52 = getelementptr inbounds %ASTNode, ptr %structptr51, i32 0, i32 0
  %kind53 = load i32, ptr %kind_ptr52, align 4
  %eqtmp54 = icmp eq i32 %kind53, 2
  %ifcond55 = icmp ne i1 %eqtmp54, false
  br i1 %ifcond55, label %then56, label %ifcont60

then56:                                           ; preds = %ifcont50
  call void @print(ptr @.str.218)
  %structptr57 = load ptr, ptr %stmt, align 8
  %s1_ptr58 = getelementptr inbounds %ASTNode, ptr %structptr57, i32 0, i32 1
  %s159 = load ptr, ptr %s1_ptr58, align 8
  call void @println(ptr %s159)
  br label %ifcont60

ifcont60:                                         ; preds = %then56, %ifcont50
  %structptr61 = load ptr, ptr %stmt, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr61, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  store ptr %next, ptr %stmt_ptr, align 8
  br label %whilecond26

afterwhile62:                                     ; preds = %whilecond26
  br label %ifcont63

ifcont63:                                         ; preds = %afterwhile62, %afterwhile
  call void @println(ptr @.str.219)
  ret void
}
