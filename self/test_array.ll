; ModuleID = 'main_module'
source_filename = "main_module"

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

declare ptr @alloc_array(i32)

define void @test() {
entry:
  %x = alloca i32, align 4
  %arr = alloca ptr, align 8
  %calltmp = call ptr @alloc_array(i32 100)
  store ptr %calltmp, ptr %arr, align 8
  %arr1 = load ptr, ptr %arr, align 8
  %index_ptr = getelementptr i32, ptr %arr1, i32 0
  store i32 5, ptr %index_ptr, align 4
  %arr2 = load ptr, ptr %arr, align 8
  %index_ptr3 = getelementptr i32, ptr %arr2, i32 0
  %index_load = load i32, ptr %index_ptr3, align 4
  store i32 %index_load, ptr %x, align 4
  ret void
}
