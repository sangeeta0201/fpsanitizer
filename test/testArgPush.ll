; ModuleID = 'testArgPush.bc'
source_filename = "testArgPush.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"insufficient arguments\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"count:%d\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"The value of double is %f\0A\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"The value of double is %d\0A\00", align 1

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local double @foo(double %a, double %b, i32 %count) local_unnamed_addr #0 {
entry:
  %cmp4 = icmp sgt i32 %count, 0
  %mul.le = fmul double %b, 1.000000e-01
  %add.le = fadd double %mul.le, %a
  %temp.0.lcssa = select i1 %cmp4, double %add.le, double 0.000000e+00
  ret double %temp.0.lcssa
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  %cmp = icmp slt i32 %argc, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0))
  br label %cleanup

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1
  %0 = load i8*, i8** %arrayidx, align 8, !tbaa !2
  %call1 = tail call i32 @atoi(i8* %0) #4
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 %call1)
  %cmp343 = icmp sgt i32 %call1, 0
  br i1 %cmp343, label %for.body, label %for.cond.cleanup10

for.cond8.preheader:                              ; preds = %for.body
  %cmp940 = icmp sgt i32 %call1, 0
  br i1 %cmp940, label %for.cond.cleanup10.loopexit, label %for.cond.cleanup10

for.body:                                         ; preds = %if.end, %for.body
  %i.045 = phi i32 [ %inc, %for.body ], [ 0, %if.end ]
  %sum.044 = phi double [ %add6, %for.body ], [ 0.000000e+00, %if.end ]
  %call4 = tail call double @foo(double 2.000000e-01, double %sum.044, i32 %call1)
  %add = fadd double %sum.044, %call4
  %call5 = tail call double @foo(double 2.000000e-01, double %add, i32 %call1)
  %add6 = fadd double %add, %call5
  %inc = add nuw nsw i32 %i.045, 1
  %exitcond = icmp eq i32 %inc, %call1
  br i1 %exitcond, label %for.cond8.preheader, label %for.body

for.cond.cleanup10.loopexit:                      ; preds = %for.cond8.preheader
  %1 = add i32 %call1, -1
  %2 = zext i32 %1 to i33
  %3 = add i32 %call1, -2
  %4 = zext i32 %3 to i33
  %5 = mul i33 %2, %4
  %6 = lshr i33 %5, 1
  %7 = trunc i33 %6 to i32
  %8 = add i32 %call1, %7
  br label %for.cond.cleanup10

for.cond.cleanup10:                               ; preds = %if.end, %for.cond.cleanup10.loopexit, %for.cond8.preheader
  %sum.0.lcssa48 = phi double [ %add6, %for.cond.cleanup10.loopexit ], [ %add6, %for.cond8.preheader ], [ 0.000000e+00, %if.end ]
  %sum1.0.lcssa = phi i32 [ %8, %for.cond.cleanup10.loopexit ], [ 1, %for.cond8.preheader ], [ 1, %if.end ]
  %call16 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), double %sum.0.lcssa48)
  %call17 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0), i32 %sum1.0.lcssa)
  br label %cleanup

cleanup:                                          ; preds = %for.cond.cleanup10, %if.then
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally dso_local i32 @atoi(i8* nonnull %__nptr) local_unnamed_addr #3 {
entry:
  %call = tail call i64 @strtol(i8* nocapture nonnull %__nptr, i8** null, i32 10) #5
  %conv = trunc i64 %call to i32
  ret i32 %conv
}

; Function Attrs: nounwind
declare dso_local i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #2

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inlinehint nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}