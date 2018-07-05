; RUN: llc -mcpu=pwr9 -mtriple=powerpc64le-unknown-unknown \
; RUN:   -enable-ppc-quad-precision -ppc-vsr-nums-as-vr \
; RUN:   -verify-machineinstrs < %s | FileCheck %s

@mem = global [5 x i64] [i64 56, i64 63, i64 3, i64 5, i64 6], align 8
@umem = global [5 x i64] [i64 560, i64 100, i64 34, i64 2, i64 5], align 8
@swMem = global [5 x i32] [i32 5, i32 2, i32 3, i32 4, i32 0], align 4
@uwMem = global [5 x i32] [i32 5, i32 2, i32 3, i32 4, i32 0], align 4
@uhwMem = local_unnamed_addr global [5 x i16] [i16 5, i16 2, i16 3, i16 4, i16 0], align 2
@ubMem = local_unnamed_addr global [5 x i8] c"\05\02\03\04\00", align 1

; Function Attrs: norecurse nounwind
define void @sdwConv2qp(fp128* nocapture %a, i64 %b) {
entry:
  %conv = sitofp i64 %b to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: sdwConv2qp
; CHECK: mtvsrd [[REG:[0-9]+]], 4
; CHECK-NEXT: xscvsdqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @sdwConv2qp_02(fp128* nocapture %a) {
entry:
  %0 = load i64, i64* getelementptr inbounds 
                        ([5 x i64], [5 x i64]* @mem, i64 0, i64 2), align 8
  %conv = sitofp i64 %0 to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: sdwConv2qp_02
; CHECK: addis [[REG:[0-9]+]], 2, .LC0@toc@ha
; CHECK: ld [[REG]], .LC0@toc@l([[REG]])
; CHECK: lxsd [[REG0:[0-9]+]], 16([[REG]])
; CHECK-NEXT: xscvsdqp [[CONV:[0-9]+]], [[REG0]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @sdwConv2qp_03(fp128* nocapture %a, i64* nocapture readonly %b) {
entry:
  %0 = load i64, i64* %b, align 8
  %conv = sitofp i64 %0 to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: sdwConv2qp_03
; CHECK-NOT: ld
; CHECK: lxsd [[REG0:[0-9]+]], 0(4)
; CHECK-NEXT: xscvsdqp [[CONV:[0-9]+]], [[REG0]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @udwConv2qp(fp128* nocapture %a, i64 %b) {
entry:
  %conv = uitofp i64 %b to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: udwConv2qp
; CHECK: mtvsrd [[REG:[0-9]+]], 4
; CHECK-NEXT: xscvudqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @udwConv2qp_02(fp128* nocapture %a) {
entry:
  %0 = load i64, i64* getelementptr inbounds
                        ([5 x i64], [5 x i64]* @umem, i64 0, i64 4), align 8
  %conv = uitofp i64 %0 to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: udwConv2qp_02
; CHECK: addis [[REG:[0-9]+]], 2, .LC1@toc@ha
; CHECK: ld [[REG]], .LC1@toc@l([[REG]])
; CHECK: lxsd [[REG0:[0-9]+]], 32([[REG]])
; CHECK-NEXT: xscvudqp [[CONV:[0-9]+]], [[REG0]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @udwConv2qp_03(fp128* nocapture %a, i64* nocapture readonly %b) {
entry:
  %0 = load i64, i64* %b, align 8
  %conv = uitofp i64 %0 to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: udwConv2qp_03
; CHECK-NOT: ld
; CHECK: lxsd [[REG:[0-9]+]], 0(4)
; CHECK-NEXT: xscvudqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define fp128* @sdwConv2qp_testXForm(fp128* returned %sink,
                                    i8* nocapture readonly %a) {
entry:
  %add.ptr = getelementptr inbounds i8, i8* %a, i64 73333
  %0 = bitcast i8* %add.ptr to i64*
  %1 = load i64, i64* %0, align 8
  %conv = sitofp i64 %1 to fp128
  store fp128 %conv, fp128* %sink, align 16
  ret fp128* %sink

; CHECK-LABEL: sdwConv2qp_testXForm
; CHECK: lxsdx [[REG:[0-9]+]],
; CHECK-NEXT: xscvsdqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define fp128* @udwConv2qp_testXForm(fp128* returned %sink,
                                    i8* nocapture readonly %a) {
entry:
  %add.ptr = getelementptr inbounds i8, i8* %a, i64 73333
  %0 = bitcast i8* %add.ptr to i64*
  %1 = load i64, i64* %0, align 8
  %conv = uitofp i64 %1 to fp128
  store fp128 %conv, fp128* %sink, align 16
  ret fp128* %sink

; CHECK-LABEL: udwConv2qp_testXForm
; CHECK: lxsdx [[REG:[0-9]+]],
; CHECK-NEXT: xscvudqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @swConv2qp(fp128* nocapture %a, i32 signext %b) {
entry:
  %conv = sitofp i32 %b to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: swConv2qp
; CHECK-NOT: lwz
; CHECK: mtvsrwa [[REG:[0-9]+]], 4
; CHECK-NEXT: xscvsdqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @swConv2qp_02(fp128* nocapture %a, i32* nocapture readonly %b) {
entry:
  %0 = load i32, i32* %b, align 4
  %conv = sitofp i32 %0 to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: swConv2qp_02
; CHECK-NOT: lwz
; CHECK: lxsiwax [[REG:[0-9]+]], 0, 4
; CHECK-NEXT: xscvsdqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @swConv2qp_03(fp128* nocapture %a) {
entry:
  %0 = load i32, i32* getelementptr inbounds
                        ([5 x i32], [5 x i32]* @swMem, i64 0, i64 3), align 4
  %conv = sitofp i32 %0 to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: swConv2qp_03
; CHECK: addis [[REG:[0-9]+]], 2, .LC2@toc@ha
; CHECK: ld [[REG]], .LC2@toc@l([[REG]])
; CHECK: addi [[REG2:[0-9]+]], [[REG]], 12
; CHECK: lxsiwax [[REG0:[0-9]+]], 0, [[REG2]]
; CHECK-NEXT: xscvsdqp [[CONV:[0-9]+]], [[REG0]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @uwConv2qp(fp128* nocapture %a, i32 zeroext %b) {
entry:
  %conv = uitofp i32 %b to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: uwConv2qp
; CHECK-NOT: lwz
; CHECK: mtvsrwz [[REG:[0-9]+]], 4
; CHECK-NEXT: xscvudqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @uwConv2qp_02(fp128* nocapture %a, i32* nocapture readonly %b) {
entry:
  %0 = load i32, i32* %b, align 4
  %conv = uitofp i32 %0 to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: uwConv2qp_02
; CHECK-NOT: lwz
; CHECK: lxsiwzx [[REG:[0-9]+]], 0, 4
; CHECK-NEXT: xscvudqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @uwConv2qp_03(fp128* nocapture %a) {
entry:
  %0 = load i32, i32* getelementptr inbounds
                        ([5 x i32], [5 x i32]* @uwMem, i64 0, i64 3), align 4
  %conv = uitofp i32 %0 to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: uwConv2qp_03
; CHECK: addis [[REG:[0-9]+]], 2, .LC3@toc@ha
; CHECK-NEXT: ld [[REG]], .LC3@toc@l([[REG]])
; CHECK-NEXT: addi [[REG2:[0-9]+]], [[REG]], 12
; CHECK-NEXT: lxsiwzx [[REG1:[0-9]+]], 0, [[REG2]]
; CHECK-NEXT: xscvudqp [[CONV:[0-9]+]], [[REG1]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @uwConv2qp_04(fp128* nocapture %a,
                          i32 zeroext %b, i32* nocapture readonly %c) {
entry:
  %0 = load i32, i32* %c, align 4
  %add = add i32 %0, %b
  %conv = uitofp i32 %add to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: uwConv2qp_04
; CHECK: lwz [[REG:[0-9]+]], 0(5)
; CHECK-NEXT: add [[REG1:[0-9]+]], [[REG]], [[REG1]]
; CHECK-NEXT: mtvsrwz [[REG0:[0-9]+]], [[REG1]]
; CHECK-NEXT: xscvudqp [[CONV:[0-9]+]], [[REG0]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @uhwConv2qp(fp128* nocapture %a, i16 zeroext %b) {
entry:
  %conv = uitofp i16 %b to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void


; CHECK-LABEL: uhwConv2qp
; CHECK: mtvsrwz [[REG:[0-9]+]], 4
; CHECK-NEXT: xscvudqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @uhwConv2qp_02(fp128* nocapture %a, i16* nocapture readonly %b) {
entry:
  %0 = load i16, i16* %b, align 2
  %conv = uitofp i16 %0 to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: uhwConv2qp_02
; CHECK: lxsihzx [[REG:[0-9]+]], 0, 4
; CHECK-NEXT: xscvudqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @uhwConv2qp_03(fp128* nocapture %a) {
entry:
  %0 = load i16, i16* getelementptr inbounds
                        ([5 x i16], [5 x i16]* @uhwMem, i64 0, i64 3), align 2
  %conv = uitofp i16 %0 to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: uhwConv2qp_03
; CHECK: addis [[REG0:[0-9]+]], 2, .LC4@toc@ha
; CHECK: ld [[REG0]], .LC4@toc@l([[REG0]])
; CHECK: addi [[REG0]], [[REG0]], 6
; CHECK: lxsihzx [[REG:[0-9]+]], 0, [[REG0]]
; CHECK-NEXT: xscvudqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @uhwConv2qp_04(fp128* nocapture %a, i16 zeroext %b,
                           i16* nocapture readonly %c) {
entry:
  %conv = zext i16 %b to i32
  %0 = load i16, i16* %c, align 2
  %conv1 = zext i16 %0 to i32
  %add = add nuw nsw i32 %conv1, %conv
  %conv2 = sitofp i32 %add to fp128
  store fp128 %conv2, fp128* %a, align 16
  ret void

; CHECK-LABEL: uhwConv2qp_04
; CHECK: lhz [[REG0:[0-9]+]], 0(5)
; CHECK: add 4, [[REG0]], 4
; CHECK: mtvsrwa [[REG:[0-9]+]], 4
; CHECK-NEXT: xscvsdqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @ubConv2qp(fp128* nocapture %a, i8 zeroext %b) {
entry:
  %conv = uitofp i8 %b to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: ubConv2qp
; CHECK: mtvsrwz [[REG:[0-9]+]], 4
; CHECK-NEXT: xscvudqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @ubConv2qp_02(fp128* nocapture %a, i8* nocapture readonly %b) {
entry:
  %0 = load i8, i8* %b, align 1
  %conv = uitofp i8 %0 to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: ubConv2qp_02
; CHECK: lxsibzx [[REG:[0-9]+]], 0, 4
; CHECK-NEXT: xscvudqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @ubConv2qp_03(fp128* nocapture %a) {
entry:
  %0 = load i8, i8* getelementptr inbounds 
                      ([5 x i8], [5 x i8]* @ubMem, i64 0, i64 2), align 1
  %conv = uitofp i8 %0 to fp128
  store fp128 %conv, fp128* %a, align 16
  ret void

; CHECK-LABEL: ubConv2qp_03
; CHECK: addis [[REG0:[0-9]+]], 2, .LC5@toc@ha
; CHECK: ld [[REG0]], .LC5@toc@l([[REG0]])
; CHECK: addi [[REG0]], [[REG0]], 2
; CHECK: lxsibzx [[REG:[0-9]+]], 0, [[REG0]]
; CHECK-NEXT: xscvudqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

; Function Attrs: norecurse nounwind
define void @ubConv2qp_04(fp128* nocapture %a, i8 zeroext %b,
                          i8* nocapture readonly %c) {
entry:
  %conv = zext i8 %b to i32
  %0 = load i8, i8* %c, align 1
  %conv1 = zext i8 %0 to i32
  %add = add nuw nsw i32 %conv1, %conv
  %conv2 = sitofp i32 %add to fp128
  store fp128 %conv2, fp128* %a, align 16
  ret void

; CHECK-LABEL: ubConv2qp_04
; CHECK: lbz [[REG0:[0-9]+]], 0(5)
; CHECK: add 4, [[REG0]], 4
; CHECK: mtvsrwa [[REG:[0-9]+]], 4
; CHECK-NEXT: xscvsdqp [[CONV:[0-9]+]], [[REG]]
; CHECK-NEXT: stxv [[CONV]], 0(3)
; CHECK-NEXT: blr
}

;  Convert QP to DP

@f128Array = global [4 x fp128]
                      [fp128 0xL00000000000000004004C00000000000,
                       fp128 0xLF000000000000000400808AB851EB851,
                       fp128 0xL5000000000000000400E0C26324C8366,
                       fp128 0xL8000000000000000400A24E2E147AE14], align 16
@f128global = global fp128 0xL300000000000000040089CA8F5C28F5C, align 16

; Function Attrs: norecurse nounwind readonly
define double @qpConv2dp(fp128* nocapture readonly %a) {
; CHECK-LABEL: qpConv2dp:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lxv 2, 0(3)
; CHECK-NEXT:    xscvqpdp 2, 2
; CHECK-NEXT:    xxlor 1, 2, 2
; CHECK-NEXT:    blr
entry:
  %0 = load fp128, fp128* %a, align 16
  %conv = fptrunc fp128 %0 to double
  ret double %conv
}

; Function Attrs: norecurse nounwind
define void @qpConv2dp_02(double* nocapture %res) {
; CHECK-LABEL: qpConv2dp_02:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addis 4, 2, .LC6@toc@ha
; CHECK-NEXT:    ld 4, .LC6@toc@l(4)
; CHECK-NEXT:    lxvx 2, 0, 4
; CHECK-NEXT:    xscvqpdp 2, 2
; CHECK-NEXT:    stxsd 2, 0(3)
; CHECK-NEXT:    blr
entry:
  %0 = load fp128, fp128* @f128global, align 16
  %conv = fptrunc fp128 %0 to double
  store double %conv, double* %res, align 8
  ret void
}

; Function Attrs: norecurse nounwind
define void @qpConv2dp_03(double* nocapture %res, i32 signext %idx) {
; CHECK-LABEL: qpConv2dp_03:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addis 5, 2, .LC7@toc@ha
; CHECK-NEXT:    sldi 4, 4, 3
; CHECK-NEXT:    ld 5, .LC7@toc@l(5)
; CHECK-NEXT:    lxvx 2, 0, 5
; CHECK-NEXT:    xscvqpdp 2, 2
; CHECK-NEXT:    stxsdx 2, 3, 4
; CHECK-NEXT:    blr
entry:
  %0 = load fp128, fp128* getelementptr inbounds ([4 x fp128], [4 x fp128]* @f128Array, i64 0, i64 0), align 16
  %conv = fptrunc fp128 %0 to double
  %idxprom = sext i32 %idx to i64
  %arrayidx = getelementptr inbounds double, double* %res, i64 %idxprom
  store double %conv, double* %arrayidx, align 8
  ret void
}

; Function Attrs: norecurse nounwind
define void @qpConv2dp_04(fp128* nocapture readonly %a, fp128* nocapture readonly %b, double* nocapture %res) {
; CHECK-LABEL: qpConv2dp_04:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lxv 2, 0(3)
; CHECK-NEXT:    lxv 3, 0(4)
; CHECK-NEXT:    xsaddqp 2, 2, 3
; CHECK-NEXT:    xscvqpdp 2, 2
; CHECK-NEXT:    stxsd 2, 0(5)
; CHECK-NEXT:    blr
entry:
  %0 = load fp128, fp128* %a, align 16
  %1 = load fp128, fp128* %b, align 16
  %add = fadd fp128 %0, %1
  %conv = fptrunc fp128 %add to double
  store double %conv, double* %res, align 8
  ret void
}

;  Convert QP to SP

; Function Attrs: norecurse nounwind readonly
define float @qpConv2sp(fp128* nocapture readonly %a) {
; CHECK-LABEL: qpConv2sp:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lxv 2, 0(3)
; CHECK-NEXT:    xscvqpdpo 2, 2
; CHECK-NEXT:    xsrsp 1, 2
; CHECK-NEXT:    blr
entry:
  %0 = load fp128, fp128* %a, align 16
  %conv = fptrunc fp128 %0 to float
  ret float %conv
}

; Function Attrs: norecurse nounwind
define void @qpConv2sp_02(float* nocapture %res) {
; CHECK-LABEL: qpConv2sp_02:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addis 4, 2, .LC6@toc@ha
; CHECK-NEXT:    ld 4, .LC6@toc@l(4)
; CHECK-NEXT:    lxvx 2, 0, 4
; CHECK-NEXT:    xscvqpdpo 2, 2
; CHECK-NEXT:    xsrsp 0, 2
; CHECK-NEXT:    stfs 0, 0(3)
; CHECK-NEXT:    blr
entry:
  %0 = load fp128, fp128* @f128global, align 16
  %conv = fptrunc fp128 %0 to float
  store float %conv, float* %res, align 4
  ret void
}

; Function Attrs: norecurse nounwind
define void @qpConv2sp_03(float* nocapture %res, i32 signext %idx) {
; CHECK-LABEL: qpConv2sp_03:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addis 5, 2, .LC7@toc@ha
; CHECK-NEXT:    sldi 4, 4, 2
; CHECK-NEXT:    ld 5, .LC7@toc@l(5)
; CHECK-NEXT:    lxv 2, 48(5)
; CHECK-NEXT:    xscvqpdpo 2, 2
; CHECK-NEXT:    xsrsp 0, 2
; CHECK-NEXT:    stfsx 0, 3, 4
; CHECK-NEXT:    blr
entry:
  %0 = load fp128, fp128* getelementptr inbounds ([4 x fp128], [4 x fp128]* @f128Array, i64 0, i64 3), align 16
  %conv = fptrunc fp128 %0 to float
  %idxprom = sext i32 %idx to i64
  %arrayidx = getelementptr inbounds float, float* %res, i64 %idxprom
  store float %conv, float* %arrayidx, align 4
  ret void
}

; Function Attrs: norecurse nounwind
define void @qpConv2sp_04(fp128* nocapture readonly %a, fp128* nocapture readonly %b, float* nocapture %res) {
; CHECK-LABEL: qpConv2sp_04:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lxv 2, 0(3)
; CHECK-NEXT:    lxv 3, 0(4)
; CHECK-NEXT:    xsaddqp 2, 2, 3
; CHECK-NEXT:    xscvqpdpo 2, 2
; CHECK-NEXT:    xsrsp 0, 2
; CHECK-NEXT:    stfs 0, 0(5)
; CHECK-NEXT:    blr
entry:
  %0 = load fp128, fp128* %a, align 16
  %1 = load fp128, fp128* %b, align 16
  %add = fadd fp128 %0, %1
  %conv = fptrunc fp128 %add to float
  store float %conv, float* %res, align 4
  ret void
}

@f128Glob = common global fp128 0xL00000000000000000000000000000000, align 16

; Function Attrs: norecurse nounwind readnone
define fp128 @dpConv2qp(double %a) {
; CHECK-LABEL: dpConv2qp:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xxlor 2, 1, 1
; CHECK-NEXT:    xscvdpqp 2, 2
; CHECK-NEXT:    blr
entry:
  %conv = fpext double %a to fp128
  ret fp128 %conv
}

; Function Attrs: norecurse nounwind
define void @dpConv2qp_02(double* nocapture readonly %a) {
; CHECK-LABEL: dpConv2qp_02:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lxsd 2, 0(3)
; CHECK-NEXT:    addis 3, 2, .LC8@toc@ha
; CHECK-NEXT:    ld 3, .LC8@toc@l(3)
; CHECK-NEXT:    xscvdpqp 2, 2
; CHECK-NEXT:    stxvx 2, 0, 3
; CHECK-NEXT:    blr
entry:
  %0 = load double, double* %a, align 8
  %conv = fpext double %0 to fp128
  store fp128 %conv, fp128* @f128Glob, align 16
  ret void
}

; Function Attrs: norecurse nounwind
define void @dpConv2qp_02b(double* nocapture readonly %a, i32 signext %idx) {
; CHECK-LABEL: dpConv2qp_02b:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sldi 4, 4, 3
; CHECK-NEXT:    lxsdx 2, 3, 4
; CHECK-NEXT:    addis 3, 2, .LC8@toc@ha
; CHECK-NEXT:    ld 3, .LC8@toc@l(3)
; CHECK-NEXT:    xscvdpqp 2, 2
; CHECK-NEXT:    stxvx 2, 0, 3
; CHECK-NEXT:    blr
entry:
  %idxprom = sext i32 %idx to i64
  %arrayidx = getelementptr inbounds double, double* %a, i64 %idxprom
  %0 = load double, double* %arrayidx, align 8
  %conv = fpext double %0 to fp128
  store fp128 %conv, fp128* @f128Glob, align 16
  ret void
}

; Function Attrs: norecurse nounwind
define void @dpConv2qp_03(fp128* nocapture %res, i32 signext %idx, double %a) {
; CHECK-LABEL: dpConv2qp_03:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xxlor 2, 1, 1
; CHECK-NEXT:    sldi 4, 4, 4
; CHECK-NEXT:    xscvdpqp 2, 2
; CHECK-NEXT:    stxvx 2, 3, 4
; CHECK-NEXT:    blr
entry:
  %conv = fpext double %a to fp128
  %idxprom = sext i32 %idx to i64
  %arrayidx = getelementptr inbounds fp128, fp128* %res, i64 %idxprom
  store fp128 %conv, fp128* %arrayidx, align 16
  ret void
}

; Function Attrs: norecurse nounwind
define void @dpConv2qp_04(double %a, fp128* nocapture %res) {
; CHECK-LABEL: dpConv2qp_04:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xxlor 2, 1, 1
; CHECK-NEXT:    xscvdpqp 2, 2
; CHECK-NEXT:    stxv 2, 0(4)
; CHECK-NEXT:    blr
entry:
  %conv = fpext double %a to fp128
  store fp128 %conv, fp128* %res, align 16
  ret void
}

; Function Attrs: norecurse nounwind readnone
define fp128 @spConv2qp(float %a) {
; CHECK-LABEL: spConv2qp:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xxlor 2, 1, 1
; CHECK-NEXT:    xscvdpqp 2, 2
; CHECK-NEXT:    blr
entry:
  %conv = fpext float %a to fp128
  ret fp128 %conv
}

; Function Attrs: norecurse nounwind
define void @spConv2qp_02(float* nocapture readonly %a) {
; CHECK-LABEL: spConv2qp_02:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    lxssp 2, 0(3)
; CHECK-NEXT:    addis 3, 2, .LC8@toc@ha
; CHECK-NEXT:    ld 3, .LC8@toc@l(3)
; CHECK-NEXT:    xscvdpqp 2, 2
; CHECK-NEXT:    stxvx 2, 0, 3
; CHECK-NEXT:    blr
entry:
  %0 = load float, float* %a, align 4
  %conv = fpext float %0 to fp128
  store fp128 %conv, fp128* @f128Glob, align 16
  ret void
}

; Function Attrs: norecurse nounwind
define void @spConv2qp_02b(float* nocapture readonly %a, i32 signext %idx) {
; CHECK-LABEL: spConv2qp_02b:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    sldi 4, 4, 2
; CHECK-NEXT:    lxsspx 2, 3, 4
; CHECK-NEXT:    addis 3, 2, .LC8@toc@ha
; CHECK-NEXT:    ld 3, .LC8@toc@l(3)
; CHECK-NEXT:    xscvdpqp 2, 2
; CHECK-NEXT:    stxvx 2, 0, 3
; CHECK-NEXT:    blr
entry:
  %idxprom = sext i32 %idx to i64
  %arrayidx = getelementptr inbounds float, float* %a, i64 %idxprom
  %0 = load float, float* %arrayidx, align 4
  %conv = fpext float %0 to fp128
  store fp128 %conv, fp128* @f128Glob, align 16
  ret void
}

; Function Attrs: norecurse nounwind
define void @spConv2qp_03(fp128* nocapture %res, i32 signext %idx, float %a) {
; CHECK-LABEL: spConv2qp_03:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xxlor 2, 1, 1
; CHECK-NEXT:    sldi 4, 4, 4
; CHECK-NEXT:    xscvdpqp 2, 2
; CHECK-NEXT:    stxvx 2, 3, 4
; CHECK-NEXT:    blr
entry:
  %conv = fpext float %a to fp128
  %idxprom = sext i32 %idx to i64
  %arrayidx = getelementptr inbounds fp128, fp128* %res, i64 %idxprom
  store fp128 %conv, fp128* %arrayidx, align 16
  ret void
}

; Function Attrs: norecurse nounwind
define void @spConv2qp_04(float %a, fp128* nocapture %res) {
; CHECK-LABEL: spConv2qp_04:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xxlor 2, 1, 1
; CHECK-NEXT:    xscvdpqp 2, 2
; CHECK-NEXT:    stxv 2, 0(4)
; CHECK-NEXT:    blr
entry:
  %conv = fpext float %a to fp128
  store fp128 %conv, fp128* %res, align 16
  ret void
}