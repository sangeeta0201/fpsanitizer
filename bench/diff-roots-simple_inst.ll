; ModuleID = 'diff-roots-simple_inst.bc'
source_filename = "diff-roots-simple.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%e\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %0 = bitcast i32 ()* @main to i8*
  call void @funcInit(i8* %0)
  %retval = alloca i32, align 4
  %1 = bitcast i32* %retval to i8*
  call void @handleAlloca(i8* %1)
  %x = alloca double, align 8
  %2 = bitcast double* %x to i8*
  call void @handleAlloca(i8* %2)
  %y = alloca double, align 8
  %3 = bitcast double* %y to i8*
  call void @handleAlloca(i8* %3)
  %4 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %5 = bitcast double* %x to i8*
  call void @setRealConstant(i8* %5, double 1.000000e+16)
  store volatile double 1.000000e+16, double* %x, align 8
  %6 = load volatile double, double* %x, align 8
  %7 = bitcast double* %x to i8*
  %8 = bitcast i8* null to i8*
  %add = fadd double %6, 1.000000e+00
  %9 = call i8* @computeReal(i32 12, i8* %7, i8* %8, double %6, double 1.000000e+00, double %add, i32 8)
  %10 = bitcast i8* %9 to i8*
  %call = call double @sqrt(double %add) #3
  %11 = call i8* @handleMathFunc(i32 1, double %add, i8* %10, double %call, i32 9)
  %12 = load volatile double, double* %x, align 8
  %13 = bitcast double* %x to i8*
  %call1 = call double @sqrt(double %12) #3
  %14 = call i8* @handleMathFunc(i32 1, double %12, i8* %13, double %call1, i32 11)
  %15 = bitcast i8* %11 to i8*
  %16 = bitcast i8* %14 to i8*
  %sub = fsub double %call, %call1
  %17 = call i8* @computeReal(i32 14, i8* %15, i8* %16, double %call, double %call1, double %sub, i32 12)
  %18 = bitcast double* %y to i8*
  %19 = bitcast i8* %17 to i8*
  call void @setRealTemp(i8* %18, i8* %19)
  store volatile double %sub, double* %y, align 8
  %20 = load volatile double, double* %y, align 8
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %20)
  %21 = bitcast i32 ()* @main to i8*
  call void @funcExit(i8* %21)
  call void @cleanComputeReal(i32 8)
  call void @cleanComputeReal(i32 12)
  call void @finish()
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #1

declare dso_local i32 @printf(i8*, ...) #2

declare void @funcInit(i8*)

declare void @funcExit(i8*)

declare void @handleAlloca(i8*)

declare void @setRealConstant(i8*, double)

declare i8* @computeReal(i32, i8*, i8*, double, double, double, i32)

declare i8* @handleMathFunc(i32, double, i8*, double, i32)

declare void @setRealTemp(i8*, i8*)

declare void @cleanComputeReal(i32)

declare void @finish()

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
