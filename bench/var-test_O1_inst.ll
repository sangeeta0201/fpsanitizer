; ModuleID = 'var-test_O1_inst.bc'
source_filename = "var-test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str.4 = private unnamed_addr constant [3 x i8] c"%e\00", align 1
@str = private unnamed_addr constant [19 x i8] c"****add starts****\00"
@str.6 = private unnamed_addr constant [21 x i8] c"****addmy starts****\00"
@str.7 = private unnamed_addr constant [19 x i8] c"****addmy ends****\00"
@str.8 = private unnamed_addr constant [20 x i8] c"****main starts****\00"
@str.9 = private unnamed_addr constant [18 x i8] c"****main ends****\00"

; Function Attrs: noinline nounwind uwtable
define dso_local double @add(double %x, double %y) local_unnamed_addr #0 {
entry:
  %0 = bitcast double (double, double)* @add to i8*
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str, i64 0, i64 0))
  %add = fadd double %x, %y
  %1 = bitcast double (double, double)* @add to i8*
  ret double %add
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local void @addmy() local_unnamed_addr #2 {
entry:
  %0 = bitcast void ()* @addmy to i8*
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.6, i64 0, i64 0))
  %puts5 = tail call i32 @puts(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.7, i64 0, i64 0))
  %1 = bitcast void ()* @addmy to i8*
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #2 {
entry:
  %0 = bitcast i32 ()* @main to i8*
  %z = alloca double, align 8
  %z1 = alloca double, align 8
  %z2 = alloca double, align 8
  %z3 = alloca double, align 8
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @str.8, i64 0, i64 0))
  %z.0.z.0..sroa_cast = bitcast double* %z to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %z.0.z.0..sroa_cast)
  %z1.0.z1.0..sroa_cast = bitcast double* %z1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %z1.0.z1.0..sroa_cast)
  %z2.0.z2.0..sroa_cast = bitcast double* %z2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %z2.0.z2.0..sroa_cast)
  %z3.0.z3.0..sroa_cast = bitcast double* %z3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %z3.0.z3.0..sroa_cast)
  %1 = bitcast double* %z1 to i8*
  call void @setRealConstant(i8* %1, double 5.000000e+00)
  store volatile double 5.000000e+00, double* %z1, align 8, !tbaa !2
  %2 = bitcast double* %z2 to i8*
  call void @setRealConstant(i8* %2, double 6.000000e+00)
  store volatile double 6.000000e+00, double* %z2, align 8, !tbaa !2
  %z1.0.z1.0. = load volatile double, double* %z1, align 8, !tbaa !2
  %z2.0.z2.0. = load volatile double, double* %z2, align 8, !tbaa !2
  %3 = bitcast double* %z1 to i8*
  %4 = bitcast double* %z2 to i8*
  %add = fadd double %z1.0.z1.0., %z2.0.z2.0.
  %5 = call i8* @computeReal(i32 12, i8* %3, i8* %4, double %z1.0.z1.0., double %z2.0.z2.0., double %add, i32 28)
  %6 = bitcast double* %z3 to i8*
  %7 = bitcast i8* %5 to i8*
  call void @setRealTemp(i8* %6, i8* %7)
  store volatile double %add, double* %z3, align 8, !tbaa !2
  tail call void @addmy()
  %z.0.z.0. = load volatile double, double* %z, align 8, !tbaa !2
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), double %z.0.z.0.)
  %puts9 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @str.9, i64 0, i64 0))
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %z3.0.z3.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %z2.0.z2.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %z1.0.z1.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %z.0.z.0..sroa_cast)
  call void @finish()
  %8 = bitcast i32 ()* @main to i8*
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #4

declare void @funcInit(i8*)

declare void @finish()

declare void @setRealConstant(i8*, double)

declare i8* @computeReal(i32, i8*, i8*, double, double, double, i32)

declare void @setRealTemp(i8*, i8*)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
