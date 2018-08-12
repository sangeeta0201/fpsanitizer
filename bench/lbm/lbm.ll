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

@srcGrid = internal global [26000000 x double]* null, align 8
@dstGrid = internal global [26000000 x double]* null, align 8
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
@.str.21 = private unnamed_addr constant [10 x i8] c"%f %f %f\0A\00", align 1
@.str.22 = private unnamed_addr constant [50 x i8] c"LBM_compareVelocityField: maxDiff = %e  ==>  %s\0A\0A\00", align 1
@.str.23 = private unnamed_addr constant [18 x i8] c"##### ERROR #####\00", align 1
@.str.24 = private unnamed_addr constant [3 x i8] c"OK\00", align 1
@str = private unnamed_addr constant [108 x i8] c"syntax: lbm <time steps> <result file> <0: nil, 1: cmp, 2: str> <0: ldc, 1: channel flow> [<obstacle file>]\00"
@str.25 = private unnamed_addr constant [27 x i8] c"LBM_handleInOutFlow starts\00"
@str.26 = private unnamed_addr constant [26 x i8] c"LBM_handleInOutFlow stops\00"
@str.27 = private unnamed_addr constant [31 x i8] c"LBM_performStreamCollide start\00"
@str.28 = private unnamed_addr constant [30 x i8] c"LBM_performStreamCollide ends\00"
@str.29 = private unnamed_addr constant [27 x i8] c"LBM_handleInOutFlow starts\00"
@str.30 = private unnamed_addr constant [25 x i8] c"LBM_handleInOutFlow ends\00"
@str.31 = private unnamed_addr constant [27 x i8] c"LBM_handleInOutFlow starts\00"
@str.32 = private unnamed_addr constant [26 x i8] c"LBM_handleInOutFlow stops\00"
@str.33 = private unnamed_addr constant [27 x i8] c"LBM_handleInOutFlow starts\00"
@str.34 = private unnamed_addr constant [26 x i8] c"LBM_handleInOutFlow stops\00"

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %nArgs, i8** nocapture readonly %arg) local_unnamed_addr #0 {
entry:
  %param = alloca %struct.MAIN_Param, align 8
  %time = alloca %struct.MAIN_Time, align 8
  %0 = bitcast %struct.MAIN_Param* %param to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #8
  %1 = bitcast %struct.MAIN_Time* %time to i8*
  call void @llvm.lifetime.start.p0i8(i64 88, i8* nonnull %1) #8
  call void @MAIN_parseCommandLine(i32 %nArgs, i8** %arg, %struct.MAIN_Param* nonnull %param)
  call void @MAIN_printInfo(%struct.MAIN_Param* nonnull %param)
  call void @MAIN_initialize(%struct.MAIN_Param* nonnull %param)
  call void @MAIN_startClock(%struct.MAIN_Time* nonnull %time)
  %nTimeSteps = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 0
  %2 = load i32, i32* %nTimeSteps, align 8, !tbaa !2
  %cmp12 = icmp slt i32 %2, 1
  br i1 %cmp12, label %for.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  %simType = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 3
  %3 = load i32, i32* %simType, align 4, !tbaa !8
  %cmp1 = icmp eq i32 %3, 1
  %4 = load i32, i32* %nTimeSteps, align 8
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %t.013 = phi i32 [ 1, %for.body.lr.ph ], [ %inc, %for.inc ]
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !9
  %arraydecay = getelementptr inbounds [26000000 x double], [26000000 x double]* %5, i64 0, i64 0
  tail call void @LBM_handleInOutFlow(double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %6 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !9
  %arraydecay2 = getelementptr inbounds [26000000 x double], [26000000 x double]* %6, i64 0, i64 0
  %7 = load [26000000 x double]*, [26000000 x double]** @dstGrid, align 8, !tbaa !9
  %arraydecay3 = getelementptr inbounds [26000000 x double], [26000000 x double]* %7, i64 0, i64 0
  tail call void @LBM_performStreamCollide(double* %arraydecay2, double* %arraydecay3)
  tail call void @LBM_swapGrids([26000000 x double]** nonnull @srcGrid, [26000000 x double]** nonnull @dstGrid)
  %and = and i32 %t.013, 63
  %cmp4 = icmp eq i32 %and, 0
  br i1 %cmp4, label %if.then5, label %for.inc

if.then5:                                         ; preds = %if.end
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 %t.013)
  %8 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !9
  %arraydecay6 = getelementptr inbounds [26000000 x double], [26000000 x double]* %8, i64 0, i64 0
  tail call void @LBM_showGridStatistics(double* %arraydecay6)
  br label %for.inc

for.inc:                                          ; preds = %if.end, %if.then5
  %inc = add nuw nsw i32 %t.013, 1
  %cmp = icmp slt i32 %t.013, %4
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc, %entry
  call void @MAIN_stopClock(%struct.MAIN_Time* nonnull %time, %struct.MAIN_Param* nonnull %param)
  call void @MAIN_finalize(%struct.MAIN_Param* nonnull %param)
  call void @llvm.lifetime.end.p0i8(i64 88, i8* nonnull %1) #8
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #8
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local void @MAIN_parseCommandLine(i32 %nArgs, i8** nocapture readonly %arg, %struct.MAIN_Param* nocapture %param) local_unnamed_addr #0 {
entry:
  %fileStat = alloca %struct.stat, align 8
  %0 = bitcast %struct.stat* %fileStat to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %0) #8
  %nArgs.off = add i32 %nArgs, -5
  %1 = icmp ugt i32 %nArgs.off, 1
  br i1 %1, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([108 x i8], [108 x i8]* @str, i64 0, i64 0))
  tail call void @exit(i32 1) #9
  unreachable

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %arg, i64 1
  %2 = load i8*, i8** %arrayidx, align 8, !tbaa !9
  %call2 = tail call i32 @atoi(i8* %2) #10
  %nTimeSteps = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 0
  store i32 %call2, i32* %nTimeSteps, align 8, !tbaa !2
  %arrayidx3 = getelementptr inbounds i8*, i8** %arg, i64 2
  %3 = bitcast i8** %arrayidx3 to i64*
  %4 = load i64, i64* %3, align 8, !tbaa !9
  %resultFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 1
  %5 = bitcast i8** %resultFilename to i64*
  store i64 %4, i64* %5, align 8, !tbaa !10
  %arrayidx4 = getelementptr inbounds i8*, i8** %arg, i64 3
  %6 = load i8*, i8** %arrayidx4, align 8, !tbaa !9
  %call5 = tail call i32 @atoi(i8* %6) #10
  %action = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 2
  store i32 %call5, i32* %action, align 8, !tbaa !11
  %arrayidx6 = getelementptr inbounds i8*, i8** %arg, i64 4
  %7 = load i8*, i8** %arrayidx6, align 8, !tbaa !9
  %call7 = tail call i32 @atoi(i8* %7) #10
  %simType = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 3
  store i32 %call7, i32* %simType, align 4, !tbaa !8
  %cmp8 = icmp eq i32 %nArgs, 6
  br i1 %cmp8, label %if.then9, label %if.else

if.then9:                                         ; preds = %if.end
  %arrayidx10 = getelementptr inbounds i8*, i8** %arg, i64 5
  %8 = load i8*, i8** %arrayidx10, align 8, !tbaa !9
  %obstacleFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 4
  store i8* %8, i8** %obstacleFilename, align 8, !tbaa !12
  %call12 = call i32 @stat(i8* %8, %struct.stat* %fileStat) #8
  %cmp13 = icmp eq i32 %call12, 0
  br i1 %cmp13, label %if.end17, label %if.then14

if.then14:                                        ; preds = %if.then9
  %9 = load i8*, i8** %obstacleFilename, align 8, !tbaa !12
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.2, i64 0, i64 0), i8* %9)
  call void @exit(i32 1) #9
  unreachable

if.end17:                                         ; preds = %if.then9
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %fileStat, i64 0, i32 8
  %10 = load i64, i64* %st_size, align 8, !tbaa !13
  %cmp18 = icmp eq i64 %10, 1313130
  br i1 %cmp18, label %if.end25, label %if.then19

if.then19:                                        ; preds = %if.end17
  %11 = load i8*, i8** %obstacleFilename, align 8, !tbaa !12
  %conv = trunc i64 %10 to i32
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([82 x i8], [82 x i8]* @.str.3, i64 0, i64 0), i8* %11, i32 %conv, i32 1313130)
  call void @exit(i32 1) #9
  unreachable

if.else:                                          ; preds = %if.end
  %obstacleFilename24 = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 4
  store i8* null, i8** %obstacleFilename24, align 8, !tbaa !12
  br label %if.end25

if.end25:                                         ; preds = %if.end17, %if.else
  %12 = load i32, i32* %action, align 8, !tbaa !11
  %cmp27 = icmp eq i32 %12, 1
  br i1 %cmp27, label %land.lhs.true, label %if.end36

land.lhs.true:                                    ; preds = %if.end25
  %13 = load i8*, i8** %resultFilename, align 8, !tbaa !10
  %call30 = call i32 @stat(i8* %13, %struct.stat* %fileStat) #8
  %cmp31 = icmp eq i32 %call30, 0
  br i1 %cmp31, label %if.end36, label %if.then33

if.then33:                                        ; preds = %land.lhs.true
  %14 = load i8*, i8** %resultFilename, align 8, !tbaa !10
  %call35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.4, i64 0, i64 0), i8* %14)
  call void @exit(i32 1) #9
  unreachable

if.end36:                                         ; preds = %land.lhs.true, %if.end25
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %0) #8
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @MAIN_printInfo(%struct.MAIN_Param* nocapture readonly %param) local_unnamed_addr #0 {
entry:
  %actionString = alloca [3 x [32 x i8]], align 16
  %simTypeString = alloca [3 x [32 x i8]], align 16
  %0 = getelementptr inbounds [3 x [32 x i8]], [3 x [32 x i8]]* %actionString, i64 0, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 96, i8* nonnull %0) #8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %0, i8* align 16 getelementptr inbounds ([3 x [32 x i8]], [3 x [32 x i8]]* @MAIN_printInfo.actionString, i64 0, i64 0, i64 0), i64 96, i1 false)
  %1 = getelementptr inbounds [3 x [32 x i8]], [3 x [32 x i8]]* %simTypeString, i64 0, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 96, i8* nonnull %1) #8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %1, i8* align 16 getelementptr inbounds ([3 x [32 x i8]], [3 x [32 x i8]]* @MAIN_printInfo.simTypeString, i64 0, i64 0, i64 0), i64 96, i1 false)
  %nTimeSteps = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 0
  %2 = load i32, i32* %nTimeSteps, align 8, !tbaa !2
  %resultFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 1
  %3 = load i8*, i8** %resultFilename, align 8, !tbaa !10
  %action = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 2
  %4 = load i32, i32* %action, align 8, !tbaa !11
  %idxprom = zext i32 %4 to i64
  %arraydecay = getelementptr inbounds [3 x [32 x i8]], [3 x [32 x i8]]* %actionString, i64 0, i64 %idxprom, i64 0
  %simType = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 3
  %5 = load i32, i32* %simType, align 4, !tbaa !8
  %idxprom1 = zext i32 %5 to i64
  %arraydecay3 = getelementptr inbounds [3 x [32 x i8]], [3 x [32 x i8]]* %simTypeString, i64 0, i64 %idxprom1, i64 0
  %obstacleFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 4
  %6 = load i8*, i8** %obstacleFilename, align 8, !tbaa !12
  %cmp = icmp eq i8* %6, null
  %spec.select = select i1 %cmp, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* %6
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([174 x i8], [174 x i8]* @.str.5, i64 0, i64 0), i32 100, i32 100, i32 130, double 0x3FF4CCCCCCCCCCCC, i32 %2, i8* %3, i8* nonnull %arraydecay, i8* nonnull %arraydecay3, i8* %spec.select)
  call void @llvm.lifetime.end.p0i8(i64 96, i8* nonnull %1) #8
  call void @llvm.lifetime.end.p0i8(i64 96, i8* nonnull %0) #8
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @MAIN_initialize(%struct.MAIN_Param* nocapture readonly %param) local_unnamed_addr #0 {
entry:
  tail call void @LBM_allocateGrid(double** bitcast ([26000000 x double]** @srcGrid to double**))
  tail call void @LBM_allocateGrid(double** bitcast ([26000000 x double]** @dstGrid to double**))
  %0 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !9
  %arraydecay = getelementptr inbounds [26000000 x double], [26000000 x double]* %0, i64 0, i64 0
  tail call void @LBM_initializeGrid(double* %arraydecay)
  %1 = load [26000000 x double]*, [26000000 x double]** @dstGrid, align 8, !tbaa !9
  %arraydecay1 = getelementptr inbounds [26000000 x double], [26000000 x double]* %1, i64 0, i64 0
  tail call void @LBM_initializeGrid(double* %arraydecay1)
  %obstacleFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 4
  %2 = load i8*, i8** %obstacleFilename, align 8, !tbaa !12
  %cmp = icmp eq i8* %2, null
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %3 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !9
  %arraydecay2 = getelementptr inbounds [26000000 x double], [26000000 x double]* %3, i64 0, i64 0
  tail call void @LBM_loadObstacleFile(double* %arraydecay2, i8* nonnull %2)
  %4 = load [26000000 x double]*, [26000000 x double]** @dstGrid, align 8, !tbaa !9
  %arraydecay4 = getelementptr inbounds [26000000 x double], [26000000 x double]* %4, i64 0, i64 0
  %5 = load i8*, i8** %obstacleFilename, align 8, !tbaa !12
  tail call void @LBM_loadObstacleFile(double* %arraydecay4, i8* %5)
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %simType = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 3
  %6 = load i32, i32* %simType, align 4, !tbaa !8
  %cmp6 = icmp eq i32 %6, 1
  %7 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !9
  %arraydecay8 = getelementptr inbounds [26000000 x double], [26000000 x double]* %7, i64 0, i64 0
  br i1 %cmp6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.end
  tail call void @LBM_initializeSpecialCellsForChannel(double* %arraydecay8)
  %8 = load [26000000 x double]*, [26000000 x double]** @dstGrid, align 8, !tbaa !9
  %arraydecay9 = getelementptr inbounds [26000000 x double], [26000000 x double]* %8, i64 0, i64 0
  tail call void @LBM_initializeSpecialCellsForChannel(double* %arraydecay9)
  br label %if.end12

if.else:                                          ; preds = %if.end
  tail call void @LBM_initializeSpecialCellsForLDC(double* %arraydecay8)
  %9 = load [26000000 x double]*, [26000000 x double]** @dstGrid, align 8, !tbaa !9
  %arraydecay11 = getelementptr inbounds [26000000 x double], [26000000 x double]* %9, i64 0, i64 0
  tail call void @LBM_initializeSpecialCellsForLDC(double* %arraydecay11)
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then7
  %10 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !9
  %arraydecay13 = getelementptr inbounds [26000000 x double], [26000000 x double]* %10, i64 0, i64 0
  tail call void @LBM_showGridStatistics(double* %arraydecay13)
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @MAIN_startClock(%struct.MAIN_Time* nocapture %time) local_unnamed_addr #0 {
entry:
  %call = tail call i64 @sysconf(i32 2) #8
  %conv = sitofp i64 %call to double
  %div = fdiv double 1.000000e+00, %conv
  %timeScale = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 0
  store double %div, double* %timeScale, align 8, !tbaa !17
  %timeStart = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 3
  %call1 = tail call i64 @times(%struct.tms* nonnull %timeStart) #8
  %tickStart = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 1
  store i64 %call1, i64* %tickStart, align 8, !tbaa !21
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @LBM_handleInOutFlow(double* %srcGrid) local_unnamed_addr #0 {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @str.25, i64 0, i64 0))
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv1670 = phi i64 [ 0, %entry ], [ %indvars.iv.next1671, %for.body ]
  %i.01613 = phi i32 [ 0, %entry ], [ %add390, %for.body ]
  %0 = add nuw nsw i64 %indvars.iv1670, 200000
  %arrayidx = getelementptr inbounds double, double* %srcGrid, i64 %0
  %1 = load double, double* %arrayidx, align 8, !tbaa !22
  %2 = add nuw nsw i64 %indvars.iv1670, 200001
  %arrayidx3 = getelementptr inbounds double, double* %srcGrid, i64 %2
  %3 = load double, double* %arrayidx3, align 8, !tbaa !22
  %add4 = fadd double %1, %3
  %4 = add nuw nsw i64 %indvars.iv1670, 200002
  %arrayidx7 = getelementptr inbounds double, double* %srcGrid, i64 %4
  %5 = load double, double* %arrayidx7, align 8, !tbaa !22
  %add8 = fadd double %add4, %5
  %6 = add nuw nsw i64 %indvars.iv1670, 200003
  %arrayidx11 = getelementptr inbounds double, double* %srcGrid, i64 %6
  %7 = load double, double* %arrayidx11, align 8, !tbaa !22
  %add12 = fadd double %add8, %7
  %8 = add nuw nsw i64 %indvars.iv1670, 200004
  %arrayidx15 = getelementptr inbounds double, double* %srcGrid, i64 %8
  %9 = load double, double* %arrayidx15, align 8, !tbaa !22
  %add16 = fadd double %add12, %9
  %10 = add nuw nsw i64 %indvars.iv1670, 200005
  %arrayidx19 = getelementptr inbounds double, double* %srcGrid, i64 %10
  %11 = load double, double* %arrayidx19, align 8, !tbaa !22
  %add20 = fadd double %add16, %11
  %12 = add nuw nsw i64 %indvars.iv1670, 200006
  %arrayidx23 = getelementptr inbounds double, double* %srcGrid, i64 %12
  %13 = load double, double* %arrayidx23, align 8, !tbaa !22
  %add24 = fadd double %add20, %13
  %14 = add nuw nsw i64 %indvars.iv1670, 200007
  %arrayidx27 = getelementptr inbounds double, double* %srcGrid, i64 %14
  %15 = load double, double* %arrayidx27, align 8, !tbaa !22
  %add28 = fadd double %add24, %15
  %16 = add nuw nsw i64 %indvars.iv1670, 200008
  %arrayidx31 = getelementptr inbounds double, double* %srcGrid, i64 %16
  %17 = load double, double* %arrayidx31, align 8, !tbaa !22
  %add32 = fadd double %add28, %17
  %18 = add nuw nsw i64 %indvars.iv1670, 200009
  %arrayidx35 = getelementptr inbounds double, double* %srcGrid, i64 %18
  %19 = load double, double* %arrayidx35, align 8, !tbaa !22
  %add36 = fadd double %add32, %19
  %20 = add nuw nsw i64 %indvars.iv1670, 200010
  %arrayidx39 = getelementptr inbounds double, double* %srcGrid, i64 %20
  %21 = load double, double* %arrayidx39, align 8, !tbaa !22
  %add40 = fadd double %add36, %21
  %22 = add nuw nsw i64 %indvars.iv1670, 200011
  %arrayidx43 = getelementptr inbounds double, double* %srcGrid, i64 %22
  %23 = load double, double* %arrayidx43, align 8, !tbaa !22
  %add44 = fadd double %add40, %23
  %24 = add nuw nsw i64 %indvars.iv1670, 200012
  %arrayidx47 = getelementptr inbounds double, double* %srcGrid, i64 %24
  %25 = load double, double* %arrayidx47, align 8, !tbaa !22
  %add48 = fadd double %add44, %25
  %26 = add nuw nsw i64 %indvars.iv1670, 200013
  %arrayidx51 = getelementptr inbounds double, double* %srcGrid, i64 %26
  %27 = load double, double* %arrayidx51, align 8, !tbaa !22
  %add52 = fadd double %add48, %27
  %28 = add nuw nsw i64 %indvars.iv1670, 200014
  %arrayidx55 = getelementptr inbounds double, double* %srcGrid, i64 %28
  %29 = load double, double* %arrayidx55, align 8, !tbaa !22
  %add56 = fadd double %add52, %29
  %30 = add nuw nsw i64 %indvars.iv1670, 200015
  %arrayidx59 = getelementptr inbounds double, double* %srcGrid, i64 %30
  %31 = load double, double* %arrayidx59, align 8, !tbaa !22
  %add60 = fadd double %add56, %31
  %32 = add nuw nsw i64 %indvars.iv1670, 200016
  %arrayidx63 = getelementptr inbounds double, double* %srcGrid, i64 %32
  %33 = load double, double* %arrayidx63, align 8, !tbaa !22
  %add64 = fadd double %add60, %33
  %34 = add nuw nsw i64 %indvars.iv1670, 200017
  %arrayidx67 = getelementptr inbounds double, double* %srcGrid, i64 %34
  %35 = load double, double* %arrayidx67, align 8, !tbaa !22
  %add68 = fadd double %add64, %35
  %36 = add nuw nsw i64 %indvars.iv1670, 200018
  %arrayidx71 = getelementptr inbounds double, double* %srcGrid, i64 %36
  %37 = load double, double* %arrayidx71, align 8, !tbaa !22
  %add72 = fadd double %add68, %37
  %38 = add nuw nsw i64 %indvars.iv1670, 400000
  %arrayidx75 = getelementptr inbounds double, double* %srcGrid, i64 %38
  %39 = load double, double* %arrayidx75, align 8, !tbaa !22
  %40 = add nuw nsw i64 %indvars.iv1670, 400001
  %arrayidx78 = getelementptr inbounds double, double* %srcGrid, i64 %40
  %41 = load double, double* %arrayidx78, align 8, !tbaa !22
  %add79 = fadd double %39, %41
  %42 = add nuw nsw i64 %indvars.iv1670, 400002
  %arrayidx82 = getelementptr inbounds double, double* %srcGrid, i64 %42
  %43 = load double, double* %arrayidx82, align 8, !tbaa !22
  %add83 = fadd double %add79, %43
  %44 = add nuw nsw i64 %indvars.iv1670, 400003
  %arrayidx86 = getelementptr inbounds double, double* %srcGrid, i64 %44
  %45 = load double, double* %arrayidx86, align 8, !tbaa !22
  %add87 = fadd double %add83, %45
  %46 = add nuw nsw i64 %indvars.iv1670, 400004
  %arrayidx90 = getelementptr inbounds double, double* %srcGrid, i64 %46
  %47 = load double, double* %arrayidx90, align 8, !tbaa !22
  %add91 = fadd double %add87, %47
  %48 = add nuw nsw i64 %indvars.iv1670, 400005
  %arrayidx94 = getelementptr inbounds double, double* %srcGrid, i64 %48
  %49 = load double, double* %arrayidx94, align 8, !tbaa !22
  %add95 = fadd double %add91, %49
  %50 = add nuw nsw i64 %indvars.iv1670, 400006
  %arrayidx98 = getelementptr inbounds double, double* %srcGrid, i64 %50
  %51 = load double, double* %arrayidx98, align 8, !tbaa !22
  %add99 = fadd double %add95, %51
  %52 = add nuw nsw i64 %indvars.iv1670, 400007
  %arrayidx102 = getelementptr inbounds double, double* %srcGrid, i64 %52
  %53 = load double, double* %arrayidx102, align 8, !tbaa !22
  %add103 = fadd double %add99, %53
  %54 = add nuw nsw i64 %indvars.iv1670, 400008
  %arrayidx106 = getelementptr inbounds double, double* %srcGrid, i64 %54
  %55 = load double, double* %arrayidx106, align 8, !tbaa !22
  %add107 = fadd double %add103, %55
  %56 = add nuw nsw i64 %indvars.iv1670, 400009
  %arrayidx110 = getelementptr inbounds double, double* %srcGrid, i64 %56
  %57 = load double, double* %arrayidx110, align 8, !tbaa !22
  %add111 = fadd double %add107, %57
  %58 = add nuw nsw i64 %indvars.iv1670, 400010
  %arrayidx114 = getelementptr inbounds double, double* %srcGrid, i64 %58
  %59 = load double, double* %arrayidx114, align 8, !tbaa !22
  %add115 = fadd double %add111, %59
  %60 = add nuw nsw i64 %indvars.iv1670, 400011
  %arrayidx118 = getelementptr inbounds double, double* %srcGrid, i64 %60
  %61 = load double, double* %arrayidx118, align 8, !tbaa !22
  %add119 = fadd double %add115, %61
  %62 = add nuw nsw i64 %indvars.iv1670, 400012
  %arrayidx122 = getelementptr inbounds double, double* %srcGrid, i64 %62
  %63 = load double, double* %arrayidx122, align 8, !tbaa !22
  %add123 = fadd double %add119, %63
  %64 = add nuw nsw i64 %indvars.iv1670, 400013
  %arrayidx126 = getelementptr inbounds double, double* %srcGrid, i64 %64
  %65 = load double, double* %arrayidx126, align 8, !tbaa !22
  %add127 = fadd double %add123, %65
  %66 = add nuw nsw i64 %indvars.iv1670, 400014
  %arrayidx130 = getelementptr inbounds double, double* %srcGrid, i64 %66
  %67 = load double, double* %arrayidx130, align 8, !tbaa !22
  %add131 = fadd double %add127, %67
  %68 = add nuw nsw i64 %indvars.iv1670, 400015
  %arrayidx134 = getelementptr inbounds double, double* %srcGrid, i64 %68
  %69 = load double, double* %arrayidx134, align 8, !tbaa !22
  %add135 = fadd double %add131, %69
  %70 = add nuw nsw i64 %indvars.iv1670, 400016
  %arrayidx138 = getelementptr inbounds double, double* %srcGrid, i64 %70
  %71 = load double, double* %arrayidx138, align 8, !tbaa !22
  %add139 = fadd double %add135, %71
  %72 = add nuw nsw i64 %indvars.iv1670, 400017
  %arrayidx142 = getelementptr inbounds double, double* %srcGrid, i64 %72
  %73 = load double, double* %arrayidx142, align 8, !tbaa !22
  %add143 = fadd double %add139, %73
  %74 = add nuw nsw i64 %indvars.iv1670, 400018
  %arrayidx146 = getelementptr inbounds double, double* %srcGrid, i64 %74
  %75 = load double, double* %arrayidx146, align 8, !tbaa !22
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
  %mul168 = fmul double %sub, 0x3FD5555555555555
  %sub169 = fsub double 1.000000e+00, %mul167
  %mul170 = fmul double %sub169, %mul168
  %arrayidx173 = getelementptr inbounds double, double* %srcGrid, i64 %indvars.iv1670
  store double %mul170, double* %arrayidx173, align 8, !tbaa !22
  %mul174 = fmul double %sub, 0x3FAC71C71C71C71C
  %mul180 = fmul double %sub169, %mul174
  %77 = or i64 %indvars.iv1670, 1
  %arrayidx183 = getelementptr inbounds double, double* %srcGrid, i64 %77
  store double %mul180, double* %arrayidx183, align 8, !tbaa !22
  %78 = or i64 %indvars.iv1670, 2
  %arrayidx193 = getelementptr inbounds double, double* %srcGrid, i64 %78
  store double %mul180, double* %arrayidx193, align 8, !tbaa !22
  %79 = or i64 %indvars.iv1670, 3
  %arrayidx203 = getelementptr inbounds double, double* %srcGrid, i64 %79
  store double %mul180, double* %arrayidx203, align 8, !tbaa !22
  %80 = add nuw nsw i64 %indvars.iv1670, 4
  %arrayidx213 = getelementptr inbounds double, double* %srcGrid, i64 %80
  store double %mul180, double* %arrayidx213, align 8, !tbaa !22
  %mul215 = fmul double %mul161, 4.500000e+00
  %add216 = fadd double %mul215, 3.000000e+00
  %mul217 = fmul double %mul161, %add216
  %add218 = fadd double %mul217, 1.000000e+00
  %sub219 = fsub double %add218, %mul167
  %mul220 = fmul double %sub219, %mul174
  %81 = add nuw nsw i64 %indvars.iv1670, 5
  %arrayidx223 = getelementptr inbounds double, double* %srcGrid, i64 %81
  store double %mul220, double* %arrayidx223, align 8, !tbaa !22
  %sub226 = fadd double %mul215, -3.000000e+00
  %mul227 = fmul double %mul161, %sub226
  %add228 = fadd double %mul227, 1.000000e+00
  %sub229 = fsub double %add228, %mul167
  %mul230 = fmul double %sub229, %mul174
  %82 = add nuw nsw i64 %indvars.iv1670, 6
  %arrayidx233 = getelementptr inbounds double, double* %srcGrid, i64 %82
  store double %mul230, double* %arrayidx233, align 8, !tbaa !22
  %mul234 = fmul double %sub, 0x3F9C71C71C71C71C
  %mul242 = fmul double %sub169, %mul234
  %83 = add nuw nsw i64 %indvars.iv1670, 7
  %arrayidx245 = getelementptr inbounds double, double* %srcGrid, i64 %83
  store double %mul242, double* %arrayidx245, align 8, !tbaa !22
  %84 = add nuw nsw i64 %indvars.iv1670, 8
  %arrayidx259 = getelementptr inbounds double, double* %srcGrid, i64 %84
  store double %mul242, double* %arrayidx259, align 8, !tbaa !22
  %85 = add nuw nsw i64 %indvars.iv1670, 9
  %arrayidx271 = getelementptr inbounds double, double* %srcGrid, i64 %85
  store double %mul242, double* %arrayidx271, align 8, !tbaa !22
  %86 = add nuw nsw i64 %indvars.iv1670, 10
  %arrayidx285 = getelementptr inbounds double, double* %srcGrid, i64 %86
  store double %mul242, double* %arrayidx285, align 8, !tbaa !22
  %add287 = fadd double %mul161, 0.000000e+00
  %mul289 = fmul double %add287, 4.500000e+00
  %add290 = fadd double %mul289, 3.000000e+00
  %mul291 = fmul double %add287, %add290
  %add292 = fadd double %mul291, 1.000000e+00
  %sub293 = fsub double %add292, %mul167
  %mul294 = fmul double %sub293, %mul234
  %87 = add nuw nsw i64 %indvars.iv1670, 11
  %arrayidx297 = getelementptr inbounds double, double* %srcGrid, i64 %87
  store double %mul294, double* %arrayidx297, align 8, !tbaa !22
  %sub299 = fsub double 0.000000e+00, %mul161
  %mul301 = fmul double %sub299, 4.500000e+00
  %add302 = fadd double %mul301, 3.000000e+00
  %mul303 = fmul double %sub299, %add302
  %add304 = fadd double %mul303, 1.000000e+00
  %sub305 = fsub double %add304, %mul167
  %mul306 = fmul double %sub305, %mul234
  %88 = add nuw nsw i64 %indvars.iv1670, 12
  %arrayidx309 = getelementptr inbounds double, double* %srcGrid, i64 %88
  store double %mul306, double* %arrayidx309, align 8, !tbaa !22
  %mul320 = fmul double %sub219, %mul234
  %89 = add nuw nsw i64 %indvars.iv1670, 13
  %arrayidx323 = getelementptr inbounds double, double* %srcGrid, i64 %89
  store double %mul320, double* %arrayidx323, align 8, !tbaa !22
  %mul329 = fmul double %mul161, 4.500000e+00
  %add3301611 = fsub double 3.000000e+00, %mul329
  %90 = fmul double %mul161, %add3301611
  %add332 = fsub double 1.000000e+00, %90
  %sub333 = fsub double %add332, %mul167
  %mul334 = fmul double %sub333, %mul234
  %91 = add nuw nsw i64 %indvars.iv1670, 14
  %arrayidx337 = getelementptr inbounds double, double* %srcGrid, i64 %91
  store double %mul334, double* %arrayidx337, align 8, !tbaa !22
  %92 = add nuw nsw i64 %indvars.iv1670, 15
  %arrayidx349 = getelementptr inbounds double, double* %srcGrid, i64 %92
  store double %mul294, double* %arrayidx349, align 8, !tbaa !22
  %93 = add nuw nsw i64 %indvars.iv1670, 16
  %arrayidx361 = getelementptr inbounds double, double* %srcGrid, i64 %93
  store double %mul306, double* %arrayidx361, align 8, !tbaa !22
  %94 = add nuw nsw i64 %indvars.iv1670, 17
  %arrayidx375 = getelementptr inbounds double, double* %srcGrid, i64 %94
  store double %mul320, double* %arrayidx375, align 8, !tbaa !22
  %95 = add nuw nsw i64 %indvars.iv1670, 18
  %arrayidx389 = getelementptr inbounds double, double* %srcGrid, i64 %95
  store double %mul334, double* %arrayidx389, align 8, !tbaa !22
  %indvars.iv.next1671 = add nuw nsw i64 %indvars.iv1670, 20
  %add390 = add nuw nsw i32 %i.01613, 20
  %cmp = icmp ult i64 %indvars.iv.next1671, 200000
  br i1 %cmp, label %for.body, label %for.body394

for.body394:                                      ; preds = %for.body, %for.body394
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body394 ], [ 25800000, %for.body ]
  %96 = add nsw i64 %indvars.iv, -200000
  %arrayidx397 = getelementptr inbounds double, double* %srcGrid, i64 %96
  %97 = load double, double* %arrayidx397, align 8, !tbaa !22
  %98 = add nsw i64 %indvars.iv, -199999
  %arrayidx400 = getelementptr inbounds double, double* %srcGrid, i64 %98
  %99 = load double, double* %arrayidx400, align 8, !tbaa !22
  %add401 = fadd double %97, %99
  %100 = add nsw i64 %indvars.iv, -199998
  %arrayidx404 = getelementptr inbounds double, double* %srcGrid, i64 %100
  %101 = load double, double* %arrayidx404, align 8, !tbaa !22
  %add405 = fadd double %add401, %101
  %102 = add nsw i64 %indvars.iv, -199997
  %arrayidx408 = getelementptr inbounds double, double* %srcGrid, i64 %102
  %103 = load double, double* %arrayidx408, align 8, !tbaa !22
  %add409 = fadd double %add405, %103
  %104 = add nsw i64 %indvars.iv, -199996
  %arrayidx412 = getelementptr inbounds double, double* %srcGrid, i64 %104
  %105 = load double, double* %arrayidx412, align 8, !tbaa !22
  %add413 = fadd double %add409, %105
  %106 = add nsw i64 %indvars.iv, -199995
  %arrayidx416 = getelementptr inbounds double, double* %srcGrid, i64 %106
  %107 = load double, double* %arrayidx416, align 8, !tbaa !22
  %add417 = fadd double %add413, %107
  %108 = add nsw i64 %indvars.iv, -199994
  %arrayidx420 = getelementptr inbounds double, double* %srcGrid, i64 %108
  %109 = load double, double* %arrayidx420, align 8, !tbaa !22
  %add421 = fadd double %add417, %109
  %110 = add nsw i64 %indvars.iv, -199993
  %arrayidx424 = getelementptr inbounds double, double* %srcGrid, i64 %110
  %111 = load double, double* %arrayidx424, align 8, !tbaa !22
  %add425 = fadd double %add421, %111
  %112 = add nsw i64 %indvars.iv, -199992
  %arrayidx428 = getelementptr inbounds double, double* %srcGrid, i64 %112
  %113 = load double, double* %arrayidx428, align 8, !tbaa !22
  %add429 = fadd double %add425, %113
  %114 = add nsw i64 %indvars.iv, -199991
  %arrayidx432 = getelementptr inbounds double, double* %srcGrid, i64 %114
  %115 = load double, double* %arrayidx432, align 8, !tbaa !22
  %add433 = fadd double %add429, %115
  %116 = add nsw i64 %indvars.iv, -199990
  %arrayidx436 = getelementptr inbounds double, double* %srcGrid, i64 %116
  %117 = load double, double* %arrayidx436, align 8, !tbaa !22
  %add437 = fadd double %add433, %117
  %118 = add nsw i64 %indvars.iv, -199989
  %arrayidx440 = getelementptr inbounds double, double* %srcGrid, i64 %118
  %119 = load double, double* %arrayidx440, align 8, !tbaa !22
  %add441 = fadd double %add437, %119
  %120 = add nsw i64 %indvars.iv, -199988
  %arrayidx444 = getelementptr inbounds double, double* %srcGrid, i64 %120
  %121 = load double, double* %arrayidx444, align 8, !tbaa !22
  %add445 = fadd double %add441, %121
  %122 = add nsw i64 %indvars.iv, -199987
  %arrayidx448 = getelementptr inbounds double, double* %srcGrid, i64 %122
  %123 = load double, double* %arrayidx448, align 8, !tbaa !22
  %add449 = fadd double %add445, %123
  %124 = add nsw i64 %indvars.iv, -199986
  %arrayidx452 = getelementptr inbounds double, double* %srcGrid, i64 %124
  %125 = load double, double* %arrayidx452, align 8, !tbaa !22
  %add453 = fadd double %add449, %125
  %126 = add nsw i64 %indvars.iv, -199985
  %arrayidx456 = getelementptr inbounds double, double* %srcGrid, i64 %126
  %127 = load double, double* %arrayidx456, align 8, !tbaa !22
  %add457 = fadd double %add453, %127
  %128 = add nsw i64 %indvars.iv, -199984
  %arrayidx460 = getelementptr inbounds double, double* %srcGrid, i64 %128
  %129 = load double, double* %arrayidx460, align 8, !tbaa !22
  %add461 = fadd double %add457, %129
  %130 = add nsw i64 %indvars.iv, -199983
  %arrayidx464 = getelementptr inbounds double, double* %srcGrid, i64 %130
  %131 = load double, double* %arrayidx464, align 8, !tbaa !22
  %add465 = fadd double %add461, %131
  %132 = add nsw i64 %indvars.iv, -199982
  %arrayidx468 = getelementptr inbounds double, double* %srcGrid, i64 %132
  %133 = load double, double* %arrayidx468, align 8, !tbaa !22
  %add469 = fadd double %add465, %133
  %sub476 = fsub double %103, %105
  %add480 = fadd double %sub476, %111
  %sub484 = fsub double %add480, %113
  %add488 = fadd double %sub484, %115
  %sub492 = fsub double %add488, %117
  %add496 = fadd double %sub492, %127
  %add500 = fadd double %add496, %129
  %sub504 = fsub double %add500, %131
  %sub508 = fsub double %sub504, %133
  %sub515 = fsub double %99, %101
  %add519 = fadd double %sub515, %111
  %add523 = fadd double %add519, %113
  %sub527 = fsub double %add523, %115
  %sub531 = fsub double %sub527, %117
  %add535 = fadd double %sub531, %119
  %add539 = fadd double %add535, %121
  %sub543 = fsub double %add539, %123
  %sub547 = fsub double %sub543, %125
  %sub554 = fsub double %107, %109
  %add558 = fadd double %sub554, %119
  %sub562 = fsub double %add558, %121
  %add566 = fadd double %sub562, %123
  %sub570 = fsub double %add566, %125
  %add574 = fadd double %sub570, %127
  %sub578 = fsub double %add574, %129
  %add582 = fadd double %sub578, %131
  %sub586 = fsub double %add582, %133
  %div587 = fdiv double %sub508, %add469
  %div588 = fdiv double %sub547, %add469
  %div589 = fdiv double %sub586, %add469
  %134 = add nsw i64 %indvars.iv, -400000
  %arrayidx592 = getelementptr inbounds double, double* %srcGrid, i64 %134
  %135 = load double, double* %arrayidx592, align 8, !tbaa !22
  %136 = add nsw i64 %indvars.iv, -399999
  %arrayidx595 = getelementptr inbounds double, double* %srcGrid, i64 %136
  %137 = load double, double* %arrayidx595, align 8, !tbaa !22
  %add596 = fadd double %135, %137
  %138 = add nsw i64 %indvars.iv, -399998
  %arrayidx599 = getelementptr inbounds double, double* %srcGrid, i64 %138
  %139 = load double, double* %arrayidx599, align 8, !tbaa !22
  %add600 = fadd double %add596, %139
  %140 = add nsw i64 %indvars.iv, -399997
  %arrayidx603 = getelementptr inbounds double, double* %srcGrid, i64 %140
  %141 = load double, double* %arrayidx603, align 8, !tbaa !22
  %add604 = fadd double %add600, %141
  %142 = add nsw i64 %indvars.iv, -399996
  %arrayidx607 = getelementptr inbounds double, double* %srcGrid, i64 %142
  %143 = load double, double* %arrayidx607, align 8, !tbaa !22
  %add608 = fadd double %add604, %143
  %144 = add nsw i64 %indvars.iv, -399995
  %arrayidx611 = getelementptr inbounds double, double* %srcGrid, i64 %144
  %145 = load double, double* %arrayidx611, align 8, !tbaa !22
  %add612 = fadd double %add608, %145
  %146 = add nsw i64 %indvars.iv, -399994
  %arrayidx615 = getelementptr inbounds double, double* %srcGrid, i64 %146
  %147 = load double, double* %arrayidx615, align 8, !tbaa !22
  %add616 = fadd double %add612, %147
  %148 = add nsw i64 %indvars.iv, -399993
  %arrayidx619 = getelementptr inbounds double, double* %srcGrid, i64 %148
  %149 = load double, double* %arrayidx619, align 8, !tbaa !22
  %add620 = fadd double %add616, %149
  %150 = add nsw i64 %indvars.iv, -399992
  %arrayidx623 = getelementptr inbounds double, double* %srcGrid, i64 %150
  %151 = load double, double* %arrayidx623, align 8, !tbaa !22
  %add624 = fadd double %add620, %151
  %152 = add nsw i64 %indvars.iv, -399991
  %arrayidx627 = getelementptr inbounds double, double* %srcGrid, i64 %152
  %153 = load double, double* %arrayidx627, align 8, !tbaa !22
  %add628 = fadd double %add624, %153
  %154 = add nsw i64 %indvars.iv, -399990
  %arrayidx631 = getelementptr inbounds double, double* %srcGrid, i64 %154
  %155 = load double, double* %arrayidx631, align 8, !tbaa !22
  %add632 = fadd double %add628, %155
  %156 = add nsw i64 %indvars.iv, -399989
  %arrayidx635 = getelementptr inbounds double, double* %srcGrid, i64 %156
  %157 = load double, double* %arrayidx635, align 8, !tbaa !22
  %add636 = fadd double %add632, %157
  %158 = add nsw i64 %indvars.iv, -399988
  %arrayidx639 = getelementptr inbounds double, double* %srcGrid, i64 %158
  %159 = load double, double* %arrayidx639, align 8, !tbaa !22
  %add640 = fadd double %add636, %159
  %160 = add nsw i64 %indvars.iv, -399987
  %arrayidx643 = getelementptr inbounds double, double* %srcGrid, i64 %160
  %161 = load double, double* %arrayidx643, align 8, !tbaa !22
  %add644 = fadd double %add640, %161
  %162 = add nsw i64 %indvars.iv, -399986
  %arrayidx647 = getelementptr inbounds double, double* %srcGrid, i64 %162
  %163 = load double, double* %arrayidx647, align 8, !tbaa !22
  %add648 = fadd double %add644, %163
  %164 = add nsw i64 %indvars.iv, -399985
  %arrayidx651 = getelementptr inbounds double, double* %srcGrid, i64 %164
  %165 = load double, double* %arrayidx651, align 8, !tbaa !22
  %add652 = fadd double %add648, %165
  %166 = add nsw i64 %indvars.iv, -399984
  %arrayidx655 = getelementptr inbounds double, double* %srcGrid, i64 %166
  %167 = load double, double* %arrayidx655, align 8, !tbaa !22
  %add656 = fadd double %add652, %167
  %168 = add nsw i64 %indvars.iv, -399983
  %arrayidx659 = getelementptr inbounds double, double* %srcGrid, i64 %168
  %169 = load double, double* %arrayidx659, align 8, !tbaa !22
  %add660 = fadd double %add656, %169
  %170 = add nsw i64 %indvars.iv, -399982
  %arrayidx663 = getelementptr inbounds double, double* %srcGrid, i64 %170
  %171 = load double, double* %arrayidx663, align 8, !tbaa !22
  %add664 = fadd double %add660, %171
  %sub671 = fsub double %141, %143
  %add675 = fadd double %sub671, %149
  %sub679 = fsub double %add675, %151
  %add683 = fadd double %sub679, %153
  %sub687 = fsub double %add683, %155
  %add691 = fadd double %sub687, %165
  %add695 = fadd double %add691, %167
  %sub699 = fsub double %add695, %169
  %sub703 = fsub double %sub699, %171
  %sub710 = fsub double %137, %139
  %add714 = fadd double %sub710, %149
  %add718 = fadd double %add714, %151
  %sub722 = fsub double %add718, %153
  %sub726 = fsub double %sub722, %155
  %add730 = fadd double %sub726, %157
  %add734 = fadd double %add730, %159
  %sub738 = fsub double %add734, %161
  %sub742 = fsub double %sub738, %163
  %sub749 = fsub double %145, %147
  %add753 = fadd double %sub749, %157
  %sub757 = fsub double %add753, %159
  %add761 = fadd double %sub757, %161
  %sub765 = fsub double %add761, %163
  %add769 = fadd double %sub765, %165
  %sub773 = fsub double %add769, %167
  %add777 = fadd double %sub773, %169
  %sub781 = fsub double %add777, %171
  %div782 = fdiv double %sub703, %add664
  %div783 = fdiv double %sub742, %add664
  %div784 = fdiv double %sub781, %add664
  %mul785 = fmul double %div587, 2.000000e+00
  %sub786 = fsub double %mul785, %div782
  %mul787 = fmul double %div588, 2.000000e+00
  %sub788 = fsub double %mul787, %div783
  %mul789 = fmul double %div589, 2.000000e+00
  %sub790 = fsub double %mul789, %div784
  %mul791 = fmul double %sub786, %sub786
  %mul792 = fmul double %sub788, %sub788
  %add793 = fadd double %mul791, %mul792
  %mul794 = fmul double %sub790, %sub790
  %add795 = fadd double %mul794, %add793
  %mul796 = fmul double %add795, 1.500000e+00
  %sub798 = fsub double 1.000000e+00, %mul796
  %mul799 = fmul double %sub798, 0x3FD5555555555555
  %arrayidx802 = getelementptr inbounds double, double* %srcGrid, i64 %indvars.iv
  store double %mul799, double* %arrayidx802, align 8, !tbaa !22
  %mul804 = fmul double %sub788, 4.500000e+00
  %add805 = fadd double %mul804, 3.000000e+00
  %mul806 = fmul double %sub788, %add805
  %add807 = fadd double %mul806, 1.000000e+00
  %sub808 = fsub double %add807, %mul796
  %mul809 = fmul double %sub808, 0x3FAC71C71C71C71C
  %172 = or i64 %indvars.iv, 1
  %arrayidx812 = getelementptr inbounds double, double* %srcGrid, i64 %172
  store double %mul809, double* %arrayidx812, align 8, !tbaa !22
  %sub815 = fadd double %mul804, -3.000000e+00
  %mul816 = fmul double %sub788, %sub815
  %add817 = fadd double %mul816, 1.000000e+00
  %sub818 = fsub double %add817, %mul796
  %mul819 = fmul double %sub818, 0x3FAC71C71C71C71C
  %173 = or i64 %indvars.iv, 2
  %arrayidx822 = getelementptr inbounds double, double* %srcGrid, i64 %173
  store double %mul819, double* %arrayidx822, align 8, !tbaa !22
  %mul824 = fmul double %sub786, 4.500000e+00
  %add825 = fadd double %mul824, 3.000000e+00
  %mul826 = fmul double %sub786, %add825
  %add827 = fadd double %mul826, 1.000000e+00
  %sub828 = fsub double %add827, %mul796
  %mul829 = fmul double %sub828, 0x3FAC71C71C71C71C
  %174 = or i64 %indvars.iv, 3
  %arrayidx832 = getelementptr inbounds double, double* %srcGrid, i64 %174
  store double %mul829, double* %arrayidx832, align 8, !tbaa !22
  %sub835 = fadd double %mul824, -3.000000e+00
  %mul836 = fmul double %sub786, %sub835
  %add837 = fadd double %mul836, 1.000000e+00
  %sub838 = fsub double %add837, %mul796
  %mul839 = fmul double %sub838, 0x3FAC71C71C71C71C
  %175 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx842 = getelementptr inbounds double, double* %srcGrid, i64 %175
  store double %mul839, double* %arrayidx842, align 8, !tbaa !22
  %mul844 = fmul double %sub790, 4.500000e+00
  %add845 = fadd double %mul844, 3.000000e+00
  %mul846 = fmul double %sub790, %add845
  %add847 = fadd double %mul846, 1.000000e+00
  %sub848 = fsub double %add847, %mul796
  %mul849 = fmul double %sub848, 0x3FAC71C71C71C71C
  %176 = add nuw nsw i64 %indvars.iv, 5
  %arrayidx852 = getelementptr inbounds double, double* %srcGrid, i64 %176
  store double %mul849, double* %arrayidx852, align 8, !tbaa !22
  %sub855 = fadd double %mul844, -3.000000e+00
  %mul856 = fmul double %sub790, %sub855
  %add857 = fadd double %mul856, 1.000000e+00
  %sub858 = fsub double %add857, %mul796
  %mul859 = fmul double %sub858, 0x3FAC71C71C71C71C
  %177 = add nuw nsw i64 %indvars.iv, 6
  %arrayidx862 = getelementptr inbounds double, double* %srcGrid, i64 %177
  store double %mul859, double* %arrayidx862, align 8, !tbaa !22
  %add864 = fadd double %sub786, %sub788
  %mul866 = fmul double %add864, 4.500000e+00
  %add867 = fadd double %mul866, 3.000000e+00
  %mul868 = fmul double %add864, %add867
  %add869 = fadd double %mul868, 1.000000e+00
  %sub870 = fsub double %add869, %mul796
  %mul871 = fmul double %sub870, 0x3F9C71C71C71C71C
  %178 = add nuw nsw i64 %indvars.iv, 7
  %arrayidx874 = getelementptr inbounds double, double* %srcGrid, i64 %178
  store double %mul871, double* %arrayidx874, align 8, !tbaa !22
  %sub876 = fsub double -0.000000e+00, %sub786
  %add877 = fsub double %sub788, %sub786
  %mul880 = fmul double %add877, 4.500000e+00
  %add881 = fadd double %mul880, 3.000000e+00
  %mul882 = fmul double %add877, %add881
  %add883 = fadd double %mul882, 1.000000e+00
  %sub884 = fsub double %add883, %mul796
  %mul885 = fmul double %sub884, 0x3F9C71C71C71C71C
  %179 = add nuw nsw i64 %indvars.iv, 8
  %arrayidx888 = getelementptr inbounds double, double* %srcGrid, i64 %179
  store double %mul885, double* %arrayidx888, align 8, !tbaa !22
  %sub890 = fsub double %sub786, %sub788
  %mul892 = fmul double %sub890, 4.500000e+00
  %add893 = fadd double %mul892, 3.000000e+00
  %mul894 = fmul double %sub890, %add893
  %add895 = fadd double %mul894, 1.000000e+00
  %sub896 = fsub double %add895, %mul796
  %mul897 = fmul double %sub896, 0x3F9C71C71C71C71C
  %180 = add nuw nsw i64 %indvars.iv, 9
  %arrayidx900 = getelementptr inbounds double, double* %srcGrid, i64 %180
  store double %mul897, double* %arrayidx900, align 8, !tbaa !22
  %sub903 = fsub double %sub876, %sub788
  %mul906 = fmul double %sub903, 4.500000e+00
  %add907 = fadd double %mul906, 3.000000e+00
  %mul908 = fmul double %sub903, %add907
  %add909 = fadd double %mul908, 1.000000e+00
  %sub910 = fsub double %add909, %mul796
  %mul911 = fmul double %sub910, 0x3F9C71C71C71C71C
  %181 = add nuw nsw i64 %indvars.iv, 10
  %arrayidx914 = getelementptr inbounds double, double* %srcGrid, i64 %181
  store double %mul911, double* %arrayidx914, align 8, !tbaa !22
  %add916 = fadd double %sub788, %sub790
  %mul918 = fmul double %add916, 4.500000e+00
  %add919 = fadd double %mul918, 3.000000e+00
  %mul920 = fmul double %add916, %add919
  %add921 = fadd double %mul920, 1.000000e+00
  %sub922 = fsub double %add921, %mul796
  %mul923 = fmul double %sub922, 0x3F9C71C71C71C71C
  %182 = add nuw nsw i64 %indvars.iv, 11
  %arrayidx926 = getelementptr inbounds double, double* %srcGrid, i64 %182
  store double %mul923, double* %arrayidx926, align 8, !tbaa !22
  %sub928 = fsub double %sub788, %sub790
  %mul930 = fmul double %sub928, 4.500000e+00
  %add931 = fadd double %mul930, 3.000000e+00
  %mul932 = fmul double %sub928, %add931
  %add933 = fadd double %mul932, 1.000000e+00
  %sub934 = fsub double %add933, %mul796
  %mul935 = fmul double %sub934, 0x3F9C71C71C71C71C
  %183 = add nuw nsw i64 %indvars.iv, 12
  %arrayidx938 = getelementptr inbounds double, double* %srcGrid, i64 %183
  store double %mul935, double* %arrayidx938, align 8, !tbaa !22
  %sub940 = fsub double -0.000000e+00, %sub788
  %add941 = fsub double %sub790, %sub788
  %mul944 = fmul double %add941, 4.500000e+00
  %add945 = fadd double %mul944, 3.000000e+00
  %mul946 = fmul double %add941, %add945
  %add947 = fadd double %mul946, 1.000000e+00
  %sub948 = fsub double %add947, %mul796
  %mul949 = fmul double %sub948, 0x3F9C71C71C71C71C
  %184 = add nuw nsw i64 %indvars.iv, 13
  %arrayidx952 = getelementptr inbounds double, double* %srcGrid, i64 %184
  store double %mul949, double* %arrayidx952, align 8, !tbaa !22
  %sub955 = fsub double %sub940, %sub790
  %mul958 = fmul double %sub955, 4.500000e+00
  %add959 = fadd double %mul958, 3.000000e+00
  %mul960 = fmul double %sub955, %add959
  %add961 = fadd double %mul960, 1.000000e+00
  %sub962 = fsub double %add961, %mul796
  %mul963 = fmul double %sub962, 0x3F9C71C71C71C71C
  %185 = add nuw nsw i64 %indvars.iv, 14
  %arrayidx966 = getelementptr inbounds double, double* %srcGrid, i64 %185
  store double %mul963, double* %arrayidx966, align 8, !tbaa !22
  %add968 = fadd double %sub786, %sub790
  %mul970 = fmul double %add968, 4.500000e+00
  %add971 = fadd double %mul970, 3.000000e+00
  %mul972 = fmul double %add968, %add971
  %add973 = fadd double %mul972, 1.000000e+00
  %sub974 = fsub double %add973, %mul796
  %mul975 = fmul double %sub974, 0x3F9C71C71C71C71C
  %186 = add nuw nsw i64 %indvars.iv, 15
  %arrayidx978 = getelementptr inbounds double, double* %srcGrid, i64 %186
  store double %mul975, double* %arrayidx978, align 8, !tbaa !22
  %sub980 = fsub double %sub786, %sub790
  %mul982 = fmul double %sub980, 4.500000e+00
  %add983 = fadd double %mul982, 3.000000e+00
  %mul984 = fmul double %sub980, %add983
  %add985 = fadd double %mul984, 1.000000e+00
  %sub986 = fsub double %add985, %mul796
  %mul987 = fmul double %sub986, 0x3F9C71C71C71C71C
  %187 = add nuw nsw i64 %indvars.iv, 16
  %arrayidx990 = getelementptr inbounds double, double* %srcGrid, i64 %187
  store double %mul987, double* %arrayidx990, align 8, !tbaa !22
  %add993 = fsub double %sub790, %sub786
  %mul996 = fmul double %add993, 4.500000e+00
  %add997 = fadd double %mul996, 3.000000e+00
  %mul998 = fmul double %add993, %add997
  %add999 = fadd double %mul998, 1.000000e+00
  %sub1000 = fsub double %add999, %mul796
  %mul1001 = fmul double %sub1000, 0x3F9C71C71C71C71C
  %188 = add nuw nsw i64 %indvars.iv, 17
  %arrayidx1004 = getelementptr inbounds double, double* %srcGrid, i64 %188
  store double %mul1001, double* %arrayidx1004, align 8, !tbaa !22
  %sub1007 = fsub double %sub876, %sub790
  %mul1010 = fmul double %sub1007, 4.500000e+00
  %add1011 = fadd double %mul1010, 3.000000e+00
  %mul1012 = fmul double %sub1007, %add1011
  %add1013 = fadd double %mul1012, 1.000000e+00
  %sub1014 = fsub double %add1013, %mul796
  %mul1015 = fmul double %sub1014, 0x3F9C71C71C71C71C
  %189 = add nuw nsw i64 %indvars.iv, 18
  %arrayidx1018 = getelementptr inbounds double, double* %srcGrid, i64 %189
  store double %mul1015, double* %arrayidx1018, align 8, !tbaa !22
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 20
  %cmp392 = icmp ult i64 %indvars.iv.next, 26000000
  br i1 %cmp392, label %for.body394, label %for.end1021

for.end1021:                                      ; preds = %for.body394
  %puts1608 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @str.26, i64 0, i64 0))
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
  %2 = load i32, i32* %1, align 4, !tbaa !23
  %and = and i32 %2, 1
  %tobool = icmp eq i32 %and, 0
  %arrayidx3 = getelementptr inbounds double, double* %srcGrid, i64 %indvars.iv
  %3 = load double, double* %arrayidx3, align 8, !tbaa !22
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %for.body
  %arrayidx6 = getelementptr inbounds double, double* %dstGrid, i64 %indvars.iv
  store double %3, double* %arrayidx6, align 8, !tbaa !22
  %4 = or i64 %indvars.iv, 1
  %arrayidx9 = getelementptr inbounds double, double* %srcGrid, i64 %4
  %5 = bitcast double* %arrayidx9 to i64*
  %6 = load i64, i64* %5, align 8, !tbaa !22
  %7 = add nsw i64 %indvars.iv, -1998
  %arrayidx12 = getelementptr inbounds double, double* %dstGrid, i64 %7
  %8 = bitcast double* %arrayidx12 to i64*
  store i64 %6, i64* %8, align 8, !tbaa !22
  %9 = or i64 %indvars.iv, 2
  %arrayidx15 = getelementptr inbounds double, double* %srcGrid, i64 %9
  %10 = bitcast double* %arrayidx15 to i64*
  %11 = load i64, i64* %10, align 8, !tbaa !22
  %12 = add nuw nsw i64 %indvars.iv, 2001
  %arrayidx18 = getelementptr inbounds double, double* %dstGrid, i64 %12
  %13 = bitcast double* %arrayidx18 to i64*
  store i64 %11, i64* %13, align 8, !tbaa !22
  %14 = or i64 %indvars.iv, 3
  %arrayidx21 = getelementptr inbounds double, double* %srcGrid, i64 %14
  %15 = bitcast double* %arrayidx21 to i64*
  %16 = load i64, i64* %15, align 8, !tbaa !22
  %17 = add nsw i64 %indvars.iv, -16
  %arrayidx24 = getelementptr inbounds double, double* %dstGrid, i64 %17
  %18 = bitcast double* %arrayidx24 to i64*
  store i64 %16, i64* %18, align 8, !tbaa !22
  %19 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx27 = getelementptr inbounds double, double* %srcGrid, i64 %19
  %20 = bitcast double* %arrayidx27 to i64*
  %21 = load i64, i64* %20, align 8, !tbaa !22
  %22 = add nuw nsw i64 %indvars.iv, 23
  %arrayidx30 = getelementptr inbounds double, double* %dstGrid, i64 %22
  %23 = bitcast double* %arrayidx30 to i64*
  store i64 %21, i64* %23, align 8, !tbaa !22
  %24 = add nuw nsw i64 %indvars.iv, 5
  %arrayidx33 = getelementptr inbounds double, double* %srcGrid, i64 %24
  %25 = bitcast double* %arrayidx33 to i64*
  %26 = load i64, i64* %25, align 8, !tbaa !22
  %27 = add nsw i64 %indvars.iv, -199994
  %arrayidx36 = getelementptr inbounds double, double* %dstGrid, i64 %27
  %28 = bitcast double* %arrayidx36 to i64*
  store i64 %26, i64* %28, align 8, !tbaa !22
  %29 = add nuw nsw i64 %indvars.iv, 6
  %arrayidx39 = getelementptr inbounds double, double* %srcGrid, i64 %29
  %30 = bitcast double* %arrayidx39 to i64*
  %31 = load i64, i64* %30, align 8, !tbaa !22
  %32 = add nuw nsw i64 %indvars.iv, 200005
  %arrayidx42 = getelementptr inbounds double, double* %dstGrid, i64 %32
  %33 = bitcast double* %arrayidx42 to i64*
  store i64 %31, i64* %33, align 8, !tbaa !22
  %34 = add nuw nsw i64 %indvars.iv, 7
  %arrayidx45 = getelementptr inbounds double, double* %srcGrid, i64 %34
  %35 = bitcast double* %arrayidx45 to i64*
  %36 = load i64, i64* %35, align 8, !tbaa !22
  %37 = add nsw i64 %indvars.iv, -2010
  %arrayidx48 = getelementptr inbounds double, double* %dstGrid, i64 %37
  %38 = bitcast double* %arrayidx48 to i64*
  store i64 %36, i64* %38, align 8, !tbaa !22
  %39 = add nuw nsw i64 %indvars.iv, 8
  %arrayidx51 = getelementptr inbounds double, double* %srcGrid, i64 %39
  %40 = bitcast double* %arrayidx51 to i64*
  %41 = load i64, i64* %40, align 8, !tbaa !22
  %42 = add nsw i64 %indvars.iv, -1971
  %arrayidx54 = getelementptr inbounds double, double* %dstGrid, i64 %42
  %43 = bitcast double* %arrayidx54 to i64*
  store i64 %41, i64* %43, align 8, !tbaa !22
  %44 = add nuw nsw i64 %indvars.iv, 9
  %arrayidx57 = getelementptr inbounds double, double* %srcGrid, i64 %44
  %45 = bitcast double* %arrayidx57 to i64*
  %46 = load i64, i64* %45, align 8, !tbaa !22
  %47 = add nuw nsw i64 %indvars.iv, 1988
  %arrayidx60 = getelementptr inbounds double, double* %dstGrid, i64 %47
  %48 = bitcast double* %arrayidx60 to i64*
  store i64 %46, i64* %48, align 8, !tbaa !22
  %49 = add nuw nsw i64 %indvars.iv, 10
  %arrayidx63 = getelementptr inbounds double, double* %srcGrid, i64 %49
  %50 = bitcast double* %arrayidx63 to i64*
  %51 = load i64, i64* %50, align 8, !tbaa !22
  %52 = add nuw nsw i64 %indvars.iv, 2027
  %arrayidx66 = getelementptr inbounds double, double* %dstGrid, i64 %52
  %53 = bitcast double* %arrayidx66 to i64*
  store i64 %51, i64* %53, align 8, !tbaa !22
  %54 = add nuw nsw i64 %indvars.iv, 11
  %arrayidx69 = getelementptr inbounds double, double* %srcGrid, i64 %54
  %55 = bitcast double* %arrayidx69 to i64*
  %56 = load i64, i64* %55, align 8, !tbaa !22
  %57 = add nsw i64 %indvars.iv, -201986
  %arrayidx72 = getelementptr inbounds double, double* %dstGrid, i64 %57
  %58 = bitcast double* %arrayidx72 to i64*
  store i64 %56, i64* %58, align 8, !tbaa !22
  %59 = add nuw nsw i64 %indvars.iv, 12
  %arrayidx75 = getelementptr inbounds double, double* %srcGrid, i64 %59
  %60 = bitcast double* %arrayidx75 to i64*
  %61 = load i64, i64* %60, align 8, !tbaa !22
  %62 = add nuw nsw i64 %indvars.iv, 198013
  %arrayidx78 = getelementptr inbounds double, double* %dstGrid, i64 %62
  %63 = bitcast double* %arrayidx78 to i64*
  store i64 %61, i64* %63, align 8, !tbaa !22
  %64 = add nuw nsw i64 %indvars.iv, 13
  %arrayidx81 = getelementptr inbounds double, double* %srcGrid, i64 %64
  %65 = bitcast double* %arrayidx81 to i64*
  %66 = load i64, i64* %65, align 8, !tbaa !22
  %67 = add nsw i64 %indvars.iv, -197988
  %arrayidx84 = getelementptr inbounds double, double* %dstGrid, i64 %67
  %68 = bitcast double* %arrayidx84 to i64*
  store i64 %66, i64* %68, align 8, !tbaa !22
  %69 = add nuw nsw i64 %indvars.iv, 14
  %arrayidx87 = getelementptr inbounds double, double* %srcGrid, i64 %69
  %70 = bitcast double* %arrayidx87 to i64*
  %71 = load i64, i64* %70, align 8, !tbaa !22
  %72 = add nuw nsw i64 %indvars.iv, 202011
  %arrayidx90 = getelementptr inbounds double, double* %dstGrid, i64 %72
  %73 = bitcast double* %arrayidx90 to i64*
  store i64 %71, i64* %73, align 8, !tbaa !22
  %74 = add nuw nsw i64 %indvars.iv, 15
  %arrayidx93 = getelementptr inbounds double, double* %srcGrid, i64 %74
  %75 = bitcast double* %arrayidx93 to i64*
  %76 = load i64, i64* %75, align 8, !tbaa !22
  %77 = add nsw i64 %indvars.iv, -200002
  %arrayidx96 = getelementptr inbounds double, double* %dstGrid, i64 %77
  %78 = bitcast double* %arrayidx96 to i64*
  store i64 %76, i64* %78, align 8, !tbaa !22
  %79 = add nuw nsw i64 %indvars.iv, 16
  %arrayidx99 = getelementptr inbounds double, double* %srcGrid, i64 %79
  %80 = bitcast double* %arrayidx99 to i64*
  %81 = load i64, i64* %80, align 8, !tbaa !22
  %82 = add nuw nsw i64 %indvars.iv, 199997
  %arrayidx102 = getelementptr inbounds double, double* %dstGrid, i64 %82
  %83 = bitcast double* %arrayidx102 to i64*
  store i64 %81, i64* %83, align 8, !tbaa !22
  %84 = add nuw nsw i64 %indvars.iv, 17
  %arrayidx105 = getelementptr inbounds double, double* %srcGrid, i64 %84
  %85 = bitcast double* %arrayidx105 to i64*
  %86 = load i64, i64* %85, align 8, !tbaa !22
  %87 = add nsw i64 %indvars.iv, -199964
  %arrayidx108 = getelementptr inbounds double, double* %dstGrid, i64 %87
  %88 = bitcast double* %arrayidx108 to i64*
  store i64 %86, i64* %88, align 8, !tbaa !22
  %89 = add nuw nsw i64 %indvars.iv, 18
  %arrayidx111 = getelementptr inbounds double, double* %srcGrid, i64 %89
  %90 = bitcast double* %arrayidx111 to i64*
  %91 = load i64, i64* %90, align 8, !tbaa !22
  %92 = add nuw nsw i64 %indvars.iv, 200035
  %arrayidx114 = getelementptr inbounds double, double* %dstGrid, i64 %92
  %93 = bitcast double* %arrayidx114 to i64*
  store i64 %91, i64* %93, align 8, !tbaa !22
  br label %for.inc

if.end:                                           ; preds = %for.body
  %94 = or i64 %indvars.iv, 1
  %arrayidx120 = getelementptr inbounds double, double* %srcGrid, i64 %94
  %95 = load double, double* %arrayidx120, align 8, !tbaa !22
  %add121 = fadd double %3, %95
  %96 = or i64 %indvars.iv, 2
  %arrayidx124 = getelementptr inbounds double, double* %srcGrid, i64 %96
  %97 = load double, double* %arrayidx124, align 8, !tbaa !22
  %add125 = fadd double %add121, %97
  %98 = or i64 %indvars.iv, 3
  %arrayidx128 = getelementptr inbounds double, double* %srcGrid, i64 %98
  %99 = load double, double* %arrayidx128, align 8, !tbaa !22
  %add129 = fadd double %add125, %99
  %100 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx132 = getelementptr inbounds double, double* %srcGrid, i64 %100
  %101 = load double, double* %arrayidx132, align 8, !tbaa !22
  %add133 = fadd double %add129, %101
  %102 = add nuw nsw i64 %indvars.iv, 5
  %arrayidx136 = getelementptr inbounds double, double* %srcGrid, i64 %102
  %103 = load double, double* %arrayidx136, align 8, !tbaa !22
  %add137 = fadd double %add133, %103
  %104 = add nuw nsw i64 %indvars.iv, 6
  %arrayidx140 = getelementptr inbounds double, double* %srcGrid, i64 %104
  %105 = load double, double* %arrayidx140, align 8, !tbaa !22
  %add141 = fadd double %add137, %105
  %106 = add nuw nsw i64 %indvars.iv, 7
  %arrayidx144 = getelementptr inbounds double, double* %srcGrid, i64 %106
  %107 = load double, double* %arrayidx144, align 8, !tbaa !22
  %add145 = fadd double %add141, %107
  %108 = add nuw nsw i64 %indvars.iv, 8
  %arrayidx148 = getelementptr inbounds double, double* %srcGrid, i64 %108
  %109 = load double, double* %arrayidx148, align 8, !tbaa !22
  %add149 = fadd double %add145, %109
  %110 = add nuw nsw i64 %indvars.iv, 9
  %arrayidx152 = getelementptr inbounds double, double* %srcGrid, i64 %110
  %111 = load double, double* %arrayidx152, align 8, !tbaa !22
  %add153 = fadd double %add149, %111
  %112 = add nuw nsw i64 %indvars.iv, 10
  %arrayidx156 = getelementptr inbounds double, double* %srcGrid, i64 %112
  %113 = load double, double* %arrayidx156, align 8, !tbaa !22
  %add157 = fadd double %add153, %113
  %114 = add nuw nsw i64 %indvars.iv, 11
  %arrayidx160 = getelementptr inbounds double, double* %srcGrid, i64 %114
  %115 = load double, double* %arrayidx160, align 8, !tbaa !22
  %add161 = fadd double %add157, %115
  %116 = add nuw nsw i64 %indvars.iv, 12
  %arrayidx164 = getelementptr inbounds double, double* %srcGrid, i64 %116
  %117 = load double, double* %arrayidx164, align 8, !tbaa !22
  %add165 = fadd double %add161, %117
  %118 = add nuw nsw i64 %indvars.iv, 13
  %arrayidx168 = getelementptr inbounds double, double* %srcGrid, i64 %118
  %119 = load double, double* %arrayidx168, align 8, !tbaa !22
  %add169 = fadd double %add165, %119
  %120 = add nuw nsw i64 %indvars.iv, 14
  %arrayidx172 = getelementptr inbounds double, double* %srcGrid, i64 %120
  %121 = load double, double* %arrayidx172, align 8, !tbaa !22
  %add173 = fadd double %add169, %121
  %122 = add nuw nsw i64 %indvars.iv, 15
  %arrayidx176 = getelementptr inbounds double, double* %srcGrid, i64 %122
  %123 = load double, double* %arrayidx176, align 8, !tbaa !22
  %add177 = fadd double %add173, %123
  %124 = add nuw nsw i64 %indvars.iv, 16
  %arrayidx180 = getelementptr inbounds double, double* %srcGrid, i64 %124
  %125 = load double, double* %arrayidx180, align 8, !tbaa !22
  %add181 = fadd double %add177, %125
  %126 = add nuw nsw i64 %indvars.iv, 17
  %arrayidx184 = getelementptr inbounds double, double* %srcGrid, i64 %126
  %127 = load double, double* %arrayidx184, align 8, !tbaa !22
  %add185 = fadd double %add181, %127
  %128 = add nuw nsw i64 %indvars.iv, 18
  %arrayidx188 = getelementptr inbounds double, double* %srcGrid, i64 %128
  %129 = load double, double* %arrayidx188, align 8, !tbaa !22
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
  store double %add3271004, double* %arrayidx330, align 8, !tbaa !22
  %130 = load double, double* %arrayidx120, align 8, !tbaa !22
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
  store double %add3421005, double* %arrayidx345, align 8, !tbaa !22
  %132 = load double, double* %arrayidx124, align 8, !tbaa !22
  %mul349 = fmul double %132, 0x3FEE666666666666
  %sub352 = fadd double %mul336, -3.000000e+00
  %mul353 = fmul double %spec.select, %sub352
  %add354 = fadd double %mul353, 1.000000e+00
  %sub355 = fsub double %add354, %mul319
  %mul356 = fmul double %mul335, %sub355
  %add3571006 = fsub double %mul356, %mul349
  %133 = add nsw i64 %indvars.iv, -1998
  %arrayidx360 = getelementptr inbounds double, double* %dstGrid, i64 %133
  store double %add3571006, double* %arrayidx360, align 8, !tbaa !22
  %134 = load double, double* %arrayidx128, align 8, !tbaa !22
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
  store double %add3721007, double* %arrayidx375, align 8, !tbaa !22
  %136 = load double, double* %arrayidx132, align 8, !tbaa !22
  %mul379 = fmul double %136, 0x3FEE666666666666
  %sub382 = fadd double %mul366, -3.000000e+00
  %mul383 = fmul double %spec.select1003, %sub382
  %add384 = fadd double %mul383, 1.000000e+00
  %sub385 = fsub double %add384, %mul319
  %mul386 = fmul double %mul335, %sub385
  %add3871008 = fsub double %mul386, %mul379
  %137 = add nsw i64 %indvars.iv, -16
  %arrayidx390 = getelementptr inbounds double, double* %dstGrid, i64 %137
  store double %add3871008, double* %arrayidx390, align 8, !tbaa !22
  %138 = load double, double* %arrayidx136, align 8, !tbaa !22
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
  store double %add4021009, double* %arrayidx405, align 8, !tbaa !22
  %140 = load double, double* %arrayidx140, align 8, !tbaa !22
  %mul409 = fmul double %140, 0x3FEE666666666666
  %sub412 = fadd double %mul396, -3.000000e+00
  %mul413 = fmul double %spec.select1002, %sub412
  %add414 = fadd double %mul413, 1.000000e+00
  %sub415 = fsub double %add414, %mul319
  %mul416 = fmul double %mul335, %sub415
  %add4171010 = fsub double %mul416, %mul409
  %141 = add nsw i64 %indvars.iv, -199994
  %arrayidx420 = getelementptr inbounds double, double* %dstGrid, i64 %141
  store double %add4171010, double* %arrayidx420, align 8, !tbaa !22
  %142 = load double, double* %arrayidx144, align 8, !tbaa !22
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
  store double %add4341011, double* %arrayidx437, align 8, !tbaa !22
  %144 = load double, double* %arrayidx148, align 8, !tbaa !22
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
  store double %add4531012, double* %arrayidx456, align 8, !tbaa !22
  %146 = load double, double* %arrayidx152, align 8, !tbaa !22
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
  store double %add4701013, double* %arrayidx473, align 8, !tbaa !22
  %148 = load double, double* %arrayidx156, align 8, !tbaa !22
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
  store double %add4891014, double* %arrayidx492, align 8, !tbaa !22
  %150 = load double, double* %arrayidx160, align 8, !tbaa !22
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
  store double %add5061015, double* %arrayidx509, align 8, !tbaa !22
  %152 = load double, double* %arrayidx164, align 8, !tbaa !22
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
  store double %add5231016, double* %arrayidx526, align 8, !tbaa !22
  %154 = load double, double* %arrayidx168, align 8, !tbaa !22
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
  store double %add5421017, double* %arrayidx545, align 8, !tbaa !22
  %156 = load double, double* %arrayidx172, align 8, !tbaa !22
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
  store double %add5611018, double* %arrayidx564, align 8, !tbaa !22
  %158 = load double, double* %arrayidx176, align 8, !tbaa !22
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
  store double %add5781019, double* %arrayidx581, align 8, !tbaa !22
  %160 = load double, double* %arrayidx180, align 8, !tbaa !22
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
  store double %add5951020, double* %arrayidx598, align 8, !tbaa !22
  %162 = load double, double* %arrayidx184, align 8, !tbaa !22
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
  store double %add6141021, double* %arrayidx617, align 8, !tbaa !22
  %164 = load double, double* %arrayidx188, align 8, !tbaa !22
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
  store double %add6331022, double* %arrayidx636, align 8, !tbaa !22
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
  %1 = load i64, i64* %0, align 8, !tbaa !9
  %2 = bitcast [26000000 x double]** %grid2 to i64*
  %3 = load i64, i64* %2, align 8, !tbaa !9
  store i64 %3, i64* %0, align 8, !tbaa !9
  store i64 %1, i64* %2, align 8, !tbaa !9
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local void @LBM_showGridStatistics(double* nocapture readonly %grid) local_unnamed_addr #0 {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @str.29, i64 0, i64 0))
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
  %0 = load double, double* %arrayidx, align 8, !tbaa !22
  %1 = or i64 %indvars.iv, 1
  %arrayidx3 = getelementptr inbounds double, double* %grid, i64 %1
  %2 = load double, double* %arrayidx3, align 8, !tbaa !22
  %add4 = fadd double %0, %2
  %3 = or i64 %indvars.iv, 2
  %arrayidx7 = getelementptr inbounds double, double* %grid, i64 %3
  %4 = load double, double* %arrayidx7, align 8, !tbaa !22
  %add8 = fadd double %add4, %4
  %5 = or i64 %indvars.iv, 3
  %arrayidx11 = getelementptr inbounds double, double* %grid, i64 %5
  %6 = load double, double* %arrayidx11, align 8, !tbaa !22
  %add12 = fadd double %add8, %6
  %7 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx15 = getelementptr inbounds double, double* %grid, i64 %7
  %8 = load double, double* %arrayidx15, align 8, !tbaa !22
  %add16 = fadd double %add12, %8
  %9 = add nuw nsw i64 %indvars.iv, 5
  %arrayidx19 = getelementptr inbounds double, double* %grid, i64 %9
  %10 = load double, double* %arrayidx19, align 8, !tbaa !22
  %add20 = fadd double %add16, %10
  %11 = add nuw nsw i64 %indvars.iv, 6
  %arrayidx23 = getelementptr inbounds double, double* %grid, i64 %11
  %12 = load double, double* %arrayidx23, align 8, !tbaa !22
  %add24 = fadd double %add20, %12
  %13 = add nuw nsw i64 %indvars.iv, 7
  %arrayidx27 = getelementptr inbounds double, double* %grid, i64 %13
  %14 = load double, double* %arrayidx27, align 8, !tbaa !22
  %add28 = fadd double %add24, %14
  %15 = add nuw nsw i64 %indvars.iv, 8
  %arrayidx31 = getelementptr inbounds double, double* %grid, i64 %15
  %16 = load double, double* %arrayidx31, align 8, !tbaa !22
  %add32 = fadd double %add28, %16
  %17 = add nuw nsw i64 %indvars.iv, 9
  %arrayidx35 = getelementptr inbounds double, double* %grid, i64 %17
  %18 = load double, double* %arrayidx35, align 8, !tbaa !22
  %add36 = fadd double %add32, %18
  %19 = add nuw nsw i64 %indvars.iv, 10
  %arrayidx39 = getelementptr inbounds double, double* %grid, i64 %19
  %20 = load double, double* %arrayidx39, align 8, !tbaa !22
  %add40 = fadd double %add36, %20
  %21 = add nuw nsw i64 %indvars.iv, 11
  %arrayidx43 = getelementptr inbounds double, double* %grid, i64 %21
  %22 = load double, double* %arrayidx43, align 8, !tbaa !22
  %add44 = fadd double %add40, %22
  %23 = add nuw nsw i64 %indvars.iv, 12
  %arrayidx47 = getelementptr inbounds double, double* %grid, i64 %23
  %24 = load double, double* %arrayidx47, align 8, !tbaa !22
  %add48 = fadd double %add44, %24
  %25 = add nuw nsw i64 %indvars.iv, 13
  %arrayidx51 = getelementptr inbounds double, double* %grid, i64 %25
  %26 = load double, double* %arrayidx51, align 8, !tbaa !22
  %add52 = fadd double %add48, %26
  %27 = add nuw nsw i64 %indvars.iv, 14
  %arrayidx55 = getelementptr inbounds double, double* %grid, i64 %27
  %28 = load double, double* %arrayidx55, align 8, !tbaa !22
  %add56 = fadd double %add52, %28
  %29 = add nuw nsw i64 %indvars.iv, 15
  %arrayidx59 = getelementptr inbounds double, double* %grid, i64 %29
  %30 = load double, double* %arrayidx59, align 8, !tbaa !22
  %add60 = fadd double %add56, %30
  %31 = add nuw nsw i64 %indvars.iv, 16
  %arrayidx63 = getelementptr inbounds double, double* %grid, i64 %31
  %32 = load double, double* %arrayidx63, align 8, !tbaa !22
  %add64 = fadd double %add60, %32
  %33 = add nuw nsw i64 %indvars.iv, 17
  %arrayidx67 = getelementptr inbounds double, double* %grid, i64 %33
  %34 = load double, double* %arrayidx67, align 8, !tbaa !22
  %add68 = fadd double %add64, %34
  %35 = add nuw nsw i64 %indvars.iv, 18
  %arrayidx71 = getelementptr inbounds double, double* %grid, i64 %35
  %36 = load double, double* %arrayidx71, align 8, !tbaa !22
  %add72 = fadd double %add68, %36
  %cmp73 = fcmp olt double %add72, %minRho.0367
  %minRho.1 = select i1 %cmp73, double %add72, double %minRho.0367
  %cmp74 = fcmp ogt double %add72, %maxRho.0368
  %maxRho.1 = select i1 %cmp74, double %add72, double %maxRho.0368
  %add77 = fadd double %mass.0370, %add72
  %37 = add nuw nsw i64 %indvars.iv, 19
  %arrayidx80 = getelementptr inbounds double, double* %grid, i64 %37
  %38 = bitcast double* %arrayidx80 to i32*
  %39 = load i32, i32* %38, align 4, !tbaa !23
  %and = and i32 %39, 1
  %tobool = icmp eq i32 %and, 0
  br i1 %tobool, label %if.else, label %if.then81

if.then81:                                        ; preds = %for.body
  %inc = add nsw i32 %nObstacleCells.0369, 1
  br label %for.inc

if.else:                                          ; preds = %for.body
  %and85 = and i32 %39, 2
  %and85.lobit = lshr exact i32 %and85, 1
  %40 = xor i32 %and85.lobit, 1
  %nFluidCells.1 = add nsw i32 %40, %nFluidCells.0363
  %and85.lobit362 = lshr exact i32 %and85, 1
  %nAccelCells.1 = add nsw i32 %and85.lobit362, %nAccelCells.0366
  %sub = fsub double %6, %8
  %add101 = fadd double %sub, %14
  %sub105 = fsub double %add101, %16
  %add109 = fadd double %sub105, %18
  %sub113 = fsub double %add109, %20
  %add117 = fadd double %sub113, %30
  %add121 = fadd double %add117, %32
  %sub125 = fsub double %add121, %34
  %sub129 = fsub double %sub125, %36
  %sub136 = fsub double %2, %4
  %add140 = fadd double %sub136, %14
  %add144 = fadd double %add140, %16
  %sub148 = fsub double %add144, %18
  %sub152 = fsub double %sub148, %20
  %add156 = fadd double %sub152, %22
  %add160 = fadd double %add156, %24
  %sub164 = fsub double %add160, %26
  %sub168 = fsub double %sub164, %28
  %sub175 = fsub double %10, %12
  %add179 = fadd double %sub175, %22
  %sub183 = fsub double %add179, %24
  %add187 = fadd double %sub183, %26
  %sub191 = fsub double %add187, %28
  %add195 = fadd double %sub191, %30
  %sub199 = fsub double %add195, %32
  %add203 = fadd double %sub199, %34
  %sub207 = fsub double %add203, %36
  %mul = fmul double %sub129, %sub129
  %mul208 = fmul double %sub168, %sub168
  %add209 = fadd double %mul208, %mul
  %mul210 = fmul double %sub207, %sub207
  %add211 = fadd double %mul210, %add209
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
  %call221 = tail call double @sqrt(double %minU2.2) #8
  %call222 = tail call double @sqrt(double %maxU2.1) #8
  %call223 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([138 x i8], [138 x i8]* @.str.15, i64 0, i64 0), i32 %nObstacleCells.1, i32 %nAccelCells.2, i32 %nFluidCells.2, double %minRho.1, double %maxRho.1, double %add77, double %call221, double %call222)
  %puts361 = tail call i32 @puts(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str.30, i64 0, i64 0))
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @MAIN_stopClock(%struct.MAIN_Time* nocapture %time, %struct.MAIN_Param* nocapture readonly %param) local_unnamed_addr #0 {
entry:
  %timeStop = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 4
  %call = tail call i64 @times(%struct.tms* nonnull %timeStop) #8
  %tickStop = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 2
  store i64 %call, i64* %tickStop, align 8, !tbaa !24
  %tms_utime = getelementptr inbounds %struct.tms, %struct.tms* %timeStop, i64 0, i32 0
  %0 = load i64, i64* %tms_utime, align 8, !tbaa !25
  %tms_utime2 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 3, i32 0
  %1 = load i64, i64* %tms_utime2, align 8, !tbaa !26
  %sub = sub nsw i64 %0, %1
  %conv = sitofp i64 %sub to double
  %timeScale = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 0
  %2 = load double, double* %timeScale, align 8, !tbaa !17
  %mul = fmul double %2, %conv
  %tms_stime = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 4, i32 1
  %3 = load i64, i64* %tms_stime, align 8, !tbaa !27
  %tms_stime5 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 3, i32 1
  %4 = load i64, i64* %tms_stime5, align 8, !tbaa !28
  %sub6 = sub nsw i64 %3, %4
  %conv7 = sitofp i64 %sub6 to double
  %mul9 = fmul double %2, %conv7
  %add = add nsw i64 %3, %sub
  %sub19 = sub i64 %add, %4
  %conv20 = sitofp i64 %sub19 to double
  %mul22 = fmul double %2, %conv20
  %tickStart = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %time, i64 0, i32 1
  %5 = load i64, i64* %tickStart, align 8, !tbaa !21
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
  %0 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !9
  %arraydecay = getelementptr inbounds [26000000 x double], [26000000 x double]* %0, i64 0, i64 0
  tail call void @LBM_showGridStatistics(double* %arraydecay)
  %action = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 2
  %1 = load i32, i32* %action, align 8, !tbaa !11
  %cmp = icmp eq i32 %1, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !9
  %arraydecay1 = getelementptr inbounds [26000000 x double], [26000000 x double]* %2, i64 0, i64 0
  %resultFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 1
  %3 = load i8*, i8** %resultFilename, align 8, !tbaa !10
  tail call void @LBM_compareVelocityField(double* %arraydecay1, i8* %3, i32 -1)
  %.pr = load i32, i32* %action, align 8, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = phi i32 [ %.pr, %if.then ], [ %1, %entry ]
  %cmp3 = icmp eq i32 %4, 2
  br i1 %cmp3, label %if.then4, label %if.end7

if.then4:                                         ; preds = %if.end
  %5 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8, !tbaa !9
  %arraydecay5 = getelementptr inbounds [26000000 x double], [26000000 x double]* %5, i64 0, i64 0
  %resultFilename6 = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i64 0, i32 1
  %6 = load i8*, i8** %resultFilename6, align 8, !tbaa !10
  tail call void @LBM_storeVelocityField(double* %arraydecay5, i8* %6, i32 -1)
  br label %if.end7

if.end7:                                          ; preds = %if.then4, %if.end
  tail call void @LBM_freeGrid(double** bitcast ([26000000 x double]** @srcGrid to double**))
  tail call void @LBM_freeGrid(double** bitcast ([26000000 x double]** @dstGrid to double**))
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) local_unnamed_addr #4

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally dso_local i32 @atoi(i8* nonnull %__nptr) local_unnamed_addr #5 {
entry:
  %call = tail call i64 @strtol(i8* nocapture nonnull %__nptr, i8** null, i32 10) #8
  %conv = trunc i64 %call to i32
  ret i32 %conv
}

; Function Attrs: inlinehint nounwind uwtable
define available_externally dso_local i32 @stat(i8* nonnull %__path, %struct.stat* nonnull %__statbuf) local_unnamed_addr #6 {
entry:
  %call = tail call i32 @__xstat(i32 1, i8* nonnull %__path, %struct.stat* nonnull %__statbuf) #8
  ret i32 %call
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #1

; Function Attrs: nounwind uwtable
define dso_local void @LBM_allocateGrid(double** nocapture %ptr) local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 214400000) #8
  %0 = bitcast double** %ptr to i8**
  store i8* %call, i8** %0, align 8, !tbaa !9
  %tobool = icmp eq i8* %call, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i64 0, i64 0), double 0x40698EF800000000)
  tail call void @exit(i32 1) #9
  unreachable

if.end:                                           ; preds = %entry
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.9, i64 0, i64 0), double 0x40698EF800000000)
  %1 = load double*, double** %ptr, align 8, !tbaa !9
  %add.ptr = getelementptr inbounds double, double* %1, i64 400000
  store double* %add.ptr, double** %ptr, align 8, !tbaa !9
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define dso_local void @LBM_initializeGrid(double* nocapture %grid) local_unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ -400000, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %grid, i64 %indvars.iv
  store double 0x3FD5555555555555, double* %arrayidx, align 8, !tbaa !22
  %0 = or i64 %indvars.iv, 1
  %arrayidx3 = getelementptr inbounds double, double* %grid, i64 %0
  store double 0x3FAC71C71C71C71C, double* %arrayidx3, align 8, !tbaa !22
  %1 = or i64 %indvars.iv, 2
  %arrayidx6 = getelementptr inbounds double, double* %grid, i64 %1
  store double 0x3FAC71C71C71C71C, double* %arrayidx6, align 8, !tbaa !22
  %2 = or i64 %indvars.iv, 3
  %arrayidx9 = getelementptr inbounds double, double* %grid, i64 %2
  store double 0x3FAC71C71C71C71C, double* %arrayidx9, align 8, !tbaa !22
  %3 = add nsw i64 %indvars.iv, 4
  %arrayidx12 = getelementptr inbounds double, double* %grid, i64 %3
  store double 0x3FAC71C71C71C71C, double* %arrayidx12, align 8, !tbaa !22
  %4 = add nsw i64 %indvars.iv, 5
  %arrayidx15 = getelementptr inbounds double, double* %grid, i64 %4
  store double 0x3FAC71C71C71C71C, double* %arrayidx15, align 8, !tbaa !22
  %5 = add nsw i64 %indvars.iv, 6
  %arrayidx18 = getelementptr inbounds double, double* %grid, i64 %5
  store double 0x3FAC71C71C71C71C, double* %arrayidx18, align 8, !tbaa !22
  %6 = add nsw i64 %indvars.iv, 7
  %arrayidx21 = getelementptr inbounds double, double* %grid, i64 %6
  store double 0x3F9C71C71C71C71C, double* %arrayidx21, align 8, !tbaa !22
  %7 = add nsw i64 %indvars.iv, 8
  %arrayidx24 = getelementptr inbounds double, double* %grid, i64 %7
  store double 0x3F9C71C71C71C71C, double* %arrayidx24, align 8, !tbaa !22
  %8 = add nsw i64 %indvars.iv, 9
  %arrayidx27 = getelementptr inbounds double, double* %grid, i64 %8
  store double 0x3F9C71C71C71C71C, double* %arrayidx27, align 8, !tbaa !22
  %9 = add nsw i64 %indvars.iv, 10
  %arrayidx30 = getelementptr inbounds double, double* %grid, i64 %9
  store double 0x3F9C71C71C71C71C, double* %arrayidx30, align 8, !tbaa !22
  %10 = add nsw i64 %indvars.iv, 11
  %arrayidx33 = getelementptr inbounds double, double* %grid, i64 %10
  store double 0x3F9C71C71C71C71C, double* %arrayidx33, align 8, !tbaa !22
  %11 = add nsw i64 %indvars.iv, 12
  %arrayidx36 = getelementptr inbounds double, double* %grid, i64 %11
  store double 0x3F9C71C71C71C71C, double* %arrayidx36, align 8, !tbaa !22
  %12 = add nsw i64 %indvars.iv, 13
  %arrayidx39 = getelementptr inbounds double, double* %grid, i64 %12
  store double 0x3F9C71C71C71C71C, double* %arrayidx39, align 8, !tbaa !22
  %13 = add nsw i64 %indvars.iv, 14
  %arrayidx42 = getelementptr inbounds double, double* %grid, i64 %13
  store double 0x3F9C71C71C71C71C, double* %arrayidx42, align 8, !tbaa !22
  %14 = add nsw i64 %indvars.iv, 15
  %arrayidx45 = getelementptr inbounds double, double* %grid, i64 %14
  store double 0x3F9C71C71C71C71C, double* %arrayidx45, align 8, !tbaa !22
  %15 = add nsw i64 %indvars.iv, 16
  %arrayidx48 = getelementptr inbounds double, double* %grid, i64 %15
  store double 0x3F9C71C71C71C71C, double* %arrayidx48, align 8, !tbaa !22
  %16 = add nsw i64 %indvars.iv, 17
  %arrayidx51 = getelementptr inbounds double, double* %grid, i64 %16
  store double 0x3F9C71C71C71C71C, double* %arrayidx51, align 8, !tbaa !22
  %17 = add nsw i64 %indvars.iv, 18
  %arrayidx54 = getelementptr inbounds double, double* %grid, i64 %17
  store double 0x3F9C71C71C71C71C, double* %arrayidx54, align 8, !tbaa !22
  %18 = add nsw i64 %indvars.iv, 19
  %arrayidx57 = getelementptr inbounds double, double* %grid, i64 %18
  %19 = bitcast double* %arrayidx57 to i32*
  store i32 0, i32* %19, align 4, !tbaa !23
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
  %7 = load i32, i32* %6, align 4, !tbaa !23
  %or = or i32 %7, 1
  store i32 %or, i32* %6, align 4, !tbaa !23
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
  %7 = load i32, i32* %6, align 4, !tbaa !23
  %or = or i32 %7, 1
  store i32 %or, i32* %6, align 4, !tbaa !23
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
  %5 = mul nsw i64 %indvars.iv105, 10000
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc45, %for.cond1.preheader
  %indvars.iv97 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next98, %for.inc45 ]
  %cmp10 = icmp eq i64 %indvars.iv97, 0
  %cmp12 = icmp eq i64 %indvars.iv97, 99
  %6 = mul nuw nsw i64 %indvars.iv97, 100
  %7 = add nsw i64 %6, %2
  %8 = trunc i64 %indvars.iv97 to i32
  %9 = add i32 %8, -2
  %10 = icmp ult i32 %9, 96
  %11 = mul nuw nsw i64 %indvars.iv97, 100
  %12 = add nsw i64 %11, %5
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
  %13 = trunc i64 %indvars.iv to i32
  %14 = add i32 %13, -2
  %15 = icmp ult i32 %14, 96
  %16 = and i1 %or.cond55, %15
  %17 = and i1 %10, %16
  br i1 %17, label %for.inc.sink.split, label %for.inc

for.inc.sink.split:                               ; preds = %if.else, %for.body6
  %.sink117 = phi i64 [ %7, %for.body6 ], [ %12, %if.else ]
  %.sink114 = phi i32 [ 1, %for.body6 ], [ 2, %if.else ]
  %18 = add nsw i64 %.sink117, %indvars.iv
  %19 = mul nsw i64 %18, 20
  %20 = add nsw i64 %19, 19
  %arrayidx42 = getelementptr inbounds double, double* %grid, i64 %20
  %21 = bitcast double* %arrayidx42 to i32*
  %22 = load i32, i32* %21, align 4, !tbaa !23
  %or = or i32 %22, %.sink114
  store i32 %or, i32* %21, align 4, !tbaa !23
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
  %fileUx = alloca float, align 4
  %fileUy = alloca float, align 4
  %fileUz = alloca float, align 4
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @str.31, i64 0, i64 0))
  %0 = bitcast float* %fileUx to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #8
  %1 = bitcast float* %fileUy to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #8
  %2 = bitcast float* %fileUz to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #8
  %tobool = icmp ne i32 %binary, 0
  %cond = select i1 %tobool, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20, i64 0, i64 0)
  %call1 = tail call %struct._IO_FILE* @fopen(i8* %filename, i8* %cond)
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc513, %entry
  %indvars.iv784 = phi i64 [ 0, %entry ], [ %indvars.iv.next785, %for.inc513 ]
  %maxDiff2.0758 = phi float [ 0xC6293E5940000000, %entry ], [ %maxDiff2.3, %for.inc513 ]
  %3 = mul nuw nsw i64 %indvars.iv784, 10000
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc510, %for.cond2.preheader
  %indvars.iv779 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next780, %for.inc510 ]
  %maxDiff2.1756 = phi float [ %maxDiff2.0758, %for.cond2.preheader ], [ %maxDiff2.3, %for.inc510 ]
  %4 = mul nuw nsw i64 %indvars.iv779, 100
  %5 = add nuw nsw i64 %4, %3
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %maxDiff2.2753 = phi float [ %maxDiff2.1756, %for.cond5.preheader ], [ %maxDiff2.3, %if.end ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = mul nuw nsw i64 %6, 20
  %arrayidx = getelementptr inbounds double, double* %grid, i64 %7
  %8 = load double, double* %arrayidx, align 8, !tbaa !22
  %9 = or i64 %7, 1
  %arrayidx21 = getelementptr inbounds double, double* %grid, i64 %9
  %10 = load double, double* %arrayidx21, align 8, !tbaa !22
  %add22 = fadd double %8, %10
  %11 = or i64 %7, 2
  %arrayidx31 = getelementptr inbounds double, double* %grid, i64 %11
  %12 = load double, double* %arrayidx31, align 8, !tbaa !22
  %add32 = fadd double %add22, %12
  %13 = or i64 %7, 3
  %arrayidx41 = getelementptr inbounds double, double* %grid, i64 %13
  %14 = load double, double* %arrayidx41, align 8, !tbaa !22
  %add42 = fadd double %add32, %14
  %15 = add nuw nsw i64 %7, 4
  %arrayidx51 = getelementptr inbounds double, double* %grid, i64 %15
  %16 = load double, double* %arrayidx51, align 8, !tbaa !22
  %add52 = fadd double %add42, %16
  %17 = add nuw nsw i64 %7, 5
  %arrayidx61 = getelementptr inbounds double, double* %grid, i64 %17
  %18 = load double, double* %arrayidx61, align 8, !tbaa !22
  %add62 = fadd double %add52, %18
  %19 = add nuw nsw i64 %7, 6
  %arrayidx71 = getelementptr inbounds double, double* %grid, i64 %19
  %20 = load double, double* %arrayidx71, align 8, !tbaa !22
  %add72 = fadd double %add62, %20
  %21 = add nuw nsw i64 %7, 7
  %arrayidx81 = getelementptr inbounds double, double* %grid, i64 %21
  %22 = load double, double* %arrayidx81, align 8, !tbaa !22
  %add82 = fadd double %add72, %22
  %23 = add nuw nsw i64 %7, 8
  %arrayidx91 = getelementptr inbounds double, double* %grid, i64 %23
  %24 = load double, double* %arrayidx91, align 8, !tbaa !22
  %add92 = fadd double %add82, %24
  %25 = add nuw nsw i64 %7, 9
  %arrayidx101 = getelementptr inbounds double, double* %grid, i64 %25
  %26 = load double, double* %arrayidx101, align 8, !tbaa !22
  %add102 = fadd double %add92, %26
  %27 = add nuw nsw i64 %7, 10
  %arrayidx111 = getelementptr inbounds double, double* %grid, i64 %27
  %28 = load double, double* %arrayidx111, align 8, !tbaa !22
  %add112 = fadd double %add102, %28
  %29 = add nuw nsw i64 %7, 11
  %arrayidx121 = getelementptr inbounds double, double* %grid, i64 %29
  %30 = load double, double* %arrayidx121, align 8, !tbaa !22
  %add122 = fadd double %add112, %30
  %31 = add nuw nsw i64 %7, 12
  %arrayidx131 = getelementptr inbounds double, double* %grid, i64 %31
  %32 = load double, double* %arrayidx131, align 8, !tbaa !22
  %add132 = fadd double %add122, %32
  %33 = add nuw nsw i64 %7, 13
  %arrayidx141 = getelementptr inbounds double, double* %grid, i64 %33
  %34 = load double, double* %arrayidx141, align 8, !tbaa !22
  %add142 = fadd double %add132, %34
  %35 = add nuw nsw i64 %7, 14
  %arrayidx151 = getelementptr inbounds double, double* %grid, i64 %35
  %36 = load double, double* %arrayidx151, align 8, !tbaa !22
  %add152 = fadd double %add142, %36
  %37 = add nuw nsw i64 %7, 15
  %arrayidx161 = getelementptr inbounds double, double* %grid, i64 %37
  %38 = load double, double* %arrayidx161, align 8, !tbaa !22
  %add162 = fadd double %add152, %38
  %39 = add nuw nsw i64 %7, 16
  %arrayidx171 = getelementptr inbounds double, double* %grid, i64 %39
  %40 = load double, double* %arrayidx171, align 8, !tbaa !22
  %add172 = fadd double %add162, %40
  %41 = add nuw nsw i64 %7, 17
  %arrayidx181 = getelementptr inbounds double, double* %grid, i64 %41
  %42 = load double, double* %arrayidx181, align 8, !tbaa !22
  %add182 = fadd double %add172, %42
  %43 = add nuw nsw i64 %7, 18
  %arrayidx191 = getelementptr inbounds double, double* %grid, i64 %43
  %44 = load double, double* %arrayidx191, align 8, !tbaa !22
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
  %div489 = fdiv double %sub389, %add192
  %div490 = fdiv double %sub488, %add192
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body7
  call fastcc void @loadValue(%struct._IO_FILE* %call1, float* nonnull %fileUx)
  call fastcc void @loadValue(%struct._IO_FILE* %call1, float* nonnull %fileUy)
  call fastcc void @loadValue(%struct._IO_FILE* %call1, float* nonnull %fileUz)
  br label %if.end

if.else:                                          ; preds = %for.body7
  %call492 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %call1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.21, i64 0, i64 0), float* nonnull %fileUx, float* nonnull %fileUy, float* nonnull %fileUz) #8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %45 = load float, float* %fileUx, align 4, !tbaa !29
  %conv = fpext float %45 to double
  %sub493 = fsub double %div, %conv
  %conv494 = fptrunc double %sub493 to float
  %46 = load float, float* %fileUy, align 4, !tbaa !29
  %conv495 = fpext float %46 to double
  %sub496 = fsub double %div489, %conv495
  %conv497 = fptrunc double %sub496 to float
  %47 = load float, float* %fileUz, align 4, !tbaa !29
  %conv498 = fpext float %47 to double
  %sub499 = fsub double %div490, %conv498
  %conv500 = fptrunc double %sub499 to float
  %mul501 = fmul float %conv494, %conv494
  %mul502 = fmul float %conv497, %conv497
  %add503 = fadd float %mul501, %mul502
  %mul504 = fmul float %conv500, %conv500
  %add505 = fadd float %add503, %mul504
  %cmp506 = fcmp ogt float %add505, %maxDiff2.2753
  %maxDiff2.3 = select i1 %cmp506, float %add505, float %maxDiff2.2753
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 100
  br i1 %exitcond, label %for.inc510, label %for.body7

for.inc510:                                       ; preds = %if.end
  %indvars.iv.next780 = add nuw nsw i64 %indvars.iv779, 1
  %exitcond783 = icmp eq i64 %indvars.iv.next780, 100
  br i1 %exitcond783, label %for.inc513, label %for.cond5.preheader

for.inc513:                                       ; preds = %for.inc510
  %indvars.iv.next785 = add nuw nsw i64 %indvars.iv784, 1
  %exitcond787 = icmp eq i64 %indvars.iv.next785, 130
  br i1 %exitcond787, label %for.end515, label %for.cond2.preheader

for.end515:                                       ; preds = %for.inc513
  %conv516 = fpext float %maxDiff2.3 to double
  %call517 = call double @sqrt(double %conv516) #8
  %call519 = call double @sqrt(double %conv516) #8
  %cmp520 = fcmp ogt double %call519, 1.000000e-05
  %cond522 = select i1 %cmp520, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.23, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.24, i64 0, i64 0)
  %call523 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.22, i64 0, i64 0), double %call517, i8* %cond522)
  %call524 = call i32 @fclose(%struct._IO_FILE* %call1)
  %puts752 = call i32 @puts(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @str.32, i64 0, i64 0))
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #8
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @LBM_storeVelocityField(double* nocapture readonly %grid, i8* nocapture readonly %filename, i32 %binary) local_unnamed_addr #0 {
entry:
  %ux = alloca float, align 4
  %uy = alloca float, align 4
  %uz = alloca float, align 4
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @str.33, i64 0, i64 0))
  %0 = bitcast float* %ux to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #8
  %1 = bitcast float* %uy to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #8
  %2 = bitcast float* %uz to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #8
  %tobool = icmp ne i32 %binary, 0
  %cond = select i1 %tobool, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.17, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.18, i64 0, i64 0)
  %call1 = tail call %struct._IO_FILE* @fopen(i8* %filename, i8* %cond)
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc502, %entry
  %indvars.iv745 = phi i64 [ 0, %entry ], [ %indvars.iv.next746, %for.inc502 ]
  %3 = mul nuw nsw i64 %indvars.iv745, 10000
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc499, %for.cond2.preheader
  %indvars.iv740 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next741, %for.inc499 ]
  %4 = mul nuw nsw i64 %indvars.iv740, 100
  %5 = add nuw nsw i64 %4, %3
  br label %for.body7

for.body7:                                        ; preds = %for.inc, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = mul nuw nsw i64 %6, 20
  %arrayidx = getelementptr inbounds double, double* %grid, i64 %7
  %8 = load double, double* %arrayidx, align 8, !tbaa !22
  %9 = or i64 %7, 1
  %arrayidx21 = getelementptr inbounds double, double* %grid, i64 %9
  %10 = load double, double* %arrayidx21, align 8, !tbaa !22
  %add22 = fadd double %8, %10
  %11 = or i64 %7, 2
  %arrayidx31 = getelementptr inbounds double, double* %grid, i64 %11
  %12 = load double, double* %arrayidx31, align 8, !tbaa !22
  %add32 = fadd double %add22, %12
  %13 = or i64 %7, 3
  %arrayidx41 = getelementptr inbounds double, double* %grid, i64 %13
  %14 = load double, double* %arrayidx41, align 8, !tbaa !22
  %add42 = fadd double %add32, %14
  %15 = add nuw nsw i64 %7, 4
  %arrayidx51 = getelementptr inbounds double, double* %grid, i64 %15
  %16 = load double, double* %arrayidx51, align 8, !tbaa !22
  %add52 = fadd double %add42, %16
  %17 = add nuw nsw i64 %7, 5
  %arrayidx61 = getelementptr inbounds double, double* %grid, i64 %17
  %18 = load double, double* %arrayidx61, align 8, !tbaa !22
  %add62 = fadd double %add52, %18
  %19 = add nuw nsw i64 %7, 6
  %arrayidx71 = getelementptr inbounds double, double* %grid, i64 %19
  %20 = load double, double* %arrayidx71, align 8, !tbaa !22
  %add72 = fadd double %add62, %20
  %21 = add nuw nsw i64 %7, 7
  %arrayidx81 = getelementptr inbounds double, double* %grid, i64 %21
  %22 = load double, double* %arrayidx81, align 8, !tbaa !22
  %add82 = fadd double %add72, %22
  %23 = add nuw nsw i64 %7, 8
  %arrayidx91 = getelementptr inbounds double, double* %grid, i64 %23
  %24 = load double, double* %arrayidx91, align 8, !tbaa !22
  %add92 = fadd double %add82, %24
  %25 = add nuw nsw i64 %7, 9
  %arrayidx101 = getelementptr inbounds double, double* %grid, i64 %25
  %26 = load double, double* %arrayidx101, align 8, !tbaa !22
  %add102 = fadd double %add92, %26
  %27 = add nuw nsw i64 %7, 10
  %arrayidx111 = getelementptr inbounds double, double* %grid, i64 %27
  %28 = load double, double* %arrayidx111, align 8, !tbaa !22
  %add112 = fadd double %add102, %28
  %29 = add nuw nsw i64 %7, 11
  %arrayidx121 = getelementptr inbounds double, double* %grid, i64 %29
  %30 = load double, double* %arrayidx121, align 8, !tbaa !22
  %add122 = fadd double %add112, %30
  %31 = add nuw nsw i64 %7, 12
  %arrayidx131 = getelementptr inbounds double, double* %grid, i64 %31
  %32 = load double, double* %arrayidx131, align 8, !tbaa !22
  %add132 = fadd double %add122, %32
  %33 = add nuw nsw i64 %7, 13
  %arrayidx141 = getelementptr inbounds double, double* %grid, i64 %33
  %34 = load double, double* %arrayidx141, align 8, !tbaa !22
  %add142 = fadd double %add132, %34
  %35 = add nuw nsw i64 %7, 14
  %arrayidx151 = getelementptr inbounds double, double* %grid, i64 %35
  %36 = load double, double* %arrayidx151, align 8, !tbaa !22
  %add152 = fadd double %add142, %36
  %37 = add nuw nsw i64 %7, 15
  %arrayidx161 = getelementptr inbounds double, double* %grid, i64 %37
  %38 = load double, double* %arrayidx161, align 8, !tbaa !22
  %add162 = fadd double %add152, %38
  %39 = add nuw nsw i64 %7, 16
  %arrayidx171 = getelementptr inbounds double, double* %grid, i64 %39
  %40 = load double, double* %arrayidx171, align 8, !tbaa !22
  %add172 = fadd double %add162, %40
  %41 = add nuw nsw i64 %7, 17
  %arrayidx181 = getelementptr inbounds double, double* %grid, i64 %41
  %42 = load double, double* %arrayidx181, align 8, !tbaa !22
  %add182 = fadd double %add172, %42
  %43 = add nuw nsw i64 %7, 18
  %arrayidx191 = getelementptr inbounds double, double* %grid, i64 %43
  %44 = load double, double* %arrayidx191, align 8, !tbaa !22
  %add192 = fadd double %add182, %44
  %conv = fptrunc double %add192 to float
  %sub = fsub double %14, %16
  %add220 = fadd double %sub, %22
  %sub230 = fsub double %add220, %24
  %add240 = fadd double %sub230, %26
  %sub250 = fsub double %add240, %28
  %add260 = fadd double %sub250, %38
  %add270 = fadd double %add260, %40
  %sub280 = fsub double %add270, %42
  %sub290 = fsub double %sub280, %44
  %conv291 = fptrunc double %sub290 to float
  %sub310 = fsub double %10, %12
  %add320 = fadd double %sub310, %22
  %add330 = fadd double %add320, %24
  %sub340 = fsub double %add330, %26
  %sub350 = fsub double %sub340, %28
  %add360 = fadd double %sub350, %30
  %add370 = fadd double %add360, %32
  %sub380 = fsub double %add370, %34
  %sub390 = fsub double %sub380, %36
  %conv391 = fptrunc double %sub390 to float
  %sub410 = fsub double %18, %20
  %add420 = fadd double %sub410, %30
  %sub430 = fsub double %add420, %32
  %add440 = fadd double %sub430, %34
  %sub450 = fsub double %add440, %36
  %add460 = fadd double %sub450, %38
  %sub470 = fsub double %add460, %40
  %add480 = fadd double %sub470, %42
  %sub490 = fsub double %add480, %44
  %conv491 = fptrunc double %sub490 to float
  %div = fdiv float %conv291, %conv
  store float %div, float* %ux, align 4, !tbaa !29
  %div492 = fdiv float %conv391, %conv
  store float %div492, float* %uy, align 4, !tbaa !29
  %div493 = fdiv float %conv491, %conv
  store float %div493, float* %uz, align 4, !tbaa !29
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body7
  call fastcc void @storeValue(%struct._IO_FILE* %call1, float* nonnull %ux)
  call fastcc void @storeValue(%struct._IO_FILE* %call1, float* nonnull %uy)
  call fastcc void @storeValue(%struct._IO_FILE* %call1, float* nonnull %uz)
  br label %for.inc

if.else:                                          ; preds = %for.body7
  %conv495 = fpext float %div to double
  %conv496 = fpext float %div492 to double
  %conv497 = fpext float %div493 to double
  %call498 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.19, i64 0, i64 0), double %conv495, double %conv496, double %conv497)
  br label %for.inc

for.inc:                                          ; preds = %if.then, %if.else
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 100
  br i1 %exitcond, label %for.inc499, label %for.body7

for.inc499:                                       ; preds = %for.inc
  %indvars.iv.next741 = add nuw nsw i64 %indvars.iv740, 1
  %exitcond744 = icmp eq i64 %indvars.iv.next741, 100
  br i1 %exitcond744, label %for.inc502, label %for.cond5.preheader

for.inc502:                                       ; preds = %for.inc499
  %indvars.iv.next746 = add nuw nsw i64 %indvars.iv745, 1
  %exitcond748 = icmp eq i64 %indvars.iv.next746, 130
  br i1 %exitcond748, label %for.end504, label %for.cond2.preheader

for.end504:                                       ; preds = %for.inc502
  %call505 = tail call i32 @fclose(%struct._IO_FILE* %call1)
  %puts716 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @str.34, i64 0, i64 0))
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #8
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @LBM_freeGrid(double** nocapture %ptr) local_unnamed_addr #0 {
entry:
  %0 = load double*, double** %ptr, align 8, !tbaa !9
  %add.ptr = getelementptr inbounds double, double* %0, i64 -400000
  %1 = bitcast double* %add.ptr to i8*
  tail call void @free(i8* nonnull %1) #8
  store double* null, double** %ptr, align 8, !tbaa !9
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

; Function Attrs: nounwind uwtable
define internal fastcc void @storeValue(%struct._IO_FILE* nocapture %file, float* nocapture %v) unnamed_addr #0 {
entry:
  %0 = bitcast float* %v to i8*
  %call8 = tail call i64 @fwrite(i8* %0, i64 4, i64 1, %struct._IO_FILE* %file)
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define internal fastcc void @loadValue(%struct._IO_FILE* nocapture %file, float* nocapture %v) unnamed_addr #0 {
entry:
  %0 = bitcast float* %v to i8*
  %call8 = tail call i64 @fread(i8* %0, i64 4, i64 1, %struct._IO_FILE* %file)
  ret void
}

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #7

; Function Attrs: nounwind
declare dso_local i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i32 @__xstat(i32, i8*, %struct.stat*) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #8

; Function Attrs: nounwind
declare i32 @fgetc_unlocked(%struct._IO_FILE* nocapture) local_unnamed_addr #8

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { inlinehint nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly }

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
!8 = !{!3, !5, i64 20}
!9 = !{!7, !7, i64 0}
!10 = !{!3, !7, i64 8}
!11 = !{!3, !5, i64 16}
!12 = !{!3, !7, i64 24}
!13 = !{!14, !15, i64 48}
!14 = !{!"stat", !15, i64 0, !15, i64 8, !15, i64 16, !4, i64 24, !4, i64 28, !4, i64 32, !4, i64 36, !15, i64 40, !15, i64 48, !15, i64 56, !15, i64 64, !16, i64 72, !16, i64 88, !16, i64 104, !5, i64 120}
!15 = !{!"long", !5, i64 0}
!16 = !{!"timespec", !15, i64 0, !15, i64 8}
!17 = !{!18, !19, i64 0}
!18 = !{!"", !19, i64 0, !15, i64 8, !15, i64 16, !20, i64 24, !20, i64 56}
!19 = !{!"double", !5, i64 0}
!20 = !{!"tms", !15, i64 0, !15, i64 8, !15, i64 16, !15, i64 24}
!21 = !{!18, !15, i64 8}
!22 = !{!19, !19, i64 0}
!23 = !{!4, !4, i64 0}
!24 = !{!18, !15, i64 16}
!25 = !{!18, !15, i64 56}
!26 = !{!18, !15, i64 24}
!27 = !{!18, !15, i64 64}
!28 = !{!18, !15, i64 32}
!29 = !{!30, !30, i64 0}
!30 = !{!"float", !5, i64 0}
