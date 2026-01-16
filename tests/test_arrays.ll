; ModuleID = 'main_module'
source_filename = "main_module"

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

define void @test_array_literal() {
entry:
  %third = alloca i32, align 4
  %first = alloca i32, align 4
  %array_literal = alloca [5 x i32], align 4
  %numbers = alloca ptr, align 8
  %elem_ptr = getelementptr [5 x i32], ptr %array_literal, i32 0, i32 0
  store i32 1, ptr %elem_ptr, align 4
  %elem_ptr1 = getelementptr [5 x i32], ptr %array_literal, i32 0, i32 1
  store i32 2, ptr %elem_ptr1, align 4
  %elem_ptr2 = getelementptr [5 x i32], ptr %array_literal, i32 0, i32 2
  store i32 3, ptr %elem_ptr2, align 4
  %elem_ptr3 = getelementptr [5 x i32], ptr %array_literal, i32 0, i32 3
  store i32 4, ptr %elem_ptr3, align 4
  %elem_ptr4 = getelementptr [5 x i32], ptr %array_literal, i32 0, i32 4
  store i32 5, ptr %elem_ptr4, align 4
  store ptr %array_literal, ptr %numbers, align 8
  %numbers5 = load ptr, ptr %numbers, align 8
  %index_ptr = getelementptr i32, ptr %numbers5, i32 0
  %index_load = load i32, ptr %index_ptr, align 4
  store i32 %index_load, ptr %first, align 4
  %numbers6 = load ptr, ptr %numbers, align 8
  %index_ptr7 = getelementptr i32, ptr %numbers6, i32 2
  %index_load8 = load i32, ptr %index_ptr7, align 4
  store i32 %index_load8, ptr %third, align 4
  %first9 = load i32, ptr %first, align 4
  call void @println_int(i32 %first9)
  %third10 = load i32, ptr %third, align 4
  call void @println_int(i32 %third10)
  ret void
}

define void @test_array_iteration() {
entry:
  %i = alloca i32, align 4
  %array_literal = alloca [4 x i32], align 4
  %values = alloca ptr, align 8
  %elem_ptr = getelementptr [4 x i32], ptr %array_literal, i32 0, i32 0
  store i32 10, ptr %elem_ptr, align 4
  %elem_ptr1 = getelementptr [4 x i32], ptr %array_literal, i32 0, i32 1
  store i32 20, ptr %elem_ptr1, align 4
  %elem_ptr2 = getelementptr [4 x i32], ptr %array_literal, i32 0, i32 2
  store i32 30, ptr %elem_ptr2, align 4
  %elem_ptr3 = getelementptr [4 x i32], ptr %array_literal, i32 0, i32 3
  store i32 40, ptr %elem_ptr3, align 4
  store ptr %array_literal, ptr %values, align 8
  store i32 0, ptr %i, align 4
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %entry
  %i4 = load i32, ptr %i, align 4
  %lttmp = icmp slt i32 %i4, 4
  br i1 %lttmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %values5 = load ptr, ptr %values, align 8
  %i6 = load i32, ptr %i, align 4
  %index_ptr = getelementptr i32, ptr %values5, i32 %i6
  %index_load = load i32, ptr %index_ptr, align 4
  call void @println_int(i32 %index_load)
  %i7 = load i32, ptr %i, align 4
  %addtmp = add i32 %i7, 1
  store i32 %addtmp, ptr %i, align 4
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  ret void
}

define void @test_2d_array() {
entry:
  %array_literal9 = alloca [1 x i32], align 4
  %value = alloca i32, align 4
  %array_literal4 = alloca [2 x i32], align 4
  %array_literal1 = alloca [2 x i32], align 4
  %array_literal = alloca [2 x ptr], align 8
  %matrix = alloca ptr, align 8
  %elem_ptr = getelementptr [2 x i32], ptr %array_literal1, i32 0, i32 0
  store i32 1, ptr %elem_ptr, align 4
  %elem_ptr2 = getelementptr [2 x i32], ptr %array_literal1, i32 0, i32 1
  store i32 2, ptr %elem_ptr2, align 4
  %elem_ptr3 = getelementptr [2 x ptr], ptr %array_literal, i32 0, i32 0
  store ptr %array_literal1, ptr %elem_ptr3, align 8
  %elem_ptr5 = getelementptr [2 x i32], ptr %array_literal4, i32 0, i32 0
  store i32 3, ptr %elem_ptr5, align 4
  %elem_ptr6 = getelementptr [2 x i32], ptr %array_literal4, i32 0, i32 1
  store i32 4, ptr %elem_ptr6, align 4
  %elem_ptr7 = getelementptr [2 x ptr], ptr %array_literal, i32 0, i32 1
  store ptr %array_literal4, ptr %elem_ptr7, align 8
  store ptr %array_literal, ptr %matrix, align 8
  %matrix8 = load ptr, ptr %matrix, align 8
  %index_ptr = getelementptr i32, ptr %matrix8, i32 0
  %index_load = load i32, ptr %index_ptr, align 4
  store i32 %index_load, ptr %value, align 4
  %elem_ptr10 = getelementptr [1 x i32], ptr %array_literal9, i32 0, i32 0
  store i32 1, ptr %elem_ptr10, align 4
  %value11 = load i32, ptr %value, align 4
  call void @println_int(i32 %value11)
  ret void
}

define void @main() {
entry:
  call void @test_array_literal()
  call void @test_array_iteration()
  call void @test_2d_array()
  ret void
}
