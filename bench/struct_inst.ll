; ModuleID = 'struct_inst.bc'
source_filename = "struct.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.val1 = type { double, i32 }
%struct.val = type { i32, double, i32, %struct.val1 }

@.str = private unnamed_addr constant [4 x i8] c"%e:\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @mysqrt(double %v.coerce0, i32 %v.coerce1) #0 {
entry:
  %0 = bitcast double (double, i32)* @mysqrt to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %v = alloca %struct.val1, align 8
  %sq = alloca double, align 8
  %2 = bitcast %struct.val1* %v to { double, i32 }*
  %3 = getelementptr inbounds { double, i32 }, { double, i32 }* %2, i32 0, i32 0
  %4 = bitcast double* %3 to i8*
  %5 = call i64 @getAddr(i8* %4)
  %6 = bitcast double (double, i32)* @mysqrt to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @setRealFunArg(i32 0, i64 %7, i64 %5, double %v.coerce0)
  store double %v.coerce0, double* %3, align 8
  %8 = getelementptr inbounds { double, i32 }, { double, i32 }* %2, i32 0, i32 1
  %9 = bitcast i32* %8 to i8*
  store i32 %v.coerce1, i32* %8, align 8
  %y = getelementptr inbounds %struct.val1, %struct.val1* %v, i32 0, i32 0
  %10 = bitcast double* %y to i8*
  %11 = call i64 @getAddr(i8* %10)
  call void @handleAlloca(i64 %11)
  %12 = bitcast double* %y to i8*
  %13 = call i64 @getAddr(i8* %12)
  %14 = load double, double* %y, align 8
  %y1 = getelementptr inbounds %struct.val1, %struct.val1* %v, i32 0, i32 0
  %15 = bitcast double* %y1 to i8*
  %16 = call i64 @getAddr(i8* %15)
  call void @handleAlloca(i64 %16)
  %17 = bitcast double* %y1 to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = load double, double* %y1, align 8
  %mul = fmul double %14, %19
  %20 = call i64 @computeReal(i32 16, i64 %13, i64 %18, double %14, double %19, double %mul, i32 14)
  %21 = bitcast double* %sq to i8*
  %22 = call i64 @getAddr(i8* %21)
  call void @setRealTemp(i64 %22, i64 %20)
  store double %mul, double* %sq, align 8
  %23 = bitcast double* %sq to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = load double, double* %sq, align 8
  %26 = bitcast double (double, i32)* @mysqrt to i8*
  %27 = call i64 @getAddr(i8* %26)
  call void @funcExit(i64 %27)
  %28 = bitcast double (double, i32)* @mysqrt to i8*
  %29 = call i64 @getAddr(i8* %28)
  call void @trackReturn(i64 %29, i64 %24)
  call void @cleanComputeReal(i32 14)
  ret double %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %0 = bitcast i32 ()* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %myval = alloca %struct.val, align 8
  %sq = alloca double, align 8
  %x = getelementptr inbounds %struct.val, %struct.val* %myval, i32 0, i32 0
  %2 = bitcast i32* %x to i8*
  store i32 5, i32* %x, align 8
  %y = getelementptr inbounds %struct.val, %struct.val* %myval, i32 0, i32 1
  %3 = bitcast double* %y to i8*
  %4 = call i64 @getAddr(i8* %3)
  call void @handleAlloca(i64 %4)
  %5 = bitcast double* %y to i8*
  %6 = call i64 @getAddr(i8* %5)
  call void @setRealConstant(i64 %6, double 3.000000e+00)
  store double 3.000000e+00, double* %y, align 8
  %z = getelementptr inbounds %struct.val, %struct.val* %myval, i32 0, i32 2
  %7 = bitcast i32* %z to i8*
  store i32 2, i32* %z, align 8
  %v = getelementptr inbounds %struct.val, %struct.val* %myval, i32 0, i32 3
  %y1 = getelementptr inbounds %struct.val1, %struct.val1* %v, i32 0, i32 0
  %8 = bitcast double* %y1 to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @setRealConstant(i64 %9, double 2.000000e+00)
  store double 2.000000e+00, double* %y1, align 8
  %v2 = getelementptr inbounds %struct.val, %struct.val* %myval, i32 0, i32 3
  %10 = bitcast %struct.val1* %v2 to { double, i32 }*
  %11 = getelementptr inbounds { double, i32 }, { double, i32 }* %10, i32 0, i32 0
  %12 = bitcast double* %11 to i8*
  %13 = call i64 @getAddr(i8* %12)
  %14 = load double, double* %11, align 8
  %15 = getelementptr inbounds { double, i32 }, { double, i32 }* %10, i32 0, i32 1
  %16 = bitcast i32* %15 to i8*
  %17 = call i64 @getAddr(i8* %16)
  %18 = load i32, i32* %15, align 8
  %19 = bitcast double (double, i32)* @mysqrt to i8*
  %20 = call i64 @getAddr(i8* %19)
  call void @addFunArg(i32 0, i64 %20, i64 %13)
  call void @addFunArg(i32 1, i64 %20, i64 %17)
  %call = call double @mysqrt(double %14, i32 %18)
  %21 = bitcast double* %sq to i8*
  %22 = call i64 @getAddr(i8* %21)
  call void @setRealReturn(i64 %22)
  store double %call, double* %sq, align 8
  %23 = bitcast double* %sq to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = load double, double* %sq, align 8
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %25)
  %26 = bitcast i32 ()* @main to i8*
  %27 = call i64 @getAddr(i8* %26)
  call void @funcExit(i64 %27)
  call void @finish()
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @funcExit(i64)

declare void @setRealFunArg(i32, i64, i64, double)

declare void @handleAlloca(i64)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @setRealTemp(i64, i64)

declare void @trackReturn(i64, i64)

declare void @cleanComputeReal(i32)

declare void @setRealConstant(i64, double)

declare void @addFunArg(i32, i64, i64)

declare void @setRealReturn(i64)

declare void @finish()

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
