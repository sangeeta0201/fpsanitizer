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
  %0 = bitcast i32* getelementptr inbounds ([3 x i32], [3 x i32]* @main.nsize, i64 0, i64 2) to i8*
  %1 = call i64 @getAddr(i8* %0)
  store i32 256, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @main.nsize, i64 0, i64 2), align 4, !tbaa !2
  %2 = bitcast i32* getelementptr inbounds ([3 x i32], [3 x i32]* @main.nsize, i64 0, i64 1) to i8*
  %3 = call i64 @getAddr(i8* %2)
  store i32 256, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @main.nsize, i64 0, i64 1), align 4, !tbaa !2
  %call = tail call noalias i8* @malloc(i64 1048592) #4
  call void @handleMalloc(i8* %call, i64 1048592)
  %4 = bitcast i8* %call to double*
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = bitcast %struct._IO_FILE** @stderr to i8*
  %6 = call i64 @fpSanLoadFromShadowMem(i8* %5, i32 6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %8 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %7) #5
  tail call void @exit(i32 1) #6
  unreachable

if.end:                                           ; preds = %entry
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %call, i8 0, i64 1048592, i1 false)
  br label %for.cond7.preheader

for.cond7.preheader:                              ; preds = %for.inc22, %if.end
  %indvars.iv203 = phi i64 [ 0, %if.end ], [ %indvars.iv.next204, %for.inc22 ]
  %and207 = and i64 %indvars.iv203, 15
  %cmp11 = icmp eq i64 %and207, 8
  %9 = shl i64 %indvars.iv203, 8
  br label %for.body10

for.body10:                                       ; preds = %for.inc, %for.cond7.preheader
  %indvars.iv197 = phi i64 [ 0, %for.cond7.preheader ], [ %indvars.iv.next198, %for.inc ]
  %and13208 = and i64 %indvars.iv197, 15
  %cmp14 = icmp eq i64 %and13208, 8
  %or.cond = or i1 %cmp11, %cmp14
  br i1 %or.cond, label %if.then16, label %for.inc

if.then16:                                        ; preds = %for.body10
  %10 = add nuw nsw i64 %indvars.iv197, %9
  %11 = shl nuw nsw i64 %10, 1
  %12 = or i64 %11, 1
  %arrayidx = getelementptr inbounds double, double* %4, i64 %12
  %13 = bitcast double* %arrayidx to i8*
  %14 = call i64 @getAddr(i8* %13)
  call void @setRealConstant(i64 %14, double 1.280000e+02)
  store double 1.280000e+02, double* %arrayidx, align 8, !tbaa !8
  br label %for.inc

for.inc:                                          ; preds = %for.body10, %if.then16
  %indvars.iv.next198 = add nuw nsw i64 %indvars.iv197, 1
  %exitcond202 = icmp eq i64 %indvars.iv.next198, 256
  br i1 %exitcond202, label %for.inc22, label %for.body10

for.inc22:                                        ; preds = %for.inc
  %indvars.iv.next204 = add nuw nsw i64 %indvars.iv203, 1
  %exitcond206 = icmp eq i64 %indvars.iv.next204, 256
  br i1 %exitcond206, label %for.end24, label %for.cond7.preheader

for.end24:                                        ; preds = %for.inc22
  call void @addReturnAddr()
  tail call fastcc void @fourn(double* %4, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @main.nsize, i64 0, i64 0), i32 2, i32 1)
  br label %for.body29

for.body29:                                       ; preds = %for.end24, %for.body29
  %indvars.iv194 = phi i64 [ 1, %for.end24 ], [ %indvars.iv.next195, %for.body29 ]
  %15 = phi i64 [ 0, %for.end24 ], [ %21, %for.body29 ]
  %rmax.0181 = phi double [ -1.000000e+10, %for.end24 ], [ %cond44, %for.body29 ]
  %16 = phi i64 [ 0, %for.end24 ], [ %20, %for.body29 ]
  %rmin.0180 = phi double [ 1.000000e+10, %for.end24 ], [ %cond, %for.body29 ]
  %arrayidx31 = getelementptr inbounds double, double* %4, i64 %indvars.iv194
  %17 = bitcast double* %arrayidx31 to i8*
  %18 = call i64 @fpSanLoadFromShadowMem(i8* %17, i32 40)
  %19 = load double, double* %arrayidx31, align 8, !tbaa !8
  %cmp37 = fcmp ole double %19, %rmin.0180
  call void @checkBranch(double %19, i64 %18, double %rmin.0180, i64 %16, i32 5, i1 %cmp37, i32 41, i64 0)
  %20 = select i1 %cmp37, i64 %18, i64 %16
  %cond = select i1 %cmp37, double %19, double %rmin.0180
  %cmp39 = fcmp ogt double %19, %rmax.0181
  call void @checkBranch(double %19, i64 %18, double %rmax.0181, i64 %15, i32 2, i1 %cmp39, i32 43, i64 0)
  %21 = select i1 %cmp39, i64 %18, i64 %15
  %cond44 = select i1 %cmp39, double %19, double %rmax.0181
  %indvars.iv.next195 = add nuw nsw i64 %indvars.iv194, 2
  %cmp27 = icmp ult i64 %indvars.iv.next195, 65537
  br i1 %cmp27, label %for.body29, label %for.end59

for.end59:                                        ; preds = %for.body29
  %sub = fsub double %cond44, %cond
  %22 = call i64 @computeReal(i32 14, i64 %21, i64 %20, double %cond44, double %cond, double %sub, i32 48)
  %div = fdiv double 2.550000e+02, %sub
  %23 = call i64 @computeReal(i32 19, i64 0, i64 %22, double 2.550000e+02, double %sub, double %div, i32 49)
  br label %for.cond64.preheader

for.cond64.preheader:                             ; preds = %for.inc93, %for.end59
  %indvars.iv190 = phi i64 [ 0, %for.end59 ], [ %indvars.iv.next191, %for.inc93 ]
  %m.0178 = phi i32 [ 0, %for.end59 ], [ %m.2, %for.inc93 ]
  %24 = shl i64 %indvars.iv190, 8
  %and77209 = and i64 %indvars.iv190, 15
  %cmp78 = icmp eq i64 %and77209, 8
  %25 = trunc i64 %indvars.iv190 to i32
  br label %for.body67

for.body67:                                       ; preds = %for.inc90, %for.cond64.preheader
  %indvars.iv = phi i64 [ 0, %for.cond64.preheader ], [ %indvars.iv.next, %for.inc90 ]
  %m.1176 = phi i32 [ %m.0178, %for.cond64.preheader ], [ %m.2, %for.inc90 ]
  %26 = add nuw nsw i64 %indvars.iv, %24
  %27 = shl nuw nsw i64 %26, 1
  %28 = or i64 %27, 1
  %arrayidx73 = getelementptr inbounds double, double* %4, i64 %28
  %29 = bitcast double* %arrayidx73 to i8*
  %30 = call i64 @fpSanLoadFromShadowMem(i8* %29, i32 64)
  %31 = load double, double* %arrayidx73, align 8, !tbaa !8
  %sub74 = fsub double %31, %cond
  %32 = call i64 @computeReal(i32 14, i64 %30, i64 %20, double %31, double %cond, double %sub74, i32 65)
  %mul75 = fmul double %div, %sub74
  %33 = call i64 @computeReal(i32 16, i64 %23, i64 %32, double %div, double %sub74, double %mul75, i32 66)
  %conv76 = fptosi double %mul75 to i32
  %and80210 = and i64 %indvars.iv, 15
  %cmp81 = icmp eq i64 %and80210, 8
  %34 = or i1 %cmp78, %cmp81
  %cond83 = select i1 %34, i32 255, i32 0
  %cmp84 = icmp eq i32 %cond83, %conv76
  br i1 %cmp84, label %for.inc90, label %if.then86

if.then86:                                        ; preds = %for.body67
  %inc87 = add nsw i32 %m.1176, 1
  %35 = bitcast %struct._IO_FILE** @stderr to i8*
  %36 = call i64 @fpSanLoadFromShadowMem(i8* %35, i32 75)
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %38 = trunc i64 %indvars.iv to i32
  %call88 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i64 0, i64 0), i32 %25, i32 %38, i32 %cond83, i32 %conv76) #5
  br label %for.inc90

for.inc90:                                        ; preds = %for.body67, %if.then86
  %m.2 = phi i32 [ %inc87, %if.then86 ], [ %m.1176, %for.body67 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 256
  br i1 %exitcond, label %for.inc93, label %for.body67

for.inc93:                                        ; preds = %for.inc90
  %indvars.iv.next191 = add nuw nsw i64 %indvars.iv190, 1
  %exitcond193 = icmp eq i64 %indvars.iv.next191, 256
  br i1 %exitcond193, label %for.end95, label %for.cond64.preheader

for.end95:                                        ; preds = %for.inc93
  %cmp96 = icmp eq i32 %m.2, 0
  %39 = bitcast %struct._IO_FILE** @stderr to i8*
  %40 = call i64 @fpSanLoadFromShadowMem(i8* %39, i32 87)
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  br i1 %cmp96, label %if.then98, label %if.else

if.then98:                                        ; preds = %for.end95
  %call99 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.2, i64 0, i64 0), i32 16) #5
  br label %if.end101

if.else:                                          ; preds = %for.end95
  %call100 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0), i32 16, i32 %m.2) #5
  br label %if.end101

if.end101:                                        ; preds = %if.else, %if.then98
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
  call void @funcInit()
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
  %1 = call i64 @computeReal(i32 16, i64 0, i64 0, double %conv, double 0x401921FB54442D1C, double %mul59, i32 8)
  %2 = sext i32 %ndim to i64
  br label %for.body3

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv307 = phi i64 [ 1, %for.body.preheader ], [ %indvars.iv.next308, %for.body ]
  %ntot.0289 = phi i32 [ 1, %for.body.preheader ], [ %mul, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %nn, i64 %indvars.iv307
  %3 = bitcast i32* %arrayidx to i8*
  %4 = call i64 @fpSanLoadFromShadowMem(i8* %3, i32 14)
  %5 = load i32, i32* %arrayidx, align 4, !tbaa !2
  %mul = mul nsw i32 %5, %ntot.0289
  %indvars.iv.next308 = add nuw nsw i64 %indvars.iv307, 1
  %exitcond = icmp eq i64 %indvars.iv.next308, %wide.trip.count
  br i1 %exitcond, label %for.cond1.preheader, label %for.body

for.body3:                                        ; preds = %for.body3.lr.ph, %while.end134
  %indvars.iv305 = phi i64 [ %2, %for.body3.lr.ph ], [ %indvars.iv.next306, %while.end134 ]
  %nprev.0286 = phi i32 [ 1, %for.body3.lr.ph ], [ %mul6, %while.end134 ]
  %arrayidx5 = getelementptr inbounds i32, i32* %nn, i64 %indvars.iv305
  %6 = bitcast i32* %arrayidx5 to i8*
  %7 = call i64 @fpSanLoadFromShadowMem(i8* %6, i32 22)
  %8 = load i32, i32* %arrayidx5, align 4, !tbaa !2
  %mul6 = mul nsw i32 %8, %nprev.0286
  %div = sdiv i32 %mul, %mul6
  %shl = shl i32 %nprev.0286, 1
  %mul7 = mul nsw i32 %8, %shl
  %mul8 = mul nsw i32 %mul7, %div
  %cmp10271 = icmp slt i32 %mul7, 1
  br i1 %cmp10271, label %while.cond55.preheader, label %for.body11.preheader

for.body11.preheader:                             ; preds = %for.body3
  %9 = sext i32 %shl to i64
  %10 = shl i32 %nprev.0286, 1
  %11 = mul i32 %10, %8
  %12 = sext i32 %11 to i64
  %13 = sext i32 %mul8 to i64
  br label %for.body11

while.cond55.preheader:                           ; preds = %while.end, %for.body3
  %cmp56282 = icmp slt i32 %shl, %mul7
  br i1 %cmp56282, label %while.body57.preheader, label %while.end134

while.body57.preheader:                           ; preds = %while.cond55.preheader
  %14 = sext i32 %shl to i64
  %15 = sext i32 %mul8 to i64
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
  %16 = trunc i64 %indvars.iv293 to i32
  %sub20 = add i32 %add19, %16
  %arrayidx22 = getelementptr inbounds double, double* %data, i64 %indvars.iv293
  %17 = bitcast double* %arrayidx22 to i64*
  %18 = bitcast i64* %17 to i8*
  %19 = call i64 @fpSanLoadFromShadowMem(i8* %18, i32 61)
  %20 = load i64, i64* %17, align 8, !tbaa !8
  %idxprom23 = sext i32 %sub20 to i64
  %arrayidx24 = getelementptr inbounds double, double* %data, i64 %idxprom23
  %21 = bitcast double* %arrayidx24 to i64*
  %22 = bitcast i64* %21 to i8*
  %23 = call i64 @fpSanLoadFromShadowMem(i8* %22, i32 65)
  %24 = load i64, i64* %21, align 8, !tbaa !8
  %25 = bitcast i64* %17 to i8*
  %26 = call i64 @getAddr(i8* %25)
  call void @setRealTemp(i64 %26, i64 %23)
  store i64 %24, i64* %17, align 8, !tbaa !8
  %27 = bitcast i64* %21 to i8*
  %28 = call i64 @getAddr(i8* %27)
  call void @setRealTemp(i64 %28, i64 %19)
  store i64 %20, i64* %21, align 8, !tbaa !8
  %29 = add nsw i64 %indvars.iv293, 1
  %arrayidx31 = getelementptr inbounds double, double* %data, i64 %29
  %30 = bitcast double* %arrayidx31 to i64*
  %31 = bitcast i64* %30 to i8*
  %32 = call i64 @fpSanLoadFromShadowMem(i8* %31, i32 71)
  %33 = load i64, i64* %30, align 8, !tbaa !8
  %add32 = add nsw i32 %sub20, 1
  %idxprom33 = sext i32 %add32 to i64
  %arrayidx34 = getelementptr inbounds double, double* %data, i64 %idxprom33
  %34 = bitcast double* %arrayidx34 to i64*
  %35 = bitcast i64* %34 to i8*
  %36 = call i64 @fpSanLoadFromShadowMem(i8* %35, i32 76)
  %37 = load i64, i64* %34, align 8, !tbaa !8
  %38 = bitcast i64* %30 to i8*
  %39 = call i64 @getAddr(i8* %38)
  call void @setRealTemp(i64 %39, i64 %36)
  store i64 %37, i64* %30, align 8, !tbaa !8
  %40 = bitcast i64* %34 to i8*
  %41 = call i64 @getAddr(i8* %40)
  call void @setRealTemp(i64 %41, i64 %32)
  store i64 %33, i64* %34, align 8, !tbaa !8
  %indvars.iv.next294 = add i64 %indvars.iv293, %12
  %cmp17 = icmp sgt i64 %indvars.iv.next294, %13
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
  %indvars.iv.next = add nsw i64 %indvars.iv, %9
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
  %42 = call i64 @computeReal(i32 19, i64 %1, i64 0, double %mul59, double %conv61, double %div62, i32 106)
  %mul63 = fmul double %div62, 5.000000e-01
  %43 = call i64 @computeReal(i32 16, i64 %42, i64 0, double %div62, double 5.000000e-01, double %mul63, i32 107)
  %call = tail call double @sin(double %mul63) #4
  %44 = call i64 @handleMathFunc(i32 4, double %mul63, i64 %43, double %call, i32 108)
  %mul64 = fmul double %call, -2.000000e+00
  %45 = call i64 @computeReal(i32 16, i64 %44, i64 0, double %call, double -2.000000e+00, double %mul64, i32 109)
  %mul65 = fmul double %call, %mul64
  %46 = call i64 @computeReal(i32 16, i64 %44, i64 %45, double %call, double %mul64, double %mul65, i32 110)
  %call66 = tail call double @sin(double %div62) #4
  %47 = call i64 @handleMathFunc(i32 4, double %div62, i64 %42, double %call66, i32 111)
  %cmp68278 = icmp slt i32 %ifp1.0283, 1
  br i1 %cmp68278, label %while.cond55.loopexit, label %for.cond71.preheader.preheader

for.cond71.preheader.preheader:                   ; preds = %while.body57
  %48 = sext i32 %shl58 to i64
  %49 = sext i32 %ifp1.0283 to i64
  br label %for.cond71.preheader

for.cond71.preheader:                             ; preds = %for.cond71.preheader.preheader, %for.end122
  %indvars.iv296 = phi i64 [ 1, %for.cond71.preheader.preheader ], [ %indvars.iv.next297, %for.end122 ]
  %50 = phi i64 [ 0, %for.cond71.preheader.preheader ], [ %94, %for.end122 ]
  %wr.0281 = phi double [ 1.000000e+00, %for.cond71.preheader.preheader ], [ %add126, %for.end122 ]
  %51 = phi i64 [ 0, %for.cond71.preheader.preheader ], [ %98, %for.end122 ]
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
  %52 = add nsw i64 %indvars.iv300, %49
  %arrayidx83 = getelementptr inbounds double, double* %data, i64 %52
  %53 = bitcast double* %arrayidx83 to i8*
  %54 = call i64 @fpSanLoadFromShadowMem(i8* %53, i32 132)
  %55 = load double, double* %arrayidx83, align 8, !tbaa !8
  %mul84 = fmul double %wr.0281, %55
  %56 = call i64 @computeReal(i32 16, i64 %50, i64 %54, double %wr.0281, double %55, double %mul84, i32 133)
  %57 = add nsw i64 %52, 1
  %arrayidx87 = getelementptr inbounds double, double* %data, i64 %57
  %58 = bitcast double* %arrayidx87 to i8*
  %59 = call i64 @fpSanLoadFromShadowMem(i8* %58, i32 136)
  %60 = load double, double* %arrayidx87, align 8, !tbaa !8
  %mul88 = fmul double %wi.0280, %60
  %61 = call i64 @computeReal(i32 16, i64 %51, i64 %59, double %wi.0280, double %60, double %mul88, i32 137)
  %sub89 = fsub double %mul84, %mul88
  %62 = call i64 @computeReal(i32 14, i64 %56, i64 %61, double %mul84, double %mul88, double %sub89, i32 138)
  %mul93 = fmul double %wr.0281, %60
  %63 = call i64 @computeReal(i32 16, i64 %50, i64 %59, double %wr.0281, double %60, double %mul93, i32 139)
  %mul96 = fmul double %wi.0280, %55
  %64 = call i64 @computeReal(i32 16, i64 %51, i64 %54, double %wi.0280, double %55, double %mul96, i32 140)
  %add97 = fadd double %mul96, %mul93
  %65 = call i64 @computeReal(i32 12, i64 %64, i64 %63, double %mul96, double %mul93, double %add97, i32 141)
  %arrayidx99 = getelementptr inbounds double, double* %data, i64 %indvars.iv300
  %66 = bitcast double* %arrayidx99 to i8*
  %67 = call i64 @fpSanLoadFromShadowMem(i8* %66, i32 143)
  %68 = load double, double* %arrayidx99, align 8, !tbaa !8
  %sub100 = fsub double %68, %sub89
  %69 = call i64 @computeReal(i32 14, i64 %67, i64 %62, double %68, double %sub89, double %sub100, i32 144)
  %70 = bitcast double* %arrayidx83 to i8*
  %71 = call i64 @getAddr(i8* %70)
  call void @setRealTemp(i64 %71, i64 %69)
  store double %sub100, double* %arrayidx83, align 8, !tbaa !8
  %72 = add nsw i64 %indvars.iv300, 1
  %arrayidx105 = getelementptr inbounds double, double* %data, i64 %72
  %73 = bitcast double* %arrayidx105 to i8*
  %74 = call i64 @fpSanLoadFromShadowMem(i8* %73, i32 148)
  %75 = load double, double* %arrayidx105, align 8, !tbaa !8
  %sub106 = fsub double %75, %add97
  %76 = call i64 @computeReal(i32 14, i64 %74, i64 %65, double %75, double %add97, double %sub106, i32 149)
  %77 = bitcast double* %arrayidx87 to i8*
  %78 = call i64 @getAddr(i8* %77)
  call void @setRealTemp(i64 %78, i64 %76)
  store double %sub106, double* %arrayidx87, align 8, !tbaa !8
  %79 = bitcast double* %arrayidx99 to i8*
  %80 = call i64 @fpSanLoadFromShadowMem(i8* %79, i32 151)
  %81 = load double, double* %arrayidx99, align 8, !tbaa !8
  %add112 = fadd double %sub89, %81
  %82 = call i64 @computeReal(i32 12, i64 %62, i64 %80, double %sub89, double %81, double %add112, i32 152)
  %83 = bitcast double* %arrayidx99 to i8*
  %84 = call i64 @getAddr(i8* %83)
  call void @setRealTemp(i64 %84, i64 %82)
  store double %add112, double* %arrayidx99, align 8, !tbaa !8
  %85 = bitcast double* %arrayidx105 to i8*
  %86 = call i64 @fpSanLoadFromShadowMem(i8* %85, i32 154)
  %87 = load double, double* %arrayidx105, align 8, !tbaa !8
  %add116 = fadd double %add97, %87
  %88 = call i64 @computeReal(i32 12, i64 %65, i64 %86, double %add97, double %87, double %add116, i32 155)
  %89 = bitcast double* %arrayidx105 to i8*
  %90 = call i64 @getAddr(i8* %89)
  call void @setRealTemp(i64 %90, i64 %88)
  store double %add116, double* %arrayidx105, align 8, !tbaa !8
  %indvars.iv.next301 = add i64 %indvars.iv300, %48
  %cmp78 = icmp sgt i64 %indvars.iv.next301, %15
  br i1 %cmp78, label %for.inc120, label %for.body80

for.inc120:                                       ; preds = %for.body80, %for.cond77.preheader
  %add121 = add nsw i32 %i1.1277, 2
  %cmp74 = icmp sgt i32 %add121, %sub73
  %indvars.iv.next299 = add i64 %indvars.iv298, 2
  br i1 %cmp74, label %for.end122, label %for.cond77.preheader

for.end122:                                       ; preds = %for.inc120, %for.cond71.preheader
  %mul123 = fmul double %mul65, %wr.0281
  %91 = call i64 @computeReal(i32 16, i64 %46, i64 %50, double %mul65, double %wr.0281, double %mul123, i32 164)
  %mul124 = fmul double %call66, %wi.0280
  %92 = call i64 @computeReal(i32 16, i64 %47, i64 %51, double %call66, double %wi.0280, double %mul124, i32 165)
  %sub125 = fsub double %mul123, %mul124
  %93 = call i64 @computeReal(i32 14, i64 %91, i64 %92, double %mul123, double %mul124, double %sub125, i32 166)
  %add126 = fadd double %wr.0281, %sub125
  %94 = call i64 @computeReal(i32 12, i64 %50, i64 %93, double %wr.0281, double %sub125, double %add126, i32 167)
  %mul127 = fmul double %mul65, %wi.0280
  %95 = call i64 @computeReal(i32 16, i64 %46, i64 %51, double %mul65, double %wi.0280, double %mul127, i32 168)
  %mul128 = fmul double %call66, %wr.0281
  %96 = call i64 @computeReal(i32 16, i64 %47, i64 %50, double %call66, double %wr.0281, double %mul128, i32 169)
  %add129 = fadd double %mul127, %mul128
  %97 = call i64 @computeReal(i32 12, i64 %95, i64 %96, double %mul127, double %mul128, double %add129, i32 170)
  %add130 = fadd double %wi.0280, %add129
  %98 = call i64 @computeReal(i32 12, i64 %51, i64 %97, double %wi.0280, double %add129, double %add130, i32 171)
  %cmp68 = icmp sgt i32 %add72, %ifp1.0283
  %indvars.iv.next297 = add nsw i64 %indvars.iv296, %14
  br i1 %cmp68, label %while.cond55.loopexit, label %for.cond71.preheader

while.end134:                                     ; preds = %while.cond55.loopexit, %while.cond55.preheader
  %indvars.iv.next306 = add nsw i64 %indvars.iv305, -1
  %cmp2 = icmp sgt i64 %indvars.iv305, 1
  br i1 %cmp2, label %for.body3, label %for.end137

for.end137:                                       ; preds = %while.end134, %entry, %for.cond1.preheader
  call void @funcExit(i64 0)
  ret void
}

; Function Attrs: nounwind
declare dso_local double @sin(double) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

declare void @init()

declare void @funcInit()

declare i64 @getAddr(i8*)

declare void @setRealTemp(i64, i64)

declare void @handleMalloc(i8*, i64)

declare i64 @fpSanLoadFromShadowMem(i8*, i32)

declare void @setRealConstant(i64, double)

declare void @addReturnAddr()

declare void @checkBranch(double, i64, double, i64, i32, i1, i32, i64)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @finish()

declare i64 @handleMathFunc(i32, double, i64, double, i32)

declare void @funcExit(i64)

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
