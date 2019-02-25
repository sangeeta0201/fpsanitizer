; ModuleID = 'testArgPush_inst.bc'
source_filename = "testArgPush.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"insufficient arguments\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"The value of double is %f\0A\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"The value of double is %d\0A\00", align 1

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local double @foo(double %a, double %b, i32 %count) local_unnamed_addr #0 {
entry:
  %cmp4 = icmp sgt i32 %count, 0
  %mul.le = fmul double %b, 1.000000e-01
  call void @__compute_real_d(i64 16, i64 2, i64 0, double %b, double 1.000000e-01, double %mul.le, i64 4)
  %add.le = fadd double %mul.le, %a
  call void @__compute_real_d(i64 12, i64 4, i64 1, double %mul.le, double %a, double %add.le, i64 5)
  %temp.0.lcssa = select i1 %cmp4, double %add.le, double 0.000000e+00
  %0 = select i1 %cmp4, i64 5, i64 0
  call void @__func_exit(i64 %0)
  ret double %temp.0.lcssa
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  call void @__init(i64 7)
  %cmp = icmp slt i32 %argc, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0))
  br label %cleanup

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1
  %0 = bitcast i8** %arrayidx to i8*
  %1 = load i8*, i8** %arrayidx, align 8, !tbaa !2
  %call1 = tail call i32 @atoi(i8* %1) #4
  %cmp241 = icmp sgt i32 %call1, 0
  br i1 %cmp241, label %for.body, label %for.cond.cleanup9

for.cond7.preheader:                              ; preds = %for.body
  %cmp838 = icmp sgt i32 %call1, 0
  br i1 %cmp838, label %for.cond.cleanup9.loopexit, label %for.cond.cleanup9

for.body:                                         ; preds = %if.end, %for.body
  %i.043 = phi i32 [ %inc, %for.body ], [ 0, %if.end ]
  %2 = phi i64 [ 6, %for.body ], [ 0, %if.end ]
  %sum.042 = phi double [ %add5, %for.body ], [ 0.000000e+00, %if.end ]
  call void @__func_init(i64 7, i64 3)
  call void @__add_fun_arg(i64 3, i64 0, i32 %call1)
  call void bitcast (void (i64, i64, i32)* @__add_fun_arg to void (i64, i64, double)*)(i64 2, i64 %2, double %sum.042)
  call void bitcast (void (i64, i64, i32)* @__add_fun_arg to void (i64, i64, double)*)(i64 1, i64 0, double 2.000000e-01)
  %call3 = tail call double @foo(double 2.000000e-01, double %sum.042, i32 %call1)
  %add = fadd double %sum.042, %call3
  call void @__compute_real_d(i64 12, i64 0, i64 3, double %sum.042, double %call3, double %add, i64 4)
  call void @__func_init(i64 7, i64 5)
  call void @__add_fun_arg(i64 3, i64 0, i32 %call1)
  call void bitcast (void (i64, i64, i32)* @__add_fun_arg to void (i64, i64, double)*)(i64 2, i64 4, double %add)
  call void bitcast (void (i64, i64, i32)* @__add_fun_arg to void (i64, i64, double)*)(i64 1, i64 0, double 2.000000e-01)
  %call4 = tail call double @foo(double 2.000000e-01, double %add, i32 %call1)
  %add5 = fadd double %add, %call4
  call void @__compute_real_d(i64 12, i64 4, i64 5, double %add, double %call4, double %add5, i64 6)
  %inc = add nuw nsw i32 %i.043, 1
  %exitcond = icmp eq i32 %inc, %call1
  br i1 %exitcond, label %for.cond7.preheader, label %for.body

for.cond.cleanup9.loopexit:                       ; preds = %for.cond7.preheader
  %3 = add i32 %call1, -1
  %4 = zext i32 %3 to i33
  %5 = add i32 %call1, -2
  %6 = zext i32 %5 to i33
  %7 = mul i33 %4, %6
  %8 = lshr i33 %7, 1
  %9 = trunc i33 %8 to i32
  %10 = add i32 %call1, %9
  br label %for.cond.cleanup9

for.cond.cleanup9:                                ; preds = %if.end, %for.cond.cleanup9.loopexit, %for.cond7.preheader
  %11 = phi i64 [ 6, %for.cond.cleanup9.loopexit ], [ 6, %for.cond7.preheader ], [ 0, %if.end ]
  %sum.0.lcssa46 = phi double [ %add5, %for.cond.cleanup9.loopexit ], [ %add5, %for.cond7.preheader ], [ 0.000000e+00, %if.end ]
  %sum1.0.lcssa = phi i32 [ %10, %for.cond.cleanup9.loopexit ], [ 1, %for.cond7.preheader ], [ 1, %if.end ]
  %call15 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i64 0, i64 0), double %sum.0.lcssa46)
  %call16 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), i32 %sum1.0.lcssa)
  br label %cleanup

cleanup:                                          ; preds = %for.cond.cleanup9, %if.then
  call void @__finish()
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

declare void @__init(i64)

declare void @__finish()

declare void @__compute_real_d(i64, i64, i64, double, double, double, i64)

declare void @__func_exit(i64)

declare void @__func_init(i64, i64)

declare void @__add_fun_arg(i64, i64, i32)

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
