; ModuleID = 'ffbench_inst.bc'
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
  call void @init()
  %0 = bitcast i32 ()* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %2 = bitcast i32* getelementptr inbounds ([3 x i32], [3 x i32]* @main.nsize, i64 0, i64 2) to i8*
  store i32 32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @main.nsize, i64 0, i64 2), align 4, !tbaa !2
  %3 = bitcast i32* getelementptr inbounds ([3 x i32], [3 x i32]* @main.nsize, i64 0, i64 1) to i8*
  store i32 32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @main.nsize, i64 0, i64 1), align 4, !tbaa !2
  %call = tail call noalias i8* @malloc(i64 16400) #4
  %4 = bitcast i8* %call to double*
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %6 = bitcast %struct._IO_FILE* %5 to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %5) #5
  tail call void @exit(i32 1) #6
  unreachable

if.end:                                           ; preds = %entry
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %call, i8 0, i64 16400, i1 false)
  br label %for.cond7.preheader

for.cond7.preheader:                              ; preds = %for.inc22, %if.end
  %indvars.iv216 = phi i64 [ 0, %if.end ], [ %indvars.iv.next217, %for.inc22 ]
  %and220 = and i64 %indvars.iv216, 15
  %cmp11 = icmp eq i64 %and220, 8
  %9 = shl i64 %indvars.iv216, 5
  br label %for.body10

for.body10:                                       ; preds = %for.inc, %for.cond7.preheader
  %indvars.iv210 = phi i64 [ 0, %for.cond7.preheader ], [ %indvars.iv.next211, %for.inc ]
  %and13221 = and i64 %indvars.iv210, 15
  %cmp14 = icmp eq i64 %and13221, 8
  %or.cond = or i1 %cmp11, %cmp14
  br i1 %or.cond, label %if.then16, label %for.inc

if.then16:                                        ; preds = %for.body10
  %10 = add nuw nsw i64 %indvars.iv210, %9
  %11 = shl nuw nsw i64 %10, 1
  %12 = or i64 %11, 1
  %arrayidx = getelementptr inbounds double, double* %4, i64 %12
  %13 = bitcast double* %arrayidx to i8*
  %14 = call i64 @getAddr(i8* %13)
  store double 1.280000e+02, double* %arrayidx, align 8, !tbaa !8
  br label %for.inc

for.inc:                                          ; preds = %for.body10, %if.then16
  %indvars.iv.next211 = add nuw nsw i64 %indvars.iv210, 1
  %exitcond215 = icmp eq i64 %indvars.iv.next211, 32
  br i1 %exitcond215, label %for.inc22, label %for.body10

for.inc22:                                        ; preds = %for.inc
  %indvars.iv.next217 = add nuw nsw i64 %indvars.iv216, 1
  %exitcond219 = icmp eq i64 %indvars.iv.next217, 32
  br i1 %exitcond219, label %for.body28, label %for.cond7.preheader

for.body28:                                       ; preds = %for.inc22, %for.body28
  %i.1196 = phi i32 [ %inc30, %for.body28 ], [ 0, %for.inc22 ]
  %15 = bitcast void (double*, i32*, i32, i32)* @fourn to i8*
  %16 = call i64 @getAddr(i8* %15)
  tail call fastcc void @fourn(double* %4, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @main.nsize, i64 0, i64 0), i32 2, i32 1)
  %17 = bitcast void (double*, i32*, i32, i32)* @fourn to i8*
  %18 = call i64 @getAddr(i8* %17)
  tail call fastcc void @fourn(double* %4, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @main.nsize, i64 0, i64 0), i32 2, i32 -1)
  %inc30 = add nuw nsw i32 %i.1196, 1
  %exitcond209 = icmp eq i32 %inc30, 2
  %19 = call i64 @setRealReg(i32 1, double -1.000000e+10)
  %20 = call i64 @setRealReg(i32 2, double 1.000000e+10)
  br i1 %exitcond209, label %for.body36, label %for.body28

for.body36:                                       ; preds = %for.body28, %for.body36
  %indvars.iv206 = phi i64 [ %indvars.iv.next207, %for.body36 ], [ 1, %for.body28 ]
  %21 = phi i64 [ %27, %for.body36 ], [ %19, %for.body28 ]
  %rmax.0192 = phi double [ %cond51, %for.body36 ], [ -1.000000e+10, %for.body28 ]
  %22 = phi i64 [ %26, %for.body36 ], [ %20, %for.body28 ]
  %rmin.0191 = phi double [ %cond, %for.body36 ], [ 1.000000e+10, %for.body28 ]
  %arrayidx38 = getelementptr inbounds double, double* %4, i64 %indvars.iv206
  %23 = load double, double* %arrayidx38, align 8, !tbaa !8
  %24 = bitcast double* %arrayidx38 to i8*
  %25 = call i64 @getAddr(i8* %24)
  %cmp44 = fcmp ole double %23, %rmin.0191
  call void @checkBranch(double %23, i64 %25, double %rmin.0191, i64 %22, i32 5, i1 %cmp44, i32 45, i64 0)
  %26 = select i1 %cmp44, i64 %25, i64 %22
  %cond = select i1 %cmp44, double %23, double %rmin.0191
  %cmp46 = fcmp ogt double %23, %rmax.0192
  call void @checkBranch(double %23, i64 %25, double %rmax.0192, i64 %21, i32 2, i1 %cmp46, i32 47, i64 0)
  %27 = select i1 %cmp46, i64 %25, i64 %21
  %cond51 = select i1 %cmp46, double %23, double %rmax.0192
  %indvars.iv.next207 = add nuw nsw i64 %indvars.iv206, 2
  %cmp34 = icmp ult i64 %indvars.iv.next207, 1025
  br i1 %cmp34, label %for.body36, label %for.end66

for.end66:                                        ; preds = %for.body36
  %sub = fsub double %cond51, %cond
  %28 = call i64 @computeReal(i32 14, i64 %27, i64 %26, double %cond51, double %cond, double %cond51, double %cond, double %sub, i64 3, i32 52)
  %div = fdiv double 2.550000e+02, %sub
  %29 = call i64 @computeReal(i32 19, i64 0, i64 %28, double 2.550000e+02, double %sub, double 2.550000e+02, double %sub, double %div, i64 3, i32 53)
  br label %for.cond71.preheader

for.cond71.preheader:                             ; preds = %for.inc100, %for.end66
  %indvars.iv202 = phi i64 [ 0, %for.end66 ], [ %indvars.iv.next203, %for.inc100 ]
  %m.0189 = phi i32 [ 0, %for.end66 ], [ %m.2, %for.inc100 ]
  %30 = shl i64 %indvars.iv202, 5
  %and84222 = and i64 %indvars.iv202, 15
  %cmp85 = icmp eq i64 %and84222, 8
  %31 = trunc i64 %indvars.iv202 to i32
  br label %for.body74

for.body74:                                       ; preds = %for.inc97, %for.cond71.preheader
  %indvars.iv = phi i64 [ 0, %for.cond71.preheader ], [ %indvars.iv.next, %for.inc97 ]
  %m.1187 = phi i32 [ %m.0189, %for.cond71.preheader ], [ %m.2, %for.inc97 ]
  %32 = add nuw nsw i64 %indvars.iv, %30
  %33 = shl nuw nsw i64 %32, 1
  %34 = or i64 %33, 1
  %arrayidx80 = getelementptr inbounds double, double* %4, i64 %34
  %35 = load double, double* %arrayidx80, align 8, !tbaa !8
  %36 = bitcast double* %arrayidx80 to i8*
  %37 = call i64 @getAddr(i8* %36)
  %sub81 = fsub double %35, %cond
  %38 = call i64 @computeReal(i32 14, i64 %37, i64 %26, double %35, double %cond, double %35, double %cond, double %sub81, i64 3, i32 69)
  %mul82 = fmul double %div, %sub81
  %39 = call i64 @computeReal(i32 16, i64 %29, i64 %38, double %div, double %sub81, double %div, double %sub81, double %mul82, i64 3, i32 70)
  %conv83 = fptosi double %mul82 to i32
  %and87223 = and i64 %indvars.iv, 15
  %cmp88 = icmp eq i64 %and87223, 8
  %40 = or i1 %cmp85, %cmp88
  %cond90 = select i1 %40, i32 255, i32 0
  %cmp91 = icmp eq i32 %cond90, %conv83
  br i1 %cmp91, label %for.inc97, label %if.then93

if.then93:                                        ; preds = %for.body74
  %inc94 = add nsw i32 %m.1187, 1
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %42 = bitcast %struct._IO_FILE* %41 to i8*
  %43 = call i64 @getAddr(i8* %42)
  %44 = trunc i64 %indvars.iv to i32
  %call95 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i64 0, i64 0), i32 %31, i32 %44, i32 %cond90, i32 %conv83) #5
  br label %for.inc97

for.inc97:                                        ; preds = %for.body74, %if.then93
  %m.2 = phi i32 [ %inc94, %if.then93 ], [ %m.1187, %for.body74 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 32
  br i1 %exitcond, label %for.inc100, label %for.body74

for.inc100:                                       ; preds = %for.inc97
  %indvars.iv.next203 = add nuw nsw i64 %indvars.iv202, 1
  %exitcond205 = icmp eq i64 %indvars.iv.next203, 32
  br i1 %exitcond205, label %for.end102, label %for.cond71.preheader

for.end102:                                       ; preds = %for.inc100
  %cmp103 = icmp eq i32 %m.2, 0
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %46 = bitcast %struct._IO_FILE* %45 to i8*
  %47 = call i64 @getAddr(i8* %46)
  br i1 %cmp103, label %if.then105, label %if.else

if.then105:                                       ; preds = %for.end102
  %call106 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.2, i64 0, i64 0), i32 2) #5
  br label %if.end108

if.else:                                          ; preds = %for.end102
  %call107 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0), i32 2, i32 %m.2) #5
  br label %if.end108

if.end108:                                        ; preds = %if.else, %if.then105
  call void @finish()
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
  %0 = bitcast void (double*, i32*, i32, i32)* @fourn to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %cmp287 = icmp slt i32 %ndim, 1
  br i1 %cmp287, label %for.end137, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %2 = add i32 %ndim, 1
  %wide.trip.count = zext i32 %2 to i64
  br label %for.body

for.cond1.preheader:                              ; preds = %for.body
  %cmp2284 = icmp sgt i32 %ndim, 0
  br i1 %cmp2284, label %for.body3.lr.ph, label %for.end137

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %conv = sitofp i32 %isign to double
  %mul59 = fmul double %conv, 0x401921FB54442D1C
  %3 = call i64 @computeReal(i32 16, i64 0, i64 0, double %conv, double 0x401921FB54442D1C, double %conv, double 0x401921FB54442D1C, double %mul59, i64 3, i32 106)
  %4 = sext i32 %ndim to i64
  br label %for.body3

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv307 = phi i64 [ 1, %for.body.preheader ], [ %indvars.iv.next308, %for.body ]
  %ntot.0289 = phi i32 [ 1, %for.body.preheader ], [ %mul, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %nn, i64 %indvars.iv307
  %5 = load i32, i32* %arrayidx, align 4, !tbaa !2
  %6 = bitcast i32* %arrayidx to i8*
  %7 = call i64 @getAddr(i8* %6)
  %mul = mul nsw i32 %5, %ntot.0289
  %indvars.iv.next308 = add nuw nsw i64 %indvars.iv307, 1
  %exitcond = icmp eq i64 %indvars.iv.next308, %wide.trip.count
  br i1 %exitcond, label %for.cond1.preheader, label %for.body

for.body3:                                        ; preds = %for.body3.lr.ph, %while.end134
  %indvars.iv305 = phi i64 [ %4, %for.body3.lr.ph ], [ %indvars.iv.next306, %while.end134 ]
  %nprev.0286 = phi i32 [ 1, %for.body3.lr.ph ], [ %mul6, %while.end134 ]
  %arrayidx5 = getelementptr inbounds i32, i32* %nn, i64 %indvars.iv305
  %8 = load i32, i32* %arrayidx5, align 4, !tbaa !2
  %9 = bitcast i32* %arrayidx5 to i8*
  %10 = call i64 @getAddr(i8* %9)
  %mul6 = mul nsw i32 %8, %nprev.0286
  %div = sdiv i32 %mul, %mul6
  %shl = shl i32 %nprev.0286, 1
  %mul7 = mul nsw i32 %8, %shl
  %mul8 = mul nsw i32 %mul7, %div
  %cmp10271 = icmp slt i32 %mul7, 1
  br i1 %cmp10271, label %while.cond55.preheader, label %for.body11.preheader

for.body11.preheader:                             ; preds = %for.body3
  %11 = sext i32 %shl to i64
  %12 = shl i32 %nprev.0286, 1
  %13 = mul i32 %12, %8
  %14 = sext i32 %13 to i64
  %15 = sext i32 %mul8 to i64
  br label %for.body11

while.cond55.preheader:                           ; preds = %while.end, %for.body3
  %cmp56282 = icmp slt i32 %shl, %mul7
  br i1 %cmp56282, label %while.body57.preheader, label %while.end134

while.body57.preheader:                           ; preds = %while.cond55.preheader
  %16 = sext i32 %shl to i64
  %17 = sext i32 %mul8 to i64
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
  %18 = trunc i64 %indvars.iv293 to i32
  %sub20 = add i32 %add19, %18
  %arrayidx22 = getelementptr inbounds double, double* %data, i64 %indvars.iv293
  %19 = bitcast double* %arrayidx22 to i64*
  %20 = load i64, i64* %19, align 8, !tbaa !8
  %21 = bitcast i64* %19 to i8*
  %22 = call i64 @getAddr(i8* %21)
  %idxprom23 = sext i32 %sub20 to i64
  %arrayidx24 = getelementptr inbounds double, double* %data, i64 %idxprom23
  %23 = bitcast double* %arrayidx24 to i64*
  %24 = load i64, i64* %23, align 8, !tbaa !8
  %25 = bitcast i64* %23 to i8*
  %26 = call i64 @getAddr(i8* %25)
  %27 = bitcast i64* %19 to i8*
  store i64 %24, i64* %19, align 8, !tbaa !8
  %28 = bitcast i64* %23 to i8*
  store i64 %20, i64* %23, align 8, !tbaa !8
  %29 = add nsw i64 %indvars.iv293, 1
  %arrayidx31 = getelementptr inbounds double, double* %data, i64 %29
  %30 = bitcast double* %arrayidx31 to i64*
  %31 = load i64, i64* %30, align 8, !tbaa !8
  %32 = bitcast i64* %30 to i8*
  %33 = call i64 @getAddr(i8* %32)
  %add32 = add nsw i32 %sub20, 1
  %idxprom33 = sext i32 %add32 to i64
  %arrayidx34 = getelementptr inbounds double, double* %data, i64 %idxprom33
  %34 = bitcast double* %arrayidx34 to i64*
  %35 = load i64, i64* %34, align 8, !tbaa !8
  %36 = bitcast i64* %34 to i8*
  %37 = call i64 @getAddr(i8* %36)
  %38 = bitcast i64* %30 to i8*
  store i64 %35, i64* %30, align 8, !tbaa !8
  %39 = bitcast i64* %34 to i8*
  store i64 %31, i64* %34, align 8, !tbaa !8
  %indvars.iv.next294 = add i64 %indvars.iv293, %14
  %cmp17 = icmp sgt i64 %indvars.iv.next294, %15
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
  %indvars.iv.next = add nsw i64 %indvars.iv, %11
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
  %40 = call i64 @computeReal(i32 19, i64 %3, i64 0, double %mul59, double %conv61, double %mul59, double %conv61, double %div62, i64 3, i32 204)
  %mul63 = fmul double %div62, 5.000000e-01
  %41 = call i64 @computeReal(i32 16, i64 %40, i64 0, double %div62, double 5.000000e-01, double %div62, double 5.000000e-01, double %mul63, i64 3, i32 205)
  %call = tail call double @sin(double %mul63) #4
  %42 = call i64 @handleMathFunc(i32 4, double %mul63, i64 %41, double %call, i32 206)
  %mul64 = fmul double %call, -2.000000e+00
  %43 = call i64 @computeReal(i32 16, i64 %42, i64 0, double %call, double -2.000000e+00, double %call, double -2.000000e+00, double %mul64, i64 3, i32 207)
  %mul65 = fmul double %call, %mul64
  %44 = call i64 @computeReal(i32 16, i64 %42, i64 %43, double %call, double %mul64, double %call, double %mul64, double %mul65, i64 3, i32 208)
  %call66 = tail call double @sin(double %div62) #4
  %45 = call i64 @handleMathFunc(i32 4, double %div62, i64 %40, double %call66, i32 209)
  %cmp68278 = icmp slt i32 %ifp1.0283, 1
  br i1 %cmp68278, label %while.cond55.loopexit, label %for.cond71.preheader.preheader

for.cond71.preheader.preheader:                   ; preds = %while.body57
  %46 = sext i32 %shl58 to i64
  %47 = sext i32 %ifp1.0283 to i64
  %48 = call i64 @setRealReg(i32 3, double 1.000000e+00)
  %49 = call i64 @setRealReg(i32 4, double 0.000000e+00)
  br label %for.cond71.preheader

for.cond71.preheader:                             ; preds = %for.cond71.preheader.preheader, %for.end122
  %indvars.iv296 = phi i64 [ 1, %for.cond71.preheader.preheader ], [ %indvars.iv.next297, %for.end122 ]
  %50 = phi i64 [ %48, %for.cond71.preheader.preheader ], [ %94, %for.end122 ]
  %wr.0281 = phi double [ 1.000000e+00, %for.cond71.preheader.preheader ], [ %add126, %for.end122 ]
  %51 = phi i64 [ %49, %for.cond71.preheader.preheader ], [ %98, %for.end122 ]
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
  %52 = add nsw i64 %indvars.iv300, %47
  %arrayidx83 = getelementptr inbounds double, double* %data, i64 %52
  %53 = load double, double* %arrayidx83, align 8, !tbaa !8
  %54 = bitcast double* %arrayidx83 to i8*
  %55 = call i64 @getAddr(i8* %54)
  %mul84 = fmul double %wr.0281, %53
  %56 = call i64 @computeReal(i32 16, i64 %50, i64 %55, double %wr.0281, double %53, double %wr.0281, double %53, double %mul84, i64 3, i32 231)
  %57 = add nsw i64 %52, 1
  %arrayidx87 = getelementptr inbounds double, double* %data, i64 %57
  %58 = load double, double* %arrayidx87, align 8, !tbaa !8
  %59 = bitcast double* %arrayidx87 to i8*
  %60 = call i64 @getAddr(i8* %59)
  %mul88 = fmul double %wi.0280, %58
  %61 = call i64 @computeReal(i32 16, i64 %51, i64 %60, double %wi.0280, double %58, double %wi.0280, double %58, double %mul88, i64 3, i32 235)
  %sub89 = fsub double %mul84, %mul88
  %62 = call i64 @computeReal(i32 14, i64 %56, i64 %61, double %mul84, double %mul88, double %mul84, double %mul88, double %sub89, i64 3, i32 236)
  %mul93 = fmul double %wr.0281, %58
  %63 = call i64 @computeReal(i32 16, i64 %50, i64 %60, double %wr.0281, double %58, double %wr.0281, double %58, double %mul93, i64 3, i32 237)
  %mul96 = fmul double %wi.0280, %53
  %64 = call i64 @computeReal(i32 16, i64 %51, i64 %55, double %wi.0280, double %53, double %wi.0280, double %53, double %mul96, i64 3, i32 238)
  %add97 = fadd double %mul96, %mul93
  %65 = call i64 @computeReal(i32 12, i64 %64, i64 %63, double %mul96, double %mul93, double %mul96, double %mul93, double %add97, i64 3, i32 239)
  %arrayidx99 = getelementptr inbounds double, double* %data, i64 %indvars.iv300
  %66 = load double, double* %arrayidx99, align 8, !tbaa !8
  %67 = bitcast double* %arrayidx99 to i8*
  %68 = call i64 @getAddr(i8* %67)
  %sub100 = fsub double %66, %sub89
  %69 = call i64 @computeReal(i32 14, i64 %68, i64 %62, double %66, double %sub89, double %66, double %sub89, double %sub100, i64 3, i32 242)
  %70 = bitcast double* %arrayidx83 to i8*
  %71 = call i64 @getAddr(i8* %70)
  call void @setRealTemp(i64 %71, i64 %69, double %sub100)
  store double %sub100, double* %arrayidx83, align 8, !tbaa !8
  %72 = add nsw i64 %indvars.iv300, 1
  %arrayidx105 = getelementptr inbounds double, double* %data, i64 %72
  %73 = load double, double* %arrayidx105, align 8, !tbaa !8
  %74 = bitcast double* %arrayidx105 to i8*
  %75 = call i64 @getAddr(i8* %74)
  %sub106 = fsub double %73, %add97
  %76 = call i64 @computeReal(i32 14, i64 %75, i64 %65, double %73, double %add97, double %73, double %add97, double %sub106, i64 3, i32 247)
  %77 = bitcast double* %arrayidx87 to i8*
  %78 = call i64 @getAddr(i8* %77)
  call void @setRealTemp(i64 %78, i64 %76, double %sub106)
  store double %sub106, double* %arrayidx87, align 8, !tbaa !8
  %79 = load double, double* %arrayidx99, align 8, !tbaa !8
  %80 = bitcast double* %arrayidx99 to i8*
  %81 = call i64 @getAddr(i8* %80)
  %add112 = fadd double %sub89, %79
  %82 = call i64 @computeReal(i32 12, i64 %62, i64 %81, double %sub89, double %79, double %sub89, double %79, double %add112, i64 3, i32 250)
  %83 = bitcast double* %arrayidx99 to i8*
  %84 = call i64 @getAddr(i8* %83)
  call void @setRealTemp(i64 %84, i64 %82, double %add112)
  store double %add112, double* %arrayidx99, align 8, !tbaa !8
  %85 = load double, double* %arrayidx105, align 8, !tbaa !8
  %86 = bitcast double* %arrayidx105 to i8*
  %87 = call i64 @getAddr(i8* %86)
  %add116 = fadd double %add97, %85
  %88 = call i64 @computeReal(i32 12, i64 %65, i64 %87, double %add97, double %85, double %add97, double %85, double %add116, i64 3, i32 253)
  %89 = bitcast double* %arrayidx105 to i8*
  %90 = call i64 @getAddr(i8* %89)
  call void @setRealTemp(i64 %90, i64 %88, double %add116)
  store double %add116, double* %arrayidx105, align 8, !tbaa !8
  %indvars.iv.next301 = add i64 %indvars.iv300, %46
  %cmp78 = icmp sgt i64 %indvars.iv.next301, %17
  br i1 %cmp78, label %for.inc120, label %for.body80

for.inc120:                                       ; preds = %for.body80, %for.cond77.preheader
  %add121 = add nsw i32 %i1.1277, 2
  %cmp74 = icmp sgt i32 %add121, %sub73
  %indvars.iv.next299 = add i64 %indvars.iv298, 2
  br i1 %cmp74, label %for.end122, label %for.cond77.preheader

for.end122:                                       ; preds = %for.inc120, %for.cond71.preheader
  %mul123 = fmul double %mul65, %wr.0281
  %91 = call i64 @computeReal(i32 16, i64 %44, i64 %50, double %mul65, double %wr.0281, double %mul65, double %wr.0281, double %mul123, i64 3, i32 262)
  %mul124 = fmul double %call66, %wi.0280
  %92 = call i64 @computeReal(i32 16, i64 %45, i64 %51, double %call66, double %wi.0280, double %call66, double %wi.0280, double %mul124, i64 3, i32 263)
  %sub125 = fsub double %mul123, %mul124
  %93 = call i64 @computeReal(i32 14, i64 %91, i64 %92, double %mul123, double %mul124, double %mul123, double %mul124, double %sub125, i64 3, i32 264)
  %add126 = fadd double %wr.0281, %sub125
  %94 = call i64 @computeReal(i32 12, i64 %50, i64 %93, double %wr.0281, double %sub125, double %wr.0281, double %sub125, double %add126, i64 3, i32 265)
  %mul127 = fmul double %mul65, %wi.0280
  %95 = call i64 @computeReal(i32 16, i64 %44, i64 %51, double %mul65, double %wi.0280, double %mul65, double %wi.0280, double %mul127, i64 3, i32 266)
  %mul128 = fmul double %call66, %wr.0281
  %96 = call i64 @computeReal(i32 16, i64 %45, i64 %50, double %call66, double %wr.0281, double %call66, double %wr.0281, double %mul128, i64 3, i32 267)
  %add129 = fadd double %mul127, %mul128
  %97 = call i64 @computeReal(i32 12, i64 %95, i64 %96, double %mul127, double %mul128, double %mul127, double %mul128, double %add129, i64 3, i32 268)
  %add130 = fadd double %wi.0280, %add129
  %98 = call i64 @computeReal(i32 12, i64 %51, i64 %97, double %wi.0280, double %add129, double %wi.0280, double %add129, double %add130, i64 3, i32 269)
  %cmp68 = icmp sgt i32 %add72, %ifp1.0283
  %indvars.iv.next297 = add nsw i64 %indvars.iv296, %16
  br i1 %cmp68, label %while.cond55.loopexit, label %for.cond71.preheader

while.end134:                                     ; preds = %while.cond55.loopexit, %while.cond55.preheader
  %indvars.iv.next306 = add nsw i64 %indvars.iv305, -1
  %cmp2 = icmp sgt i64 %indvars.iv305, 1
  br i1 %cmp2, label %for.body3, label %for.end137

for.end137:                                       ; preds = %while.end134, %entry, %for.cond1.preheader
  %99 = bitcast void (double*, i32*, i32, i32)* @fourn to i8*
  %100 = call i64 @getAddr(i8* %99)
  call void @funcExit(i64 %100, i64 0)
  ret void
}

; Function Attrs: nounwind
declare dso_local double @sin(double) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

declare i64 @getAddr(i8*)

declare void @setRealTemp(i64, i64, double)

declare void @checkBranch(double, i64, double, i64, i32, i1, i32, i64)

declare i64 @computeReal(i32, i64, i64, double, double, double, double, double, i64, i32)

declare void @finish()

declare i64 @setRealReg(i32, double)

declare i64 @handleMathFunc(i32, double, i64, double, i32)

declare void @funcInit(i64)

declare void @init()

declare void @funcExit(i64, i64)

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
