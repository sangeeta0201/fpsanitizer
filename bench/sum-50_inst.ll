; ModuleID = 'sum-50_inst.bc'
source_filename = "sum-50.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%.20g\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  call void @init()
  %0 = bitcast i32 ()* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %x = alloca double, align 8
  %x.0.x.0..sroa_cast = bitcast double* %x to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %x.0.x.0..sroa_cast)
  %2 = bitcast double* %x to i8*
  %3 = call i64 @getRegRes(i32 0)
  store volatile double 0.000000e+00, double* %x, align 8, !tbaa !2
  %x.0.x.0.5 = load volatile double, double* %x, align 8, !tbaa !2
  %4 = call i64 @getRegRes(i32 4)
  %cmp6 = fcmp olt double %x.0.x.0.5, 2.000000e+00
  call void @checkBranch(double %x.0.x.0.5, i64 %4, double 2.000000e+00, i64 0, i32 4, i1 %cmp6, i32 5, i64 0)
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %x.0.x.0.1 = load volatile double, double* %x, align 8, !tbaa !2
  %5 = call i64 @getRegRes(i32 7)
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), double %x.0.x.0.1)
  %x.0.x.0.2 = load volatile double, double* %x, align 8, !tbaa !2
  %6 = call i64 @getRegRes(i32 9)
  %add = fadd double %x.0.x.0.2, 2.000000e-01
  %7 = call i64 @computeReal(i32 12, i64 %6, i64 0, double %x.0.x.0.2, double 2.000000e-01, double %x.0.x.0.2, double 2.000000e-01, double %add, i64 3, i32 10)
  %8 = bitcast double* %x to i8*
  %9 = call i64 @getRegRes(i32 0)
  call void @setRealTemp(i64 %9, i64 %7, double %add)
  store volatile double %add, double* %x, align 8, !tbaa !2
  %x.0.x.0. = load volatile double, double* %x, align 8, !tbaa !2
  %10 = call i64 @getRegRes(i32 12)
  %cmp = fcmp olt double %x.0.x.0., 2.000000e+00
  call void @checkBranch(double %x.0.x.0., i64 %10, double 2.000000e+00, i64 0, i32 4, i1 %cmp, i32 13, i64 0)
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %x.0.x.0..sroa_cast)
  call void @finish()
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

declare i64 @getRegRes(i32)

declare void @setRealTemp(i64, i64, double)

declare void @checkBranch(double, i64, double, i64, i32, i1, i32, i64)

declare i64 @computeReal(i32, i64, i64, double, double, double, double, double, i64, i32)

declare void @finish()

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @init()

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
