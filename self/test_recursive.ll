; ModuleID = 'main_module'
source_filename = "main_module"

%Node = type { i32 }

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

define void @main() {
entry:
  %x = alloca ptr, align 8
  %structmem = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Node, ptr null, i32 1) to i64))
  %next_ptr = getelementptr inbounds %Node, ptr %structmem, i32 0, i32 0
  store i32 0, ptr %next_ptr, align 4
  store ptr %structmem, ptr %x, align 8
  ret void
}
