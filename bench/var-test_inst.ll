; ModuleID = 'var-test_inst.bc'
source_filename = "var-test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @add(double %x, double %y) #0 {
entry:
  %0 = bitcast i8* null to i8*
  %1 = bitcast double (double, double)* @add to i8*
  %2 = call i64 @getAddr(i8* %1)
  call void @funcInit(i64 %2)
  %x.addr = alloca double, align 8
  %3 = bitcast double* %x.addr to i8*
  %4 = call i64 @getAddr(i8* %3)
  call void @handleAlloca(i64 %4)
  %y.addr = alloca double, align 8
  %5 = bitcast double* %y.addr to i8*
  %6 = call i64 @getAddr(i8* %5)
  call void @handleAlloca(i64 %6)
  %7 = bitcast double* %x.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  %9 = bitcast double (double, double)* @add to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void @setRealFunArg(i32 0, i64 %10, i64 %8, double %x)
  store double %x, double* %x.addr, align 8
  %11 = bitcast double* %y.addr to i8*
  %12 = call i64 @getAddr(i8* %11)
  %13 = bitcast double (double, double)* @add to i8*
  %14 = call i64 @getAddr(i8* %13)
  call void @setRealFunArg(i32 1, i64 %14, i64 %12, double %y)
  store double %y, double* %y.addr, align 8
  %15 = bitcast double* %x.addr to i8*
  %16 = call i64 @getAddr(i8* %15)
  %17 = load double, double* %x.addr, align 8
  %18 = bitcast double* %y.addr to i8*
  %19 = call i64 @getAddr(i8* %18)
  %20 = load double, double* %y.addr, align 8
  %add = fadd double %17, %20
  %21 = call i64 @computeReal(i32 12, i64 %16, i64 %19, double %17, double %20, double %add, i32 9)
  %22 = bitcast double (double, double)* @add to i8*
  %23 = call i64 @getAddr(i8* %22)
  call void @funcExit(i64 %23)
  call void @trackReturn(i64 %21)
  call void @cleanComputeReal(i32 9)
  ret double %add
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %0 = bitcast i8* null to i8*
  %1 = bitcast i32 ()* @main to i8*
  %2 = call i64 @getAddr(i8* %1)
  call void @funcInit(i64 %2)
  %x = alloca double, align 8
  %3 = bitcast double* %x to i8*
  %4 = call i64 @getAddr(i8* %3)
  call void @handleAlloca(i64 %4)
  %y = alloca double, align 8
  %5 = bitcast double* %y to i8*
  %6 = call i64 @getAddr(i8* %5)
  call void @handleAlloca(i64 %6)
  %z1 = alloca double, align 8
  %7 = bitcast double* %z1 to i8*
  %8 = call i64 @getAddr(i8* %7)
  call void @handleAlloca(i64 %8)
  %z2 = alloca double, align 8
  %9 = bitcast double* %z2 to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void @handleAlloca(i64 %10)
  %z3 = alloca double, align 8
  %11 = bitcast double* %z3 to i8*
  %12 = call i64 @getAddr(i8* %11)
  call void @handleAlloca(i64 %12)
  %13 = bitcast double* %z1 to i8*
  %14 = call i64 @getAddr(i8* %13)
  call void @setRealConstant(i64 %14, double 5.000000e+00)
  store volatile double 5.000000e+00, double* %z1, align 8
  %15 = bitcast double* %z2 to i8*
  %16 = call i64 @getAddr(i8* %15)
  call void @setRealConstant(i64 %16, double 6.000000e+00)
  store volatile double 6.000000e+00, double* %z2, align 8
  %17 = bitcast double* %z1 to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = load volatile double, double* %z1, align 8
  %20 = bitcast double* %z2 to i8*
  %21 = call i64 @getAddr(i8* %20)
  %22 = load volatile double, double* %z2, align 8
  %add = fadd double %19, %22
  %23 = call i64 @computeReal(i32 12, i64 %18, i64 %21, double %19, double %22, double %add, i32 26)
  %24 = bitcast double* %z3 to i8*
  %25 = call i64 @getAddr(i8* %24)
  call void @setRealTemp(i64 %25, i64 %23)
  store volatile double %add, double* %z3, align 8
  %call = call double @add(double 4.000000e+00, double 5.000000e+00)
  %26 = bitcast double* %x to i8*
  %27 = call i64 @getAddr(i8* %26)
  call void @setRealReturn(i64 %27)
  store volatile double %call, double* %x, align 8
  %28 = bitcast double* %z3 to i8*
  %29 = call i64 @getAddr(i8* %28)
  %30 = load volatile double, double* %z3, align 8
  %31 = bitcast double (double, double)* @add to i8*
  %32 = call i64 @getAddr(i8* %31)
  call void @addFunArg(i32 1, i64 %32, i64 %29)
  %call1 = call double @add(double 6.000000e+00, double %30)
  %33 = bitcast double* %y to i8*
  %34 = call i64 @getAddr(i8* %33)
  call void @setRealReturn(i64 %34)
  store volatile double %call1, double* %y, align 8
  %35 = bitcast i32 ()* @main to i8*
  %36 = call i64 @getAddr(i8* %35)
  call void @funcExit(i64 %36)
  call void @cleanComputeReal(i32 26)
  call void @finish()
  ret i32 0
}

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @funcExit(i64)

declare void @handleAlloca(i64)

declare void @setRealFunArg(i32, i64, i64, double)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @trackReturn(i64)

declare void @cleanComputeReal(i32)

declare void @setRealConstant(i64, double)

declare void @setRealTemp(i64, i64)

declare void @setRealReturn(i64)

declare void @addFunArg(i32, i64, i64)

declare void @finish()

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
