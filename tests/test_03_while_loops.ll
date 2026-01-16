; ModuleID = 'main_module'
source_filename = "main_module"

@0 = private unnamed_addr constant [20 x i8] c"Test 3: While Loops\00", align 1
@1 = private unnamed_addr constant [13 x i8] c"sum_to_n(57)\00", align 1
@2 = private unnamed_addr constant [13 x i8] c"factorial(7)\00", align 1

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

define i32 @sum_to_n(i32 %n) {
entry:
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %n1 = alloca i32, align 4
  store i32 %n, ptr %n1, align 4
  store i32 0, ptr %sum, align 4
  store i32 1, ptr %i, align 4
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %entry
  %i2 = load i32, ptr %i, align 4
  %n3 = load i32, ptr %n1, align 4
  %letmp = icmp sle i32 %i2, %n3
  br i1 %letmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %sum4 = load i32, ptr %sum, align 4
  %i5 = load i32, ptr %i, align 4
  %addtmp = add i32 %sum4, %i5
  store i32 %addtmp, ptr %sum, align 4
  %i6 = load i32, ptr %i, align 4
  %addtmp7 = add i32 %i6, 1
  store i32 %addtmp7, ptr %i, align 4
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %sum8 = load i32, ptr %sum, align 4
  ret i32 %sum8
}

define i32 @factorial(i32 %n) {
entry:
  %i = alloca i32, align 4
  %result = alloca i32, align 4
  %n1 = alloca i32, align 4
  store i32 %n, ptr %n1, align 4
  store i32 1, ptr %result, align 4
  store i32 1, ptr %i, align 4
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %entry
  %i2 = load i32, ptr %i, align 4
  %n3 = load i32, ptr %n1, align 4
  %letmp = icmp sle i32 %i2, %n3
  br i1 %letmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %result4 = load i32, ptr %result, align 4
  %i5 = load i32, ptr %i, align 4
  %multmp = mul i32 %result4, %i5
  store i32 %multmp, ptr %result, align 4
  %i6 = load i32, ptr %i, align 4
  %addtmp = add i32 %i6, 1
  store i32 %addtmp, ptr %i, align 4
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %result7 = load i32, ptr %result, align 4
  ret i32 %result7
}

define void @main() {
entry:
  %fact = alloca i32, align 4
  %sum = alloca i32, align 4
  %calltmp = call i32 @sum_to_n(i32 57)
  store i32 %calltmp, ptr %sum, align 4
  %calltmp1 = call i32 @factorial(i32 7)
  store i32 %calltmp1, ptr %fact, align 4
  call void @println(ptr @0)
  call void @println(ptr @1)
  %sum2 = load i32, ptr %sum, align 4
  call void @println_int(i32 %sum2)
  call void @println(ptr @2)
  %fact3 = load i32, ptr %fact, align 4
  call void @println_int(i32 %fact3)
  ret void
}
