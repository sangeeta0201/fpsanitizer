; ModuleID = 'var-test_inst.bc'
source_filename = "var-test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline norecurse nounwind readnone uwtable
define dso_local double @add(double %x, double %y) local_unnamed_addr #0 {
entry:
  %0 = bitcast i8* null to i8*
  %1 = bitcast double (double, double)* @add to i8*
  %2 = call i64 @getAddr(i8* %1)
  call void @funcInit(i64 %2)
  %add = fadd double %x, %y
  %3 = bitcast double (double, double)* @add to i8*
  %4 = call i64 @getAddr(i8* %3)
  call void @funcExit(i64 %4)
  ret double %add
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
entry:
  %0 = bitcast i8* null to i8*
  %1 = bitcast i32 ()* @main to i8*
  %2 = call i64 @getAddr(i8* %1)
  call void @funcInit(i64 %2)
  %x = alloca double, align 8
  %3 = bitcast double* %x to i8*
  %4 = call i64 @getAddr(i8* %3)
  call void @handleAlloca(i64 %4)
  %y = alloca double, align 8
  %5 = bitcast double* %y to i8*
  %6 = call i64 @getAddr(i8* %5)
  call void @handleAlloca(i64 %6)
  %z1 = alloca double, align 8
  %7 = bitcast double* %z1 to i8*
  %8 = call i64 @getAddr(i8* %7)
  call void @handleAlloca(i64 %8)
  %z2 = alloca double, align 8
  %9 = bitcast double* %z2 to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void @handleAlloca(i64 %10)
  %z3 = alloca double, align 8
  %11 = bitcast double* %z3 to i8*
  %12 = call i64 @getAddr(i8* %11)
  call void @handleAlloca(i64 %12)
  %x.0.x.0..sroa_cast = bitcast double* %x to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %x.0.x.0..sroa_cast)
  %y.0.y.0..sroa_cast = bitcast double* %y to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %y.0.y.0..sroa_cast)
  %z1.0.z1.0..sroa_cast = bitcast double* %z1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %z1.0.z1.0..sroa_cast)
  %z2.0.z2.0..sroa_cast = bitcast double* %z2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %z2.0.z2.0..sroa_cast)
  %z3.0.z3.0..sroa_cast = bitcast double* %z3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %z3.0.z3.0..sroa_cast)
  %13 = bitcast double* %z1 to i8*
  %14 = call i64 @getAddr(i8* %13)
  call void @setRealConstant(i64 %14, double 5.000000e+00)
  store volatile double 5.000000e+00, double* %z1, align 8, !tbaa !2
  %15 = bitcast double* %z2 to i8*
  %16 = call i64 @getAddr(i8* %15)
  call void @setRealConstant(i64 %16, double 6.000000e+00)
  store volatile double 6.000000e+00, double* %z2, align 8, !tbaa !2
  %17 = bitcast double* %z1 to i8*
  %18 = call i64 @getAddr(i8* %17)
  %z1.0.z1.0. = load volatile double, double* %z1, align 8, !tbaa !2
  %19 = bitcast double* %z2 to i8*
  %20 = call i64 @getAddr(i8* %19)
  %z2.0.z2.0. = load volatile double, double* %z2, align 8, !tbaa !2
  %add = fadd double %z1.0.z1.0., %z2.0.z2.0.
  %21 = call i64 @computeReal(i32 12, i64 %18, i64 %20, double %z1.0.z1.0., double %z2.0.z2.0., double %add, i32 30)
  %22 = bitcast double* %z3 to i8*
  %23 = call i64 @getAddr(i8* %22)
  call void @setRealTemp(i64 %23, i64 %21)
  store volatile double %add, double* %z3, align 8, !tbaa !2
  %call = tail call double @add(double 4.000000e+00, double 5.000000e+00)
  %24 = bitcast double* %x to i8*
  %25 = call i64 @getAddr(i8* %24)
  call void @setRealReturn(i64 %25)
  store volatile double %call, double* %x, align 8, !tbaa !2
  %26 = bitcast double* %z3 to i8*
  %27 = call i64 @getAddr(i8* %26)
  %z3.0.z3.0. = load volatile double, double* %z3, align 8, !tbaa !2
  %28 = bitcast double (double, double)* @add to i8*
  %29 = call i64 @getAddr(i8* %28)
  call void @addFunArg(i32 1, i64 %29, i64 %27)
  %call1 = tail call double @add(double 6.000000e+00, double %z3.0.z3.0.)
  %30 = bitcast double* %y to i8*
  %31 = call i64 @getAddr(i8* %30)
  call void @setRealReturn(i64 %31)
  store volatile double %call1, double* %y, align 8, !tbaa !2
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %z3.0.z3.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %z2.0.z2.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %z1.0.z1.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %y.0.y.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %x.0.x.0..sroa_cast)
  %32 = bitcast i32 ()* @main to i8*
  %33 = call i64 @getAddr(i8* %32)
  call void @funcExit(i64 %33)
  call void @cleanComputeReal(i32 30)
  call void @finish()
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @funcExit(i64)

declare void @handleAlloca(i64)

declare void @setRealConstant(i64, double)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @setRealTemp(i64, i64)

declare void @setRealReturn(i64)

declare void @addFunArg(i32, i64, i64)

declare void @cleanComputeReal(i32)

declare void @finish()

attributes #0 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
