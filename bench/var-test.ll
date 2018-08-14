; ModuleID = 'var-test.bc'
source_filename = "var-test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline norecurse nounwind readnone uwtable
define dso_local double @add(double %x, double %y) local_unnamed_addr #0 {
entry:
  %add = fadd double %x, %y
  ret double %add
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
entry:
  %x = alloca double, align 8
  %y = alloca double, align 8
  %z1 = alloca double, align 8
  %z2 = alloca double, align 8
  %z3 = alloca double, align 8
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
  store volatile double 5.000000e+00, double* %z1, align 8, !tbaa !2
  store volatile double 6.000000e+00, double* %z2, align 8, !tbaa !2
  %z1.0.z1.0. = load volatile double, double* %z1, align 8, !tbaa !2
  %z2.0.z2.0. = load volatile double, double* %z2, align 8, !tbaa !2
  %add = fadd double %z1.0.z1.0., %z2.0.z2.0.
  store volatile double %add, double* %z3, align 8, !tbaa !2
  %call = tail call double @add(double 4.000000e+00, double 5.000000e+00)
  store volatile double %call, double* %x, align 8, !tbaa !2
  %z3.0.z3.0. = load volatile double, double* %z3, align 8, !tbaa !2
  %call1 = tail call double @add(double 6.000000e+00, double %z3.0.z3.0.)
  store volatile double %call1, double* %y, align 8, !tbaa !2
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %z3.0.z3.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %z2.0.z2.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %z1.0.z1.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %y.0.y.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %x.0.x.0..sroa_cast)
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

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
