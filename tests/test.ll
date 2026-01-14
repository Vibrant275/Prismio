; ModuleID = 'main_module'
source_filename = "main_module"

@x = constant i32 5
@y = global i32 1
@0 = private unnamed_addr constant [26 x i8] c"Result is greater than 10\00", align 1
@1 = private unnamed_addr constant [21 x i8] c"Result is 10 or less\00", align 1
@2 = private unnamed_addr constant [8 x i8] c"counter\00", align 1

declare i32 @printf(ptr, ...)

declare void @println(ptr)

define i32 @add(i32 %a, i32 %b) {
entry:
  %b2 = alloca i32, align 4
  %a1 = alloca i32, align 4
  store i32 %a, ptr %a1, align 4
  store i32 %b, ptr %b2, align 4
  %a3 = load i32, ptr %a1, align 4
  %b4 = load i32, ptr %b2, align 4
  %addtmp = add i32 %a3, %b4
  ret i32 %addtmp
}

define void @main() {
entry:
  %counter = alloca i32, align 4
  %result = alloca i32, align 4
  %x = load i32, ptr @x, align 4
  %y = load i32, ptr @y, align 4
  %calltmp = call i32 @add(i32 %x, i32 %y)
  store i32 %calltmp, ptr %result, align 4
  %result1 = load i32, ptr %result, align 4
  %gttmp = icmp sgt i32 %result1, 10
  %ifcond = icmp ne i1 %gttmp, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %entry
  call void @println(ptr @0)
  br label %ifcont

else:                                             ; preds = %entry
  call void @println(ptr @1)
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  store i32 0, ptr %counter, align 4
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %ifcont
  %counter2 = load i32, ptr %counter, align 4
  %lttmp = icmp slt i32 %counter2, 5
  br i1 %lttmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %counter3 = load i32, ptr %counter, align 4
  %addtmp = add i32 %counter3, 1
  store i32 %addtmp, ptr %counter, align 4
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  call void @println(ptr @2)
  ret void
}
