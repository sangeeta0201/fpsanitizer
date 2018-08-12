; ModuleID = 'gromacs-bondfree-580_inst.bc'
source_filename = "gromacs-bondfree-580.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@r_kj = dso_local global [10 x [3 x double]] [[3 x double] [double 0x438DCDE7E0000000, double 0x3FE6EDD1A0000000, double 0x4095B60F40000000], [3 x double] [double 0x3DEC8C1CE0000000, double 0x3B160727C0000000, double 0x3DF332ECA0000000], [3 x double] [double 0x3FB78FFB20000000, double 0x3F62C6DCC0000000, double 0x3BB9A498E0000000], [3 x double] [double 0x41CC1DD3C0000000, double 0x39DD38C6E0000000, double 0x37B133F800000000], [3 x double] [double 0x3E98EFC6C0000000, double 0x4067094A40000000, double 0x39F7AF1EC0000000], [3 x double] [double 0x3E6697D940000000, double 0x37E456A100000000, double 0x3720A00000000000], [3 x double] [double 0x37603C0000000000, double 0x36F1800000000000, double 0x3752360000000000], [3 x double] [double 0x40754BA7A0000000, double 0x3DF2FD7280000000, double 0x4092D5FEE0000000], [3 x double] [double 0x426EBFC320000000, double 0x426F1387A0000000, double 0x38647EFAA0000000], [3 x double] [double 0x3F75CD4160000000, double 0x3B62832720000000, double 0x380620D840000000]], align 16
@.str = private unnamed_addr constant [23 x i8] c"********nrkj2*****:%e\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%e\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %0 = bitcast i32 ()* @main to i8*
  call void @funcInit(i8* %0)
  %retval = alloca i32, align 4
  %1 = bitcast i32* %retval to i8*
  call void @handleAlloca(i8* %1)
  %nrkj2 = alloca double, align 8
  %2 = bitcast double* %nrkj2 to i8*
  call void @handleAlloca(i8* %2)
  %nrkj = alloca double, align 8
  %3 = bitcast double* %nrkj to i8*
  call void @handleAlloca(i8* %3)
  %i = alloca i32, align 4
  %4 = bitcast i32* %i to i8*
  call void @handleAlloca(i8* %4)
  %5 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %6 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %7, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds [10 x [3 x double]], [10 x [3 x double]]* @r_kj, i64 0, i64 %idxprom
  %arraydecay = getelementptr inbounds [3 x double], [3 x double]* %arrayidx, i32 0, i32 0
  %9 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %9 to i64
  %arrayidx2 = getelementptr inbounds [10 x [3 x double]], [10 x [3 x double]]* @r_kj, i64 0, i64 %idxprom1
  %arraydecay3 = getelementptr inbounds [3 x double], [3 x double]* %arrayidx2, i32 0, i32 0
  %call = call double @iprod(double* %arraydecay, double* %arraydecay3)
  %10 = bitcast double* %nrkj2 to i8*
  %11 = bitcast double (double*, double*)* @iprod to i8*
  call void @setRealReturn(i8* %10)
  store double %call, double* %nrkj2, align 8
  %12 = load double, double* %nrkj2, align 8
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0), double %12)
  %13 = load double, double* %nrkj2, align 8
  %14 = bitcast double* %nrkj2 to i8*
  %call5 = call double @sqrt(double %13) #3
  %15 = call i8* @handleMathFunc(i32 1, double %13, i8* %14, double %call5, i32 25)
  %16 = bitcast double* %nrkj to i8*
  %17 = bitcast i8* %15 to i8*
  call void @setRealTemp(i8* %16, i8* %17)
  store double %call5, double* %nrkj, align 8
  %18 = load double, double* %nrkj, align 8
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), double %18)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4
  %inc = add nsw i32 %19, 1
  %20 = bitcast i32* %i to i8*
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %21 = bitcast i32 ()* @main to i8*
  call void @funcExit(i8* %21)
  call void @cleanComputeReal(i32 25)
  call void @finish()
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal double @iprod(double* %a, double* %b) #0 {
entry:
  %0 = bitcast double (double*, double*)* @iprod to i8*
  call void @funcInit(i8* %0)
  %a.addr = alloca double*, align 8
  %1 = bitcast double** %a.addr to i8*
  call void @handleAlloca(i8* %1)
  %b.addr = alloca double*, align 8
  %2 = bitcast double** %b.addr to i8*
  call void @handleAlloca(i8* %2)
  %3 = bitcast double** %a.addr to i8*
  %4 = bitcast double* %a to i8*
  call void @setRealTemp(i8* %3, i8* %4)
  store double* %a, double** %a.addr, align 8
  %5 = bitcast double** %b.addr to i8*
  %6 = bitcast double* %b to i8*
  call void @setRealTemp(i8* %5, i8* %6)
  store double* %b, double** %b.addr, align 8
  %7 = load double*, double** %a.addr, align 8
  %arrayidx = getelementptr inbounds double, double* %7, i64 0
  %8 = load double, double* %arrayidx, align 8
  %9 = load double*, double** %b.addr, align 8
  %arrayidx1 = getelementptr inbounds double, double* %9, i64 0
  %10 = load double, double* %arrayidx1, align 8
  %11 = bitcast double* %arrayidx to i8*
  %12 = bitcast double* %arrayidx1 to i8*
  %mul = fmul double %8, %10
  %13 = call i8* @computeReal(i32 16, i8* %11, i8* %12, double %8, double %10, double %mul, i32 49)
  %14 = load double*, double** %a.addr, align 8
  %arrayidx2 = getelementptr inbounds double, double* %14, i64 1
  %15 = load double, double* %arrayidx2, align 8
  %16 = load double*, double** %b.addr, align 8
  %arrayidx3 = getelementptr inbounds double, double* %16, i64 1
  %17 = load double, double* %arrayidx3, align 8
  %18 = bitcast double* %arrayidx2 to i8*
  %19 = bitcast double* %arrayidx3 to i8*
  %mul4 = fmul double %15, %17
  %20 = call i8* @computeReal(i32 16, i8* %18, i8* %19, double %15, double %17, double %mul4, i32 56)
  %21 = bitcast i8* %13 to i8*
  %22 = bitcast i8* %20 to i8*
  %add = fadd double %mul, %mul4
  %23 = call i8* @computeReal(i32 12, i8* %21, i8* %22, double %mul, double %mul4, double %add, i32 57)
  %24 = load double*, double** %a.addr, align 8
  %arrayidx5 = getelementptr inbounds double, double* %24, i64 2
  %25 = load double, double* %arrayidx5, align 8
  %26 = load double*, double** %b.addr, align 8
  %arrayidx6 = getelementptr inbounds double, double* %26, i64 2
  %27 = load double, double* %arrayidx6, align 8
  %28 = bitcast double* %arrayidx5 to i8*
  %29 = bitcast double* %arrayidx6 to i8*
  %mul7 = fmul double %25, %27
  %30 = call i8* @computeReal(i32 16, i8* %28, i8* %29, double %25, double %27, double %mul7, i32 64)
  %31 = bitcast i8* %23 to i8*
  %32 = bitcast i8* %30 to i8*
  %add8 = fadd double %add, %mul7
  %33 = call i8* @computeReal(i32 12, i8* %31, i8* %32, double %add, double %mul7, double %add8, i32 65)
  %34 = bitcast double (double*, double*)* @iprod to i8*
  call void @funcExit(i8* %34)
  %35 = bitcast i8* %33 to i8*
  call void @trackReturn(i8* %35)
  call void @cleanComputeReal(i32 49)
  call void @cleanComputeReal(i32 56)
  call void @cleanComputeReal(i32 57)
  call void @cleanComputeReal(i32 64)
  ret double %add8
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

declare void @funcInit(i8*)

declare void @funcExit(i8*)

declare void @handleAlloca(i8*)

declare void @setRealTemp(i8*, i8*)

declare void @setRealReturn(i8*)

declare i8* @handleMathFunc(i32, double, i8*, double, i32)

declare void @cleanComputeReal(i32)

declare void @finish()

declare i8* @computeReal(i32, i8*, i8*, double, double, double, i32)

declare void @trackReturn(i8*)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
