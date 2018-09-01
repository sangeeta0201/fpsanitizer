; ModuleID = 'cont_mgau_inst.bc'
source_filename = "cont_mgau.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.mgau_model_t = type { i32, i32, i32, %struct.mgau_t*, double, i32, i32, i32 }
%struct.mgau_t = type { i32, float**, float**, float*, i32* }

@.str = private unnamed_addr constant [12 x i8] c"cont_mgau.c\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"INFO\00", align 1
@.str.2 = private unnamed_addr constant [54 x i8] c"Applying variance floor to non-zero variance vectors\0A\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"%d variance values floored\0A\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"meanfile != NULL\00", align 1
@__PRETTY_FUNCTION__.mgau_init = private unnamed_addr constant [81 x i8] c"mgau_model_t *mgau_init(char *, char *, float64, char *, float64, int32, char *)\00", align 1
@.str.5 = private unnamed_addr constant [16 x i8] c"varfile != NULL\00", align 1
@.str.6 = private unnamed_addr constant [16 x i8] c"varfloor >= 0.0\00", align 1
@.str.7 = private unnamed_addr constant [17 x i8] c"mixwfile != NULL\00", align 1
@.str.8 = private unnamed_addr constant [17 x i8] c"mixwfloor >= 0.0\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c".cont.\00", align 1
@.str.10 = private unnamed_addr constant [7 x i8] c".semi.\00", align 1
@.str.11 = private unnamed_addr constant [12 x i8] c"FATAL_ERROR\00", align 1
@.str.12 = private unnamed_addr constant [42 x i8] c"Feature should be either .semi. or .cont.\00", align 1
@.str.13 = private unnamed_addr constant [36 x i8] c"Reading mixture gaussian file '%s'\0A\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.15 = private unnamed_addr constant [24 x i8] c"bio_readhdr(%s) failed\0A\00", align 1
@.str.16 = private unnamed_addr constant [8 x i8] c"version\00", align 1
@.str.17 = private unnamed_addr constant [4 x i8] c"1.0\00", align 1
@.str.18 = private unnamed_addr constant [8 x i8] c"WARNING\00", align 1
@.str.19 = private unnamed_addr constant [40 x i8] c"Version mismatch(%s): %s, expecting %s\0A\00", align 1
@.str.20 = private unnamed_addr constant [8 x i8] c"chksum0\00", align 1
@.str.21 = private unnamed_addr constant [31 x i8] c"fread(%s) (#codebooks) failed\0A\00", align 1
@.str.22 = private unnamed_addr constant [71 x i8] c"%s: #Mixture Gaussians (%d) exceeds limit(%d) enforced by MGAUID type\0A\00", align 1
@.str.23 = private unnamed_addr constant [30 x i8] c"fread(%s) (#features) failed\0A\00", align 1
@.str.24 = private unnamed_addr constant [46 x i8] c"#Features streams(%d) != 1 in continuous HMM\0A\00", align 1
@.str.25 = private unnamed_addr constant [51 x i8] c"#Features streams(%d) != 1 in semi-continuous HMM\0A\00", align 1
@.str.26 = private unnamed_addr constant [38 x i8] c"fread(%s) (#density/codebook) failed\0A\00", align 1
@.str.27 = private unnamed_addr constant [36 x i8] c"fread(%s) (feature-lengths) failed\0A\00", align 1
@.str.28 = private unnamed_addr constant [34 x i8] c"fread(%s) (total #floats) failed\0A\00", align 1
@.str.29 = private unnamed_addr constant [58 x i8] c"%s: #float32s(%d) doesn't match dimensions: %d x %d x %d\0A\00", align 1
@.str.30 = private unnamed_addr constant [50 x i8] c"Currently S2 semi-continous HMM is not supported\0A\00", align 1
@.str.31 = private unnamed_addr constant [17 x i8] c"type == MGAU_VAR\00", align 1
@__PRETTY_FUNCTION__.mgau_file_read = private unnamed_addr constant [52 x i8] c"int32 mgau_file_read(mgau_model_t *, char *, int32)\00", align 1
@.str.32 = private unnamed_addr constant [47 x i8] c"#Mixtures(%d) doesn't match that of means(%d)\0A\00", align 1
@.str.33 = private unnamed_addr constant [49 x i8] c"#Components(%d) doesn't match that of means(%d)\0A\00", align 1
@.str.34 = private unnamed_addr constant [52 x i8] c"#Vector length(%d) doesn't match that of means(%d)\0A\00", align 1
@.str.35 = private unnamed_addr constant [61 x i8] c"Mixture %d: #Components(%d) doesn't match that of means(%d)\0A\00", align 1
@.str.36 = private unnamed_addr constant [32 x i8] c"fread(%s) (densitydata) failed\0A\00", align 1
@.str.37 = private unnamed_addr constant [29 x i8] c"%s: More data than expected\0A\00", align 1
@.str.38 = private unnamed_addr constant [60 x i8] c"%d mixture Gaussians, %d components, %d streams, veclen %d\0A\00", align 1
@.str.39 = private unnamed_addr constant [35 x i8] c"Reading mixture weights file '%s'\0A\00", align 1
@.str.40 = private unnamed_addr constant [34 x i8] c"bio_fread(%s) (arraysize) failed\0A\00", align 1
@.str.41 = private unnamed_addr constant [51 x i8] c"#Features streams(%d) != 4 in semi-continuous HMM\0A\00", align 1
@.str.42 = private unnamed_addr constant [116 x i8] c"How can this happen? Someone must have moved this part of the code somewhere! Not my fault! ARCHAN at 20040504 :-)\0A\00", align 1
@.str.43 = private unnamed_addr constant [60 x i8] c"%s: #float32s(%d) doesn't match header dimensions: %d x %d\0A\00", align 1
@.str.44 = private unnamed_addr constant [66 x i8] c"%s: #Mixture Gaussians(%d) doesn't match mean/var parameters(%d)\0A\00", align 1
@.str.45 = private unnamed_addr constant [65 x i8] c"Mixture %d: #Weights(%d) doesn't match #Gaussian components(%d)\0A\00", align 1
@.str.46 = private unnamed_addr constant [34 x i8] c"bio_fread(%s) (arraydata) failed\0A\00", align 1
@.str.47 = private unnamed_addr constant [31 x i8] c"More data than expected in %s\0A\00", align 1
@.str.48 = private unnamed_addr constant [30 x i8] c"Read %d x %d mixture weights\0A\00", align 1
@.str.49 = private unnamed_addr constant [43 x i8] c"Removing uninitialized Gaussian densities\0A\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8
@.str.50 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.51 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.52 = private unnamed_addr constant [53 x i8] c"%d densities removed (%d mixtures removed entirely)\0A\00", align 1
@.str.53 = private unnamed_addr constant [25 x i8] c"Applying variance floor\0A\00", align 1
@.str.54 = private unnamed_addr constant [46 x i8] c"Precomputing Mahalanobis distance invariants\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mgau_var_nzvec_floor(%struct.mgau_model_t* %g, double %floor) #0 {
entry:
  %0 = bitcast i32 (%struct.mgau_model_t*, double)* @mgau_var_nzvec_floor to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %g.addr = alloca %struct.mgau_model_t*, align 8
  %2 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %floor.addr = alloca double, align 8
  %4 = bitcast double* %floor.addr to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @handleAlloca(i64 %5)
  %m = alloca i32, align 4
  %6 = bitcast i32* %m to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @handleAlloca(i64 %7)
  %c = alloca i32, align 4
  %8 = bitcast i32* %c to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @handleAlloca(i64 %9)
  %i = alloca i32, align 4
  %10 = bitcast i32* %i to i8*
  %11 = call i64 @getAddr(i8* %10)
  call void @handleAlloca(i64 %11)
  %n = alloca i32, align 4
  %12 = bitcast i32* %n to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @handleAlloca(i64 %13)
  %l = alloca i32, align 4
  %14 = bitcast i32* %l to i8*
  %15 = call i64 @getAddr(i8* %14)
  call void @handleAlloca(i64 %15)
  %var = alloca float*, align 8
  %16 = bitcast float** %var to i8*
  %17 = call i64 @getAddr(i8* %16)
  call void @handleAlloca(i64 %17)
  %18 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %19 = call i64 @getAddr(i8* %18)
  %20 = bitcast %struct.mgau_model_t* %g to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void @setRealTemp(i64 %19, i64 %21)
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %g.addr, align 8
  %22 = bitcast double* %floor.addr to i8*
  %23 = call i64 @getAddr(i8* %22)
  %24 = bitcast i32 (%struct.mgau_model_t*, double)* @mgau_var_nzvec_floor to i8*
  %25 = call i64 @getAddr(i8* %24)
  call void @setRealFunArg(i32 1, i64 %25, i64 %23, double %floor)
  store double %floor, double* %floor.addr, align 8
  %26 = bitcast void (i8*, i64, i8*)* @_E__pr_info_header to i8*
  %27 = call i64 @getAddr(i8* %26)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 437, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  %28 = bitcast void (i8*, ...)* @_E__pr_info to i8*
  %29 = call i64 @getAddr(i8* %28)
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.2, i32 0, i32 0))
  %30 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %veclen = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %32, i32 0, i32 2
  %33 = bitcast i32* %veclen to i8*
  %34 = call i64 @getAddr(i8* %33)
  %35 = load i32, i32* %veclen, align 8
  %36 = bitcast i32* %l to i8*
  store i32 %35, i32* %l, align 4
  %37 = bitcast i32* %n to i8*
  store i32 0, i32* %n, align 4
  %38 = bitcast i32* %m to i8*
  store i32 0, i32* %m, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc26, %entry
  %39 = bitcast i32* %m to i8*
  %40 = call i64 @getAddr(i8* %39)
  %41 = load i32, i32* %m, align 4
  %42 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %43 = call i64 @getAddr(i8* %42)
  %44 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %n_mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %44, i32 0, i32 0
  %45 = bitcast i32* %n_mgau to i8*
  %46 = call i64 @getAddr(i8* %45)
  %47 = load i32, i32* %n_mgau, align 8
  %cmp = icmp slt i32 %41, %47
  br i1 %cmp, label %for.body, label %for.end28

for.body:                                         ; preds = %for.cond
  %48 = bitcast i32* %c to i8*
  store i32 0, i32* %c, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc23, %for.body
  %49 = bitcast i32* %c to i8*
  %50 = call i64 @getAddr(i8* %49)
  %51 = load i32, i32* %c, align 4
  %52 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %53 = call i64 @getAddr(i8* %52)
  %54 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %54, i32 0, i32 3
  %55 = bitcast %struct.mgau_t** %mgau to i8*
  %56 = call i64 @getAddr(i8* %55)
  %57 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %58 = bitcast i32* %m to i8*
  %59 = call i64 @getAddr(i8* %58)
  %60 = load i32, i32* %m, align 4
  %idxprom = sext i32 %60 to i64
  %arrayidx = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %57, i64 %idxprom
  %n_comp = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx, i32 0, i32 0
  %61 = bitcast i32* %n_comp to i8*
  %62 = call i64 @getAddr(i8* %61)
  %63 = load i32, i32* %n_comp, align 8
  %cmp2 = icmp slt i32 %51, %63
  br i1 %cmp2, label %for.body3, label %for.end25

for.body3:                                        ; preds = %for.cond1
  %64 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %65 = call i64 @getAddr(i8* %64)
  %66 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau4 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %66, i32 0, i32 3
  %67 = bitcast %struct.mgau_t** %mgau4 to i8*
  %68 = call i64 @getAddr(i8* %67)
  %69 = load %struct.mgau_t*, %struct.mgau_t** %mgau4, align 8
  %70 = bitcast i32* %m to i8*
  %71 = call i64 @getAddr(i8* %70)
  %72 = load i32, i32* %m, align 4
  %idxprom5 = sext i32 %72 to i64
  %arrayidx6 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %69, i64 %idxprom5
  %var7 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx6, i32 0, i32 2
  %73 = bitcast float*** %var7 to i8*
  %74 = call i64 @getAddr(i8* %73)
  %75 = load float**, float*** %var7, align 8
  %76 = bitcast i32* %c to i8*
  %77 = call i64 @getAddr(i8* %76)
  %78 = load i32, i32* %c, align 4
  %idxprom8 = sext i32 %78 to i64
  %arrayidx9 = getelementptr inbounds float*, float** %75, i64 %idxprom8
  %79 = bitcast float** %arrayidx9 to i8*
  %80 = call i64 @getAddr(i8* %79)
  %81 = load float*, float** %arrayidx9, align 8
  %82 = bitcast float** %var to i8*
  %83 = call i64 @getAddr(i8* %82)
  %84 = bitcast float* %81 to i8*
  %85 = call i64 @getAddr(i8* %84)
  call void @setRealTemp(i64 %83, i64 %85)
  store float* %81, float** %var, align 8
  %86 = bitcast float** %var to i8*
  %87 = call i64 @getAddr(i8* %86)
  %88 = load float*, float** %var, align 8
  %89 = bitcast i32* %l to i8*
  %90 = call i64 @getAddr(i8* %89)
  %91 = load i32, i32* %l, align 4
  %92 = bitcast i32 (float*, i32)* @vector_is_zero to i8*
  %93 = call i64 @getAddr(i8* %92)
  call void @addFunArg(i32 1, i64 %93, i64 %90)
  %call = call i32 @vector_is_zero(float* %88, i32 %91)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end22, label %if.then

if.then:                                          ; preds = %for.body3
  %94 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc, %if.then
  %95 = bitcast i32* %i to i8*
  %96 = call i64 @getAddr(i8* %95)
  %97 = load i32, i32* %i, align 4
  %98 = bitcast i32* %l to i8*
  %99 = call i64 @getAddr(i8* %98)
  %100 = load i32, i32* %l, align 4
  %cmp11 = icmp slt i32 %97, %100
  br i1 %cmp11, label %for.body12, label %for.end

for.body12:                                       ; preds = %for.cond10
  %101 = bitcast float** %var to i8*
  %102 = call i64 @getAddr(i8* %101)
  %103 = load float*, float** %var, align 8
  %104 = bitcast i32* %i to i8*
  %105 = call i64 @getAddr(i8* %104)
  %106 = load i32, i32* %i, align 4
  %idxprom13 = sext i32 %106 to i64
  %arrayidx14 = getelementptr inbounds float, float* %103, i64 %idxprom13
  %107 = bitcast float* %arrayidx14 to i8*
  %108 = call i64 @getAddr(i8* %107)
  %109 = load float, float* %arrayidx14, align 4
  %conv = fpext float %109 to double
  %110 = bitcast double* %floor.addr to i8*
  %111 = call i64 @getAddr(i8* %110)
  %112 = load double, double* %floor.addr, align 8
  %cmp15 = fcmp olt double %conv, %112
  call void @checkBranch(double %conv, i64 %108, double %112, i64 %111, i32 4, i1 %cmp15, i32 72)
  br i1 %cmp15, label %if.then17, label %if.end

if.then17:                                        ; preds = %for.body12
  %113 = bitcast double* %floor.addr to i8*
  %114 = call i64 @getAddr(i8* %113)
  %115 = load double, double* %floor.addr, align 8
  %conv18 = fptrunc double %115 to float
  %116 = bitcast float** %var to i8*
  %117 = call i64 @getAddr(i8* %116)
  %118 = load float*, float** %var, align 8
  %119 = bitcast i32* %i to i8*
  %120 = call i64 @getAddr(i8* %119)
  %121 = load i32, i32* %i, align 4
  %idxprom19 = sext i32 %121 to i64
  %arrayidx20 = getelementptr inbounds float, float* %118, i64 %idxprom19
  %122 = bitcast float* %arrayidx20 to i8*
  %123 = call i64 @getAddr(i8* %122)
  call void @setRealTemp(i64 %123, i64 %114)
  store float %conv18, float* %arrayidx20, align 4
  %124 = bitcast i32* %n to i8*
  %125 = call i64 @getAddr(i8* %124)
  %126 = load i32, i32* %n, align 4
  %inc = add nsw i32 %126, 1
  %127 = bitcast i32* %n to i8*
  store i32 %inc, i32* %n, align 4
  br label %if.end

if.end:                                           ; preds = %if.then17, %for.body12
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %128 = bitcast i32* %i to i8*
  %129 = call i64 @getAddr(i8* %128)
  %130 = load i32, i32* %i, align 4
  %inc21 = add nsw i32 %130, 1
  %131 = bitcast i32* %i to i8*
  store i32 %inc21, i32* %i, align 4
  br label %for.cond10

for.end:                                          ; preds = %for.cond10
  br label %if.end22

if.end22:                                         ; preds = %for.end, %for.body3
  br label %for.inc23

for.inc23:                                        ; preds = %if.end22
  %132 = bitcast i32* %c to i8*
  %133 = call i64 @getAddr(i8* %132)
  %134 = load i32, i32* %c, align 4
  %inc24 = add nsw i32 %134, 1
  %135 = bitcast i32* %c to i8*
  store i32 %inc24, i32* %c, align 4
  br label %for.cond1

for.end25:                                        ; preds = %for.cond1
  br label %for.inc26

for.inc26:                                        ; preds = %for.end25
  %136 = bitcast i32* %m to i8*
  %137 = call i64 @getAddr(i8* %136)
  %138 = load i32, i32* %m, align 4
  %inc27 = add nsw i32 %138, 1
  %139 = bitcast i32* %m to i8*
  store i32 %inc27, i32* %m, align 4
  br label %for.cond

for.end28:                                        ; preds = %for.cond
  %140 = bitcast void (i8*, i64, i8*)* @_E__pr_info_header to i8*
  %141 = call i64 @getAddr(i8* %140)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 457, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  %142 = bitcast i32* %n to i8*
  %143 = call i64 @getAddr(i8* %142)
  %144 = load i32, i32* %n, align 4
  %145 = bitcast void (i8*, ...)* @_E__pr_info to i8*
  %146 = call i64 @getAddr(i8* %145)
  call void @addFunArg(i32 1, i64 %146, i64 %143)
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i32 0, i32 0), i32 %144)
  %147 = bitcast i32* %n to i8*
  %148 = call i64 @getAddr(i8* %147)
  %149 = load i32, i32* %n, align 4
  %150 = bitcast i32 (%struct.mgau_model_t*, double)* @mgau_var_nzvec_floor to i8*
  %151 = call i64 @getAddr(i8* %150)
  call void @funcExit(i64 %151)
  %152 = bitcast i32 (%struct.mgau_model_t*, double)* @mgau_var_nzvec_floor to i8*
  %153 = call i64 @getAddr(i8* %152)
  call void @trackReturn(i64 %153, i64 %148)
  ret i32 %149
}

declare dso_local void @_E__pr_info_header(i8*, i64, i8*) #1

declare dso_local void @_E__pr_info(i8*, ...) #1

declare dso_local i32 @vector_is_zero(float*, i32) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.mgau_model_t* @mgau_init(i8* %meanfile, i8* %varfile, double %varfloor, i8* %mixwfile, double %mixwfloor, i32 %precomp, i8* %senmgau) #0 {
entry:
  %0 = bitcast %struct.mgau_model_t* (i8*, i8*, double, i8*, double, i32, i8*)* @mgau_init to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %meanfile.addr = alloca i8*, align 8
  %2 = bitcast i8** %meanfile.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %varfile.addr = alloca i8*, align 8
  %4 = bitcast i8** %varfile.addr to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @handleAlloca(i64 %5)
  %varfloor.addr = alloca double, align 8
  %6 = bitcast double* %varfloor.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @handleAlloca(i64 %7)
  %mixwfile.addr = alloca i8*, align 8
  %8 = bitcast i8** %mixwfile.addr to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @handleAlloca(i64 %9)
  %mixwfloor.addr = alloca double, align 8
  %10 = bitcast double* %mixwfloor.addr to i8*
  %11 = call i64 @getAddr(i8* %10)
  call void @handleAlloca(i64 %11)
  %precomp.addr = alloca i32, align 4
  %12 = bitcast i32* %precomp.addr to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @handleAlloca(i64 %13)
  %senmgau.addr = alloca i8*, align 8
  %14 = bitcast i8** %senmgau.addr to i8*
  %15 = call i64 @getAddr(i8* %14)
  call void @handleAlloca(i64 %15)
  %g = alloca %struct.mgau_model_t*, align 8
  %16 = bitcast %struct.mgau_model_t** %g to i8*
  %17 = call i64 @getAddr(i8* %16)
  call void @handleAlloca(i64 %17)
  %18 = bitcast i8** %meanfile.addr to i8*
  %19 = call i64 @getAddr(i8* %18)
  %20 = bitcast i8* %meanfile to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void @setRealTemp(i64 %19, i64 %21)
  store i8* %meanfile, i8** %meanfile.addr, align 8
  %22 = bitcast i8** %varfile.addr to i8*
  %23 = call i64 @getAddr(i8* %22)
  %24 = bitcast i8* %varfile to i8*
  %25 = call i64 @getAddr(i8* %24)
  call void @setRealTemp(i64 %23, i64 %25)
  store i8* %varfile, i8** %varfile.addr, align 8
  %26 = bitcast double* %varfloor.addr to i8*
  %27 = call i64 @getAddr(i8* %26)
  %28 = bitcast %struct.mgau_model_t* (i8*, i8*, double, i8*, double, i32, i8*)* @mgau_init to i8*
  %29 = call i64 @getAddr(i8* %28)
  call void @setRealFunArg(i32 4, i64 %29, i64 %27, double %varfloor)
  store double %varfloor, double* %varfloor.addr, align 8
  %30 = bitcast i8** %mixwfile.addr to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = bitcast i8* %mixwfile to i8*
  %33 = call i64 @getAddr(i8* %32)
  call void @setRealTemp(i64 %31, i64 %33)
  store i8* %mixwfile, i8** %mixwfile.addr, align 8
  %34 = bitcast double* %mixwfloor.addr to i8*
  %35 = call i64 @getAddr(i8* %34)
  %36 = bitcast %struct.mgau_model_t* (i8*, i8*, double, i8*, double, i32, i8*)* @mgau_init to i8*
  %37 = call i64 @getAddr(i8* %36)
  call void @setRealFunArg(i32 6, i64 %37, i64 %35, double %mixwfloor)
  store double %mixwfloor, double* %mixwfloor.addr, align 8
  %38 = bitcast i32* %precomp.addr to i8*
  store i32 %precomp, i32* %precomp.addr, align 4
  %39 = bitcast i8** %senmgau.addr to i8*
  %40 = call i64 @getAddr(i8* %39)
  %41 = bitcast i8* %senmgau to i8*
  %42 = call i64 @getAddr(i8* %41)
  call void @setRealTemp(i64 %40, i64 %42)
  store i8* %senmgau, i8** %senmgau.addr, align 8
  %43 = bitcast i8** %meanfile.addr to i8*
  %44 = call i64 @getAddr(i8* %43)
  %45 = load i8*, i8** %meanfile.addr, align 8
  %cmp = icmp ne i8* %45, null
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 503, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @__PRETTY_FUNCTION__.mgau_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %46, %cond.true
  %47 = bitcast i8** %varfile.addr to i8*
  %48 = call i64 @getAddr(i8* %47)
  %49 = load i8*, i8** %varfile.addr, align 8
  %cmp1 = icmp ne i8* %49, null
  br i1 %cmp1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %cond.end
  br label %cond.end4

cond.false3:                                      ; preds = %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 504, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @__PRETTY_FUNCTION__.mgau_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end4

cond.end4:                                        ; preds = %50, %cond.true2
  %51 = bitcast double* %varfloor.addr to i8*
  %52 = call i64 @getAddr(i8* %51)
  %53 = load double, double* %varfloor.addr, align 8
  %cmp5 = fcmp oge double %53, 0.000000e+00
  call void @checkBranch(double %53, i64 %52, double 0.000000e+00, i64 0, i32 3, i1 %cmp5, i32 142)
  br i1 %cmp5, label %cond.true6, label %cond.false7

cond.true6:                                       ; preds = %cond.end4
  br label %cond.end8

cond.false7:                                      ; preds = %cond.end4
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 505, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @__PRETTY_FUNCTION__.mgau_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end8

cond.end8:                                        ; preds = %54, %cond.true6
  %55 = bitcast i8** %mixwfile.addr to i8*
  %56 = call i64 @getAddr(i8* %55)
  %57 = load i8*, i8** %mixwfile.addr, align 8
  %cmp9 = icmp ne i8* %57, null
  br i1 %cmp9, label %cond.true10, label %cond.false11

cond.true10:                                      ; preds = %cond.end8
  br label %cond.end12

cond.false11:                                     ; preds = %cond.end8
  call void @__assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 506, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @__PRETTY_FUNCTION__.mgau_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end12

cond.end12:                                       ; preds = %58, %cond.true10
  %59 = bitcast double* %mixwfloor.addr to i8*
  %60 = call i64 @getAddr(i8* %59)
  %61 = load double, double* %mixwfloor.addr, align 8
  %cmp13 = fcmp oge double %61, 0.000000e+00
  call void @checkBranch(double %61, i64 %60, double 0.000000e+00, i64 0, i32 3, i1 %cmp13, i32 156)
  br i1 %cmp13, label %cond.true14, label %cond.false15

cond.true14:                                      ; preds = %cond.end12
  br label %cond.end16

cond.false15:                                     ; preds = %cond.end12
  call void @__assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 507, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @__PRETTY_FUNCTION__.mgau_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end16

cond.end16:                                       ; preds = %62, %cond.true14
  %63 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %64 = call i64 @getAddr(i8* %63)
  %call = call i8* @__ckd_calloc__(i64 1, i64 48, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 509)
  %65 = bitcast i8* %call to %struct.mgau_model_t*
  %66 = bitcast %struct.mgau_model_t** %g to i8*
  %67 = call i64 @getAddr(i8* %66)
  %68 = bitcast %struct.mgau_model_t* %65 to i8*
  %69 = call i64 @getAddr(i8* %68)
  call void @setRealTemp(i64 %67, i64 %69)
  store %struct.mgau_model_t* %65, %struct.mgau_model_t** %g, align 8
  %70 = bitcast i8** %senmgau.addr to i8*
  %71 = call i64 @getAddr(i8* %70)
  %72 = load i8*, i8** %senmgau.addr, align 8
  %call17 = call i32 @strcmp(i8* %72, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i32 0, i32 0)) #7
  %cmp18 = icmp eq i32 %call17, 0
  br i1 %cmp18, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end16
  %73 = bitcast %struct.mgau_model_t** %g to i8*
  %74 = call i64 @getAddr(i8* %73)
  %75 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g, align 8
  %gau_type = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %75, i32 0, i32 7
  %76 = bitcast i32* %gau_type to i8*
  store i32 10001, i32* %gau_type, align 8
  br label %if.end24

if.else:                                          ; preds = %cond.end16
  %77 = bitcast i8** %senmgau.addr to i8*
  %78 = call i64 @getAddr(i8* %77)
  %79 = load i8*, i8** %senmgau.addr, align 8
  %call19 = call i32 @strcmp(i8* %79, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i32 0, i32 0)) #7
  %cmp20 = icmp eq i32 %call19, 0
  br i1 %cmp20, label %if.then21, label %if.else23

if.then21:                                        ; preds = %if.else
  %80 = bitcast %struct.mgau_model_t** %g to i8*
  %81 = call i64 @getAddr(i8* %80)
  %82 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g, align 8
  %gau_type22 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %82, i32 0, i32 7
  %83 = bitcast i32* %gau_type22 to i8*
  store i32 10002, i32* %gau_type22, align 8
  br label %if.end

if.else23:                                        ; preds = %if.else
  %84 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %85 = call i64 @getAddr(i8* %84)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 516, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %86 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %87 = call i64 @getAddr(i8* %86)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.12, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else23, %if.then21
  br label %if.end24

if.end24:                                         ; preds = %if.end, %if.then
  %88 = bitcast %struct.mgau_model_t** %g to i8*
  %89 = call i64 @getAddr(i8* %88)
  %90 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g, align 8
  %91 = bitcast i8** %meanfile.addr to i8*
  %92 = call i64 @getAddr(i8* %91)
  %93 = load i8*, i8** %meanfile.addr, align 8
  %94 = bitcast i32 (%struct.mgau_model_t*, i8*, i32)* @mgau_file_read to i8*
  %95 = call i64 @getAddr(i8* %94)
  %call25 = call i32 @mgau_file_read(%struct.mgau_model_t* %90, i8* %93, i32 1)
  %96 = bitcast %struct.mgau_model_t** %g to i8*
  %97 = call i64 @getAddr(i8* %96)
  %98 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g, align 8
  %99 = bitcast i8** %varfile.addr to i8*
  %100 = call i64 @getAddr(i8* %99)
  %101 = load i8*, i8** %varfile.addr, align 8
  %102 = bitcast i32 (%struct.mgau_model_t*, i8*, i32)* @mgau_file_read to i8*
  %103 = call i64 @getAddr(i8* %102)
  %call26 = call i32 @mgau_file_read(%struct.mgau_model_t* %98, i8* %101, i32 2)
  %104 = bitcast %struct.mgau_model_t** %g to i8*
  %105 = call i64 @getAddr(i8* %104)
  %106 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g, align 8
  %107 = bitcast i8** %mixwfile.addr to i8*
  %108 = call i64 @getAddr(i8* %107)
  %109 = load i8*, i8** %mixwfile.addr, align 8
  %110 = bitcast double* %mixwfloor.addr to i8*
  %111 = call i64 @getAddr(i8* %110)
  %112 = load double, double* %mixwfloor.addr, align 8
  %113 = bitcast i32 (%struct.mgau_model_t*, i8*, double)* @mgau_mixw_read to i8*
  %114 = call i64 @getAddr(i8* %113)
  call void @addFunArg(i32 2, i64 %114, i64 %111)
  %call27 = call i32 @mgau_mixw_read(%struct.mgau_model_t* %106, i8* %109, double %112)
  %115 = bitcast %struct.mgau_model_t** %g to i8*
  %116 = call i64 @getAddr(i8* %115)
  %117 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g, align 8
  %118 = bitcast void (%struct.mgau_model_t*)* @mgau_uninit_compact to i8*
  %119 = call i64 @getAddr(i8* %118)
  call void @mgau_uninit_compact(%struct.mgau_model_t* %117)
  %120 = bitcast double* %varfloor.addr to i8*
  %121 = call i64 @getAddr(i8* %120)
  %122 = load double, double* %varfloor.addr, align 8
  %cmp28 = fcmp ogt double %122, 0.000000e+00
  call void @checkBranch(double %122, i64 %121, double 0.000000e+00, i64 0, i32 2, i1 %cmp28, i32 198)
  br i1 %cmp28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end24
  %123 = bitcast %struct.mgau_model_t** %g to i8*
  %124 = call i64 @getAddr(i8* %123)
  %125 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g, align 8
  %126 = bitcast double* %varfloor.addr to i8*
  %127 = call i64 @getAddr(i8* %126)
  %128 = load double, double* %varfloor.addr, align 8
  %129 = bitcast void (%struct.mgau_model_t*, double)* @mgau_var_floor to i8*
  %130 = call i64 @getAddr(i8* %129)
  call void @addFunArg(i32 1, i64 %130, i64 %127)
  call void @mgau_var_floor(%struct.mgau_model_t* %125, double %128)
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %if.end24
  %131 = bitcast i32* %precomp.addr to i8*
  %132 = call i64 @getAddr(i8* %131)
  %133 = load i32, i32* %precomp.addr, align 4
  %tobool = icmp ne i32 %133, 0
  br i1 %tobool, label %if.then31, label %if.end33

if.then31:                                        ; preds = %if.end30
  %134 = bitcast %struct.mgau_model_t** %g to i8*
  %135 = call i64 @getAddr(i8* %134)
  %136 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g, align 8
  %137 = bitcast i32 (%struct.mgau_model_t*)* @mgau_precomp to i8*
  %138 = call i64 @getAddr(i8* %137)
  %call32 = call i32 @mgau_precomp(%struct.mgau_model_t* %136)
  br label %if.end33

if.end33:                                         ; preds = %if.then31, %if.end30
  %139 = bitcast double (i32)* @logs3_to_log to i8*
  %140 = call i64 @getAddr(i8* %139)
  %call34 = call double @logs3_to_log(i32 -939524096)
  %141 = bitcast %struct.mgau_model_t** %g to i8*
  %142 = call i64 @getAddr(i8* %141)
  %143 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g, align 8
  %distfloor = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %143, i32 0, i32 4
  %144 = bitcast double* %distfloor to i8*
  %145 = call i64 @getAddr(i8* %144)
  call void @setRealReturn(i64 %145)
  store double %call34, double* %distfloor, align 8
  %146 = bitcast %struct.mgau_model_t** %g to i8*
  %147 = call i64 @getAddr(i8* %146)
  %148 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g, align 8
  %149 = bitcast %struct.mgau_model_t* (i8*, i8*, double, i8*, double, i32, i8*)* @mgau_init to i8*
  %150 = call i64 @getAddr(i8* %149)
  call void @funcExit(i64 %150)
  %151 = bitcast %struct.mgau_model_t* (i8*, i8*, double, i8*, double, i32, i8*)* @mgau_init to i8*
  %152 = call i64 @getAddr(i8* %151)
  call void @trackReturn(i64 %152, i64 %147)
  ret %struct.mgau_model_t* %148
}

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #2

declare dso_local i8* @__ckd_calloc__(i64, i64, i8*, i32) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #3

declare dso_local void @_E__pr_header(i8*, i64, i8*) #1

declare dso_local void @_E__die_error(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @mgau_file_read(%struct.mgau_model_t* %g, i8* %file_name, i32 %type) #0 {
entry:
  %0 = bitcast i32 (%struct.mgau_model_t*, i8*, i32)* @mgau_file_read to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %g.addr = alloca %struct.mgau_model_t*, align 8
  %2 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %file_name.addr = alloca i8*, align 8
  %4 = bitcast i8** %file_name.addr to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @handleAlloca(i64 %5)
  %type.addr = alloca i32, align 4
  %6 = bitcast i32* %type.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @handleAlloca(i64 %7)
  %tmp = alloca i8, align 1
  %8 = bitcast i8* %tmp to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @handleAlloca(i64 %9)
  %fp = alloca %struct._IO_FILE*, align 8
  %10 = bitcast %struct._IO_FILE** %fp to i8*
  %11 = call i64 @getAddr(i8* %10)
  call void @handleAlloca(i64 %11)
  %i = alloca i32, align 4
  %12 = bitcast i32* %i to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @handleAlloca(i64 %13)
  %k = alloca i32, align 4
  %14 = bitcast i32* %k to i8*
  %15 = call i64 @getAddr(i8* %14)
  call void @handleAlloca(i64 %15)
  %n = alloca i32, align 4
  %16 = bitcast i32* %n to i8*
  %17 = call i64 @getAddr(i8* %16)
  call void @handleAlloca(i64 %17)
  %n_mgau = alloca i32, align 4
  %18 = bitcast i32* %n_mgau to i8*
  %19 = call i64 @getAddr(i8* %18)
  call void @handleAlloca(i64 %19)
  %n_feat = alloca i32, align 4
  %20 = bitcast i32* %n_feat to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void @handleAlloca(i64 %21)
  %n_density = alloca i32, align 4
  %22 = bitcast i32* %n_density to i8*
  %23 = call i64 @getAddr(i8* %22)
  call void @handleAlloca(i64 %23)
  %veclen = alloca i32*, align 8
  %24 = bitcast i32** %veclen to i8*
  %25 = call i64 @getAddr(i8* %24)
  call void @handleAlloca(i64 %25)
  %blk = alloca i32, align 4
  %26 = bitcast i32* %blk to i8*
  %27 = call i64 @getAddr(i8* %26)
  call void @handleAlloca(i64 %27)
  %byteswap = alloca i32, align 4
  %28 = bitcast i32* %byteswap to i8*
  %29 = call i64 @getAddr(i8* %28)
  call void @handleAlloca(i64 %29)
  %chksum_present = alloca i32, align 4
  %30 = bitcast i32* %chksum_present to i8*
  %31 = call i64 @getAddr(i8* %30)
  call void @handleAlloca(i64 %31)
  %buf = alloca float*, align 8
  %32 = bitcast float** %buf to i8*
  %33 = call i64 @getAddr(i8* %32)
  call void @handleAlloca(i64 %33)
  %pbuf = alloca float**, align 8
  %34 = bitcast float*** %pbuf to i8*
  %35 = call i64 @getAddr(i8* %34)
  call void @handleAlloca(i64 %35)
  %argname = alloca i8**, align 8
  %36 = bitcast i8*** %argname to i8*
  %37 = call i64 @getAddr(i8* %36)
  call void @handleAlloca(i64 %37)
  %argval = alloca i8**, align 8
  %38 = bitcast i8*** %argval to i8*
  %39 = call i64 @getAddr(i8* %38)
  call void @handleAlloca(i64 %39)
  %chksum = alloca i32, align 4
  %40 = bitcast i32* %chksum to i8*
  %41 = call i64 @getAddr(i8* %40)
  call void @handleAlloca(i64 %41)
  %f = alloca double, align 8
  %42 = bitcast double* %f to i8*
  %43 = call i64 @getAddr(i8* %42)
  call void @handleAlloca(i64 %43)
  %44 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %45 = call i64 @getAddr(i8* %44)
  %46 = bitcast %struct.mgau_model_t* %g to i8*
  %47 = call i64 @getAddr(i8* %46)
  call void @setRealTemp(i64 %45, i64 %47)
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %g.addr, align 8
  %48 = bitcast i8** %file_name.addr to i8*
  %49 = call i64 @getAddr(i8* %48)
  %50 = bitcast i8* %file_name to i8*
  %51 = call i64 @getAddr(i8* %50)
  call void @setRealTemp(i64 %49, i64 %51)
  store i8* %file_name, i8** %file_name.addr, align 8
  %52 = bitcast i32* %type.addr to i8*
  store i32 %type, i32* %type.addr, align 4
  %53 = bitcast void (i8*, i64, i8*)* @_E__pr_info_header to i8*
  %54 = call i64 @getAddr(i8* %53)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 96, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  %55 = bitcast i8** %file_name.addr to i8*
  %56 = call i64 @getAddr(i8* %55)
  %57 = load i8*, i8** %file_name.addr, align 8
  %58 = bitcast void (i8*, ...)* @_E__pr_info to i8*
  %59 = call i64 @getAddr(i8* %58)
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.13, i32 0, i32 0), i8* %57)
  %60 = bitcast i8** %file_name.addr to i8*
  %61 = call i64 @getAddr(i8* %60)
  %62 = load i8*, i8** %file_name.addr, align 8
  %63 = bitcast %struct._IO_FILE* (i8*, i8*, i8*, i32)* @_myfopen to i8*
  %64 = call i64 @getAddr(i8* %63)
  %call = call %struct._IO_FILE* @_myfopen(i8* %62, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 98)
  %65 = bitcast %struct._IO_FILE** %fp to i8*
  %66 = call i64 @getAddr(i8* %65)
  %67 = bitcast %struct._IO_FILE* %call to i8*
  %68 = call i64 @getAddr(i8* %67)
  call void @setRealTemp(i64 %66, i64 %68)
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8
  %69 = bitcast %struct._IO_FILE** %fp to i8*
  %70 = call i64 @getAddr(i8* %69)
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %72 = bitcast i32 (%struct._IO_FILE*, i8***, i8***, i32*)* @bio_readhdr to i8*
  %73 = call i64 @getAddr(i8* %72)
  %call1 = call i32 @bio_readhdr(%struct._IO_FILE* %71, i8*** %argname, i8*** %argval, i32* %byteswap)
  %cmp = icmp slt i32 %call1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %74 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %75 = call i64 @getAddr(i8* %74)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 102, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %76 = bitcast i8** %file_name.addr to i8*
  %77 = call i64 @getAddr(i8* %76)
  %78 = load i8*, i8** %file_name.addr, align 8
  %79 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %80 = call i64 @getAddr(i8* %79)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.15, i32 0, i32 0), i8* %78)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %81 = bitcast i32* %chksum_present to i8*
  store i32 0, i32* %chksum_present, align 4
  %82 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %83 = bitcast i8*** %argname to i8*
  %84 = call i64 @getAddr(i8* %83)
  %85 = load i8**, i8*** %argname, align 8
  %86 = bitcast i32* %i to i8*
  %87 = call i64 @getAddr(i8* %86)
  %88 = load i32, i32* %i, align 4
  %idxprom = sext i32 %88 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %85, i64 %idxprom
  %89 = bitcast i8** %arrayidx to i8*
  %90 = call i64 @getAddr(i8* %89)
  %91 = load i8*, i8** %arrayidx, align 8
  %tobool = icmp ne i8* %91, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %92 = bitcast i8*** %argname to i8*
  %93 = call i64 @getAddr(i8* %92)
  %94 = load i8**, i8*** %argname, align 8
  %95 = bitcast i32* %i to i8*
  %96 = call i64 @getAddr(i8* %95)
  %97 = load i32, i32* %i, align 4
  %idxprom2 = sext i32 %97 to i64
  %arrayidx3 = getelementptr inbounds i8*, i8** %94, i64 %idxprom2
  %98 = bitcast i8** %arrayidx3 to i8*
  %99 = call i64 @getAddr(i8* %98)
  %100 = load i8*, i8** %arrayidx3, align 8
  %call4 = call i32 @strcmp(i8* %100, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.16, i32 0, i32 0)) #7
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %for.body
  %101 = bitcast i8*** %argval to i8*
  %102 = call i64 @getAddr(i8* %101)
  %103 = load i8**, i8*** %argval, align 8
  %104 = bitcast i32* %i to i8*
  %105 = call i64 @getAddr(i8* %104)
  %106 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %106 to i64
  %arrayidx8 = getelementptr inbounds i8*, i8** %103, i64 %idxprom7
  %107 = bitcast i8** %arrayidx8 to i8*
  %108 = call i64 @getAddr(i8* %107)
  %109 = load i8*, i8** %arrayidx8, align 8
  %call9 = call i32 @strcmp(i8* %109, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.17, i32 0, i32 0)) #7
  %cmp10 = icmp ne i32 %call9, 0
  br i1 %cmp10, label %if.then11, label %if.end14

if.then11:                                        ; preds = %if.then6
  %110 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %111 = call i64 @getAddr(i8* %110)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 109, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.18, i32 0, i32 0))
  %112 = bitcast i8** %file_name.addr to i8*
  %113 = call i64 @getAddr(i8* %112)
  %114 = load i8*, i8** %file_name.addr, align 8
  %115 = bitcast i8*** %argval to i8*
  %116 = call i64 @getAddr(i8* %115)
  %117 = load i8**, i8*** %argval, align 8
  %118 = bitcast i32* %i to i8*
  %119 = call i64 @getAddr(i8* %118)
  %120 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %120 to i64
  %arrayidx13 = getelementptr inbounds i8*, i8** %117, i64 %idxprom12
  %121 = bitcast i8** %arrayidx13 to i8*
  %122 = call i64 @getAddr(i8* %121)
  %123 = load i8*, i8** %arrayidx13, align 8
  %124 = bitcast void (i8*, ...)* @_E__pr_warn to i8*
  %125 = call i64 @getAddr(i8* %124)
  call void (i8*, ...) @_E__pr_warn(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.19, i32 0, i32 0), i8* %114, i8* %123, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.17, i32 0, i32 0))
  br label %if.end14

if.end14:                                         ; preds = %if.then11, %if.then6
  br label %if.end21

if.else:                                          ; preds = %for.body
  %126 = bitcast i8*** %argname to i8*
  %127 = call i64 @getAddr(i8* %126)
  %128 = load i8**, i8*** %argname, align 8
  %129 = bitcast i32* %i to i8*
  %130 = call i64 @getAddr(i8* %129)
  %131 = load i32, i32* %i, align 4
  %idxprom15 = sext i32 %131 to i64
  %arrayidx16 = getelementptr inbounds i8*, i8** %128, i64 %idxprom15
  %132 = bitcast i8** %arrayidx16 to i8*
  %133 = call i64 @getAddr(i8* %132)
  %134 = load i8*, i8** %arrayidx16, align 8
  %call17 = call i32 @strcmp(i8* %134, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.20, i32 0, i32 0)) #7
  %cmp18 = icmp eq i32 %call17, 0
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.else
  %135 = bitcast i32* %chksum_present to i8*
  store i32 1, i32* %chksum_present, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %if.else
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.end14
  br label %for.inc

for.inc:                                          ; preds = %if.end21
  %136 = bitcast i32* %i to i8*
  %137 = call i64 @getAddr(i8* %136)
  %138 = load i32, i32* %i, align 4
  %inc = add nsw i32 %138, 1
  %139 = bitcast i32* %i to i8*
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %140 = bitcast i8*** %argname to i8*
  %141 = call i64 @getAddr(i8* %140)
  %142 = load i8**, i8*** %argname, align 8
  %143 = bitcast i8*** %argval to i8*
  %144 = call i64 @getAddr(i8* %143)
  %145 = load i8**, i8*** %argval, align 8
  %146 = bitcast void (i8**, i8**)* @bio_hdrarg_free to i8*
  %147 = call i64 @getAddr(i8* %146)
  call void @bio_hdrarg_free(i8** %142, i8** %145)
  %148 = bitcast i8*** %argval to i8*
  %149 = call i64 @getAddr(i8* %148)
  %150 = bitcast i8** null to i8*
  %151 = call i64 @getAddr(i8* %150)
  call void @setRealTemp(i64 %149, i64 %151)
  store i8** null, i8*** %argval, align 8
  %152 = bitcast i8*** %argname to i8*
  %153 = call i64 @getAddr(i8* %152)
  %154 = bitcast i8** null to i8*
  %155 = call i64 @getAddr(i8* %154)
  call void @setRealTemp(i64 %153, i64 %155)
  store i8** null, i8*** %argname, align 8
  %156 = bitcast i32* %chksum to i8*
  store i32 0, i32* %chksum, align 4
  %157 = bitcast i32* %n_mgau to i8*
  %158 = bitcast %struct._IO_FILE** %fp to i8*
  %159 = call i64 @getAddr(i8* %158)
  %160 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %161 = bitcast i32* %byteswap to i8*
  %162 = call i64 @getAddr(i8* %161)
  %163 = load i32, i32* %byteswap, align 4
  %164 = bitcast i32 (i8*, i32, i32, %struct._IO_FILE*, i32, i32*)* @bio_fread to i8*
  %165 = call i64 @getAddr(i8* %164)
  call void @addFunArg(i32 4, i64 %165, i64 %162)
  %call22 = call i32 @bio_fread(i8* %157, i32 4, i32 1, %struct._IO_FILE* %160, i32 %163, i32* %chksum)
  %cmp23 = icmp ne i32 %call22, 1
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %for.end
  %166 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %167 = call i64 @getAddr(i8* %166)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 122, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %168 = bitcast i8** %file_name.addr to i8*
  %169 = call i64 @getAddr(i8* %168)
  %170 = load i8*, i8** %file_name.addr, align 8
  %171 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %172 = call i64 @getAddr(i8* %171)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.21, i32 0, i32 0), i8* %170)
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %for.end
  %173 = bitcast i32* %n_mgau to i8*
  %174 = call i64 @getAddr(i8* %173)
  %175 = load i32, i32* %n_mgau, align 4
  %cmp26 = icmp sge i32 %175, 32766
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end25
  %176 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %177 = call i64 @getAddr(i8* %176)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 124, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %178 = bitcast i8** %file_name.addr to i8*
  %179 = call i64 @getAddr(i8* %178)
  %180 = load i8*, i8** %file_name.addr, align 8
  %181 = bitcast i32* %n_mgau to i8*
  %182 = call i64 @getAddr(i8* %181)
  %183 = load i32, i32* %n_mgau, align 4
  %184 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %185 = call i64 @getAddr(i8* %184)
  call void @addFunArg(i32 2, i64 %185, i64 %182)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.22, i32 0, i32 0), i8* %180, i32 %183, i32 32766)
  br label %if.end28

if.end28:                                         ; preds = %if.then27, %if.end25
  %186 = bitcast i32* %n_feat to i8*
  %187 = bitcast %struct._IO_FILE** %fp to i8*
  %188 = call i64 @getAddr(i8* %187)
  %189 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %190 = bitcast i32* %byteswap to i8*
  %191 = call i64 @getAddr(i8* %190)
  %192 = load i32, i32* %byteswap, align 4
  %193 = bitcast i32 (i8*, i32, i32, %struct._IO_FILE*, i32, i32*)* @bio_fread to i8*
  %194 = call i64 @getAddr(i8* %193)
  call void @addFunArg(i32 4, i64 %194, i64 %191)
  %call29 = call i32 @bio_fread(i8* %186, i32 4, i32 1, %struct._IO_FILE* %189, i32 %192, i32* %chksum)
  %cmp30 = icmp ne i32 %call29, 1
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end28
  %195 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %196 = call i64 @getAddr(i8* %195)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 130, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %197 = bitcast i8** %file_name.addr to i8*
  %198 = call i64 @getAddr(i8* %197)
  %199 = load i8*, i8** %file_name.addr, align 8
  %200 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %201 = call i64 @getAddr(i8* %200)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.23, i32 0, i32 0), i8* %199)
  br label %if.end32

if.end32:                                         ; preds = %if.then31, %if.end28
  %202 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %203 = call i64 @getAddr(i8* %202)
  %204 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %gau_type = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %204, i32 0, i32 7
  %205 = bitcast i32* %gau_type to i8*
  %206 = call i64 @getAddr(i8* %205)
  %207 = load i32, i32* %gau_type, align 8
  %cmp33 = icmp eq i32 %207, 10001
  br i1 %cmp33, label %if.then34, label %if.else38

if.then34:                                        ; preds = %if.end32
  %208 = bitcast i32* %n_feat to i8*
  %209 = call i64 @getAddr(i8* %208)
  %210 = load i32, i32* %n_feat, align 4
  %cmp35 = icmp ne i32 %210, 1
  br i1 %cmp35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.then34
  %211 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %212 = call i64 @getAddr(i8* %211)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 134, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %213 = bitcast i32* %n_feat to i8*
  %214 = call i64 @getAddr(i8* %213)
  %215 = load i32, i32* %n_feat, align 4
  %216 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %217 = call i64 @getAddr(i8* %216)
  call void @addFunArg(i32 1, i64 %217, i64 %214)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.24, i32 0, i32 0), i32 %215)
  br label %if.end37

if.end37:                                         ; preds = %if.then36, %if.then34
  br label %if.end46

if.else38:                                        ; preds = %if.end32
  %218 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %219 = call i64 @getAddr(i8* %218)
  %220 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %gau_type39 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %220, i32 0, i32 7
  %221 = bitcast i32* %gau_type39 to i8*
  %222 = call i64 @getAddr(i8* %221)
  %223 = load i32, i32* %gau_type39, align 8
  %cmp40 = icmp eq i32 %223, 10002
  br i1 %cmp40, label %if.then41, label %if.end45

if.then41:                                        ; preds = %if.else38
  %224 = bitcast i32* %n_feat to i8*
  %225 = call i64 @getAddr(i8* %224)
  %226 = load i32, i32* %n_feat, align 4
  %cmp42 = icmp ne i32 %226, 4
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.then41
  %227 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %228 = call i64 @getAddr(i8* %227)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 137, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %229 = bitcast i32* %n_feat to i8*
  %230 = call i64 @getAddr(i8* %229)
  %231 = load i32, i32* %n_feat, align 4
  %232 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %233 = call i64 @getAddr(i8* %232)
  call void @addFunArg(i32 1, i64 %233, i64 %230)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.25, i32 0, i32 0), i32 %231)
  br label %if.end44

if.end44:                                         ; preds = %if.then43, %if.then41
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.else38
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.end37
  %234 = bitcast i32* %n_density to i8*
  %235 = bitcast %struct._IO_FILE** %fp to i8*
  %236 = call i64 @getAddr(i8* %235)
  %237 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %238 = bitcast i32* %byteswap to i8*
  %239 = call i64 @getAddr(i8* %238)
  %240 = load i32, i32* %byteswap, align 4
  %241 = bitcast i32 (i8*, i32, i32, %struct._IO_FILE*, i32, i32*)* @bio_fread to i8*
  %242 = call i64 @getAddr(i8* %241)
  call void @addFunArg(i32 4, i64 %242, i64 %239)
  %call47 = call i32 @bio_fread(i8* %234, i32 4, i32 1, %struct._IO_FILE* %237, i32 %240, i32* %chksum)
  %cmp48 = icmp ne i32 %call47, 1
  br i1 %cmp48, label %if.then49, label %if.end50

if.then49:                                        ; preds = %if.end46
  %243 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %244 = call i64 @getAddr(i8* %243)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 142, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %245 = bitcast i8** %file_name.addr to i8*
  %246 = call i64 @getAddr(i8* %245)
  %247 = load i8*, i8** %file_name.addr, align 8
  %248 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %249 = call i64 @getAddr(i8* %248)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.26, i32 0, i32 0), i8* %247)
  br label %if.end50

if.end50:                                         ; preds = %if.then49, %if.end46
  %250 = bitcast i32* %n_feat to i8*
  %251 = call i64 @getAddr(i8* %250)
  %252 = load i32, i32* %n_feat, align 4
  %conv = sext i32 %252 to i64
  %253 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %254 = call i64 @getAddr(i8* %253)
  %call51 = call i8* @__ckd_calloc__(i64 %conv, i64 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 146)
  %255 = bitcast i8* %call51 to i32*
  %256 = bitcast i32** %veclen to i8*
  %257 = call i64 @getAddr(i8* %256)
  %258 = bitcast i32* %255 to i8*
  %259 = call i64 @getAddr(i8* %258)
  call void @setRealTemp(i64 %257, i64 %259)
  store i32* %255, i32** %veclen, align 8
  %260 = bitcast i32** %veclen to i8*
  %261 = call i64 @getAddr(i8* %260)
  %262 = load i32*, i32** %veclen, align 8
  %263 = bitcast i32* %262 to i8*
  %264 = bitcast i32* %n_feat to i8*
  %265 = call i64 @getAddr(i8* %264)
  %266 = load i32, i32* %n_feat, align 4
  %267 = bitcast %struct._IO_FILE** %fp to i8*
  %268 = call i64 @getAddr(i8* %267)
  %269 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %270 = bitcast i32* %byteswap to i8*
  %271 = call i64 @getAddr(i8* %270)
  %272 = load i32, i32* %byteswap, align 4
  %273 = bitcast i32 (i8*, i32, i32, %struct._IO_FILE*, i32, i32*)* @bio_fread to i8*
  %274 = call i64 @getAddr(i8* %273)
  call void @addFunArg(i32 2, i64 %274, i64 %265)
  call void @addFunArg(i32 4, i64 %274, i64 %271)
  %call52 = call i32 @bio_fread(i8* %263, i32 4, i32 %266, %struct._IO_FILE* %269, i32 %272, i32* %chksum)
  %275 = bitcast i32* %n_feat to i8*
  %276 = call i64 @getAddr(i8* %275)
  %277 = load i32, i32* %n_feat, align 4
  %cmp53 = icmp ne i32 %call52, %277
  br i1 %cmp53, label %if.then55, label %if.end56

if.then55:                                        ; preds = %if.end50
  %278 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %279 = call i64 @getAddr(i8* %278)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 149, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %280 = bitcast i8** %file_name.addr to i8*
  %281 = call i64 @getAddr(i8* %280)
  %282 = load i8*, i8** %file_name.addr, align 8
  %283 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %284 = call i64 @getAddr(i8* %283)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.27, i32 0, i32 0), i8* %282)
  br label %if.end56

if.end56:                                         ; preds = %if.then55, %if.end50
  %285 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  %286 = bitcast i32* %blk to i8*
  store i32 0, i32* %blk, align 4
  br label %for.cond57

for.cond57:                                       ; preds = %for.inc63, %if.end56
  %287 = bitcast i32* %i to i8*
  %288 = call i64 @getAddr(i8* %287)
  %289 = load i32, i32* %i, align 4
  %290 = bitcast i32* %n_feat to i8*
  %291 = call i64 @getAddr(i8* %290)
  %292 = load i32, i32* %n_feat, align 4
  %cmp58 = icmp slt i32 %289, %292
  br i1 %cmp58, label %for.body60, label %for.end65

for.body60:                                       ; preds = %for.cond57
  %293 = bitcast i32** %veclen to i8*
  %294 = call i64 @getAddr(i8* %293)
  %295 = load i32*, i32** %veclen, align 8
  %296 = bitcast i32* %i to i8*
  %297 = call i64 @getAddr(i8* %296)
  %298 = load i32, i32* %i, align 4
  %idxprom61 = sext i32 %298 to i64
  %arrayidx62 = getelementptr inbounds i32, i32* %295, i64 %idxprom61
  %299 = bitcast i32* %arrayidx62 to i8*
  %300 = call i64 @getAddr(i8* %299)
  %301 = load i32, i32* %arrayidx62, align 4
  %302 = bitcast i32* %blk to i8*
  %303 = call i64 @getAddr(i8* %302)
  %304 = load i32, i32* %blk, align 4
  %add = add nsw i32 %304, %301
  %305 = bitcast i32* %blk to i8*
  store i32 %add, i32* %blk, align 4
  br label %for.inc63

for.inc63:                                        ; preds = %for.body60
  %306 = bitcast i32* %i to i8*
  %307 = call i64 @getAddr(i8* %306)
  %308 = load i32, i32* %i, align 4
  %inc64 = add nsw i32 %308, 1
  %309 = bitcast i32* %i to i8*
  store i32 %inc64, i32* %i, align 4
  br label %for.cond57

for.end65:                                        ; preds = %for.cond57
  %310 = bitcast i32* %n to i8*
  %311 = bitcast %struct._IO_FILE** %fp to i8*
  %312 = call i64 @getAddr(i8* %311)
  %313 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %314 = bitcast i32* %byteswap to i8*
  %315 = call i64 @getAddr(i8* %314)
  %316 = load i32, i32* %byteswap, align 4
  %317 = bitcast i32 (i8*, i32, i32, %struct._IO_FILE*, i32, i32*)* @bio_fread to i8*
  %318 = call i64 @getAddr(i8* %317)
  call void @addFunArg(i32 4, i64 %318, i64 %315)
  %call66 = call i32 @bio_fread(i8* %310, i32 4, i32 1, %struct._IO_FILE* %313, i32 %316, i32* %chksum)
  %cmp67 = icmp ne i32 %call66, 1
  br i1 %cmp67, label %if.then69, label %if.end70

if.then69:                                        ; preds = %for.end65
  %319 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %320 = call i64 @getAddr(i8* %319)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 159, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %321 = bitcast i8** %file_name.addr to i8*
  %322 = call i64 @getAddr(i8* %321)
  %323 = load i8*, i8** %file_name.addr, align 8
  %324 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %325 = call i64 @getAddr(i8* %324)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.28, i32 0, i32 0), i8* %323)
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %for.end65
  %326 = bitcast i32* %n to i8*
  %327 = call i64 @getAddr(i8* %326)
  %328 = load i32, i32* %n, align 4
  %329 = bitcast i32* %n_mgau to i8*
  %330 = call i64 @getAddr(i8* %329)
  %331 = load i32, i32* %n_mgau, align 4
  %332 = bitcast i32* %n_density to i8*
  %333 = call i64 @getAddr(i8* %332)
  %334 = load i32, i32* %n_density, align 4
  %mul = mul nsw i32 %331, %334
  %335 = bitcast i32* %blk to i8*
  %336 = call i64 @getAddr(i8* %335)
  %337 = load i32, i32* %blk, align 4
  %mul71 = mul nsw i32 %mul, %337
  %cmp72 = icmp ne i32 %328, %mul71
  br i1 %cmp72, label %if.then74, label %if.end75

if.then74:                                        ; preds = %if.end70
  %338 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %339 = call i64 @getAddr(i8* %338)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 162, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %340 = bitcast i8** %file_name.addr to i8*
  %341 = call i64 @getAddr(i8* %340)
  %342 = load i8*, i8** %file_name.addr, align 8
  %343 = bitcast i32* %n to i8*
  %344 = call i64 @getAddr(i8* %343)
  %345 = load i32, i32* %n, align 4
  %346 = bitcast i32* %n_mgau to i8*
  %347 = call i64 @getAddr(i8* %346)
  %348 = load i32, i32* %n_mgau, align 4
  %349 = bitcast i32* %n_density to i8*
  %350 = call i64 @getAddr(i8* %349)
  %351 = load i32, i32* %n_density, align 4
  %352 = bitcast i32* %blk to i8*
  %353 = call i64 @getAddr(i8* %352)
  %354 = load i32, i32* %blk, align 4
  %355 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %356 = call i64 @getAddr(i8* %355)
  call void @addFunArg(i32 2, i64 %356, i64 %344)
  call void @addFunArg(i32 3, i64 %356, i64 %347)
  call void @addFunArg(i32 4, i64 %356, i64 %350)
  call void @addFunArg(i32 5, i64 %356, i64 %353)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.29, i32 0, i32 0), i8* %342, i32 %345, i32 %348, i32 %351, i32 %354)
  br label %if.end75

if.end75:                                         ; preds = %if.then74, %if.end70
  %357 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %358 = call i64 @getAddr(i8* %357)
  %359 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %gau_type76 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %359, i32 0, i32 7
  %360 = bitcast i32* %gau_type76 to i8*
  %361 = call i64 @getAddr(i8* %360)
  %362 = load i32, i32* %gau_type76, align 8
  %cmp77 = icmp eq i32 %362, 10002
  br i1 %cmp77, label %if.then79, label %if.end80

if.then79:                                        ; preds = %if.end75
  %363 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %364 = call i64 @getAddr(i8* %363)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 167, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %365 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %366 = call i64 @getAddr(i8* %365)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.30, i32 0, i32 0))
  br label %if.end80

if.end80:                                         ; preds = %if.then79, %if.end75
  %367 = bitcast i32* %type.addr to i8*
  %368 = call i64 @getAddr(i8* %367)
  %369 = load i32, i32* %type.addr, align 4
  %cmp81 = icmp eq i32 %369, 1
  br i1 %cmp81, label %if.then83, label %if.else125

if.then83:                                        ; preds = %if.end80
  %370 = bitcast i32* %n_mgau to i8*
  %371 = call i64 @getAddr(i8* %370)
  %372 = load i32, i32* %n_mgau, align 4
  %373 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %374 = call i64 @getAddr(i8* %373)
  %375 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %n_mgau84 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %375, i32 0, i32 0
  %376 = bitcast i32* %n_mgau84 to i8*
  store i32 %372, i32* %n_mgau84, align 8
  %377 = bitcast i32* %n_density to i8*
  %378 = call i64 @getAddr(i8* %377)
  %379 = load i32, i32* %n_density, align 4
  %380 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %381 = call i64 @getAddr(i8* %380)
  %382 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %max_comp = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %382, i32 0, i32 1
  %383 = bitcast i32* %max_comp to i8*
  store i32 %379, i32* %max_comp, align 4
  %384 = bitcast i32* %blk to i8*
  %385 = call i64 @getAddr(i8* %384)
  %386 = load i32, i32* %blk, align 4
  %387 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %388 = call i64 @getAddr(i8* %387)
  %389 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %veclen85 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %389, i32 0, i32 2
  %390 = bitcast i32* %veclen85 to i8*
  store i32 %386, i32* %veclen85, align 8
  %391 = bitcast i32* %n_mgau to i8*
  %392 = call i64 @getAddr(i8* %391)
  %393 = load i32, i32* %n_mgau, align 4
  %conv86 = sext i32 %393 to i64
  %394 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %395 = call i64 @getAddr(i8* %394)
  %call87 = call i8* @__ckd_calloc__(i64 %conv86, i64 40, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 175)
  %396 = bitcast i8* %call87 to %struct.mgau_t*
  %397 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %398 = call i64 @getAddr(i8* %397)
  %399 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %399, i32 0, i32 3
  %400 = bitcast %struct.mgau_t** %mgau to i8*
  %401 = call i64 @getAddr(i8* %400)
  %402 = bitcast %struct.mgau_t* %396 to i8*
  %403 = call i64 @getAddr(i8* %402)
  call void @setRealTemp(i64 %401, i64 %403)
  store %struct.mgau_t* %396, %struct.mgau_t** %mgau, align 8
  %404 = bitcast i32* %n to i8*
  %405 = call i64 @getAddr(i8* %404)
  %406 = load i32, i32* %n, align 4
  %conv88 = sext i32 %406 to i64
  %407 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %408 = call i64 @getAddr(i8* %407)
  %call89 = call i8* @__ckd_calloc__(i64 %conv88, i64 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 177)
  %409 = bitcast i8* %call89 to float*
  %410 = bitcast float** %buf to i8*
  %411 = call i64 @getAddr(i8* %410)
  %412 = bitcast float* %409 to i8*
  %413 = call i64 @getAddr(i8* %412)
  call void @setRealTemp(i64 %411, i64 %413)
  store float* %409, float** %buf, align 8
  %414 = bitcast i32* %n_mgau to i8*
  %415 = call i64 @getAddr(i8* %414)
  %416 = load i32, i32* %n_mgau, align 4
  %417 = bitcast i32* %n_density to i8*
  %418 = call i64 @getAddr(i8* %417)
  %419 = load i32, i32* %n_density, align 4
  %mul90 = mul nsw i32 %416, %419
  %conv91 = sext i32 %mul90 to i64
  %420 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %421 = call i64 @getAddr(i8* %420)
  %call92 = call i8* @__ckd_calloc__(i64 %conv91, i64 8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 178)
  %422 = bitcast i8* %call92 to float**
  %423 = bitcast float*** %pbuf to i8*
  %424 = call i64 @getAddr(i8* %423)
  %425 = bitcast float** %422 to i8*
  %426 = call i64 @getAddr(i8* %425)
  call void @setRealTemp(i64 %424, i64 %426)
  store float** %422, float*** %pbuf, align 8
  %427 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond93

for.cond93:                                       ; preds = %for.inc118, %if.then83
  %428 = bitcast i32* %i to i8*
  %429 = call i64 @getAddr(i8* %428)
  %430 = load i32, i32* %i, align 4
  %431 = bitcast i32* %n_mgau to i8*
  %432 = call i64 @getAddr(i8* %431)
  %433 = load i32, i32* %n_mgau, align 4
  %cmp94 = icmp slt i32 %430, %433
  br i1 %cmp94, label %for.body96, label %for.end120

for.body96:                                       ; preds = %for.cond93
  %434 = bitcast i32* %n_density to i8*
  %435 = call i64 @getAddr(i8* %434)
  %436 = load i32, i32* %n_density, align 4
  %437 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %438 = call i64 @getAddr(i8* %437)
  %439 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau97 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %439, i32 0, i32 3
  %440 = bitcast %struct.mgau_t** %mgau97 to i8*
  %441 = call i64 @getAddr(i8* %440)
  %442 = load %struct.mgau_t*, %struct.mgau_t** %mgau97, align 8
  %443 = bitcast i32* %i to i8*
  %444 = call i64 @getAddr(i8* %443)
  %445 = load i32, i32* %i, align 4
  %idxprom98 = sext i32 %445 to i64
  %arrayidx99 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %442, i64 %idxprom98
  %n_comp = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx99, i32 0, i32 0
  %446 = bitcast i32* %n_comp to i8*
  store i32 %436, i32* %n_comp, align 8
  %447 = bitcast float*** %pbuf to i8*
  %448 = call i64 @getAddr(i8* %447)
  %449 = load float**, float*** %pbuf, align 8
  %450 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %451 = call i64 @getAddr(i8* %450)
  %452 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau100 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %452, i32 0, i32 3
  %453 = bitcast %struct.mgau_t** %mgau100 to i8*
  %454 = call i64 @getAddr(i8* %453)
  %455 = load %struct.mgau_t*, %struct.mgau_t** %mgau100, align 8
  %456 = bitcast i32* %i to i8*
  %457 = call i64 @getAddr(i8* %456)
  %458 = load i32, i32* %i, align 4
  %idxprom101 = sext i32 %458 to i64
  %arrayidx102 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %455, i64 %idxprom101
  %mean = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx102, i32 0, i32 1
  %459 = bitcast float*** %mean to i8*
  %460 = call i64 @getAddr(i8* %459)
  %461 = bitcast float** %449 to i8*
  %462 = call i64 @getAddr(i8* %461)
  call void @setRealTemp(i64 %460, i64 %462)
  store float** %449, float*** %mean, align 8
  %463 = bitcast i32* %k to i8*
  store i32 0, i32* %k, align 4
  br label %for.cond103

for.cond103:                                      ; preds = %for.inc113, %for.body96
  %464 = bitcast i32* %k to i8*
  %465 = call i64 @getAddr(i8* %464)
  %466 = load i32, i32* %k, align 4
  %467 = bitcast i32* %n_density to i8*
  %468 = call i64 @getAddr(i8* %467)
  %469 = load i32, i32* %n_density, align 4
  %cmp104 = icmp slt i32 %466, %469
  br i1 %cmp104, label %for.body106, label %for.end115

for.body106:                                      ; preds = %for.cond103
  %470 = bitcast float** %buf to i8*
  %471 = call i64 @getAddr(i8* %470)
  %472 = load float*, float** %buf, align 8
  %473 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %474 = call i64 @getAddr(i8* %473)
  %475 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau107 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %475, i32 0, i32 3
  %476 = bitcast %struct.mgau_t** %mgau107 to i8*
  %477 = call i64 @getAddr(i8* %476)
  %478 = load %struct.mgau_t*, %struct.mgau_t** %mgau107, align 8
  %479 = bitcast i32* %i to i8*
  %480 = call i64 @getAddr(i8* %479)
  %481 = load i32, i32* %i, align 4
  %idxprom108 = sext i32 %481 to i64
  %arrayidx109 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %478, i64 %idxprom108
  %mean110 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx109, i32 0, i32 1
  %482 = bitcast float*** %mean110 to i8*
  %483 = call i64 @getAddr(i8* %482)
  %484 = load float**, float*** %mean110, align 8
  %485 = bitcast i32* %k to i8*
  %486 = call i64 @getAddr(i8* %485)
  %487 = load i32, i32* %k, align 4
  %idxprom111 = sext i32 %487 to i64
  %arrayidx112 = getelementptr inbounds float*, float** %484, i64 %idxprom111
  %488 = bitcast float** %arrayidx112 to i8*
  %489 = call i64 @getAddr(i8* %488)
  %490 = bitcast float* %472 to i8*
  %491 = call i64 @getAddr(i8* %490)
  call void @setRealTemp(i64 %489, i64 %491)
  store float* %472, float** %arrayidx112, align 8
  %492 = bitcast i32* %blk to i8*
  %493 = call i64 @getAddr(i8* %492)
  %494 = load i32, i32* %blk, align 4
  %495 = bitcast float** %buf to i8*
  %496 = call i64 @getAddr(i8* %495)
  %497 = load float*, float** %buf, align 8
  %idx.ext = sext i32 %494 to i64
  %add.ptr = getelementptr inbounds float, float* %497, i64 %idx.ext
  %498 = bitcast float** %buf to i8*
  %499 = call i64 @getAddr(i8* %498)
  %500 = bitcast float* %add.ptr to i8*
  %501 = call i64 @getAddr(i8* %500)
  call void @setRealTemp(i64 %499, i64 %501)
  store float* %add.ptr, float** %buf, align 8
  br label %for.inc113

for.inc113:                                       ; preds = %for.body106
  %502 = bitcast i32* %k to i8*
  %503 = call i64 @getAddr(i8* %502)
  %504 = load i32, i32* %k, align 4
  %inc114 = add nsw i32 %504, 1
  %505 = bitcast i32* %k to i8*
  store i32 %inc114, i32* %k, align 4
  br label %for.cond103

for.end115:                                       ; preds = %for.cond103
  %506 = bitcast i32* %n_density to i8*
  %507 = call i64 @getAddr(i8* %506)
  %508 = load i32, i32* %n_density, align 4
  %509 = bitcast float*** %pbuf to i8*
  %510 = call i64 @getAddr(i8* %509)
  %511 = load float**, float*** %pbuf, align 8
  %idx.ext116 = sext i32 %508 to i64
  %add.ptr117 = getelementptr inbounds float*, float** %511, i64 %idx.ext116
  %512 = bitcast float*** %pbuf to i8*
  %513 = call i64 @getAddr(i8* %512)
  %514 = bitcast float** %add.ptr117 to i8*
  %515 = call i64 @getAddr(i8* %514)
  call void @setRealTemp(i64 %513, i64 %515)
  store float** %add.ptr117, float*** %pbuf, align 8
  br label %for.inc118

for.inc118:                                       ; preds = %for.end115
  %516 = bitcast i32* %i to i8*
  %517 = call i64 @getAddr(i8* %516)
  %518 = load i32, i32* %i, align 4
  %inc119 = add nsw i32 %518, 1
  %519 = bitcast i32* %i to i8*
  store i32 %inc119, i32* %i, align 4
  br label %for.cond93

for.end120:                                       ; preds = %for.cond93
  %520 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %521 = call i64 @getAddr(i8* %520)
  %522 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau121 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %522, i32 0, i32 3
  %523 = bitcast %struct.mgau_t** %mgau121 to i8*
  %524 = call i64 @getAddr(i8* %523)
  %525 = load %struct.mgau_t*, %struct.mgau_t** %mgau121, align 8
  %arrayidx122 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %525, i64 0
  %mean123 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx122, i32 0, i32 1
  %526 = bitcast float*** %mean123 to i8*
  %527 = call i64 @getAddr(i8* %526)
  %528 = load float**, float*** %mean123, align 8
  %arrayidx124 = getelementptr inbounds float*, float** %528, i64 0
  %529 = bitcast float** %arrayidx124 to i8*
  %530 = call i64 @getAddr(i8* %529)
  %531 = load float*, float** %arrayidx124, align 8
  %532 = bitcast float** %buf to i8*
  %533 = call i64 @getAddr(i8* %532)
  %534 = bitcast float* %531 to i8*
  %535 = call i64 @getAddr(i8* %534)
  call void @setRealTemp(i64 %533, i64 %535)
  store float* %531, float** %buf, align 8
  br label %if.end209

if.else125:                                       ; preds = %if.end80
  %536 = bitcast i32* %type.addr to i8*
  %537 = call i64 @getAddr(i8* %536)
  %538 = load i32, i32* %type.addr, align 4
  %cmp126 = icmp eq i32 %538, 2
  br i1 %cmp126, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else125
  br label %cond.end

cond.false:                                       ; preds = %if.else125
  call void @__assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.31, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 195, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__PRETTY_FUNCTION__.mgau_file_read, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %539, %cond.true
  %540 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %541 = call i64 @getAddr(i8* %540)
  %542 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %n_mgau128 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %542, i32 0, i32 0
  %543 = bitcast i32* %n_mgau128 to i8*
  %544 = call i64 @getAddr(i8* %543)
  %545 = load i32, i32* %n_mgau128, align 8
  %546 = bitcast i32* %n_mgau to i8*
  %547 = call i64 @getAddr(i8* %546)
  %548 = load i32, i32* %n_mgau, align 4
  %cmp129 = icmp ne i32 %545, %548
  br i1 %cmp129, label %if.then131, label %if.end133

if.then131:                                       ; preds = %cond.end
  %549 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %550 = call i64 @getAddr(i8* %549)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 198, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %551 = bitcast i32* %n_mgau to i8*
  %552 = call i64 @getAddr(i8* %551)
  %553 = load i32, i32* %n_mgau, align 4
  %554 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %555 = call i64 @getAddr(i8* %554)
  %556 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %n_mgau132 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %556, i32 0, i32 0
  %557 = bitcast i32* %n_mgau132 to i8*
  %558 = call i64 @getAddr(i8* %557)
  %559 = load i32, i32* %n_mgau132, align 8
  %560 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %561 = call i64 @getAddr(i8* %560)
  call void @addFunArg(i32 1, i64 %561, i64 %552)
  call void @addFunArg(i32 2, i64 %561, i64 %558)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.32, i32 0, i32 0), i32 %553, i32 %559)
  br label %if.end133

if.end133:                                        ; preds = %if.then131, %cond.end
  %562 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %563 = call i64 @getAddr(i8* %562)
  %564 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %max_comp134 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %564, i32 0, i32 1
  %565 = bitcast i32* %max_comp134 to i8*
  %566 = call i64 @getAddr(i8* %565)
  %567 = load i32, i32* %max_comp134, align 4
  %568 = bitcast i32* %n_density to i8*
  %569 = call i64 @getAddr(i8* %568)
  %570 = load i32, i32* %n_density, align 4
  %cmp135 = icmp ne i32 %567, %570
  br i1 %cmp135, label %if.then137, label %if.end139

if.then137:                                       ; preds = %if.end133
  %571 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %572 = call i64 @getAddr(i8* %571)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 200, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %573 = bitcast i32* %n_density to i8*
  %574 = call i64 @getAddr(i8* %573)
  %575 = load i32, i32* %n_density, align 4
  %576 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %577 = call i64 @getAddr(i8* %576)
  %578 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %max_comp138 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %578, i32 0, i32 1
  %579 = bitcast i32* %max_comp138 to i8*
  %580 = call i64 @getAddr(i8* %579)
  %581 = load i32, i32* %max_comp138, align 4
  %582 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %583 = call i64 @getAddr(i8* %582)
  call void @addFunArg(i32 1, i64 %583, i64 %574)
  call void @addFunArg(i32 2, i64 %583, i64 %580)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.33, i32 0, i32 0), i32 %575, i32 %581)
  br label %if.end139

if.end139:                                        ; preds = %if.then137, %if.end133
  %584 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %585 = call i64 @getAddr(i8* %584)
  %586 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %veclen140 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %586, i32 0, i32 2
  %587 = bitcast i32* %veclen140 to i8*
  %588 = call i64 @getAddr(i8* %587)
  %589 = load i32, i32* %veclen140, align 8
  %590 = bitcast i32* %blk to i8*
  %591 = call i64 @getAddr(i8* %590)
  %592 = load i32, i32* %blk, align 4
  %cmp141 = icmp ne i32 %589, %592
  br i1 %cmp141, label %if.then143, label %if.end145

if.then143:                                       ; preds = %if.end139
  %593 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %594 = call i64 @getAddr(i8* %593)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 202, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %595 = bitcast i32* %blk to i8*
  %596 = call i64 @getAddr(i8* %595)
  %597 = load i32, i32* %blk, align 4
  %598 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %599 = call i64 @getAddr(i8* %598)
  %600 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %veclen144 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %600, i32 0, i32 2
  %601 = bitcast i32* %veclen144 to i8*
  %602 = call i64 @getAddr(i8* %601)
  %603 = load i32, i32* %veclen144, align 8
  %604 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %605 = call i64 @getAddr(i8* %604)
  call void @addFunArg(i32 1, i64 %605, i64 %596)
  call void @addFunArg(i32 2, i64 %605, i64 %602)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.34, i32 0, i32 0), i32 %597, i32 %603)
  br label %if.end145

if.end145:                                        ; preds = %if.then143, %if.end139
  %606 = bitcast i32* %n to i8*
  %607 = call i64 @getAddr(i8* %606)
  %608 = load i32, i32* %n, align 4
  %conv146 = sext i32 %608 to i64
  %609 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %610 = call i64 @getAddr(i8* %609)
  %call147 = call i8* @__ckd_calloc__(i64 %conv146, i64 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 204)
  %611 = bitcast i8* %call147 to float*
  %612 = bitcast float** %buf to i8*
  %613 = call i64 @getAddr(i8* %612)
  %614 = bitcast float* %611 to i8*
  %615 = call i64 @getAddr(i8* %614)
  call void @setRealTemp(i64 %613, i64 %615)
  store float* %611, float** %buf, align 8
  %616 = bitcast i32* %n_mgau to i8*
  %617 = call i64 @getAddr(i8* %616)
  %618 = load i32, i32* %n_mgau, align 4
  %619 = bitcast i32* %n_density to i8*
  %620 = call i64 @getAddr(i8* %619)
  %621 = load i32, i32* %n_density, align 4
  %mul148 = mul nsw i32 %618, %621
  %conv149 = sext i32 %mul148 to i64
  %622 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %623 = call i64 @getAddr(i8* %622)
  %call150 = call i8* @__ckd_calloc__(i64 %conv149, i64 8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 205)
  %624 = bitcast i8* %call150 to float**
  %625 = bitcast float*** %pbuf to i8*
  %626 = call i64 @getAddr(i8* %625)
  %627 = bitcast float** %624 to i8*
  %628 = call i64 @getAddr(i8* %627)
  call void @setRealTemp(i64 %626, i64 %628)
  store float** %624, float*** %pbuf, align 8
  %629 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond151

for.cond151:                                      ; preds = %for.inc187, %if.end145
  %630 = bitcast i32* %i to i8*
  %631 = call i64 @getAddr(i8* %630)
  %632 = load i32, i32* %i, align 4
  %633 = bitcast i32* %n_mgau to i8*
  %634 = call i64 @getAddr(i8* %633)
  %635 = load i32, i32* %n_mgau, align 4
  %cmp152 = icmp slt i32 %632, %635
  br i1 %cmp152, label %for.body154, label %for.end189

for.body154:                                      ; preds = %for.cond151
  %636 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %637 = call i64 @getAddr(i8* %636)
  %638 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau155 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %638, i32 0, i32 3
  %639 = bitcast %struct.mgau_t** %mgau155 to i8*
  %640 = call i64 @getAddr(i8* %639)
  %641 = load %struct.mgau_t*, %struct.mgau_t** %mgau155, align 8
  %642 = bitcast i32* %i to i8*
  %643 = call i64 @getAddr(i8* %642)
  %644 = load i32, i32* %i, align 4
  %idxprom156 = sext i32 %644 to i64
  %arrayidx157 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %641, i64 %idxprom156
  %n_comp158 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx157, i32 0, i32 0
  %645 = bitcast i32* %n_comp158 to i8*
  %646 = call i64 @getAddr(i8* %645)
  %647 = load i32, i32* %n_comp158, align 8
  %648 = bitcast i32* %n_density to i8*
  %649 = call i64 @getAddr(i8* %648)
  %650 = load i32, i32* %n_density, align 4
  %cmp159 = icmp ne i32 %647, %650
  br i1 %cmp159, label %if.then161, label %if.end166

if.then161:                                       ; preds = %for.body154
  %651 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %652 = call i64 @getAddr(i8* %651)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 210, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %653 = bitcast i32* %i to i8*
  %654 = call i64 @getAddr(i8* %653)
  %655 = load i32, i32* %i, align 4
  %656 = bitcast i32* %n_density to i8*
  %657 = call i64 @getAddr(i8* %656)
  %658 = load i32, i32* %n_density, align 4
  %659 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %660 = call i64 @getAddr(i8* %659)
  %661 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau162 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %661, i32 0, i32 3
  %662 = bitcast %struct.mgau_t** %mgau162 to i8*
  %663 = call i64 @getAddr(i8* %662)
  %664 = load %struct.mgau_t*, %struct.mgau_t** %mgau162, align 8
  %665 = bitcast i32* %i to i8*
  %666 = call i64 @getAddr(i8* %665)
  %667 = load i32, i32* %i, align 4
  %idxprom163 = sext i32 %667 to i64
  %arrayidx164 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %664, i64 %idxprom163
  %n_comp165 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx164, i32 0, i32 0
  %668 = bitcast i32* %n_comp165 to i8*
  %669 = call i64 @getAddr(i8* %668)
  %670 = load i32, i32* %n_comp165, align 8
  %671 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %672 = call i64 @getAddr(i8* %671)
  call void @addFunArg(i32 1, i64 %672, i64 %654)
  call void @addFunArg(i32 2, i64 %672, i64 %657)
  call void @addFunArg(i32 3, i64 %672, i64 %669)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.35, i32 0, i32 0), i32 %655, i32 %658, i32 %670)
  br label %if.end166

if.end166:                                        ; preds = %if.then161, %for.body154
  %673 = bitcast float*** %pbuf to i8*
  %674 = call i64 @getAddr(i8* %673)
  %675 = load float**, float*** %pbuf, align 8
  %676 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %677 = call i64 @getAddr(i8* %676)
  %678 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau167 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %678, i32 0, i32 3
  %679 = bitcast %struct.mgau_t** %mgau167 to i8*
  %680 = call i64 @getAddr(i8* %679)
  %681 = load %struct.mgau_t*, %struct.mgau_t** %mgau167, align 8
  %682 = bitcast i32* %i to i8*
  %683 = call i64 @getAddr(i8* %682)
  %684 = load i32, i32* %i, align 4
  %idxprom168 = sext i32 %684 to i64
  %arrayidx169 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %681, i64 %idxprom168
  %var = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx169, i32 0, i32 2
  %685 = bitcast float*** %var to i8*
  %686 = call i64 @getAddr(i8* %685)
  %687 = bitcast float** %675 to i8*
  %688 = call i64 @getAddr(i8* %687)
  call void @setRealTemp(i64 %686, i64 %688)
  store float** %675, float*** %var, align 8
  %689 = bitcast i32* %k to i8*
  store i32 0, i32* %k, align 4
  br label %for.cond170

for.cond170:                                      ; preds = %for.inc182, %if.end166
  %690 = bitcast i32* %k to i8*
  %691 = call i64 @getAddr(i8* %690)
  %692 = load i32, i32* %k, align 4
  %693 = bitcast i32* %n_density to i8*
  %694 = call i64 @getAddr(i8* %693)
  %695 = load i32, i32* %n_density, align 4
  %cmp171 = icmp slt i32 %692, %695
  br i1 %cmp171, label %for.body173, label %for.end184

for.body173:                                      ; preds = %for.cond170
  %696 = bitcast float** %buf to i8*
  %697 = call i64 @getAddr(i8* %696)
  %698 = load float*, float** %buf, align 8
  %699 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %700 = call i64 @getAddr(i8* %699)
  %701 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau174 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %701, i32 0, i32 3
  %702 = bitcast %struct.mgau_t** %mgau174 to i8*
  %703 = call i64 @getAddr(i8* %702)
  %704 = load %struct.mgau_t*, %struct.mgau_t** %mgau174, align 8
  %705 = bitcast i32* %i to i8*
  %706 = call i64 @getAddr(i8* %705)
  %707 = load i32, i32* %i, align 4
  %idxprom175 = sext i32 %707 to i64
  %arrayidx176 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %704, i64 %idxprom175
  %var177 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx176, i32 0, i32 2
  %708 = bitcast float*** %var177 to i8*
  %709 = call i64 @getAddr(i8* %708)
  %710 = load float**, float*** %var177, align 8
  %711 = bitcast i32* %k to i8*
  %712 = call i64 @getAddr(i8* %711)
  %713 = load i32, i32* %k, align 4
  %idxprom178 = sext i32 %713 to i64
  %arrayidx179 = getelementptr inbounds float*, float** %710, i64 %idxprom178
  %714 = bitcast float** %arrayidx179 to i8*
  %715 = call i64 @getAddr(i8* %714)
  %716 = bitcast float* %698 to i8*
  %717 = call i64 @getAddr(i8* %716)
  call void @setRealTemp(i64 %715, i64 %717)
  store float* %698, float** %arrayidx179, align 8
  %718 = bitcast i32* %blk to i8*
  %719 = call i64 @getAddr(i8* %718)
  %720 = load i32, i32* %blk, align 4
  %721 = bitcast float** %buf to i8*
  %722 = call i64 @getAddr(i8* %721)
  %723 = load float*, float** %buf, align 8
  %idx.ext180 = sext i32 %720 to i64
  %add.ptr181 = getelementptr inbounds float, float* %723, i64 %idx.ext180
  %724 = bitcast float** %buf to i8*
  %725 = call i64 @getAddr(i8* %724)
  %726 = bitcast float* %add.ptr181 to i8*
  %727 = call i64 @getAddr(i8* %726)
  call void @setRealTemp(i64 %725, i64 %727)
  store float* %add.ptr181, float** %buf, align 8
  br label %for.inc182

for.inc182:                                       ; preds = %for.body173
  %728 = bitcast i32* %k to i8*
  %729 = call i64 @getAddr(i8* %728)
  %730 = load i32, i32* %k, align 4
  %inc183 = add nsw i32 %730, 1
  %731 = bitcast i32* %k to i8*
  store i32 %inc183, i32* %k, align 4
  br label %for.cond170

for.end184:                                       ; preds = %for.cond170
  %732 = bitcast i32* %n_density to i8*
  %733 = call i64 @getAddr(i8* %732)
  %734 = load i32, i32* %n_density, align 4
  %735 = bitcast float*** %pbuf to i8*
  %736 = call i64 @getAddr(i8* %735)
  %737 = load float**, float*** %pbuf, align 8
  %idx.ext185 = sext i32 %734 to i64
  %add.ptr186 = getelementptr inbounds float*, float** %737, i64 %idx.ext185
  %738 = bitcast float*** %pbuf to i8*
  %739 = call i64 @getAddr(i8* %738)
  %740 = bitcast float** %add.ptr186 to i8*
  %741 = call i64 @getAddr(i8* %740)
  call void @setRealTemp(i64 %739, i64 %741)
  store float** %add.ptr186, float*** %pbuf, align 8
  br label %for.inc187

for.inc187:                                       ; preds = %for.end184
  %742 = bitcast i32* %i to i8*
  %743 = call i64 @getAddr(i8* %742)
  %744 = load i32, i32* %i, align 4
  %inc188 = add nsw i32 %744, 1
  %745 = bitcast i32* %i to i8*
  store i32 %inc188, i32* %i, align 4
  br label %for.cond151

for.end189:                                       ; preds = %for.cond151
  %746 = bitcast i32* %n_mgau to i8*
  %747 = call i64 @getAddr(i8* %746)
  %748 = load i32, i32* %n_mgau, align 4
  %749 = bitcast i32* %n_density to i8*
  %750 = call i64 @getAddr(i8* %749)
  %751 = load i32, i32* %n_density, align 4
  %mul190 = mul nsw i32 %748, %751
  %conv191 = sext i32 %mul190 to i64
  %752 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %753 = call i64 @getAddr(i8* %752)
  %call192 = call i8* @__ckd_calloc__(i64 %conv191, i64 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 224)
  %754 = bitcast i8* %call192 to float*
  %755 = bitcast float** %buf to i8*
  %756 = call i64 @getAddr(i8* %755)
  %757 = bitcast float* %754 to i8*
  %758 = call i64 @getAddr(i8* %757)
  call void @setRealTemp(i64 %756, i64 %758)
  store float* %754, float** %buf, align 8
  %759 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond193

for.cond193:                                      ; preds = %for.inc202, %for.end189
  %760 = bitcast i32* %i to i8*
  %761 = call i64 @getAddr(i8* %760)
  %762 = load i32, i32* %i, align 4
  %763 = bitcast i32* %n_mgau to i8*
  %764 = call i64 @getAddr(i8* %763)
  %765 = load i32, i32* %n_mgau, align 4
  %cmp194 = icmp slt i32 %762, %765
  br i1 %cmp194, label %for.body196, label %for.end204

for.body196:                                      ; preds = %for.cond193
  %766 = bitcast float** %buf to i8*
  %767 = call i64 @getAddr(i8* %766)
  %768 = load float*, float** %buf, align 8
  %769 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %770 = call i64 @getAddr(i8* %769)
  %771 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau197 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %771, i32 0, i32 3
  %772 = bitcast %struct.mgau_t** %mgau197 to i8*
  %773 = call i64 @getAddr(i8* %772)
  %774 = load %struct.mgau_t*, %struct.mgau_t** %mgau197, align 8
  %775 = bitcast i32* %i to i8*
  %776 = call i64 @getAddr(i8* %775)
  %777 = load i32, i32* %i, align 4
  %idxprom198 = sext i32 %777 to i64
  %arrayidx199 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %774, i64 %idxprom198
  %lrd = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx199, i32 0, i32 3
  %778 = bitcast float** %lrd to i8*
  %779 = call i64 @getAddr(i8* %778)
  %780 = bitcast float* %768 to i8*
  %781 = call i64 @getAddr(i8* %780)
  call void @setRealTemp(i64 %779, i64 %781)
  store float* %768, float** %lrd, align 8
  %782 = bitcast i32* %n_density to i8*
  %783 = call i64 @getAddr(i8* %782)
  %784 = load i32, i32* %n_density, align 4
  %785 = bitcast float** %buf to i8*
  %786 = call i64 @getAddr(i8* %785)
  %787 = load float*, float** %buf, align 8
  %idx.ext200 = sext i32 %784 to i64
  %add.ptr201 = getelementptr inbounds float, float* %787, i64 %idx.ext200
  %788 = bitcast float** %buf to i8*
  %789 = call i64 @getAddr(i8* %788)
  %790 = bitcast float* %add.ptr201 to i8*
  %791 = call i64 @getAddr(i8* %790)
  call void @setRealTemp(i64 %789, i64 %791)
  store float* %add.ptr201, float** %buf, align 8
  br label %for.inc202

for.inc202:                                       ; preds = %for.body196
  %792 = bitcast i32* %i to i8*
  %793 = call i64 @getAddr(i8* %792)
  %794 = load i32, i32* %i, align 4
  %inc203 = add nsw i32 %794, 1
  %795 = bitcast i32* %i to i8*
  store i32 %inc203, i32* %i, align 4
  br label %for.cond193

for.end204:                                       ; preds = %for.cond193
  %796 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %797 = call i64 @getAddr(i8* %796)
  %798 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau205 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %798, i32 0, i32 3
  %799 = bitcast %struct.mgau_t** %mgau205 to i8*
  %800 = call i64 @getAddr(i8* %799)
  %801 = load %struct.mgau_t*, %struct.mgau_t** %mgau205, align 8
  %arrayidx206 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %801, i64 0
  %var207 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx206, i32 0, i32 2
  %802 = bitcast float*** %var207 to i8*
  %803 = call i64 @getAddr(i8* %802)
  %804 = load float**, float*** %var207, align 8
  %arrayidx208 = getelementptr inbounds float*, float** %804, i64 0
  %805 = bitcast float** %arrayidx208 to i8*
  %806 = call i64 @getAddr(i8* %805)
  %807 = load float*, float** %arrayidx208, align 8
  %808 = bitcast float** %buf to i8*
  %809 = call i64 @getAddr(i8* %808)
  %810 = bitcast float* %807 to i8*
  %811 = call i64 @getAddr(i8* %810)
  call void @setRealTemp(i64 %809, i64 %811)
  store float* %807, float** %buf, align 8
  br label %if.end209

if.end209:                                        ; preds = %for.end204, %for.end120
  %812 = bitcast float** %buf to i8*
  %813 = call i64 @getAddr(i8* %812)
  %814 = load float*, float** %buf, align 8
  %815 = bitcast float* %814 to i8*
  %816 = bitcast i32* %n to i8*
  %817 = call i64 @getAddr(i8* %816)
  %818 = load i32, i32* %n, align 4
  %819 = bitcast %struct._IO_FILE** %fp to i8*
  %820 = call i64 @getAddr(i8* %819)
  %821 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %822 = bitcast i32* %byteswap to i8*
  %823 = call i64 @getAddr(i8* %822)
  %824 = load i32, i32* %byteswap, align 4
  %825 = bitcast i32 (i8*, i32, i32, %struct._IO_FILE*, i32, i32*)* @bio_fread to i8*
  %826 = call i64 @getAddr(i8* %825)
  call void @addFunArg(i32 2, i64 %826, i64 %817)
  call void @addFunArg(i32 4, i64 %826, i64 %823)
  %call210 = call i32 @bio_fread(i8* %815, i32 4, i32 %818, %struct._IO_FILE* %821, i32 %824, i32* %chksum)
  %827 = bitcast i32* %n to i8*
  %828 = call i64 @getAddr(i8* %827)
  %829 = load i32, i32* %n, align 4
  %cmp211 = icmp ne i32 %call210, %829
  br i1 %cmp211, label %if.then213, label %if.end214

if.then213:                                       ; preds = %if.end209
  %830 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %831 = call i64 @getAddr(i8* %830)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 236, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %832 = bitcast i8** %file_name.addr to i8*
  %833 = call i64 @getAddr(i8* %832)
  %834 = load i8*, i8** %file_name.addr, align 8
  %835 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %836 = call i64 @getAddr(i8* %835)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.36, i32 0, i32 0), i8* %834)
  br label %if.end214

if.end214:                                        ; preds = %if.then213, %if.end209
  %837 = bitcast double ()* @log_to_logs3_factor to i8*
  %838 = call i64 @getAddr(i8* %837)
  %call215 = call double @log_to_logs3_factor()
  %839 = bitcast double* %f to i8*
  %840 = call i64 @getAddr(i8* %839)
  call void @setRealReturn(i64 %840)
  store double %call215, double* %f, align 8
  %841 = bitcast i32* %chksum_present to i8*
  %842 = call i64 @getAddr(i8* %841)
  %843 = load i32, i32* %chksum_present, align 4
  %tobool216 = icmp ne i32 %843, 0
  br i1 %tobool216, label %if.then217, label %if.end218

if.then217:                                       ; preds = %if.end214
  %844 = bitcast %struct._IO_FILE** %fp to i8*
  %845 = call i64 @getAddr(i8* %844)
  %846 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %847 = bitcast i32* %byteswap to i8*
  %848 = call i64 @getAddr(i8* %847)
  %849 = load i32, i32* %byteswap, align 4
  %850 = bitcast i32* %chksum to i8*
  %851 = call i64 @getAddr(i8* %850)
  %852 = load i32, i32* %chksum, align 4
  %853 = bitcast void (%struct._IO_FILE*, i32, i32)* @bio_verify_chksum to i8*
  %854 = call i64 @getAddr(i8* %853)
  call void @addFunArg(i32 1, i64 %854, i64 %848)
  call void @addFunArg(i32 2, i64 %854, i64 %851)
  call void @bio_verify_chksum(%struct._IO_FILE* %846, i32 %849, i32 %852)
  br label %if.end218

if.end218:                                        ; preds = %if.then217, %if.end214
  %855 = bitcast %struct._IO_FILE** %fp to i8*
  %856 = call i64 @getAddr(i8* %855)
  %857 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call219 = call i64 @fread(i8* %tmp, i64 1, i64 1, %struct._IO_FILE* %857)
  %cmp220 = icmp eq i64 %call219, 1
  br i1 %cmp220, label %if.then222, label %if.end223

if.then222:                                       ; preds = %if.end218
  %858 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %859 = call i64 @getAddr(i8* %858)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 244, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %860 = bitcast i8** %file_name.addr to i8*
  %861 = call i64 @getAddr(i8* %860)
  %862 = load i8*, i8** %file_name.addr, align 8
  %863 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %864 = call i64 @getAddr(i8* %863)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.37, i32 0, i32 0), i8* %862)
  br label %if.end223

if.end223:                                        ; preds = %if.then222, %if.end218
  %865 = bitcast %struct._IO_FILE** %fp to i8*
  %866 = call i64 @getAddr(i8* %865)
  %867 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call224 = call i32 @fclose(%struct._IO_FILE* %867)
  %868 = bitcast void (i8*, i64, i8*)* @_E__pr_info_header to i8*
  %869 = call i64 @getAddr(i8* %868)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 248, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  %870 = bitcast i32* %n_mgau to i8*
  %871 = call i64 @getAddr(i8* %870)
  %872 = load i32, i32* %n_mgau, align 4
  %873 = bitcast i32* %n_density to i8*
  %874 = call i64 @getAddr(i8* %873)
  %875 = load i32, i32* %n_density, align 4
  %876 = bitcast i32* %n_feat to i8*
  %877 = call i64 @getAddr(i8* %876)
  %878 = load i32, i32* %n_feat, align 4
  %879 = bitcast i32* %blk to i8*
  %880 = call i64 @getAddr(i8* %879)
  %881 = load i32, i32* %blk, align 4
  %882 = bitcast void (i8*, ...)* @_E__pr_info to i8*
  %883 = call i64 @getAddr(i8* %882)
  call void @addFunArg(i32 1, i64 %883, i64 %871)
  call void @addFunArg(i32 2, i64 %883, i64 %874)
  call void @addFunArg(i32 3, i64 %883, i64 %877)
  call void @addFunArg(i32 4, i64 %883, i64 %880)
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.38, i32 0, i32 0), i32 %872, i32 %875, i32 %878, i32 %881)
  %884 = bitcast i32 (%struct.mgau_model_t*, i8*, i32)* @mgau_file_read to i8*
  %885 = call i64 @getAddr(i8* %884)
  call void @funcExit(i64 %885)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @mgau_mixw_read(%struct.mgau_model_t* %g, i8* %file_name, double %mixwfloor) #0 {
entry:
  %0 = bitcast i32 (%struct.mgau_model_t*, i8*, double)* @mgau_mixw_read to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %g.addr = alloca %struct.mgau_model_t*, align 8
  %2 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %file_name.addr = alloca i8*, align 8
  %4 = bitcast i8** %file_name.addr to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @handleAlloca(i64 %5)
  %mixwfloor.addr = alloca double, align 8
  %6 = bitcast double* %mixwfloor.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @handleAlloca(i64 %7)
  %argname = alloca i8**, align 8
  %8 = bitcast i8*** %argname to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @handleAlloca(i64 %9)
  %argval = alloca i8**, align 8
  %10 = bitcast i8*** %argval to i8*
  %11 = call i64 @getAddr(i8* %10)
  call void @handleAlloca(i64 %11)
  %eofchk = alloca i8, align 1
  %12 = bitcast i8* %eofchk to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @handleAlloca(i64 %13)
  %fp = alloca %struct._IO_FILE*, align 8
  %14 = bitcast %struct._IO_FILE** %fp to i8*
  %15 = call i64 @getAddr(i8* %14)
  call void @handleAlloca(i64 %15)
  %byteswap = alloca i32, align 4
  %16 = bitcast i32* %byteswap to i8*
  %17 = call i64 @getAddr(i8* %16)
  call void @handleAlloca(i64 %17)
  %chksum_present = alloca i32, align 4
  %18 = bitcast i32* %chksum_present to i8*
  %19 = call i64 @getAddr(i8* %18)
  call void @handleAlloca(i64 %19)
  %chksum = alloca i32, align 4
  %20 = bitcast i32* %chksum to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void @handleAlloca(i64 %21)
  %buf = alloca i32*, align 8
  %22 = bitcast i32** %buf to i8*
  %23 = call i64 @getAddr(i8* %22)
  call void @handleAlloca(i64 %23)
  %pdf = alloca float*, align 8
  %24 = bitcast float** %pdf to i8*
  %25 = call i64 @getAddr(i8* %24)
  call void @handleAlloca(i64 %25)
  %i = alloca i32, align 4
  %26 = bitcast i32* %i to i8*
  %27 = call i64 @getAddr(i8* %26)
  call void @handleAlloca(i64 %27)
  %j = alloca i32, align 4
  %28 = bitcast i32* %j to i8*
  %29 = call i64 @getAddr(i8* %28)
  call void @handleAlloca(i64 %29)
  %n = alloca i32, align 4
  %30 = bitcast i32* %n to i8*
  %31 = call i64 @getAddr(i8* %30)
  call void @handleAlloca(i64 %31)
  %n_mgau = alloca i32, align 4
  %32 = bitcast i32* %n_mgau to i8*
  %33 = call i64 @getAddr(i8* %32)
  call void @handleAlloca(i64 %33)
  %n_feat = alloca i32, align 4
  %34 = bitcast i32* %n_feat to i8*
  %35 = call i64 @getAddr(i8* %34)
  call void @handleAlloca(i64 %35)
  %n_comp = alloca i32, align 4
  %36 = bitcast i32* %n_comp to i8*
  %37 = call i64 @getAddr(i8* %36)
  call void @handleAlloca(i64 %37)
  %n_err = alloca i32, align 4
  %38 = bitcast i32* %n_err to i8*
  %39 = call i64 @getAddr(i8* %38)
  call void @handleAlloca(i64 %39)
  %40 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %41 = call i64 @getAddr(i8* %40)
  %42 = bitcast %struct.mgau_model_t* %g to i8*
  %43 = call i64 @getAddr(i8* %42)
  call void @setRealTemp(i64 %41, i64 %43)
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %g.addr, align 8
  %44 = bitcast i8** %file_name.addr to i8*
  %45 = call i64 @getAddr(i8* %44)
  %46 = bitcast i8* %file_name to i8*
  %47 = call i64 @getAddr(i8* %46)
  call void @setRealTemp(i64 %45, i64 %47)
  store i8* %file_name, i8** %file_name.addr, align 8
  %48 = bitcast double* %mixwfloor.addr to i8*
  %49 = call i64 @getAddr(i8* %48)
  %50 = bitcast i32 (%struct.mgau_model_t*, i8*, double)* @mgau_mixw_read to i8*
  %51 = call i64 @getAddr(i8* %50)
  call void @setRealFunArg(i32 14, i64 %51, i64 %49, double %mixwfloor)
  store double %mixwfloor, double* %mixwfloor.addr, align 8
  %52 = bitcast void (i8*, i64, i8*)* @_E__pr_info_header to i8*
  %53 = call i64 @getAddr(i8* %52)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 269, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  %54 = bitcast i8** %file_name.addr to i8*
  %55 = call i64 @getAddr(i8* %54)
  %56 = load i8*, i8** %file_name.addr, align 8
  %57 = bitcast void (i8*, ...)* @_E__pr_info to i8*
  %58 = call i64 @getAddr(i8* %57)
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.39, i32 0, i32 0), i8* %56)
  %59 = bitcast i8** %file_name.addr to i8*
  %60 = call i64 @getAddr(i8* %59)
  %61 = load i8*, i8** %file_name.addr, align 8
  %62 = bitcast %struct._IO_FILE* (i8*, i8*, i8*, i32)* @_myfopen to i8*
  %63 = call i64 @getAddr(i8* %62)
  %call = call %struct._IO_FILE* @_myfopen(i8* %61, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 271)
  %64 = bitcast %struct._IO_FILE** %fp to i8*
  %65 = call i64 @getAddr(i8* %64)
  %66 = bitcast %struct._IO_FILE* %call to i8*
  %67 = call i64 @getAddr(i8* %66)
  call void @setRealTemp(i64 %65, i64 %67)
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8
  %68 = bitcast %struct._IO_FILE** %fp to i8*
  %69 = call i64 @getAddr(i8* %68)
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %71 = bitcast i32 (%struct._IO_FILE*, i8***, i8***, i32*)* @bio_readhdr to i8*
  %72 = call i64 @getAddr(i8* %71)
  %call1 = call i32 @bio_readhdr(%struct._IO_FILE* %70, i8*** %argname, i8*** %argval, i32* %byteswap)
  %cmp = icmp slt i32 %call1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %73 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %74 = call i64 @getAddr(i8* %73)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 275, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %75 = bitcast i8** %file_name.addr to i8*
  %76 = call i64 @getAddr(i8* %75)
  %77 = load i8*, i8** %file_name.addr, align 8
  %78 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %79 = call i64 @getAddr(i8* %78)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.15, i32 0, i32 0), i8* %77)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %80 = bitcast i32* %chksum_present to i8*
  store i32 0, i32* %chksum_present, align 4
  %81 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %82 = bitcast i8*** %argname to i8*
  %83 = call i64 @getAddr(i8* %82)
  %84 = load i8**, i8*** %argname, align 8
  %85 = bitcast i32* %i to i8*
  %86 = call i64 @getAddr(i8* %85)
  %87 = load i32, i32* %i, align 4
  %idxprom = sext i32 %87 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %84, i64 %idxprom
  %88 = bitcast i8** %arrayidx to i8*
  %89 = call i64 @getAddr(i8* %88)
  %90 = load i8*, i8** %arrayidx, align 8
  %tobool = icmp ne i8* %90, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %91 = bitcast i8*** %argname to i8*
  %92 = call i64 @getAddr(i8* %91)
  %93 = load i8**, i8*** %argname, align 8
  %94 = bitcast i32* %i to i8*
  %95 = call i64 @getAddr(i8* %94)
  %96 = load i32, i32* %i, align 4
  %idxprom2 = sext i32 %96 to i64
  %arrayidx3 = getelementptr inbounds i8*, i8** %93, i64 %idxprom2
  %97 = bitcast i8** %arrayidx3 to i8*
  %98 = call i64 @getAddr(i8* %97)
  %99 = load i8*, i8** %arrayidx3, align 8
  %call4 = call i32 @strcmp(i8* %99, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.16, i32 0, i32 0)) #7
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %for.body
  %100 = bitcast i8*** %argval to i8*
  %101 = call i64 @getAddr(i8* %100)
  %102 = load i8**, i8*** %argval, align 8
  %103 = bitcast i32* %i to i8*
  %104 = call i64 @getAddr(i8* %103)
  %105 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %105 to i64
  %arrayidx8 = getelementptr inbounds i8*, i8** %102, i64 %idxprom7
  %106 = bitcast i8** %arrayidx8 to i8*
  %107 = call i64 @getAddr(i8* %106)
  %108 = load i8*, i8** %arrayidx8, align 8
  %call9 = call i32 @strcmp(i8* %108, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.17, i32 0, i32 0)) #7
  %cmp10 = icmp ne i32 %call9, 0
  br i1 %cmp10, label %if.then11, label %if.end14

if.then11:                                        ; preds = %if.then6
  %109 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %110 = call i64 @getAddr(i8* %109)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 282, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.18, i32 0, i32 0))
  %111 = bitcast i8** %file_name.addr to i8*
  %112 = call i64 @getAddr(i8* %111)
  %113 = load i8*, i8** %file_name.addr, align 8
  %114 = bitcast i8*** %argval to i8*
  %115 = call i64 @getAddr(i8* %114)
  %116 = load i8**, i8*** %argval, align 8
  %117 = bitcast i32* %i to i8*
  %118 = call i64 @getAddr(i8* %117)
  %119 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %119 to i64
  %arrayidx13 = getelementptr inbounds i8*, i8** %116, i64 %idxprom12
  %120 = bitcast i8** %arrayidx13 to i8*
  %121 = call i64 @getAddr(i8* %120)
  %122 = load i8*, i8** %arrayidx13, align 8
  %123 = bitcast void (i8*, ...)* @_E__pr_warn to i8*
  %124 = call i64 @getAddr(i8* %123)
  call void (i8*, ...) @_E__pr_warn(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.19, i32 0, i32 0), i8* %113, i8* %122, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.17, i32 0, i32 0))
  br label %if.end14

if.end14:                                         ; preds = %if.then11, %if.then6
  br label %if.end21

if.else:                                          ; preds = %for.body
  %125 = bitcast i8*** %argname to i8*
  %126 = call i64 @getAddr(i8* %125)
  %127 = load i8**, i8*** %argname, align 8
  %128 = bitcast i32* %i to i8*
  %129 = call i64 @getAddr(i8* %128)
  %130 = load i32, i32* %i, align 4
  %idxprom15 = sext i32 %130 to i64
  %arrayidx16 = getelementptr inbounds i8*, i8** %127, i64 %idxprom15
  %131 = bitcast i8** %arrayidx16 to i8*
  %132 = call i64 @getAddr(i8* %131)
  %133 = load i8*, i8** %arrayidx16, align 8
  %call17 = call i32 @strcmp(i8* %133, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.20, i32 0, i32 0)) #7
  %cmp18 = icmp eq i32 %call17, 0
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.else
  %134 = bitcast i32* %chksum_present to i8*
  store i32 1, i32* %chksum_present, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %if.else
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.end14
  br label %for.inc

for.inc:                                          ; preds = %if.end21
  %135 = bitcast i32* %i to i8*
  %136 = call i64 @getAddr(i8* %135)
  %137 = load i32, i32* %i, align 4
  %inc = add nsw i32 %137, 1
  %138 = bitcast i32* %i to i8*
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %139 = bitcast i8*** %argname to i8*
  %140 = call i64 @getAddr(i8* %139)
  %141 = load i8**, i8*** %argname, align 8
  %142 = bitcast i8*** %argval to i8*
  %143 = call i64 @getAddr(i8* %142)
  %144 = load i8**, i8*** %argval, align 8
  %145 = bitcast void (i8**, i8**)* @bio_hdrarg_free to i8*
  %146 = call i64 @getAddr(i8* %145)
  call void @bio_hdrarg_free(i8** %141, i8** %144)
  %147 = bitcast i8*** %argval to i8*
  %148 = call i64 @getAddr(i8* %147)
  %149 = bitcast i8** null to i8*
  %150 = call i64 @getAddr(i8* %149)
  call void @setRealTemp(i64 %148, i64 %150)
  store i8** null, i8*** %argval, align 8
  %151 = bitcast i8*** %argname to i8*
  %152 = call i64 @getAddr(i8* %151)
  %153 = bitcast i8** null to i8*
  %154 = call i64 @getAddr(i8* %153)
  call void @setRealTemp(i64 %152, i64 %154)
  store i8** null, i8*** %argname, align 8
  %155 = bitcast i32* %chksum to i8*
  store i32 0, i32* %chksum, align 4
  %156 = bitcast i32* %n_mgau to i8*
  %157 = bitcast %struct._IO_FILE** %fp to i8*
  %158 = call i64 @getAddr(i8* %157)
  %159 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %160 = bitcast i32* %byteswap to i8*
  %161 = call i64 @getAddr(i8* %160)
  %162 = load i32, i32* %byteswap, align 4
  %163 = bitcast i32 (i8*, i32, i32, %struct._IO_FILE*, i32, i32*)* @bio_fread to i8*
  %164 = call i64 @getAddr(i8* %163)
  call void @addFunArg(i32 4, i64 %164, i64 %161)
  %call22 = call i32 @bio_fread(i8* %156, i32 4, i32 1, %struct._IO_FILE* %159, i32 %162, i32* %chksum)
  %cmp23 = icmp ne i32 %call22, 1
  br i1 %cmp23, label %if.then32, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end
  %165 = bitcast i32* %n_feat to i8*
  %166 = bitcast %struct._IO_FILE** %fp to i8*
  %167 = call i64 @getAddr(i8* %166)
  %168 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %169 = bitcast i32* %byteswap to i8*
  %170 = call i64 @getAddr(i8* %169)
  %171 = load i32, i32* %byteswap, align 4
  %172 = bitcast i32 (i8*, i32, i32, %struct._IO_FILE*, i32, i32*)* @bio_fread to i8*
  %173 = call i64 @getAddr(i8* %172)
  call void @addFunArg(i32 4, i64 %173, i64 %170)
  %call24 = call i32 @bio_fread(i8* %165, i32 4, i32 1, %struct._IO_FILE* %168, i32 %171, i32* %chksum)
  %cmp25 = icmp ne i32 %call24, 1
  br i1 %cmp25, label %if.then32, label %lor.lhs.false26

lor.lhs.false26:                                  ; preds = %lor.lhs.false
  %174 = bitcast i32* %n_comp to i8*
  %175 = bitcast %struct._IO_FILE** %fp to i8*
  %176 = call i64 @getAddr(i8* %175)
  %177 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %178 = bitcast i32* %byteswap to i8*
  %179 = call i64 @getAddr(i8* %178)
  %180 = load i32, i32* %byteswap, align 4
  %181 = bitcast i32 (i8*, i32, i32, %struct._IO_FILE*, i32, i32*)* @bio_fread to i8*
  %182 = call i64 @getAddr(i8* %181)
  call void @addFunArg(i32 4, i64 %182, i64 %179)
  %call27 = call i32 @bio_fread(i8* %174, i32 4, i32 1, %struct._IO_FILE* %177, i32 %180, i32* %chksum)
  %cmp28 = icmp ne i32 %call27, 1
  br i1 %cmp28, label %if.then32, label %lor.lhs.false29

lor.lhs.false29:                                  ; preds = %lor.lhs.false26
  %183 = bitcast i32* %n to i8*
  %184 = bitcast %struct._IO_FILE** %fp to i8*
  %185 = call i64 @getAddr(i8* %184)
  %186 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %187 = bitcast i32* %byteswap to i8*
  %188 = call i64 @getAddr(i8* %187)
  %189 = load i32, i32* %byteswap, align 4
  %190 = bitcast i32 (i8*, i32, i32, %struct._IO_FILE*, i32, i32*)* @bio_fread to i8*
  %191 = call i64 @getAddr(i8* %190)
  call void @addFunArg(i32 4, i64 %191, i64 %188)
  %call30 = call i32 @bio_fread(i8* %183, i32 4, i32 1, %struct._IO_FILE* %186, i32 %189, i32* %chksum)
  %cmp31 = icmp ne i32 %call30, 1
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %lor.lhs.false29, %lor.lhs.false26, %lor.lhs.false, %for.end
  %192 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %193 = call i64 @getAddr(i8* %192)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 298, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %194 = bitcast i8** %file_name.addr to i8*
  %195 = call i64 @getAddr(i8* %194)
  %196 = load i8*, i8** %file_name.addr, align 8
  %197 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %198 = call i64 @getAddr(i8* %197)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.40, i32 0, i32 0), i8* %196)
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %lor.lhs.false29
  %199 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %200 = call i64 @getAddr(i8* %199)
  %201 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %gau_type = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %201, i32 0, i32 7
  %202 = bitcast i32* %gau_type to i8*
  %203 = call i64 @getAddr(i8* %202)
  %204 = load i32, i32* %gau_type, align 8
  %cmp34 = icmp eq i32 %204, 10001
  br i1 %cmp34, label %if.then35, label %if.else39

if.then35:                                        ; preds = %if.end33
  %205 = bitcast i32* %n_feat to i8*
  %206 = call i64 @getAddr(i8* %205)
  %207 = load i32, i32* %n_feat, align 4
  %cmp36 = icmp ne i32 %207, 1
  br i1 %cmp36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %if.then35
  %208 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %209 = call i64 @getAddr(i8* %208)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 302, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %210 = bitcast i32* %n_feat to i8*
  %211 = call i64 @getAddr(i8* %210)
  %212 = load i32, i32* %n_feat, align 4
  %213 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %214 = call i64 @getAddr(i8* %213)
  call void @addFunArg(i32 1, i64 %214, i64 %211)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.24, i32 0, i32 0), i32 %212)
  br label %if.end38

if.end38:                                         ; preds = %if.then37, %if.then35
  br label %if.end48

if.else39:                                        ; preds = %if.end33
  %215 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %216 = call i64 @getAddr(i8* %215)
  %217 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %gau_type40 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %217, i32 0, i32 7
  %218 = bitcast i32* %gau_type40 to i8*
  %219 = call i64 @getAddr(i8* %218)
  %220 = load i32, i32* %gau_type40, align 8
  %cmp41 = icmp eq i32 %220, 10002
  br i1 %cmp41, label %if.then42, label %if.else46

if.then42:                                        ; preds = %if.else39
  %221 = bitcast i32* %n_feat to i8*
  %222 = call i64 @getAddr(i8* %221)
  %223 = load i32, i32* %n_feat, align 4
  %cmp43 = icmp ne i32 %223, 4
  br i1 %cmp43, label %if.then44, label %if.end45

if.then44:                                        ; preds = %if.then42
  %224 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %225 = call i64 @getAddr(i8* %224)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 305, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %226 = bitcast i32* %n_feat to i8*
  %227 = call i64 @getAddr(i8* %226)
  %228 = load i32, i32* %n_feat, align 4
  %229 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %230 = call i64 @getAddr(i8* %229)
  call void @addFunArg(i32 1, i64 %230, i64 %227)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.41, i32 0, i32 0), i32 %228)
  br label %if.end45

if.end45:                                         ; preds = %if.then44, %if.then42
  br label %if.end47

if.else46:                                        ; preds = %if.else39
  %231 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %232 = call i64 @getAddr(i8* %231)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 307, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %233 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %234 = call i64 @getAddr(i8* %233)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([116 x i8], [116 x i8]* @.str.42, i32 0, i32 0))
  br label %if.end47

if.end47:                                         ; preds = %if.else46, %if.end45
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.end38
  %235 = bitcast i32* %n to i8*
  %236 = call i64 @getAddr(i8* %235)
  %237 = load i32, i32* %n, align 4
  %238 = bitcast i32* %n_mgau to i8*
  %239 = call i64 @getAddr(i8* %238)
  %240 = load i32, i32* %n_mgau, align 4
  %241 = bitcast i32* %n_comp to i8*
  %242 = call i64 @getAddr(i8* %241)
  %243 = load i32, i32* %n_comp, align 4
  %mul = mul nsw i32 %240, %243
  %cmp49 = icmp ne i32 %237, %mul
  br i1 %cmp49, label %if.then50, label %if.end51

if.then50:                                        ; preds = %if.end48
  %244 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %245 = call i64 @getAddr(i8* %244)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 311, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %246 = bitcast i8** %file_name.addr to i8*
  %247 = call i64 @getAddr(i8* %246)
  %248 = load i8*, i8** %file_name.addr, align 8
  %249 = bitcast i32* %i to i8*
  %250 = call i64 @getAddr(i8* %249)
  %251 = load i32, i32* %i, align 4
  %252 = bitcast i32* %n_mgau to i8*
  %253 = call i64 @getAddr(i8* %252)
  %254 = load i32, i32* %n_mgau, align 4
  %255 = bitcast i32* %n_comp to i8*
  %256 = call i64 @getAddr(i8* %255)
  %257 = load i32, i32* %n_comp, align 4
  %258 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %259 = call i64 @getAddr(i8* %258)
  call void @addFunArg(i32 2, i64 %259, i64 %250)
  call void @addFunArg(i32 3, i64 %259, i64 %253)
  call void @addFunArg(i32 4, i64 %259, i64 %256)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.43, i32 0, i32 0), i8* %248, i32 %251, i32 %254, i32 %257)
  br label %if.end51

if.end51:                                         ; preds = %if.then50, %if.end48
  %260 = bitcast i32* %n_mgau to i8*
  %261 = call i64 @getAddr(i8* %260)
  %262 = load i32, i32* %n_mgau, align 4
  %263 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %264 = call i64 @getAddr(i8* %263)
  %265 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %n_mgau52 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %265, i32 0, i32 0
  %266 = bitcast i32* %n_mgau52 to i8*
  %267 = call i64 @getAddr(i8* %266)
  %268 = load i32, i32* %n_mgau52, align 8
  %cmp53 = icmp ne i32 %262, %268
  br i1 %cmp53, label %if.then54, label %if.end56

if.then54:                                        ; preds = %if.end51
  %269 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %270 = call i64 @getAddr(i8* %269)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 315, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %271 = bitcast i32* %n_mgau to i8*
  %272 = call i64 @getAddr(i8* %271)
  %273 = load i32, i32* %n_mgau, align 4
  %274 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %275 = call i64 @getAddr(i8* %274)
  %276 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %n_mgau55 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %276, i32 0, i32 0
  %277 = bitcast i32* %n_mgau55 to i8*
  %278 = call i64 @getAddr(i8* %277)
  %279 = load i32, i32* %n_mgau55, align 8
  %280 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %281 = call i64 @getAddr(i8* %280)
  call void @addFunArg(i32 1, i64 %281, i64 %272)
  call void @addFunArg(i32 2, i64 %281, i64 %278)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.44, i32 0, i32 0), i32 %273, i32 %279)
  br label %if.end56

if.end56:                                         ; preds = %if.then54, %if.end51
  %282 = bitcast i32* %n_mgau to i8*
  %283 = call i64 @getAddr(i8* %282)
  %284 = load i32, i32* %n_mgau, align 4
  %285 = bitcast i32* %n_comp to i8*
  %286 = call i64 @getAddr(i8* %285)
  %287 = load i32, i32* %n_comp, align 4
  %mul57 = mul nsw i32 %284, %287
  %conv = sext i32 %mul57 to i64
  %288 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %289 = call i64 @getAddr(i8* %288)
  %call58 = call i8* @__ckd_calloc__(i64 %conv, i64 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 318)
  %290 = bitcast i8* %call58 to i32*
  %291 = bitcast i32** %buf to i8*
  %292 = call i64 @getAddr(i8* %291)
  %293 = bitcast i32* %290 to i8*
  %294 = call i64 @getAddr(i8* %293)
  call void @setRealTemp(i64 %292, i64 %294)
  store i32* %290, i32** %buf, align 8
  %295 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond59

for.cond59:                                       ; preds = %for.inc81, %if.end56
  %296 = bitcast i32* %i to i8*
  %297 = call i64 @getAddr(i8* %296)
  %298 = load i32, i32* %i, align 4
  %299 = bitcast i32* %n_mgau to i8*
  %300 = call i64 @getAddr(i8* %299)
  %301 = load i32, i32* %n_mgau, align 4
  %cmp60 = icmp slt i32 %298, %301
  br i1 %cmp60, label %for.body62, label %for.end83

for.body62:                                       ; preds = %for.cond59
  %302 = bitcast i32* %n_comp to i8*
  %303 = call i64 @getAddr(i8* %302)
  %304 = load i32, i32* %n_comp, align 4
  %305 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %306 = call i64 @getAddr(i8* %305)
  %307 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %307, i32 0, i32 3
  %308 = bitcast %struct.mgau_t** %mgau to i8*
  %309 = call i64 @getAddr(i8* %308)
  %310 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %311 = bitcast i32* %i to i8*
  %312 = call i64 @getAddr(i8* %311)
  %313 = load i32, i32* %i, align 4
  %idxprom63 = sext i32 %313 to i64
  %arrayidx64 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %310, i64 %idxprom63
  %n_comp65 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx64, i32 0, i32 0
  %314 = bitcast i32* %n_comp65 to i8*
  %315 = call i64 @getAddr(i8* %314)
  %316 = load i32, i32* %n_comp65, align 8
  %cmp66 = icmp ne i32 %304, %316
  br i1 %cmp66, label %if.then68, label %if.end73

if.then68:                                        ; preds = %for.body62
  %317 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %318 = call i64 @getAddr(i8* %317)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 321, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %319 = bitcast i32* %i to i8*
  %320 = call i64 @getAddr(i8* %319)
  %321 = load i32, i32* %i, align 4
  %322 = bitcast i32* %n_comp to i8*
  %323 = call i64 @getAddr(i8* %322)
  %324 = load i32, i32* %n_comp, align 4
  %325 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %326 = call i64 @getAddr(i8* %325)
  %327 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau69 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %327, i32 0, i32 3
  %328 = bitcast %struct.mgau_t** %mgau69 to i8*
  %329 = call i64 @getAddr(i8* %328)
  %330 = load %struct.mgau_t*, %struct.mgau_t** %mgau69, align 8
  %331 = bitcast i32* %i to i8*
  %332 = call i64 @getAddr(i8* %331)
  %333 = load i32, i32* %i, align 4
  %idxprom70 = sext i32 %333 to i64
  %arrayidx71 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %330, i64 %idxprom70
  %n_comp72 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx71, i32 0, i32 0
  %334 = bitcast i32* %n_comp72 to i8*
  %335 = call i64 @getAddr(i8* %334)
  %336 = load i32, i32* %n_comp72, align 8
  %337 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %338 = call i64 @getAddr(i8* %337)
  call void @addFunArg(i32 1, i64 %338, i64 %320)
  call void @addFunArg(i32 2, i64 %338, i64 %323)
  call void @addFunArg(i32 3, i64 %338, i64 %335)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.45, i32 0, i32 0), i32 %321, i32 %324, i32 %336)
  br label %if.end73

if.end73:                                         ; preds = %if.then68, %for.body62
  %339 = bitcast i32** %buf to i8*
  %340 = call i64 @getAddr(i8* %339)
  %341 = load i32*, i32** %buf, align 8
  %342 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %343 = call i64 @getAddr(i8* %342)
  %344 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau74 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %344, i32 0, i32 3
  %345 = bitcast %struct.mgau_t** %mgau74 to i8*
  %346 = call i64 @getAddr(i8* %345)
  %347 = load %struct.mgau_t*, %struct.mgau_t** %mgau74, align 8
  %348 = bitcast i32* %i to i8*
  %349 = call i64 @getAddr(i8* %348)
  %350 = load i32, i32* %i, align 4
  %idxprom75 = sext i32 %350 to i64
  %arrayidx76 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %347, i64 %idxprom75
  %mixw = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx76, i32 0, i32 4
  %351 = bitcast i32** %mixw to i8*
  %352 = call i64 @getAddr(i8* %351)
  %353 = bitcast i32* %341 to i8*
  %354 = call i64 @getAddr(i8* %353)
  call void @setRealTemp(i64 %352, i64 %354)
  store i32* %341, i32** %mixw, align 8
  %355 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %356 = call i64 @getAddr(i8* %355)
  %357 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau77 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %357, i32 0, i32 3
  %358 = bitcast %struct.mgau_t** %mgau77 to i8*
  %359 = call i64 @getAddr(i8* %358)
  %360 = load %struct.mgau_t*, %struct.mgau_t** %mgau77, align 8
  %361 = bitcast i32* %i to i8*
  %362 = call i64 @getAddr(i8* %361)
  %363 = load i32, i32* %i, align 4
  %idxprom78 = sext i32 %363 to i64
  %arrayidx79 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %360, i64 %idxprom78
  %n_comp80 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx79, i32 0, i32 0
  %364 = bitcast i32* %n_comp80 to i8*
  %365 = call i64 @getAddr(i8* %364)
  %366 = load i32, i32* %n_comp80, align 8
  %367 = bitcast i32** %buf to i8*
  %368 = call i64 @getAddr(i8* %367)
  %369 = load i32*, i32** %buf, align 8
  %idx.ext = sext i32 %366 to i64
  %add.ptr = getelementptr inbounds i32, i32* %369, i64 %idx.ext
  %370 = bitcast i32** %buf to i8*
  %371 = call i64 @getAddr(i8* %370)
  %372 = bitcast i32* %add.ptr to i8*
  %373 = call i64 @getAddr(i8* %372)
  call void @setRealTemp(i64 %371, i64 %373)
  store i32* %add.ptr, i32** %buf, align 8
  br label %for.inc81

for.inc81:                                        ; preds = %if.end73
  %374 = bitcast i32* %i to i8*
  %375 = call i64 @getAddr(i8* %374)
  %376 = load i32, i32* %i, align 4
  %inc82 = add nsw i32 %376, 1
  %377 = bitcast i32* %i to i8*
  store i32 %inc82, i32* %i, align 4
  br label %for.cond59

for.end83:                                        ; preds = %for.cond59
  %378 = bitcast i32* %n_comp to i8*
  %379 = call i64 @getAddr(i8* %378)
  %380 = load i32, i32* %n_comp, align 4
  %conv84 = sext i32 %380 to i64
  %381 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %382 = call i64 @getAddr(i8* %381)
  %call85 = call i8* @__ckd_calloc__(i64 %conv84, i64 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 329)
  %383 = bitcast i8* %call85 to float*
  %384 = bitcast float** %pdf to i8*
  %385 = call i64 @getAddr(i8* %384)
  %386 = bitcast float* %383 to i8*
  %387 = call i64 @getAddr(i8* %386)
  call void @setRealTemp(i64 %385, i64 %387)
  store float* %383, float** %pdf, align 8
  %388 = bitcast i32* %n_err to i8*
  store i32 0, i32* %n_err, align 4
  %389 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond86

for.cond86:                                       ; preds = %for.inc137, %for.end83
  %390 = bitcast i32* %i to i8*
  %391 = call i64 @getAddr(i8* %390)
  %392 = load i32, i32* %i, align 4
  %393 = bitcast i32* %n_mgau to i8*
  %394 = call i64 @getAddr(i8* %393)
  %395 = load i32, i32* %n_mgau, align 4
  %cmp87 = icmp slt i32 %392, %395
  br i1 %cmp87, label %for.body89, label %for.end139

for.body89:                                       ; preds = %for.cond86
  %396 = bitcast float** %pdf to i8*
  %397 = call i64 @getAddr(i8* %396)
  %398 = load float*, float** %pdf, align 8
  %399 = bitcast float* %398 to i8*
  %400 = bitcast i32* %n_comp to i8*
  %401 = call i64 @getAddr(i8* %400)
  %402 = load i32, i32* %n_comp, align 4
  %403 = bitcast %struct._IO_FILE** %fp to i8*
  %404 = call i64 @getAddr(i8* %403)
  %405 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %406 = bitcast i32* %byteswap to i8*
  %407 = call i64 @getAddr(i8* %406)
  %408 = load i32, i32* %byteswap, align 4
  %409 = bitcast i32 (i8*, i32, i32, %struct._IO_FILE*, i32, i32*)* @bio_fread to i8*
  %410 = call i64 @getAddr(i8* %409)
  call void @addFunArg(i32 2, i64 %410, i64 %401)
  call void @addFunArg(i32 4, i64 %410, i64 %407)
  %call90 = call i32 @bio_fread(i8* %399, i32 4, i32 %402, %struct._IO_FILE* %405, i32 %408, i32* %chksum)
  %411 = bitcast i32* %n_comp to i8*
  %412 = call i64 @getAddr(i8* %411)
  %413 = load i32, i32* %n_comp, align 4
  %cmp91 = icmp ne i32 %call90, %413
  br i1 %cmp91, label %if.then93, label %if.end94

if.then93:                                        ; preds = %for.body89
  %414 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %415 = call i64 @getAddr(i8* %414)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 335, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %416 = bitcast i8** %file_name.addr to i8*
  %417 = call i64 @getAddr(i8* %416)
  %418 = load i8*, i8** %file_name.addr, align 8
  %419 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %420 = call i64 @getAddr(i8* %419)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.46, i32 0, i32 0), i8* %418)
  br label %if.end94

if.end94:                                         ; preds = %if.then93, %for.body89
  %421 = bitcast float** %pdf to i8*
  %422 = call i64 @getAddr(i8* %421)
  %423 = load float*, float** %pdf, align 8
  %424 = bitcast i32* %n_comp to i8*
  %425 = call i64 @getAddr(i8* %424)
  %426 = load i32, i32* %n_comp, align 4
  %427 = bitcast i32 (float*, i32)* @vector_is_zero to i8*
  %428 = call i64 @getAddr(i8* %427)
  call void @addFunArg(i32 1, i64 %428, i64 %425)
  %call95 = call i32 @vector_is_zero(float* %423, i32 %426)
  %tobool96 = icmp ne i32 %call95, 0
  br i1 %tobool96, label %if.then97, label %if.else112

if.then97:                                        ; preds = %if.end94
  %429 = bitcast i32* %n_err to i8*
  %430 = call i64 @getAddr(i8* %429)
  %431 = load i32, i32* %n_err, align 4
  %inc98 = add nsw i32 %431, 1
  %432 = bitcast i32* %n_err to i8*
  store i32 %inc98, i32* %n_err, align 4
  %433 = bitcast i32* %j to i8*
  store i32 0, i32* %j, align 4
  br label %for.cond99

for.cond99:                                       ; preds = %for.inc109, %if.then97
  %434 = bitcast i32* %j to i8*
  %435 = call i64 @getAddr(i8* %434)
  %436 = load i32, i32* %j, align 4
  %437 = bitcast i32* %n_comp to i8*
  %438 = call i64 @getAddr(i8* %437)
  %439 = load i32, i32* %n_comp, align 4
  %cmp100 = icmp slt i32 %436, %439
  br i1 %cmp100, label %for.body102, label %for.end111

for.body102:                                      ; preds = %for.cond99
  %440 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %441 = call i64 @getAddr(i8* %440)
  %442 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau103 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %442, i32 0, i32 3
  %443 = bitcast %struct.mgau_t** %mgau103 to i8*
  %444 = call i64 @getAddr(i8* %443)
  %445 = load %struct.mgau_t*, %struct.mgau_t** %mgau103, align 8
  %446 = bitcast i32* %i to i8*
  %447 = call i64 @getAddr(i8* %446)
  %448 = load i32, i32* %i, align 4
  %idxprom104 = sext i32 %448 to i64
  %arrayidx105 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %445, i64 %idxprom104
  %mixw106 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx105, i32 0, i32 4
  %449 = bitcast i32** %mixw106 to i8*
  %450 = call i64 @getAddr(i8* %449)
  %451 = load i32*, i32** %mixw106, align 8
  %452 = bitcast i32* %j to i8*
  %453 = call i64 @getAddr(i8* %452)
  %454 = load i32, i32* %j, align 4
  %idxprom107 = sext i32 %454 to i64
  %arrayidx108 = getelementptr inbounds i32, i32* %451, i64 %idxprom107
  %455 = bitcast i32* %arrayidx108 to i8*
  store i32 -939524096, i32* %arrayidx108, align 4
  br label %for.inc109

for.inc109:                                       ; preds = %for.body102
  %456 = bitcast i32* %j to i8*
  %457 = call i64 @getAddr(i8* %456)
  %458 = load i32, i32* %j, align 4
  %inc110 = add nsw i32 %458, 1
  %459 = bitcast i32* %j to i8*
  store i32 %inc110, i32* %j, align 4
  br label %for.cond99

for.end111:                                       ; preds = %for.cond99
  br label %if.end136

if.else112:                                       ; preds = %if.end94
  %460 = bitcast float** %pdf to i8*
  %461 = call i64 @getAddr(i8* %460)
  %462 = load float*, float** %pdf, align 8
  %463 = bitcast i32* %n_comp to i8*
  %464 = call i64 @getAddr(i8* %463)
  %465 = load i32, i32* %n_comp, align 4
  %466 = bitcast double* %mixwfloor.addr to i8*
  %467 = call i64 @getAddr(i8* %466)
  %468 = load double, double* %mixwfloor.addr, align 8
  %469 = bitcast void (float*, i32, double)* @vector_nz_floor to i8*
  %470 = call i64 @getAddr(i8* %469)
  call void @addFunArg(i32 1, i64 %470, i64 %464)
  call void @addFunArg(i32 2, i64 %470, i64 %467)
  call void @vector_nz_floor(float* %462, i32 %465, double %468)
  %471 = bitcast float** %pdf to i8*
  %472 = call i64 @getAddr(i8* %471)
  %473 = load float*, float** %pdf, align 8
  %474 = bitcast i32* %n_comp to i8*
  %475 = call i64 @getAddr(i8* %474)
  %476 = load i32, i32* %n_comp, align 4
  %477 = bitcast double (float*, i32)* @vector_sum_norm to i8*
  %478 = call i64 @getAddr(i8* %477)
  call void @addFunArg(i32 1, i64 %478, i64 %475)
  %call113 = call double @vector_sum_norm(float* %473, i32 %476)
  %479 = bitcast i32* %j to i8*
  store i32 0, i32* %j, align 4
  br label %for.cond114

for.cond114:                                      ; preds = %for.inc133, %if.else112
  %480 = bitcast i32* %j to i8*
  %481 = call i64 @getAddr(i8* %480)
  %482 = load i32, i32* %j, align 4
  %483 = bitcast i32* %n_comp to i8*
  %484 = call i64 @getAddr(i8* %483)
  %485 = load i32, i32* %n_comp, align 4
  %cmp115 = icmp slt i32 %482, %485
  br i1 %cmp115, label %for.body117, label %for.end135

for.body117:                                      ; preds = %for.cond114
  %486 = bitcast float** %pdf to i8*
  %487 = call i64 @getAddr(i8* %486)
  %488 = load float*, float** %pdf, align 8
  %489 = bitcast i32* %j to i8*
  %490 = call i64 @getAddr(i8* %489)
  %491 = load i32, i32* %j, align 4
  %idxprom118 = sext i32 %491 to i64
  %arrayidx119 = getelementptr inbounds float, float* %488, i64 %idxprom118
  %492 = bitcast float* %arrayidx119 to i8*
  %493 = call i64 @getAddr(i8* %492)
  %494 = load float, float* %arrayidx119, align 4
  %conv120 = fpext float %494 to double
  %cmp121 = fcmp une double %conv120, 0.000000e+00
  call void @checkBranch(double %conv120, i64 %493, double 0.000000e+00, i64 0, i32 14, i1 %cmp121, i32 1103)
  br i1 %cmp121, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body117
  %495 = bitcast float** %pdf to i8*
  %496 = call i64 @getAddr(i8* %495)
  %497 = load float*, float** %pdf, align 8
  %498 = bitcast i32* %j to i8*
  %499 = call i64 @getAddr(i8* %498)
  %500 = load i32, i32* %j, align 4
  %idxprom123 = sext i32 %500 to i64
  %arrayidx124 = getelementptr inbounds float, float* %497, i64 %idxprom123
  %501 = bitcast float* %arrayidx124 to i8*
  %502 = call i64 @getAddr(i8* %501)
  %503 = load float, float* %arrayidx124, align 4
  %conv125 = fpext float %503 to double
  %504 = bitcast i32 (double)* @logs3 to i8*
  %505 = call i64 @getAddr(i8* %504)
  call void @addFunArg(i32 0, i64 %505, i64 %502)
  %call126 = call i32 @logs3(double %conv125)
  br label %cond.end

cond.false:                                       ; preds = %for.body117
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call126, %cond.true ], [ -939524096, %cond.false ]
  %506 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %507 = call i64 @getAddr(i8* %506)
  %508 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau127 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %508, i32 0, i32 3
  %509 = bitcast %struct.mgau_t** %mgau127 to i8*
  %510 = call i64 @getAddr(i8* %509)
  %511 = load %struct.mgau_t*, %struct.mgau_t** %mgau127, align 8
  %512 = bitcast i32* %i to i8*
  %513 = call i64 @getAddr(i8* %512)
  %514 = load i32, i32* %i, align 4
  %idxprom128 = sext i32 %514 to i64
  %arrayidx129 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %511, i64 %idxprom128
  %mixw130 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx129, i32 0, i32 4
  %515 = bitcast i32** %mixw130 to i8*
  %516 = call i64 @getAddr(i8* %515)
  %517 = load i32*, i32** %mixw130, align 8
  %518 = bitcast i32* %j to i8*
  %519 = call i64 @getAddr(i8* %518)
  %520 = load i32, i32* %j, align 4
  %idxprom131 = sext i32 %520 to i64
  %arrayidx132 = getelementptr inbounds i32, i32* %517, i64 %idxprom131
  %521 = bitcast i32* %arrayidx132 to i8*
  store i32 %cond, i32* %arrayidx132, align 4
  br label %for.inc133

for.inc133:                                       ; preds = %cond.end
  %522 = bitcast i32* %j to i8*
  %523 = call i64 @getAddr(i8* %522)
  %524 = load i32, i32* %j, align 4
  %inc134 = add nsw i32 %524, 1
  %525 = bitcast i32* %j to i8*
  store i32 %inc134, i32* %j, align 4
  br label %for.cond114

for.end135:                                       ; preds = %for.cond114
  br label %if.end136

if.end136:                                        ; preds = %for.end135, %for.end111
  br label %for.inc137

for.inc137:                                       ; preds = %if.end136
  %526 = bitcast i32* %i to i8*
  %527 = call i64 @getAddr(i8* %526)
  %528 = load i32, i32* %i, align 4
  %inc138 = add nsw i32 %528, 1
  %529 = bitcast i32* %i to i8*
  store i32 %inc138, i32* %i, align 4
  br label %for.cond86

for.end139:                                       ; preds = %for.cond86
  %530 = bitcast float** %pdf to i8*
  %531 = call i64 @getAddr(i8* %530)
  %532 = load float*, float** %pdf, align 8
  %533 = bitcast float* %532 to i8*
  %534 = bitcast void (i8*)* @ckd_free to i8*
  %535 = call i64 @getAddr(i8* %534)
  call void @ckd_free(i8* %533)
  %536 = bitcast i32* %chksum_present to i8*
  %537 = call i64 @getAddr(i8* %536)
  %538 = load i32, i32* %chksum_present, align 4
  %tobool140 = icmp ne i32 %538, 0
  br i1 %tobool140, label %if.then141, label %if.end142

if.then141:                                       ; preds = %for.end139
  %539 = bitcast %struct._IO_FILE** %fp to i8*
  %540 = call i64 @getAddr(i8* %539)
  %541 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %542 = bitcast i32* %byteswap to i8*
  %543 = call i64 @getAddr(i8* %542)
  %544 = load i32, i32* %byteswap, align 4
  %545 = bitcast i32* %chksum to i8*
  %546 = call i64 @getAddr(i8* %545)
  %547 = load i32, i32* %chksum, align 4
  %548 = bitcast void (%struct._IO_FILE*, i32, i32)* @bio_verify_chksum to i8*
  %549 = call i64 @getAddr(i8* %548)
  call void @addFunArg(i32 1, i64 %549, i64 %543)
  call void @addFunArg(i32 2, i64 %549, i64 %546)
  call void @bio_verify_chksum(%struct._IO_FILE* %541, i32 %544, i32 %547)
  br label %if.end142

if.end142:                                        ; preds = %if.then141, %for.end139
  %550 = bitcast %struct._IO_FILE** %fp to i8*
  %551 = call i64 @getAddr(i8* %550)
  %552 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call143 = call i64 @fread(i8* %eofchk, i64 1, i64 1, %struct._IO_FILE* %552)
  %cmp144 = icmp eq i64 %call143, 1
  br i1 %cmp144, label %if.then146, label %if.end147

if.then146:                                       ; preds = %if.end142
  %553 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %554 = call i64 @getAddr(i8* %553)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 358, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0))
  %555 = bitcast i8** %file_name.addr to i8*
  %556 = call i64 @getAddr(i8* %555)
  %557 = load i8*, i8** %file_name.addr, align 8
  %558 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %559 = call i64 @getAddr(i8* %558)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.47, i32 0, i32 0), i8* %557)
  br label %if.end147

if.end147:                                        ; preds = %if.then146, %if.end142
  %560 = bitcast %struct._IO_FILE** %fp to i8*
  %561 = call i64 @getAddr(i8* %560)
  %562 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call148 = call i32 @fclose(%struct._IO_FILE* %562)
  %563 = bitcast void (i8*, i64, i8*)* @_E__pr_info_header to i8*
  %564 = call i64 @getAddr(i8* %563)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 362, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  %565 = bitcast i32* %n_mgau to i8*
  %566 = call i64 @getAddr(i8* %565)
  %567 = load i32, i32* %n_mgau, align 4
  %568 = bitcast i32* %n_comp to i8*
  %569 = call i64 @getAddr(i8* %568)
  %570 = load i32, i32* %n_comp, align 4
  %571 = bitcast void (i8*, ...)* @_E__pr_info to i8*
  %572 = call i64 @getAddr(i8* %571)
  call void @addFunArg(i32 1, i64 %572, i64 %566)
  call void @addFunArg(i32 2, i64 %572, i64 %569)
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.48, i32 0, i32 0), i32 %567, i32 %570)
  %573 = bitcast i32 (%struct.mgau_model_t*, i8*, double)* @mgau_mixw_read to i8*
  %574 = call i64 @getAddr(i8* %573)
  call void @funcExit(i64 %574)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mgau_uninit_compact(%struct.mgau_model_t* %g) #0 {
entry:
  %0 = bitcast void (%struct.mgau_model_t*)* @mgau_uninit_compact to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %g.addr = alloca %struct.mgau_model_t*, align 8
  %2 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %m = alloca i32, align 4
  %4 = bitcast i32* %m to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @handleAlloca(i64 %5)
  %c = alloca i32, align 4
  %6 = bitcast i32* %c to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @handleAlloca(i64 %7)
  %c2 = alloca i32, align 4
  %8 = bitcast i32* %c2 to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @handleAlloca(i64 %9)
  %n = alloca i32, align 4
  %10 = bitcast i32* %n to i8*
  %11 = call i64 @getAddr(i8* %10)
  call void @handleAlloca(i64 %11)
  %nm = alloca i32, align 4
  %12 = bitcast i32* %nm to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @handleAlloca(i64 %13)
  %14 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = bitcast %struct.mgau_model_t* %g to i8*
  %17 = call i64 @getAddr(i8* %16)
  call void @setRealTemp(i64 %15, i64 %17)
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %g.addr, align 8
  %18 = bitcast void (i8*, i64, i8*)* @_E__pr_info_header to i8*
  %19 = call i64 @getAddr(i8* %18)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 378, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  %20 = bitcast void (i8*, ...)* @_E__pr_info to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.49, i32 0, i32 0))
  %22 = bitcast i32* %n to i8*
  store i32 0, i32* %n, align 4
  %23 = bitcast i32* %nm to i8*
  store i32 0, i32* %nm, align 4
  %24 = bitcast i32* %m to i8*
  store i32 0, i32* %m, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc62, %entry
  %25 = bitcast i32* %m to i8*
  %26 = call i64 @getAddr(i8* %25)
  %27 = load i32, i32* %m, align 4
  %28 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %29 = call i64 @getAddr(i8* %28)
  %30 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %n_mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %30, i32 0, i32 0
  %31 = bitcast i32* %n_mgau to i8*
  %32 = call i64 @getAddr(i8* %31)
  %33 = load i32, i32* %n_mgau, align 8
  %cmp = icmp slt i32 %27, %33
  br i1 %cmp, label %for.body, label %for.end64

for.body:                                         ; preds = %for.cond
  %34 = bitcast i32* %c to i8*
  store i32 0, i32* %c, align 4
  %35 = bitcast i32* %c2 to i8*
  store i32 0, i32* %c2, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %36 = bitcast i32* %c to i8*
  %37 = call i64 @getAddr(i8* %36)
  %38 = load i32, i32* %c, align 4
  %39 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %40 = call i64 @getAddr(i8* %39)
  %41 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %41, i32 0, i32 3
  %42 = bitcast %struct.mgau_t** %mgau to i8*
  %43 = call i64 @getAddr(i8* %42)
  %44 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %45 = bitcast i32* %m to i8*
  %46 = call i64 @getAddr(i8* %45)
  %47 = load i32, i32* %m, align 4
  %idxprom = sext i32 %47 to i64
  %arrayidx = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %44, i64 %idxprom
  %n_comp = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx, i32 0, i32 0
  %48 = bitcast i32* %n_comp to i8*
  %49 = call i64 @getAddr(i8* %48)
  %50 = load i32, i32* %n_comp, align 8
  %cmp2 = icmp slt i32 %38, %50
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %51 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %52 = call i64 @getAddr(i8* %51)
  %53 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau4 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %53, i32 0, i32 3
  %54 = bitcast %struct.mgau_t** %mgau4 to i8*
  %55 = call i64 @getAddr(i8* %54)
  %56 = load %struct.mgau_t*, %struct.mgau_t** %mgau4, align 8
  %57 = bitcast i32* %m to i8*
  %58 = call i64 @getAddr(i8* %57)
  %59 = load i32, i32* %m, align 4
  %idxprom5 = sext i32 %59 to i64
  %arrayidx6 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %56, i64 %idxprom5
  %var = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx6, i32 0, i32 2
  %60 = bitcast float*** %var to i8*
  %61 = call i64 @getAddr(i8* %60)
  %62 = load float**, float*** %var, align 8
  %63 = bitcast i32* %c to i8*
  %64 = call i64 @getAddr(i8* %63)
  %65 = load i32, i32* %c, align 4
  %idxprom7 = sext i32 %65 to i64
  %arrayidx8 = getelementptr inbounds float*, float** %62, i64 %idxprom7
  %66 = bitcast float** %arrayidx8 to i8*
  %67 = call i64 @getAddr(i8* %66)
  %68 = load float*, float** %arrayidx8, align 8
  %69 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %70 = call i64 @getAddr(i8* %69)
  %71 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %veclen = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %71, i32 0, i32 2
  %72 = bitcast i32* %veclen to i8*
  %73 = call i64 @getAddr(i8* %72)
  %74 = load i32, i32* %veclen, align 8
  %75 = bitcast i32 (float*, i32)* @vector_is_zero to i8*
  %76 = call i64 @getAddr(i8* %75)
  call void @addFunArg(i32 1, i64 %76, i64 %73)
  %call = call i32 @vector_is_zero(float* %68, i32 %74)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %for.body3
  %77 = bitcast i32* %c2 to i8*
  %78 = call i64 @getAddr(i8* %77)
  %79 = load i32, i32* %c2, align 4
  %80 = bitcast i32* %c to i8*
  %81 = call i64 @getAddr(i8* %80)
  %82 = load i32, i32* %c, align 4
  %cmp9 = icmp ne i32 %79, %82
  br i1 %cmp9, label %if.then10, label %if.end

if.then10:                                        ; preds = %if.then
  %83 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %84 = call i64 @getAddr(i8* %83)
  %85 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau11 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %85, i32 0, i32 3
  %86 = bitcast %struct.mgau_t** %mgau11 to i8*
  %87 = call i64 @getAddr(i8* %86)
  %88 = load %struct.mgau_t*, %struct.mgau_t** %mgau11, align 8
  %89 = bitcast i32* %m to i8*
  %90 = call i64 @getAddr(i8* %89)
  %91 = load i32, i32* %m, align 4
  %idxprom12 = sext i32 %91 to i64
  %arrayidx13 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %88, i64 %idxprom12
  %mean = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx13, i32 0, i32 1
  %92 = bitcast float*** %mean to i8*
  %93 = call i64 @getAddr(i8* %92)
  %94 = load float**, float*** %mean, align 8
  %95 = bitcast i32* %c2 to i8*
  %96 = call i64 @getAddr(i8* %95)
  %97 = load i32, i32* %c2, align 4
  %idxprom14 = sext i32 %97 to i64
  %arrayidx15 = getelementptr inbounds float*, float** %94, i64 %idxprom14
  %98 = bitcast float** %arrayidx15 to i8*
  %99 = call i64 @getAddr(i8* %98)
  %100 = load float*, float** %arrayidx15, align 8
  %101 = bitcast float* %100 to i8*
  %102 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %103 = call i64 @getAddr(i8* %102)
  %104 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau16 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %104, i32 0, i32 3
  %105 = bitcast %struct.mgau_t** %mgau16 to i8*
  %106 = call i64 @getAddr(i8* %105)
  %107 = load %struct.mgau_t*, %struct.mgau_t** %mgau16, align 8
  %108 = bitcast i32* %m to i8*
  %109 = call i64 @getAddr(i8* %108)
  %110 = load i32, i32* %m, align 4
  %idxprom17 = sext i32 %110 to i64
  %arrayidx18 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %107, i64 %idxprom17
  %mean19 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx18, i32 0, i32 1
  %111 = bitcast float*** %mean19 to i8*
  %112 = call i64 @getAddr(i8* %111)
  %113 = load float**, float*** %mean19, align 8
  %114 = bitcast i32* %c to i8*
  %115 = call i64 @getAddr(i8* %114)
  %116 = load i32, i32* %c, align 4
  %idxprom20 = sext i32 %116 to i64
  %arrayidx21 = getelementptr inbounds float*, float** %113, i64 %idxprom20
  %117 = bitcast float** %arrayidx21 to i8*
  %118 = call i64 @getAddr(i8* %117)
  %119 = load float*, float** %arrayidx21, align 8
  %120 = bitcast float* %119 to i8*
  %121 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %122 = call i64 @getAddr(i8* %121)
  %123 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %veclen22 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %123, i32 0, i32 2
  %124 = bitcast i32* %veclen22 to i8*
  %125 = call i64 @getAddr(i8* %124)
  %126 = load i32, i32* %veclen22, align 8
  %conv = sext i32 %126 to i64
  %mul = mul i64 %conv, 4
  %127 = bitcast i8* %101 to i8*
  %128 = bitcast i8* %120 to i8*
  %129 = bitcast i64 %mul to i64
  %130 = call i64 @getAddr(i8* %127)
  %131 = call i64 @getAddr(i8* %128)
  call void @handleLLVMMemcpy(i64 %130, i64 %131, i64 %129)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %101, i8* align 4 %120, i64 %mul, i1 false)
  %132 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %133 = call i64 @getAddr(i8* %132)
  %134 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau23 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %134, i32 0, i32 3
  %135 = bitcast %struct.mgau_t** %mgau23 to i8*
  %136 = call i64 @getAddr(i8* %135)
  %137 = load %struct.mgau_t*, %struct.mgau_t** %mgau23, align 8
  %138 = bitcast i32* %m to i8*
  %139 = call i64 @getAddr(i8* %138)
  %140 = load i32, i32* %m, align 4
  %idxprom24 = sext i32 %140 to i64
  %arrayidx25 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %137, i64 %idxprom24
  %var26 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx25, i32 0, i32 2
  %141 = bitcast float*** %var26 to i8*
  %142 = call i64 @getAddr(i8* %141)
  %143 = load float**, float*** %var26, align 8
  %144 = bitcast i32* %c2 to i8*
  %145 = call i64 @getAddr(i8* %144)
  %146 = load i32, i32* %c2, align 4
  %idxprom27 = sext i32 %146 to i64
  %arrayidx28 = getelementptr inbounds float*, float** %143, i64 %idxprom27
  %147 = bitcast float** %arrayidx28 to i8*
  %148 = call i64 @getAddr(i8* %147)
  %149 = load float*, float** %arrayidx28, align 8
  %150 = bitcast float* %149 to i8*
  %151 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %152 = call i64 @getAddr(i8* %151)
  %153 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau29 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %153, i32 0, i32 3
  %154 = bitcast %struct.mgau_t** %mgau29 to i8*
  %155 = call i64 @getAddr(i8* %154)
  %156 = load %struct.mgau_t*, %struct.mgau_t** %mgau29, align 8
  %157 = bitcast i32* %m to i8*
  %158 = call i64 @getAddr(i8* %157)
  %159 = load i32, i32* %m, align 4
  %idxprom30 = sext i32 %159 to i64
  %arrayidx31 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %156, i64 %idxprom30
  %var32 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx31, i32 0, i32 2
  %160 = bitcast float*** %var32 to i8*
  %161 = call i64 @getAddr(i8* %160)
  %162 = load float**, float*** %var32, align 8
  %163 = bitcast i32* %c to i8*
  %164 = call i64 @getAddr(i8* %163)
  %165 = load i32, i32* %c, align 4
  %idxprom33 = sext i32 %165 to i64
  %arrayidx34 = getelementptr inbounds float*, float** %162, i64 %idxprom33
  %166 = bitcast float** %arrayidx34 to i8*
  %167 = call i64 @getAddr(i8* %166)
  %168 = load float*, float** %arrayidx34, align 8
  %169 = bitcast float* %168 to i8*
  %170 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %171 = call i64 @getAddr(i8* %170)
  %172 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %veclen35 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %172, i32 0, i32 2
  %173 = bitcast i32* %veclen35 to i8*
  %174 = call i64 @getAddr(i8* %173)
  %175 = load i32, i32* %veclen35, align 8
  %conv36 = sext i32 %175 to i64
  %mul37 = mul i64 %conv36, 4
  %176 = bitcast i8* %150 to i8*
  %177 = bitcast i8* %169 to i8*
  %178 = bitcast i64 %mul37 to i64
  %179 = call i64 @getAddr(i8* %176)
  %180 = call i64 @getAddr(i8* %177)
  call void @handleLLVMMemcpy(i64 %179, i64 %180, i64 %178)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %150, i8* align 4 %169, i64 %mul37, i1 false)
  %181 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %182 = call i64 @getAddr(i8* %181)
  %183 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau38 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %183, i32 0, i32 3
  %184 = bitcast %struct.mgau_t** %mgau38 to i8*
  %185 = call i64 @getAddr(i8* %184)
  %186 = load %struct.mgau_t*, %struct.mgau_t** %mgau38, align 8
  %187 = bitcast i32* %m to i8*
  %188 = call i64 @getAddr(i8* %187)
  %189 = load i32, i32* %m, align 4
  %idxprom39 = sext i32 %189 to i64
  %arrayidx40 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %186, i64 %idxprom39
  %mixw = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx40, i32 0, i32 4
  %190 = bitcast i32** %mixw to i8*
  %191 = call i64 @getAddr(i8* %190)
  %192 = load i32*, i32** %mixw, align 8
  %193 = bitcast i32* %c to i8*
  %194 = call i64 @getAddr(i8* %193)
  %195 = load i32, i32* %c, align 4
  %idxprom41 = sext i32 %195 to i64
  %arrayidx42 = getelementptr inbounds i32, i32* %192, i64 %idxprom41
  %196 = bitcast i32* %arrayidx42 to i8*
  %197 = call i64 @getAddr(i8* %196)
  %198 = load i32, i32* %arrayidx42, align 4
  %199 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %200 = call i64 @getAddr(i8* %199)
  %201 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau43 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %201, i32 0, i32 3
  %202 = bitcast %struct.mgau_t** %mgau43 to i8*
  %203 = call i64 @getAddr(i8* %202)
  %204 = load %struct.mgau_t*, %struct.mgau_t** %mgau43, align 8
  %205 = bitcast i32* %m to i8*
  %206 = call i64 @getAddr(i8* %205)
  %207 = load i32, i32* %m, align 4
  %idxprom44 = sext i32 %207 to i64
  %arrayidx45 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %204, i64 %idxprom44
  %mixw46 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx45, i32 0, i32 4
  %208 = bitcast i32** %mixw46 to i8*
  %209 = call i64 @getAddr(i8* %208)
  %210 = load i32*, i32** %mixw46, align 8
  %211 = bitcast i32* %c2 to i8*
  %212 = call i64 @getAddr(i8* %211)
  %213 = load i32, i32* %c2, align 4
  %idxprom47 = sext i32 %213 to i64
  %arrayidx48 = getelementptr inbounds i32, i32* %210, i64 %idxprom47
  %214 = bitcast i32* %arrayidx48 to i8*
  store i32 %198, i32* %arrayidx48, align 4
  br label %if.end

if.end:                                           ; preds = %if.then10, %if.then
  %215 = bitcast i32* %c2 to i8*
  %216 = call i64 @getAddr(i8* %215)
  %217 = load i32, i32* %c2, align 4
  %inc = add nsw i32 %217, 1
  %218 = bitcast i32* %c2 to i8*
  store i32 %inc, i32* %c2, align 4
  br label %if.end50

if.else:                                          ; preds = %for.body3
  %219 = bitcast i32* %n to i8*
  %220 = call i64 @getAddr(i8* %219)
  %221 = load i32, i32* %n, align 4
  %inc49 = add nsw i32 %221, 1
  %222 = bitcast i32* %n to i8*
  store i32 %inc49, i32* %n, align 4
  br label %if.end50

if.end50:                                         ; preds = %if.else, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end50
  %223 = bitcast i32* %c to i8*
  %224 = call i64 @getAddr(i8* %223)
  %225 = load i32, i32* %c, align 4
  %inc51 = add nsw i32 %225, 1
  %226 = bitcast i32* %c to i8*
  store i32 %inc51, i32* %c, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %227 = bitcast i32* %c2 to i8*
  %228 = call i64 @getAddr(i8* %227)
  %229 = load i32, i32* %c2, align 4
  %230 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %231 = call i64 @getAddr(i8* %230)
  %232 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau52 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %232, i32 0, i32 3
  %233 = bitcast %struct.mgau_t** %mgau52 to i8*
  %234 = call i64 @getAddr(i8* %233)
  %235 = load %struct.mgau_t*, %struct.mgau_t** %mgau52, align 8
  %236 = bitcast i32* %m to i8*
  %237 = call i64 @getAddr(i8* %236)
  %238 = load i32, i32* %m, align 4
  %idxprom53 = sext i32 %238 to i64
  %arrayidx54 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %235, i64 %idxprom53
  %n_comp55 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx54, i32 0, i32 0
  %239 = bitcast i32* %n_comp55 to i8*
  store i32 %229, i32* %n_comp55, align 8
  %240 = bitcast i32* %c2 to i8*
  %241 = call i64 @getAddr(i8* %240)
  %242 = load i32, i32* %c2, align 4
  %cmp56 = icmp eq i32 %242, 0
  br i1 %cmp56, label %if.then58, label %if.end61

if.then58:                                        ; preds = %for.end
  %243 = bitcast %struct._IO_FILE** @stdout to i8*
  %244 = call i64 @getAddr(i8* %243)
  %245 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %246 = bitcast i32* %m to i8*
  %247 = call i64 @getAddr(i8* %246)
  %248 = load i32, i32* %m, align 4
  %call59 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %245, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.50, i32 0, i32 0), i32 %248)
  %249 = bitcast i32* %nm to i8*
  %250 = call i64 @getAddr(i8* %249)
  %251 = load i32, i32* %nm, align 4
  %inc60 = add nsw i32 %251, 1
  %252 = bitcast i32* %nm to i8*
  store i32 %inc60, i32* %nm, align 4
  br label %if.end61

if.end61:                                         ; preds = %if.then58, %for.end
  br label %for.inc62

for.inc62:                                        ; preds = %if.end61
  %253 = bitcast i32* %m to i8*
  %254 = call i64 @getAddr(i8* %253)
  %255 = load i32, i32* %m, align 4
  %inc63 = add nsw i32 %255, 1
  %256 = bitcast i32* %m to i8*
  store i32 %inc63, i32* %m, align 4
  br label %for.cond

for.end64:                                        ; preds = %for.cond
  %257 = bitcast i32* %nm to i8*
  %258 = call i64 @getAddr(i8* %257)
  %259 = load i32, i32* %nm, align 4
  %cmp65 = icmp sgt i32 %259, 0
  br i1 %cmp65, label %if.then67, label %if.end69

if.then67:                                        ; preds = %for.end64
  %260 = bitcast %struct._IO_FILE** @stdout to i8*
  %261 = call i64 @getAddr(i8* %260)
  %262 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call68 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %262, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.51, i32 0, i32 0))
  br label %if.end69

if.end69:                                         ; preds = %if.then67, %for.end64
  %263 = bitcast i32* %nm to i8*
  %264 = call i64 @getAddr(i8* %263)
  %265 = load i32, i32* %nm, align 4
  %cmp70 = icmp sgt i32 %265, 0
  br i1 %cmp70, label %if.then74, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end69
  %266 = bitcast i32* %n to i8*
  %267 = call i64 @getAddr(i8* %266)
  %268 = load i32, i32* %n, align 4
  %cmp72 = icmp sgt i32 %268, 0
  br i1 %cmp72, label %if.then74, label %if.end75

if.then74:                                        ; preds = %lor.lhs.false, %if.end69
  %269 = bitcast void (i8*, i64, i8*)* @_E__pr_info_header to i8*
  %270 = call i64 @getAddr(i8* %269)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 408, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  %271 = bitcast i32* %n to i8*
  %272 = call i64 @getAddr(i8* %271)
  %273 = load i32, i32* %n, align 4
  %274 = bitcast i32* %nm to i8*
  %275 = call i64 @getAddr(i8* %274)
  %276 = load i32, i32* %nm, align 4
  %277 = bitcast void (i8*, ...)* @_E__pr_info to i8*
  %278 = call i64 @getAddr(i8* %277)
  call void @addFunArg(i32 1, i64 %278, i64 %272)
  call void @addFunArg(i32 2, i64 %278, i64 %275)
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.52, i32 0, i32 0), i32 %273, i32 %276)
  br label %if.end75

if.end75:                                         ; preds = %if.then74, %lor.lhs.false
  %279 = bitcast void (%struct.mgau_model_t*)* @mgau_uninit_compact to i8*
  %280 = call i64 @getAddr(i8* %279)
  call void @funcExit(i64 %280)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mgau_var_floor(%struct.mgau_model_t* %g, double %floor) #0 {
entry:
  %0 = bitcast void (%struct.mgau_model_t*, double)* @mgau_var_floor to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %g.addr = alloca %struct.mgau_model_t*, align 8
  %2 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %floor.addr = alloca double, align 8
  %4 = bitcast double* %floor.addr to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @handleAlloca(i64 %5)
  %m = alloca i32, align 4
  %6 = bitcast i32* %m to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @handleAlloca(i64 %7)
  %c = alloca i32, align 4
  %8 = bitcast i32* %c to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @handleAlloca(i64 %9)
  %i = alloca i32, align 4
  %10 = bitcast i32* %i to i8*
  %11 = call i64 @getAddr(i8* %10)
  call void @handleAlloca(i64 %11)
  %n = alloca i32, align 4
  %12 = bitcast i32* %n to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @handleAlloca(i64 %13)
  %14 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = bitcast %struct.mgau_model_t* %g to i8*
  %17 = call i64 @getAddr(i8* %16)
  call void @setRealTemp(i64 %15, i64 %17)
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %g.addr, align 8
  %18 = bitcast double* %floor.addr to i8*
  %19 = call i64 @getAddr(i8* %18)
  %20 = bitcast void (%struct.mgau_model_t*, double)* @mgau_var_floor to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void @setRealFunArg(i32 17, i64 %21, i64 %19, double %floor)
  store double %floor, double* %floor.addr, align 8
  %22 = bitcast void (i8*, i64, i8*)* @_E__pr_info_header to i8*
  %23 = call i64 @getAddr(i8* %22)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 416, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  %24 = bitcast void (i8*, ...)* @_E__pr_info to i8*
  %25 = call i64 @getAddr(i8* %24)
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.53, i32 0, i32 0))
  %26 = bitcast i32* %n to i8*
  store i32 0, i32* %n, align 4
  %27 = bitcast i32* %m to i8*
  store i32 0, i32* %m, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc29, %entry
  %28 = bitcast i32* %m to i8*
  %29 = call i64 @getAddr(i8* %28)
  %30 = load i32, i32* %m, align 4
  %31 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %32 = call i64 @getAddr(i8* %31)
  %33 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %n_mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %33, i32 0, i32 0
  %34 = bitcast i32* %n_mgau to i8*
  %35 = call i64 @getAddr(i8* %34)
  %36 = load i32, i32* %n_mgau, align 8
  %cmp = icmp slt i32 %30, %36
  br i1 %cmp, label %for.body, label %for.end31

for.body:                                         ; preds = %for.cond
  %37 = bitcast i32* %c to i8*
  store i32 0, i32* %c, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc26, %for.body
  %38 = bitcast i32* %c to i8*
  %39 = call i64 @getAddr(i8* %38)
  %40 = load i32, i32* %c, align 4
  %41 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %42 = call i64 @getAddr(i8* %41)
  %43 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %43, i32 0, i32 3
  %44 = bitcast %struct.mgau_t** %mgau to i8*
  %45 = call i64 @getAddr(i8* %44)
  %46 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %47 = bitcast i32* %m to i8*
  %48 = call i64 @getAddr(i8* %47)
  %49 = load i32, i32* %m, align 4
  %idxprom = sext i32 %49 to i64
  %arrayidx = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %46, i64 %idxprom
  %n_comp = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx, i32 0, i32 0
  %50 = bitcast i32* %n_comp to i8*
  %51 = call i64 @getAddr(i8* %50)
  %52 = load i32, i32* %n_comp, align 8
  %cmp2 = icmp slt i32 %40, %52
  br i1 %cmp2, label %for.body3, label %for.end28

for.body3:                                        ; preds = %for.cond1
  %53 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %54 = bitcast i32* %i to i8*
  %55 = call i64 @getAddr(i8* %54)
  %56 = load i32, i32* %i, align 4
  %57 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %58 = call i64 @getAddr(i8* %57)
  %59 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %veclen = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %59, i32 0, i32 2
  %60 = bitcast i32* %veclen to i8*
  %61 = call i64 @getAddr(i8* %60)
  %62 = load i32, i32* %veclen, align 8
  %cmp5 = icmp slt i32 %56, %62
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %63 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %64 = call i64 @getAddr(i8* %63)
  %65 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau7 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %65, i32 0, i32 3
  %66 = bitcast %struct.mgau_t** %mgau7 to i8*
  %67 = call i64 @getAddr(i8* %66)
  %68 = load %struct.mgau_t*, %struct.mgau_t** %mgau7, align 8
  %69 = bitcast i32* %m to i8*
  %70 = call i64 @getAddr(i8* %69)
  %71 = load i32, i32* %m, align 4
  %idxprom8 = sext i32 %71 to i64
  %arrayidx9 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %68, i64 %idxprom8
  %var = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx9, i32 0, i32 2
  %72 = bitcast float*** %var to i8*
  %73 = call i64 @getAddr(i8* %72)
  %74 = load float**, float*** %var, align 8
  %75 = bitcast i32* %c to i8*
  %76 = call i64 @getAddr(i8* %75)
  %77 = load i32, i32* %c, align 4
  %idxprom10 = sext i32 %77 to i64
  %arrayidx11 = getelementptr inbounds float*, float** %74, i64 %idxprom10
  %78 = bitcast float** %arrayidx11 to i8*
  %79 = call i64 @getAddr(i8* %78)
  %80 = load float*, float** %arrayidx11, align 8
  %81 = bitcast i32* %i to i8*
  %82 = call i64 @getAddr(i8* %81)
  %83 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %83 to i64
  %arrayidx13 = getelementptr inbounds float, float* %80, i64 %idxprom12
  %84 = bitcast float* %arrayidx13 to i8*
  %85 = call i64 @getAddr(i8* %84)
  %86 = load float, float* %arrayidx13, align 4
  %conv = fpext float %86 to double
  %87 = bitcast double* %floor.addr to i8*
  %88 = call i64 @getAddr(i8* %87)
  %89 = load double, double* %floor.addr, align 8
  %cmp14 = fcmp olt double %conv, %89
  call void @checkBranch(double %conv, i64 %85, double %89, i64 %88, i32 4, i1 %cmp14, i32 1433)
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %for.body6
  %90 = bitcast double* %floor.addr to i8*
  %91 = call i64 @getAddr(i8* %90)
  %92 = load double, double* %floor.addr, align 8
  %conv16 = fptrunc double %92 to float
  %93 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %94 = call i64 @getAddr(i8* %93)
  %95 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau17 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %95, i32 0, i32 3
  %96 = bitcast %struct.mgau_t** %mgau17 to i8*
  %97 = call i64 @getAddr(i8* %96)
  %98 = load %struct.mgau_t*, %struct.mgau_t** %mgau17, align 8
  %99 = bitcast i32* %m to i8*
  %100 = call i64 @getAddr(i8* %99)
  %101 = load i32, i32* %m, align 4
  %idxprom18 = sext i32 %101 to i64
  %arrayidx19 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %98, i64 %idxprom18
  %var20 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx19, i32 0, i32 2
  %102 = bitcast float*** %var20 to i8*
  %103 = call i64 @getAddr(i8* %102)
  %104 = load float**, float*** %var20, align 8
  %105 = bitcast i32* %c to i8*
  %106 = call i64 @getAddr(i8* %105)
  %107 = load i32, i32* %c, align 4
  %idxprom21 = sext i32 %107 to i64
  %arrayidx22 = getelementptr inbounds float*, float** %104, i64 %idxprom21
  %108 = bitcast float** %arrayidx22 to i8*
  %109 = call i64 @getAddr(i8* %108)
  %110 = load float*, float** %arrayidx22, align 8
  %111 = bitcast i32* %i to i8*
  %112 = call i64 @getAddr(i8* %111)
  %113 = load i32, i32* %i, align 4
  %idxprom23 = sext i32 %113 to i64
  %arrayidx24 = getelementptr inbounds float, float* %110, i64 %idxprom23
  %114 = bitcast float* %arrayidx24 to i8*
  %115 = call i64 @getAddr(i8* %114)
  call void @setRealTemp(i64 %115, i64 %91)
  store float %conv16, float* %arrayidx24, align 4
  %116 = bitcast i32* %n to i8*
  %117 = call i64 @getAddr(i8* %116)
  %118 = load i32, i32* %n, align 4
  %inc = add nsw i32 %118, 1
  %119 = bitcast i32* %n to i8*
  store i32 %inc, i32* %n, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body6
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %120 = bitcast i32* %i to i8*
  %121 = call i64 @getAddr(i8* %120)
  %122 = load i32, i32* %i, align 4
  %inc25 = add nsw i32 %122, 1
  %123 = bitcast i32* %i to i8*
  store i32 %inc25, i32* %i, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc26

for.inc26:                                        ; preds = %for.end
  %124 = bitcast i32* %c to i8*
  %125 = call i64 @getAddr(i8* %124)
  %126 = load i32, i32* %c, align 4
  %inc27 = add nsw i32 %126, 1
  %127 = bitcast i32* %c to i8*
  store i32 %inc27, i32* %c, align 4
  br label %for.cond1

for.end28:                                        ; preds = %for.cond1
  br label %for.inc29

for.inc29:                                        ; preds = %for.end28
  %128 = bitcast i32* %m to i8*
  %129 = call i64 @getAddr(i8* %128)
  %130 = load i32, i32* %m, align 4
  %inc30 = add nsw i32 %130, 1
  %131 = bitcast i32* %m to i8*
  store i32 %inc30, i32* %m, align 4
  br label %for.cond

for.end31:                                        ; preds = %for.cond
  %132 = bitcast void (i8*, i64, i8*)* @_E__pr_info_header to i8*
  %133 = call i64 @getAddr(i8* %132)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 428, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  %134 = bitcast i32* %n to i8*
  %135 = call i64 @getAddr(i8* %134)
  %136 = load i32, i32* %n, align 4
  %137 = bitcast void (i8*, ...)* @_E__pr_info to i8*
  %138 = call i64 @getAddr(i8* %137)
  call void @addFunArg(i32 1, i64 %138, i64 %135)
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i32 0, i32 0), i32 %136)
  %139 = bitcast void (%struct.mgau_model_t*, double)* @mgau_var_floor to i8*
  %140 = call i64 @getAddr(i8* %139)
  call void @funcExit(i64 %140)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @mgau_precomp(%struct.mgau_model_t* %g) #0 {
entry:
  %0 = bitcast i32 (%struct.mgau_model_t*)* @mgau_precomp to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %g.addr = alloca %struct.mgau_model_t*, align 8
  %2 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %m = alloca i32, align 4
  %4 = bitcast i32* %m to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @handleAlloca(i64 %5)
  %c = alloca i32, align 4
  %6 = bitcast i32* %c to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @handleAlloca(i64 %7)
  %i = alloca i32, align 4
  %8 = bitcast i32* %i to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @handleAlloca(i64 %9)
  %lrd = alloca double, align 8
  %10 = bitcast double* %lrd to i8*
  %11 = call i64 @getAddr(i8* %10)
  call void @handleAlloca(i64 %11)
  %f = alloca double, align 8
  %12 = bitcast double* %f to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @handleAlloca(i64 %13)
  %14 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = bitcast %struct.mgau_model_t* %g to i8*
  %17 = call i64 @getAddr(i8* %16)
  call void @setRealTemp(i64 %15, i64 %17)
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %g.addr, align 8
  %18 = bitcast double ()* @log_to_logs3_factor to i8*
  %19 = call i64 @getAddr(i8* %18)
  %call = call double @log_to_logs3_factor()
  %20 = bitcast double* %f to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void @setRealReturn(i64 %21)
  store double %call, double* %f, align 8
  %22 = bitcast void (i8*, i64, i8*)* @_E__pr_info_header to i8*
  %23 = call i64 @getAddr(i8* %22)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 474, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  %24 = bitcast void (i8*, ...)* @_E__pr_info to i8*
  %25 = call i64 @getAddr(i8* %24)
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.54, i32 0, i32 0))
  %26 = bitcast i32* %m to i8*
  store i32 0, i32* %m, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc49, %entry
  %27 = bitcast i32* %m to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load i32, i32* %m, align 4
  %30 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %n_mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %32, i32 0, i32 0
  %33 = bitcast i32* %n_mgau to i8*
  %34 = call i64 @getAddr(i8* %33)
  %35 = load i32, i32* %n_mgau, align 8
  %cmp = icmp slt i32 %29, %35
  br i1 %cmp, label %for.body, label %for.end51

for.body:                                         ; preds = %for.cond
  %36 = bitcast i32* %c to i8*
  store i32 0, i32* %c, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc46, %for.body
  %37 = bitcast i32* %c to i8*
  %38 = call i64 @getAddr(i8* %37)
  %39 = load i32, i32* %c, align 4
  %40 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %41 = call i64 @getAddr(i8* %40)
  %42 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %42, i32 0, i32 3
  %43 = bitcast %struct.mgau_t** %mgau to i8*
  %44 = call i64 @getAddr(i8* %43)
  %45 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %46 = bitcast i32* %m to i8*
  %47 = call i64 @getAddr(i8* %46)
  %48 = load i32, i32* %m, align 4
  %idxprom = sext i32 %48 to i64
  %arrayidx = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %45, i64 %idxprom
  %n_comp = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx, i32 0, i32 0
  %49 = bitcast i32* %n_comp to i8*
  %50 = call i64 @getAddr(i8* %49)
  %51 = load i32, i32* %n_comp, align 8
  %cmp2 = icmp slt i32 %39, %51
  br i1 %cmp2, label %for.body3, label %for.end48

for.body3:                                        ; preds = %for.cond1
  %52 = bitcast double* %lrd to i8*
  %53 = call i64 @getAddr(i8* %52)
  call void @setRealConstant(i64 %53, double 0.000000e+00)
  store double 0.000000e+00, double* %lrd, align 8
  %54 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %55 = bitcast i32* %i to i8*
  %56 = call i64 @getAddr(i8* %55)
  %57 = load i32, i32* %i, align 4
  %58 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %59 = call i64 @getAddr(i8* %58)
  %60 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %veclen = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %60, i32 0, i32 2
  %61 = bitcast i32* %veclen to i8*
  %62 = call i64 @getAddr(i8* %61)
  %63 = load i32, i32* %veclen, align 8
  %cmp5 = icmp slt i32 %57, %63
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %64 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %65 = call i64 @getAddr(i8* %64)
  %66 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau7 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %66, i32 0, i32 3
  %67 = bitcast %struct.mgau_t** %mgau7 to i8*
  %68 = call i64 @getAddr(i8* %67)
  %69 = load %struct.mgau_t*, %struct.mgau_t** %mgau7, align 8
  %70 = bitcast i32* %m to i8*
  %71 = call i64 @getAddr(i8* %70)
  %72 = load i32, i32* %m, align 4
  %idxprom8 = sext i32 %72 to i64
  %arrayidx9 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %69, i64 %idxprom8
  %var = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx9, i32 0, i32 2
  %73 = bitcast float*** %var to i8*
  %74 = call i64 @getAddr(i8* %73)
  %75 = load float**, float*** %var, align 8
  %76 = bitcast i32* %c to i8*
  %77 = call i64 @getAddr(i8* %76)
  %78 = load i32, i32* %c, align 4
  %idxprom10 = sext i32 %78 to i64
  %arrayidx11 = getelementptr inbounds float*, float** %75, i64 %idxprom10
  %79 = bitcast float** %arrayidx11 to i8*
  %80 = call i64 @getAddr(i8* %79)
  %81 = load float*, float** %arrayidx11, align 8
  %82 = bitcast i32* %i to i8*
  %83 = call i64 @getAddr(i8* %82)
  %84 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %84 to i64
  %arrayidx13 = getelementptr inbounds float, float* %81, i64 %idxprom12
  %85 = bitcast float* %arrayidx13 to i8*
  %86 = call i64 @getAddr(i8* %85)
  %87 = load float, float* %arrayidx13, align 4
  %conv = fpext float %87 to double
  %call14 = call double @log(double %conv) #8
  %88 = call i64 @handleMathFunc(i32 9, double %conv, i64 %86, double %call14, i32 1540)
  %89 = bitcast double* %lrd to i8*
  %90 = call i64 @getAddr(i8* %89)
  %91 = load double, double* %lrd, align 8
  %add = fadd double %91, %call14
  %92 = call i64 @computeReal(i32 12, i64 %90, i64 %88, double %91, double %call14, double %add, i32 1542)
  %93 = bitcast double* %lrd to i8*
  %94 = call i64 @getAddr(i8* %93)
  call void @setRealTemp(i64 %94, i64 %92)
  store double %add, double* %lrd, align 8
  %95 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %96 = call i64 @getAddr(i8* %95)
  %97 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau15 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %97, i32 0, i32 3
  %98 = bitcast %struct.mgau_t** %mgau15 to i8*
  %99 = call i64 @getAddr(i8* %98)
  %100 = load %struct.mgau_t*, %struct.mgau_t** %mgau15, align 8
  %101 = bitcast i32* %m to i8*
  %102 = call i64 @getAddr(i8* %101)
  %103 = load i32, i32* %m, align 4
  %idxprom16 = sext i32 %103 to i64
  %arrayidx17 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %100, i64 %idxprom16
  %var18 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx17, i32 0, i32 2
  %104 = bitcast float*** %var18 to i8*
  %105 = call i64 @getAddr(i8* %104)
  %106 = load float**, float*** %var18, align 8
  %107 = bitcast i32* %c to i8*
  %108 = call i64 @getAddr(i8* %107)
  %109 = load i32, i32* %c, align 4
  %idxprom19 = sext i32 %109 to i64
  %arrayidx20 = getelementptr inbounds float*, float** %106, i64 %idxprom19
  %110 = bitcast float** %arrayidx20 to i8*
  %111 = call i64 @getAddr(i8* %110)
  %112 = load float*, float** %arrayidx20, align 8
  %113 = bitcast i32* %i to i8*
  %114 = call i64 @getAddr(i8* %113)
  %115 = load i32, i32* %i, align 4
  %idxprom21 = sext i32 %115 to i64
  %arrayidx22 = getelementptr inbounds float, float* %112, i64 %idxprom21
  %116 = bitcast float* %arrayidx22 to i8*
  %117 = call i64 @getAddr(i8* %116)
  %118 = load float, float* %arrayidx22, align 4
  %conv23 = fpext float %118 to double
  %mul = fmul double %conv23, 2.000000e+00
  %119 = call i64 @computeReal(i32 16, i64 %117, i64 0, double %conv23, double 2.000000e+00, double %mul, i32 1561)
  %div = fdiv double 1.000000e+00, %mul
  %120 = call i64 @computeReal(i32 19, i64 0, i64 %119, double 1.000000e+00, double %mul, double %div, i32 1562)
  %conv24 = fptrunc double %div to float
  %121 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %122 = call i64 @getAddr(i8* %121)
  %123 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau25 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %123, i32 0, i32 3
  %124 = bitcast %struct.mgau_t** %mgau25 to i8*
  %125 = call i64 @getAddr(i8* %124)
  %126 = load %struct.mgau_t*, %struct.mgau_t** %mgau25, align 8
  %127 = bitcast i32* %m to i8*
  %128 = call i64 @getAddr(i8* %127)
  %129 = load i32, i32* %m, align 4
  %idxprom26 = sext i32 %129 to i64
  %arrayidx27 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %126, i64 %idxprom26
  %var28 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx27, i32 0, i32 2
  %130 = bitcast float*** %var28 to i8*
  %131 = call i64 @getAddr(i8* %130)
  %132 = load float**, float*** %var28, align 8
  %133 = bitcast i32* %c to i8*
  %134 = call i64 @getAddr(i8* %133)
  %135 = load i32, i32* %c, align 4
  %idxprom29 = sext i32 %135 to i64
  %arrayidx30 = getelementptr inbounds float*, float** %132, i64 %idxprom29
  %136 = bitcast float** %arrayidx30 to i8*
  %137 = call i64 @getAddr(i8* %136)
  %138 = load float*, float** %arrayidx30, align 8
  %139 = bitcast i32* %i to i8*
  %140 = call i64 @getAddr(i8* %139)
  %141 = load i32, i32* %i, align 4
  %idxprom31 = sext i32 %141 to i64
  %arrayidx32 = getelementptr inbounds float, float* %138, i64 %idxprom31
  %142 = bitcast float* %arrayidx32 to i8*
  %143 = call i64 @getAddr(i8* %142)
  call void @setRealTemp(i64 %143, i64 %120)
  store float %conv24, float* %arrayidx32, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %144 = bitcast i32* %i to i8*
  %145 = call i64 @getAddr(i8* %144)
  %146 = load i32, i32* %i, align 4
  %inc = add nsw i32 %146, 1
  %147 = bitcast i32* %i to i8*
  store i32 %inc, i32* %i, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  %148 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %149 = call i64 @getAddr(i8* %148)
  %150 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %veclen33 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %150, i32 0, i32 2
  %151 = bitcast i32* %veclen33 to i8*
  %152 = call i64 @getAddr(i8* %151)
  %153 = load i32, i32* %veclen33, align 8
  %conv34 = sitofp i32 %153 to double
  %call35 = call double @log(double 0x401921FB54442D18) #8
  %154 = call i64 @handleMathFunc(i32 9, double 0x401921FB54442D18, i64 0, double %call35, i32 1589)
  %mul36 = fmul double %conv34, %call35
  %155 = call i64 @computeReal(i32 16, i64 0, i64 %154, double %conv34, double %call35, double %mul36, i32 1590)
  %156 = bitcast double* %lrd to i8*
  %157 = call i64 @getAddr(i8* %156)
  %158 = load double, double* %lrd, align 8
  %add37 = fadd double %158, %mul36
  %159 = call i64 @computeReal(i32 12, i64 %157, i64 %155, double %158, double %mul36, double %add37, i32 1592)
  %160 = bitcast double* %lrd to i8*
  %161 = call i64 @getAddr(i8* %160)
  call void @setRealTemp(i64 %161, i64 %159)
  store double %add37, double* %lrd, align 8
  %162 = bitcast double* %lrd to i8*
  %163 = call i64 @getAddr(i8* %162)
  %164 = load double, double* %lrd, align 8
  %mul38 = fmul double -5.000000e-01, %164
  %165 = call i64 @computeReal(i32 16, i64 0, i64 %163, double -5.000000e-01, double %164, double %mul38, i32 1595)
  %conv39 = fptrunc double %mul38 to float
  %166 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %167 = call i64 @getAddr(i8* %166)
  %168 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau40 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %168, i32 0, i32 3
  %169 = bitcast %struct.mgau_t** %mgau40 to i8*
  %170 = call i64 @getAddr(i8* %169)
  %171 = load %struct.mgau_t*, %struct.mgau_t** %mgau40, align 8
  %172 = bitcast i32* %m to i8*
  %173 = call i64 @getAddr(i8* %172)
  %174 = load i32, i32* %m, align 4
  %idxprom41 = sext i32 %174 to i64
  %arrayidx42 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %171, i64 %idxprom41
  %lrd43 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx42, i32 0, i32 3
  %175 = bitcast float** %lrd43 to i8*
  %176 = call i64 @getAddr(i8* %175)
  %177 = load float*, float** %lrd43, align 8
  %178 = bitcast i32* %c to i8*
  %179 = call i64 @getAddr(i8* %178)
  %180 = load i32, i32* %c, align 4
  %idxprom44 = sext i32 %180 to i64
  %arrayidx45 = getelementptr inbounds float, float* %177, i64 %idxprom44
  %181 = bitcast float* %arrayidx45 to i8*
  %182 = call i64 @getAddr(i8* %181)
  call void @setRealTemp(i64 %182, i64 %165)
  store float %conv39, float* %arrayidx45, align 4
  br label %for.inc46

for.inc46:                                        ; preds = %for.end
  %183 = bitcast i32* %c to i8*
  %184 = call i64 @getAddr(i8* %183)
  %185 = load i32, i32* %c, align 4
  %inc47 = add nsw i32 %185, 1
  %186 = bitcast i32* %c to i8*
  store i32 %inc47, i32* %c, align 4
  br label %for.cond1

for.end48:                                        ; preds = %for.cond1
  br label %for.inc49

for.inc49:                                        ; preds = %for.end48
  %187 = bitcast i32* %m to i8*
  %188 = call i64 @getAddr(i8* %187)
  %189 = load i32, i32* %m, align 4
  %inc50 = add nsw i32 %189, 1
  %190 = bitcast i32* %m to i8*
  store i32 %inc50, i32* %m, align 4
  br label %for.cond

for.end51:                                        ; preds = %for.cond
  %191 = bitcast i32 (%struct.mgau_model_t*)* @mgau_precomp to i8*
  %192 = call i64 @getAddr(i8* %191)
  call void @funcExit(i64 %192)
  call void @cleanComputeReal(i32 1540)
  call void @cleanComputeReal(i32 1542)
  call void @cleanComputeReal(i32 1561)
  call void @cleanComputeReal(i32 1562)
  call void @cleanComputeReal(i32 1589)
  call void @cleanComputeReal(i32 1590)
  call void @cleanComputeReal(i32 1592)
  call void @cleanComputeReal(i32 1595)
  ret i32 0
}

declare dso_local double @logs3_to_log(i32) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mgau_comp_eval(%struct.mgau_model_t* %g, i32 %s, float* %x, i32* %score) #0 {
entry:
  %0 = bitcast i32 (%struct.mgau_model_t*, i32, float*, i32*)* @mgau_comp_eval to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %g.addr = alloca %struct.mgau_model_t*, align 8
  %2 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %s.addr = alloca i32, align 4
  %4 = bitcast i32* %s.addr to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @handleAlloca(i64 %5)
  %x.addr = alloca float*, align 8
  %6 = bitcast float** %x.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @handleAlloca(i64 %7)
  %score.addr = alloca i32*, align 8
  %8 = bitcast i32** %score.addr to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @handleAlloca(i64 %9)
  %mgau = alloca %struct.mgau_t*, align 8
  %10 = bitcast %struct.mgau_t** %mgau to i8*
  %11 = call i64 @getAddr(i8* %10)
  call void @handleAlloca(i64 %11)
  %veclen = alloca i32, align 4
  %12 = bitcast i32* %veclen to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @handleAlloca(i64 %13)
  %m = alloca float*, align 8
  %14 = bitcast float** %m to i8*
  %15 = call i64 @getAddr(i8* %14)
  call void @handleAlloca(i64 %15)
  %v = alloca float*, align 8
  %16 = bitcast float** %v to i8*
  %17 = call i64 @getAddr(i8* %16)
  call void @handleAlloca(i64 %17)
  %dval = alloca double, align 8
  %18 = bitcast double* %dval to i8*
  %19 = call i64 @getAddr(i8* %18)
  call void @handleAlloca(i64 %19)
  %diff = alloca double, align 8
  %20 = bitcast double* %diff to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void @handleAlloca(i64 %21)
  %f = alloca double, align 8
  %22 = bitcast double* %f to i8*
  %23 = call i64 @getAddr(i8* %22)
  call void @handleAlloca(i64 %23)
  %bs = alloca i32, align 4
  %24 = bitcast i32* %bs to i8*
  %25 = call i64 @getAddr(i8* %24)
  call void @handleAlloca(i64 %25)
  %i = alloca i32, align 4
  %26 = bitcast i32* %i to i8*
  %27 = call i64 @getAddr(i8* %26)
  call void @handleAlloca(i64 %27)
  %c = alloca i32, align 4
  %28 = bitcast i32* %c to i8*
  %29 = call i64 @getAddr(i8* %28)
  call void @handleAlloca(i64 %29)
  %30 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = bitcast %struct.mgau_model_t* %g to i8*
  %33 = call i64 @getAddr(i8* %32)
  call void @setRealTemp(i64 %31, i64 %33)
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %g.addr, align 8
  %34 = bitcast i32* %s.addr to i8*
  store i32 %s, i32* %s.addr, align 4
  %35 = bitcast float** %x.addr to i8*
  %36 = call i64 @getAddr(i8* %35)
  %37 = bitcast float* %x to i8*
  %38 = call i64 @getAddr(i8* %37)
  call void @setRealTemp(i64 %36, i64 %38)
  store float* %x, float** %x.addr, align 8
  %39 = bitcast i32** %score.addr to i8*
  %40 = call i64 @getAddr(i8* %39)
  %41 = bitcast i32* %score to i8*
  %42 = call i64 @getAddr(i8* %41)
  call void @setRealTemp(i64 %40, i64 %42)
  store i32* %score, i32** %score.addr, align 8
  %43 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %44 = call i64 @getAddr(i8* %43)
  %45 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %veclen1 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %45, i32 0, i32 2
  %46 = bitcast i32* %veclen1 to i8*
  %47 = call i64 @getAddr(i8* %46)
  %48 = load i32, i32* %veclen1, align 8
  %49 = bitcast i32* %veclen to i8*
  store i32 %48, i32* %veclen, align 4
  %50 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %51 = call i64 @getAddr(i8* %50)
  %52 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau2 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %52, i32 0, i32 3
  %53 = bitcast %struct.mgau_t** %mgau2 to i8*
  %54 = call i64 @getAddr(i8* %53)
  %55 = load %struct.mgau_t*, %struct.mgau_t** %mgau2, align 8
  %56 = bitcast i32* %s.addr to i8*
  %57 = call i64 @getAddr(i8* %56)
  %58 = load i32, i32* %s.addr, align 4
  %idxprom = sext i32 %58 to i64
  %arrayidx = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %55, i64 %idxprom
  %59 = bitcast %struct.mgau_t** %mgau to i8*
  %60 = call i64 @getAddr(i8* %59)
  %61 = bitcast %struct.mgau_t* %arrayidx to i8*
  %62 = call i64 @getAddr(i8* %61)
  call void @setRealTemp(i64 %60, i64 %62)
  store %struct.mgau_t* %arrayidx, %struct.mgau_t** %mgau, align 8
  %63 = bitcast double ()* @log_to_logs3_factor to i8*
  %64 = call i64 @getAddr(i8* %63)
  %call = call double @log_to_logs3_factor()
  %65 = bitcast double* %f to i8*
  %66 = call i64 @getAddr(i8* %65)
  call void @setRealReturn(i64 %66)
  store double %call, double* %f, align 8
  %67 = bitcast i32* %bs to i8*
  store i32 -2147483648, i32* %bs, align 4
  %68 = bitcast i32* %c to i8*
  store i32 0, i32* %c, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc38, %entry
  %69 = bitcast i32* %c to i8*
  %70 = call i64 @getAddr(i8* %69)
  %71 = load i32, i32* %c, align 4
  %72 = bitcast %struct.mgau_t** %mgau to i8*
  %73 = call i64 @getAddr(i8* %72)
  %74 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %n_comp = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %74, i32 0, i32 0
  %75 = bitcast i32* %n_comp to i8*
  %76 = call i64 @getAddr(i8* %75)
  %77 = load i32, i32* %n_comp, align 8
  %cmp = icmp slt i32 %71, %77
  br i1 %cmp, label %for.body, label %for.end40

for.body:                                         ; preds = %for.cond
  %78 = bitcast %struct.mgau_t** %mgau to i8*
  %79 = call i64 @getAddr(i8* %78)
  %80 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %mean = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %80, i32 0, i32 1
  %81 = bitcast float*** %mean to i8*
  %82 = call i64 @getAddr(i8* %81)
  %83 = load float**, float*** %mean, align 8
  %84 = bitcast i32* %c to i8*
  %85 = call i64 @getAddr(i8* %84)
  %86 = load i32, i32* %c, align 4
  %idxprom3 = sext i32 %86 to i64
  %arrayidx4 = getelementptr inbounds float*, float** %83, i64 %idxprom3
  %87 = bitcast float** %arrayidx4 to i8*
  %88 = call i64 @getAddr(i8* %87)
  %89 = load float*, float** %arrayidx4, align 8
  %90 = bitcast float** %m to i8*
  %91 = call i64 @getAddr(i8* %90)
  %92 = bitcast float* %89 to i8*
  %93 = call i64 @getAddr(i8* %92)
  call void @setRealTemp(i64 %91, i64 %93)
  store float* %89, float** %m, align 8
  %94 = bitcast %struct.mgau_t** %mgau to i8*
  %95 = call i64 @getAddr(i8* %94)
  %96 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %var = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %96, i32 0, i32 2
  %97 = bitcast float*** %var to i8*
  %98 = call i64 @getAddr(i8* %97)
  %99 = load float**, float*** %var, align 8
  %100 = bitcast i32* %c to i8*
  %101 = call i64 @getAddr(i8* %100)
  %102 = load i32, i32* %c, align 4
  %idxprom5 = sext i32 %102 to i64
  %arrayidx6 = getelementptr inbounds float*, float** %99, i64 %idxprom5
  %103 = bitcast float** %arrayidx6 to i8*
  %104 = call i64 @getAddr(i8* %103)
  %105 = load float*, float** %arrayidx6, align 8
  %106 = bitcast float** %v to i8*
  %107 = call i64 @getAddr(i8* %106)
  %108 = bitcast float* %105 to i8*
  %109 = call i64 @getAddr(i8* %108)
  call void @setRealTemp(i64 %107, i64 %109)
  store float* %105, float** %v, align 8
  %110 = bitcast %struct.mgau_t** %mgau to i8*
  %111 = call i64 @getAddr(i8* %110)
  %112 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %lrd = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %112, i32 0, i32 3
  %113 = bitcast float** %lrd to i8*
  %114 = call i64 @getAddr(i8* %113)
  %115 = load float*, float** %lrd, align 8
  %116 = bitcast i32* %c to i8*
  %117 = call i64 @getAddr(i8* %116)
  %118 = load i32, i32* %c, align 4
  %idxprom7 = sext i32 %118 to i64
  %arrayidx8 = getelementptr inbounds float, float* %115, i64 %idxprom7
  %119 = bitcast float* %arrayidx8 to i8*
  %120 = call i64 @getAddr(i8* %119)
  %121 = load float, float* %arrayidx8, align 4
  %conv = fpext float %121 to double
  %122 = bitcast double* %dval to i8*
  %123 = call i64 @getAddr(i8* %122)
  call void @setRealTemp(i64 %123, i64 %120)
  store double %conv, double* %dval, align 8
  %124 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %for.body
  %125 = bitcast i32* %i to i8*
  %126 = call i64 @getAddr(i8* %125)
  %127 = load i32, i32* %i, align 4
  %128 = bitcast i32* %veclen to i8*
  %129 = call i64 @getAddr(i8* %128)
  %130 = load i32, i32* %veclen, align 4
  %cmp10 = icmp slt i32 %127, %130
  br i1 %cmp10, label %for.body12, label %for.end

for.body12:                                       ; preds = %for.cond9
  %131 = bitcast float** %x.addr to i8*
  %132 = call i64 @getAddr(i8* %131)
  %133 = load float*, float** %x.addr, align 8
  %134 = bitcast i32* %i to i8*
  %135 = call i64 @getAddr(i8* %134)
  %136 = load i32, i32* %i, align 4
  %idxprom13 = sext i32 %136 to i64
  %arrayidx14 = getelementptr inbounds float, float* %133, i64 %idxprom13
  %137 = bitcast float* %arrayidx14 to i8*
  %138 = call i64 @getAddr(i8* %137)
  %139 = load float, float* %arrayidx14, align 4
  %140 = bitcast float** %m to i8*
  %141 = call i64 @getAddr(i8* %140)
  %142 = load float*, float** %m, align 8
  %143 = bitcast i32* %i to i8*
  %144 = call i64 @getAddr(i8* %143)
  %145 = load i32, i32* %i, align 4
  %idxprom15 = sext i32 %145 to i64
  %arrayidx16 = getelementptr inbounds float, float* %142, i64 %idxprom15
  %146 = bitcast float* %arrayidx16 to i8*
  %147 = call i64 @getAddr(i8* %146)
  %148 = load float, float* %arrayidx16, align 4
  %sub = fsub float %139, %148
  %149 = call i64 bitcast (i64 (i32, i64, i64, double, double, double, i32)* @computeReal to i64 (i32, i64, i64, float, float, float, i32)*)(i32 14, i64 %138, i64 %147, float %139, float %148, float %sub, i32 1707)
  %conv17 = fpext float %sub to double
  %150 = bitcast double* %diff to i8*
  %151 = call i64 @getAddr(i8* %150)
  call void @setRealTemp(i64 %151, i64 %149)
  store double %conv17, double* %diff, align 8
  %152 = bitcast double* %diff to i8*
  %153 = call i64 @getAddr(i8* %152)
  %154 = load double, double* %diff, align 8
  %155 = bitcast double* %diff to i8*
  %156 = call i64 @getAddr(i8* %155)
  %157 = load double, double* %diff, align 8
  %mul = fmul double %154, %157
  %158 = call i64 @computeReal(i32 16, i64 %153, i64 %156, double %154, double %157, double %mul, i32 1712)
  %159 = bitcast float** %v to i8*
  %160 = call i64 @getAddr(i8* %159)
  %161 = load float*, float** %v, align 8
  %162 = bitcast i32* %i to i8*
  %163 = call i64 @getAddr(i8* %162)
  %164 = load i32, i32* %i, align 4
  %idxprom18 = sext i32 %164 to i64
  %arrayidx19 = getelementptr inbounds float, float* %161, i64 %idxprom18
  %165 = bitcast float* %arrayidx19 to i8*
  %166 = call i64 @getAddr(i8* %165)
  %167 = load float, float* %arrayidx19, align 4
  %conv20 = fpext float %167 to double
  %mul21 = fmul double %mul, %conv20
  %168 = call i64 @computeReal(i32 16, i64 %158, i64 %166, double %mul, double %conv20, double %mul21, i32 1719)
  %169 = bitcast double* %dval to i8*
  %170 = call i64 @getAddr(i8* %169)
  %171 = load double, double* %dval, align 8
  %sub22 = fsub double %171, %mul21
  %172 = call i64 @computeReal(i32 14, i64 %170, i64 %168, double %171, double %mul21, double %sub22, i32 1721)
  %173 = bitcast double* %dval to i8*
  %174 = call i64 @getAddr(i8* %173)
  call void @setRealTemp(i64 %174, i64 %172)
  store double %sub22, double* %dval, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body12
  %175 = bitcast i32* %i to i8*
  %176 = call i64 @getAddr(i8* %175)
  %177 = load i32, i32* %i, align 4
  %inc = add nsw i32 %177, 1
  %178 = bitcast i32* %i to i8*
  store i32 %inc, i32* %i, align 4
  br label %for.cond9

for.end:                                          ; preds = %for.cond9
  %179 = bitcast double* %dval to i8*
  %180 = call i64 @getAddr(i8* %179)
  %181 = load double, double* %dval, align 8
  %182 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %183 = call i64 @getAddr(i8* %182)
  %184 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %distfloor = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %184, i32 0, i32 4
  %185 = bitcast double* %distfloor to i8*
  %186 = call i64 @getAddr(i8* %185)
  %187 = load double, double* %distfloor, align 8
  %cmp23 = fcmp olt double %181, %187
  call void @checkBranch(double %181, i64 %180, double %187, i64 %186, i32 4, i1 %cmp23, i32 1732)
  br i1 %cmp23, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %188 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %189 = call i64 @getAddr(i8* %188)
  %190 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %distfloor25 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %190, i32 0, i32 4
  %191 = bitcast double* %distfloor25 to i8*
  %192 = call i64 @getAddr(i8* %191)
  %193 = load double, double* %distfloor25, align 8
  %194 = bitcast double* %dval to i8*
  %195 = call i64 @getAddr(i8* %194)
  call void @setRealTemp(i64 %195, i64 %192)
  store double %193, double* %dval, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  %196 = bitcast double* %f to i8*
  %197 = call i64 @getAddr(i8* %196)
  %198 = load double, double* %f, align 8
  %199 = bitcast double* %dval to i8*
  %200 = call i64 @getAddr(i8* %199)
  %201 = load double, double* %dval, align 8
  %mul26 = fmul double %198, %201
  %202 = call i64 @computeReal(i32 16, i64 %197, i64 %200, double %198, double %201, double %mul26, i32 1741)
  %conv27 = fptosi double %mul26 to i32
  %203 = bitcast i32** %score.addr to i8*
  %204 = call i64 @getAddr(i8* %203)
  %205 = load i32*, i32** %score.addr, align 8
  %206 = bitcast i32* %c to i8*
  %207 = call i64 @getAddr(i8* %206)
  %208 = load i32, i32* %c, align 4
  %idxprom28 = sext i32 %208 to i64
  %arrayidx29 = getelementptr inbounds i32, i32* %205, i64 %idxprom28
  %209 = bitcast i32* %arrayidx29 to i8*
  store i32 %conv27, i32* %arrayidx29, align 4
  %210 = bitcast i32** %score.addr to i8*
  %211 = call i64 @getAddr(i8* %210)
  %212 = load i32*, i32** %score.addr, align 8
  %213 = bitcast i32* %c to i8*
  %214 = call i64 @getAddr(i8* %213)
  %215 = load i32, i32* %c, align 4
  %idxprom30 = sext i32 %215 to i64
  %arrayidx31 = getelementptr inbounds i32, i32* %212, i64 %idxprom30
  %216 = bitcast i32* %arrayidx31 to i8*
  %217 = call i64 @getAddr(i8* %216)
  %218 = load i32, i32* %arrayidx31, align 4
  %219 = bitcast i32* %bs to i8*
  %220 = call i64 @getAddr(i8* %219)
  %221 = load i32, i32* %bs, align 4
  %cmp32 = icmp sgt i32 %218, %221
  br i1 %cmp32, label %if.then34, label %if.end37

if.then34:                                        ; preds = %if.end
  %222 = bitcast i32** %score.addr to i8*
  %223 = call i64 @getAddr(i8* %222)
  %224 = load i32*, i32** %score.addr, align 8
  %225 = bitcast i32* %c to i8*
  %226 = call i64 @getAddr(i8* %225)
  %227 = load i32, i32* %c, align 4
  %idxprom35 = sext i32 %227 to i64
  %arrayidx36 = getelementptr inbounds i32, i32* %224, i64 %idxprom35
  %228 = bitcast i32* %arrayidx36 to i8*
  %229 = call i64 @getAddr(i8* %228)
  %230 = load i32, i32* %arrayidx36, align 4
  %231 = bitcast i32* %bs to i8*
  store i32 %230, i32* %bs, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.then34, %if.end
  br label %for.inc38

for.inc38:                                        ; preds = %if.end37
  %232 = bitcast i32* %c to i8*
  %233 = call i64 @getAddr(i8* %232)
  %234 = load i32, i32* %c, align 4
  %inc39 = add nsw i32 %234, 1
  %235 = bitcast i32* %c to i8*
  store i32 %inc39, i32* %c, align 4
  br label %for.cond

for.end40:                                        ; preds = %for.cond
  %236 = bitcast i32* %bs to i8*
  %237 = call i64 @getAddr(i8* %236)
  %238 = load i32, i32* %bs, align 4
  %239 = bitcast i32 (%struct.mgau_model_t*, i32, float*, i32*)* @mgau_comp_eval to i8*
  %240 = call i64 @getAddr(i8* %239)
  call void @funcExit(i64 %240)
  %241 = bitcast i32 (%struct.mgau_model_t*, i32, float*, i32*)* @mgau_comp_eval to i8*
  %242 = call i64 @getAddr(i8* %241)
  call void @trackReturn(i64 %242, i64 %237)
  call void @cleanComputeReal(i32 1707)
  call void @cleanComputeReal(i32 1712)
  call void @cleanComputeReal(i32 1719)
  call void @cleanComputeReal(i32 1721)
  call void @cleanComputeReal(i32 1741)
  ret i32 %238
}

declare dso_local double @log_to_logs3_factor() #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mgau_eval(%struct.mgau_model_t* %g, i32 %m, i32* %active, float* %x) #0 {
entry:
  %0 = bitcast i32 (%struct.mgau_model_t*, i32, i32*, float*)* @mgau_eval to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %g.addr = alloca %struct.mgau_model_t*, align 8
  %2 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %m.addr = alloca i32, align 4
  %4 = bitcast i32* %m.addr to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @handleAlloca(i64 %5)
  %active.addr = alloca i32*, align 8
  %6 = bitcast i32** %active.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @handleAlloca(i64 %7)
  %x.addr = alloca float*, align 8
  %8 = bitcast float** %x.addr to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @handleAlloca(i64 %9)
  %mgau = alloca %struct.mgau_t*, align 8
  %10 = bitcast %struct.mgau_t** %mgau to i8*
  %11 = call i64 @getAddr(i8* %10)
  call void @handleAlloca(i64 %11)
  %veclen = alloca i32, align 4
  %12 = bitcast i32* %veclen to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @handleAlloca(i64 %13)
  %score = alloca i32, align 4
  %14 = bitcast i32* %score to i8*
  %15 = call i64 @getAddr(i8* %14)
  call void @handleAlloca(i64 %15)
  %m1 = alloca float*, align 8
  %16 = bitcast float** %m1 to i8*
  %17 = call i64 @getAddr(i8* %16)
  call void @handleAlloca(i64 %17)
  %m2 = alloca float*, align 8
  %18 = bitcast float** %m2 to i8*
  %19 = call i64 @getAddr(i8* %18)
  call void @handleAlloca(i64 %19)
  %v1 = alloca float*, align 8
  %20 = bitcast float** %v1 to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void @handleAlloca(i64 %21)
  %v2 = alloca float*, align 8
  %22 = bitcast float** %v2 to i8*
  %23 = call i64 @getAddr(i8* %22)
  call void @handleAlloca(i64 %23)
  %dval1 = alloca double, align 8
  %24 = bitcast double* %dval1 to i8*
  %25 = call i64 @getAddr(i8* %24)
  call void @handleAlloca(i64 %25)
  %dval2 = alloca double, align 8
  %26 = bitcast double* %dval2 to i8*
  %27 = call i64 @getAddr(i8* %26)
  call void @handleAlloca(i64 %27)
  %diff1 = alloca double, align 8
  %28 = bitcast double* %diff1 to i8*
  %29 = call i64 @getAddr(i8* %28)
  call void @handleAlloca(i64 %29)
  %diff2 = alloca double, align 8
  %30 = bitcast double* %diff2 to i8*
  %31 = call i64 @getAddr(i8* %30)
  call void @handleAlloca(i64 %31)
  %f = alloca double, align 8
  %32 = bitcast double* %f to i8*
  %33 = call i64 @getAddr(i8* %32)
  call void @handleAlloca(i64 %33)
  %i = alloca i32, align 4
  %34 = bitcast i32* %i to i8*
  %35 = call i64 @getAddr(i8* %34)
  call void @handleAlloca(i64 %35)
  %j = alloca i32, align 4
  %36 = bitcast i32* %j to i8*
  %37 = call i64 @getAddr(i8* %36)
  call void @handleAlloca(i64 %37)
  %c = alloca i32, align 4
  %38 = bitcast i32* %c to i8*
  %39 = call i64 @getAddr(i8* %38)
  call void @handleAlloca(i64 %39)
  %40 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %41 = call i64 @getAddr(i8* %40)
  %42 = bitcast %struct.mgau_model_t* %g to i8*
  %43 = call i64 @getAddr(i8* %42)
  call void @setRealTemp(i64 %41, i64 %43)
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %g.addr, align 8
  %44 = bitcast i32* %m.addr to i8*
  store i32 %m, i32* %m.addr, align 4
  %45 = bitcast i32** %active.addr to i8*
  %46 = call i64 @getAddr(i8* %45)
  %47 = bitcast i32* %active to i8*
  %48 = call i64 @getAddr(i8* %47)
  call void @setRealTemp(i64 %46, i64 %48)
  store i32* %active, i32** %active.addr, align 8
  %49 = bitcast float** %x.addr to i8*
  %50 = call i64 @getAddr(i8* %49)
  %51 = bitcast float* %x to i8*
  %52 = call i64 @getAddr(i8* %51)
  call void @setRealTemp(i64 %50, i64 %52)
  store float* %x, float** %x.addr, align 8
  %53 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %54 = call i64 @getAddr(i8* %53)
  %55 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %veclen1 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %55, i32 0, i32 2
  %56 = bitcast i32* %veclen1 to i8*
  %57 = call i64 @getAddr(i8* %56)
  %58 = load i32, i32* %veclen1, align 8
  %59 = bitcast i32* %veclen to i8*
  store i32 %58, i32* %veclen, align 4
  %60 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %61 = call i64 @getAddr(i8* %60)
  %62 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau2 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %62, i32 0, i32 3
  %63 = bitcast %struct.mgau_t** %mgau2 to i8*
  %64 = call i64 @getAddr(i8* %63)
  %65 = load %struct.mgau_t*, %struct.mgau_t** %mgau2, align 8
  %66 = bitcast i32* %m.addr to i8*
  %67 = call i64 @getAddr(i8* %66)
  %68 = load i32, i32* %m.addr, align 4
  %idxprom = sext i32 %68 to i64
  %arrayidx = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %65, i64 %idxprom
  %69 = bitcast %struct.mgau_t** %mgau to i8*
  %70 = call i64 @getAddr(i8* %69)
  %71 = bitcast %struct.mgau_t* %arrayidx to i8*
  %72 = call i64 @getAddr(i8* %71)
  call void @setRealTemp(i64 %70, i64 %72)
  store %struct.mgau_t* %arrayidx, %struct.mgau_t** %mgau, align 8
  %73 = bitcast double ()* @log_to_logs3_factor to i8*
  %74 = call i64 @getAddr(i8* %73)
  %call = call double @log_to_logs3_factor()
  %75 = bitcast double* %f to i8*
  %76 = call i64 @getAddr(i8* %75)
  call void @setRealReturn(i64 %76)
  store double %call, double* %f, align 8
  %77 = bitcast i32* %score to i8*
  store i32 -939524096, i32* %score, align 4
  %78 = bitcast i32** %active.addr to i8*
  %79 = call i64 @getAddr(i8* %78)
  %80 = load i32*, i32** %active.addr, align 8
  %tobool = icmp ne i32* %80, null
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %81 = bitcast i32* %c to i8*
  store i32 0, i32* %c, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc72, %if.then
  %82 = bitcast i32* %c to i8*
  %83 = call i64 @getAddr(i8* %82)
  %84 = load i32, i32* %c, align 4
  %85 = bitcast %struct.mgau_t** %mgau to i8*
  %86 = call i64 @getAddr(i8* %85)
  %87 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %n_comp = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %87, i32 0, i32 0
  %88 = bitcast i32* %n_comp to i8*
  %89 = call i64 @getAddr(i8* %88)
  %90 = load i32, i32* %n_comp, align 8
  %sub = sub nsw i32 %90, 1
  %cmp = icmp slt i32 %84, %sub
  br i1 %cmp, label %for.body, label %for.end74

for.body:                                         ; preds = %for.cond
  %91 = bitcast %struct.mgau_t** %mgau to i8*
  %92 = call i64 @getAddr(i8* %91)
  %93 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %mean = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %93, i32 0, i32 1
  %94 = bitcast float*** %mean to i8*
  %95 = call i64 @getAddr(i8* %94)
  %96 = load float**, float*** %mean, align 8
  %97 = bitcast i32* %c to i8*
  %98 = call i64 @getAddr(i8* %97)
  %99 = load i32, i32* %c, align 4
  %idxprom3 = sext i32 %99 to i64
  %arrayidx4 = getelementptr inbounds float*, float** %96, i64 %idxprom3
  %100 = bitcast float** %arrayidx4 to i8*
  %101 = call i64 @getAddr(i8* %100)
  %102 = load float*, float** %arrayidx4, align 8
  %103 = bitcast float** %m1 to i8*
  %104 = call i64 @getAddr(i8* %103)
  %105 = bitcast float* %102 to i8*
  %106 = call i64 @getAddr(i8* %105)
  call void @setRealTemp(i64 %104, i64 %106)
  store float* %102, float** %m1, align 8
  %107 = bitcast %struct.mgau_t** %mgau to i8*
  %108 = call i64 @getAddr(i8* %107)
  %109 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %mean5 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %109, i32 0, i32 1
  %110 = bitcast float*** %mean5 to i8*
  %111 = call i64 @getAddr(i8* %110)
  %112 = load float**, float*** %mean5, align 8
  %113 = bitcast i32* %c to i8*
  %114 = call i64 @getAddr(i8* %113)
  %115 = load i32, i32* %c, align 4
  %add = add nsw i32 %115, 1
  %idxprom6 = sext i32 %add to i64
  %arrayidx7 = getelementptr inbounds float*, float** %112, i64 %idxprom6
  %116 = bitcast float** %arrayidx7 to i8*
  %117 = call i64 @getAddr(i8* %116)
  %118 = load float*, float** %arrayidx7, align 8
  %119 = bitcast float** %m2 to i8*
  %120 = call i64 @getAddr(i8* %119)
  %121 = bitcast float* %118 to i8*
  %122 = call i64 @getAddr(i8* %121)
  call void @setRealTemp(i64 %120, i64 %122)
  store float* %118, float** %m2, align 8
  %123 = bitcast %struct.mgau_t** %mgau to i8*
  %124 = call i64 @getAddr(i8* %123)
  %125 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %var = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %125, i32 0, i32 2
  %126 = bitcast float*** %var to i8*
  %127 = call i64 @getAddr(i8* %126)
  %128 = load float**, float*** %var, align 8
  %129 = bitcast i32* %c to i8*
  %130 = call i64 @getAddr(i8* %129)
  %131 = load i32, i32* %c, align 4
  %idxprom8 = sext i32 %131 to i64
  %arrayidx9 = getelementptr inbounds float*, float** %128, i64 %idxprom8
  %132 = bitcast float** %arrayidx9 to i8*
  %133 = call i64 @getAddr(i8* %132)
  %134 = load float*, float** %arrayidx9, align 8
  %135 = bitcast float** %v1 to i8*
  %136 = call i64 @getAddr(i8* %135)
  %137 = bitcast float* %134 to i8*
  %138 = call i64 @getAddr(i8* %137)
  call void @setRealTemp(i64 %136, i64 %138)
  store float* %134, float** %v1, align 8
  %139 = bitcast %struct.mgau_t** %mgau to i8*
  %140 = call i64 @getAddr(i8* %139)
  %141 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %var10 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %141, i32 0, i32 2
  %142 = bitcast float*** %var10 to i8*
  %143 = call i64 @getAddr(i8* %142)
  %144 = load float**, float*** %var10, align 8
  %145 = bitcast i32* %c to i8*
  %146 = call i64 @getAddr(i8* %145)
  %147 = load i32, i32* %c, align 4
  %add11 = add nsw i32 %147, 1
  %idxprom12 = sext i32 %add11 to i64
  %arrayidx13 = getelementptr inbounds float*, float** %144, i64 %idxprom12
  %148 = bitcast float** %arrayidx13 to i8*
  %149 = call i64 @getAddr(i8* %148)
  %150 = load float*, float** %arrayidx13, align 8
  %151 = bitcast float** %v2 to i8*
  %152 = call i64 @getAddr(i8* %151)
  %153 = bitcast float* %150 to i8*
  %154 = call i64 @getAddr(i8* %153)
  call void @setRealTemp(i64 %152, i64 %154)
  store float* %150, float** %v2, align 8
  %155 = bitcast %struct.mgau_t** %mgau to i8*
  %156 = call i64 @getAddr(i8* %155)
  %157 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %lrd = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %157, i32 0, i32 3
  %158 = bitcast float** %lrd to i8*
  %159 = call i64 @getAddr(i8* %158)
  %160 = load float*, float** %lrd, align 8
  %161 = bitcast i32* %c to i8*
  %162 = call i64 @getAddr(i8* %161)
  %163 = load i32, i32* %c, align 4
  %idxprom14 = sext i32 %163 to i64
  %arrayidx15 = getelementptr inbounds float, float* %160, i64 %idxprom14
  %164 = bitcast float* %arrayidx15 to i8*
  %165 = call i64 @getAddr(i8* %164)
  %166 = load float, float* %arrayidx15, align 4
  %conv = fpext float %166 to double
  %167 = bitcast double* %dval1 to i8*
  %168 = call i64 @getAddr(i8* %167)
  call void @setRealTemp(i64 %168, i64 %165)
  store double %conv, double* %dval1, align 8
  %169 = bitcast %struct.mgau_t** %mgau to i8*
  %170 = call i64 @getAddr(i8* %169)
  %171 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %lrd16 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %171, i32 0, i32 3
  %172 = bitcast float** %lrd16 to i8*
  %173 = call i64 @getAddr(i8* %172)
  %174 = load float*, float** %lrd16, align 8
  %175 = bitcast i32* %c to i8*
  %176 = call i64 @getAddr(i8* %175)
  %177 = load i32, i32* %c, align 4
  %add17 = add nsw i32 %177, 1
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds float, float* %174, i64 %idxprom18
  %178 = bitcast float* %arrayidx19 to i8*
  %179 = call i64 @getAddr(i8* %178)
  %180 = load float, float* %arrayidx19, align 4
  %conv20 = fpext float %180 to double
  %181 = bitcast double* %dval2 to i8*
  %182 = call i64 @getAddr(i8* %181)
  call void @setRealTemp(i64 %182, i64 %179)
  store double %conv20, double* %dval2, align 8
  %183 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc, %for.body
  %184 = bitcast i32* %i to i8*
  %185 = call i64 @getAddr(i8* %184)
  %186 = load i32, i32* %i, align 4
  %187 = bitcast i32* %veclen to i8*
  %188 = call i64 @getAddr(i8* %187)
  %189 = load i32, i32* %veclen, align 4
  %cmp22 = icmp slt i32 %186, %189
  br i1 %cmp22, label %for.body24, label %for.end

for.body24:                                       ; preds = %for.cond21
  %190 = bitcast float** %x.addr to i8*
  %191 = call i64 @getAddr(i8* %190)
  %192 = load float*, float** %x.addr, align 8
  %193 = bitcast i32* %i to i8*
  %194 = call i64 @getAddr(i8* %193)
  %195 = load i32, i32* %i, align 4
  %idxprom25 = sext i32 %195 to i64
  %arrayidx26 = getelementptr inbounds float, float* %192, i64 %idxprom25
  %196 = bitcast float* %arrayidx26 to i8*
  %197 = call i64 @getAddr(i8* %196)
  %198 = load float, float* %arrayidx26, align 4
  %199 = bitcast float** %m1 to i8*
  %200 = call i64 @getAddr(i8* %199)
  %201 = load float*, float** %m1, align 8
  %202 = bitcast i32* %i to i8*
  %203 = call i64 @getAddr(i8* %202)
  %204 = load i32, i32* %i, align 4
  %idxprom27 = sext i32 %204 to i64
  %arrayidx28 = getelementptr inbounds float, float* %201, i64 %idxprom27
  %205 = bitcast float* %arrayidx28 to i8*
  %206 = call i64 @getAddr(i8* %205)
  %207 = load float, float* %arrayidx28, align 4
  %sub29 = fsub float %198, %207
  %208 = call i64 bitcast (i64 (i32, i64, i64, double, double, double, i32)* @computeReal to i64 (i32, i64, i64, float, float, float, i32)*)(i32 14, i64 %197, i64 %206, float %198, float %207, float %sub29, i32 1894)
  %conv30 = fpext float %sub29 to double
  %209 = bitcast double* %diff1 to i8*
  %210 = call i64 @getAddr(i8* %209)
  call void @setRealTemp(i64 %210, i64 %208)
  store double %conv30, double* %diff1, align 8
  %211 = bitcast double* %diff1 to i8*
  %212 = call i64 @getAddr(i8* %211)
  %213 = load double, double* %diff1, align 8
  %214 = bitcast double* %diff1 to i8*
  %215 = call i64 @getAddr(i8* %214)
  %216 = load double, double* %diff1, align 8
  %mul = fmul double %213, %216
  %217 = call i64 @computeReal(i32 16, i64 %212, i64 %215, double %213, double %216, double %mul, i32 1899)
  %218 = bitcast float** %v1 to i8*
  %219 = call i64 @getAddr(i8* %218)
  %220 = load float*, float** %v1, align 8
  %221 = bitcast i32* %i to i8*
  %222 = call i64 @getAddr(i8* %221)
  %223 = load i32, i32* %i, align 4
  %idxprom31 = sext i32 %223 to i64
  %arrayidx32 = getelementptr inbounds float, float* %220, i64 %idxprom31
  %224 = bitcast float* %arrayidx32 to i8*
  %225 = call i64 @getAddr(i8* %224)
  %226 = load float, float* %arrayidx32, align 4
  %conv33 = fpext float %226 to double
  %mul34 = fmul double %mul, %conv33
  %227 = call i64 @computeReal(i32 16, i64 %217, i64 %225, double %mul, double %conv33, double %mul34, i32 1906)
  %228 = bitcast double* %dval1 to i8*
  %229 = call i64 @getAddr(i8* %228)
  %230 = load double, double* %dval1, align 8
  %sub35 = fsub double %230, %mul34
  %231 = call i64 @computeReal(i32 14, i64 %229, i64 %227, double %230, double %mul34, double %sub35, i32 1908)
  %232 = bitcast double* %dval1 to i8*
  %233 = call i64 @getAddr(i8* %232)
  call void @setRealTemp(i64 %233, i64 %231)
  store double %sub35, double* %dval1, align 8
  %234 = bitcast float** %x.addr to i8*
  %235 = call i64 @getAddr(i8* %234)
  %236 = load float*, float** %x.addr, align 8
  %237 = bitcast i32* %i to i8*
  %238 = call i64 @getAddr(i8* %237)
  %239 = load i32, i32* %i, align 4
  %idxprom36 = sext i32 %239 to i64
  %arrayidx37 = getelementptr inbounds float, float* %236, i64 %idxprom36
  %240 = bitcast float* %arrayidx37 to i8*
  %241 = call i64 @getAddr(i8* %240)
  %242 = load float, float* %arrayidx37, align 4
  %243 = bitcast float** %m2 to i8*
  %244 = call i64 @getAddr(i8* %243)
  %245 = load float*, float** %m2, align 8
  %246 = bitcast i32* %i to i8*
  %247 = call i64 @getAddr(i8* %246)
  %248 = load i32, i32* %i, align 4
  %idxprom38 = sext i32 %248 to i64
  %arrayidx39 = getelementptr inbounds float, float* %245, i64 %idxprom38
  %249 = bitcast float* %arrayidx39 to i8*
  %250 = call i64 @getAddr(i8* %249)
  %251 = load float, float* %arrayidx39, align 4
  %sub40 = fsub float %242, %251
  %252 = call i64 bitcast (i64 (i32, i64, i64, double, double, double, i32)* @computeReal to i64 (i32, i64, i64, float, float, float, i32)*)(i32 14, i64 %241, i64 %250, float %242, float %251, float %sub40, i32 1920)
  %conv41 = fpext float %sub40 to double
  %253 = bitcast double* %diff2 to i8*
  %254 = call i64 @getAddr(i8* %253)
  call void @setRealTemp(i64 %254, i64 %252)
  store double %conv41, double* %diff2, align 8
  %255 = bitcast double* %diff2 to i8*
  %256 = call i64 @getAddr(i8* %255)
  %257 = load double, double* %diff2, align 8
  %258 = bitcast double* %diff2 to i8*
  %259 = call i64 @getAddr(i8* %258)
  %260 = load double, double* %diff2, align 8
  %mul42 = fmul double %257, %260
  %261 = call i64 @computeReal(i32 16, i64 %256, i64 %259, double %257, double %260, double %mul42, i32 1925)
  %262 = bitcast float** %v2 to i8*
  %263 = call i64 @getAddr(i8* %262)
  %264 = load float*, float** %v2, align 8
  %265 = bitcast i32* %i to i8*
  %266 = call i64 @getAddr(i8* %265)
  %267 = load i32, i32* %i, align 4
  %idxprom43 = sext i32 %267 to i64
  %arrayidx44 = getelementptr inbounds float, float* %264, i64 %idxprom43
  %268 = bitcast float* %arrayidx44 to i8*
  %269 = call i64 @getAddr(i8* %268)
  %270 = load float, float* %arrayidx44, align 4
  %conv45 = fpext float %270 to double
  %mul46 = fmul double %mul42, %conv45
  %271 = call i64 @computeReal(i32 16, i64 %261, i64 %269, double %mul42, double %conv45, double %mul46, i32 1932)
  %272 = bitcast double* %dval2 to i8*
  %273 = call i64 @getAddr(i8* %272)
  %274 = load double, double* %dval2, align 8
  %sub47 = fsub double %274, %mul46
  %275 = call i64 @computeReal(i32 14, i64 %273, i64 %271, double %274, double %mul46, double %sub47, i32 1934)
  %276 = bitcast double* %dval2 to i8*
  %277 = call i64 @getAddr(i8* %276)
  call void @setRealTemp(i64 %277, i64 %275)
  store double %sub47, double* %dval2, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body24
  %278 = bitcast i32* %i to i8*
  %279 = call i64 @getAddr(i8* %278)
  %280 = load i32, i32* %i, align 4
  %inc = add nsw i32 %280, 1
  %281 = bitcast i32* %i to i8*
  store i32 %inc, i32* %i, align 4
  br label %for.cond21

for.end:                                          ; preds = %for.cond21
  %282 = bitcast double* %dval1 to i8*
  %283 = call i64 @getAddr(i8* %282)
  %284 = load double, double* %dval1, align 8
  %285 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %286 = call i64 @getAddr(i8* %285)
  %287 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %distfloor = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %287, i32 0, i32 4
  %288 = bitcast double* %distfloor to i8*
  %289 = call i64 @getAddr(i8* %288)
  %290 = load double, double* %distfloor, align 8
  %cmp48 = fcmp olt double %284, %290
  call void @checkBranch(double %284, i64 %283, double %290, i64 %289, i32 4, i1 %cmp48, i32 1945)
  br i1 %cmp48, label %if.then50, label %if.end

if.then50:                                        ; preds = %for.end
  %291 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %292 = call i64 @getAddr(i8* %291)
  %293 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %distfloor51 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %293, i32 0, i32 4
  %294 = bitcast double* %distfloor51 to i8*
  %295 = call i64 @getAddr(i8* %294)
  %296 = load double, double* %distfloor51, align 8
  %297 = bitcast double* %dval1 to i8*
  %298 = call i64 @getAddr(i8* %297)
  call void @setRealTemp(i64 %298, i64 %295)
  store double %296, double* %dval1, align 8
  br label %if.end

if.end:                                           ; preds = %if.then50, %for.end
  %299 = bitcast double* %dval2 to i8*
  %300 = call i64 @getAddr(i8* %299)
  %301 = load double, double* %dval2, align 8
  %302 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %303 = call i64 @getAddr(i8* %302)
  %304 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %distfloor52 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %304, i32 0, i32 4
  %305 = bitcast double* %distfloor52 to i8*
  %306 = call i64 @getAddr(i8* %305)
  %307 = load double, double* %distfloor52, align 8
  %cmp53 = fcmp olt double %301, %307
  call void @checkBranch(double %301, i64 %300, double %307, i64 %306, i32 4, i1 %cmp53, i32 1956)
  br i1 %cmp53, label %if.then55, label %if.end57

if.then55:                                        ; preds = %if.end
  %308 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %309 = call i64 @getAddr(i8* %308)
  %310 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %distfloor56 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %310, i32 0, i32 4
  %311 = bitcast double* %distfloor56 to i8*
  %312 = call i64 @getAddr(i8* %311)
  %313 = load double, double* %distfloor56, align 8
  %314 = bitcast double* %dval2 to i8*
  %315 = call i64 @getAddr(i8* %314)
  call void @setRealTemp(i64 %315, i64 %312)
  store double %313, double* %dval2, align 8
  br label %if.end57

if.end57:                                         ; preds = %if.then55, %if.end
  %316 = bitcast i32* %score to i8*
  %317 = call i64 @getAddr(i8* %316)
  %318 = load i32, i32* %score, align 4
  %319 = bitcast double* %f to i8*
  %320 = call i64 @getAddr(i8* %319)
  %321 = load double, double* %f, align 8
  %322 = bitcast double* %dval1 to i8*
  %323 = call i64 @getAddr(i8* %322)
  %324 = load double, double* %dval1, align 8
  %mul58 = fmul double %321, %324
  %325 = call i64 @computeReal(i32 16, i64 %320, i64 %323, double %321, double %324, double %mul58, i32 1966)
  %conv59 = fptosi double %mul58 to i32
  %326 = bitcast %struct.mgau_t** %mgau to i8*
  %327 = call i64 @getAddr(i8* %326)
  %328 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %mixw = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %328, i32 0, i32 4
  %329 = bitcast i32** %mixw to i8*
  %330 = call i64 @getAddr(i8* %329)
  %331 = load i32*, i32** %mixw, align 8
  %332 = bitcast i32* %c to i8*
  %333 = call i64 @getAddr(i8* %332)
  %334 = load i32, i32* %c, align 4
  %idxprom60 = sext i32 %334 to i64
  %arrayidx61 = getelementptr inbounds i32, i32* %331, i64 %idxprom60
  %335 = bitcast i32* %arrayidx61 to i8*
  %336 = call i64 @getAddr(i8* %335)
  %337 = load i32, i32* %arrayidx61, align 4
  %add62 = add nsw i32 %conv59, %337
  %338 = bitcast i32 (i32, i32)* @logs3_add to i8*
  %339 = call i64 @getAddr(i8* %338)
  call void @addFunArg(i32 0, i64 %339, i64 %317)
  %call63 = call i32 @logs3_add(i32 %318, i32 %add62)
  %340 = bitcast i32* %score to i8*
  store i32 %call63, i32* %score, align 4
  %341 = bitcast i32* %score to i8*
  %342 = call i64 @getAddr(i8* %341)
  %343 = load i32, i32* %score, align 4
  %344 = bitcast double* %f to i8*
  %345 = call i64 @getAddr(i8* %344)
  %346 = load double, double* %f, align 8
  %347 = bitcast double* %dval2 to i8*
  %348 = call i64 @getAddr(i8* %347)
  %349 = load double, double* %dval2, align 8
  %mul64 = fmul double %346, %349
  %350 = call i64 @computeReal(i32 16, i64 %345, i64 %348, double %346, double %349, double %mul64, i32 1981)
  %conv65 = fptosi double %mul64 to i32
  %351 = bitcast %struct.mgau_t** %mgau to i8*
  %352 = call i64 @getAddr(i8* %351)
  %353 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %mixw66 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %353, i32 0, i32 4
  %354 = bitcast i32** %mixw66 to i8*
  %355 = call i64 @getAddr(i8* %354)
  %356 = load i32*, i32** %mixw66, align 8
  %357 = bitcast i32* %c to i8*
  %358 = call i64 @getAddr(i8* %357)
  %359 = load i32, i32* %c, align 4
  %add67 = add nsw i32 %359, 1
  %idxprom68 = sext i32 %add67 to i64
  %arrayidx69 = getelementptr inbounds i32, i32* %356, i64 %idxprom68
  %360 = bitcast i32* %arrayidx69 to i8*
  %361 = call i64 @getAddr(i8* %360)
  %362 = load i32, i32* %arrayidx69, align 4
  %add70 = add nsw i32 %conv65, %362
  %363 = bitcast i32 (i32, i32)* @logs3_add to i8*
  %364 = call i64 @getAddr(i8* %363)
  call void @addFunArg(i32 0, i64 %364, i64 %342)
  %call71 = call i32 @logs3_add(i32 %343, i32 %add70)
  %365 = bitcast i32* %score to i8*
  store i32 %call71, i32* %score, align 4
  br label %for.inc72

for.inc72:                                        ; preds = %if.end57
  %366 = bitcast i32* %c to i8*
  %367 = call i64 @getAddr(i8* %366)
  %368 = load i32, i32* %c, align 4
  %add73 = add nsw i32 %368, 2
  %369 = bitcast i32* %c to i8*
  store i32 %add73, i32* %c, align 4
  br label %for.cond

for.end74:                                        ; preds = %for.cond
  %370 = bitcast i32* %c to i8*
  %371 = call i64 @getAddr(i8* %370)
  %372 = load i32, i32* %c, align 4
  %373 = bitcast %struct.mgau_t** %mgau to i8*
  %374 = call i64 @getAddr(i8* %373)
  %375 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %n_comp75 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %375, i32 0, i32 0
  %376 = bitcast i32* %n_comp75 to i8*
  %377 = call i64 @getAddr(i8* %376)
  %378 = load i32, i32* %n_comp75, align 8
  %cmp76 = icmp slt i32 %372, %378
  br i1 %cmp76, label %if.then78, label %if.end121

if.then78:                                        ; preds = %for.end74
  %379 = bitcast %struct.mgau_t** %mgau to i8*
  %380 = call i64 @getAddr(i8* %379)
  %381 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %mean79 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %381, i32 0, i32 1
  %382 = bitcast float*** %mean79 to i8*
  %383 = call i64 @getAddr(i8* %382)
  %384 = load float**, float*** %mean79, align 8
  %385 = bitcast i32* %c to i8*
  %386 = call i64 @getAddr(i8* %385)
  %387 = load i32, i32* %c, align 4
  %idxprom80 = sext i32 %387 to i64
  %arrayidx81 = getelementptr inbounds float*, float** %384, i64 %idxprom80
  %388 = bitcast float** %arrayidx81 to i8*
  %389 = call i64 @getAddr(i8* %388)
  %390 = load float*, float** %arrayidx81, align 8
  %391 = bitcast float** %m1 to i8*
  %392 = call i64 @getAddr(i8* %391)
  %393 = bitcast float* %390 to i8*
  %394 = call i64 @getAddr(i8* %393)
  call void @setRealTemp(i64 %392, i64 %394)
  store float* %390, float** %m1, align 8
  %395 = bitcast %struct.mgau_t** %mgau to i8*
  %396 = call i64 @getAddr(i8* %395)
  %397 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %var82 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %397, i32 0, i32 2
  %398 = bitcast float*** %var82 to i8*
  %399 = call i64 @getAddr(i8* %398)
  %400 = load float**, float*** %var82, align 8
  %401 = bitcast i32* %c to i8*
  %402 = call i64 @getAddr(i8* %401)
  %403 = load i32, i32* %c, align 4
  %idxprom83 = sext i32 %403 to i64
  %arrayidx84 = getelementptr inbounds float*, float** %400, i64 %idxprom83
  %404 = bitcast float** %arrayidx84 to i8*
  %405 = call i64 @getAddr(i8* %404)
  %406 = load float*, float** %arrayidx84, align 8
  %407 = bitcast float** %v1 to i8*
  %408 = call i64 @getAddr(i8* %407)
  %409 = bitcast float* %406 to i8*
  %410 = call i64 @getAddr(i8* %409)
  call void @setRealTemp(i64 %408, i64 %410)
  store float* %406, float** %v1, align 8
  %411 = bitcast %struct.mgau_t** %mgau to i8*
  %412 = call i64 @getAddr(i8* %411)
  %413 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %lrd85 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %413, i32 0, i32 3
  %414 = bitcast float** %lrd85 to i8*
  %415 = call i64 @getAddr(i8* %414)
  %416 = load float*, float** %lrd85, align 8
  %417 = bitcast i32* %c to i8*
  %418 = call i64 @getAddr(i8* %417)
  %419 = load i32, i32* %c, align 4
  %idxprom86 = sext i32 %419 to i64
  %arrayidx87 = getelementptr inbounds float, float* %416, i64 %idxprom86
  %420 = bitcast float* %arrayidx87 to i8*
  %421 = call i64 @getAddr(i8* %420)
  %422 = load float, float* %arrayidx87, align 4
  %conv88 = fpext float %422 to double
  %423 = bitcast double* %dval1 to i8*
  %424 = call i64 @getAddr(i8* %423)
  call void @setRealTemp(i64 %424, i64 %421)
  store double %conv88, double* %dval1, align 8
  %425 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond89

for.cond89:                                       ; preds = %for.inc105, %if.then78
  %426 = bitcast i32* %i to i8*
  %427 = call i64 @getAddr(i8* %426)
  %428 = load i32, i32* %i, align 4
  %429 = bitcast i32* %veclen to i8*
  %430 = call i64 @getAddr(i8* %429)
  %431 = load i32, i32* %veclen, align 4
  %cmp90 = icmp slt i32 %428, %431
  br i1 %cmp90, label %for.body92, label %for.end107

for.body92:                                       ; preds = %for.cond89
  %432 = bitcast float** %x.addr to i8*
  %433 = call i64 @getAddr(i8* %432)
  %434 = load float*, float** %x.addr, align 8
  %435 = bitcast i32* %i to i8*
  %436 = call i64 @getAddr(i8* %435)
  %437 = load i32, i32* %i, align 4
  %idxprom93 = sext i32 %437 to i64
  %arrayidx94 = getelementptr inbounds float, float* %434, i64 %idxprom93
  %438 = bitcast float* %arrayidx94 to i8*
  %439 = call i64 @getAddr(i8* %438)
  %440 = load float, float* %arrayidx94, align 4
  %441 = bitcast float** %m1 to i8*
  %442 = call i64 @getAddr(i8* %441)
  %443 = load float*, float** %m1, align 8
  %444 = bitcast i32* %i to i8*
  %445 = call i64 @getAddr(i8* %444)
  %446 = load i32, i32* %i, align 4
  %idxprom95 = sext i32 %446 to i64
  %arrayidx96 = getelementptr inbounds float, float* %443, i64 %idxprom95
  %447 = bitcast float* %arrayidx96 to i8*
  %448 = call i64 @getAddr(i8* %447)
  %449 = load float, float* %arrayidx96, align 4
  %sub97 = fsub float %440, %449
  %450 = call i64 bitcast (i64 (i32, i64, i64, double, double, double, i32)* @computeReal to i64 (i32, i64, i64, float, float, float, i32)*)(i32 14, i64 %439, i64 %448, float %440, float %449, float %sub97, i32 2046)
  %conv98 = fpext float %sub97 to double
  %451 = bitcast double* %diff1 to i8*
  %452 = call i64 @getAddr(i8* %451)
  call void @setRealTemp(i64 %452, i64 %450)
  store double %conv98, double* %diff1, align 8
  %453 = bitcast double* %diff1 to i8*
  %454 = call i64 @getAddr(i8* %453)
  %455 = load double, double* %diff1, align 8
  %456 = bitcast double* %diff1 to i8*
  %457 = call i64 @getAddr(i8* %456)
  %458 = load double, double* %diff1, align 8
  %mul99 = fmul double %455, %458
  %459 = call i64 @computeReal(i32 16, i64 %454, i64 %457, double %455, double %458, double %mul99, i32 2051)
  %460 = bitcast float** %v1 to i8*
  %461 = call i64 @getAddr(i8* %460)
  %462 = load float*, float** %v1, align 8
  %463 = bitcast i32* %i to i8*
  %464 = call i64 @getAddr(i8* %463)
  %465 = load i32, i32* %i, align 4
  %idxprom100 = sext i32 %465 to i64
  %arrayidx101 = getelementptr inbounds float, float* %462, i64 %idxprom100
  %466 = bitcast float* %arrayidx101 to i8*
  %467 = call i64 @getAddr(i8* %466)
  %468 = load float, float* %arrayidx101, align 4
  %conv102 = fpext float %468 to double
  %mul103 = fmul double %mul99, %conv102
  %469 = call i64 @computeReal(i32 16, i64 %459, i64 %467, double %mul99, double %conv102, double %mul103, i32 2058)
  %470 = bitcast double* %dval1 to i8*
  %471 = call i64 @getAddr(i8* %470)
  %472 = load double, double* %dval1, align 8
  %sub104 = fsub double %472, %mul103
  %473 = call i64 @computeReal(i32 14, i64 %471, i64 %469, double %472, double %mul103, double %sub104, i32 2060)
  %474 = bitcast double* %dval1 to i8*
  %475 = call i64 @getAddr(i8* %474)
  call void @setRealTemp(i64 %475, i64 %473)
  store double %sub104, double* %dval1, align 8
  br label %for.inc105

for.inc105:                                       ; preds = %for.body92
  %476 = bitcast i32* %i to i8*
  %477 = call i64 @getAddr(i8* %476)
  %478 = load i32, i32* %i, align 4
  %inc106 = add nsw i32 %478, 1
  %479 = bitcast i32* %i to i8*
  store i32 %inc106, i32* %i, align 4
  br label %for.cond89

for.end107:                                       ; preds = %for.cond89
  %480 = bitcast double* %dval1 to i8*
  %481 = call i64 @getAddr(i8* %480)
  %482 = load double, double* %dval1, align 8
  %483 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %484 = call i64 @getAddr(i8* %483)
  %485 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %distfloor108 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %485, i32 0, i32 4
  %486 = bitcast double* %distfloor108 to i8*
  %487 = call i64 @getAddr(i8* %486)
  %488 = load double, double* %distfloor108, align 8
  %cmp109 = fcmp olt double %482, %488
  call void @checkBranch(double %482, i64 %481, double %488, i64 %487, i32 4, i1 %cmp109, i32 2071)
  br i1 %cmp109, label %if.then111, label %if.end113

if.then111:                                       ; preds = %for.end107
  %489 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %490 = call i64 @getAddr(i8* %489)
  %491 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %distfloor112 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %491, i32 0, i32 4
  %492 = bitcast double* %distfloor112 to i8*
  %493 = call i64 @getAddr(i8* %492)
  %494 = load double, double* %distfloor112, align 8
  %495 = bitcast double* %dval1 to i8*
  %496 = call i64 @getAddr(i8* %495)
  call void @setRealTemp(i64 %496, i64 %493)
  store double %494, double* %dval1, align 8
  br label %if.end113

if.end113:                                        ; preds = %if.then111, %for.end107
  %497 = bitcast i32* %score to i8*
  %498 = call i64 @getAddr(i8* %497)
  %499 = load i32, i32* %score, align 4
  %500 = bitcast double* %f to i8*
  %501 = call i64 @getAddr(i8* %500)
  %502 = load double, double* %f, align 8
  %503 = bitcast double* %dval1 to i8*
  %504 = call i64 @getAddr(i8* %503)
  %505 = load double, double* %dval1, align 8
  %mul114 = fmul double %502, %505
  %506 = call i64 @computeReal(i32 16, i64 %501, i64 %504, double %502, double %505, double %mul114, i32 2081)
  %conv115 = fptosi double %mul114 to i32
  %507 = bitcast %struct.mgau_t** %mgau to i8*
  %508 = call i64 @getAddr(i8* %507)
  %509 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %mixw116 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %509, i32 0, i32 4
  %510 = bitcast i32** %mixw116 to i8*
  %511 = call i64 @getAddr(i8* %510)
  %512 = load i32*, i32** %mixw116, align 8
  %513 = bitcast i32* %c to i8*
  %514 = call i64 @getAddr(i8* %513)
  %515 = load i32, i32* %c, align 4
  %idxprom117 = sext i32 %515 to i64
  %arrayidx118 = getelementptr inbounds i32, i32* %512, i64 %idxprom117
  %516 = bitcast i32* %arrayidx118 to i8*
  %517 = call i64 @getAddr(i8* %516)
  %518 = load i32, i32* %arrayidx118, align 4
  %add119 = add nsw i32 %conv115, %518
  %519 = bitcast i32 (i32, i32)* @logs3_add to i8*
  %520 = call i64 @getAddr(i8* %519)
  call void @addFunArg(i32 0, i64 %520, i64 %498)
  %call120 = call i32 @logs3_add(i32 %499, i32 %add119)
  %521 = bitcast i32* %score to i8*
  store i32 %call120, i32* %score, align 4
  br label %if.end121

if.end121:                                        ; preds = %if.end113, %for.end74
  br label %if.end175

if.else:                                          ; preds = %entry
  %522 = bitcast i32* %j to i8*
  store i32 0, i32* %j, align 4
  br label %for.cond122

for.cond122:                                      ; preds = %for.inc172, %if.else
  %523 = bitcast i32** %active.addr to i8*
  %524 = call i64 @getAddr(i8* %523)
  %525 = load i32*, i32** %active.addr, align 8
  %526 = bitcast i32* %j to i8*
  %527 = call i64 @getAddr(i8* %526)
  %528 = load i32, i32* %j, align 4
  %idxprom123 = sext i32 %528 to i64
  %arrayidx124 = getelementptr inbounds i32, i32* %525, i64 %idxprom123
  %529 = bitcast i32* %arrayidx124 to i8*
  %530 = call i64 @getAddr(i8* %529)
  %531 = load i32, i32* %arrayidx124, align 4
  %cmp125 = icmp sge i32 %531, 0
  br i1 %cmp125, label %for.body127, label %for.end174

for.body127:                                      ; preds = %for.cond122
  %532 = bitcast i32** %active.addr to i8*
  %533 = call i64 @getAddr(i8* %532)
  %534 = load i32*, i32** %active.addr, align 8
  %535 = bitcast i32* %j to i8*
  %536 = call i64 @getAddr(i8* %535)
  %537 = load i32, i32* %j, align 4
  %idxprom128 = sext i32 %537 to i64
  %arrayidx129 = getelementptr inbounds i32, i32* %534, i64 %idxprom128
  %538 = bitcast i32* %arrayidx129 to i8*
  %539 = call i64 @getAddr(i8* %538)
  %540 = load i32, i32* %arrayidx129, align 4
  %541 = bitcast i32* %c to i8*
  store i32 %540, i32* %c, align 4
  %542 = bitcast %struct.mgau_t** %mgau to i8*
  %543 = call i64 @getAddr(i8* %542)
  %544 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %mean130 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %544, i32 0, i32 1
  %545 = bitcast float*** %mean130 to i8*
  %546 = call i64 @getAddr(i8* %545)
  %547 = load float**, float*** %mean130, align 8
  %548 = bitcast i32* %c to i8*
  %549 = call i64 @getAddr(i8* %548)
  %550 = load i32, i32* %c, align 4
  %idxprom131 = sext i32 %550 to i64
  %arrayidx132 = getelementptr inbounds float*, float** %547, i64 %idxprom131
  %551 = bitcast float** %arrayidx132 to i8*
  %552 = call i64 @getAddr(i8* %551)
  %553 = load float*, float** %arrayidx132, align 8
  %554 = bitcast float** %m1 to i8*
  %555 = call i64 @getAddr(i8* %554)
  %556 = bitcast float* %553 to i8*
  %557 = call i64 @getAddr(i8* %556)
  call void @setRealTemp(i64 %555, i64 %557)
  store float* %553, float** %m1, align 8
  %558 = bitcast %struct.mgau_t** %mgau to i8*
  %559 = call i64 @getAddr(i8* %558)
  %560 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %var133 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %560, i32 0, i32 2
  %561 = bitcast float*** %var133 to i8*
  %562 = call i64 @getAddr(i8* %561)
  %563 = load float**, float*** %var133, align 8
  %564 = bitcast i32* %c to i8*
  %565 = call i64 @getAddr(i8* %564)
  %566 = load i32, i32* %c, align 4
  %idxprom134 = sext i32 %566 to i64
  %arrayidx135 = getelementptr inbounds float*, float** %563, i64 %idxprom134
  %567 = bitcast float** %arrayidx135 to i8*
  %568 = call i64 @getAddr(i8* %567)
  %569 = load float*, float** %arrayidx135, align 8
  %570 = bitcast float** %v1 to i8*
  %571 = call i64 @getAddr(i8* %570)
  %572 = bitcast float* %569 to i8*
  %573 = call i64 @getAddr(i8* %572)
  call void @setRealTemp(i64 %571, i64 %573)
  store float* %569, float** %v1, align 8
  %574 = bitcast %struct.mgau_t** %mgau to i8*
  %575 = call i64 @getAddr(i8* %574)
  %576 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %lrd136 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %576, i32 0, i32 3
  %577 = bitcast float** %lrd136 to i8*
  %578 = call i64 @getAddr(i8* %577)
  %579 = load float*, float** %lrd136, align 8
  %580 = bitcast i32* %c to i8*
  %581 = call i64 @getAddr(i8* %580)
  %582 = load i32, i32* %c, align 4
  %idxprom137 = sext i32 %582 to i64
  %arrayidx138 = getelementptr inbounds float, float* %579, i64 %idxprom137
  %583 = bitcast float* %arrayidx138 to i8*
  %584 = call i64 @getAddr(i8* %583)
  %585 = load float, float* %arrayidx138, align 4
  %conv139 = fpext float %585 to double
  %586 = bitcast double* %dval1 to i8*
  %587 = call i64 @getAddr(i8* %586)
  call void @setRealTemp(i64 %587, i64 %584)
  store double %conv139, double* %dval1, align 8
  %588 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond140

for.cond140:                                      ; preds = %for.inc156, %for.body127
  %589 = bitcast i32* %i to i8*
  %590 = call i64 @getAddr(i8* %589)
  %591 = load i32, i32* %i, align 4
  %592 = bitcast i32* %veclen to i8*
  %593 = call i64 @getAddr(i8* %592)
  %594 = load i32, i32* %veclen, align 4
  %cmp141 = icmp slt i32 %591, %594
  br i1 %cmp141, label %for.body143, label %for.end158

for.body143:                                      ; preds = %for.cond140
  %595 = bitcast float** %x.addr to i8*
  %596 = call i64 @getAddr(i8* %595)
  %597 = load float*, float** %x.addr, align 8
  %598 = bitcast i32* %i to i8*
  %599 = call i64 @getAddr(i8* %598)
  %600 = load i32, i32* %i, align 4
  %idxprom144 = sext i32 %600 to i64
  %arrayidx145 = getelementptr inbounds float, float* %597, i64 %idxprom144
  %601 = bitcast float* %arrayidx145 to i8*
  %602 = call i64 @getAddr(i8* %601)
  %603 = load float, float* %arrayidx145, align 4
  %604 = bitcast float** %m1 to i8*
  %605 = call i64 @getAddr(i8* %604)
  %606 = load float*, float** %m1, align 8
  %607 = bitcast i32* %i to i8*
  %608 = call i64 @getAddr(i8* %607)
  %609 = load i32, i32* %i, align 4
  %idxprom146 = sext i32 %609 to i64
  %arrayidx147 = getelementptr inbounds float, float* %606, i64 %idxprom146
  %610 = bitcast float* %arrayidx147 to i8*
  %611 = call i64 @getAddr(i8* %610)
  %612 = load float, float* %arrayidx147, align 4
  %sub148 = fsub float %603, %612
  %613 = call i64 bitcast (i64 (i32, i64, i64, double, double, double, i32)* @computeReal to i64 (i32, i64, i64, float, float, float, i32)*)(i32 14, i64 %602, i64 %611, float %603, float %612, float %sub148, i32 2151)
  %conv149 = fpext float %sub148 to double
  %614 = bitcast double* %diff1 to i8*
  %615 = call i64 @getAddr(i8* %614)
  call void @setRealTemp(i64 %615, i64 %613)
  store double %conv149, double* %diff1, align 8
  %616 = bitcast double* %diff1 to i8*
  %617 = call i64 @getAddr(i8* %616)
  %618 = load double, double* %diff1, align 8
  %619 = bitcast double* %diff1 to i8*
  %620 = call i64 @getAddr(i8* %619)
  %621 = load double, double* %diff1, align 8
  %mul150 = fmul double %618, %621
  %622 = call i64 @computeReal(i32 16, i64 %617, i64 %620, double %618, double %621, double %mul150, i32 2156)
  %623 = bitcast float** %v1 to i8*
  %624 = call i64 @getAddr(i8* %623)
  %625 = load float*, float** %v1, align 8
  %626 = bitcast i32* %i to i8*
  %627 = call i64 @getAddr(i8* %626)
  %628 = load i32, i32* %i, align 4
  %idxprom151 = sext i32 %628 to i64
  %arrayidx152 = getelementptr inbounds float, float* %625, i64 %idxprom151
  %629 = bitcast float* %arrayidx152 to i8*
  %630 = call i64 @getAddr(i8* %629)
  %631 = load float, float* %arrayidx152, align 4
  %conv153 = fpext float %631 to double
  %mul154 = fmul double %mul150, %conv153
  %632 = call i64 @computeReal(i32 16, i64 %622, i64 %630, double %mul150, double %conv153, double %mul154, i32 2163)
  %633 = bitcast double* %dval1 to i8*
  %634 = call i64 @getAddr(i8* %633)
  %635 = load double, double* %dval1, align 8
  %sub155 = fsub double %635, %mul154
  %636 = call i64 @computeReal(i32 14, i64 %634, i64 %632, double %635, double %mul154, double %sub155, i32 2165)
  %637 = bitcast double* %dval1 to i8*
  %638 = call i64 @getAddr(i8* %637)
  call void @setRealTemp(i64 %638, i64 %636)
  store double %sub155, double* %dval1, align 8
  br label %for.inc156

for.inc156:                                       ; preds = %for.body143
  %639 = bitcast i32* %i to i8*
  %640 = call i64 @getAddr(i8* %639)
  %641 = load i32, i32* %i, align 4
  %inc157 = add nsw i32 %641, 1
  %642 = bitcast i32* %i to i8*
  store i32 %inc157, i32* %i, align 4
  br label %for.cond140

for.end158:                                       ; preds = %for.cond140
  %643 = bitcast double* %dval1 to i8*
  %644 = call i64 @getAddr(i8* %643)
  %645 = load double, double* %dval1, align 8
  %646 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %647 = call i64 @getAddr(i8* %646)
  %648 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %distfloor159 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %648, i32 0, i32 4
  %649 = bitcast double* %distfloor159 to i8*
  %650 = call i64 @getAddr(i8* %649)
  %651 = load double, double* %distfloor159, align 8
  %cmp160 = fcmp olt double %645, %651
  call void @checkBranch(double %645, i64 %644, double %651, i64 %650, i32 4, i1 %cmp160, i32 2176)
  br i1 %cmp160, label %if.then162, label %if.end164

if.then162:                                       ; preds = %for.end158
  %652 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %653 = call i64 @getAddr(i8* %652)
  %654 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %distfloor163 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %654, i32 0, i32 4
  %655 = bitcast double* %distfloor163 to i8*
  %656 = call i64 @getAddr(i8* %655)
  %657 = load double, double* %distfloor163, align 8
  %658 = bitcast double* %dval1 to i8*
  %659 = call i64 @getAddr(i8* %658)
  call void @setRealTemp(i64 %659, i64 %656)
  store double %657, double* %dval1, align 8
  br label %if.end164

if.end164:                                        ; preds = %if.then162, %for.end158
  %660 = bitcast i32* %score to i8*
  %661 = call i64 @getAddr(i8* %660)
  %662 = load i32, i32* %score, align 4
  %663 = bitcast double* %f to i8*
  %664 = call i64 @getAddr(i8* %663)
  %665 = load double, double* %f, align 8
  %666 = bitcast double* %dval1 to i8*
  %667 = call i64 @getAddr(i8* %666)
  %668 = load double, double* %dval1, align 8
  %mul165 = fmul double %665, %668
  %669 = call i64 @computeReal(i32 16, i64 %664, i64 %667, double %665, double %668, double %mul165, i32 2186)
  %conv166 = fptosi double %mul165 to i32
  %670 = bitcast %struct.mgau_t** %mgau to i8*
  %671 = call i64 @getAddr(i8* %670)
  %672 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %mixw167 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %672, i32 0, i32 4
  %673 = bitcast i32** %mixw167 to i8*
  %674 = call i64 @getAddr(i8* %673)
  %675 = load i32*, i32** %mixw167, align 8
  %676 = bitcast i32* %c to i8*
  %677 = call i64 @getAddr(i8* %676)
  %678 = load i32, i32* %c, align 4
  %idxprom168 = sext i32 %678 to i64
  %arrayidx169 = getelementptr inbounds i32, i32* %675, i64 %idxprom168
  %679 = bitcast i32* %arrayidx169 to i8*
  %680 = call i64 @getAddr(i8* %679)
  %681 = load i32, i32* %arrayidx169, align 4
  %add170 = add nsw i32 %conv166, %681
  %682 = bitcast i32 (i32, i32)* @logs3_add to i8*
  %683 = call i64 @getAddr(i8* %682)
  call void @addFunArg(i32 0, i64 %683, i64 %661)
  %call171 = call i32 @logs3_add(i32 %662, i32 %add170)
  %684 = bitcast i32* %score to i8*
  store i32 %call171, i32* %score, align 4
  br label %for.inc172

for.inc172:                                       ; preds = %if.end164
  %685 = bitcast i32* %j to i8*
  %686 = call i64 @getAddr(i8* %685)
  %687 = load i32, i32* %j, align 4
  %inc173 = add nsw i32 %687, 1
  %688 = bitcast i32* %j to i8*
  store i32 %inc173, i32* %j, align 4
  br label %for.cond122

for.end174:                                       ; preds = %for.cond122
  br label %if.end175

if.end175:                                        ; preds = %for.end174, %if.end121
  %689 = bitcast i32* %score to i8*
  %690 = call i64 @getAddr(i8* %689)
  %691 = load i32, i32* %score, align 4
  %cmp176 = icmp eq i32 %691, -939524096
  br i1 %cmp176, label %if.then178, label %if.end179

if.then178:                                       ; preds = %if.end175
  br label %if.end179

if.end179:                                        ; preds = %if.then178, %if.end175
  %692 = bitcast i32* %score to i8*
  %693 = call i64 @getAddr(i8* %692)
  %694 = load i32, i32* %score, align 4
  %695 = bitcast i32 (%struct.mgau_model_t*, i32, i32*, float*)* @mgau_eval to i8*
  %696 = call i64 @getAddr(i8* %695)
  call void @funcExit(i64 %696)
  %697 = bitcast i32 (%struct.mgau_model_t*, i32, i32*, float*)* @mgau_eval to i8*
  %698 = call i64 @getAddr(i8* %697)
  call void @trackReturn(i64 %698, i64 %693)
  call void @cleanComputeReal(i32 1894)
  call void @cleanComputeReal(i32 1899)
  call void @cleanComputeReal(i32 1906)
  call void @cleanComputeReal(i32 1908)
  call void @cleanComputeReal(i32 1920)
  call void @cleanComputeReal(i32 1925)
  call void @cleanComputeReal(i32 1932)
  call void @cleanComputeReal(i32 1934)
  call void @cleanComputeReal(i32 1966)
  call void @cleanComputeReal(i32 1981)
  call void @cleanComputeReal(i32 2046)
  call void @cleanComputeReal(i32 2051)
  call void @cleanComputeReal(i32 2058)
  call void @cleanComputeReal(i32 2060)
  call void @cleanComputeReal(i32 2081)
  call void @cleanComputeReal(i32 2151)
  call void @cleanComputeReal(i32 2156)
  call void @cleanComputeReal(i32 2163)
  call void @cleanComputeReal(i32 2165)
  call void @cleanComputeReal(i32 2186)
  ret i32 %694
}

declare dso_local i32 @logs3_add(i32, i32) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @mgau_free(%struct.mgau_model_t* %g) #0 {
entry:
  %0 = bitcast void (%struct.mgau_model_t*)* @mgau_free to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %g.addr = alloca %struct.mgau_model_t*, align 8
  %2 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %4 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %5 = call i64 @getAddr(i8* %4)
  %6 = bitcast %struct.mgau_model_t* %g to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @setRealTemp(i64 %5, i64 %7)
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %g.addr, align 8
  %8 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %9 = call i64 @getAddr(i8* %8)
  %10 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %tobool = icmp ne %struct.mgau_model_t* %10, null
  br i1 %tobool, label %if.then, label %if.end35

if.then:                                          ; preds = %entry
  %11 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %12 = call i64 @getAddr(i8* %11)
  %13 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %13, i32 0, i32 3
  %14 = bitcast %struct.mgau_t** %mgau to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8
  %arrayidx = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %16, i64 0
  %mean = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx, i32 0, i32 1
  %17 = bitcast float*** %mean to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = load float**, float*** %mean, align 8
  %tobool1 = icmp ne float** %19, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %20 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %21 = call i64 @getAddr(i8* %20)
  %22 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau3 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %22, i32 0, i32 3
  %23 = bitcast %struct.mgau_t** %mgau3 to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = load %struct.mgau_t*, %struct.mgau_t** %mgau3, align 8
  %arrayidx4 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %25, i64 0
  %mean5 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx4, i32 0, i32 1
  %26 = bitcast float*** %mean5 to i8*
  %27 = call i64 @getAddr(i8* %26)
  %28 = load float**, float*** %mean5, align 8
  %29 = bitcast float** %28 to i8*
  %30 = bitcast void (i8*)* @ckd_free to i8*
  %31 = call i64 @getAddr(i8* %30)
  call void @ckd_free(i8* %29)
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %32 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %33 = call i64 @getAddr(i8* %32)
  %34 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau6 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %34, i32 0, i32 3
  %35 = bitcast %struct.mgau_t** %mgau6 to i8*
  %36 = call i64 @getAddr(i8* %35)
  %37 = load %struct.mgau_t*, %struct.mgau_t** %mgau6, align 8
  %arrayidx7 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %37, i64 0
  %var = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx7, i32 0, i32 2
  %38 = bitcast float*** %var to i8*
  %39 = call i64 @getAddr(i8* %38)
  %40 = load float**, float*** %var, align 8
  %tobool8 = icmp ne float** %40, null
  br i1 %tobool8, label %if.then9, label %if.end13

if.then9:                                         ; preds = %if.end
  %41 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %42 = call i64 @getAddr(i8* %41)
  %43 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau10 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %43, i32 0, i32 3
  %44 = bitcast %struct.mgau_t** %mgau10 to i8*
  %45 = call i64 @getAddr(i8* %44)
  %46 = load %struct.mgau_t*, %struct.mgau_t** %mgau10, align 8
  %arrayidx11 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %46, i64 0
  %var12 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx11, i32 0, i32 2
  %47 = bitcast float*** %var12 to i8*
  %48 = call i64 @getAddr(i8* %47)
  %49 = load float**, float*** %var12, align 8
  %50 = bitcast float** %49 to i8*
  %51 = bitcast void (i8*)* @ckd_free to i8*
  %52 = call i64 @getAddr(i8* %51)
  call void @ckd_free(i8* %50)
  br label %if.end13

if.end13:                                         ; preds = %if.then9, %if.end
  %53 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %54 = call i64 @getAddr(i8* %53)
  %55 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau14 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %55, i32 0, i32 3
  %56 = bitcast %struct.mgau_t** %mgau14 to i8*
  %57 = call i64 @getAddr(i8* %56)
  %58 = load %struct.mgau_t*, %struct.mgau_t** %mgau14, align 8
  %arrayidx15 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %58, i64 0
  %lrd = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx15, i32 0, i32 3
  %59 = bitcast float** %lrd to i8*
  %60 = call i64 @getAddr(i8* %59)
  %61 = load float*, float** %lrd, align 8
  %tobool16 = icmp ne float* %61, null
  br i1 %tobool16, label %if.then17, label %if.end21

if.then17:                                        ; preds = %if.end13
  %62 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %63 = call i64 @getAddr(i8* %62)
  %64 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau18 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %64, i32 0, i32 3
  %65 = bitcast %struct.mgau_t** %mgau18 to i8*
  %66 = call i64 @getAddr(i8* %65)
  %67 = load %struct.mgau_t*, %struct.mgau_t** %mgau18, align 8
  %arrayidx19 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %67, i64 0
  %lrd20 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx19, i32 0, i32 3
  %68 = bitcast float** %lrd20 to i8*
  %69 = call i64 @getAddr(i8* %68)
  %70 = load float*, float** %lrd20, align 8
  %71 = bitcast float* %70 to i8*
  %72 = bitcast void (i8*)* @ckd_free to i8*
  %73 = call i64 @getAddr(i8* %72)
  call void @ckd_free(i8* %71)
  br label %if.end21

if.end21:                                         ; preds = %if.then17, %if.end13
  %74 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %75 = call i64 @getAddr(i8* %74)
  %76 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau22 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %76, i32 0, i32 3
  %77 = bitcast %struct.mgau_t** %mgau22 to i8*
  %78 = call i64 @getAddr(i8* %77)
  %79 = load %struct.mgau_t*, %struct.mgau_t** %mgau22, align 8
  %arrayidx23 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %79, i64 0
  %mixw = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx23, i32 0, i32 4
  %80 = bitcast i32** %mixw to i8*
  %81 = call i64 @getAddr(i8* %80)
  %82 = load i32*, i32** %mixw, align 8
  %tobool24 = icmp ne i32* %82, null
  br i1 %tobool24, label %if.then25, label %if.end29

if.then25:                                        ; preds = %if.end21
  %83 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %84 = call i64 @getAddr(i8* %83)
  %85 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau26 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %85, i32 0, i32 3
  %86 = bitcast %struct.mgau_t** %mgau26 to i8*
  %87 = call i64 @getAddr(i8* %86)
  %88 = load %struct.mgau_t*, %struct.mgau_t** %mgau26, align 8
  %arrayidx27 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %88, i64 0
  %mixw28 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %arrayidx27, i32 0, i32 4
  %89 = bitcast i32** %mixw28 to i8*
  %90 = call i64 @getAddr(i8* %89)
  %91 = load i32*, i32** %mixw28, align 8
  %92 = bitcast i32* %91 to i8*
  %93 = bitcast void (i8*)* @ckd_free to i8*
  %94 = call i64 @getAddr(i8* %93)
  call void @ckd_free(i8* %92)
  br label %if.end29

if.end29:                                         ; preds = %if.then25, %if.end21
  %95 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %96 = call i64 @getAddr(i8* %95)
  %97 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau30 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %97, i32 0, i32 3
  %98 = bitcast %struct.mgau_t** %mgau30 to i8*
  %99 = call i64 @getAddr(i8* %98)
  %100 = load %struct.mgau_t*, %struct.mgau_t** %mgau30, align 8
  %tobool31 = icmp ne %struct.mgau_t* %100, null
  br i1 %tobool31, label %if.then32, label %if.end34

if.then32:                                        ; preds = %if.end29
  %101 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %102 = call i64 @getAddr(i8* %101)
  %103 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %mgau33 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %103, i32 0, i32 3
  %104 = bitcast %struct.mgau_t** %mgau33 to i8*
  %105 = call i64 @getAddr(i8* %104)
  %106 = load %struct.mgau_t*, %struct.mgau_t** %mgau33, align 8
  %107 = bitcast %struct.mgau_t* %106 to i8*
  %108 = bitcast void (i8*)* @ckd_free to i8*
  %109 = call i64 @getAddr(i8* %108)
  call void @ckd_free(i8* %107)
  br label %if.end34

if.end34:                                         ; preds = %if.then32, %if.end29
  %110 = bitcast %struct.mgau_model_t** %g.addr to i8*
  %111 = call i64 @getAddr(i8* %110)
  %112 = load %struct.mgau_model_t*, %struct.mgau_model_t** %g.addr, align 8
  %113 = bitcast %struct.mgau_model_t* %112 to i8*
  %114 = bitcast void (i8*)* @ckd_free to i8*
  %115 = call i64 @getAddr(i8* %114)
  call void @ckd_free(i8* %113)
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %entry
  %116 = bitcast void (%struct.mgau_model_t*)* @mgau_free to i8*
  %117 = call i64 @getAddr(i8* %116)
  call void @funcExit(i64 %117)
  ret void
}

declare dso_local void @ckd_free(i8*) #1

declare dso_local %struct._IO_FILE* @_myfopen(i8*, i8*, i8*, i32) #1

declare dso_local i32 @bio_readhdr(%struct._IO_FILE*, i8***, i8***, i32*) #1

declare dso_local void @_E__pr_warn(i8*, ...) #1

declare dso_local void @bio_hdrarg_free(i8**, i8**) #1

declare dso_local i32 @bio_fread(i8*, i32, i32, %struct._IO_FILE*, i32, i32*) #1

declare dso_local void @bio_verify_chksum(%struct._IO_FILE*, i32, i32) #1

declare dso_local i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare dso_local i32 @fclose(%struct._IO_FILE*) #1

declare dso_local void @vector_nz_floor(float*, i32, double) #1

declare dso_local double @vector_sum_norm(float*, i32) #1

declare dso_local i32 @logs3(double) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #4

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare dso_local double @log(double) #5

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @funcExit(i64)

declare void @handleAlloca(i64)

declare void @setRealTemp(i64, i64)

declare void @setRealFunArg(i32, i64, i64, double)

declare void @addFunArg(i32, i64, i64)

declare void @checkBranch(double, i64, double, i64, i32, i1, i32)

declare void @trackReturn(i64, i64)

declare void @setRealReturn(i64)

declare void @handleLLVMMemcpy(i64, i64, i64)

declare void @setRealConstant(i64, double)

declare i64 @handleMathFunc(i32, double, i64, double, i32)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @cleanComputeReal(i32)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readonly }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
