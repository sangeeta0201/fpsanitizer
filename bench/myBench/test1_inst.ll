; ModuleID = 'test1_inst.bc'
source_filename = "test1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private dso_local unnamed_addr constant [4 x i8] c"%g\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @f() #0 {
entry:
  %a = alloca double, align 8
  %b = alloca double, align 8
  %c = alloca double, align 8
  store double 1.000000e+16, double* %a, align 8
  %0 = load double, double* %a, align 8
  %add = fadd double %0, 1.000000e+00
  %1 = load double, double* %a, align 8
  %sub = fsub double %add, %1
  store double %sub, double* %b, align 8
  %2 = load double, double* %a, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %2)
  %3 = load double, double* %b, align 8
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %3)
  %4 = load double, double* %b, align 8
  %cmp = fcmp oge double %4, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %5 = load double, double* %b, align 8
  %call2 = call double @sqrt(double %5) #3
  %add3 = fadd double %call2, 1.000000e+01
  store double %add3, double* %c, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %6 = load double, double* %b, align 8
  %sub4 = fsub double -0.000000e+00, %6
  %call5 = call double @sqrt(double %sub4) #3
  %add6 = fadd double %call5, 1.000000e+01
  store double %add6, double* %c, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %7 = load double, double* %c, align 8
  %conv = fptosi double %7 to i32
  ret i32 %conv
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %res = alloca double, align 8
  %res1 = alloca double, align 8
  %call = call i32 @f()
  %conv = sitofp i32 %call to double
  %0 = bitcast double* %res to i8*
  store double %conv, double* %res, align 8
  %call1 = call i32 @f()
  %conv2 = sitofp i32 %call1 to double
  %1 = bitcast double* %res1 to i8*
  store double %conv2, double* %res1, align 8
  %2 = load double, double* %res, align 8
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %2)
  ret i32 0
}

declare void @setRealTemp(i8*, i8*)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
