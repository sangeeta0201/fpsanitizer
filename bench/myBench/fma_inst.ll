; ModuleID = 'fma_inst.bc'
source_filename = "fma.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %x1 = alloca double, align 8
  %y1 = alloca double, align 8
  %z1 = alloca double, align 8
  %w = alloca double, align 8
  %0 = bitcast double* %x1 to i8*
  call void @setRealConstant(i8* %0, double 0x3FF0000000000005)
  store volatile double 0x3FF0000000000005, double* %x1, align 8
  %1 = bitcast double* %y1 to i8*
  call void @setRealConstant(i8* %1, double 0x3FF0000000000005)
  store volatile double 0x3FF0000000000005, double* %y1, align 8
  %2 = bitcast double* %z1 to i8*
  call void @setRealConstant(i8* %2, double 1.000000e+00)
  store volatile double 1.000000e+00, double* %z1, align 8
  %3 = load volatile double, double* %x1, align 8
  %4 = load volatile double, double* %y1, align 8
  %5 = load volatile double, double* %z1, align 8
  %6 = bitcast double* %x1 to i8*
  %7 = bitcast double* %y1 to i8*
  %8 = bitcast double* %z1 to i8*
  %9 = call double @llvm.fma.f64(double %3, double %4, double %5)
  %10 = call i8* @handleMathFunc3Args(i32 7, double %3, i8* %6, double %4, i8* %7, double %5, i8* %8, double %9, i32 10)
  %11 = bitcast double* %w to i8*
  %12 = bitcast i8* %10 to i8*
  call void @setRealTemp(i8* %11, i8* %12)
  store volatile double %9, double* %w, align 8
  %13 = load volatile double, double* %w, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %13)
  call void @finish()
  ret i32 0
}

; Function Attrs: nounwind readnone speculatable
declare double @llvm.fma.f64(double, double, double) #1

declare dso_local i32 @printf(i8*, ...) #2

declare void @finish()

declare void @setRealConstant(i8*, double)

declare i8* @handleMathFunc3Args(i32, double, i8*, double, i8*, double, i8*, double, i32)

declare void @setRealTemp(i8*, i8*)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
