; ModuleID = 'test1_inst.bc'
source_filename = "test1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"insufficient arguments\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"The value of double is %f\0A\00", align 1

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local double @foo(double %a, double %b, i32 %count) local_unnamed_addr #0 {
entry:
  call void @funcInit()
  %cmp4 = icmp sgt i32 %count, 0
  %0 = call i64 @getRealFunArg(i32 1)
  %mul.le = fmul double %b, 1.000000e-01
  %1 = call i64 @computeReal(i32 16, i64 %0, i64 0, double %b, double 1.000000e-01, double %mul.le, i32 1)
  %2 = call i64 @getRealFunArg(i32 0)
  %add.le = fadd double %mul.le, %a
  %3 = call i64 @computeReal(i32 12, i64 %1, i64 %2, double %mul.le, double %a, double %add.le, i32 2)
  %4 = select i1 %cmp4, i64 %3, i64 0
  %temp.0.lcssa = select i1 %cmp4, double %add.le, double 0.000000e+00
  call void @funcExit(i64 %4)
  ret double %temp.0.lcssa
}

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local double @bar(double %a, double %b, i32 %count) local_unnamed_addr #0 {
entry:
  call void @funcInit()
  %cmp5 = icmp sgt i32 %count, 0
  %0 = call i64 @getRealFunArg(i32 3)
  %1 = call i64 @getRealFunArg(i32 4)
  %add.le = fadd double %a, %b
  %2 = call i64 @computeReal(i32 12, i64 %0, i64 %1, double %a, double %b, double %add.le, i32 1)
  %add1.le = fadd double %add.le, 1.000000e-01
  %3 = call i64 @computeReal(i32 12, i64 %2, i64 0, double %add.le, double 1.000000e-01, double %add1.le, i32 2)
  %4 = select i1 %cmp5, i64 %3, i64 0
  %temp.0.lcssa = select i1 %cmp5, double %add1.le, double 0.000000e+00
  call void @funcExit(i64 %4)
  ret double %temp.0.lcssa
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  call void @init()
  %cmp = icmp slt i32 %argc, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0))
  br label %cleanup

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1
  %0 = bitcast i8** %arrayidx to i8*
  %1 = load i8*, i8** %arrayidx, align 8, !tbaa !2
  %call1 = tail call i32 @atoi(i8* %1) #4
  %cmp729 = icmp sgt i32 %call1, 0
  br i1 %cmp729, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %if.end
  %arrayidx4 = getelementptr inbounds i8*, i8** %argv, i64 3
  %2 = bitcast i8** %arrayidx4 to i8*
  %3 = load i8*, i8** %arrayidx4, align 8, !tbaa !2
  %call5 = tail call i32 @atoi(i8* %3) #4
  %conv6 = sitofp i32 %call5 to double
  %arrayidx2 = getelementptr inbounds i8*, i8** %argv, i64 2
  %4 = bitcast i8** %arrayidx2 to i8*
  %5 = load i8*, i8** %arrayidx2, align 8, !tbaa !2
  %call3 = tail call i32 @atoi(i8* %5) #4
  %conv = sitofp i32 %call3 to double
  call void @addReturnAddr()
  call void @addFunArg(i32 1, i32 0, double %conv6)
  call void @addFunArg(i32 0, i32 0, double %conv)
  %call9 = tail call double @foo(double %conv, double %conv6, i32 %call1)
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %if.end
  %6 = phi i64 [ 0, %if.end ], [ %11, %for.body ]
  %sum.0.lcssa = phi double [ 0.000000e+00, %if.end ], [ %add11, %for.body ]
  %call12 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i64 0, i64 0), double %sum.0.lcssa)
  br label %cleanup

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.031 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %7 = phi i64 [ 0, %for.body.lr.ph ], [ %11, %for.body ]
  %sum.030 = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add11, %for.body ]
  %8 = call i64 @getRealReturn(i32 17)
  %add = fadd double %sum.030, %call9
  %9 = call i64 @computeReal(i32 12, i64 %7, i64 %8, double %sum.030, double %call9, double %add, i32 24)
  %10 = call i64 @getRealReturn(i32 17)
  %add11 = fadd double %call9, %add
  %11 = call i64 @computeReal(i32 12, i64 %10, i64 %9, double %call9, double %add, double %add11, i32 25)
  %inc = add nuw nsw i32 %i.031, 1
  %exitcond = icmp eq i32 %inc, %call1
  br i1 %exitcond, label %for.cond.cleanup, label %for.body

cleanup:                                          ; preds = %for.cond.cleanup, %if.then
  call void @finish()
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally dso_local i32 @atoi(i8* nonnull %__nptr) local_unnamed_addr #3 {
entry:
  call void @funcInit()
  %call = tail call i64 @strtol(i8* nocapture nonnull %__nptr, i8** null, i32 10) #5
  %conv = trunc i64 %call to i32
  ret i32 %conv
}

; Function Attrs: nounwind
declare dso_local i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #2

declare void @funcInit()

declare void @init()

declare i64 @getRealFunArg(i32)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @funcExit(i64)

declare void @addReturnAddr()

declare void @addFunArg(i32, i32, double)

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
