; ModuleID = 'main_module'
source_filename = "main_module"

%Node = type { i32, ptr }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer

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

define i32 @get_next_val(ptr %node) {
entry:
  %node1 = alloca ptr, align 8
  store ptr %node, ptr %node1, align 8
  %structptr = load ptr, ptr %node1, align 8
  %val_ptr = getelementptr inbounds %Node, ptr %structptr, i32 0, i32 0
  %val = load i32, ptr %val_ptr, align 4
  ret i32 %val
}

define void @test() {
entry:
  %v = alloca i32, align 4
  %next_node = alloca ptr, align 8
  %n1 = alloca ptr, align 8
  %n2 = alloca ptr, align 8
  %structmem = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Node, ptr null, i32 1) to i64))
  %val_ptr = getelementptr inbounds %Node, ptr %structmem, i32 0, i32 0
  store i32 42, ptr %val_ptr, align 4
  %next_ptr = getelementptr inbounds %Node, ptr %structmem, i32 0, i32 1
  store ptr @.str, ptr %next_ptr, align 8
  store ptr %structmem, ptr %n2, align 8
  %structmem1 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Node, ptr null, i32 1) to i64))
  %val_ptr2 = getelementptr inbounds %Node, ptr %structmem1, i32 0, i32 0
  store i32 10, ptr %val_ptr2, align 4
  %n23 = load ptr, ptr %n2, align 8
  %next_ptr4 = getelementptr inbounds %Node, ptr %structmem1, i32 0, i32 1
  store ptr %n23, ptr %next_ptr4, align 8
  store ptr %structmem1, ptr %n1, align 8
  %structptr = load ptr, ptr %n1, align 8
  %next_ptr5 = getelementptr inbounds %Node, ptr %structptr, i32 0, i32 1
  %next = load ptr, ptr %next_ptr5, align 8
  store ptr %next, ptr %next_node, align 8
  %next_node6 = load ptr, ptr %next_node, align 8
  %calltmp = call i32 @get_next_val(ptr %next_node6)
  store i32 %calltmp, ptr %v, align 4
  ret void
}
