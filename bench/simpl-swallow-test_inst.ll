; ModuleID = 'simpl-swallow-test_inst.bc'
source_filename = "simpl-swallow-test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"z = %e\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"t = %e\0A\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"a = %e\0A\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"b = %e\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @foo(double %x) #0 {
entry:
  %0 = bitcast double (double)* @foo to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %x.addr = alloca double, align 8
  %2 = bitcast double* %x.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast double (double)* @foo to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealFunArg(i32 0, i64 %5, i64 %3, double %x)
  store double %x, double* %x.addr, align 8
  %6 = bitcast double* %x.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = load double, double* %x.addr, align 8
  %mul = fmul double %8, 5.000000e+00
  %9 = call i64 @computeReal(i32 16, i64 %7, i64 0, double %8, double 5.000000e+00, double %8, double 5.000000e+00, double %mul, i64 3, i32 3)
  %add = fadd double %mul, 1.000000e+00
  %10 = call i64 @computeReal(i32 12, i64 %9, i64 0, double %mul, double 1.000000e+00, double %mul, double 1.000000e+00, double %add, i64 3, i32 4)
  %11 = bitcast double* %x.addr to i8*
  %12 = call i64 @getAddr(i8* %11)
  %13 = load double, double* %x.addr, align 8
  %mul1 = fmul double %13, 5.000000e+00
  %14 = call i64 @computeReal(i32 16, i64 %12, i64 0, double %13, double 5.000000e+00, double %13, double 5.000000e+00, double %mul1, i64 3, i32 6)
  %sub = fsub double %add, %mul1
  %15 = call i64 @computeReal(i32 14, i64 %10, i64 %14, double %add, double %mul1, double %add, double %mul1, double %sub, i64 3, i32 7)
  %16 = bitcast double (double)* @foo to i8*
  %17 = call i64 @getAddr(i8* %16)
  call void @funcExit(i64 %17, i64 %15)
  ret double %sub
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @bar(double %x, double %y) #0 {
entry:
  %0 = bitcast double (double, double)* @bar to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %2 = bitcast double* %x.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast double (double, double)* @bar to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealFunArg(i32 0, i64 %5, i64 %3, double %x)
  store double %x, double* %x.addr, align 8
  %6 = bitcast double* %y.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = bitcast double (double, double)* @bar to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @setRealFunArg(i32 1, i64 %9, i64 %7, double %y)
  store double %y, double* %y.addr, align 8
  %10 = bitcast double* %x.addr to i8*
  %11 = call i64 @getAddr(i8* %10)
  %12 = load double, double* %x.addr, align 8
  %mul = fmul double %12, 5.000000e+00
  %13 = call i64 @computeReal(i32 16, i64 %11, i64 0, double %12, double 5.000000e+00, double %12, double 5.000000e+00, double %mul, i64 3, i32 14)
  %14 = bitcast double* %y.addr to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = load double, double* %y.addr, align 8
  %add = fadd double 1.000000e+00, %16
  %17 = call i64 @computeReal(i32 12, i64 0, i64 %15, double 1.000000e+00, double %16, double 1.000000e+00, double %16, double %add, i64 3, i32 16)
  %add1 = fadd double %mul, %add
  %18 = call i64 @computeReal(i32 12, i64 %13, i64 %17, double %mul, double %add, double %mul, double %add, double %add1, i64 3, i32 17)
  %19 = bitcast double* %x.addr to i8*
  %20 = call i64 @getAddr(i8* %19)
  %21 = load double, double* %x.addr, align 8
  %mul2 = fmul double %21, 5.000000e+00
  %22 = call i64 @computeReal(i32 16, i64 %20, i64 0, double %21, double 5.000000e+00, double %21, double 5.000000e+00, double %mul2, i64 3, i32 19)
  %23 = bitcast double* %y.addr to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = load double, double* %y.addr, align 8
  %add3 = fadd double %mul2, %25
  %26 = call i64 @computeReal(i32 12, i64 %22, i64 %24, double %mul2, double %25, double %mul2, double %25, double %add3, i64 3, i32 21)
  %sub = fsub double %add1, %add3
  %27 = call i64 @computeReal(i32 14, i64 %18, i64 %26, double %add1, double %add3, double %add1, double %add3, double %sub, i64 3, i32 22)
  %28 = bitcast double (double, double)* @bar to i8*
  %29 = call i64 @getAddr(i8* %28)
  call void @funcExit(i64 %29, i64 %27)
  ret double %sub
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = bitcast i32 (i32, i8**)* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %x = alloca double, align 8
  %y = alloca double, align 8
  %z = alloca double, align 8
  %t = alloca double, align 8
  %a = alloca double, align 8
  %b = alloca double, align 8
  %2 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %3 = bitcast i32* %argc.addr to i8*
  store i32 %argc, i32* %argc.addr, align 4
  %4 = bitcast i8*** %argv.addr to i8*
  %5 = call i64 @getAddr(i8* %4)
  %6 = bitcast i8** %argv to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @setRealTemp(i64 %5, i64 %7)
  store i8** %argv, i8*** %argv.addr, align 8
  %8 = bitcast double* %x to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @setRealConstant(i64 %9, double 1.000000e+00)
  store volatile double 1.000000e+00, double* %x, align 8
  %10 = bitcast double* %y to i8*
  %11 = call i64 @getAddr(i8* %10)
  call void @setRealConstant(i64 %11, double 1.000000e+16)
  store volatile double 1.000000e+16, double* %y, align 8
  %12 = bitcast double* %x to i8*
  %13 = call i64 @getAddr(i8* %12)
  %14 = load volatile double, double* %x, align 8
  %15 = bitcast double (double)* @foo to i8*
  %16 = call i64 @getAddr(i8* %15)
  call void @addFunArg(i32 0, i64 %16, i64 %13)
  %call = call double @foo(double %14)
  %17 = bitcast double* %z to i8*
  %18 = call i64 @getAddr(i8* %17)
  call void @setRealReturn(i64 %18)
  store volatile double %call, double* %z, align 8
  %19 = bitcast double* %y to i8*
  %20 = call i64 @getAddr(i8* %19)
  %21 = load volatile double, double* %y, align 8
  %22 = bitcast double (double)* @foo to i8*
  %23 = call i64 @getAddr(i8* %22)
  call void @addFunArg(i32 0, i64 %23, i64 %20)
  %call1 = call double @foo(double %21)
  %24 = bitcast double* %t to i8*
  %25 = call i64 @getAddr(i8* %24)
  call void @setRealReturn(i64 %25)
  store volatile double %call1, double* %t, align 8
  %26 = bitcast double* %z to i8*
  %27 = call i64 @getAddr(i8* %26)
  %28 = load volatile double, double* %z, align 8
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), double %28)
  %29 = bitcast double* %t to i8*
  %30 = call i64 @getAddr(i8* %29)
  %31 = load volatile double, double* %t, align 8
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), double %31)
  %32 = bitcast double* %z to i8*
  %33 = call i64 @getAddr(i8* %32)
  %34 = load volatile double, double* %z, align 8
  %35 = bitcast double* %t to i8*
  %36 = call i64 @getAddr(i8* %35)
  %37 = load volatile double, double* %t, align 8
  %38 = bitcast double (double, double)* @bar to i8*
  %39 = call i64 @getAddr(i8* %38)
  call void @addFunArg(i32 0, i64 %39, i64 %33)
  call void @addFunArg(i32 1, i64 %39, i64 %36)
  %call4 = call double @bar(double %34, double %37)
  %40 = bitcast double* %a to i8*
  %41 = call i64 @getAddr(i8* %40)
  call void @setRealReturn(i64 %41)
  store volatile double %call4, double* %a, align 8
  %42 = bitcast double* %x to i8*
  %43 = call i64 @getAddr(i8* %42)
  %44 = load volatile double, double* %x, align 8
  %45 = bitcast double (double, double)* @bar to i8*
  %46 = call i64 @getAddr(i8* %45)
  call void @addFunArg(i32 0, i64 %46, i64 %43)
  %call5 = call double @bar(double %44, double 9.000000e+00)
  %47 = bitcast double* %b to i8*
  %48 = call i64 @getAddr(i8* %47)
  call void @setRealReturn(i64 %48)
  store volatile double %call5, double* %b, align 8
  %49 = bitcast double* %a to i8*
  %50 = call i64 @getAddr(i8* %49)
  %51 = load volatile double, double* %a, align 8
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0), double %51)
  %52 = bitcast double* %b to i8*
  %53 = call i64 @getAddr(i8* %52)
  %54 = load volatile double, double* %b, align 8
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), double %54)
  call void @finish()
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

declare i64 @getAddr(i8*)

declare void @setRealFunArg(i32, i64, i64, double)

declare i64 @computeReal(i32, i64, i64, double, double, double, double, double, i64, i32)

declare void @setRealTemp(i64, i64)

declare void @setRealConstant(i64, double)

declare void @addFunArg(i32, i64, i64)

declare void @setRealReturn(i64)

declare void @finish()

declare void @funcInit(i64)

declare void @funcExit(i64, i64)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
