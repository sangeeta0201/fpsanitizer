; ModuleID = 'test_inst.bc'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"insufficient arguments\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"count:%d\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"The value of double is %f\0A\00", align 1

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local double @foo(double %a, double %b, i32 %count) local_unnamed_addr #0 {
entry:
  %0 = bitcast double (double, double, i32)* @foo to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %cmp4 = icmp sgt i32 %count, 0
  %2 = bitcast double (double, double, i32)* @foo to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = call i64 @getRealFunArg(i32 1, i64 %3)
  %mul.le = fmul double %b, 1.000000e-01
  %5 = call i64 @computeReal(i32 16, i64 %4, i64 0, double %b, double 1.000000e-01, double %b, double 1.000000e-01, double %mul.le, i64 3, i32 1)
  %6 = bitcast double (double, double, i32)* @foo to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = call i64 @getRealFunArg(i32 0, i64 %7)
  %add.le = fadd double %mul.le, %a
  %9 = call i64 @computeReal(i32 12, i64 %5, i64 %8, double %mul.le, double %a, double %mul.le, double %a, double %add.le, i64 3, i32 2)
  %10 = select i1 %cmp4, i64 %9, i64 1
  %temp.0.lcssa = select i1 %cmp4, double %add.le, double 0.000000e+00
  %11 = bitcast double (double, double, i32)* @foo to i8*
  %12 = call i64 @getAddr(i8* %11)
  call void @funcExit(i64 %12, i64 %10)
  ret double %temp.0.lcssa
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  call void @init()
  %0 = bitcast i32 (i32, i8**)* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %cmp = icmp slt i32 %argc, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0))
  br label %cleanup

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1
  %2 = load i8*, i8** %arrayidx, align 8, !tbaa !2
  %3 = bitcast i32 (i8*)* @atoi to i8*
  %4 = call i64 @getAddr(i8* %3)
  %call1 = tail call i32 @atoi(i8* %2) #4
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 %call1)
  %cmp324 = icmp sgt i32 %call1, 0
  br i1 %cmp324, label %for.cond.for.cond.cleanup_crit_edge, label %for.cond.cleanup

for.cond.for.cond.cleanup_crit_edge:              ; preds = %if.end
  %5 = bitcast double (double, double, i32)* @foo to i8*
  %6 = call i64 @getAddr(i8* %5)
  %call5.le = tail call double @foo(double 2.000000e-01, double 0.000000e+00, i32 %call1)
  %7 = bitcast double (double, double, i32)* @foo to i8*
  %8 = call i64 @getAddr(i8* %7)
  %9 = call i64 @getRealReturn(i64 %8)
  %add6.le = fadd double %call5.le, 0.000000e+00
  %10 = call i64 @computeReal(i32 12, i64 %9, i64 0, double %call5.le, double 0.000000e+00, double %call5.le, double 0.000000e+00, double %add6.le, i64 3, i32 16)
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.for.cond.cleanup_crit_edge, %if.end
  %11 = phi i64 [ %10, %for.cond.for.cond.cleanup_crit_edge ], [ 2, %if.end ]
  %sum.0.lcssa = phi double [ %add6.le, %for.cond.for.cond.cleanup_crit_edge ], [ 0.000000e+00, %if.end ]
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), double %sum.0.lcssa)
  br label %cleanup

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

declare i64 @getRealFunArg(i32, i64)

declare i64 @getAddr(i8*)

declare i64 @computeReal(i32, i64, i64, double, double, double, double, double, i64, i32)

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
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
