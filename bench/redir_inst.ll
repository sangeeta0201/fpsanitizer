; ModuleID = 'redir_inst.bc'
source_filename = "redir.c"
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
  %i = alloca i32, align 4
  %3 = bitcast i32* %i to i8*
  call void @handleAlloca(i8* %3)
  %4 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %5 = bitcast double* %x to i8*
  call void @setRealConstant(i8* %5, double 0.000000e+00)
  store volatile double 0.000000e+00, double* %x, align 8
  %6 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %7, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4
  %conv = sitofp i32 %8 to double
  %call = call double @sqrt(double %conv) #3
  %9 = load volatile double, double* %x, align 8
  %10 = bitcast double* %x to i8*
  %add = fadd double %9, %call
  %11 = bitcast double* %x to i8*
  store volatile double %add, double* %x, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  %13 = bitcast i32* %i to i8*
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %14 = load volatile double, double* %x, align 8
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %14)
  %15 = load i32, i32* %retval, align 4
  %16 = bitcast i32 ()* @main to i8*
  call void @funcExit(i8* %16)
  %17 = bitcast i32* %retval to i8*
  call void @trackReturn(i8* %17)
  call void @finish()
  ret i32 %15
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #1

declare dso_local i32 @printf(i8*, ...) #2

declare void @funcInit(i8*)

declare void @funcExit(i8*)

declare void @handleAlloca(i8*)

declare void @setRealConstant(i8*, double)

declare void @setRealTemp(i8*, i8*)

declare void @trackReturn(i8*)

declare void @finish()

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
