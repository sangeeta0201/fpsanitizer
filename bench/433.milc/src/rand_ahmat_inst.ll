; ModuleID = 'rand_ahmat_inst.bc'
source_filename = "rand_ahmat.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anti_hermitmat = type { %struct.complex, %struct.complex, %struct.complex, double, double, double, double }
%struct.complex = type { double, double }
%struct.double_prn = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, double }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @random_anti_hermitian(%struct.anti_hermitmat* %mat_antihermit, %struct.double_prn* %prn_pt) #0 {
entry:
  %0 = bitcast i8* null to i8*
  %1 = bitcast void (%struct.anti_hermitmat*, %struct.double_prn*)* @random_anti_hermitian to i8*
  %2 = call i64 @getAddr(i8* %1)
  call void @funcInit(i64 %2)
  %mat_antihermit.addr = alloca %struct.anti_hermitmat*, align 8
  %3 = bitcast %struct.anti_hermitmat** %mat_antihermit.addr to i8*
  %4 = call i64 @getAddr(i8* %3)
  call void @handleAlloca(i64 %4)
  %prn_pt.addr = alloca %struct.double_prn*, align 8
  %5 = bitcast %struct.double_prn** %prn_pt.addr to i8*
  %6 = call i64 @getAddr(i8* %5)
  call void @handleAlloca(i64 %6)
  %r3 = alloca double, align 8
  %7 = bitcast double* %r3 to i8*
  %8 = call i64 @getAddr(i8* %7)
  call void @handleAlloca(i64 %8)
  %r8 = alloca double, align 8
  %9 = bitcast double* %r8 to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void @handleAlloca(i64 %10)
  %sqrt_third = alloca double, align 8
  %11 = bitcast double* %sqrt_third to i8*
  %12 = call i64 @getAddr(i8* %11)
  call void @handleAlloca(i64 %12)
  %13 = bitcast %struct.anti_hermitmat** %mat_antihermit.addr to i8*
  %14 = call i64 @getAddr(i8* %13)
  %15 = bitcast %struct.anti_hermitmat* %mat_antihermit to i8*
  %16 = call i64 @getAddr(i8* %15)
  call void @setRealTemp(i64 %14, i64 %16)
  store %struct.anti_hermitmat* %mat_antihermit, %struct.anti_hermitmat** %mat_antihermit.addr, align 8
  %17 = bitcast %struct.double_prn** %prn_pt.addr to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = bitcast %struct.double_prn* %prn_pt to i8*
  %20 = call i64 @getAddr(i8* %19)
  call void @setRealTemp(i64 %18, i64 %20)
  store %struct.double_prn* %prn_pt, %struct.double_prn** %prn_pt.addr, align 8
  %call = call double @sqrt(double 0x3FD5555555555555) #3
  %21 = call i64 @handleMathFunc(i32 1, double 0x3FD5555555555555, i64 0, double %call, i32 10)
  %22 = bitcast double* %sqrt_third to i8*
  %23 = call i64 @getAddr(i8* %22)
  call void @setRealTemp(i64 %23, i64 %21)
  store double %call, double* %sqrt_third, align 8
  %24 = bitcast %struct.double_prn** %prn_pt.addr to i8*
  %25 = call i64 @getAddr(i8* %24)
  %26 = load %struct.double_prn*, %struct.double_prn** %prn_pt.addr, align 8
  %call1 = call double @gaussian_rand_no(%struct.double_prn* %26)
  %27 = bitcast double* %r3 to i8*
  %28 = call i64 @getAddr(i8* %27)
  store double %call1, double* %r3, align 8
  %29 = bitcast %struct.double_prn** %prn_pt.addr to i8*
  %30 = call i64 @getAddr(i8* %29)
  %31 = load %struct.double_prn*, %struct.double_prn** %prn_pt.addr, align 8
  %call2 = call double @gaussian_rand_no(%struct.double_prn* %31)
  %32 = bitcast double* %r8 to i8*
  %33 = call i64 @getAddr(i8* %32)
  store double %call2, double* %r8, align 8
  %34 = bitcast double* %r3 to i8*
  %35 = call i64 @getAddr(i8* %34)
  %36 = load double, double* %r3, align 8
  %37 = bitcast double* %sqrt_third to i8*
  %38 = call i64 @getAddr(i8* %37)
  %39 = load double, double* %sqrt_third, align 8
  %40 = bitcast double* %r8 to i8*
  %41 = call i64 @getAddr(i8* %40)
  %42 = load double, double* %r8, align 8
  %mul = fmul double %39, %42
  %43 = call i64 @computeReal(i32 16, i64 %38, i64 %41, double %39, double %42, double %mul, i32 21)
  %add = fadd double %36, %mul
  %44 = call i64 @computeReal(i32 12, i64 %35, i64 %43, double %36, double %mul, double %add, i32 22)
  %45 = bitcast %struct.anti_hermitmat** %mat_antihermit.addr to i8*
  %46 = call i64 @getAddr(i8* %45)
  %47 = load %struct.anti_hermitmat*, %struct.anti_hermitmat** %mat_antihermit.addr, align 8
  %m00im = getelementptr inbounds %struct.anti_hermitmat, %struct.anti_hermitmat* %47, i32 0, i32 3
  %48 = bitcast double* %m00im to i8*
  %49 = call i64 @getAddr(i8* %48)
  call void @setRealTemp(i64 %49, i64 %44)
  store double %add, double* %m00im, align 8
  %50 = bitcast double* %r3 to i8*
  %51 = call i64 @getAddr(i8* %50)
  %52 = load double, double* %r3, align 8
  %sub = fsub double -0.000000e+00, %52
  %53 = call i64 @computeReal(i32 14, i64 0, i64 %51, double -0.000000e+00, double %52, double %sub, i32 27)
  %54 = bitcast double* %sqrt_third to i8*
  %55 = call i64 @getAddr(i8* %54)
  %56 = load double, double* %sqrt_third, align 8
  %57 = bitcast double* %r8 to i8*
  %58 = call i64 @getAddr(i8* %57)
  %59 = load double, double* %r8, align 8
  %mul3 = fmul double %56, %59
  %60 = call i64 @computeReal(i32 16, i64 %55, i64 %58, double %56, double %59, double %mul3, i32 30)
  %add4 = fadd double %sub, %mul3
  %61 = call i64 @computeReal(i32 12, i64 %53, i64 %60, double %sub, double %mul3, double %add4, i32 31)
  %62 = bitcast %struct.anti_hermitmat** %mat_antihermit.addr to i8*
  %63 = call i64 @getAddr(i8* %62)
  %64 = load %struct.anti_hermitmat*, %struct.anti_hermitmat** %mat_antihermit.addr, align 8
  %m11im = getelementptr inbounds %struct.anti_hermitmat, %struct.anti_hermitmat* %64, i32 0, i32 4
  %65 = bitcast double* %m11im to i8*
  %66 = call i64 @getAddr(i8* %65)
  call void @setRealTemp(i64 %66, i64 %61)
  store double %add4, double* %m11im, align 8
  %67 = bitcast double* %sqrt_third to i8*
  %68 = call i64 @getAddr(i8* %67)
  %69 = load double, double* %sqrt_third, align 8
  %mul5 = fmul double -2.000000e+00, %69
  %70 = call i64 @computeReal(i32 16, i64 0, i64 %68, double -2.000000e+00, double %69, double %mul5, i32 36)
  %71 = bitcast double* %r8 to i8*
  %72 = call i64 @getAddr(i8* %71)
  %73 = load double, double* %r8, align 8
  %mul6 = fmul double %mul5, %73
  %74 = call i64 @computeReal(i32 16, i64 %70, i64 %72, double %mul5, double %73, double %mul6, i32 38)
  %75 = bitcast %struct.anti_hermitmat** %mat_antihermit.addr to i8*
  %76 = call i64 @getAddr(i8* %75)
  %77 = load %struct.anti_hermitmat*, %struct.anti_hermitmat** %mat_antihermit.addr, align 8
  %m22im = getelementptr inbounds %struct.anti_hermitmat, %struct.anti_hermitmat* %77, i32 0, i32 5
  %78 = bitcast double* %m22im to i8*
  %79 = call i64 @getAddr(i8* %78)
  call void @setRealTemp(i64 %79, i64 %74)
  store double %mul6, double* %m22im, align 8
  %80 = bitcast %struct.double_prn** %prn_pt.addr to i8*
  %81 = call i64 @getAddr(i8* %80)
  %82 = load %struct.double_prn*, %struct.double_prn** %prn_pt.addr, align 8
  %call7 = call double @gaussian_rand_no(%struct.double_prn* %82)
  %83 = bitcast %struct.anti_hermitmat** %mat_antihermit.addr to i8*
  %84 = call i64 @getAddr(i8* %83)
  %85 = load %struct.anti_hermitmat*, %struct.anti_hermitmat** %mat_antihermit.addr, align 8
  %m01 = getelementptr inbounds %struct.anti_hermitmat, %struct.anti_hermitmat* %85, i32 0, i32 0
  %real = getelementptr inbounds %struct.complex, %struct.complex* %m01, i32 0, i32 0
  %86 = bitcast double* %real to i8*
  %87 = call i64 @getAddr(i8* %86)
  store double %call7, double* %real, align 8
  %88 = bitcast %struct.double_prn** %prn_pt.addr to i8*
  %89 = call i64 @getAddr(i8* %88)
  %90 = load %struct.double_prn*, %struct.double_prn** %prn_pt.addr, align 8
  %call8 = call double @gaussian_rand_no(%struct.double_prn* %90)
  %91 = bitcast %struct.anti_hermitmat** %mat_antihermit.addr to i8*
  %92 = call i64 @getAddr(i8* %91)
  %93 = load %struct.anti_hermitmat*, %struct.anti_hermitmat** %mat_antihermit.addr, align 8
  %m02 = getelementptr inbounds %struct.anti_hermitmat, %struct.anti_hermitmat* %93, i32 0, i32 1
  %real9 = getelementptr inbounds %struct.complex, %struct.complex* %m02, i32 0, i32 0
  %94 = bitcast double* %real9 to i8*
  %95 = call i64 @getAddr(i8* %94)
  store double %call8, double* %real9, align 8
  %96 = bitcast %struct.double_prn** %prn_pt.addr to i8*
  %97 = call i64 @getAddr(i8* %96)
  %98 = load %struct.double_prn*, %struct.double_prn** %prn_pt.addr, align 8
  %call10 = call double @gaussian_rand_no(%struct.double_prn* %98)
  %99 = bitcast %struct.anti_hermitmat** %mat_antihermit.addr to i8*
  %100 = call i64 @getAddr(i8* %99)
  %101 = load %struct.anti_hermitmat*, %struct.anti_hermitmat** %mat_antihermit.addr, align 8
  %m12 = getelementptr inbounds %struct.anti_hermitmat, %struct.anti_hermitmat* %101, i32 0, i32 2
  %real11 = getelementptr inbounds %struct.complex, %struct.complex* %m12, i32 0, i32 0
  %102 = bitcast double* %real11 to i8*
  %103 = call i64 @getAddr(i8* %102)
  store double %call10, double* %real11, align 8
  %104 = bitcast %struct.double_prn** %prn_pt.addr to i8*
  %105 = call i64 @getAddr(i8* %104)
  %106 = load %struct.double_prn*, %struct.double_prn** %prn_pt.addr, align 8
  %call12 = call double @gaussian_rand_no(%struct.double_prn* %106)
  %107 = bitcast %struct.anti_hermitmat** %mat_antihermit.addr to i8*
  %108 = call i64 @getAddr(i8* %107)
  %109 = load %struct.anti_hermitmat*, %struct.anti_hermitmat** %mat_antihermit.addr, align 8
  %m0113 = getelementptr inbounds %struct.anti_hermitmat, %struct.anti_hermitmat* %109, i32 0, i32 0
  %imag = getelementptr inbounds %struct.complex, %struct.complex* %m0113, i32 0, i32 1
  %110 = bitcast double* %imag to i8*
  %111 = call i64 @getAddr(i8* %110)
  store double %call12, double* %imag, align 8
  %112 = bitcast %struct.double_prn** %prn_pt.addr to i8*
  %113 = call i64 @getAddr(i8* %112)
  %114 = load %struct.double_prn*, %struct.double_prn** %prn_pt.addr, align 8
  %call14 = call double @gaussian_rand_no(%struct.double_prn* %114)
  %115 = bitcast %struct.anti_hermitmat** %mat_antihermit.addr to i8*
  %116 = call i64 @getAddr(i8* %115)
  %117 = load %struct.anti_hermitmat*, %struct.anti_hermitmat** %mat_antihermit.addr, align 8
  %m0215 = getelementptr inbounds %struct.anti_hermitmat, %struct.anti_hermitmat* %117, i32 0, i32 1
  %imag16 = getelementptr inbounds %struct.complex, %struct.complex* %m0215, i32 0, i32 1
  %118 = bitcast double* %imag16 to i8*
  %119 = call i64 @getAddr(i8* %118)
  store double %call14, double* %imag16, align 8
  %120 = bitcast %struct.double_prn** %prn_pt.addr to i8*
  %121 = call i64 @getAddr(i8* %120)
  %122 = load %struct.double_prn*, %struct.double_prn** %prn_pt.addr, align 8
  %call17 = call double @gaussian_rand_no(%struct.double_prn* %122)
  %123 = bitcast %struct.anti_hermitmat** %mat_antihermit.addr to i8*
  %124 = call i64 @getAddr(i8* %123)
  %125 = load %struct.anti_hermitmat*, %struct.anti_hermitmat** %mat_antihermit.addr, align 8
  %m1218 = getelementptr inbounds %struct.anti_hermitmat, %struct.anti_hermitmat* %125, i32 0, i32 2
  %imag19 = getelementptr inbounds %struct.complex, %struct.complex* %m1218, i32 0, i32 1
  %126 = bitcast double* %imag19 to i8*
  %127 = call i64 @getAddr(i8* %126)
  store double %call17, double* %imag19, align 8
  %128 = bitcast void (%struct.anti_hermitmat*, %struct.double_prn*)* @random_anti_hermitian to i8*
  %129 = call i64 @getAddr(i8* %128)
  call void @funcExit(i64 %129)
  call void @cleanComputeReal(i32 10)
  call void @cleanComputeReal(i32 21)
  call void @cleanComputeReal(i32 22)
  call void @cleanComputeReal(i32 27)
  call void @cleanComputeReal(i32 30)
  call void @cleanComputeReal(i32 31)
  call void @cleanComputeReal(i32 36)
  call void @cleanComputeReal(i32 38)
  ret void
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #1

declare dso_local double @gaussian_rand_no(%struct.double_prn*) #2

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @funcExit(i64)

declare void @handleAlloca(i64)

declare void @setRealTemp(i64, i64)

declare i64 @handleMathFunc(i32, double, i64, double, i32)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @cleanComputeReal(i32)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
