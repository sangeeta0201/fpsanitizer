; ModuleID = 'test2_inst.bc'
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
  %0 = bitcast double (double*, double*, i32)* @foo to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %cmp4 = icmp sgt i32 %count, 0
  br i1 %cmp4, label %for.cond.for.cond.cleanup_crit_edge, label %for.cond.cleanup

for.cond.for.cond.cleanup_crit_edge:              ; preds = %entry
  %2 = load double, double* %a, align 8, !tbaa !2
  %3 = bitcast double* %a to i8*
  %4 = call i64 @getAddr(i8* %3)
  %5 = load double, double* %b, align 8, !tbaa !2
  %6 = bitcast double* %b to i8*
  %7 = call i64 @getAddr(i8* %6)
  %mul.le = fmul double %5, 1.000000e-01
  %8 = call i64 @computeReal(i32 16, i64 %7, i64 0, double %5, double 1.000000e-01, double %5, double 1.000000e-01, double %mul.le, i64 3, i32 4)
  %add.le = fadd double %2, %mul.le
  %9 = call i64 @computeReal(i32 12, i64 %4, i64 %8, double %2, double %mul.le, double %2, double %mul.le, double %add.le, i64 3, i32 5)
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.for.cond.cleanup_crit_edge, %entry
  %10 = phi i64 [ %9, %for.cond.for.cond.cleanup_crit_edge ], [ 0, %entry ]
  %temp.0.lcssa = phi double [ %add.le, %for.cond.for.cond.cleanup_crit_edge ], [ 0.000000e+00, %entry ]
  %11 = bitcast double (double*, double*, i32)* @foo to i8*
  %12 = call i64 @getAddr(i8* %11)
  call void @funcExit(i64 %12, i64 %10)
  ret double %temp.0.lcssa
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #2 {
entry:
  call void @init()
  %0 = bitcast i32 (i32, i8**)* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %a = alloca double, align 8
  %sum = alloca double, align 8
  %2 = bitcast double* %a to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #5
  %cmp = icmp slt i32 %argc, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0))
  br label %cleanup

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1
  %3 = load i8*, i8** %arrayidx, align 8, !tbaa !6
  %4 = bitcast i8* %3 to i8*
  %5 = call i64 @getAddr(i8* %4)
  %6 = bitcast i32 (i8*)* @atoi to i8*
  %7 = call i64 @getAddr(i8* %6)
  %call1 = tail call i32 @atoi(i8* %3) #6
  %8 = bitcast double* %a to i8*
  %9 = call i64 @getAddr(i8* %8)
  store double 2.000000e-01, double* %a, align 8, !tbaa !2
  %10 = bitcast double* %sum to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %10) #5
  %11 = bitcast double* %sum to i8*
  %12 = call i64 @getAddr(i8* %11)
  store double 0.000000e+00, double* %sum, align 8, !tbaa !2
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 %call1)
  %cmp336 = icmp sgt i32 %call1, 0
  br i1 %cmp336, label %for.body, label %for.cond.cleanup10

for.cond8.preheader:                              ; preds = %for.body
  %cmp933 = icmp sgt i32 %call1, 0
  br i1 %cmp933, label %for.cond.cleanup10.loopexit, label %for.cond.cleanup10

for.body:                                         ; preds = %if.end, %for.body
  %i.037 = phi i32 [ %inc, %for.body ], [ 0, %if.end ]
  %13 = bitcast double* %sum to i8*
  %14 = call i64 @getAddr(i8* %13)
  store double 0.000000e+00, double* %sum, align 8, !tbaa !2
  %15 = bitcast double (double*, double*, i32)* @foo to i8*
  %16 = call i64 @getAddr(i8* %15)
  %call5 = call double @foo(double* nonnull %a, double* nonnull %sum, i32 %call1)
  %17 = bitcast double (double*, double*, i32)* @foo to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = call i64 @getRealReturn(i64 %18)
  %add6 = fadd double %call5, 0.000000e+00
  %20 = call i64 @computeReal(i32 12, i64 %19, i64 0, double %call5, double 0.000000e+00, double %call5, double 0.000000e+00, double %add6, i64 3, i32 32)
  %21 = bitcast double* %sum to i8*
  %22 = call i64 @getAddr(i8* %21)
  call void @setRealTemp(i64 %22, i64 %20, double %add6)
  store double %add6, double* %sum, align 8, !tbaa !2
  %inc = add nuw nsw i32 %i.037, 1
  %exitcond = icmp eq i32 %inc, %call1
  br i1 %exitcond, label %for.cond8.preheader, label %for.body

for.cond.cleanup10.loopexit:                      ; preds = %for.cond8.preheader
  %23 = add i32 %call1, -1
  %24 = zext i32 %23 to i33
  %25 = add i32 %call1, -2
  %26 = zext i32 %25 to i33
  %27 = mul i33 %24, %26
  %28 = lshr i33 %27, 1
  %29 = trunc i33 %28 to i32
  %30 = add i32 %call1, %29
  br label %for.cond.cleanup10

for.cond.cleanup10:                               ; preds = %if.end, %for.cond.cleanup10.loopexit, %for.cond8.preheader
  %sum1.0.lcssa = phi i32 [ 1, %for.cond8.preheader ], [ %30, %for.cond.cleanup10.loopexit ], [ 1, %if.end ]
  %31 = load double, double* %sum, align 8, !tbaa !2
  %32 = bitcast double* %sum to i8*
  %33 = call i64 @getAddr(i8* %32)
  %call16 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), double %31)
  %call17 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0), i32 %sum1.0.lcssa)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %10) #5
  br label %cleanup

cleanup:                                          ; preds = %for.cond.cleanup10, %if.then
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #5
  call void @finish()
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally dso_local i32 @atoi(i8* nonnull %__nptr) local_unnamed_addr #4 {
entry:
  %0 = bitcast i32 (i8*)* @atoi to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %call = tail call i64 @strtol(i8* nocapture nonnull %__nptr, i8** null, i32 10) #5
  %conv = trunc i64 %call to i32
  ret i32 %conv
}

; Function Attrs: nounwind
declare dso_local i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #3

declare i64 @getAddr(i8*)

declare i64 @computeReal(i32, i64, i64, double, double, double, double, double, i64, i32)

declare void @setRealTemp(i64, i64, double)

declare i64 @getRealReturn(i64)

declare void @finish()

declare void @funcInit(i64)

declare void @funcExit(i64, i64)

declare void @init()

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
