; ModuleID = 'recur_inst.bc'
source_filename = "recur.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"x: %e:\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"y: %e:\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"later x: %e:\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"later y: %e:\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"sub: %e:\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"z: %e:\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @foo(double %x, double %y) #0 {
entry:
  %0 = bitcast double (double, double)* @foo to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %retval = alloca double, align 8
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %sum = alloca double, align 8
  %sub = alloca double, align 8
  %2 = bitcast double* %x.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast double (double, double)* @foo to i8*
  %5 = call i64 @getAddr(i8* %4)
  %6 = call i64 @getRealFunArg(i32 0, i64 %5)
  call void @setRealFunArg(i64 %6, i64 %3, double %x)
  store double %x, double* %x.addr, align 8
  %7 = bitcast double* %y.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  %9 = bitcast double (double, double)* @foo to i8*
  %10 = call i64 @getAddr(i8* %9)
  %11 = call i64 @getRealFunArg(i32 1, i64 %10)
  call void @setRealFunArg(i64 %11, i64 %8, double %y)
  store double %y, double* %y.addr, align 8
  %12 = bitcast double* %sum to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @setRealConstant(i64 %13, double 0.000000e+00)
  store double 0.000000e+00, double* %sum, align 8
  %14 = bitcast double* %sub to i8*
  %15 = call i64 @getAddr(i8* %14)
  call void @setRealConstant(i64 %15, double 0.000000e+00)
  store double 0.000000e+00, double* %sub, align 8
  %16 = load double, double* %x.addr, align 8
  %17 = bitcast double* %x.addr to i8*
  %18 = call i64 @getAddr(i8* %17)
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), double %16)
  %19 = load double, double* %y.addr, align 8
  %20 = bitcast double* %y.addr to i8*
  %21 = call i64 @getAddr(i8* %20)
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), double %19)
  %22 = load double, double* %y.addr, align 8
  %23 = bitcast double* %y.addr to i8*
  %24 = call i64 @getAddr(i8* %23)
  %add = fadd double %22, 2.000000e-01
  %25 = call i64 @computeReal(i32 12, i64 %24, i64 0, double %22, double 2.000000e-01, double %22, double 2.000000e-01, double %add, i64 3, i32 14)
  %26 = bitcast double* %y.addr to i8*
  %27 = call i64 @getAddr(i8* %26)
  call void @setRealTemp(i64 %27, i64 %25, double %add)
  store double %add, double* %y.addr, align 8
  %28 = load double, double* %x.addr, align 8
  %29 = bitcast double* %x.addr to i8*
  %30 = call i64 @getAddr(i8* %29)
  %cmp = fcmp ole double %28, 0.000000e+00
  call void @checkBranch(double %28, i64 %30, double 0.000000e+00, i64 0, i32 5, i1 %cmp, i32 17, i64 0)
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %31 = bitcast double* %retval to i8*
  %32 = call i64 @getAddr(i8* %31)
  call void @setRealConstant(i64 %32, double 0.000000e+00)
  store double 0.000000e+00, double* %retval, align 8
  br label %return

if.else:                                          ; preds = %entry
  %33 = load double, double* %x.addr, align 8
  %34 = bitcast double* %x.addr to i8*
  %35 = call i64 @getAddr(i8* %34)
  %sub2 = fsub double %33, 2.000000e-01
  %36 = call i64 @computeReal(i32 14, i64 %35, i64 0, double %33, double 2.000000e-01, double %33, double 2.000000e-01, double %sub2, i64 3, i32 22)
  %37 = bitcast double* %x.addr to i8*
  %38 = call i64 @getAddr(i8* %37)
  call void @setRealTemp(i64 %38, i64 %36, double %sub2)
  store double %sub2, double* %x.addr, align 8
  %39 = load double, double* %x.addr, align 8
  %40 = bitcast double* %x.addr to i8*
  %41 = call i64 @getAddr(i8* %40)
  %42 = load double, double* %y.addr, align 8
  %43 = bitcast double* %y.addr to i8*
  %44 = call i64 @getAddr(i8* %43)
  %45 = bitcast double (double, double)* @foo to i8*
  %46 = call i64 @getAddr(i8* %45)
  call void @addFunArg(i32 0, i64 %46, i64 %41)
  call void @addFunArg(i32 1, i64 %46, i64 %44)
  %call3 = call double @foo(double %39, double %42)
  br label %if.end

if.end:                                           ; preds = %if.else
  %47 = load double, double* %x.addr, align 8
  %48 = bitcast double* %x.addr to i8*
  %49 = call i64 @getAddr(i8* %48)
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), double %47)
  %50 = load double, double* %y.addr, align 8
  %51 = bitcast double* %y.addr to i8*
  %52 = call i64 @getAddr(i8* %51)
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), double %50)
  %53 = load double, double* %y.addr, align 8
  %54 = bitcast double* %y.addr to i8*
  %55 = call i64 @getAddr(i8* %54)
  %56 = load double, double* %x.addr, align 8
  %57 = bitcast double* %x.addr to i8*
  %58 = call i64 @getAddr(i8* %57)
  %sub6 = fsub double %53, %56
  %59 = call i64 @computeReal(i32 14, i64 %55, i64 %58, double %53, double %56, double %53, double %56, double %sub6, i64 3, i32 34)
  %60 = bitcast double* %sub to i8*
  %61 = call i64 @getAddr(i8* %60)
  call void @setRealTemp(i64 %61, i64 %59, double %sub6)
  store double %sub6, double* %sub, align 8
  %62 = load double, double* %sub, align 8
  %63 = bitcast double* %sub to i8*
  %64 = call i64 @getAddr(i8* %63)
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), double %62)
  %65 = load double, double* %sub, align 8
  %66 = bitcast double* %sub to i8*
  %67 = call i64 @getAddr(i8* %66)
  %68 = bitcast double* %retval to i8*
  %69 = call i64 @getAddr(i8* %68)
  call void @setRealTemp(i64 %69, i64 %67, double %65)
  store double %65, double* %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %70 = load double, double* %retval, align 8
  %71 = bitcast double* %retval to i8*
  %72 = call i64 @getAddr(i8* %71)
  %73 = bitcast double (double, double)* @foo to i8*
  %74 = call i64 @getAddr(i8* %73)
  call void @funcExit(i64 %74, i64 %72)
  ret double %70
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  call void @init()
  %0 = bitcast i32 ()* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %x = alloca double, align 8
  %y = alloca double, align 8
  %z = alloca double, align 8
  %2 = bitcast double* %x to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @setRealConstant(i64 %3, double 6.000000e-01)
  store double 6.000000e-01, double* %x, align 8
  %4 = bitcast double* %y to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealConstant(i64 %5, double 3.200000e+00)
  store double 3.200000e+00, double* %y, align 8
  %6 = load double, double* %x, align 8
  %7 = bitcast double* %x to i8*
  %8 = call i64 @getAddr(i8* %7)
  %9 = load double, double* %y, align 8
  %10 = bitcast double* %y to i8*
  %11 = call i64 @getAddr(i8* %10)
  %12 = bitcast double (double, double)* @foo to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @addFunArg(i32 0, i64 %13, i64 %8)
  call void @addFunArg(i32 1, i64 %13, i64 %11)
  %call = call double @foo(double %6, double %9)
  %14 = bitcast double* %z to i8*
  %15 = call i64 @getAddr(i8* %14)
  call void @setRealReturn(i64 %15)
  store double %call, double* %z, align 8
  %16 = load double, double* %z, align 8
  %17 = bitcast double* %z to i8*
  %18 = call i64 @getAddr(i8* %17)
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %16)
  call void @finish()
  ret i32 0
}

declare i64 @getAddr(i8*)

declare i64 @getRealFunArg(i32, i64)

declare void @setRealFunArg(i64, i64, double)

declare void @setRealTemp(i64, i64, double)

declare void @setRealConstant(i64, double)

declare i64 @computeReal(i32, i64, i64, double, double, double, double, double, i64, i32)

declare void @checkBranch(double, i64, double, i64, i32, i1, i32, i64)

declare void @addFunArg(i32, i64, i64)

declare void @setRealReturn(i64)

declare void @finish()

declare void @funcInit(i64)

declare void @funcExit(i64, i64)

declare void @init()

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
