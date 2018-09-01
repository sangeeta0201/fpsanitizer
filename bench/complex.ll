; ModuleID = 'complex.bc'
source_filename = "complex.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.complex = type { double, double }

@.str = private unnamed_addr constant [20 x i8] c"Sum = %.1f + %.1fi\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %n1 = alloca %struct.complex, align 8
  %n2 = alloca %struct.complex, align 8
  %temp = alloca %struct.complex, align 8
  %temp1 = alloca %struct.complex, align 8
  %tmp = alloca %struct.complex, align 8
  %tmp3 = alloca %struct.complex, align 8
  store i32 0, i32* %retval, align 4
  %real = getelementptr inbounds %struct.complex, %struct.complex* %n1, i32 0, i32 0
  store double 2.300000e+00, double* %real, align 8
  %imag = getelementptr inbounds %struct.complex, %struct.complex* %n1, i32 0, i32 1
  store double 1.100000e+00, double* %imag, align 8
  %real1 = getelementptr inbounds %struct.complex, %struct.complex* %n2, i32 0, i32 0
  store double 3.100000e+00, double* %real1, align 8
  %imag2 = getelementptr inbounds %struct.complex, %struct.complex* %n2, i32 0, i32 1
  store double 4.500000e+00, double* %imag2, align 8
  %0 = bitcast %struct.complex* %n1 to { double, double }*
  %1 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 0
  %2 = load double, double* %1, align 8
  %3 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 1
  %4 = load double, double* %3, align 8
  %5 = bitcast %struct.complex* %n2 to { double, double }*
  %6 = getelementptr inbounds { double, double }, { double, double }* %5, i32 0, i32 0
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds { double, double }, { double, double }* %5, i32 0, i32 1
  %9 = load double, double* %8, align 8
  %call = call { double, double } @add(double %2, double %4, double %7, double %9)
  %10 = bitcast %struct.complex* %tmp to { double, double }*
  %11 = getelementptr inbounds { double, double }, { double, double }* %10, i32 0, i32 0
  %12 = extractvalue { double, double } %call, 0
  store double %12, double* %11, align 8
  %13 = getelementptr inbounds { double, double }, { double, double }* %10, i32 0, i32 1
  %14 = extractvalue { double, double } %call, 1
  store double %14, double* %13, align 8
  %15 = bitcast %struct.complex* %temp to i8*
  %16 = bitcast %struct.complex* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %15, i8* align 8 %16, i64 16, i1 false)
  %17 = bitcast %struct.complex* %n1 to { double, double }*
  %18 = getelementptr inbounds { double, double }, { double, double }* %17, i32 0, i32 0
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds { double, double }, { double, double }* %17, i32 0, i32 1
  %21 = load double, double* %20, align 8
  %22 = bitcast %struct.complex* %temp to { double, double }*
  %23 = getelementptr inbounds { double, double }, { double, double }* %22, i32 0, i32 0
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds { double, double }, { double, double }* %22, i32 0, i32 1
  %26 = load double, double* %25, align 8
  %call4 = call { double, double } @add(double %19, double %21, double %24, double %26)
  %27 = bitcast %struct.complex* %tmp3 to { double, double }*
  %28 = getelementptr inbounds { double, double }, { double, double }* %27, i32 0, i32 0
  %29 = extractvalue { double, double } %call4, 0
  store double %29, double* %28, align 8
  %30 = getelementptr inbounds { double, double }, { double, double }* %27, i32 0, i32 1
  %31 = extractvalue { double, double } %call4, 1
  store double %31, double* %30, align 8
  %32 = bitcast %struct.complex* %temp1 to i8*
  %33 = bitcast %struct.complex* %tmp3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %32, i8* align 8 %33, i64 16, i1 false)
  %real5 = getelementptr inbounds %struct.complex, %struct.complex* %temp, i32 0, i32 0
  %34 = load double, double* %real5, align 8
  %imag6 = getelementptr inbounds %struct.complex, %struct.complex* %temp, i32 0, i32 1
  %35 = load double, double* %imag6, align 8
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0), double %34, double %35)
  %real8 = getelementptr inbounds %struct.complex, %struct.complex* %temp1, i32 0, i32 0
  %36 = load double, double* %real8, align 8
  %imag9 = getelementptr inbounds %struct.complex, %struct.complex* %temp1, i32 0, i32 1
  %37 = load double, double* %imag9, align 8
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0), double %36, double %37)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { double, double } @add(double %n1.coerce0, double %n1.coerce1, double %n2.coerce0, double %n2.coerce1) #0 {
entry:
  %retval = alloca %struct.complex, align 8
  %n1 = alloca %struct.complex, align 8
  %n2 = alloca %struct.complex, align 8
  %0 = bitcast %struct.complex* %n1 to { double, double }*
  %1 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 0
  store double %n1.coerce0, double* %1, align 8
  %2 = getelementptr inbounds { double, double }, { double, double }* %0, i32 0, i32 1
  store double %n1.coerce1, double* %2, align 8
  %3 = bitcast %struct.complex* %n2 to { double, double }*
  %4 = getelementptr inbounds { double, double }, { double, double }* %3, i32 0, i32 0
  store double %n2.coerce0, double* %4, align 8
  %5 = getelementptr inbounds { double, double }, { double, double }* %3, i32 0, i32 1
  store double %n2.coerce1, double* %5, align 8
  %real = getelementptr inbounds %struct.complex, %struct.complex* %n1, i32 0, i32 0
  %6 = load double, double* %real, align 8
  %real1 = getelementptr inbounds %struct.complex, %struct.complex* %n2, i32 0, i32 0
  %7 = load double, double* %real1, align 8
  %add = fadd double %6, %7
  %real2 = getelementptr inbounds %struct.complex, %struct.complex* %retval, i32 0, i32 0
  store double %add, double* %real2, align 8
  %imag = getelementptr inbounds %struct.complex, %struct.complex* %n1, i32 0, i32 1
  %8 = load double, double* %imag, align 8
  %imag3 = getelementptr inbounds %struct.complex, %struct.complex* %n2, i32 0, i32 1
  %9 = load double, double* %imag3, align 8
  %add4 = fadd double %8, %9
  %imag5 = getelementptr inbounds %struct.complex, %struct.complex* %retval, i32 0, i32 1
  store double %add4, double* %imag5, align 8
  %10 = bitcast %struct.complex* %retval to { double, double }*
  %11 = load { double, double }, { double, double }* %10, align 8
  ret { double, double } %11
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
