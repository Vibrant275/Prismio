; ModuleID = 'self_hosted_module'
source_filename = "prismio_generated"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc"


declare ptr @malloc(i64)
declare void @println(ptr)
declare void @print(ptr)
declare void @println_int(i32)
declare void @print_int(i32)
declare void @println_bool(i32)
declare void @print_bool(i32)
declare void @println_char(i8)
declare void @print_char(i8)

@x =  global i32 5
@y =  global i32 10
@z =  global i32 0
@.str.s0 = private unnamed_addr constant [33 x i8] c"Test 1: Variables and Arithmetic\00"
@.str.s1 = private unnamed_addr constant [13 x i8] c"Expected: 72\00"
@.str.s2 = private unnamed_addr constant [5 x i8] c"Got:\00"

define i32 @test_arithmetic() {
  %a = alloca i32
  %b = alloca i32
  %c = alloca i32
  %d = alloca i32
  %e = alloca i32
  %t5 = load i32, ptr @x
  %t6 = load i32, ptr @y
  %t7 = add i32 %t5, %t6
  store i32 %t7, ptr %a
  %t8 = load i32, ptr @x
  %t9 = load i32, ptr @y
  %t10 = mul i32 %t8, %t9
  store i32 %t10, ptr %b
  %t11 = load i32, ptr @y
  %t12 = load i32, ptr @x
  %t13 = sub i32 %t11, %t12
  store i32 %t13, ptr %c
  %t14 = load i32, ptr @y
  %t15 = load i32, ptr @x
  %t16 = sdiv i32 %t14, %t15
  store i32 %t16, ptr %d
  %t17 = load i32, ptr @y
  %t18 = load i32, ptr @x
  %t19 = srem i32 %t17, %t18
  store i32 %t19, ptr %e
  %t20 = load i32, ptr %a
  %t21 = load i32, ptr %b
  %t22 = add i32 %t20, %t21
  %t23 = load i32, ptr %c
  %t24 = add i32 %t22, %t23
  %t25 = load i32, ptr %d
  %t26 = add i32 %t24, %t25
  %t27 = load i32, ptr %e
  %t28 = add i32 %t26, %t27
  ret i32 %t28
}

define i32 @main() {
  %result = alloca i32
  %t30 = call i32 @test_arithmetic()
  store i32 %t30, ptr %result
  %t31 = getelementptr inbounds [33 x i8], ptr @.str.s0, i64 0, i64 0
  call void @println(ptr %t31)
  %t32 = getelementptr inbounds [13 x i8], ptr @.str.s1, i64 0, i64 0
  call void @println(ptr %t32)
  %t33 = getelementptr inbounds [5 x i8], ptr @.str.s2, i64 0, i64 0
  call void @print(ptr %t33)
  %t34 = load i32, ptr %result
  call void @println_int(i32 %t34)
  ret i32 0
}

