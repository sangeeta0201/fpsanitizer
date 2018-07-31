; ModuleID = 'sum-50_inst.bc'
source_filename = "sum-50.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%.20g\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca double, align 8
  %0 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %1 = bitcast double* %x to i8*
  call void @setRealConstant_double(i8* %1, double 0.000000e+00)
  store double 0.000000e+00, double* %x, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load double, double* %x, align 8
  %cmp = fcmp olt double %2, 1.000000e+01
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load double, double* %x, align 8
  %4 = bitcast double* %x to i8*
  %5 = call i8* @handleOp_3_d(i32 12, i8* %4, double 0x3FC99999A0000000)
  %add = fadd double %3, 0x3FC99999A0000000
  %6 = bitcast double* %x to i8*
  %7 = bitcast i8* %5 to i8*
  call void @setRealTemp(i8* %6, i8* %7)
  store double %add, double* %x, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %8 = load double, double* %x, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), double %8)
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

declare dso_local i32 @printf(i8*, ...) #1

declare void @setRealTemp(i8*, i8*)

declare void @setRealConstant_double(i8*, double)

declare i8* @handleOp_3_d(i32, i8*, double)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
