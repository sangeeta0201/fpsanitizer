; ModuleID = 'multi-args.bc'
source_filename = "multi-args.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.xs = private unnamed_addr constant [2 x double] [double 1.200000e+00, double 0x3D719799812DEA11], align 16
@main.ys = private unnamed_addr constant [2 x double] [double 5.000000e-01, double 1.000000e+12], align 16
@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %xs = alloca [2 x double], align 16
  %ys = alloca [2 x double], align 16
  %x = alloca double, align 8
  %y = alloca double, align 8
  %z = alloca double, align 8
  %i = alloca i32, align 4
  %0 = bitcast [2 x double]* %xs to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([2 x double]* @main.xs to i8*), i64 16, i1 false)
  %1 = bitcast [2 x double]* %ys to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([2 x double]* @main.ys to i8*), i64 16, i1 false)
  store i32 0, i32* %i, align 4
  %2 = load i32, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [2 x double], [2 x double]* %xs, i64 0, i64 %idxprom
  %3 = load double, double* %arrayidx, align 8
  store double %3, double* %x, align 8
  %4 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %4 to i64
  %arrayidx2 = getelementptr inbounds [2 x double], [2 x double]* %ys, i64 0, i64 %idxprom1
  %5 = load double, double* %arrayidx2, align 8
  store double %5, double* %y, align 8
  %6 = load double, double* %x, align 8
  %7 = load double, double* %y, align 8
  %add = fadd double %6, %7
  %8 = load double, double* %y, align 8
  %sub = fsub double %add, %8
  store double %sub, double* %z, align 8
  %9 = load double, double* %z, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %9)
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
