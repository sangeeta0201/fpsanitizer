; ModuleID = 'recur_inst.bc'
source_filename = "recur.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"x: %e:\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"y: %e:\0A\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"sub: %e:\0A\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"z: %e:\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local double @foo(double %x, double %y) local_unnamed_addr #0 {
entry:
  %0 = bitcast double (double, double)* @foo to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %2 = bitcast double (double, double)* @foo to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = call i64 @getRealFunArg(i32 1, i64 %3)
  %add = fadd double %y, 2.000000e-01
  %5 = call i64 @computeReal(i32 12, i64 %4, i64 0, double %y, double 2.000000e-01, double %add, i32 5)
  %6 = bitcast double (double, double)* @foo to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = call i64 @getRealFunArg(i32 0, i64 %7)
  %cmp = fcmp ugt double %x, 0.000000e+00
  call void @checkBranch(double %x, i64 %8, double 0.000000e+00, i64 0, i32 10, i1 %cmp, i32 6)
  br i1 %cmp, label %if.else, label %cleanup

if.else:                                          ; preds = %entry
  %9 = bitcast double (double, double)* @foo to i8*
  %10 = call i64 @getAddr(i8* %9)
  %11 = call i64 @getRealFunArg(i32 0, i64 %10)
  %sub2 = fadd double %x, -1.200000e+00
  %12 = call i64 @computeReal(i32 12, i64 %11, i64 0, double %x, double -1.200000e+00, double %sub2, i32 8)
  %13 = bitcast double (double, double)* @foo to i8*
  %14 = call i64 @getAddr(i8* %13)
  call void @addFunArg(i32 0, i64 %14, i64 %12)
  call void @addFunArg(i32 1, i64 %14, i64 %5)
  %call3 = tail call double @foo(double %sub2, double %add)
  %sub6 = fsub double %add, %sub2
  %15 = call i64 @computeReal(i32 14, i64 %5, i64 %12, double %add, double %sub2, double %sub6, i32 12)
  %16 = bitcast double (double, double)* @foo to i8*
  %17 = call i64 @getAddr(i8* %16)
  call void @funcExit(i64 %17)
  %18 = bitcast double (double, double)* @foo to i8*
  %19 = call i64 @getAddr(i8* %18)
  call void @trackReturn(i64 %19, i64 %15)
  call void @cleanComputeReal(i32 5)
  call void @cleanComputeReal(i32 8)
  ret double %sub6

cleanup:                                          ; preds = %entry
  %20 = bitcast double (double, double)* @foo to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void @funcExit(i64 %21)
  call void @cleanComputeReal(i32 5)
  call void @cleanComputeReal(i32 8)
  call void @cleanComputeReal(i32 12)
  ret double 0.000000e+00
}

; Function Attrs: nounwind

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %0 = bitcast i32 ()* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %2 = bitcast double (double, double)* @foo to i8*
  %3 = call i64 @getAddr(i8* %2)
  %call = tail call double @foo(double 0x40019999A0000000, double 0x40099999A0000000)
  %4 = bitcast i32 ()* @main to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @funcExit(i64 %5)
  call void @finish()
  ret i32 0
}

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @funcExit(i64)

declare i64 @getRealFunArg(i32, i64)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @checkBranch(double, i64, double, i64, i32, i1, i32)

declare void @addFunArg(i32, i64, i64)

declare void @trackReturn(i64, i64)

declare void @cleanComputeReal(i32)

declare void @finish()

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
