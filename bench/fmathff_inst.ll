; ModuleID = 'fmathff_inst.bc'
source_filename = "fmath.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"d:%e:\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %0 = bitcast i32 ()* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %retval = alloca i32, align 4
  %2 = bitcast i32* %retval to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %d = alloca double, align 8
  %4 = bitcast double* %d to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @handleAlloca(i64 %5)
  %max = alloca double, align 8
  %6 = bitcast double* %max to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @handleAlloca(i64 %7)
  %8 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %9 = bitcast double* %d to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void @setRealConstant(i64 %10, double 1.000000e+00)
  store double 1.000000e+00, double* %d, align 8
  %11 = bitcast double* %max to i8*
  %12 = call i64 @getAddr(i8* %11)
  call void @setRealConstant(i64 %12, double 1.797690e+308)
  store double 1.797690e+308, double* %max, align 8
  %13 = bitcast double* %max to i8*
  %14 = call i64 @getAddr(i8* %13)
  %15 = load double, double* %max, align 8
  %16 = bitcast double* %d to i8*
  %17 = call i64 @getAddr(i8* %16)
  %18 = load double, double* %d, align 8
  %div = fdiv fast double %18, %15
  %19 = call i64 @computeReal(i32 19, i64 %17, i64 %14, double %18, double %15, double %div, i32 11)
  %20 = bitcast double* %d to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void @setRealTemp(i64 %21, i64 %19)
  store double %div, double* %d, align 8
  %22 = bitcast double* %max to i8*
  %23 = call i64 @getAddr(i8* %22)
  %24 = load double, double* %max, align 8
  %25 = bitcast double* %d to i8*
  %26 = call i64 @getAddr(i8* %25)
  %27 = load double, double* %d, align 8
  %mul = fmul fast double %27, %24
  %28 = call i64 @computeReal(i32 16, i64 %26, i64 %23, double %27, double %24, double %mul, i32 15)
  %29 = bitcast double* %d to i8*
  %30 = call i64 @getAddr(i8* %29)
  call void @setRealTemp(i64 %30, i64 %28)
  store double %mul, double* %d, align 8
  %31 = bitcast double* %d to i8*
  %32 = call i64 @getAddr(i8* %31)
  %33 = load double, double* %d, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), double %33)
  call void @cleanComputeReal(i32 11)
  call void @cleanComputeReal(i32 15)
  call void @finish()
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @handleAlloca(i64)

declare void @setRealConstant(i64, double)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @setRealTemp(i64, i64)

declare void @cleanComputeReal(i32)

declare void @finish()

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="true" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
