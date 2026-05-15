; ModuleID = 'main_module'
source_filename = "main_module"

%Lexer = type { ptr, i32, i32, i32 }
%Token = type { i32, ptr, i32, ptr }

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
  %lex1 = alloca ptr, align 8
  store ptr %lex, ptr %lex1, align 8
  br label %whilecond

whilecond:                                        ; preds = %ifcont, %entry
  %lex2 = load ptr, ptr %lex1, align 8
  %calltmp = call i8 @lexer_current(ptr %lex2)
  %calltmp3 = call i1 @is_space(i8 %calltmp)
  br i1 %calltmp3, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %lex4 = load ptr, ptr %lex1, align 8
  %calltmp5 = call i8 @lexer_current(ptr %lex4)
  %eqtmp = icmp eq i8 %calltmp5, 10
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %whilebody
  %structptr = load ptr, ptr %lex1, align 8
  %line_ptr = getelementptr inbounds %Lexer, ptr %structptr, i32 0, i32 2
  %line = load i32, ptr %line_ptr, align 4
  %addtmp = add i32 %line, 1
  %structptr6 = load ptr, ptr %lex1, align 8
  %fieldptr = getelementptr inbounds %Lexer, ptr %structptr6, i32 0, i32 2
  store i32 %addtmp, ptr %fieldptr, align 4
  %structptr7 = load ptr, ptr %lex1, align 8
  %fieldptr8 = getelementptr inbounds %Lexer, ptr %structptr7, i32 0, i32 3
  store i32 0, ptr %fieldptr8, align 4
  br label %ifcont

ifcont:                                           ; preds = %then, %whilebody
  %lex9 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex9)
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
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
  %next_ptr = getelementptr inbounds %Token, ptr %structmem, i32 0, i32 3
  store ptr @.str.39, ptr %next_ptr, align 8
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
  %next_ptr45 = getelementptr inbounds %Token, ptr %structmem37, i32 0, i32 3
  store ptr @.str.40, ptr %next_ptr45, align 8
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
  %next_ptr55 = getelementptr inbounds %Token, ptr %structmem47, i32 0, i32 3
  store ptr @.str.41, ptr %next_ptr55, align 8
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
  %next_ptr65 = getelementptr inbounds %Token, ptr %structmem57, i32 0, i32 3
  store ptr @.str.42, ptr %next_ptr65, align 8
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
  %next_ptr116 = getelementptr inbounds %Token, ptr %structmem108, i32 0, i32 3
  store ptr @.str.43, ptr %next_ptr116, align 8
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
  %next_ptr168 = getelementptr inbounds %Token, ptr %structmem160, i32 0, i32 3
  store ptr @.str.44, ptr %next_ptr168, align 8
  ret ptr %structmem160

ifcont169:                                        ; preds = %ifcont117
  %c170 = load i8, ptr %c, align 1
  %calltmp171 = call i1 @is_operator(i8 %c170)
  %ifcond172 = icmp ne i1 %calltmp171, false
  br i1 %ifcond172, label %then173, label %ifcont325

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
  %eqtmp271 = icmp eq ptr %value270, @.str.45
  %value272 = load ptr, ptr %value265, align 8
  %eqtmp273 = icmp eq ptr %value272, @.str.46
  %value274 = load ptr, ptr %value265, align 8
  %eqtmp275 = icmp eq ptr %value274, @.str.47
  %value276 = load ptr, ptr %value265, align 8
  %eqtmp277 = icmp eq ptr %value276, @.str.48
  %ortmp = or i1 %eqtmp275, %eqtmp277
  %ortmp278 = or i1 %eqtmp273, %ortmp
  %ortmp279 = or i1 %eqtmp271, %ortmp278
  %ifcond280 = icmp ne i1 %ortmp279, false
  br i1 %ifcond280, label %then281, label %ifcont282

then281:                                          ; preds = %then269
  store i32 8, ptr %type, align 4
  br label %ifcont282

ifcont282:                                        ; preds = %then281, %then269
  %value283 = load ptr, ptr %value265, align 8
  %eqtmp284 = icmp eq ptr %value283, @.str.49
  %value285 = load ptr, ptr %value265, align 8
  %eqtmp286 = icmp eq ptr %value285, @.str.50
  %ortmp287 = or i1 %eqtmp284, %eqtmp286
  %ifcond288 = icmp ne i1 %ortmp287, false
  br i1 %ifcond288, label %then289, label %ifcont295

then289:                                          ; preds = %ifcont282
  store i32 14, ptr %type, align 4
  %value290 = load ptr, ptr %value265, align 8
  %eqtmp291 = icmp eq ptr %value290, @.str.51
  %ifcond292 = icmp ne i1 %eqtmp291, false
  br i1 %ifcond292, label %then293, label %ifcont294

then293:                                          ; preds = %then289
  store i32 15, ptr %type, align 4
  br label %ifcont294

ifcont294:                                        ; preds = %then293, %then289
  br label %ifcont295

ifcont295:                                        ; preds = %ifcont294, %ifcont282
  br label %ifcont314

else:                                             ; preds = %ifcont252
  %c296 = load i8, ptr %c, align 1
  %eqtmp297 = icmp eq i8 %c296, 60
  %c298 = load i8, ptr %c, align 1
  %eqtmp299 = icmp eq i8 %c298, 62
  %ortmp300 = or i1 %eqtmp297, %eqtmp299
  %ifcond301 = icmp ne i1 %ortmp300, false
  br i1 %ifcond301, label %then302, label %ifcont303

then302:                                          ; preds = %else
  store i32 8, ptr %type, align 4
  br label %ifcont303

ifcont303:                                        ; preds = %then302, %else
  %c304 = load i8, ptr %c, align 1
  %eqtmp305 = icmp eq i8 %c304, 61
  %ifcond306 = icmp ne i1 %eqtmp305, false
  br i1 %ifcond306, label %then307, label %ifcont308

then307:                                          ; preds = %ifcont303
  store i32 11, ptr %type, align 4
  br label %ifcont308

ifcont308:                                        ; preds = %then307, %ifcont303
  %c309 = load i8, ptr %c, align 1
  %eqtmp310 = icmp eq i8 %c309, 33
  %ifcond311 = icmp ne i1 %eqtmp310, false
  br i1 %ifcond311, label %then312, label %ifcont313

then312:                                          ; preds = %ifcont308
  store i32 9, ptr %type, align 4
  br label %ifcont313

ifcont313:                                        ; preds = %then312, %ifcont308
  br label %ifcont314

ifcont314:                                        ; preds = %ifcont313, %ifcont295
  %structmem315 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type316 = load i32, ptr %type, align 4
  %type_ptr317 = getelementptr inbounds %Token, ptr %structmem315, i32 0, i32 0
  store i32 %type316, ptr %type_ptr317, align 4
  %value318 = load ptr, ptr %value265, align 8
  %value_ptr319 = getelementptr inbounds %Token, ptr %structmem315, i32 0, i32 1
  store ptr %value318, ptr %value_ptr319, align 8
  %structptr320 = load ptr, ptr %lex1, align 8
  %line_ptr321 = getelementptr inbounds %Lexer, ptr %structptr320, i32 0, i32 2
  %line322 = load i32, ptr %line_ptr321, align 4
  %line_ptr323 = getelementptr inbounds %Token, ptr %structmem315, i32 0, i32 2
  store i32 %line322, ptr %line_ptr323, align 4
  %next_ptr324 = getelementptr inbounds %Token, ptr %structmem315, i32 0, i32 3
  store ptr @.str.52, ptr %next_ptr324, align 8
  ret ptr %structmem315

ifcont325:                                        ; preds = %ifcont169
  %c326 = load i8, ptr %c, align 1
  %calltmp327 = call i1 @is_separator(i8 %c326)
  %ifcond328 = icmp ne i1 %calltmp327, false
  br i1 %ifcond328, label %then329, label %ifcont347

then329:                                          ; preds = %ifcont325
  %structptr330 = load ptr, ptr %lex1, align 8
  %input_ptr331 = getelementptr inbounds %Lexer, ptr %structptr330, i32 0, i32 0
  %input332 = load ptr, ptr %input_ptr331, align 8
  %structptr333 = load ptr, ptr %lex1, align 8
  %pos_ptr334 = getelementptr inbounds %Lexer, ptr %structptr333, i32 0, i32 1
  %pos335 = load i32, ptr %pos_ptr334, align 4
  %calltmp336 = call ptr @str_substring(ptr %input332, i32 %pos335, i32 1)
  store ptr %calltmp336, ptr %val, align 8
  %lex337 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex337)
  %structmem338 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr339 = getelementptr inbounds %Token, ptr %structmem338, i32 0, i32 0
  store i32 5, ptr %type_ptr339, align 4
  %val340 = load ptr, ptr %val, align 8
  %value_ptr341 = getelementptr inbounds %Token, ptr %structmem338, i32 0, i32 1
  store ptr %val340, ptr %value_ptr341, align 8
  %structptr342 = load ptr, ptr %lex1, align 8
  %line_ptr343 = getelementptr inbounds %Lexer, ptr %structptr342, i32 0, i32 2
  %line344 = load i32, ptr %line_ptr343, align 4
  %line_ptr345 = getelementptr inbounds %Token, ptr %structmem338, i32 0, i32 2
  store i32 %line344, ptr %line_ptr345, align 4
  %next_ptr346 = getelementptr inbounds %Token, ptr %structmem338, i32 0, i32 3
  store ptr @.str.53, ptr %next_ptr346, align 8
  ret ptr %structmem338

ifcont347:                                        ; preds = %ifcont325
  %lex348 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex348)
  %structmem349 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr350 = getelementptr inbounds %Token, ptr %structmem349, i32 0, i32 0
  store i32 17, ptr %type_ptr350, align 4
  %value_ptr351 = getelementptr inbounds %Token, ptr %structmem349, i32 0, i32 1
  store ptr @.str.54, ptr %value_ptr351, align 8
  %structptr352 = load ptr, ptr %lex1, align 8
  %line_ptr353 = getelementptr inbounds %Lexer, ptr %structptr352, i32 0, i32 2
  %line354 = load i32, ptr %line_ptr353, align 4
  %line_ptr355 = getelementptr inbounds %Token, ptr %structmem349, i32 0, i32 2
  store i32 %line354, ptr %line_ptr355, align 4
  %next_ptr356 = getelementptr inbounds %Token, ptr %structmem349, i32 0, i32 3
  store ptr @.str.55, ptr %next_ptr356, align 8
  ret ptr %structmem349
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
