; ModuleID = 'simpl-swallow-test.bc'
source_filename = "simpl-swallow-test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"z = %e\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"t = %e\0A\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"a = %e\0A\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"b = %e\0A\00", align 1

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local double @foo(double %x) local_unnamed_addr #0 {
entry:
  %mul = fmul double %x, 5.000000e+00
  %add = fadd double %mul, 1.000000e+00
  %sub = fsub double %add, %mul
  ret double %sub
}

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local double @bar(double %x, double %y) local_unnamed_addr #0 {
entry:
  %mul = fmul double %x, 5.000000e+00
  %add = fadd double %y, 1.000000e+00
  %add1 = fadd double %mul, %add
  %add3 = fadd double %mul, %y
  %sub = fsub double %add1, %add3
  ret double %sub
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readnone %argv) local_unnamed_addr #1 {
entry:
  %x = alloca double, align 8
  %y = alloca double, align 8
  %z = alloca double, align 8
  %t = alloca double, align 8
  %a = alloca double, align 8
  %b = alloca double, align 8
  %x.0.x.0..sroa_cast = bitcast double* %x to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %x.0.x.0..sroa_cast)
  %y.0.y.0..sroa_cast = bitcast double* %y to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %y.0.y.0..sroa_cast)
  %z.0.z.0..sroa_cast = bitcast double* %z to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %z.0.z.0..sroa_cast)
  %t.0.t.0..sroa_cast = bitcast double* %t to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %t.0.t.0..sroa_cast)
  store volatile double 1.000000e+00, double* %x, align 8, !tbaa !2
  store volatile double 1.000000e+16, double* %y, align 8, !tbaa !2
  %x.0.x.0. = load volatile double, double* %x, align 8, !tbaa !2
  %call = tail call double @foo(double %x.0.x.0.)
  store volatile double %call, double* %z, align 8, !tbaa !2
  %y.0.y.0. = load volatile double, double* %y, align 8, !tbaa !2
  %call1 = tail call double @foo(double %y.0.y.0.)
  store volatile double %call1, double* %t, align 8, !tbaa !2
  %z.0.z.0. = load volatile double, double* %z, align 8, !tbaa !2
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %z.0.z.0.)
  %t.0.t.0. = load volatile double, double* %t, align 8, !tbaa !2
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), double %t.0.t.0.)
  %a.0.a.0..sroa_cast = bitcast double* %a to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %a.0.a.0..sroa_cast)
  %b.0.b.0..sroa_cast = bitcast double* %b to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %b.0.b.0..sroa_cast)
  %y.0.y.0.12 = load volatile double, double* %y, align 8, !tbaa !2
  %call4 = tail call double @bar(double %y.0.y.0.12, double 8.000000e+00)
  store volatile double %call4, double* %a, align 8, !tbaa !2
  %x.0.x.0.14 = load volatile double, double* %x, align 8, !tbaa !2
  %call5 = tail call double @bar(double %x.0.x.0.14, double 9.000000e+00)
  store volatile double %call5, double* %b, align 8, !tbaa !2
  %a.0.a.0. = load volatile double, double* %a, align 8, !tbaa !2
  %call6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), double %a.0.a.0.)
  %b.0.b.0. = load volatile double, double* %b, align 8, !tbaa !2
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0), double %b.0.b.0.)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %b.0.b.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %a.0.a.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %t.0.t.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %z.0.z.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %y.0.y.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %x.0.x.0..sroa_cast)
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
