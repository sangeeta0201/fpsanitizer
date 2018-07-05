; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64-unknown-linux-gnu < %s | FileCheck %s

; https://bugs.llvm.org/show_bug.cgi?id=37104

; X: [byte3]              [byte0]
; Y:        [byte2][byte1]

define i8 @out8_constmask(i8 %x, i8 %y) {
; CHECK-LABEL: out8_constmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    lsr w8, w0, #2
; CHECK-NEXT:    bfi w1, w8, #2, #4
; CHECK-NEXT:    mov w0, w1
; CHECK-NEXT:    ret
  %mx = and i8 %x, 60
  %my = and i8 %y, -61
  %r = or i8 %mx, %my
  ret i8 %r
}

define i16 @out16_constmask(i16 %x, i16 %y) {
; CHECK-LABEL: out16_constmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    lsr w8, w0, #4
; CHECK-NEXT:    bfi w1, w8, #4, #8
; CHECK-NEXT:    mov w0, w1
; CHECK-NEXT:    ret
  %mx = and i16 %x, 4080
  %my = and i16 %y, -4081
  %r = or i16 %mx, %my
  ret i16 %r
}

define i32 @out32_constmask(i32 %x, i32 %y) {
; CHECK-LABEL: out32_constmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    lsr w8, w0, #8
; CHECK-NEXT:    bfi w1, w8, #8, #16
; CHECK-NEXT:    mov w0, w1
; CHECK-NEXT:    ret
  %mx = and i32 %x, 16776960
  %my = and i32 %y, -16776961
  %r = or i32 %mx, %my
  ret i32 %r
}

define i64 @out64_constmask(i64 %x, i64 %y) {
; CHECK-LABEL: out64_constmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    lsr x8, x0, #16
; CHECK-NEXT:    bfi x1, x8, #16, #32
; CHECK-NEXT:    mov x0, x1
; CHECK-NEXT:    ret
  %mx = and i64 %x, 281474976645120
  %my = and i64 %y, -281474976645121
  %r = or i64 %mx, %my
  ret i64 %r
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Should be the same as the previous one.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

define i8 @in8_constmask(i8 %x, i8 %y) {
; CHECK-LABEL: in8_constmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor w8, w0, w1
; CHECK-NEXT:    and w8, w8, #0x3c
; CHECK-NEXT:    eor w0, w8, w1
; CHECK-NEXT:    ret
  %n0 = xor i8 %x, %y
  %n1 = and i8 %n0, 60
  %r = xor i8 %n1, %y
  ret i8 %r
}

define i16 @in16_constmask(i16 %x, i16 %y) {
; CHECK-LABEL: in16_constmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor w8, w0, w1
; CHECK-NEXT:    and w8, w8, #0xff0
; CHECK-NEXT:    eor w0, w8, w1
; CHECK-NEXT:    ret
  %n0 = xor i16 %x, %y
  %n1 = and i16 %n0, 4080
  %r = xor i16 %n1, %y
  ret i16 %r
}

define i32 @in32_constmask(i32 %x, i32 %y) {
; CHECK-LABEL: in32_constmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor w8, w0, w1
; CHECK-NEXT:    and w8, w8, #0xffff00
; CHECK-NEXT:    eor w0, w8, w1
; CHECK-NEXT:    ret
  %n0 = xor i32 %x, %y
  %n1 = and i32 %n0, 16776960
  %r = xor i32 %n1, %y
  ret i32 %r
}

define i64 @in64_constmask(i64 %x, i64 %y) {
; CHECK-LABEL: in64_constmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor x8, x0, x1
; CHECK-NEXT:    and x8, x8, #0xffffffff0000
; CHECK-NEXT:    eor x0, x8, x1
; CHECK-NEXT:    ret
  %n0 = xor i64 %x, %y
  %n1 = and i64 %n0, 281474976645120
  %r = xor i64 %n1, %y
  ret i64 %r
}

; ============================================================================ ;
; Constant Commutativity tests.
; ============================================================================ ;

define i32 @in_constmask_commutativity_0_1(i32 %x, i32 %y) {
; CHECK-LABEL: in_constmask_commutativity_0_1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor w8, w0, w1
; CHECK-NEXT:    and w8, w8, #0xffff00
; CHECK-NEXT:    eor w0, w1, w8
; CHECK-NEXT:    ret
  %n0 = xor i32 %x, %y
  %n1 = and i32 %n0, 16776960
  %r = xor i32 %y, %n1 ; swapped
  ret i32 %r
}

define i32 @in_constmask_commutativity_1_0(i32 %x, i32 %y) {
; CHECK-LABEL: in_constmask_commutativity_1_0:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor w8, w0, w1
; CHECK-NEXT:    and w8, w8, #0xffff00
; CHECK-NEXT:    eor w0, w8, w0
; CHECK-NEXT:    ret
  %n0 = xor i32 %x, %y
  %n1 = and i32 %n0, 16776960
  %r = xor i32 %n1, %x ; %x instead of %y
  ret i32 %r
}

define i32 @in_constmask_commutativity_1_1(i32 %x, i32 %y) {
; CHECK-LABEL: in_constmask_commutativity_1_1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor w8, w0, w1
; CHECK-NEXT:    and w8, w8, #0xffff00
; CHECK-NEXT:    eor w0, w0, w8
; CHECK-NEXT:    ret
  %n0 = xor i32 %x, %y
  %n1 = and i32 %n0, 16776960
  %r = xor i32 %x, %n1 ; swapped, %x instead of %y
  ret i32 %r
}

; ============================================================================ ;
; Y is an 'and' too.
; ============================================================================ ;

define i32 @in_complex_y0_constmask(i32 %x, i32 %y_hi, i32 %y_low) {
; CHECK-LABEL: in_complex_y0_constmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and w8, w1, w2
; CHECK-NEXT:    eor w9, w0, w8
; CHECK-NEXT:    and w9, w9, #0xffff00
; CHECK-NEXT:    eor w0, w9, w8
; CHECK-NEXT:    ret
  %y = and i32 %y_hi, %y_low
  %n0 = xor i32 %x, %y
  %n1 = and i32 %n0, 16776960
  %r = xor i32 %n1, %y
  ret i32 %r
}

define i32 @in_complex_y1_constmask(i32 %x, i32 %y_hi, i32 %y_low) {
; CHECK-LABEL: in_complex_y1_constmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and w8, w1, w2
; CHECK-NEXT:    eor w9, w0, w8
; CHECK-NEXT:    and w9, w9, #0xffff00
; CHECK-NEXT:    eor w0, w8, w9
; CHECK-NEXT:    ret
  %y = and i32 %y_hi, %y_low
  %n0 = xor i32 %x, %y
  %n1 = and i32 %n0, 16776960
  %r = xor i32 %y, %n1
  ret i32 %r
}

; ============================================================================ ;
; Negative tests. Should not be folded.
; ============================================================================ ;

; Multi-use tests.

declare void @use32(i32) nounwind

define i32 @in_multiuse_A_constmask(i32 %x, i32 %y, i32 %z) nounwind {
; CHECK-LABEL: in_multiuse_A_constmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    str x20, [sp, #-32]! // 8-byte Folded Spill
; CHECK-NEXT:    eor w8, w0, w1
; CHECK-NEXT:    and w20, w8, #0xffff00
; CHECK-NEXT:    mov w0, w20
; CHECK-NEXT:    stp x19, x30, [sp, #16] // 8-byte Folded Spill
; CHECK-NEXT:    mov w19, w1
; CHECK-NEXT:    bl use32
; CHECK-NEXT:    eor w0, w20, w19
; CHECK-NEXT:    ldp x19, x30, [sp, #16] // 8-byte Folded Reload
; CHECK-NEXT:    ldr x20, [sp], #32 // 8-byte Folded Reload
; CHECK-NEXT:    ret
  %n0 = xor i32 %x, %y
  %n1 = and i32 %n0, 16776960
  call void @use32(i32 %n1)
  %r = xor i32 %n1, %y
  ret i32 %r
}

define i32 @in_multiuse_B_constmask(i32 %x, i32 %y, i32 %z) nounwind {
; CHECK-LABEL: in_multiuse_B_constmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    str x20, [sp, #-32]! // 8-byte Folded Spill
; CHECK-NEXT:    eor w0, w0, w1
; CHECK-NEXT:    stp x19, x30, [sp, #16] // 8-byte Folded Spill
; CHECK-NEXT:    mov w19, w1
; CHECK-NEXT:    and w20, w0, #0xffff00
; CHECK-NEXT:    bl use32
; CHECK-NEXT:    eor w0, w20, w19
; CHECK-NEXT:    ldp x19, x30, [sp, #16] // 8-byte Folded Reload
; CHECK-NEXT:    ldr x20, [sp], #32 // 8-byte Folded Reload
; CHECK-NEXT:    ret
  %n0 = xor i32 %x, %y
  %n1 = and i32 %n0, 16776960
  call void @use32(i32 %n0)
  %r = xor i32 %n1, %y
  ret i32 %r
}

; Various bad variants

define i32 @n0_badconstmask(i32 %x, i32 %y) {
; CHECK-LABEL: n0_badconstmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov w9, #256
; CHECK-NEXT:    movk w9, #65280, lsl #16
; CHECK-NEXT:    and w8, w0, #0xffff00
; CHECK-NEXT:    and w9, w1, w9
; CHECK-NEXT:    orr w0, w8, w9
; CHECK-NEXT:    ret
  %mx = and i32 %x, 16776960
  %my = and i32 %y, -16776960 ; instead of -16776961
  %r = or i32 %mx, %my
  ret i32 %r
}

define i32 @n1_thirdvar_constmask(i32 %x, i32 %y, i32 %z) {
; CHECK-LABEL: n1_thirdvar_constmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    eor w8, w0, w1
; CHECK-NEXT:    and w8, w8, #0xffff00
; CHECK-NEXT:    eor w0, w8, w2
; CHECK-NEXT:    ret
  %n0 = xor i32 %x, %y
  %n1 = and i32 %n0, 16776960
  %r = xor i32 %n1, %z ; instead of %y
  ret i32 %r
}
