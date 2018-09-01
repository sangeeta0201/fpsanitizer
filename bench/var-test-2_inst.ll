; ModuleID = 'var-test-2_inst.bc'
source_filename = "var-test-2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%e\0A%e\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @addTwo(double %x, double %y) #0 {
entry:
  %0 = bitcast double (double, double)* @addTwo to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %x.addr = alloca double, align 8
  %2 = bitcast double* %x.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %y.addr = alloca double, align 8
  %4 = bitcast double* %y.addr to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @handleAlloca(i64 %5)
  %6 = bitcast double* %x.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = bitcast double (double, double)* @addTwo to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @setRealFunArg(i32 0, i64 %9, i64 %7, double %x)
  store double %x, double* %x.addr, align 8
  %10 = bitcast double* %y.addr to i8*
  %11 = call i64 @getAddr(i8* %10)
  %12 = bitcast double (double, double)* @addTwo to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @setRealFunArg(i32 1, i64 %13, i64 %11, double %y)
  store double %y, double* %y.addr, align 8
  %14 = bitcast double* %x.addr to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = load double, double* %x.addr, align 8
  %17 = bitcast double* %y.addr to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = load double, double* %y.addr, align 8
  %add = fadd double %16, %19
  %20 = call i64 @computeReal(i32 12, i64 %15, i64 %18, double %16, double %19, double %add, i32 9)
  %21 = bitcast double (double, double)* @addTwo to i8*
  %22 = call i64 @getAddr(i8* %21)
  call void @funcExit(i64 %22)
  %23 = bitcast double (double, double)* @addTwo to i8*
  %24 = call i64 @getAddr(i8* %23)
  call void @trackReturn(i64 %24, i64 %20)
  ret double %add
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %0 = bitcast i32 ()* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %x = alloca double, align 8
  %2 = bitcast double* %x to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %y = alloca double, align 8
  %4 = bitcast double* %y to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @handleAlloca(i64 %5)
  %z = alloca double, align 8
  %6 = bitcast double* %z to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @handleAlloca(i64 %7)
  %8 = bitcast double* %z to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @setRealConstant(i64 %9, double 3.000000e+00)
  store volatile double 3.000000e+00, double* %z, align 8
  %10 = bitcast double* %z to i8*
  %11 = call i64 @getAddr(i8* %10)
  %12 = load volatile double, double* %z, align 8
  %add = fadd double %12, 2.000000e+00
  %13 = call i64 @computeReal(i32 12, i64 %11, i64 0, double %12, double 2.000000e+00, double %add, i32 22)
  %14 = bitcast double (double, double)* @addTwo to i8*
  %15 = call i64 @getAddr(i8* %14)
  call void @addFunArg(i32 0, i64 %15, i64 %13)
  %call = call double @addTwo(double %add, double 4.000000e+00)
  %16 = bitcast double* %x to i8*
  %17 = call i64 @getAddr(i8* %16)
  call void @setRealReturn(i64 %17)
  store volatile double %call, double* %x, align 8
  %18 = bitcast double* %x to i8*
  %19 = call i64 @getAddr(i8* %18)
  %20 = load volatile double, double* %x, align 8
  %21 = bitcast double (double, double)* @addTwo to i8*
  %22 = call i64 @getAddr(i8* %21)
  call void @addFunArg(i32 0, i64 %22, i64 %19)
  %call1 = call double @addTwo(double %20, double 7.000000e+00)
  %23 = bitcast double* %y to i8*
  %24 = call i64 @getAddr(i8* %23)
  call void @setRealReturn(i64 %24)
  store volatile double %call1, double* %y, align 8
  %25 = bitcast double* %x to i8*
  %26 = call i64 @getAddr(i8* %25)
  %27 = load volatile double, double* %x, align 8
  %28 = bitcast double* %y to i8*
  %29 = call i64 @getAddr(i8* %28)
  %30 = load volatile double, double* %y, align 8
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), double %27, double %30)
  %31 = bitcast i32 ()* @main to i8*
  %32 = call i64 @getAddr(i8* %31)
  call void @funcExit(i64 %32)
  call void @cleanComputeReal(i32 22)
  call void @finish()
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @funcExit(i64)

declare void @handleAlloca(i64)

declare void @setRealFunArg(i32, i64, i64, double)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @trackReturn(i64, i64)

declare void @setRealConstant(i64, double)

declare void @addFunArg(i32, i64, i64)

declare void @setRealTemp(i64, i64)

declare void @setRealReturn(i64)

declare void @cleanComputeReal(i32)

declare void @finish()

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
