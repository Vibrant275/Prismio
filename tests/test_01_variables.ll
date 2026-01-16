; ModuleID = 'main_module'
source_filename = "main_module"

@x = constant i32 5
@y = constant i32 10
@z = global i32 0
@0 = private unnamed_addr constant [33 x i8] c"Test 1: Variables and Arithmetic\00", align 1
@1 = private unnamed_addr constant [13 x i8] c"Expected: 72\00", align 1
@2 = private unnamed_addr constant [5 x i8] c"Got:\00", align 1

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

define i32 @test_arithmetic() {
entry:
  %e = alloca i32, align 4
  %d = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %x = load i32, ptr @x, align 4
  %y = load i32, ptr @y, align 4
  %addtmp = add i32 %x, %y
  store i32 %addtmp, ptr %a, align 4
  %x1 = load i32, ptr @x, align 4
  %y2 = load i32, ptr @y, align 4
  %multmp = mul i32 %x1, %y2
  store i32 %multmp, ptr %b, align 4
  %y3 = load i32, ptr @y, align 4
  %x4 = load i32, ptr @x, align 4
  %subtmp = sub i32 %y3, %x4
  store i32 %subtmp, ptr %c, align 4
  %y5 = load i32, ptr @y, align 4
  %x6 = load i32, ptr @x, align 4
  %divtmp = sdiv i32 %y5, %x6
  store i32 %divtmp, ptr %d, align 4
  %y7 = load i32, ptr @y, align 4
  %x8 = load i32, ptr @x, align 4
  %modtmp = srem i32 %y7, %x8
  store i32 %modtmp, ptr %e, align 4
  %a9 = load i32, ptr %a, align 4
  %b10 = load i32, ptr %b, align 4
  %addtmp11 = add i32 %a9, %b10
  %c12 = load i32, ptr %c, align 4
  %addtmp13 = add i32 %addtmp11, %c12
  %d14 = load i32, ptr %d, align 4
  %addtmp15 = add i32 %addtmp13, %d14
  %e16 = load i32, ptr %e, align 4
  %addtmp17 = add i32 %addtmp15, %e16
  ret i32 %addtmp17
}

define void @main() {
entry:
  %result = alloca i32, align 4
  %calltmp = call i32 @test_arithmetic()
  store i32 %calltmp, ptr %result, align 4
  call void @println(ptr @0)
  call void @println(ptr @1)
  call void @print(ptr @2)
  %result1 = load i32, ptr %result, align 4
  call void @println_int(i32 %result1)
  ret void
}
