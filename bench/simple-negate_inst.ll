; ModuleID = 'simple-negate_inst.bc'
source_filename = "simple-negate.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%e\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %0 = bitcast i32 ()* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %x = alloca float, align 4
  %y = alloca double, align 8
  %z = alloca double, align 8
  %w = alloca double, align 8
  %2 = bitcast float* %x to i8*
  %3 = call i64 @getAddr(i8* %2)
  store volatile float 0x3BC79CA100000000, float* %x, align 4
  %4 = bitcast double* %y to i8*
  %5 = call i64 @getAddr(i8* %4)
  store volatile double 3.000000e+00, double* %y, align 8
  %6 = bitcast float* %x to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = load volatile float, float* %x, align 4
  %conv = fpext float %8 to double
  %9 = bitcast double* %y to i8*
  %10 = call i64 @getAddr(i8* %9)
  %11 = load volatile double, double* %y, align 8
  %add = fadd double %conv, %11
  %12 = call i64 @computeReal(i32 12, i64 0, i64 %10, double %conv, double %11, double %add, i32 9)
  %13 = bitcast double* %z to i8*
  %14 = call i64 @getAddr(i8* %13)
  call void @setRealTemp(i64 %14, i64 %12)
  store double %add, double* %z, align 8
  %15 = bitcast double* %y to i8*
  %16 = call i64 @getAddr(i8* %15)
  %17 = load volatile double, double* %y, align 8
  %18 = bitcast double* %z to i8*
  %19 = call i64 @getAddr(i8* %18)
  %20 = load double, double* %z, align 8
  %add1 = fadd double %17, %20
  %21 = call i64 @computeReal(i32 12, i64 %16, i64 %19, double %17, double %20, double %add1, i32 13)
  %22 = bitcast double* %z to i8*
  %23 = call i64 @getAddr(i8* %22)
  %24 = load double, double* %z, align 8
  %sub = fsub double %add1, %24
  %25 = call i64 @computeReal(i32 14, i64 %21, i64 %23, double %add1, double %24, double %sub, i32 15)
  %26 = bitcast double* %w to i8*
  %27 = call i64 @getAddr(i8* %26)
  call void @setRealTemp(i64 %27, i64 %25)
  store double %sub, double* %w, align 8
  %28 = bitcast double* %w to i8*
  %29 = call i64 @getAddr(i8* %28)
  %30 = load double, double* %w, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %30)
  call void @finish()
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

declare i64 @getAddr(i8*)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @setRealTemp(i64, i64)

declare void @finish()

declare void @funcInit(i64)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
