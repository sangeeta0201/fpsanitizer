; ModuleID = 'small_inst.bc'
source_filename = "small.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"y:%e\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"sum:%e\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @calcY(double* nocapture %y, double %x) local_unnamed_addr #0 {
entry:
  %0 = bitcast void (double*, double)* @calcY to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %2 = bitcast void (double*, double)* @calcY to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = call i64 @getRealFunArg(i32 1, i64 %3)
  %add = fadd double %x, 1.000000e+00
  %5 = call i64 @computeReal(i32 12, i64 %4, i64 0, double %x, double 1.000000e+00, double %x, double 1.000000e+00, double %add, i64 3, i32 0)
  %call = tail call double @sqrt(double %add) #3
  %6 = call i64 @handleMathFunc(i32 1, double %add, i64 %5, double %call, i32 1)
  %call1 = tail call double @sqrt(double %x) #3
  %7 = call i64 @handleMathFunc(i32 1, double %x, i64 0, double %call1, i32 2)
  %sub = fsub double %call, %call1
  %8 = call i64 @computeReal(i32 14, i64 %6, i64 %7, double %call, double %call1, double %call, double %call1, double %sub, i64 3, i32 3)
  %9 = bitcast void (double*, double)* @calcY to i8*
  %10 = call i64 @getAddr(i8* %9)
  %11 = call i64 @getRealFunArg(i32 0, i64 %10)
  call void @setRealTemp(i64 %11, i64 %8, double %sub)
  store double %sub, double* %y, align 8, !tbaa !2
  %12 = bitcast void (double*, double)* @calcY to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @funcExit(i64 %13, i64 0)
  ret void
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  call void @init()
  %0 = bitcast i32 ()* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %y = alloca double, align 8
  %2 = bitcast double* %y to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #3
  %3 = bitcast void (double*, double)* @calcY to i8*
  %4 = call i64 @getAddr(i8* %3)
  %5 = call i64 @getRegRes(i32 6)
  call void @addFunArg(i32 0, i64 %4, i64 %5)
  call void @calcY(double* nonnull %y, double 1.000000e+10)
  %6 = load double, double* %y, align 8, !tbaa !2
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), double %6)
  %7 = bitcast void (double*, double)* @calcY to i8*
  %8 = call i64 @getAddr(i8* %7)
  %9 = call i64 @getRegRes(i32 6)
  call void @addFunArg(i32 0, i64 %8, i64 %9)
  call void @calcY(double* nonnull %y, double 1.000000e+10)
  %10 = load double, double* %y, align 8, !tbaa !2
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), double %10)
  %11 = call i64 @getRegRes(i32 13)
  %add = fadd double %10, 1.000000e+10
  %12 = call i64 @computeReal(i32 12, i64 %11, i64 0, double %10, double 1.000000e+10, double %10, double 1.000000e+10, double %add, i64 3, i32 15)
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), double %add)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #3
  call void @finish()
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

declare i64 @getAddr(i8*)

declare i64 @getRegRes(i32)

declare void @addFunArg(i32, i64, i64)

declare i64 @getRealFunArg(i32, i64)

declare i64 @computeReal(i32, i64, i64, double, double, double, double, double, i64, i32)

declare i64 @handleMathFunc(i32, double, i64, double, i32)

declare void @setRealTemp(i64, i64, double)

declare void @finish()

declare void @funcInit(i64)

declare void @funcExit(i64, i64)

declare void @init()

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
