; ModuleID = 'main_module'
source_filename = "main_module"

@.str = private unnamed_addr constant [7 x i8] c"import\00"
@.str.1 = private unnamed_addr constant [6 x i8] c"match\00"
@.str.2 = private unnamed_addr constant [3 x i8] c"if\00"
@.str.3 = private unnamed_addr constant [5 x i8] c"else\00"
@.str.4 = private unnamed_addr constant [4 x i8] c"and\00"
@.str.5 = private unnamed_addr constant [3 x i8] c"or\00"
@.str.6 = private unnamed_addr constant [5 x i8] c"true\00"
@.str.7 = private unnamed_addr constant [6 x i8] c"false\00"
@.str.8 = private unnamed_addr constant [6 x i8] c"break\00"
@.str.9 = private unnamed_addr constant [9 x i8] c"continue\00"
@.str.10 = private unnamed_addr constant [7 x i8] c"return\00"
@.str.11 = private unnamed_addr constant [6 x i8] c"throw\00"
@.str.12 = private unnamed_addr constant [6 x i8] c"while\00"
@.str.13 = private unnamed_addr constant [5 x i8] c"loop\00"
@.str.14 = private unnamed_addr constant [4 x i8] c"for\00"
@.str.15 = private unnamed_addr constant [3 x i8] c"in\00"
@.str.16 = private unnamed_addr constant [4 x i8] c"let\00"
@.str.17 = private unnamed_addr constant [7 x i8] c"struct\00"
@.str.18 = private unnamed_addr constant [5 x i8] c"impl\00"
@.str.19 = private unnamed_addr constant [5 x i8] c"enum\00"
@.str.20 = private unnamed_addr constant [6 x i8] c"trait\00"
@.str.21 = private unnamed_addr constant [3 x i8] c"fn\00"
@.str.22 = private unnamed_addr constant [7 x i8] c"extern\00"
@.str.23 = private unnamed_addr constant [4 x i8] c"mut\00"
@.str.24 = private unnamed_addr constant [5 x i8] c"true\00"
@.str.25 = private unnamed_addr constant [6 x i8] c"false\00"

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

define i1 @is_keyword(ptr %s) {
entry:
  %s1 = alloca ptr, align 8
  store ptr %s, ptr %s1, align 8
  %s2 = load ptr, ptr %s1, align 8
  %calltmp = call i32 @str_equals(ptr %s2, ptr @.str)
  %eqtmp = icmp eq i32 %calltmp, 1
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i1 true

ifcont:                                           ; preds = %entry
  %s3 = load ptr, ptr %s1, align 8
  %calltmp4 = call i32 @str_equals(ptr %s3, ptr @.str.1)
  %eqtmp5 = icmp eq i32 %calltmp4, 1
  %ifcond6 = icmp ne i1 %eqtmp5, false
  br i1 %ifcond6, label %then7, label %ifcont8

then7:                                            ; preds = %ifcont
  ret i1 true

ifcont8:                                          ; preds = %ifcont
  %s9 = load ptr, ptr %s1, align 8
  %calltmp10 = call i32 @str_equals(ptr %s9, ptr @.str.2)
  %eqtmp11 = icmp eq i32 %calltmp10, 1
  %ifcond12 = icmp ne i1 %eqtmp11, false
  br i1 %ifcond12, label %then13, label %ifcont14

then13:                                           ; preds = %ifcont8
  ret i1 true

ifcont14:                                         ; preds = %ifcont8
  %s15 = load ptr, ptr %s1, align 8
  %calltmp16 = call i32 @str_equals(ptr %s15, ptr @.str.3)
  %eqtmp17 = icmp eq i32 %calltmp16, 1
  %ifcond18 = icmp ne i1 %eqtmp17, false
  br i1 %ifcond18, label %then19, label %ifcont20

then19:                                           ; preds = %ifcont14
  ret i1 true

ifcont20:                                         ; preds = %ifcont14
  %s21 = load ptr, ptr %s1, align 8
  %calltmp22 = call i32 @str_equals(ptr %s21, ptr @.str.4)
  %eqtmp23 = icmp eq i32 %calltmp22, 1
  %ifcond24 = icmp ne i1 %eqtmp23, false
  br i1 %ifcond24, label %then25, label %ifcont26

then25:                                           ; preds = %ifcont20
  ret i1 true

ifcont26:                                         ; preds = %ifcont20
  %s27 = load ptr, ptr %s1, align 8
  %calltmp28 = call i32 @str_equals(ptr %s27, ptr @.str.5)
  %eqtmp29 = icmp eq i32 %calltmp28, 1
  %ifcond30 = icmp ne i1 %eqtmp29, false
  br i1 %ifcond30, label %then31, label %ifcont32

then31:                                           ; preds = %ifcont26
  ret i1 true

ifcont32:                                         ; preds = %ifcont26
  %s33 = load ptr, ptr %s1, align 8
  %calltmp34 = call i32 @str_equals(ptr %s33, ptr @.str.6)
  %eqtmp35 = icmp eq i32 %calltmp34, 1
  %ifcond36 = icmp ne i1 %eqtmp35, false
  br i1 %ifcond36, label %then37, label %ifcont38

then37:                                           ; preds = %ifcont32
  ret i1 true

ifcont38:                                         ; preds = %ifcont32
  %s39 = load ptr, ptr %s1, align 8
  %calltmp40 = call i32 @str_equals(ptr %s39, ptr @.str.7)
  %eqtmp41 = icmp eq i32 %calltmp40, 1
  %ifcond42 = icmp ne i1 %eqtmp41, false
  br i1 %ifcond42, label %then43, label %ifcont44

then43:                                           ; preds = %ifcont38
  ret i1 true

ifcont44:                                         ; preds = %ifcont38
  %s45 = load ptr, ptr %s1, align 8
  %calltmp46 = call i32 @str_equals(ptr %s45, ptr @.str.8)
  %eqtmp47 = icmp eq i32 %calltmp46, 1
  %ifcond48 = icmp ne i1 %eqtmp47, false
  br i1 %ifcond48, label %then49, label %ifcont50

then49:                                           ; preds = %ifcont44
  ret i1 true

ifcont50:                                         ; preds = %ifcont44
  %s51 = load ptr, ptr %s1, align 8
  %calltmp52 = call i32 @str_equals(ptr %s51, ptr @.str.9)
  %eqtmp53 = icmp eq i32 %calltmp52, 1
  %ifcond54 = icmp ne i1 %eqtmp53, false
  br i1 %ifcond54, label %then55, label %ifcont56

then55:                                           ; preds = %ifcont50
  ret i1 true

ifcont56:                                         ; preds = %ifcont50
  %s57 = load ptr, ptr %s1, align 8
  %calltmp58 = call i32 @str_equals(ptr %s57, ptr @.str.10)
  %eqtmp59 = icmp eq i32 %calltmp58, 1
  %ifcond60 = icmp ne i1 %eqtmp59, false
  br i1 %ifcond60, label %then61, label %ifcont62

then61:                                           ; preds = %ifcont56
  ret i1 true

ifcont62:                                         ; preds = %ifcont56
  %s63 = load ptr, ptr %s1, align 8
  %calltmp64 = call i32 @str_equals(ptr %s63, ptr @.str.11)
  %eqtmp65 = icmp eq i32 %calltmp64, 1
  %ifcond66 = icmp ne i1 %eqtmp65, false
  br i1 %ifcond66, label %then67, label %ifcont68

then67:                                           ; preds = %ifcont62
  ret i1 true

ifcont68:                                         ; preds = %ifcont62
  %s69 = load ptr, ptr %s1, align 8
  %calltmp70 = call i32 @str_equals(ptr %s69, ptr @.str.12)
  %eqtmp71 = icmp eq i32 %calltmp70, 1
  %ifcond72 = icmp ne i1 %eqtmp71, false
  br i1 %ifcond72, label %then73, label %ifcont74

then73:                                           ; preds = %ifcont68
  ret i1 true

ifcont74:                                         ; preds = %ifcont68
  %s75 = load ptr, ptr %s1, align 8
  %calltmp76 = call i32 @str_equals(ptr %s75, ptr @.str.13)
  %eqtmp77 = icmp eq i32 %calltmp76, 1
  %ifcond78 = icmp ne i1 %eqtmp77, false
  br i1 %ifcond78, label %then79, label %ifcont80

then79:                                           ; preds = %ifcont74
  ret i1 true

ifcont80:                                         ; preds = %ifcont74
  %s81 = load ptr, ptr %s1, align 8
  %calltmp82 = call i32 @str_equals(ptr %s81, ptr @.str.14)
  %eqtmp83 = icmp eq i32 %calltmp82, 1
  %ifcond84 = icmp ne i1 %eqtmp83, false
  br i1 %ifcond84, label %then85, label %ifcont86

then85:                                           ; preds = %ifcont80
  ret i1 true

ifcont86:                                         ; preds = %ifcont80
  %s87 = load ptr, ptr %s1, align 8
  %calltmp88 = call i32 @str_equals(ptr %s87, ptr @.str.15)
  %eqtmp89 = icmp eq i32 %calltmp88, 1
  %ifcond90 = icmp ne i1 %eqtmp89, false
  br i1 %ifcond90, label %then91, label %ifcont92

then91:                                           ; preds = %ifcont86
  ret i1 true

ifcont92:                                         ; preds = %ifcont86
  %s93 = load ptr, ptr %s1, align 8
  %calltmp94 = call i32 @str_equals(ptr %s93, ptr @.str.16)
  %eqtmp95 = icmp eq i32 %calltmp94, 1
  %ifcond96 = icmp ne i1 %eqtmp95, false
  br i1 %ifcond96, label %then97, label %ifcont98

then97:                                           ; preds = %ifcont92
  ret i1 true

ifcont98:                                         ; preds = %ifcont92
  %s99 = load ptr, ptr %s1, align 8
  %calltmp100 = call i32 @str_equals(ptr %s99, ptr @.str.17)
  %eqtmp101 = icmp eq i32 %calltmp100, 1
  %ifcond102 = icmp ne i1 %eqtmp101, false
  br i1 %ifcond102, label %then103, label %ifcont104

then103:                                          ; preds = %ifcont98
  ret i1 true

ifcont104:                                        ; preds = %ifcont98
  %s105 = load ptr, ptr %s1, align 8
  %calltmp106 = call i32 @str_equals(ptr %s105, ptr @.str.18)
  %eqtmp107 = icmp eq i32 %calltmp106, 1
  %ifcond108 = icmp ne i1 %eqtmp107, false
  br i1 %ifcond108, label %then109, label %ifcont110

then109:                                          ; preds = %ifcont104
  ret i1 true

ifcont110:                                        ; preds = %ifcont104
  %s111 = load ptr, ptr %s1, align 8
  %calltmp112 = call i32 @str_equals(ptr %s111, ptr @.str.19)
  %eqtmp113 = icmp eq i32 %calltmp112, 1
  %ifcond114 = icmp ne i1 %eqtmp113, false
  br i1 %ifcond114, label %then115, label %ifcont116

then115:                                          ; preds = %ifcont110
  ret i1 true

ifcont116:                                        ; preds = %ifcont110
  %s117 = load ptr, ptr %s1, align 8
  %calltmp118 = call i32 @str_equals(ptr %s117, ptr @.str.20)
  %eqtmp119 = icmp eq i32 %calltmp118, 1
  %ifcond120 = icmp ne i1 %eqtmp119, false
  br i1 %ifcond120, label %then121, label %ifcont122

then121:                                          ; preds = %ifcont116
  ret i1 true

ifcont122:                                        ; preds = %ifcont116
  %s123 = load ptr, ptr %s1, align 8
  %calltmp124 = call i32 @str_equals(ptr %s123, ptr @.str.21)
  %eqtmp125 = icmp eq i32 %calltmp124, 1
  %ifcond126 = icmp ne i1 %eqtmp125, false
  br i1 %ifcond126, label %then127, label %ifcont128

then127:                                          ; preds = %ifcont122
  ret i1 true

ifcont128:                                        ; preds = %ifcont122
  %s129 = load ptr, ptr %s1, align 8
  %calltmp130 = call i32 @str_equals(ptr %s129, ptr @.str.22)
  %eqtmp131 = icmp eq i32 %calltmp130, 1
  %ifcond132 = icmp ne i1 %eqtmp131, false
  br i1 %ifcond132, label %then133, label %ifcont134

then133:                                          ; preds = %ifcont128
  ret i1 true

ifcont134:                                        ; preds = %ifcont128
  %s135 = load ptr, ptr %s1, align 8
  %calltmp136 = call i32 @str_equals(ptr %s135, ptr @.str.23)
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
  %calltmp = call i32 @str_equals(ptr %s2, ptr @.str.24)
  %eqtmp = icmp eq i32 %calltmp, 1
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i1 true

ifcont:                                           ; preds = %entry
  %s3 = load ptr, ptr %s1, align 8
  %calltmp4 = call i32 @str_equals(ptr %s3, ptr @.str.25)
  %eqtmp5 = icmp eq i32 %calltmp4, 1
  %ifcond6 = icmp ne i1 %eqtmp5, false
  br i1 %ifcond6, label %then7, label %ifcont8

then7:                                            ; preds = %ifcont
  ret i1 true

ifcont8:                                          ; preds = %ifcont
  ret i1 false
}
