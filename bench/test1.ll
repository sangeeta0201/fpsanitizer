; ModuleID = 'test1.bc'
source_filename = "test1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @f() #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  store double 1.000000e+16, double* %1, align 8
  %4 = load double, double* %1, align 8
  %5 = fadd double %4, 1.000000e+00
  %6 = load double, double* %1, align 8
  %7 = fsub double %5, %6
  store double %7, double* %2, align 8
  %8 = load double, double* %1, align 8
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %8)
  %10 = load double, double* %2, align 8
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %10)
  %12 = load double, double* %2, align 8
  %13 = fcmp oge double %12, 0.000000e+00
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %0
  %15 = load double, double* %2, align 8
  %16 = call double @sqrt(double %15) #3
  %17 = fadd double %16, 1.000000e+01
  store double %17, double* %3, align 8
  br label %23

; <label>:18:                                     ; preds = %0
  %19 = load double, double* %2, align 8
  %20 = fsub double -0.000000e+00, %19
  %21 = call double @sqrt(double %20) #3
  %22 = fadd double %21, 1.000000e+01
  store double %22, double* %3, align 8
  br label %23

; <label>:23:                                     ; preds = %18, %14
  %24 = load double, double* %3, align 8
  %25 = fptosi double %24 to i32
  ret i32 %25
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = call i32 @f()
  %4 = sitofp i32 %3 to double
  store double %4, double* %1, align 8
  %5 = call i32 @f()
  %6 = sitofp i32 %5 to double
  store double %6, double* %2, align 8
  %7 = load double, double* %1, align 8
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %7)
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 5.0.0-3~16.04.1 (tags/RELEASE_500/final)"}
