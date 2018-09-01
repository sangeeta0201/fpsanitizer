; ModuleID = 'msq_su3vec_inst.bc'
source_filename = "msq_su3vec.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.su3_vector = type { [3 x %struct.complex] }
%struct.complex = type { double, double }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @magsq_su3vec(%struct.su3_vector* %a) #0 {
entry:
  %0 = bitcast i8* null to i8*
  %1 = bitcast double (%struct.su3_vector*)* @magsq_su3vec to i8*
  %2 = call i64 @getAddr(i8* %1)
  call void @funcInit(i64 %2)
  %a.addr = alloca %struct.su3_vector*, align 8
  %3 = bitcast %struct.su3_vector** %a.addr to i8*
  %4 = call i64 @getAddr(i8* %3)
  call void @handleAlloca(i64 %4)
  %sum = alloca double, align 8
  %5 = bitcast double* %sum to i8*
  %6 = call i64 @getAddr(i8* %5)
  call void @handleAlloca(i64 %6)
  %i = alloca i32, align 4
  %7 = bitcast i32* %i to i8*
  %8 = call i64 @getAddr(i8* %7)
  call void @handleAlloca(i64 %8)
  %9 = bitcast %struct.su3_vector** %a.addr to i8*
  %10 = call i64 @getAddr(i8* %9)
  %11 = bitcast %struct.su3_vector* %a to i8*
  %12 = call i64 @getAddr(i8* %11)
  call void @setRealTemp(i64 %10, i64 %12)
  store %struct.su3_vector* %a, %struct.su3_vector** %a.addr, align 8
  %13 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  %14 = bitcast double* %sum to i8*
  %15 = call i64 @getAddr(i8* %14)
  call void @setRealConstant(i64 %15, double 0.000000e+00)
  store double 0.000000e+00, double* %sum, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %16 = bitcast i32* %i to i8*
  %17 = call i64 @getAddr(i8* %16)
  %18 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %18, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %19 = bitcast %struct.su3_vector** %a.addr to i8*
  %20 = call i64 @getAddr(i8* %19)
  %21 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %21, i32 0, i32 0
  %22 = bitcast i32* %i to i8*
  %23 = call i64 @getAddr(i8* %22)
  %24 = load i32, i32* %i, align 4
  %idxprom = sext i32 %24 to i64
  %arrayidx = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c, i64 0, i64 %idxprom
  %real = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx, i32 0, i32 0
  %25 = bitcast double* %real to i8*
  %26 = call i64 @getAddr(i8* %25)
  %27 = load double, double* %real, align 8
  %28 = bitcast %struct.su3_vector** %a.addr to i8*
  %29 = call i64 @getAddr(i8* %28)
  %30 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c1 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %30, i32 0, i32 0
  %31 = bitcast i32* %i to i8*
  %32 = call i64 @getAddr(i8* %31)
  %33 = load i32, i32* %i, align 4
  %idxprom2 = sext i32 %33 to i64
  %arrayidx3 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c1, i64 0, i64 %idxprom2
  %real4 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx3, i32 0, i32 0
  %34 = bitcast double* %real4 to i8*
  %35 = call i64 @getAddr(i8* %34)
  %36 = load double, double* %real4, align 8
  %mul = fmul double %27, %36
  %37 = call i64 @computeReal(i32 16, i64 %26, i64 %35, double %27, double %36, double %mul, i32 27)
  %38 = bitcast %struct.su3_vector** %a.addr to i8*
  %39 = call i64 @getAddr(i8* %38)
  %40 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c5 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %40, i32 0, i32 0
  %41 = bitcast i32* %i to i8*
  %42 = call i64 @getAddr(i8* %41)
  %43 = load i32, i32* %i, align 4
  %idxprom6 = sext i32 %43 to i64
  %arrayidx7 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c5, i64 0, i64 %idxprom6
  %imag = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx7, i32 0, i32 1
  %44 = bitcast double* %imag to i8*
  %45 = call i64 @getAddr(i8* %44)
  %46 = load double, double* %imag, align 8
  %47 = bitcast %struct.su3_vector** %a.addr to i8*
  %48 = call i64 @getAddr(i8* %47)
  %49 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c8 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %49, i32 0, i32 0
  %50 = bitcast i32* %i to i8*
  %51 = call i64 @getAddr(i8* %50)
  %52 = load i32, i32* %i, align 4
  %idxprom9 = sext i32 %52 to i64
  %arrayidx10 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c8, i64 0, i64 %idxprom9
  %imag11 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx10, i32 0, i32 1
  %53 = bitcast double* %imag11 to i8*
  %54 = call i64 @getAddr(i8* %53)
  %55 = load double, double* %imag11, align 8
  %mul12 = fmul double %46, %55
  %56 = call i64 @computeReal(i32 16, i64 %45, i64 %54, double %46, double %55, double %mul12, i32 42)
  %add = fadd double %mul, %mul12
  %57 = call i64 @computeReal(i32 12, i64 %37, i64 %56, double %mul, double %mul12, double %add, i32 43)
  %58 = bitcast double* %sum to i8*
  %59 = call i64 @getAddr(i8* %58)
  %60 = load double, double* %sum, align 8
  %add13 = fadd double %60, %add
  %61 = call i64 @computeReal(i32 12, i64 %59, i64 %57, double %60, double %add, double %add13, i32 45)
  %62 = bitcast double* %sum to i8*
  %63 = call i64 @getAddr(i8* %62)
  call void @setRealTemp(i64 %63, i64 %61)
  store double %add13, double* %sum, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %64 = bitcast i32* %i to i8*
  %65 = call i64 @getAddr(i8* %64)
  %66 = load i32, i32* %i, align 4
  %inc = add nsw i32 %66, 1
  %67 = bitcast i32* %i to i8*
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %68 = bitcast double* %sum to i8*
  %69 = call i64 @getAddr(i8* %68)
  %70 = load double, double* %sum, align 8
  %71 = bitcast double (%struct.su3_vector*)* @magsq_su3vec to i8*
  %72 = call i64 @getAddr(i8* %71)
  call void @funcExit(i64 %72)
  call void @trackReturn(i64 %69)
  call void @cleanComputeReal(i32 27)
  call void @cleanComputeReal(i32 42)
  call void @cleanComputeReal(i32 43)
  call void @cleanComputeReal(i32 45)
  ret double %70
}

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @funcExit(i64)

declare void @handleAlloca(i64)

declare void @setRealTemp(i64, i64)

declare void @setRealConstant(i64, double)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @trackReturn(i64)

declare void @cleanComputeReal(i32)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
