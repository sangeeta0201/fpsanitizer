; ModuleID = 'subvq.bc'
source_filename = "subvq.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.subvq_t = type { %struct.arraysize_t, i32, i32, i32**, %struct.vector_gautbl_t*, i32***, float*, i32**, i32*, i32* }
%struct.arraysize_t = type { i32, i32 }
%struct.vector_gautbl_t = type { i32, i32, float**, float**, float*, double }
%struct.mgau_model_t = type { i32, i32, i32, %struct.mgau_t*, double, i32, i32, i32 }
%struct.mgau_t = type { i32, float**, float**, float*, i32* }

@.str = private unnamed_addr constant [8 x i8] c"-vqeval\00", align 1
@VQ_EVAL = internal unnamed_addr global i32 3, align 4
@.str.1 = private unnamed_addr constant [8 x i8] c"subvq.c\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"INFO\00", align 1
@.str.3 = private unnamed_addr constant [57 x i8] c"Loading Mixture Gaussian sub-VQ file '%s' (vq_eval: %d)\0A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"FATAL_ERROR\00", align 1
@.str.6 = private unnamed_addr constant [31 x i8] c"Failed to read VQParam header\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"VQParam %d %d -> %d %d\00", align 1
@.str.8 = private unnamed_addr constant [60 x i8] c"Model size conflict: %d x %d (SubVQ) vs %d x %d (Original)\0A\00", align 1
@.str.9 = private unnamed_addr constant [31 x i8] c"Using %d subvectors out of %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [8 x i8] c"WARNING\00", align 1
@.str.11 = private unnamed_addr constant [57 x i8] c"#Subvectors specified(%d) > available(%d); using latter\0A\00", align 1
@.str.12 = private unnamed_addr constant [25 x i8] c"Subvector %d length %d%n\00", align 1
@.str.13 = private unnamed_addr constant [36 x i8] c"Error reading length(subvector %d)\0A\00", align 1
@.str.14 = private unnamed_addr constant [5 x i8] c"%d%n\00", align 1
@.str.15 = private unnamed_addr constant [41 x i8] c"Error reading subvector(%d).featdim(%d)\0A\00", align 1
@.str.16 = private unnamed_addr constant [48 x i8] c"Original #codebooks(states)/codewords: %d x %d\0A\00", align 1
@.str.17 = private unnamed_addr constant [28 x i8] c"Subvectors: %d, VQsize: %d\0A\00", align 1
@.str.18 = private unnamed_addr constant [25 x i8] c"SV %d feature dims(%d): \00", align 1
@stdout = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.19 = private unnamed_addr constant [5 x i8] c" %2d\00", align 1
@.str.21 = private unnamed_addr constant [20 x i8] c"Reading subvq %d%s\0A\00", align 1
@.str.22 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.23 = private unnamed_addr constant [12 x i8] c" (not used)\00", align 1
@.str.24 = private unnamed_addr constant [18 x i8] c"Reading codebook\0A\00", align 1
@.str.25 = private unnamed_addr constant [12 x i8] c"Codebook %d\00", align 1
@.str.26 = private unnamed_addr constant [31 x i8] c"Error reading codebook header\0A\00", align 1
@.str.27 = private unnamed_addr constant [23 x i8] c"Error reading row(%d)\0A\00", align 1
@.str.28 = private unnamed_addr constant [8 x i8] c"%f %f%n\00", align 1
@.str.29 = private unnamed_addr constant [31 x i8] c"Error reading row(%d) col(%d)\0A\00", align 1
@.str.30 = private unnamed_addr constant [13 x i8] c"Reading map\0A\00", align 1
@.str.31 = private unnamed_addr constant [7 x i8] c"Map %d\00", align 1
@.str.32 = private unnamed_addr constant [26 x i8] c"Error reading map header\0A\00", align 1
@.str.33 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.35 = private unnamed_addr constant [27 x i8] c"Error reading 'End' token\0A\00", align 1
@.str.36 = private unnamed_addr constant [6 x i8] c"n > 0\00", align 1
@__PRETTY_FUNCTION__.subvq_init = private unnamed_addr constant [60 x i8] c"subvq_t *subvq_init(char *, float64, int32, mgau_model_t *)\00", align 1
@.str.37 = private unnamed_addr constant [36 x i8] c"Warning!! Score is S3_LOGPROB_ZERO\0A\00", align 1
@.str.38 = private unnamed_addr constant [46 x i8] c"Precomputing Mahalanobis distance invariants\0A\00", align 1
@.str.39 = private unnamed_addr constant [33 x i8] c"Partially undefined map[%d][%d]\0A\00", align 1
@.str.40 = private unnamed_addr constant [69 x i8] c"Mixture %d: #Valid components conflict: %d (SubVQ) vs %d (Original)\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local %struct.subvq_t* @subvq_init(i8* %file, double %varfloor, i32 %max_sv, %struct.mgau_model_t* readonly %g) local_unnamed_addr #0 {
entry:
  %line = alloca [16384 x i8], align 16
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %n = alloca i32, align 4
  %0 = getelementptr inbounds [16384 x i8], [16384 x i8]* %line, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 16384, i8* nonnull %0) #6
  %1 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #6
  %2 = bitcast i32* %l to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #6
  %3 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #6
  %call = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)) #6
  %4 = bitcast i8* %call to i32*
  %5 = load i32, i32* %4, align 4, !tbaa !2
  store i32 %5, i32* @VQ_EVAL, align 4, !tbaa !2
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 199, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)) #6
  %6 = load i32, i32* @VQ_EVAL, align 4, !tbaa !2
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.3, i64 0, i64 0), i8* %file, i32 %6) #6
  %call1 = tail call i8* @__ckd_calloc__(i64 1, i64 72, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 201) #6
  %call2 = tail call %struct._IO_FILE* @_myfopen(i8* %file, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 203) #6
  %c7 = getelementptr inbounds i8, i8* %call1, i64 4
  %n_sv8 = getelementptr inbounds i8, i8* %call1, i64 8
  %vqsize = getelementptr inbounds i8, i8* %call1, i64 12
  br label %for.cond

for.cond:                                         ; preds = %if.end, %entry
  %call3 = call i8* @fgets(i8* nonnull %0, i32 16384, %struct._IO_FILE* %call2)
  %cmp = icmp eq i8* %call3, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.cond
  call void @_E__pr_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 208, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0)) #6
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.6, i64 0, i64 0)) #6
  br label %if.end

if.end:                                           ; preds = %if.then, %for.cond
  %call9 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* nonnull %0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i8* %call1, i8* nonnull %c7, i8* nonnull %n_sv8, i8* nonnull %vqsize) #6
  %cmp10 = icmp eq i32 %call9, 4
  br i1 %cmp10, label %for.end, label %for.cond

for.end:                                          ; preds = %if.end
  %7 = bitcast i8* %call1 to %struct.subvq_t*
  %r5.le = bitcast i8* %call1 to i32*
  %8 = bitcast i8* %c7 to i32*
  %9 = bitcast i8* %n_sv8 to i32*
  %10 = bitcast i8* %vqsize to i32*
  %tobool = icmp eq %struct.mgau_model_t* %g, null
  br i1 %tobool, label %if.end28, label %if.then13

if.then13:                                        ; preds = %for.end
  %n_mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %g, i64 0, i32 0
  %11 = load i32, i32* %n_mgau, align 8, !tbaa !6
  %12 = load i32, i32* %r5.le, align 8, !tbaa !10
  %cmp16 = icmp eq i32 %11, %12
  br i1 %cmp16, label %lor.lhs.false, label %if.then20

lor.lhs.false:                                    ; preds = %if.then13
  %max_comp = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %g, i64 0, i32 1
  %13 = load i32, i32* %max_comp, align 4, !tbaa !13
  %14 = load i32, i32* %8, align 4, !tbaa !14
  %cmp19 = icmp eq i32 %13, %14
  br i1 %cmp19, label %if.end28, label %if.then20

if.then20:                                        ; preds = %lor.lhs.false, %if.then13
  call void @_E__pr_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 216, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0)) #6
  %15 = load i32, i32* %r5.le, align 8, !tbaa !10
  %16 = load i32, i32* %8, align 4, !tbaa !14
  %17 = load i32, i32* %n_mgau, align 8, !tbaa !6
  %max_comp26 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %g, i64 0, i32 1
  %18 = load i32, i32* %max_comp26, align 4, !tbaa !13
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.8, i64 0, i64 0), i32 %15, i32 %16, i32 %17, i32 %18) #6
  br label %if.end28

if.end28:                                         ; preds = %lor.lhs.false, %for.end, %if.then20
  %cmp29 = icmp slt i32 %max_sv, 0
  br i1 %cmp29, label %if.then30, label %if.end32

if.then30:                                        ; preds = %if.end28
  %19 = load i32, i32* %9, align 8, !tbaa !15
  br label %if.end32

if.end32:                                         ; preds = %if.then30, %if.end28
  %max_sv.addr.0 = phi i32 [ %19, %if.then30 ], [ %max_sv, %if.end28 ]
  %20 = load i32, i32* %9, align 8, !tbaa !15
  %cmp34 = icmp slt i32 %max_sv.addr.0, %20
  br i1 %cmp34, label %if.then35, label %if.else

if.then35:                                        ; preds = %if.end32
  call void @_E__pr_info_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 223, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)) #6
  %21 = load i32, i32* %9, align 8, !tbaa !15
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.9, i64 0, i64 0), i32 %max_sv.addr.0, i32 %21) #6
  %.pr = load i32, i32* %9, align 8, !tbaa !15
  br label %if.end43

if.else:                                          ; preds = %if.end32
  %cmp38 = icmp sgt i32 %max_sv.addr.0, %20
  br i1 %cmp38, label %if.then39, label %if.end43

if.then39:                                        ; preds = %if.else
  call void @_E__pr_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 225, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.10, i64 0, i64 0)) #6
  %22 = load i32, i32* %9, align 8, !tbaa !15
  call void (i8*, ...) @_E__pr_warn(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.11, i64 0, i64 0), i32 %max_sv.addr.0, i32 %22) #6
  %23 = load i32, i32* %9, align 8, !tbaa !15
  br label %if.end43

if.end43:                                         ; preds = %if.else, %if.then39, %if.then35
  %24 = phi i32 [ %20, %if.else ], [ %23, %if.then39 ], [ %.pr, %if.then35 ]
  %max_sv.addr.1 = phi i32 [ %max_sv.addr.0, %if.else ], [ %23, %if.then39 ], [ %max_sv.addr.0, %if.then35 ]
  store i32 %max_sv.addr.1, i32* %9, align 8, !tbaa !15
  %25 = load i32, i32* @VQ_EVAL, align 4, !tbaa !2
  %cmp47 = icmp slt i32 %max_sv.addr.1, %25
  br i1 %cmp47, label %if.then48, label %if.end50

if.then48:                                        ; preds = %if.end43
  store i32 %max_sv.addr.1, i32* @VQ_EVAL, align 4, !tbaa !2
  br label %if.end50

if.end50:                                         ; preds = %if.then48, %if.end43
  %conv = sext i32 %max_sv.addr.1 to i64
  %call52 = call i8* @__ckd_calloc__(i64 %conv, i64 8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 233) #6
  %featdim = getelementptr inbounds i8, i8* %call1, i64 16
  %26 = bitcast i8* %featdim to i32***
  %27 = bitcast i8* %featdim to i8**
  store i8* %call52, i8** %27, align 8, !tbaa !16
  %28 = load i32, i32* %9, align 8, !tbaa !15
  %conv54 = sext i32 %28 to i64
  %call55 = call i8* @__ckd_calloc__(i64 %conv54, i64 40, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 234) #6
  %gautbl = getelementptr inbounds i8, i8* %call1, i64 24
  %29 = bitcast i8* %gautbl to %struct.vector_gautbl_t**
  %30 = bitcast i8* %gautbl to i8**
  store i8* %call55, i8** %30, align 8, !tbaa !17
  %31 = load i32, i32* %r5.le, align 8, !tbaa !10
  %32 = load i32, i32* %8, align 4, !tbaa !14
  %33 = load i32, i32* %9, align 8, !tbaa !15
  %call61 = call i8*** @__ckd_calloc_3d__(i32 %31, i32 %32, i32 %33, i32 4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 236) #6
  %map = getelementptr inbounds i8, i8* %call1, i64 32
  %34 = bitcast i8* %map to i32****
  %35 = bitcast i8* %map to i8****
  store i8*** %call61, i8**** %35, align 8, !tbaa !18
  %cmp63603 = icmp sgt i32 %24, 0
  br i1 %cmp63603, label %for.body.preheader, label %for.end126

for.body.preheader:                               ; preds = %if.end50
  %wide.trip.count628 = zext i32 %24 to i64
  br label %for.body

for.body:                                         ; preds = %for.inc124, %for.body.preheader
  %indvars.iv626 = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next627, %for.inc124 ]
  %call66 = call i8* @fgets(i8* nonnull %0, i32 16384, %struct._IO_FILE* %call2)
  %cmp67 = icmp eq i8* %call66, null
  br i1 %cmp67, label %if.then77, label %lor.lhs.false69

lor.lhs.false69:                                  ; preds = %for.body
  %call71 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* nonnull %0, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.12, i64 0, i64 0), i32* nonnull %k, i32* nonnull %l, i32* nonnull %n) #6
  %cmp72 = icmp eq i32 %call71, 2
  %36 = load i32, i32* %k, align 4
  %37 = zext i32 %36 to i64
  %cmp75 = icmp eq i64 %indvars.iv626, %37
  %or.cond = and i1 %cmp72, %cmp75
  br i1 %or.cond, label %if.end78, label %if.then77

if.then77:                                        ; preds = %lor.lhs.false69, %for.body
  call void @_E__pr_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 242, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0)) #6
  %38 = trunc i64 %indvars.iv626 to i32
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.13, i64 0, i64 0), i32 %38) #6
  br label %if.end78

if.end78:                                         ; preds = %lor.lhs.false69, %if.then77
  %39 = load i32, i32* %9, align 8, !tbaa !15
  %40 = sext i32 %39 to i64
  %cmp80 = icmp slt i64 %indvars.iv626, %40
  br i1 %cmp80, label %if.then82, label %for.inc124

if.then82:                                        ; preds = %if.end78
  %41 = load i32, i32* %l, align 4, !tbaa !2
  %42 = load %struct.vector_gautbl_t*, %struct.vector_gautbl_t** %29, align 8, !tbaa !17
  %veclen = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %42, i64 %indvars.iv626, i32 1
  store i32 %41, i32* %veclen, align 4, !tbaa !19
  %conv88 = sext i32 %41 to i64
  %call89 = call i8* @__ckd_calloc__(i64 %conv88, i64 4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 246) #6
  %43 = load i32**, i32*** %26, align 8, !tbaa !16
  %arrayidx92 = getelementptr inbounds i32*, i32** %43, i64 %indvars.iv626
  %44 = bitcast i32** %arrayidx92 to i8**
  store i8* %call89, i8** %44, align 8, !tbaa !21
  %45 = load %struct.vector_gautbl_t*, %struct.vector_gautbl_t** %29, align 8, !tbaa !17
  %veclen98597 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %45, i64 %indvars.iv626, i32 1
  %46 = load i32, i32* %veclen98597, align 4, !tbaa !19
  %cmp99598 = icmp sgt i32 %46, 0
  br i1 %cmp99598, label %for.body101.preheader, label %for.end114

for.body101.preheader:                            ; preds = %if.then82
  %47 = load i32, i32* %n, align 4, !tbaa !2
  %idx.ext = sext i32 %47 to i64
  %add.ptr = getelementptr inbounds [16384 x i8], [16384 x i8]* %line, i64 0, i64 %idx.ext
  %48 = trunc i64 %indvars.iv626 to i32
  br label %for.body101

for.body101:                                      ; preds = %for.body101.preheader, %if.end111
  %indvars.iv624 = phi i64 [ 0, %for.body101.preheader ], [ %indvars.iv.next625, %if.end111 ]
  %strp.0599 = phi i8* [ %add.ptr, %for.body101.preheader ], [ %add.ptr113, %if.end111 ]
  %49 = load i32**, i32*** %26, align 8, !tbaa !16
  %arrayidx104 = getelementptr inbounds i32*, i32** %49, i64 %indvars.iv626
  %50 = load i32*, i32** %arrayidx104, align 8, !tbaa !21
  %arrayidx106 = getelementptr inbounds i32, i32* %50, i64 %indvars.iv624
  %call107 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %strp.0599, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14, i64 0, i64 0), i32* %arrayidx106, i32* nonnull %n) #6
  %cmp108 = icmp eq i32 %call107, 1
  br i1 %cmp108, label %if.end111, label %if.then110

if.then110:                                       ; preds = %for.body101
  call void @_E__pr_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 250, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0)) #6
  %51 = trunc i64 %indvars.iv624 to i32
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.15, i64 0, i64 0), i32 %48, i32 %51) #6
  br label %if.end111

if.end111:                                        ; preds = %for.body101, %if.then110
  %52 = load i32, i32* %n, align 4, !tbaa !2
  %idx.ext112 = sext i32 %52 to i64
  %add.ptr113 = getelementptr inbounds i8, i8* %strp.0599, i64 %idx.ext112
  %indvars.iv.next625 = add nuw nsw i64 %indvars.iv624, 1
  %53 = load %struct.vector_gautbl_t*, %struct.vector_gautbl_t** %29, align 8, !tbaa !17
  %veclen98 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %53, i64 %indvars.iv626, i32 1
  %54 = load i32, i32* %veclen98, align 4, !tbaa !19
  %55 = sext i32 %54 to i64
  %cmp99 = icmp slt i64 %indvars.iv.next625, %55
  br i1 %cmp99, label %for.body101, label %for.end114

for.end114:                                       ; preds = %if.end111, %if.then82
  %.lcssa568 = phi %struct.vector_gautbl_t* [ %45, %if.then82 ], [ %53, %if.end111 ]
  %.lcssa567 = phi i32 [ %46, %if.then82 ], [ %54, %if.end111 ]
  %arrayidx97 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %.lcssa568, i64 %indvars.iv626
  %56 = load i32, i32* %10, align 4, !tbaa !22
  call void @vector_gautbl_alloc(%struct.vector_gautbl_t* %arrayidx97, i32 %56, i32 %.lcssa567) #6
  br label %for.inc124

for.inc124:                                       ; preds = %if.end78, %for.end114
  %indvars.iv.next627 = add nuw nsw i64 %indvars.iv626, 1
  %exitcond629 = icmp eq i64 %indvars.iv.next627, %wide.trip.count628
  br i1 %exitcond629, label %for.end126, label %for.body

for.end126:                                       ; preds = %for.inc124, %if.end50
  call void @_E__pr_info_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 259, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)) #6
  %57 = load i32, i32* %r5.le, align 8, !tbaa !10
  %58 = load i32, i32* %8, align 4, !tbaa !14
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.16, i64 0, i64 0), i32 %57, i32 %58) #6
  call void @_E__pr_info_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 260, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)) #6
  %59 = load i32, i32* %9, align 8, !tbaa !15
  %60 = load i32, i32* %10, align 4, !tbaa !22
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.17, i64 0, i64 0), i32 %59, i32 %60) #6
  %61 = load i32, i32* %9, align 8, !tbaa !15
  %cmp135595 = icmp sgt i32 %61, 0
  br i1 %cmp135595, label %for.body137, label %for.cond163.preheader

for.cond163.preheader:                            ; preds = %for.end158, %for.end126
  %cmp164590 = icmp sgt i32 %24, 0
  br i1 %cmp164590, label %for.body166.preheader, label %for.end297

for.body166.preheader:                            ; preds = %for.cond163.preheader
  %wide.trip.count618 = zext i32 %24 to i64
  br label %for.body166

for.body137:                                      ; preds = %for.end126, %for.end158
  %indvars.iv622 = phi i64 [ %indvars.iv.next623, %for.end158 ], [ 0, %for.end126 ]
  call void @_E__pr_info_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 262, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)) #6
  %62 = load %struct.vector_gautbl_t*, %struct.vector_gautbl_t** %29, align 8, !tbaa !17
  %veclen141 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %62, i64 %indvars.iv622, i32 1
  %63 = load i32, i32* %veclen141, align 4, !tbaa !19
  %64 = trunc i64 %indvars.iv622 to i32
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.18, i64 0, i64 0), i32 %64, i32 %63) #6
  %65 = load %struct.vector_gautbl_t*, %struct.vector_gautbl_t** %29, align 8, !tbaa !17
  %veclen146592 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %65, i64 %indvars.iv622, i32 1
  %66 = load i32, i32* %veclen146592, align 4, !tbaa !19
  %cmp147593 = icmp sgt i32 %66, 0
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !tbaa !21
  br i1 %cmp147593, label %for.body149, label %for.end158

for.body149:                                      ; preds = %for.body137, %for.body149
  %indvars.iv620 = phi i64 [ %indvars.iv.next621, %for.body149 ], [ 0, %for.body137 ]
  %68 = phi %struct._IO_FILE* [ %75, %for.body149 ], [ %67, %for.body137 ]
  %69 = load i32**, i32*** %26, align 8, !tbaa !16
  %arrayidx152 = getelementptr inbounds i32*, i32** %69, i64 %indvars.iv622
  %70 = load i32*, i32** %arrayidx152, align 8, !tbaa !21
  %arrayidx154 = getelementptr inbounds i32, i32* %70, i64 %indvars.iv620
  %71 = load i32, i32* %arrayidx154, align 4, !tbaa !2
  %call155 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %68, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19, i64 0, i64 0), i32 %71)
  %indvars.iv.next621 = add nuw nsw i64 %indvars.iv620, 1
  %72 = load %struct.vector_gautbl_t*, %struct.vector_gautbl_t** %29, align 8, !tbaa !17
  %veclen146 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %72, i64 %indvars.iv622, i32 1
  %73 = load i32, i32* %veclen146, align 4, !tbaa !19
  %74 = sext i32 %73 to i64
  %cmp147 = icmp slt i64 %indvars.iv.next621, %74
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !tbaa !21
  br i1 %cmp147, label %for.body149, label %for.end158

for.end158:                                       ; preds = %for.body149, %for.body137
  %.lcssa = phi %struct._IO_FILE* [ %67, %for.body137 ], [ %75, %for.body149 ]
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa)
  %indvars.iv.next623 = add nuw nsw i64 %indvars.iv622, 1
  %76 = load i32, i32* %9, align 8, !tbaa !15
  %77 = sext i32 %76 to i64
  %cmp135 = icmp slt i64 %indvars.iv.next623, %77
  br i1 %cmp135, label %for.body137, label %for.cond163.preheader

for.body166:                                      ; preds = %for.end293, %for.body166.preheader
  %indvars.iv616 = phi i64 [ 0, %for.body166.preheader ], [ %indvars.iv.next617, %for.end293 ]
  call void @_E__pr_info_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 271, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)) #6
  %78 = load i32, i32* %9, align 8, !tbaa !15
  %79 = sext i32 %78 to i64
  %cmp168 = icmp slt i64 %indvars.iv616, %79
  %cond = select i1 %cmp168, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.22, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.23, i64 0, i64 0)
  %80 = trunc i64 %indvars.iv616 to i32
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.21, i64 0, i64 0), i32 %80, i8* %cond) #6
  call void @_E__pr_info_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 273, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)) #6
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.24, i64 0, i64 0)) #6
  %call171 = call i8* @fgets(i8* nonnull %0, i32 16384, %struct._IO_FILE* %call2)
  %cmp172 = icmp eq i8* %call171, null
  br i1 %cmp172, label %if.then182, label %lor.lhs.false174

lor.lhs.false174:                                 ; preds = %for.body166
  %call176 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* nonnull %0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.25, i64 0, i64 0), i32* nonnull %k) #6
  %cmp177 = icmp eq i32 %call176, 1
  %81 = load i32, i32* %k, align 4
  %82 = zext i32 %81 to i64
  %cmp180 = icmp eq i64 %indvars.iv616, %82
  %or.cond563 = and i1 %cmp177, %cmp180
  br i1 %or.cond563, label %if.end183, label %if.then182

if.then182:                                       ; preds = %lor.lhs.false174, %for.body166
  call void @_E__pr_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 276, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0)) #6
  %83 = trunc i64 %indvars.iv616 to i32
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.26, i64 0, i64 0), i32 %83) #6
  br label %if.end183

if.end183:                                        ; preds = %lor.lhs.false174, %if.then182
  %84 = load i32, i32* %10, align 4, !tbaa !22
  %cmp186579 = icmp sgt i32 %84, 0
  br i1 %cmp186579, label %for.body188, label %for.end235

for.body188:                                      ; preds = %if.end183, %for.inc233
  %indvars.iv610 = phi i64 [ %indvars.iv.next611, %for.inc233 ], [ 0, %if.end183 ]
  %call190 = call i8* @fgets(i8* nonnull %0, i32 16384, %struct._IO_FILE* %call2)
  %cmp191 = icmp eq i8* %call190, null
  br i1 %cmp191, label %if.then193, label %if.end194

if.then193:                                       ; preds = %for.body188
  call void @_E__pr_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 280, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0)) #6
  %85 = trunc i64 %indvars.iv610 to i32
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.27, i64 0, i64 0), i32 %85) #6
  br label %if.end194

if.end194:                                        ; preds = %if.then193, %for.body188
  %86 = load i32, i32* %9, align 8, !tbaa !15
  %87 = sext i32 %86 to i64
  %cmp196 = icmp slt i64 %indvars.iv616, %87
  br i1 %cmp196, label %for.cond201.preheader, label %for.inc233

for.cond201.preheader:                            ; preds = %if.end194
  %88 = load %struct.vector_gautbl_t*, %struct.vector_gautbl_t** %29, align 8, !tbaa !17
  %veclen205575 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %88, i64 %indvars.iv616, i32 1
  %89 = load i32, i32* %veclen205575, align 4, !tbaa !19
  %cmp206576 = icmp sgt i32 %89, 0
  br i1 %cmp206576, label %for.body208.lr.ph, label %for.inc233

for.body208.lr.ph:                                ; preds = %for.cond201.preheader
  %90 = trunc i64 %indvars.iv610 to i32
  br label %for.body208

for.body208:                                      ; preds = %for.body208.lr.ph, %if.end227
  %indvars.iv608 = phi i64 [ 0, %for.body208.lr.ph ], [ %indvars.iv.next609, %if.end227 ]
  %91 = phi %struct.vector_gautbl_t* [ %88, %for.body208.lr.ph ], [ %98, %if.end227 ]
  %strp.1577 = phi i8* [ %0, %for.body208.lr.ph ], [ %add.ptr229, %if.end227 ]
  %mean = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %91, i64 %indvars.iv616, i32 2
  %92 = load float**, float*** %mean, align 8, !tbaa !23
  %arrayidx213 = getelementptr inbounds float*, float** %92, i64 %indvars.iv610
  %93 = load float*, float** %arrayidx213, align 8, !tbaa !21
  %arrayidx215 = getelementptr inbounds float, float* %93, i64 %indvars.iv608
  %var = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %91, i64 %indvars.iv616, i32 3
  %94 = load float**, float*** %var, align 8, !tbaa !24
  %arrayidx220 = getelementptr inbounds float*, float** %94, i64 %indvars.iv610
  %95 = load float*, float** %arrayidx220, align 8, !tbaa !21
  %arrayidx222 = getelementptr inbounds float, float* %95, i64 %indvars.iv608
  %call223 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %strp.1577, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.28, i64 0, i64 0), float* %arrayidx215, float* %arrayidx222, i32* nonnull %k) #6
  %cmp224 = icmp eq i32 %call223, 2
  br i1 %cmp224, label %if.end227, label %if.then226

if.then226:                                       ; preds = %for.body208
  call void @_E__pr_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 288, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0)) #6
  %96 = trunc i64 %indvars.iv608 to i32
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.29, i64 0, i64 0), i32 %90, i32 %96) #6
  br label %if.end227

if.end227:                                        ; preds = %for.body208, %if.then226
  %97 = load i32, i32* %k, align 4, !tbaa !2
  %idx.ext228 = sext i32 %97 to i64
  %add.ptr229 = getelementptr inbounds i8, i8* %strp.1577, i64 %idx.ext228
  %indvars.iv.next609 = add nuw nsw i64 %indvars.iv608, 1
  %98 = load %struct.vector_gautbl_t*, %struct.vector_gautbl_t** %29, align 8, !tbaa !17
  %veclen205 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %98, i64 %indvars.iv616, i32 1
  %99 = load i32, i32* %veclen205, align 4, !tbaa !19
  %100 = sext i32 %99 to i64
  %cmp206 = icmp slt i64 %indvars.iv.next609, %100
  br i1 %cmp206, label %for.body208, label %for.inc233

for.inc233:                                       ; preds = %if.end227, %for.cond201.preheader, %if.end194
  %indvars.iv.next611 = add nuw nsw i64 %indvars.iv610, 1
  %101 = load i32, i32* %10, align 4, !tbaa !22
  %102 = sext i32 %101 to i64
  %cmp186 = icmp slt i64 %indvars.iv.next611, %102
  br i1 %cmp186, label %for.body188, label %for.end235

for.end235:                                       ; preds = %for.inc233, %if.end183
  call void @_E__pr_info_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 293, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)) #6
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.30, i64 0, i64 0)) #6
  %call237 = call i8* @fgets(i8* nonnull %0, i32 16384, %struct._IO_FILE* %call2)
  %cmp238 = icmp eq i8* %call237, null
  br i1 %cmp238, label %if.then248, label %lor.lhs.false240

lor.lhs.false240:                                 ; preds = %for.end235
  %call242 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* nonnull %0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.31, i64 0, i64 0), i32* nonnull %k) #6
  %cmp243 = icmp eq i32 %call242, 1
  %103 = load i32, i32* %k, align 4
  %104 = zext i32 %103 to i64
  %cmp246 = icmp eq i64 %indvars.iv616, %104
  %or.cond564 = and i1 %cmp243, %cmp246
  br i1 %or.cond564, label %if.end249, label %if.then248

if.then248:                                       ; preds = %lor.lhs.false240, %for.end235
  call void @_E__pr_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 296, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0)) #6
  %105 = trunc i64 %indvars.iv616 to i32
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.32, i64 0, i64 0), i32 %105) #6
  br label %if.end249

if.end249:                                        ; preds = %lor.lhs.false240, %if.then248
  %106 = load i32, i32* %r5.le, align 8, !tbaa !10
  %cmp253586 = icmp sgt i32 %106, 0
  br i1 %cmp253586, label %for.body255, label %for.end293

for.body255:                                      ; preds = %if.end249, %for.inc291
  %indvars.iv614 = phi i64 [ %indvars.iv.next615, %for.inc291 ], [ 0, %if.end249 ]
  %call257 = call i8* @fgets(i8* nonnull %0, i32 16384, %struct._IO_FILE* %call2)
  %cmp258 = icmp eq i8* %call257, null
  br i1 %cmp258, label %if.then260, label %if.end261

if.then260:                                       ; preds = %for.body255
  call void @_E__pr_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 300, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0)) #6
  %107 = trunc i64 %indvars.iv614 to i32
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.27, i64 0, i64 0), i32 %107) #6
  br label %if.end261

if.end261:                                        ; preds = %if.then260, %for.body255
  %108 = load i32, i32* %9, align 8, !tbaa !15
  %109 = sext i32 %108 to i64
  %cmp263 = icmp slt i64 %indvars.iv616, %109
  br i1 %cmp263, label %for.cond268.preheader, label %for.inc291

for.cond268.preheader:                            ; preds = %if.end261
  %110 = load i32, i32* %8, align 4, !tbaa !14
  %cmp271583 = icmp sgt i32 %110, 0
  br i1 %cmp271583, label %for.body273.lr.ph, label %for.inc291

for.body273.lr.ph:                                ; preds = %for.cond268.preheader
  %111 = trunc i64 %indvars.iv614 to i32
  br label %for.body273

for.body273:                                      ; preds = %for.body273.lr.ph, %if.end285
  %indvars.iv612 = phi i64 [ 0, %for.body273.lr.ph ], [ %indvars.iv.next613, %if.end285 ]
  %strp.2584 = phi i8* [ %0, %for.body273.lr.ph ], [ %add.ptr287, %if.end285 ]
  %112 = load i32***, i32**** %34, align 8, !tbaa !18
  %arrayidx276 = getelementptr inbounds i32**, i32*** %112, i64 %indvars.iv614
  %113 = load i32**, i32*** %arrayidx276, align 8, !tbaa !21
  %arrayidx278 = getelementptr inbounds i32*, i32** %113, i64 %indvars.iv612
  %114 = load i32*, i32** %arrayidx278, align 8, !tbaa !21
  %arrayidx280 = getelementptr inbounds i32, i32* %114, i64 %indvars.iv616
  %call281 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %strp.2584, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14, i64 0, i64 0), i32* %arrayidx280, i32* nonnull %k) #6
  %cmp282 = icmp eq i32 %call281, 1
  br i1 %cmp282, label %if.end285, label %if.then284

if.then284:                                       ; preds = %for.body273
  call void @_E__pr_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 307, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0)) #6
  %115 = trunc i64 %indvars.iv612 to i32
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.29, i64 0, i64 0), i32 %111, i32 %115) #6
  br label %if.end285

if.end285:                                        ; preds = %for.body273, %if.then284
  %116 = load i32, i32* %k, align 4, !tbaa !2
  %idx.ext286 = sext i32 %116 to i64
  %add.ptr287 = getelementptr inbounds i8, i8* %strp.2584, i64 %idx.ext286
  %indvars.iv.next613 = add nuw nsw i64 %indvars.iv612, 1
  %117 = load i32, i32* %8, align 4, !tbaa !14
  %118 = sext i32 %117 to i64
  %cmp271 = icmp slt i64 %indvars.iv.next613, %118
  br i1 %cmp271, label %for.body273, label %for.inc291

for.inc291:                                       ; preds = %if.end285, %for.cond268.preheader, %if.end261
  %indvars.iv.next615 = add nuw nsw i64 %indvars.iv614, 1
  %119 = load i32, i32* %r5.le, align 8, !tbaa !10
  %120 = sext i32 %119 to i64
  %cmp253 = icmp slt i64 %indvars.iv.next615, %120
  br i1 %cmp253, label %for.body255, label %for.end293

for.end293:                                       ; preds = %for.inc291, %if.end249
  %121 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !tbaa !21
  %call294 = call i32 @fflush(%struct._IO_FILE* %121)
  %indvars.iv.next617 = add nuw nsw i64 %indvars.iv616, 1
  %exitcond619 = icmp eq i64 %indvars.iv.next617, %wide.trip.count618
  br i1 %exitcond619, label %for.end297, label %for.body166

for.end297:                                       ; preds = %for.end293, %for.cond163.preheader
  %call299 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.33, i64 0, i64 0), i8* nonnull %0) #6
  %cmp300 = icmp eq i32 %call299, 1
  %122 = load i8, i8* %0, align 16
  %cmp312 = icmp eq i8 %122, 69
  %or.cond566 = and i1 %cmp300, %cmp312
  br i1 %or.cond566, label %if.then314, label %if.then349

if.then314:                                       ; preds = %for.end297
  %arrayidx316 = getelementptr inbounds [16384 x i8], [16384 x i8]* %line, i64 0, i64 1
  %123 = load i8, i8* %arrayidx316, align 1, !tbaa !25
  %cmp322 = icmp eq i8 %123, 110
  br i1 %cmp322, label %if.then324, label %if.then349

if.then324:                                       ; preds = %if.then314
  %arrayidx326 = getelementptr inbounds [16384 x i8], [16384 x i8]* %line, i64 0, i64 2
  %124 = load i8, i8* %arrayidx326, align 2, !tbaa !25
  %cmp332 = icmp eq i8 %124, 100
  br i1 %cmp332, label %if.end341, label %if.then349

if.end341:                                        ; preds = %if.then324
  %arrayidx336 = getelementptr inbounds [16384 x i8], [16384 x i8]* %line, i64 0, i64 3
  %125 = load i8, i8* %arrayidx336, align 1, !tbaa !25
  %phitmp = icmp eq i8 %125, 0
  br i1 %phitmp, label %if.end350, label %if.then349

if.then349:                                       ; preds = %if.end341, %if.then314, %if.then324, %for.end297
  call void @_E__pr_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 316, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0)) #6
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.35, i64 0, i64 0)) #6
  br label %if.end350

if.end350:                                        ; preds = %if.end341, %if.then349
  %call351 = call i32 @fclose(%struct._IO_FILE* %call2)
  call fastcc void @subvq_maha_precomp(%struct.subvq_t* nonnull %7, double %varfloor)
  call fastcc void @subvq_map_compact(%struct.subvq_t* nonnull %7, %struct.mgau_model_t* %g)
  call fastcc void @subvq_map_linearize(%struct.subvq_t* nonnull %7)
  store i32 0, i32* %n, align 4, !tbaa !2
  %cmp353573 = icmp sgt i32 %24, 0
  br i1 %cmp353573, label %for.body355.lr.ph, label %cond.false374

for.body355.lr.ph:                                ; preds = %if.end350
  %126 = load %struct.vector_gautbl_t*, %struct.vector_gautbl_t** %29, align 8, !tbaa !17
  %wide.trip.count = zext i32 %24 to i64
  br label %for.body355

for.body355:                                      ; preds = %for.inc368, %for.body355.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body355.lr.ph ], [ %indvars.iv.next, %for.inc368 ]
  %veclen359 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %126, i64 %indvars.iv, i32 1
  %127 = load i32, i32* %veclen359, align 4, !tbaa !19
  %128 = load i32, i32* %n, align 4, !tbaa !2
  %cmp360 = icmp sgt i32 %127, %128
  br i1 %cmp360, label %if.then362, label %for.inc368

if.then362:                                       ; preds = %for.body355
  store i32 %127, i32* %n, align 4, !tbaa !2
  br label %for.inc368

for.inc368:                                       ; preds = %for.body355, %if.then362
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end370, label %for.body355

for.end370:                                       ; preds = %for.inc368
  %.pr630 = load i32, i32* %n, align 4, !tbaa !2
  %cmp371 = icmp sgt i32 %.pr630, 0
  br i1 %cmp371, label %cond.end375, label %cond.false374

cond.false374:                                    ; preds = %if.end350, %for.end370
  call void @__assert_fail(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.36, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 329, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @__PRETTY_FUNCTION__.subvq_init, i64 0, i64 0)) #7
  unreachable

cond.end375:                                      ; preds = %for.end370
  %conv376 = sext i32 %.pr630 to i64
  %call377 = call i8* @__ckd_calloc__(i64 %conv376, i64 4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 330) #6
  %subvec = getelementptr inbounds i8, i8* %call1, i64 40
  %129 = bitcast i8* %subvec to i8**
  store i8* %call377, i8** %129, align 8, !tbaa !26
  %130 = load i32, i32* %9, align 8, !tbaa !15
  %131 = load i32, i32* %10, align 4, !tbaa !22
  %call380 = call i8** @__ckd_calloc_2d__(i32 %130, i32 %131, i32 4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 331) #6
  %vqdist = getelementptr inbounds i8, i8* %call1, i64 48
  %132 = bitcast i8* %vqdist to i8***
  store i8** %call380, i8*** %132, align 8, !tbaa !27
  %133 = load i32, i32* %8, align 4, !tbaa !14
  %conv383 = sext i32 %133 to i64
  %call384 = call i8* @__ckd_calloc__(i64 %conv383, i64 4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 332) #6
  %gauscore = getelementptr inbounds i8, i8* %call1, i64 56
  %134 = bitcast i8* %gauscore to i8**
  store i8* %call384, i8** %134, align 8, !tbaa !28
  %135 = load i32, i32* %8, align 4, !tbaa !14
  %add = add nsw i32 %135, 1
  %conv387 = sext i32 %add to i64
  %call388 = call i8* @__ckd_calloc__(i64 %conv387, i64 4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 333) #6
  %mgau_sl = getelementptr inbounds i8, i8* %call1, i64 64
  %136 = bitcast i8* %mgau_sl to i8**
  store i8* %call388, i8** %136, align 8, !tbaa !29
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #6
  call void @llvm.lifetime.end.p0i8(i64 16384, i8* nonnull %0) #6
  ret %struct.subvq_t* %7
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare dso_local i8* @cmd_ln_access(i8*) local_unnamed_addr #2

declare dso_local void @_E__pr_info_header(i8*, i64, i8*) local_unnamed_addr #2

declare dso_local void @_E__pr_info(i8*, ...) local_unnamed_addr #2

declare dso_local i8* @__ckd_calloc__(i64, i64, i8*, i32) local_unnamed_addr #2

declare dso_local %struct._IO_FILE* @_myfopen(i8*, i8*, i8*, i32) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

declare dso_local void @_E__pr_header(i8*, i64, i8*) local_unnamed_addr #2

declare dso_local void @_E__die_error(i8*, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i32 @__isoc99_sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) local_unnamed_addr #3

declare dso_local void @_E__pr_warn(i8*, ...) local_unnamed_addr #2

declare dso_local i8*** @__ckd_calloc_3d__(i32, i32, i32, i32, i8*, i32) local_unnamed_addr #2

declare dso_local void @vector_gautbl_alloc(%struct.vector_gautbl_t*, i32, i32) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i32 @fflush(%struct._IO_FILE* nocapture) local_unnamed_addr #3

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare dso_local i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define internal fastcc void @subvq_maha_precomp(%struct.subvq_t* nocapture readonly %svq, double %floor) unnamed_addr #0 {
entry:
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 103, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)) #6
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.38, i64 0, i64 0)) #6
  %n_sv = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %svq, i64 0, i32 1
  %0 = load i32, i32* %n_sv, align 8, !tbaa !15
  %vqsize = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %svq, i64 0, i32 2
  %1 = load i32, i32* %vqsize, align 4, !tbaa !22
  %mul = mul nsw i32 %1, %0
  %conv = sext i32 %mul to i64
  %call = tail call i8* @__ckd_calloc__(i64 %conv, i64 4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 105) #6
  %2 = load i32, i32* %n_sv, align 8, !tbaa !15
  %cmp18 = icmp sgt i32 %2, 0
  br i1 %cmp18, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %3 = bitcast i8* %call to float*
  %gautbl3 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %svq, i64 0, i32 4
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %lrd.019 = phi float* [ %3, %for.body.lr.ph ], [ %add.ptr, %for.body ]
  %4 = load %struct.vector_gautbl_t*, %struct.vector_gautbl_t** %gautbl3, align 8, !tbaa !17
  %arrayidx = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %4, i64 %indvars.iv
  tail call void @vector_gautbl_var_floor(%struct.vector_gautbl_t* %arrayidx, double %floor) #6
  %lrd4 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %4, i64 %indvars.iv, i32 4
  store float* %lrd.019, float** %lrd4, align 8, !tbaa !30
  %5 = load i32, i32* %vqsize, align 4, !tbaa !22
  %idx.ext = sext i32 %5 to i64
  %add.ptr = getelementptr inbounds float, float* %lrd.019, i64 %idx.ext
  tail call void @vector_gautbl_maha_precomp(%struct.vector_gautbl_t* %arrayidx) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = load i32, i32* %n_sv, align 8, !tbaa !15
  %7 = sext i32 %6 to i64
  %cmp = icmp slt i64 %indvars.iv.next, %7
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define internal fastcc void @subvq_map_compact(%struct.subvq_t* nocapture readonly %vq, %struct.mgau_model_t* readonly %g) unnamed_addr #0 {
entry:
  %tobool = icmp ne %struct.mgau_model_t* %g, null
  br i1 %tobool, label %if.then, label %if.end12

if.then:                                          ; preds = %entry
  %n_mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %g, i64 0, i32 0
  %0 = load i32, i32* %n_mgau, align 8, !tbaa !6
  %r1 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 0, i32 0
  %1 = load i32, i32* %r1, align 8, !tbaa !10
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %lor.lhs.false, label %if.then5

lor.lhs.false:                                    ; preds = %if.then
  %max_comp = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %g, i64 0, i32 1
  %2 = load i32, i32* %max_comp, align 4, !tbaa !13
  %c3 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 0, i32 1
  %3 = load i32, i32* %c3, align 4, !tbaa !14
  %cmp4 = icmp eq i32 %2, %3
  br i1 %cmp4, label %if.end12, label %if.then5

if.then5:                                         ; preds = %lor.lhs.false, %if.then
  tail call void @_E__pr_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 125, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0)) #6
  %4 = load i32, i32* %r1, align 8, !tbaa !10
  %c9 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 0, i32 1
  %5 = load i32, i32* %c9, align 4, !tbaa !14
  %6 = load i32, i32* %n_mgau, align 8, !tbaa !6
  %max_comp11 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %g, i64 0, i32 1
  %7 = load i32, i32* %max_comp11, align 4, !tbaa !13
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.8, i64 0, i64 0), i32 %4, i32 %5, i32 %6, i32 %7) #6
  br label %if.end12

if.end12:                                         ; preds = %lor.lhs.false, %if.then5, %entry
  %r14 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 0, i32 0
  %8 = load i32, i32* %r14, align 8, !tbaa !10
  %cmp15191 = icmp sgt i32 %8, 0
  br i1 %cmp15191, label %for.cond16.preheader.lr.ph, label %for.end112

for.cond16.preheader.lr.ph:                       ; preds = %if.end12
  %c18 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 0, i32 1
  %map = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 5
  %n_sv = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 1
  %n_sv42 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 1
  %mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %g, i64 0, i32 3
  %n_sv94 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 1
  %map97 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 5
  br label %for.cond16.preheader

for.cond16.preheader:                             ; preds = %for.cond16.preheader.lr.ph, %for.inc110
  %indvars.iv201 = phi i64 [ 0, %for.cond16.preheader.lr.ph ], [ %indvars.iv.next202, %for.inc110 ]
  %9 = load i32, i32* %c18, align 4, !tbaa !14
  %cmp19180 = icmp sgt i32 %9, 0
  br i1 %cmp19180, label %for.body20.lr.ph, label %for.end77

for.body20.lr.ph:                                 ; preds = %for.cond16.preheader
  %10 = trunc i64 %indvars.iv201 to i32
  %11 = trunc i64 %indvars.iv201 to i32
  br label %for.body20

for.body20:                                       ; preds = %for.body20.lr.ph, %for.inc75
  %indvars.iv195 = phi i64 [ 0, %for.body20.lr.ph ], [ %indvars.iv.next196, %for.inc75 ]
  %c2.0185 = phi i32 [ 0, %for.body20.lr.ph ], [ %c2.1, %for.inc75 ]
  %12 = load i32***, i32**** %map, align 8, !tbaa !18
  %arrayidx = getelementptr inbounds i32**, i32*** %12, i64 %indvars.iv201
  %13 = load i32**, i32*** %arrayidx, align 8, !tbaa !21
  %arrayidx22 = getelementptr inbounds i32*, i32** %13, i64 %indvars.iv195
  %14 = load i32*, i32** %arrayidx22, align 8, !tbaa !21
  %15 = load i32, i32* %14, align 4, !tbaa !2
  %cmp24 = icmp slt i32 %15, 0
  br i1 %cmp24, label %for.cond26.preheader, label %if.else

for.cond26.preheader:                             ; preds = %for.body20
  %16 = load i32, i32* %n_sv, align 8, !tbaa !15
  %cmp27178 = icmp sgt i32 %16, 1
  br i1 %cmp27178, label %for.body28.preheader, label %for.inc75

for.body28.preheader:                             ; preds = %for.cond26.preheader
  %17 = trunc i64 %indvars.iv195 to i32
  br label %for.body28

for.body28:                                       ; preds = %for.body28.preheader, %for.inc
  %indvars.iv193 = phi i64 [ 1, %for.body28.preheader ], [ %indvars.iv.next194, %for.inc ]
  %18 = load i32***, i32**** %map, align 8, !tbaa !18
  %arrayidx31 = getelementptr inbounds i32**, i32*** %18, i64 %indvars.iv201
  %19 = load i32**, i32*** %arrayidx31, align 8, !tbaa !21
  %arrayidx33 = getelementptr inbounds i32*, i32** %19, i64 %indvars.iv195
  %20 = load i32*, i32** %arrayidx33, align 8, !tbaa !21
  %arrayidx35 = getelementptr inbounds i32, i32* %20, i64 %indvars.iv193
  %21 = load i32, i32* %arrayidx35, align 4, !tbaa !2
  %cmp36 = icmp sgt i32 %21, -1
  br i1 %cmp36, label %if.then37, label %for.inc

if.then37:                                        ; preds = %for.body28
  tail call void @_E__pr_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 141, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0)) #6
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.39, i64 0, i64 0), i32 %10, i32 %17) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body28, %if.then37
  %indvars.iv.next194 = add nuw nsw i64 %indvars.iv193, 1
  %22 = load i32, i32* %n_sv, align 8, !tbaa !15
  %23 = sext i32 %22 to i64
  %cmp27 = icmp slt i64 %indvars.iv.next194, %23
  br i1 %cmp27, label %for.body28, label %for.inc75

if.else:                                          ; preds = %for.body20
  %24 = zext i32 %c2.0185 to i64
  %cmp39 = icmp eq i64 %indvars.iv195, %24
  br i1 %cmp39, label %if.end72, label %for.cond41.preheader

for.cond41.preheader:                             ; preds = %if.else
  %25 = load i32, i32* %n_sv42, align 8, !tbaa !15
  %cmp43176 = icmp sgt i32 %25, 0
  br i1 %cmp43176, label %for.body44.lr.ph, label %if.end72

for.body44.lr.ph:                                 ; preds = %for.cond41.preheader
  %idxprom65 = sext i32 %c2.0185 to i64
  %26 = trunc i64 %indvars.iv195 to i32
  br label %for.body44

for.body44:                                       ; preds = %for.body44.lr.ph, %if.end54
  %indvars.iv = phi i64 [ 0, %for.body44.lr.ph ], [ %indvars.iv.next, %if.end54 ]
  %27 = load i32***, i32**** %map, align 8, !tbaa !18
  %arrayidx47 = getelementptr inbounds i32**, i32*** %27, i64 %indvars.iv201
  %28 = load i32**, i32*** %arrayidx47, align 8, !tbaa !21
  %arrayidx49 = getelementptr inbounds i32*, i32** %28, i64 %indvars.iv195
  %29 = load i32*, i32** %arrayidx49, align 8, !tbaa !21
  %arrayidx51 = getelementptr inbounds i32, i32* %29, i64 %indvars.iv
  %30 = load i32, i32* %arrayidx51, align 4, !tbaa !2
  %cmp52 = icmp slt i32 %30, 0
  br i1 %cmp52, label %if.then53, label %if.end54

if.then53:                                        ; preds = %for.body44
  tail call void @_E__pr_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 147, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0)) #6
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.39, i64 0, i64 0), i32 %11, i32 %26) #6
  br label %if.end54

if.end54:                                         ; preds = %if.then53, %for.body44
  %31 = load i32***, i32**** %map, align 8, !tbaa !18
  %arrayidx57 = getelementptr inbounds i32**, i32*** %31, i64 %indvars.iv201
  %32 = load i32**, i32*** %arrayidx57, align 8, !tbaa !21
  %arrayidx59 = getelementptr inbounds i32*, i32** %32, i64 %indvars.iv195
  %33 = load i32*, i32** %arrayidx59, align 8, !tbaa !21
  %arrayidx61 = getelementptr inbounds i32, i32* %33, i64 %indvars.iv
  %34 = load i32, i32* %arrayidx61, align 4, !tbaa !2
  %arrayidx66 = getelementptr inbounds i32*, i32** %32, i64 %idxprom65
  %35 = load i32*, i32** %arrayidx66, align 8, !tbaa !21
  %arrayidx68 = getelementptr inbounds i32, i32* %35, i64 %indvars.iv
  store i32 %34, i32* %arrayidx68, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %36 = load i32, i32* %n_sv42, align 8, !tbaa !15
  %37 = sext i32 %36 to i64
  %cmp43 = icmp slt i64 %indvars.iv.next, %37
  br i1 %cmp43, label %for.body44, label %if.end72

if.end72:                                         ; preds = %if.end54, %for.cond41.preheader, %if.else
  %inc73 = add nsw i32 %c2.0185, 1
  br label %for.inc75

for.inc75:                                        ; preds = %for.inc, %for.cond26.preheader, %if.end72
  %c2.1 = phi i32 [ %inc73, %if.end72 ], [ %c2.0185, %for.cond26.preheader ], [ %c2.0185, %for.inc ]
  %indvars.iv.next196 = add nuw nsw i64 %indvars.iv195, 1
  %38 = load i32, i32* %c18, align 4, !tbaa !14
  %39 = sext i32 %38 to i64
  %cmp19 = icmp slt i64 %indvars.iv.next196, %39
  br i1 %cmp19, label %for.body20, label %for.end77

for.end77:                                        ; preds = %for.inc75, %for.cond16.preheader
  %c2.0.lcssa = phi i32 [ 0, %for.cond16.preheader ], [ %c2.1, %for.inc75 ]
  br i1 %tobool, label %land.lhs.true, label %if.end87

land.lhs.true:                                    ; preds = %for.end77
  %40 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8, !tbaa !31
  %n_comp = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %40, i64 %indvars.iv201, i32 0
  %41 = load i32, i32* %n_comp, align 8, !tbaa !32
  %cmp81 = icmp eq i32 %c2.0.lcssa, %41
  br i1 %cmp81, label %if.end87, label %if.then82

if.then82:                                        ; preds = %land.lhs.true
  tail call void @_E__pr_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 156, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0)) #6
  %42 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8, !tbaa !31
  %n_comp86 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %42, i64 %indvars.iv201, i32 0
  %43 = load i32, i32* %n_comp86, align 8, !tbaa !32
  %44 = trunc i64 %indvars.iv201 to i32
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.40, i64 0, i64 0), i32 %44, i32 %c2.0.lcssa, i32 %43) #6
  br label %if.end87

if.end87:                                         ; preds = %land.lhs.true, %if.then82, %for.end77
  %45 = load i32, i32* %c18, align 4, !tbaa !14
  %cmp91189 = icmp slt i32 %c2.0.lcssa, %45
  br i1 %cmp91189, label %for.cond93.preheader.lr.ph, label %for.inc110

for.cond93.preheader.lr.ph:                       ; preds = %if.end87
  %46 = sext i32 %c2.0.lcssa to i64
  br label %for.cond93.preheader

for.cond93.preheader:                             ; preds = %for.cond93.preheader.lr.ph, %for.inc107
  %indvars.iv199 = phi i64 [ %46, %for.cond93.preheader.lr.ph ], [ %indvars.iv.next200, %for.inc107 ]
  %47 = load i32, i32* %n_sv94, align 8, !tbaa !15
  %cmp95187 = icmp sgt i32 %47, 0
  br i1 %cmp95187, label %for.body96.lr.ph, label %for.inc107

for.body96.lr.ph:                                 ; preds = %for.cond93.preheader
  %48 = load i32***, i32**** %map97, align 8, !tbaa !18
  %arrayidx99 = getelementptr inbounds i32**, i32*** %48, i64 %indvars.iv201
  %49 = load i32**, i32*** %arrayidx99, align 8, !tbaa !21
  %arrayidx101 = getelementptr inbounds i32*, i32** %49, i64 %indvars.iv199
  %50 = load i32*, i32** %arrayidx101, align 8, !tbaa !21
  br label %for.body96

for.body96:                                       ; preds = %for.body96.lr.ph, %for.body96
  %indvars.iv197 = phi i64 [ 0, %for.body96.lr.ph ], [ %indvars.iv.next198, %for.body96 ]
  %arrayidx103 = getelementptr inbounds i32, i32* %50, i64 %indvars.iv197
  store i32 -1, i32* %arrayidx103, align 4, !tbaa !2
  %indvars.iv.next198 = add nuw nsw i64 %indvars.iv197, 1
  %51 = load i32, i32* %n_sv94, align 8, !tbaa !15
  %52 = sext i32 %51 to i64
  %cmp95 = icmp slt i64 %indvars.iv.next198, %52
  br i1 %cmp95, label %for.body96, label %for.inc107

for.inc107:                                       ; preds = %for.body96, %for.cond93.preheader
  %indvars.iv.next200 = add nsw i64 %indvars.iv199, 1
  %53 = load i32, i32* %c18, align 4, !tbaa !14
  %54 = sext i32 %53 to i64
  %cmp91 = icmp slt i64 %indvars.iv.next200, %54
  br i1 %cmp91, label %for.cond93.preheader, label %for.inc110

for.inc110:                                       ; preds = %for.inc107, %if.end87
  %indvars.iv.next202 = add nuw nsw i64 %indvars.iv201, 1
  %55 = load i32, i32* %r14, align 8, !tbaa !10
  %56 = sext i32 %55 to i64
  %cmp15 = icmp slt i64 %indvars.iv.next202, %56
  br i1 %cmp15, label %for.cond16.preheader, label %for.end112

for.end112:                                       ; preds = %for.inc110, %if.end12
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define internal fastcc void @subvq_map_linearize(%struct.subvq_t* nocapture readonly %vq) unnamed_addr #4 {
entry:
  %r1 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 0, i32 0
  %0 = load i32, i32* %r1, align 8, !tbaa !10
  %cmp59 = icmp sgt i32 %0, 0
  br i1 %cmp59, label %for.cond2.preheader.lr.ph, label %for.end33

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %map = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 5
  %c4 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 0, i32 1
  %n_sv = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 1
  %vqsize = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 2
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.cond2.preheader.lr.ph, %for.inc31
  %indvars.iv63 = phi i64 [ 0, %for.cond2.preheader.lr.ph ], [ %indvars.iv.next64, %for.inc31 ]
  %1 = load i32, i32* %c4, align 4, !tbaa !14
  %cmp557 = icmp sgt i32 %1, 0
  br i1 %cmp557, label %land.rhs.lr.ph, label %for.inc31

land.rhs.lr.ph:                                   ; preds = %for.cond2.preheader
  %2 = load i32***, i32**** %map, align 8, !tbaa !18
  %arrayidx = getelementptr inbounds i32**, i32*** %2, i64 %indvars.iv63
  %3 = load i32**, i32*** %arrayidx, align 8, !tbaa !21
  br label %land.rhs

land.rhs:                                         ; preds = %land.rhs.lr.ph, %for.inc28
  %indvars.iv61 = phi i64 [ 0, %land.rhs.lr.ph ], [ %indvars.iv.next62, %for.inc28 ]
  %arrayidx7 = getelementptr inbounds i32*, i32** %3, i64 %indvars.iv61
  %4 = load i32*, i32** %arrayidx7, align 8, !tbaa !21
  %5 = load i32, i32* %4, align 4, !tbaa !2
  %cmp9 = icmp sgt i32 %5, -1
  br i1 %cmp9, label %for.cond11.preheader, label %for.inc31

for.cond11.preheader:                             ; preds = %land.rhs
  %6 = load i32, i32* %n_sv, align 8, !tbaa !15
  %cmp1255 = icmp sgt i32 %6, 0
  br i1 %cmp1255, label %for.body13, label %for.inc28

for.body13:                                       ; preds = %for.cond11.preheader, %for.body13
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body13 ], [ 0, %for.cond11.preheader ]
  %7 = load i32, i32* %vqsize, align 4, !tbaa !22
  %8 = trunc i64 %indvars.iv to i32
  %mul = mul nsw i32 %7, %8
  %arrayidx20 = getelementptr inbounds i32, i32* %4, i64 %indvars.iv
  %9 = load i32, i32* %arrayidx20, align 4, !tbaa !2
  %add = add nsw i32 %mul, %9
  store i32 %add, i32* %arrayidx20, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = load i32, i32* %n_sv, align 8, !tbaa !15
  %11 = sext i32 %10 to i64
  %cmp12 = icmp slt i64 %indvars.iv.next, %11
  br i1 %cmp12, label %for.body13, label %for.inc28

for.inc28:                                        ; preds = %for.body13, %for.cond11.preheader
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %12 = load i32, i32* %c4, align 4, !tbaa !14
  %13 = sext i32 %12 to i64
  %cmp5 = icmp slt i64 %indvars.iv.next62, %13
  br i1 %cmp5, label %land.rhs, label %for.inc31

for.inc31:                                        ; preds = %for.inc28, %land.rhs, %for.cond2.preheader
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %14 = load i32, i32* %r1, align 8, !tbaa !10
  %15 = sext i32 %14 to i64
  %cmp = icmp slt i64 %indvars.iv.next64, %15
  br i1 %cmp, label %for.cond2.preheader, label %for.end33

for.end33:                                        ; preds = %for.inc31, %entry
  ret void
}

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #5

declare dso_local i8** @__ckd_calloc_2d__(i32, i32, i32, i8*, i32) local_unnamed_addr #2

; Function Attrs: norecurse nounwind uwtable
define dso_local i32 @subvq_mgau_shortlist(%struct.subvq_t* nocapture readonly %vq, i32 %m, i32 %n, i32 %beam) local_unnamed_addr #4 {
entry:
  %vqdist1 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 7
  %0 = load i32**, i32*** %vqdist1, align 8, !tbaa !27
  %1 = load i32*, i32** %0, align 8, !tbaa !21
  %gauscore2 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 8
  %2 = load i32*, i32** %gauscore2, align 8, !tbaa !28
  %mgau_sl = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 9
  %3 = load i32*, i32** %mgau_sl, align 8, !tbaa !29
  %map3 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 5
  %4 = load i32***, i32**** %map3, align 8, !tbaa !18
  %idxprom = sext i32 %m to i64
  %arrayidx4 = getelementptr inbounds i32**, i32*** %4, i64 %idxprom
  %5 = load i32**, i32*** %arrayidx4, align 8, !tbaa !21
  %6 = load i32*, i32** %5, align 8, !tbaa !21
  %n_sv = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 1
  %7 = load i32, i32* %n_sv, align 8, !tbaa !15
  switch i32 %7, label %for.cond68.preheader [
    i32 3, label %for.cond.preheader
    i32 2, label %for.cond35.preheader
    i32 1, label %for.cond54.preheader
  ]

for.cond54.preheader:                             ; preds = %entry
  %cmp55215 = icmp sgt i32 %n, 0
  br i1 %cmp55215, label %for.body56.preheader, label %for.end104

for.body56.preheader:                             ; preds = %for.cond54.preheader
  %wide.trip.count238 = zext i32 %n to i64
  br label %for.body56

for.cond35.preheader:                             ; preds = %entry
  %cmp36210 = icmp sgt i32 %n, 0
  br i1 %cmp36210, label %for.body37.preheader, label %for.end104

for.body37.preheader:                             ; preds = %for.cond35.preheader
  %wide.trip.count234 = zext i32 %n to i64
  br label %for.body37

for.cond.preheader:                               ; preds = %entry
  %cmp205 = icmp sgt i32 %n, 0
  br i1 %cmp205, label %for.body.lr.ph, label %for.end104

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %8 = load i32, i32* @VQ_EVAL, align 4, !tbaa !2
  %cmp6 = icmp eq i32 %8, 1
  %cmp9 = icmp eq i32 %8, 2
  %wide.trip.count230 = zext i32 %n to i64
  br label %for.body

for.cond68.preheader:                             ; preds = %entry
  %cmp69200 = icmp sgt i32 %n, 0
  br i1 %cmp69200, label %for.cond71.preheader.preheader, label %for.end104

for.cond71.preheader.preheader:                   ; preds = %for.cond68.preheader
  %wide.trip.count226 = zext i32 %n to i64
  br label %for.cond71.preheader

for.body:                                         ; preds = %if.end28, %for.body.lr.ph
  %indvars.iv228 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next229, %if.end28 ]
  %map.0208 = phi i32* [ %6, %for.body.lr.ph ], [ %map.1, %if.end28 ]
  %bv.0206 = phi i32 [ -2147483648, %for.body.lr.ph ], [ %spec.select, %if.end28 ]
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %9 = load i32, i32* %map.0208, align 4, !tbaa !2
  %idxprom7 = sext i32 %9 to i64
  %arrayidx8 = getelementptr inbounds i32, i32* %1, i64 %idxprom7
  %10 = load i32, i32* %arrayidx8, align 4, !tbaa !2
  br label %if.end28

if.else:                                          ; preds = %for.body
  %incdec.ptr = getelementptr inbounds i32, i32* %map.0208, i64 1
  %11 = load i32, i32* %map.0208, align 4, !tbaa !2
  %idxprom11 = sext i32 %11 to i64
  %arrayidx12 = getelementptr inbounds i32, i32* %1, i64 %idxprom11
  %12 = load i32, i32* %arrayidx12, align 4, !tbaa !2
  br i1 %cmp9, label %if.then10, label %if.else16

if.then10:                                        ; preds = %if.else
  %13 = load i32, i32* %incdec.ptr, align 4, !tbaa !2
  %idxprom13 = sext i32 %13 to i64
  %arrayidx14 = getelementptr inbounds i32, i32* %1, i64 %idxprom13
  %14 = load i32, i32* %arrayidx14, align 4, !tbaa !2
  %mul = shl i32 %14, 1
  %add = add nsw i32 %mul, %12
  br label %if.end28

if.else16:                                        ; preds = %if.else
  %incdec.ptr20 = getelementptr inbounds i32, i32* %map.0208, i64 2
  %15 = load i32, i32* %incdec.ptr, align 4, !tbaa !2
  %idxprom21 = sext i32 %15 to i64
  %arrayidx22 = getelementptr inbounds i32, i32* %1, i64 %idxprom21
  %16 = load i32, i32* %arrayidx22, align 4, !tbaa !2
  %add23 = add nsw i32 %16, %12
  %17 = load i32, i32* %incdec.ptr20, align 4, !tbaa !2
  %idxprom25 = sext i32 %17 to i64
  %arrayidx26 = getelementptr inbounds i32, i32* %1, i64 %idxprom25
  %18 = load i32, i32* %arrayidx26, align 4, !tbaa !2
  %add27 = add nsw i32 %add23, %18
  br label %if.end28

if.end28:                                         ; preds = %if.then10, %if.else16, %if.then
  %v.0 = phi i32 [ %10, %if.then ], [ %add, %if.then10 ], [ %add27, %if.else16 ]
  %map.1 = getelementptr inbounds i32, i32* %map.0208, i64 3
  %arrayidx30 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv228
  store i32 %v.0, i32* %arrayidx30, align 4, !tbaa !2
  %cmp31 = icmp slt i32 %bv.0206, %v.0
  %spec.select = select i1 %cmp31, i32 %v.0, i32 %bv.0206
  %indvars.iv.next229 = add nuw nsw i64 %indvars.iv228, 1
  %exitcond231 = icmp eq i64 %indvars.iv.next229, %wide.trip.count230
  br i1 %exitcond231, label %sw.epilog, label %for.body

for.body37:                                       ; preds = %for.body37, %for.body37.preheader
  %indvars.iv232 = phi i64 [ 0, %for.body37.preheader ], [ %indvars.iv.next233, %for.body37 ]
  %map.2213 = phi i32* [ %6, %for.body37.preheader ], [ %incdec.ptr41, %for.body37 ]
  %bv.2211 = phi i32 [ -2147483648, %for.body37.preheader ], [ %spec.select185, %for.body37 ]
  %incdec.ptr38 = getelementptr inbounds i32, i32* %map.2213, i64 1
  %19 = load i32, i32* %map.2213, align 4, !tbaa !2
  %idxprom39 = sext i32 %19 to i64
  %arrayidx40 = getelementptr inbounds i32, i32* %1, i64 %idxprom39
  %20 = load i32, i32* %arrayidx40, align 4, !tbaa !2
  %incdec.ptr41 = getelementptr inbounds i32, i32* %map.2213, i64 2
  %21 = load i32, i32* %incdec.ptr38, align 4, !tbaa !2
  %idxprom42 = sext i32 %21 to i64
  %arrayidx43 = getelementptr inbounds i32, i32* %1, i64 %idxprom42
  %22 = load i32, i32* %arrayidx43, align 4, !tbaa !2
  %add44 = add nsw i32 %22, %20
  %arrayidx46 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv232
  store i32 %add44, i32* %arrayidx46, align 4, !tbaa !2
  %cmp47 = icmp slt i32 %bv.2211, %add44
  %spec.select185 = select i1 %cmp47, i32 %add44, i32 %bv.2211
  %indvars.iv.next233 = add nuw nsw i64 %indvars.iv232, 1
  %exitcond235 = icmp eq i64 %indvars.iv.next233, %wide.trip.count234
  br i1 %exitcond235, label %sw.epilog, label %for.body37

for.body56:                                       ; preds = %for.body56, %for.body56.preheader
  %indvars.iv236 = phi i64 [ 0, %for.body56.preheader ], [ %indvars.iv.next237, %for.body56 ]
  %map.3218 = phi i32* [ %6, %for.body56.preheader ], [ %incdec.ptr57, %for.body56 ]
  %bv.4216 = phi i32 [ -2147483648, %for.body56.preheader ], [ %spec.select186, %for.body56 ]
  %incdec.ptr57 = getelementptr inbounds i32, i32* %map.3218, i64 1
  %23 = load i32, i32* %map.3218, align 4, !tbaa !2
  %idxprom58 = sext i32 %23 to i64
  %arrayidx59 = getelementptr inbounds i32, i32* %1, i64 %idxprom58
  %24 = load i32, i32* %arrayidx59, align 4, !tbaa !2
  %arrayidx61 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv236
  store i32 %24, i32* %arrayidx61, align 4, !tbaa !2
  %cmp62 = icmp slt i32 %bv.4216, %24
  %spec.select186 = select i1 %cmp62, i32 %24, i32 %bv.4216
  %indvars.iv.next237 = add nuw nsw i64 %indvars.iv236, 1
  %exitcond239 = icmp eq i64 %indvars.iv.next237, %wide.trip.count238
  br i1 %exitcond239, label %sw.epilog, label %for.body56

for.cond71.preheaderthread-pre-split:             ; preds = %for.end81
  %.pr = load i32, i32* %n_sv, align 8, !tbaa !15
  br label %for.cond71.preheader

for.cond71.preheader:                             ; preds = %for.cond71.preheaderthread-pre-split, %for.cond71.preheader.preheader
  %25 = phi i32 [ %.pr, %for.cond71.preheaderthread-pre-split ], [ %7, %for.cond71.preheader.preheader ]
  %indvars.iv224 = phi i64 [ %indvars.iv.next225, %for.cond71.preheaderthread-pre-split ], [ 0, %for.cond71.preheader.preheader ]
  %map.4203 = phi i32* [ %map.5.lcssa, %for.cond71.preheaderthread-pre-split ], [ %6, %for.cond71.preheader.preheader ]
  %bv.6201 = phi i32 [ %spec.select187, %for.cond71.preheaderthread-pre-split ], [ -2147483648, %for.cond71.preheader.preheader ]
  %cmp73194 = icmp sgt i32 %25, 0
  br i1 %cmp73194, label %for.body74.lr.ph, label %for.end81

for.body74.lr.ph:                                 ; preds = %for.cond71.preheader
  %26 = load i32, i32* %n_sv, align 8, !tbaa !15
  br label %for.body74

for.body74:                                       ; preds = %for.body74.lr.ph, %for.body74
  %sv_id.0197 = phi i32 [ 0, %for.body74.lr.ph ], [ %inc80, %for.body74 ]
  %map.5196 = phi i32* [ %map.4203, %for.body74.lr.ph ], [ %incdec.ptr75, %for.body74 ]
  %v.1195 = phi i32 [ 0, %for.body74.lr.ph ], [ %add78, %for.body74 ]
  %incdec.ptr75 = getelementptr inbounds i32, i32* %map.5196, i64 1
  %27 = load i32, i32* %map.5196, align 4, !tbaa !2
  %idxprom76 = sext i32 %27 to i64
  %arrayidx77 = getelementptr inbounds i32, i32* %1, i64 %idxprom76
  %28 = load i32, i32* %arrayidx77, align 4, !tbaa !2
  %add78 = add nsw i32 %28, %v.1195
  %inc80 = add nuw nsw i32 %sv_id.0197, 1
  %cmp73 = icmp slt i32 %inc80, %26
  br i1 %cmp73, label %for.body74, label %for.end81

for.end81:                                        ; preds = %for.body74, %for.cond71.preheader
  %v.1.lcssa = phi i32 [ 0, %for.cond71.preheader ], [ %add78, %for.body74 ]
  %map.5.lcssa = phi i32* [ %map.4203, %for.cond71.preheader ], [ %incdec.ptr75, %for.body74 ]
  %arrayidx83 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv224
  store i32 %v.1.lcssa, i32* %arrayidx83, align 4, !tbaa !2
  %cmp84 = icmp slt i32 %bv.6201, %v.1.lcssa
  %spec.select187 = select i1 %cmp84, i32 %v.1.lcssa, i32 %bv.6201
  %indvars.iv.next225 = add nuw nsw i64 %indvars.iv224, 1
  %exitcond227 = icmp eq i64 %indvars.iv.next225, %wide.trip.count226
  br i1 %exitcond227, label %sw.epilog, label %for.cond71.preheaderthread-pre-split

sw.epilog:                                        ; preds = %for.body56, %for.body37, %if.end28, %for.end81
  %bv.8 = phi i32 [ %spec.select187, %for.end81 ], [ %spec.select, %if.end28 ], [ %spec.select185, %for.body37 ], [ %spec.select186, %for.body56 ]
  %add90 = add nsw i32 %bv.8, %beam
  %cmp92191 = icmp sgt i32 %n, 0
  br i1 %cmp92191, label %for.body93.preheader, label %for.end104

for.body93.preheader:                             ; preds = %sw.epilog
  %wide.trip.count = zext i32 %n to i64
  br label %for.body93

for.body93:                                       ; preds = %for.inc102, %for.body93.preheader
  %indvars.iv = phi i64 [ 0, %for.body93.preheader ], [ %indvars.iv.next, %for.inc102 ]
  %nc.0192 = phi i32 [ 0, %for.body93.preheader ], [ %nc.1, %for.inc102 ]
  %arrayidx95 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv
  %29 = load i32, i32* %arrayidx95, align 4, !tbaa !2
  %cmp96 = icmp slt i32 %29, %add90
  br i1 %cmp96, label %for.inc102, label %if.then97

if.then97:                                        ; preds = %for.body93
  %inc98 = add nsw i32 %nc.0192, 1
  %idxprom99 = sext i32 %nc.0192 to i64
  %arrayidx100 = getelementptr inbounds i32, i32* %3, i64 %idxprom99
  %30 = trunc i64 %indvars.iv to i32
  store i32 %30, i32* %arrayidx100, align 4, !tbaa !2
  br label %for.inc102

for.inc102:                                       ; preds = %for.body93, %if.then97
  %nc.1 = phi i32 [ %inc98, %if.then97 ], [ %nc.0192, %for.body93 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end104, label %for.body93

for.end104:                                       ; preds = %for.inc102, %for.cond68.preheader, %for.cond.preheader, %for.cond35.preheader, %for.cond54.preheader, %sw.epilog
  %nc.0.lcssa = phi i32 [ 0, %sw.epilog ], [ 0, %for.cond54.preheader ], [ 0, %for.cond35.preheader ], [ 0, %for.cond.preheader ], [ 0, %for.cond68.preheader ], [ %nc.1, %for.inc102 ]
  %idxprom105 = sext i32 %nc.0.lcssa to i64
  %arrayidx106 = getelementptr inbounds i32, i32* %3, i64 %idxprom105
  store i32 -1, i32* %arrayidx106, align 4, !tbaa !2
  ret i32 %nc.0.lcssa
}

; Function Attrs: nounwind uwtable
define dso_local void @subvq_subvec_eval_logs3(%struct.subvq_t* nocapture readonly %vq, float* nocapture readonly %feat, i32 %s) local_unnamed_addr #0 {
entry:
  %featdim1 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 3
  %0 = load i32**, i32*** %featdim1, align 8, !tbaa !16
  %idxprom = sext i32 %s to i64
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 %idxprom
  %1 = load i32*, i32** %arrayidx, align 8, !tbaa !21
  %gautbl = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 4
  %2 = load %struct.vector_gautbl_t*, %struct.vector_gautbl_t** %gautbl, align 8, !tbaa !17
  %veclen30 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %2, i64 %idxprom, i32 1
  %3 = load i32, i32* %veclen30, align 4, !tbaa !19
  %cmp31 = icmp sgt i32 %3, 0
  br i1 %cmp31, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %subvec = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 6
  %4 = load float*, float** %subvec, align 8, !tbaa !26
  %5 = load %struct.vector_gautbl_t*, %struct.vector_gautbl_t** %gautbl, align 8, !tbaa !17
  %veclen = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %5, i64 %idxprom, i32 1
  %6 = load i32, i32* %veclen, align 4, !tbaa !19
  %7 = sext i32 %6 to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %arrayidx5 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv
  %8 = load i32, i32* %arrayidx5, align 4, !tbaa !2
  %idxprom6 = sext i32 %8 to i64
  %arrayidx7 = getelementptr inbounds float, float* %feat, i64 %idxprom6
  %9 = bitcast float* %arrayidx7 to i32*
  %10 = load i32, i32* %9, align 4, !tbaa !34
  %arrayidx9 = getelementptr inbounds float, float* %4, i64 %indvars.iv
  %11 = bitcast float* %arrayidx9 to i32*
  store i32 %10, i32* %11, align 4, !tbaa !34
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %7
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  %.lcssa = phi %struct.vector_gautbl_t* [ %2, %entry ], [ %5, %for.body ]
  %arrayidx3 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %.lcssa, i64 %idxprom
  %vqsize = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 2
  %12 = load i32, i32* %vqsize, align 4, !tbaa !22
  %subvec13 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 6
  %13 = load float*, float** %subvec13, align 8, !tbaa !26
  %vqdist = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 7
  %14 = load i32**, i32*** %vqdist, align 8, !tbaa !27
  %arrayidx15 = getelementptr inbounds i32*, i32** %14, i64 %idxprom
  %15 = load i32*, i32** %arrayidx15, align 8, !tbaa !21
  tail call void @vector_gautbl_eval_logs3(%struct.vector_gautbl_t* %arrayidx3, i32 0, i32 %12, float* %13, i32* %15) #6
  ret void
}

declare dso_local void @vector_gautbl_eval_logs3(%struct.vector_gautbl_t*, i32, i32, float*, i32*) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @subvq_gautbl_eval_logs3(%struct.subvq_t* nocapture readonly %vq, float* nocapture readonly %feat) local_unnamed_addr #0 {
entry:
  %n_sv = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 1
  %0 = load i32, i32* %n_sv, align 8, !tbaa !15
  %cmp46 = icmp sgt i32 %0, 0
  br i1 %cmp46, label %for.body.lr.ph, label %for.end22

for.body.lr.ph:                                   ; preds = %entry
  %featdim1 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 3
  %gautbl = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 4
  %subvec = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 6
  %vqsize = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 2
  %subvec17 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 6
  %vqdist = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 7
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc20
  %indvars.iv48 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next49, %for.inc20 ]
  %1 = load i32**, i32*** %featdim1, align 8, !tbaa !16
  %arrayidx = getelementptr inbounds i32*, i32** %1, i64 %indvars.iv48
  %2 = load i32*, i32** %arrayidx, align 8, !tbaa !21
  %3 = load %struct.vector_gautbl_t*, %struct.vector_gautbl_t** %gautbl, align 8, !tbaa !17
  %veclen43 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %3, i64 %indvars.iv48, i32 1
  %4 = load i32, i32* %veclen43, align 4, !tbaa !19
  %cmp544 = icmp sgt i32 %4, 0
  br i1 %cmp544, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.body
  %5 = load float*, float** %subvec, align 8, !tbaa !26
  %6 = load %struct.vector_gautbl_t*, %struct.vector_gautbl_t** %gautbl, align 8, !tbaa !17
  %veclen = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %6, i64 %indvars.iv48, i32 1
  %7 = load i32, i32* %veclen, align 4, !tbaa !19
  %8 = sext i32 %7 to i64
  br label %for.body6

for.body6:                                        ; preds = %for.body6.lr.ph, %for.body6
  %indvars.iv = phi i64 [ 0, %for.body6.lr.ph ], [ %indvars.iv.next, %for.body6 ]
  %arrayidx8 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv
  %9 = load i32, i32* %arrayidx8, align 4, !tbaa !2
  %idxprom9 = sext i32 %9 to i64
  %arrayidx10 = getelementptr inbounds float, float* %feat, i64 %idxprom9
  %10 = bitcast float* %arrayidx10 to i32*
  %11 = load i32, i32* %10, align 4, !tbaa !34
  %arrayidx12 = getelementptr inbounds float, float* %5, i64 %indvars.iv
  %12 = bitcast float* %arrayidx12 to i32*
  store i32 %11, i32* %12, align 4, !tbaa !34
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp5 = icmp slt i64 %indvars.iv.next, %8
  br i1 %cmp5, label %for.body6, label %for.end

for.end:                                          ; preds = %for.body6, %for.body
  %.lcssa.pn = phi %struct.vector_gautbl_t* [ %3, %for.body ], [ %6, %for.body6 ]
  %13 = load i32, i32* @VQ_EVAL, align 4, !tbaa !2
  %14 = sext i32 %13 to i64
  %cmp13 = icmp slt i64 %indvars.iv48, %14
  br i1 %cmp13, label %if.then, label %for.inc20

if.then:                                          ; preds = %for.end
  %arrayidx4.lcssa = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %.lcssa.pn, i64 %indvars.iv48
  %15 = load i32, i32* %vqsize, align 4, !tbaa !22
  %16 = load float*, float** %subvec17, align 8, !tbaa !26
  %17 = load i32**, i32*** %vqdist, align 8, !tbaa !27
  %arrayidx19 = getelementptr inbounds i32*, i32** %17, i64 %indvars.iv48
  %18 = load i32*, i32** %arrayidx19, align 8, !tbaa !21
  tail call void @vector_gautbl_eval_logs3(%struct.vector_gautbl_t* %arrayidx4.lcssa, i32 0, i32 %15, float* %16, i32* %18) #6
  br label %for.inc20

for.inc20:                                        ; preds = %for.end, %if.then
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %19 = load i32, i32* %n_sv, align 8, !tbaa !15
  %20 = sext i32 %19 to i64
  %cmp = icmp slt i64 %indvars.iv.next49, %20
  br i1 %cmp, label %for.body, label %for.end22

for.end22:                                        ; preds = %for.inc20, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @subvq_frame_eval(%struct.subvq_t* readonly %vq, %struct.mgau_model_t* %g, i32 %beam, float* %feat, i32* readonly %sen_active, i32* nocapture %senscr) local_unnamed_addr #0 {
entry:
  %tobool = icmp eq %struct.subvq_t* %vq, null
  br i1 %tobool, label %for.cond.preheader, label %if.else18

for.cond.preheader:                               ; preds = %entry
  %n_mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %g, i64 0, i32 0
  %0 = load i32, i32* %n_mgau, align 8, !tbaa !6
  %cmp123 = icmp sgt i32 %0, 0
  br i1 %cmp123, label %for.body.lr.ph, label %if.end53

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %tobool1 = icmp eq i32* %sen_active, null
  %mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %g, i64 0, i32 3
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %indvars.iv141 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next142, %for.inc ]
  %ng.0128 = phi i32 [ 0, %for.body.lr.ph ], [ %ng.1, %for.inc ]
  %ns.0127 = phi i32 [ 0, %for.body.lr.ph ], [ %ns.1, %for.inc ]
  %best.0126 = phi i32 [ -2147483648, %for.body.lr.ph ], [ %best.2, %for.inc ]
  br i1 %tobool1, label %if.then3, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %arrayidx = getelementptr inbounds i32, i32* %sen_active, i64 %indvars.iv141
  %1 = load i32, i32* %arrayidx, align 4, !tbaa !2
  %tobool2 = icmp eq i32 %1, 0
  br i1 %tobool2, label %if.else, label %if.then3

if.then3:                                         ; preds = %lor.lhs.false, %for.body
  %2 = trunc i64 %indvars.iv141 to i32
  %call = tail call i32 @mgau_eval(%struct.mgau_model_t* nonnull %g, i32 %2, i32* null, float* %feat) #6
  %arrayidx5 = getelementptr inbounds i32, i32* %senscr, i64 %indvars.iv141
  store i32 %call, i32* %arrayidx5, align 4, !tbaa !2
  %cmp8 = icmp slt i32 %best.0126, %call
  %spec.select = select i1 %cmp8, i32 %call, i32 %best.0126
  %inc = add nsw i32 %ns.0127, 1
  %3 = load %struct.mgau_t*, %struct.mgau_t** %mgau, align 8, !tbaa !31
  %n_comp = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %3, i64 %indvars.iv141, i32 0
  %4 = load i32, i32* %n_comp, align 8, !tbaa !32
  %add = add nsw i32 %4, %ng.0128
  br label %for.inc

if.else:                                          ; preds = %lor.lhs.false
  %arrayidx15 = getelementptr inbounds i32, i32* %senscr, i64 %indvars.iv141
  store i32 -939524096, i32* %arrayidx15, align 4, !tbaa !2
  br label %for.inc

for.inc:                                          ; preds = %if.then3, %if.else
  %best.2 = phi i32 [ %spec.select, %if.then3 ], [ %best.0126, %if.else ]
  %ns.1 = phi i32 [ %inc, %if.then3 ], [ %ns.0127, %if.else ]
  %ng.1 = phi i32 [ %add, %if.then3 ], [ %ng.0128, %if.else ]
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %5 = load i32, i32* %n_mgau, align 8, !tbaa !6
  %6 = sext i32 %5 to i64
  %cmp = icmp slt i64 %indvars.iv.next142, %6
  br i1 %cmp, label %for.body, label %if.end53

if.else18:                                        ; preds = %entry
  tail call void @subvq_gautbl_eval_logs3(%struct.subvq_t* nonnull %vq, float* %feat)
  %n_mgau20 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %g, i64 0, i32 0
  %7 = load i32, i32* %n_mgau20, align 8, !tbaa !6
  %cmp21131 = icmp sgt i32 %7, 0
  br i1 %cmp21131, label %for.body22.lr.ph, label %if.end53

for.body22.lr.ph:                                 ; preds = %if.else18
  %tobool23 = icmp eq i32* %sen_active, null
  %mgau29 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %g, i64 0, i32 3
  %mgau_sl = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 9
  br label %for.body22

for.body22:                                       ; preds = %for.body22.lr.ph, %for.inc50
  %indvars.iv143 = phi i64 [ 0, %for.body22.lr.ph ], [ %indvars.iv.next144, %for.inc50 ]
  %ng.2136 = phi i32 [ 0, %for.body22.lr.ph ], [ %ng.3, %for.inc50 ]
  %ns.2135 = phi i32 [ 0, %for.body22.lr.ph ], [ %ns.3, %for.inc50 ]
  %best.3134 = phi i32 [ -2147483648, %for.body22.lr.ph ], [ %best.5, %for.inc50 ]
  br i1 %tobool23, label %if.then28, label %lor.lhs.false24

lor.lhs.false24:                                  ; preds = %for.body22
  %arrayidx26 = getelementptr inbounds i32, i32* %sen_active, i64 %indvars.iv143
  %8 = load i32, i32* %arrayidx26, align 4, !tbaa !2
  %tobool27 = icmp eq i32 %8, 0
  br i1 %tobool27, label %if.else46, label %if.then28

if.then28:                                        ; preds = %lor.lhs.false24, %for.body22
  %9 = load %struct.mgau_t*, %struct.mgau_t** %mgau29, align 8, !tbaa !31
  %n_comp32 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %9, i64 %indvars.iv143, i32 0
  %10 = load i32, i32* %n_comp32, align 8, !tbaa !32
  %11 = trunc i64 %indvars.iv143 to i32
  %call33 = tail call i32 @subvq_mgau_shortlist(%struct.subvq_t* nonnull %vq, i32 %11, i32 %10, i32 %beam)
  %add34 = add nsw i32 %call33, %ng.2136
  %12 = load i32*, i32** %mgau_sl, align 8, !tbaa !29
  %13 = trunc i64 %indvars.iv143 to i32
  %call35 = tail call i32 @mgau_eval(%struct.mgau_model_t* nonnull %g, i32 %13, i32* %12, float* %feat) #6
  %arrayidx37 = getelementptr inbounds i32, i32* %senscr, i64 %indvars.iv143
  store i32 %call35, i32* %arrayidx37, align 4, !tbaa !2
  %cmp40 = icmp slt i32 %best.3134, %call35
  %spec.select119 = select i1 %cmp40, i32 %call35, i32 %best.3134
  %inc45 = add nsw i32 %ns.2135, 1
  br label %for.inc50

if.else46:                                        ; preds = %lor.lhs.false24
  %arrayidx48 = getelementptr inbounds i32, i32* %senscr, i64 %indvars.iv143
  store i32 -939524096, i32* %arrayidx48, align 4, !tbaa !2
  br label %for.inc50

for.inc50:                                        ; preds = %if.then28, %if.else46
  %best.5 = phi i32 [ %spec.select119, %if.then28 ], [ %best.3134, %if.else46 ]
  %ns.3 = phi i32 [ %inc45, %if.then28 ], [ %ns.2135, %if.else46 ]
  %ng.3 = phi i32 [ %add34, %if.then28 ], [ %ng.2136, %if.else46 ]
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %14 = load i32, i32* %n_mgau20, align 8, !tbaa !6
  %15 = sext i32 %14 to i64
  %cmp21 = icmp slt i64 %indvars.iv.next144, %15
  br i1 %cmp21, label %for.body22, label %if.end53

if.end53:                                         ; preds = %for.inc50, %for.inc, %if.else18, %for.cond.preheader
  %best.6 = phi i32 [ -2147483648, %for.cond.preheader ], [ -2147483648, %if.else18 ], [ %best.2, %for.inc ], [ %best.5, %for.inc50 ]
  %ns.4 = phi i32 [ 0, %for.cond.preheader ], [ 0, %if.else18 ], [ %ns.1, %for.inc ], [ %ns.3, %for.inc50 ]
  %ng.4 = phi i32 [ 0, %for.cond.preheader ], [ 0, %if.else18 ], [ %ng.1, %for.inc ], [ %ng.3, %for.inc50 ]
  %n_mgau55 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %g, i64 0, i32 0
  %16 = load i32, i32* %n_mgau55, align 8, !tbaa !6
  %cmp56121 = icmp sgt i32 %16, 0
  br i1 %cmp56121, label %for.body57, label %for.end62

for.body57:                                       ; preds = %if.end53, %for.body57
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body57 ], [ 0, %if.end53 ]
  %arrayidx59 = getelementptr inbounds i32, i32* %senscr, i64 %indvars.iv
  %17 = load i32, i32* %arrayidx59, align 4, !tbaa !2
  %sub = sub nsw i32 %17, %best.6
  store i32 %sub, i32* %arrayidx59, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = load i32, i32* %n_mgau55, align 8, !tbaa !6
  %19 = sext i32 %18 to i64
  %cmp56 = icmp slt i64 %indvars.iv.next, %19
  br i1 %cmp56, label %for.body57, label %for.end62

for.end62:                                        ; preds = %for.body57, %if.end53
  %frm_sen_eval = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %g, i64 0, i32 5
  store i32 %ns.4, i32* %frm_sen_eval, align 8, !tbaa !36
  %frm_gau_eval = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %g, i64 0, i32 6
  store i32 %ng.4, i32* %frm_gau_eval, align 4, !tbaa !37
  ret i32 %best.6
}

declare dso_local i32 @mgau_eval(%struct.mgau_model_t*, i32, i32*, float*) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local i32 @subvq_mgau_eval(%struct.mgau_model_t* nocapture readonly %g, %struct.subvq_t* nocapture readonly %vq, i32 %m, i32 %n, i32* readonly %active) local_unnamed_addr #0 {
entry:
  %call = tail call double @log_to_logs3_factor() #6
  %vqdist1 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 7
  %0 = load i32**, i32*** %vqdist1, align 8, !tbaa !27
  %1 = load i32*, i32** %0, align 8, !tbaa !21
  %mgau2 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %g, i64 0, i32 3
  %2 = load %struct.mgau_t*, %struct.mgau_t** %mgau2, align 8, !tbaa !31
  %idxprom = sext i32 %m to i64
  %map4 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 5
  %3 = load i32***, i32**** %map4, align 8, !tbaa !18
  %arrayidx6 = getelementptr inbounds i32**, i32*** %3, i64 %idxprom
  %4 = load i32**, i32*** %arrayidx6, align 8, !tbaa !21
  %5 = load i32*, i32** %4, align 8, !tbaa !21
  %tobool = icmp eq i32* %active, null
  br i1 %tobool, label %for.cond.preheader, label %for.cond20

for.cond.preheader:                               ; preds = %entry
  %cmp110 = icmp sgt i32 %n, 0
  br i1 %cmp110, label %for.cond8.preheader.lr.ph, label %if.then59

for.cond8.preheader.lr.ph:                        ; preds = %for.cond.preheader
  %n_sv = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 1
  %mixw = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %2, i64 %idxprom, i32 4
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond8.preheader

for.cond8.preheader:                              ; preds = %for.end, %for.cond8.preheader.lr.ph
  %indvars.iv = phi i64 [ 0, %for.cond8.preheader.lr.ph ], [ %indvars.iv.next, %for.end ]
  %map.0113 = phi i32* [ %5, %for.cond8.preheader.lr.ph ], [ %map.1.lcssa, %for.end ]
  %score.0112 = phi i32 [ -939524096, %for.cond8.preheader.lr.ph ], [ %call16, %for.end ]
  %6 = load i32, i32* %n_sv, align 8, !tbaa !15
  %cmp9105 = icmp sgt i32 %6, 0
  br i1 %cmp9105, label %for.body10.lr.ph, label %for.end

for.body10.lr.ph:                                 ; preds = %for.cond8.preheader
  %7 = load i32, i32* %n_sv, align 8, !tbaa !15
  br label %for.body10

for.body10:                                       ; preds = %for.body10.lr.ph, %for.body10
  %map.1108 = phi i32* [ %map.0113, %for.body10.lr.ph ], [ %incdec.ptr, %for.body10 ]
  %sv_id.0107 = phi i32 [ 0, %for.body10.lr.ph ], [ %inc, %for.body10 ]
  %v.0106 = phi i32 [ 0, %for.body10.lr.ph ], [ %add, %for.body10 ]
  %incdec.ptr = getelementptr inbounds i32, i32* %map.1108, i64 1
  %8 = load i32, i32* %map.1108, align 4, !tbaa !2
  %idxprom11 = sext i32 %8 to i64
  %arrayidx12 = getelementptr inbounds i32, i32* %1, i64 %idxprom11
  %9 = load i32, i32* %arrayidx12, align 4, !tbaa !2
  %add = add nsw i32 %9, %v.0106
  %inc = add nuw nsw i32 %sv_id.0107, 1
  %cmp9 = icmp slt i32 %inc, %7
  br i1 %cmp9, label %for.body10, label %for.end

for.end:                                          ; preds = %for.body10, %for.cond8.preheader
  %v.0.lcssa = phi i32 [ 0, %for.cond8.preheader ], [ %add, %for.body10 ]
  %map.1.lcssa = phi i32* [ %map.0113, %for.cond8.preheader ], [ %incdec.ptr, %for.body10 ]
  %10 = load i32*, i32** %mixw, align 8, !tbaa !38
  %arrayidx14 = getelementptr inbounds i32, i32* %10, i64 %indvars.iv
  %11 = load i32, i32* %arrayidx14, align 4, !tbaa !2
  %add15 = add nsw i32 %11, %v.0.lcssa
  %call16 = tail call i32 @logs3_add(i32 %score.0112, i32 %add15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %if.end, label %for.cond8.preheader

for.cond20:                                       ; preds = %entry, %for.cond20
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %for.cond20 ], [ 0, %entry ]
  %arrayidx22 = getelementptr inbounds i32, i32* %active, i64 %indvars.iv133
  %12 = load i32, i32* %arrayidx22, align 4, !tbaa !2
  %cmp23 = icmp sgt i32 %12, -1
  %indvars.iv.next134 = add nuw i64 %indvars.iv133, 1
  br i1 %cmp23, label %for.cond20, label %for.cond30.preheader

for.cond30.preheader:                             ; preds = %for.cond20
  %13 = load i32, i32* %active, align 4, !tbaa !2
  %cmp33121 = icmp sgt i32 %13, -1
  br i1 %cmp33121, label %for.body34.lr.ph, label %if.then59

for.body34.lr.ph:                                 ; preds = %for.cond30.preheader
  %n_sv37 = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %vq, i64 0, i32 1
  %mixw50 = getelementptr inbounds %struct.mgau_t, %struct.mgau_t* %2, i64 %idxprom, i32 4
  br label %for.body34

for.body34:                                       ; preds = %for.body34.lr.ph, %for.end48
  %indvars.iv131 = phi i64 [ 0, %for.body34.lr.ph ], [ %indvars.iv.next132, %for.end48 ]
  %14 = phi i32 [ %13, %for.body34.lr.ph ], [ %23, %for.end48 ]
  %map.2125 = phi i32* [ %5, %for.body34.lr.ph ], [ %map.3.lcssa, %for.end48 ]
  %last_active.0124 = phi i32 [ 0, %for.body34.lr.ph ], [ %add49, %for.end48 ]
  %score.1123 = phi i32 [ -939524096, %for.body34.lr.ph ], [ %call54, %for.end48 ]
  %sub = sub nsw i32 %14, %last_active.0124
  %15 = load i32, i32* %n_sv37, align 8, !tbaa !15
  %mul = mul nsw i32 %15, %sub
  %idx.ext = sext i32 %mul to i64
  %add.ptr = getelementptr inbounds i32, i32* %map.2125, i64 %idx.ext
  %cmp40115 = icmp sgt i32 %15, 0
  br i1 %cmp40115, label %for.body41.preheader, label %for.end48

for.body41.preheader:                             ; preds = %for.body34
  %16 = add i32 %15, -1
  %17 = zext i32 %16 to i64
  %18 = add nsw i64 %idx.ext, %17
  br label %for.body41

for.body41:                                       ; preds = %for.body41, %for.body41.preheader
  %map.3118 = phi i32* [ %incdec.ptr42, %for.body41 ], [ %add.ptr, %for.body41.preheader ]
  %sv_id.1117 = phi i32 [ %inc47, %for.body41 ], [ 0, %for.body41.preheader ]
  %v.1116 = phi i32 [ %add45, %for.body41 ], [ 0, %for.body41.preheader ]
  %incdec.ptr42 = getelementptr inbounds i32, i32* %map.3118, i64 1
  %19 = load i32, i32* %map.3118, align 4, !tbaa !2
  %idxprom43 = sext i32 %19 to i64
  %arrayidx44 = getelementptr inbounds i32, i32* %1, i64 %idxprom43
  %20 = load i32, i32* %arrayidx44, align 4, !tbaa !2
  %add45 = add nsw i32 %20, %v.1116
  %inc47 = add nuw nsw i32 %sv_id.1117, 1
  %exitcond130 = icmp eq i32 %inc47, %15
  br i1 %exitcond130, label %for.end48.loopexit, label %for.body41

for.end48.loopexit:                               ; preds = %for.body41
  %scevgep = getelementptr i32, i32* %map.2125, i64 1
  %scevgep129 = getelementptr i32, i32* %scevgep, i64 %18
  br label %for.end48

for.end48:                                        ; preds = %for.end48.loopexit, %for.body34
  %v.1.lcssa = phi i32 [ 0, %for.body34 ], [ %add45, %for.end48.loopexit ]
  %map.3.lcssa = phi i32* [ %add.ptr, %for.body34 ], [ %scevgep129, %for.end48.loopexit ]
  %add49 = add nsw i32 %14, 1
  %21 = load i32*, i32** %mixw50, align 8, !tbaa !38
  %arrayidx52 = getelementptr inbounds i32, i32* %21, i64 %indvars.iv131
  %22 = load i32, i32* %arrayidx52, align 4, !tbaa !2
  %add53 = add nsw i32 %22, %v.1.lcssa
  %call54 = tail call i32 @logs3_add(i32 %score.1123, i32 %add53) #6
  %indvars.iv.next132 = add nuw i64 %indvars.iv131, 1
  %arrayidx32 = getelementptr inbounds i32, i32* %active, i64 %indvars.iv.next132
  %23 = load i32, i32* %arrayidx32, align 4, !tbaa !2
  %cmp33 = icmp sgt i32 %23, -1
  br i1 %cmp33, label %for.body34, label %if.end

if.end:                                           ; preds = %for.end48, %for.end
  %score.2 = phi i32 [ %call16, %for.end ], [ %call54, %for.end48 ]
  %cmp58 = icmp eq i32 %score.2, -939524096
  br i1 %cmp58, label %if.then59, label %if.end60

if.then59:                                        ; preds = %for.cond30.preheader, %for.cond.preheader, %if.end
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i64 576, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)) #6
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.37, i64 0, i64 0)) #6
  br label %if.end60

if.end60:                                         ; preds = %if.then59, %if.end
  %score.2137 = phi i32 [ -939524096, %if.then59 ], [ %score.2, %if.end ]
  ret i32 %score.2137
}

declare dso_local double @log_to_logs3_factor() local_unnamed_addr #2

declare dso_local i32 @logs3_add(i32, i32) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @subvq_free(%struct.subvq_t* %s) local_unnamed_addr #0 {
entry:
  %tobool = icmp eq %struct.subvq_t* %s, null
  br i1 %tobool, label %if.end35, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %n_sv = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %s, i64 0, i32 1
  %0 = load i32, i32* %n_sv, align 8, !tbaa !15
  %cmp57 = icmp sgt i32 %0, 0
  %featdim = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %s, i64 0, i32 3
  %1 = load i32**, i32*** %featdim, align 8, !tbaa !16
  br i1 %cmp57, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.cond.preheader ]
  %2 = phi i32** [ %7, %for.inc ], [ %1, %for.cond.preheader ]
  %arrayidx = getelementptr inbounds i32*, i32** %2, i64 %indvars.iv
  %3 = load i32*, i32** %arrayidx, align 8, !tbaa !21
  %tobool1 = icmp eq i32* %3, null
  br i1 %tobool1, label %for.inc, label %if.then2

if.then2:                                         ; preds = %for.body
  %4 = bitcast i32* %3 to i8*
  tail call void @ckd_free(i8* %4) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = load i32, i32* %n_sv, align 8, !tbaa !15
  %6 = sext i32 %5 to i64
  %cmp = icmp slt i64 %indvars.iv.next, %6
  %7 = load i32**, i32*** %featdim, align 8, !tbaa !16
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc, %for.cond.preheader
  %.lcssa = phi i32** [ %1, %for.cond.preheader ], [ %7, %for.inc ]
  %tobool7 = icmp eq i32** %.lcssa, null
  br i1 %tobool7, label %if.end10, label %if.then8

if.then8:                                         ; preds = %for.end
  %8 = bitcast i32** %.lcssa to i8*
  tail call void @ckd_free(i8* %8) #6
  br label %if.end10

if.end10:                                         ; preds = %for.end, %if.then8
  %gautbl = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %s, i64 0, i32 4
  %9 = load %struct.vector_gautbl_t*, %struct.vector_gautbl_t** %gautbl, align 8, !tbaa !17
  %tobool11 = icmp eq %struct.vector_gautbl_t* %9, null
  br i1 %tobool11, label %if.end14, label %if.then12

if.then12:                                        ; preds = %if.end10
  %10 = bitcast %struct.vector_gautbl_t* %9 to i8*
  tail call void @ckd_free(i8* %10) #6
  br label %if.end14

if.end14:                                         ; preds = %if.end10, %if.then12
  %map = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %s, i64 0, i32 5
  %11 = load i32***, i32**** %map, align 8, !tbaa !18
  %tobool15 = icmp eq i32*** %11, null
  br i1 %tobool15, label %if.end18, label %if.then16

if.then16:                                        ; preds = %if.end14
  %12 = bitcast i32*** %11 to i8***
  tail call void @ckd_free_3d(i8*** %12) #6
  br label %if.end18

if.end18:                                         ; preds = %if.end14, %if.then16
  %subvec = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %s, i64 0, i32 6
  %13 = load float*, float** %subvec, align 8, !tbaa !26
  %tobool19 = icmp eq float* %13, null
  br i1 %tobool19, label %if.end22, label %if.then20

if.then20:                                        ; preds = %if.end18
  %14 = bitcast float* %13 to i8*
  tail call void @ckd_free(i8* %14) #6
  br label %if.end22

if.end22:                                         ; preds = %if.end18, %if.then20
  %vqdist = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %s, i64 0, i32 7
  %15 = load i32**, i32*** %vqdist, align 8, !tbaa !27
  %tobool23 = icmp eq i32** %15, null
  br i1 %tobool23, label %if.end26, label %if.then24

if.then24:                                        ; preds = %if.end22
  %16 = bitcast i32** %15 to i8**
  tail call void @ckd_free_2d(i8** %16) #6
  br label %if.end26

if.end26:                                         ; preds = %if.end22, %if.then24
  %gauscore = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %s, i64 0, i32 8
  %17 = load i32*, i32** %gauscore, align 8, !tbaa !28
  %tobool27 = icmp eq i32* %17, null
  br i1 %tobool27, label %if.end30, label %if.then28

if.then28:                                        ; preds = %if.end26
  %18 = bitcast i32* %17 to i8*
  tail call void @ckd_free(i8* %18) #6
  br label %if.end30

if.end30:                                         ; preds = %if.end26, %if.then28
  %mgau_sl = getelementptr inbounds %struct.subvq_t, %struct.subvq_t* %s, i64 0, i32 9
  %19 = load i32*, i32** %mgau_sl, align 8, !tbaa !29
  %tobool31 = icmp eq i32* %19, null
  br i1 %tobool31, label %if.end34, label %if.then32

if.then32:                                        ; preds = %if.end30
  %20 = bitcast i32* %19 to i8*
  tail call void @ckd_free(i8* %20) #6
  br label %if.end34

if.end34:                                         ; preds = %if.end30, %if.then32
  %21 = bitcast %struct.subvq_t* %s to i8*
  tail call void @ckd_free(i8* %21) #6
  br label %if.end35

if.end35:                                         ; preds = %entry, %if.end34
  ret void
}

declare dso_local void @ckd_free(i8*) local_unnamed_addr #2

declare dso_local void @ckd_free_3d(i8***) local_unnamed_addr #2

declare dso_local void @ckd_free_2d(i8**) local_unnamed_addr #2

declare dso_local void @vector_gautbl_var_floor(%struct.vector_gautbl_t*, double) local_unnamed_addr #2

declare dso_local void @vector_gautbl_maha_precomp(%struct.vector_gautbl_t*) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #6

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !3, i64 0}
!7 = !{!"", !3, i64 0, !3, i64 4, !3, i64 8, !8, i64 16, !9, i64 24, !3, i64 32, !3, i64 36, !3, i64 40}
!8 = !{!"any pointer", !4, i64 0}
!9 = !{!"double", !4, i64 0}
!10 = !{!11, !3, i64 0}
!11 = !{!"", !12, i64 0, !3, i64 8, !3, i64 12, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64}
!12 = !{!"", !3, i64 0, !3, i64 4}
!13 = !{!7, !3, i64 4}
!14 = !{!11, !3, i64 4}
!15 = !{!11, !3, i64 8}
!16 = !{!11, !8, i64 16}
!17 = !{!11, !8, i64 24}
!18 = !{!11, !8, i64 32}
!19 = !{!20, !3, i64 4}
!20 = !{!"", !3, i64 0, !3, i64 4, !8, i64 8, !8, i64 16, !8, i64 24, !9, i64 32}
!21 = !{!8, !8, i64 0}
!22 = !{!11, !3, i64 12}
!23 = !{!20, !8, i64 8}
!24 = !{!20, !8, i64 16}
!25 = !{!4, !4, i64 0}
!26 = !{!11, !8, i64 40}
!27 = !{!11, !8, i64 48}
!28 = !{!11, !8, i64 56}
!29 = !{!11, !8, i64 64}
!30 = !{!20, !8, i64 24}
!31 = !{!7, !8, i64 16}
!32 = !{!33, !3, i64 0}
!33 = !{!"", !3, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32}
!34 = !{!35, !35, i64 0}
!35 = !{!"float", !4, i64 0}
!36 = !{!7, !3, i64 32}
!37 = !{!7, !3, i64 36}
!38 = !{!33, !8, i64 32}
