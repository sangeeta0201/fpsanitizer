; ModuleID = 'complex_inst.bc'
source_filename = "complex.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.complex = type { double, double }

@.str = private unnamed_addr constant [20 x i8] c"Sum = %.1f + %.1fi\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %0 = bitcast i32 ()* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %retval = alloca i32, align 4
  %2 = bitcast i32* %retval to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %n1 = alloca %struct.complex, align 8
  %4 = bitcast %struct.complex* %n1 to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @handleAlloca(i64 %5)
  %n2 = alloca %struct.complex, align 8
  %6 = bitcast %struct.complex* %n2 to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @handleAlloca(i64 %7)
  %temp = alloca %struct.complex, align 8
  %8 = bitcast %struct.complex* %temp to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @handleAlloca(i64 %9)
  %temp1 = alloca %struct.complex, align 8
  %10 = bitcast %struct.complex* %temp1 to i8*
  %11 = call i64 @getAddr(i8* %10)
  call void @handleAlloca(i64 %11)
  %tmp = alloca %struct.complex, align 8
  %12 = bitcast %struct.complex* %tmp to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @handleAlloca(i64 %13)
  %tmp3 = alloca %struct.complex, align 8
  %14 = bitcast %struct.complex* %tmp3 to i8*
  %15 = call i64 @getAddr(i8* %14)
  call void @handleAlloca(i64 %15)
  %16 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %real = getelementptr inbounds %struct.complex, %struct.complex* %n1, i32 0, i32 0
  %17 = bitcast double* %real to i8*
  %18 = call i64 @getAddr(i8* %17)
  call void @setRealConstant(i64 %18, double 2.300000e+00)
  store double 2.300000e+00, double* %real, align 8
  %imag = getelementptr inbounds %struct.complex, %struct.complex* %n1, i32 0, i32 1
  %19 = bitcast double* %imag to i8*
  %20 = call i64 @getAddr(i8* %19)
  call void @setRealConstant(i64 %20, double 1.100000e+00)
  store double 1.100000e+00, double* %imag, align 8
  %real1 = getelementptr inbounds %struct.complex, %struct.complex* %n2, i32 0, i32 0
  %21 = bitcast double* %real1 to i8*
  %22 = call i64 @getAddr(i8* %21)
  call void @setRealConstant(i64 %22, double 3.100000e+00)
  store double 3.100000e+00, double* %real1, align 8
  %imag2 = getelementptr inbounds %struct.complex, %struct.complex* %n2, i32 0, i32 1
  %23 = bitcast double* %imag2 to i8*
  %24 = call i64 @getAddr(i8* %23)
  call void @setRealConstant(i64 %24, double 4.500000e+00)
  store double 4.500000e+00, double* %imag2, align 8
  %25 = bitcast %struct.complex* %n1 to { double, double }*
  %26 = getelementptr inbounds { double, double }, { double, double }* %25, i32 0, i32 0
  %27 = bitcast double* %26 to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load double, double* %26, align 8
  %30 = getelementptr inbounds { double, double }, { double, double }* %25, i32 0, i32 1
  %31 = bitcast double* %30 to i8*
  %32 = call i64 @getAddr(i8* %31)
  %33 = load double, double* %30, align 8
  %34 = bitcast %struct.complex* %n2 to { double, double }*
  %35 = getelementptr inbounds { double, double }, { double, double }* %34, i32 0, i32 0
  %36 = bitcast double* %35 to i8*
  %37 = call i64 @getAddr(i8* %36)
  %38 = load double, double* %35, align 8
  %39 = getelementptr inbounds { double, double }, { double, double }* %34, i32 0, i32 1
  %40 = bitcast double* %39 to i8*
  %41 = call i64 @getAddr(i8* %40)
  %42 = load double, double* %39, align 8
  %43 = bitcast { double, double } (double, double, double, double)* @add to i8*
  %44 = call i64 @getAddr(i8* %43)
  call void @addFunArg(i32 0, i64 %44, i64 %28)
  call void @addFunArg(i32 1, i64 %44, i64 %32)
  call void @addFunArg(i32 2, i64 %44, i64 %37)
  call void @addFunArg(i32 3, i64 %44, i64 %41)
  %call = call { double, double } @add(double %29, double %33, double %38, double %42)
  %45 = bitcast %struct.complex* %tmp to { double, double }*
  %46 = getelementptr inbounds { double, double }, { double, double }* %45, i32 0, i32 0
  %47 = bitcast { double, double } (double, double, double, double)* @add to i8*
  %48 = call i64 @getAddr(i8* %47)
  %49 = call i64 @handleExtractValue(i32 0, i64 %48)
  %50 = extractvalue { double, double } %call, 0
  %51 = bitcast double* %46 to i8*
  %52 = call i64 @getAddr(i8* %51)
  call void @setRealTemp(i64 %52, i64 %49)
  store double %50, double* %46, align 8
  %53 = getelementptr inbounds { double, double }, { double, double }* %45, i32 0, i32 1
  %54 = bitcast { double, double } (double, double, double, double)* @add to i8*
  %55 = call i64 @getAddr(i8* %54)
  %56 = call i64 @handleExtractValue(i32 1, i64 %55)
  %57 = extractvalue { double, double } %call, 1
  %58 = bitcast double* %53 to i8*
  %59 = call i64 @getAddr(i8* %58)
  call void @setRealTemp(i64 %59, i64 %56)
  store double %57, double* %53, align 8
  %60 = bitcast %struct.complex* %temp to i8*
  %61 = bitcast %struct.complex* %tmp to i8*
  %62 = bitcast i8* %60 to i8*
  %63 = bitcast i8* %61 to i8*
  %64 = bitcast i64 16 to i64
  %65 = call i64 @getAddr(i8* %62)
  %66 = call i64 @getAddr(i8* %63)
  call void @handleLLVMMemcpy(i64 %65, i64 %66, i64 %64)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %60, i8* align 8 %61, i64 16, i1 false)
  %67 = bitcast %struct.complex* %n1 to { double, double }*
  %68 = getelementptr inbounds { double, double }, { double, double }* %67, i32 0, i32 0
  %69 = bitcast double* %68 to i8*
  %70 = call i64 @getAddr(i8* %69)
  %71 = load double, double* %68, align 8
  %72 = getelementptr inbounds { double, double }, { double, double }* %67, i32 0, i32 1
  %73 = bitcast double* %72 to i8*
  %74 = call i64 @getAddr(i8* %73)
  %75 = load double, double* %72, align 8
  %76 = bitcast %struct.complex* %temp to { double, double }*
  %77 = getelementptr inbounds { double, double }, { double, double }* %76, i32 0, i32 0
  %78 = bitcast double* %77 to i8*
  %79 = call i64 @getAddr(i8* %78)
  %80 = load double, double* %77, align 8
  %81 = getelementptr inbounds { double, double }, { double, double }* %76, i32 0, i32 1
  %82 = bitcast double* %81 to i8*
  %83 = call i64 @getAddr(i8* %82)
  %84 = load double, double* %81, align 8
  %85 = bitcast { double, double } (double, double, double, double)* @add to i8*
  %86 = call i64 @getAddr(i8* %85)
  call void @addFunArg(i32 0, i64 %86, i64 %70)
  call void @addFunArg(i32 1, i64 %86, i64 %74)
  call void @addFunArg(i32 2, i64 %86, i64 %79)
  call void @addFunArg(i32 3, i64 %86, i64 %83)
  %call4 = call { double, double } @add(double %71, double %75, double %80, double %84)
  %87 = bitcast %struct.complex* %tmp3 to { double, double }*
  %88 = getelementptr inbounds { double, double }, { double, double }* %87, i32 0, i32 0
  %89 = bitcast { double, double } (double, double, double, double)* @add to i8*
  %90 = call i64 @getAddr(i8* %89)
  %91 = call i64 @handleExtractValue(i32 0, i64 %90)
  %92 = extractvalue { double, double } %call4, 0
  %93 = bitcast double* %88 to i8*
  %94 = call i64 @getAddr(i8* %93)
  call void @setRealTemp(i64 %94, i64 %91)
  store double %92, double* %88, align 8
  %95 = getelementptr inbounds { double, double }, { double, double }* %87, i32 0, i32 1
  %96 = bitcast { double, double } (double, double, double, double)* @add to i8*
  %97 = call i64 @getAddr(i8* %96)
  %98 = call i64 @handleExtractValue(i32 1, i64 %97)
  %99 = extractvalue { double, double } %call4, 1
  %100 = bitcast double* %95 to i8*
  %101 = call i64 @getAddr(i8* %100)
  call void @setRealTemp(i64 %101, i64 %98)
  store double %99, double* %95, align 8
  %102 = bitcast %struct.complex* %temp1 to i8*
  %103 = bitcast %struct.complex* %tmp3 to i8*
  %104 = bitcast i8* %102 to i8*
  %105 = bitcast i8* %103 to i8*
  %106 = bitcast i64 16 to i64
  %107 = call i64 @getAddr(i8* %104)
  %108 = call i64 @getAddr(i8* %105)
  call void @handleLLVMMemcpy(i64 %107, i64 %108, i64 %106)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %102, i8* align 8 %103, i64 16, i1 false)
  %real5 = getelementptr inbounds %struct.complex, %struct.complex* %temp, i32 0, i32 0
  %109 = bitcast double* %real5 to i8*
  %110 = call i64 @getAddr(i8* %109)
  %111 = load double, double* %real5, align 8
  %imag6 = getelementptr inbounds %struct.complex, %struct.complex* %temp, i32 0, i32 1
  %112 = bitcast double* %imag6 to i8*
  %113 = call i64 @getAddr(i8* %112)
  %114 = load double, double* %imag6, align 8
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0), double %111, double %114)
  %real8 = getelementptr inbounds %struct.complex, %struct.complex* %temp1, i32 0, i32 0
  %115 = bitcast double* %real8 to i8*
  %116 = call i64 @getAddr(i8* %115)
  %117 = load double, double* %real8, align 8
  %imag9 = getelementptr inbounds %struct.complex, %struct.complex* %temp1, i32 0, i32 1
  %118 = bitcast double* %imag9 to i8*
  %119 = call i64 @getAddr(i8* %118)
  %120 = load double, double* %imag9, align 8
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0), double %117, double %120)
  call void @finish()
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { double, double } @add(double %n1.coerce0, double %n1.coerce1, double %n2.coerce0, double %n2.coerce1) #0 {
entry:
  %0 = bitcast { double, double } (double, double, double, double)* @add to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %retval = alloca %struct.complex, align 8
  %n1 = alloca %struct.complex, align 8
  %2 = bitcast %struct.complex* %n1 to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %n2 = alloca %struct.complex, align 8
  %4 = bitcast %struct.complex* %n2 to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @handleAlloca(i64 %5)
  %6 = bitcast %struct.complex* %n1 to { double, double }*
  %7 = getelementptr inbounds { double, double }, { double, double }* %6, i32 0, i32 0
  %8 = bitcast double* %7 to i8*
  %9 = call i64 @getAddr(i8* %8)
  %10 = bitcast { double, double } (double, double, double, double)* @add to i8*
  %11 = call i64 @getAddr(i8* %10)
  call void @setRealFunArg(i32 0, i64 %11, i64 %9, double %n1.coerce0)
  store double %n1.coerce0, double* %7, align 8
  %12 = getelementptr inbounds { double, double }, { double, double }* %6, i32 0, i32 1
  %13 = bitcast double* %12 to i8*
  %14 = call i64 @getAddr(i8* %13)
  %15 = bitcast { double, double } (double, double, double, double)* @add to i8*
  %16 = call i64 @getAddr(i8* %15)
  call void @setRealFunArg(i32 1, i64 %16, i64 %14, double %n1.coerce1)
  store double %n1.coerce1, double* %12, align 8
  %17 = bitcast %struct.complex* %n2 to { double, double }*
  %18 = getelementptr inbounds { double, double }, { double, double }* %17, i32 0, i32 0
  %19 = bitcast double* %18 to i8*
  %20 = call i64 @getAddr(i8* %19)
  %21 = bitcast { double, double } (double, double, double, double)* @add to i8*
  %22 = call i64 @getAddr(i8* %21)
  call void @setRealFunArg(i32 2, i64 %22, i64 %20, double %n2.coerce0)
  store double %n2.coerce0, double* %18, align 8
  %23 = getelementptr inbounds { double, double }, { double, double }* %17, i32 0, i32 1
  %24 = bitcast double* %23 to i8*
  %25 = call i64 @getAddr(i8* %24)
  %26 = bitcast { double, double } (double, double, double, double)* @add to i8*
  %27 = call i64 @getAddr(i8* %26)
  call void @setRealFunArg(i32 3, i64 %27, i64 %25, double %n2.coerce1)
  store double %n2.coerce1, double* %23, align 8
  %real = getelementptr inbounds %struct.complex, %struct.complex* %n1, i32 0, i32 0
  %28 = bitcast double* %real to i8*
  %29 = call i64 @getAddr(i8* %28)
  %30 = load double, double* %real, align 8
  %real1 = getelementptr inbounds %struct.complex, %struct.complex* %n2, i32 0, i32 0
  %31 = bitcast double* %real1 to i8*
  %32 = call i64 @getAddr(i8* %31)
  %33 = load double, double* %real1, align 8
  %add = fadd double %30, %33
  %34 = call i64 @computeReal(i32 12, i64 %29, i64 %32, double %30, double %33, double %add, i32 92)
  %real2 = getelementptr inbounds %struct.complex, %struct.complex* %retval, i32 0, i32 0
  %35 = bitcast double* %real2 to i8*
  %36 = call i64 @getAddr(i8* %35)
  call void @setRealTemp(i64 %36, i64 %34)
  store double %add, double* %real2, align 8
  %imag = getelementptr inbounds %struct.complex, %struct.complex* %n1, i32 0, i32 1
  %37 = bitcast double* %imag to i8*
  %38 = call i64 @getAddr(i8* %37)
  %39 = load double, double* %imag, align 8
  %imag3 = getelementptr inbounds %struct.complex, %struct.complex* %n2, i32 0, i32 1
  %40 = bitcast double* %imag3 to i8*
  %41 = call i64 @getAddr(i8* %40)
  %42 = load double, double* %imag3, align 8
  %add4 = fadd double %39, %42
  %43 = call i64 @computeReal(i32 12, i64 %38, i64 %41, double %39, double %42, double %add4, i32 99)
  %imag5 = getelementptr inbounds %struct.complex, %struct.complex* %retval, i32 0, i32 1
  %44 = bitcast double* %imag5 to i8*
  %45 = call i64 @getAddr(i8* %44)
  call void @setRealTemp(i64 %45, i64 %43)
  store double %add4, double* %imag5, align 8
  %46 = bitcast %struct.complex* %retval to { double, double }*
  %47 = bitcast { double, double }* %46 to i8*
  %48 = call i64 @getAddr(i8* %47)
  %49 = load { double, double }, { double, double }* %46, align 8
  %50 = bitcast { double, double } (double, double, double, double)* @add to i8*
  %51 = call i64 @getAddr(i8* %50)
  call void @trackReturn(i64 %51, i64 %48)
  call void @cleanComputeReal(i32 92)
  call void @cleanComputeReal(i32 99)
  ret { double, double } %49
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #1

declare dso_local i32 @printf(i8*, ...) #2

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @handleAlloca(i64)

declare void @setRealConstant(i64, double)

declare void @addFunArg(i32, i64, i64)

declare i64 @handleExtractValue(i32, i64)

declare void @setRealTemp(i64, i64)

declare void @handleLLVMMemcpy(i64, i64, i64)

declare void @finish()

declare void @setRealFunArg(i32, i64, i64, double)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @trackReturn(i64, i64)

declare void @cleanComputeReal(i32)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
