; ModuleID = 'test_inst.bc'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"insufficient arguments\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"The value of double is %f\0A\00", align 1

; Function Attrs: norecurse nounwind readnone uwtable
define double @foo(double, double, i32) local_unnamed_addr #0 {
  %4 = bitcast double (double, double, i32)* @foo to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @funcInit(i64 %5)
  %6 = icmp sgt i32 %2, 0
  %7 = bitcast double (double, double, i32)* @foo to i8*
  %8 = call i64 @getAddr(i8* %7)
  %9 = call i64 @getRealFunArg(i32 1, i64 %8)
  %10 = fmul double %1, 1.000000e-01
  %11 = call i64 @computeReal(i32 16, i64 %9, i64 0, double %1, double 1.000000e-01, double %1, double 1.000000e-01, double %10, i64 3, i32 1)
  %12 = bitcast double (double, double, i32)* @foo to i8*
  %13 = call i64 @getAddr(i8* %12)
  %14 = call i64 @getRealFunArg(i32 0, i64 %13)
  %15 = fadd double %10, %0
  %16 = call i64 @computeReal(i32 12, i64 %11, i64 %14, double %10, double %0, double %10, double %0, double %15, i64 3, i32 2)
  %17 = call i64 @setRealReg(i32 1, double 0.000000e+00)
  %18 = select i1 %6, i64 %16, i64 %17
  %19 = select i1 %6, double %15, double 0.000000e+00
  %20 = bitcast double (double, double, i32)* @foo to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void @funcExit(i64 %21, i64 %18)
  ret double %19
}

; Function Attrs: norecurse nounwind readnone uwtable
define double @bar(double, double, i32) local_unnamed_addr #0 {
  %4 = bitcast double (double, double, i32)* @bar to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @funcInit(i64 %5)
  %6 = icmp sgt i32 %2, 0
  %7 = bitcast double (double, double, i32)* @bar to i8*
  %8 = call i64 @getAddr(i8* %7)
  %9 = call i64 @getRealFunArg(i32 0, i64 %8)
  %10 = bitcast double (double, double, i32)* @bar to i8*
  %11 = call i64 @getAddr(i8* %10)
  %12 = call i64 @getRealFunArg(i32 1, i64 %11)
  %13 = fadd double %0, %1
  %14 = call i64 @computeReal(i32 12, i64 %9, i64 %12, double %0, double %1, double %0, double %1, double %13, i64 3, i32 6)
  %15 = fadd double %13, 1.000000e-01
  %16 = call i64 @computeReal(i32 12, i64 %14, i64 0, double %13, double 1.000000e-01, double %13, double 1.000000e-01, double %15, i64 3, i32 7)
  %17 = call i64 @setRealReg(i32 2, double 0.000000e+00)
  %18 = select i1 %6, i64 %16, i64 %17
  %19 = select i1 %6, double %15, double 0.000000e+00
  %20 = bitcast double (double, double, i32)* @bar to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void @funcExit(i64 %21, i64 %18)
  ret double %19
}

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  call void @init()
  %3 = bitcast i32 (i32, i8**)* @main to i8*
  %4 = call i64 @getAddr(i8* %3)
  call void @funcInit(i64 %4)
  %5 = icmp slt i32 %0, 3
  br i1 %5, label %6, label %8

; <label>:6:                                      ; preds = %2
  %7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0))
  br label %59

; <label>:8:                                      ; preds = %2
  %9 = getelementptr inbounds i8*, i8** %1, i64 1
  %10 = load i8*, i8** %9, align 8, !tbaa !2
  %11 = bitcast i8* %10 to i8*
  %12 = call i64 @getAddr(i8* %11)
  %13 = bitcast i32 (i8*)* @atoi to i8*
  %14 = call i64 @getAddr(i8* %13)
  %15 = tail call i32 @atoi(i8* %10) #4
  %16 = icmp sgt i32 %15, 0
  %17 = call i64 @setRealReg(i32 2, double 0.000000e+00)
  br i1 %16, label %18, label %39

; <label>:18:                                     ; preds = %8
  %19 = getelementptr inbounds i8*, i8** %1, i64 3
  %20 = load i8*, i8** %19, align 8, !tbaa !2
  %21 = bitcast i8* %20 to i8*
  %22 = call i64 @getAddr(i8* %21)
  %23 = bitcast i32 (i8*)* @atoi to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = tail call i32 @atoi(i8* %20) #4
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds i8*, i8** %1, i64 2
  %28 = load i8*, i8** %27, align 8, !tbaa !2
  %29 = bitcast i8* %28 to i8*
  %30 = call i64 @getAddr(i8* %29)
  %31 = bitcast i32 (i8*)* @atoi to i8*
  %32 = call i64 @getAddr(i8* %31)
  %33 = tail call i32 @atoi(i8* %28) #4
  %34 = sitofp i32 %33 to double
  %35 = bitcast double (double, double, i32)* @foo to i8*
  %36 = call i64 @getAddr(i8* %35)
  %37 = tail call double @foo(double %34, double %26, i32 %15)
  %38 = call i64 @setRealReg(i32 2, double 0.000000e+00)
  br label %43

; <label>:39:                                     ; preds = %43, %8
  %40 = phi i64 [ %17, %8 ], [ %56, %43 ]
  %41 = phi double [ 0.000000e+00, %8 ], [ %55, %43 ]
  %42 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i64 0, i64 0), double %41)
  br label %59

; <label>:43:                                     ; preds = %43, %18
  %44 = phi i32 [ 0, %18 ], [ %57, %43 ]
  %45 = phi i64 [ %38, %18 ], [ %56, %43 ]
  %46 = phi double [ 0.000000e+00, %18 ], [ %55, %43 ]
  %47 = bitcast double (double, double, i32)* @foo to i8*
  %48 = call i64 @getAddr(i8* %47)
  %49 = call i64 @getRealReturn(i64 %48)
  %50 = fadd double %46, %37
  %51 = call i64 @computeReal(i32 12, i64 %45, i64 %49, double %46, double %37, double %46, double %37, double %50, i64 3, i32 34)
  %52 = bitcast double (double, double, i32)* @foo to i8*
  %53 = call i64 @getAddr(i8* %52)
  %54 = call i64 @getRealReturn(i64 %53)
  %55 = fadd double %37, %50
  %56 = call i64 @computeReal(i32 12, i64 %54, i64 %51, double %37, double %50, double %37, double %50, double %55, i64 3, i32 35)
  %57 = add nuw nsw i32 %44, 1
  %58 = icmp eq i32 %57, %15
  br i1 %58, label %39, label %43

; <label>:59:                                     ; preds = %39, %6
  call void @finish()
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nonnull) local_unnamed_addr #3 {
  %2 = bitcast i32 (i8*)* @atoi to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @funcInit(i64 %3)
  %4 = tail call i64 @strtol(i8* nocapture nonnull %0, i8** null, i32 10) #5
  %5 = trunc i64 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #2

declare i64 @getRealFunArg(i32, i64)

declare i64 @getAddr(i8*)

declare i64 @computeReal(i32, i64, i64, double, double, double, double, double, i64, i32)

declare i64 @setRealReg(i32, double)

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
!1 = !{!"clang version 5.0.0-3~16.04.1 (tags/RELEASE_500/final)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
