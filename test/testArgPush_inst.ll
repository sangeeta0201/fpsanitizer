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
  %0 = bitcast double (double, double, i32)* @foo to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit()
  %cmp4 = icmp sgt i32 %count, 0
  %2 = call i64 @getRealFunArg(i32 1)
  %mul.le = fmul double %b, 1.000000e-01
  %3 = call i64 @computeReal(i32 16, i64 %2, i64 0, double %b, double 1.000000e-01, double %mul.le, i32 1)
  %4 = call i64 @getRealFunArg(i32 0)
  %add.le = fadd double %mul.le, %a
  %5 = call i64 @computeReal(i32 12, i64 %3, i64 %4, double %mul.le, double %a, double %add.le, i32 2)
  %6 = select i1 %cmp4, i64 %5, i64 0
  %temp.0.lcssa = select i1 %cmp4, double %add.le, double 0.000000e+00
  call void @funcExit(i64 %6)
  ret double %temp.0.lcssa
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  call void @init()
  %cmp = icmp slt i32 %argc, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0))
  br label %cleanup

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1
  %0 = load i8*, i8** %arrayidx, align 8, !tbaa !2
  %call1 = tail call i32 @atoi(i8* %0) #4
  %cmp241 = icmp sgt i32 %call1, 0
  br i1 %cmp241, label %for.body, label %for.cond.cleanup9

for.cond7.preheader:                              ; preds = %for.body
  %cmp838 = icmp sgt i32 %call1, 0
  br i1 %cmp838, label %for.cond.cleanup9.loopexit, label %for.cond.cleanup9

for.body:                                         ; preds = %if.end, %for.body
  %i.043 = phi i32 [ %inc, %for.body ], [ 0, %if.end ]
  %1 = phi i64 [ %13, %for.body ], [ 0, %if.end ]
  %sum.042 = phi double [ %add5, %for.body ], [ 0.000000e+00, %if.end ]
  call void @addReturnAddr()
  %2 = bitcast double (double, double, i32)* @foo to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @addFunArg(i32 1, i64 %1, double %sum.042)
  call void bitcast (void (i32, i64, double)* @addFunArg to void (i32, i32, double)*)(i32 0, i32 0, double 2.000000e-01)
  %call3 = tail call double @foo(double 2.000000e-01, double %sum.042, i32 %call1)
  %4 = bitcast double (double, double, i32)* @foo to i8*
  %5 = call i64 @getAddr(i8* %4)
  %6 = call i64 @getRealReturn(i32 13)
  %add = fadd double %sum.042, %call3
  %7 = call i64 @computeReal(i32 12, i64 %1, i64 %6, double %sum.042, double %call3, double %add, i32 14)
  call void @addReturnAddr()
  %8 = bitcast double (double, double, i32)* @foo to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @addFunArg(i32 1, i64 %7, double %add)
  call void bitcast (void (i32, i64, double)* @addFunArg to void (i32, i32, double)*)(i32 0, i32 0, double 2.000000e-01)
  %call4 = tail call double @foo(double 2.000000e-01, double %add, i32 %call1)
  %10 = bitcast double (double, double, i32)* @foo to i8*
  %11 = call i64 @getAddr(i8* %10)
  %12 = call i64 @getRealReturn(i32 15)
  %add5 = fadd double %add, %call4
  %13 = call i64 @computeReal(i32 12, i64 %7, i64 %12, double %add, double %call4, double %add5, i32 16)
  %inc = add nuw nsw i32 %i.043, 1
  %exitcond = icmp eq i32 %inc, %call1
  br i1 %exitcond, label %for.cond7.preheader, label %for.body

for.cond.cleanup9.loopexit:                       ; preds = %for.cond7.preheader
  %14 = add i32 %call1, -1
  %15 = zext i32 %14 to i33
  %16 = add i32 %call1, -2
  %17 = zext i32 %16 to i33
  %18 = mul i33 %15, %17
  %19 = lshr i33 %18, 1
  %20 = trunc i33 %19 to i32
  %21 = add i32 %call1, %20
  br label %for.cond.cleanup9

for.cond.cleanup9:                                ; preds = %if.end, %for.cond.cleanup9.loopexit, %for.cond7.preheader
  %22 = phi i64 [ %13, %for.cond.cleanup9.loopexit ], [ %13, %for.cond7.preheader ], [ 0, %if.end ]
  %sum.0.lcssa46 = phi double [ %add5, %for.cond.cleanup9.loopexit ], [ %add5, %for.cond7.preheader ], [ 0.000000e+00, %if.end ]
  %sum1.0.lcssa = phi i32 [ %21, %for.cond.cleanup9.loopexit ], [ 1, %for.cond7.preheader ], [ 1, %if.end ]
  %call15 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i64 0, i64 0), double %sum.0.lcssa46)
  %call16 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), i32 %sum1.0.lcssa)
  br label %cleanup

cleanup:                                          ; preds = %for.cond.cleanup9, %if.then
  call void @finish()
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally dso_local i32 @atoi(i8* nonnull %__nptr) local_unnamed_addr #3 {
entry:
  %0 = bitcast i32 (i8*)* @atoi to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit()
  %call = tail call i64 @strtol(i8* nocapture nonnull %__nptr, i8** null, i32 10) #5
  %conv = trunc i64 %call to i32
  ret i32 %conv
}

; Function Attrs: nounwind
declare dso_local i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #2

declare i64 @getAddr(i8*)

declare void @funcInit()

declare void @init()

declare i64 @getRealFunArg(i32)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @funcExit(i64)

declare void @addReturnAddr()

declare void @addFunArg(i32, i64, double)

declare i64 @getRealReturn(i32)

declare void @finish()

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
