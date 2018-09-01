; ModuleID = 'struct.bc'
source_filename = "struct.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.val = type { i32, double, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%e:\00", align 1

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local double @mysqrt(%struct.val* byval nocapture readonly align 8 %val1) local_unnamed_addr #0 {
entry:
  %y = getelementptr inbounds %struct.val, %struct.val* %val1, i64 0, i32 1
  %0 = load double, double* %y, align 8, !tbaa !2
  %mul = fmul double %0, %0
  ret double %mul
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #2 {
entry:
  %val1 = alloca %struct.val, align 8
  %0 = bitcast %struct.val* %val1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %0) #4
  %x = getelementptr inbounds %struct.val, %struct.val* %val1, i64 0, i32 0
  store i32 5, i32* %x, align 8, !tbaa !8
  %y = getelementptr inbounds %struct.val, %struct.val* %val1, i64 0, i32 1
  store double 3.000000e+00, double* %y, align 8, !tbaa !2
  %z = getelementptr inbounds %struct.val, %struct.val* %val1, i64 0, i32 2
  store i32 2, i32* %z, align 8, !tbaa !9
  %call = call double @mysqrt(%struct.val* byval nonnull align 8 %val1)
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %call)
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %0) #4
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

attributes #0 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !7, i64 8}
!3 = !{!"val", !4, i64 0, !7, i64 8, !4, i64 16}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"double", !5, i64 0}
!8 = !{!3, !4, i64 0}
!9 = !{!3, !4, i64 16}
