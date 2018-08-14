; ModuleID = 'lbm.bc'
source_filename = "lbm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.MAIN_Param = type { i32, i8*, i32, i32, i8* }
%struct.MAIN_Time = type { double, i64, i64, %struct.tms, %struct.tms }
%struct.tms = type { i64, i64, i64, i64 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@srcGrid = internal unnamed_addr global [26000000 x double]* null, align 8
@dstGrid = internal unnamed_addr global [26000000 x double]* null, align 8
@.str = private unnamed_addr constant [14 x i8] c"timestep: %i\0A\00", align 1
@.str.2 = private unnamed_addr constant [55 x i8] c"MAIN_parseCommandLine: cannot stat obstacle file '%s'\0A\00", align 1
@.str.3 = private unnamed_addr constant [82 x i8] c"MAIN_parseCommandLine:\0A\09size of file '%s' is %i bytes\0A\09expected size is %i bytes\0A\00", align 1
@.str.4 = private unnamed_addr constant [53 x i8] c"MAIN_parseCommandLine: cannot stat result file '%s'\0A\00", align 1
@MAIN_printInfo.actionString = private unnamed_addr constant [3 x [32 x i8]] [[32 x i8] c"nothing\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"compare\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"store\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00"], align 16
@MAIN_printInfo.simTypeString = private unnamed_addr constant [3 x [32 x i8]] [[32 x i8] c"lid-driven cavity\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"channel flow\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] zeroinitializer], align 16
@.str.5 = private unnamed_addr constant [174 x i8] c"MAIN_printInfo:\0A\09grid size      : %i x %i x %i = %.2f * 10^6 Cells\0A\09nTimeSteps     : %i\0A\09result file    : %s\0A\09action         : %s\0A\09simulation type: %s\0A\09obstacle file  : %s\0A\0A\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"<none>\00", align 1
@.str.7 = private unnamed_addr constant [76 x i8] c"MAIN_stopClock:\0A\09usr: %7.2f sys: %7.2f tot: %7.2f wct: %7.2f MLUPS: %5.2f\0A\0A\00", align 1
@.str.8 = private unnamed_addr constant [49 x i8] c"LBM_allocateGrid: could not allocate %.1f MByte\0A\00", align 1
@.str.9 = private unnamed_addr constant [40 x i8] c"LBM_allocateGrid: allocated %.1f MByte\0A\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.15 = private unnamed_addr constant [138 x i8] c"LBM_showGridStatistics:\0A\09nObstacleCells: %7i nAccelCells: %7i nFluidCells: %7i\0A\09minRho: %8.4f maxRho: %8.4f mass: %e\0A\09minU: %e maxU: %e\0A\0A\00", align 1
@.str.17 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.18 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.19 = private unnamed_addr constant [10 x i8] c"%e %e %e\0A\00", align 1
@.str.20 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.21 = private unnamed_addr constant [13 x i8] c"%lf %lf %lf\0A\00", align 1
@.str.22 = private unnamed_addr constant [50 x i8] c"LBM_compareVelocityField: maxDiff = %e  ==>  %s\0A\0A\00", align 1
@.str.23 = private unnamed_addr constant [18 x i8] c"##### ERROR #####\00", align 1
@.str.24 = private unnamed_addr constant [3 x i8] c"OK\00", align 1
@str = private unnamed_addr constant [108 x i8] c"syntax: lbm <time steps> <result file> <0: nil, 1: cmp, 2: str> <0: ldc, 1: channel flow> [<obstacle file>]\00"
@str.27 = private unnamed_addr constant [31 x i8] c"LBM_performStreamCollide start\00"
@str.28 = private unnamed_addr constant [30 x i8] c"LBM_performStreamCollide ends\00"
@str.30 = private unnamed_addr constant [25 x i8] c"LBM_handleInOutFlow ends\00"
@str.33 = private unnamed_addr constant [27 x i8] c"LBM_handleInOutFlow starts\00"
@str.34 = private unnamed_addr constant [26 x i8] c"LBM_handleInOutFlow stops\00"

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %nArgs, i8** nocapture readonly %arg) local_unnamed_addr #0 {
entry:
  %actionString.i = alloca [3 x [32 x i8]], align 16
  %simTypeString.i = alloca [3 x [32 x i8]], align 16
  %param = alloca %struct.MAIN_Param, align 8
  %time = alloca %struct.MAIN_Time, align 8
  %0 = bitcast %struct.MAIN_Param* %param to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #6
  %1 = bitcast %struct.MAIN_Time* %time to i8*
  call void @llvm.lifetime.start.p0i8(i64 88, i8* nonnull %1) #6
  call void @MAIN_parseCommandLine(i32 %nArgs, i8** %arg, %struct.MAIN_Param* nonnull %param)
  %2 = getelementptr inbounds [3 x [32 x i8]], [3 x [32 x i8]]* %actionString.i, i64 0, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 96, i8* nonnull %2) #6
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %2, i8* align 16 getelementptr inbounds ([3 x [32 x i8]], [3 x [32 x i8]]* @MAIN_printInfo.actionString, i64 0, i64 0, i64 0), i64 96, i1 false) #6
  %3 = getelementptr inbounds [3 x [32 x i8]], [3 x [32 x i8]]* %simTypeString.i, i64 0, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 96, i8* nonnull %3) #6
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %3, i8* align 16 getelementptr inbounds ([3 x [32 x i8]], [3 x [32 x i8]]* @MAIN_printInfo.simTypeString, i64 0, i64 0, i64 0), i64 96, i1 false) #6
  %nTimeSteps.i = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 0
  %4 = load i32, i32* %nTimeSteps.i, align 8, !tbaa !2
  %resultFilename.i = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 1
  %5 = load i8*, i8** %resultFilename.i, align 8, !tbaa !8
  %action.i = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 2
  %6 = load i32, i32* %action.i, align 8, !tbaa !9
  %idxprom.i = zext i32 %6 to i64
  %arraydecay.i = getelementptr inbounds [3 x [32 x i8]], [3 x [32 x i8]]* %actionString.i, i64 0, i64 %idxprom.i, i64 0
  %simType.i = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 3
  %7 = load i32, i32* %simType.i, align 4, !tbaa !10
  %idxprom1.i = zext i32 %7 to i64
  %arraydecay3.i = getelementptr inbounds [3 x [32 x i8]], [3 x [32 x i8]]* %simTypeString.i, i64 0, i64 %idxprom1.i, i64 0
  %obstacleFilename.i = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 4
  %8 = load i8*, i8** %obstacleFilename.i, align 8, !tbaa !11
  %cmp.i = icmp eq i8* %8, null
  %spec.select.i = select i1 %cmp.i, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* %8
  %call.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([174 x i8], [174 x i8]* @.str.5, i64 0, i64 0), i32 100, i32 100, i32 130, double 0x3FF4CCCCCCCCCCCC, i32 %4, i8* %5, i8* nonnull %arraydecay.i, i8* nonnull %arraydecay3.i, i8* %spec.select.i) #6
  call void @llvm.lifetime.end.p0i8(i64 96, i8* nonnull %3) #6
  call void @llvm.lifetime.end.p0i8(i64 96, i8* nonnull %2) #6
  call void @MAIN_initialize(%struct.MAIN_Param* nonnull %param)
  %call.i12 = call i64 @sysconf(i32 2) #6
  %conv.i = sitofp i64 %call.i12 to double
  %div.i = fdiv double 1.000000e+00, %conv.i
  %timeScale.i = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 0
  store double %div.i, double* %timeScale.i, align 8, !tbaa !12
  %timeStart.i = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 3
  %call1.i = call i64 @times(%struct.tms* nonnull %timeStart.i) #6
  %tickStart.i = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 1
  store i64 %call1.i, i64* %tickStart.i, align 8, !tbaa !17
  %cmp24 = icmp slt i32 %4, 1
  br i1 %cmp24, label %for.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  %cmp1 = icmp eq i32 %7, 1
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %t.025 = phi i32 [ 1, %for.body.lr.ph ], [ %inc, %for.inc ]
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %9 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !18
  %arraydecay = getelementptr inbounds [26000000 x double], [26000000 x double]* %9, i64 0, i64 0
  call void @LBM_handleInOutFlow(double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %10 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !18
  %arraydecay2 = getelementptr inbounds [26000000 x double], [26000000 x double]* %10, i64 0, i64 0
  %11 = load [26000000 x double]*, [26000000 x double]** @dstGrid, align 8, !tbaa !18
  %arraydecay3 = getelementptr inbounds [26000000 x double], [26000000 x double]* %11, i64 0, i64 0
  call void @LBM_performStreamCollide(double* %arraydecay2, double* %arraydecay3)
  %12 = load i64, i64* bitcast ([26000000 x double]** @srcGrid to i64*), align 8, !tbaa !18
  %13 = load i64, i64* bitcast ([26000000 x double]** @dstGrid to i64*), align 8, !tbaa !18
  store i64 %13, i64* bitcast ([26000000 x double]** @srcGrid to i64*), align 8, !tbaa !18
  store i64 %12, i64* bitcast ([26000000 x double]** @dstGrid to i64*), align 8, !tbaa !18
  %and = and i32 %t.025, 63
  %cmp4 = icmp eq i32 %and, 0
  br i1 %cmp4, label %if.then5, label %for.inc

if.then5:                                         ; preds = %if.end
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 %t.025)
  %14 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !18
  %arraydecay6 = getelementptr inbounds [26000000 x double], [26000000 x double]* %14, i64 0, i64 0
  call void @LBM_showGridStatistics(double* %arraydecay6)
  br label %for.inc

for.inc:                                          ; preds = %if.end, %if.then5
  %inc = add nuw nsw i32 %t.025, 1
  %exitcond = icmp eq i32 %t.025, %4
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc, %entry
  %timeStop.i = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 4
  %call.i13 = call i64 @times(%struct.tms* nonnull %timeStop.i) #6
  %tickStop.i = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 2
  store i64 %call.i13, i64* %tickStop.i, align 8, !tbaa !19
  %tms_utime.i = getelementptr inbounds %struct.tms, %struct.tms* %timeStop.i, i64 0, i32 0
  %15 = load i64, i64* %tms_utime.i, align 8, !tbaa !20
  %tms_utime2.i = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 3, i32 0
  %16 = load i64, i64* %tms_utime2.i, align 8, !tbaa !21
  %sub.i = sub nsw i64 %15, %16
  %conv.i14 = sitofp i64 %sub.i to double
  %17 = load double, double* %timeScale.i, align 8, !tbaa !12
  %mul.i = fmul double %17, %conv.i14
  %tms_stime.i = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 4, i32 1
  %18 = load i64, i64* %tms_stime.i, align 8, !tbaa !22
  %tms_stime5.i = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 3, i32 1
  %19 = load i64, i64* %tms_stime5.i, align 8, !tbaa !23
  %sub6.i = sub nsw i64 %18, %19
  %conv7.i = sitofp i64 %sub6.i to double
  %mul9.i = fmul double %17, %conv7.i
  %add.i = add nsw i64 %18, %sub.i
  %sub19.i = sub i64 %add.i, %19
  %conv20.i = sitofp i64 %sub19.i to double
  %mul22.i = fmul double %17, %conv20.i
  %20 = load i64, i64* %tickStart.i, align 8, !tbaa !17
  %sub24.i = sub nsw i64 %call.i13, %20
  %conv25.i = sitofp i64 %sub24.i to double
  %mul27.i = fmul double %17, %conv25.i
  %conv28.i = sitofp i32 %4 to double
  %mul29.i = fmul double %conv28.i, 0x3FF4CCCCCCCCCCCC
  %div.i18 = fdiv double %mul29.i, %conv25.i
  %div35.i = fdiv double %div.i18, %17
  %call36.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.7, i64 0, i64 0), double %mul.i, double %mul9.i, double %mul22.i, double %mul27.i, double %div35.i) #6
  %21 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !18
  %arraydecay.i19 = getelementptr inbounds [26000000 x double], [26000000 x double]* %21, i64 0, i64 0
  call void @LBM_showGridStatistics(double* %arraydecay.i19) #6
  switch i32 %6, label %MAIN_finalize.exit [
    i32 1, label %if.end.i.thread
    i32 2, label %if.then4.i
  ]

if.end.i.thread:                                  ; preds = %for.end
  %22 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !18
  %arraydecay1.i = getelementptr inbounds [26000000 x double], [26000000 x double]* %22, i64 0, i64 0
  call void @LBM_compareVelocityField(double* %arraydecay1.i, i8* %5, i32 -1) #6
  br label %MAIN_finalize.exit

if.then4.i:                                       ; preds = %for.end
  %23 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !18
  %arraydecay5.i = getelementptr inbounds [26000000 x double], [26000000 x double]* %23, i64 0, i64 0
  call void @LBM_storeVelocityField(double* %arraydecay5.i, i8* %5, i32 -1) #6
  br label %MAIN_finalize.exit

MAIN_finalize.exit:                               ; preds = %for.end, %if.end.i.thread, %if.then4.i
  %24 = load double*, double** bitcast ([26000000 x double]** @srcGrid to double**), align 8, !tbaa !18
  %add.ptr.i.i = getelementptr inbounds double, double* %24, i64 -400000
  %25 = bitcast double* %add.ptr.i.i to i8*
  call void @free(i8* nonnull %25) #6
  store double* null, double** bitcast ([26000000 x double]** @srcGrid to double**), align 8, !tbaa !18
  %26 = load double*, double** bitcast ([26000000 x double]** @dstGrid to double**), align 8, !tbaa !18
  %add.ptr.i11.i = getelementptr inbounds double, double* %26, i64 -400000
  %27 = bitcast double* %add.ptr.i11.i to i8*
  call void @free(i8* nonnull %27) #6
  store double* null, double** bitcast ([26000000 x double]** @dstGrid to double**), align 8, !tbaa !18
  call void @llvm.lifetime.end.p0i8(i64 88, i8* nonnull %1) #6
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #6
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local void @MAIN_parseCommandLine(i32 %nArgs, i8** nocapture readonly %arg, %struct.MAIN_Param* nocapture %param) local_unnamed_addr #0 {
entry:
  %fileStat = alloca %struct.stat, align 8
  %0 = bitcast %struct.stat* %fileStat to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %0) #6
  %nArgs.off = add i32 %nArgs, -5
  %1 = icmp ugt i32 %nArgs.off, 1
  br i1 %1, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([108 x i8], [108 x i8]* @str, i64 0, i64 0))
  tail call void @exit(i32 1) #7
  unreachable

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %arg, i64 1
  %2 = load i8*, i8** %arrayidx, align 8, !tbaa !18
  %call.i = tail call i64 @strtol(i8* nocapture nonnull %2, i8** null, i32 10) #6
  %conv.i = trunc i64 %call.i to i32
  %nTimeSteps = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 0
  store i32 %conv.i, i32* %nTimeSteps, align 8, !tbaa !2
  %arrayidx3 = getelementptr inbounds i8*, i8** %arg, i64 2
  %3 = bitcast i8** %arrayidx3 to i64*
  %4 = load i64, i64* %3, align 8, !tbaa !18
  %resultFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 1
  %5 = bitcast i8** %resultFilename to i64*
  store i64 %4, i64* %5, align 8, !tbaa !8
  %arrayidx4 = getelementptr inbounds i8*, i8** %arg, i64 3
  %6 = load i8*, i8** %arrayidx4, align 8, !tbaa !18
  %call.i54 = tail call i64 @strtol(i8* nocapture nonnull %6, i8** null, i32 10) #6
  %conv.i55 = trunc i64 %call.i54 to i32
  %action = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 2
  store i32 %conv.i55, i32* %action, align 8, !tbaa !9
  %arrayidx6 = getelementptr inbounds i8*, i8** %arg, i64 4
  %7 = load i8*, i8** %arrayidx6, align 8, !tbaa !18
  %call.i56 = tail call i64 @strtol(i8* nocapture nonnull %7, i8** null, i32 10) #6
  %conv.i57 = trunc i64 %call.i56 to i32
  %simType = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 3
  store i32 %conv.i57, i32* %simType, align 4, !tbaa !10
  %cmp8 = icmp eq i32 %nArgs, 6
  br i1 %cmp8, label %if.then9, label %if.else

if.then9:                                         ; preds = %if.end
  %arrayidx10 = getelementptr inbounds i8*, i8** %arg, i64 5
  %8 = load i8*, i8** %arrayidx10, align 8, !tbaa !18
  %obstacleFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 4
  store i8* %8, i8** %obstacleFilename, align 8, !tbaa !11
  %call.i58 = call i32 @__xstat(i32 1, i8* nonnull %8, %struct.stat* nonnull %fileStat) #6
  %cmp13 = icmp eq i32 %call.i58, 0
  br i1 %cmp13, label %if.end17, label %if.then14

if.then14:                                        ; preds = %if.then9
  %9 = load i8*, i8** %obstacleFilename, align 8, !tbaa !11
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.2, i64 0, i64 0), i8* %9)
  call void @exit(i32 1) #7
  unreachable

if.end17:                                         ; preds = %if.then9
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %fileStat, i64 0, i32 8
  %10 = load i64, i64* %st_size, align 8, !tbaa !24
  %cmp18 = icmp eq i64 %10, 1313130
  br i1 %cmp18, label %if.end25, label %if.then19

if.then19:                                        ; preds = %if.end17
  %11 = load i8*, i8** %obstacleFilename, align 8, !tbaa !11
  %conv = trunc i64 %10 to i32
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([82 x i8], [82 x i8]* @.str.3, i64 0, i64 0), i8* %11, i32 %conv, i32 1313130)
  call void @exit(i32 1) #7
  unreachable

if.else:                                          ; preds = %if.end
  %obstacleFilename24 = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 4
  store i8* null, i8** %obstacleFilename24, align 8, !tbaa !11
  br label %if.end25

if.end25:                                         ; preds = %if.end17, %if.else
  %12 = load i32, i32* %action, align 8, !tbaa !9
  %cmp27 = icmp eq i32 %12, 1
  br i1 %cmp27, label %land.lhs.true, label %if.end36

land.lhs.true:                                    ; preds = %if.end25
  %13 = load i8*, i8** %resultFilename, align 8, !tbaa !8
  %call.i59 = call i32 @__xstat(i32 1, i8* nonnull %13, %struct.stat* nonnull %fileStat) #6
  %cmp31 = icmp eq i32 %call.i59, 0
  br i1 %cmp31, label %if.end36, label %if.then33

if.then33:                                        ; preds = %land.lhs.true
  %14 = load i8*, i8** %resultFilename, align 8, !tbaa !8
  %call35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.4, i64 0, i64 0), i8* %14)
  call void @exit(i32 1) #7
  unreachable

if.end36:                                         ; preds = %land.lhs.true, %if.end25
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %0) #6
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @MAIN_printInfo(%struct.MAIN_Param* nocapture readonly %param) local_unnamed_addr #0 {
entry:
  %actionString = alloca [3 x [32 x i8]], align 16
  %simTypeString = alloca [3 x [32 x i8]], align 16
  %0 = getelementptr inbounds [3 x [32 x i8]], [3 x [32 x i8]]* %actionString, i64 0, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 96, i8* nonnull %0) #6
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %0, i8* align 16 getelementptr inbounds ([3 x [32 x i8]], [3 x [32 x i8]]* @MAIN_printInfo.actionString, i64 0, i64 0, i64 0), i64 96, i1 false)
  %1 = getelementptr inbounds [3 x [32 x i8]], [3 x [32 x i8]]* %simTypeString, i64 0, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 96, i8* nonnull %1) #6
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %1, i8* align 16 getelementptr inbounds ([3 x [32 x i8]], [3 x [32 x i8]]* @MAIN_printInfo.simTypeString, i64 0, i64 0, i64 0), i64 96, i1 false)
  %nTimeSteps = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 0
  %2 = load i32, i32* %nTimeSteps, align 8, !tbaa !2
  %resultFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 1
  %3 = load i8*, i8** %resultFilename, align 8, !tbaa !8
  %action = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 2
  %4 = load i32, i32* %action, align 8, !tbaa !9
  %idxprom = zext i32 %4 to i64
  %arraydecay = getelementptr inbounds [3 x [32 x i8]], [3 x [32 x i8]]* %actionString, i64 0, i64 %idxprom, i64 0
  %simType = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 3
  %5 = load i32, i32* %simType, align 4, !tbaa !10
  %idxprom1 = zext i32 %5 to i64
  %arraydecay3 = getelementptr inbounds [3 x [32 x i8]], [3 x [32 x i8]]* %simTypeString, i64 0, i64 %idxprom1, i64 0
  %obstacleFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 4
  %6 = load i8*, i8** %obstacleFilename, align 8, !tbaa !11
  %cmp = icmp eq i8* %6, null
  %spec.select = select i1 %cmp, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* %6
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([174 x i8], [174 x i8]* @.str.5, i64 0, i64 0), i32 100, i32 100, i32 130, double 0x3FF4CCCCCCCCCCCC, i32 %2, i8* %3, i8* nonnull %arraydecay, i8* nonnull %arraydecay3, i8* %spec.select)
  call void @llvm.lifetime.end.p0i8(i64 96, i8* nonnull %1) #6
  call void @llvm.lifetime.end.p0i8(i64 96, i8* nonnull %0) #6
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @MAIN_initialize(%struct.MAIN_Param* nocapture readonly %param) local_unnamed_addr #0 {
entry:
  %call.i = tail call noalias i8* @malloc(i64 214400000) #6
  store i8* %call.i, i8** bitcast ([26000000 x double]** @srcGrid to i8**), align 8, !tbaa !18
  %tobool.i = icmp eq i8* %call.i, null
  br i1 %tobool.i, label %if.then.i, label %LBM_allocateGrid.exit

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i64 0, i64 0), double 0x40698EF800000000) #6
  tail call void @exit(i32 1) #7
  unreachable

LBM_allocateGrid.exit:                            ; preds = %entry
  %call2.i = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.9, i64 0, i64 0), double 0x40698EF800000000) #6
  %0 = load double*, double** bitcast ([26000000 x double]** @srcGrid to double**), align 8, !tbaa !18
  %add.ptr.i = getelementptr inbounds double, double* %0, i64 400000
  store double* %add.ptr.i, double** bitcast ([26000000 x double]** @srcGrid to double**), align 8, !tbaa !18
  %call.i17 = tail call noalias i8* @malloc(i64 214400000) #6
  store i8* %call.i17, i8** bitcast ([26000000 x double]** @dstGrid to i8**), align 8, !tbaa !18
  %tobool.i18 = icmp eq i8* %call.i17, null
  br i1 %tobool.i18, label %if.then.i20, label %LBM_allocateGrid.exit23

if.then.i20:                                      ; preds = %LBM_allocateGrid.exit
  %call1.i19 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i64 0, i64 0), double 0x40698EF800000000) #6
  tail call void @exit(i32 1) #7
  unreachable

LBM_allocateGrid.exit23:                          ; preds = %LBM_allocateGrid.exit
  %call2.i21 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.9, i64 0, i64 0), double 0x40698EF800000000) #6
  %1 = load double*, double** bitcast ([26000000 x double]** @dstGrid to double**), align 8, !tbaa !18
  %add.ptr.i22 = getelementptr inbounds double, double* %1, i64 400000
  store double* %add.ptr.i22, double** bitcast ([26000000 x double]** @dstGrid to double**), align 8, !tbaa !18
  %2 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !18
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %LBM_allocateGrid.exit23
  %indvars.iv.i = phi i64 [ -400000, %LBM_allocateGrid.exit23 ], [ %indvars.iv.next.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds [26000000 x double], [26000000 x double]* %2, i64 0, i64 %indvars.iv.i
  %3 = bitcast double* %arrayidx.i to <2 x double>*
  store <2 x double> <double 0x3FD5555555555555, double 0x3FAC71C71C71C71C>, <2 x double>* %3, align 8, !tbaa !27
  %4 = or i64 %indvars.iv.i, 2
  %arrayidx6.i = getelementptr inbounds [26000000 x double], [26000000 x double]* %2, i64 0, i64 %4
  %5 = bitcast double* %arrayidx6.i to <2 x double>*
  store <2 x double> <double 0x3FAC71C71C71C71C, double 0x3FAC71C71C71C71C>, <2 x double>* %5, align 8, !tbaa !27
  %6 = add nsw i64 %indvars.iv.i, 4
  %arrayidx12.i = getelementptr inbounds [26000000 x double], [26000000 x double]* %2, i64 0, i64 %6
  %7 = bitcast double* %arrayidx12.i to <2 x double>*
  store <2 x double> <double 0x3FAC71C71C71C71C, double 0x3FAC71C71C71C71C>, <2 x double>* %7, align 8, !tbaa !27
  %8 = add nsw i64 %indvars.iv.i, 6
  %arrayidx18.i = getelementptr inbounds [26000000 x double], [26000000 x double]* %2, i64 0, i64 %8
  %9 = bitcast double* %arrayidx18.i to <2 x double>*
  store <2 x double> <double 0x3FAC71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %9, align 8, !tbaa !27
  %10 = add nsw i64 %indvars.iv.i, 8
  %arrayidx24.i = getelementptr inbounds [26000000 x double], [26000000 x double]* %2, i64 0, i64 %10
  %11 = bitcast double* %arrayidx24.i to <2 x double>*
  store <2 x double> <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %11, align 8, !tbaa !27
  %12 = add nsw i64 %indvars.iv.i, 10
  %arrayidx30.i = getelementptr inbounds [26000000 x double], [26000000 x double]* %2, i64 0, i64 %12
  %13 = bitcast double* %arrayidx30.i to <2 x double>*
  store <2 x double> <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %13, align 8, !tbaa !27
  %14 = add nsw i64 %indvars.iv.i, 12
  %arrayidx36.i = getelementptr inbounds [26000000 x double], [26000000 x double]* %2, i64 0, i64 %14
  %15 = bitcast double* %arrayidx36.i to <2 x double>*
  store <2 x double> <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %15, align 8, !tbaa !27
  %16 = add nsw i64 %indvars.iv.i, 14
  %arrayidx42.i = getelementptr inbounds [26000000 x double], [26000000 x double]* %2, i64 0, i64 %16
  %17 = bitcast double* %arrayidx42.i to <2 x double>*
  store <2 x double> <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %17, align 8, !tbaa !27
  %18 = add nsw i64 %indvars.iv.i, 16
  %arrayidx48.i = getelementptr inbounds [26000000 x double], [26000000 x double]* %2, i64 0, i64 %18
  %19 = bitcast double* %arrayidx48.i to <2 x double>*
  store <2 x double> <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %19, align 8, !tbaa !27
  %20 = add nsw i64 %indvars.iv.i, 18
  %arrayidx54.i = getelementptr inbounds [26000000 x double], [26000000 x double]* %2, i64 0, i64 %20
  store double 0x3F9C71C71C71C71C, double* %arrayidx54.i, align 8, !tbaa !27
  %21 = add nsw i64 %indvars.iv.i, 19
  %arrayidx57.i = getelementptr inbounds [26000000 x double], [26000000 x double]* %2, i64 0, i64 %21
  %22 = bitcast double* %arrayidx57.i to i32*
  store i32 0, i32* %22, align 4, !tbaa !28
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, 20
  %cmp.i = icmp slt i64 %indvars.iv.i, 26399980
  br i1 %cmp.i, label %for.body.i, label %LBM_initializeGrid.exit

LBM_initializeGrid.exit:                          ; preds = %for.body.i
  %arraydecay = getelementptr inbounds [26000000 x double], [26000000 x double]* %2, i64 0, i64 0
  br label %for.body.i47

for.body.i47:                                     ; preds = %for.body.i47, %LBM_initializeGrid.exit
  %indvars.iv.i24 = phi i64 [ -400000, %LBM_initializeGrid.exit ], [ %indvars.iv.next.i45, %for.body.i47 ]
  %arrayidx.i25 = getelementptr inbounds double, double* %add.ptr.i22, i64 %indvars.iv.i24
  %23 = bitcast double* %arrayidx.i25 to <2 x double>*
  store <2 x double> <double 0x3FD5555555555555, double 0x3FAC71C71C71C71C>, <2 x double>* %23, align 8, !tbaa !27
  %24 = or i64 %indvars.iv.i24, 2
  %arrayidx6.i27 = getelementptr inbounds double, double* %add.ptr.i22, i64 %24
  %25 = bitcast double* %arrayidx6.i27 to <2 x double>*
  store <2 x double> <double 0x3FAC71C71C71C71C, double 0x3FAC71C71C71C71C>, <2 x double>* %25, align 8, !tbaa !27
  %26 = add nsw i64 %indvars.iv.i24, 4
  %arrayidx12.i29 = getelementptr inbounds double, double* %add.ptr.i22, i64 %26
  %27 = bitcast double* %arrayidx12.i29 to <2 x double>*
  store <2 x double> <double 0x3FAC71C71C71C71C, double 0x3FAC71C71C71C71C>, <2 x double>* %27, align 8, !tbaa !27
  %28 = add nsw i64 %indvars.iv.i24, 6
  %arrayidx18.i31 = getelementptr inbounds double, double* %add.ptr.i22, i64 %28
  %29 = bitcast double* %arrayidx18.i31 to <2 x double>*
  store <2 x double> <double 0x3FAC71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %29, align 8, !tbaa !27
  %30 = add nsw i64 %indvars.iv.i24, 8
  %arrayidx24.i33 = getelementptr inbounds double, double* %add.ptr.i22, i64 %30
  %31 = bitcast double* %arrayidx24.i33 to <2 x double>*
  store <2 x double> <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %31, align 8, !tbaa !27
  %32 = add nsw i64 %indvars.iv.i24, 10
  %arrayidx30.i35 = getelementptr inbounds double, double* %add.ptr.i22, i64 %32
  %33 = bitcast double* %arrayidx30.i35 to <2 x double>*
  store <2 x double> <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %33, align 8, !tbaa !27
  %34 = add nsw i64 %indvars.iv.i24, 12
  %arrayidx36.i37 = getelementptr inbounds double, double* %add.ptr.i22, i64 %34
  %35 = bitcast double* %arrayidx36.i37 to <2 x double>*
  store <2 x double> <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %35, align 8, !tbaa !27
  %36 = add nsw i64 %indvars.iv.i24, 14
  %arrayidx42.i39 = getelementptr inbounds double, double* %add.ptr.i22, i64 %36
  %37 = bitcast double* %arrayidx42.i39 to <2 x double>*
  store <2 x double> <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %37, align 8, !tbaa !27
  %38 = add nsw i64 %indvars.iv.i24, 16
  %arrayidx48.i41 = getelementptr inbounds double, double* %add.ptr.i22, i64 %38
  %39 = bitcast double* %arrayidx48.i41 to <2 x double>*
  store <2 x double> <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %39, align 8, !tbaa !27
  %40 = add nsw i64 %indvars.iv.i24, 18
  %arrayidx54.i43 = getelementptr inbounds double, double* %add.ptr.i22, i64 %40
  store double 0x3F9C71C71C71C71C, double* %arrayidx54.i43, align 8, !tbaa !27
  %41 = add nsw i64 %indvars.iv.i24, 19
  %arrayidx57.i44 = getelementptr inbounds double, double* %add.ptr.i22, i64 %41
  %42 = bitcast double* %arrayidx57.i44 to i32*
  store i32 0, i32* %42, align 4, !tbaa !28
  %indvars.iv.next.i45 = add nsw i64 %indvars.iv.i24, 20
  %cmp.i46 = icmp slt i64 %indvars.iv.i24, 26399980
  br i1 %cmp.i46, label %for.body.i47, label %LBM_initializeGrid.exit48

LBM_initializeGrid.exit48:                        ; preds = %for.body.i47
  %obstacleFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 4
  %43 = load i8*, i8** %obstacleFilename, align 8, !tbaa !11
  %cmp = icmp eq i8* %43, null
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %LBM_initializeGrid.exit48
  tail call void @LBM_loadObstacleFile(double* %arraydecay, i8* nonnull %43)
  %44 = load [26000000 x double]*, [26000000 x double]** @dstGrid, align 8, !tbaa !18
  %arraydecay4 = getelementptr inbounds [26000000 x double], [26000000 x double]* %44, i64 0, i64 0
  %45 = load i8*, i8** %obstacleFilename, align 8, !tbaa !11
  tail call void @LBM_loadObstacleFile(double* %arraydecay4, i8* %45)
  %.pre = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !18
  %.pre130 = getelementptr inbounds [26000000 x double], [26000000 x double]* %.pre, i64 0, i64 0
  br label %if.end

if.end:                                           ; preds = %LBM_initializeGrid.exit48, %if.then
  %arraydecay8.pre-phi = phi double* [ %arraydecay, %LBM_initializeGrid.exit48 ], [ %.pre130, %if.then ]
  %46 = phi [26000000 x double]* [ %2, %LBM_initializeGrid.exit48 ], [ %.pre, %if.then ]
  %simType = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 3
  %47 = load i32, i32* %simType, align 4, !tbaa !10
  %cmp6 = icmp eq i32 %47, 1
  br i1 %cmp6, label %for.cond1.preheader.i, label %for.cond1.preheader.i79

for.cond1.preheader.i:                            ; preds = %if.end, %for.inc46.i
  %indvars.iv88.i = phi i64 [ %indvars.iv.next89.i, %for.inc46.i ], [ -2, %if.end ]
  %48 = mul nsw i64 %indvars.iv88.i, 10000
  br label %for.cond4.preheader.i

for.cond4.preheader.i:                            ; preds = %for.inc43.i, %for.cond1.preheader.i
  %indvars.iv83.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next84.i, %for.inc43.i ]
  %cmp10.i = icmp eq i64 %indvars.iv83.i, 0
  %cmp12.i = icmp eq i64 %indvars.iv83.i, 99
  %49 = mul nuw nsw i64 %indvars.iv83.i, 100
  %50 = add nsw i64 %49, %48
  br label %for.body6.i

for.body6.i:                                      ; preds = %for.inc.i, %for.cond4.preheader.i
  %indvars.iv.i49 = phi i64 [ 0, %for.cond4.preheader.i ], [ %indvars.iv.next.i52, %for.inc.i ]
  %cmp7.i = icmp eq i64 %indvars.iv.i49, 0
  %cmp8.i = icmp eq i64 %indvars.iv.i49, 99
  %or.cond.i = or i1 %cmp7.i, %cmp8.i
  %or.cond49.i = or i1 %cmp10.i, %or.cond.i
  %or.cond50.i = or i1 %cmp12.i, %or.cond49.i
  br i1 %or.cond50.i, label %if.then.i51, label %for.inc.i

if.then.i51:                                      ; preds = %for.body6.i
  %51 = add nsw i64 %50, %indvars.iv.i49
  %52 = mul nsw i64 %51, 20
  %53 = add nsw i64 %52, 19
  %arrayidx.i50 = getelementptr inbounds [26000000 x double], [26000000 x double]* %46, i64 0, i64 %53
  %54 = bitcast double* %arrayidx.i50 to i32*
  %55 = load i32, i32* %54, align 4, !tbaa !28
  %or.i = or i32 %55, 1
  store i32 %or.i, i32* %54, align 4, !tbaa !28
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i51, %for.body6.i
  %indvars.iv.next.i52 = add nuw nsw i64 %indvars.iv.i49, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i52, 100
  br i1 %exitcond.i, label %for.inc43.i, label %for.body6.i

for.inc43.i:                                      ; preds = %for.inc.i
  %indvars.iv.next84.i = add nuw nsw i64 %indvars.iv83.i, 1
  %exitcond87.i = icmp eq i64 %indvars.iv.next84.i, 100
  br i1 %exitcond87.i, label %for.inc46.i, label %for.cond4.preheader.i

for.inc46.i:                                      ; preds = %for.inc43.i
  %indvars.iv.next89.i = add nsw i64 %indvars.iv88.i, 1
  %exitcond91.i = icmp eq i64 %indvars.iv.next89.i, 132
  br i1 %exitcond91.i, label %LBM_initializeSpecialCellsForChannel.exit, label %for.cond1.preheader.i

LBM_initializeSpecialCellsForChannel.exit:        ; preds = %for.inc46.i
  %56 = load [26000000 x double]*, [26000000 x double]** @dstGrid, align 8, !tbaa !18
  br label %for.cond1.preheader.i54

for.cond1.preheader.i54:                          ; preds = %for.inc46.i77, %LBM_initializeSpecialCellsForChannel.exit
  %indvars.iv88.i53 = phi i64 [ -2, %LBM_initializeSpecialCellsForChannel.exit ], [ %indvars.iv.next89.i75, %for.inc46.i77 ]
  %57 = mul nsw i64 %indvars.iv88.i53, 10000
  br label %for.cond4.preheader.i58

for.cond4.preheader.i58:                          ; preds = %for.inc43.i74, %for.cond1.preheader.i54
  %indvars.iv83.i55 = phi i64 [ 0, %for.cond1.preheader.i54 ], [ %indvars.iv.next84.i72, %for.inc43.i74 ]
  %cmp10.i56 = icmp eq i64 %indvars.iv83.i55, 0
  %cmp12.i57 = icmp eq i64 %indvars.iv83.i55, 99
  %58 = mul nuw nsw i64 %indvars.iv83.i55, 100
  %59 = add nsw i64 %58, %57
  br label %for.body6.i65

for.body6.i65:                                    ; preds = %for.inc.i71, %for.cond4.preheader.i58
  %indvars.iv.i59 = phi i64 [ 0, %for.cond4.preheader.i58 ], [ %indvars.iv.next.i69, %for.inc.i71 ]
  %cmp7.i60 = icmp eq i64 %indvars.iv.i59, 0
  %cmp8.i61 = icmp eq i64 %indvars.iv.i59, 99
  %or.cond.i62 = or i1 %cmp7.i60, %cmp8.i61
  %or.cond49.i63 = or i1 %cmp10.i56, %or.cond.i62
  %or.cond50.i64 = or i1 %cmp12.i57, %or.cond49.i63
  br i1 %or.cond50.i64, label %if.then.i68, label %for.inc.i71

if.then.i68:                                      ; preds = %for.body6.i65
  %60 = add nsw i64 %59, %indvars.iv.i59
  %61 = mul nsw i64 %60, 20
  %62 = add nsw i64 %61, 19
  %arrayidx.i66 = getelementptr inbounds [26000000 x double], [26000000 x double]* %56, i64 0, i64 %62
  %63 = bitcast double* %arrayidx.i66 to i32*
  %64 = load i32, i32* %63, align 4, !tbaa !28
  %or.i67 = or i32 %64, 1
  store i32 %or.i67, i32* %63, align 4, !tbaa !28
  br label %for.inc.i71

for.inc.i71:                                      ; preds = %if.then.i68, %for.body6.i65
  %indvars.iv.next.i69 = add nuw nsw i64 %indvars.iv.i59, 1
  %exitcond.i70 = icmp eq i64 %indvars.iv.next.i69, 100
  br i1 %exitcond.i70, label %for.inc43.i74, label %for.body6.i65

for.inc43.i74:                                    ; preds = %for.inc.i71
  %indvars.iv.next84.i72 = add nuw nsw i64 %indvars.iv83.i55, 1
  %exitcond87.i73 = icmp eq i64 %indvars.iv.next84.i72, 100
  br i1 %exitcond87.i73, label %for.inc46.i77, label %for.cond4.preheader.i58

for.inc46.i77:                                    ; preds = %for.inc43.i74
  %indvars.iv.next89.i75 = add nsw i64 %indvars.iv88.i53, 1
  %exitcond91.i76 = icmp eq i64 %indvars.iv.next89.i75, 132
  br i1 %exitcond91.i76, label %if.end12, label %for.cond1.preheader.i54

for.cond1.preheader.i79:                          ; preds = %if.end, %for.inc48.i
  %indvars.iv105.i = phi i64 [ %indvars.iv.next106.i, %for.inc48.i ], [ -2, %if.end ]
  %65 = icmp eq i64 %indvars.iv105.i, 0
  %66 = icmp eq i64 %indvars.iv105.i, 129
  %67 = mul nsw i64 %indvars.iv105.i, 10000
  %68 = icmp eq i64 %indvars.iv105.i, 1
  %69 = icmp eq i64 %indvars.iv105.i, 128
  %or.cond55.i = or i1 %68, %69
  br label %for.cond4.preheader.i82

for.cond4.preheader.i82:                          ; preds = %for.inc45.i, %for.cond1.preheader.i79
  %indvars.iv97.i = phi i64 [ 0, %for.cond1.preheader.i79 ], [ %indvars.iv.next98.i, %for.inc45.i ]
  %cmp10.i80 = icmp eq i64 %indvars.iv97.i, 0
  %cmp12.i81 = icmp eq i64 %indvars.iv97.i, 99
  %70 = mul nuw nsw i64 %indvars.iv97.i, 100
  %71 = add nsw i64 %70, %67
  %72 = trunc i64 %indvars.iv97.i to i32
  %73 = add i32 %72, -2
  %74 = icmp ult i32 %73, 96
  br label %for.body6.i87

for.body6.i87:                                    ; preds = %for.inc.i94, %for.cond4.preheader.i82
  %indvars.iv.i83 = phi i64 [ 0, %for.cond4.preheader.i82 ], [ %indvars.iv.next.i92, %for.inc.i94 ]
  %cmp7.i84 = icmp eq i64 %indvars.iv.i83, 0
  %cmp8.i85 = icmp eq i64 %indvars.iv.i83, 99
  %or.cond.i86 = or i1 %cmp7.i84, %cmp8.i85
  %or.cond51.i = or i1 %cmp10.i80, %or.cond.i86
  %or.cond52.i = or i1 %cmp12.i81, %or.cond51.i
  %or.cond53.i = or i1 %65, %or.cond52.i
  %or.cond54.i = or i1 %66, %or.cond53.i
  br i1 %or.cond54.i, label %for.inc.i94.sink.split, label %if.else.i

if.else.i:                                        ; preds = %for.body6.i87
  %75 = trunc i64 %indvars.iv.i83 to i32
  %76 = add i32 %75, -2
  %77 = icmp ult i32 %76, 96
  %78 = and i1 %or.cond55.i, %77
  %79 = and i1 %74, %78
  br i1 %79, label %for.inc.i94.sink.split, label %for.inc.i94

for.inc.i94.sink.split:                           ; preds = %if.else.i, %for.body6.i87
  %.sink134 = phi i32 [ 1, %for.body6.i87 ], [ 2, %if.else.i ]
  %80 = add nsw i64 %indvars.iv.i83, %71
  %81 = mul nsw i64 %80, 20
  %82 = add nsw i64 %81, 19
  %arrayidx.i88 = getelementptr inbounds [26000000 x double], [26000000 x double]* %46, i64 0, i64 %82
  %83 = bitcast double* %arrayidx.i88 to i32*
  %84 = load i32, i32* %83, align 4, !tbaa !28
  %or43.i = or i32 %84, %.sink134
  store i32 %or43.i, i32* %83, align 4, !tbaa !28
  br label %for.inc.i94

for.inc.i94:                                      ; preds = %for.inc.i94.sink.split, %if.else.i
  %indvars.iv.next.i92 = add nuw nsw i64 %indvars.iv.i83, 1
  %exitcond.i93 = icmp eq i64 %indvars.iv.next.i92, 100
  br i1 %exitcond.i93, label %for.inc45.i, label %for.body6.i87

for.inc45.i:                                      ; preds = %for.inc.i94
  %indvars.iv.next98.i = add nuw nsw i64 %indvars.iv97.i, 1
  %exitcond104.i = icmp eq i64 %indvars.iv.next98.i, 100
  br i1 %exitcond104.i, label %for.inc48.i, label %for.cond4.preheader.i82

for.inc48.i:                                      ; preds = %for.inc45.i
  %indvars.iv.next106.i = add nsw i64 %indvars.iv105.i, 1
  %exitcond112.i = icmp eq i64 %indvars.iv.next106.i, 132
  br i1 %exitcond112.i, label %LBM_initializeSpecialCellsForLDC.exit, label %for.cond1.preheader.i79

LBM_initializeSpecialCellsForLDC.exit:            ; preds = %for.inc48.i
  %85 = load [26000000 x double]*, [26000000 x double]** @dstGrid, align 8, !tbaa !18
  br label %for.cond1.preheader.i97

for.cond1.preheader.i97:                          ; preds = %for.inc48.i126, %LBM_initializeSpecialCellsForLDC.exit
  %indvars.iv105.i95 = phi i64 [ -2, %LBM_initializeSpecialCellsForLDC.exit ], [ %indvars.iv.next106.i124, %for.inc48.i126 ]
  %86 = icmp eq i64 %indvars.iv105.i95, 0
  %87 = icmp eq i64 %indvars.iv105.i95, 129
  %88 = mul nsw i64 %indvars.iv105.i95, 10000
  %89 = icmp eq i64 %indvars.iv105.i95, 1
  %90 = icmp eq i64 %indvars.iv105.i95, 128
  %or.cond55.i96 = or i1 %89, %90
  br label %for.cond4.preheader.i101

for.cond4.preheader.i101:                         ; preds = %for.inc45.i123, %for.cond1.preheader.i97
  %indvars.iv97.i98 = phi i64 [ 0, %for.cond1.preheader.i97 ], [ %indvars.iv.next98.i121, %for.inc45.i123 ]
  %cmp10.i99 = icmp eq i64 %indvars.iv97.i98, 0
  %cmp12.i100 = icmp eq i64 %indvars.iv97.i98, 99
  %91 = mul nuw nsw i64 %indvars.iv97.i98, 100
  %92 = add nsw i64 %91, %88
  %93 = trunc i64 %indvars.iv97.i98 to i32
  %94 = add i32 %93, -2
  %95 = icmp ult i32 %94, 96
  br label %for.body6.i110

for.body6.i110:                                   ; preds = %for.inc.i120, %for.cond4.preheader.i101
  %indvars.iv.i102 = phi i64 [ 0, %for.cond4.preheader.i101 ], [ %indvars.iv.next.i118, %for.inc.i120 ]
  %cmp7.i103 = icmp eq i64 %indvars.iv.i102, 0
  %cmp8.i104 = icmp eq i64 %indvars.iv.i102, 99
  %or.cond.i105 = or i1 %cmp7.i103, %cmp8.i104
  %or.cond51.i106 = or i1 %cmp10.i99, %or.cond.i105
  %or.cond52.i107 = or i1 %cmp12.i100, %or.cond51.i106
  %or.cond53.i108 = or i1 %86, %or.cond52.i107
  %or.cond54.i109 = or i1 %87, %or.cond53.i108
  br i1 %or.cond54.i109, label %for.inc.i120.sink.split, label %if.else.i114

if.else.i114:                                     ; preds = %for.body6.i110
  %96 = trunc i64 %indvars.iv.i102 to i32
  %97 = add i32 %96, -2
  %98 = icmp ult i32 %97, 96
  %99 = and i1 %or.cond55.i96, %98
  %100 = and i1 %95, %99
  br i1 %100, label %for.inc.i120.sink.split, label %for.inc.i120

for.inc.i120.sink.split:                          ; preds = %if.else.i114, %for.body6.i110
  %.sink138 = phi i32 [ 1, %for.body6.i110 ], [ 2, %if.else.i114 ]
  %101 = add nsw i64 %indvars.iv.i102, %92
  %102 = mul nsw i64 %101, 20
  %103 = add nsw i64 %102, 19
  %arrayidx.i111 = getelementptr inbounds [26000000 x double], [26000000 x double]* %85, i64 0, i64 %103
  %104 = bitcast double* %arrayidx.i111 to i32*
  %105 = load i32, i32* %104, align 4, !tbaa !28
  %or43.i116 = or i32 %105, %.sink138
  store i32 %or43.i116, i32* %104, align 4, !tbaa !28
  br label %for.inc.i120

for.inc.i120:                                     ; preds = %for.inc.i120.sink.split, %if.else.i114
  %indvars.iv.next.i118 = add nuw nsw i64 %indvars.iv.i102, 1
  %exitcond.i119 = icmp eq i64 %indvars.iv.next.i118, 100
  br i1 %exitcond.i119, label %for.inc45.i123, label %for.body6.i110

for.inc45.i123:                                   ; preds = %for.inc.i120
  %indvars.iv.next98.i121 = add nuw nsw i64 %indvars.iv97.i98, 1
  %exitcond104.i122 = icmp eq i64 %indvars.iv.next98.i121, 100
  br i1 %exitcond104.i122, label %for.inc48.i126, label %for.cond4.preheader.i101

for.inc48.i126:                                   ; preds = %for.inc45.i123
  %indvars.iv.next106.i124 = add nsw i64 %indvars.iv105.i95, 1
  %exitcond112.i125 = icmp eq i64 %indvars.iv.next106.i124, 132
  br i1 %exitcond112.i125, label %if.end12, label %for.cond1.preheader.i97

if.end12:                                         ; preds = %for.inc48.i126, %for.inc46.i77
  tail call void @LBM_showGridStatistics(double* %arraydecay8.pre-phi)
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @MAIN_startClock(%struct.MAIN_Time* nocapture %time) local_unnamed_addr #0 {
entry:
  %call = tail call i64 @sysconf(i32 2) #6
  %conv = sitofp i64 %call to double
  %div = fdiv double 1.000000e+00, %conv
  %timeScale = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 0
  store double %div, double* %timeScale, align 8, !tbaa !12
  %timeStart = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 3
  %call1 = tail call i64 @times(%struct.tms* nonnull %timeStart) #6
  %tickStart = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 1
  store i64 %call1, i64* %tickStart, align 8, !tbaa !17
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @LBM_handleInOutFlow(double* %srcGrid) local_unnamed_addr #0 {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @str.33, i64 0, i64 0))
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv1670 = phi i64 [ 0, %entry ], [ %indvars.iv.next1671, %for.body ]
  %i.01613 = phi i32 [ 0, %entry ], [ %add390, %for.body ]
  %0 = add nuw nsw i64 %indvars.iv1670, 200000
  %arrayidx = getelementptr inbounds double, double* %srcGrid, i64 %0
  %1 = load double, double* %arrayidx, align 8, !tbaa !27
  %2 = add nuw nsw i64 %indvars.iv1670, 200001
  %arrayidx3 = getelementptr inbounds double, double* %srcGrid, i64 %2
  %3 = load double, double* %arrayidx3, align 8, !tbaa !27
  %add4 = fadd double %1, %3
  %4 = add nuw nsw i64 %indvars.iv1670, 200002
  %arrayidx7 = getelementptr inbounds double, double* %srcGrid, i64 %4
  %5 = load double, double* %arrayidx7, align 8, !tbaa !27
  %add8 = fadd double %add4, %5
  %6 = add nuw nsw i64 %indvars.iv1670, 200003
  %arrayidx11 = getelementptr inbounds double, double* %srcGrid, i64 %6
  %7 = load double, double* %arrayidx11, align 8, !tbaa !27
  %add12 = fadd double %add8, %7
  %8 = add nuw nsw i64 %indvars.iv1670, 200004
  %arrayidx15 = getelementptr inbounds double, double* %srcGrid, i64 %8
  %9 = load double, double* %arrayidx15, align 8, !tbaa !27
  %add16 = fadd double %add12, %9
  %10 = add nuw nsw i64 %indvars.iv1670, 200005
  %arrayidx19 = getelementptr inbounds double, double* %srcGrid, i64 %10
  %11 = load double, double* %arrayidx19, align 8, !tbaa !27
  %add20 = fadd double %add16, %11
  %12 = add nuw nsw i64 %indvars.iv1670, 200006
  %arrayidx23 = getelementptr inbounds double, double* %srcGrid, i64 %12
  %13 = load double, double* %arrayidx23, align 8, !tbaa !27
  %add24 = fadd double %add20, %13
  %14 = add nuw nsw i64 %indvars.iv1670, 200007
  %arrayidx27 = getelementptr inbounds double, double* %srcGrid, i64 %14
  %15 = load double, double* %arrayidx27, align 8, !tbaa !27
  %add28 = fadd double %add24, %15
  %16 = add nuw nsw i64 %indvars.iv1670, 200008
  %arrayidx31 = getelementptr inbounds double, double* %srcGrid, i64 %16
  %17 = load double, double* %arrayidx31, align 8, !tbaa !27
  %add32 = fadd double %add28, %17
  %18 = add nuw nsw i64 %indvars.iv1670, 200009
  %arrayidx35 = getelementptr inbounds double, double* %srcGrid, i64 %18
  %19 = load double, double* %arrayidx35, align 8, !tbaa !27
  %add36 = fadd double %add32, %19
  %20 = add nuw nsw i64 %indvars.iv1670, 200010
  %arrayidx39 = getelementptr inbounds double, double* %srcGrid, i64 %20
  %21 = load double, double* %arrayidx39, align 8, !tbaa !27
  %add40 = fadd double %add36, %21
  %22 = add nuw nsw i64 %indvars.iv1670, 200011
  %arrayidx43 = getelementptr inbounds double, double* %srcGrid, i64 %22
  %23 = load double, double* %arrayidx43, align 8, !tbaa !27
  %add44 = fadd double %add40, %23
  %24 = add nuw nsw i64 %indvars.iv1670, 200012
  %arrayidx47 = getelementptr inbounds double, double* %srcGrid, i64 %24
  %25 = load double, double* %arrayidx47, align 8, !tbaa !27
  %add48 = fadd double %add44, %25
  %26 = add nuw nsw i64 %indvars.iv1670, 200013
  %arrayidx51 = getelementptr inbounds double, double* %srcGrid, i64 %26
  %27 = load double, double* %arrayidx51, align 8, !tbaa !27
  %add52 = fadd double %add48, %27
  %28 = add nuw nsw i64 %indvars.iv1670, 200014
  %arrayidx55 = getelementptr inbounds double, double* %srcGrid, i64 %28
  %29 = load double, double* %arrayidx55, align 8, !tbaa !27
  %add56 = fadd double %add52, %29
  %30 = add nuw nsw i64 %indvars.iv1670, 200015
  %arrayidx59 = getelementptr inbounds double, double* %srcGrid, i64 %30
  %31 = load double, double* %arrayidx59, align 8, !tbaa !27
  %add60 = fadd double %add56, %31
  %32 = add nuw nsw i64 %indvars.iv1670, 200016
  %arrayidx63 = getelementptr inbounds double, double* %srcGrid, i64 %32
  %33 = load double, double* %arrayidx63, align 8, !tbaa !27
  %add64 = fadd double %add60, %33
  %34 = add nuw nsw i64 %indvars.iv1670, 200017
  %arrayidx67 = getelementptr inbounds double, double* %srcGrid, i64 %34
  %35 = load double, double* %arrayidx67, align 8, !tbaa !27
  %add68 = fadd double %add64, %35
  %36 = add nuw nsw i64 %indvars.iv1670, 200018
  %arrayidx71 = getelementptr inbounds double, double* %srcGrid, i64 %36
  %37 = load double, double* %arrayidx71, align 8, !tbaa !27
  %add72 = fadd double %add68, %37
  %38 = add nuw nsw i64 %indvars.iv1670, 400000
  %arrayidx75 = getelementptr inbounds double, double* %srcGrid, i64 %38
  %39 = load double, double* %arrayidx75, align 8, !tbaa !27
  %40 = add nuw nsw i64 %indvars.iv1670, 400001
  %arrayidx78 = getelementptr inbounds double, double* %srcGrid, i64 %40
  %41 = load double, double* %arrayidx78, align 8, !tbaa !27
  %add79 = fadd double %39, %41
  %42 = add nuw nsw i64 %indvars.iv1670, 400002
  %arrayidx82 = getelementptr inbounds double, double* %srcGrid, i64 %42
  %43 = load double, double* %arrayidx82, align 8, !tbaa !27
  %add83 = fadd double %add79, %43
  %44 = add nuw nsw i64 %indvars.iv1670, 400003
  %arrayidx86 = getelementptr inbounds double, double* %srcGrid, i64 %44
  %45 = load double, double* %arrayidx86, align 8, !tbaa !27
  %add87 = fadd double %add83, %45
  %46 = add nuw nsw i64 %indvars.iv1670, 400004
  %arrayidx90 = getelementptr inbounds double, double* %srcGrid, i64 %46
  %47 = load double, double* %arrayidx90, align 8, !tbaa !27
  %add91 = fadd double %add87, %47
  %48 = add nuw nsw i64 %indvars.iv1670, 400005
  %arrayidx94 = getelementptr inbounds double, double* %srcGrid, i64 %48
  %49 = load double, double* %arrayidx94, align 8, !tbaa !27
  %add95 = fadd double %add91, %49
  %50 = add nuw nsw i64 %indvars.iv1670, 400006
  %arrayidx98 = getelementptr inbounds double, double* %srcGrid, i64 %50
  %51 = load double, double* %arrayidx98, align 8, !tbaa !27
  %add99 = fadd double %add95, %51
  %52 = add nuw nsw i64 %indvars.iv1670, 400007
  %arrayidx102 = getelementptr inbounds double, double* %srcGrid, i64 %52
  %53 = load double, double* %arrayidx102, align 8, !tbaa !27
  %add103 = fadd double %add99, %53
  %54 = add nuw nsw i64 %indvars.iv1670, 400008
  %arrayidx106 = getelementptr inbounds double, double* %srcGrid, i64 %54
  %55 = load double, double* %arrayidx106, align 8, !tbaa !27
  %add107 = fadd double %add103, %55
  %56 = add nuw nsw i64 %indvars.iv1670, 400009
  %arrayidx110 = getelementptr inbounds double, double* %srcGrid, i64 %56
  %57 = load double, double* %arrayidx110, align 8, !tbaa !27
  %add111 = fadd double %add107, %57
  %58 = add nuw nsw i64 %indvars.iv1670, 400010
  %arrayidx114 = getelementptr inbounds double, double* %srcGrid, i64 %58
  %59 = load double, double* %arrayidx114, align 8, !tbaa !27
  %add115 = fadd double %add111, %59
  %60 = add nuw nsw i64 %indvars.iv1670, 400011
  %arrayidx118 = getelementptr inbounds double, double* %srcGrid, i64 %60
  %61 = load double, double* %arrayidx118, align 8, !tbaa !27
  %add119 = fadd double %add115, %61
  %62 = add nuw nsw i64 %indvars.iv1670, 400012
  %arrayidx122 = getelementptr inbounds double, double* %srcGrid, i64 %62
  %63 = load double, double* %arrayidx122, align 8, !tbaa !27
  %add123 = fadd double %add119, %63
  %64 = add nuw nsw i64 %indvars.iv1670, 400013
  %arrayidx126 = getelementptr inbounds double, double* %srcGrid, i64 %64
  %65 = load double, double* %arrayidx126, align 8, !tbaa !27
  %add127 = fadd double %add123, %65
  %66 = add nuw nsw i64 %indvars.iv1670, 400014
  %arrayidx130 = getelementptr inbounds double, double* %srcGrid, i64 %66
  %67 = load double, double* %arrayidx130, align 8, !tbaa !27
  %add131 = fadd double %add127, %67
  %68 = add nuw nsw i64 %indvars.iv1670, 400015
  %arrayidx134 = getelementptr inbounds double, double* %srcGrid, i64 %68
  %69 = load double, double* %arrayidx134, align 8, !tbaa !27
  %add135 = fadd double %add131, %69
  %70 = add nuw nsw i64 %indvars.iv1670, 400016
  %arrayidx138 = getelementptr inbounds double, double* %srcGrid, i64 %70
  %71 = load double, double* %arrayidx138, align 8, !tbaa !27
  %add139 = fadd double %add135, %71
  %72 = add nuw nsw i64 %indvars.iv1670, 400017
  %arrayidx142 = getelementptr inbounds double, double* %srcGrid, i64 %72
  %73 = load double, double* %arrayidx142, align 8, !tbaa !27
  %add143 = fadd double %add139, %73
  %74 = add nuw nsw i64 %indvars.iv1670, 400018
  %arrayidx146 = getelementptr inbounds double, double* %srcGrid, i64 %74
  %75 = load double, double* %arrayidx146, align 8, !tbaa !27
  %add147 = fadd double %add143, %75
  %mul = fmul double %add72, 2.000000e+00
  %sub = fsub double %mul, %add147
  %div = udiv i32 %i.01613, 20
  %rem.lhs.trunc = trunc i32 %div to i16
  %rem1609 = urem i16 %rem.lhs.trunc, 100
  %conv = uitofp i16 %rem1609 to double
  %div148 = fdiv double %conv, 4.950000e+01
  %sub149 = fadd double %div148, -1.000000e+00
  %76 = trunc i64 %indvars.iv1670 to i32
  %div151 = udiv i32 %76, 2000
  %rem152.lhs.trunc = trunc i32 %div151 to i8
  %rem1521610 = urem i8 %rem152.lhs.trunc, 100
  %conv153 = uitofp i8 %rem1521610 to double
  %div154 = fdiv double %conv153, 4.950000e+01
  %sub155 = fadd double %div154, -1.000000e+00
  %mul156 = fmul double %sub149, %sub149
  %sub157 = fsub double 1.000000e+00, %mul156
  %mul158 = fmul double %sub157, 1.000000e-02
  %mul159 = fmul double %sub155, %sub155
  %sub160 = fsub double 1.000000e+00, %mul159
  %mul161 = fmul double %sub160, %mul158
  %mul165 = fmul double %mul161, %mul161
  %add166 = fadd double %mul165, 0.000000e+00
  %mul167 = fmul double %add166, 1.500000e+00
  %arrayidx173 = getelementptr inbounds double, double* %srcGrid, i64 %indvars.iv1670
  %77 = insertelement <2 x double> undef, double %sub, i32 0
  %78 = shufflevector <2 x double> %77, <2 x double> undef, <2 x i32> zeroinitializer
  %79 = fmul <2 x double> %78, <double 0x3FD5555555555555, double 0x3FAC71C71C71C71C>
  %add287 = fadd double %mul161, 0.000000e+00
  %mul289 = fmul double %add287, 4.500000e+00
  %add290 = fadd double %mul289, 3.000000e+00
  %mul291 = fmul double %add287, %add290
  %add292 = fadd double %mul291, 1.000000e+00
  %80 = insertelement <2 x double> <double 1.000000e+00, double undef>, double %add292, i32 1
  %81 = insertelement <2 x double> undef, double %mul167, i32 0
  %82 = shufflevector <2 x double> %81, <2 x double> undef, <2 x i32> zeroinitializer
  %83 = fsub <2 x double> %80, %82
  %84 = shufflevector <2 x double> %83, <2 x double> undef, <2 x i32> zeroinitializer
  %85 = fmul <2 x double> %84, %79
  %86 = bitcast double* %arrayidx173 to <2 x double>*
  store <2 x double> %85, <2 x double>* %86, align 8, !tbaa !27
  %87 = or i64 %indvars.iv1670, 2
  %arrayidx193 = getelementptr inbounds double, double* %srcGrid, i64 %87
  %88 = extractelement <2 x double> %85, i32 1
  store double %88, double* %arrayidx193, align 8, !tbaa !27
  %89 = or i64 %indvars.iv1670, 3
  %arrayidx203 = getelementptr inbounds double, double* %srcGrid, i64 %89
  store double %88, double* %arrayidx203, align 8, !tbaa !27
  %90 = add nuw nsw i64 %indvars.iv1670, 4
  %arrayidx213 = getelementptr inbounds double, double* %srcGrid, i64 %90
  store double %88, double* %arrayidx213, align 8, !tbaa !27
  %mul215 = fmul double %mul161, 4.500000e+00
  %91 = add nuw nsw i64 %indvars.iv1670, 5
  %arrayidx223 = getelementptr inbounds double, double* %srcGrid, i64 %91
  %92 = insertelement <2 x double> undef, double %mul215, i32 0
  %93 = shufflevector <2 x double> %92, <2 x double> undef, <2 x i32> zeroinitializer
  %94 = fadd <2 x double> %93, <double 3.000000e+00, double -3.000000e+00>
  %95 = insertelement <2 x double> undef, double %mul161, i32 0
  %96 = shufflevector <2 x double> %95, <2 x double> undef, <2 x i32> zeroinitializer
  %97 = fmul <2 x double> %96, %94
  %98 = fadd <2 x double> %97, <double 1.000000e+00, double 1.000000e+00>
  %99 = fsub <2 x double> %98, %82
  %100 = shufflevector <2 x double> %79, <2 x double> undef, <2 x i32> <i32 1, i32 1>
  %101 = fmul <2 x double> %99, %100
  %102 = bitcast double* %arrayidx223 to <2 x double>*
  store <2 x double> %101, <2 x double>* %102, align 8, !tbaa !27
  %mul234 = fmul double %sub, 0x3F9C71C71C71C71C
  %103 = add nuw nsw i64 %indvars.iv1670, 7
  %arrayidx245 = getelementptr inbounds double, double* %srcGrid, i64 %103
  %104 = insertelement <2 x double> undef, double %mul234, i32 0
  %105 = shufflevector <2 x double> %104, <2 x double> undef, <2 x i32> zeroinitializer
  %106 = fmul <2 x double> %83, %105
  %107 = extractelement <2 x double> %106, i32 0
  store double %107, double* %arrayidx245, align 8, !tbaa !27
  %108 = add nuw nsw i64 %indvars.iv1670, 8
  %arrayidx259 = getelementptr inbounds double, double* %srcGrid, i64 %108
  store double %107, double* %arrayidx259, align 8, !tbaa !27
  %109 = add nuw nsw i64 %indvars.iv1670, 9
  %arrayidx271 = getelementptr inbounds double, double* %srcGrid, i64 %109
  store double %107, double* %arrayidx271, align 8, !tbaa !27
  %110 = add nuw nsw i64 %indvars.iv1670, 10
  %arrayidx285 = getelementptr inbounds double, double* %srcGrid, i64 %110
  %111 = bitcast double* %arrayidx285 to <2 x double>*
  store <2 x double> %106, <2 x double>* %111, align 8, !tbaa !27
  %sub299 = fsub double 0.000000e+00, %mul161
  %mul301 = fmul double %sub299, 4.500000e+00
  %add302 = fadd double %mul301, 3.000000e+00
  %mul303 = fmul double %sub299, %add302
  %add304 = fadd double %mul303, 1.000000e+00
  %sub305 = fsub double %add304, %mul167
  %mul306 = fmul double %sub305, %mul234
  %112 = add nuw nsw i64 %indvars.iv1670, 12
  %arrayidx309 = getelementptr inbounds double, double* %srcGrid, i64 %112
  store double %mul306, double* %arrayidx309, align 8, !tbaa !27
  %113 = extractelement <2 x double> %99, i32 0
  %mul320 = fmul double %113, %mul234
  %114 = add nuw nsw i64 %indvars.iv1670, 13
  %arrayidx323 = getelementptr inbounds double, double* %srcGrid, i64 %114
  store double %mul320, double* %arrayidx323, align 8, !tbaa !27
  %add3301611 = fsub double 3.000000e+00, %mul215
  %115 = fmul double %mul161, %add3301611
  %add332 = fsub double 1.000000e+00, %115
  %sub333 = fsub double %add332, %mul167
  %mul334 = fmul double %sub333, %mul234
  %116 = add nuw nsw i64 %indvars.iv1670, 14
  %arrayidx337 = getelementptr inbounds double, double* %srcGrid, i64 %116
  store double %mul334, double* %arrayidx337, align 8, !tbaa !27
  %117 = add nuw nsw i64 %indvars.iv1670, 15
  %arrayidx349 = getelementptr inbounds double, double* %srcGrid, i64 %117
  %118 = extractelement <2 x double> %106, i32 1
  store double %118, double* %arrayidx349, align 8, !tbaa !27
  %119 = add nuw nsw i64 %indvars.iv1670, 16
  %arrayidx361 = getelementptr inbounds double, double* %srcGrid, i64 %119
  store double %mul306, double* %arrayidx361, align 8, !tbaa !27
  %120 = add nuw nsw i64 %indvars.iv1670, 17
  %arrayidx375 = getelementptr inbounds double, double* %srcGrid, i64 %120
  store double %mul320, double* %arrayidx375, align 8, !tbaa !27
  %121 = add nuw nsw i64 %indvars.iv1670, 18
  %arrayidx389 = getelementptr inbounds double, double* %srcGrid, i64 %121
  store double %mul334, double* %arrayidx389, align 8, !tbaa !27
  %indvars.iv.next1671 = add nuw nsw i64 %indvars.iv1670, 20
  %add390 = add nuw nsw i32 %i.01613, 20
  %cmp = icmp ult i64 %indvars.iv.next1671, 200000
  br i1 %cmp, label %for.body, label %for.body394

for.body394:                                      ; preds = %for.body, %for.body394
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body394 ], [ 25800000, %for.body ]
  %122 = add nsw i64 %indvars.iv, -200000
  %arrayidx397 = getelementptr inbounds double, double* %srcGrid, i64 %122
  %123 = load double, double* %arrayidx397, align 8, !tbaa !27
  %124 = add nsw i64 %indvars.iv, -199999
  %arrayidx400 = getelementptr inbounds double, double* %srcGrid, i64 %124
  %125 = load double, double* %arrayidx400, align 8, !tbaa !27
  %add401 = fadd double %123, %125
  %126 = add nsw i64 %indvars.iv, -199998
  %arrayidx404 = getelementptr inbounds double, double* %srcGrid, i64 %126
  %127 = load double, double* %arrayidx404, align 8, !tbaa !27
  %add405 = fadd double %add401, %127
  %128 = add nsw i64 %indvars.iv, -199997
  %arrayidx408 = getelementptr inbounds double, double* %srcGrid, i64 %128
  %129 = load double, double* %arrayidx408, align 8, !tbaa !27
  %add409 = fadd double %add405, %129
  %130 = add nsw i64 %indvars.iv, -199996
  %arrayidx412 = getelementptr inbounds double, double* %srcGrid, i64 %130
  %131 = load double, double* %arrayidx412, align 8, !tbaa !27
  %add413 = fadd double %add409, %131
  %132 = add nsw i64 %indvars.iv, -199995
  %arrayidx416 = getelementptr inbounds double, double* %srcGrid, i64 %132
  %133 = load double, double* %arrayidx416, align 8, !tbaa !27
  %add417 = fadd double %add413, %133
  %134 = add nsw i64 %indvars.iv, -199994
  %arrayidx420 = getelementptr inbounds double, double* %srcGrid, i64 %134
  %135 = load double, double* %arrayidx420, align 8, !tbaa !27
  %add421 = fadd double %add417, %135
  %136 = add nsw i64 %indvars.iv, -199993
  %arrayidx424 = getelementptr inbounds double, double* %srcGrid, i64 %136
  %137 = load double, double* %arrayidx424, align 8, !tbaa !27
  %add425 = fadd double %add421, %137
  %138 = add nsw i64 %indvars.iv, -199992
  %arrayidx428 = getelementptr inbounds double, double* %srcGrid, i64 %138
  %139 = load double, double* %arrayidx428, align 8, !tbaa !27
  %add429 = fadd double %add425, %139
  %140 = add nsw i64 %indvars.iv, -199991
  %arrayidx432 = getelementptr inbounds double, double* %srcGrid, i64 %140
  %141 = load double, double* %arrayidx432, align 8, !tbaa !27
  %add433 = fadd double %add429, %141
  %142 = add nsw i64 %indvars.iv, -199990
  %arrayidx436 = getelementptr inbounds double, double* %srcGrid, i64 %142
  %143 = load double, double* %arrayidx436, align 8, !tbaa !27
  %add437 = fadd double %add433, %143
  %144 = add nsw i64 %indvars.iv, -199989
  %arrayidx440 = getelementptr inbounds double, double* %srcGrid, i64 %144
  %145 = load double, double* %arrayidx440, align 8, !tbaa !27
  %add441 = fadd double %add437, %145
  %146 = add nsw i64 %indvars.iv, -199988
  %arrayidx444 = getelementptr inbounds double, double* %srcGrid, i64 %146
  %147 = load double, double* %arrayidx444, align 8, !tbaa !27
  %add445 = fadd double %add441, %147
  %148 = add nsw i64 %indvars.iv, -199987
  %arrayidx448 = getelementptr inbounds double, double* %srcGrid, i64 %148
  %149 = load double, double* %arrayidx448, align 8, !tbaa !27
  %add449 = fadd double %add445, %149
  %150 = add nsw i64 %indvars.iv, -199986
  %arrayidx452 = getelementptr inbounds double, double* %srcGrid, i64 %150
  %151 = load double, double* %arrayidx452, align 8, !tbaa !27
  %add453 = fadd double %add449, %151
  %152 = add nsw i64 %indvars.iv, -199985
  %arrayidx456 = getelementptr inbounds double, double* %srcGrid, i64 %152
  %153 = load double, double* %arrayidx456, align 8, !tbaa !27
  %add457 = fadd double %add453, %153
  %154 = add nsw i64 %indvars.iv, -199984
  %arrayidx460 = getelementptr inbounds double, double* %srcGrid, i64 %154
  %155 = load double, double* %arrayidx460, align 8, !tbaa !27
  %add461 = fadd double %add457, %155
  %156 = add nsw i64 %indvars.iv, -199983
  %arrayidx464 = getelementptr inbounds double, double* %srcGrid, i64 %156
  %157 = load double, double* %arrayidx464, align 8, !tbaa !27
  %add465 = fadd double %add461, %157
  %158 = add nsw i64 %indvars.iv, -199982
  %arrayidx468 = getelementptr inbounds double, double* %srcGrid, i64 %158
  %159 = load double, double* %arrayidx468, align 8, !tbaa !27
  %add469 = fadd double %add465, %159
  %sub476 = fsub double %129, %131
  %add480 = fadd double %sub476, %137
  %sub484 = fsub double %add480, %139
  %add488 = fadd double %sub484, %141
  %sub492 = fsub double %add488, %143
  %sub515 = fsub double %125, %127
  %add519 = fadd double %sub515, %137
  %add523 = fadd double %add519, %139
  %sub527 = fsub double %add523, %141
  %sub531 = fsub double %sub527, %143
  %160 = insertelement <2 x double> undef, double %sub531, i32 0
  %161 = insertelement <2 x double> %160, double %sub492, i32 1
  %162 = insertelement <2 x double> undef, double %145, i32 0
  %163 = insertelement <2 x double> %162, double %153, i32 1
  %164 = fadd <2 x double> %161, %163
  %165 = insertelement <2 x double> undef, double %147, i32 0
  %166 = insertelement <2 x double> %165, double %155, i32 1
  %167 = fadd <2 x double> %164, %166
  %168 = insertelement <2 x double> undef, double %149, i32 0
  %169 = insertelement <2 x double> %168, double %157, i32 1
  %170 = fsub <2 x double> %167, %169
  %171 = insertelement <2 x double> undef, double %151, i32 0
  %172 = insertelement <2 x double> %171, double %159, i32 1
  %173 = fsub <2 x double> %170, %172
  %sub554 = fsub double %133, %135
  %add558 = fadd double %sub554, %145
  %sub562 = fsub double %add558, %147
  %add566 = fadd double %sub562, %149
  %sub570 = fsub double %add566, %151
  %add574 = fadd double %sub570, %153
  %sub578 = fsub double %add574, %155
  %add582 = fadd double %sub578, %157
  %sub586 = fsub double %add582, %159
  %174 = insertelement <2 x double> undef, double %add469, i32 0
  %175 = shufflevector <2 x double> %174, <2 x double> undef, <2 x i32> zeroinitializer
  %176 = fdiv <2 x double> %173, %175
  %div589 = fdiv double %sub586, %add469
  %177 = add nsw i64 %indvars.iv, -400000
  %arrayidx592 = getelementptr inbounds double, double* %srcGrid, i64 %177
  %178 = load double, double* %arrayidx592, align 8, !tbaa !27
  %179 = add nsw i64 %indvars.iv, -399999
  %arrayidx595 = getelementptr inbounds double, double* %srcGrid, i64 %179
  %180 = load double, double* %arrayidx595, align 8, !tbaa !27
  %add596 = fadd double %178, %180
  %181 = add nsw i64 %indvars.iv, -399998
  %arrayidx599 = getelementptr inbounds double, double* %srcGrid, i64 %181
  %182 = load double, double* %arrayidx599, align 8, !tbaa !27
  %add600 = fadd double %add596, %182
  %183 = add nsw i64 %indvars.iv, -399997
  %arrayidx603 = getelementptr inbounds double, double* %srcGrid, i64 %183
  %184 = load double, double* %arrayidx603, align 8, !tbaa !27
  %add604 = fadd double %add600, %184
  %185 = add nsw i64 %indvars.iv, -399996
  %arrayidx607 = getelementptr inbounds double, double* %srcGrid, i64 %185
  %186 = load double, double* %arrayidx607, align 8, !tbaa !27
  %add608 = fadd double %add604, %186
  %187 = add nsw i64 %indvars.iv, -399995
  %arrayidx611 = getelementptr inbounds double, double* %srcGrid, i64 %187
  %188 = load double, double* %arrayidx611, align 8, !tbaa !27
  %add612 = fadd double %add608, %188
  %189 = add nsw i64 %indvars.iv, -399994
  %arrayidx615 = getelementptr inbounds double, double* %srcGrid, i64 %189
  %190 = load double, double* %arrayidx615, align 8, !tbaa !27
  %add616 = fadd double %add612, %190
  %191 = add nsw i64 %indvars.iv, -399993
  %arrayidx619 = getelementptr inbounds double, double* %srcGrid, i64 %191
  %192 = load double, double* %arrayidx619, align 8, !tbaa !27
  %add620 = fadd double %add616, %192
  %193 = add nsw i64 %indvars.iv, -399992
  %arrayidx623 = getelementptr inbounds double, double* %srcGrid, i64 %193
  %194 = load double, double* %arrayidx623, align 8, !tbaa !27
  %add624 = fadd double %add620, %194
  %195 = add nsw i64 %indvars.iv, -399991
  %arrayidx627 = getelementptr inbounds double, double* %srcGrid, i64 %195
  %196 = load double, double* %arrayidx627, align 8, !tbaa !27
  %add628 = fadd double %add624, %196
  %197 = add nsw i64 %indvars.iv, -399990
  %arrayidx631 = getelementptr inbounds double, double* %srcGrid, i64 %197
  %198 = load double, double* %arrayidx631, align 8, !tbaa !27
  %add632 = fadd double %add628, %198
  %199 = add nsw i64 %indvars.iv, -399989
  %arrayidx635 = getelementptr inbounds double, double* %srcGrid, i64 %199
  %200 = load double, double* %arrayidx635, align 8, !tbaa !27
  %add636 = fadd double %add632, %200
  %201 = add nsw i64 %indvars.iv, -399988
  %arrayidx639 = getelementptr inbounds double, double* %srcGrid, i64 %201
  %202 = load double, double* %arrayidx639, align 8, !tbaa !27
  %add640 = fadd double %add636, %202
  %203 = add nsw i64 %indvars.iv, -399987
  %arrayidx643 = getelementptr inbounds double, double* %srcGrid, i64 %203
  %204 = load double, double* %arrayidx643, align 8, !tbaa !27
  %add644 = fadd double %add640, %204
  %205 = add nsw i64 %indvars.iv, -399986
  %arrayidx647 = getelementptr inbounds double, double* %srcGrid, i64 %205
  %206 = load double, double* %arrayidx647, align 8, !tbaa !27
  %add648 = fadd double %add644, %206
  %207 = add nsw i64 %indvars.iv, -399985
  %arrayidx651 = getelementptr inbounds double, double* %srcGrid, i64 %207
  %208 = load double, double* %arrayidx651, align 8, !tbaa !27
  %add652 = fadd double %add648, %208
  %209 = add nsw i64 %indvars.iv, -399984
  %arrayidx655 = getelementptr inbounds double, double* %srcGrid, i64 %209
  %210 = load double, double* %arrayidx655, align 8, !tbaa !27
  %add656 = fadd double %add652, %210
  %211 = add nsw i64 %indvars.iv, -399983
  %arrayidx659 = getelementptr inbounds double, double* %srcGrid, i64 %211
  %212 = load double, double* %arrayidx659, align 8, !tbaa !27
  %add660 = fadd double %add656, %212
  %213 = add nsw i64 %indvars.iv, -399982
  %arrayidx663 = getelementptr inbounds double, double* %srcGrid, i64 %213
  %214 = load double, double* %arrayidx663, align 8, !tbaa !27
  %add664 = fadd double %add660, %214
  %sub671 = fsub double %184, %186
  %add675 = fadd double %sub671, %192
  %sub679 = fsub double %add675, %194
  %add683 = fadd double %sub679, %196
  %sub710 = fsub double %180, %182
  %add714 = fadd double %sub710, %192
  %add718 = fadd double %add714, %194
  %sub722 = fsub double %add718, %196
  %215 = insertelement <2 x double> undef, double %sub722, i32 0
  %216 = insertelement <2 x double> %215, double %add683, i32 1
  %217 = insertelement <2 x double> undef, double %198, i32 0
  %218 = shufflevector <2 x double> %217, <2 x double> undef, <2 x i32> zeroinitializer
  %219 = fsub <2 x double> %216, %218
  %220 = insertelement <2 x double> undef, double %200, i32 0
  %221 = insertelement <2 x double> %220, double %208, i32 1
  %222 = fadd <2 x double> %219, %221
  %223 = insertelement <2 x double> undef, double %202, i32 0
  %224 = insertelement <2 x double> %223, double %210, i32 1
  %225 = fadd <2 x double> %222, %224
  %226 = insertelement <2 x double> undef, double %204, i32 0
  %227 = insertelement <2 x double> %226, double %212, i32 1
  %228 = fsub <2 x double> %225, %227
  %229 = insertelement <2 x double> undef, double %206, i32 0
  %230 = insertelement <2 x double> %229, double %214, i32 1
  %231 = fsub <2 x double> %228, %230
  %sub749 = fsub double %188, %190
  %add753 = fadd double %sub749, %200
  %sub757 = fsub double %add753, %202
  %add761 = fadd double %sub757, %204
  %sub765 = fsub double %add761, %206
  %add769 = fadd double %sub765, %208
  %sub773 = fsub double %add769, %210
  %add777 = fadd double %sub773, %212
  %sub781 = fsub double %add777, %214
  %232 = insertelement <2 x double> undef, double %add664, i32 0
  %233 = shufflevector <2 x double> %232, <2 x double> undef, <2 x i32> zeroinitializer
  %234 = fdiv <2 x double> %231, %233
  %div784 = fdiv double %sub781, %add664
  %235 = fmul <2 x double> %176, <double 2.000000e+00, double 2.000000e+00>
  %236 = fsub <2 x double> %235, %234
  %mul789 = fmul double %div589, 2.000000e+00
  %237 = extractelement <2 x double> %236, i32 1
  %mul791 = fmul double %237, %237
  %238 = extractelement <2 x double> %236, i32 0
  %mul792 = fmul double %238, %238
  %add793 = fadd double %mul791, %mul792
  %239 = insertelement <2 x double> undef, double %mul789, i32 0
  %240 = shufflevector <2 x double> %239, <2 x double> %236, <2 x i32> <i32 0, i32 3>
  %241 = insertelement <2 x double> undef, double %div784, i32 0
  %242 = shufflevector <2 x double> %241, <2 x double> %236, <2 x i32> <i32 0, i32 2>
  %243 = fsub <2 x double> %240, %242
  %244 = fadd <2 x double> %240, %242
  %245 = shufflevector <2 x double> %243, <2 x double> %244, <2 x i32> <i32 0, i32 3>
  %246 = extractelement <2 x double> %243, i32 0
  %mul794 = fmul double %246, %246
  %add795 = fadd double %mul794, %add793
  %mul796 = fmul double %add795, 1.500000e+00
  %arrayidx802 = getelementptr inbounds double, double* %srcGrid, i64 %indvars.iv
  %247 = fmul <2 x double> %236, <double 4.500000e+00, double 4.500000e+00>
  %248 = extractelement <2 x double> %247, i32 0
  %add805 = fadd double %248, 3.000000e+00
  %mul806 = fmul double %238, %add805
  %add807 = fadd double %mul806, 1.000000e+00
  %249 = insertelement <2 x double> <double 1.000000e+00, double undef>, double %add807, i32 1
  %250 = insertelement <2 x double> undef, double %mul796, i32 0
  %251 = shufflevector <2 x double> %250, <2 x double> undef, <2 x i32> zeroinitializer
  %252 = fsub <2 x double> %249, %251
  %253 = fmul <2 x double> %252, <double 0x3FD5555555555555, double 0x3FAC71C71C71C71C>
  %254 = bitcast double* %arrayidx802 to <2 x double>*
  store <2 x double> %253, <2 x double>* %254, align 8, !tbaa !27
  %255 = or i64 %indvars.iv, 2
  %arrayidx822 = getelementptr inbounds double, double* %srcGrid, i64 %255
  %256 = fadd <2 x double> %247, <double -3.000000e+00, double 3.000000e+00>
  %257 = fmul <2 x double> %236, %256
  %258 = fadd <2 x double> %257, <double 1.000000e+00, double 1.000000e+00>
  %259 = fsub <2 x double> %258, %251
  %260 = fmul <2 x double> %259, <double 0x3FAC71C71C71C71C, double 0x3FAC71C71C71C71C>
  %261 = bitcast double* %arrayidx822 to <2 x double>*
  store <2 x double> %260, <2 x double>* %261, align 8, !tbaa !27
  %262 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx842 = getelementptr inbounds double, double* %srcGrid, i64 %262
  %263 = fmul <2 x double> %245, <double 4.500000e+00, double 4.500000e+00>
  %264 = shufflevector <2 x double> <double -3.000000e+00, double undef>, <2 x double> %263, <2 x i32> <i32 0, i32 2>
  %265 = shufflevector <2 x double> <double undef, double 3.000000e+00>, <2 x double> %247, <2 x i32> <i32 3, i32 1>
  %266 = fadd <2 x double> %264, %265
  %267 = shufflevector <2 x double> %236, <2 x double> %243, <2 x i32> <i32 1, i32 2>
  %268 = fmul <2 x double> %267, %266
  %269 = fadd <2 x double> %268, <double 1.000000e+00, double 1.000000e+00>
  %270 = fsub <2 x double> %269, %251
  %271 = fmul <2 x double> %270, <double 0x3FAC71C71C71C71C, double 0x3FAC71C71C71C71C>
  %272 = bitcast double* %arrayidx842 to <2 x double>*
  store <2 x double> %271, <2 x double>* %272, align 8, !tbaa !27
  %273 = add nuw nsw i64 %indvars.iv, 6
  %arrayidx862 = getelementptr inbounds double, double* %srcGrid, i64 %273
  %274 = fadd <2 x double> %263, <double -3.000000e+00, double 3.000000e+00>
  %275 = fmul <2 x double> %245, %274
  %276 = fadd <2 x double> %275, <double 1.000000e+00, double 1.000000e+00>
  %277 = fsub <2 x double> %276, %251
  %278 = fmul <2 x double> %277, <double 0x3FAC71C71C71C71C, double 0x3F9C71C71C71C71C>
  %279 = bitcast double* %arrayidx862 to <2 x double>*
  store <2 x double> %278, <2 x double>* %279, align 8, !tbaa !27
  %sub876 = fsub double -0.000000e+00, %237
  %280 = add nuw nsw i64 %indvars.iv, 8
  %arrayidx888 = getelementptr inbounds double, double* %srcGrid, i64 %280
  %reorder_shuffle = shufflevector <2 x double> %236, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %281 = fsub <2 x double> %236, %reorder_shuffle
  %282 = fmul <2 x double> %281, <double 4.500000e+00, double 4.500000e+00>
  %283 = fadd <2 x double> %282, <double 3.000000e+00, double 3.000000e+00>
  %284 = fmul <2 x double> %281, %283
  %285 = fadd <2 x double> %284, <double 1.000000e+00, double 1.000000e+00>
  %286 = fsub <2 x double> %285, %251
  %287 = fmul <2 x double> %286, <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>
  %288 = bitcast double* %arrayidx888 to <2 x double>*
  store <2 x double> %287, <2 x double>* %288, align 8, !tbaa !27
  %289 = add nuw nsw i64 %indvars.iv, 10
  %arrayidx914 = getelementptr inbounds double, double* %srcGrid, i64 %289
  %290 = insertelement <2 x double> undef, double %sub876, i32 0
  %291 = shufflevector <2 x double> %290, <2 x double> %236, <2 x i32> <i32 0, i32 2>
  %292 = shufflevector <2 x double> %236, <2 x double> %243, <2 x i32> <i32 0, i32 2>
  %293 = fsub <2 x double> %291, %292
  %294 = fadd <2 x double> %291, %292
  %295 = shufflevector <2 x double> %293, <2 x double> %294, <2 x i32> <i32 0, i32 3>
  %296 = fmul <2 x double> %295, <double 4.500000e+00, double 4.500000e+00>
  %297 = fadd <2 x double> %296, <double 3.000000e+00, double 3.000000e+00>
  %298 = fmul <2 x double> %295, %297
  %299 = fadd <2 x double> %298, <double 1.000000e+00, double 1.000000e+00>
  %300 = fsub <2 x double> %299, %251
  %301 = fmul <2 x double> %300, <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>
  %302 = bitcast double* %arrayidx914 to <2 x double>*
  store <2 x double> %301, <2 x double>* %302, align 8, !tbaa !27
  %303 = add nuw nsw i64 %indvars.iv, 12
  %arrayidx938 = getelementptr inbounds double, double* %srcGrid, i64 %303
  %sub940 = fsub double -0.000000e+00, %238
  %304 = shufflevector <2 x double> %243, <2 x double> %236, <2 x i32> <i32 0, i32 2>
  %305 = fsub <2 x double> %292, %304
  %306 = fmul <2 x double> %305, <double 4.500000e+00, double 4.500000e+00>
  %307 = fadd <2 x double> %306, <double 3.000000e+00, double 3.000000e+00>
  %308 = fmul <2 x double> %305, %307
  %309 = fadd <2 x double> %308, <double 1.000000e+00, double 1.000000e+00>
  %310 = fsub <2 x double> %309, %251
  %311 = fmul <2 x double> %310, <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>
  %312 = bitcast double* %arrayidx938 to <2 x double>*
  store <2 x double> %311, <2 x double>* %312, align 8, !tbaa !27
  %313 = add nuw nsw i64 %indvars.iv, 14
  %arrayidx966 = getelementptr inbounds double, double* %srcGrid, i64 %313
  %314 = insertelement <2 x double> undef, double %sub940, i32 0
  %315 = shufflevector <2 x double> %314, <2 x double> %236, <2 x i32> <i32 0, i32 3>
  %316 = shufflevector <2 x double> %243, <2 x double> undef, <2 x i32> zeroinitializer
  %317 = fsub <2 x double> %315, %316
  %318 = fadd <2 x double> %315, %316
  %319 = shufflevector <2 x double> %317, <2 x double> %318, <2 x i32> <i32 0, i32 3>
  %320 = fmul <2 x double> %319, <double 4.500000e+00, double 4.500000e+00>
  %321 = fadd <2 x double> %320, <double 3.000000e+00, double 3.000000e+00>
  %322 = fmul <2 x double> %319, %321
  %323 = fadd <2 x double> %322, <double 1.000000e+00, double 1.000000e+00>
  %324 = fsub <2 x double> %323, %251
  %325 = fmul <2 x double> %324, <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>
  %326 = bitcast double* %arrayidx966 to <2 x double>*
  store <2 x double> %325, <2 x double>* %326, align 8, !tbaa !27
  %327 = add nuw nsw i64 %indvars.iv, 16
  %arrayidx990 = getelementptr inbounds double, double* %srcGrid, i64 %327
  %328 = shufflevector <2 x double> %243, <2 x double> %236, <2 x i32> <i32 0, i32 3>
  %329 = fsub <2 x double> %267, %328
  %330 = fmul <2 x double> %329, <double 4.500000e+00, double 4.500000e+00>
  %331 = fadd <2 x double> %330, <double 3.000000e+00, double 3.000000e+00>
  %332 = fmul <2 x double> %329, %331
  %333 = fadd <2 x double> %332, <double 1.000000e+00, double 1.000000e+00>
  %334 = fsub <2 x double> %333, %251
  %335 = fmul <2 x double> %334, <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>
  %336 = bitcast double* %arrayidx990 to <2 x double>*
  store <2 x double> %335, <2 x double>* %336, align 8, !tbaa !27
  %sub1007 = fsub double %sub876, %246
  %mul1010 = fmul double %sub1007, 4.500000e+00
  %add1011 = fadd double %mul1010, 3.000000e+00
  %mul1012 = fmul double %sub1007, %add1011
  %add1013 = fadd double %mul1012, 1.000000e+00
  %sub1014 = fsub double %add1013, %mul796
  %mul1015 = fmul double %sub1014, 0x3F9C71C71C71C71C
  %337 = add nuw nsw i64 %indvars.iv, 18
  %arrayidx1018 = getelementptr inbounds double, double* %srcGrid, i64 %337
  store double %mul1015, double* %arrayidx1018, align 8, !tbaa !27
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 20
  %cmp392 = icmp ult i64 %indvars.iv.next, 26000000
  br i1 %cmp392, label %for.body394, label %for.end1021

for.end1021:                                      ; preds = %for.body394
  %puts1608 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @str.34, i64 0, i64 0))
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @LBM_performStreamCollide(double* readonly %srcGrid, double* %dstGrid) local_unnamed_addr #0 {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @str.27, i64 0, i64 0))
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %0 = add nuw nsw i64 %indvars.iv, 19
  %arrayidx = getelementptr inbounds double, double* %srcGrid, i64 %0
  %1 = bitcast double* %arrayidx to i32*
  %2 = load i32, i32* %1, align 4, !tbaa !28
  %and = and i32 %2, 1
  %tobool = icmp eq i32 %and, 0
  %arrayidx3 = getelementptr inbounds double, double* %srcGrid, i64 %indvars.iv
  %3 = load double, double* %arrayidx3, align 8, !tbaa !27
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %for.body
  %arrayidx6 = getelementptr inbounds double, double* %dstGrid, i64 %indvars.iv
  store double %3, double* %arrayidx6, align 8, !tbaa !27
  %4 = or i64 %indvars.iv, 1
  %arrayidx9 = getelementptr inbounds double, double* %srcGrid, i64 %4
  %5 = bitcast double* %arrayidx9 to i64*
  %6 = load i64, i64* %5, align 8, !tbaa !27
  %7 = add nsw i64 %indvars.iv, -1998
  %arrayidx12 = getelementptr inbounds double, double* %dstGrid, i64 %7
  %8 = bitcast double* %arrayidx12 to i64*
  store i64 %6, i64* %8, align 8, !tbaa !27
  %9 = or i64 %indvars.iv, 2
  %arrayidx15 = getelementptr inbounds double, double* %srcGrid, i64 %9
  %10 = bitcast double* %arrayidx15 to i64*
  %11 = load i64, i64* %10, align 8, !tbaa !27
  %12 = add nuw nsw i64 %indvars.iv, 2001
  %arrayidx18 = getelementptr inbounds double, double* %dstGrid, i64 %12
  %13 = bitcast double* %arrayidx18 to i64*
  store i64 %11, i64* %13, align 8, !tbaa !27
  %14 = or i64 %indvars.iv, 3
  %arrayidx21 = getelementptr inbounds double, double* %srcGrid, i64 %14
  %15 = bitcast double* %arrayidx21 to i64*
  %16 = load i64, i64* %15, align 8, !tbaa !27
  %17 = add nsw i64 %indvars.iv, -16
  %arrayidx24 = getelementptr inbounds double, double* %dstGrid, i64 %17
  %18 = bitcast double* %arrayidx24 to i64*
  store i64 %16, i64* %18, align 8, !tbaa !27
  %19 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx27 = getelementptr inbounds double, double* %srcGrid, i64 %19
  %20 = bitcast double* %arrayidx27 to i64*
  %21 = load i64, i64* %20, align 8, !tbaa !27
  %22 = add nuw nsw i64 %indvars.iv, 23
  %arrayidx30 = getelementptr inbounds double, double* %dstGrid, i64 %22
  %23 = bitcast double* %arrayidx30 to i64*
  store i64 %21, i64* %23, align 8, !tbaa !27
  %24 = add nuw nsw i64 %indvars.iv, 5
  %arrayidx33 = getelementptr inbounds double, double* %srcGrid, i64 %24
  %25 = bitcast double* %arrayidx33 to i64*
  %26 = load i64, i64* %25, align 8, !tbaa !27
  %27 = add nsw i64 %indvars.iv, -199994
  %arrayidx36 = getelementptr inbounds double, double* %dstGrid, i64 %27
  %28 = bitcast double* %arrayidx36 to i64*
  store i64 %26, i64* %28, align 8, !tbaa !27
  %29 = add nuw nsw i64 %indvars.iv, 6
  %arrayidx39 = getelementptr inbounds double, double* %srcGrid, i64 %29
  %30 = bitcast double* %arrayidx39 to i64*
  %31 = load i64, i64* %30, align 8, !tbaa !27
  %32 = add nuw nsw i64 %indvars.iv, 200005
  %arrayidx42 = getelementptr inbounds double, double* %dstGrid, i64 %32
  %33 = bitcast double* %arrayidx42 to i64*
  store i64 %31, i64* %33, align 8, !tbaa !27
  %34 = add nuw nsw i64 %indvars.iv, 7
  %arrayidx45 = getelementptr inbounds double, double* %srcGrid, i64 %34
  %35 = bitcast double* %arrayidx45 to i64*
  %36 = load i64, i64* %35, align 8, !tbaa !27
  %37 = add nsw i64 %indvars.iv, -2010
  %arrayidx48 = getelementptr inbounds double, double* %dstGrid, i64 %37
  %38 = bitcast double* %arrayidx48 to i64*
  store i64 %36, i64* %38, align 8, !tbaa !27
  %39 = add nuw nsw i64 %indvars.iv, 8
  %arrayidx51 = getelementptr inbounds double, double* %srcGrid, i64 %39
  %40 = bitcast double* %arrayidx51 to i64*
  %41 = load i64, i64* %40, align 8, !tbaa !27
  %42 = add nsw i64 %indvars.iv, -1971
  %arrayidx54 = getelementptr inbounds double, double* %dstGrid, i64 %42
  %43 = bitcast double* %arrayidx54 to i64*
  store i64 %41, i64* %43, align 8, !tbaa !27
  %44 = add nuw nsw i64 %indvars.iv, 9
  %arrayidx57 = getelementptr inbounds double, double* %srcGrid, i64 %44
  %45 = bitcast double* %arrayidx57 to i64*
  %46 = load i64, i64* %45, align 8, !tbaa !27
  %47 = add nuw nsw i64 %indvars.iv, 1988
  %arrayidx60 = getelementptr inbounds double, double* %dstGrid, i64 %47
  %48 = bitcast double* %arrayidx60 to i64*
  store i64 %46, i64* %48, align 8, !tbaa !27
  %49 = add nuw nsw i64 %indvars.iv, 10
  %arrayidx63 = getelementptr inbounds double, double* %srcGrid, i64 %49
  %50 = bitcast double* %arrayidx63 to i64*
  %51 = load i64, i64* %50, align 8, !tbaa !27
  %52 = add nuw nsw i64 %indvars.iv, 2027
  %arrayidx66 = getelementptr inbounds double, double* %dstGrid, i64 %52
  %53 = bitcast double* %arrayidx66 to i64*
  store i64 %51, i64* %53, align 8, !tbaa !27
  %54 = add nuw nsw i64 %indvars.iv, 11
  %arrayidx69 = getelementptr inbounds double, double* %srcGrid, i64 %54
  %55 = bitcast double* %arrayidx69 to i64*
  %56 = load i64, i64* %55, align 8, !tbaa !27
  %57 = add nsw i64 %indvars.iv, -201986
  %arrayidx72 = getelementptr inbounds double, double* %dstGrid, i64 %57
  %58 = bitcast double* %arrayidx72 to i64*
  store i64 %56, i64* %58, align 8, !tbaa !27
  %59 = add nuw nsw i64 %indvars.iv, 12
  %arrayidx75 = getelementptr inbounds double, double* %srcGrid, i64 %59
  %60 = bitcast double* %arrayidx75 to i64*
  %61 = load i64, i64* %60, align 8, !tbaa !27
  %62 = add nuw nsw i64 %indvars.iv, 198013
  %arrayidx78 = getelementptr inbounds double, double* %dstGrid, i64 %62
  %63 = bitcast double* %arrayidx78 to i64*
  store i64 %61, i64* %63, align 8, !tbaa !27
  %64 = add nuw nsw i64 %indvars.iv, 13
  %arrayidx81 = getelementptr inbounds double, double* %srcGrid, i64 %64
  %65 = bitcast double* %arrayidx81 to i64*
  %66 = load i64, i64* %65, align 8, !tbaa !27
  %67 = add nsw i64 %indvars.iv, -197988
  %arrayidx84 = getelementptr inbounds double, double* %dstGrid, i64 %67
  %68 = bitcast double* %arrayidx84 to i64*
  store i64 %66, i64* %68, align 8, !tbaa !27
  %69 = add nuw nsw i64 %indvars.iv, 14
  %arrayidx87 = getelementptr inbounds double, double* %srcGrid, i64 %69
  %70 = bitcast double* %arrayidx87 to i64*
  %71 = load i64, i64* %70, align 8, !tbaa !27
  %72 = add nuw nsw i64 %indvars.iv, 202011
  %arrayidx90 = getelementptr inbounds double, double* %dstGrid, i64 %72
  %73 = bitcast double* %arrayidx90 to i64*
  store i64 %71, i64* %73, align 8, !tbaa !27
  %74 = add nuw nsw i64 %indvars.iv, 15
  %arrayidx93 = getelementptr inbounds double, double* %srcGrid, i64 %74
  %75 = bitcast double* %arrayidx93 to i64*
  %76 = load i64, i64* %75, align 8, !tbaa !27
  %77 = add nsw i64 %indvars.iv, -200002
  %arrayidx96 = getelementptr inbounds double, double* %dstGrid, i64 %77
  %78 = bitcast double* %arrayidx96 to i64*
  store i64 %76, i64* %78, align 8, !tbaa !27
  %79 = add nuw nsw i64 %indvars.iv, 16
  %arrayidx99 = getelementptr inbounds double, double* %srcGrid, i64 %79
  %80 = bitcast double* %arrayidx99 to i64*
  %81 = load i64, i64* %80, align 8, !tbaa !27
  %82 = add nuw nsw i64 %indvars.iv, 199997
  %arrayidx102 = getelementptr inbounds double, double* %dstGrid, i64 %82
  %83 = bitcast double* %arrayidx102 to i64*
  store i64 %81, i64* %83, align 8, !tbaa !27
  %84 = add nuw nsw i64 %indvars.iv, 17
  %arrayidx105 = getelementptr inbounds double, double* %srcGrid, i64 %84
  %85 = bitcast double* %arrayidx105 to i64*
  %86 = load i64, i64* %85, align 8, !tbaa !27
  %87 = add nsw i64 %indvars.iv, -199964
  %arrayidx108 = getelementptr inbounds double, double* %dstGrid, i64 %87
  %88 = bitcast double* %arrayidx108 to i64*
  store i64 %86, i64* %88, align 8, !tbaa !27
  %89 = add nuw nsw i64 %indvars.iv, 18
  %arrayidx111 = getelementptr inbounds double, double* %srcGrid, i64 %89
  %90 = bitcast double* %arrayidx111 to i64*
  %91 = load i64, i64* %90, align 8, !tbaa !27
  %92 = add nuw nsw i64 %indvars.iv, 200035
  %arrayidx114 = getelementptr inbounds double, double* %dstGrid, i64 %92
  %93 = bitcast double* %arrayidx114 to i64*
  store i64 %91, i64* %93, align 8, !tbaa !27
  br label %for.inc

if.end:                                           ; preds = %for.body
  %94 = or i64 %indvars.iv, 1
  %arrayidx120 = getelementptr inbounds double, double* %srcGrid, i64 %94
  %95 = load double, double* %arrayidx120, align 8, !tbaa !27
  %add121 = fadd double %3, %95
  %96 = or i64 %indvars.iv, 2
  %arrayidx124 = getelementptr inbounds double, double* %srcGrid, i64 %96
  %97 = load double, double* %arrayidx124, align 8, !tbaa !27
  %add125 = fadd double %add121, %97
  %98 = or i64 %indvars.iv, 3
  %arrayidx128 = getelementptr inbounds double, double* %srcGrid, i64 %98
  %99 = load double, double* %arrayidx128, align 8, !tbaa !27
  %add129 = fadd double %add125, %99
  %100 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx132 = getelementptr inbounds double, double* %srcGrid, i64 %100
  %101 = load double, double* %arrayidx132, align 8, !tbaa !27
  %add133 = fadd double %add129, %101
  %102 = add nuw nsw i64 %indvars.iv, 5
  %arrayidx136 = getelementptr inbounds double, double* %srcGrid, i64 %102
  %103 = load double, double* %arrayidx136, align 8, !tbaa !27
  %add137 = fadd double %add133, %103
  %104 = add nuw nsw i64 %indvars.iv, 6
  %arrayidx140 = getelementptr inbounds double, double* %srcGrid, i64 %104
  %105 = load double, double* %arrayidx140, align 8, !tbaa !27
  %add141 = fadd double %add137, %105
  %106 = add nuw nsw i64 %indvars.iv, 7
  %arrayidx144 = getelementptr inbounds double, double* %srcGrid, i64 %106
  %107 = load double, double* %arrayidx144, align 8, !tbaa !27
  %add145 = fadd double %add141, %107
  %108 = add nuw nsw i64 %indvars.iv, 8
  %arrayidx148 = getelementptr inbounds double, double* %srcGrid, i64 %108
  %109 = load double, double* %arrayidx148, align 8, !tbaa !27
  %add149 = fadd double %add145, %109
  %110 = add nuw nsw i64 %indvars.iv, 9
  %arrayidx152 = getelementptr inbounds double, double* %srcGrid, i64 %110
  %111 = load double, double* %arrayidx152, align 8, !tbaa !27
  %add153 = fadd double %add149, %111
  %112 = add nuw nsw i64 %indvars.iv, 10
  %arrayidx156 = getelementptr inbounds double, double* %srcGrid, i64 %112
  %113 = load double, double* %arrayidx156, align 8, !tbaa !27
  %add157 = fadd double %add153, %113
  %114 = add nuw nsw i64 %indvars.iv, 11
  %arrayidx160 = getelementptr inbounds double, double* %srcGrid, i64 %114
  %115 = load double, double* %arrayidx160, align 8, !tbaa !27
  %add161 = fadd double %add157, %115
  %116 = add nuw nsw i64 %indvars.iv, 12
  %arrayidx164 = getelementptr inbounds double, double* %srcGrid, i64 %116
  %117 = load double, double* %arrayidx164, align 8, !tbaa !27
  %add165 = fadd double %add161, %117
  %118 = add nuw nsw i64 %indvars.iv, 13
  %arrayidx168 = getelementptr inbounds double, double* %srcGrid, i64 %118
  %119 = load double, double* %arrayidx168, align 8, !tbaa !27
  %add169 = fadd double %add165, %119
  %120 = add nuw nsw i64 %indvars.iv, 14
  %arrayidx172 = getelementptr inbounds double, double* %srcGrid, i64 %120
  %121 = load double, double* %arrayidx172, align 8, !tbaa !27
  %add173 = fadd double %add169, %121
  %122 = add nuw nsw i64 %indvars.iv, 15
  %arrayidx176 = getelementptr inbounds double, double* %srcGrid, i64 %122
  %123 = load double, double* %arrayidx176, align 8, !tbaa !27
  %add177 = fadd double %add173, %123
  %124 = add nuw nsw i64 %indvars.iv, 16
  %arrayidx180 = getelementptr inbounds double, double* %srcGrid, i64 %124
  %125 = load double, double* %arrayidx180, align 8, !tbaa !27
  %add181 = fadd double %add177, %125
  %126 = add nuw nsw i64 %indvars.iv, 17
  %arrayidx184 = getelementptr inbounds double, double* %srcGrid, i64 %126
  %127 = load double, double* %arrayidx184, align 8, !tbaa !27
  %add185 = fadd double %add181, %127
  %128 = add nuw nsw i64 %indvars.iv, 18
  %arrayidx188 = getelementptr inbounds double, double* %srcGrid, i64 %128
  %129 = load double, double* %arrayidx188, align 8, !tbaa !27
  %add189 = fadd double %add185, %129
  %sub = fsub double %99, %101
  %add199 = fadd double %sub, %107
  %sub203 = fsub double %add199, %109
  %add207 = fadd double %sub203, %111
  %sub211 = fsub double %add207, %113
  %add215 = fadd double %sub211, %123
  %add219 = fadd double %add215, %125
  %sub223 = fsub double %add219, %127
  %sub227 = fsub double %sub223, %129
  %sub234 = fsub double %95, %97
  %add238 = fadd double %sub234, %107
  %add242 = fadd double %add238, %109
  %sub246 = fsub double %add242, %111
  %sub250 = fsub double %sub246, %113
  %add254 = fadd double %sub250, %115
  %add258 = fadd double %add254, %117
  %sub262 = fsub double %add258, %119
  %sub266 = fsub double %sub262, %121
  %sub273 = fsub double %103, %105
  %add277 = fadd double %sub273, %115
  %sub281 = fsub double %add277, %117
  %add285 = fadd double %sub281, %119
  %sub289 = fsub double %add285, %121
  %add293 = fadd double %sub289, %123
  %sub297 = fsub double %add293, %125
  %add301 = fadd double %sub297, %127
  %sub305 = fsub double %add301, %129
  %div = fdiv double %sub227, %add189
  %div306 = fdiv double %sub266, %add189
  %div307 = fdiv double %sub305, %add189
  %and311 = and i32 %2, 2
  %tobool312 = icmp eq i32 %and311, 0
  %spec.select = select i1 %tobool312, double %div306, double 2.000000e-03
  %spec.select1002 = select i1 %tobool312, double %div307, double 0.000000e+00
  %spec.select1003 = select i1 %tobool312, double %div, double 5.000000e-03
  %mul = fmul double %spec.select1003, %spec.select1003
  %mul315 = fmul double %spec.select, %spec.select
  %add316 = fadd double %mul, %mul315
  %mul317 = fmul double %spec.select1002, %spec.select1002
  %add318 = fadd double %mul317, %add316
  %mul319 = fmul double %add318, 1.500000e+00
  %mul323 = fmul double %3, 0x3FEE666666666666
  %mul324 = fmul double %add189, 0x3FE4CCCCCCCCCCCC
  %sub325 = fsub double 1.000000e+00, %mul319
  %mul326 = fmul double %mul324, %sub325
  %add3271004 = fsub double %mul326, %mul323
  %arrayidx330 = getelementptr inbounds double, double* %dstGrid, i64 %indvars.iv
  store double %add3271004, double* %arrayidx330, align 8, !tbaa !27
  %130 = load double, double* %arrayidx120, align 8, !tbaa !27
  %mul334 = fmul double %130, 0x3FEE666666666666
  %mul335 = fmul double %add189, 0x3FBBBBBBBBBBBBBB
  %mul336 = fmul double %spec.select, 4.500000e+00
  %add337 = fadd double %mul336, 3.000000e+00
  %mul338 = fmul double %spec.select, %add337
  %add339 = fadd double %mul338, 1.000000e+00
  %sub340 = fsub double %add339, %mul319
  %mul341 = fmul double %mul335, %sub340
  %add3421005 = fsub double %mul341, %mul334
  %131 = add nuw nsw i64 %indvars.iv, 2001
  %arrayidx345 = getelementptr inbounds double, double* %dstGrid, i64 %131
  store double %add3421005, double* %arrayidx345, align 8, !tbaa !27
  %132 = load double, double* %arrayidx124, align 8, !tbaa !27
  %mul349 = fmul double %132, 0x3FEE666666666666
  %sub352 = fadd double %mul336, -3.000000e+00
  %mul353 = fmul double %spec.select, %sub352
  %add354 = fadd double %mul353, 1.000000e+00
  %sub355 = fsub double %add354, %mul319
  %mul356 = fmul double %mul335, %sub355
  %add3571006 = fsub double %mul356, %mul349
  %133 = add nsw i64 %indvars.iv, -1998
  %arrayidx360 = getelementptr inbounds double, double* %dstGrid, i64 %133
  store double %add3571006, double* %arrayidx360, align 8, !tbaa !27
  %134 = load double, double* %arrayidx128, align 8, !tbaa !27
  %mul364 = fmul double %134, 0x3FEE666666666666
  %mul366 = fmul double %spec.select1003, 4.500000e+00
  %add367 = fadd double %mul366, 3.000000e+00
  %mul368 = fmul double %spec.select1003, %add367
  %add369 = fadd double %mul368, 1.000000e+00
  %sub370 = fsub double %add369, %mul319
  %mul371 = fmul double %mul335, %sub370
  %add3721007 = fsub double %mul371, %mul364
  %135 = add nuw nsw i64 %indvars.iv, 23
  %arrayidx375 = getelementptr inbounds double, double* %dstGrid, i64 %135
  store double %add3721007, double* %arrayidx375, align 8, !tbaa !27
  %136 = load double, double* %arrayidx132, align 8, !tbaa !27
  %mul379 = fmul double %136, 0x3FEE666666666666
  %sub382 = fadd double %mul366, -3.000000e+00
  %mul383 = fmul double %spec.select1003, %sub382
  %add384 = fadd double %mul383, 1.000000e+00
  %sub385 = fsub double %add384, %mul319
  %mul386 = fmul double %mul335, %sub385
  %add3871008 = fsub double %mul386, %mul379
  %137 = add nsw i64 %indvars.iv, -16
  %arrayidx390 = getelementptr inbounds double, double* %dstGrid, i64 %137
  store double %add3871008, double* %arrayidx390, align 8, !tbaa !27
  %138 = load double, double* %arrayidx136, align 8, !tbaa !27
  %mul394 = fmul double %138, 0x3FEE666666666666
  %mul396 = fmul double %spec.select1002, 4.500000e+00
  %add397 = fadd double %mul396, 3.000000e+00
  %mul398 = fmul double %spec.select1002, %add397
  %add399 = fadd double %mul398, 1.000000e+00
  %sub400 = fsub double %add399, %mul319
  %mul401 = fmul double %mul335, %sub400
  %add4021009 = fsub double %mul401, %mul394
  %139 = add nuw nsw i64 %indvars.iv, 200005
  %arrayidx405 = getelementptr inbounds double, double* %dstGrid, i64 %139
  store double %add4021009, double* %arrayidx405, align 8, !tbaa !27
  %140 = load double, double* %arrayidx140, align 8, !tbaa !27
  %mul409 = fmul double %140, 0x3FEE666666666666
  %sub412 = fadd double %mul396, -3.000000e+00
  %mul413 = fmul double %spec.select1002, %sub412
  %add414 = fadd double %mul413, 1.000000e+00
  %sub415 = fsub double %add414, %mul319
  %mul416 = fmul double %mul335, %sub415
  %add4171010 = fsub double %mul416, %mul409
  %141 = add nsw i64 %indvars.iv, -199994
  %arrayidx420 = getelementptr inbounds double, double* %dstGrid, i64 %141
  store double %add4171010, double* %arrayidx420, align 8, !tbaa !27
  %142 = load double, double* %arrayidx144, align 8, !tbaa !27
  %mul424 = fmul double %142, 0x3FEE666666666666
  %mul425 = fmul double %add189, 0x3FABBBBBBBBBBBBB
  %add426 = fadd double %spec.select1003, %spec.select
  %mul428 = fmul double %add426, 4.500000e+00
  %add429 = fadd double %mul428, 3.000000e+00
  %mul430 = fmul double %add426, %add429
  %add431 = fadd double %mul430, 1.000000e+00
  %sub432 = fsub double %add431, %mul319
  %mul433 = fmul double %mul425, %sub432
  %add4341011 = fsub double %mul433, %mul424
  %143 = add nuw nsw i64 %indvars.iv, 2027
  %arrayidx437 = getelementptr inbounds double, double* %dstGrid, i64 %143
  store double %add4341011, double* %arrayidx437, align 8, !tbaa !27
  %144 = load double, double* %arrayidx148, align 8, !tbaa !27
  %mul441 = fmul double %144, 0x3FEE666666666666
  %sub443 = fsub double -0.000000e+00, %spec.select1003
  %add444 = fsub double %spec.select, %spec.select1003
  %mul447 = fmul double %add444, 4.500000e+00
  %add448 = fadd double %mul447, 3.000000e+00
  %mul449 = fmul double %add444, %add448
  %add450 = fadd double %mul449, 1.000000e+00
  %sub451 = fsub double %add450, %mul319
  %mul452 = fmul double %mul425, %sub451
  %add4531012 = fsub double %mul452, %mul441
  %145 = add nuw nsw i64 %indvars.iv, 1988
  %arrayidx456 = getelementptr inbounds double, double* %dstGrid, i64 %145
  store double %add4531012, double* %arrayidx456, align 8, !tbaa !27
  %146 = load double, double* %arrayidx152, align 8, !tbaa !27
  %mul460 = fmul double %146, 0x3FEE666666666666
  %sub462 = fsub double %spec.select1003, %spec.select
  %mul464 = fmul double %sub462, 4.500000e+00
  %add465 = fadd double %mul464, 3.000000e+00
  %mul466 = fmul double %sub462, %add465
  %add467 = fadd double %mul466, 1.000000e+00
  %sub468 = fsub double %add467, %mul319
  %mul469 = fmul double %mul425, %sub468
  %add4701013 = fsub double %mul469, %mul460
  %147 = add nsw i64 %indvars.iv, -1971
  %arrayidx473 = getelementptr inbounds double, double* %dstGrid, i64 %147
  store double %add4701013, double* %arrayidx473, align 8, !tbaa !27
  %148 = load double, double* %arrayidx156, align 8, !tbaa !27
  %mul477 = fmul double %148, 0x3FEE666666666666
  %sub480 = fsub double %sub443, %spec.select
  %mul483 = fmul double %sub480, 4.500000e+00
  %add484 = fadd double %mul483, 3.000000e+00
  %mul485 = fmul double %sub480, %add484
  %add486 = fadd double %mul485, 1.000000e+00
  %sub487 = fsub double %add486, %mul319
  %mul488 = fmul double %mul425, %sub487
  %add4891014 = fsub double %mul488, %mul477
  %149 = add nsw i64 %indvars.iv, -2010
  %arrayidx492 = getelementptr inbounds double, double* %dstGrid, i64 %149
  store double %add4891014, double* %arrayidx492, align 8, !tbaa !27
  %150 = load double, double* %arrayidx160, align 8, !tbaa !27
  %mul496 = fmul double %150, 0x3FEE666666666666
  %add498 = fadd double %spec.select, %spec.select1002
  %mul500 = fmul double %add498, 4.500000e+00
  %add501 = fadd double %mul500, 3.000000e+00
  %mul502 = fmul double %add498, %add501
  %add503 = fadd double %mul502, 1.000000e+00
  %sub504 = fsub double %add503, %mul319
  %mul505 = fmul double %mul425, %sub504
  %add5061015 = fsub double %mul505, %mul496
  %151 = add nuw nsw i64 %indvars.iv, 202011
  %arrayidx509 = getelementptr inbounds double, double* %dstGrid, i64 %151
  store double %add5061015, double* %arrayidx509, align 8, !tbaa !27
  %152 = load double, double* %arrayidx164, align 8, !tbaa !27
  %mul513 = fmul double %152, 0x3FEE666666666666
  %sub515 = fsub double %spec.select, %spec.select1002
  %mul517 = fmul double %sub515, 4.500000e+00
  %add518 = fadd double %mul517, 3.000000e+00
  %mul519 = fmul double %sub515, %add518
  %add520 = fadd double %mul519, 1.000000e+00
  %sub521 = fsub double %add520, %mul319
  %mul522 = fmul double %mul425, %sub521
  %add5231016 = fsub double %mul522, %mul513
  %153 = add nsw i64 %indvars.iv, -197988
  %arrayidx526 = getelementptr inbounds double, double* %dstGrid, i64 %153
  store double %add5231016, double* %arrayidx526, align 8, !tbaa !27
  %154 = load double, double* %arrayidx168, align 8, !tbaa !27
  %mul530 = fmul double %154, 0x3FEE666666666666
  %sub532 = fsub double -0.000000e+00, %spec.select
  %add533 = fsub double %spec.select1002, %spec.select
  %mul536 = fmul double %add533, 4.500000e+00
  %add537 = fadd double %mul536, 3.000000e+00
  %mul538 = fmul double %add533, %add537
  %add539 = fadd double %mul538, 1.000000e+00
  %sub540 = fsub double %add539, %mul319
  %mul541 = fmul double %mul425, %sub540
  %add5421017 = fsub double %mul541, %mul530
  %155 = add nuw nsw i64 %indvars.iv, 198013
  %arrayidx545 = getelementptr inbounds double, double* %dstGrid, i64 %155
  store double %add5421017, double* %arrayidx545, align 8, !tbaa !27
  %156 = load double, double* %arrayidx172, align 8, !tbaa !27
  %mul549 = fmul double %156, 0x3FEE666666666666
  %sub552 = fsub double %sub532, %spec.select1002
  %mul555 = fmul double %sub552, 4.500000e+00
  %add556 = fadd double %mul555, 3.000000e+00
  %mul557 = fmul double %sub552, %add556
  %add558 = fadd double %mul557, 1.000000e+00
  %sub559 = fsub double %add558, %mul319
  %mul560 = fmul double %mul425, %sub559
  %add5611018 = fsub double %mul560, %mul549
  %157 = add nsw i64 %indvars.iv, -201986
  %arrayidx564 = getelementptr inbounds double, double* %dstGrid, i64 %157
  store double %add5611018, double* %arrayidx564, align 8, !tbaa !27
  %158 = load double, double* %arrayidx176, align 8, !tbaa !27
  %mul568 = fmul double %158, 0x3FEE666666666666
  %add570 = fadd double %spec.select1003, %spec.select1002
  %mul572 = fmul double %add570, 4.500000e+00
  %add573 = fadd double %mul572, 3.000000e+00
  %mul574 = fmul double %add570, %add573
  %add575 = fadd double %mul574, 1.000000e+00
  %sub576 = fsub double %add575, %mul319
  %mul577 = fmul double %mul425, %sub576
  %add5781019 = fsub double %mul577, %mul568
  %159 = add nuw nsw i64 %indvars.iv, 200035
  %arrayidx581 = getelementptr inbounds double, double* %dstGrid, i64 %159
  store double %add5781019, double* %arrayidx581, align 8, !tbaa !27
  %160 = load double, double* %arrayidx180, align 8, !tbaa !27
  %mul585 = fmul double %160, 0x3FEE666666666666
  %sub587 = fsub double %spec.select1003, %spec.select1002
  %mul589 = fmul double %sub587, 4.500000e+00
  %add590 = fadd double %mul589, 3.000000e+00
  %mul591 = fmul double %sub587, %add590
  %add592 = fadd double %mul591, 1.000000e+00
  %sub593 = fsub double %add592, %mul319
  %mul594 = fmul double %mul425, %sub593
  %add5951020 = fsub double %mul594, %mul585
  %161 = add nsw i64 %indvars.iv, -199964
  %arrayidx598 = getelementptr inbounds double, double* %dstGrid, i64 %161
  store double %add5951020, double* %arrayidx598, align 8, !tbaa !27
  %162 = load double, double* %arrayidx184, align 8, !tbaa !27
  %mul602 = fmul double %162, 0x3FEE666666666666
  %add605 = fsub double %spec.select1002, %spec.select1003
  %mul608 = fmul double %add605, 4.500000e+00
  %add609 = fadd double %mul608, 3.000000e+00
  %mul610 = fmul double %add605, %add609
  %add611 = fadd double %mul610, 1.000000e+00
  %sub612 = fsub double %add611, %mul319
  %mul613 = fmul double %mul425, %sub612
  %add6141021 = fsub double %mul613, %mul602
  %163 = add nuw nsw i64 %indvars.iv, 199997
  %arrayidx617 = getelementptr inbounds double, double* %dstGrid, i64 %163
  store double %add6141021, double* %arrayidx617, align 8, !tbaa !27
  %164 = load double, double* %arrayidx188, align 8, !tbaa !27
  %mul621 = fmul double %164, 0x3FEE666666666666
  %sub624 = fsub double %sub443, %spec.select1002
  %mul627 = fmul double %sub624, 4.500000e+00
  %add628 = fadd double %mul627, 3.000000e+00
  %mul629 = fmul double %sub624, %add628
  %add630 = fadd double %mul629, 1.000000e+00
  %sub631 = fsub double %add630, %mul319
  %mul632 = fmul double %mul425, %sub631
  %add6331022 = fsub double %mul632, %mul621
  %165 = add nsw i64 %indvars.iv, -200002
  %arrayidx636 = getelementptr inbounds double, double* %dstGrid, i64 %165
  store double %add6331022, double* %arrayidx636, align 8, !tbaa !27
  br label %for.inc

for.inc:                                          ; preds = %if.end, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 20
  %cmp = icmp ult i64 %indvars.iv.next, 26000000
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc
  %puts1001 = tail call i32 @puts(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @str.28, i64 0, i64 0))
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define dso_local void @LBM_swapGrids([26000000 x double]** nocapture %grid1, [26000000 x double]** nocapture %grid2) local_unnamed_addr #2 {
entry:
  %0 = bitcast [26000000 x double]** %grid1 to i64*
  %1 = load i64, i64* %0, align 8, !tbaa !18
  %2 = bitcast [26000000 x double]** %grid2 to i64*
  %3 = load i64, i64* %2, align 8, !tbaa !18
  store i64 %3, i64* %0, align 8, !tbaa !18
  store i64 %1, i64* %2, align 8, !tbaa !18
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local void @LBM_showGridStatistics(double* nocapture readonly %grid) local_unnamed_addr #0 {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @str.33, i64 0, i64 0))
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %mass.0370 = phi double [ 0.000000e+00, %entry ], [ %add77, %for.inc ]
  %nObstacleCells.0369 = phi i32 [ 0, %entry ], [ %nObstacleCells.1, %for.inc ]
  %maxRho.0368 = phi double [ -1.000000e+30, %entry ], [ %maxRho.1, %for.inc ]
  %minRho.0367 = phi double [ 1.000000e+30, %entry ], [ %minRho.1, %for.inc ]
  %nAccelCells.0366 = phi i32 [ 0, %entry ], [ %nAccelCells.2, %for.inc ]
  %maxU2.0365 = phi double [ -1.000000e+30, %entry ], [ %maxU2.1, %for.inc ]
  %minU2.0364 = phi double [ 1.000000e+30, %entry ], [ %minU2.2, %for.inc ]
  %nFluidCells.0363 = phi i32 [ 0, %entry ], [ %nFluidCells.2, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %grid, i64 %indvars.iv
  %0 = load double, double* %arrayidx, align 8, !tbaa !27
  %1 = or i64 %indvars.iv, 1
  %arrayidx3 = getelementptr inbounds double, double* %grid, i64 %1
  %2 = load double, double* %arrayidx3, align 8, !tbaa !27
  %add4 = fadd double %0, %2
  %3 = or i64 %indvars.iv, 2
  %arrayidx7 = getelementptr inbounds double, double* %grid, i64 %3
  %4 = load double, double* %arrayidx7, align 8, !tbaa !27
  %add8 = fadd double %add4, %4
  %5 = or i64 %indvars.iv, 3
  %arrayidx11 = getelementptr inbounds double, double* %grid, i64 %5
  %6 = load double, double* %arrayidx11, align 8, !tbaa !27
  %add12 = fadd double %add8, %6
  %7 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx15 = getelementptr inbounds double, double* %grid, i64 %7
  %8 = load double, double* %arrayidx15, align 8, !tbaa !27
  %add16 = fadd double %add12, %8
  %9 = add nuw nsw i64 %indvars.iv, 5
  %arrayidx19 = getelementptr inbounds double, double* %grid, i64 %9
  %10 = load double, double* %arrayidx19, align 8, !tbaa !27
  %add20 = fadd double %add16, %10
  %11 = add nuw nsw i64 %indvars.iv, 6
  %arrayidx23 = getelementptr inbounds double, double* %grid, i64 %11
  %12 = load double, double* %arrayidx23, align 8, !tbaa !27
  %add24 = fadd double %add20, %12
  %13 = add nuw nsw i64 %indvars.iv, 7
  %arrayidx27 = getelementptr inbounds double, double* %grid, i64 %13
  %14 = load double, double* %arrayidx27, align 8, !tbaa !27
  %add28 = fadd double %add24, %14
  %15 = add nuw nsw i64 %indvars.iv, 8
  %arrayidx31 = getelementptr inbounds double, double* %grid, i64 %15
  %16 = load double, double* %arrayidx31, align 8, !tbaa !27
  %add32 = fadd double %add28, %16
  %17 = add nuw nsw i64 %indvars.iv, 9
  %arrayidx35 = getelementptr inbounds double, double* %grid, i64 %17
  %18 = load double, double* %arrayidx35, align 8, !tbaa !27
  %add36 = fadd double %add32, %18
  %19 = add nuw nsw i64 %indvars.iv, 10
  %arrayidx39 = getelementptr inbounds double, double* %grid, i64 %19
  %20 = load double, double* %arrayidx39, align 8, !tbaa !27
  %add40 = fadd double %add36, %20
  %21 = add nuw nsw i64 %indvars.iv, 11
  %arrayidx43 = getelementptr inbounds double, double* %grid, i64 %21
  %22 = load double, double* %arrayidx43, align 8, !tbaa !27
  %add44 = fadd double %add40, %22
  %23 = add nuw nsw i64 %indvars.iv, 12
  %arrayidx47 = getelementptr inbounds double, double* %grid, i64 %23
  %24 = load double, double* %arrayidx47, align 8, !tbaa !27
  %add48 = fadd double %add44, %24
  %25 = add nuw nsw i64 %indvars.iv, 13
  %arrayidx51 = getelementptr inbounds double, double* %grid, i64 %25
  %26 = load double, double* %arrayidx51, align 8, !tbaa !27
  %add52 = fadd double %add48, %26
  %27 = add nuw nsw i64 %indvars.iv, 14
  %arrayidx55 = getelementptr inbounds double, double* %grid, i64 %27
  %28 = load double, double* %arrayidx55, align 8, !tbaa !27
  %add56 = fadd double %add52, %28
  %29 = add nuw nsw i64 %indvars.iv, 15
  %arrayidx59 = getelementptr inbounds double, double* %grid, i64 %29
  %30 = load double, double* %arrayidx59, align 8, !tbaa !27
  %add60 = fadd double %add56, %30
  %31 = add nuw nsw i64 %indvars.iv, 16
  %arrayidx63 = getelementptr inbounds double, double* %grid, i64 %31
  %32 = load double, double* %arrayidx63, align 8, !tbaa !27
  %add64 = fadd double %add60, %32
  %33 = add nuw nsw i64 %indvars.iv, 17
  %arrayidx67 = getelementptr inbounds double, double* %grid, i64 %33
  %34 = load double, double* %arrayidx67, align 8, !tbaa !27
  %add68 = fadd double %add64, %34
  %35 = add nuw nsw i64 %indvars.iv, 18
  %arrayidx71 = getelementptr inbounds double, double* %grid, i64 %35
  %36 = load double, double* %arrayidx71, align 8, !tbaa !27
  %add72 = fadd double %add68, %36
  %cmp73 = fcmp olt double %add72, %minRho.0367
  %minRho.1 = select i1 %cmp73, double %add72, double %minRho.0367
  %cmp74 = fcmp ogt double %add72, %maxRho.0368
  %maxRho.1 = select i1 %cmp74, double %add72, double %maxRho.0368
  %add77 = fadd double %mass.0370, %add72
  %37 = add nuw nsw i64 %indvars.iv, 19
  %arrayidx80 = getelementptr inbounds double, double* %grid, i64 %37
  %38 = bitcast double* %arrayidx80 to i32*
  %39 = load i32, i32* %38, align 4, !tbaa !28
  %and = and i32 %39, 1
  %tobool = icmp eq i32 %and, 0
  br i1 %tobool, label %if.else, label %if.then81

if.then81:                                        ; preds = %for.body
  %inc = add nsw i32 %nObstacleCells.0369, 1
  br label %for.inc

if.else:                                          ; preds = %for.body
  %and85 = lshr i32 %39, 1
  %and85.lobit = and i32 %and85, 1
  %40 = xor i32 %and85.lobit, 1
  %nFluidCells.1 = add nsw i32 %40, %nFluidCells.0363
  %nAccelCells.1 = add nsw i32 %and85.lobit, %nAccelCells.0366
  %sub136 = fsub double %2, %4
  %add140 = fadd double %sub136, %14
  %add144 = fadd double %add140, %16
  %sub148 = fsub double %add144, %18
  %sub152 = fsub double %sub148, %20
  %add156 = fadd double %sub152, %22
  %add160 = fadd double %add156, %24
  %sub164 = fsub double %add160, %26
  %sub168 = fsub double %sub164, %28
  %41 = insertelement <2 x double> undef, double %10, i32 0
  %42 = insertelement <2 x double> %41, double %6, i32 1
  %43 = insertelement <2 x double> undef, double %12, i32 0
  %44 = insertelement <2 x double> %43, double %8, i32 1
  %45 = fsub <2 x double> %42, %44
  %46 = insertelement <2 x double> undef, double %22, i32 0
  %47 = insertelement <2 x double> %46, double %14, i32 1
  %48 = fadd <2 x double> %45, %47
  %49 = insertelement <2 x double> undef, double %24, i32 0
  %50 = insertelement <2 x double> %49, double %16, i32 1
  %51 = fsub <2 x double> %48, %50
  %52 = insertelement <2 x double> undef, double %26, i32 0
  %53 = insertelement <2 x double> %52, double %18, i32 1
  %54 = fadd <2 x double> %51, %53
  %55 = insertelement <2 x double> undef, double %28, i32 0
  %56 = insertelement <2 x double> %55, double %20, i32 1
  %57 = fsub <2 x double> %54, %56
  %58 = insertelement <2 x double> undef, double %30, i32 0
  %59 = shufflevector <2 x double> %58, <2 x double> undef, <2 x i32> zeroinitializer
  %60 = fadd <2 x double> %57, %59
  %61 = insertelement <2 x double> undef, double %32, i32 0
  %62 = shufflevector <2 x double> %61, <2 x double> undef, <2 x i32> zeroinitializer
  %63 = fsub <2 x double> %60, %62
  %64 = fadd <2 x double> %60, %62
  %65 = shufflevector <2 x double> %63, <2 x double> %64, <2 x i32> <i32 0, i32 3>
  %66 = insertelement <2 x double> undef, double %34, i32 0
  %67 = shufflevector <2 x double> %66, <2 x double> undef, <2 x i32> zeroinitializer
  %68 = fadd <2 x double> %65, %67
  %69 = fsub <2 x double> %65, %67
  %70 = shufflevector <2 x double> %68, <2 x double> %69, <2 x i32> <i32 0, i32 3>
  %71 = insertelement <2 x double> undef, double %36, i32 0
  %72 = shufflevector <2 x double> %71, <2 x double> undef, <2 x i32> zeroinitializer
  %73 = fsub <2 x double> %70, %72
  %mul208 = fmul double %sub168, %sub168
  %74 = fmul <2 x double> %73, %73
  %75 = extractelement <2 x double> %74, i32 1
  %add209 = fadd double %mul208, %75
  %76 = extractelement <2 x double> %74, i32 0
  %add211 = fadd double %76, %add209
  %mul212 = fmul double %add72, %add72
  %div = fdiv double %add211, %mul212
  %cmp213 = fcmp olt double %div, %minU2.0364
  %minU2.1 = select i1 %cmp213, double %div, double %minU2.0364
  %cmp216 = fcmp ogt double %div, %maxU2.0365
  br i1 %cmp216, label %if.then217, label %for.inc

if.then217:                                       ; preds = %if.else
  br label %for.inc

for.inc:                                          ; preds = %if.then81, %if.then217, %if.else
  %nFluidCells.2 = phi i32 [ %nFluidCells.0363, %if.then81 ], [ %nFluidCells.1, %if.then217 ], [ %nFluidCells.1, %if.else ]
  %minU2.2 = phi double [ %minU2.0364, %if.then81 ], [ %minU2.1, %if.then217 ], [ %minU2.1, %if.else ]
  %maxU2.1 = phi double [ %maxU2.0365, %if.then81 ], [ %div, %if.then217 ], [ %maxU2.0365, %if.else ]
  %nAccelCells.2 = phi i32 [ %nAccelCells.0366, %if.then81 ], [ %nAccelCells.1, %if.then217 ], [ %nAccelCells.1, %if.else ]
  %nObstacleCells.1 = phi i32 [ %inc, %if.then81 ], [ %nObstacleCells.0369, %if.then217 ], [ %nObstacleCells.0369, %if.else ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 20
  %cmp = icmp ult i64 %indvars.iv.next, 26000000
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc
  %call221 = tail call double @sqrt(double %minU2.2) #6
  %call222 = tail call double @sqrt(double %maxU2.1) #6
  %call223 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([138 x i8], [138 x i8]* @.str.15, i64 0, i64 0), i32 %nObstacleCells.1, i32 %nAccelCells.2, i32 %nFluidCells.2, double %minRho.1, double %maxRho.1, double %add77, double %call221, double %call222)
  %puts361 = tail call i32 @puts(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str.30, i64 0, i64 0))
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @MAIN_stopClock(%struct.MAIN_Time* nocapture %time, %struct.MAIN_Param* nocapture readonly %param) local_unnamed_addr #0 {
entry:
  %timeStop = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 4
  %call = tail call i64 @times(%struct.tms* nonnull %timeStop) #6
  %tickStop = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 2
  store i64 %call, i64* %tickStop, align 8, !tbaa !19
  %tms_utime = getelementptr inbounds %struct.tms, %struct.tms* %timeStop, i64 0, i32 0
  %0 = load i64, i64* %tms_utime, align 8, !tbaa !20
  %tms_utime2 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 3, i32 0
  %1 = load i64, i64* %tms_utime2, align 8, !tbaa !21
  %sub = sub nsw i64 %0, %1
  %conv = sitofp i64 %sub to double
  %timeScale = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 0
  %2 = load double, double* %timeScale, align 8, !tbaa !12
  %mul = fmul double %2, %conv
  %tms_stime = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 4, i32 1
  %3 = load i64, i64* %tms_stime, align 8, !tbaa !22
  %tms_stime5 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 3, i32 1
  %4 = load i64, i64* %tms_stime5, align 8, !tbaa !23
  %sub6 = sub nsw i64 %3, %4
  %conv7 = sitofp i64 %sub6 to double
  %mul9 = fmul double %2, %conv7
  %add = add nsw i64 %3, %sub
  %sub19 = sub i64 %add, %4
  %conv20 = sitofp i64 %sub19 to double
  %mul22 = fmul double %2, %conv20
  %tickStart = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 1
  %5 = load i64, i64* %tickStart, align 8, !tbaa !17
  %sub24 = sub nsw i64 %call, %5
  %conv25 = sitofp i64 %sub24 to double
  %mul27 = fmul double %2, %conv25
  %nTimeSteps = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 0
  %6 = load i32, i32* %nTimeSteps, align 8, !tbaa !2
  %conv28 = sitofp i32 %6 to double
  %mul29 = fmul double %conv28, 0x3FF4CCCCCCCCCCCC
  %div = fdiv double %mul29, %conv25
  %div35 = fdiv double %div, %2
  %call36 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.7, i64 0, i64 0), double %mul, double %mul9, double %mul22, double %mul27, double %div35)
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @MAIN_finalize(%struct.MAIN_Param* nocapture readonly %param) local_unnamed_addr #0 {
entry:
  %0 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !18
  %arraydecay = getelementptr inbounds [26000000 x double], [26000000 x double]* %0, i64 0, i64 0
  tail call void @LBM_showGridStatistics(double* %arraydecay)
  %action = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 2
  %1 = load i32, i32* %action, align 8, !tbaa !9
  %cmp = icmp eq i32 %1, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !18
  %arraydecay1 = getelementptr inbounds [26000000 x double], [26000000 x double]* %2, i64 0, i64 0
  %resultFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 1
  %3 = load i8*, i8** %resultFilename, align 8, !tbaa !8
  tail call void @LBM_compareVelocityField(double* %arraydecay1, i8* %3, i32 -1)
  %.pr = load i32, i32* %action, align 8, !tbaa !9
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = phi i32 [ %.pr, %if.then ], [ %1, %entry ]
  %cmp3 = icmp eq i32 %4, 2
  br i1 %cmp3, label %if.then4, label %if.end7

if.then4:                                         ; preds = %if.end
  %5 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !18
  %arraydecay5 = getelementptr inbounds [26000000 x double], [26000000 x double]* %5, i64 0, i64 0
  %resultFilename6 = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 1
  %6 = load i8*, i8** %resultFilename6, align 8, !tbaa !8
  tail call void @LBM_storeVelocityField(double* %arraydecay5, i8* %6, i32 -1)
  br label %if.end7

if.end7:                                          ; preds = %if.then4, %if.end
  %7 = load double*, double** bitcast ([26000000 x double]** @srcGrid to double**), align 8, !tbaa !18
  %add.ptr.i = getelementptr inbounds double, double* %7, i64 -400000
  %8 = bitcast double* %add.ptr.i to i8*
  tail call void @free(i8* nonnull %8) #6
  store double* null, double** bitcast ([26000000 x double]** @srcGrid to double**), align 8, !tbaa !18
  %9 = load double*, double** bitcast ([26000000 x double]** @dstGrid to double**), align 8, !tbaa !18
  %add.ptr.i11 = getelementptr inbounds double, double* %9, i64 -400000
  %10 = bitcast double* %add.ptr.i11 to i8*
  tail call void @free(i8* nonnull %10) #6
  store double* null, double** bitcast ([26000000 x double]** @dstGrid to double**), align 8, !tbaa !18
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #1

; Function Attrs: nounwind uwtable
define dso_local void @LBM_allocateGrid(double** nocapture %ptr) local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 214400000) #6
  %0 = bitcast double** %ptr to i8**
  store i8* %call, i8** %0, align 8, !tbaa !18
  %tobool = icmp eq i8* %call, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i64 0, i64 0), double 0x40698EF800000000)
  tail call void @exit(i32 1) #7
  unreachable

if.end:                                           ; preds = %entry
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.9, i64 0, i64 0), double 0x40698EF800000000)
  %1 = load double*, double** %ptr, align 8, !tbaa !18
  %add.ptr = getelementptr inbounds double, double* %1, i64 400000
  store double* %add.ptr, double** %ptr, align 8, !tbaa !18
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define dso_local void @LBM_initializeGrid(double* nocapture %grid) local_unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ -400000, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %grid, i64 %indvars.iv
  %0 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> <double 0x3FD5555555555555, double 0x3FAC71C71C71C71C>, <2 x double>* %0, align 8, !tbaa !27
  %1 = or i64 %indvars.iv, 2
  %arrayidx6 = getelementptr inbounds double, double* %grid, i64 %1
  %2 = bitcast double* %arrayidx6 to <2 x double>*
  store <2 x double> <double 0x3FAC71C71C71C71C, double 0x3FAC71C71C71C71C>, <2 x double>* %2, align 8, !tbaa !27
  %3 = add nsw i64 %indvars.iv, 4
  %arrayidx12 = getelementptr inbounds double, double* %grid, i64 %3
  %4 = bitcast double* %arrayidx12 to <2 x double>*
  store <2 x double> <double 0x3FAC71C71C71C71C, double 0x3FAC71C71C71C71C>, <2 x double>* %4, align 8, !tbaa !27
  %5 = add nsw i64 %indvars.iv, 6
  %arrayidx18 = getelementptr inbounds double, double* %grid, i64 %5
  %6 = bitcast double* %arrayidx18 to <2 x double>*
  store <2 x double> <double 0x3FAC71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %6, align 8, !tbaa !27
  %7 = add nsw i64 %indvars.iv, 8
  %arrayidx24 = getelementptr inbounds double, double* %grid, i64 %7
  %8 = bitcast double* %arrayidx24 to <2 x double>*
  store <2 x double> <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %8, align 8, !tbaa !27
  %9 = add nsw i64 %indvars.iv, 10
  %arrayidx30 = getelementptr inbounds double, double* %grid, i64 %9
  %10 = bitcast double* %arrayidx30 to <2 x double>*
  store <2 x double> <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %10, align 8, !tbaa !27
  %11 = add nsw i64 %indvars.iv, 12
  %arrayidx36 = getelementptr inbounds double, double* %grid, i64 %11
  %12 = bitcast double* %arrayidx36 to <2 x double>*
  store <2 x double> <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %12, align 8, !tbaa !27
  %13 = add nsw i64 %indvars.iv, 14
  %arrayidx42 = getelementptr inbounds double, double* %grid, i64 %13
  %14 = bitcast double* %arrayidx42 to <2 x double>*
  store <2 x double> <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %14, align 8, !tbaa !27
  %15 = add nsw i64 %indvars.iv, 16
  %arrayidx48 = getelementptr inbounds double, double* %grid, i64 %15
  %16 = bitcast double* %arrayidx48 to <2 x double>*
  store <2 x double> <double 0x3F9C71C71C71C71C, double 0x3F9C71C71C71C71C>, <2 x double>* %16, align 8, !tbaa !27
  %17 = add nsw i64 %indvars.iv, 18
  %arrayidx54 = getelementptr inbounds double, double* %grid, i64 %17
  store double 0x3F9C71C71C71C71C, double* %arrayidx54, align 8, !tbaa !27
  %18 = add nsw i64 %indvars.iv, 19
  %arrayidx57 = getelementptr inbounds double, double* %grid, i64 %18
  %19 = bitcast double* %arrayidx57 to i32*
  store i32 0, i32* %19, align 4, !tbaa !28
  %indvars.iv.next = add nsw i64 %indvars.iv, 20
  %cmp = icmp slt i64 %indvars.iv, 26399980
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @LBM_loadObstacleFile(double* nocapture %grid, i8* nocapture readonly %filename) local_unnamed_addr #0 {
entry:
  %call = tail call %struct._IO_FILE* @fopen(i8* %filename, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i64 0, i64 0))
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end17, %entry
  %indvars.iv50 = phi i64 [ 0, %entry ], [ %indvars.iv.next51, %for.end17 ]
  %0 = mul nuw nsw i64 %indvars.iv50, 10000
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc15, %for.cond1.preheader
  %indvars.iv45 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next46, %for.inc15 ]
  %fgetc_unlocked3637 = tail call i32 @fgetc_unlocked(%struct._IO_FILE* %call)
  %1 = mul nuw nsw i64 %indvars.iv45, 100
  %2 = add nuw nsw i64 %1, %0
  br label %for.body6

for.body6:                                        ; preds = %for.inc, %for.cond4.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next, %for.inc ]
  %fgetc_unlocked3639 = phi i32 [ %fgetc_unlocked3637, %for.cond4.preheader ], [ %fgetc_unlocked36, %for.inc ]
  %cmp8 = icmp eq i32 %fgetc_unlocked3639, 46
  br i1 %cmp8, label %for.inc, label %if.then

if.then:                                          ; preds = %for.body6
  %3 = add nuw nsw i64 %2, %indvars.iv
  %4 = mul nuw nsw i64 %3, 20
  %5 = add nuw nsw i64 %4, 19
  %arrayidx = getelementptr inbounds double, double* %grid, i64 %5
  %6 = bitcast double* %arrayidx to i32*
  %7 = load i32, i32* %6, align 4, !tbaa !28
  %or = or i32 %7, 1
  store i32 %or, i32* %6, align 4, !tbaa !28
  br label %for.inc

for.inc:                                          ; preds = %for.body6, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %fgetc_unlocked36 = tail call i32 @fgetc_unlocked(%struct._IO_FILE* %call)
  %exitcond = icmp eq i64 %indvars.iv.next, 100
  br i1 %exitcond, label %for.inc15, label %for.body6

for.inc15:                                        ; preds = %for.inc
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next46, 100
  br i1 %exitcond49, label %for.end17, label %for.cond4.preheader

for.end17:                                        ; preds = %for.inc15
  %fgetc_unlocked = tail call i32 @fgetc_unlocked(%struct._IO_FILE* %call)
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, 130
  br i1 %exitcond53, label %for.end21, label %for.cond1.preheader

for.end21:                                        ; preds = %for.end17
  %call22 = tail call i32 @fclose(%struct._IO_FILE* %call)
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define dso_local void @LBM_initializeSpecialCellsForChannel(double* nocapture %grid) local_unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc46, %entry
  %indvars.iv88 = phi i64 [ -2, %entry ], [ %indvars.iv.next89, %for.inc46 ]
  %0 = mul nsw i64 %indvars.iv88, 10000
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc43, %for.cond1.preheader
  %indvars.iv83 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next84, %for.inc43 ]
  %cmp10 = icmp eq i64 %indvars.iv83, 0
  %cmp12 = icmp eq i64 %indvars.iv83, 99
  %1 = mul nuw nsw i64 %indvars.iv83, 100
  %2 = add nsw i64 %1, %0
  br label %for.body6

for.body6:                                        ; preds = %for.inc, %for.cond4.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next, %for.inc ]
  %cmp7 = icmp eq i64 %indvars.iv, 0
  %cmp8 = icmp eq i64 %indvars.iv, 99
  %or.cond = or i1 %cmp7, %cmp8
  %or.cond49 = or i1 %cmp10, %or.cond
  %or.cond50 = or i1 %cmp12, %or.cond49
  br i1 %or.cond50, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body6
  %3 = add nsw i64 %2, %indvars.iv
  %4 = mul nsw i64 %3, 20
  %5 = add nsw i64 %4, 19
  %arrayidx = getelementptr inbounds double, double* %grid, i64 %5
  %6 = bitcast double* %arrayidx to i32*
  %7 = load i32, i32* %6, align 4, !tbaa !28
  %or = or i32 %7, 1
  store i32 %or, i32* %6, align 4, !tbaa !28
  br label %for.inc

for.inc:                                          ; preds = %if.then, %for.body6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 100
  br i1 %exitcond, label %for.inc43, label %for.body6

for.inc43:                                        ; preds = %for.inc
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next84, 100
  br i1 %exitcond87, label %for.inc46, label %for.cond4.preheader

for.inc46:                                        ; preds = %for.inc43
  %indvars.iv.next89 = add nsw i64 %indvars.iv88, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next89, 132
  br i1 %exitcond91, label %for.end48, label %for.cond1.preheader

for.end48:                                        ; preds = %for.inc46
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define dso_local void @LBM_initializeSpecialCellsForLDC(double* nocapture %grid) local_unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc48, %entry
  %indvars.iv105 = phi i64 [ -2, %entry ], [ %indvars.iv.next106, %for.inc48 ]
  %0 = icmp eq i64 %indvars.iv105, 0
  %1 = icmp eq i64 %indvars.iv105, 129
  %2 = mul nsw i64 %indvars.iv105, 10000
  %3 = icmp eq i64 %indvars.iv105, 1
  %4 = icmp eq i64 %indvars.iv105, 128
  %or.cond55 = or i1 %3, %4
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc45, %for.cond1.preheader
  %indvars.iv97 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next98, %for.inc45 ]
  %cmp10 = icmp eq i64 %indvars.iv97, 0
  %cmp12 = icmp eq i64 %indvars.iv97, 99
  %5 = mul nuw nsw i64 %indvars.iv97, 100
  %6 = add nsw i64 %5, %2
  %7 = trunc i64 %indvars.iv97 to i32
  %8 = add i32 %7, -2
  %9 = icmp ult i32 %8, 96
  br label %for.body6

for.body6:                                        ; preds = %for.inc, %for.cond4.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next, %for.inc ]
  %cmp7 = icmp eq i64 %indvars.iv, 0
  %cmp8 = icmp eq i64 %indvars.iv, 99
  %or.cond = or i1 %cmp7, %cmp8
  %or.cond51 = or i1 %cmp10, %or.cond
  %or.cond52 = or i1 %cmp12, %or.cond51
  %or.cond53 = or i1 %0, %or.cond52
  %or.cond54 = or i1 %1, %or.cond53
  br i1 %or.cond54, label %for.inc.sink.split, label %if.else

if.else:                                          ; preds = %for.body6
  %10 = trunc i64 %indvars.iv to i32
  %11 = add i32 %10, -2
  %12 = icmp ult i32 %11, 96
  %13 = and i1 %or.cond55, %12
  %14 = and i1 %9, %13
  br i1 %14, label %for.inc.sink.split, label %for.inc

for.inc.sink.split:                               ; preds = %if.else, %for.body6
  %.sink114 = phi i32 [ 1, %for.body6 ], [ 2, %if.else ]
  %15 = add nsw i64 %6, %indvars.iv
  %16 = mul nsw i64 %15, 20
  %17 = add nsw i64 %16, 19
  %arrayidx42 = getelementptr inbounds double, double* %grid, i64 %17
  %18 = bitcast double* %arrayidx42 to i32*
  %19 = load i32, i32* %18, align 4, !tbaa !28
  %or = or i32 %19, %.sink114
  store i32 %or, i32* %18, align 4, !tbaa !28
  br label %for.inc

for.inc:                                          ; preds = %for.inc.sink.split, %if.else
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 100
  br i1 %exitcond, label %for.inc45, label %for.body6

for.inc45:                                        ; preds = %for.inc
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next98, 100
  br i1 %exitcond104, label %for.inc48, label %for.cond4.preheader

for.inc48:                                        ; preds = %for.inc45
  %indvars.iv.next106 = add nsw i64 %indvars.iv105, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next106, 132
  br i1 %exitcond112, label %for.end50, label %for.cond1.preheader

for.end50:                                        ; preds = %for.inc48
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @LBM_compareVelocityField(double* nocapture readonly %grid, i8* nocapture readonly %filename, i32 %binary) local_unnamed_addr #0 {
entry:
  %fileUx = alloca double, align 8
  %fileUy = alloca double, align 8
  %fileUz = alloca double, align 8
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @str.33, i64 0, i64 0))
  %0 = bitcast double* %fileUx to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #6
  %1 = bitcast double* %fileUy to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %1) #6
  %2 = bitcast double* %fileUz to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #6
  %tobool = icmp ne i32 %binary, 0
  %cond = select i1 %tobool, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20, i64 0, i64 0)
  %call1 = tail call %struct._IO_FILE* @fopen(i8* %filename, i8* %cond)
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc507, %entry
  %indvars.iv777 = phi i64 [ 0, %entry ], [ %indvars.iv.next778, %for.inc507 ]
  %maxDiff2.0751 = phi double [ -1.000000e+30, %entry ], [ %maxDiff2.3, %for.inc507 ]
  %3 = mul nuw nsw i64 %indvars.iv777, 10000
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc504, %for.cond2.preheader
  %indvars.iv772 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next773, %for.inc504 ]
  %maxDiff2.1749 = phi double [ %maxDiff2.0751, %for.cond2.preheader ], [ %maxDiff2.3, %for.inc504 ]
  %4 = mul nuw nsw i64 %indvars.iv772, 100
  %5 = add nuw nsw i64 %4, %3
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %maxDiff2.2746 = phi double [ %maxDiff2.1749, %for.cond5.preheader ], [ %maxDiff2.3, %if.end ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = mul nuw nsw i64 %6, 20
  %arrayidx = getelementptr inbounds double, double* %grid, i64 %7
  %8 = load double, double* %arrayidx, align 8, !tbaa !27
  %9 = or i64 %7, 1
  %arrayidx21 = getelementptr inbounds double, double* %grid, i64 %9
  %10 = load double, double* %arrayidx21, align 8, !tbaa !27
  %add22 = fadd double %8, %10
  %11 = or i64 %7, 2
  %arrayidx31 = getelementptr inbounds double, double* %grid, i64 %11
  %12 = load double, double* %arrayidx31, align 8, !tbaa !27
  %add32 = fadd double %add22, %12
  %13 = or i64 %7, 3
  %arrayidx41 = getelementptr inbounds double, double* %grid, i64 %13
  %14 = load double, double* %arrayidx41, align 8, !tbaa !27
  %add42 = fadd double %add32, %14
  %15 = add nuw nsw i64 %7, 4
  %arrayidx51 = getelementptr inbounds double, double* %grid, i64 %15
  %16 = load double, double* %arrayidx51, align 8, !tbaa !27
  %add52 = fadd double %add42, %16
  %17 = add nuw nsw i64 %7, 5
  %arrayidx61 = getelementptr inbounds double, double* %grid, i64 %17
  %18 = load double, double* %arrayidx61, align 8, !tbaa !27
  %add62 = fadd double %add52, %18
  %19 = add nuw nsw i64 %7, 6
  %arrayidx71 = getelementptr inbounds double, double* %grid, i64 %19
  %20 = load double, double* %arrayidx71, align 8, !tbaa !27
  %add72 = fadd double %add62, %20
  %21 = add nuw nsw i64 %7, 7
  %arrayidx81 = getelementptr inbounds double, double* %grid, i64 %21
  %22 = load double, double* %arrayidx81, align 8, !tbaa !27
  %add82 = fadd double %add72, %22
  %23 = add nuw nsw i64 %7, 8
  %arrayidx91 = getelementptr inbounds double, double* %grid, i64 %23
  %24 = load double, double* %arrayidx91, align 8, !tbaa !27
  %add92 = fadd double %add82, %24
  %25 = add nuw nsw i64 %7, 9
  %arrayidx101 = getelementptr inbounds double, double* %grid, i64 %25
  %26 = load double, double* %arrayidx101, align 8, !tbaa !27
  %add102 = fadd double %add92, %26
  %27 = add nuw nsw i64 %7, 10
  %arrayidx111 = getelementptr inbounds double, double* %grid, i64 %27
  %28 = load double, double* %arrayidx111, align 8, !tbaa !27
  %add112 = fadd double %add102, %28
  %29 = add nuw nsw i64 %7, 11
  %arrayidx121 = getelementptr inbounds double, double* %grid, i64 %29
  %30 = load double, double* %arrayidx121, align 8, !tbaa !27
  %add122 = fadd double %add112, %30
  %31 = add nuw nsw i64 %7, 12
  %arrayidx131 = getelementptr inbounds double, double* %grid, i64 %31
  %32 = load double, double* %arrayidx131, align 8, !tbaa !27
  %add132 = fadd double %add122, %32
  %33 = add nuw nsw i64 %7, 13
  %arrayidx141 = getelementptr inbounds double, double* %grid, i64 %33
  %34 = load double, double* %arrayidx141, align 8, !tbaa !27
  %add142 = fadd double %add132, %34
  %35 = add nuw nsw i64 %7, 14
  %arrayidx151 = getelementptr inbounds double, double* %grid, i64 %35
  %36 = load double, double* %arrayidx151, align 8, !tbaa !27
  %add152 = fadd double %add142, %36
  %37 = add nuw nsw i64 %7, 15
  %arrayidx161 = getelementptr inbounds double, double* %grid, i64 %37
  %38 = load double, double* %arrayidx161, align 8, !tbaa !27
  %add162 = fadd double %add152, %38
  %39 = add nuw nsw i64 %7, 16
  %arrayidx171 = getelementptr inbounds double, double* %grid, i64 %39
  %40 = load double, double* %arrayidx171, align 8, !tbaa !27
  %add172 = fadd double %add162, %40
  %41 = add nuw nsw i64 %7, 17
  %arrayidx181 = getelementptr inbounds double, double* %grid, i64 %41
  %42 = load double, double* %arrayidx181, align 8, !tbaa !27
  %add182 = fadd double %add172, %42
  %43 = add nuw nsw i64 %7, 18
  %arrayidx191 = getelementptr inbounds double, double* %grid, i64 %43
  %44 = load double, double* %arrayidx191, align 8, !tbaa !27
  %add192 = fadd double %add182, %44
  %sub309 = fsub double %10, %12
  %add319 = fadd double %sub309, %22
  %add329 = fadd double %add319, %24
  %sub339 = fsub double %add329, %26
  %sub349 = fsub double %sub339, %28
  %add359 = fadd double %sub349, %30
  %add369 = fadd double %add359, %32
  %sub379 = fsub double %add369, %34
  %sub389 = fsub double %sub379, %36
  %45 = insertelement <2 x double> undef, double %14, i32 0
  %46 = insertelement <2 x double> %45, double %18, i32 1
  %47 = insertelement <2 x double> undef, double %16, i32 0
  %48 = insertelement <2 x double> %47, double %20, i32 1
  %49 = fsub <2 x double> %46, %48
  %50 = insertelement <2 x double> undef, double %22, i32 0
  %51 = insertelement <2 x double> %50, double %30, i32 1
  %52 = fadd <2 x double> %49, %51
  %53 = insertelement <2 x double> undef, double %24, i32 0
  %54 = insertelement <2 x double> %53, double %32, i32 1
  %55 = fsub <2 x double> %52, %54
  %56 = insertelement <2 x double> undef, double %26, i32 0
  %57 = insertelement <2 x double> %56, double %34, i32 1
  %58 = fadd <2 x double> %55, %57
  %59 = insertelement <2 x double> undef, double %28, i32 0
  %60 = insertelement <2 x double> %59, double %36, i32 1
  %61 = fsub <2 x double> %58, %60
  %62 = insertelement <2 x double> undef, double %38, i32 0
  %63 = shufflevector <2 x double> %62, <2 x double> undef, <2 x i32> zeroinitializer
  %64 = fadd <2 x double> %61, %63
  %65 = insertelement <2 x double> undef, double %40, i32 0
  %66 = shufflevector <2 x double> %65, <2 x double> undef, <2 x i32> zeroinitializer
  %67 = fadd <2 x double> %64, %66
  %68 = fsub <2 x double> %64, %66
  %69 = shufflevector <2 x double> %67, <2 x double> %68, <2 x i32> <i32 0, i32 3>
  %70 = insertelement <2 x double> undef, double %42, i32 0
  %71 = shufflevector <2 x double> %70, <2 x double> undef, <2 x i32> zeroinitializer
  %72 = fsub <2 x double> %69, %71
  %73 = fadd <2 x double> %69, %71
  %74 = shufflevector <2 x double> %72, <2 x double> %73, <2 x i32> <i32 0, i32 3>
  %75 = insertelement <2 x double> undef, double %44, i32 0
  %76 = shufflevector <2 x double> %75, <2 x double> undef, <2 x i32> zeroinitializer
  %77 = fsub <2 x double> %74, %76
  %div489 = fdiv double %sub389, %add192
  %78 = insertelement <2 x double> undef, double %add192, i32 0
  %79 = shufflevector <2 x double> %78, <2 x double> undef, <2 x i32> zeroinitializer
  %80 = fdiv <2 x double> %77, %79
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body7
  %call8.i = call i64 @fread(i8* nonnull %0, i64 8, i64 1, %struct._IO_FILE* %call1) #6
  %call8.i744 = call i64 @fread(i8* nonnull %1, i64 8, i64 1, %struct._IO_FILE* %call1) #6
  %call8.i745 = call i64 @fread(i8* nonnull %2, i64 8, i64 1, %struct._IO_FILE* %call1) #6
  br label %if.end

if.else:                                          ; preds = %for.body7
  %call492 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %call1, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.21, i64 0, i64 0), double* nonnull %fileUx, double* nonnull %fileUy, double* nonnull %fileUz) #6
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %81 = load double, double* %fileUx, align 8, !tbaa !27
  %82 = load double, double* %fileUy, align 8, !tbaa !27
  %sub494 = fsub double %div489, %82
  %83 = load double, double* %fileUz, align 8, !tbaa !27
  %84 = insertelement <2 x double> undef, double %81, i32 0
  %85 = insertelement <2 x double> %84, double %83, i32 1
  %86 = fsub <2 x double> %80, %85
  %mul497 = fmul double %sub494, %sub494
  %87 = fmul <2 x double> %86, %86
  %88 = extractelement <2 x double> %87, i32 0
  %add498 = fadd double %88, %mul497
  %89 = extractelement <2 x double> %87, i32 1
  %add500 = fadd double %add498, %89
  %cmp501 = fcmp ogt double %add500, %maxDiff2.2746
  %maxDiff2.3 = select i1 %cmp501, double %add500, double %maxDiff2.2746
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 100
  br i1 %exitcond, label %for.inc504, label %for.body7

for.inc504:                                       ; preds = %if.end
  %indvars.iv.next773 = add nuw nsw i64 %indvars.iv772, 1
  %exitcond776 = icmp eq i64 %indvars.iv.next773, 100
  br i1 %exitcond776, label %for.inc507, label %for.cond5.preheader

for.inc507:                                       ; preds = %for.inc504
  %indvars.iv.next778 = add nuw nsw i64 %indvars.iv777, 1
  %exitcond780 = icmp eq i64 %indvars.iv.next778, 130
  br i1 %exitcond780, label %for.end509, label %for.cond2.preheader

for.end509:                                       ; preds = %for.inc507
  %call510 = call double @sqrt(double %maxDiff2.3) #6
  %call511 = call double @sqrt(double %maxDiff2.3) #6
  %cmp512 = fcmp ogt double %call511, 1.000000e-05
  %cond513 = select i1 %cmp512, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.23, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.24, i64 0, i64 0)
  %call514 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.22, i64 0, i64 0), double %call510, i8* %cond513)
  %call515 = call i32 @fclose(%struct._IO_FILE* %call1)
  %puts743 = call i32 @puts(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @str.34, i64 0, i64 0))
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %1) #6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #6
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @LBM_storeVelocityField(double* nocapture readonly %grid, i8* nocapture readonly %filename, i32 %binary) local_unnamed_addr #0 {
entry:
  %ux = alloca double, align 8
  %uy = alloca double, align 8
  %uz = alloca double, align 8
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @str.33, i64 0, i64 0))
  %0 = bitcast double* %ux to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #6
  %1 = bitcast double* %uy to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %1) #6
  %2 = bitcast double* %uz to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #6
  %tobool = icmp ne i32 %binary, 0
  %cond = select i1 %tobool, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.17, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.18, i64 0, i64 0)
  %call1 = tail call %struct._IO_FILE* @fopen(i8* %filename, i8* %cond)
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc496, %entry
  %indvars.iv741 = phi i64 [ 0, %entry ], [ %indvars.iv.next742, %for.inc496 ]
  %3 = mul nuw nsw i64 %indvars.iv741, 10000
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc493, %for.cond2.preheader
  %indvars.iv736 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next737, %for.inc493 ]
  %4 = mul nuw nsw i64 %indvars.iv736, 100
  %5 = add nuw nsw i64 %4, %3
  br label %for.body7

for.body7:                                        ; preds = %for.inc, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = mul nuw nsw i64 %6, 20
  %arrayidx = getelementptr inbounds double, double* %grid, i64 %7
  %8 = load double, double* %arrayidx, align 8, !tbaa !27
  %9 = or i64 %7, 1
  %arrayidx21 = getelementptr inbounds double, double* %grid, i64 %9
  %10 = load double, double* %arrayidx21, align 8, !tbaa !27
  %add22 = fadd double %8, %10
  %11 = or i64 %7, 2
  %arrayidx31 = getelementptr inbounds double, double* %grid, i64 %11
  %12 = load double, double* %arrayidx31, align 8, !tbaa !27
  %add32 = fadd double %add22, %12
  %13 = or i64 %7, 3
  %arrayidx41 = getelementptr inbounds double, double* %grid, i64 %13
  %14 = load double, double* %arrayidx41, align 8, !tbaa !27
  %add42 = fadd double %add32, %14
  %15 = add nuw nsw i64 %7, 4
  %arrayidx51 = getelementptr inbounds double, double* %grid, i64 %15
  %16 = load double, double* %arrayidx51, align 8, !tbaa !27
  %add52 = fadd double %add42, %16
  %17 = add nuw nsw i64 %7, 5
  %arrayidx61 = getelementptr inbounds double, double* %grid, i64 %17
  %18 = load double, double* %arrayidx61, align 8, !tbaa !27
  %add62 = fadd double %add52, %18
  %19 = add nuw nsw i64 %7, 6
  %arrayidx71 = getelementptr inbounds double, double* %grid, i64 %19
  %20 = load double, double* %arrayidx71, align 8, !tbaa !27
  %add72 = fadd double %add62, %20
  %21 = add nuw nsw i64 %7, 7
  %arrayidx81 = getelementptr inbounds double, double* %grid, i64 %21
  %22 = load double, double* %arrayidx81, align 8, !tbaa !27
  %add82 = fadd double %add72, %22
  %23 = add nuw nsw i64 %7, 8
  %arrayidx91 = getelementptr inbounds double, double* %grid, i64 %23
  %24 = load double, double* %arrayidx91, align 8, !tbaa !27
  %add92 = fadd double %add82, %24
  %25 = add nuw nsw i64 %7, 9
  %arrayidx101 = getelementptr inbounds double, double* %grid, i64 %25
  %26 = load double, double* %arrayidx101, align 8, !tbaa !27
  %add102 = fadd double %add92, %26
  %27 = add nuw nsw i64 %7, 10
  %arrayidx111 = getelementptr inbounds double, double* %grid, i64 %27
  %28 = load double, double* %arrayidx111, align 8, !tbaa !27
  %add112 = fadd double %add102, %28
  %29 = add nuw nsw i64 %7, 11
  %arrayidx121 = getelementptr inbounds double, double* %grid, i64 %29
  %30 = load double, double* %arrayidx121, align 8, !tbaa !27
  %add122 = fadd double %add112, %30
  %31 = add nuw nsw i64 %7, 12
  %arrayidx131 = getelementptr inbounds double, double* %grid, i64 %31
  %32 = load double, double* %arrayidx131, align 8, !tbaa !27
  %add132 = fadd double %add122, %32
  %33 = add nuw nsw i64 %7, 13
  %arrayidx141 = getelementptr inbounds double, double* %grid, i64 %33
  %34 = load double, double* %arrayidx141, align 8, !tbaa !27
  %add142 = fadd double %add132, %34
  %35 = add nuw nsw i64 %7, 14
  %arrayidx151 = getelementptr inbounds double, double* %grid, i64 %35
  %36 = load double, double* %arrayidx151, align 8, !tbaa !27
  %add152 = fadd double %add142, %36
  %37 = add nuw nsw i64 %7, 15
  %arrayidx161 = getelementptr inbounds double, double* %grid, i64 %37
  %38 = load double, double* %arrayidx161, align 8, !tbaa !27
  %add162 = fadd double %add152, %38
  %39 = add nuw nsw i64 %7, 16
  %arrayidx171 = getelementptr inbounds double, double* %grid, i64 %39
  %40 = load double, double* %arrayidx171, align 8, !tbaa !27
  %add172 = fadd double %add162, %40
  %41 = add nuw nsw i64 %7, 17
  %arrayidx181 = getelementptr inbounds double, double* %grid, i64 %41
  %42 = load double, double* %arrayidx181, align 8, !tbaa !27
  %add182 = fadd double %add172, %42
  %43 = add nuw nsw i64 %7, 18
  %arrayidx191 = getelementptr inbounds double, double* %grid, i64 %43
  %44 = load double, double* %arrayidx191, align 8, !tbaa !27
  %add192 = fadd double %add182, %44
  %sub = fsub double %14, %16
  %add220 = fadd double %sub, %22
  %sub230 = fsub double %add220, %24
  %add240 = fadd double %sub230, %26
  %sub250 = fsub double %add240, %28
  %add260 = fadd double %sub250, %38
  %add270 = fadd double %add260, %40
  %sub280 = fsub double %add270, %42
  %sub290 = fsub double %sub280, %44
  %sub309 = fsub double %10, %12
  %add319 = fadd double %sub309, %22
  %add329 = fadd double %add319, %24
  %sub339 = fsub double %add329, %26
  %sub349 = fsub double %sub339, %28
  %add359 = fadd double %sub349, %30
  %add369 = fadd double %add359, %32
  %sub379 = fsub double %add369, %34
  %sub389 = fsub double %sub379, %36
  %sub408 = fsub double %18, %20
  %add418 = fadd double %sub408, %30
  %sub428 = fsub double %add418, %32
  %add438 = fadd double %sub428, %34
  %sub448 = fsub double %add438, %36
  %add458 = fadd double %sub448, %38
  %sub468 = fsub double %add458, %40
  %add478 = fadd double %sub468, %42
  %sub488 = fsub double %add478, %44
  %div = fdiv double %sub290, %add192
  store double %div, double* %ux, align 8, !tbaa !27
  %div489 = fdiv double %sub389, %add192
  store double %div489, double* %uy, align 8, !tbaa !27
  %div490 = fdiv double %sub488, %add192
  store double %div490, double* %uz, align 8, !tbaa !27
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body7
  %45 = call i64 @fwrite_unlocked(i8* nonnull %0, i64 8, i64 1, %struct._IO_FILE* %call1)
  %46 = call i64 @fwrite_unlocked(i8* nonnull %1, i64 8, i64 1, %struct._IO_FILE* %call1)
  %47 = call i64 @fwrite_unlocked(i8* nonnull %2, i64 8, i64 1, %struct._IO_FILE* %call1)
  br label %for.inc

if.else:                                          ; preds = %for.body7
  %call492 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.19, i64 0, i64 0), double %div, double %div489, double %div490)
  br label %for.inc

for.inc:                                          ; preds = %if.then, %if.else
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 100
  br i1 %exitcond, label %for.inc493, label %for.body7

for.inc493:                                       ; preds = %for.inc
  %indvars.iv.next737 = add nuw nsw i64 %indvars.iv736, 1
  %exitcond740 = icmp eq i64 %indvars.iv.next737, 100
  br i1 %exitcond740, label %for.inc496, label %for.cond5.preheader

for.inc496:                                       ; preds = %for.inc493
  %indvars.iv.next742 = add nuw nsw i64 %indvars.iv741, 1
  %exitcond744 = icmp eq i64 %indvars.iv.next742, 130
  br i1 %exitcond744, label %for.end498, label %for.cond2.preheader

for.end498:                                       ; preds = %for.inc496
  %call499 = tail call i32 @fclose(%struct._IO_FILE* %call1)
  %puts710 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @str.34, i64 0, i64 0))
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %1) #6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #6
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @LBM_freeGrid(double** nocapture %ptr) local_unnamed_addr #0 {
entry:
  %0 = load double*, double** %ptr, align 8, !tbaa !18
  %add.ptr = getelementptr inbounds double, double* %0, i64 -400000
  %1 = bitcast double* %add.ptr to i8*
  tail call void @free(i8* nonnull %1) #6
  store double* null, double** %ptr, align 8, !tbaa !18
  ret void
}

; Function Attrs: nounwind
declare dso_local i64 @sysconf(i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i64 @times(%struct.tms* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #5

; Function Attrs: nounwind
declare dso_local i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i32 @__xstat(i32, i8*, %struct.stat*) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #6

; Function Attrs: nounwind
declare i32 @fgetc_unlocked(%struct._IO_FILE* nocapture) local_unnamed_addr #6

; Function Attrs: nounwind
declare i64 @fwrite_unlocked(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #6

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !4, i64 0}
!3 = !{!"", !4, i64 0, !7, i64 8, !5, i64 16, !5, i64 20, !7, i64 24}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"any pointer", !5, i64 0}
!8 = !{!3, !7, i64 8}
!9 = !{!3, !5, i64 16}
!10 = !{!3, !5, i64 20}
!11 = !{!3, !7, i64 24}
!12 = !{!13, !14, i64 0}
!13 = !{!"", !14, i64 0, !15, i64 8, !15, i64 16, !16, i64 24, !16, i64 56}
!14 = !{!"double", !5, i64 0}
!15 = !{!"long", !5, i64 0}
!16 = !{!"tms", !15, i64 0, !15, i64 8, !15, i64 16, !15, i64 24}
!17 = !{!13, !15, i64 8}
!18 = !{!7, !7, i64 0}
!19 = !{!13, !15, i64 16}
!20 = !{!13, !15, i64 56}
!21 = !{!13, !15, i64 24}
!22 = !{!13, !15, i64 64}
!23 = !{!13, !15, i64 32}
!24 = !{!25, !15, i64 48}
!25 = !{!"stat", !15, i64 0, !15, i64 8, !15, i64 16, !4, i64 24, !4, i64 28, !4, i64 32, !4, i64 36, !15, i64 40, !15, i64 48, !15, i64 56, !15, i64 64, !26, i64 72, !26, i64 88, !26, i64 104, !5, i64 120}
!26 = !{!"timespec", !15, i64 0, !15, i64 8}
!27 = !{!14, !14, i64 0}
!28 = !{!4, !4, i64 0}
