; ModuleID = '3mm_inst.bc'
source_filename = "linear-algebra/kernels/3mm/3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

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
  %ni = alloca i32, align 4
  %nj = alloca i32, align 4
  %nk = alloca i32, align 4
  %nl = alloca i32, align 4
  %nm = alloca i32, align 4
  %E = alloca [32 x [32 x double]]*, align 8
  %A = alloca [32 x [32 x double]]*, align 8
  %B = alloca [32 x [32 x double]]*, align 8
  %F = alloca [32 x [32 x double]]*, align 8
  %C = alloca [32 x [32 x double]]*, align 8
  %D = alloca [32 x [32 x double]]*, align 8
  %G = alloca [32 x [32 x double]]*, align 8
  %2 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %3 = bitcast i32* %argc.addr to i8*
  store i32 %argc, i32* %argc.addr, align 4
  %4 = bitcast i8*** %argv.addr to i8*
  %5 = call i64 @getAddr(i8* %4)
  %6 = bitcast i8** %argv to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @setRealTemp(i64 %5, i64 %7, i8** %argv)
  store i8** %argv, i8*** %argv.addr, align 8
  %8 = bitcast i32* %ni to i8*
  store i32 32, i32* %ni, align 4
  %9 = bitcast i32* %nj to i8*
  store i32 32, i32* %nj, align 4
  %10 = bitcast i32* %nk to i8*
  store i32 32, i32* %nk, align 4
  %11 = bitcast i32* %nl to i8*
  store i32 32, i32* %nl, align 4
  %12 = bitcast i32* %nm to i8*
  store i32 32, i32* %nm, align 4
  %13 = bitcast i8* (i64, i32)* @polybench_alloc_data to i8*
  %14 = call i64 @getAddr(i8* %13)
  %call = call i8* @polybench_alloc_data(i64 1024, i32 8)
  %15 = bitcast i8* %call to [32 x [32 x double]]*
  %16 = bitcast [32 x [32 x double]]** %E to i8*
  %17 = call i64 @getAddr(i8* %16)
  %18 = bitcast [32 x [32 x double]]* %15 to i8*
  %19 = call i64 @getAddr(i8* %18)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x [32 x double]]*)*)(i64 %17, i64 %19, [32 x [32 x double]]* %15)
  store [32 x [32 x double]]* %15, [32 x [32 x double]]** %E, align 8
  %20 = bitcast i8* (i64, i32)* @polybench_alloc_data to i8*
  %21 = call i64 @getAddr(i8* %20)
  %call1 = call i8* @polybench_alloc_data(i64 1024, i32 8)
  %22 = bitcast i8* %call1 to [32 x [32 x double]]*
  %23 = bitcast [32 x [32 x double]]** %A to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = bitcast [32 x [32 x double]]* %22 to i8*
  %26 = call i64 @getAddr(i8* %25)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x [32 x double]]*)*)(i64 %24, i64 %26, [32 x [32 x double]]* %22)
  store [32 x [32 x double]]* %22, [32 x [32 x double]]** %A, align 8
  %27 = bitcast i8* (i64, i32)* @polybench_alloc_data to i8*
  %28 = call i64 @getAddr(i8* %27)
  %call2 = call i8* @polybench_alloc_data(i64 1024, i32 8)
  %29 = bitcast i8* %call2 to [32 x [32 x double]]*
  %30 = bitcast [32 x [32 x double]]** %B to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = bitcast [32 x [32 x double]]* %29 to i8*
  %33 = call i64 @getAddr(i8* %32)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x [32 x double]]*)*)(i64 %31, i64 %33, [32 x [32 x double]]* %29)
  store [32 x [32 x double]]* %29, [32 x [32 x double]]** %B, align 8
  %34 = bitcast i8* (i64, i32)* @polybench_alloc_data to i8*
  %35 = call i64 @getAddr(i8* %34)
  %call3 = call i8* @polybench_alloc_data(i64 1024, i32 8)
  %36 = bitcast i8* %call3 to [32 x [32 x double]]*
  %37 = bitcast [32 x [32 x double]]** %F to i8*
  %38 = call i64 @getAddr(i8* %37)
  %39 = bitcast [32 x [32 x double]]* %36 to i8*
  %40 = call i64 @getAddr(i8* %39)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x [32 x double]]*)*)(i64 %38, i64 %40, [32 x [32 x double]]* %36)
  store [32 x [32 x double]]* %36, [32 x [32 x double]]** %F, align 8
  %41 = bitcast i8* (i64, i32)* @polybench_alloc_data to i8*
  %42 = call i64 @getAddr(i8* %41)
  %call4 = call i8* @polybench_alloc_data(i64 1024, i32 8)
  %43 = bitcast i8* %call4 to [32 x [32 x double]]*
  %44 = bitcast [32 x [32 x double]]** %C to i8*
  %45 = call i64 @getAddr(i8* %44)
  %46 = bitcast [32 x [32 x double]]* %43 to i8*
  %47 = call i64 @getAddr(i8* %46)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x [32 x double]]*)*)(i64 %45, i64 %47, [32 x [32 x double]]* %43)
  store [32 x [32 x double]]* %43, [32 x [32 x double]]** %C, align 8
  %48 = bitcast i8* (i64, i32)* @polybench_alloc_data to i8*
  %49 = call i64 @getAddr(i8* %48)
  %call5 = call i8* @polybench_alloc_data(i64 1024, i32 8)
  %50 = bitcast i8* %call5 to [32 x [32 x double]]*
  %51 = bitcast [32 x [32 x double]]** %D to i8*
  %52 = call i64 @getAddr(i8* %51)
  %53 = bitcast [32 x [32 x double]]* %50 to i8*
  %54 = call i64 @getAddr(i8* %53)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x [32 x double]]*)*)(i64 %52, i64 %54, [32 x [32 x double]]* %50)
  store [32 x [32 x double]]* %50, [32 x [32 x double]]** %D, align 8
  %55 = bitcast i8* (i64, i32)* @polybench_alloc_data to i8*
  %56 = call i64 @getAddr(i8* %55)
  %call6 = call i8* @polybench_alloc_data(i64 1024, i32 8)
  %57 = bitcast i8* %call6 to [32 x [32 x double]]*
  %58 = bitcast [32 x [32 x double]]** %G to i8*
  %59 = call i64 @getAddr(i8* %58)
  %60 = bitcast [32 x [32 x double]]* %57 to i8*
  %61 = call i64 @getAddr(i8* %60)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x [32 x double]]*)*)(i64 %59, i64 %61, [32 x [32 x double]]* %57)
  store [32 x [32 x double]]* %57, [32 x [32 x double]]** %G, align 8
  %62 = load i32, i32* %ni, align 4
  %63 = bitcast i32* %ni to i8*
  %64 = call i64 @getAddr(i8* %63)
  %65 = load i32, i32* %nj, align 4
  %66 = bitcast i32* %nj to i8*
  %67 = call i64 @getAddr(i8* %66)
  %68 = load i32, i32* %nk, align 4
  %69 = bitcast i32* %nk to i8*
  %70 = call i64 @getAddr(i8* %69)
  %71 = load i32, i32* %nl, align 4
  %72 = bitcast i32* %nl to i8*
  %73 = call i64 @getAddr(i8* %72)
  %74 = load i32, i32* %nm, align 4
  %75 = bitcast i32* %nm to i8*
  %76 = call i64 @getAddr(i8* %75)
  %77 = load [32 x [32 x double]]*, [32 x [32 x double]]** %A, align 8
  %78 = bitcast [32 x [32 x double]]* %77 to i8*
  %79 = call i64 @getAddr(i8* %78)
  %arraydecay = getelementptr inbounds [32 x [32 x double]], [32 x [32 x double]]* %77, i32 0, i32 0
  %80 = load [32 x [32 x double]]*, [32 x [32 x double]]** %B, align 8
  %81 = bitcast [32 x [32 x double]]* %80 to i8*
  %82 = call i64 @getAddr(i8* %81)
  %arraydecay7 = getelementptr inbounds [32 x [32 x double]], [32 x [32 x double]]* %80, i32 0, i32 0
  %83 = load [32 x [32 x double]]*, [32 x [32 x double]]** %C, align 8
  %84 = bitcast [32 x [32 x double]]* %83 to i8*
  %85 = call i64 @getAddr(i8* %84)
  %arraydecay8 = getelementptr inbounds [32 x [32 x double]], [32 x [32 x double]]* %83, i32 0, i32 0
  %86 = load [32 x [32 x double]]*, [32 x [32 x double]]** %D, align 8
  %87 = bitcast [32 x [32 x double]]* %86 to i8*
  %88 = call i64 @getAddr(i8* %87)
  %arraydecay9 = getelementptr inbounds [32 x [32 x double]], [32 x [32 x double]]* %86, i32 0, i32 0
  %89 = bitcast void (i32, i32, i32, i32, i32, [32 x double]*, [32 x double]*, [32 x double]*, [32 x double]*)* @init_array to i8*
  %90 = call i64 @getAddr(i8* %89)
  call void @init_array(i32 %62, i32 %65, i32 %68, i32 %71, i32 %74, [32 x double]* %arraydecay, [32 x double]* %arraydecay7, [32 x double]* %arraydecay8, [32 x double]* %arraydecay9)
  %91 = load i32, i32* %ni, align 4
  %92 = bitcast i32* %ni to i8*
  %93 = call i64 @getAddr(i8* %92)
  %94 = load i32, i32* %nj, align 4
  %95 = bitcast i32* %nj to i8*
  %96 = call i64 @getAddr(i8* %95)
  %97 = load i32, i32* %nk, align 4
  %98 = bitcast i32* %nk to i8*
  %99 = call i64 @getAddr(i8* %98)
  %100 = load i32, i32* %nl, align 4
  %101 = bitcast i32* %nl to i8*
  %102 = call i64 @getAddr(i8* %101)
  %103 = load i32, i32* %nm, align 4
  %104 = bitcast i32* %nm to i8*
  %105 = call i64 @getAddr(i8* %104)
  %106 = load [32 x [32 x double]]*, [32 x [32 x double]]** %E, align 8
  %107 = bitcast [32 x [32 x double]]* %106 to i8*
  %108 = call i64 @getAddr(i8* %107)
  %arraydecay10 = getelementptr inbounds [32 x [32 x double]], [32 x [32 x double]]* %106, i32 0, i32 0
  %109 = load [32 x [32 x double]]*, [32 x [32 x double]]** %A, align 8
  %110 = bitcast [32 x [32 x double]]* %109 to i8*
  %111 = call i64 @getAddr(i8* %110)
  %arraydecay11 = getelementptr inbounds [32 x [32 x double]], [32 x [32 x double]]* %109, i32 0, i32 0
  %112 = load [32 x [32 x double]]*, [32 x [32 x double]]** %B, align 8
  %113 = bitcast [32 x [32 x double]]* %112 to i8*
  %114 = call i64 @getAddr(i8* %113)
  %arraydecay12 = getelementptr inbounds [32 x [32 x double]], [32 x [32 x double]]* %112, i32 0, i32 0
  %115 = load [32 x [32 x double]]*, [32 x [32 x double]]** %F, align 8
  %116 = bitcast [32 x [32 x double]]* %115 to i8*
  %117 = call i64 @getAddr(i8* %116)
  %arraydecay13 = getelementptr inbounds [32 x [32 x double]], [32 x [32 x double]]* %115, i32 0, i32 0
  %118 = load [32 x [32 x double]]*, [32 x [32 x double]]** %C, align 8
  %119 = bitcast [32 x [32 x double]]* %118 to i8*
  %120 = call i64 @getAddr(i8* %119)
  %arraydecay14 = getelementptr inbounds [32 x [32 x double]], [32 x [32 x double]]* %118, i32 0, i32 0
  %121 = load [32 x [32 x double]]*, [32 x [32 x double]]** %D, align 8
  %122 = bitcast [32 x [32 x double]]* %121 to i8*
  %123 = call i64 @getAddr(i8* %122)
  %arraydecay15 = getelementptr inbounds [32 x [32 x double]], [32 x [32 x double]]* %121, i32 0, i32 0
  %124 = load [32 x [32 x double]]*, [32 x [32 x double]]** %G, align 8
  %125 = bitcast [32 x [32 x double]]* %124 to i8*
  %126 = call i64 @getAddr(i8* %125)
  %arraydecay16 = getelementptr inbounds [32 x [32 x double]], [32 x [32 x double]]* %124, i32 0, i32 0
  %127 = bitcast void (i32, i32, i32, i32, i32, [32 x double]*, [32 x double]*, [32 x double]*, [32 x double]*, [32 x double]*, [32 x double]*, [32 x double]*)* @kernel_3mm to i8*
  %128 = call i64 @getAddr(i8* %127)
  call void @kernel_3mm(i32 %91, i32 %94, i32 %97, i32 %100, i32 %103, [32 x double]* %arraydecay10, [32 x double]* %arraydecay11, [32 x double]* %arraydecay12, [32 x double]* %arraydecay13, [32 x double]* %arraydecay14, [32 x double]* %arraydecay15, [32 x double]* %arraydecay16)
  %129 = load i32, i32* %argc.addr, align 4
  %130 = bitcast i32* %argc.addr to i8*
  %131 = call i64 @getAddr(i8* %130)
  %cmp = icmp sgt i32 %129, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %132 = load i8**, i8*** %argv.addr, align 8
  %133 = bitcast i8** %132 to i8*
  %134 = call i64 @getAddr(i8* %133)
  %arrayidx = getelementptr inbounds i8*, i8** %132, i64 0
  %135 = load i8*, i8** %arrayidx, align 8
  %136 = bitcast i8* %135 to i8*
  %137 = call i64 @getAddr(i8* %136)
  %call17 = call i32 @strcmp(i8* %135, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %tobool = icmp ne i32 %call17, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %138 = load i32, i32* %ni, align 4
  %139 = bitcast i32* %ni to i8*
  %140 = call i64 @getAddr(i8* %139)
  %141 = load i32, i32* %nl, align 4
  %142 = bitcast i32* %nl to i8*
  %143 = call i64 @getAddr(i8* %142)
  %144 = load [32 x [32 x double]]*, [32 x [32 x double]]** %G, align 8
  %145 = bitcast [32 x [32 x double]]* %144 to i8*
  %146 = call i64 @getAddr(i8* %145)
  %arraydecay18 = getelementptr inbounds [32 x [32 x double]], [32 x [32 x double]]* %144, i32 0, i32 0
  %147 = bitcast void (i32, i32, [32 x double]*)* @print_array to i8*
  %148 = call i64 @getAddr(i8* %147)
  call void @print_array(i32 %138, i32 %141, [32 x double]* %arraydecay18)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %149 = load [32 x [32 x double]]*, [32 x [32 x double]]** %E, align 8
  %150 = bitcast [32 x [32 x double]]* %149 to i8*
  %151 = call i64 @getAddr(i8* %150)
  %152 = bitcast [32 x [32 x double]]* %149 to i8*
  call void @free(i8* %152) #5
  %153 = load [32 x [32 x double]]*, [32 x [32 x double]]** %A, align 8
  %154 = bitcast [32 x [32 x double]]* %153 to i8*
  %155 = call i64 @getAddr(i8* %154)
  %156 = bitcast [32 x [32 x double]]* %153 to i8*
  call void @free(i8* %156) #5
  %157 = load [32 x [32 x double]]*, [32 x [32 x double]]** %B, align 8
  %158 = bitcast [32 x [32 x double]]* %157 to i8*
  %159 = call i64 @getAddr(i8* %158)
  %160 = bitcast [32 x [32 x double]]* %157 to i8*
  call void @free(i8* %160) #5
  %161 = load [32 x [32 x double]]*, [32 x [32 x double]]** %F, align 8
  %162 = bitcast [32 x [32 x double]]* %161 to i8*
  %163 = call i64 @getAddr(i8* %162)
  %164 = bitcast [32 x [32 x double]]* %161 to i8*
  call void @free(i8* %164) #5
  %165 = load [32 x [32 x double]]*, [32 x [32 x double]]** %C, align 8
  %166 = bitcast [32 x [32 x double]]* %165 to i8*
  %167 = call i64 @getAddr(i8* %166)
  %168 = bitcast [32 x [32 x double]]* %165 to i8*
  call void @free(i8* %168) #5
  %169 = load [32 x [32 x double]]*, [32 x [32 x double]]** %D, align 8
  %170 = bitcast [32 x [32 x double]]* %169 to i8*
  %171 = call i64 @getAddr(i8* %170)
  %172 = bitcast [32 x [32 x double]]* %169 to i8*
  call void @free(i8* %172) #5
  %173 = load [32 x [32 x double]]*, [32 x [32 x double]]** %G, align 8
  %174 = bitcast [32 x [32 x double]]* %173 to i8*
  %175 = call i64 @getAddr(i8* %174)
  %176 = bitcast [32 x [32 x double]]* %173 to i8*
  call void @free(i8* %176) #5
  call void @finish()
  ret i32 0
}

declare dso_local i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [32 x double]* %A, [32 x double]* %B, [32 x double]* %C, [32 x double]* %D) #0 {
entry:
  %0 = bitcast void (i32, i32, i32, i32, i32, [32 x double]*, [32 x double]*, [32 x double]*, [32 x double]*)* @init_array to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %nm.addr = alloca i32, align 4
  %A.addr = alloca [32 x double]*, align 8
  %B.addr = alloca [32 x double]*, align 8
  %C.addr = alloca [32 x double]*, align 8
  %D.addr = alloca [32 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %2 = bitcast i32* %ni.addr to i8*
  store i32 %ni, i32* %ni.addr, align 4
  %3 = bitcast i32* %nj.addr to i8*
  store i32 %nj, i32* %nj.addr, align 4
  %4 = bitcast i32* %nk.addr to i8*
  store i32 %nk, i32* %nk.addr, align 4
  %5 = bitcast i32* %nl.addr to i8*
  store i32 %nl, i32* %nl.addr, align 4
  %6 = bitcast i32* %nm.addr to i8*
  store i32 %nm, i32* %nm.addr, align 4
  %7 = bitcast [32 x double]** %A.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  %9 = bitcast [32 x double]* %A to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x double]*)*)(i64 %8, i64 %10, [32 x double]* %A)
  store [32 x double]* %A, [32 x double]** %A.addr, align 8
  %11 = bitcast [32 x double]** %B.addr to i8*
  %12 = call i64 @getAddr(i8* %11)
  %13 = bitcast [32 x double]* %B to i8*
  %14 = call i64 @getAddr(i8* %13)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x double]*)*)(i64 %12, i64 %14, [32 x double]* %B)
  store [32 x double]* %B, [32 x double]** %B.addr, align 8
  %15 = bitcast [32 x double]** %C.addr to i8*
  %16 = call i64 @getAddr(i8* %15)
  %17 = bitcast [32 x double]* %C to i8*
  %18 = call i64 @getAddr(i8* %17)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x double]*)*)(i64 %16, i64 %18, [32 x double]* %C)
  store [32 x double]* %C, [32 x double]** %C.addr, align 8
  %19 = bitcast [32 x double]** %D.addr to i8*
  %20 = call i64 @getAddr(i8* %19)
  %21 = bitcast [32 x double]* %D to i8*
  %22 = call i64 @getAddr(i8* %21)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x double]*)*)(i64 %20, i64 %22, [32 x double]* %D)
  store [32 x double]* %D, [32 x double]** %D.addr, align 8
  %23 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %24 = load i32, i32* %i, align 4
  %25 = bitcast i32* %i to i8*
  %26 = call i64 @getAddr(i8* %25)
  %27 = load i32, i32* %ni.addr, align 4
  %28 = bitcast i32* %ni.addr to i8*
  %29 = call i64 @getAddr(i8* %28)
  %cmp = icmp slt i32 %24, %27
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  %30 = bitcast i32* %j to i8*
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %31 = load i32, i32* %j, align 4
  %32 = bitcast i32* %j to i8*
  %33 = call i64 @getAddr(i8* %32)
  %34 = load i32, i32* %nk.addr, align 4
  %35 = bitcast i32* %nk.addr to i8*
  %36 = call i64 @getAddr(i8* %35)
  %cmp2 = icmp slt i32 %31, %34
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %37 = load i32, i32* %i, align 4
  %38 = bitcast i32* %i to i8*
  %39 = call i64 @getAddr(i8* %38)
  %conv = sitofp i32 %37 to double
  %40 = load i32, i32* %j, align 4
  %41 = bitcast i32* %j to i8*
  %42 = call i64 @getAddr(i8* %41)
  %conv4 = sitofp i32 %40 to double
  %mul = fmul double %conv, %conv4
  %43 = call i64 @computeReal(i32 16, i64 %39, i64 %42, double %conv, double %conv4, double %conv, double %conv4, double %mul, i64 3, i32 151)
  %44 = load i32, i32* %ni.addr, align 4
  %45 = bitcast i32* %ni.addr to i8*
  %46 = call i64 @getAddr(i8* %45)
  %conv5 = sitofp i32 %44 to double
  %div = fdiv double %mul, %conv5
  %47 = call i64 @computeReal(i32 19, i64 %43, i64 %46, double %mul, double %conv5, double %mul, double %conv5, double %div, i64 3, i32 154)
  %48 = load [32 x double]*, [32 x double]** %A.addr, align 8
  %49 = bitcast [32 x double]* %48 to i8*
  %50 = call i64 @getAddr(i8* %49)
  %51 = load i32, i32* %i, align 4
  %52 = bitcast i32* %i to i8*
  %53 = call i64 @getAddr(i8* %52)
  %idxprom = sext i32 %51 to i64
  %arrayidx = getelementptr inbounds [32 x double], [32 x double]* %48, i64 %idxprom
  %54 = load i32, i32* %j, align 4
  %55 = bitcast i32* %j to i8*
  %56 = call i64 @getAddr(i8* %55)
  %idxprom6 = sext i32 %54 to i64
  %arrayidx7 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx, i64 0, i64 %idxprom6
  %57 = bitcast double* %arrayidx7 to i8*
  %58 = call i64 @getAddr(i8* %57)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, double)*)(i64 %58, i64 %47, double %div)
  store double %div, double* %arrayidx7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %59 = load i32, i32* %j, align 4
  %60 = bitcast i32* %j to i8*
  %61 = call i64 @getAddr(i8* %60)
  %inc = add nsw i32 %59, 1
  %62 = bitcast i32* %j to i8*
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %63 = load i32, i32* %i, align 4
  %64 = bitcast i32* %i to i8*
  %65 = call i64 @getAddr(i8* %64)
  %inc9 = add nsw i32 %63, 1
  %66 = bitcast i32* %i to i8*
  store i32 %inc9, i32* %i, align 4
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  %67 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc31, %for.end10
  %68 = load i32, i32* %i, align 4
  %69 = bitcast i32* %i to i8*
  %70 = call i64 @getAddr(i8* %69)
  %71 = load i32, i32* %nk.addr, align 4
  %72 = bitcast i32* %nk.addr to i8*
  %73 = call i64 @getAddr(i8* %72)
  %cmp12 = icmp slt i32 %68, %71
  br i1 %cmp12, label %for.body14, label %for.end33

for.body14:                                       ; preds = %for.cond11
  %74 = bitcast i32* %j to i8*
  store i32 0, i32* %j, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc28, %for.body14
  %75 = load i32, i32* %j, align 4
  %76 = bitcast i32* %j to i8*
  %77 = call i64 @getAddr(i8* %76)
  %78 = load i32, i32* %nj.addr, align 4
  %79 = bitcast i32* %nj.addr to i8*
  %80 = call i64 @getAddr(i8* %79)
  %cmp16 = icmp slt i32 %75, %78
  br i1 %cmp16, label %for.body18, label %for.end30

for.body18:                                       ; preds = %for.cond15
  %81 = load i32, i32* %i, align 4
  %82 = bitcast i32* %i to i8*
  %83 = call i64 @getAddr(i8* %82)
  %conv19 = sitofp i32 %81 to double
  %84 = load i32, i32* %j, align 4
  %85 = bitcast i32* %j to i8*
  %86 = call i64 @getAddr(i8* %85)
  %add = add nsw i32 %84, 1
  %conv20 = sitofp i32 %add to double
  %mul21 = fmul double %conv19, %conv20
  %87 = call i64 @computeReal(i32 16, i64 %83, i64 0, double %conv19, double %conv20, double %conv19, double %conv20, double %mul21, i64 3, i32 190)
  %88 = load i32, i32* %nj.addr, align 4
  %89 = bitcast i32* %nj.addr to i8*
  %90 = call i64 @getAddr(i8* %89)
  %conv22 = sitofp i32 %88 to double
  %div23 = fdiv double %mul21, %conv22
  %91 = call i64 @computeReal(i32 19, i64 %87, i64 %90, double %mul21, double %conv22, double %mul21, double %conv22, double %div23, i64 3, i32 193)
  %92 = load [32 x double]*, [32 x double]** %B.addr, align 8
  %93 = bitcast [32 x double]* %92 to i8*
  %94 = call i64 @getAddr(i8* %93)
  %95 = load i32, i32* %i, align 4
  %96 = bitcast i32* %i to i8*
  %97 = call i64 @getAddr(i8* %96)
  %idxprom24 = sext i32 %95 to i64
  %arrayidx25 = getelementptr inbounds [32 x double], [32 x double]* %92, i64 %idxprom24
  %98 = load i32, i32* %j, align 4
  %99 = bitcast i32* %j to i8*
  %100 = call i64 @getAddr(i8* %99)
  %idxprom26 = sext i32 %98 to i64
  %arrayidx27 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx25, i64 0, i64 %idxprom26
  %101 = bitcast double* %arrayidx27 to i8*
  %102 = call i64 @getAddr(i8* %101)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, double)*)(i64 %102, i64 %91, double %div23)
  store double %div23, double* %arrayidx27, align 8
  br label %for.inc28

for.inc28:                                        ; preds = %for.body18
  %103 = load i32, i32* %j, align 4
  %104 = bitcast i32* %j to i8*
  %105 = call i64 @getAddr(i8* %104)
  %inc29 = add nsw i32 %103, 1
  %106 = bitcast i32* %j to i8*
  store i32 %inc29, i32* %j, align 4
  br label %for.cond15

for.end30:                                        ; preds = %for.cond15
  br label %for.inc31

for.inc31:                                        ; preds = %for.end30
  %107 = load i32, i32* %i, align 4
  %108 = bitcast i32* %i to i8*
  %109 = call i64 @getAddr(i8* %108)
  %inc32 = add nsw i32 %107, 1
  %110 = bitcast i32* %i to i8*
  store i32 %inc32, i32* %i, align 4
  br label %for.cond11

for.end33:                                        ; preds = %for.cond11
  %111 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc55, %for.end33
  %112 = load i32, i32* %i, align 4
  %113 = bitcast i32* %i to i8*
  %114 = call i64 @getAddr(i8* %113)
  %115 = load i32, i32* %nj.addr, align 4
  %116 = bitcast i32* %nj.addr to i8*
  %117 = call i64 @getAddr(i8* %116)
  %cmp35 = icmp slt i32 %112, %115
  br i1 %cmp35, label %for.body37, label %for.end57

for.body37:                                       ; preds = %for.cond34
  %118 = bitcast i32* %j to i8*
  store i32 0, i32* %j, align 4
  br label %for.cond38

for.cond38:                                       ; preds = %for.inc52, %for.body37
  %119 = load i32, i32* %j, align 4
  %120 = bitcast i32* %j to i8*
  %121 = call i64 @getAddr(i8* %120)
  %122 = load i32, i32* %nm.addr, align 4
  %123 = bitcast i32* %nm.addr to i8*
  %124 = call i64 @getAddr(i8* %123)
  %cmp39 = icmp slt i32 %119, %122
  br i1 %cmp39, label %for.body41, label %for.end54

for.body41:                                       ; preds = %for.cond38
  %125 = load i32, i32* %i, align 4
  %126 = bitcast i32* %i to i8*
  %127 = call i64 @getAddr(i8* %126)
  %conv42 = sitofp i32 %125 to double
  %128 = load i32, i32* %j, align 4
  %129 = bitcast i32* %j to i8*
  %130 = call i64 @getAddr(i8* %129)
  %add43 = add nsw i32 %128, 3
  %conv44 = sitofp i32 %add43 to double
  %mul45 = fmul double %conv42, %conv44
  %131 = call i64 @computeReal(i32 16, i64 %127, i64 0, double %conv42, double %conv44, double %conv42, double %conv44, double %mul45, i64 3, i32 229)
  %132 = load i32, i32* %nl.addr, align 4
  %133 = bitcast i32* %nl.addr to i8*
  %134 = call i64 @getAddr(i8* %133)
  %conv46 = sitofp i32 %132 to double
  %div47 = fdiv double %mul45, %conv46
  %135 = call i64 @computeReal(i32 19, i64 %131, i64 %134, double %mul45, double %conv46, double %mul45, double %conv46, double %div47, i64 3, i32 232)
  %136 = load [32 x double]*, [32 x double]** %C.addr, align 8
  %137 = bitcast [32 x double]* %136 to i8*
  %138 = call i64 @getAddr(i8* %137)
  %139 = load i32, i32* %i, align 4
  %140 = bitcast i32* %i to i8*
  %141 = call i64 @getAddr(i8* %140)
  %idxprom48 = sext i32 %139 to i64
  %arrayidx49 = getelementptr inbounds [32 x double], [32 x double]* %136, i64 %idxprom48
  %142 = load i32, i32* %j, align 4
  %143 = bitcast i32* %j to i8*
  %144 = call i64 @getAddr(i8* %143)
  %idxprom50 = sext i32 %142 to i64
  %arrayidx51 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx49, i64 0, i64 %idxprom50
  %145 = bitcast double* %arrayidx51 to i8*
  %146 = call i64 @getAddr(i8* %145)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, double)*)(i64 %146, i64 %135, double %div47)
  store double %div47, double* %arrayidx51, align 8
  br label %for.inc52

for.inc52:                                        ; preds = %for.body41
  %147 = load i32, i32* %j, align 4
  %148 = bitcast i32* %j to i8*
  %149 = call i64 @getAddr(i8* %148)
  %inc53 = add nsw i32 %147, 1
  %150 = bitcast i32* %j to i8*
  store i32 %inc53, i32* %j, align 4
  br label %for.cond38

for.end54:                                        ; preds = %for.cond38
  br label %for.inc55

for.inc55:                                        ; preds = %for.end54
  %151 = load i32, i32* %i, align 4
  %152 = bitcast i32* %i to i8*
  %153 = call i64 @getAddr(i8* %152)
  %inc56 = add nsw i32 %151, 1
  %154 = bitcast i32* %i to i8*
  store i32 %inc56, i32* %i, align 4
  br label %for.cond34

for.end57:                                        ; preds = %for.cond34
  %155 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond58

for.cond58:                                       ; preds = %for.inc79, %for.end57
  %156 = load i32, i32* %i, align 4
  %157 = bitcast i32* %i to i8*
  %158 = call i64 @getAddr(i8* %157)
  %159 = load i32, i32* %nm.addr, align 4
  %160 = bitcast i32* %nm.addr to i8*
  %161 = call i64 @getAddr(i8* %160)
  %cmp59 = icmp slt i32 %156, %159
  br i1 %cmp59, label %for.body61, label %for.end81

for.body61:                                       ; preds = %for.cond58
  %162 = bitcast i32* %j to i8*
  store i32 0, i32* %j, align 4
  br label %for.cond62

for.cond62:                                       ; preds = %for.inc76, %for.body61
  %163 = load i32, i32* %j, align 4
  %164 = bitcast i32* %j to i8*
  %165 = call i64 @getAddr(i8* %164)
  %166 = load i32, i32* %nl.addr, align 4
  %167 = bitcast i32* %nl.addr to i8*
  %168 = call i64 @getAddr(i8* %167)
  %cmp63 = icmp slt i32 %163, %166
  br i1 %cmp63, label %for.body65, label %for.end78

for.body65:                                       ; preds = %for.cond62
  %169 = load i32, i32* %i, align 4
  %170 = bitcast i32* %i to i8*
  %171 = call i64 @getAddr(i8* %170)
  %conv66 = sitofp i32 %169 to double
  %172 = load i32, i32* %j, align 4
  %173 = bitcast i32* %j to i8*
  %174 = call i64 @getAddr(i8* %173)
  %add67 = add nsw i32 %172, 2
  %conv68 = sitofp i32 %add67 to double
  %mul69 = fmul double %conv66, %conv68
  %175 = call i64 @computeReal(i32 16, i64 %171, i64 0, double %conv66, double %conv68, double %conv66, double %conv68, double %mul69, i64 3, i32 268)
  %176 = load i32, i32* %nk.addr, align 4
  %177 = bitcast i32* %nk.addr to i8*
  %178 = call i64 @getAddr(i8* %177)
  %conv70 = sitofp i32 %176 to double
  %div71 = fdiv double %mul69, %conv70
  %179 = call i64 @computeReal(i32 19, i64 %175, i64 %178, double %mul69, double %conv70, double %mul69, double %conv70, double %div71, i64 3, i32 271)
  %180 = load [32 x double]*, [32 x double]** %D.addr, align 8
  %181 = bitcast [32 x double]* %180 to i8*
  %182 = call i64 @getAddr(i8* %181)
  %183 = load i32, i32* %i, align 4
  %184 = bitcast i32* %i to i8*
  %185 = call i64 @getAddr(i8* %184)
  %idxprom72 = sext i32 %183 to i64
  %arrayidx73 = getelementptr inbounds [32 x double], [32 x double]* %180, i64 %idxprom72
  %186 = load i32, i32* %j, align 4
  %187 = bitcast i32* %j to i8*
  %188 = call i64 @getAddr(i8* %187)
  %idxprom74 = sext i32 %186 to i64
  %arrayidx75 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx73, i64 0, i64 %idxprom74
  %189 = bitcast double* %arrayidx75 to i8*
  %190 = call i64 @getAddr(i8* %189)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, double)*)(i64 %190, i64 %179, double %div71)
  store double %div71, double* %arrayidx75, align 8
  br label %for.inc76

for.inc76:                                        ; preds = %for.body65
  %191 = load i32, i32* %j, align 4
  %192 = bitcast i32* %j to i8*
  %193 = call i64 @getAddr(i8* %192)
  %inc77 = add nsw i32 %191, 1
  %194 = bitcast i32* %j to i8*
  store i32 %inc77, i32* %j, align 4
  br label %for.cond62

for.end78:                                        ; preds = %for.cond62
  br label %for.inc79

for.inc79:                                        ; preds = %for.end78
  %195 = load i32, i32* %i, align 4
  %196 = bitcast i32* %i to i8*
  %197 = call i64 @getAddr(i8* %196)
  %inc80 = add nsw i32 %195, 1
  %198 = bitcast i32* %i to i8*
  store i32 %inc80, i32* %i, align 4
  br label %for.cond58

for.end81:                                        ; preds = %for.cond58
  %199 = bitcast void (i32, i32, i32, i32, i32, [32 x double]*, [32 x double]*, [32 x double]*, [32 x double]*)* @init_array to i8*
  %200 = call i64 @getAddr(i8* %199)
  call void @funcExit(i64 %200, i64 0)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @kernel_3mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [32 x double]* %E, [32 x double]* %A, [32 x double]* %B, [32 x double]* %F, [32 x double]* %C, [32 x double]* %D, [32 x double]* %G) #0 {
entry:
  %0 = bitcast void (i32, i32, i32, i32, i32, [32 x double]*, [32 x double]*, [32 x double]*, [32 x double]*, [32 x double]*, [32 x double]*, [32 x double]*)* @kernel_3mm to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %nm.addr = alloca i32, align 4
  %E.addr = alloca [32 x double]*, align 8
  %A.addr = alloca [32 x double]*, align 8
  %B.addr = alloca [32 x double]*, align 8
  %F.addr = alloca [32 x double]*, align 8
  %C.addr = alloca [32 x double]*, align 8
  %D.addr = alloca [32 x double]*, align 8
  %G.addr = alloca [32 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %2 = bitcast i32* %ni.addr to i8*
  store i32 %ni, i32* %ni.addr, align 4
  %3 = bitcast i32* %nj.addr to i8*
  store i32 %nj, i32* %nj.addr, align 4
  %4 = bitcast i32* %nk.addr to i8*
  store i32 %nk, i32* %nk.addr, align 4
  %5 = bitcast i32* %nl.addr to i8*
  store i32 %nl, i32* %nl.addr, align 4
  %6 = bitcast i32* %nm.addr to i8*
  store i32 %nm, i32* %nm.addr, align 4
  %7 = bitcast [32 x double]** %E.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  %9 = bitcast [32 x double]* %E to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x double]*)*)(i64 %8, i64 %10, [32 x double]* %E)
  store [32 x double]* %E, [32 x double]** %E.addr, align 8
  %11 = bitcast [32 x double]** %A.addr to i8*
  %12 = call i64 @getAddr(i8* %11)
  %13 = bitcast [32 x double]* %A to i8*
  %14 = call i64 @getAddr(i8* %13)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x double]*)*)(i64 %12, i64 %14, [32 x double]* %A)
  store [32 x double]* %A, [32 x double]** %A.addr, align 8
  %15 = bitcast [32 x double]** %B.addr to i8*
  %16 = call i64 @getAddr(i8* %15)
  %17 = bitcast [32 x double]* %B to i8*
  %18 = call i64 @getAddr(i8* %17)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x double]*)*)(i64 %16, i64 %18, [32 x double]* %B)
  store [32 x double]* %B, [32 x double]** %B.addr, align 8
  %19 = bitcast [32 x double]** %F.addr to i8*
  %20 = call i64 @getAddr(i8* %19)
  %21 = bitcast [32 x double]* %F to i8*
  %22 = call i64 @getAddr(i8* %21)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x double]*)*)(i64 %20, i64 %22, [32 x double]* %F)
  store [32 x double]* %F, [32 x double]** %F.addr, align 8
  %23 = bitcast [32 x double]** %C.addr to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = bitcast [32 x double]* %C to i8*
  %26 = call i64 @getAddr(i8* %25)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x double]*)*)(i64 %24, i64 %26, [32 x double]* %C)
  store [32 x double]* %C, [32 x double]** %C.addr, align 8
  %27 = bitcast [32 x double]** %D.addr to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = bitcast [32 x double]* %D to i8*
  %30 = call i64 @getAddr(i8* %29)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x double]*)*)(i64 %28, i64 %30, [32 x double]* %D)
  store [32 x double]* %D, [32 x double]** %D.addr, align 8
  %31 = bitcast [32 x double]** %G.addr to i8*
  %32 = call i64 @getAddr(i8* %31)
  %33 = bitcast [32 x double]* %G to i8*
  %34 = call i64 @getAddr(i8* %33)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x double]*)*)(i64 %32, i64 %34, [32 x double]* %G)
  store [32 x double]* %G, [32 x double]** %G.addr, align 8
  %35 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc24, %entry
  %36 = load i32, i32* %i, align 4
  %37 = bitcast i32* %i to i8*
  %38 = call i64 @getAddr(i8* %37)
  %39 = load i32, i32* %ni.addr, align 4
  %40 = bitcast i32* %ni.addr to i8*
  %41 = call i64 @getAddr(i8* %40)
  %cmp = icmp slt i32 %36, %39
  br i1 %cmp, label %for.body, label %for.end26

for.body:                                         ; preds = %for.cond
  %42 = bitcast i32* %j to i8*
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc21, %for.body
  %43 = load i32, i32* %j, align 4
  %44 = bitcast i32* %j to i8*
  %45 = call i64 @getAddr(i8* %44)
  %46 = load i32, i32* %nj.addr, align 4
  %47 = bitcast i32* %nj.addr to i8*
  %48 = call i64 @getAddr(i8* %47)
  %cmp2 = icmp slt i32 %43, %46
  br i1 %cmp2, label %for.body3, label %for.end23

for.body3:                                        ; preds = %for.cond1
  %49 = load [32 x double]*, [32 x double]** %E.addr, align 8
  %50 = bitcast [32 x double]* %49 to i8*
  %51 = call i64 @getAddr(i8* %50)
  %52 = load i32, i32* %i, align 4
  %53 = bitcast i32* %i to i8*
  %54 = call i64 @getAddr(i8* %53)
  %idxprom = sext i32 %52 to i64
  %arrayidx = getelementptr inbounds [32 x double], [32 x double]* %49, i64 %idxprom
  %55 = load i32, i32* %j, align 4
  %56 = bitcast i32* %j to i8*
  %57 = call i64 @getAddr(i8* %56)
  %idxprom4 = sext i32 %55 to i64
  %arrayidx5 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx, i64 0, i64 %idxprom4
  %58 = bitcast double* %arrayidx5 to i8*
  %59 = call i64 @getAddr(i8* %58)
  store double 0.000000e+00, double* %arrayidx5, align 8
  %60 = bitcast i32* %k to i8*
  store i32 0, i32* %k, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body3
  %61 = load i32, i32* %k, align 4
  %62 = bitcast i32* %k to i8*
  %63 = call i64 @getAddr(i8* %62)
  %64 = load i32, i32* %nk.addr, align 4
  %65 = bitcast i32* %nk.addr to i8*
  %66 = call i64 @getAddr(i8* %65)
  %cmp7 = icmp slt i32 %61, %64
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond6
  %67 = load [32 x double]*, [32 x double]** %A.addr, align 8
  %68 = bitcast [32 x double]* %67 to i8*
  %69 = call i64 @getAddr(i8* %68)
  %70 = load i32, i32* %i, align 4
  %71 = bitcast i32* %i to i8*
  %72 = call i64 @getAddr(i8* %71)
  %idxprom9 = sext i32 %70 to i64
  %arrayidx10 = getelementptr inbounds [32 x double], [32 x double]* %67, i64 %idxprom9
  %73 = load i32, i32* %k, align 4
  %74 = bitcast i32* %k to i8*
  %75 = call i64 @getAddr(i8* %74)
  %idxprom11 = sext i32 %73 to i64
  %arrayidx12 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx10, i64 0, i64 %idxprom11
  %76 = load double, double* %arrayidx12, align 8
  %77 = bitcast double* %arrayidx12 to i8*
  %78 = call i64 @getAddr(i8* %77)
  %79 = load [32 x double]*, [32 x double]** %B.addr, align 8
  %80 = bitcast [32 x double]* %79 to i8*
  %81 = call i64 @getAddr(i8* %80)
  %82 = load i32, i32* %k, align 4
  %83 = bitcast i32* %k to i8*
  %84 = call i64 @getAddr(i8* %83)
  %idxprom13 = sext i32 %82 to i64
  %arrayidx14 = getelementptr inbounds [32 x double], [32 x double]* %79, i64 %idxprom13
  %85 = load i32, i32* %j, align 4
  %86 = bitcast i32* %j to i8*
  %87 = call i64 @getAddr(i8* %86)
  %idxprom15 = sext i32 %85 to i64
  %arrayidx16 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx14, i64 0, i64 %idxprom15
  %88 = load double, double* %arrayidx16, align 8
  %89 = bitcast double* %arrayidx16 to i8*
  %90 = call i64 @getAddr(i8* %89)
  %mul = fmul double %76, %88
  %91 = call i64 @computeReal(i32 16, i64 %78, i64 %90, double %76, double %88, double %76, double %88, double %mul, i64 3, i32 360)
  %92 = load [32 x double]*, [32 x double]** %E.addr, align 8
  %93 = bitcast [32 x double]* %92 to i8*
  %94 = call i64 @getAddr(i8* %93)
  %95 = load i32, i32* %i, align 4
  %96 = bitcast i32* %i to i8*
  %97 = call i64 @getAddr(i8* %96)
  %idxprom17 = sext i32 %95 to i64
  %arrayidx18 = getelementptr inbounds [32 x double], [32 x double]* %92, i64 %idxprom17
  %98 = load i32, i32* %j, align 4
  %99 = bitcast i32* %j to i8*
  %100 = call i64 @getAddr(i8* %99)
  %idxprom19 = sext i32 %98 to i64
  %arrayidx20 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx18, i64 0, i64 %idxprom19
  %101 = load double, double* %arrayidx20, align 8
  %102 = bitcast double* %arrayidx20 to i8*
  %103 = call i64 @getAddr(i8* %102)
  %add = fadd double %101, %mul
  %104 = call i64 @computeReal(i32 12, i64 %103, i64 %91, double %101, double %mul, double %101, double %mul, double %add, i64 3, i32 369)
  %105 = bitcast double* %arrayidx20 to i8*
  %106 = call i64 @getAddr(i8* %105)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, double)*)(i64 %106, i64 %104, double %add)
  store double %add, double* %arrayidx20, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %107 = load i32, i32* %k, align 4
  %108 = bitcast i32* %k to i8*
  %109 = call i64 @getAddr(i8* %108)
  %inc = add nsw i32 %107, 1
  %110 = bitcast i32* %k to i8*
  store i32 %inc, i32* %k, align 4
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  br label %for.inc21

for.inc21:                                        ; preds = %for.end
  %111 = load i32, i32* %j, align 4
  %112 = bitcast i32* %j to i8*
  %113 = call i64 @getAddr(i8* %112)
  %inc22 = add nsw i32 %111, 1
  %114 = bitcast i32* %j to i8*
  store i32 %inc22, i32* %j, align 4
  br label %for.cond1

for.end23:                                        ; preds = %for.cond1
  br label %for.inc24

for.inc24:                                        ; preds = %for.end23
  %115 = load i32, i32* %i, align 4
  %116 = bitcast i32* %i to i8*
  %117 = call i64 @getAddr(i8* %116)
  %inc25 = add nsw i32 %115, 1
  %118 = bitcast i32* %i to i8*
  store i32 %inc25, i32* %i, align 4
  br label %for.cond

for.end26:                                        ; preds = %for.cond
  %119 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc60, %for.end26
  %120 = load i32, i32* %i, align 4
  %121 = bitcast i32* %i to i8*
  %122 = call i64 @getAddr(i8* %121)
  %123 = load i32, i32* %nj.addr, align 4
  %124 = bitcast i32* %nj.addr to i8*
  %125 = call i64 @getAddr(i8* %124)
  %cmp28 = icmp slt i32 %120, %123
  br i1 %cmp28, label %for.body29, label %for.end62

for.body29:                                       ; preds = %for.cond27
  %126 = bitcast i32* %j to i8*
  store i32 0, i32* %j, align 4
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc57, %for.body29
  %127 = load i32, i32* %j, align 4
  %128 = bitcast i32* %j to i8*
  %129 = call i64 @getAddr(i8* %128)
  %130 = load i32, i32* %nl.addr, align 4
  %131 = bitcast i32* %nl.addr to i8*
  %132 = call i64 @getAddr(i8* %131)
  %cmp31 = icmp slt i32 %127, %130
  br i1 %cmp31, label %for.body32, label %for.end59

for.body32:                                       ; preds = %for.cond30
  %133 = load [32 x double]*, [32 x double]** %F.addr, align 8
  %134 = bitcast [32 x double]* %133 to i8*
  %135 = call i64 @getAddr(i8* %134)
  %136 = load i32, i32* %i, align 4
  %137 = bitcast i32* %i to i8*
  %138 = call i64 @getAddr(i8* %137)
  %idxprom33 = sext i32 %136 to i64
  %arrayidx34 = getelementptr inbounds [32 x double], [32 x double]* %133, i64 %idxprom33
  %139 = load i32, i32* %j, align 4
  %140 = bitcast i32* %j to i8*
  %141 = call i64 @getAddr(i8* %140)
  %idxprom35 = sext i32 %139 to i64
  %arrayidx36 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx34, i64 0, i64 %idxprom35
  %142 = bitcast double* %arrayidx36 to i8*
  %143 = call i64 @getAddr(i8* %142)
  store double 0.000000e+00, double* %arrayidx36, align 8
  %144 = bitcast i32* %k to i8*
  store i32 0, i32* %k, align 4
  br label %for.cond37

for.cond37:                                       ; preds = %for.inc54, %for.body32
  %145 = load i32, i32* %k, align 4
  %146 = bitcast i32* %k to i8*
  %147 = call i64 @getAddr(i8* %146)
  %148 = load i32, i32* %nm.addr, align 4
  %149 = bitcast i32* %nm.addr to i8*
  %150 = call i64 @getAddr(i8* %149)
  %cmp38 = icmp slt i32 %145, %148
  br i1 %cmp38, label %for.body39, label %for.end56

for.body39:                                       ; preds = %for.cond37
  %151 = load [32 x double]*, [32 x double]** %C.addr, align 8
  %152 = bitcast [32 x double]* %151 to i8*
  %153 = call i64 @getAddr(i8* %152)
  %154 = load i32, i32* %i, align 4
  %155 = bitcast i32* %i to i8*
  %156 = call i64 @getAddr(i8* %155)
  %idxprom40 = sext i32 %154 to i64
  %arrayidx41 = getelementptr inbounds [32 x double], [32 x double]* %151, i64 %idxprom40
  %157 = load i32, i32* %k, align 4
  %158 = bitcast i32* %k to i8*
  %159 = call i64 @getAddr(i8* %158)
  %idxprom42 = sext i32 %157 to i64
  %arrayidx43 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx41, i64 0, i64 %idxprom42
  %160 = load double, double* %arrayidx43, align 8
  %161 = bitcast double* %arrayidx43 to i8*
  %162 = call i64 @getAddr(i8* %161)
  %163 = load [32 x double]*, [32 x double]** %D.addr, align 8
  %164 = bitcast [32 x double]* %163 to i8*
  %165 = call i64 @getAddr(i8* %164)
  %166 = load i32, i32* %k, align 4
  %167 = bitcast i32* %k to i8*
  %168 = call i64 @getAddr(i8* %167)
  %idxprom44 = sext i32 %166 to i64
  %arrayidx45 = getelementptr inbounds [32 x double], [32 x double]* %163, i64 %idxprom44
  %169 = load i32, i32* %j, align 4
  %170 = bitcast i32* %j to i8*
  %171 = call i64 @getAddr(i8* %170)
  %idxprom46 = sext i32 %169 to i64
  %arrayidx47 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx45, i64 0, i64 %idxprom46
  %172 = load double, double* %arrayidx47, align 8
  %173 = bitcast double* %arrayidx47 to i8*
  %174 = call i64 @getAddr(i8* %173)
  %mul48 = fmul double %160, %172
  %175 = call i64 @computeReal(i32 16, i64 %162, i64 %174, double %160, double %172, double %160, double %172, double %mul48, i64 3, i32 428)
  %176 = load [32 x double]*, [32 x double]** %F.addr, align 8
  %177 = bitcast [32 x double]* %176 to i8*
  %178 = call i64 @getAddr(i8* %177)
  %179 = load i32, i32* %i, align 4
  %180 = bitcast i32* %i to i8*
  %181 = call i64 @getAddr(i8* %180)
  %idxprom49 = sext i32 %179 to i64
  %arrayidx50 = getelementptr inbounds [32 x double], [32 x double]* %176, i64 %idxprom49
  %182 = load i32, i32* %j, align 4
  %183 = bitcast i32* %j to i8*
  %184 = call i64 @getAddr(i8* %183)
  %idxprom51 = sext i32 %182 to i64
  %arrayidx52 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx50, i64 0, i64 %idxprom51
  %185 = load double, double* %arrayidx52, align 8
  %186 = bitcast double* %arrayidx52 to i8*
  %187 = call i64 @getAddr(i8* %186)
  %add53 = fadd double %185, %mul48
  %188 = call i64 @computeReal(i32 12, i64 %187, i64 %175, double %185, double %mul48, double %185, double %mul48, double %add53, i64 3, i32 437)
  %189 = bitcast double* %arrayidx52 to i8*
  %190 = call i64 @getAddr(i8* %189)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, double)*)(i64 %190, i64 %188, double %add53)
  store double %add53, double* %arrayidx52, align 8
  br label %for.inc54

for.inc54:                                        ; preds = %for.body39
  %191 = load i32, i32* %k, align 4
  %192 = bitcast i32* %k to i8*
  %193 = call i64 @getAddr(i8* %192)
  %inc55 = add nsw i32 %191, 1
  %194 = bitcast i32* %k to i8*
  store i32 %inc55, i32* %k, align 4
  br label %for.cond37

for.end56:                                        ; preds = %for.cond37
  br label %for.inc57

for.inc57:                                        ; preds = %for.end56
  %195 = load i32, i32* %j, align 4
  %196 = bitcast i32* %j to i8*
  %197 = call i64 @getAddr(i8* %196)
  %inc58 = add nsw i32 %195, 1
  %198 = bitcast i32* %j to i8*
  store i32 %inc58, i32* %j, align 4
  br label %for.cond30

for.end59:                                        ; preds = %for.cond30
  br label %for.inc60

for.inc60:                                        ; preds = %for.end59
  %199 = load i32, i32* %i, align 4
  %200 = bitcast i32* %i to i8*
  %201 = call i64 @getAddr(i8* %200)
  %inc61 = add nsw i32 %199, 1
  %202 = bitcast i32* %i to i8*
  store i32 %inc61, i32* %i, align 4
  br label %for.cond27

for.end62:                                        ; preds = %for.cond27
  %203 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond63

for.cond63:                                       ; preds = %for.inc96, %for.end62
  %204 = load i32, i32* %i, align 4
  %205 = bitcast i32* %i to i8*
  %206 = call i64 @getAddr(i8* %205)
  %207 = load i32, i32* %ni.addr, align 4
  %208 = bitcast i32* %ni.addr to i8*
  %209 = call i64 @getAddr(i8* %208)
  %cmp64 = icmp slt i32 %204, %207
  br i1 %cmp64, label %for.body65, label %for.end98

for.body65:                                       ; preds = %for.cond63
  %210 = bitcast i32* %j to i8*
  store i32 0, i32* %j, align 4
  br label %for.cond66

for.cond66:                                       ; preds = %for.inc93, %for.body65
  %211 = load i32, i32* %j, align 4
  %212 = bitcast i32* %j to i8*
  %213 = call i64 @getAddr(i8* %212)
  %214 = load i32, i32* %nl.addr, align 4
  %215 = bitcast i32* %nl.addr to i8*
  %216 = call i64 @getAddr(i8* %215)
  %cmp67 = icmp slt i32 %211, %214
  br i1 %cmp67, label %for.body68, label %for.end95

for.body68:                                       ; preds = %for.cond66
  %217 = load [32 x double]*, [32 x double]** %G.addr, align 8
  %218 = bitcast [32 x double]* %217 to i8*
  %219 = call i64 @getAddr(i8* %218)
  %220 = load i32, i32* %i, align 4
  %221 = bitcast i32* %i to i8*
  %222 = call i64 @getAddr(i8* %221)
  %idxprom69 = sext i32 %220 to i64
  %arrayidx70 = getelementptr inbounds [32 x double], [32 x double]* %217, i64 %idxprom69
  %223 = load i32, i32* %j, align 4
  %224 = bitcast i32* %j to i8*
  %225 = call i64 @getAddr(i8* %224)
  %idxprom71 = sext i32 %223 to i64
  %arrayidx72 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx70, i64 0, i64 %idxprom71
  %226 = bitcast double* %arrayidx72 to i8*
  %227 = call i64 @getAddr(i8* %226)
  store double 0.000000e+00, double* %arrayidx72, align 8
  %228 = bitcast i32* %k to i8*
  store i32 0, i32* %k, align 4
  br label %for.cond73

for.cond73:                                       ; preds = %for.inc90, %for.body68
  %229 = load i32, i32* %k, align 4
  %230 = bitcast i32* %k to i8*
  %231 = call i64 @getAddr(i8* %230)
  %232 = load i32, i32* %nj.addr, align 4
  %233 = bitcast i32* %nj.addr to i8*
  %234 = call i64 @getAddr(i8* %233)
  %cmp74 = icmp slt i32 %229, %232
  br i1 %cmp74, label %for.body75, label %for.end92

for.body75:                                       ; preds = %for.cond73
  %235 = load [32 x double]*, [32 x double]** %E.addr, align 8
  %236 = bitcast [32 x double]* %235 to i8*
  %237 = call i64 @getAddr(i8* %236)
  %238 = load i32, i32* %i, align 4
  %239 = bitcast i32* %i to i8*
  %240 = call i64 @getAddr(i8* %239)
  %idxprom76 = sext i32 %238 to i64
  %arrayidx77 = getelementptr inbounds [32 x double], [32 x double]* %235, i64 %idxprom76
  %241 = load i32, i32* %k, align 4
  %242 = bitcast i32* %k to i8*
  %243 = call i64 @getAddr(i8* %242)
  %idxprom78 = sext i32 %241 to i64
  %arrayidx79 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx77, i64 0, i64 %idxprom78
  %244 = load double, double* %arrayidx79, align 8
  %245 = bitcast double* %arrayidx79 to i8*
  %246 = call i64 @getAddr(i8* %245)
  %247 = load [32 x double]*, [32 x double]** %F.addr, align 8
  %248 = bitcast [32 x double]* %247 to i8*
  %249 = call i64 @getAddr(i8* %248)
  %250 = load i32, i32* %k, align 4
  %251 = bitcast i32* %k to i8*
  %252 = call i64 @getAddr(i8* %251)
  %idxprom80 = sext i32 %250 to i64
  %arrayidx81 = getelementptr inbounds [32 x double], [32 x double]* %247, i64 %idxprom80
  %253 = load i32, i32* %j, align 4
  %254 = bitcast i32* %j to i8*
  %255 = call i64 @getAddr(i8* %254)
  %idxprom82 = sext i32 %253 to i64
  %arrayidx83 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx81, i64 0, i64 %idxprom82
  %256 = load double, double* %arrayidx83, align 8
  %257 = bitcast double* %arrayidx83 to i8*
  %258 = call i64 @getAddr(i8* %257)
  %mul84 = fmul double %244, %256
  %259 = call i64 @computeReal(i32 16, i64 %246, i64 %258, double %244, double %256, double %244, double %256, double %mul84, i64 3, i32 496)
  %260 = load [32 x double]*, [32 x double]** %G.addr, align 8
  %261 = bitcast [32 x double]* %260 to i8*
  %262 = call i64 @getAddr(i8* %261)
  %263 = load i32, i32* %i, align 4
  %264 = bitcast i32* %i to i8*
  %265 = call i64 @getAddr(i8* %264)
  %idxprom85 = sext i32 %263 to i64
  %arrayidx86 = getelementptr inbounds [32 x double], [32 x double]* %260, i64 %idxprom85
  %266 = load i32, i32* %j, align 4
  %267 = bitcast i32* %j to i8*
  %268 = call i64 @getAddr(i8* %267)
  %idxprom87 = sext i32 %266 to i64
  %arrayidx88 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx86, i64 0, i64 %idxprom87
  %269 = load double, double* %arrayidx88, align 8
  %270 = bitcast double* %arrayidx88 to i8*
  %271 = call i64 @getAddr(i8* %270)
  %add89 = fadd double %269, %mul84
  %272 = call i64 @computeReal(i32 12, i64 %271, i64 %259, double %269, double %mul84, double %269, double %mul84, double %add89, i64 3, i32 505)
  %273 = bitcast double* %arrayidx88 to i8*
  %274 = call i64 @getAddr(i8* %273)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, double)*)(i64 %274, i64 %272, double %add89)
  store double %add89, double* %arrayidx88, align 8
  br label %for.inc90

for.inc90:                                        ; preds = %for.body75
  %275 = load i32, i32* %k, align 4
  %276 = bitcast i32* %k to i8*
  %277 = call i64 @getAddr(i8* %276)
  %inc91 = add nsw i32 %275, 1
  %278 = bitcast i32* %k to i8*
  store i32 %inc91, i32* %k, align 4
  br label %for.cond73

for.end92:                                        ; preds = %for.cond73
  br label %for.inc93

for.inc93:                                        ; preds = %for.end92
  %279 = load i32, i32* %j, align 4
  %280 = bitcast i32* %j to i8*
  %281 = call i64 @getAddr(i8* %280)
  %inc94 = add nsw i32 %279, 1
  %282 = bitcast i32* %j to i8*
  store i32 %inc94, i32* %j, align 4
  br label %for.cond66

for.end95:                                        ; preds = %for.cond66
  br label %for.inc96

for.inc96:                                        ; preds = %for.end95
  %283 = load i32, i32* %i, align 4
  %284 = bitcast i32* %i to i8*
  %285 = call i64 @getAddr(i8* %284)
  %inc97 = add nsw i32 %283, 1
  %286 = bitcast i32* %i to i8*
  store i32 %inc97, i32* %i, align 4
  br label %for.cond63

for.end98:                                        ; preds = %for.cond63
  %287 = bitcast void (i32, i32, i32, i32, i32, [32 x double]*, [32 x double]*, [32 x double]*, [32 x double]*, [32 x double]*, [32 x double]*, [32 x double]*)* @kernel_3mm to i8*
  %288 = call i64 @getAddr(i8* %287)
  call void @funcExit(i64 %288, i64 0)
  ret void
}

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @print_array(i32 %ni, i32 %nl, [32 x double]* %G) #0 {
entry:
  %0 = bitcast void (i32, i32, [32 x double]*)* @print_array to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %ni.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %G.addr = alloca [32 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %2 = bitcast i32* %ni.addr to i8*
  store i32 %ni, i32* %ni.addr, align 4
  %3 = bitcast i32* %nl.addr to i8*
  store i32 %nl, i32* %nl.addr, align 4
  %4 = bitcast [32 x double]** %G.addr to i8*
  %5 = call i64 @getAddr(i8* %4)
  %6 = bitcast [32 x double]* %G to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void bitcast (void (i64, i64, i8**)* @setRealTemp to void (i64, i64, [32 x double]*)*)(i64 %5, i64 %7, [32 x double]* %G)
  store [32 x double]* %G, [32 x double]** %G.addr, align 8
  %8 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %9 = load i32, i32* %i, align 4
  %10 = bitcast i32* %i to i8*
  %11 = call i64 @getAddr(i8* %10)
  %12 = load i32, i32* %ni.addr, align 4
  %13 = bitcast i32* %ni.addr to i8*
  %14 = call i64 @getAddr(i8* %13)
  %cmp = icmp slt i32 %9, %12
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  %15 = bitcast i32* %j to i8*
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %16 = load i32, i32* %j, align 4
  %17 = bitcast i32* %j to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = load i32, i32* %nl.addr, align 4
  %20 = bitcast i32* %nl.addr to i8*
  %21 = call i64 @getAddr(i8* %20)
  %cmp2 = icmp slt i32 %16, %19
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = bitcast %struct._IO_FILE* %22 to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = load [32 x double]*, [32 x double]** %G.addr, align 8
  %26 = bitcast [32 x double]* %25 to i8*
  %27 = call i64 @getAddr(i8* %26)
  %28 = load i32, i32* %i, align 4
  %29 = bitcast i32* %i to i8*
  %30 = call i64 @getAddr(i8* %29)
  %idxprom = sext i32 %28 to i64
  %arrayidx = getelementptr inbounds [32 x double], [32 x double]* %25, i64 %idxprom
  %31 = load i32, i32* %j, align 4
  %32 = bitcast i32* %j to i8*
  %33 = call i64 @getAddr(i8* %32)
  %idxprom4 = sext i32 %31 to i64
  %arrayidx5 = getelementptr inbounds [32 x double], [32 x double]* %arrayidx, i64 0, i64 %idxprom4
  %34 = load double, double* %arrayidx5, align 8
  %35 = bitcast double* %arrayidx5 to i8*
  %36 = call i64 @getAddr(i8* %35)
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), double %34)
  %37 = load i32, i32* %i, align 4
  %38 = bitcast i32* %i to i8*
  %39 = call i64 @getAddr(i8* %38)
  %40 = load i32, i32* %ni.addr, align 4
  %41 = bitcast i32* %ni.addr to i8*
  %42 = call i64 @getAddr(i8* %41)
  %mul = mul nsw i32 %37, %40
  %43 = load i32, i32* %j, align 4
  %44 = bitcast i32* %j to i8*
  %45 = call i64 @getAddr(i8* %44)
  %add = add nsw i32 %mul, %43
  %rem = srem i32 %add, 20
  %cmp6 = icmp eq i32 %rem, 0
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = bitcast %struct._IO_FILE* %46 to i8*
  %48 = call i64 @getAddr(i8* %47)
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %49 = load i32, i32* %j, align 4
  %50 = bitcast i32* %j to i8*
  %51 = call i64 @getAddr(i8* %50)
  %inc = add nsw i32 %49, 1
  %52 = bitcast i32* %j to i8*
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %53 = load i32, i32* %i, align 4
  %54 = bitcast i32* %i to i8*
  %55 = call i64 @getAddr(i8* %54)
  %inc9 = add nsw i32 %53, 1
  %56 = bitcast i32* %i to i8*
  store i32 %inc9, i32* %i, align 4
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %58 = bitcast %struct._IO_FILE* %57 to i8*
  %59 = call i64 @getAddr(i8* %58)
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %60 = bitcast void (i32, i32, [32 x double]*)* @print_array to i8*
  %61 = call i64 @getAddr(i8* %60)
  call void @funcExit(i64 %61, i64 0)
  ret void
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i64 @getAddr(i8*)

declare void @setRealTemp(i64, i64, i8**)

declare void @finish()

declare i64 @computeReal(i32, i64, i64, double, double, double, double, double, i64, i32)

declare void @funcInit(i64)

declare void @init()

declare void @funcExit(i64, i64)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk) (llvm/trunk 336308)"}
