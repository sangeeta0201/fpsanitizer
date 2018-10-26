; ModuleID = 'testSetReturn_inst.bc'
source_filename = "testSetReturn.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"insufficient arguments\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"count:%d\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"The value of double is %f\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @foo(double* %a, double* %b, i32 %count) #0 {
entry:
  %0 = bitcast double (double*, double*, i32)* @foo to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %a.addr = alloca double*, align 8
  %b.addr = alloca double*, align 8
  %count.addr = alloca i32, align 4
  %temp = alloca double, align 8
  %i = alloca i32, align 4
  %2 = bitcast double** %a.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast double* %a to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5, double* %a)
  store double* %a, double** %a.addr, align 8
  %6 = bitcast double** %b.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = bitcast double* %b to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @setRealTemp(i64 %7, i64 %9, double* %b)
  store double* %b, double** %b.addr, align 8
  %10 = bitcast i32* %count.addr to i8*
  store i32 %count, i32* %count.addr, align 4
  %11 = bitcast double* %temp to i8*
  %12 = call i64 @getAddr(i8* %11)
  store double 0.000000e+00, double* %temp, align 8
  %13 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %14 = load i32, i32* %i, align 4
  %15 = bitcast i32* %i to i8*
  %16 = call i64 @getAddr(i8* %15)
  %17 = load i32, i32* %count.addr, align 4
  %18 = bitcast i32* %count.addr to i8*
  %19 = call i64 @getAddr(i8* %18)
  %cmp = icmp slt i32 %14, %17
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %20 = load double*, double** %a.addr, align 8
  %21 = bitcast double* %20 to i8*
  %22 = call i64 @getAddr(i8* %21)
  %23 = load double, double* %20, align 8
  %24 = bitcast double* %20 to i8*
  %25 = call i64 @getAddr(i8* %24)
  %26 = load double*, double** %b.addr, align 8
  %27 = bitcast double* %26 to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load double, double* %26, align 8
  %30 = bitcast double* %26 to i8*
  %31 = call i64 @getAddr(i8* %30)
  %mul = fmul double %29, 1.000000e-01
  %32 = call i64 @computeReal(i32 16, i64 %31, i64 0, double %29, double 1.000000e-01, double %29, double 1.000000e-01, double %mul, i64 3, i32 19)
  %add = fadd double %23, %mul
  %33 = call i64 @computeReal(i32 12, i64 %25, i64 %32, double %23, double %mul, double %23, double %mul, double %add, i64 3, i32 20)
  %34 = bitcast double* %temp to i8*
  %35 = call i64 @getAddr(i8* %34)
  call void bitcast (void (i64, i64, double*)* @setRealTemp to void (i64, i64, double)*)(i64 %35, i64 %33, double %add)
  store double %add, double* %temp, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %36 = load i32, i32* %i, align 4
  %37 = bitcast i32* %i to i8*
  %38 = call i64 @getAddr(i8* %37)
  %inc = add nsw i32 %36, 1
  %39 = bitcast i32* %i to i8*
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %40 = load double, double* %temp, align 8
  %41 = bitcast double* %temp to i8*
  %42 = call i64 @getAddr(i8* %41)
  %43 = bitcast double (double*, double*, i32)* @foo to i8*
  %44 = call i64 @getAddr(i8* %43)
  call void @funcExit(i64 %44, i64 %42)
  ret double %40
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  call void @init()
  %0 = bitcast i32 (i32, i8**)* @main to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %count = alloca i32, align 4
  %a = alloca double, align 8
  %b = alloca double, align 8
  %sum = alloca double, align 8
  %i = alloca i32, align 4
  %2 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %3 = bitcast i32* %argc.addr to i8*
  store i32 %argc, i32* %argc.addr, align 4
  %4 = bitcast i8*** %argv.addr to i8*
  %5 = call i64 @getAddr(i8* %4)
  %6 = bitcast i8** %argv to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void bitcast (void (i64, i64, double*)* @setRealTemp to void (i64, i64, i8**)*)(i64 %5, i64 %7, i8** %argv)
  store i8** %argv, i8*** %argv.addr, align 8
  %8 = load i32, i32* %argc.addr, align 4
  %9 = bitcast i32* %argc.addr to i8*
  %10 = call i64 @getAddr(i8* %9)
  %cmp = icmp slt i32 %8, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0))
  %11 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %12 = load i8**, i8*** %argv.addr, align 8
  %13 = bitcast i8** %12 to i8*
  %14 = call i64 @getAddr(i8* %13)
  %arrayidx = getelementptr inbounds i8*, i8** %12, i64 1
  %15 = load i8*, i8** %arrayidx, align 8
  %16 = bitcast i8* %15 to i8*
  %17 = call i64 @getAddr(i8* %16)
  %18 = bitcast i32 (i8*)* @atoi to i8*
  %19 = call i64 @getAddr(i8* %18)
  %call1 = call i32 @atoi(i8* %15) #3
  %20 = bitcast i32* %count to i8*
  store i32 %call1, i32* %count, align 4
  %21 = bitcast double* %a to i8*
  %22 = call i64 @getAddr(i8* %21)
  store double 2.000000e-01, double* %a, align 8
  %23 = bitcast double* %b to i8*
  %24 = call i64 @getAddr(i8* %23)
  store double 1.000000e-01, double* %b, align 8
  %25 = bitcast double* %sum to i8*
  %26 = call i64 @getAddr(i8* %25)
  store double 0.000000e+00, double* %sum, align 8
  %27 = load i32, i32* %count, align 4
  %28 = bitcast i32* %count to i8*
  %29 = call i64 @getAddr(i8* %28)
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 %27)
  %30 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %31 = load i32, i32* %i, align 4
  %32 = bitcast i32* %i to i8*
  %33 = call i64 @getAddr(i8* %32)
  %34 = load i32, i32* %count, align 4
  %35 = bitcast i32* %count to i8*
  %36 = call i64 @getAddr(i8* %35)
  %cmp3 = icmp slt i32 %31, %34
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %37 = load i32, i32* %count, align 4
  %38 = bitcast i32* %count to i8*
  %39 = call i64 @getAddr(i8* %38)
  %40 = bitcast double (double*, double*, i32)* @foo to i8*
  %41 = call i64 @getAddr(i8* %40)
  %call4 = call double @foo(double* %a, double* %sum, i32 %37)
  %42 = bitcast double* %sum to i8*
  %43 = call i64 @getAddr(i8* %42)
  %44 = bitcast double (double*, double*, i32)* @foo to i8*
  %45 = call i64 @getAddr(i8* %44)
  call void @setRealReturn(i64 %43, i64 %45)
  store double %call4, double* %sum, align 8
  %46 = load double, double* %sum, align 8
  %47 = bitcast double* %sum to i8*
  %48 = call i64 @getAddr(i8* %47)
  %49 = load i32, i32* %count, align 4
  %50 = bitcast i32* %count to i8*
  %51 = call i64 @getAddr(i8* %50)
  %52 = bitcast double (double*, double*, i32)* @foo to i8*
  %53 = call i64 @getAddr(i8* %52)
  %call5 = call double @foo(double* %a, double* %b, i32 %49)
  %54 = bitcast double (double*, double*, i32)* @foo to i8*
  %55 = call i64 @getAddr(i8* %54)
  %56 = call i64 @getRealReturn(i64 %55)
  %add = fadd double %46, %call5
  %57 = call i64 @computeReal(i32 12, i64 %48, i64 %56, double %46, double %call5, double %46, double %call5, double %add, i64 3, i32 68)
  %58 = bitcast double* %sum to i8*
  %59 = call i64 @getAddr(i8* %58)
  call void bitcast (void (i64, i64, double*)* @setRealTemp to void (i64, i64, double)*)(i64 %59, i64 %57, double %add)
  store double %add, double* %sum, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %60 = load i32, i32* %i, align 4
  %61 = bitcast i32* %i to i8*
  %62 = call i64 @getAddr(i8* %61)
  %inc = add nsw i32 %60, 1
  %63 = bitcast i32* %i to i8*
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %64 = load double, double* %sum, align 8
  %65 = bitcast double* %sum to i8*
  %66 = call i64 @getAddr(i8* %65)
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i32 0, i32 0), double %64)
  %67 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %68 = load i32, i32* %retval, align 4
  %69 = bitcast i32* %retval to i8*
  %70 = call i64 @getAddr(i8* %69)
  call void @finish()
  ret i32 %68
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #2

declare i64 @getAddr(i8*)

declare void @setRealTemp(i64, i64, double*)

declare i64 @computeReal(i32, i64, i64, double, double, double, double, double, i64, i32)

declare void @setRealReturn(i64, i64)

declare i64 @getRealReturn(i64)

declare void @finish()

declare void @funcInit(i64)

declare void @funcExit(i64, i64)

declare void @init()

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
