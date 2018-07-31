; ModuleID = 'diff-roots-simple_inst.bc'
source_filename = "diff-roots-simple.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%e\0A\00", align 1

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca double, align 8
  %y = alloca double, align 8
  %0 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %1 = bitcast double* %x to i8*
  call void @setRealConstant_double(i8* %1, double 1.000000e+16)
  store double 1.000000e+16, double* %x, align 8
  %2 = load double, double* %x, align 8
  %3 = bitcast double* %x to i8*
  %4 = bitcast double 1.000000e+00 to double
  %5 = call i8* @handleOp_3_d(i32 12, i8* %3, double %4)
  %add = fadd double %2, 1.000000e+00
  %6 = bitcast i8* %5 to i8*
  %7 = call i8* @handleMathFunc(i32 1, i8* %6)
  %call = call double @sqrt(double %add) #3
  %8 = load double, double* %x, align 8
  %9 = bitcast double* %x to i8*
  %10 = call i8* @handleMathFunc(i32 1, i8* %9)
  %call1 = call double @sqrt(double %8) #3
  %11 = bitcast i8* %7 to i8*
  %12 = bitcast i8* %10 to i8*
  %13 = call i8* @handleOp_1(i32 14, i8* %11, i8* %12)
  %sub = fsub double %call, %call1
  %14 = bitcast double* %y to i8*
  %15 = bitcast i8* %13 to i8*
  call void @setRealTemp(i8* %14, i8* %15)
  store double %sub, double* %y, align 8
  %16 = load double, double* %y, align 8
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %16)
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #1

declare dso_local i32 @printf(i8*, ...) #2

declare void @setRealTemp(i8*, i8*)

declare void @setRealConstant_double(i8*, double)

declare i8* @handleOp_3_d(i32, i8*, double)

declare i8* @handleMathFunc(i32, i8*)

declare i8* @handleOp_1(i32, i8*, i8*)

attributes #0 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 324638) (llvm/trunk 324636)"}
