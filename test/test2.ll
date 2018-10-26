; ModuleID = 'test2.bc'
source_filename = "test2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"insufficient arguments\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"count:%d\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"The value of double is %f\0A\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"The value of double is %d\0A\00", align 1

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local double @foo(double* nocapture readonly %a, double* nocapture readonly %b, i32 %count) local_unnamed_addr #0 {
entry:
  %cmp4 = icmp sgt i32 %count, 0
  br i1 %cmp4, label %for.cond.for.cond.cleanup_crit_edge, label %for.cond.cleanup

for.cond.for.cond.cleanup_crit_edge:              ; preds = %entry
  %0 = load double, double* %a, align 8, !tbaa !2
  %1 = load double, double* %b, align 8, !tbaa !2
  %mul.le = fmul double %1, 1.000000e-01
  %add.le = fadd double %0, %mul.le
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.for.cond.cleanup_crit_edge, %entry
  %temp.0.lcssa = phi double [ %add.le, %for.cond.for.cond.cleanup_crit_edge ], [ 0.000000e+00, %entry ]
  ret double %temp.0.lcssa
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #2 {
entry:
  %a = alloca double, align 8
  %sum = alloca double, align 8
  %0 = bitcast double* %a to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #5
  %cmp = icmp slt i32 %argc, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0))
  br label %cleanup

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1
  %1 = load i8*, i8** %arrayidx, align 8, !tbaa !6
  %call1 = tail call i32 @atoi(i8* %1) #6
  store double 2.000000e-01, double* %a, align 8, !tbaa !2
  %2 = bitcast double* %sum to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #5
  store double 0.000000e+00, double* %sum, align 8, !tbaa !2
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 %call1)
  %cmp336 = icmp sgt i32 %call1, 0
  br i1 %cmp336, label %for.body, label %for.cond.cleanup10

for.cond8.preheader:                              ; preds = %for.body
  %cmp933 = icmp sgt i32 %call1, 0
  br i1 %cmp933, label %for.cond.cleanup10.loopexit, label %for.cond.cleanup10

for.body:                                         ; preds = %if.end, %for.body
  %i.037 = phi i32 [ %inc, %for.body ], [ 0, %if.end ]
  store double 0.000000e+00, double* %sum, align 8, !tbaa !2
  %call5 = call double @foo(double* nonnull %a, double* nonnull %sum, i32 %call1)
  %add6 = fadd double %call5, 0.000000e+00
  store double %add6, double* %sum, align 8, !tbaa !2
  %inc = add nuw nsw i32 %i.037, 1
  %exitcond = icmp eq i32 %inc, %call1
  br i1 %exitcond, label %for.cond8.preheader, label %for.body

for.cond.cleanup10.loopexit:                      ; preds = %for.cond8.preheader
  %3 = add i32 %call1, -1
  %4 = zext i32 %3 to i33
  %5 = add i32 %call1, -2
  %6 = zext i32 %5 to i33
  %7 = mul i33 %4, %6
  %8 = lshr i33 %7, 1
  %9 = trunc i33 %8 to i32
  %10 = add i32 %call1, %9
  br label %for.cond.cleanup10

for.cond.cleanup10:                               ; preds = %if.end, %for.cond.cleanup10.loopexit, %for.cond8.preheader
  %sum1.0.lcssa = phi i32 [ 1, %for.cond8.preheader ], [ %10, %for.cond.cleanup10.loopexit ], [ 1, %if.end ]
  %11 = load double, double* %sum, align 8, !tbaa !2
  %call16 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), double %11)
  %call17 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0), i32 %sum1.0.lcssa)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #5
  br label %cleanup

cleanup:                                          ; preds = %for.cond.cleanup10, %if.then
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #5
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally dso_local i32 @atoi(i8* nonnull %__nptr) local_unnamed_addr #4 {
entry:
  %call = tail call i64 @strtol(i8* nocapture nonnull %__nptr, i8** null, i32 10) #5
  %conv = trunc i64 %call to i32
  ret i32 %conv
}

; Function Attrs: nounwind
declare dso_local i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #3

attributes #0 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inlinehint nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
