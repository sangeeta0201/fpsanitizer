; ModuleID = 'test.bc'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"insufficient arguments\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"The value of double is %f\0A\00", align 1

; Function Attrs: norecurse nounwind readnone uwtable
define double @foo(double, double, i32) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %2, 0
  %5 = fmul double %1, 1.000000e-01
  %6 = fadd double %5, %0
  %7 = select i1 %4, double %6, double 0.000000e+00
  ret double %7
}

; Function Attrs: norecurse nounwind readnone uwtable
define double @bar(double, double, i32) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %2, 0
  %5 = fadd double %0, %1
  %6 = fadd double %5, 1.000000e-01
  %7 = select i1 %4, double %6, double 0.000000e+00
  ret double %7
}

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = icmp slt i32 %0, 3
  br i1 %3, label %4, label %6

; <label>:4:                                      ; preds = %2
  %5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0))
  br label %31

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds i8*, i8** %1, i64 1
  %8 = load i8*, i8** %7, align 8, !tbaa !2
  %9 = tail call i32 @atoi(i8* %8) #4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %21

; <label>:11:                                     ; preds = %6
  %12 = getelementptr inbounds i8*, i8** %1, i64 3
  %13 = load i8*, i8** %12, align 8, !tbaa !2
  %14 = tail call i32 @atoi(i8* %13) #4
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds i8*, i8** %1, i64 2
  %17 = load i8*, i8** %16, align 8, !tbaa !2
  %18 = tail call i32 @atoi(i8* %17) #4
  %19 = sitofp i32 %18 to double
  %20 = tail call double @foo(double %19, double %15, i32 %9)
  br label %24

; <label>:21:                                     ; preds = %24, %6
  %22 = phi double [ 0.000000e+00, %6 ], [ %28, %24 ]
  %23 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i64 0, i64 0), double %22)
  br label %31

; <label>:24:                                     ; preds = %24, %11
  %25 = phi i32 [ 0, %11 ], [ %29, %24 ]
  %26 = phi double [ 0.000000e+00, %11 ], [ %28, %24 ]
  %27 = fadd double %26, %20
  %28 = fadd double %20, %27
  %29 = add nuw nsw i32 %25, 1
  %30 = icmp eq i32 %29, %9
  br i1 %30, label %21, label %24

; <label>:31:                                     ; preds = %21, %4
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nonnull) local_unnamed_addr #3 {
  %2 = tail call i64 @strtol(i8* nocapture nonnull %0, i8** null, i32 10) #5
  %3 = trunc i64 %2 to i32
  ret i32 %3
}

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #2

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inlinehint nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 5.0.0-3~16.04.1 (tags/RELEASE_500/final)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
