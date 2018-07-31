; ModuleID = 'sum_inst.bc'
source_filename = "sum-50.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%.20g\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() local_unnamed_addr #0 {
  %1 = call double @setRealReg(double 1.000000e+00, double 0.000000e+00)
  br label %2

; <label>:2:                                      ; preds = %0, %2
  %3 = phi double [ %1, %0 ], [ %6, %2 ]
  %4 = phi double [ 0.000000e+00, %0 ], [ %7, %2 ]
  %5 = call double @setRealReg(double 0.000000e+00, double 2.000000e-01)
  %6 = call double @handleOp_rd(i32 12, double %3, double %5)
  %7 = fadd double %4, 2.000000e-01
  %8 = fcmp olt double %7, 1.000000e+01
  br i1 %8, label %2, label %9

; <label>:9:                                      ; preds = %2
  %10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), double %7)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

declare double @setRealReg(double, double)

declare double @handleOp_rd(i32, double, double)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 5.0.0-3~16.04.1 (tags/RELEASE_500/final)"}
