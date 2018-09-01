; ModuleID = 'vector.bc'
source_filename = "vector.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.ptmr_t = type { i8*, double, double, double, double, double, double }
%struct.vector_gautbl_t = type { i32, i32, float**, float**, float*, double }

@.str = private unnamed_addr constant [8 x i8] c" %11.4e\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"(n_vec > 0) && (n_dim > 0)\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"vector.c\00", align 1
@__PRETTY_FUNCTION__.vector_mean = private unnamed_addr constant [55 x i8] c"int32 vector_mean(float32 *, float32 **, int32, int32)\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"(rows > 0) && (cols > 0)\00", align 1
@__PRETTY_FUNCTION__.vector_vqlabel = private unnamed_addr constant [69 x i8] c"int32 vector_vqlabel(float32 *, float32 **, int32, int32, float64 *)\00", align 1
@vector_vqgen.seed = internal unnamed_addr global i32 1, align 4
@.str.5 = private unnamed_addr constant [54 x i8] c"(rows >= vqrows) && (maxiter >= 0) && (epsilon > 0.0)\00", align 1
@__PRETTY_FUNCTION__.vector_vqgen = private unnamed_addr constant [91 x i8] c"float64 vector_vqgen(float32 **, int32, int32, int32, float64, int32, float32 **, int32 *)\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"INFO\00", align 1
@.str.7 = private unnamed_addr constant [32 x i8] c"Iter %4d: %.1fs CPU; sqerr= %e\0A\00", align 1
@.str.8 = private unnamed_addr constant [43 x i8] c"Iter %4d: %.1fs CPU; sqerr= %e; delta= %e\0A\00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"ERROR\00", align 1
@.str.10 = private unnamed_addr constant [28 x i8] c"Iter %d: mean[%d] unmapped\0A\00", align 1

; Function Attrs: norecurse nounwind uwtable
define dso_local double @vector_sum_norm(float* nocapture %vec, i32 %len) local_unnamed_addr #0 {
entry:
  %cmp33 = icmp sgt i32 %len, 0
  br i1 %cmp33, label %for.body.preheader, label %if.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count38 = zext i32 %len to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv36 = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next37, %for.body ]
  %sum.034 = phi double [ 0.000000e+00, %for.body.preheader ], [ %add, %for.body ]
  %arrayidx = getelementptr inbounds float, float* %vec, i64 %indvars.iv36
  %0 = load float, float* %arrayidx, align 4, !tbaa !2
  %conv = fpext float %0 to double
  %add = fadd double %sum.034, %conv
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond39, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  %cmp1 = fcmp une double %add, 0.000000e+00
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %div = fdiv double 1.000000e+00, %add
  %cmp431 = icmp sgt i32 %len, 0
  br i1 %cmp431, label %for.body6.preheader, label %if.end

for.body6.preheader:                              ; preds = %if.then
  %wide.trip.count = zext i32 %len to i64
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.preheader
  %indvars.iv = phi i64 [ 0, %for.body6.preheader ], [ %indvars.iv.next, %for.body6 ]
  %arrayidx8 = getelementptr inbounds float, float* %vec, i64 %indvars.iv
  %1 = load float, float* %arrayidx8, align 4, !tbaa !2
  %conv9 = fpext float %1 to double
  %mul = fmul double %div, %conv9
  %conv10 = fptrunc double %mul to float
  store float %conv10, float* %arrayidx8, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %if.end, label %for.body6

if.end:                                           ; preds = %for.body6, %entry, %if.then, %for.end
  %sum.0.lcssa41 = phi double [ %add, %if.then ], [ %add, %for.end ], [ 0.000000e+00, %entry ], [ %add, %for.body6 ]
  ret double %sum.0.lcssa41
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind uwtable
define dso_local void @vector_floor(float* nocapture %vec, i32 %len, double %flr) local_unnamed_addr #0 {
entry:
  %cmp12 = icmp sgt i32 %len, 0
  br i1 %cmp12, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %conv3 = fptrunc double %flr to float
  %wide.trip.count = zext i32 %len to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %arrayidx = getelementptr inbounds float, float* %vec, i64 %indvars.iv
  %0 = load float, float* %arrayidx, align 4, !tbaa !2
  %conv = fpext float %0 to double
  %cmp1 = fcmp olt double %conv, %flr
  br i1 %cmp1, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  store float %conv3, float* %arrayidx, align 4, !tbaa !2
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc, %entry
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define dso_local void @vector_nz_floor(float* nocapture %vec, i32 %len, double %flr) local_unnamed_addr #0 {
entry:
  %cmp19 = icmp sgt i32 %len, 0
  br i1 %cmp19, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %conv8 = fptrunc double %flr to float
  %wide.trip.count = zext i32 %len to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %arrayidx = getelementptr inbounds float, float* %vec, i64 %indvars.iv
  %0 = load float, float* %arrayidx, align 4, !tbaa !2
  %cmp1 = fcmp une float %0, 0.000000e+00
  %conv = fpext float %0 to double
  %cmp6 = fcmp olt double %conv, %flr
  %or.cond = and i1 %cmp1, %cmp6
  br i1 %or.cond, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  store float %conv8, float* %arrayidx, align 4, !tbaa !2
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @vector_print(%struct._IO_FILE* nocapture %fp, float* nocapture readonly %v, i32 %dim) local_unnamed_addr #2 {
entry:
  %cmp7 = icmp sgt i32 %dim, 0
  br i1 %cmp7, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %dim to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds float, float* %v, i64 %indvars.iv
  %0 = load float, float* %arrayidx, align 4, !tbaa !2
  %conv = fpext float %0 to double
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %fp, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), double %conv)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %fp)
  %call2 = tail call i32 @fflush(%struct._IO_FILE* %fp)
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i32 @fflush(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local i32 @vector_is_zero(float* nocapture readonly %vec, i32 %len) local_unnamed_addr #4 {
entry:
  %cmp10 = icmp sgt i32 %len, 0
  br i1 %cmp10, label %land.rhs.preheader, label %for.end

land.rhs.preheader:                               ; preds = %entry
  %0 = sext i32 %len to i64
  br label %land.rhs

land.rhs:                                         ; preds = %land.rhs.preheader, %for.inc
  %indvars.iv = phi i64 [ 0, %land.rhs.preheader ], [ %indvars.iv.next, %for.inc ]
  %i.011 = phi i32 [ 0, %land.rhs.preheader ], [ %inc, %for.inc ]
  %arrayidx = getelementptr inbounds float, float* %vec, i64 %indvars.iv
  %1 = load float, float* %arrayidx, align 4, !tbaa !2
  %cmp1 = fcmp oeq float %1, 0.000000e+00
  br i1 %cmp1, label %for.inc, label %for.end.loopexit.split.loop.exit13

for.inc:                                          ; preds = %land.rhs
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %inc = add nuw nsw i32 %i.011, 1
  %cmp = icmp slt i64 %indvars.iv.next, %0
  br i1 %cmp, label %land.rhs, label %for.end

for.end.loopexit.split.loop.exit13:               ; preds = %land.rhs
  %2 = trunc i64 %indvars.iv to i32
  br label %for.end

for.end:                                          ; preds = %for.inc, %for.end.loopexit.split.loop.exit13, %entry
  %i.0.lcssa = phi i32 [ 0, %entry ], [ %2, %for.end.loopexit.split.loop.exit13 ], [ %inc, %for.inc ]
  %cmp3 = icmp eq i32 %i.0.lcssa, %len
  %conv4 = zext i1 %cmp3 to i32
  ret i32 %conv4
}

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local i32 @vector_maxcomp_int32(i32* nocapture readonly %val, i32 %len) local_unnamed_addr #4 {
entry:
  %cmp11 = icmp sgt i32 %len, 1
  br i1 %cmp11, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 1, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %bi.013 = phi i32 [ 0, %for.body.preheader ], [ %spec.select, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %val, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !6
  %idxprom1 = sext i32 %bi.013 to i64
  %arrayidx2 = getelementptr inbounds i32, i32* %val, i64 %idxprom1
  %1 = load i32, i32* %arrayidx2, align 4, !tbaa !6
  %cmp3 = icmp sgt i32 %0, %1
  %2 = trunc i64 %indvars.iv to i32
  %spec.select = select i1 %cmp3, i32 %2, i32 %bi.013
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %bi.0.lcssa = phi i32 [ 0, %entry ], [ %spec.select, %for.body ]
  ret i32 %bi.0.lcssa
}

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local i32 @vector_mincomp_int32(i32* nocapture readonly %val, i32 %len) local_unnamed_addr #4 {
entry:
  %cmp11 = icmp sgt i32 %len, 1
  br i1 %cmp11, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 1, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %bi.013 = phi i32 [ 0, %for.body.preheader ], [ %spec.select, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %val, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !6
  %idxprom1 = sext i32 %bi.013 to i64
  %arrayidx2 = getelementptr inbounds i32, i32* %val, i64 %idxprom1
  %1 = load i32, i32* %arrayidx2, align 4, !tbaa !6
  %cmp3 = icmp slt i32 %0, %1
  %2 = trunc i64 %indvars.iv to i32
  %spec.select = select i1 %cmp3, i32 %2, i32 %bi.013
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %bi.0.lcssa = phi i32 [ 0, %entry ], [ %spec.select, %for.body ]
  ret i32 %bi.0.lcssa
}

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local i32 @vector_maxcomp_float32(float* nocapture readonly %val, i32 %len) local_unnamed_addr #4 {
entry:
  %cmp11 = icmp sgt i32 %len, 1
  br i1 %cmp11, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 1, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %bi.013 = phi i32 [ 0, %for.body.preheader ], [ %bi.1, %for.body ]
  %arrayidx = getelementptr inbounds float, float* %val, i64 %indvars.iv
  %0 = load float, float* %arrayidx, align 4, !tbaa !2
  %idxprom1 = sext i32 %bi.013 to i64
  %arrayidx2 = getelementptr inbounds float, float* %val, i64 %idxprom1
  %1 = load float, float* %arrayidx2, align 4, !tbaa !2
  %cmp3 = fcmp ogt float %0, %1
  %2 = trunc i64 %indvars.iv to i32
  %bi.1 = select i1 %cmp3, i32 %2, i32 %bi.013
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %bi.0.lcssa = phi i32 [ 0, %entry ], [ %bi.1, %for.body ]
  ret i32 %bi.0.lcssa
}

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local i32 @vector_mincomp_float32(float* nocapture readonly %val, i32 %len) local_unnamed_addr #4 {
entry:
  %cmp11 = icmp sgt i32 %len, 1
  br i1 %cmp11, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 1, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %bi.013 = phi i32 [ 0, %for.body.preheader ], [ %bi.1, %for.body ]
  %arrayidx = getelementptr inbounds float, float* %val, i64 %indvars.iv
  %0 = load float, float* %arrayidx, align 4, !tbaa !2
  %idxprom1 = sext i32 %bi.013 to i64
  %arrayidx2 = getelementptr inbounds float, float* %val, i64 %idxprom1
  %1 = load float, float* %arrayidx2, align 4, !tbaa !2
  %cmp3 = fcmp olt float %0, %1
  %2 = trunc i64 %indvars.iv to i32
  %bi.1 = select i1 %cmp3, i32 %2, i32 %bi.013
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %bi.0.lcssa = phi i32 [ 0, %entry ], [ %bi.1, %for.body ]
  ret i32 %bi.0.lcssa
}

; Function Attrs: norecurse nounwind uwtable
define dso_local void @vector_accum(float* nocapture %dst, float* nocapture readonly %src, i32 %len) local_unnamed_addr #0 {
entry:
  %cmp7 = icmp sgt i32 %len, 0
  br i1 %cmp7, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds float, float* %src, i64 %indvars.iv
  %0 = load float, float* %arrayidx, align 4, !tbaa !2
  %arrayidx2 = getelementptr inbounds float, float* %dst, i64 %indvars.iv
  %1 = load float, float* %arrayidx2, align 4, !tbaa !2
  %add = fadd float %0, %1
  store float %add, float* %arrayidx2, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local i32 @vector_cmp(float* nocapture readonly %v1, float* nocapture readonly %v2, i32 %len) local_unnamed_addr #4 {
entry:
  %cmp19 = icmp sgt i32 %len, 0
  br i1 %cmp19, label %for.body.preheader, label %cleanup

for.body.preheader:                               ; preds = %entry
  %0 = sext i32 %len to i64
  br label %for.body

for.cond:                                         ; preds = %if.end
  %cmp = icmp slt i64 %indvars.iv.next, %0
  br i1 %cmp, label %for.body, label %cleanup

for.body:                                         ; preds = %for.body.preheader, %for.cond
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.cond ]
  %arrayidx = getelementptr inbounds float, float* %v1, i64 %indvars.iv
  %1 = load float, float* %arrayidx, align 4, !tbaa !2
  %arrayidx2 = getelementptr inbounds float, float* %v2, i64 %indvars.iv
  %2 = load float, float* %arrayidx2, align 4, !tbaa !2
  %cmp3 = fcmp olt float %1, %2
  br i1 %cmp3, label %cleanup, label %if.end

if.end:                                           ; preds = %for.body
  %cmp8 = fcmp ogt float %1, %2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %cmp8, label %cleanup, label %for.cond

cleanup:                                          ; preds = %for.body, %if.end, %for.cond, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ 0, %for.cond ], [ 1, %if.end ], [ -1, %for.body ]
  ret i32 %retval.0
}

; Function Attrs: nounwind uwtable
define dso_local i32 @vector_mean(float* nocapture %mean, float** nocapture readonly %data, i32 %n_vec, i32 %n_dim) local_unnamed_addr #2 {
entry:
  %cmp = icmp sgt i32 %n_vec, 0
  %cmp1 = icmp sgt i32 %n_dim, 0
  %or.cond = and i1 %cmp, %cmp1
  br i1 %or.cond, label %for.cond6.preheader.lr.ph, label %cond.false

cond.false:                                       ; preds = %entry
  tail call void @__assert_fail(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32 220, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__PRETTY_FUNCTION__.vector_mean, i64 0, i64 0)) #8
  unreachable

for.cond6.preheader.lr.ph:                        ; preds = %entry
  %mean72 = bitcast float* %mean to i8*
  %0 = zext i32 %n_dim to i64
  %1 = shl nuw nsw i64 %0, 2
  call void @llvm.memset.p0i8.i64(i8* align 4 %mean72, i8 0, i64 %1, i1 false)
  %wide.trip.count62 = zext i32 %n_dim to i64
  %wide.trip.count66 = zext i32 %n_vec to i64
  br label %for.cond6.preheader

for.cond6.preheader:                              ; preds = %for.inc18, %for.cond6.preheader.lr.ph
  %indvars.iv64 = phi i64 [ 0, %for.cond6.preheader.lr.ph ], [ %indvars.iv.next65, %for.inc18 ]
  %arrayidx10 = getelementptr inbounds float*, float** %data, i64 %indvars.iv64
  %2 = load float*, float** %arrayidx10, align 8, !tbaa !8
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.cond6.preheader
  %indvars.iv60 = phi i64 [ 0, %for.cond6.preheader ], [ %indvars.iv.next61, %for.body8 ]
  %arrayidx12 = getelementptr inbounds float, float* %2, i64 %indvars.iv60
  %3 = load float, float* %arrayidx12, align 4, !tbaa !2
  %arrayidx14 = getelementptr inbounds float, float* %mean, i64 %indvars.iv60
  %4 = load float, float* %arrayidx14, align 4, !tbaa !2
  %add = fadd float %3, %4
  store float %add, float* %arrayidx14, align 4, !tbaa !2
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, %wide.trip.count62
  br i1 %exitcond63, label %for.inc18, label %for.body8

for.inc18:                                        ; preds = %for.body8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count66
  br i1 %exitcond67, label %for.end20, label %for.cond6.preheader

for.end20:                                        ; preds = %for.inc18
  %cmp2252 = icmp sgt i32 %n_dim, 0
  br i1 %cmp2252, label %for.body24.lr.ph, label %for.end30

for.body24.lr.ph:                                 ; preds = %for.end20
  %conv = sitofp i32 %n_vec to double
  %div = fdiv double 1.000000e+00, %conv
  %conv25 = fptrunc double %div to float
  %wide.trip.count = zext i32 %n_dim to i64
  br label %for.body24

for.body24:                                       ; preds = %for.body24, %for.body24.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body24.lr.ph ], [ %indvars.iv.next, %for.body24 ]
  %arrayidx27 = getelementptr inbounds float, float* %mean, i64 %indvars.iv
  %5 = load float, float* %arrayidx27, align 4, !tbaa !2
  %mul = fmul float %5, %conv25
  store float %mul, float* %arrayidx27, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end30, label %for.body24

for.end30:                                        ; preds = %for.body24, %for.end20
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #5

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local double @vector_dist_eucl(float* nocapture readonly %v1, float* nocapture readonly %v2, i32 %len) local_unnamed_addr #4 {
entry:
  %cmp18 = icmp sgt i32 %len, 0
  br i1 %cmp18, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %d.019 = phi double [ 0.000000e+00, %for.body.preheader ], [ %add, %for.body ]
  %arrayidx = getelementptr inbounds float, float* %v1, i64 %indvars.iv
  %0 = load float, float* %arrayidx, align 4, !tbaa !2
  %arrayidx2 = getelementptr inbounds float, float* %v2, i64 %indvars.iv
  %1 = load float, float* %arrayidx2, align 4, !tbaa !2
  %sub = fsub float %0, %1
  %mul = fmul float %sub, %sub
  %conv = fpext float %mul to double
  %add = fadd double %d.019, %conv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %d.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add, %for.body ]
  ret double %d.0.lcssa
}

; Function Attrs: nounwind uwtable
define dso_local double @vector_maha_precomp(float* nocapture %var, i32 %len) local_unnamed_addr #2 {
entry:
  %cmp23 = icmp sgt i32 %len, 0
  br i1 %cmp23, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %det.024 = phi double [ 0.000000e+00, %for.body.preheader ], [ %sub, %for.body ]
  %arrayidx = getelementptr inbounds float, float* %var, i64 %indvars.iv
  %0 = load float, float* %arrayidx, align 4, !tbaa !2
  %conv = fpext float %0 to double
  %call = tail call double @log(double %conv) #7
  %sub = fsub double %det.024, %call
  %1 = load float, float* %arrayidx, align 4, !tbaa !2
  %conv3 = fpext float %1 to double
  %mul = fmul double %conv3, 2.000000e+00
  %div = fdiv double 1.000000e+00, %mul
  %conv4 = fptrunc double %div to float
  store float %conv4, float* %arrayidx, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %det.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %sub, %for.body ]
  %conv8 = sitofp i32 %len to double
  %mul9 = fmul double %conv8, 0x3FFD67F1C864BEB4
  %sub10 = fsub double %det.0.lcssa, %mul9
  %mul11 = fmul double %sub10, 5.000000e-01
  ret double %mul11
}

; Function Attrs: nounwind
declare dso_local double @log(double) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local i32 @vector_vqlabel(float* nocapture readonly %vec, float** nocapture readonly %mean, i32 %rows, i32 %cols, double* %sqerr) local_unnamed_addr #2 {
entry:
  %cmp = icmp sgt i32 %rows, 0
  %cmp1 = icmp sgt i32 %cols, 0
  %or.cond = and i1 %cmp, %cmp1
  br i1 %or.cond, label %cond.end, label %cond.false

cond.false:                                       ; preds = %entry
  tail call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32 272, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @__PRETTY_FUNCTION__.vector_vqlabel, i64 0, i64 0)) #8
  unreachable

cond.end:                                         ; preds = %entry
  %0 = load float*, float** %mean, align 8, !tbaa !8
  %call = tail call double @vector_dist_eucl(float* %0, float* %vec, i32 %cols)
  %cmp223 = icmp sgt i32 %rows, 1
  br i1 %cmp223, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %cond.end
  %wide.trip.count = zext i32 %rows to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ 1, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %bestd.026 = phi double [ %call, %for.body.preheader ], [ %bestd.1, %for.body ]
  %besti.024 = phi i32 [ 0, %for.body.preheader ], [ %besti.1, %for.body ]
  %arrayidx3 = getelementptr inbounds float*, float** %mean, i64 %indvars.iv
  %1 = load float*, float** %arrayidx3, align 8, !tbaa !8
  %call4 = tail call double @vector_dist_eucl(float* %1, float* %vec, i32 %cols)
  %cmp5 = fcmp ogt double %bestd.026, %call4
  %2 = trunc i64 %indvars.iv to i32
  %besti.1 = select i1 %cmp5, i32 %2, i32 %besti.024
  %bestd.1 = select i1 %cmp5, double %call4, double %bestd.026
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %cond.end
  %besti.0.lcssa = phi i32 [ 0, %cond.end ], [ %besti.1, %for.body ]
  %bestd.0.lcssa = phi double [ %call, %cond.end ], [ %bestd.1, %for.body ]
  %tobool = icmp eq double* %sqerr, null
  br i1 %tobool, label %if.end7, label %if.then6

if.then6:                                         ; preds = %for.end
  store double %bestd.0.lcssa, double* %sqerr, align 8, !tbaa !10
  br label %if.end7

if.end7:                                          ; preds = %for.end, %if.then6
  ret i32 %besti.0.lcssa
}

; Function Attrs: nounwind uwtable
define dso_local double @vector_vqgen(float** nocapture readonly %data, i32 %rows, i32 %cols, i32 %vqrows, double %epsilon, i32 %maxiter, float** nocapture readonly %mean, i32* nocapture %map) local_unnamed_addr #2 {
entry:
  %t = alloca double, align 8
  %tm = alloca %struct.ptmr_t, align 8
  %0 = bitcast double* %t to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #7
  %1 = bitcast %struct.ptmr_t* %tm to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %1) #7
  %cmp = icmp sge i32 %rows, %vqrows
  %cmp1 = icmp sgt i32 %maxiter, -1
  %or.cond = and i1 %cmp, %cmp1
  %cmp3 = fcmp ogt double %epsilon, 0.000000e+00
  %or.cond154 = and i1 %cmp3, %or.cond
  br i1 %or.cond154, label %cond.end, label %cond.false

cond.false:                                       ; preds = %entry
  tail call void @__assert_fail(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32 309, i8* getelementptr inbounds ([91 x i8], [91 x i8]* @__PRETTY_FUNCTION__.vector_vqgen, i64 0, i64 0)) #8
  unreachable

cond.end:                                         ; preds = %entry
  %add = add nsw i32 %rows, 31
  %shr = ashr i32 %add, 5
  %conv = sext i32 %shr to i64
  %call = tail call i8* @__ckd_calloc__(i64 %conv, i64 4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32 311) #7
  %2 = bitcast i8* %call to i32*
  call void @ptmr_init(%struct.ptmr_t* nonnull %tm) #7
  call void @ptmr_start(%struct.ptmr_t* nonnull %tm) #7
  %3 = load i32, i32* @vector_vqgen.seed, align 4, !tbaa !6
  call void @srandom(i32 %3) #7
  %call4 = call i64 @random() #7
  %4 = load i32, i32* @vector_vqgen.seed, align 4, !tbaa !6
  %5 = trunc i64 %call4 to i32
  %conv6 = xor i32 %4, %5
  store i32 %conv6, i32* @vector_vqgen.seed, align 4, !tbaa !6
  %cmp7280 = icmp sgt i32 %vqrows, 0
  br i1 %cmp7280, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %cond.end
  %conv10 = sext i32 %rows to i64
  %conv26 = sext i32 %cols to i64
  %mul = shl nsw i64 %conv26, 2
  %wide.trip.count305 = zext i32 %vqrows to i64
  br label %for.body

for.body:                                         ; preds = %while.end, %for.body.lr.ph
  %indvars.iv303 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next304, %while.end ]
  %call9 = call i64 @random() #7
  %and = and i64 %call9, 2147483647
  %rem = srem i64 %and, %conv10
  %conv11 = trunc i64 %rem to i32
  %shr12268 = ashr i32 %conv11, 5
  %idxprom269 = sext i32 %shr12268 to i64
  %arrayidx270 = getelementptr inbounds i32, i32* %2, i64 %idxprom269
  %6 = load i32, i32* %arrayidx270, align 4, !tbaa !6
  %and13271 = and i32 %conv11, 31
  %shl272 = shl i32 1, %and13271
  %and14273 = and i32 %shl272, %6
  %tobool274 = icmp eq i32 %and14273, 0
  br i1 %tobool274, label %while.end, label %while.body

while.body:                                       ; preds = %for.body, %while.body
  %r.0275 = phi i32 [ %spec.store.select, %while.body ], [ %conv11, %for.body ]
  %inc = add nsw i32 %r.0275, 1
  %cmp15 = icmp slt i32 %inc, %rows
  %spec.store.select = select i1 %cmp15, i32 %inc, i32 0
  %shr12 = ashr i32 %spec.store.select, 5
  %idxprom = sext i32 %shr12 to i64
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom
  %7 = load i32, i32* %arrayidx, align 4, !tbaa !6
  %and13 = and i32 %spec.store.select, 31
  %shl = shl i32 1, %and13
  %and14 = and i32 %shl, %7
  %tobool = icmp eq i32 %and14, 0
  br i1 %tobool, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %arrayidx.le = getelementptr inbounds i32, i32* %2, i64 %idxprom
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %for.body
  %r.0.lcssa = phi i32 [ %spec.store.select, %while.cond.while.end_crit_edge ], [ %conv11, %for.body ]
  %arrayidx.lcssa = phi i32* [ %arrayidx.le, %while.cond.while.end_crit_edge ], [ %arrayidx270, %for.body ]
  %.lcssa253 = phi i32 [ %7, %while.cond.while.end_crit_edge ], [ %6, %for.body ]
  %shl.lcssa = phi i32 [ %shl, %while.cond.while.end_crit_edge ], [ %shl272, %for.body ]
  %or = or i32 %shl.lcssa, %.lcssa253
  store i32 %or, i32* %arrayidx.lcssa, align 4, !tbaa !6
  %arrayidx23 = getelementptr inbounds float*, float** %mean, i64 %indvars.iv303
  %8 = bitcast float** %arrayidx23 to i8**
  %9 = load i8*, i8** %8, align 8, !tbaa !8
  %idxprom24 = sext i32 %r.0.lcssa to i64
  %arrayidx25 = getelementptr inbounds float*, float** %data, i64 %idxprom24
  %10 = bitcast float** %arrayidx25 to i8**
  %11 = load i8*, i8** %10, align 8, !tbaa !8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %9, i8* align 1 %11, i64 %mul, i1 false)
  %indvars.iv.next304 = add nuw nsw i64 %indvars.iv303, 1
  %exitcond306 = icmp eq i64 %indvars.iv.next304, %wide.trip.count305
  br i1 %exitcond306, label %for.end, label %for.body

for.end:                                          ; preds = %while.end, %cond.end
  call void @ckd_free(i8* %call) #7
  %conv28 = sext i32 %vqrows to i64
  %call29 = call i8* @__ckd_calloc__(i64 %conv28, i64 4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32 352) #7
  %12 = bitcast i8* %call29 to i32*
  %conv30 = sext i32 %cols to i64
  %call31 = call i8* @__ckd_calloc__(i64 %conv30, i64 4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32 355) #7
  %13 = bitcast i8* %call31 to float*
  %call32 = call i32 @vector_mean(float* %13, float** %mean, i32 %vqrows, i32 %cols)
  %cmp35254 = icmp sgt i32 %rows, 0
  %t_cpu = getelementptr inbounds %struct.ptmr_t, %struct.ptmr_t* %tm, i64 0, i32 1
  %sub54 = add nsw i32 %maxiter, -1
  %t_cpu50 = getelementptr inbounds %struct.ptmr_t, %struct.ptmr_t* %tm, i64 0, i32 1
  %cmp68260 = icmp sgt i32 %vqrows, 0
  %cmp88262 = icmp sgt i32 %rows, 0
  %cmp72257 = icmp sgt i32 %cols, 0
  %cmp106266 = icmp sgt i32 %vqrows, 0
  %cmp119264 = icmp sgt i32 %cols, 0
  %mul145 = shl nsw i64 %conv30, 2
  %14 = zext i32 %cols to i64
  %15 = shl nuw nsw i64 %14, 2
  %wide.trip.count = zext i32 %rows to i64
  %wide.trip.count289 = zext i32 %vqrows to i64
  %wide.trip.count293 = zext i32 %rows to i64
  %wide.trip.count301 = zext i32 %vqrows to i64
  %wide.trip.count297 = zext i32 %cols to i64
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc151, %for.end
  %it.0 = phi i32 [ 0, %for.end ], [ %inc152, %for.inc151 ]
  %prev_sqerr.0 = phi double [ 0.000000e+00, %for.end ], [ %sqerr.0.lcssa, %for.inc151 ]
  br i1 %cmp35254, label %for.body37, label %for.end46

for.body37:                                       ; preds = %for.cond33, %for.body37
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body37 ], [ 0, %for.cond33 ]
  %sqerr.0255 = phi double [ %add43, %for.body37 ], [ 0.000000e+00, %for.cond33 ]
  %arrayidx39 = getelementptr inbounds float*, float** %data, i64 %indvars.iv
  %16 = load float*, float** %arrayidx39, align 8, !tbaa !8
  %call40 = call i32 @vector_vqlabel(float* %16, float** %mean, i32 %vqrows, i32 %cols, double* nonnull %t)
  %arrayidx42 = getelementptr inbounds i32, i32* %map, i64 %indvars.iv
  store i32 %call40, i32* %arrayidx42, align 4, !tbaa !6
  %17 = load double, double* %t, align 8, !tbaa !10
  %add43 = fadd double %sqerr.0255, %17
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end46, label %for.body37

for.end46:                                        ; preds = %for.body37, %for.cond33
  %sqerr.0.lcssa = phi double [ 0.000000e+00, %for.cond33 ], [ %add43, %for.body37 ]
  call void @ptmr_stop(%struct.ptmr_t* nonnull %tm) #7
  %cmp47 = icmp eq i32 %it.0, 0
  br i1 %cmp47, label %if.then49, label %if.else

if.then49:                                        ; preds = %for.end46
  call void @_E__pr_info_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i64 368, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0)) #7
  %18 = load double, double* %t_cpu, align 8, !tbaa !12
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.7, i64 0, i64 0), i32 %it.0, double %18, double %sqerr.0.lcssa) #7
  br label %if.end51

if.else:                                          ; preds = %for.end46
  call void @_E__pr_info_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i64 370, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0)) #7
  %19 = load double, double* %t_cpu50, align 8, !tbaa !12
  %sub = fsub double %prev_sqerr.0, %sqerr.0.lcssa
  %div = fdiv double %sub, %prev_sqerr.0
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.8, i64 0, i64 0), i32 %it.0, double %19, double %sqerr.0.lcssa, double %div) #7
  br label %if.end51

if.end51:                                         ; preds = %if.else, %if.then49
  %cmp52 = fcmp une double %sqerr.0.lcssa, 0.000000e+00
  %cmp55 = icmp slt i32 %it.0, %sub54
  %or.cond252 = and i1 %cmp55, %cmp52
  br i1 %or.cond252, label %lor.lhs.false57, label %for.end153

lor.lhs.false57:                                  ; preds = %if.end51
  br i1 %cmp47, label %if.end66, label %land.lhs.true60

land.lhs.true60:                                  ; preds = %lor.lhs.false57
  %sub61 = fsub double %prev_sqerr.0, %sqerr.0.lcssa
  %div62 = fdiv double %sub61, %prev_sqerr.0
  %cmp63 = fcmp olt double %div62, %epsilon
  br i1 %cmp63, label %for.end153, label %if.end66

if.end66:                                         ; preds = %lor.lhs.false57, %land.lhs.true60
  call void @ptmr_start(%struct.ptmr_t* nonnull %tm) #7
  br i1 %cmp68260, label %for.cond71.preheader, label %for.cond87.preheader

for.cond87.preheader:                             ; preds = %for.end81, %if.end66
  br i1 %cmp88262, label %for.body90, label %for.cond105.preheader

for.cond71.preheader:                             ; preds = %if.end66, %for.end81
  %indvars.iv287 = phi i64 [ %indvars.iv.next288, %for.end81 ], [ 0, %if.end66 ]
  br i1 %cmp72257, label %for.end81.loopexit, label %for.end81

for.end81.loopexit:                               ; preds = %for.cond71.preheader
  %arrayidx76 = getelementptr inbounds float*, float** %mean, i64 %indvars.iv287
  %20 = bitcast float** %arrayidx76 to i8**
  %21 = load i8*, i8** %20, align 8, !tbaa !8
  call void @llvm.memset.p0i8.i64(i8* align 4 %21, i8 0, i64 %15, i1 false)
  br label %for.end81

for.end81:                                        ; preds = %for.end81.loopexit, %for.cond71.preheader
  %arrayidx83 = getelementptr inbounds i32, i32* %12, i64 %indvars.iv287
  store i32 0, i32* %arrayidx83, align 4, !tbaa !6
  %indvars.iv.next288 = add nuw nsw i64 %indvars.iv287, 1
  %exitcond290 = icmp eq i64 %indvars.iv.next288, %wide.trip.count289
  br i1 %exitcond290, label %for.cond87.preheader, label %for.cond71.preheader

for.cond105.preheader:                            ; preds = %for.body90, %for.cond87.preheader
  br i1 %cmp106266, label %for.body108, label %for.inc151

for.body90:                                       ; preds = %for.cond87.preheader, %for.body90
  %indvars.iv291 = phi i64 [ %indvars.iv.next292, %for.body90 ], [ 0, %for.cond87.preheader ]
  %arrayidx92 = getelementptr inbounds i32, i32* %map, i64 %indvars.iv291
  %22 = load i32, i32* %arrayidx92, align 4, !tbaa !6
  %idxprom93 = sext i32 %22 to i64
  %arrayidx94 = getelementptr inbounds float*, float** %mean, i64 %idxprom93
  %23 = load float*, float** %arrayidx94, align 8, !tbaa !8
  %arrayidx96 = getelementptr inbounds float*, float** %data, i64 %indvars.iv291
  %24 = load float*, float** %arrayidx96, align 8, !tbaa !8
  call void @vector_accum(float* %23, float* %24, i32 %cols)
  %25 = load i32, i32* %arrayidx92, align 4, !tbaa !6
  %idxprom99 = sext i32 %25 to i64
  %arrayidx100 = getelementptr inbounds i32, i32* %12, i64 %idxprom99
  %26 = load i32, i32* %arrayidx100, align 4, !tbaa !6
  %inc101 = add nsw i32 %26, 1
  store i32 %inc101, i32* %arrayidx100, align 4, !tbaa !6
  %indvars.iv.next292 = add nuw nsw i64 %indvars.iv291, 1
  %exitcond294 = icmp eq i64 %indvars.iv.next292, %wide.trip.count293
  br i1 %exitcond294, label %for.cond105.preheader, label %for.body90

for.body108:                                      ; preds = %for.cond105.preheader, %for.inc148
  %indvars.iv299 = phi i64 [ %indvars.iv.next300, %for.inc148 ], [ 0, %for.cond105.preheader ]
  %arrayidx110 = getelementptr inbounds i32, i32* %12, i64 %indvars.iv299
  %27 = load i32, i32* %arrayidx110, align 4, !tbaa !6
  %cmp111 = icmp sgt i32 %27, 1
  br i1 %cmp111, label %if.then113, label %if.else136

if.then113:                                       ; preds = %for.body108
  %conv116 = sitofp i32 %27 to double
  %div117 = fdiv double 1.000000e+00, %conv116
  store double %div117, double* %t, align 8, !tbaa !10
  br i1 %cmp119264, label %for.body121.lr.ph, label %for.inc148

for.body121.lr.ph:                                ; preds = %if.then113
  %arrayidx123 = getelementptr inbounds float*, float** %mean, i64 %indvars.iv299
  %28 = load float*, float** %arrayidx123, align 8, !tbaa !8
  br label %for.body121

for.body121:                                      ; preds = %for.body121, %for.body121.lr.ph
  %indvars.iv295 = phi i64 [ 0, %for.body121.lr.ph ], [ %indvars.iv.next296, %for.body121 ]
  %arrayidx125 = getelementptr inbounds float, float* %28, i64 %indvars.iv295
  %29 = load float, float* %arrayidx125, align 4, !tbaa !2
  %conv126 = fpext float %29 to double
  %mul127 = fmul double %div117, %conv126
  %conv128 = fptrunc double %mul127 to float
  store float %conv128, float* %arrayidx125, align 4, !tbaa !2
  %indvars.iv.next296 = add nuw nsw i64 %indvars.iv295, 1
  %exitcond298 = icmp eq i64 %indvars.iv.next296, %wide.trip.count297
  br i1 %exitcond298, label %for.inc148, label %for.body121

if.else136:                                       ; preds = %for.body108
  %cmp139 = icmp eq i32 %27, 0
  br i1 %cmp139, label %if.then141, label %for.inc148

if.then141:                                       ; preds = %if.else136
  call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i64 398, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i64 0, i64 0)) #7
  %30 = trunc i64 %indvars.iv299 to i32
  call void (i8*, ...) @_E__pr_warn(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.10, i64 0, i64 0), i32 %it.0, i32 %30) #7
  %arrayidx143 = getelementptr inbounds float*, float** %mean, i64 %indvars.iv299
  %31 = bitcast float** %arrayidx143 to i8**
  %32 = load i8*, i8** %31, align 8, !tbaa !8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %32, i8* align 4 %call31, i64 %mul145, i1 false)
  br label %for.inc148

for.inc148:                                       ; preds = %for.body121, %if.then113, %if.then141, %if.else136
  %indvars.iv.next300 = add nuw nsw i64 %indvars.iv299, 1
  %exitcond302 = icmp eq i64 %indvars.iv.next300, %wide.trip.count301
  br i1 %exitcond302, label %for.inc151, label %for.body108

for.inc151:                                       ; preds = %for.inc148, %for.cond105.preheader
  %inc152 = add nuw nsw i32 %it.0, 1
  br label %for.cond33

for.end153:                                       ; preds = %if.end51, %land.lhs.true60
  call void @ckd_free(i8* %call29) #7
  call void @ckd_free(i8* %call31) #7
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %1) #7
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #7
  ret double %sqerr.0.lcssa
}

declare dso_local i8* @__ckd_calloc__(i64, i64, i8*, i32) local_unnamed_addr #6

declare dso_local void @ptmr_init(%struct.ptmr_t*) local_unnamed_addr #6

declare dso_local void @ptmr_start(%struct.ptmr_t*) local_unnamed_addr #6

; Function Attrs: nounwind
declare dso_local void @srandom(i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i64 @random() local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #1

declare dso_local void @ckd_free(i8*) local_unnamed_addr #6

declare dso_local void @ptmr_stop(%struct.ptmr_t*) local_unnamed_addr #6

declare dso_local void @_E__pr_info_header(i8*, i64, i8*) local_unnamed_addr #6

declare dso_local void @_E__pr_info(i8*, ...) local_unnamed_addr #6

declare dso_local void @_E__pr_header(i8*, i64, i8*) local_unnamed_addr #6

declare dso_local void @_E__pr_warn(i8*, ...) local_unnamed_addr #6

; Function Attrs: nounwind uwtable
define dso_local double @vector_pdf_entropy(float* nocapture readonly %p, i32 %len) local_unnamed_addr #2 {
entry:
  %cmp20 = icmp sgt i32 %len, 0
  br i1 %cmp20, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %sum.021 = phi double [ 0.000000e+00, %for.body.preheader ], [ %sum.1, %for.inc ]
  %arrayidx = getelementptr inbounds float, float* %p, i64 %indvars.iv
  %0 = load float, float* %arrayidx, align 4, !tbaa !2
  %conv = fpext float %0 to double
  %cmp1 = fcmp ogt float %0, 0.000000e+00
  br i1 %cmp1, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %call = tail call double @log(double %conv) #7
  %mul = fmul double %call, %conv
  %sub = fsub double %sum.021, %mul
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %sum.1 = phi double [ %sub, %if.then ], [ %sum.021, %for.body ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc, %entry
  %sum.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %sum.1, %for.inc ]
  %div = fdiv double %sum.0.lcssa, 0x3FE62E42FEFA39EF
  ret double %div
}

; Function Attrs: nounwind uwtable
define dso_local double @vector_pdf_cross_entropy(float* nocapture readonly %p1, float* nocapture readonly %p2, i32 %len) local_unnamed_addr #2 {
entry:
  %cmp19 = icmp sgt i32 %len, 0
  br i1 %cmp19, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %len to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %sum.020 = phi double [ 0.000000e+00, %for.body.preheader ], [ %sum.1, %for.inc ]
  %arrayidx = getelementptr inbounds float, float* %p2, i64 %indvars.iv
  %0 = load float, float* %arrayidx, align 4, !tbaa !2
  %cmp1 = fcmp ogt float %0, 0.000000e+00
  br i1 %cmp1, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %conv = fpext float %0 to double
  %arrayidx4 = getelementptr inbounds float, float* %p1, i64 %indvars.iv
  %1 = load float, float* %arrayidx4, align 4, !tbaa !2
  %conv5 = fpext float %1 to double
  %call = tail call double @log(double %conv) #7
  %mul = fmul double %call, %conv5
  %sub = fsub double %sum.020, %mul
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %sum.1 = phi double [ %sub, %if.then ], [ %sum.020, %for.body ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc, %entry
  %sum.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %sum.1, %for.inc ]
  %div = fdiv double %sum.0.lcssa, 0x3FE62E42FEFA39EF
  ret double %div
}

; Function Attrs: nounwind uwtable
define dso_local void @vector_gautbl_alloc(%struct.vector_gautbl_t* nocapture %gautbl, i32 %n_gau, i32 %veclen) local_unnamed_addr #2 {
entry:
  %n_gau1 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 0
  store i32 %n_gau, i32* %n_gau1, align 8, !tbaa !14
  %veclen2 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 1
  store i32 %veclen, i32* %veclen2, align 4, !tbaa !16
  %call = tail call i8** @__ckd_calloc_2d__(i32 %n_gau, i32 %veclen, i32 4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32 447) #7
  %mean = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 2
  %0 = bitcast float*** %mean to i8***
  store i8** %call, i8*** %0, align 8, !tbaa !17
  %call3 = tail call i8** @__ckd_calloc_2d__(i32 %n_gau, i32 %veclen, i32 4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32 448) #7
  %var = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 3
  %1 = bitcast float*** %var to i8***
  store i8** %call3, i8*** %1, align 8, !tbaa !18
  %conv = sext i32 %n_gau to i64
  %call4 = tail call i8* @__ckd_calloc__(i64 %conv, i64 4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i32 449) #7
  %lrd = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 4
  %2 = bitcast float** %lrd to i8**
  store i8* %call4, i8** %2, align 8, !tbaa !19
  %call5 = tail call double @logs3_to_log(i32 -939524096) #7
  %distfloor = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 5
  store double %call5, double* %distfloor, align 8, !tbaa !20
  ret void
}

declare dso_local i8** @__ckd_calloc_2d__(i32, i32, i32, i8*, i32) local_unnamed_addr #6

declare dso_local double @logs3_to_log(i32) local_unnamed_addr #6

; Function Attrs: nounwind uwtable
define dso_local void @vector_gautbl_free(%struct.vector_gautbl_t* nocapture readonly %gautbl) local_unnamed_addr #2 {
entry:
  %mean = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 2
  %0 = bitcast float*** %mean to i8***
  %1 = load i8**, i8*** %0, align 8, !tbaa !17
  tail call void @ckd_free_2d(i8** %1) #7
  %var = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 3
  %2 = bitcast float*** %var to i8***
  %3 = load i8**, i8*** %2, align 8, !tbaa !18
  tail call void @ckd_free_2d(i8** %3) #7
  %lrd = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 4
  %4 = bitcast float** %lrd to i8**
  %5 = load i8*, i8** %4, align 8, !tbaa !19
  tail call void @ckd_free(i8* %5) #7
  ret void
}

declare dso_local void @ckd_free_2d(i8**) local_unnamed_addr #6

; Function Attrs: norecurse nounwind uwtable
define dso_local void @vector_gautbl_var_floor(%struct.vector_gautbl_t* nocapture readonly %gautbl, double %floor) local_unnamed_addr #0 {
entry:
  %n_gau = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 0
  %0 = load i32, i32* %n_gau, align 8, !tbaa !14
  %cmp6 = icmp sgt i32 %0, 0
  br i1 %cmp6, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %var = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 3
  %veclen = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 1
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %1 = load float**, float*** %var, align 8, !tbaa !18
  %arrayidx = getelementptr inbounds float*, float** %1, i64 %indvars.iv
  %2 = load float*, float** %arrayidx, align 8, !tbaa !8
  %3 = load i32, i32* %veclen, align 4, !tbaa !16
  tail call void @vector_floor(float* %2, i32 %3, double %floor)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %4 = load i32, i32* %n_gau, align 8, !tbaa !14
  %5 = sext i32 %4 to i64
  %cmp = icmp slt i64 %indvars.iv.next, %5
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @vector_gautbl_maha_precomp(%struct.vector_gautbl_t* nocapture readonly %gautbl) local_unnamed_addr #2 {
entry:
  %n_gau = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 0
  %0 = load i32, i32* %n_gau, align 8, !tbaa !14
  %cmp10 = icmp sgt i32 %0, 0
  br i1 %cmp10, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %var = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 3
  %veclen = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 1
  %lrd = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 4
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %1 = load float**, float*** %var, align 8, !tbaa !18
  %arrayidx = getelementptr inbounds float*, float** %1, i64 %indvars.iv
  %2 = load float*, float** %arrayidx, align 8, !tbaa !8
  %3 = load i32, i32* %veclen, align 4, !tbaa !16
  %call = tail call double @vector_maha_precomp(float* %2, i32 %3)
  %conv = fptrunc double %call to float
  %4 = load float*, float** %lrd, align 8, !tbaa !19
  %arrayidx2 = getelementptr inbounds float, float* %4, i64 %indvars.iv
  store float %conv, float* %arrayidx2, align 4, !tbaa !2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = load i32, i32* %n_gau, align 8, !tbaa !14
  %6 = sext i32 %5 to i64
  %cmp = icmp slt i64 %indvars.iv.next, %6
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @vector_gautbl_eval_logs3(%struct.vector_gautbl_t* nocapture readonly %gautbl, i32 %offset, i32 %count, float* nocapture readonly %x, i32* nocapture %score) local_unnamed_addr #2 {
entry:
  %call = tail call double @log_to_logs3_factor() #7
  %add = add nsw i32 %count, %offset
  %veclen1 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 1
  %0 = load i32, i32* %veclen1, align 4, !tbaa !16
  %sub = add nsw i32 %add, -1
  %cmp195 = icmp sgt i32 %sub, %offset
  br i1 %cmp195, label %for.body.lr.ph, label %for.end66

for.body.lr.ph:                                   ; preds = %entry
  %mean = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 2
  %1 = load float**, float*** %mean, align 8, !tbaa !17
  %var = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 3
  %2 = load float**, float*** %var, align 8, !tbaa !18
  %lrd = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 4
  %3 = load float*, float** %lrd, align 8, !tbaa !19
  %cmp20189 = icmp sgt i32 %0, 0
  %distfloor = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 5
  %4 = load double, double* %distfloor, align 8, !tbaa !20
  %5 = sext i32 %offset to i64
  %6 = sext i32 %sub to i64
  %7 = add i32 %count, -2
  %8 = and i32 %7, -2
  %9 = add i32 %8, %offset
  %wide.trip.count200 = zext i32 %0 to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.end
  %indvars.iv202 = phi i64 [ %5, %for.body.lr.ph ], [ %indvars.iv.next203, %for.end ]
  %arrayidx = getelementptr inbounds float*, float** %1, i64 %indvars.iv202
  %10 = load float*, float** %arrayidx, align 8, !tbaa !8
  %11 = add nsw i64 %indvars.iv202, 1
  %arrayidx5 = getelementptr inbounds float*, float** %1, i64 %11
  %12 = load float*, float** %arrayidx5, align 8, !tbaa !8
  %arrayidx7 = getelementptr inbounds float*, float** %2, i64 %indvars.iv202
  %13 = load float*, float** %arrayidx7, align 8, !tbaa !8
  %arrayidx11 = getelementptr inbounds float*, float** %2, i64 %11
  %14 = load float*, float** %arrayidx11, align 8, !tbaa !8
  %arrayidx13 = getelementptr inbounds float, float* %3, i64 %indvars.iv202
  %15 = load float, float* %arrayidx13, align 4, !tbaa !2
  %conv = fpext float %15 to double
  %arrayidx17 = getelementptr inbounds float, float* %3, i64 %11
  %16 = load float, float* %arrayidx17, align 4, !tbaa !2
  %conv18 = fpext float %16 to double
  br i1 %cmp20189, label %for.body22, label %for.end

for.body22:                                       ; preds = %for.body, %for.body22
  %indvars.iv198 = phi i64 [ %indvars.iv.next199, %for.body22 ], [ 0, %for.body ]
  %dval2.0191 = phi double [ %sub45, %for.body22 ], [ %conv18, %for.body ]
  %dval1.0190 = phi double [ %sub33, %for.body22 ], [ %conv, %for.body ]
  %arrayidx24 = getelementptr inbounds float, float* %x, i64 %indvars.iv198
  %17 = load float, float* %arrayidx24, align 4, !tbaa !2
  %arrayidx26 = getelementptr inbounds float, float* %10, i64 %indvars.iv198
  %18 = load float, float* %arrayidx26, align 4, !tbaa !2
  %sub27 = fsub float %17, %18
  %conv28 = fpext float %sub27 to double
  %mul = fmul double %conv28, %conv28
  %arrayidx30 = getelementptr inbounds float, float* %13, i64 %indvars.iv198
  %19 = load float, float* %arrayidx30, align 4, !tbaa !2
  %conv31 = fpext float %19 to double
  %mul32 = fmul double %mul, %conv31
  %sub33 = fsub double %dval1.0190, %mul32
  %arrayidx37 = getelementptr inbounds float, float* %12, i64 %indvars.iv198
  %20 = load float, float* %arrayidx37, align 4, !tbaa !2
  %sub38 = fsub float %17, %20
  %conv39 = fpext float %sub38 to double
  %mul40 = fmul double %conv39, %conv39
  %arrayidx42 = getelementptr inbounds float, float* %14, i64 %indvars.iv198
  %21 = load float, float* %arrayidx42, align 4, !tbaa !2
  %conv43 = fpext float %21 to double
  %mul44 = fmul double %mul40, %conv43
  %sub45 = fsub double %dval2.0191, %mul44
  %indvars.iv.next199 = add nuw nsw i64 %indvars.iv198, 1
  %exitcond201 = icmp eq i64 %indvars.iv.next199, %wide.trip.count200
  br i1 %exitcond201, label %for.end, label %for.body22

for.end:                                          ; preds = %for.body22, %for.body
  %dval1.0.lcssa = phi double [ %conv, %for.body ], [ %sub33, %for.body22 ]
  %dval2.0.lcssa = phi double [ %conv18, %for.body ], [ %sub45, %for.body22 ]
  %cmp46 = fcmp olt double %dval1.0.lcssa, %4
  %dval1.1 = select i1 %cmp46, double %4, double %dval1.0.lcssa
  %cmp50 = fcmp olt double %dval2.0.lcssa, %4
  %dval2.1 = select i1 %cmp50, double %4, double %dval2.0.lcssa
  %mul55 = fmul double %call, %dval1.1
  %conv56 = fptosi double %mul55 to i32
  %arrayidx58 = getelementptr inbounds i32, i32* %score, i64 %indvars.iv202
  store i32 %conv56, i32* %arrayidx58, align 4, !tbaa !6
  %mul59 = fmul double %call, %dval2.1
  %conv60 = fptosi double %mul59 to i32
  %arrayidx63 = getelementptr inbounds i32, i32* %score, i64 %11
  store i32 %conv60, i32* %arrayidx63, align 4, !tbaa !6
  %indvars.iv.next203 = add nsw i64 %indvars.iv202, 2
  %cmp = icmp slt i64 %indvars.iv.next203, %6
  br i1 %cmp, label %for.body, label %for.end66.loopexit

for.end66.loopexit:                               ; preds = %for.end
  %22 = add i32 %9, 2
  br label %for.end66

for.end66:                                        ; preds = %for.end66.loopexit, %entry
  %r.0.lcssa = phi i32 [ %offset, %entry ], [ %22, %for.end66.loopexit ]
  %cmp67 = icmp slt i32 %r.0.lcssa, %add
  br i1 %cmp67, label %if.then69, label %if.end109

if.then69:                                        ; preds = %for.end66
  %mean70 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 2
  %23 = load float**, float*** %mean70, align 8, !tbaa !17
  %idxprom71 = sext i32 %r.0.lcssa to i64
  %arrayidx72 = getelementptr inbounds float*, float** %23, i64 %idxprom71
  %24 = load float*, float** %arrayidx72, align 8, !tbaa !8
  %var73 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 3
  %25 = load float**, float*** %var73, align 8, !tbaa !18
  %arrayidx75 = getelementptr inbounds float*, float** %25, i64 %idxprom71
  %26 = load float*, float** %arrayidx75, align 8, !tbaa !8
  %lrd76 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 4
  %27 = load float*, float** %lrd76, align 8, !tbaa !19
  %arrayidx78 = getelementptr inbounds float, float* %27, i64 %idxprom71
  %28 = load float, float* %arrayidx78, align 4, !tbaa !2
  %conv79 = fpext float %28 to double
  %cmp81186 = icmp sgt i32 %0, 0
  br i1 %cmp81186, label %for.body83.preheader, label %for.end98

for.body83.preheader:                             ; preds = %if.then69
  %wide.trip.count = zext i32 %0 to i64
  br label %for.body83

for.body83:                                       ; preds = %for.body83, %for.body83.preheader
  %indvars.iv = phi i64 [ 0, %for.body83.preheader ], [ %indvars.iv.next, %for.body83 ]
  %dval1.2187 = phi double [ %conv79, %for.body83.preheader ], [ %sub95, %for.body83 ]
  %arrayidx85 = getelementptr inbounds float, float* %x, i64 %indvars.iv
  %29 = load float, float* %arrayidx85, align 4, !tbaa !2
  %arrayidx87 = getelementptr inbounds float, float* %24, i64 %indvars.iv
  %30 = load float, float* %arrayidx87, align 4, !tbaa !2
  %sub88 = fsub float %29, %30
  %conv89 = fpext float %sub88 to double
  %mul90 = fmul double %conv89, %conv89
  %arrayidx92 = getelementptr inbounds float, float* %26, i64 %indvars.iv
  %31 = load float, float* %arrayidx92, align 4, !tbaa !2
  %conv93 = fpext float %31 to double
  %mul94 = fmul double %mul90, %conv93
  %sub95 = fsub double %dval1.2187, %mul94
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end98, label %for.body83

for.end98:                                        ; preds = %for.body83, %if.then69
  %dval1.2.lcssa = phi double [ %conv79, %if.then69 ], [ %sub95, %for.body83 ]
  %distfloor99 = getelementptr inbounds %struct.vector_gautbl_t, %struct.vector_gautbl_t* %gautbl, i64 0, i32 5
  %32 = load double, double* %distfloor99, align 8, !tbaa !20
  %cmp100 = fcmp olt double %dval1.2.lcssa, %32
  %dval1.3 = select i1 %cmp100, double %32, double %dval1.2.lcssa
  %mul105 = fmul double %call, %dval1.3
  %conv106 = fptosi double %mul105 to i32
  %arrayidx108 = getelementptr inbounds i32, i32* %score, i64 %idxprom71
  store i32 %conv106, i32* %arrayidx108, align 4, !tbaa !6
  br label %if.end109

if.end109:                                        ; preds = %for.end98, %for.end66
  ret void
}

declare dso_local double @log_to_logs3_factor() local_unnamed_addr #6

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #7

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #1

attributes #0 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"float", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"any pointer", !4, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"double", !4, i64 0}
!12 = !{!13, !11, i64 8}
!13 = !{!"", !9, i64 0, !11, i64 8, !11, i64 16, !11, i64 24, !11, i64 32, !11, i64 40, !11, i64 48}
!14 = !{!15, !7, i64 0}
!15 = !{!"", !7, i64 0, !7, i64 4, !9, i64 8, !9, i64 16, !9, i64 24, !11, i64 32}
!16 = !{!15, !7, i64 4}
!17 = !{!15, !9, i64 8}
!18 = !{!15, !9, i64 16}
!19 = !{!15, !9, i64 24}
!20 = !{!15, !11, i64 32}
