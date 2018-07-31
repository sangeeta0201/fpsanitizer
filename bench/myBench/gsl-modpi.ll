; ModuleID = 'gsl-modpi.bc'
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
  store double 7.000000e+20, double* %theta, align 8
  store double 0x400921FB40000000, double* %P1, align 8
  store double 0x3E84442D00000000, double* %P2, align 8
  store double 0x3D08469898CC5170, double* %P3, align 8
  store double 0x401921FB54442D18, double* %TwoPi, align 8
  %0 = load double, double* %theta, align 8
  %div = fdiv double %0, 0x401921FB54442D18
  %1 = call double @llvm.floor.f64(double %div)
  %mul = fmul double 2.000000e+00, %1
  store double %mul, double* %y, align 8
  %2 = load double, double* %theta, align 8
  %3 = load double, double* %y, align 8
  %mul1 = fmul double %3, 0x400921FB40000000
  %sub = fsub double %2, %mul1
  %4 = load double, double* %y, align 8
  %mul2 = fmul double %4, 0x3E84442D00000000
  %sub3 = fsub double %sub, %mul2
  %5 = load double, double* %y, align 8
  %mul4 = fmul double %5, 0x3D08469898CC5170
  %sub5 = fsub double %sub3, %mul4
  store double %sub5, double* %r, align 8
  %6 = load double, double* %r, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %6)
  ret i32 0
}

; Function Attrs: nounwind readnone speculatable
declare double @llvm.floor.f64(double) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
