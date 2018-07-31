; ModuleID = 'diff-simple_inst.bc'
source_filename = "diff-simple.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%e\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca double, align 8
  %y = alloca double, align 8
  %0 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %1 = bitcast double* %x to i8*
  call void @setRealConstant(i8* %1, double 1.000000e+16)
  store double 1.000000e+16, double* %x, align 8
  %2 = load double, double* %x, align 8
  %3 = bitcast double* %x to i8*
  %add = fadd double %2, 1.000000e+00
  %4 = call i8* @computeRealVC(i32 12, i8* %3, double 1.000000e+00, double %add, i32 0)
  %5 = load double, double* %x, align 8
  %6 = bitcast i8* %4 to i8*
  %7 = bitcast double* %x to i8*
  %sub = fsub double %add, %5
  %8 = call i8* @computeRealVV(i32 14, i8* %6, i8* %7, double %sub, i32 1)
  %9 = bitcast double* %y to i8*
  %10 = bitcast i8* %8 to i8*
  call void @setRealTemp(i8* %9, i8* %10)
  store double %sub, double* %y, align 8
  %11 = load double, double* %y, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %11)
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

declare void @setRealTemp(i8*, i8*)

declare void @setRealConstant(i8*, double)

declare i8* @computeRealVC(i32, i8*, double, double, i32)

declare i8* @computeRealVV(i32, i8*, i8*, double, i32)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
