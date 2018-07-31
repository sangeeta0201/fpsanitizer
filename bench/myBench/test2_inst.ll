; ModuleID = 'test2_inst.bc'
source_filename = "test2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca double, align 8
  %b = alloca double, align 8
  %c = alloca double, align 8
  %0 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %1 = bitcast double* %a to i8*
  call void @setRealConstant_double(i8* %1, double 1.000000e+16)
  store double 1.000000e+16, double* %a, align 8
  %2 = load double, double* %a, align 8
  %3 = bitcast double* %a to i8*
  %4 = call i8* @computeRealVC(i32 12, i8* %3, double 1.000000e+00, i32 0)
  %add = fadd double %2, 1.000000e+00
  %5 = load double, double* %a, align 8
  %6 = bitcast i8* %4 to i8*
  %7 = bitcast double* %a to i8*
  %8 = call i8* @computeRealVV(i32 14, i8* %6, i8* %7, i32 1)
  %sub = fsub double %add, %5
  %9 = bitcast double* %b to i8*
  %10 = bitcast i8* %8 to i8*
  call void @setRealTemp(i8* %9, i8* %10)
  store double %sub, double* %b, align 8
  %11 = load double, double* %a, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %11)
  %12 = load double, double* %b, align 8
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %12)
  %13 = load double, double* %b, align 8
  %14 = bitcast double* %b to i8*
  %15 = call i8* @checkBranchVC(i8* %14, double 0.000000e+00)
  %cmp = fcmp oge double %13, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %16 = load double, double* %b, align 8
  %17 = bitcast double* %b to i8*
  %18 = call i8* @handleMathFunc(i32 1, i8* %17)
  %call2 = call double @sqrt(double %16) #3
  %19 = bitcast i8* %18 to i8*
  %20 = call i8* @computeRealVC(i32 12, i8* %19, double 1.000000e+01, i32 2)
  %add3 = fadd double %call2, 1.000000e+01
  %21 = bitcast double* %c to i8*
  %22 = bitcast i8* %20 to i8*
  call void @setRealTemp(i8* %21, i8* %22)
  store double %add3, double* %c, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %23 = load double, double* %b, align 8
  %24 = bitcast double* %b to i8*
  %25 = call i8* @computeRealCV(i32 14, double -0.000000e+00, i8* %24, i32 3)
  %sub4 = fsub double -0.000000e+00, %23
  %26 = bitcast i8* %25 to i8*
  %27 = call i8* @handleMathFunc(i32 1, i8* %26)
  %call5 = call double @sqrt(double %sub4) #3
  %28 = bitcast i8* %27 to i8*
  %29 = call i8* @computeRealVC(i32 12, i8* %28, double 1.000000e+01, i32 4)
  %add6 = fadd double %call5, 1.000000e+01
  %30 = bitcast double* %c to i8*
  %31 = bitcast i8* %29 to i8*
  call void @setRealTemp(i8* %30, i8* %31)
  store double %add6, double* %c, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %32 = load double, double* %c, align 8
  %conv = fptosi double %32 to i32
  ret i32 %conv
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

declare void @setRealTemp(i8*, i8*)

declare void @setRealConstant_double(i8*, double)

declare i8* @computeRealVC(i32, i8*, double, i32)

declare i8* @computeRealVV(i32, i8*, i8*, i32)

declare i8* @checkBranchVC(i8*, double)

declare i8* @handleMathFunc(i32, i8*)

declare i8* @computeRealCV(i32, double, i8*, i32)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
