; ModuleID = 'small_inst.bc'
source_filename = "small.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%e\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @calcY(double* nocapture %y, double %x) local_unnamed_addr #0 {
entry:
  %0 = bitcast void (double*, double)* @calcY to i8*
  call void @funcInit(i8* %0)
  %add = fadd double %x, 1.000000e+00
  %call = tail call double @sqrt(double %add) #3
  %call1 = tail call double @sqrt(double %x) #3
  %sub = fsub double %call, %call1
  store double %sub, double* %y, align 8, !tbaa !2
  %1 = bitcast void (double*, double)* @calcY to i8*
  call void @funcExit(i8* %1)
  ret void
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %0 = bitcast i32 ()* @main to i8*
  call void @funcInit(i8* %0)
  %y = alloca double, align 8
  %1 = bitcast double* %y to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %1) #3
  call void @calcY(double* nonnull %y, double 1.000000e+10)
  call void @calcY(double* nonnull %y, double 1.000000e+10)
  %2 = load double, double* %y, align 8, !tbaa !2
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %2)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %1) #3
  %3 = bitcast i32 ()* @main to i8*
  call void @funcExit(i8* %3)
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

declare void @funcInit(i8*)

declare void @funcExit(i8*)

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
