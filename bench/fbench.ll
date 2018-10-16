; ModuleID = 'fbench.bc'
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
  store <2 x double> <double 7.621000e+03, double 0x40BAD5F47AE147AE>, <2 x double>* bitcast (double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 1) to <2 x double>*), align 8, !tbaa !2
  store <2 x double> <double 0x40B9A2D0E5604189, double 0x40B707F1A9FBE76D>, <2 x double>* bitcast (double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 3) to <2 x double>*), align 8, !tbaa !2
  store <2 x double> <double 0x40B4958E978D4FDF, double 0x40B2FD5810624DD3>, <2 x double>* bitcast (double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 5) to <2 x double>*), align 8, !tbaa !2
  store <2 x double> <double 0x40B0F47A1CAC0831, double 0x40AF00FCED916873>, <2 x double>* bitcast (double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 7) to <2 x double>*), align 8, !tbaa !2
  store i32 1000000, i32* @niter, align 4, !tbaa !6
  store double 4.000000e+00, double* @clear_aperture, align 8, !tbaa !2
  store i1 true, i1* @current_surfaces, align 2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 bitcast (double* getelementptr inbounds ([10 x [5 x double]], [10 x [5 x double]]* @s, i64 0, i64 1, i64 1) to i8*), i8* align 16 bitcast ([4 x [4 x double]]* @testcase to i8*), i64 32, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 bitcast (double* getelementptr inbounds ([10 x [5 x double]], [10 x [5 x double]]* @s, i64 0, i64 2, i64 1) to i8*), i8* align 16 bitcast (double* getelementptr inbounds ([4 x [4 x double]], [4 x [4 x double]]* @testcase, i64 0, i64 1, i64 0) to i8*), i64 32, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 bitcast (double* getelementptr inbounds ([10 x [5 x double]], [10 x [5 x double]]* @s, i64 0, i64 3, i64 1) to i8*), i8* align 16 bitcast (double* getelementptr inbounds ([4 x [4 x double]], [4 x [4 x double]]* @testcase, i64 0, i64 2, i64 0) to i8*), i64 32, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 bitcast (double* getelementptr inbounds ([10 x [5 x double]], [10 x [5 x double]]* @s, i64 0, i64 4, i64 1) to i8*), i8* align 16 bitcast (double* getelementptr inbounds ([4 x [4 x double]], [4 x [4 x double]]* @testcase, i64 0, i64 3, i64 0) to i8*), i64 32, i1 false)
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @str, i64 0, i64 0))
  %0 = load i32, i32* @niter, align 4, !tbaa !6
  %call16 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.1, i64 0, i64 0), i32 %0)
  %1 = load i32, i32* @niter, align 4, !tbaa !6
  %conv17 = sitofp i32 %1 to double
  %div = fmul fast double %conv17, 1.000000e-03
  %call18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.2, i64 0, i64 0), double %div)
  %puts169 = tail call i32 @puts(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @str.29, i64 0, i64 0))
  %puts170 = tail call i32 @puts(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @str.30, i64 0, i64 0))
  store i32 0, i32* @itercount, align 4, !tbaa !6
  %2 = load i32, i32* @niter, align 4, !tbaa !6
  %cmp22179 = icmp sgt i32 %2, 0
  br i1 %cmp22179, label %for.cond25.preheader, label %entry.for.end53_crit_edge

entry.for.end53_crit_edge:                        ; preds = %entry
  %.pre = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !tbaa !2
  %.pre193 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !tbaa !2
  br label %for.end53

for.cond25.preheader:                             ; preds = %entry, %for.end40
  store i16 0, i16* @paraxial, align 2, !tbaa !8
  br label %for.body29

for.body29:                                       ; preds = %for.cond25.preheader, %for.body29
  %3 = load double, double* @clear_aperture, align 8, !tbaa !2
  %div30 = fmul fast double %3, 5.000000e-01
  tail call fastcc void @trace_line(i32 4, double %div30)
  %4 = load i64, i64* bitcast (double* @object_distance to i64*), align 8, !tbaa !2
  %5 = load i16, i16* @paraxial, align 2, !tbaa !8
  %idxprom32 = sext i16 %5 to i64
  %arrayidx33 = getelementptr inbounds [2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 %idxprom32
  %6 = bitcast [2 x double]* %arrayidx33 to i64*
  store i64 %4, i64* %6, align 16, !tbaa !2
  %7 = load i64, i64* bitcast (double* @axis_slope_angle to i64*), align 8, !tbaa !2
  %arrayidx37 = getelementptr inbounds [2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 %idxprom32, i64 1
  %8 = bitcast double* %arrayidx37 to i64*
  store i64 %7, i64* %8, align 8, !tbaa !2
  %inc39 = add i16 %5, 1
  store i16 %inc39, i16* @paraxial, align 2, !tbaa !8
  %cmp27 = icmp slt i16 %inc39, 2
  br i1 %cmp27, label %for.body29, label %for.end40

for.end40:                                        ; preds = %for.body29
  store i16 0, i16* @paraxial, align 2, !tbaa !8
  %9 = load double, double* @clear_aperture, align 8, !tbaa !2
  %div41 = fmul fast double %9, 5.000000e-01
  tail call fastcc void @trace_line(i32 3, double %div41)
  %10 = load double, double* @object_distance, align 8, !tbaa !2
  %11 = load double, double* @clear_aperture, align 8, !tbaa !2
  %div43 = fmul fast double %11, 5.000000e-01
  tail call fastcc void @trace_line(i32 6, double %div43)
  %12 = load double, double* @object_distance, align 8, !tbaa !2
  %13 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 0), align 16, !tbaa !2
  %14 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 0), align 16, !tbaa !2
  %sub = fsub fast double %13, %14
  store double %sub, double* @aberr_lspher, align 8, !tbaa !2
  %15 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 1), align 8, !tbaa !2
  %mul = fmul fast double %15, %13
  %16 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 0, i64 1), align 8, !tbaa !2
  %17 = tail call fast double @llvm.sin.f64(double %16)
  %mul45 = fmul fast double %17, %14
  %div46 = fdiv fast double %mul, %mul45
  %sub47 = fsub fast double 1.000000e+00, %div46
  store double %sub47, double* @aberr_osc, align 8, !tbaa !2
  %sub48 = fsub fast double %12, %10
  store double %sub48, double* @aberr_lchrom, align 8, !tbaa !2
  %mul49 = fmul fast double %17, %17
  %div50 = fdiv fast double 9.260000e-05, %mul49
  store double %div50, double* @max_lspher, align 8, !tbaa !2
  store double 2.500000e-03, double* @max_osc, align 8, !tbaa !2
  store double %div50, double* @max_lchrom, align 8, !tbaa !2
  %18 = load i32, i32* @itercount, align 4, !tbaa !6
  %inc52 = add nsw i32 %18, 1
  store i32 %inc52, i32* @itercount, align 4, !tbaa !6
  %19 = load i32, i32* @niter, align 4, !tbaa !6
  %cmp22 = icmp slt i32 %inc52, %19
  br i1 %cmp22, label %for.cond25.preheader, label %for.end53

for.end53:                                        ; preds = %for.end40, %entry.for.end53_crit_edge
  %20 = phi double [ %.pre193, %entry.for.end53_crit_edge ], [ %16, %for.end40 ]
  %21 = phi double [ %.pre, %entry.for.end53_crit_edge ], [ %14, %for.end40 ]
  %call54 = tail call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i64 0, i64 0), double %21, double %20) #6
  %22 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 0), align 16, !tbaa !2
  %23 = load double, double* getelementptr inbounds ([2 x [2 x double]], [2 x [2 x double]]* @od_sa, i64 0, i64 1, i64 1), align 8, !tbaa !2
  %call55 = tail call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 1, i64 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i64 0, i64 0), double %22, double %23) #6
  %24 = load double, double* @aberr_lspher, align 8, !tbaa !2
  %call56 = tail call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 2, i64 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.8, i64 0, i64 0), double %24) #6
  %25 = load double, double* @max_lspher, align 8, !tbaa !2
  %call57 = tail call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 3, i64 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.9, i64 0, i64 0), double %25) #6
  %26 = load double, double* @aberr_osc, align 8, !tbaa !2
  %call58 = tail call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 4, i64 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.10, i64 0, i64 0), double %26) #6
  %27 = load double, double* @max_osc, align 8, !tbaa !2
  %call59 = tail call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 5, i64 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.9, i64 0, i64 0), double %27) #6
  %28 = load double, double* @aberr_lchrom, align 8, !tbaa !2
  %call60 = tail call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 6, i64 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.11, i64 0, i64 0), double %28) #6
  %29 = load double, double* @max_lchrom, align 8, !tbaa !2
  %call61 = tail call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 7, i64 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.9, i64 0, i64 0), double %29) #6
  br label %for.body65

for.body65:                                       ; preds = %for.inc123, %for.end53
  %indvars.iv182 = phi i64 [ 0, %for.end53 ], [ %.pre194, %for.inc123 ]
  %errors.0177 = phi i32 [ 0, %for.end53 ], [ %errors.3, %for.inc123 ]
  %arraydecay = getelementptr inbounds [8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 %indvars.iv182, i64 0
  %arrayidx69 = getelementptr inbounds [8 x i8*], [8 x i8*]* @refarr, i64 0, i64 %indvars.iv182
  %30 = load i8*, i8** %arrayidx69, align 8, !tbaa !10
  %call70 = tail call i32 @strcmp(i8* nonnull %arraydecay, i8* %30) #6
  %cmp71 = icmp eq i32 %call70, 0
  %.pre194 = add nuw nsw i64 %indvars.iv182, 1
  br i1 %cmp71, label %for.inc123, label %if.then

if.then:                                          ; preds = %for.body65
  %31 = trunc i64 %.pre194 to i32
  %call74 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.12, i64 0, i64 0), i32 %31)
  %call77 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.13, i64 0, i64 0), i8* %30)
  %call81 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14, i64 0, i64 0), i8* nonnull %arraydecay)
  %call82 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.15, i64 0, i64 0))
  %call85 = tail call i64 @strlen(i8* %30) #8
  %conv86 = trunc i64 %call85 to i32
  %cmp88174 = icmp sgt i32 %conv86, 0
  br i1 %cmp88174, label %for.body90.preheader, label %for.end120

for.body90.preheader:                             ; preds = %if.then
  %wide.trip.count = and i64 %call85, 4294967295
  br label %for.body90

for.body90:                                       ; preds = %for.body90, %for.body90.preheader
  %indvars.iv = phi i64 [ 0, %for.body90.preheader ], [ %indvars.iv.next, %for.body90 ]
  %errors.1175 = phi i32 [ %errors.0177, %for.body90.preheader ], [ %spec.select, %for.body90 ]
  %arrayidx94 = getelementptr inbounds i8, i8* %30, i64 %indvars.iv
  %32 = load i8, i8* %arrayidx94, align 1, !tbaa !12
  %arrayidx99 = getelementptr inbounds [8 x [80 x i8]], [8 x [80 x i8]]* @outarr, i64 0, i64 %indvars.iv182, i64 %indvars.iv
  %33 = load i8, i8* %arrayidx99, align 1, !tbaa !12
  %cmp101 = icmp eq i8 %32, %33
  %cond = select i1 %cmp101, i32 32, i32 94
  %putchar172 = tail call i32 @putchar(i32 %cond)
  %34 = load i8, i8* %arrayidx94, align 1, !tbaa !12
  %35 = load i8, i8* %arrayidx99, align 1, !tbaa !12
  %cmp114 = icmp ne i8 %34, %35
  %inc117 = zext i1 %cmp114 to i32
  %spec.select = add nsw i32 %errors.1175, %inc117
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end120, label %for.body90

for.end120:                                       ; preds = %for.body90, %if.then
  %errors.1.lcssa = phi i32 [ %errors.0177, %if.then ], [ %spec.select, %for.body90 ]
  %putchar = tail call i32 @putchar(i32 10)
  br label %for.inc123

for.inc123:                                       ; preds = %for.body65, %for.end120
  %errors.3 = phi i32 [ %errors.1.lcssa, %for.end120 ], [ %errors.0177, %for.body65 ]
  %exitcond185 = icmp eq i64 %.pre194, 8
  br i1 %exitcond185, label %for.end125, label %for.body65

for.end125:                                       ; preds = %for.inc123
  %cmp126 = icmp sgt i32 %errors.3, 0
  br i1 %cmp126, label %if.then128, label %if.else

if.then128:                                       ; preds = %for.end125
  %cmp129 = icmp eq i32 %errors.3, 1
  %cond131 = select i1 %cmp129, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.20, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.19, i64 0, i64 0)
  %call132 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.18, i64 0, i64 0), i32 %errors.3, i8* %cond131)
  br label %if.end134

if.else:                                          ; preds = %for.end125
  %puts171 = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @str.31, i64 0, i64 0))
  br label %if.end134

if.end134:                                        ; preds = %if.else, %if.then128
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define internal fastcc void @trace_line(i32 %line, double %ray_h) unnamed_addr #0 {
entry:
  store double 0.000000e+00, double* @object_distance, align 8, !tbaa !2
  %.b361 = load i1, i1* @current_surfaces, align 2
  br i1 %.b361, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %0 = load double, double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 4), align 16
  %idxprom8 = sext i32 %line to i64
  %arrayidx9 = getelementptr inbounds [9 x double], [9 x double]* @spectral_line, i64 0, i64 %idxprom8
  %1 = load double, double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 3), align 8
  %2 = load double, double* getelementptr inbounds ([9 x double], [9 x double]* @spectral_line, i64 0, i64 6), align 16
  %sub10 = fsub fast double %1, %2
  %3 = fdiv fast double 1.000000e+00, %sub10
  %4 = load i16, i16* @paraxial, align 2, !tbaa !8
  %tobool.i = icmp eq i16 %4, 0
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %5 = phi double [ %.in, %for.inc ], [ 1.000000e+00, %for.body.lr.ph ]
  %6 = phi double [ %27, %for.inc ], [ %ray_h, %for.body.lr.ph ]
  %7 = phi double [ %sub26, %for.inc ], [ 0.000000e+00, %for.body.lr.ph ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 1, %for.body.lr.ph ]
  %arrayidx2 = getelementptr inbounds [10 x [5 x double]], [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 1
  %8 = load double, double* %arrayidx2, align 8, !tbaa !2
  %arrayidx5 = getelementptr inbounds [10 x [5 x double]], [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 2
  %9 = load double, double* %arrayidx5, align 8, !tbaa !2
  %cmp6 = fcmp fast ogt double %9, 1.000000e+00
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %10 = load double, double* %arrayidx9, align 8, !tbaa !2
  %sub = fsub fast double %0, %10
  %11 = fmul fast double %sub, %3
  %sub14 = fadd fast double %9, -1.000000e+00
  %arrayidx17 = getelementptr inbounds [10 x [5 x double]], [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 3
  %12 = load double, double* %arrayidx17, align 8, !tbaa !2
  %div18 = fdiv fast double %sub14, %12
  %mul = fmul fast double %11, %div18
  %add = fadd fast double %mul, %9
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %.in = phi double [ %add, %if.then ], [ %9, %for.body ]
  %cmp.i = fcmp fast une double %8, 0.000000e+00
  br i1 %tobool.i, label %if.end18.i, label %if.then.i

if.then.i:                                        ; preds = %if.end
  br i1 %cmp.i, label %if.then1.i, label %if.end13.i

if.then1.i:                                       ; preds = %if.then.i
  %cmp2.i = fcmp fast oeq double %7, 0.000000e+00
  br i1 %cmp2.i, label %if.then3.i, label %if.else.i

if.then3.i:                                       ; preds = %if.then1.i
  store double 0.000000e+00, double* @axis_slope_angle, align 8, !tbaa !2
  %div.i = fdiv fast double %6, %8
  br label %if.end.i

if.else.i:                                        ; preds = %if.then1.i
  %sub.i = fsub fast double %7, %8
  %div4.i = fdiv fast double %sub.i, %8
  %13 = load double, double* @axis_slope_angle, align 8, !tbaa !2
  %mul.i = fmul fast double %13, %div4.i
  br label %if.end.i

if.end.i:                                         ; preds = %if.else.i, %if.then3.i
  %14 = phi double [ 0.000000e+00, %if.then3.i ], [ %13, %if.else.i ]
  %iang_sin.0.i = phi double [ %div.i, %if.then3.i ], [ %mul.i, %if.else.i ]
  %div5.i = fdiv fast double %5, %.in
  %mul6.i = fmul fast double %div5.i, %iang_sin.0.i
  %add.i = fadd fast double %iang_sin.0.i, %14
  %sub7.i = fsub fast double %add.i, %mul6.i
  store double %sub7.i, double* @axis_slope_angle, align 8, !tbaa !2
  %cmp8.i = fcmp fast une double %7, 0.000000e+00
  %mul10.i = fmul fast double %14, %7
  %15 = select i1 %cmp8.i, double %mul10.i, double %6
  %div12.i = fdiv fast double %15, %sub7.i
  br label %transit_surface.exit

if.end13.i:                                       ; preds = %if.then.i
  %div14.i = fdiv fast double %.in, %5
  %mul15.i = fmul fast double %div14.i, %7
  %16 = load double, double* @axis_slope_angle, align 8, !tbaa !2
  %div16.i = fdiv fast double %5, %.in
  %mul17.i = fmul fast double %16, %div16.i
  store double %mul17.i, double* @axis_slope_angle, align 8, !tbaa !2
  br label %transit_surface.exit

if.end18.i:                                       ; preds = %if.end
  br i1 %cmp.i, label %if.then20.i, label %if.end45.i

if.then20.i:                                      ; preds = %if.end18.i
  %cmp21.i = fcmp fast oeq double %7, 0.000000e+00
  br i1 %cmp21.i, label %if.then22.i, label %if.else24.i

if.then22.i:                                      ; preds = %if.then20.i
  store double 0.000000e+00, double* @axis_slope_angle, align 8, !tbaa !2
  %div23.i = fdiv fast double %6, %8
  br label %if.end28.i

if.else24.i:                                      ; preds = %if.then20.i
  %sub25.i = fsub fast double %7, %8
  %div26.i = fdiv fast double %sub25.i, %8
  %17 = load double, double* @axis_slope_angle, align 8, !tbaa !2
  %18 = tail call fast double @llvm.sin.f64(double %17) #6
  %mul27.i = fmul fast double %18, %div26.i
  br label %if.end28.i

if.end28.i:                                       ; preds = %if.else24.i, %if.then22.i
  %19 = phi double [ 0.000000e+00, %if.then22.i ], [ %17, %if.else24.i ]
  %iang_sin.1.i = phi double [ %div23.i, %if.then22.i ], [ %mul27.i, %if.else24.i ]
  %call.i = tail call fast double @__asin_finite(double %iang_sin.1.i) #9
  %div29.i = fdiv fast double %5, %.in
  %mul30.i = fmul fast double %div29.i, %iang_sin.1.i
  %add31.i = fadd fast double %call.i, %19
  %call32.i = tail call fast double @__asin_finite(double %mul30.i) #9
  %sub33.i = fsub fast double %add31.i, %call32.i
  store double %sub33.i, double* @axis_slope_angle, align 8, !tbaa !2
  %div35.i = fmul fast double %add31.i, 5.000000e-01
  %20 = tail call fast double @llvm.sin.f64(double %div35.i) #6
  %21 = fmul fast double %20, %20
  %mul38.i = fmul fast double %21, 2.000000e+00
  %22 = tail call fast double @llvm.sin.f64(double %add31.i) #6
  %call41.i = tail call fast double @tan(double %sub33.i) #9
  %div42.i = fdiv fast double 1.000000e+00, %call41.i
  %mul43.i = fmul fast double %div42.i, %22
  %reass.add.i = fadd fast double %mul43.i, %mul38.i
  %reass.mul.i = fmul fast double %reass.add.i, %8
  br label %transit_surface.exit

if.end45.i:                                       ; preds = %if.end18.i
  %div46.i = fdiv fast double %5, %.in
  %23 = load double, double* @axis_slope_angle, align 8, !tbaa !2
  %24 = tail call fast double @llvm.sin.f64(double %23) #6
  %mul47.i = fmul fast double %24, %div46.i
  %call48.i = tail call fast double @__asin_finite(double %mul47.i) #9
  %25 = tail call fast double @llvm.cos.f64(double %call48.i) #6
  %mul51.i = fmul fast double %25, %.in
  %26 = tail call fast double @llvm.cos.f64(double %23) #6
  %mul52.i = fmul fast double %26, %5
  %div53.i = fdiv fast double %mul51.i, %mul52.i
  %mul54.i = fmul fast double %div53.i, %7
  store double %call48.i, double* @axis_slope_angle, align 8, !tbaa !2
  br label %transit_surface.exit

transit_surface.exit:                             ; preds = %if.end.i, %if.end13.i, %if.end28.i, %if.end45.i
  %27 = phi double [ %15, %if.end.i ], [ %6, %if.end13.i ], [ %6, %if.end28.i ], [ %6, %if.end45.i ]
  %28 = phi double [ %div12.i, %if.end.i ], [ %mul15.i, %if.end13.i ], [ %reass.mul.i, %if.end28.i ], [ %mul54.i, %if.end45.i ]
  %cmp20 = icmp ult i64 %indvars.iv, 4
  br i1 %cmp20, label %for.inc, label %for.end.loopexit

for.inc:                                          ; preds = %transit_surface.exit
  %arrayidx25 = getelementptr inbounds [10 x [5 x double]], [10 x [5 x double]]* @s, i64 0, i64 %indvars.iv, i64 4
  %29 = load double, double* %arrayidx25, align 8, !tbaa !2
  %sub26 = fsub fast double %28, %29
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body

for.end.loopexit:                                 ; preds = %transit_surface.exit
  store double %28, double* @object_distance, align 8, !tbaa !2
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}

; Function Attrs: nounwind readnone speculatable
declare double @llvm.sin.f64(double) #2

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind readonly
declare dso_local i64 @strlen(i8* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind readnone
declare dso_local double @__asin_finite(double) local_unnamed_addr #5

; Function Attrs: nounwind readnone
declare dso_local double @tan(double) local_unnamed_addr #5

; Function Attrs: nounwind readnone speculatable
declare double @llvm.cos.f64(double) #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #6

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #7

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { argmemonly nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { nounwind readnone }

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
