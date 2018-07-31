; ModuleID = 'gsl-modpi_inst.bc'
source_filename = "gsl-modpi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%e\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %theta = alloca double, align 8
  %P1 = alloca double, align 8
  %P2 = alloca double, align 8
  %P3 = alloca double, align 8
  %TwoPi = alloca double, align 8
  %y = alloca double, align 8
  %r = alloca double, align 8
  %0 = bitcast double* %theta to i8*
  call void @setRealConstant(i8* %0, double 7.000000e+20)
  store double 7.000000e+20, double* %theta, align 8
  %1 = bitcast double* %P1 to i8*
  call void @setRealConstant(i8* %1, double 0x400921FB40000000)
  store double 0x400921FB40000000, double* %P1, align 8
  %2 = bitcast double* %P2 to i8*
  call void @setRealConstant(i8* %2, double 0x3E84442D00000000)
  store double 0x3E84442D00000000, double* %P2, align 8
  %3 = bitcast double* %P3 to i8*
  call void @setRealConstant(i8* %3, double 0x3D08469898CC5170)
  store double 0x3D08469898CC5170, double* %P3, align 8
  %4 = bitcast double* %TwoPi to i8*
  call void @setRealConstant(i8* %4, double 0x401921FB54442D18)
  store double 0x401921FB54442D18, double* %TwoPi, align 8
  %5 = load double, double* %theta, align 8
  %6 = bitcast double* %theta to i8*
  %div = fdiv double %5, 0x401921FB54442D18
  %7 = call i8* @computeRealVC(i32 19, i8* %6, double 0x401921FB54442D18, double %div, i32 0)
  %8 = bitcast i8* %7 to i8*
  %9 = call i8* @handleMathFunc(i32 1, i8* %8)
  %10 = call double @llvm.floor.f64(double %div)
  %11 = bitcast i8* %9 to i8*
  %mul = fmul double 2.000000e+00, %10
  %12 = call i8* @computeRealCV(i32 16, double 2.000000e+00, i8* %11, double %mul, i32 1)
  %13 = bitcast double* %y to i8*
  %14 = bitcast i8* %12 to i8*
  call void @setRealTemp(i8* %13, i8* %14)
  store double %mul, double* %y, align 8
  %15 = load double, double* %theta, align 8
  %16 = load double, double* %y, align 8
  %17 = bitcast double* %y to i8*
  %mul1 = fmul double %16, 0x400921FB40000000
  %18 = call i8* @computeRealVC(i32 16, i8* %17, double 0x400921FB40000000, double %mul1, i32 2)
  %19 = bitcast double* %theta to i8*
  %20 = bitcast i8* %18 to i8*
  %sub = fsub double %15, %mul1
  %21 = call i8* @computeRealVV(i32 14, i8* %19, i8* %20, double %sub, i32 3)
  %22 = load double, double* %y, align 8
  %23 = bitcast double* %y to i8*
  %mul2 = fmul double %22, 0x3E84442D00000000
  %24 = call i8* @computeRealVC(i32 16, i8* %23, double 0x3E84442D00000000, double %mul2, i32 4)
  %25 = bitcast i8* %21 to i8*
  %26 = bitcast i8* %24 to i8*
  %sub3 = fsub double %sub, %mul2
  %27 = call i8* @computeRealVV(i32 14, i8* %25, i8* %26, double %sub3, i32 5)
  %28 = load double, double* %y, align 8
  %29 = bitcast double* %y to i8*
  %mul4 = fmul double %28, 0x3D08469898CC5170
  %30 = call i8* @computeRealVC(i32 16, i8* %29, double 0x3D08469898CC5170, double %mul4, i32 6)
  %31 = bitcast i8* %27 to i8*
  %32 = bitcast i8* %30 to i8*
  %sub5 = fsub double %sub3, %mul4
  %33 = call i8* @computeRealVV(i32 14, i8* %31, i8* %32, double %sub5, i32 7)
  %34 = bitcast double* %r to i8*
  %35 = bitcast i8* %33 to i8*
  call void @setRealTemp(i8* %34, i8* %35)
  store double %sub5, double* %r, align 8
  %36 = load double, double* %r, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %36)
  call void @finish()
  ret i32 0
}

; Function Attrs: nounwind readnone speculatable
declare double @llvm.floor.f64(double) #1

declare dso_local i32 @printf(i8*, ...) #2

declare void @finish()

declare void @setRealConstant(i8*, double)

declare i8* @computeRealVC(i32, i8*, double, double, i32)

declare i8* @handleMathFunc(i32, i8*)

declare i8* @computeRealCV(i32, double, i8*, double, i32)

declare void @setRealTemp(i8*, i8*)

declare i8* @computeRealVV(i32, i8*, i8*, double, i32)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
