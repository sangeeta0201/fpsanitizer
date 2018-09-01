; ModuleID = 'new_fe_sp.bc'
source_filename = "new_fe_sp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.complex = type { double, double }
%struct.melfb_t = type { float, i32, i32, i32, float, float, float**, float**, float*, i32*, i32 }
%struct.fe_t = type { float, i32, i32, float, i32, i32, i32, i32, float, i16*, i32, %struct.melfb_t*, i32, i16, double* }
%struct.param_t = type { float, i32, float, i32, i32, i32, i32, float, float, float, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32, i32, i32, i32 }

@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [58 x i8] c"memory alloc failed in fe_build_mel_filters()\0A...exiting\0A\00", align 1
@.str.1 = private unnamed_addr constant [58 x i8] c"memory alloc failed in fe_compute_melcosine()\0A...exiting\0A\00", align 1
@.str.2 = private unnamed_addr constant [53 x i8] c"memory alloc failed in fe_frame_to_fea()\0A...exiting\0A\00", align 1
@.str.3 = private unnamed_addr constant [49 x i8] c"MEL SCALE IS CURRENTLY THE ONLY IMPLEMENTATION!\0A\00", align 1
@.str.4 = private unnamed_addr constant [55 x i8] c"memory alloc failed in fe_spec_magnitude()\0A...exiting\0A\00", align 1
@fe_fft.k = internal unnamed_addr global i32 0, align 4
@fe_fft.w = internal unnamed_addr global %struct.complex* null, align 8
@fe_fft.from = internal unnamed_addr global %struct.complex* null, align 8
@fe_fft.to = internal unnamed_addr global %struct.complex* null, align 8
@fe_fft.buffer = internal unnamed_addr global %struct.complex* null, align 8
@fe_fft.exch = internal unnamed_addr global %struct.complex* null, align 8
@fe_fft.wEnd = internal unnamed_addr global %struct.complex* null, align 8
@fe_fft.x = internal unnamed_addr global double 0.000000e+00, align 8
@.str.5 = private unnamed_addr constant [37 x i8] c"fft: N must be a power of 2 (is %d)\0A\00", align 1
@.str.6 = private unnamed_addr constant [45 x i8] c"fft: invert must be either +1 or -1 (is %d)\0A\00", align 1
@.str.7 = private unnamed_addr constant [21 x i8] c"fe_create_2d failed\0A\00", align 1
@.str.8 = private unnamed_addr constant [48 x i8] c"Please define the number of MEL filters needed\0A\00", align 1
@.str.9 = private unnamed_addr constant [41 x i8] c"Modify include/new_fe.h and new_fe_sp.c\0A\00", align 1
@.str.10 = private unnamed_addr constant [47 x i8] c"Please define the upper filt frequency needed\0A\00", align 1
@.str.11 = private unnamed_addr constant [47 x i8] c"Please define the lower filt frequency needed\0A\00", align 1
@.str.12 = private unnamed_addr constant [24 x i8] c"Current FE Parameters:\0A\00", align 1
@.str.13 = private unnamed_addr constant [32 x i8] c"\09Sampling Rate:             %f\0A\00", align 1
@.str.14 = private unnamed_addr constant [32 x i8] c"\09Frame Size:                %d\0A\00", align 1
@.str.15 = private unnamed_addr constant [32 x i8] c"\09Frame Shift:               %d\0A\00", align 1
@.str.16 = private unnamed_addr constant [32 x i8] c"\09FFT Size:                  %d\0A\00", align 1
@.str.17 = private unnamed_addr constant [32 x i8] c"\09Number of Overflow Samps:  %d\0A\00", align 1
@.str.18 = private unnamed_addr constant [32 x i8] c"\09Start Utt Status:          %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @fe_build_melfilters(%struct.melfb_t* nocapture %MEL_FB) local_unnamed_addr #0 {
entry:
  %num_filters = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL_FB, i64 0, i32 2
  %0 = load i32, i32* %num_filters, align 8, !tbaa !2
  %fft_size = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL_FB, i64 0, i32 3
  %1 = load i32, i32* %fft_size, align 4, !tbaa !9
  %call = tail call i8** @fe_create_2d(i32 %0, i32 %1, i32 4)
  %filter_coeffs = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL_FB, i64 0, i32 6
  %2 = bitcast float*** %filter_coeffs to i8***
  store i8** %call, i8*** %2, align 8, !tbaa !10
  %3 = load i32, i32* %num_filters, align 8, !tbaa !2
  %conv = sext i32 %3 to i64
  %call2 = tail call noalias i8* @calloc(i64 %conv, i64 4) #4
  %left_apex = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL_FB, i64 0, i32 8
  %4 = bitcast float** %left_apex to i8**
  store i8* %call2, i8** %4, align 8, !tbaa !11
  %call5 = tail call noalias i8* @calloc(i64 %conv, i64 4) #4
  %width = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL_FB, i64 0, i32 9
  %5 = bitcast i32** %width to i8**
  store i8* %call5, i8** %5, align 8, !tbaa !12
  %doublewide = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL_FB, i64 0, i32 10
  %6 = load i32, i32* %doublewide, align 8, !tbaa !13
  %cmp = icmp eq i32 %6, 1
  %.sink = select i1 %cmp, i32 4, i32 2
  %add11 = add nsw i32 %3, %.sink
  %conv12 = sext i32 %add11 to i64
  %call13 = tail call noalias i8* @calloc(i64 %conv12, i64 4) #4
  %filt_edge.0 = bitcast i8* %call13 to float*
  %7 = load float**, float*** %filter_coeffs, align 8, !tbaa !10
  %cmp15 = icmp eq float** %7, null
  br i1 %cmp15, label %if.then27, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %8 = load float*, float** %left_apex, align 8, !tbaa !11
  %cmp18 = icmp eq float* %8, null
  br i1 %cmp18, label %if.then27, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %lor.lhs.false
  %9 = load i32*, i32** %width, align 8, !tbaa !12
  %cmp22 = icmp eq i32* %9, null
  %cmp25 = icmp eq i8* %call13, null
  %or.cond = or i1 %cmp25, %cmp22
  br i1 %or.cond, label %if.then27, label %if.end29

if.then27:                                        ; preds = %lor.lhs.false20, %lor.lhs.false, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str, i64 0, i64 0), i64 57, i64 1, %struct._IO_FILE* %10) #6
  tail call void @exit(i32 0) #7
  unreachable

if.end29:                                         ; preds = %lor.lhs.false20
  %sampling_rate = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL_FB, i64 0, i32 0
  %12 = load float, float* %sampling_rate, align 8, !tbaa !15
  %13 = load i32, i32* %fft_size, align 4, !tbaa !9
  %conv31 = sitofp i32 %13 to float
  %div = fdiv float %12, %conv31
  %upper_filt_freq = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL_FB, i64 0, i32 5
  %14 = load float, float* %upper_filt_freq, align 4, !tbaa !16
  %call32 = tail call float @fe_mel(float %14)
  %lower_filt_freq = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL_FB, i64 0, i32 4
  %15 = load float, float* %lower_filt_freq, align 8, !tbaa !17
  %call33 = tail call float @fe_mel(float %15)
  %sub = fsub float %call32, %call33
  %16 = load i32, i32* %num_filters, align 8, !tbaa !2
  %add35 = add nsw i32 %16, 1
  %conv36 = sitofp i32 %add35 to float
  %div37 = fdiv float %sub, %conv36
  %17 = load i32, i32* %doublewide, align 8, !tbaa !13
  %cmp39 = icmp eq i32 %17, 1
  br i1 %cmp39, label %for.cond.preheader, label %for.cond50.preheader

for.cond50.preheader:                             ; preds = %if.end29
  %cmp53326 = icmp slt i32 %16, -1
  br i1 %cmp53326, label %if.end65thread-pre-split, label %for.body55

for.cond.preheader:                               ; preds = %if.end29
  %cmp44323 = icmp slt i32 %16, -3
  br i1 %cmp44323, label %if.end65thread-pre-split, label %for.body

for.body:                                         ; preds = %for.cond.preheader, %for.body
  %indvars.iv335 = phi i64 [ %indvars.iv.next336, %for.body ], [ 0, %for.cond.preheader ]
  %18 = trunc i64 %indvars.iv335 to i32
  %conv46 = sitofp i32 %18 to float
  %mul = fmul float %div37, %conv46
  %add47 = fadd float %call33, %mul
  %call48 = tail call float @fe_melinv(float %add47)
  %arrayidx = getelementptr inbounds float, float* %filt_edge.0, i64 %indvars.iv335
  store float %call48, float* %arrayidx, align 4, !tbaa !18
  %indvars.iv.next336 = add nuw nsw i64 %indvars.iv335, 1
  %19 = load i32, i32* %num_filters, align 8, !tbaa !2
  %add43 = add nsw i32 %19, 3
  %20 = sext i32 %add43 to i64
  %cmp44 = icmp slt i64 %indvars.iv335, %20
  br i1 %cmp44, label %for.body, label %if.end65

for.body55:                                       ; preds = %for.cond50.preheader, %for.body55
  %indvars.iv337 = phi i64 [ %indvars.iv.next338, %for.body55 ], [ 0, %for.cond50.preheader ]
  %21 = trunc i64 %indvars.iv337 to i32
  %conv56 = sitofp i32 %21 to float
  %mul57 = fmul float %div37, %conv56
  %add58 = fadd float %call33, %mul57
  %call59 = tail call float @fe_melinv(float %add58)
  %arrayidx61 = getelementptr inbounds float, float* %filt_edge.0, i64 %indvars.iv337
  store float %call59, float* %arrayidx61, align 4, !tbaa !18
  %indvars.iv.next338 = add nuw nsw i64 %indvars.iv337, 1
  %22 = load i32, i32* %num_filters, align 8, !tbaa !2
  %23 = sext i32 %22 to i64
  %cmp53 = icmp sgt i64 %indvars.iv337, %23
  br i1 %cmp53, label %if.end65, label %for.body55

if.end65thread-pre-split:                         ; preds = %for.cond.preheader, %for.cond50.preheader
  %.pr = load i32, i32* %num_filters, align 8, !tbaa !2
  br label %if.end65

if.end65:                                         ; preds = %for.body55, %for.body, %if.end65thread-pre-split
  %24 = phi i32 [ %.pr, %if.end65thread-pre-split ], [ %19, %for.body ], [ %22, %for.body55 ]
  %cmp68318 = icmp sgt i32 %24, 0
  br i1 %cmp68318, label %for.body70.lr.ph, label %for.end193

for.body70.lr.ph:                                 ; preds = %if.end65
  %25 = load float*, float** %left_apex, align 8, !tbaa !11
  %26 = load i32*, i32** %width, align 8, !tbaa !12
  br label %for.body70

for.body70:                                       ; preds = %for.body70.lr.ph, %while.end187
  %indvars.iv331 = phi i64 [ 0, %for.body70.lr.ph ], [ %indvars.iv.next332, %while.end187 ]
  %rightslope.0321 = phi float [ undef, %for.body70.lr.ph ], [ %rightslope.1, %while.end187 ]
  %leftslope.0320 = phi float [ undef, %for.body70.lr.ph ], [ %leftslope.1, %while.end187 ]
  %whichfilt.0319 = phi i32 [ 0, %for.body70.lr.ph ], [ %add110, %while.end187 ]
  %27 = load i32, i32* %doublewide, align 8, !tbaa !13
  %cmp72 = icmp eq i32 %27, 1
  %arrayidx76 = getelementptr inbounds float, float* %filt_edge.0, i64 %indvars.iv331
  %28 = load float, float* %arrayidx76, align 4, !tbaa !18
  %div77 = fdiv float %28, %div
  %conv78 = fpext float %div77 to double
  %add79 = fadd double %conv78, 5.000000e-01
  %conv80 = fptosi double %add79 to i32
  %conv81 = sitofp i32 %conv80 to float
  %mul82 = fmul float %div, %conv81
  %add83 = add nuw nsw i32 %whichfilt.0319, 2
  %indvars.iv.next332 = add nuw nsw i64 %indvars.iv331, 1
  %add110 = add nuw nsw i32 %whichfilt.0319, 1
  %29 = trunc i64 %indvars.iv331 to i32
  %30 = add i32 %29, 4
  %.pn308.in = select i1 %cmp72, i32 %30, i32 %add83
  %31 = trunc i64 %indvars.iv.next332 to i32
  %.pn306.in = select i1 %cmp72, i32 %add83, i32 %31
  %.pn308 = zext i32 %.pn308.in to i64
  %.pn307.in = getelementptr inbounds float, float* %filt_edge.0, i64 %.pn308
  %.pn307 = load float, float* %.pn307.in, align 4, !tbaa !18
  %conv99.pn.in.in.in.in = fdiv float %.pn307, %div
  %conv99.pn.in.in.in = fpext float %conv99.pn.in.in.in.in to double
  %conv99.pn.in.in = fadd double %conv99.pn.in.in.in, 5.000000e-01
  %conv99.pn.in = fptosi double %conv99.pn.in.in to i32
  %conv99.pn = sitofp i32 %conv99.pn.in to float
  %rightfr.0 = fmul float %div, %conv99.pn
  %.pn306 = zext i32 %.pn306.in to i64
  %.pn.in = getelementptr inbounds float, float* %filt_edge.0, i64 %.pn306
  %.pn = load float, float* %.pn.in, align 4, !tbaa !18
  %conv90.pn.in.in.in.in = fdiv float %.pn, %div
  %conv90.pn.in.in.in = fpext float %conv90.pn.in.in.in.in to double
  %conv90.pn.in.in = fadd double %conv90.pn.in.in.in, 5.000000e-01
  %conv90.pn.in = fptosi double %conv90.pn.in.in to i32
  %conv90.pn = sitofp i32 %conv90.pn.in to float
  %centerfr.0 = fmul float %div, %conv90.pn
  %arrayidx131 = getelementptr inbounds float, float* %25, i64 %indvars.iv331
  store float %mul82, float* %arrayidx131, align 4, !tbaa !18
  %sub132 = fsub float %rightfr.0, %mul82
  %div133 = fdiv float 2.000000e+00, %sub132
  %cmp134 = fcmp une float %centerfr.0, %mul82
  br i1 %cmp134, label %if.then136, label %if.end139

if.then136:                                       ; preds = %for.body70
  %sub137 = fsub float %centerfr.0, %mul82
  %div138 = fdiv float %div133, %sub137
  br label %if.end139

if.end139:                                        ; preds = %if.then136, %for.body70
  %leftslope.1 = phi float [ %div138, %if.then136 ], [ %leftslope.0320, %for.body70 ]
  %cmp140 = fcmp une float %centerfr.0, %rightfr.0
  br i1 %cmp140, label %if.then142, label %if.end145

if.then142:                                       ; preds = %if.end139
  %sub143 = fsub float %centerfr.0, %rightfr.0
  %div144 = fdiv float %div133, %sub143
  br label %if.end145

if.end145:                                        ; preds = %if.then142, %if.end139
  %rightslope.1 = phi float [ %div144, %if.then142 ], [ %rightslope.0321, %if.end139 ]
  %div146 = fdiv float %mul82, %div
  %conv147 = fpext float %div146 to double
  %add148 = fadd double %conv147, 5.000000e-01
  %conv149 = fptosi double %add148 to i32
  %conv150 = sitofp i32 %conv149 to float
  %mul151 = fmul float %div, %conv150
  %cmp152310 = fcmp olt float %mul151, %centerfr.0
  br i1 %cmp152310, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %if.end145
  %32 = load float**, float*** %filter_coeffs, align 8, !tbaa !10
  %arrayidx158 = getelementptr inbounds float*, float** %32, i64 %indvars.iv331
  %33 = load float*, float** %arrayidx158, align 8, !tbaa !14
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvars.iv = phi i64 [ 0, %while.body.lr.ph ], [ %indvars.iv.next, %while.body ]
  %freq.0311 = phi float [ %mul151, %while.body.lr.ph ], [ %add161, %while.body ]
  %sub154 = fsub float %freq.0311, %mul82
  %mul155 = fmul float %leftslope.1, %sub154
  %arrayidx160 = getelementptr inbounds float, float* %33, i64 %indvars.iv
  store float %mul155, float* %arrayidx160, align 4, !tbaa !18
  %add161 = fadd float %div, %freq.0311
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp152 = fcmp olt float %add161, %centerfr.0
  br i1 %cmp152, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %while.body
  %34 = trunc i64 %indvars.iv.next to i32
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %if.end145
  %freq.0.lcssa = phi float [ %mul151, %if.end145 ], [ %add161, %while.end.loopexit ]
  %i.2.lcssa = phi i32 [ 0, %if.end145 ], [ %34, %while.end.loopexit ]
  %cmp163 = fcmp oeq float %freq.0.lcssa, %centerfr.0
  br i1 %cmp163, label %if.then165, label %if.end173

if.then165:                                       ; preds = %while.end
  %35 = load float**, float*** %filter_coeffs, align 8, !tbaa !10
  %arrayidx168 = getelementptr inbounds float*, float** %35, i64 %indvars.iv331
  %36 = load float*, float** %arrayidx168, align 8, !tbaa !14
  %37 = zext i32 %i.2.lcssa to i64
  %arrayidx170 = getelementptr inbounds float, float* %36, i64 %37
  store float %div133, float* %arrayidx170, align 4, !tbaa !18
  %add171 = fadd float %div, %freq.0.lcssa
  %inc172 = add nuw nsw i32 %i.2.lcssa, 1
  br label %if.end173

if.end173:                                        ; preds = %if.then165, %while.end
  %freq.1 = phi float [ %add171, %if.then165 ], [ %freq.0.lcssa, %while.end ]
  %i.3 = phi i32 [ %inc172, %if.then165 ], [ %i.2.lcssa, %while.end ]
  %cmp175314 = fcmp olt float %freq.1, %rightfr.0
  br i1 %cmp175314, label %while.body177.lr.ph, label %while.end187

while.body177.lr.ph:                              ; preds = %if.end173
  %38 = load float**, float*** %filter_coeffs, align 8, !tbaa !10
  %arrayidx182 = getelementptr inbounds float*, float** %38, i64 %indvars.iv331
  %39 = load float*, float** %arrayidx182, align 8, !tbaa !14
  %40 = sext i32 %i.3 to i64
  br label %while.body177

while.body177:                                    ; preds = %while.body177.lr.ph, %while.body177
  %indvars.iv329 = phi i64 [ %40, %while.body177.lr.ph ], [ %indvars.iv.next330, %while.body177 ]
  %freq.2315 = phi float [ %freq.1, %while.body177.lr.ph ], [ %add185, %while.body177 ]
  %sub178 = fsub float %freq.2315, %rightfr.0
  %mul179 = fmul float %rightslope.1, %sub178
  %arrayidx184 = getelementptr inbounds float, float* %39, i64 %indvars.iv329
  store float %mul179, float* %arrayidx184, align 4, !tbaa !18
  %add185 = fadd float %div, %freq.2315
  %indvars.iv.next330 = add i64 %indvars.iv329, 1
  %cmp175 = fcmp olt float %add185, %rightfr.0
  br i1 %cmp175, label %while.body177, label %while.end187.loopexit

while.end187.loopexit:                            ; preds = %while.body177
  %41 = trunc i64 %indvars.iv.next330 to i32
  br label %while.end187

while.end187:                                     ; preds = %while.end187.loopexit, %if.end173
  %i.4.lcssa = phi i32 [ %i.3, %if.end173 ], [ %41, %while.end187.loopexit ]
  %arrayidx190 = getelementptr inbounds i32, i32* %26, i64 %indvars.iv331
  store i32 %i.4.lcssa, i32* %arrayidx190, align 4, !tbaa !19
  %42 = load i32, i32* %num_filters, align 8, !tbaa !2
  %43 = sext i32 %42 to i64
  %cmp68 = icmp slt i64 %indvars.iv.next332, %43
  br i1 %cmp68, label %for.body70, label %for.end193

for.end193:                                       ; preds = %while.end187, %if.end65
  tail call void @free(i8* %call13) #4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define dso_local noalias i8** @fe_create_2d(i32 %d1, i32 %d2, i32 %elem_size) local_unnamed_addr #0 {
entry:
  %mul = mul nsw i32 %d2, %d1
  %conv = sext i32 %mul to i64
  %conv1 = sext i32 %elem_size to i64
  %call = tail call noalias i8* @calloc(i64 %conv, i64 %conv1) #4
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.7, i64 0, i64 0), i64 20, i64 1, %struct._IO_FILE* %0) #6
  br label %cleanup

if.end:                                           ; preds = %entry
  %conv4 = sext i32 %d1 to i64
  %call5 = tail call noalias i8* @calloc(i64 %conv4, i64 8) #4
  %2 = bitcast i8* %call5 to i8**
  %cmp6 = icmp eq i8* %call5, null
  br i1 %cmp6, label %if.then8, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end
  %cmp1134 = icmp sgt i32 %d1, 0
  br i1 %cmp1134, label %for.body.preheader, label %cleanup

for.body.preheader:                               ; preds = %for.cond.preheader
  %3 = sext i32 %d2 to i64
  %4 = sext i32 %elem_size to i64
  %wide.trip.count = zext i32 %d1 to i64
  br label %for.body

if.then8:                                         ; preds = %if.end
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.7, i64 0, i64 0), i64 20, i64 1, %struct._IO_FILE* %5) #6
  tail call void @free(i8* nonnull %call) #4
  br label %cleanup

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv38 = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next39, %for.body ]
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %7 = mul nsw i64 %indvars.iv, %4
  %arrayidx = getelementptr inbounds i8, i8* %call, i64 %7
  %arrayidx15 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv38
  store i8* %arrayidx, i8** %arrayidx15, align 8, !tbaa !14
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %indvars.iv.next = add nsw i64 %indvars.iv, %3
  %exitcond = icmp eq i64 %indvars.iv.next39, %wide.trip.count
  br i1 %exitcond, label %cleanup, label %for.body

cleanup:                                          ; preds = %for.body, %for.cond.preheader, %if.then8, %if.then
  %retval.0 = phi i8** [ null, %if.then ], [ null, %if.then8 ], [ %2, %for.cond.preheader ], [ %2, %for.body ]
  ret i8** %retval.0
}

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) local_unnamed_addr #1

; Function Attrs: nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local float @fe_mel(float %x) local_unnamed_addr #0 {
entry:
  %conv = fpext float %x to double
  %div = fdiv double %conv, 7.000000e+02
  %add = fadd double %div, 1.000000e+00
  %call = tail call double @log10(double %add) #4
  %conv1 = fptrunc double %call to float
  %conv3 = fmul float %conv1, 2.595000e+03
  ret float %conv3
}

; Function Attrs: nounwind uwtable
define dso_local float @fe_melinv(float %x) local_unnamed_addr #0 {
entry:
  %conv = fpext float %x to double
  %div = fdiv double %conv, 2.595000e+03
  %call = tail call double @pow(double 1.000000e+01, double %div) #4
  %conv1 = fptrunc double %call to float
  %conv2 = fpext float %conv1 to double
  %sub = fadd double %conv2, -1.000000e+00
  %mul = fmul double %sub, 7.000000e+02
  %conv3 = fptrunc double %mul to float
  ret float %conv3
}

; Function Attrs: nounwind
declare dso_local void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local i32 @fe_compute_melcosine(%struct.melfb_t* nocapture %MEL_FB) local_unnamed_addr #0 {
entry:
  %num_filters = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL_FB, i64 0, i32 2
  %0 = load i32, i32* %num_filters, align 8, !tbaa !2
  %conv = sitofp i32 %0 to double
  %mul = fmul double %conv, 2.000000e+00
  %num_cepstra = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL_FB, i64 0, i32 1
  %1 = load i32, i32* %num_cepstra, align 4, !tbaa !20
  %call = tail call i8** @fe_create_2d(i32 %1, i32 %0, i32 4)
  %mel_cosine = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL_FB, i64 0, i32 7
  %2 = bitcast float*** %mel_cosine to i8***
  store i8** %call, i8*** %2, align 8, !tbaa !21
  %cmp = icmp eq i8** %call, null
  br i1 %cmp, label %if.then, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %3 = load i32, i32* %num_cepstra, align 4, !tbaa !20
  %cmp542 = icmp sgt i32 %3, 0
  br i1 %cmp542, label %for.body, label %for.end23

if.then:                                          ; preds = %entry
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.1, i64 0, i64 0), i64 57, i64 1, %struct._IO_FILE* %4) #6
  tail call void @exit(i32 0) #7
  unreachable

for.body:                                         ; preds = %for.cond.preheader, %for.inc21
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %for.inc21 ], [ 0, %for.cond.preheader ]
  %6 = trunc i64 %indvars.iv44 to i32
  %conv7 = sitofp i32 %6 to double
  %mul8 = fmul double %conv7, 0x401921FB54442D18
  %div = fdiv double %mul8, %mul
  %7 = load i32, i32* %num_filters, align 8, !tbaa !2
  %cmp1140 = icmp sgt i32 %7, 0
  br i1 %cmp1140, label %for.body13, label %for.inc21

for.body13:                                       ; preds = %for.body, %for.body13
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body13 ], [ 0, %for.body ]
  %8 = trunc i64 %indvars.iv to i32
  %conv14 = sitofp i32 %8 to double
  %add = fadd double %conv14, 5.000000e-01
  %mul15 = fmul double %div, %add
  %call16 = tail call double @cos(double %mul15) #4
  %conv17 = fptrunc double %call16 to float
  %9 = load float**, float*** %mel_cosine, align 8, !tbaa !21
  %arrayidx = getelementptr inbounds float*, float** %9, i64 %indvars.iv44
  %10 = load float*, float** %arrayidx, align 8, !tbaa !14
  %arrayidx20 = getelementptr inbounds float, float* %10, i64 %indvars.iv
  store float %conv17, float* %arrayidx20, align 4, !tbaa !18
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = load i32, i32* %num_filters, align 8, !tbaa !2
  %12 = sext i32 %11 to i64
  %cmp11 = icmp slt i64 %indvars.iv.next, %12
  br i1 %cmp11, label %for.body13, label %for.inc21

for.inc21:                                        ; preds = %for.body13, %for.body
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %13 = load i32, i32* %num_cepstra, align 4, !tbaa !20
  %14 = sext i32 %13 to i64
  %cmp5 = icmp slt i64 %indvars.iv.next45, %14
  br i1 %cmp5, label %for.body, label %for.end23

for.end23:                                        ; preds = %for.inc21, %for.cond.preheader
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local double @cos(double) local_unnamed_addr #1

; Function Attrs: nounwind
declare dso_local double @log10(double) local_unnamed_addr #1

; Function Attrs: nounwind
declare dso_local double @pow(double, double) local_unnamed_addr #1

; Function Attrs: norecurse nounwind uwtable
define dso_local void @fe_pre_emphasis(i16* nocapture readonly %in, double* nocapture %out, i32 %len, float %factor, i16 signext %prior) local_unnamed_addr #3 {
entry:
  %0 = load i16, i16* %in, align 2, !tbaa !22
  %conv = sitofp i16 %0 to double
  %conv1 = fpext float %factor to double
  %conv2 = sitofp i16 %prior to double
  %mul = fmul double %conv1, %conv2
  %sub = fsub double %conv, %mul
  store double %sub, double* %out, align 8, !tbaa !24
  %cmp25 = icmp sgt i32 %len, 1
  br i1 %cmp25, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 1, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx5 = getelementptr inbounds i16, i16* %in, i64 %indvars.iv
  %1 = load i16, i16* %arrayidx5, align 2, !tbaa !22
  %conv6 = sitofp i16 %1 to double
  %2 = add nsw i64 %indvars.iv, -1
  %arrayidx10 = getelementptr inbounds i16, i16* %in, i64 %2
  %3 = load i16, i16* %arrayidx10, align 2, !tbaa !22
  %conv11 = sitofp i16 %3 to double
  %mul12 = fmul double %conv1, %conv11
  %sub13 = fsub double %conv6, %mul12
  %arrayidx15 = getelementptr inbounds double, double* %out, i64 %indvars.iv
  store double %sub13, double* %arrayidx15, align 8, !tbaa !24
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define dso_local void @fe_short_to_double(i16* nocapture readonly %in, double* nocapture %out, i32 %len) local_unnamed_addr #3 {
entry:
  %cmp7 = icmp sgt i32 %len, 0
  br i1 %cmp7, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i16, i16* %in, i64 %indvars.iv
  %0 = load i16, i16* %arrayidx, align 2, !tbaa !22
  %conv = sitofp i16 %0 to double
  %arrayidx2 = getelementptr inbounds double, double* %out, i64 %indvars.iv
  store double %conv, double* %arrayidx2, align 8, !tbaa !24
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @fe_create_hamming(double* nocapture %in, i32 %in_len) local_unnamed_addr #0 {
entry:
  %cmp = icmp sgt i32 %in_len, 1
  br i1 %cmp, label %for.body.lr.ph, label %if.end

for.body.lr.ph:                                   ; preds = %entry
  %conv2 = sitofp i32 %in_len to double
  %sub = fadd double %conv2, -1.000000e+00
  %wide.trip.count = zext i32 %in_len to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %0 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %0 to double
  %mul = fmul double %conv, 0x401921FB54442D18
  %div = fdiv double %mul, %sub
  %call = tail call double @cos(double %div) #4
  %mul3 = fmul double %call, 4.600000e-01
  %sub4 = fsub double 5.400000e-01, %mul3
  %arrayidx = getelementptr inbounds double, double* %in, i64 %indvars.iv
  store double %sub4, double* %arrayidx, align 8, !tbaa !24
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %if.end, label %for.body

if.end:                                           ; preds = %for.body, %entry
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define dso_local void @fe_hamming_window(double* nocapture %in, double* nocapture readonly %window, i32 %in_len) local_unnamed_addr #3 {
entry:
  %cmp = icmp sgt i32 %in_len, 1
  br i1 %cmp, label %for.body.preheader, label %if.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %in_len to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %window, i64 %indvars.iv
  %0 = load double, double* %arrayidx, align 8, !tbaa !24
  %arrayidx3 = getelementptr inbounds double, double* %in, i64 %indvars.iv
  %1 = load double, double* %arrayidx3, align 8, !tbaa !24
  %mul = fmul double %0, %1
  store double %mul, double* %arrayidx3, align 8, !tbaa !24
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %if.end, label %for.body

if.end:                                           ; preds = %for.body, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @fe_frame_to_fea(%struct.fe_t* nocapture readonly %FE, double* nocapture readonly %in, double* nocapture %fea) local_unnamed_addr #0 {
entry:
  %FB_TYPE = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 6
  %0 = load i32, i32* %FB_TYPE, align 8, !tbaa !26
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %FFT_SIZE = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 5
  %1 = load i32, i32* %FFT_SIZE, align 4, !tbaa !28
  %conv = sext i32 %1 to i64
  %call = tail call noalias i8* @calloc(i64 %conv, i64 8) #4
  %2 = bitcast i8* %call to double*
  %MEL_FB = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 11
  %3 = load %struct.melfb_t*, %struct.melfb_t** %MEL_FB, align 8, !tbaa !29
  %num_filters = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %3, i64 0, i32 2
  %4 = load i32, i32* %num_filters, align 8, !tbaa !2
  %conv1 = sext i32 %4 to i64
  %call2 = tail call noalias i8* @calloc(i64 %conv1, i64 8) #4
  %5 = bitcast i8* %call2 to double*
  %cmp3 = icmp eq i8* %call, null
  %cmp5 = icmp eq i8* %call2, null
  %or.cond = or i1 %cmp3, %cmp5
  br i1 %or.cond, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.2, i64 0, i64 0), i64 52, i64 1, %struct._IO_FILE* %6) #6
  tail call void @exit(i32 0) #7
  unreachable

if.end:                                           ; preds = %if.then
  %FRAME_SIZE = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 4
  %8 = load i32, i32* %FRAME_SIZE, align 8, !tbaa !30
  tail call void @fe_spec_magnitude(double* %in, i32 %8, double* %2, i32 %1)
  tail call void @fe_mel_spec(%struct.fe_t* nonnull %FE, double* %2, double* %5)
  tail call void @fe_mel_cep(%struct.fe_t* nonnull %FE, double* %5, double* %fea)
  tail call void @free(i8* nonnull %call) #4
  tail call void @free(i8* nonnull %call2) #4
  ret void

if.else:                                          ; preds = %entry
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.3, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %9) #6
  tail call void @exit(i32 0) #7
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local void @fe_spec_magnitude(double* nocapture readonly %data, i32 %data_len, double* nocapture %spec, i32 %fftsize) local_unnamed_addr #0 {
entry:
  %conv = sext i32 %fftsize to i64
  %call = tail call noalias i8* @calloc(i64 %conv, i64 16) #4
  %0 = bitcast i8* %call to %struct.complex*
  %call2 = tail call noalias i8* @calloc(i64 %conv, i64 16) #4
  %1 = bitcast i8* %call2 to %struct.complex*
  %cmp = icmp eq i8* %call, null
  %cmp4 = icmp eq i8* %call2, null
  %or.cond = or i1 %cmp, %cmp4
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.4, i64 0, i64 0), i64 54, i64 1, %struct._IO_FILE* %2) #6
  tail call void @exit(i32 0) #7
  unreachable

if.end:                                           ; preds = %entry
  %cmp7 = icmp sgt i32 %data_len, %fftsize
  br i1 %cmp7, label %for.cond.preheader, label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %if.end
  %cmp34150 = icmp sgt i32 %data_len, 0
  br i1 %cmp34150, label %for.body36.preheader, label %for.cond48.preheader

for.body36.preheader:                             ; preds = %for.cond33.preheader
  %wide.trip.count170 = zext i32 %data_len to i64
  br label %for.body36

for.cond.preheader:                               ; preds = %if.end
  %cmp10146 = icmp sgt i32 %fftsize, 0
  br i1 %cmp10146, label %for.body.preheader, label %for.cond16.preheader

for.body.preheader:                               ; preds = %for.cond.preheader
  %wide.trip.count162 = zext i32 %fftsize to i64
  br label %for.body

for.cond16.preheader:                             ; preds = %for.body, %for.cond.preheader
  %j.0.lcssa = phi i32 [ 0, %for.cond.preheader ], [ %fftsize, %for.body ]
  %cmp17143 = icmp slt i32 %j.0.lcssa, %data_len
  br i1 %cmp17143, label %for.body19.preheader, label %if.end61

for.body19.preheader:                             ; preds = %for.cond16.preheader
  %4 = zext i32 %j.0.lcssa to i64
  %5 = sub i32 %data_len, %j.0.lcssa
  %wide.trip.count158 = zext i32 %5 to i64
  br label %for.body19

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv160 = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next161, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %data, i64 %indvars.iv160
  %6 = bitcast double* %arrayidx to i64*
  %7 = load i64, i64* %6, align 8, !tbaa !24
  %arrayidx13 = getelementptr inbounds %struct.complex, %struct.complex* %1, i64 %indvars.iv160
  %8 = bitcast %struct.complex* %arrayidx13 to i64*
  store i64 %7, i64* %8, align 8, !tbaa !31
  %indvars.iv.next161 = add nuw nsw i64 %indvars.iv160, 1
  %exitcond163 = icmp eq i64 %indvars.iv.next161, %wide.trip.count162
  br i1 %exitcond163, label %for.cond16.preheader, label %for.body

for.body19:                                       ; preds = %for.body19, %for.body19.preheader
  %indvars.iv156 = phi i64 [ 0, %for.body19.preheader ], [ %indvars.iv.next157, %for.body19 ]
  %indvars.iv154 = phi i64 [ %4, %for.body19.preheader ], [ %indvars.iv.next155, %for.body19 ]
  %arrayidx21 = getelementptr inbounds double, double* %data, i64 %indvars.iv154
  %9 = load double, double* %arrayidx21, align 8, !tbaa !24
  %r24 = getelementptr inbounds %struct.complex, %struct.complex* %1, i64 %indvars.iv156, i32 0
  %10 = load double, double* %r24, align 8, !tbaa !31
  %add = fadd double %9, %10
  store double %add, double* %r24, align 8, !tbaa !31
  %i27 = getelementptr inbounds %struct.complex, %struct.complex* %1, i64 %indvars.iv156, i32 1
  %11 = load double, double* %i27, align 8, !tbaa !33
  %add28 = fadd double %11, 0.000000e+00
  store double %add28, double* %i27, align 8, !tbaa !33
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1
  %exitcond159 = icmp eq i64 %indvars.iv.next157, %wide.trip.count158
  br i1 %exitcond159, label %if.end61, label %for.body19

for.cond48.preheader:                             ; preds = %for.body36, %for.cond33.preheader
  %j.2.lcssa = phi i32 [ 0, %for.cond33.preheader ], [ %data_len, %for.body36 ]
  %cmp49148 = icmp slt i32 %j.2.lcssa, %fftsize
  br i1 %cmp49148, label %if.end61.loopexit153, label %if.end61

for.body36:                                       ; preds = %for.body36, %for.body36.preheader
  %indvars.iv168 = phi i64 [ 0, %for.body36.preheader ], [ %indvars.iv.next169, %for.body36 ]
  %arrayidx38 = getelementptr inbounds double, double* %data, i64 %indvars.iv168
  %12 = bitcast double* %arrayidx38 to i64*
  %13 = load i64, i64* %12, align 8, !tbaa !24
  %arrayidx40 = getelementptr inbounds %struct.complex, %struct.complex* %1, i64 %indvars.iv168
  %14 = bitcast %struct.complex* %arrayidx40 to i64*
  store i64 %13, i64* %14, align 8, !tbaa !31
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %exitcond171 = icmp eq i64 %indvars.iv.next169, %wide.trip.count170
  br i1 %exitcond171, label %for.cond48.preheader, label %for.body36

if.end61.loopexit153:                             ; preds = %for.cond48.preheader
  %15 = zext i32 %j.2.lcssa to i64
  %16 = shl nuw nsw i64 %15, 4
  %scevgep = getelementptr i8, i8* %call2, i64 %16
  %17 = add i32 %fftsize, -1
  %18 = sub i32 %17, %j.2.lcssa
  %19 = zext i32 %18 to i64
  %20 = shl nuw nsw i64 %19, 4
  %21 = add nuw nsw i64 %20, 16
  call void @llvm.memset.p0i8.i64(i8* align 8 %scevgep, i8 0, i64 %21, i1 false)
  br label %if.end61

if.end61:                                         ; preds = %for.body19, %if.end61.loopexit153, %for.cond48.preheader, %for.cond16.preheader
  %call62 = tail call i32 @fe_fft(%struct.complex* %1, %struct.complex* %0, i32 %fftsize, i32 1)
  %cmp64141 = icmp slt i32 %fftsize, -1
  br i1 %cmp64141, label %for.end85, label %for.body66.preheader

for.body66.preheader:                             ; preds = %if.end61
  %div = sdiv i32 %fftsize, 2
  %22 = add nsw i32 %div, 1
  %wide.trip.count = zext i32 %22 to i64
  br label %for.body66

for.body66:                                       ; preds = %for.body66, %for.body66.preheader
  %indvars.iv = phi i64 [ 0, %for.body66.preheader ], [ %indvars.iv.next, %for.body66 ]
  %r69 = getelementptr inbounds %struct.complex, %struct.complex* %0, i64 %indvars.iv, i32 0
  %23 = load double, double* %r69, align 8, !tbaa !31
  %mul = fmul double %23, %23
  %i75 = getelementptr inbounds %struct.complex, %struct.complex* %0, i64 %indvars.iv, i32 1
  %24 = load double, double* %i75, align 8, !tbaa !33
  %mul79 = fmul double %24, %24
  %add80 = fadd double %mul, %mul79
  %arrayidx82 = getelementptr inbounds double, double* %spec, i64 %indvars.iv
  store double %add80, double* %arrayidx82, align 8, !tbaa !24
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end85, label %for.body66

for.end85:                                        ; preds = %for.body66, %if.end61
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call2) #4
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define dso_local void @fe_mel_spec(%struct.fe_t* nocapture readonly %FE, double* nocapture readonly %spec, double* nocapture %mfspec) local_unnamed_addr #3 {
entry:
  %SAMPLING_RATE = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 0
  %0 = load float, float* %SAMPLING_RATE, align 8, !tbaa !34
  %FFT_SIZE = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 5
  %1 = load i32, i32* %FFT_SIZE, align 4, !tbaa !28
  %conv = sitofp i32 %1 to float
  %div = fdiv float %0, %conv
  %MEL_FB = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 11
  %2 = load %struct.melfb_t*, %struct.melfb_t** %MEL_FB, align 8, !tbaa !29
  %num_filters52 = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %2, i64 0, i32 2
  %3 = load i32, i32* %num_filters52, align 8, !tbaa !2
  %cmp53 = icmp sgt i32 %3, 0
  br i1 %cmp53, label %for.body.lr.ph, label %for.end29

for.body.lr.ph:                                   ; preds = %entry
  %4 = load %struct.melfb_t*, %struct.melfb_t** %MEL_FB, align 8, !tbaa !29
  %num_filters = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %4, i64 0, i32 2
  %5 = load i32, i32* %num_filters, align 8, !tbaa !2
  %6 = sext i32 %5 to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc27
  %indvars.iv56 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next57, %for.inc27 ]
  %7 = phi %struct.melfb_t* [ %2, %for.body.lr.ph ], [ %4, %for.inc27 ]
  %left_apex = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %7, i64 0, i32 8
  %8 = load float*, float** %left_apex, align 8, !tbaa !11
  %arrayidx = getelementptr inbounds float, float* %8, i64 %indvars.iv56
  %9 = load float, float* %arrayidx, align 4, !tbaa !18
  %arrayidx7 = getelementptr inbounds double, double* %mfspec, i64 %indvars.iv56
  store double 0.000000e+00, double* %arrayidx7, align 8, !tbaa !24
  %width = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %7, i64 0, i32 9
  %10 = load i32*, i32** %width, align 8, !tbaa !12
  %arrayidx1149 = getelementptr inbounds i32, i32* %10, i64 %indvars.iv56
  %11 = load i32, i32* %arrayidx1149, align 4, !tbaa !19
  %cmp1250 = icmp sgt i32 %11, 0
  br i1 %cmp1250, label %for.body14.lr.ph, label %for.inc27

for.body14.lr.ph:                                 ; preds = %for.body
  %div3 = fdiv float %9, %div
  %conv4 = fpext float %div3 to double
  %add = fadd double %conv4, 5.000000e-01
  %conv5 = fptosi double %add to i32
  %filter_coeffs = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %7, i64 0, i32 6
  %12 = load float**, float*** %filter_coeffs, align 8, !tbaa !10
  %arrayidx17 = getelementptr inbounds float*, float** %12, i64 %indvars.iv56
  %13 = load float*, float** %arrayidx17, align 8, !tbaa !14
  %14 = load i32*, i32** %width, align 8, !tbaa !12
  %arrayidx11 = getelementptr inbounds i32, i32* %14, i64 %indvars.iv56
  %15 = load i32, i32* %arrayidx11, align 4, !tbaa !19
  %16 = sext i32 %conv5 to i64
  %17 = sext i32 %15 to i64
  br label %for.body14

for.body14:                                       ; preds = %for.body14.lr.ph, %for.body14
  %indvars.iv = phi i64 [ 0, %for.body14.lr.ph ], [ %indvars.iv.next, %for.body14 ]
  %arrayidx19 = getelementptr inbounds float, float* %13, i64 %indvars.iv
  %18 = load float, float* %arrayidx19, align 4, !tbaa !18
  %conv20 = fpext float %18 to double
  %19 = add nsw i64 %indvars.iv, %16
  %arrayidx23 = getelementptr inbounds double, double* %spec, i64 %19
  %20 = load double, double* %arrayidx23, align 8, !tbaa !24
  %mul = fmul double %20, %conv20
  %21 = load double, double* %arrayidx7, align 8, !tbaa !24
  %add26 = fadd double %21, %mul
  store double %add26, double* %arrayidx7, align 8, !tbaa !24
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp12 = icmp slt i64 %indvars.iv.next, %17
  br i1 %cmp12, label %for.body14, label %for.inc27

for.inc27:                                        ; preds = %for.body14, %for.body
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %cmp = icmp slt i64 %indvars.iv.next57, %6
  br i1 %cmp, label %for.body, label %for.end29

for.end29:                                        ; preds = %for.inc27, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @fe_mel_cep(%struct.fe_t* nocapture readonly %FE, double* nocapture %mfspec, double* nocapture %mfcep) local_unnamed_addr #0 {
entry:
  %MEL_FB = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 11
  %0 = load %struct.melfb_t*, %struct.melfb_t** %MEL_FB, align 8, !tbaa !29
  %num_filters = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %0, i64 0, i32 2
  %1 = load i32, i32* %num_filters, align 8, !tbaa !2
  %cmp78 = icmp sgt i32 %1, 0
  br i1 %cmp78, label %for.body, label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.inc, %entry
  %.lcssa72 = phi %struct.melfb_t* [ %0, %entry ], [ %6, %for.inc ]
  %.lcssa = phi i32 [ %1, %entry ], [ %7, %for.inc ]
  %NUM_CEPSTRA = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 7
  %2 = load i32, i32* %NUM_CEPSTRA, align 4, !tbaa !35
  %cmp1175 = icmp sgt i32 %2, 0
  br i1 %cmp1175, label %for.body12.lr.ph, label %for.end44

for.body12.lr.ph:                                 ; preds = %for.cond10.preheader
  %cmp1873 = icmp sgt i32 %.lcssa, 0
  %conv38 = sitofp i32 %1 to float
  %conv39 = fpext float %conv38 to double
  %3 = load i32, i32* %NUM_CEPSTRA, align 4, !tbaa !35
  %mel_cosine = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %.lcssa72, i64 0, i32 7
  %4 = sext i32 %3 to i64
  %wide.trip.count = zext i32 %.lcssa to i64
  br label %for.body12

for.body:                                         ; preds = %entry, %for.inc
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %for.inc ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds double, double* %mfspec, i64 %indvars.iv86
  %5 = load double, double* %arrayidx, align 8, !tbaa !24
  %cmp3 = fcmp ogt double %5, 0.000000e+00
  br i1 %cmp3, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %call = tail call double @log(double %5) #4
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %storemerge = phi double [ %call, %if.then ], [ -1.000000e+05, %for.body ]
  store double %storemerge, double* %arrayidx, align 8, !tbaa !24
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %6 = load %struct.melfb_t*, %struct.melfb_t** %MEL_FB, align 8, !tbaa !29
  %num_filters2 = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %6, i64 0, i32 2
  %7 = load i32, i32* %num_filters2, align 8, !tbaa !2
  %8 = sext i32 %7 to i64
  %cmp = icmp slt i64 %indvars.iv.next87, %8
  br i1 %cmp, label %for.body, label %for.cond10.preheader

for.body12:                                       ; preds = %for.body12.lr.ph, %for.end37
  %indvars.iv83 = phi i64 [ 0, %for.body12.lr.ph ], [ %indvars.iv.next84, %for.end37 ]
  %arrayidx14 = getelementptr inbounds double, double* %mfcep, i64 %indvars.iv83
  store double 0.000000e+00, double* %arrayidx14, align 8, !tbaa !24
  br i1 %cmp1873, label %for.body19.lr.ph, label %for.end37

for.body19.lr.ph:                                 ; preds = %for.body12
  %9 = load float**, float*** %mel_cosine, align 8, !tbaa !21
  %arrayidx28 = getelementptr inbounds float*, float** %9, i64 %indvars.iv83
  %10 = load float*, float** %arrayidx28, align 8, !tbaa !14
  br label %for.body19

for.body19:                                       ; preds = %for.body19, %for.body19.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body19.lr.ph ], [ %indvars.iv.next, %for.body19 ]
  %cmp20 = icmp eq i64 %indvars.iv, 0
  %. = select i1 %cmp20, double 5.000000e-01, double 1.000000e+00
  %arrayidx25 = getelementptr inbounds double, double* %mfspec, i64 %indvars.iv
  %11 = load double, double* %arrayidx25, align 8, !tbaa !24
  %mul = fmul double %., %11
  %arrayidx30 = getelementptr inbounds float, float* %10, i64 %indvars.iv
  %12 = load float, float* %arrayidx30, align 4, !tbaa !18
  %conv31 = fpext float %12 to double
  %mul32 = fmul double %mul, %conv31
  %13 = load double, double* %arrayidx14, align 8, !tbaa !24
  %add = fadd double %13, %mul32
  store double %add, double* %arrayidx14, align 8, !tbaa !24
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end37, label %for.body19

for.end37:                                        ; preds = %for.body19, %for.body12
  %14 = load double, double* %arrayidx14, align 8, !tbaa !24
  %div = fdiv double %14, %conv39
  store double %div, double* %arrayidx14, align 8, !tbaa !24
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %cmp11 = icmp slt i64 %indvars.iv.next84, %4
  br i1 %cmp11, label %for.body12, label %for.end44

for.end44:                                        ; preds = %for.end37, %for.cond10.preheader
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @fe_fft(%struct.complex* nocapture readonly %in, %struct.complex* %out, i32 %N, i32 %invert) local_unnamed_addr #0 {
entry:
  store i32 %N, i32* @fe_fft.k, align 4, !tbaa !19
  %cmp192 = icmp sgt i32 %N, 1
  br i1 %cmp192, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.inc
  %storemerge193 = phi i32 [ %inc, %for.inc ], [ 0, %entry ]
  %0 = phi i32 [ %div174, %for.inc ], [ %N, %entry ]
  %rem173 = and i32 %0, 1
  %cmp1 = icmp eq i32 %rem173, 0
  br i1 %cmp1, label %for.inc, label %if.then

if.then:                                          ; preds = %for.body
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.5, i64 0, i64 0), i32 %N) #6
  br label %cleanup

for.inc:                                          ; preds = %for.body
  %div174 = lshr i32 %0, 1
  store i32 %div174, i32* @fe_fft.k, align 4, !tbaa !19
  %inc = add nuw nsw i32 %storemerge193, 1
  %cmp = icmp ugt i32 %0, 3
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  %phitmp = and i32 %inc, 1
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %storemerge.lcssa = phi i32 [ 0, %entry ], [ %phitmp, %for.end.loopexit ]
  switch i32 %invert, label %if.else7 [
    i32 1, label %if.end10
    i32 -1, label %if.then6
  ]

if.then6:                                         ; preds = %for.end
  %conv = sitofp i32 %N to double
  br label %if.end10

if.else7:                                         ; preds = %for.end
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %call8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.6, i64 0, i64 0), i32 %invert) #6
  br label %cleanup

if.end10:                                         ; preds = %for.end, %if.then6
  %storemerge167 = phi double [ %conv, %if.then6 ], [ 1.000000e+00, %for.end ]
  %conv11 = sext i32 %N to i64
  %call12 = tail call noalias i8* @calloc(i64 %conv11, i64 16) #4
  store i8* %call12, i8** bitcast (%struct.complex** @fe_fft.buffer to i8**), align 8, !tbaa !14
  %cmp14 = icmp eq i32 %storemerge.lcssa, 0
  %fe_fft.to.sink = select i1 %cmp14, %struct.complex** @fe_fft.from, %struct.complex** @fe_fft.to
  %.sink215 = select i1 %cmp14, i64* bitcast (%struct.complex** @fe_fft.to to i64*), i64* bitcast (%struct.complex** @fe_fft.from to i64*)
  store %struct.complex* %out, %struct.complex** %fe_fft.to.sink, align 8, !tbaa !14
  %.cast216 = ptrtoint i8* %call12 to i64
  store i64 %.cast216, i64* %.sink215, align 8, !tbaa !14
  %cmp20190 = icmp sgt i32 %N, 0
  br i1 %cmp20190, label %for.body22.lr.ph, label %for.end35

for.body22.lr.ph:                                 ; preds = %if.end10
  %3 = load %struct.complex*, %struct.complex** @fe_fft.from, align 8, !tbaa !14
  %wide.trip.count199 = zext i32 %N to i64
  br label %for.body22

for.body22:                                       ; preds = %for.body22, %for.body22.lr.ph
  %indvars.iv197 = phi i64 [ 0, %for.body22.lr.ph ], [ %indvars.iv.next198, %for.body22 ]
  %r = getelementptr inbounds %struct.complex, %struct.complex* %in, i64 %indvars.iv197, i32 0
  %4 = load double, double* %r, align 8, !tbaa !31
  %div23 = fdiv double %4, %storemerge167
  %r26 = getelementptr inbounds %struct.complex, %struct.complex* %3, i64 %indvars.iv197, i32 0
  store double %div23, double* %r26, align 8, !tbaa !31
  %i = getelementptr inbounds %struct.complex, %struct.complex* %in, i64 %indvars.iv197, i32 1
  %5 = load double, double* %i, align 8, !tbaa !33
  %div29 = fdiv double %5, %storemerge167
  %i32 = getelementptr inbounds %struct.complex, %struct.complex* %3, i64 %indvars.iv197, i32 1
  store double %div29, double* %i32, align 8, !tbaa !33
  %indvars.iv.next198 = add nuw nsw i64 %indvars.iv197, 1
  %exitcond200 = icmp eq i64 %indvars.iv.next198, %wide.trip.count199
  br i1 %exitcond200, label %for.end35, label %for.body22

for.end35:                                        ; preds = %for.body22, %if.end10
  %div36 = sdiv i32 %N, 2
  %conv37 = sext i32 %div36 to i64
  %call38 = tail call noalias i8* @calloc(i64 %conv37, i64 16) #4
  store i8* %call38, i8** bitcast (%struct.complex** @fe_fft.w to i8**), align 8, !tbaa !14
  store i32 0, i32* @fe_fft.k, align 4, !tbaa !19
  %cmp41188 = icmp sgt i32 %N, 1
  br i1 %cmp41188, label %for.body43.lr.ph, label %for.end59.thread

for.end59.thread:                                 ; preds = %for.end35
  %6 = load %struct.complex*, %struct.complex** @fe_fft.w, align 8, !tbaa !14
  %arrayidx62201 = getelementptr inbounds %struct.complex, %struct.complex* %6, i64 %conv37
  store %struct.complex* %arrayidx62201, %struct.complex** @fe_fft.wEnd, align 8, !tbaa !14
  br label %for.end125.sink.split

for.body43.lr.ph:                                 ; preds = %for.end35
  %conv44 = sitofp i32 %invert to double
  %mul = fmul double %conv44, 0xC01921FB54442D18
  %conv47 = sitofp i32 %N to double
  br label %for.body43

for.body43:                                       ; preds = %for.body43.lr.ph, %for.body43
  %storemerge170189 = phi i32 [ 0, %for.body43.lr.ph ], [ %inc58, %for.body43 ]
  %conv45 = sitofp i32 %storemerge170189 to double
  %mul46 = fmul double %mul, %conv45
  %div48 = fdiv double %mul46, %conv47
  store double %div48, double* @fe_fft.x, align 8, !tbaa !24
  %call49 = tail call double @cos(double %div48) #4
  %7 = load %struct.complex*, %struct.complex** @fe_fft.w, align 8, !tbaa !14
  %8 = load i32, i32* @fe_fft.k, align 4, !tbaa !19
  %idxprom50 = sext i32 %8 to i64
  %r52 = getelementptr inbounds %struct.complex, %struct.complex* %7, i64 %idxprom50, i32 0
  store double %call49, double* %r52, align 8, !tbaa !31
  %9 = load double, double* @fe_fft.x, align 8, !tbaa !24
  %call53 = tail call double @sin(double %9) #4
  %10 = load %struct.complex*, %struct.complex** @fe_fft.w, align 8, !tbaa !14
  %11 = load i32, i32* @fe_fft.k, align 4, !tbaa !19
  %idxprom54 = sext i32 %11 to i64
  %i56 = getelementptr inbounds %struct.complex, %struct.complex* %10, i64 %idxprom54, i32 1
  store double %call53, double* %i56, align 8, !tbaa !33
  %inc58 = add nsw i32 %11, 1
  store i32 %inc58, i32* @fe_fft.k, align 4, !tbaa !19
  %cmp41 = icmp slt i32 %inc58, %div36
  br i1 %cmp41, label %for.body43, label %for.end59

for.end59:                                        ; preds = %for.body43
  %12 = load %struct.complex*, %struct.complex** @fe_fft.w, align 8, !tbaa !14
  %arrayidx62 = getelementptr inbounds %struct.complex, %struct.complex* %12, i64 %conv37
  store %struct.complex* %arrayidx62, %struct.complex** @fe_fft.wEnd, align 8, !tbaa !14
  store i32 %div36, i32* @fe_fft.k, align 4, !tbaa !19
  %cmp65184 = icmp sgt i32 %N, 1
  br i1 %cmp65184, label %for.cond68.preheader.lr.ph, label %for.end125

for.cond68.preheader.lr.ph:                       ; preds = %for.end59
  %13 = sext i32 %div36 to i64
  br label %for.cond68.preheader

for.cond68.preheader:                             ; preds = %for.cond68.preheader.lr.ph, %for.end122
  %storemerge171185 = phi i32 [ %div36, %for.cond68.preheader.lr.ph ], [ %div124, %for.end122 ]
  %cmp69182 = icmp sgt i32 %storemerge171185, 0
  %14 = load %struct.complex*, %struct.complex** @fe_fft.from, align 8, !tbaa !14
  br i1 %cmp69182, label %for.body71.lr.ph, label %for.end122.thread

for.end122.thread:                                ; preds = %for.cond68.preheader
  %15 = load i64, i64* bitcast (%struct.complex** @fe_fft.to to i64*), align 8, !tbaa !14
  store i64 %15, i64* bitcast (%struct.complex** @fe_fft.from to i64*), align 8, !tbaa !14
  %.cast203 = ptrtoint %struct.complex* %14 to i64
  store i64 %.cast203, i64* bitcast (%struct.complex** @fe_fft.to to i64*), align 8, !tbaa !14
  %div124204 = sdiv i32 %storemerge171185, 2
  br label %for.cond64.for.end125_crit_edge

for.body71.lr.ph:                                 ; preds = %for.cond68.preheader
  %16 = load %struct.complex*, %struct.complex** @fe_fft.to, align 8, !tbaa !14
  %17 = load %struct.complex*, %struct.complex** @fe_fft.from, align 8, !tbaa !14
  %mul110 = shl nsw i32 %storemerge171185, 1
  %idx.ext = sext i32 %mul110 to i64
  %idx.ext114 = sext i32 %storemerge171185 to i64
  %18 = sext i32 %storemerge171185 to i64
  %wide.trip.count = zext i32 %storemerge171185 to i64
  br label %while.body.preheader

while.body.preheader:                             ; preds = %for.body71.lr.ph, %for.inc120
  %indvars.iv = phi i64 [ 0, %for.body71.lr.ph ], [ %indvars.iv.next, %for.inc120 ]
  %19 = phi %struct.complex* [ %14, %for.body71.lr.ph ], [ %17, %for.inc120 ]
  %20 = add nsw i64 %indvars.iv, %13
  %arrayidx81 = getelementptr inbounds %struct.complex, %struct.complex* %16, i64 %20
  %arrayidx77 = getelementptr inbounds %struct.complex, %struct.complex* %16, i64 %indvars.iv
  %21 = add nsw i64 %indvars.iv, %18
  %arrayidx75 = getelementptr inbounds %struct.complex, %struct.complex* %19, i64 %21
  %arrayidx73 = getelementptr inbounds %struct.complex, %struct.complex* %19, i64 %indvars.iv
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %ww.0181 = phi %struct.complex* [ %add.ptr119, %while.body ], [ %12, %while.body.preheader ]
  %t2.0180 = phi %struct.complex* [ %add.ptr117, %while.body ], [ %arrayidx81, %while.body.preheader ]
  %t1.0179 = phi %struct.complex* [ %add.ptr115, %while.body ], [ %arrayidx77, %while.body.preheader ]
  %f2.0178 = phi %struct.complex* [ %add.ptr113, %while.body ], [ %arrayidx75, %while.body.preheader ]
  %f1.0177 = phi %struct.complex* [ %add.ptr, %while.body ], [ %arrayidx73, %while.body.preheader ]
  %r85 = getelementptr inbounds %struct.complex, %struct.complex* %f2.0178, i64 0, i32 0
  %22 = load double, double* %r85, align 8, !tbaa !31
  %r86 = getelementptr inbounds %struct.complex, %struct.complex* %ww.0181, i64 0, i32 0
  %23 = load double, double* %r86, align 8, !tbaa !31
  %mul87 = fmul double %22, %23
  %i88 = getelementptr inbounds %struct.complex, %struct.complex* %f2.0178, i64 0, i32 1
  %24 = load double, double* %i88, align 8, !tbaa !33
  %i89 = getelementptr inbounds %struct.complex, %struct.complex* %ww.0181, i64 0, i32 1
  %25 = load double, double* %i89, align 8, !tbaa !33
  %mul90 = fmul double %24, %25
  %sub = fsub double %mul87, %mul90
  %mul93 = fmul double %22, %25
  %mul96 = fmul double %23, %24
  %add97 = fadd double %mul96, %mul93
  %r98 = getelementptr inbounds %struct.complex, %struct.complex* %f1.0177, i64 0, i32 0
  %26 = load double, double* %r98, align 8, !tbaa !31
  %add99 = fadd double %sub, %26
  %r100 = getelementptr inbounds %struct.complex, %struct.complex* %t1.0179, i64 0, i32 0
  store double %add99, double* %r100, align 8, !tbaa !31
  %i101 = getelementptr inbounds %struct.complex, %struct.complex* %f1.0177, i64 0, i32 1
  %27 = load double, double* %i101, align 8, !tbaa !33
  %add102 = fadd double %add97, %27
  %i103 = getelementptr inbounds %struct.complex, %struct.complex* %t1.0179, i64 0, i32 1
  store double %add102, double* %i103, align 8, !tbaa !33
  %28 = load double, double* %r98, align 8, !tbaa !31
  %sub105 = fsub double %28, %sub
  %r106 = getelementptr inbounds %struct.complex, %struct.complex* %t2.0180, i64 0, i32 0
  store double %sub105, double* %r106, align 8, !tbaa !31
  %29 = load double, double* %i101, align 8, !tbaa !33
  %sub108 = fsub double %29, %add97
  %i109 = getelementptr inbounds %struct.complex, %struct.complex* %t2.0180, i64 0, i32 1
  store double %sub108, double* %i109, align 8, !tbaa !33
  %add.ptr = getelementptr inbounds %struct.complex, %struct.complex* %f1.0177, i64 %idx.ext
  %add.ptr113 = getelementptr inbounds %struct.complex, %struct.complex* %f2.0178, i64 %idx.ext
  %add.ptr115 = getelementptr inbounds %struct.complex, %struct.complex* %t1.0179, i64 %idx.ext114
  %add.ptr117 = getelementptr inbounds %struct.complex, %struct.complex* %t2.0180, i64 %idx.ext114
  %add.ptr119 = getelementptr inbounds %struct.complex, %struct.complex* %ww.0181, i64 %idx.ext114
  %cmp83 = icmp ult %struct.complex* %add.ptr119, %arrayidx62
  br i1 %cmp83, label %while.body, label %for.inc120

for.inc120:                                       ; preds = %while.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end122, label %while.body.preheader

for.end122:                                       ; preds = %for.inc120
  %30 = load i64, i64* bitcast (%struct.complex** @fe_fft.to to i64*), align 8, !tbaa !14
  store i64 %30, i64* bitcast (%struct.complex** @fe_fft.from to i64*), align 8, !tbaa !14
  %.cast = ptrtoint %struct.complex* %17 to i64
  store i64 %.cast, i64* bitcast (%struct.complex** @fe_fft.to to i64*), align 8, !tbaa !14
  %div124 = sdiv i32 %storemerge171185, 2
  %cmp65 = icmp sgt i32 %storemerge171185, 1
  br i1 %cmp65, label %for.cond68.preheader, label %for.cond64.for.end125_crit_edge

for.cond64.for.end125_crit_edge:                  ; preds = %for.end122, %for.end122.thread
  %div124208 = phi i32 [ %div124204, %for.end122.thread ], [ %div124, %for.end122 ]
  %.lcssa207 = phi %struct.complex* [ %14, %for.end122.thread ], [ %17, %for.end122 ]
  store %struct.complex* %.lcssa207, %struct.complex** @fe_fft.exch, align 8, !tbaa !14
  br label %for.end125.sink.split

for.end125.sink.split:                            ; preds = %for.cond64.for.end125_crit_edge, %for.end59.thread
  %div36.sink = phi i32 [ %div36, %for.end59.thread ], [ %div124208, %for.cond64.for.end125_crit_edge ]
  store i32 %div36.sink, i32* @fe_fft.k, align 4, !tbaa !19
  br label %for.end125

for.end125:                                       ; preds = %for.end125.sink.split, %for.end59
  %31 = load i8*, i8** bitcast (%struct.complex** @fe_fft.buffer to i8**), align 8, !tbaa !14
  tail call void @free(i8* %31) #4
  %32 = load i8*, i8** bitcast (%struct.complex** @fe_fft.w to i8**), align 8, !tbaa !14
  tail call void @free(i8* %32) #4
  br label %cleanup

cleanup:                                          ; preds = %for.end125, %if.else7, %if.then
  %retval.0 = phi i32 [ -1, %if.then ], [ 0, %for.end125 ], [ -1, %if.else7 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare dso_local double @log(double) local_unnamed_addr #1

; Function Attrs: nounwind
declare dso_local double @sin(double) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local void @fe_free_2d(i8** %arr) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq i8** %arr, null
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %arr, align 8, !tbaa !14
  tail call void @free(i8* %0) #4
  %1 = bitcast i8** %arr to i8*
  tail call void @free(i8* %1) #4
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define dso_local void @fe_parse_general_params(%struct.param_t* nocapture readonly %P, %struct.fe_t* nocapture %FE) local_unnamed_addr #3 {
entry:
  %SAMPLING_RATE = getelementptr inbounds %struct.param_t, %struct.param_t* %P, i64 0, i32 0
  %0 = load float, float* %SAMPLING_RATE, align 8, !tbaa !36
  %cmp = fcmp une float %0, 0.000000e+00
  %SAMPLING_RATE2 = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 0
  %. = select i1 %cmp, float %0, float 1.600000e+04
  store float %., float* %SAMPLING_RATE2, align 8, !tbaa !34
  %FRAME_RATE = getelementptr inbounds %struct.param_t, %struct.param_t* %P, i64 0, i32 1
  %1 = load i32, i32* %FRAME_RATE, align 4, !tbaa !38
  %cmp4 = icmp eq i32 %1, 0
  %FRAME_RATE9 = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 1
  %storemerge72 = select i1 %cmp4, i32 100, i32 %1
  store i32 %storemerge72, i32* %FRAME_RATE9, align 4, !tbaa !39
  %WINDOW_LENGTH = getelementptr inbounds %struct.param_t, %struct.param_t* %P, i64 0, i32 2
  %2 = load float, float* %WINDOW_LENGTH, align 8, !tbaa !40
  %cmp11 = fcmp une float %2, 0.000000e+00
  %WINDOW_LENGTH14 = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 3
  %.78 = select i1 %cmp11, float %2, float 0x3F9A36E2E0000000
  store float %.78, float* %WINDOW_LENGTH14, align 4, !tbaa !41
  %FB_TYPE = getelementptr inbounds %struct.param_t, %struct.param_t* %P, i64 0, i32 3
  %3 = load i32, i32* %FB_TYPE, align 4, !tbaa !42
  %cmp18 = icmp eq i32 %3, 0
  %FB_TYPE23 = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 6
  %storemerge74 = select i1 %cmp18, i32 1, i32 %3
  store i32 %storemerge74, i32* %FB_TYPE23, align 8, !tbaa !26
  %PRE_EMPHASIS_ALPHA = getelementptr inbounds %struct.param_t, %struct.param_t* %P, i64 0, i32 9
  %4 = load float, float* %PRE_EMPHASIS_ALPHA, align 4, !tbaa !43
  %cmp25 = fcmp une float %4, 0.000000e+00
  %PRE_EMPHASIS_ALPHA28 = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 8
  %.79 = select i1 %cmp25, float %4, float 0x3FEF0A3D80000000
  store float %.79, float* %PRE_EMPHASIS_ALPHA28, align 8, !tbaa !44
  %NUM_CEPSTRA = getelementptr inbounds %struct.param_t, %struct.param_t* %P, i64 0, i32 4
  %5 = load i32, i32* %NUM_CEPSTRA, align 8, !tbaa !45
  %cmp32 = icmp eq i32 %5, 0
  %NUM_CEPSTRA37 = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 7
  %storemerge76 = select i1 %cmp32, i32 13, i32 %5
  store i32 %storemerge76, i32* %NUM_CEPSTRA37, align 4, !tbaa !35
  %FFT_SIZE = getelementptr inbounds %struct.param_t, %struct.param_t* %P, i64 0, i32 6
  %6 = load i32, i32* %FFT_SIZE, align 8, !tbaa !46
  %cmp39 = icmp eq i32 %6, 0
  %FFT_SIZE44 = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 5
  %.80 = select i1 %cmp39, i32 256, i32 %6
  store i32 %.80, i32* %FFT_SIZE44, align 4, !tbaa !28
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @fe_parse_melfb_params(%struct.param_t* nocapture readonly %P, %struct.melfb_t* nocapture %MEL) local_unnamed_addr #0 {
entry:
  %SAMPLING_RATE = getelementptr inbounds %struct.param_t, %struct.param_t* %P, i64 0, i32 0
  %0 = load float, float* %SAMPLING_RATE, align 8, !tbaa !36
  %cmp = fcmp une float %0, 0.000000e+00
  %sampling_rate = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL, i64 0, i32 0
  %.123 = select i1 %cmp, float %0, float 1.600000e+04
  store float %.123, float* %sampling_rate, align 8, !tbaa !15
  %FFT_SIZE = getelementptr inbounds %struct.param_t, %struct.param_t* %P, i64 0, i32 6
  %1 = load i32, i32* %FFT_SIZE, align 8, !tbaa !46
  %cmp3 = icmp eq i32 %1, 0
  br i1 %cmp3, label %if.else6, label %if.end19

if.else6:                                         ; preds = %entry
  %2 = load float, float* %sampling_rate, align 8, !tbaa !15
  %cmp8 = fcmp oeq float %2, 1.600000e+04
  br i1 %cmp8, label %if.then9, label %if.end19

if.then9:                                         ; preds = %if.else6
  %fft_size10 = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL, i64 0, i32 3
  store i32 512, i32* %fft_size10, align 4, !tbaa !9
  br label %if.end19

if.end19:                                         ; preds = %if.else6, %if.then9, %entry
  %.sink = phi i32 [ %1, %entry ], [ 256, %if.then9 ], [ 256, %if.else6 ]
  %fft_size15 = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL, i64 0, i32 3
  store i32 %.sink, i32* %fft_size15, align 4, !tbaa !9
  %NUM_CEPSTRA = getelementptr inbounds %struct.param_t, %struct.param_t* %P, i64 0, i32 4
  %3 = load i32, i32* %NUM_CEPSTRA, align 8, !tbaa !45
  %cmp20 = icmp eq i32 %3, 0
  %num_cepstra24 = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL, i64 0, i32 1
  %.124 = select i1 %cmp20, i32 13, i32 %3
  store i32 %.124, i32* %num_cepstra24, align 4, !tbaa !20
  %NUM_FILTERS = getelementptr inbounds %struct.param_t, %struct.param_t* %P, i64 0, i32 5
  %4 = load i32, i32* %NUM_FILTERS, align 4, !tbaa !47
  %cmp26 = icmp eq i32 %4, 0
  br i1 %cmp26, label %if.else29, label %if.end44

if.else29:                                        ; preds = %if.end19
  %5 = load float, float* %sampling_rate, align 8, !tbaa !15
  %cmp31 = fcmp oeq float %5, 1.600000e+04
  br i1 %cmp31, label %if.end44, label %if.else34

if.else34:                                        ; preds = %if.else29
  %cmp36 = fcmp oeq float %5, 8.000000e+03
  br i1 %cmp36, label %if.end44, label %if.else39

if.else39:                                        ; preds = %if.else34
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.8, i64 0, i64 0), i64 47, i64 1, %struct._IO_FILE* %6) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.9, i64 0, i64 0), i64 40, i64 1, %struct._IO_FILE* %8) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %call41 = tail call i32 @fflush(%struct._IO_FILE* %10)
  tail call void @exit(i32 0) #7
  unreachable

if.end44:                                         ; preds = %if.else34, %if.else29, %if.end19
  %.sink125 = phi i32 [ %4, %if.end19 ], [ 40, %if.else29 ], [ 31, %if.else34 ]
  %num_filters33 = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL, i64 0, i32 2
  store i32 %.sink125, i32* %num_filters33, align 8, !tbaa !2
  %UPPER_FILT_FREQ = getelementptr inbounds %struct.param_t, %struct.param_t* %P, i64 0, i32 8
  %11 = load float, float* %UPPER_FILT_FREQ, align 8, !tbaa !48
  %cmp45 = fcmp une float %11, 0.000000e+00
  br i1 %cmp45, label %if.end64, label %if.else48

if.else48:                                        ; preds = %if.end44
  %12 = load float, float* %sampling_rate, align 8, !tbaa !15
  %cmp50 = fcmp oeq float %12, 1.600000e+04
  br i1 %cmp50, label %if.end64, label %if.else53

if.else53:                                        ; preds = %if.else48
  %cmp55 = fcmp oeq float %12, 8.000000e+03
  br i1 %cmp55, label %if.end64, label %if.else58

if.else58:                                        ; preds = %if.else53
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %14 = tail call i64 @fwrite(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.10, i64 0, i64 0), i64 46, i64 1, %struct._IO_FILE* %13) #6
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %16 = tail call i64 @fwrite(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.9, i64 0, i64 0), i64 40, i64 1, %struct._IO_FILE* %15) #6
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %call61 = tail call i32 @fflush(%struct._IO_FILE* %17)
  tail call void @exit(i32 0) #7
  unreachable

if.end64:                                         ; preds = %if.else53, %if.else48, %if.end44
  %.sink126 = phi float [ %11, %if.end44 ], [ 0x40BAC77F60000000, %if.else48 ], [ 3.500000e+03, %if.else53 ]
  %upper_filt_freq52 = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL, i64 0, i32 5
  store float %.sink126, float* %upper_filt_freq52, align 4, !tbaa !16
  %LOWER_FILT_FREQ = getelementptr inbounds %struct.param_t, %struct.param_t* %P, i64 0, i32 7
  %18 = load float, float* %LOWER_FILT_FREQ, align 4, !tbaa !49
  %cmp65 = fcmp une float %18, 0.000000e+00
  br i1 %cmp65, label %if.end84, label %if.else68

if.else68:                                        ; preds = %if.end64
  %19 = load float, float* %sampling_rate, align 8, !tbaa !15
  %cmp70 = fcmp oeq float %19, 1.600000e+04
  br i1 %cmp70, label %if.end84, label %if.else73

if.else73:                                        ; preds = %if.else68
  %cmp75 = fcmp oeq float %19, 8.000000e+03
  br i1 %cmp75, label %if.end84, label %if.else78

if.else78:                                        ; preds = %if.else73
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.11, i64 0, i64 0), i64 46, i64 1, %struct._IO_FILE* %20) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.9, i64 0, i64 0), i64 40, i64 1, %struct._IO_FILE* %22) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %call81 = tail call i32 @fflush(%struct._IO_FILE* %24)
  tail call void @exit(i32 0) #7
  unreachable

if.end84:                                         ; preds = %if.else73, %if.else68, %if.end64
  %.sink127 = phi float [ %18, %if.end64 ], [ 0x4060AAAAC0000000, %if.else68 ], [ 2.000000e+02, %if.else73 ]
  %lower_filt_freq72 = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL, i64 0, i32 4
  store float %.sink127, float* %lower_filt_freq72, align 8, !tbaa !17
  %doublebw = getelementptr inbounds %struct.param_t, %struct.param_t* %P, i64 0, i32 22
  %25 = load i32, i32* %doublebw, align 4, !tbaa !50
  %cmp85 = icmp eq i32 %25, 1
  %doublewide = getelementptr inbounds %struct.melfb_t, %struct.melfb_t* %MEL, i64 0, i32 10
  %. = zext i1 %cmp85 to i32
  store i32 %., i32* %doublewide, align 8, !tbaa !13
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @fflush(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local void @fe_print_current(%struct.fe_t* nocapture readonly %FE) local_unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.12, i64 0, i64 0), i64 23, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %SAMPLING_RATE = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 0
  %3 = load float, float* %SAMPLING_RATE, align 8, !tbaa !34
  %conv = fpext float %3 to double
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.13, i64 0, i64 0), double %conv) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %FRAME_SIZE = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 4
  %5 = load i32, i32* %FRAME_SIZE, align 8, !tbaa !30
  %call2 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.14, i64 0, i64 0), i32 %5) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %FRAME_SHIFT = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 2
  %7 = load i32, i32* %FRAME_SHIFT, align 8, !tbaa !51
  %call3 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.15, i64 0, i64 0), i32 %7) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %FFT_SIZE = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 5
  %9 = load i32, i32* %FFT_SIZE, align 4, !tbaa !28
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.16, i64 0, i64 0), i32 %9) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %NUM_OVERFLOW_SAMPS = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 10
  %11 = load i32, i32* %NUM_OVERFLOW_SAMPS, align 8, !tbaa !52
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.17, i64 0, i64 0), i32 %11) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !14
  %START_FLAG = getelementptr inbounds %struct.fe_t, %struct.fe_t* %FE, i64 0, i32 12
  %13 = load i32, i32* %START_FLAG, align 8, !tbaa !53
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.18, i64 0, i64 0), i32 %13) #6
  ret void
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !7, i64 8}
!3 = !{!"", !4, i64 0, !7, i64 4, !7, i64 8, !7, i64 12, !4, i64 16, !4, i64 20, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !7, i64 56}
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!3, !7, i64 12}
!10 = !{!3, !8, i64 24}
!11 = !{!3, !8, i64 40}
!12 = !{!3, !8, i64 48}
!13 = !{!3, !7, i64 56}
!14 = !{!8, !8, i64 0}
!15 = !{!3, !4, i64 0}
!16 = !{!3, !4, i64 20}
!17 = !{!3, !4, i64 16}
!18 = !{!4, !4, i64 0}
!19 = !{!7, !7, i64 0}
!20 = !{!3, !7, i64 4}
!21 = !{!3, !8, i64 32}
!22 = !{!23, !23, i64 0}
!23 = !{!"short", !5, i64 0}
!24 = !{!25, !25, i64 0}
!25 = !{!"double", !5, i64 0}
!26 = !{!27, !7, i64 24}
!27 = !{!"", !4, i64 0, !7, i64 4, !7, i64 8, !4, i64 12, !7, i64 16, !7, i64 20, !7, i64 24, !7, i64 28, !4, i64 32, !8, i64 40, !7, i64 48, !8, i64 56, !7, i64 64, !23, i64 68, !8, i64 72}
!28 = !{!27, !7, i64 20}
!29 = !{!27, !8, i64 56}
!30 = !{!27, !7, i64 16}
!31 = !{!32, !25, i64 0}
!32 = !{!"", !25, i64 0, !25, i64 8}
!33 = !{!32, !25, i64 8}
!34 = !{!27, !4, i64 0}
!35 = !{!27, !7, i64 28}
!36 = !{!37, !4, i64 0}
!37 = !{!"", !4, i64 0, !7, i64 4, !4, i64 8, !7, i64 12, !7, i64 16, !7, i64 20, !7, i64 24, !4, i64 28, !4, i64 32, !4, i64 36, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !7, i64 96, !7, i64 100, !7, i64 104, !7, i64 108, !7, i64 112, !7, i64 116}
!38 = !{!37, !7, i64 4}
!39 = !{!27, !7, i64 4}
!40 = !{!37, !4, i64 8}
!41 = !{!27, !4, i64 12}
!42 = !{!37, !7, i64 12}
!43 = !{!37, !4, i64 36}
!44 = !{!27, !4, i64 32}
!45 = !{!37, !7, i64 16}
!46 = !{!37, !7, i64 24}
!47 = !{!37, !7, i64 20}
!48 = !{!37, !4, i64 32}
!49 = !{!37, !4, i64 28}
!50 = !{!37, !7, i64 116}
!51 = !{!27, !7, i64 8}
!52 = !{!27, !7, i64 48}
!53 = !{!27, !7, i64 64}
