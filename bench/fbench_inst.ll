; ModuleID = 'fbench_inst.bc'
source_filename = "fbench.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@niter = dso_local local_unnamed_addr global i32 1000, align 4
@spectral_line = internal unnamed_addr global [9 x double] zeroinitializer, align 16
@clear_aperture = internal unnamed_addr global double 0.000000e+00, align 8
@current_surfaces = internal unnamed_addr global i1 false, align 2
@testcase = internal unnamed_addr constant [4 x [4 x double]] [[4 x double] [double 2.705000e+01, double 1.513700e+00, double 6.360000e+01, double 5.200000e-01], [4 x double] [double -1.668000e+01, double 1.000000e+00, double 0.000000e+00, double 1.380000e-01], [4 x double] [double -1.668000e+01, double 1.616400e+00, double 3.670000e+01, double 3.800000e-01], [4 x double] [double -7.810000e+01, double 1.000000e+00, double 0.000000e+00, double 0.000000e+00]], align 16
@s = internal unnamed_addr global [10 x [5 x double]] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [58 x i8] c"and performance benchmark.  %d iterations will be made.\0A\0A\00", align 1
@.str.2 = private unnamed_addr constant [56 x i8] c"\0AMeasured run time in seconds should be divided by %.f\0A\00", align 1
@itercount = common dso_local local_unnamed_addr global i32 0, align 4
@paraxial = internal unnamed_addr global i16 0, align 2
@object_distance = internal unnamed_addr global double 0.000000e+00, align 8
@od_sa = internal unnamed_addr global [2 x [2 x double]] zeroinitializer, align 16
@axis_slope_angle = internal unnamed_addr global double 0.000000e+00, align 8
@aberr_lspher = internal unnamed_addr global double 0.000000e+00, align 8
@aberr_osc = internal unnamed_addr global double 0.000000e+00, align 8
@aberr_lchrom = internal unnamed_addr global double 0.000000e+00, align 8
@max_lspher = internal unnamed_addr global double 0.000000e+00, align 8
@max_osc = internal unnamed_addr global double 0.000000e+00, align 8
@max_lchrom = internal unnamed_addr global double 0.000000e+00, align 8
@outarr = internal global [8 x [80 x i8]] zeroinitializer, align 16
@.str.5 = private unnamed_addr constant [24 x i8] c"%15s   %21.11f  %14.11f\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"Marginal ray\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"Paraxial ray\00", align 1
@.str.8 = private unnamed_addr constant [48 x i8] c"Longitudinal spherical aberration:      %16.11f\00", align 1
@.str.9 = private unnamed_addr constant [48 x i8] c"    (Maximum permissible):              %16.11f\00", align 1
@.str.10 = private unnamed_addr constant [48 x i8] c"Offense against sine condition (coma):  %16.11f\00", align 1
@.str.11 = private unnamed_addr constant [48 x i8] c"Axial chromatic aberration:             %16.11f\00", align 1
@refarr = internal unnamed_addr constant [8 x i8*] [i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.25, i32 0, i32 0)], align 16
@.str.12 = private unnamed_addr constant [33 x i8] c"\0AError in results on line %d...\0A\00", align 1
@.str.13 = private unnamed_addr constant [17 x i8] c"Expected:  \22%s\22\0A\00", align 1
@.str.14 = private unnamed_addr constant [17 x i8] c"Received:  \22%s\22\0A\00", align 1
@.str.15 = private unnamed_addr constant [13 x i8] c"(Errors)    \00", align 1
@.str.18 = private unnamed_addr constant [48 x i8] c"\0A%d error%s in results.  This is VERY SERIOUS.\0A\00", align 1
@.str.19 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.20 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@ray_height = internal unnamed_addr global double 0.000000e+00, align 8
@from_index = internal unnamed_addr global double 0.000000e+00, align 8
@radius_of_curvature = internal unnamed_addr global double 0.000000e+00, align 8
@to_index = internal unnamed_addr global double 0.000000e+00, align 8
@.str.22 = private unnamed_addr constant [56 x i8] c"   Marginal ray          47.09479120920   0.04178472683\00", align 1
@.str.23 = private unnamed_addr constant [56 x i8] c"   Paraxial ray          47.08372160249   0.04177864821\00", align 1
@.str.24 = private unnamed_addr constant [57 x i8] c"Longitudinal spherical aberration:        -0.01106960671\00", align 1
@.str.25 = private unnamed_addr constant [57 x i8] c"    (Maximum permissible):                 0.05306749907\00", align 1
@.str.26 = private unnamed_addr constant [57 x i8] c"Offense against sine condition (coma):     0.00008954761\00", align 1
@.str.27 = private unnamed_addr constant [57 x i8] c"    (Maximum permissible):                 0.00250000000\00", align 1
@.str.28 = private unnamed_addr constant [57 x i8] c"Axial chromatic aberration:                0.00448229032\00", align 1
@str = private unnamed_addr constant [53 x i8] c"Ready to begin John Walker's floating point accuracy\00"
@str.29 = private unnamed_addr constant [59 x i8] c"to normalise for reporting results.  For archival results,\00"
@str.30 = private unnamed_addr constant [66 x i8] c"adjust iteration count so the benchmark runs about five minutes.\0A\00"
@str.31 = private unnamed_addr constant [23 x i8] c"\0ANo errors in results.\00"

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readnone %argv) local_unnamed_addr #0 {
entry:
  %0 = bitcast i32 (i32, i8**)* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %2 = bitcast double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 1) to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @setRealConstant(i64 %3, double 7.621000e+03)
  store double 7.621000e+03, double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 1), align 8, !tbaa !2
  %4 = bitcast double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 2) to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealConstant(i64 %5, double 0x40BAD5F47AE147AE)
  store double 0x40BAD5F47AE147AE, double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 2), align 16, !tbaa !2
  %6 = bitcast double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 3) to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @setRealConstant(i64 %7, double 0x40B9A2D0E5604189)
  store double 0x40B9A2D0E5604189, double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 3), align 8, !tbaa !2
  %8 = bitcast double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 4) to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @setRealConstant(i64 %9, double 0x40B707F1A9FBE76D)
  store double 0x40B707F1A9FBE76D, double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 4), align 16, !tbaa !2
  %10 = bitcast double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 5) to i8*
  %11 = call i64 @getAddr(i8* %10)
  call void @setRealConstant(i64 %11, double 0x40B4958E978D4FDF)
  store double 0x40B4958E978D4FDF, double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 5), align 8, !tbaa !2
  %12 = bitcast double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 6) to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @setRealConstant(i64 %13, double 0x40B2FD5810624DD3)
  store double 0x40B2FD5810624DD3, double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 6), align 16, !tbaa !2
  %14 = bitcast double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 7) to i8*
  %15 = call i64 @getAddr(i8* %14)
  call void @setRealConstant(i64 %15, double 0x40B0F47A1CAC0831)
  store double 0x40B0F47A1CAC0831, double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 7), align 8, !tbaa !2
  %16 = bitcast double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 8) to i8*
  %17 = call i64 @getAddr(i8* %16)
  call void @setRealConstant(i64 %17, double 0x40AF00FCED916873)
  store double 0x40AF00FCED916873, double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 8), align 16, !tbaa !2
  %18 = bitcast i32* @niter to i8*
  store i32 1000000, i32* @niter, align 4, !tbaa !6
  %19 = bitcast double* @clear_aperture to i8*
  %20 = call i64 @getAddr(i8* %19)
  call void @setRealConstant(i64 %20, double 4.000000e+00)
  store double 4.000000e+00, double* @clear_aperture, align 8, !tbaa !2
  %21 = bitcast i1* @current_surfaces to i8*
  store i1 true, i1* @current_surfaces, align 2
  br label %for.inc13

for.inc13:                                        ; preds = %entry, %for.inc13
  %indvar = phi i64 [ 0, %entry ], [ %indvar.next, %for.inc13 ]
  %22 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [10 x [5 x double]], [10 x [5 x double]]* @s, i64 0, i64 %22, i64 1
  %scevgep191 = bitcast double* %scevgep to i8*
  %scevgep192 = getelementptr [4 x [4 x double]], [4 x [4 x double]]* @testcase, i64 0, i64 %indvar, i64 0
  %scevgep192193 = bitcast double* %scevgep192 to i8*
  %23 = bitcast i8* %scevgep191 to i8*
  %24 = bitcast i8* %scevgep192193 to i8*
  %25 = bitcast i64 32 to i64
  %26 = call i64 @getAddr(i8* %23)
  %27 = call i64 @getAddr(i8* %24)
  call void @handleLLVMMemcpy(i64 %26, i64 %27, i64 %25)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %scevgep191, i8* align 16 %scevgep192193, i64 32, i1 false)
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond194 = icmp eq i64 %indvar.next, 4
  br i1 %exitcond194, label %for.end15, label %for.inc13

for.end15:                                        ; preds = %for.inc13
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @str, i64 0, i64 0))
  %28 = bitcast i32* @niter to i8*
  %29 = call i64 @getAddr(i8* %28)
  %30 = load i32, i32* @niter, align 4, !tbaa !6
  %call16 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.1, i64 0, i64 0), i32 %30)
  %31 = bitcast i32* @niter to i8*
  %32 = call i64 @getAddr(i8* %31)
  %33 = load i32, i32* @niter, align 4, !tbaa !6
  %conv17 = sitofp i32 %33 to double
  %div = fdiv double %conv17, 1.000000e+03
  %34 = call i64 @computeReal(i32 19, i64 %32, i64 0, double %conv17, double 1.000000e+03, double %div, i32 30)
  %call18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.2, i64 0, i64 0), double %div)
  %puts171 = tail call i32 @puts(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @str.29, i64 0, i64 0))
  %puts172 = tail call i32 @puts(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @str.30, i64 0, i64 0))
  %35 = bitcast i32* @itercount to i8*
  store i32 0, i32* @itercount, align 4, !tbaa !6
  %36 = bitcast i32* @niter to i8*
  %37 = call i64 @getAddr(i8* %36)
  %38 = load i32, i32* @niter, align 4, !tbaa !6
  %cmp22181 = icmp sgt i32 %38, 0
  br i1 %cmp22181, label %for.cond25.preheader, label %for.end55

for.cond25.preheader:                             ; preds = %for.end15, %for.end40
  %39 = bitcast i16* @paraxial to i8*
  store i16 0, i16* @paraxial, align 2, !tbaa !8
  br label %for.body29

for.body29:                                       ; preds = %for.cond25.preheader, %for.body29
  %40 = bitcast double* @clear_aperture to i8*
  %41 = call i64 @getAddr(i8* %40)
  %42 = load double, double* @clear_aperture, align 8, !tbaa !2
  %div30 = fmul double %42, 5.000000e-01
  %43 = call i64 @computeReal(i32 16, i64 %41, i64 0, double %42, double 5.000000e-01, double %div30, i32 41)
  %44 = bitcast void (i32, double)* @trace_line to i8*
  %45 = call i64 @getAddr(i8* %44)
  call void @addFunArg(i32 1, i64 %45, i64 %43)
  tail call fastcc void @trace_line(i32 4, double %div30)
  %46 = bitcast i64* bitcast (double* @object_distance to i64*) to i8*
  %47 = call i64 @getAddr(i8* %46)
  %48 = load i64, i64* bitcast (double* @object_distance to i64*), align 8, !tbaa !2
  %49 = bitcast i16* @paraxial to i8*
  %50 = call i64 @getAddr(i8* %49)
  %51 = load i16, i16* @paraxial, align 2, !tbaa !8
  %idxprom32 = sext i16 %51 to i64
  %arrayidx33 = getelementptr inbounds [2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 %idxprom32
  %52 = bitcast [2 x double]* %arrayidx33 to i64*
  %53 = bitcast i64* %52 to i8*
  store i64 %48, i64* %52, align 16, !tbaa !2
  %54 = bitcast i64* bitcast (double* @axis_slope_angle to i64*) to i8*
  %55 = call i64 @getAddr(i8* %54)
  %56 = load i64, i64* bitcast (double* @axis_slope_angle to i64*), align 8, !tbaa !2
  %arrayidx37 = getelementptr inbounds [2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 %idxprom32, i64 1
  %57 = bitcast double* %arrayidx37 to i64*
  %58 = bitcast i64* %57 to i8*
  store i64 %56, i64* %57, align 8, !tbaa !2
  %inc39 = add i16 %51, 1
  %59 = bitcast i16* @paraxial to i8*
  store i16 %inc39, i16* @paraxial, align 2, !tbaa !8
  %cmp27 = icmp slt i16 %inc39, 2
  br i1 %cmp27, label %for.body29, label %for.end40

for.end40:                                        ; preds = %for.body29
  %60 = bitcast i16* @paraxial to i8*
  store i16 0, i16* @paraxial, align 2, !tbaa !8
  %61 = bitcast double* @clear_aperture to i8*
  %62 = call i64 @getAddr(i8* %61)
  %63 = load double, double* @clear_aperture, align 8, !tbaa !2
  %div41 = fmul double %63, 5.000000e-01
  %64 = call i64 @computeReal(i32 16, i64 %62, i64 0, double %63, double 5.000000e-01, double %div41, i32 59)
  %65 = bitcast void (i32, double)* @trace_line to i8*
  %66 = call i64 @getAddr(i8* %65)
  call void @addFunArg(i32 1, i64 %66, i64 %64)
  tail call fastcc void @trace_line(i32 3, double %div41)
  %67 = bitcast double* @object_distance to i8*
  %68 = call i64 @getAddr(i8* %67)
  %69 = load double, double* @object_distance, align 8, !tbaa !2
  %70 = bitcast double* @clear_aperture to i8*
  %71 = call i64 @getAddr(i8* %70)
  %72 = load double, double* @clear_aperture, align 8, !tbaa !2
  %div43 = fmul double %72, 5.000000e-01
  %73 = call i64 @computeReal(i32 16, i64 %71, i64 0, double %72, double 5.000000e-01, double %div43, i32 63)
  %74 = bitcast void (i32, double)* @trace_line to i8*
  %75 = call i64 @getAddr(i8* %74)
  call void @addFunArg(i32 1, i64 %75, i64 %73)
  tail call fastcc void @trace_line(i32 6, double %div43)
  %76 = bitcast double* @object_distance to i8*
  %77 = call i64 @getAddr(i8* %76)
  %78 = load double, double* @object_distance, align 8, !tbaa !2
  %79 = bitcast double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 0) to i8*
  %80 = call i64 @getAddr(i8* %79)
  %81 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 0), align 16, !tbaa !2
  %82 = bitcast double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0) to i8*
  %83 = call i64 @getAddr(i8* %82)
  %84 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !tbaa !2
  %sub = fsub double %81, %84
  %85 = call i64 @computeReal(i32 14, i64 %80, i64 %83, double %81, double %84, double %sub, i32 68)
  %86 = bitcast double* @aberr_lspher to i8*
  %87 = call i64 @getAddr(i8* %86)
  call void @setRealTemp(i64 %87, i64 %85)
  store double %sub, double* @aberr_lspher, align 8, !tbaa !2
  %88 = bitcast double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 1) to i8*
  %89 = call i64 @getAddr(i8* %88)
  %90 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 1), align 8, !tbaa !2
  %mul = fmul double %81, %90
  %91 = call i64 @computeReal(i32 16, i64 %80, i64 %89, double %81, double %90, double %mul, i32 71)
  %92 = bitcast double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1) to i8*
  %93 = call i64 @getAddr(i8* %92)
  %94 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !tbaa !2
  %call45 = tail call double @sin(double %94) #4
  %95 = call i64 @handleMathFunc(i32 4, double %94, i64 %93, double %call45, i32 73)
  %96 = bitcast double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0) to i8*
  %97 = call i64 @getAddr(i8* %96)
  %98 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !tbaa !2
  %mul46 = fmul double %call45, %98
  %99 = call i64 @computeReal(i32 16, i64 %95, i64 %97, double %call45, double %98, double %mul46, i32 75)
  %div47 = fdiv double %mul, %mul46
  %100 = call i64 @computeReal(i32 19, i64 %91, i64 %99, double %mul, double %mul46, double %div47, i32 76)
  %sub48 = fsub double 1.000000e+00, %div47
  %101 = call i64 @computeReal(i32 14, i64 0, i64 %100, double 1.000000e+00, double %div47, double %sub48, i32 77)
  %102 = bitcast double* @aberr_osc to i8*
  %103 = call i64 @getAddr(i8* %102)
  call void @setRealTemp(i64 %103, i64 %101)
  store double %sub48, double* @aberr_osc, align 8, !tbaa !2
  %sub49 = fsub double %78, %69
  %104 = call i64 @computeReal(i32 14, i64 %77, i64 %68, double %78, double %69, double %sub49, i32 79)
  %105 = bitcast double* @aberr_lchrom to i8*
  %106 = call i64 @getAddr(i8* %105)
  call void @setRealTemp(i64 %106, i64 %104)
  store double %sub49, double* @aberr_lchrom, align 8, !tbaa !2
  %107 = bitcast double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1) to i8*
  %108 = call i64 @getAddr(i8* %107)
  %109 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !tbaa !2
  %call50 = tail call double @sin(double %109) #4
  %110 = call i64 @handleMathFunc(i32 4, double %109, i64 %108, double %call50, i32 82)
  %mul51 = fmul double %call50, %call50
  %111 = call i64 @computeReal(i32 16, i64 %110, i64 %110, double %call50, double %call50, double %mul51, i32 83)
  %div52 = fdiv double 9.260000e-05, %mul51
  %112 = call i64 @computeReal(i32 19, i64 0, i64 %111, double 9.260000e-05, double %mul51, double %div52, i32 84)
  %113 = bitcast double* @max_lspher to i8*
  %114 = call i64 @getAddr(i8* %113)
  call void @setRealTemp(i64 %114, i64 %112)
  store double %div52, double* @max_lspher, align 8, !tbaa !2
  %115 = bitcast double* @max_osc to i8*
  %116 = call i64 @getAddr(i8* %115)
  call void @setRealConstant(i64 %116, double 2.500000e-03)
  store double 2.500000e-03, double* @max_osc, align 8, !tbaa !2
  %117 = bitcast double* @max_lchrom to i8*
  %118 = call i64 @getAddr(i8* %117)
  call void @setRealTemp(i64 %118, i64 %112)
  store double %div52, double* @max_lchrom, align 8, !tbaa !2
  %119 = bitcast i32* @itercount to i8*
  %120 = call i64 @getAddr(i8* %119)
  %121 = load i32, i32* @itercount, align 4, !tbaa !6
  %inc54 = add nsw i32 %121, 1
  %122 = bitcast i32* @itercount to i8*
  store i32 %inc54, i32* @itercount, align 4, !tbaa !6
  %123 = bitcast i32* @niter to i8*
  %124 = call i64 @getAddr(i8* %123)
  %125 = load i32, i32* @niter, align 4, !tbaa !6
  %cmp22 = icmp slt i32 %inc54, %125
  br i1 %cmp22, label %for.cond25.preheader, label %for.end55

for.end55:                                        ; preds = %for.end40, %for.end15
  %126 = bitcast double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0) to i8*
  %127 = call i64 @getAddr(i8* %126)
  %128 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !tbaa !2
  %129 = bitcast double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1) to i8*
  %130 = call i64 @getAddr(i8* %129)
  %131 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !tbaa !2
  %call56 = tail call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i64 0, i64 0), double %128, double %131) #4
  %132 = bitcast double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 0) to i8*
  %133 = call i64 @getAddr(i8* %132)
  %134 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 0), align 16, !tbaa !2
  %135 = bitcast double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 1) to i8*
  %136 = call i64 @getAddr(i8* %135)
  %137 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 1), align 8, !tbaa !2
  %call57 = tail call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 1, i64 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i64 0, i64 0), double %134, double %137) #4
  %138 = bitcast double* @aberr_lspher to i8*
  %139 = call i64 @getAddr(i8* %138)
  %140 = load double, double* @aberr_lspher, align 8, !tbaa !2
  %call58 = tail call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 2, i64 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.8, i64 0, i64 0), double %140) #4
  %141 = bitcast double* @max_lspher to i8*
  %142 = call i64 @getAddr(i8* %141)
  %143 = load double, double* @max_lspher, align 8, !tbaa !2
  %call59 = tail call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 3, i64 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.9, i64 0, i64 0), double %143) #4
  %144 = bitcast double* @aberr_osc to i8*
  %145 = call i64 @getAddr(i8* %144)
  %146 = load double, double* @aberr_osc, align 8, !tbaa !2
  %call60 = tail call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 4, i64 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.10, i64 0, i64 0), double %146) #4
  %147 = bitcast double* @max_osc to i8*
  %148 = call i64 @getAddr(i8* %147)
  %149 = load double, double* @max_osc, align 8, !tbaa !2
  %call61 = tail call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 5, i64 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.9, i64 0, i64 0), double %149) #4
  %150 = bitcast double* @aberr_lchrom to i8*
  %151 = call i64 @getAddr(i8* %150)
  %152 = load double, double* @aberr_lchrom, align 8, !tbaa !2
  %call62 = tail call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 6, i64 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.11, i64 0, i64 0), double %152) #4
  %153 = bitcast double* @max_lchrom to i8*
  %154 = call i64 @getAddr(i8* %153)
  %155 = load double, double* @max_lchrom, align 8, !tbaa !2
  %call63 = tail call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 7, i64 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.9, i64 0, i64 0), double %155) #4
  br label %for.body67

for.body67:                                       ; preds = %for.inc125, %for.end55
  %indvars.iv184 = phi i64 [ 0, %for.end55 ], [ %indvars.iv.next185, %for.inc125 ]
  %errors.0179 = phi i32 [ 0, %for.end55 ], [ %errors.3, %for.inc125 ]
  %arraydecay = getelementptr inbounds [8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 %indvars.iv184, i64 0
  %arrayidx71 = getelementptr inbounds [8 x i8*], [8 x i8*]* @refarr, i64 0, i64 %indvars.iv184
  %156 = bitcast i8** %arrayidx71 to i8*
  %157 = call i64 @getAddr(i8* %156)
  %158 = load i8*, i8** %arrayidx71, align 8, !tbaa !10
  %call72 = tail call i32 @strcmp(i8* nonnull %arraydecay, i8* %158) #4
  %cmp73 = icmp eq i32 %call72, 0
  br i1 %cmp73, label %for.inc125, label %if.then

if.then:                                          ; preds = %for.body67
  %159 = trunc i64 %indvars.iv184 to i32
  %160 = add i32 %159, 1
  %call76 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.12, i64 0, i64 0), i32 %160)
  %call79 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.13, i64 0, i64 0), i8* %158)
  %call83 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14, i64 0, i64 0), i8* nonnull %arraydecay)
  %call84 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.15, i64 0, i64 0))
  %call87 = tail call i64 @strlen(i8* %158) #6
  %conv88 = trunc i64 %call87 to i32
  %cmp90176 = icmp sgt i32 %conv88, 0
  br i1 %cmp90176, label %for.body92.preheader, label %for.end122

for.body92.preheader:                             ; preds = %if.then
  %wide.trip.count = and i64 %call87, 4294967295
  br label %for.body92

for.body92:                                       ; preds = %for.body92, %for.body92.preheader
  %indvars.iv = phi i64 [ 0, %for.body92.preheader ], [ %indvars.iv.next, %for.body92 ]
  %errors.1177 = phi i32 [ %errors.0179, %for.body92.preheader ], [ %spec.select, %for.body92 ]
  %arrayidx96 = getelementptr inbounds i8, i8* %158, i64 %indvars.iv
  %161 = bitcast i8* %arrayidx96 to i8*
  %162 = call i64 @getAddr(i8* %161)
  %163 = load i8, i8* %arrayidx96, align 1, !tbaa !12
  %arrayidx101 = getelementptr inbounds [8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 %indvars.iv184, i64 %indvars.iv
  %164 = bitcast i8* %arrayidx101 to i8*
  %165 = call i64 @getAddr(i8* %164)
  %166 = load i8, i8* %arrayidx101, align 1, !tbaa !12
  %cmp103 = icmp eq i8 %163, %166
  %cond = select i1 %cmp103, i32 32, i32 94
  %putchar174 = tail call i32 @putchar(i32 %cond)
  %167 = bitcast i8* %arrayidx96 to i8*
  %168 = call i64 @getAddr(i8* %167)
  %169 = load i8, i8* %arrayidx96, align 1, !tbaa !12
  %170 = bitcast i8* %arrayidx101 to i8*
  %171 = call i64 @getAddr(i8* %170)
  %172 = load i8, i8* %arrayidx101, align 1, !tbaa !12
  %cmp116 = icmp ne i8 %169, %172
  %inc119 = zext i1 %cmp116 to i32
  %spec.select = add nsw i32 %errors.1177, %inc119
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end122, label %for.body92

for.end122:                                       ; preds = %for.body92, %if.then
  %errors.1.lcssa = phi i32 [ %errors.0179, %if.then ], [ %spec.select, %for.body92 ]
  %putchar = tail call i32 @putchar(i32 10)
  br label %for.inc125

for.inc125:                                       ; preds = %for.body67, %for.end122
  %errors.3 = phi i32 [ %errors.1.lcssa, %for.end122 ], [ %errors.0179, %for.body67 ]
  %indvars.iv.next185 = add nuw nsw i64 %indvars.iv184, 1
  %exitcond187 = icmp eq i64 %indvars.iv.next185, 8
  br i1 %exitcond187, label %for.end127, label %for.body67

for.end127:                                       ; preds = %for.inc125
  %cmp128 = icmp sgt i32 %errors.3, 0
  br i1 %cmp128, label %if.then130, label %if.else

if.then130:                                       ; preds = %for.end127
  %cmp131 = icmp eq i32 %errors.3, 1
  %cond133 = select i1 %cmp131, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.20, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.19, i64 0, i64 0)
  %call134 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.18, i64 0, i64 0), i32 %errors.3, i8* %cond133)
  br label %if.end136

if.else:                                          ; preds = %for.end127
  %puts173 = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @str.31, i64 0, i64 0))
  br label %if.end136

if.end136:                                        ; preds = %if.else, %if.then130
  %173 = bitcast i32 (i32, i8**)* @main to i8*
  %174 = call i64 @getAddr(i8* %173)
  call void @funcExit(i64 %174)
  call void @cleanComputeReal(i32 30)
  call void @cleanComputeReal(i32 41)
  call void @cleanComputeReal(i32 59)
  call void @cleanComputeReal(i32 63)
  call void @cleanComputeReal(i32 68)
  call void @cleanComputeReal(i32 71)
  call void @cleanComputeReal(i32 73)
  call void @cleanComputeReal(i32 75)
  call void @cleanComputeReal(i32 76)
  call void @cleanComputeReal(i32 77)
  call void @cleanComputeReal(i32 79)
  call void @cleanComputeReal(i32 82)
  call void @cleanComputeReal(i32 83)
  call void @cleanComputeReal(i32 84)
  call void @finish()
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define internal fastcc void @trace_line(i32 %line, double %ray_h) unnamed_addr #0 {
entry:
  %0 = bitcast void (i32, double)* @trace_line to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %2 = bitcast double* @object_distance to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @setRealConstant(i64 %3, double 0.000000e+00)
  store double 0.000000e+00, double* @object_distance, align 8, !tbaa !2
  %4 = bitcast double* @ray_height to i8*
  %5 = call i64 @getAddr(i8* %4)
  %6 = bitcast void (i32, double)* @trace_line to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @setRealFunArg(i32 3, i64 %7, i64 %5, double %ray_h)
  store double %ray_h, double* @ray_height, align 8, !tbaa !2
  %8 = bitcast double* @from_index to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @setRealConstant(i64 %9, double 1.000000e+00)
  store double 1.000000e+00, double* @from_index, align 8, !tbaa !2
  %10 = bitcast i1* @current_surfaces to i8*
  %11 = call i64 @getAddr(i8* %10)
  %.b361 = load i1, i1* @current_surfaces, align 2
  br i1 %.b361, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %idxprom8 = sext i32 %line to i64
  %arrayidx9 = getelementptr inbounds [9 x double], [9 x double]* @spectral_line, i64 0, i64 %idxprom8
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 1, %for.body.lr.ph ]
  %arrayidx2 = getelementptr inbounds [10 x [5 x double]], [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 1
  %12 = bitcast double* %arrayidx2 to i64*
  %13 = bitcast i64* %12 to i8*
  %14 = call i64 @getAddr(i8* %13)
  %15 = load i64, i64* %12, align 8, !tbaa !2
  %16 = bitcast i64* bitcast (double* @radius_of_curvature to i64*) to i8*
  store i64 %15, i64* bitcast (double* @radius_of_curvature to i64*), align 8, !tbaa !2
  %arrayidx5 = getelementptr inbounds [10 x [5 x double]], [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 2
  %17 = bitcast double* %arrayidx5 to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = load double, double* %arrayidx5, align 8, !tbaa !2
  %20 = bitcast double* @to_index to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void @setRealTemp(i64 %21, i64 %18)
  store double %19, double* @to_index, align 8, !tbaa !2
  %cmp6 = fcmp ogt double %19, 1.000000e+00
  call void @checkBranch(double %19, i64 %18, double 1.000000e+00, i64 0, i32 2, i1 %cmp6, i32 188)
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %22 = bitcast double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 4) to i8*
  %23 = call i64 @getAddr(i8* %22)
  %24 = load double, double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 4), align 16, !tbaa !2
  %25 = bitcast double* %arrayidx9 to i8*
  %26 = call i64 @getAddr(i8* %25)
  %27 = load double, double* %arrayidx9, align 8, !tbaa !2
  %sub = fsub double %24, %27
  %28 = call i64 @computeReal(i32 14, i64 %23, i64 %26, double %24, double %27, double %sub, i32 192)
  %29 = bitcast double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 3) to i8*
  %30 = call i64 @getAddr(i8* %29)
  %31 = load double, double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 3), align 8, !tbaa !2
  %32 = bitcast double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 6) to i8*
  %33 = call i64 @getAddr(i8* %32)
  %34 = load double, double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 6), align 16, !tbaa !2
  %sub10 = fsub double %31, %34
  %35 = call i64 @computeReal(i32 14, i64 %30, i64 %33, double %31, double %34, double %sub10, i32 195)
  %div = fdiv double %sub, %sub10
  %36 = call i64 @computeReal(i32 19, i64 %28, i64 %35, double %sub, double %sub10, double %div, i32 196)
  %sub14 = fadd double %19, -1.000000e+00
  %37 = call i64 @computeReal(i32 12, i64 %18, i64 0, double %19, double -1.000000e+00, double %sub14, i32 197)
  %arrayidx17 = getelementptr inbounds [10 x [5 x double]], [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 3
  %38 = bitcast double* %arrayidx17 to i8*
  %39 = call i64 @getAddr(i8* %38)
  %40 = load double, double* %arrayidx17, align 8, !tbaa !2
  %div18 = fdiv double %sub14, %40
  %41 = call i64 @computeReal(i32 19, i64 %37, i64 %39, double %sub14, double %40, double %div18, i32 200)
  %mul = fmul double %div, %div18
  %42 = call i64 @computeReal(i32 16, i64 %36, i64 %41, double %div, double %div18, double %mul, i32 201)
  %add = fadd double %19, %mul
  %43 = call i64 @computeReal(i32 12, i64 %18, i64 %42, double %19, double %mul, double %add, i32 202)
  %44 = bitcast double* @to_index to i8*
  %45 = call i64 @getAddr(i8* %44)
  call void @setRealTemp(i64 %45, i64 %43)
  store double %add, double* @to_index, align 8, !tbaa !2
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %46 = bitcast void ()* @transit_surface to i8*
  %47 = call i64 @getAddr(i8* %46)
  tail call fastcc void @transit_surface()
  %48 = bitcast i64* bitcast (double* @to_index to i64*) to i8*
  %49 = call i64 @getAddr(i8* %48)
  %50 = load i64, i64* bitcast (double* @to_index to i64*), align 8, !tbaa !2
  %51 = bitcast i64* bitcast (double* @from_index to i64*) to i8*
  store i64 %50, i64* bitcast (double* @from_index to i64*), align 8, !tbaa !2
  %52 = bitcast i1* @current_surfaces to i8*
  %53 = call i64 @getAddr(i8* %52)
  %.b = load i1, i1* @current_surfaces, align 2
  %54 = select i1 %.b, i64 4, i64 0
  %cmp20 = icmp ult i64 %indvars.iv, %54
  br i1 %cmp20, label %if.then22, label %for.inc

if.then22:                                        ; preds = %if.end
  %55 = bitcast double* @object_distance to i8*
  %56 = call i64 @getAddr(i8* %55)
  %57 = load double, double* @object_distance, align 8, !tbaa !2
  %arrayidx25 = getelementptr inbounds [10 x [5 x double]], [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 4
  %58 = bitcast double* %arrayidx25 to i8*
  %59 = call i64 @getAddr(i8* %58)
  %60 = load double, double* %arrayidx25, align 8, !tbaa !2
  %sub26 = fsub double %57, %60
  %61 = call i64 @computeReal(i32 14, i64 %56, i64 %59, double %57, double %60, double %sub26, i32 215)
  %62 = bitcast double* @object_distance to i8*
  %63 = call i64 @getAddr(i8* %62)
  call void @setRealTemp(i64 %63, i64 %61)
  store double %sub26, double* @object_distance, align 8, !tbaa !2
  br label %for.inc

for.inc:                                          ; preds = %if.end, %if.then22
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %64 = bitcast i1* @current_surfaces to i8*
  %65 = call i64 @getAddr(i8* %64)
  %.b36 = load i1, i1* @current_surfaces, align 2
  %66 = select i1 %.b36, i64 4, i64 0
  %cmp = icmp ult i64 %indvars.iv, %66
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc, %entry
  %67 = bitcast void (i32, double)* @trace_line to i8*
  %68 = call i64 @getAddr(i8* %67)
  call void @funcExit(i64 %68)
  call void @cleanComputeReal(i32 192)
  call void @cleanComputeReal(i32 195)
  call void @cleanComputeReal(i32 196)
  call void @cleanComputeReal(i32 197)
  call void @cleanComputeReal(i32 200)
  call void @cleanComputeReal(i32 201)
  call void @cleanComputeReal(i32 202)
  call void @cleanComputeReal(i32 215)
  ret void
}

; Function Attrs: nounwind
declare dso_local double @sin(double) local_unnamed_addr #1

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind readonly
declare dso_local i64 @strlen(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define internal fastcc void @transit_surface() unnamed_addr #0 {
entry:
  %0 = bitcast void ()* @transit_surface to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %2 = bitcast i16* @paraxial to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = load i16, i16* @paraxial, align 2, !tbaa !8
  %tobool = icmp eq i16 %4, 0
  %5 = bitcast double* @radius_of_curvature to i8*
  %6 = call i64 @getAddr(i8* %5)
  %7 = load double, double* @radius_of_curvature, align 8, !tbaa !2
  %cmp = fcmp une double %7, 0.000000e+00
  call void @checkBranch(double %7, i64 %6, double 0.000000e+00, i64 0, i32 14, i1 %cmp, i32 233)
  br i1 %tobool, label %if.end18, label %if.then

if.then:                                          ; preds = %entry
  %8 = bitcast double* @object_distance to i8*
  %9 = call i64 @getAddr(i8* %8)
  %10 = load double, double* @object_distance, align 8, !tbaa !2
  br i1 %cmp, label %if.then1, label %if.end13

if.then1:                                         ; preds = %if.then
  %cmp2 = fcmp oeq double %10, 0.000000e+00
  call void @checkBranch(double %10, i64 %9, double 0.000000e+00, i64 0, i32 1, i1 %cmp2, i32 237)
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.then1
  %11 = bitcast double* @axis_slope_angle to i8*
  %12 = call i64 @getAddr(i8* %11)
  call void @setRealConstant(i64 %12, double 0.000000e+00)
  store double 0.000000e+00, double* @axis_slope_angle, align 8, !tbaa !2
  %13 = bitcast double* @ray_height to i8*
  %14 = call i64 @getAddr(i8* %13)
  %15 = load double, double* @ray_height, align 8, !tbaa !2
  %div = fdiv double %15, %7
  %16 = call i64 @computeReal(i32 19, i64 %14, i64 %6, double %15, double %7, double %div, i32 241)
  br label %if.end

if.else:                                          ; preds = %if.then1
  %sub = fsub double %10, %7
  %17 = call i64 @computeReal(i32 14, i64 %9, i64 %6, double %10, double %7, double %sub, i32 243)
  %div4 = fdiv double %sub, %7
  %18 = call i64 @computeReal(i32 19, i64 %17, i64 %6, double %sub, double %7, double %div4, i32 244)
  %19 = bitcast double* @axis_slope_angle to i8*
  %20 = call i64 @getAddr(i8* %19)
  %21 = load double, double* @axis_slope_angle, align 8, !tbaa !2
  %mul = fmul double %div4, %21
  %22 = call i64 @computeReal(i32 16, i64 %18, i64 %20, double %div4, double %21, double %mul, i32 246)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then3
  %23 = phi i64 [ %16, %if.then3 ], [ %22, %if.else ]
  %iang_sin.0 = phi double [ %div, %if.then3 ], [ %mul, %if.else ]
  %24 = bitcast double* @from_index to i8*
  %25 = call i64 @getAddr(i8* %24)
  %26 = load double, double* @from_index, align 8, !tbaa !2
  %27 = bitcast double* @to_index to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load double, double* @to_index, align 8, !tbaa !2
  %div5 = fdiv double %26, %29
  %30 = call i64 @computeReal(i32 19, i64 %25, i64 %28, double %26, double %29, double %div5, i32 251)
  %mul6 = fmul double %iang_sin.0, %div5
  %31 = call i64 @computeReal(i32 16, i64 %23, i64 %30, double %iang_sin.0, double %div5, double %mul6, i32 252)
  %32 = bitcast double* @axis_slope_angle to i8*
  %33 = call i64 @getAddr(i8* %32)
  %34 = load double, double* @axis_slope_angle, align 8, !tbaa !2
  %add = fadd double %iang_sin.0, %34
  %35 = call i64 @computeReal(i32 12, i64 %23, i64 %33, double %iang_sin.0, double %34, double %add, i32 254)
  %sub7 = fsub double %add, %mul6
  %36 = call i64 @computeReal(i32 14, i64 %35, i64 %31, double %add, double %mul6, double %sub7, i32 255)
  %37 = bitcast double* @axis_slope_angle to i8*
  %38 = call i64 @getAddr(i8* %37)
  call void @setRealTemp(i64 %38, i64 %36)
  store double %sub7, double* @axis_slope_angle, align 8, !tbaa !2
  %cmp8 = fcmp une double %10, 0.000000e+00
  call void @checkBranch(double %10, i64 %9, double 0.000000e+00, i64 0, i32 14, i1 %cmp8, i32 257)
  br i1 %cmp8, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end
  %mul10 = fmul double %10, %34
  %39 = call i64 @computeReal(i32 16, i64 %9, i64 %33, double %10, double %34, double %mul10, i32 259)
  %40 = bitcast double* @ray_height to i8*
  %41 = call i64 @getAddr(i8* %40)
  call void @setRealTemp(i64 %41, i64 %39)
  store double %mul10, double* @ray_height, align 8, !tbaa !2
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.end
  %42 = bitcast double* @ray_height to i8*
  %43 = call i64 @getAddr(i8* %42)
  %44 = load double, double* @ray_height, align 8, !tbaa !2
  %div12 = fdiv double %44, %sub7
  %45 = call i64 @computeReal(i32 19, i64 %43, i64 %36, double %44, double %sub7, double %div12, i32 263)
  %46 = bitcast double* @object_distance to i8*
  %47 = call i64 @getAddr(i8* %46)
  call void @setRealTemp(i64 %47, i64 %45)
  store double %div12, double* @object_distance, align 8, !tbaa !2
  br label %cleanup

if.end13:                                         ; preds = %if.then
  %48 = bitcast double* @to_index to i8*
  %49 = call i64 @getAddr(i8* %48)
  %50 = load double, double* @to_index, align 8, !tbaa !2
  %51 = bitcast double* @from_index to i8*
  %52 = call i64 @getAddr(i8* %51)
  %53 = load double, double* @from_index, align 8, !tbaa !2
  %div14 = fdiv double %50, %53
  %54 = call i64 @computeReal(i32 19, i64 %49, i64 %52, double %50, double %53, double %div14, i32 268)
  %mul15 = fmul double %10, %div14
  %55 = call i64 @computeReal(i32 16, i64 %9, i64 %54, double %10, double %div14, double %mul15, i32 269)
  %56 = bitcast double* @object_distance to i8*
  %57 = call i64 @getAddr(i8* %56)
  call void @setRealTemp(i64 %57, i64 %55)
  store double %mul15, double* @object_distance, align 8, !tbaa !2
  %58 = bitcast double* @axis_slope_angle to i8*
  %59 = call i64 @getAddr(i8* %58)
  %60 = load double, double* @axis_slope_angle, align 8, !tbaa !2
  %div16 = fdiv double %53, %50
  %61 = call i64 @computeReal(i32 19, i64 %52, i64 %49, double %53, double %50, double %div16, i32 272)
  %mul17 = fmul double %div16, %60
  %62 = call i64 @computeReal(i32 16, i64 %61, i64 %59, double %div16, double %60, double %mul17, i32 273)
  %63 = bitcast double* @axis_slope_angle to i8*
  %64 = call i64 @getAddr(i8* %63)
  call void @setRealTemp(i64 %64, i64 %62)
  store double %mul17, double* @axis_slope_angle, align 8, !tbaa !2
  br label %cleanup

if.end18:                                         ; preds = %entry
  br i1 %cmp, label %if.then20, label %if.end48

if.then20:                                        ; preds = %if.end18
  %65 = bitcast double* @object_distance to i8*
  %66 = call i64 @getAddr(i8* %65)
  %67 = load double, double* @object_distance, align 8, !tbaa !2
  %cmp21 = fcmp oeq double %67, 0.000000e+00
  call void @checkBranch(double %67, i64 %66, double 0.000000e+00, i64 0, i32 1, i1 %cmp21, i32 278)
  br i1 %cmp21, label %if.then22, label %if.else24

if.then22:                                        ; preds = %if.then20
  %68 = bitcast double* @axis_slope_angle to i8*
  %69 = call i64 @getAddr(i8* %68)
  call void @setRealConstant(i64 %69, double 0.000000e+00)
  store double 0.000000e+00, double* @axis_slope_angle, align 8, !tbaa !2
  %70 = bitcast double* @ray_height to i8*
  %71 = call i64 @getAddr(i8* %70)
  %72 = load double, double* @ray_height, align 8, !tbaa !2
  %div23 = fdiv double %72, %7
  %73 = call i64 @computeReal(i32 19, i64 %71, i64 %6, double %72, double %7, double %div23, i32 282)
  br label %if.end28

if.else24:                                        ; preds = %if.then20
  %sub25 = fsub double %67, %7
  %74 = call i64 @computeReal(i32 14, i64 %66, i64 %6, double %67, double %7, double %sub25, i32 284)
  %div26 = fdiv double %sub25, %7
  %75 = call i64 @computeReal(i32 19, i64 %74, i64 %6, double %sub25, double %7, double %div26, i32 285)
  %76 = bitcast double* @axis_slope_angle to i8*
  %77 = call i64 @getAddr(i8* %76)
  %78 = load double, double* @axis_slope_angle, align 8, !tbaa !2
  %call = tail call double @sin(double %78) #4
  %79 = call i64 @handleMathFunc(i32 4, double %78, i64 %77, double %call, i32 287)
  %mul27 = fmul double %div26, %call
  %80 = call i64 @computeReal(i32 16, i64 %75, i64 %79, double %div26, double %call, double %mul27, i32 288)
  br label %if.end28

if.end28:                                         ; preds = %if.else24, %if.then22
  %81 = phi i64 [ %73, %if.then22 ], [ %80, %if.else24 ]
  %iang_sin.1 = phi double [ %div23, %if.then22 ], [ %mul27, %if.else24 ]
  %call29 = tail call double @asin(double %iang_sin.1) #4
  %82 = call i64 @handleMathFunc(i32 10, double %iang_sin.1, i64 %81, double %call29, i32 291)
  %83 = bitcast double* @from_index to i8*
  %84 = call i64 @getAddr(i8* %83)
  %85 = load double, double* @from_index, align 8, !tbaa !2
  %86 = bitcast double* @to_index to i8*
  %87 = call i64 @getAddr(i8* %86)
  %88 = load double, double* @to_index, align 8, !tbaa !2
  %div30 = fdiv double %85, %88
  %89 = call i64 @computeReal(i32 19, i64 %84, i64 %87, double %85, double %88, double %div30, i32 294)
  %mul31 = fmul double %iang_sin.1, %div30
  %90 = call i64 @computeReal(i32 16, i64 %81, i64 %89, double %iang_sin.1, double %div30, double %mul31, i32 295)
  %91 = bitcast double* @axis_slope_angle to i8*
  %92 = call i64 @getAddr(i8* %91)
  %93 = load double, double* @axis_slope_angle, align 8, !tbaa !2
  %add32 = fadd double %call29, %93
  %94 = call i64 @computeReal(i32 12, i64 %82, i64 %92, double %call29, double %93, double %add32, i32 297)
  %call33 = tail call double @asin(double %mul31) #4
  %95 = call i64 @handleMathFunc(i32 10, double %mul31, i64 %90, double %call33, i32 298)
  %sub34 = fsub double %add32, %call33
  %96 = call i64 @computeReal(i32 14, i64 %94, i64 %95, double %add32, double %call33, double %sub34, i32 299)
  %97 = bitcast double* @axis_slope_angle to i8*
  %98 = call i64 @getAddr(i8* %97)
  call void @setRealTemp(i64 %98, i64 %96)
  store double %sub34, double* @axis_slope_angle, align 8, !tbaa !2
  %div36 = fmul double %add32, 5.000000e-01
  %99 = call i64 @computeReal(i32 16, i64 %94, i64 0, double %add32, double 5.000000e-01, double %div36, i32 301)
  %call37 = tail call double @sin(double %div36) #4
  %100 = call i64 @handleMathFunc(i32 4, double %div36, i64 %99, double %call37, i32 302)
  %101 = bitcast double* @radius_of_curvature to i8*
  %102 = call i64 @getAddr(i8* %101)
  %103 = load double, double* @radius_of_curvature, align 8, !tbaa !2
  %mul38 = fmul double %103, 2.000000e+00
  %104 = call i64 @computeReal(i32 16, i64 %102, i64 0, double %103, double 2.000000e+00, double %mul38, i32 304)
  %mul39 = fmul double %call37, %mul38
  %105 = call i64 @computeReal(i32 16, i64 %100, i64 %104, double %call37, double %mul38, double %mul39, i32 305)
  %mul40 = fmul double %call37, %mul39
  %106 = call i64 @computeReal(i32 16, i64 %100, i64 %105, double %call37, double %mul39, double %mul40, i32 306)
  %call42 = tail call double @sin(double %add32) #4
  %107 = call i64 @handleMathFunc(i32 4, double %add32, i64 %94, double %call42, i32 307)
  %mul43 = fmul double %103, %call42
  %108 = call i64 @computeReal(i32 16, i64 %102, i64 %107, double %103, double %call42, double %mul43, i32 308)
  %109 = bitcast double* @axis_slope_angle to i8*
  %110 = call i64 @getAddr(i8* %109)
  %111 = load double, double* @axis_slope_angle, align 8, !tbaa !2
  %call44 = tail call double @tan(double %111) #4
  %112 = call i64 @handleMathFunc(i32 3, double %111, i64 %110, double %call44, i32 310)
  %div45 = fdiv double 1.000000e+00, %call44
  %113 = call i64 @computeReal(i32 19, i64 0, i64 %112, double 1.000000e+00, double %call44, double %div45, i32 311)
  %mul46 = fmul double %mul43, %div45
  %114 = call i64 @computeReal(i32 16, i64 %108, i64 %113, double %mul43, double %div45, double %mul46, i32 312)
  %add47 = fadd double %mul40, %mul46
  %115 = call i64 @computeReal(i32 12, i64 %106, i64 %114, double %mul40, double %mul46, double %add47, i32 313)
  %116 = bitcast double* @object_distance to i8*
  %117 = call i64 @getAddr(i8* %116)
  call void @setRealTemp(i64 %117, i64 %115)
  store double %add47, double* @object_distance, align 8, !tbaa !2
  br label %cleanup

if.end48:                                         ; preds = %if.end18
  %118 = bitcast double* @from_index to i8*
  %119 = call i64 @getAddr(i8* %118)
  %120 = load double, double* @from_index, align 8, !tbaa !2
  %121 = bitcast double* @to_index to i8*
  %122 = call i64 @getAddr(i8* %121)
  %123 = load double, double* @to_index, align 8, !tbaa !2
  %div49 = fdiv double %120, %123
  %124 = call i64 @computeReal(i32 19, i64 %119, i64 %122, double %120, double %123, double %div49, i32 318)
  %125 = bitcast double* @axis_slope_angle to i8*
  %126 = call i64 @getAddr(i8* %125)
  %127 = load double, double* @axis_slope_angle, align 8, !tbaa !2
  %call50 = tail call double @sin(double %127) #4
  %128 = call i64 @handleMathFunc(i32 4, double %127, i64 %126, double %call50, i32 320)
  %mul51 = fmul double %div49, %call50
  %129 = call i64 @computeReal(i32 16, i64 %124, i64 %128, double %div49, double %call50, double %mul51, i32 321)
  %call52 = tail call double @asin(double %mul51) #4
  %130 = call i64 @handleMathFunc(i32 10, double %mul51, i64 %129, double %call52, i32 322)
  %131 = bitcast double* @object_distance to i8*
  %132 = call i64 @getAddr(i8* %131)
  %133 = load double, double* @object_distance, align 8, !tbaa !2
  %134 = bitcast double* @to_index to i8*
  %135 = call i64 @getAddr(i8* %134)
  %136 = load double, double* @to_index, align 8, !tbaa !2
  %call55 = tail call double @cos(double %call52) #4
  %137 = call i64 @handleMathFunc(i32 5, double %call52, i64 %130, double %call55, i32 325)
  %mul56 = fmul double %136, %call55
  %138 = call i64 @computeReal(i32 16, i64 %135, i64 %137, double %136, double %call55, double %mul56, i32 326)
  %139 = bitcast double* @from_index to i8*
  %140 = call i64 @getAddr(i8* %139)
  %141 = load double, double* @from_index, align 8, !tbaa !2
  %142 = bitcast double* @axis_slope_angle to i8*
  %143 = call i64 @getAddr(i8* %142)
  %144 = load double, double* @axis_slope_angle, align 8, !tbaa !2
  %call57 = tail call double @cos(double %144) #4
  %145 = call i64 @handleMathFunc(i32 5, double %144, i64 %143, double %call57, i32 329)
  %mul58 = fmul double %141, %call57
  %146 = call i64 @computeReal(i32 16, i64 %140, i64 %145, double %141, double %call57, double %mul58, i32 330)
  %div59 = fdiv double %mul56, %mul58
  %147 = call i64 @computeReal(i32 19, i64 %138, i64 %146, double %mul56, double %mul58, double %div59, i32 331)
  %mul60 = fmul double %133, %div59
  %148 = call i64 @computeReal(i32 16, i64 %132, i64 %147, double %133, double %div59, double %mul60, i32 332)
  %149 = bitcast double* @object_distance to i8*
  %150 = call i64 @getAddr(i8* %149)
  call void @setRealTemp(i64 %150, i64 %148)
  store double %mul60, double* @object_distance, align 8, !tbaa !2
  %151 = bitcast double* @axis_slope_angle to i8*
  %152 = call i64 @getAddr(i8* %151)
  call void @setRealTemp(i64 %152, i64 %130)
  store double %call52, double* @axis_slope_angle, align 8, !tbaa !2
  br label %cleanup

cleanup:                                          ; preds = %if.end48, %if.end28, %if.end13, %if.end11
  %153 = bitcast void ()* @transit_surface to i8*
  %154 = call i64 @getAddr(i8* %153)
  call void @funcExit(i64 %154)
  call void @cleanComputeReal(i32 241)
  call void @cleanComputeReal(i32 243)
  call void @cleanComputeReal(i32 244)
  call void @cleanComputeReal(i32 246)
  call void @cleanComputeReal(i32 251)
  call void @cleanComputeReal(i32 252)
  call void @cleanComputeReal(i32 254)
  call void @cleanComputeReal(i32 255)
  call void @cleanComputeReal(i32 259)
  call void @cleanComputeReal(i32 263)
  call void @cleanComputeReal(i32 268)
  call void @cleanComputeReal(i32 269)
  call void @cleanComputeReal(i32 272)
  call void @cleanComputeReal(i32 273)
  call void @cleanComputeReal(i32 282)
  call void @cleanComputeReal(i32 284)
  call void @cleanComputeReal(i32 285)
  call void @cleanComputeReal(i32 287)
  call void @cleanComputeReal(i32 288)
  call void @cleanComputeReal(i32 291)
  call void @cleanComputeReal(i32 294)
  call void @cleanComputeReal(i32 295)
  call void @cleanComputeReal(i32 297)
  call void @cleanComputeReal(i32 298)
  call void @cleanComputeReal(i32 299)
  call void @cleanComputeReal(i32 301)
  call void @cleanComputeReal(i32 302)
  call void @cleanComputeReal(i32 304)
  call void @cleanComputeReal(i32 305)
  call void @cleanComputeReal(i32 306)
  call void @cleanComputeReal(i32 307)
  call void @cleanComputeReal(i32 308)
  call void @cleanComputeReal(i32 310)
  call void @cleanComputeReal(i32 311)
  call void @cleanComputeReal(i32 312)
  call void @cleanComputeReal(i32 313)
  call void @cleanComputeReal(i32 318)
  call void @cleanComputeReal(i32 320)
  call void @cleanComputeReal(i32 321)
  call void @cleanComputeReal(i32 322)
  call void @cleanComputeReal(i32 325)
  call void @cleanComputeReal(i32 326)
  call void @cleanComputeReal(i32 329)
  call void @cleanComputeReal(i32 330)
  call void @cleanComputeReal(i32 331)
  call void @cleanComputeReal(i32 332)
  ret void
}

; Function Attrs: nounwind
declare dso_local double @asin(double) local_unnamed_addr #1

; Function Attrs: nounwind
declare dso_local double @tan(double) local_unnamed_addr #1

; Function Attrs: nounwind
declare dso_local double @cos(double) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #5

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @funcExit(i64)

declare void @setRealConstant(i64, double)

declare void @handleLLVMMemcpy(i64, i64, i64)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @addFunArg(i32, i64, i64)

declare void @setRealTemp(i64, i64)

declare i64 @handleMathFunc(i32, double, i64, double, i32)

declare void @cleanComputeReal(i32)

declare void @finish()

declare void @setRealFunArg(i32, i64, i64, double)

declare void @checkBranch(double, i64, double, i64, i32, i1, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"short", !4, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !4, i64 0}
!12 = !{!4, !4, i64 0}
