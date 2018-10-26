; ModuleID = 'recur.bc'
source_filename = "recur.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"x: %e:\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"y: %e:\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"later x: %e:\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"later y: %e:\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"sub: %e:\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"z: %e:\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local double @foo(double %x, double %y) local_unnamed_addr #0 {
entry:
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %x)
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), double %y)
  %add = fadd double %y, 2.000000e-01
  %cmp = fcmp ugt double %x, 0.000000e+00
  br i1 %cmp, label %if.else, label %cleanup

if.else:                                          ; preds = %entry
  %sub2 = fadd double %x, -2.000000e-01
  %call3 = tail call double @foo(double %sub2, double %add)
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), double %sub2)
  %call5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), double %add)
  %sub6 = fsub double %add, %sub2
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), double %sub6)
  ret double %sub6

cleanup:                                          ; preds = %entry
  ret double 0.000000e+00
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %call = tail call double @foo(double 6.000000e-01, double 3.200000e+00)
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %call)
  ret i32 0
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
