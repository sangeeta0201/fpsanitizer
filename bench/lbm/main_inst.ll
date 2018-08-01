; ModuleID = 'main_inst.bc'
source_filename = "main.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.MAIN_Param = type { i32, i8*, i32, i32, i8* }
%struct.MAIN_Time = type { double, i64, i64, %struct.tms, %struct.tms }
%struct.tms = type { i64, i64, i64, i64 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@srcGrid = internal global [26000000 x double]* null, align 8
@dstGrid = internal global [26000000 x double]* null, align 8
@.str = private unnamed_addr constant [14 x i8] c"timestep: %i\0A\00", align 1
@.str.1 = private unnamed_addr constant [109 x i8] c"syntax: lbm <time steps> <result file> <0: nil, 1: cmp, 2: str> <0: ldc, 1: channel flow> [<obstacle file>]\0A\00", align 1
@.str.2 = private unnamed_addr constant [55 x i8] c"MAIN_parseCommandLine: cannot stat obstacle file '%s'\0A\00", align 1
@.str.3 = private unnamed_addr constant [82 x i8] c"MAIN_parseCommandLine:\0A\09size of file '%s' is %i bytes\0A\09expected size is %i bytes\0A\00", align 1
@.str.4 = private unnamed_addr constant [53 x i8] c"MAIN_parseCommandLine: cannot stat result file '%s'\0A\00", align 1
@MAIN_printInfo.actionString = private unnamed_addr constant [3 x [32 x i8]] [[32 x i8] c"nothing\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"compare\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"store\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00"], align 16
@MAIN_printInfo.simTypeString = private unnamed_addr constant [3 x [32 x i8]] [[32 x i8] c"lid-driven cavity\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"channel flow\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] zeroinitializer], align 16
@.str.5 = private unnamed_addr constant [174 x i8] c"MAIN_printInfo:\0A\09grid size      : %i x %i x %i = %.2f * 10^6 Cells\0A\09nTimeSteps     : %i\0A\09result file    : %s\0A\09action         : %s\0A\09simulation type: %s\0A\09obstacle file  : %s\0A\0A\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"<none>\00", align 1
@.str.7 = private unnamed_addr constant [76 x i8] c"MAIN_stopClock:\0A\09usr: %7.2f sys: %7.2f tot: %7.2f wct: %7.2f MLUPS: %5.2f\0A\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %nArgs, i8** %arg) #0 {
entry:
  %retval = alloca i32, align 4
  %nArgs.addr = alloca i32, align 4
  %arg.addr = alloca i8**, align 8
  %param = alloca %struct.MAIN_Param, align 8
  %time = alloca %struct.MAIN_Time, align 8
  %t = alloca i32, align 4
  %0 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %1 = bitcast i32* %nArgs.addr to i8*
  store i32 %nArgs, i32* %nArgs.addr, align 4
  %2 = bitcast i8*** %arg.addr to i8*
  store i8** %arg, i8*** %arg.addr, align 8
  %3 = load i32, i32* %nArgs.addr, align 4
  %4 = load i8**, i8*** %arg.addr, align 8
  %5 = bitcast void (i32, i8**, %struct.MAIN_Param*)* @MAIN_parseCommandLine to i8*
  %6 = bitcast i32* %nArgs.addr to i8*
  call void @addFunArg(i32 0, i8* %5, i8* %6)
  call void @MAIN_parseCommandLine(i32 %3, i8** %4, %struct.MAIN_Param* %param)
  call void @MAIN_printInfo(%struct.MAIN_Param* %param)
  call void @MAIN_initialize(%struct.MAIN_Param* %param)
  call void @MAIN_startClock(%struct.MAIN_Time* %time)
  %7 = bitcast i32* %t to i8*
  store i32 1, i32* %t, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, i32* %t, align 4
  %nTimeSteps = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i32 0, i32 0
  %9 = load i32, i32* %nTimeSteps, align 8
  %cmp = icmp sle i32 %8, %9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %simType = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %param, i32 0, i32 3
  %10 = load i32, i32* %simType, align 4
  %cmp1 = icmp eq i32 %10, 1
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %11 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8
  %arraydecay = getelementptr inbounds [26000000 x double], [26000000 x double]* %11, i32 0, i32 0
  call void @LBM_handleInOutFlow(double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %12 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8
  %arraydecay2 = getelementptr inbounds [26000000 x double], [26000000 x double]* %12, i32 0, i32 0
  %13 = load [26000000 x double]*, [26000000 x double]** @dstGrid, align 8
  %arraydecay3 = getelementptr inbounds [26000000 x double], [26000000 x double]* %13, i32 0, i32 0
  call void @LBM_performStreamCollide(double* %arraydecay2, double* %arraydecay3)
  call void @LBM_swapGrids([26000000 x double]** @srcGrid, [26000000 x double]** @dstGrid)
  %14 = load i32, i32* %t, align 4
  %and = and i32 %14, 63
  %cmp4 = icmp eq i32 %and, 0
  br i1 %cmp4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %15 = load i32, i32* %t, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 %15)
  %16 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8
  %arraydecay6 = getelementptr inbounds [26000000 x double], [26000000 x double]* %16, i32 0, i32 0
  call void @LBM_showGridStatistics(double* %arraydecay6)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end7
  %17 = load i32, i32* %t, align 4
  %inc = add nsw i32 %17, 1
  %18 = bitcast i32* %t to i8*
  store i32 %inc, i32* %t, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @MAIN_stopClock(%struct.MAIN_Time* %time, %struct.MAIN_Param* %param)
  call void @MAIN_finalize(%struct.MAIN_Param* %param)
  call void @finish()
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @MAIN_parseCommandLine(i32 %nArgs, i8** %arg, %struct.MAIN_Param* %param) #0 {
entry:
  %nArgs.addr = alloca i32, align 4
  %arg.addr = alloca i8**, align 8
  %param.addr = alloca %struct.MAIN_Param*, align 8
  %fileStat = alloca %struct.stat, align 8
  %0 = bitcast i32* %nArgs.addr to i8*
  store i32 %nArgs, i32* %nArgs.addr, align 4
  %1 = bitcast i8*** %arg.addr to i8*
  store i8** %arg, i8*** %arg.addr, align 8
  %2 = bitcast %struct.MAIN_Param** %param.addr to i8*
  store %struct.MAIN_Param* %param, %struct.MAIN_Param** %param.addr, align 8
  %3 = load i32, i32* %nArgs.addr, align 4
  %cmp = icmp slt i32 %3, 5
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %4 = load i32, i32* %nArgs.addr, align 4
  %cmp1 = icmp sgt i32 %4, 6
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([109 x i8], [109 x i8]* @.str.1, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %5 = load i8**, i8*** %arg.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %5, i64 1
  %6 = load i8*, i8** %arrayidx, align 8
  %call2 = call i32 @atoi(i8* %6) #7
  %7 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %nTimeSteps = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %7, i32 0, i32 0
  %8 = bitcast i32* %nTimeSteps to i8*
  store i32 %call2, i32* %nTimeSteps, align 8
  %9 = load i8**, i8*** %arg.addr, align 8
  %arrayidx3 = getelementptr inbounds i8*, i8** %9, i64 2
  %10 = load i8*, i8** %arrayidx3, align 8
  %11 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %resultFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %11, i32 0, i32 1
  %12 = bitcast i8** %resultFilename to i8*
  store i8* %10, i8** %resultFilename, align 8
  %13 = load i8**, i8*** %arg.addr, align 8
  %arrayidx4 = getelementptr inbounds i8*, i8** %13, i64 3
  %14 = load i8*, i8** %arrayidx4, align 8
  %call5 = call i32 @atoi(i8* %14) #7
  %15 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %action = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %15, i32 0, i32 2
  %16 = bitcast i32* %action to i8*
  store i32 %call5, i32* %action, align 8
  %17 = load i8**, i8*** %arg.addr, align 8
  %arrayidx6 = getelementptr inbounds i8*, i8** %17, i64 4
  %18 = load i8*, i8** %arrayidx6, align 8
  %call7 = call i32 @atoi(i8* %18) #7
  %19 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %simType = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %19, i32 0, i32 3
  %20 = bitcast i32* %simType to i8*
  store i32 %call7, i32* %simType, align 4
  %21 = load i32, i32* %nArgs.addr, align 4
  %cmp8 = icmp eq i32 %21, 6
  br i1 %cmp8, label %if.then9, label %if.else

if.then9:                                         ; preds = %if.end
  %22 = load i8**, i8*** %arg.addr, align 8
  %arrayidx10 = getelementptr inbounds i8*, i8** %22, i64 5
  %23 = load i8*, i8** %arrayidx10, align 8
  %24 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %24, i32 0, i32 4
  %25 = bitcast i8** %obstacleFilename to i8*
  store i8* %23, i8** %obstacleFilename, align 8
  %26 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename11 = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %26, i32 0, i32 4
  %27 = load i8*, i8** %obstacleFilename11, align 8
  %call12 = call i32 @stat(i8* %27, %struct.stat* %fileStat) #8
  %cmp13 = icmp ne i32 %call12, 0
  br i1 %cmp13, label %if.then14, label %if.end17

if.then14:                                        ; preds = %if.then9
  %28 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename15 = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %28, i32 0, i32 4
  %29 = load i8*, i8** %obstacleFilename15, align 8
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.2, i32 0, i32 0), i8* %29)
  call void @exit(i32 1) #6
  unreachable

if.end17:                                         ; preds = %if.then9
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %fileStat, i32 0, i32 8
  %30 = load i64, i64* %st_size, align 8
  %cmp18 = icmp ne i64 %30, 1313130
  br i1 %cmp18, label %if.then19, label %if.end23

if.then19:                                        ; preds = %if.end17
  %31 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename20 = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %31, i32 0, i32 4
  %32 = load i8*, i8** %obstacleFilename20, align 8
  %st_size21 = getelementptr inbounds %struct.stat, %struct.stat* %fileStat, i32 0, i32 8
  %33 = load i64, i64* %st_size21, align 8
  %conv = trunc i64 %33 to i32
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([82 x i8], [82 x i8]* @.str.3, i32 0, i32 0), i8* %32, i32 %conv, i32 1313130)
  call void @exit(i32 1) #6
  unreachable

if.end23:                                         ; preds = %if.end17
  br label %if.end25

if.else:                                          ; preds = %if.end
  %34 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename24 = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %34, i32 0, i32 4
  %35 = bitcast i8** %obstacleFilename24 to i8*
  store i8* null, i8** %obstacleFilename24, align 8
  br label %if.end25

if.end25:                                         ; preds = %if.else, %if.end23
  %36 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %action26 = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %36, i32 0, i32 2
  %37 = load i32, i32* %action26, align 8
  %cmp27 = icmp eq i32 %37, 1
  br i1 %cmp27, label %land.lhs.true, label %if.end36

land.lhs.true:                                    ; preds = %if.end25
  %38 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %resultFilename29 = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %38, i32 0, i32 1
  %39 = load i8*, i8** %resultFilename29, align 8
  %call30 = call i32 @stat(i8* %39, %struct.stat* %fileStat) #8
  %cmp31 = icmp ne i32 %call30, 0
  br i1 %cmp31, label %if.then33, label %if.end36

if.then33:                                        ; preds = %land.lhs.true
  %40 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %resultFilename34 = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %40, i32 0, i32 1
  %41 = load i8*, i8** %resultFilename34, align 8
  %call35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.4, i32 0, i32 0), i8* %41)
  call void @exit(i32 1) #6
  unreachable

if.end36:                                         ; preds = %land.lhs.true, %if.end25
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @MAIN_printInfo(%struct.MAIN_Param* %param) #0 {
entry:
  %param.addr = alloca %struct.MAIN_Param*, align 8
  %actionString = alloca [3 x [32 x i8]], align 16
  %simTypeString = alloca [3 x [32 x i8]], align 16
  %0 = bitcast %struct.MAIN_Param** %param.addr to i8*
  store %struct.MAIN_Param* %param, %struct.MAIN_Param** %param.addr, align 8
  %1 = bitcast [3 x [32 x i8]]* %actionString to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 getelementptr inbounds ([3 x [32 x i8]], [3 x [32 x i8]]* @MAIN_printInfo.actionString, i32 0, i32 0, i32 0), i64 96, i1 false)
  %2 = bitcast [3 x [32 x i8]]* %simTypeString to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 getelementptr inbounds ([3 x [32 x i8]], [3 x [32 x i8]]* @MAIN_printInfo.simTypeString, i32 0, i32 0, i32 0), i64 96, i1 false)
  %3 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %nTimeSteps = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %3, i32 0, i32 0
  %4 = load i32, i32* %nTimeSteps, align 8
  %5 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %resultFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %5, i32 0, i32 1
  %6 = load i8*, i8** %resultFilename, align 8
  %7 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %action = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %7, i32 0, i32 2
  %8 = load i32, i32* %action, align 8
  %idxprom = zext i32 %8 to i64
  %arrayidx = getelementptr inbounds [3 x [32 x i8]], [3 x [32 x i8]]* %actionString, i64 0, i64 %idxprom
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %arrayidx, i32 0, i32 0
  %9 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %simType = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %9, i32 0, i32 3
  %10 = load i32, i32* %simType, align 4
  %idxprom1 = zext i32 %10 to i64
  %arrayidx2 = getelementptr inbounds [3 x [32 x i8]], [3 x [32 x i8]]* %simTypeString, i64 0, i64 %idxprom1
  %arraydecay3 = getelementptr inbounds [32 x i8], [32 x i8]* %arrayidx2, i32 0, i32 0
  %11 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %11, i32 0, i32 4
  %12 = load i8*, i8** %obstacleFilename, align 8
  %cmp = icmp eq i8* %12, null
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %13 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename4 = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %13, i32 0, i32 4
  %14 = load i8*, i8** %obstacleFilename4, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), %cond.true ], [ %14, %cond.false ]
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([174 x i8], [174 x i8]* @.str.5, i32 0, i32 0), i32 100, i32 100, i32 130, double 0x3FF4CCCCCCCCCCCC, i32 %4, i8* %6, i8* %arraydecay, i8* %arraydecay3, i8* %cond)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @MAIN_initialize(%struct.MAIN_Param* %param) #0 {
entry:
  %param.addr = alloca %struct.MAIN_Param*, align 8
  %0 = bitcast %struct.MAIN_Param** %param.addr to i8*
  store %struct.MAIN_Param* %param, %struct.MAIN_Param** %param.addr, align 8
  call void @LBM_allocateGrid(double** bitcast ([26000000 x double]** @srcGrid to double**))
  call void @LBM_allocateGrid(double** bitcast ([26000000 x double]** @dstGrid to double**))
  %1 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8
  %arraydecay = getelementptr inbounds [26000000 x double], [26000000 x double]* %1, i32 0, i32 0
  call void @LBM_initializeGrid(double* %arraydecay)
  %2 = load [26000000 x double]*, [26000000 x double]** @dstGrid, align 8
  %arraydecay1 = getelementptr inbounds [26000000 x double], [26000000 x double]* %2, i32 0, i32 0
  call void @LBM_initializeGrid(double* %arraydecay1)
  %3 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %3, i32 0, i32 4
  %4 = load i8*, i8** %obstacleFilename, align 8
  %cmp = icmp ne i8* %4, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8
  %arraydecay2 = getelementptr inbounds [26000000 x double], [26000000 x double]* %5, i32 0, i32 0
  %6 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename3 = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %6, i32 0, i32 4
  %7 = load i8*, i8** %obstacleFilename3, align 8
  call void @LBM_loadObstacleFile(double* %arraydecay2, i8* %7)
  %8 = load [26000000 x double]*, [26000000 x double]** @dstGrid, align 8
  %arraydecay4 = getelementptr inbounds [26000000 x double], [26000000 x double]* %8, i32 0, i32 0
  %9 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename5 = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %9, i32 0, i32 4
  %10 = load i8*, i8** %obstacleFilename5, align 8
  call void @LBM_loadObstacleFile(double* %arraydecay4, i8* %10)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %11 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %simType = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %11, i32 0, i32 3
  %12 = load i32, i32* %simType, align 4
  %cmp6 = icmp eq i32 %12, 1
  br i1 %cmp6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.end
  %13 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8
  %arraydecay8 = getelementptr inbounds [26000000 x double], [26000000 x double]* %13, i32 0, i32 0
  call void @LBM_initializeSpecialCellsForChannel(double* %arraydecay8)
  %14 = load [26000000 x double]*, [26000000 x double]** @dstGrid, align 8
  %arraydecay9 = getelementptr inbounds [26000000 x double], [26000000 x double]* %14, i32 0, i32 0
  call void @LBM_initializeSpecialCellsForChannel(double* %arraydecay9)
  br label %if.end12

if.else:                                          ; preds = %if.end
  %15 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8
  %arraydecay10 = getelementptr inbounds [26000000 x double], [26000000 x double]* %15, i32 0, i32 0
  call void @LBM_initializeSpecialCellsForLDC(double* %arraydecay10)
  %16 = load [26000000 x double]*, [26000000 x double]** @dstGrid, align 8
  %arraydecay11 = getelementptr inbounds [26000000 x double], [26000000 x double]* %16, i32 0, i32 0
  call void @LBM_initializeSpecialCellsForLDC(double* %arraydecay11)
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then7
  %17 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8
  %arraydecay13 = getelementptr inbounds [26000000 x double], [26000000 x double]* %17, i32 0, i32 0
  call void @LBM_showGridStatistics(double* %arraydecay13)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @MAIN_startClock(%struct.MAIN_Time* %time) #0 {
entry:
  %time.addr = alloca %struct.MAIN_Time*, align 8
  store %struct.MAIN_Time* %time, %struct.MAIN_Time** %time.addr, align 8
  %call = call i64 @sysconf(i32 2) #8
  %conv = sitofp i64 %call to double
  %div = fdiv double 1.000000e+00, %conv
  %0 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %timeScale = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %0, i32 0, i32 0
  store double %div, double* %timeScale, align 8
  %1 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %timeStart = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %1, i32 0, i32 3
  %call1 = call i64 @times(%struct.tms* %timeStart) #8
  %2 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %tickStart = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %2, i32 0, i32 1
  store i64 %call1, i64* %tickStart, align 8
  ret void
}

declare dso_local void @LBM_handleInOutFlow(double*) #1

declare dso_local void @LBM_performStreamCollide(double*, double*) #1

declare dso_local void @LBM_swapGrids([26000000 x double]**, [26000000 x double]**) #1

declare dso_local i32 @printf(i8*, ...) #1

declare dso_local void @LBM_showGridStatistics(double*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @MAIN_stopClock(%struct.MAIN_Time* %time, %struct.MAIN_Param* %param) #0 {
entry:
  %time.addr = alloca %struct.MAIN_Time*, align 8
  %param.addr = alloca %struct.MAIN_Param*, align 8
  store %struct.MAIN_Time* %time, %struct.MAIN_Time** %time.addr, align 8
  store %struct.MAIN_Param* %param, %struct.MAIN_Param** %param.addr, align 8
  %0 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %timeStop = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %0, i32 0, i32 4
  %call = call i64 @times(%struct.tms* %timeStop) #8
  %1 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %tickStop = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %1, i32 0, i32 2
  store i64 %call, i64* %tickStop, align 8
  %2 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %timeStop1 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %2, i32 0, i32 4
  %tms_utime = getelementptr inbounds %struct.tms, %struct.tms* %timeStop1, i32 0, i32 0
  %3 = load i64, i64* %tms_utime, align 8
  %4 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %timeStart = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %4, i32 0, i32 3
  %tms_utime2 = getelementptr inbounds %struct.tms, %struct.tms* %timeStart, i32 0, i32 0
  %5 = load i64, i64* %tms_utime2, align 8
  %sub = sub nsw i64 %3, %5
  %conv = sitofp i64 %sub to double
  %6 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %timeScale = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %6, i32 0, i32 0
  %7 = load double, double* %timeScale, align 8
  %mul = fmul double %conv, %7
  %8 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %timeStop3 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %8, i32 0, i32 4
  %tms_stime = getelementptr inbounds %struct.tms, %struct.tms* %timeStop3, i32 0, i32 1
  %9 = load i64, i64* %tms_stime, align 8
  %10 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %timeStart4 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %10, i32 0, i32 3
  %tms_stime5 = getelementptr inbounds %struct.tms, %struct.tms* %timeStart4, i32 0, i32 1
  %11 = load i64, i64* %tms_stime5, align 8
  %sub6 = sub nsw i64 %9, %11
  %conv7 = sitofp i64 %sub6 to double
  %12 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %timeScale8 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %12, i32 0, i32 0
  %13 = load double, double* %timeScale8, align 8
  %mul9 = fmul double %conv7, %13
  %14 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %timeStop10 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %14, i32 0, i32 4
  %tms_utime11 = getelementptr inbounds %struct.tms, %struct.tms* %timeStop10, i32 0, i32 0
  %15 = load i64, i64* %tms_utime11, align 8
  %16 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %timeStart12 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %16, i32 0, i32 3
  %tms_utime13 = getelementptr inbounds %struct.tms, %struct.tms* %timeStart12, i32 0, i32 0
  %17 = load i64, i64* %tms_utime13, align 8
  %sub14 = sub nsw i64 %15, %17
  %18 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %timeStop15 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %18, i32 0, i32 4
  %tms_stime16 = getelementptr inbounds %struct.tms, %struct.tms* %timeStop15, i32 0, i32 1
  %19 = load i64, i64* %tms_stime16, align 8
  %add = add nsw i64 %sub14, %19
  %20 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %timeStart17 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %20, i32 0, i32 3
  %tms_stime18 = getelementptr inbounds %struct.tms, %struct.tms* %timeStart17, i32 0, i32 1
  %21 = load i64, i64* %tms_stime18, align 8
  %sub19 = sub nsw i64 %add, %21
  %conv20 = sitofp i64 %sub19 to double
  %22 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %timeScale21 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %22, i32 0, i32 0
  %23 = load double, double* %timeScale21, align 8
  %mul22 = fmul double %conv20, %23
  %24 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %tickStop23 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %24, i32 0, i32 2
  %25 = load i64, i64* %tickStop23, align 8
  %26 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %tickStart = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %26, i32 0, i32 1
  %27 = load i64, i64* %tickStart, align 8
  %sub24 = sub nsw i64 %25, %27
  %conv25 = sitofp i64 %sub24 to double
  %28 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %timeScale26 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %28, i32 0, i32 0
  %29 = load double, double* %timeScale26, align 8
  %mul27 = fmul double %conv25, %29
  %30 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %nTimeSteps = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %30, i32 0, i32 0
  %31 = load i32, i32* %nTimeSteps, align 8
  %conv28 = sitofp i32 %31 to double
  %mul29 = fmul double 0x3FF4CCCCCCCCCCCC, %conv28
  %32 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %tickStop30 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %32, i32 0, i32 2
  %33 = load i64, i64* %tickStop30, align 8
  %34 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %tickStart31 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %34, i32 0, i32 1
  %35 = load i64, i64* %tickStart31, align 8
  %sub32 = sub nsw i64 %33, %35
  %conv33 = sitofp i64 %sub32 to double
  %div = fdiv double %mul29, %conv33
  %36 = load %struct.MAIN_Time*, %struct.MAIN_Time** %time.addr, align 8
  %timeScale34 = getelementptr inbounds %struct.MAIN_Time, %struct.MAIN_Time* %36, i32 0, i32 0
  %37 = load double, double* %timeScale34, align 8
  %div35 = fdiv double %div, %37
  %call36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.7, i32 0, i32 0), double %mul, double %mul9, double %mul22, double %mul27, double %div35)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @MAIN_finalize(%struct.MAIN_Param* %param) #0 {
entry:
  %param.addr = alloca %struct.MAIN_Param*, align 8
  %0 = bitcast %struct.MAIN_Param** %param.addr to i8*
  store %struct.MAIN_Param* %param, %struct.MAIN_Param** %param.addr, align 8
  %1 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8
  %arraydecay = getelementptr inbounds [26000000 x double], [26000000 x double]* %1, i32 0, i32 0
  call void @LBM_showGridStatistics(double* %arraydecay)
  %2 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %action = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %2, i32 0, i32 2
  %3 = load i32, i32* %action, align 8
  %cmp = icmp eq i32 %3, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8
  %arraydecay1 = getelementptr inbounds [26000000 x double], [26000000 x double]* %4, i32 0, i32 0
  %5 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %resultFilename = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %5, i32 0, i32 1
  %6 = load i8*, i8** %resultFilename, align 8
  call void @LBM_compareVelocityField(double* %arraydecay1, i8* %6, i32 -1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %action2 = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %7, i32 0, i32 2
  %8 = load i32, i32* %action2, align 8
  %cmp3 = icmp eq i32 %8, 2
  br i1 %cmp3, label %if.then4, label %if.end7

if.then4:                                         ; preds = %if.end
  %9 = load [26000000 x double]*, [26000000 x double]** @srcGrid, align 8
  %arraydecay5 = getelementptr inbounds [26000000 x double], [26000000 x double]* %9, i32 0, i32 0
  %10 = load %struct.MAIN_Param*, %struct.MAIN_Param** %param.addr, align 8
  %resultFilename6 = getelementptr inbounds %struct.MAIN_Param, %struct.MAIN_Param* %10, i32 0, i32 1
  %11 = load i8*, i8** %resultFilename6, align 8
  call void @LBM_storeVelocityField(double* %arraydecay5, i8* %11, i32 -1)
  br label %if.end7

if.end7:                                          ; preds = %if.then4, %if.end
  call void @LBM_freeGrid(double** bitcast ([26000000 x double]** @srcGrid to double**))
  call void @LBM_freeGrid(double** bitcast ([26000000 x double]** @dstGrid to double**))
  ret void
}

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #2

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

; Function Attrs: nounwind
declare dso_local i32 @stat(i8*, %struct.stat*) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #5

declare dso_local void @LBM_allocateGrid(double**) #1

declare dso_local void @LBM_initializeGrid(double*) #1

declare dso_local void @LBM_loadObstacleFile(double*, i8*) #1

declare dso_local void @LBM_initializeSpecialCellsForChannel(double*) #1

declare dso_local void @LBM_initializeSpecialCellsForLDC(double*) #1

declare dso_local void @LBM_compareVelocityField(double*, i8*, i32) #1

declare dso_local void @LBM_storeVelocityField(double*, i8*, i32) #1

declare dso_local void @LBM_freeGrid(double**) #1

; Function Attrs: nounwind
declare dso_local i64 @sysconf(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @times(%struct.tms*) #4

declare void @finish()

declare void @addFunArg(i32, i8*, i8*)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readonly }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
