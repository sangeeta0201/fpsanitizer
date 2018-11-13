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
define dso_local double @foo(double* nocapture %x, double* nocapture %y) local_unnamed_addr #0 {
entry:
  %0 = load double, double* %x, align 8, !tbaa !2
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %0)
  %1 = load double, double* %y, align 8, !tbaa !2
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), double %1)
  %2 = load double, double* %y, align 8, !tbaa !2
  %add = fadd double %2, 2.000000e-01
  store double %add, double* %y, align 8, !tbaa !2
  %3 = load double, double* %x, align 8, !tbaa !2
  %cmp = fcmp ugt double %3, 0.000000e+00
  br i1 %cmp, label %if.else, label %cleanup

if.else:                                          ; preds = %entry
  %sub2 = fadd double %3, -2.000000e-01
  store double %sub2, double* %x, align 8, !tbaa !2
  %call3 = tail call double @foo(double* nonnull %x, double* nonnull %y)
  %4 = load double, double* %x, align 8, !tbaa !2
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), double %4)
  %5 = load double, double* %y, align 8, !tbaa !2
  %call5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), double %5)
  %6 = load double, double* %y, align 8, !tbaa !2
  %7 = load double, double* %x, align 8, !tbaa !2
  %sub6 = fsub double %6, %7
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), double %sub6)
  ret double %sub6

cleanup:                                          ; preds = %entry
  ret double 0.000000e+00
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %x = alloca double, align 8
  %y = alloca double, align 8
  %0 = bitcast double* %x to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #3
  store double 6.000000e-01, double* %x, align 8, !tbaa !2
  %1 = bitcast double* %y to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %1) #3
  store double 3.200000e+00, double* %y, align 8, !tbaa !2
  %call = call double @foo(double* nonnull %x, double* nonnull %y)
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %call)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %1) #3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #3
  ret i32 0
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
