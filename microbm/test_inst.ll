; ModuleID = 'test_inst.bc'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"insufficient arguments\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"The value of float is %f\0A\00", align 1

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local float @foo(float %a, float %b, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = bitcast float (float, float, i32)* @foo to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %cmp6 = icmp sgt i32 %count, 0
  %2 = call i64 @setRealReg(i32 1, float 0.000000e+00)
  br i1 %cmp6, label %for.cond.for.cond.cleanup_crit_edge, label %for.cond.cleanup

for.cond.for.cond.cleanup_crit_edge:              ; preds = %entry
  %conv.le = fpext float %a to double
  %conv1.le = fpext float %b to double
  %mul.le = fmul double %conv1.le, 1.000000e-01
  %3 = call i64 @computeReal(i32 16, i64 0, i64 0, double %conv1.le, double 1.000000e-01, double %conv1.le, double 1.000000e-01, double %mul.le, i64 3, i32 4)
  %add.le = fadd double %mul.le, %conv.le
  %4 = call i64 @computeReal(i32 12, i64 %3, i64 0, double %mul.le, double %conv.le, double %mul.le, double %conv.le, double %add.le, i64 3, i32 5)
  %conv2.le = fptrunc double %add.le to float
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.for.cond.cleanup_crit_edge, %entry
  %5 = phi i64 [ %4, %for.cond.for.cond.cleanup_crit_edge ], [ %2, %entry ]
  %temp.0.lcssa = phi float [ %conv2.le, %for.cond.for.cond.cleanup_crit_edge ], [ 0.000000e+00, %entry ]
  %6 = bitcast float (float, float, i32)* @foo to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @funcExit(i64 %7, i64 %5)
  ret float %temp.0.lcssa
}

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local float @bar(float %a, float %b, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = bitcast float (float, float, i32)* @bar to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %cmp6 = icmp sgt i32 %count, 0
  %2 = call i64 @setRealReg(i32 2, float 0.000000e+00)
  br i1 %cmp6, label %for.cond.for.cond.cleanup_crit_edge, label %for.cond.cleanup

for.cond.for.cond.cleanup_crit_edge:              ; preds = %entry
  %3 = bitcast float (float, float, i32)* @bar to i8*
  %4 = call i64 @getAddr(i8* %3)
  %5 = call i64 @getRealFunArg(i32 0, i64 %4)
  %6 = bitcast float (float, float, i32)* @bar to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = call i64 @getRealFunArg(i32 1, i64 %7)
  %add.le = fadd float %a, %b
  %9 = call i64 bitcast (i64 (i32, i64, i64, double, double, double, double, double, i64, i32)* @computeReal to i64 (i32, i64, i64, float, float, float, float, float, i64, i32)*)(i32 12, i64 %5, i64 %8, float %a, float %b, float %a, float %b, float %add.le, i64 2, i32 12)
  %conv.le = fpext float %add.le to double
  %add1.le = fadd double %conv.le, 1.000000e-01
  %10 = call i64 @computeReal(i32 12, i64 0, i64 0, double %conv.le, double 1.000000e-01, double %conv.le, double 1.000000e-01, double %add1.le, i64 3, i32 14)
  %conv2.le = fptrunc double %add1.le to float
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.for.cond.cleanup_crit_edge, %entry
  %11 = phi i64 [ %10, %for.cond.for.cond.cleanup_crit_edge ], [ %2, %entry ]
  %temp.0.lcssa = phi float [ %conv2.le, %for.cond.for.cond.cleanup_crit_edge ], [ 0.000000e+00, %entry ]
  %12 = bitcast float (float, float, i32)* @bar to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @funcExit(i64 %13, i64 %11)
  ret float %temp.0.lcssa
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  call void @init()
  %0 = bitcast i32 (i32, i8**)* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %cmp = icmp slt i32 %argc, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0))
  br label %cleanup

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1
  %2 = load i8*, i8** %arrayidx, align 8, !tbaa !2
  %3 = bitcast i8* %2 to i8*
  %4 = call i64 @getAddr(i8* %3)
  %5 = bitcast i32 (i8*)* @atoi to i8*
  %6 = call i64 @getAddr(i8* %5)
  %call1 = tail call i32 @atoi(i8* %2) #4
  %cmp730 = icmp sgt i32 %call1, 0
  %7 = call i64 bitcast (i64 (i32, float)* @setRealReg to i64 (i32, double)*)(i32 2, double 0.000000e+00)
  br i1 %cmp730, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %if.end
  %arrayidx4 = getelementptr inbounds i8*, i8** %argv, i64 3
  %8 = load i8*, i8** %arrayidx4, align 8, !tbaa !2
  %9 = bitcast i8* %8 to i8*
  %10 = call i64 @getAddr(i8* %9)
  %11 = bitcast i32 (i8*)* @atoi to i8*
  %12 = call i64 @getAddr(i8* %11)
  %call5 = tail call i32 @atoi(i8* %8) #4
  %conv6 = sitofp i32 %call5 to float
  %arrayidx2 = getelementptr inbounds i8*, i8** %argv, i64 2
  %13 = load i8*, i8** %arrayidx2, align 8, !tbaa !2
  %14 = bitcast i8* %13 to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = bitcast i32 (i8*)* @atoi to i8*
  %17 = call i64 @getAddr(i8* %16)
  %call3 = tail call i32 @atoi(i8* %13) #4
  %conv = sitofp i32 %call3 to float
  %18 = bitcast float (float, float, i32)* @foo to i8*
  %19 = call i64 @getAddr(i8* %18)
  %call9 = tail call float @foo(float %conv, float %conv6, i32 %call1)
  %20 = call i64 @setRealReg(i32 2, float 0.000000e+00)
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  %phitmp = fpext float %add11 to double
  %21 = call i64 bitcast (i64 (i32, float)* @setRealReg to i64 (i32, double)*)(i32 3, double %phitmp)
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %if.end
  %22 = phi i64 [ %7, %if.end ], [ %21, %for.cond.cleanup.loopexit ]
  %sum.0.lcssa = phi double [ 0.000000e+00, %if.end ], [ %phitmp, %for.cond.cleanup.loopexit ]
  %call13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i64 0, i64 0), double %sum.0.lcssa)
  br label %cleanup

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.032 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %23 = phi i64 [ %20, %for.body.lr.ph ], [ %31, %for.body ]
  %sum.031 = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %add11, %for.body ]
  %24 = bitcast float (float, float, i32)* @foo to i8*
  %25 = call i64 @getAddr(i8* %24)
  %26 = call i64 @getRealReturn(i64 %25)
  %add = fadd float %sum.031, %call9
  %27 = call i64 bitcast (i64 (i32, i64, i64, double, double, double, double, double, i64, i32)* @computeReal to i64 (i32, i64, i64, float, float, float, float, float, i64, i32)*)(i32 12, i64 %23, i64 %26, float %sum.031, float %call9, float %sum.031, float %call9, float %add, i64 2, i32 45)
  %28 = bitcast float (float, float, i32)* @foo to i8*
  %29 = call i64 @getAddr(i8* %28)
  %30 = call i64 @getRealReturn(i64 %29)
  %add11 = fadd float %call9, %add
  %31 = call i64 bitcast (i64 (i32, i64, i64, double, double, double, double, double, i64, i32)* @computeReal to i64 (i32, i64, i64, float, float, float, float, float, i64, i32)*)(i32 12, i64 %30, i64 %27, float %call9, float %add, float %call9, float %add, float %add11, i64 2, i32 46)
  %inc = add nuw nsw i32 %i.032, 1
  %exitcond = icmp eq i32 %inc, %call1
  br i1 %exitcond, label %for.cond.cleanup.loopexit, label %for.body

cleanup:                                          ; preds = %for.cond.cleanup, %if.then
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
  call void @funcInit(i64 %1)
  %call = tail call i64 @strtol(i8* nocapture nonnull %__nptr, i8** null, i32 10) #5
  %conv = trunc i64 %call to i32
  ret i32 %conv
}

; Function Attrs: nounwind
declare dso_local i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #2

declare i64 @computeReal(i32, i64, i64, double, double, double, double, double, i64, i32)

declare i64 @setRealReg(i32, float)

declare i64 @getRealFunArg(i32, i64)

declare i64 @getAddr(i8*)

declare i64 @getRealReturn(i64)

declare void @finish()

declare void @funcInit(i64)

declare void @funcExit(i64, i64)

declare void @init()

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inlinehint nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk) (llvm/trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
