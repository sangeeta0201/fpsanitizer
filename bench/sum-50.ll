; ModuleID = 'sum-50.bc'
source_filename = "sum-50.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private dso_local unnamed_addr constant [7 x i8] c"%.20g\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %x = alloca double, align 8
  %x.0.x.0..sroa_cast = bitcast double* %x to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %x.0.x.0..sroa_cast)
  store volatile double 0.000000e+00, double* %x, align 8, !tbaa !2
  %x.0.x.0.4 = load volatile double, double* %x, align 8, !tbaa !2
  %cmp5 = fcmp olt double %x.0.x.0.4, 2.000000e+00
  %x.0.x.0.16 = load volatile double, double* %x, align 8, !tbaa !2
  br i1 %cmp5, label %for.inc, label %for.end

for.inc:                                          ; preds = %entry, %for.inc
  %x.0.x.0.17 = phi double [ %x.0.x.0.1, %for.inc ], [ %x.0.x.0.16, %entry ]
  %add = fadd double %x.0.x.0.17, 2.000000e-01
  store volatile double %add, double* %x, align 8, !tbaa !2
  %x.0.x.0. = load volatile double, double* %x, align 8, !tbaa !2
  %cmp = fcmp olt double %x.0.x.0., 2.000000e+00
  %x.0.x.0.1 = load volatile double, double* %x, align 8, !tbaa !2
  br i1 %cmp, label %for.inc, label %for.end

for.end:                                          ; preds = %for.inc, %entry
  %x.0.x.0.1.lcssa = phi double [ %x.0.x.0.16, %entry ], [ %x.0.x.0.1, %for.inc ]
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), double %x.0.x.0.1.lcssa)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %x.0.x.0..sroa_cast)
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
