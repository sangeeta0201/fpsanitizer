; ModuleID = 'sum-50.bc_inst.bc'
source_filename = "sum-50.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca double, align 8
  %0 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %1 = bitcast double* %x to i8*
  call void @setRealConstant(i8* %1, double 0.000000e+00)
  store volatile double 0.000000e+00, double* %x, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %2 = load volatile double, double* %x, align 8
  %3 = bitcast double* %x to i8*
  %4 = bitcast i8* null to i8*
  %cmp = fcmp olt double %2, 2.000000e+00
  %5 = call i8* @checkBranch(double %2, i8* %3, double 2.000000e+00, i8* %4, i32 4, i1 %cmp)
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %6 = load volatile double, double* %x, align 8
  %7 = bitcast double* %x to i8*
  %8 = bitcast i8* null to i8*
  %add = fadd double %6, 2.000000e-01
  %9 = call i8* @computeReal(i32 12, i8* %7, i8* %8, double %6, double 2.000000e-01, double %add, i32 9)
  %10 = bitcast double* %x to i8*
  %11 = bitcast i8* %9 to i8*
  call void @setRealTemp(i8* %10, i8* %11)
  store volatile double %add, double* %x, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %12 = load i32, i32* %retval, align 4
  call void @finish()
  %13 = bitcast i32* %retval to i8*
  call void @trackReturn(i8* %13)
  ret i32 %12
}

declare void @finish()

declare void @setRealTemp(i8*, i8*)

declare void @setRealConstant(i8*, double)

declare i8* @checkBranch(double, i8*, double, i8*, i32, i1)

declare i8* @computeReal(i32, i8*, i8*, double, double, double, i32)

declare void @trackReturn(i8*)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
