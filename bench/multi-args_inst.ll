; ModuleID = 'multi-args_inst.bc'
source_filename = "multi-args.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.xs = private unnamed_addr constant [2 x double] [double 1.200000e+00, double 0x3D719799812DEA11], align 16
@main.ys = private unnamed_addr constant [2 x double] [double 5.000000e-01, double 1.000000e+12], align 16
@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %0 = bitcast i8* null to i8*
  %1 = bitcast i32 ()* @main to i8*
  call void @funcInit(i8* %1)
  %xs = alloca [2 x double], align 16
  %2 = bitcast [2 x double]* %xs to i8*
  call void @handleAlloca(i8* %2)
  %ys = alloca [2 x double], align 16
  %3 = bitcast [2 x double]* %ys to i8*
  call void @handleAlloca(i8* %3)
  %m = alloca double, align 8
  %4 = bitcast double* %m to i8*
  call void @handleAlloca(i8* %4)
  %x = alloca double, align 8
  %5 = bitcast double* %x to i8*
  call void @handleAlloca(i8* %5)
  %y = alloca double, align 8
  %6 = bitcast double* %y to i8*
  call void @handleAlloca(i8* %6)
  %z = alloca double, align 8
  %7 = bitcast double* %z to i8*
  call void @handleAlloca(i8* %7)
  %i = alloca i32, align 4
  %8 = bitcast i32* %i to i8*
  call void @handleAlloca(i8* %8)
  %9 = bitcast [2 x double]* %xs to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %9, i8* align 16 bitcast ([2 x double]* @main.xs to i8*), i64 16, i1 false)
  %10 = bitcast [2 x double]* %ys to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %10, i8* align 16 bitcast ([2 x double]* @main.ys to i8*), i64 16, i1 false)
  %11 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  %12 = load i32, i32* %i, align 4
  %idxprom = sext i32 %12 to i64
  %arrayidx = getelementptr inbounds [2 x double], [2 x double]* %xs, i64 0, i64 %idxprom
  %13 = load double, double* %arrayidx, align 8
  %14 = bitcast double* %x to i8*
  %15 = bitcast double* %arrayidx to i8*
  call void @setRealTemp(i8* %14, i8* %15)
  store double %13, double* %x, align 8
  %16 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %16 to i64
  %arrayidx2 = getelementptr inbounds [2 x double], [2 x double]* %ys, i64 0, i64 %idxprom1
  %17 = load double, double* %arrayidx2, align 8
  %18 = bitcast double* %y to i8*
  %19 = bitcast double* %arrayidx2 to i8*
  call void @setRealTemp(i8* %18, i8* %19)
  store double %17, double* %y, align 8
  %20 = load double, double* %x, align 8
  %21 = load double, double* %y, align 8
  %22 = bitcast double* %x to i8*
  %23 = bitcast double* %y to i8*
  %add = fadd double %20, %21
  %24 = call i8* @computeReal(i32 12, i64 0, i8* %22, i64 0, i8* %23, double %20, double %21, double %add, i32 26)
  %25 = load double, double* %y, align 8
  %26 = bitcast i8* %24 to i8*
  %27 = bitcast double* %y to i8*
  %sub = fsub double %add, %25
  %28 = call i8* @computeReal(i32 14, i64 0, i8* %26, i64 0, i8* %27, double %add, double %25, double %sub, i32 28)
  %29 = bitcast double* %z to i8*
  %30 = bitcast i8* %28 to i8*
  call void @setRealTemp(i8* %29, i8* %30)
  store double %sub, double* %z, align 8
  %31 = load double, double* %z, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %31)
  %32 = bitcast i32 ()* @main to i8*
  call void @funcExit(i8* %32)
  call void @cleanComputeReal(i32 26)
  call void @cleanComputeReal(i32 28)
  call void @finish()
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #1

declare dso_local i32 @printf(i8*, ...) #2

declare void @funcInit(i8*)

declare void @funcExit(i8*)

declare void @handleAlloca(i8*)

declare void @setRealTemp(i8*, i8*)

declare i8* @computeReal(i32, i64, i8*, i64, i8*, double, double, double, i32)

declare void @cleanComputeReal(i32)

declare void @finish()

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
