; ModuleID = 'var-test-2_inst.bc'
source_filename = "var-test-2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%e\0A%e\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @add(double %x, double %y) #0 {
entry:
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %sum = alloca double, align 8
  %0 = bitcast double* %x.addr to i8*
  store double %x, double* %x.addr, align 8
  %1 = bitcast double* %y.addr to i8*
  store double %y, double* %y.addr, align 8
  %2 = load double, double* %x.addr, align 8
  %3 = load double, double* %y.addr, align 8
  %4 = bitcast double* %x.addr to i8*
  %5 = bitcast double* %y.addr to i8*
  %add = fadd double %2, %3
  %6 = call i8* @computeReal(i32 12, i8* %4, i8* %5, double %2, double %3, double %add, i32 7)
  %7 = bitcast double* %sum to i8*
  store double %add, double* %sum, align 8
  call void @cleanComputeReal(i32 7)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @addTwo(double %x, double %y) #0 {
entry:
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %0 = bitcast double* %x.addr to i8*
  store double %x, double* %x.addr, align 8
  %1 = bitcast double* %y.addr to i8*
  store double %y, double* %y.addr, align 8
  %2 = load double, double* %x.addr, align 8
  %3 = load double, double* %y.addr, align 8
  %4 = bitcast double* %x.addr to i8*
  %5 = bitcast double* %y.addr to i8*
  %add = fadd double %2, %3
  %6 = call i8* @computeReal(i32 12, i8* %4, i8* %5, double %2, double %3, double %add, i32 16)
  %7 = bitcast i8* %6 to i8*
  call void @trackReturn(i8* %7)
  ret double %add
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %x = alloca double, align 8
  %y = alloca double, align 8
  %z = alloca double, align 8
  %0 = bitcast double* %z to i8*
  store volatile double 3.000000e+00, double* %z, align 8
  %call = call double @addTwo(double 5.000000e+00, double 7.000000e+00)
  %1 = bitcast double* %y to i8*
  %2 = bitcast double (double, double)* @addTwo to i8*
  call void @setRealReturn(i8* %1)
  store volatile double %call, double* %y, align 8
  %3 = load volatile double, double* %x, align 8
  %4 = load volatile double, double* %y, align 8
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), double %3, double %4)
  call void @finish()
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

declare i8* @computeReal(i32, i8*, i8*, double, double, double, i32)

declare void @cleanComputeReal(i32)

declare void @trackReturn(i8*)

declare void @setRealReturn(i8*)

declare void @finish()

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
