; ModuleID = 'var-test_inst.bc'
source_filename = "var-test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @add(double %x, double %y) #0 {
entry:
  %0 = bitcast double (double, double)* @add to i8*
  call void @funcInit(i8* %0)
  %x.addr = alloca double, align 8
  %1 = bitcast double* %x.addr to i8*
  call void @handleAlloca(i8* %1)
  %y.addr = alloca double, align 8
  %2 = bitcast double* %y.addr to i8*
  call void @handleAlloca(i8* %2)
  %3 = bitcast double* %x.addr to i8*
  %4 = bitcast double (double, double)* @add to i8*
  call void @setRealFunArg(i32 0, i8* %4, i8* %3, double %x)
  store double %x, double* %x.addr, align 8
  %5 = bitcast double* %y.addr to i8*
  %6 = bitcast double (double, double)* @add to i8*
  call void @setRealFunArg(i32 1, i8* %6, i8* %5, double %y)
  store double %y, double* %y.addr, align 8
  %7 = load double, double* %x.addr, align 8
  %8 = load double, double* %y.addr, align 8
  %9 = bitcast double* %x.addr to i8*
  %10 = bitcast double* %y.addr to i8*
  %add = fadd double %7, %8
  %11 = call i8* @computeReal(i32 12, i8* %9, i8* %10, double %7, double %8, double %add, i32 8)
  %12 = bitcast double (double, double)* @add to i8*
  call void @funcExit(i8* %12)
  %13 = bitcast i8* %11 to i8*
  call void @trackReturn(i8* %13)
  ret double %add
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %0 = bitcast i32 ()* @main to i8*
  call void @funcInit(i8* %0)
  %x = alloca double, align 8
  %1 = bitcast double* %x to i8*
  call void @handleAlloca(i8* %1)
  %y = alloca double, align 8
  %2 = bitcast double* %y to i8*
  call void @handleAlloca(i8* %2)
  %z1 = alloca double, align 8
  %3 = bitcast double* %z1 to i8*
  call void @handleAlloca(i8* %3)
  %z2 = alloca double, align 8
  %4 = bitcast double* %z2 to i8*
  call void @handleAlloca(i8* %4)
  %z3 = alloca double, align 8
  %5 = bitcast double* %z3 to i8*
  call void @handleAlloca(i8* %5)
  %6 = bitcast double* %z1 to i8*
  call void @setRealConstant(i8* %6, double 5.000000e+00)
  store volatile double 5.000000e+00, double* %z1, align 8
  %7 = bitcast double* %z2 to i8*
  call void @setRealConstant(i8* %7, double 6.000000e+00)
  store volatile double 6.000000e+00, double* %z2, align 8
  %8 = load volatile double, double* %z1, align 8
  %9 = load volatile double, double* %z2, align 8
  %10 = bitcast double* %z1 to i8*
  %11 = bitcast double* %z2 to i8*
  %add = fadd double %8, %9
  %12 = call i8* @computeReal(i32 12, i8* %10, i8* %11, double %8, double %9, double %add, i32 23)
  %13 = bitcast double* %z3 to i8*
  %14 = bitcast i8* %12 to i8*
  call void @setRealTemp(i8* %13, i8* %14)
  store volatile double %add, double* %z3, align 8
  %15 = bitcast i32 ()* @main to i8*
  call void @funcExit(i8* %15)
  call void @cleanComputeReal(i32 23)
  call void @finish()
  ret i32 0
}

declare void @funcInit(i8*)

declare void @funcExit(i8*)

declare void @handleAlloca(i8*)

declare void @setRealFunArg(i32, i8*, i8*, double)

declare i8* @computeReal(i32, i8*, i8*, double, double, double, i32)

declare void @trackReturn(i8*)

declare void @setRealConstant(i8*, double)

declare void @setRealTemp(i8*, i8*)

declare void @cleanComputeReal(i32)

declare void @finish()

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
