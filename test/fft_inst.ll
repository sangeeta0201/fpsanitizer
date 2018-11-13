; ModuleID = 'fft_inst.bc'
source_filename = "fft.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.DFT_Coefficient = type { double, double }

@k = dso_local local_unnamed_addr global i32 20, align 4
@.str = private unnamed_addr constant [5 x i8] c"j=%d\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c" 1 ( %e ) - ( %e i)\0A\00", align 1
@.str.2 = private unnamed_addr constant [23 x i8] c"The coefficients are: \00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"( %e ) - ( %e i)\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readnone %argv) local_unnamed_addr #0 {
entry:
  call void @init()
  %0 = load i32, i32* @k, align 4, !tbaa !2
  %1 = zext i32 %0 to i64
  %vla = alloca %struct.DFT_Coefficient, i64 %1, align 16
  %vla1122 = alloca [2 x double], align 16
  %vla3123 = alloca [2 x double], align 16
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 undef)
  %real = getelementptr inbounds %struct.DFT_Coefficient, %struct.DFT_Coefficient* %vla, i64 0, i32 0
  %2 = bitcast double* %real to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %4 = bitcast double* %real to i8*
  %5 = call i64 @fpSanLoadFromShadowMem(i8* %4, i32 7)
  %6 = load double, double* %real, align 16, !tbaa !6
  %img = getelementptr inbounds %struct.DFT_Coefficient, %struct.DFT_Coefficient* %vla, i64 0, i32 1
  %7 = bitcast double* %img to i8*
  %8 = call i64 @getAddr(i8* %7)
  call void @handleAlloca(i64 %8)
  %9 = bitcast double* %img to i8*
  %10 = call i64 @fpSanLoadFromShadowMem(i8* %9, i32 9)
  %11 = load double, double* %img, align 8, !tbaa !9
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0), double %6, double %11)
  %vla8124 = alloca [2 x double], align 16
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv137 = phi i64 [ 0, %entry ], [ %indvars.iv.next138, %for.body ]
  %12 = trunc i64 %indvars.iv137 to i32
  %conv = sitofp i32 %12 to double
  %mul11 = fmul double %conv, 2.000000e+00
  %13 = call i64 @computeReal(i32 16, i64 0, i64 0, double %conv, double 2.000000e+00, double %mul11, i32 16)
  %add = fadd double %mul11, %conv
  %14 = call i64 @computeReal(i32 12, i64 %13, i64 0, double %mul11, double %conv, double %add, i32 17)
  %sub = fadd double %add, -3.000000e+00
  %15 = call i64 @computeReal(i32 12, i64 %14, i64 0, double %add, double -3.000000e+00, double %sub, i32 18)
  %arrayidx13 = getelementptr inbounds [2 x double], [2 x double]* %vla8124, i64 0, i64 %indvars.iv137
  %16 = bitcast double* %arrayidx13 to i8*
  %17 = call i64 @getAddr(i8* %16)
  call void @setRealTemp(i64 %17, i64 %15)
  store double %sub, double* %arrayidx13, align 8, !tbaa !10
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond139 = icmp eq i64 %indvars.iv.next138, 2
  br i1 %exitcond139, label %for.body17, label %for.body

for.body17:                                       ; preds = %for.body, %for.body17
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %for.body17 ], [ 0, %for.body ]
  %18 = shl nuw nsw i64 %indvars.iv133, 1
  %19 = load i32, i32* @k, align 4, !tbaa !2
  %20 = trunc i64 %18 to i32
  %mul19 = mul nsw i32 %19, %20
  %conv20 = sitofp i32 %mul19 to double
  %mul21 = fmul double %conv20, 0x400921FB53C8D4F1
  %21 = call i64 @computeReal(i32 16, i64 0, i64 0, double %conv20, double 0x400921FB53C8D4F1, double %mul21, i32 30)
  %div = fmul double %mul21, 5.000000e-01
  %22 = call i64 @computeReal(i32 16, i64 %21, i64 0, double %mul21, double 5.000000e-01, double %div, i32 31)
  %call23 = tail call double @cos(double %div) #2
  %23 = call i64 @handleMathFunc(i32 5, double %div, i64 %22, double %call23, i32 32)
  %arrayidx25 = getelementptr inbounds [2 x double], [2 x double]* %vla1122, i64 0, i64 %indvars.iv133
  %24 = bitcast double* %arrayidx25 to i8*
  %25 = call i64 @getAddr(i8* %24)
  call void @setRealTemp(i64 %25, i64 %23)
  store double %call23, double* %arrayidx25, align 8, !tbaa !10
  %26 = load i32, i32* @k, align 4, !tbaa !2
  %27 = trunc i64 %18 to i32
  %mul27 = mul nsw i32 %26, %27
  %conv28 = sitofp i32 %mul27 to double
  %mul29 = fmul double %conv28, 0x400921FB53C8D4F1
  %28 = call i64 @computeReal(i32 16, i64 0, i64 0, double %conv28, double 0x400921FB53C8D4F1, double %mul29, i32 39)
  %div31 = fmul double %mul29, 5.000000e-01
  %29 = call i64 @computeReal(i32 16, i64 %28, i64 0, double %mul29, double 5.000000e-01, double %div31, i32 40)
  %call32 = tail call double @sin(double %div31) #2
  %30 = call i64 @handleMathFunc(i32 4, double %div31, i64 %29, double %call32, i32 41)
  %arrayidx34 = getelementptr inbounds [2 x double], [2 x double]* %vla3123, i64 0, i64 %indvars.iv133
  %31 = bitcast double* %arrayidx34 to i8*
  %32 = call i64 @getAddr(i8* %31)
  call void @setRealTemp(i64 %32, i64 %30)
  store double %call32, double* %arrayidx34, align 8, !tbaa !10
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next134, 2
  br i1 %exitcond136, label %for.end37, label %for.body17

for.end37:                                        ; preds = %for.body17
  %call44 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0), double %6, double %11)
  %call45 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2, i64 0, i64 0))
  %33 = load i32, i32* @k, align 4, !tbaa !2
  %cmp47126 = icmp sgt i32 %33, 0
  br i1 %cmp47126, label %for.cond50.preheader.preheader, label %for.end82

for.cond50.preheader.preheader:                   ; preds = %for.end37
  %arrayidx57 = getelementptr inbounds [2 x double], [2 x double]* %vla1122, i64 0, i64 1
  %34 = bitcast double* %arrayidx57 to i8*
  %35 = call i64 @fpSanLoadFromShadowMem(i8* %34, i32 53)
  %36 = load double, double* %arrayidx57, align 8
  %arrayidx65 = getelementptr inbounds [2 x double], [2 x double]* %vla3123, i64 0, i64 1
  %37 = bitcast double* %arrayidx65 to i8*
  %38 = call i64 @fpSanLoadFromShadowMem(i8* %37, i32 55)
  %39 = load double, double* %arrayidx65, align 8
  br label %for.cond50.preheader

for.cond50.preheader:                             ; preds = %for.cond50.preheader.preheader, %for.end72
  %indvars.iv131 = phi i64 [ 0, %for.cond50.preheader.preheader ], [ %indvars.iv.next132, %for.end72 ]
  %real61 = getelementptr inbounds %struct.DFT_Coefficient, %struct.DFT_Coefficient* %vla, i64 %indvars.iv131, i32 0
  %40 = bitcast double* %real61 to i8*
  %41 = call i64 @getAddr(i8* %40)
  call void @handleAlloca(i64 %41)
  br label %for.body53

for.body53:                                       ; preds = %for.body53, %for.cond50.preheader
  %indvars.iv = phi i64 [ 0, %for.cond50.preheader ], [ %indvars.iv.next, %for.body53 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2
  br i1 %exitcond, label %for.end72, label %for.body53

for.end72:                                        ; preds = %for.body53
  %arrayidx55.le = getelementptr inbounds [2 x double], [2 x double]* %vla8124, i64 0, i64 %indvars.iv
  %42 = bitcast double* %arrayidx55.le to i8*
  %43 = call i64 @fpSanLoadFromShadowMem(i8* %42, i32 65)
  %44 = load double, double* %arrayidx55.le, align 8, !tbaa !10
  %img69 = getelementptr inbounds %struct.DFT_Coefficient, %struct.DFT_Coefficient* %vla, i64 %indvars.iv131, i32 1
  %45 = bitcast double* %img69 to i8*
  %46 = call i64 @getAddr(i8* %45)
  call void @handleAlloca(i64 %46)
  %mul58 = fmul double %44, %36
  %47 = call i64 @computeReal(i32 16, i64 %43, i64 %35, double %44, double %36, double %mul58, i32 67)
  %mul66 = fmul double %44, %39
  %48 = call i64 @computeReal(i32 16, i64 %43, i64 %38, double %44, double %39, double %mul66, i32 68)
  %49 = bitcast double* %real61 to i8*
  %50 = call i64 @getAddr(i8* %49)
  call void @setRealTemp(i64 %50, i64 %47)
  store double %mul58, double* %real61, align 16, !tbaa !6
  %51 = bitcast double* %img69 to i8*
  %52 = call i64 @getAddr(i8* %51)
  call void @setRealTemp(i64 %52, i64 %48)
  store double %mul66, double* %img69, align 8, !tbaa !9
  %call79 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0), double %mul58, double %mul66)
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %53 = load i32, i32* @k, align 4, !tbaa !2
  %54 = sext i32 %53 to i64
  %cmp47 = icmp slt i64 %indvars.iv.next132, %54
  br i1 %cmp47, label %for.cond50.preheader, label %for.end82

for.end82:                                        ; preds = %for.end72, %for.end37
  call void @finish()
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare dso_local double @cos(double) local_unnamed_addr #1

; Function Attrs: nounwind
declare dso_local double @sin(double) local_unnamed_addr #1

declare void @init()

declare i64 @getAddr(i8*)

declare void @handleAlloca(i64)

declare i64 @fpSanLoadFromShadowMem(i8*, i32)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @setRealTemp(i64, i64)

declare i64 @handleMathFunc(i32, double, i64, double, i32)

declare void @finish()

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !8, i64 0}
!7 = !{!"DFT_Coefficient", !8, i64 0, !8, i64 8}
!8 = !{!"double", !4, i64 0}
!9 = !{!7, !8, i64 8}
!10 = !{!8, !8, i64 0}
