; ModuleID = 'mini_inst.bc'
source_filename = "mini.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%e\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  call void @init()
  %x = alloca double, align 8
  %y = alloca double, align 8
  %x.0.x.0..sroa_cast = bitcast double* %x to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %x.0.x.0..sroa_cast)
  %y.0.y.0..sroa_cast = bitcast double* %y to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %y.0.y.0..sroa_cast)
  %0 = bitcast double* %x to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @setRealConstant(i64 %1, double 3.000000e+00)
  store volatile double 3.000000e+00, double* %x, align 8, !tbaa !2
  %2 = bitcast double* %x to i8*
  %3 = call i64 @fpSanLoadFromShadowMem(i8* %2, i32 7)
  %x.0.x.0. = load volatile double, double* %x, align 8, !tbaa !2
  %add = fadd double %x.0.x.0., 1.000000e+00
  %4 = call i64 @computeReal(i32 12, i64 %3, i64 0, double %x.0.x.0., double 1.000000e+00, double %add, i32 8)
  %call = tail call double @sqrt(double %add) #3
  %5 = call i64 @handleMathFunc(i32 1, double %add, i64 %4, double %call, i32 9)
  %6 = bitcast double* %y to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @setRealTemp(i64 %7, i64 %5)
  store volatile double %call, double* %y, align 8, !tbaa !2
  %8 = bitcast double* %y to i8*
  %9 = call i64 @fpSanLoadFromShadowMem(i8* %8, i32 11)
  %y.0.y.0. = load volatile double, double* %y, align 8, !tbaa !2
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %y.0.y.0.)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %y.0.y.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %x.0.x.0..sroa_cast)
  %10 = bitcast i32 ()* @main to i8*
  %11 = call i64 @getAddr(i8* %10)
  call void @funcExit(i64 %11)
  call void @finish()
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

declare void @init()

declare i64 @getAddr(i8*)

declare void @funcExit(i64)

declare void @setRealConstant(i64, double)

declare i64 @fpSanLoadFromShadowMem(i8*, i32)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare i64 @handleMathFunc(i32, double, i64, double, i32)

declare void @setRealTemp(i64, i64)

declare void @finish()

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
