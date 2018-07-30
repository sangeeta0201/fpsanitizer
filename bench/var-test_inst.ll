; ModuleID = 'var-test_inst.bc'
source_filename = "var-test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%e\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %x = alloca double, align 8
  %y = alloca double, align 8
  %z1 = alloca double, align 8
  %z2 = alloca double, align 8
  %z3 = alloca double, align 8
  %sum = alloca double, align 8
  %0 = bitcast double* %z1 to i8*
  call void @setRealConstant(i8* %0, double 5.000000e+00)
  store volatile double 5.000000e+00, double* %z1, align 8
  %1 = load volatile double, double* %z1, align 8
  %2 = bitcast double* %z1 to i8*
  %3 = bitcast i32* null to i8*
  %add = fadd double %1, 6.000000e+00
  %4 = call i8* @computeRealVV(i32 12, i8* %2, i8* %3, double %add, i32 8)
  %5 = bitcast double* %z3 to i8*
  %6 = bitcast i8* %4 to i8*
  call void @setRealTemp(i8* %5, i8* %6)
  store volatile double %add, double* %z3, align 8
  %7 = load volatile double, double* %z3, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), double %7)
  call void @finish()
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

declare void @finish()

declare void @setRealConstant(i8*, double)

declare i8* @computeRealVV(i32, i8*, i8*, double, i32)

declare void @setRealTemp(i8*, i8*)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
