; ModuleID = 'sum-500_inst.bc'
source_filename = "sum-500.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%.20g\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %0 = bitcast i32 ()* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %retval = alloca i32, align 4
  %x = alloca double, align 8
  %2 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %3 = bitcast double* %x to i8*
  %4 = call i64 @getAddr(i8* %3)
  call void @setRealConstant(i64 %4, double 0.000000e+00)
  store volatile double 0.000000e+00, double* %x, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %5 = bitcast double* %x to i8*
  %6 = call i64 @getAddr(i8* %5)
  %7 = load volatile double, double* %x, align 8
  %cmp = fcmp olt double %7, 1.000000e+02
  call void @checkBranch(double %7, i64 %6, double 1.000000e+02, i64 0, i32 4, i1 %cmp, i32 6)
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = bitcast double* %x to i8*
  %9 = call i64 @getAddr(i8* %8)
  %10 = load volatile double, double* %x, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), double %10)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = bitcast double* %x to i8*
  %12 = call i64 @getAddr(i8* %11)
  %13 = load volatile double, double* %x, align 8
  %add = fadd double %13, 2.000000e-01
  %14 = call i64 @computeReal(i32 12, i64 %12, i64 0, double %13, double 2.000000e-01, double %13, double 2.000000e-01, double %add, i64 3, i32 12)
  %15 = bitcast double* %x to i8*
  %16 = call i64 @getAddr(i8* %15)
  call void @setRealTemp(i64 %16, i64 %14)
  store volatile double %add, double* %x, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %17 = bitcast i32* %retval to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = load i32, i32* %retval, align 4
  call void @finish()
  ret i32 %19
}

declare dso_local i32 @printf(i8*, ...) #1

declare i64 @getAddr(i8*)

declare void @setRealConstant(i64, double)

declare void @checkBranch(double, i64, double, i64, i32, i1, i32)

declare i64 @computeReal(i32, i64, i64, double, double, double, double, double, i64, i32)

declare void @setRealTemp(i64, i64)

declare void @finish()

declare void @funcInit(i64)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
