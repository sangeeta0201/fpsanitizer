; ModuleID = 'matmul_f64_4x4_inst.bc'
source_filename = "matmul_f64_4x4.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.A = private unnamed_addr constant [4 x [4 x double]] [[4 x double] [double 4.500000e+00, double 1.300000e+00, double 6.000000e+00, double 4.100000e+00], [4 x double] [double 2.500000e+00, double 7.200000e+00, double 7.700000e+00, double 1.700000e+00], [4 x double] [double 6.700000e+00, double 1.300000e+00, double 9.400000e+00, double 1.300000e+00], [4 x double] [double 1.100000e+00, double 2.200000e+00, double 3.000000e+00, double 2.100000e+00]], align 16
@main.B = private unnamed_addr constant [4 x [4 x double]] [[4 x double] [double 1.000000e+00, double 7.900000e+00, double 5.100000e+00, double 3.400000e+00], [4 x double] [double 6.600000e+00, double 2.800000e+00, double 5.400000e+00, double 0x4022666666666666], [4 x double] [double 5.000000e+00, double 4.100000e+00, double 4.100000e+00, double 9.900000e+00], [4 x double] [double 8.400000e+00, double 3.700000e+00, double 9.500000e+00, double 6.400000e+00]], align 16
@.str = private unnamed_addr constant [6 x i8] c"%8.2f\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @wrap_mul4(double* nocapture %Out, [4 x double]* nocapture readonly %A, [4 x double]* nocapture readonly %B) local_unnamed_addr #0 {
entry:
  %0 = bitcast void (double*, [4 x double]*, [4 x double]*)* @wrap_mul4 to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  tail call fastcc void @mul4(double* %Out, [4 x double]* %A, [4 x double]* %B)
  %2 = bitcast void (double*, [4 x double]*, [4 x double]*)* @wrap_mul4 to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @funcExit(i64 %3)
  ret void
}

; Function Attrs: nounwind uwtable
define internal fastcc void @mul4(double* nocapture %Out, [4 x double]* nocapture readonly %A, [4 x double]* nocapture readonly %B) unnamed_addr #1 {
for.end:
  %0 = bitcast void (double*, [4 x double]*, [4 x double]*)* @mul4 to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %Out516 = bitcast double* %Out to i8*
  %Res = alloca [16 x double], align 16
  %2 = bitcast [16 x double]* %Res to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %2) #4
  %arrayidx1 = getelementptr inbounds [4 x double], [4 x double]* %A, i64 0, i64 0
  %3 = load double, double* %arrayidx1, align 8, !tbaa !2
  %arrayidx3 = getelementptr inbounds [4 x double], [4 x double]* %B, i64 0, i64 0
  %4 = load double, double* %arrayidx3, align 8, !tbaa !2
  %mul = fmul double %3, %4
  %arrayidx5 = getelementptr inbounds [4 x double], [4 x double]* %A, i64 0, i64 1
  %5 = load double, double* %arrayidx5, align 8, !tbaa !2
  %arrayidx7 = getelementptr inbounds [4 x double], [4 x double]* %B, i64 1, i64 0
  %6 = load double, double* %arrayidx7, align 8, !tbaa !2
  %mul8 = fmul double %5, %6
  %add = fadd double %mul, %mul8
  %arrayidx10 = getelementptr inbounds [4 x double], [4 x double]* %A, i64 0, i64 2
  %7 = load double, double* %arrayidx10, align 8, !tbaa !2
  %arrayidx12 = getelementptr inbounds [4 x double], [4 x double]* %B, i64 2, i64 0
  %8 = load double, double* %arrayidx12, align 8, !tbaa !2
  %mul13 = fmul double %7, %8
  %add14 = fadd double %add, %mul13
  %arrayidx16 = getelementptr inbounds [4 x double], [4 x double]* %A, i64 0, i64 3
  %9 = load double, double* %arrayidx16, align 8, !tbaa !2
  %arrayidx18 = getelementptr inbounds [4 x double], [4 x double]* %B, i64 3, i64 0
  %10 = load double, double* %arrayidx18, align 8, !tbaa !2
  %mul19 = fmul double %9, %10
  %add20 = fadd double %add14, %mul19
  %arrayidx21 = getelementptr inbounds [16 x double], [16 x double]* %Res, i64 0, i64 0
  store double %add20, double* %arrayidx21, align 16, !tbaa !2
  %arrayidx25 = getelementptr inbounds [4 x double], [4 x double]* %B, i64 0, i64 1
  %11 = load double, double* %arrayidx25, align 8, !tbaa !2
  %mul26 = fmul double %3, %11
  %arrayidx30 = getelementptr inbounds [4 x double], [4 x double]* %B, i64 1, i64 1
  %12 = load double, double* %arrayidx30, align 8, !tbaa !2
  %mul31 = fmul double %5, %12
  %add32 = fadd double %mul26, %mul31
  %arrayidx36 = getelementptr inbounds [4 x double], [4 x double]* %B, i64 2, i64 1
  %13 = load double, double* %arrayidx36, align 8, !tbaa !2
  %mul37 = fmul double %7, %13
  %add38 = fadd double %add32, %mul37
  %arrayidx42 = getelementptr inbounds [4 x double], [4 x double]* %B, i64 3, i64 1
  %14 = load double, double* %arrayidx42, align 8, !tbaa !2
  %mul43 = fmul double %9, %14
  %add44 = fadd double %add38, %mul43
  %arrayidx45 = getelementptr inbounds [16 x double], [16 x double]* %Res, i64 0, i64 1
  store double %add44, double* %arrayidx45, align 8, !tbaa !2
  %arrayidx49 = getelementptr inbounds [4 x double], [4 x double]* %B, i64 0, i64 2
  %15 = load double, double* %arrayidx49, align 8, !tbaa !2
  %mul50 = fmul double %3, %15
  %arrayidx54 = getelementptr inbounds [4 x double], [4 x double]* %B, i64 1, i64 2
  %16 = load double, double* %arrayidx54, align 8, !tbaa !2
  %mul55 = fmul double %5, %16
  %add56 = fadd double %mul50, %mul55
  %arrayidx60 = getelementptr inbounds [4 x double], [4 x double]* %B, i64 2, i64 2
  %17 = load double, double* %arrayidx60, align 8, !tbaa !2
  %mul61 = fmul double %7, %17
  %add62 = fadd double %add56, %mul61
  %arrayidx66 = getelementptr inbounds [4 x double], [4 x double]* %B, i64 3, i64 2
  %18 = load double, double* %arrayidx66, align 8, !tbaa !2
  %mul67 = fmul double %9, %18
  %add68 = fadd double %add62, %mul67
  %arrayidx69 = getelementptr inbounds [16 x double], [16 x double]* %Res, i64 0, i64 2
  store double %add68, double* %arrayidx69, align 16, !tbaa !2
  %arrayidx73 = getelementptr inbounds [4 x double], [4 x double]* %B, i64 0, i64 3
  %19 = load double, double* %arrayidx73, align 8, !tbaa !2
  %mul74 = fmul double %3, %19
  %arrayidx78 = getelementptr inbounds [4 x double], [4 x double]* %B, i64 1, i64 3
  %20 = load double, double* %arrayidx78, align 8, !tbaa !2
  %mul79 = fmul double %5, %20
  %add80 = fadd double %mul74, %mul79
  %arrayidx84 = getelementptr inbounds [4 x double], [4 x double]* %B, i64 2, i64 3
  %21 = load double, double* %arrayidx84, align 8, !tbaa !2
  %mul85 = fmul double %7, %21
  %add86 = fadd double %add80, %mul85
  %arrayidx90 = getelementptr inbounds [4 x double], [4 x double]* %B, i64 3, i64 3
  %22 = load double, double* %arrayidx90, align 8, !tbaa !2
  %mul91 = fmul double %9, %22
  %add92 = fadd double %add86, %mul91
  %arrayidx93 = getelementptr inbounds [16 x double], [16 x double]* %Res, i64 0, i64 3
  store double %add92, double* %arrayidx93, align 8, !tbaa !2
  %arrayidx95 = getelementptr inbounds [4 x double], [4 x double]* %A, i64 1, i64 0
  %23 = load double, double* %arrayidx95, align 8, !tbaa !2
  %mul98 = fmul double %4, %23
  %arrayidx100 = getelementptr inbounds [4 x double], [4 x double]* %A, i64 1, i64 1
  %24 = load double, double* %arrayidx100, align 8, !tbaa !2
  %mul103 = fmul double %6, %24
  %add104 = fadd double %mul98, %mul103
  %arrayidx106 = getelementptr inbounds [4 x double], [4 x double]* %A, i64 1, i64 2
  %25 = load double, double* %arrayidx106, align 8, !tbaa !2
  %mul109 = fmul double %8, %25
  %add110 = fadd double %add104, %mul109
  %arrayidx112 = getelementptr inbounds [4 x double], [4 x double]* %A, i64 1, i64 3
  %26 = load double, double* %arrayidx112, align 8, !tbaa !2
  %mul115 = fmul double %10, %26
  %add116 = fadd double %add110, %mul115
  %arrayidx117 = getelementptr inbounds [16 x double], [16 x double]* %Res, i64 0, i64 4
  store double %add116, double* %arrayidx117, align 16, !tbaa !2
  %mul122 = fmul double %11, %23
  %mul127 = fmul double %12, %24
  %add128 = fadd double %mul122, %mul127
  %mul133 = fmul double %13, %25
  %add134 = fadd double %add128, %mul133
  %mul139 = fmul double %14, %26
  %add140 = fadd double %add134, %mul139
  %arrayidx141 = getelementptr inbounds [16 x double], [16 x double]* %Res, i64 0, i64 5
  store double %add140, double* %arrayidx141, align 8, !tbaa !2
  %mul146 = fmul double %15, %23
  %mul151 = fmul double %16, %24
  %add152 = fadd double %mul146, %mul151
  %mul157 = fmul double %17, %25
  %add158 = fadd double %add152, %mul157
  %mul163 = fmul double %18, %26
  %add164 = fadd double %add158, %mul163
  %arrayidx165 = getelementptr inbounds [16 x double], [16 x double]* %Res, i64 0, i64 6
  store double %add164, double* %arrayidx165, align 16, !tbaa !2
  %mul170 = fmul double %19, %23
  %mul175 = fmul double %20, %24
  %add176 = fadd double %mul170, %mul175
  %mul181 = fmul double %21, %25
  %add182 = fadd double %add176, %mul181
  %mul187 = fmul double %22, %26
  %add188 = fadd double %add182, %mul187
  %arrayidx189 = getelementptr inbounds [16 x double], [16 x double]* %Res, i64 0, i64 7
  store double %add188, double* %arrayidx189, align 8, !tbaa !2
  %arrayidx191 = getelementptr inbounds [4 x double], [4 x double]* %A, i64 2, i64 0
  %27 = load double, double* %arrayidx191, align 8, !tbaa !2
  %mul194 = fmul double %4, %27
  %arrayidx196 = getelementptr inbounds [4 x double], [4 x double]* %A, i64 2, i64 1
  %28 = load double, double* %arrayidx196, align 8, !tbaa !2
  %mul199 = fmul double %6, %28
  %add200 = fadd double %mul194, %mul199
  %arrayidx202 = getelementptr inbounds [4 x double], [4 x double]* %A, i64 2, i64 2
  %29 = load double, double* %arrayidx202, align 8, !tbaa !2
  %mul205 = fmul double %8, %29
  %add206 = fadd double %add200, %mul205
  %arrayidx208 = getelementptr inbounds [4 x double], [4 x double]* %A, i64 2, i64 3
  %30 = load double, double* %arrayidx208, align 8, !tbaa !2
  %mul211 = fmul double %10, %30
  %add212 = fadd double %add206, %mul211
  %arrayidx213 = getelementptr inbounds [16 x double], [16 x double]* %Res, i64 0, i64 8
  store double %add212, double* %arrayidx213, align 16, !tbaa !2
  %mul218 = fmul double %11, %27
  %mul223 = fmul double %12, %28
  %add224 = fadd double %mul218, %mul223
  %mul229 = fmul double %13, %29
  %add230 = fadd double %add224, %mul229
  %mul235 = fmul double %14, %30
  %add236 = fadd double %add230, %mul235
  %arrayidx237 = getelementptr inbounds [16 x double], [16 x double]* %Res, i64 0, i64 9
  store double %add236, double* %arrayidx237, align 8, !tbaa !2
  %mul242 = fmul double %15, %27
  %mul247 = fmul double %16, %28
  %add248 = fadd double %mul242, %mul247
  %mul253 = fmul double %17, %29
  %add254 = fadd double %add248, %mul253
  %mul259 = fmul double %18, %30
  %add260 = fadd double %add254, %mul259
  %arrayidx261 = getelementptr inbounds [16 x double], [16 x double]* %Res, i64 0, i64 10
  store double %add260, double* %arrayidx261, align 16, !tbaa !2
  %mul266 = fmul double %19, %27
  %mul271 = fmul double %20, %28
  %add272 = fadd double %mul266, %mul271
  %mul277 = fmul double %21, %29
  %add278 = fadd double %add272, %mul277
  %mul283 = fmul double %22, %30
  %add284 = fadd double %add278, %mul283
  %arrayidx285 = getelementptr inbounds [16 x double], [16 x double]* %Res, i64 0, i64 11
  store double %add284, double* %arrayidx285, align 8, !tbaa !2
  %arrayidx287 = getelementptr inbounds [4 x double], [4 x double]* %A, i64 3, i64 0
  %31 = load double, double* %arrayidx287, align 8, !tbaa !2
  %mul290 = fmul double %4, %31
  %arrayidx292 = getelementptr inbounds [4 x double], [4 x double]* %A, i64 3, i64 1
  %32 = load double, double* %arrayidx292, align 8, !tbaa !2
  %mul295 = fmul double %6, %32
  %add296 = fadd double %mul290, %mul295
  %arrayidx298 = getelementptr inbounds [4 x double], [4 x double]* %A, i64 3, i64 2
  %33 = load double, double* %arrayidx298, align 8, !tbaa !2
  %mul301 = fmul double %8, %33
  %add302 = fadd double %add296, %mul301
  %arrayidx304 = getelementptr inbounds [4 x double], [4 x double]* %A, i64 3, i64 3
  %34 = load double, double* %arrayidx304, align 8, !tbaa !2
  %mul307 = fmul double %10, %34
  %add308 = fadd double %add302, %mul307
  %arrayidx309 = getelementptr inbounds [16 x double], [16 x double]* %Res, i64 0, i64 12
  store double %add308, double* %arrayidx309, align 16, !tbaa !2
  %mul314 = fmul double %11, %31
  %mul319 = fmul double %12, %32
  %add320 = fadd double %mul314, %mul319
  %mul325 = fmul double %13, %33
  %add326 = fadd double %add320, %mul325
  %mul331 = fmul double %14, %34
  %add332 = fadd double %add326, %mul331
  %arrayidx333 = getelementptr inbounds [16 x double], [16 x double]* %Res, i64 0, i64 13
  store double %add332, double* %arrayidx333, align 8, !tbaa !2
  %mul338 = fmul double %15, %31
  %mul343 = fmul double %16, %32
  %add344 = fadd double %mul338, %mul343
  %mul349 = fmul double %17, %33
  %add350 = fadd double %add344, %mul349
  %mul355 = fmul double %18, %34
  %add356 = fadd double %add350, %mul355
  %arrayidx357 = getelementptr inbounds [16 x double], [16 x double]* %Res, i64 0, i64 14
  store double %add356, double* %arrayidx357, align 16, !tbaa !2
  %mul362 = fmul double %19, %31
  %mul367 = fmul double %20, %32
  %add368 = fadd double %mul362, %mul367
  %mul373 = fmul double %21, %33
  %add374 = fadd double %add368, %mul373
  %mul379 = fmul double %22, %34
  %add380 = fadd double %add374, %mul379
  %arrayidx381 = getelementptr inbounds [16 x double], [16 x double]* %Res, i64 0, i64 15
  store double %add380, double* %arrayidx381, align 8, !tbaa !2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %Out516, i8* nonnull align 16 %2, i64 128, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %2) #4
  %35 = bitcast void (double*, [4 x double]*, [4 x double]*)* @mul4 to i8*
  %36 = call i64 @getAddr(i8* %35)
  call void @funcExit(i64 %36)
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
entry:
  %0 = bitcast i32 ()* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %A = alloca [4 x [4 x double]], align 16
  %B = alloca [4 x [4 x double]], align 16
  %C = alloca [4 x [4 x double]], align 16
  %2 = bitcast [4 x [4 x double]]* %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %2) #4
  %3 = bitcast i8* %2 to i8*
  %4 = bitcast i8* bitcast ([4 x [4 x double]]* @main.A to i8*) to i8*
  %5 = bitcast i64 128 to i64
  %6 = call i64 @getAddr(i8* %3)
  %7 = call i64 @getAddr(i8* %4)
  call void @handleLLVMMemcpy(i64 %6, i64 %7, i64 %5)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %2, i8* align 16 bitcast ([4 x [4 x double]]* @main.A to i8*), i64 128, i1 false)
  %8 = bitcast [4 x [4 x double]]* %B to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %8) #4
  %9 = bitcast i8* %8 to i8*
  %10 = bitcast i8* bitcast ([4 x [4 x double]]* @main.B to i8*) to i8*
  %11 = bitcast i64 128 to i64
  %12 = call i64 @getAddr(i8* %9)
  %13 = call i64 @getAddr(i8* %10)
  call void @handleLLVMMemcpy(i64 %12, i64 %13, i64 %11)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %8, i8* align 16 bitcast ([4 x [4 x double]]* @main.B to i8*), i64 128, i1 false)
  %14 = bitcast [4 x [4 x double]]* %C to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %14) #4
  %arrayidx1 = getelementptr inbounds [4 x [4 x double]], [4 x [4 x double]]* %C, i64 0, i64 0, i64 0
  %arraydecay = getelementptr inbounds [4 x [4 x double]], [4 x [4 x double]]* %A, i64 0, i64 0
  %arraydecay2 = getelementptr inbounds [4 x [4 x double]], [4 x [4 x double]]* %B, i64 0, i64 0
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %n.030 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  call void @wrap_mul4(double* nonnull %arrayidx1, [4 x double]* nonnull %arraydecay, [4 x double]* nonnull %arraydecay2)
  %inc = add nuw nsw i32 %n.030, 1
  %cmp = icmp eq i32 %inc, 1000000
  br i1 %cmp, label %for.cond6.preheader, label %for.body

for.cond6.preheader:                              ; preds = %for.body, %for.end14
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.end14 ], [ 0, %for.body ]
  br label %for.body8

for.body8:                                        ; preds = %for.cond6.preheader, %for.body8
  %indvars.iv = phi i64 [ 0, %for.cond6.preheader ], [ %indvars.iv.next, %for.body8 ]
  %arrayidx11 = getelementptr inbounds [4 x [4 x double]], [4 x [4 x double]]* %C, i64 0, i64 %indvars.iv31, i64 %indvars.iv
  %15 = bitcast double* %arrayidx11 to i8*
  %16 = call i64 @getAddr(i8* %15)
  %17 = load double, double* %arrayidx11, align 8, !tbaa !2
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), double %17)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp7 = icmp eq i64 %indvars.iv.next, 4
  br i1 %cmp7, label %for.end14, label %for.body8

for.end14:                                        ; preds = %for.body8
  %putchar = tail call i32 @putchar(i32 10)
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %cmp4 = icmp eq i64 %indvars.iv.next32, 4
  br i1 %cmp4, label %for.end18, label %for.cond6.preheader

for.end18:                                        ; preds = %for.end14
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %14) #4
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %8) #4
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %2) #4
  %18 = bitcast i32 ()* @main to i8*
  %19 = call i64 @getAddr(i8* %18)
  call void @funcExit(i64 %19)
  call void @finish()
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #2

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #4

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @funcExit(i64)

declare void @handleLLVMMemcpy(i64, i64, i64)

declare void @finish()

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
