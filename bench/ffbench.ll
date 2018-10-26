; ModuleID = 'ffbench.bc'
source_filename = "ffbench.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@main.nsize = internal global [3 x i32] zeroinitializer, align 4
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [28 x i8] c"Can't allocate data array.\0A\00", align 1
@.str.1 = private unnamed_addr constant [48 x i8] c"Wrong answer at (%d,%d)!  Expected %d, got %d.\0A\00", align 1
@.str.2 = private unnamed_addr constant [35 x i8] c"%d passes.  No errors in results.\0A\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"%d passes.  %d errors in results.\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  store i32 256, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @main.nsize, i64 0, i64 2), align 4, !tbaa !2
  store i32 256, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @main.nsize, i64 0, i64 1), align 4, !tbaa !2
  %call = tail call noalias i8* @malloc(i64 1048592) #4
  %0 = bitcast i8* %call to double*
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %1) #5
  tail call void @exit(i32 1) #6
  unreachable

if.end:                                           ; preds = %entry
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %call, i8 0, i64 1048592, i1 false)
  br label %for.cond7.preheader

for.cond7.preheader:                              ; preds = %for.inc22, %if.end
  %indvars.iv216 = phi i64 [ 0, %if.end ], [ %indvars.iv.next217, %for.inc22 ]
  %and220 = and i64 %indvars.iv216, 15
  %cmp11 = icmp eq i64 %and220, 8
  %3 = shl i64 %indvars.iv216, 8
  br label %for.body10

for.body10:                                       ; preds = %for.inc, %for.cond7.preheader
  %indvars.iv210 = phi i64 [ 0, %for.cond7.preheader ], [ %indvars.iv.next211, %for.inc ]
  %and13221 = and i64 %indvars.iv210, 15
  %cmp14 = icmp eq i64 %and13221, 8
  %or.cond = or i1 %cmp11, %cmp14
  br i1 %or.cond, label %if.then16, label %for.inc

if.then16:                                        ; preds = %for.body10
  %4 = add nuw nsw i64 %indvars.iv210, %3
  %5 = shl nuw nsw i64 %4, 1
  %6 = or i64 %5, 1
  %arrayidx = getelementptr inbounds double, double* %0, i64 %6
  store double 1.280000e+02, double* %arrayidx, align 8, !tbaa !8
  br label %for.inc

for.inc:                                          ; preds = %for.body10, %if.then16
  %indvars.iv.next211 = add nuw nsw i64 %indvars.iv210, 1
  %exitcond215 = icmp eq i64 %indvars.iv.next211, 256
  br i1 %exitcond215, label %for.inc22, label %for.body10

for.inc22:                                        ; preds = %for.inc
  %indvars.iv.next217 = add nuw nsw i64 %indvars.iv216, 1
  %exitcond219 = icmp eq i64 %indvars.iv.next217, 256
  br i1 %exitcond219, label %for.body28, label %for.cond7.preheader

for.body28:                                       ; preds = %for.inc22, %for.body28
  %i.1196 = phi i32 [ %inc30, %for.body28 ], [ 0, %for.inc22 ]
  tail call fastcc void @fourn(double* %0, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @main.nsize, i64 0, i64 0), i32 2, i32 1)
  tail call fastcc void @fourn(double* %0, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @main.nsize, i64 0, i64 0), i32 2, i32 -1)
  %inc30 = add nuw nsw i32 %i.1196, 1
  %exitcond209 = icmp eq i32 %inc30, 63
  br i1 %exitcond209, label %for.body36, label %for.body28

for.body36:                                       ; preds = %for.body28, %for.body36
  %indvars.iv206 = phi i64 [ %indvars.iv.next207, %for.body36 ], [ 1, %for.body28 ]
  %rmax.0192 = phi double [ %cond51, %for.body36 ], [ -1.000000e+10, %for.body28 ]
  %rmin.0191 = phi double [ %cond, %for.body36 ], [ 1.000000e+10, %for.body28 ]
  %arrayidx38 = getelementptr inbounds double, double* %0, i64 %indvars.iv206
  %7 = load double, double* %arrayidx38, align 8, !tbaa !8
  %cmp44 = fcmp ole double %7, %rmin.0191
  %cond = select i1 %cmp44, double %7, double %rmin.0191
  %cmp46 = fcmp ogt double %7, %rmax.0192
  %cond51 = select i1 %cmp46, double %7, double %rmax.0192
  %indvars.iv.next207 = add nuw nsw i64 %indvars.iv206, 2
  %cmp34 = icmp ult i64 %indvars.iv.next207, 65537
  br i1 %cmp34, label %for.body36, label %for.end66

for.end66:                                        ; preds = %for.body36
  %sub = fsub double %cond51, %cond
  %div = fdiv double 2.550000e+02, %sub
  br label %for.cond71.preheader

for.cond71.preheader:                             ; preds = %for.inc100, %for.end66
  %indvars.iv202 = phi i64 [ 0, %for.end66 ], [ %indvars.iv.next203, %for.inc100 ]
  %m.0189 = phi i32 [ 0, %for.end66 ], [ %m.2, %for.inc100 ]
  %8 = shl i64 %indvars.iv202, 8
  %and84222 = and i64 %indvars.iv202, 15
  %cmp85 = icmp eq i64 %and84222, 8
  %9 = trunc i64 %indvars.iv202 to i32
  br label %for.body74

for.body74:                                       ; preds = %for.inc97, %for.cond71.preheader
  %indvars.iv = phi i64 [ 0, %for.cond71.preheader ], [ %indvars.iv.next, %for.inc97 ]
  %m.1187 = phi i32 [ %m.0189, %for.cond71.preheader ], [ %m.2, %for.inc97 ]
  %10 = add nuw nsw i64 %indvars.iv, %8
  %11 = shl nuw nsw i64 %10, 1
  %12 = or i64 %11, 1
  %arrayidx80 = getelementptr inbounds double, double* %0, i64 %12
  %13 = load double, double* %arrayidx80, align 8, !tbaa !8
  %sub81 = fsub double %13, %cond
  %mul82 = fmul double %div, %sub81
  %conv83 = fptosi double %mul82 to i32
  %and87223 = and i64 %indvars.iv, 15
  %cmp88 = icmp eq i64 %and87223, 8
  %14 = or i1 %cmp85, %cmp88
  %cond90 = select i1 %14, i32 255, i32 0
  %cmp91 = icmp eq i32 %cond90, %conv83
  br i1 %cmp91, label %for.inc97, label %if.then93

if.then93:                                        ; preds = %for.body74
  %inc94 = add nsw i32 %m.1187, 1
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %16 = trunc i64 %indvars.iv to i32
  %call95 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i64 0, i64 0), i32 %9, i32 %16, i32 %cond90, i32 %conv83) #5
  br label %for.inc97

for.inc97:                                        ; preds = %for.body74, %if.then93
  %m.2 = phi i32 [ %inc94, %if.then93 ], [ %m.1187, %for.body74 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 256
  br i1 %exitcond, label %for.inc100, label %for.body74

for.inc100:                                       ; preds = %for.inc97
  %indvars.iv.next203 = add nuw nsw i64 %indvars.iv202, 1
  %exitcond205 = icmp eq i64 %indvars.iv.next203, 256
  br i1 %exitcond205, label %for.end102, label %for.cond71.preheader

for.end102:                                       ; preds = %for.inc100
  %cmp103 = icmp eq i32 %m.2, 0
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  br i1 %cmp103, label %if.then105, label %if.else

if.then105:                                       ; preds = %for.end102
  %call106 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.2, i64 0, i64 0), i32 63) #5
  br label %if.end108

if.else:                                          ; preds = %for.end102
  %call107 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0), i32 63, i32 %m.2) #5
  br label %if.end108

if.end108:                                        ; preds = %if.else, %if.then105
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) local_unnamed_addr #1

; Function Attrs: nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #3

; Function Attrs: nounwind uwtable
define internal fastcc void @fourn(double* nocapture %data, i32* nocapture readonly %nn, i32 %ndim, i32 %isign) unnamed_addr #0 {
entry:
  %cmp287 = icmp slt i32 %ndim, 1
  br i1 %cmp287, label %for.end137, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %0 = add i32 %ndim, 1
  %wide.trip.count = zext i32 %0 to i64
  br label %for.body

for.cond1.preheader:                              ; preds = %for.body
  %cmp2284 = icmp sgt i32 %ndim, 0
  br i1 %cmp2284, label %for.body3.lr.ph, label %for.end137

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %conv = sitofp i32 %isign to double
  %mul59 = fmul double %conv, 0x401921FB54442D1C
  %1 = sext i32 %ndim to i64
  br label %for.body3

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv307 = phi i64 [ 1, %for.body.preheader ], [ %indvars.iv.next308, %for.body ]
  %ntot.0289 = phi i32 [ 1, %for.body.preheader ], [ %mul, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %nn, i64 %indvars.iv307
  %2 = load i32, i32* %arrayidx, align 4, !tbaa !2
  %mul = mul nsw i32 %2, %ntot.0289
  %indvars.iv.next308 = add nuw nsw i64 %indvars.iv307, 1
  %exitcond = icmp eq i64 %indvars.iv.next308, %wide.trip.count
  br i1 %exitcond, label %for.cond1.preheader, label %for.body

for.body3:                                        ; preds = %for.body3.lr.ph, %while.end134
  %indvars.iv305 = phi i64 [ %1, %for.body3.lr.ph ], [ %indvars.iv.next306, %while.end134 ]
  %nprev.0286 = phi i32 [ 1, %for.body3.lr.ph ], [ %mul6, %while.end134 ]
  %arrayidx5 = getelementptr inbounds i32, i32* %nn, i64 %indvars.iv305
  %3 = load i32, i32* %arrayidx5, align 4, !tbaa !2
  %mul6 = mul nsw i32 %3, %nprev.0286
  %div = sdiv i32 %mul, %mul6
  %shl = shl i32 %nprev.0286, 1
  %mul7 = mul nsw i32 %3, %shl
  %mul8 = mul nsw i32 %mul7, %div
  %cmp10271 = icmp slt i32 %mul7, 1
  br i1 %cmp10271, label %while.cond55.preheader, label %for.body11.preheader

for.body11.preheader:                             ; preds = %for.body3
  %4 = sext i32 %shl to i64
  %5 = shl i32 %nprev.0286, 1
  %6 = mul i32 %5, %3
  %7 = sext i32 %6 to i64
  %8 = sext i32 %mul8 to i64
  br label %for.body11

while.cond55.preheader:                           ; preds = %while.end, %for.body3
  %cmp56282 = icmp slt i32 %shl, %mul7
  br i1 %cmp56282, label %while.body57.preheader, label %while.end134

while.body57.preheader:                           ; preds = %while.cond55.preheader
  %9 = sext i32 %shl to i64
  %10 = sext i32 %mul8 to i64
  br label %while.body57

for.body11:                                       ; preds = %for.body11.preheader, %while.end
  %indvars.iv = phi i64 [ 1, %for.body11.preheader ], [ %indvars.iv.next, %while.end ]
  %i2.0273 = phi i32 [ 1, %for.body11.preheader ], [ %add53, %while.end ]
  %i2rev.0272 = phi i32 [ 1, %for.body11.preheader ], [ %add51, %while.end ]
  %cmp12 = icmp sgt i32 %i2rev.0272, %i2.0273
  br i1 %cmp12, label %for.cond13.preheader, label %while.cond.preheader

for.cond13.preheader:                             ; preds = %for.body11
  %add = add nsw i32 %i2.0273, %shl
  %sub = add nsw i32 %add, -2
  %cmp14269 = icmp sgt i32 %i2.0273, %sub
  br i1 %cmp14269, label %while.cond.preheader, label %for.cond16.preheader.lr.ph

for.cond16.preheader.lr.ph:                       ; preds = %for.cond13.preheader
  %add19 = sub i32 %i2rev.0272, %i2.0273
  br label %for.cond16.preheader

for.cond16.preheader:                             ; preds = %for.cond16.preheader.lr.ph, %for.inc44
  %indvars.iv291 = phi i64 [ %indvars.iv, %for.cond16.preheader.lr.ph ], [ %indvars.iv.next292, %for.inc44 ]
  %i1.0270 = phi i32 [ %i2.0273, %for.cond16.preheader.lr.ph ], [ %add45, %for.inc44 ]
  %cmp17267 = icmp sgt i32 %i1.0270, %mul8
  br i1 %cmp17267, label %for.inc44, label %for.body18

for.body18:                                       ; preds = %for.cond16.preheader, %for.body18
  %indvars.iv293 = phi i64 [ %indvars.iv.next294, %for.body18 ], [ %indvars.iv291, %for.cond16.preheader ]
  %11 = trunc i64 %indvars.iv293 to i32
  %sub20 = add i32 %add19, %11
  %arrayidx22 = getelementptr inbounds double, double* %data, i64 %indvars.iv293
  %12 = bitcast double* %arrayidx22 to i64*
  %13 = load i64, i64* %12, align 8, !tbaa !8
  %idxprom23 = sext i32 %sub20 to i64
  %arrayidx24 = getelementptr inbounds double, double* %data, i64 %idxprom23
  %14 = bitcast double* %arrayidx24 to i64*
  %15 = load i64, i64* %14, align 8, !tbaa !8
  store i64 %15, i64* %12, align 8, !tbaa !8
  store i64 %13, i64* %14, align 8, !tbaa !8
  %16 = add nsw i64 %indvars.iv293, 1
  %arrayidx31 = getelementptr inbounds double, double* %data, i64 %16
  %17 = bitcast double* %arrayidx31 to i64*
  %18 = load i64, i64* %17, align 8, !tbaa !8
  %add32 = add nsw i32 %sub20, 1
  %idxprom33 = sext i32 %add32 to i64
  %arrayidx34 = getelementptr inbounds double, double* %data, i64 %idxprom33
  %19 = bitcast double* %arrayidx34 to i64*
  %20 = load i64, i64* %19, align 8, !tbaa !8
  store i64 %20, i64* %17, align 8, !tbaa !8
  store i64 %18, i64* %19, align 8, !tbaa !8
  %indvars.iv.next294 = add i64 %indvars.iv293, %7
  %cmp17 = icmp sgt i64 %indvars.iv.next294, %8
  br i1 %cmp17, label %for.inc44, label %for.body18

for.inc44:                                        ; preds = %for.body18, %for.cond16.preheader
  %add45 = add nsw i32 %i1.0270, 2
  %cmp14 = icmp sgt i32 %add45, %sub
  %indvars.iv.next292 = add i64 %indvars.iv291, 2
  br i1 %cmp14, label %while.cond.preheader, label %for.cond16.preheader

while.cond.preheader:                             ; preds = %for.inc44, %for.cond13.preheader, %for.body11
  br label %while.cond

while.cond:                                       ; preds = %while.cond.preheader, %while.cond
  %ibit.0.in = phi i32 [ %ibit.0, %while.cond ], [ %mul7, %while.cond.preheader ]
  %i2rev.1 = phi i32 [ %sub49, %while.cond ], [ %i2rev.0272, %while.cond.preheader ]
  %ibit.0 = ashr i32 %ibit.0.in, 1
  %cmp47 = icmp sge i32 %ibit.0, %shl
  %cmp48 = icmp sgt i32 %i2rev.1, %ibit.0
  %spec.select = and i1 %cmp48, %cmp47
  %sub49 = sub nsw i32 %i2rev.1, %ibit.0
  br i1 %spec.select, label %while.cond, label %while.end

while.end:                                        ; preds = %while.cond
  %add51 = add nsw i32 %i2rev.1, %ibit.0
  %add53 = add nsw i32 %i2.0273, %shl
  %cmp10 = icmp sgt i32 %add53, %mul7
  %indvars.iv.next = add nsw i64 %indvars.iv, %4
  br i1 %cmp10, label %while.cond55.preheader, label %for.body11

while.cond55.loopexit:                            ; preds = %for.end122, %while.body57
  %cmp56 = icmp slt i32 %shl58, %mul7
  br i1 %cmp56, label %while.body57, label %while.end134

while.body57:                                     ; preds = %while.body57.preheader, %while.cond55.loopexit
  %ifp1.0283 = phi i32 [ %shl58, %while.cond55.loopexit ], [ %shl, %while.body57.preheader ]
  %shl58 = shl i32 %ifp1.0283, 1
  %div60 = sdiv i32 %shl58, %shl
  %conv61 = sitofp i32 %div60 to double
  %div62 = fdiv double %mul59, %conv61
  %mul63 = fmul double %div62, 5.000000e-01
  %call = tail call double @sin(double %mul63) #4
  %mul64 = fmul double %call, -2.000000e+00
  %mul65 = fmul double %call, %mul64
  %call66 = tail call double @sin(double %div62) #4
  %cmp68278 = icmp slt i32 %ifp1.0283, 1
  br i1 %cmp68278, label %while.cond55.loopexit, label %for.cond71.preheader.preheader

for.cond71.preheader.preheader:                   ; preds = %while.body57
  %21 = sext i32 %shl58 to i64
  %22 = sext i32 %ifp1.0283 to i64
  br label %for.cond71.preheader

for.cond71.preheader:                             ; preds = %for.cond71.preheader.preheader, %for.end122
  %indvars.iv296 = phi i64 [ 1, %for.cond71.preheader.preheader ], [ %indvars.iv.next297, %for.end122 ]
  %wr.0281 = phi double [ 1.000000e+00, %for.cond71.preheader.preheader ], [ %add126, %for.end122 ]
  %wi.0280 = phi double [ 0.000000e+00, %for.cond71.preheader.preheader ], [ %add130, %for.end122 ]
  %i3.1279 = phi i32 [ 1, %for.cond71.preheader.preheader ], [ %add72, %for.end122 ]
  %add72 = add nsw i32 %i3.1279, %shl
  %sub73 = add nsw i32 %add72, -2
  %cmp74276 = icmp sgt i32 %i3.1279, %sub73
  br i1 %cmp74276, label %for.end122, label %for.cond77.preheader

for.cond77.preheader:                             ; preds = %for.cond71.preheader, %for.inc120
  %indvars.iv298 = phi i64 [ %indvars.iv.next299, %for.inc120 ], [ %indvars.iv296, %for.cond71.preheader ]
  %i1.1277 = phi i32 [ %add121, %for.inc120 ], [ %i3.1279, %for.cond71.preheader ]
  %cmp78274 = icmp sgt i32 %i1.1277, %mul8
  br i1 %cmp78274, label %for.inc120, label %for.body80

for.body80:                                       ; preds = %for.cond77.preheader, %for.body80
  %indvars.iv300 = phi i64 [ %indvars.iv.next301, %for.body80 ], [ %indvars.iv298, %for.cond77.preheader ]
  %23 = add nsw i64 %indvars.iv300, %22
  %arrayidx83 = getelementptr inbounds double, double* %data, i64 %23
  %24 = load double, double* %arrayidx83, align 8, !tbaa !8
  %mul84 = fmul double %wr.0281, %24
  %25 = add nsw i64 %23, 1
  %arrayidx87 = getelementptr inbounds double, double* %data, i64 %25
  %26 = load double, double* %arrayidx87, align 8, !tbaa !8
  %mul88 = fmul double %wi.0280, %26
  %sub89 = fsub double %mul84, %mul88
  %mul93 = fmul double %wr.0281, %26
  %mul96 = fmul double %wi.0280, %24
  %add97 = fadd double %mul96, %mul93
  %arrayidx99 = getelementptr inbounds double, double* %data, i64 %indvars.iv300
  %27 = load double, double* %arrayidx99, align 8, !tbaa !8
  %sub100 = fsub double %27, %sub89
  store double %sub100, double* %arrayidx83, align 8, !tbaa !8
  %28 = add nsw i64 %indvars.iv300, 1
  %arrayidx105 = getelementptr inbounds double, double* %data, i64 %28
  %29 = load double, double* %arrayidx105, align 8, !tbaa !8
  %sub106 = fsub double %29, %add97
  store double %sub106, double* %arrayidx87, align 8, !tbaa !8
  %30 = load double, double* %arrayidx99, align 8, !tbaa !8
  %add112 = fadd double %sub89, %30
  store double %add112, double* %arrayidx99, align 8, !tbaa !8
  %31 = load double, double* %arrayidx105, align 8, !tbaa !8
  %add116 = fadd double %add97, %31
  store double %add116, double* %arrayidx105, align 8, !tbaa !8
  %indvars.iv.next301 = add i64 %indvars.iv300, %21
  %cmp78 = icmp sgt i64 %indvars.iv.next301, %10
  br i1 %cmp78, label %for.inc120, label %for.body80

for.inc120:                                       ; preds = %for.body80, %for.cond77.preheader
  %add121 = add nsw i32 %i1.1277, 2
  %cmp74 = icmp sgt i32 %add121, %sub73
  %indvars.iv.next299 = add i64 %indvars.iv298, 2
  br i1 %cmp74, label %for.end122, label %for.cond77.preheader

for.end122:                                       ; preds = %for.inc120, %for.cond71.preheader
  %mul123 = fmul double %mul65, %wr.0281
  %mul124 = fmul double %call66, %wi.0280
  %sub125 = fsub double %mul123, %mul124
  %add126 = fadd double %wr.0281, %sub125
  %mul127 = fmul double %mul65, %wi.0280
  %mul128 = fmul double %call66, %wr.0281
  %add129 = fadd double %mul127, %mul128
  %add130 = fadd double %wi.0280, %add129
  %cmp68 = icmp sgt i32 %add72, %ifp1.0283
  %indvars.iv.next297 = add nsw i64 %indvars.iv296, %9
  br i1 %cmp68, label %while.cond55.loopexit, label %for.cond71.preheader

while.end134:                                     ; preds = %while.cond55.loopexit, %while.cond55.preheader
  %indvars.iv.next306 = add nsw i64 %indvars.iv305, -1
  %cmp2 = icmp sgt i64 %indvars.iv305, 1
  br i1 %cmp2, label %for.body3, label %for.end137

for.end137:                                       ; preds = %while.end134, %entry, %for.cond1.preheader
  ret void
}

; Function Attrs: nounwind
declare dso_local double @sin(double) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"double", !4, i64 0}
