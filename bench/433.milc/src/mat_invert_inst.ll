; ModuleID = 'mat_invert_inst.bc'
source_filename = "mat_invert.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.site = type { i16, i16, i16, i16, i8, i32, %struct.double_prn, i32, [4 x %struct.su3_matrix], [4 x %struct.anti_hermitmat], [4 x double], %struct.su3_vector, %struct.su3_vector, %struct.su3_vector, %struct.su3_vector, %struct.su3_vector, %struct.su3_vector, [4 x %struct.su3_vector], %struct.su3_matrix, %struct.su3_matrix }
%struct.double_prn = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, double }
%struct.anti_hermitmat = type { %struct.complex, %struct.complex, %struct.complex, double, double, double, double }
%struct.complex = type { double, double }
%struct.su3_vector = type { [3 x %struct.complex] }
%struct.su3_matrix = type { [3 x [3 x %struct.complex]] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@niter = external dso_local global i32, align 4
@rsqprop = external dso_local global double, align 8
@lattice = external dso_local global %struct.site*, align 8
@.str = private unnamed_addr constant [7 x i8] c"BOTCH\0A\00", align 1
@even_sites_on_node = external dso_local global i32, align 4
@sites_on_node = external dso_local global i32, align 4
@.str.1 = private unnamed_addr constant [41 x i8] c"%d %d  ( %.4e , %.4e )  ( %.4e , %.4e )\0A\00", align 1
@this_node = external dso_local global i32, align 4
@.str.2 = private unnamed_addr constant [37 x i8] c"Inversion checked, frac. error = %e\0A\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mat_invert_cg(i32 %src, i32 %dest, i32 %temp, double %mass) #0 {
entry:
  %0 = bitcast i8* null to i8*
  %1 = bitcast i32 (i32, i32, i32, double)* @mat_invert_cg to i8*
  %2 = call i64 @getAddr(i8* %1)
  call void @funcInit(i64 %2)
  %src.addr = alloca i32, align 4
  %3 = bitcast i32* %src.addr to i8*
  %4 = call i64 @getAddr(i8* %3)
  call void @handleAlloca(i64 %4)
  %dest.addr = alloca i32, align 4
  %5 = bitcast i32* %dest.addr to i8*
  %6 = call i64 @getAddr(i8* %5)
  call void @handleAlloca(i64 %6)
  %temp.addr = alloca i32, align 4
  %7 = bitcast i32* %temp.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  call void @handleAlloca(i64 %8)
  %mass.addr = alloca double, align 8
  %9 = bitcast double* %mass.addr to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void @handleAlloca(i64 %10)
  %cgn = alloca i32, align 4
  %11 = bitcast i32* %cgn to i8*
  %12 = call i64 @getAddr(i8* %11)
  call void @handleAlloca(i64 %12)
  %finalrsq = alloca double, align 8
  %13 = bitcast double* %finalrsq to i8*
  %14 = call i64 @getAddr(i8* %13)
  call void @handleAlloca(i64 %14)
  %15 = bitcast i32* %src.addr to i8*
  store i32 %src, i32* %src.addr, align 4
  %16 = bitcast i32* %dest.addr to i8*
  store i32 %dest, i32* %dest.addr, align 4
  %17 = bitcast i32* %temp.addr to i8*
  store i32 %temp, i32* %temp.addr, align 4
  %18 = bitcast double* %mass.addr to i8*
  %19 = call i64 @getAddr(i8* %18)
  %20 = bitcast i32 (i32, i32, i32, double)* @mat_invert_cg to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void @setRealFunArg(i32 3, i64 %21, i64 %19, double %mass)
  store double %mass, double* %mass.addr, align 8
  %22 = bitcast i32* %dest.addr to i8*
  %23 = call i64 @getAddr(i8* %22)
  %24 = load i32, i32* %dest.addr, align 4
  %25 = bitcast void (i32, i32)* @clear_latvec to i8*
  %26 = call i64 @getAddr(i8* %25)
  call void @addFunArg(i32 0, i64 %26, i64 %23)
  call void @clear_latvec(i32 %24, i32 3)
  %27 = bitcast i32* %src.addr to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load i32, i32* %src.addr, align 4
  %30 = bitcast i32* %dest.addr to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = load i32, i32* %dest.addr, align 4
  %33 = bitcast double* %mass.addr to i8*
  %34 = call i64 @getAddr(i8* %33)
  %35 = load double, double* %mass.addr, align 8
  %36 = bitcast i32* @niter to i8*
  %37 = call i64 @getAddr(i8* %36)
  %38 = load i32, i32* @niter, align 4
  %39 = bitcast double* @rsqprop to i8*
  %40 = call i64 @getAddr(i8* %39)
  %41 = load double, double* @rsqprop, align 8
  %42 = bitcast i32 (i32, i32, double, i32, double, i32, double*)* @ks_congrad to i8*
  %43 = call i64 @getAddr(i8* %42)
  call void @addFunArg(i32 0, i64 %43, i64 %28)
  %44 = bitcast i32 (i32, i32, double, i32, double, i32, double*)* @ks_congrad to i8*
  %45 = call i64 @getAddr(i8* %44)
  call void @addFunArg(i32 1, i64 %45, i64 %31)
  %46 = bitcast i32 (i32, i32, double, i32, double, i32, double*)* @ks_congrad to i8*
  %47 = call i64 @getAddr(i8* %46)
  call void @addFunArg(i32 2, i64 %47, i64 %34)
  %48 = bitcast i32 (i32, i32, double, i32, double, i32, double*)* @ks_congrad to i8*
  %49 = call i64 @getAddr(i8* %48)
  call void @addFunArg(i32 3, i64 %49, i64 %37)
  %50 = bitcast i32 (i32, i32, double, i32, double, i32, double*)* @ks_congrad to i8*
  %51 = call i64 @getAddr(i8* %50)
  call void @addFunArg(i32 4, i64 %51, i64 %40)
  %call = call i32 @ks_congrad(i32 %29, i32 %32, double %35, i32 %38, double %41, i32 3, double* %finalrsq)
  %52 = bitcast i32* %cgn to i8*
  store i32 %call, i32* %cgn, align 4
  %53 = bitcast i32* %dest.addr to i8*
  %54 = call i64 @getAddr(i8* %53)
  %55 = load i32, i32* %dest.addr, align 4
  %56 = bitcast %struct.site** @lattice to i8*
  %57 = call i64 @getAddr(i8* %56)
  %58 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx = getelementptr inbounds %struct.site, %struct.site* %58, i64 0
  %ttt = getelementptr inbounds %struct.site, %struct.site* %arrayidx, i32 0, i32 15
  %59 = bitcast %struct.su3_vector* %ttt to i8*
  %60 = bitcast %struct.site** @lattice to i8*
  %61 = call i64 @getAddr(i8* %60)
  %62 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx1 = getelementptr inbounds %struct.site, %struct.site* %62, i64 0
  %63 = bitcast %struct.site* %arrayidx1 to i8*
  %sub.ptr.lhs.cast = ptrtoint i8* %59 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %63 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv = trunc i64 %sub.ptr.sub to i32
  call void @dslash(i32 %55, i32 %conv, i32 3)
  %64 = bitcast %struct.site** @lattice to i8*
  %65 = call i64 @getAddr(i8* %64)
  %66 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx2 = getelementptr inbounds %struct.site, %struct.site* %66, i64 0
  %ttt3 = getelementptr inbounds %struct.site, %struct.site* %arrayidx2, i32 0, i32 15
  %67 = bitcast %struct.su3_vector* %ttt3 to i8*
  %68 = bitcast %struct.site** @lattice to i8*
  %69 = call i64 @getAddr(i8* %68)
  %70 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx4 = getelementptr inbounds %struct.site, %struct.site* %70, i64 0
  %71 = bitcast %struct.site* %arrayidx4 to i8*
  %sub.ptr.lhs.cast5 = ptrtoint i8* %67 to i64
  %sub.ptr.rhs.cast6 = ptrtoint i8* %71 to i64
  %sub.ptr.sub7 = sub i64 %sub.ptr.lhs.cast5, %sub.ptr.rhs.cast6
  %conv8 = trunc i64 %sub.ptr.sub7 to i32
  %72 = bitcast i32* %dest.addr to i8*
  %73 = call i64 @getAddr(i8* %72)
  %74 = load i32, i32* %dest.addr, align 4
  %75 = bitcast double* %mass.addr to i8*
  %76 = call i64 @getAddr(i8* %75)
  %77 = load double, double* %mass.addr, align 8
  %mul = fmul double -2.000000e+00, %77
  %78 = call i64 @computeReal(i32 16, i64 0, i64 %76, double -2.000000e+00, double %77, double %mul, i32 48)
  %79 = bitcast %struct.site** @lattice to i8*
  %80 = call i64 @getAddr(i8* %79)
  %81 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx9 = getelementptr inbounds %struct.site, %struct.site* %81, i64 0
  %ttt10 = getelementptr inbounds %struct.site, %struct.site* %arrayidx9, i32 0, i32 15
  %82 = bitcast %struct.su3_vector* %ttt10 to i8*
  %83 = bitcast %struct.site** @lattice to i8*
  %84 = call i64 @getAddr(i8* %83)
  %85 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx11 = getelementptr inbounds %struct.site, %struct.site* %85, i64 0
  %86 = bitcast %struct.site* %arrayidx11 to i8*
  %sub.ptr.lhs.cast12 = ptrtoint i8* %82 to i64
  %sub.ptr.rhs.cast13 = ptrtoint i8* %86 to i64
  %sub.ptr.sub14 = sub i64 %sub.ptr.lhs.cast12, %sub.ptr.rhs.cast13
  %conv15 = trunc i64 %sub.ptr.sub14 to i32
  %87 = bitcast void (i32, i32, double, i32, i32)* @scalar_mult_add_latvec to i8*
  %88 = call i64 @getAddr(i8* %87)
  call void @addFunArg(i32 1, i64 %88, i64 %73)
  %89 = bitcast void (i32, i32, double, i32, i32)* @scalar_mult_add_latvec to i8*
  %90 = call i64 @getAddr(i8* %89)
  call void @addFunArg(i32 2, i64 %90, i64 %78)
  call void @scalar_mult_add_latvec(i32 %conv8, i32 %74, double %mul, i32 %conv15, i32 3)
  %91 = bitcast %struct.site** @lattice to i8*
  %92 = call i64 @getAddr(i8* %91)
  %93 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx16 = getelementptr inbounds %struct.site, %struct.site* %93, i64 0
  %ttt17 = getelementptr inbounds %struct.site, %struct.site* %arrayidx16, i32 0, i32 15
  %94 = bitcast %struct.su3_vector* %ttt17 to i8*
  %95 = bitcast %struct.site** @lattice to i8*
  %96 = call i64 @getAddr(i8* %95)
  %97 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx18 = getelementptr inbounds %struct.site, %struct.site* %97, i64 0
  %98 = bitcast %struct.site* %arrayidx18 to i8*
  %sub.ptr.lhs.cast19 = ptrtoint i8* %94 to i64
  %sub.ptr.rhs.cast20 = ptrtoint i8* %98 to i64
  %sub.ptr.sub21 = sub i64 %sub.ptr.lhs.cast19, %sub.ptr.rhs.cast20
  %conv22 = trunc i64 %sub.ptr.sub21 to i32
  %99 = bitcast i32* %dest.addr to i8*
  %100 = call i64 @getAddr(i8* %99)
  %101 = load i32, i32* %dest.addr, align 4
  %102 = bitcast void (i32, double, i32, i32)* @scalar_mult_latvec to i8*
  %103 = call i64 @getAddr(i8* %102)
  call void @addFunArg(i32 2, i64 %103, i64 %100)
  call void @scalar_mult_latvec(i32 %conv22, double -1.000000e+00, i32 %101, i32 3)
  %104 = bitcast i32* %cgn to i8*
  %105 = call i64 @getAddr(i8* %104)
  %106 = load i32, i32* %cgn, align 4
  %107 = bitcast i32 (i32, i32, i32, double)* @mat_invert_cg to i8*
  %108 = call i64 @getAddr(i8* %107)
  call void @funcExit(i64 %108)
  call void @trackReturn(i64 %105)
  call void @cleanComputeReal(i32 48)
  ret i32 %106
}

declare dso_local void @clear_latvec(i32, i32) #1

declare dso_local i32 @ks_congrad(i32, i32, double, i32, double, i32, double*) #1

declare dso_local void @dslash(i32, i32, i32) #1

declare dso_local void @scalar_mult_add_latvec(i32, i32, double, i32, i32) #1

declare dso_local void @scalar_mult_latvec(i32, double, i32, i32) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mat_invert_uml(i32 %src, i32 %dest, i32 %temp, double %mass) #0 {
entry:
  %0 = bitcast i8* null to i8*
  %1 = bitcast i32 (i32, i32, i32, double)* @mat_invert_uml to i8*
  %2 = call i64 @getAddr(i8* %1)
  call void @funcInit(i64 %2)
  %src.addr = alloca i32, align 4
  %3 = bitcast i32* %src.addr to i8*
  %4 = call i64 @getAddr(i8* %3)
  call void @handleAlloca(i64 %4)
  %dest.addr = alloca i32, align 4
  %5 = bitcast i32* %dest.addr to i8*
  %6 = call i64 @getAddr(i8* %5)
  call void @handleAlloca(i64 %6)
  %temp.addr = alloca i32, align 4
  %7 = bitcast i32* %temp.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  call void @handleAlloca(i64 %8)
  %mass.addr = alloca double, align 8
  %9 = bitcast double* %mass.addr to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void @handleAlloca(i64 %10)
  %cgn = alloca i32, align 4
  %11 = bitcast i32* %cgn to i8*
  %12 = call i64 @getAddr(i8* %11)
  call void @handleAlloca(i64 %12)
  %finalrsq = alloca double, align 8
  %13 = bitcast double* %finalrsq to i8*
  %14 = call i64 @getAddr(i8* %13)
  call void @handleAlloca(i64 %14)
  %i = alloca i32, align 4
  %15 = bitcast i32* %i to i8*
  %16 = call i64 @getAddr(i8* %15)
  call void @handleAlloca(i64 %16)
  %s = alloca %struct.site*, align 8
  %17 = bitcast %struct.site** %s to i8*
  %18 = call i64 @getAddr(i8* %17)
  call void @handleAlloca(i64 %18)
  %19 = bitcast i32* %src.addr to i8*
  store i32 %src, i32* %src.addr, align 4
  %20 = bitcast i32* %dest.addr to i8*
  store i32 %dest, i32* %dest.addr, align 4
  %21 = bitcast i32* %temp.addr to i8*
  store i32 %temp, i32* %temp.addr, align 4
  %22 = bitcast double* %mass.addr to i8*
  %23 = call i64 @getAddr(i8* %22)
  %24 = bitcast i32 (i32, i32, i32, double)* @mat_invert_uml to i8*
  %25 = call i64 @getAddr(i8* %24)
  call void @setRealFunArg(i32 7, i64 %25, i64 %23, double %mass)
  store double %mass, double* %mass.addr, align 8
  %26 = bitcast i32* %src.addr to i8*
  %27 = call i64 @getAddr(i8* %26)
  %28 = load i32, i32* %src.addr, align 4
  %29 = bitcast i32* %temp.addr to i8*
  %30 = call i64 @getAddr(i8* %29)
  %31 = load i32, i32* %temp.addr, align 4
  %cmp = icmp eq i32 %28, %31
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

if.end:                                           ; preds = %entry
  %32 = bitcast i32* %src.addr to i8*
  %33 = call i64 @getAddr(i8* %32)
  %34 = load i32, i32* %src.addr, align 4
  %35 = bitcast %struct.site** @lattice to i8*
  %36 = call i64 @getAddr(i8* %35)
  %37 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx = getelementptr inbounds %struct.site, %struct.site* %37, i64 0
  %ttt = getelementptr inbounds %struct.site, %struct.site* %arrayidx, i32 0, i32 15
  %38 = bitcast %struct.su3_vector* %ttt to i8*
  %39 = bitcast %struct.site** @lattice to i8*
  %40 = call i64 @getAddr(i8* %39)
  %41 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx1 = getelementptr inbounds %struct.site, %struct.site* %41, i64 0
  %42 = bitcast %struct.site* %arrayidx1 to i8*
  %sub.ptr.lhs.cast = ptrtoint i8* %38 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %42 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv = trunc i64 %sub.ptr.sub to i32
  call void @dslash(i32 %34, i32 %conv, i32 2)
  %43 = bitcast %struct.site** @lattice to i8*
  %44 = call i64 @getAddr(i8* %43)
  %45 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx2 = getelementptr inbounds %struct.site, %struct.site* %45, i64 0
  %ttt3 = getelementptr inbounds %struct.site, %struct.site* %arrayidx2, i32 0, i32 15
  %46 = bitcast %struct.su3_vector* %ttt3 to i8*
  %47 = bitcast %struct.site** @lattice to i8*
  %48 = call i64 @getAddr(i8* %47)
  %49 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx4 = getelementptr inbounds %struct.site, %struct.site* %49, i64 0
  %50 = bitcast %struct.site* %arrayidx4 to i8*
  %sub.ptr.lhs.cast5 = ptrtoint i8* %46 to i64
  %sub.ptr.rhs.cast6 = ptrtoint i8* %50 to i64
  %sub.ptr.sub7 = sub i64 %sub.ptr.lhs.cast5, %sub.ptr.rhs.cast6
  %conv8 = trunc i64 %sub.ptr.sub7 to i32
  %51 = bitcast i32* %src.addr to i8*
  %52 = call i64 @getAddr(i8* %51)
  %53 = load i32, i32* %src.addr, align 4
  %54 = bitcast double* %mass.addr to i8*
  %55 = call i64 @getAddr(i8* %54)
  %56 = load double, double* %mass.addr, align 8
  %mul = fmul double -2.000000e+00, %56
  %57 = call i64 @computeReal(i32 16, i64 0, i64 %55, double -2.000000e+00, double %56, double %mul, i32 127)
  %58 = bitcast i32* %temp.addr to i8*
  %59 = call i64 @getAddr(i8* %58)
  %60 = load i32, i32* %temp.addr, align 4
  %61 = bitcast void (i32, i32, double, i32, i32)* @scalar_mult_add_latvec to i8*
  %62 = call i64 @getAddr(i8* %61)
  call void @addFunArg(i32 1, i64 %62, i64 %52)
  %63 = bitcast void (i32, i32, double, i32, i32)* @scalar_mult_add_latvec to i8*
  %64 = call i64 @getAddr(i8* %63)
  call void @addFunArg(i32 2, i64 %64, i64 %57)
  %65 = bitcast void (i32, i32, double, i32, i32)* @scalar_mult_add_latvec to i8*
  %66 = call i64 @getAddr(i8* %65)
  call void @addFunArg(i32 3, i64 %66, i64 %59)
  call void @scalar_mult_add_latvec(i32 %conv8, i32 %53, double %mul, i32 %60, i32 2)
  %67 = bitcast i32* %temp.addr to i8*
  %68 = call i64 @getAddr(i8* %67)
  %69 = load i32, i32* %temp.addr, align 4
  %70 = bitcast i32* %temp.addr to i8*
  %71 = call i64 @getAddr(i8* %70)
  %72 = load i32, i32* %temp.addr, align 4
  %73 = bitcast void (i32, double, i32, i32)* @scalar_mult_latvec to i8*
  %74 = call i64 @getAddr(i8* %73)
  call void @addFunArg(i32 0, i64 %74, i64 %68)
  %75 = bitcast void (i32, double, i32, i32)* @scalar_mult_latvec to i8*
  %76 = call i64 @getAddr(i8* %75)
  call void @addFunArg(i32 2, i64 %76, i64 %71)
  call void @scalar_mult_latvec(i32 %69, double -1.000000e+00, i32 %72, i32 2)
  %77 = bitcast i32* %temp.addr to i8*
  %78 = call i64 @getAddr(i8* %77)
  %79 = load i32, i32* %temp.addr, align 4
  %80 = bitcast i32* %dest.addr to i8*
  %81 = call i64 @getAddr(i8* %80)
  %82 = load i32, i32* %dest.addr, align 4
  %83 = bitcast double* %mass.addr to i8*
  %84 = call i64 @getAddr(i8* %83)
  %85 = load double, double* %mass.addr, align 8
  %86 = bitcast i32* @niter to i8*
  %87 = call i64 @getAddr(i8* %86)
  %88 = load i32, i32* @niter, align 4
  %89 = bitcast double* @rsqprop to i8*
  %90 = call i64 @getAddr(i8* %89)
  %91 = load double, double* @rsqprop, align 8
  %92 = bitcast i32 (i32, i32, double, i32, double, i32, double*)* @ks_congrad to i8*
  %93 = call i64 @getAddr(i8* %92)
  call void @addFunArg(i32 0, i64 %93, i64 %78)
  %94 = bitcast i32 (i32, i32, double, i32, double, i32, double*)* @ks_congrad to i8*
  %95 = call i64 @getAddr(i8* %94)
  call void @addFunArg(i32 1, i64 %95, i64 %81)
  %96 = bitcast i32 (i32, i32, double, i32, double, i32, double*)* @ks_congrad to i8*
  %97 = call i64 @getAddr(i8* %96)
  call void @addFunArg(i32 2, i64 %97, i64 %84)
  %98 = bitcast i32 (i32, i32, double, i32, double, i32, double*)* @ks_congrad to i8*
  %99 = call i64 @getAddr(i8* %98)
  call void @addFunArg(i32 3, i64 %99, i64 %87)
  %100 = bitcast i32 (i32, i32, double, i32, double, i32, double*)* @ks_congrad to i8*
  %101 = call i64 @getAddr(i8* %100)
  call void @addFunArg(i32 4, i64 %101, i64 %90)
  %call9 = call i32 @ks_congrad(i32 %79, i32 %82, double %85, i32 %88, double %91, i32 2, double* %finalrsq)
  %102 = bitcast i32* %cgn to i8*
  store i32 %call9, i32* %cgn, align 4
  %103 = bitcast i32* %dest.addr to i8*
  %104 = call i64 @getAddr(i8* %103)
  %105 = load i32, i32* %dest.addr, align 4
  %106 = bitcast %struct.site** @lattice to i8*
  %107 = call i64 @getAddr(i8* %106)
  %108 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx10 = getelementptr inbounds %struct.site, %struct.site* %108, i64 0
  %ttt11 = getelementptr inbounds %struct.site, %struct.site* %arrayidx10, i32 0, i32 15
  %109 = bitcast %struct.su3_vector* %ttt11 to i8*
  %110 = bitcast %struct.site** @lattice to i8*
  %111 = call i64 @getAddr(i8* %110)
  %112 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx12 = getelementptr inbounds %struct.site, %struct.site* %112, i64 0
  %113 = bitcast %struct.site* %arrayidx12 to i8*
  %sub.ptr.lhs.cast13 = ptrtoint i8* %109 to i64
  %sub.ptr.rhs.cast14 = ptrtoint i8* %113 to i64
  %sub.ptr.sub15 = sub i64 %sub.ptr.lhs.cast13, %sub.ptr.rhs.cast14
  %conv16 = trunc i64 %sub.ptr.sub15 to i32
  call void @dslash(i32 %105, i32 %conv16, i32 1)
  %114 = bitcast i32* @even_sites_on_node to i8*
  %115 = call i64 @getAddr(i8* %114)
  %116 = load i32, i32* @even_sites_on_node, align 4
  %117 = bitcast i32* %i to i8*
  store i32 %116, i32* %i, align 4
  %118 = bitcast %struct.site** @lattice to i8*
  %119 = call i64 @getAddr(i8* %118)
  %120 = load %struct.site*, %struct.site** @lattice, align 8
  %121 = bitcast i32* %i to i8*
  %122 = call i64 @getAddr(i8* %121)
  %123 = load i32, i32* %i, align 4
  %idxprom = sext i32 %123 to i64
  %arrayidx17 = getelementptr inbounds %struct.site, %struct.site* %120, i64 %idxprom
  %124 = bitcast %struct.site** %s to i8*
  %125 = call i64 @getAddr(i8* %124)
  %126 = bitcast %struct.site* %arrayidx17 to i8*
  %127 = call i64 @getAddr(i8* %126)
  call void @setRealTemp(i64 %125, i64 %127)
  store %struct.site* %arrayidx17, %struct.site** %s, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %128 = bitcast i32* %i to i8*
  %129 = call i64 @getAddr(i8* %128)
  %130 = load i32, i32* %i, align 4
  %131 = bitcast i32* @sites_on_node to i8*
  %132 = call i64 @getAddr(i8* %131)
  %133 = load i32, i32* @sites_on_node, align 4
  %cmp18 = icmp slt i32 %130, %133
  br i1 %cmp18, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %134 = bitcast %struct.site** %s to i8*
  %135 = call i64 @getAddr(i8* %134)
  %136 = load %struct.site*, %struct.site** %s, align 8
  %137 = bitcast %struct.site* %136 to i8*
  %138 = bitcast i32* %src.addr to i8*
  %139 = call i64 @getAddr(i8* %138)
  %140 = load i32, i32* %src.addr, align 4
  %idx.ext = sext i32 %140 to i64
  %add.ptr = getelementptr inbounds i8, i8* %137, i64 %idx.ext
  %141 = bitcast i8* %add.ptr to %struct.su3_vector*
  %142 = bitcast %struct.site** %s to i8*
  %143 = call i64 @getAddr(i8* %142)
  %144 = load %struct.site*, %struct.site** %s, align 8
  %ttt20 = getelementptr inbounds %struct.site, %struct.site* %144, i32 0, i32 15
  %145 = bitcast %struct.site** %s to i8*
  %146 = call i64 @getAddr(i8* %145)
  %147 = load %struct.site*, %struct.site** %s, align 8
  %148 = bitcast %struct.site* %147 to i8*
  %149 = bitcast i32* %dest.addr to i8*
  %150 = call i64 @getAddr(i8* %149)
  %151 = load i32, i32* %dest.addr, align 4
  %idx.ext21 = sext i32 %151 to i64
  %add.ptr22 = getelementptr inbounds i8, i8* %148, i64 %idx.ext21
  %152 = bitcast i8* %add.ptr22 to %struct.su3_vector*
  call void @sub_su3_vector(%struct.su3_vector* %141, %struct.su3_vector* %ttt20, %struct.su3_vector* %152)
  %153 = bitcast %struct.site** %s to i8*
  %154 = call i64 @getAddr(i8* %153)
  %155 = load %struct.site*, %struct.site** %s, align 8
  %156 = bitcast %struct.site* %155 to i8*
  %157 = bitcast i32* %dest.addr to i8*
  %158 = call i64 @getAddr(i8* %157)
  %159 = load i32, i32* %dest.addr, align 4
  %idx.ext23 = sext i32 %159 to i64
  %add.ptr24 = getelementptr inbounds i8, i8* %156, i64 %idx.ext23
  %160 = bitcast i8* %add.ptr24 to %struct.su3_vector*
  %161 = bitcast double* %mass.addr to i8*
  %162 = call i64 @getAddr(i8* %161)
  %163 = load double, double* %mass.addr, align 8
  %mul25 = fmul double 2.000000e+00, %163
  %164 = call i64 @computeReal(i32 16, i64 0, i64 %162, double 2.000000e+00, double %163, double %mul25, i32 187)
  %div = fdiv double 1.000000e+00, %mul25
  %165 = call i64 @computeReal(i32 19, i64 0, i64 %164, double 1.000000e+00, double %mul25, double %div, i32 188)
  %166 = bitcast %struct.site** %s to i8*
  %167 = call i64 @getAddr(i8* %166)
  %168 = load %struct.site*, %struct.site** %s, align 8
  %169 = bitcast %struct.site* %168 to i8*
  %170 = bitcast i32* %dest.addr to i8*
  %171 = call i64 @getAddr(i8* %170)
  %172 = load i32, i32* %dest.addr, align 4
  %idx.ext26 = sext i32 %172 to i64
  %add.ptr27 = getelementptr inbounds i8, i8* %169, i64 %idx.ext26
  %173 = bitcast i8* %add.ptr27 to %struct.su3_vector*
  %174 = bitcast void (%struct.su3_vector*, double, %struct.su3_vector*)* @scalar_mult_su3_vector to i8*
  %175 = call i64 @getAddr(i8* %174)
  call void @addFunArg(i32 1, i64 %175, i64 %165)
  call void @scalar_mult_su3_vector(%struct.su3_vector* %160, double %div, %struct.su3_vector* %173)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %176 = bitcast i32* %i to i8*
  %177 = call i64 @getAddr(i8* %176)
  %178 = load i32, i32* %i, align 4
  %inc = add nsw i32 %178, 1
  %179 = bitcast i32* %i to i8*
  store i32 %inc, i32* %i, align 4
  %180 = bitcast %struct.site** %s to i8*
  %181 = call i64 @getAddr(i8* %180)
  %182 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr = getelementptr inbounds %struct.site, %struct.site* %182, i32 1
  %183 = bitcast %struct.site** %s to i8*
  %184 = call i64 @getAddr(i8* %183)
  %185 = bitcast %struct.site* %incdec.ptr to i8*
  %186 = call i64 @getAddr(i8* %185)
  call void @setRealTemp(i64 %184, i64 %186)
  store %struct.site* %incdec.ptr, %struct.site** %s, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %187 = bitcast i32* %cgn to i8*
  %188 = call i64 @getAddr(i8* %187)
  %189 = load i32, i32* %cgn, align 4
  %190 = bitcast i32 (i32, i32, i32, double)* @mat_invert_uml to i8*
  %191 = call i64 @getAddr(i8* %190)
  call void @funcExit(i64 %191)
  call void @trackReturn(i64 %188)
  call void @cleanComputeReal(i32 127)
  call void @cleanComputeReal(i32 187)
  call void @cleanComputeReal(i32 188)
  ret i32 %189
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #2

declare dso_local void @sub_su3_vector(%struct.su3_vector*, %struct.su3_vector*, %struct.su3_vector*) #1

declare dso_local void @scalar_mult_su3_vector(%struct.su3_vector*, double, %struct.su3_vector*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @check_invert(i32 %src, i32 %dest, double %mass, double %tol) #0 {
entry:
  %0 = bitcast i8* null to i8*
  %1 = bitcast void (i32, i32, double, double)* @check_invert to i8*
  %2 = call i64 @getAddr(i8* %1)
  call void @funcInit(i64 %2)
  %src.addr = alloca i32, align 4
  %3 = bitcast i32* %src.addr to i8*
  %4 = call i64 @getAddr(i8* %3)
  call void @handleAlloca(i64 %4)
  %dest.addr = alloca i32, align 4
  %5 = bitcast i32* %dest.addr to i8*
  %6 = call i64 @getAddr(i8* %5)
  call void @handleAlloca(i64 %6)
  %mass.addr = alloca double, align 8
  %7 = bitcast double* %mass.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  call void @handleAlloca(i64 %8)
  %tol.addr = alloca double, align 8
  %9 = bitcast double* %tol.addr to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void @handleAlloca(i64 %10)
  %i = alloca i32, align 4
  %11 = bitcast i32* %i to i8*
  %12 = call i64 @getAddr(i8* %11)
  call void @handleAlloca(i64 %12)
  %k = alloca i32, align 4
  %13 = bitcast i32* %k to i8*
  %14 = call i64 @getAddr(i8* %13)
  call void @handleAlloca(i64 %14)
  %flag = alloca i32, align 4
  %15 = bitcast i32* %flag to i8*
  %16 = call i64 @getAddr(i8* %15)
  call void @handleAlloca(i64 %16)
  %s = alloca %struct.site*, align 8
  %17 = bitcast %struct.site** %s to i8*
  %18 = call i64 @getAddr(i8* %17)
  call void @handleAlloca(i64 %18)
  %r_diff = alloca double, align 8
  %19 = bitcast double* %r_diff to i8*
  %20 = call i64 @getAddr(i8* %19)
  call void @handleAlloca(i64 %20)
  %i_diff = alloca double, align 8
  %21 = bitcast double* %i_diff to i8*
  %22 = call i64 @getAddr(i8* %21)
  call void @handleAlloca(i64 %22)
  %sum = alloca double, align 8
  %23 = bitcast double* %sum to i8*
  %24 = call i64 @getAddr(i8* %23)
  call void @handleAlloca(i64 %24)
  %sum2 = alloca double, align 8
  %25 = bitcast double* %sum2 to i8*
  %26 = call i64 @getAddr(i8* %25)
  call void @handleAlloca(i64 %26)
  %27 = bitcast i32* %src.addr to i8*
  store i32 %src, i32* %src.addr, align 4
  %28 = bitcast i32* %dest.addr to i8*
  store i32 %dest, i32* %dest.addr, align 4
  %29 = bitcast double* %mass.addr to i8*
  %30 = call i64 @getAddr(i8* %29)
  %31 = bitcast void (i32, i32, double, double)* @check_invert to i8*
  %32 = call i64 @getAddr(i8* %31)
  call void @setRealFunArg(i32 10, i64 %32, i64 %30, double %mass)
  store double %mass, double* %mass.addr, align 8
  %33 = bitcast double* %tol.addr to i8*
  %34 = call i64 @getAddr(i8* %33)
  %35 = bitcast void (i32, i32, double, double)* @check_invert to i8*
  %36 = call i64 @getAddr(i8* %35)
  call void @setRealFunArg(i32 11, i64 %36, i64 %34, double %tol)
  store double %tol, double* %tol.addr, align 8
  %37 = bitcast i32* %src.addr to i8*
  %38 = call i64 @getAddr(i8* %37)
  %39 = load i32, i32* %src.addr, align 4
  %40 = bitcast %struct.site** @lattice to i8*
  %41 = call i64 @getAddr(i8* %40)
  %42 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx = getelementptr inbounds %struct.site, %struct.site* %42, i64 0
  %cg_p = getelementptr inbounds %struct.site, %struct.site* %arrayidx, i32 0, i32 13
  %43 = bitcast %struct.su3_vector* %cg_p to i8*
  %44 = bitcast %struct.site** @lattice to i8*
  %45 = call i64 @getAddr(i8* %44)
  %46 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx1 = getelementptr inbounds %struct.site, %struct.site* %46, i64 0
  %47 = bitcast %struct.site* %arrayidx1 to i8*
  %sub.ptr.lhs.cast = ptrtoint i8* %43 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %47 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv = trunc i64 %sub.ptr.sub to i32
  call void @dslash(i32 %39, i32 %conv, i32 3)
  %48 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  %49 = bitcast %struct.site** @lattice to i8*
  %50 = call i64 @getAddr(i8* %49)
  %51 = load %struct.site*, %struct.site** @lattice, align 8
  %52 = bitcast %struct.site** %s to i8*
  %53 = call i64 @getAddr(i8* %52)
  %54 = bitcast %struct.site* %51 to i8*
  %55 = call i64 @getAddr(i8* %54)
  call void @setRealTemp(i64 %53, i64 %55)
  store %struct.site* %51, %struct.site** %s, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %56 = bitcast i32* %i to i8*
  %57 = call i64 @getAddr(i8* %56)
  %58 = load i32, i32* %i, align 4
  %59 = bitcast i32* @sites_on_node to i8*
  %60 = call i64 @getAddr(i8* %59)
  %61 = load i32, i32* @sites_on_node, align 4
  %cmp = icmp slt i32 %58, %61
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %62 = bitcast %struct.site** %s to i8*
  %63 = call i64 @getAddr(i8* %62)
  %64 = load %struct.site*, %struct.site** %s, align 8
  %cg_p3 = getelementptr inbounds %struct.site, %struct.site* %64, i32 0, i32 13
  %65 = bitcast %struct.site** %s to i8*
  %66 = call i64 @getAddr(i8* %65)
  %67 = load %struct.site*, %struct.site** %s, align 8
  %68 = bitcast %struct.site* %67 to i8*
  %69 = bitcast i32* %src.addr to i8*
  %70 = call i64 @getAddr(i8* %69)
  %71 = load i32, i32* %src.addr, align 4
  %idx.ext = sext i32 %71 to i64
  %add.ptr = getelementptr inbounds i8, i8* %68, i64 %idx.ext
  %72 = bitcast i8* %add.ptr to %struct.su3_vector*
  %73 = bitcast double* %mass.addr to i8*
  %74 = call i64 @getAddr(i8* %73)
  %75 = load double, double* %mass.addr, align 8
  %mul = fmul double 2.000000e+00, %75
  %76 = call i64 @computeReal(i32 16, i64 0, i64 %74, double 2.000000e+00, double %75, double %mul, i32 258)
  %77 = bitcast %struct.site** %s to i8*
  %78 = call i64 @getAddr(i8* %77)
  %79 = load %struct.site*, %struct.site** %s, align 8
  %cg_p4 = getelementptr inbounds %struct.site, %struct.site* %79, i32 0, i32 13
  %80 = bitcast void (%struct.su3_vector*, %struct.su3_vector*, double, %struct.su3_vector*)* @scalar_mult_add_su3_vector to i8*
  %81 = call i64 @getAddr(i8* %80)
  call void @addFunArg(i32 2, i64 %81, i64 %76)
  call void @scalar_mult_add_su3_vector(%struct.su3_vector* %cg_p3, %struct.su3_vector* %72, double %mul, %struct.su3_vector* %cg_p4)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %82 = bitcast i32* %i to i8*
  %83 = call i64 @getAddr(i8* %82)
  %84 = load i32, i32* %i, align 4
  %inc = add nsw i32 %84, 1
  %85 = bitcast i32* %i to i8*
  store i32 %inc, i32* %i, align 4
  %86 = bitcast %struct.site** %s to i8*
  %87 = call i64 @getAddr(i8* %86)
  %88 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr = getelementptr inbounds %struct.site, %struct.site* %88, i32 1
  %89 = bitcast %struct.site** %s to i8*
  %90 = call i64 @getAddr(i8* %89)
  %91 = bitcast %struct.site* %incdec.ptr to i8*
  %92 = call i64 @getAddr(i8* %91)
  call void @setRealTemp(i64 %90, i64 %92)
  store %struct.site* %incdec.ptr, %struct.site** %s, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %93 = bitcast double* %sum to i8*
  %94 = call i64 @getAddr(i8* %93)
  call void @setRealConstant(i64 %94, double 0.000000e+00)
  store double 0.000000e+00, double* %sum, align 8
  %95 = bitcast double* %sum2 to i8*
  %96 = call i64 @getAddr(i8* %95)
  call void @setRealConstant(i64 %96, double 0.000000e+00)
  store double 0.000000e+00, double* %sum2, align 8
  %97 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  %98 = bitcast %struct.site** @lattice to i8*
  %99 = call i64 @getAddr(i8* %98)
  %100 = load %struct.site*, %struct.site** @lattice, align 8
  %101 = bitcast %struct.site** %s to i8*
  %102 = call i64 @getAddr(i8* %101)
  %103 = bitcast %struct.site* %100 to i8*
  %104 = call i64 @getAddr(i8* %103)
  call void @setRealTemp(i64 %102, i64 %104)
  store %struct.site* %100, %struct.site** %s, align 8
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc73, %for.end
  %105 = bitcast i32* %i to i8*
  %106 = call i64 @getAddr(i8* %105)
  %107 = load i32, i32* %i, align 4
  %108 = bitcast i32* @sites_on_node to i8*
  %109 = call i64 @getAddr(i8* %108)
  %110 = load i32, i32* @sites_on_node, align 4
  %cmp6 = icmp slt i32 %107, %110
  br i1 %cmp6, label %for.body8, label %for.end76

for.body8:                                        ; preds = %for.cond5
  %111 = bitcast i32* %flag to i8*
  store i32 0, i32* %flag, align 4
  %112 = bitcast i32* %k to i8*
  store i32 0, i32* %k, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc66, %for.body8
  %113 = bitcast i32* %k to i8*
  %114 = call i64 @getAddr(i8* %113)
  %115 = load i32, i32* %k, align 4
  %cmp10 = icmp slt i32 %115, 3
  br i1 %cmp10, label %for.body12, label %for.end68

for.body12:                                       ; preds = %for.cond9
  %116 = bitcast %struct.site** %s to i8*
  %117 = call i64 @getAddr(i8* %116)
  %118 = load %struct.site*, %struct.site** %s, align 8
  %119 = bitcast %struct.site* %118 to i8*
  %120 = bitcast i32* %dest.addr to i8*
  %121 = call i64 @getAddr(i8* %120)
  %122 = load i32, i32* %dest.addr, align 4
  %idx.ext13 = sext i32 %122 to i64
  %add.ptr14 = getelementptr inbounds i8, i8* %119, i64 %idx.ext13
  %123 = bitcast i8* %add.ptr14 to %struct.su3_vector*
  %c = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %123, i32 0, i32 0
  %124 = bitcast i32* %k to i8*
  %125 = call i64 @getAddr(i8* %124)
  %126 = load i32, i32* %k, align 4
  %idxprom = sext i32 %126 to i64
  %arrayidx15 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c, i64 0, i64 %idxprom
  %real = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx15, i32 0, i32 0
  %127 = bitcast double* %real to i8*
  %128 = call i64 @getAddr(i8* %127)
  %129 = load double, double* %real, align 8
  %130 = bitcast %struct.site** %s to i8*
  %131 = call i64 @getAddr(i8* %130)
  %132 = load %struct.site*, %struct.site** %s, align 8
  %cg_p16 = getelementptr inbounds %struct.site, %struct.site* %132, i32 0, i32 13
  %c17 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %cg_p16, i32 0, i32 0
  %133 = bitcast i32* %k to i8*
  %134 = call i64 @getAddr(i8* %133)
  %135 = load i32, i32* %k, align 4
  %idxprom18 = sext i32 %135 to i64
  %arrayidx19 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c17, i64 0, i64 %idxprom18
  %real20 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx19, i32 0, i32 0
  %136 = bitcast double* %real20 to i8*
  %137 = call i64 @getAddr(i8* %136)
  %138 = load double, double* %real20, align 8
  %sub = fsub double %129, %138
  %139 = call i64 @computeReal(i32 14, i64 %128, i64 %137, double %129, double %138, double %sub, i32 306)
  %140 = bitcast double* %r_diff to i8*
  %141 = call i64 @getAddr(i8* %140)
  call void @setRealTemp(i64 %141, i64 %139)
  store double %sub, double* %r_diff, align 8
  %142 = bitcast %struct.site** %s to i8*
  %143 = call i64 @getAddr(i8* %142)
  %144 = load %struct.site*, %struct.site** %s, align 8
  %145 = bitcast %struct.site* %144 to i8*
  %146 = bitcast i32* %dest.addr to i8*
  %147 = call i64 @getAddr(i8* %146)
  %148 = load i32, i32* %dest.addr, align 4
  %idx.ext21 = sext i32 %148 to i64
  %add.ptr22 = getelementptr inbounds i8, i8* %145, i64 %idx.ext21
  %149 = bitcast i8* %add.ptr22 to %struct.su3_vector*
  %c23 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %149, i32 0, i32 0
  %150 = bitcast i32* %k to i8*
  %151 = call i64 @getAddr(i8* %150)
  %152 = load i32, i32* %k, align 4
  %idxprom24 = sext i32 %152 to i64
  %arrayidx25 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c23, i64 0, i64 %idxprom24
  %imag = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx25, i32 0, i32 1
  %153 = bitcast double* %imag to i8*
  %154 = call i64 @getAddr(i8* %153)
  %155 = load double, double* %imag, align 8
  %156 = bitcast %struct.site** %s to i8*
  %157 = call i64 @getAddr(i8* %156)
  %158 = load %struct.site*, %struct.site** %s, align 8
  %cg_p26 = getelementptr inbounds %struct.site, %struct.site* %158, i32 0, i32 13
  %c27 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %cg_p26, i32 0, i32 0
  %159 = bitcast i32* %k to i8*
  %160 = call i64 @getAddr(i8* %159)
  %161 = load i32, i32* %k, align 4
  %idxprom28 = sext i32 %161 to i64
  %arrayidx29 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c27, i64 0, i64 %idxprom28
  %imag30 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx29, i32 0, i32 1
  %162 = bitcast double* %imag30 to i8*
  %163 = call i64 @getAddr(i8* %162)
  %164 = load double, double* %imag30, align 8
  %sub31 = fsub double %155, %164
  %165 = call i64 @computeReal(i32 14, i64 %154, i64 %163, double %155, double %164, double %sub31, i32 328)
  %166 = bitcast double* %i_diff to i8*
  %167 = call i64 @getAddr(i8* %166)
  call void @setRealTemp(i64 %167, i64 %165)
  store double %sub31, double* %i_diff, align 8
  %168 = bitcast double* %r_diff to i8*
  %169 = call i64 @getAddr(i8* %168)
  %170 = load double, double* %r_diff, align 8
  %171 = call double @llvm.fabs.f64(double %170)
  %172 = call i64 @handleMathFunc(i32 8, double %170, i64 %169, double %171, i32 331)
  %173 = bitcast double* %tol.addr to i8*
  %174 = call i64 @getAddr(i8* %173)
  %175 = load double, double* %tol.addr, align 8
  %cmp32 = fcmp ogt double %171, %175
  call void @checkBranch(double %171, i64 %172, double %175, i64 %174, i32 2, i1 %cmp32, i32 333)
  br i1 %cmp32, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body12
  %176 = bitcast double* %i_diff to i8*
  %177 = call i64 @getAddr(i8* %176)
  %178 = load double, double* %i_diff, align 8
  %179 = call double @llvm.fabs.f64(double %178)
  %180 = call i64 @handleMathFunc(i32 8, double %178, i64 %177, double %179, i32 336)
  %181 = bitcast double* %tol.addr to i8*
  %182 = call i64 @getAddr(i8* %181)
  %183 = load double, double* %tol.addr, align 8
  %cmp34 = fcmp ogt double %179, %183
  call void @checkBranch(double %179, i64 %180, double %183, i64 %182, i32 2, i1 %cmp34, i32 338)
  br i1 %cmp34, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.body12
  %184 = bitcast i32* %flag to i8*
  store i32 1, i32* %flag, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %185 = bitcast i32* %flag to i8*
  %186 = call i64 @getAddr(i8* %185)
  %187 = load i32, i32* %flag, align 4
  %tobool = icmp ne i32 %187, 0
  br i1 %tobool, label %if.then36, label %if.end59

if.then36:                                        ; preds = %if.end
  %188 = bitcast i32* %i to i8*
  %189 = call i64 @getAddr(i8* %188)
  %190 = load i32, i32* %i, align 4
  %191 = bitcast i32* %k to i8*
  %192 = call i64 @getAddr(i8* %191)
  %193 = load i32, i32* %k, align 4
  %194 = bitcast %struct.site** %s to i8*
  %195 = call i64 @getAddr(i8* %194)
  %196 = load %struct.site*, %struct.site** %s, align 8
  %197 = bitcast %struct.site* %196 to i8*
  %198 = bitcast i32* %dest.addr to i8*
  %199 = call i64 @getAddr(i8* %198)
  %200 = load i32, i32* %dest.addr, align 4
  %idx.ext37 = sext i32 %200 to i64
  %add.ptr38 = getelementptr inbounds i8, i8* %197, i64 %idx.ext37
  %201 = bitcast i8* %add.ptr38 to %struct.su3_vector*
  %c39 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %201, i32 0, i32 0
  %202 = bitcast i32* %k to i8*
  %203 = call i64 @getAddr(i8* %202)
  %204 = load i32, i32* %k, align 4
  %idxprom40 = sext i32 %204 to i64
  %arrayidx41 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c39, i64 0, i64 %idxprom40
  %real42 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx41, i32 0, i32 0
  %205 = bitcast double* %real42 to i8*
  %206 = call i64 @getAddr(i8* %205)
  %207 = load double, double* %real42, align 8
  %208 = bitcast %struct.site** %s to i8*
  %209 = call i64 @getAddr(i8* %208)
  %210 = load %struct.site*, %struct.site** %s, align 8
  %211 = bitcast %struct.site* %210 to i8*
  %212 = bitcast i32* %dest.addr to i8*
  %213 = call i64 @getAddr(i8* %212)
  %214 = load i32, i32* %dest.addr, align 4
  %idx.ext43 = sext i32 %214 to i64
  %add.ptr44 = getelementptr inbounds i8, i8* %211, i64 %idx.ext43
  %215 = bitcast i8* %add.ptr44 to %struct.su3_vector*
  %c45 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %215, i32 0, i32 0
  %216 = bitcast i32* %k to i8*
  %217 = call i64 @getAddr(i8* %216)
  %218 = load i32, i32* %k, align 4
  %idxprom46 = sext i32 %218 to i64
  %arrayidx47 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c45, i64 0, i64 %idxprom46
  %imag48 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx47, i32 0, i32 1
  %219 = bitcast double* %imag48 to i8*
  %220 = call i64 @getAddr(i8* %219)
  %221 = load double, double* %imag48, align 8
  %222 = bitcast %struct.site** %s to i8*
  %223 = call i64 @getAddr(i8* %222)
  %224 = load %struct.site*, %struct.site** %s, align 8
  %cg_p49 = getelementptr inbounds %struct.site, %struct.site* %224, i32 0, i32 13
  %c50 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %cg_p49, i32 0, i32 0
  %225 = bitcast i32* %k to i8*
  %226 = call i64 @getAddr(i8* %225)
  %227 = load i32, i32* %k, align 4
  %idxprom51 = sext i32 %227 to i64
  %arrayidx52 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c50, i64 0, i64 %idxprom51
  %real53 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx52, i32 0, i32 0
  %228 = bitcast double* %real53 to i8*
  %229 = call i64 @getAddr(i8* %228)
  %230 = load double, double* %real53, align 8
  %231 = bitcast %struct.site** %s to i8*
  %232 = call i64 @getAddr(i8* %231)
  %233 = load %struct.site*, %struct.site** %s, align 8
  %cg_p54 = getelementptr inbounds %struct.site, %struct.site* %233, i32 0, i32 13
  %c55 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %cg_p54, i32 0, i32 0
  %234 = bitcast i32* %k to i8*
  %235 = call i64 @getAddr(i8* %234)
  %236 = load i32, i32* %k, align 4
  %idxprom56 = sext i32 %236 to i64
  %arrayidx57 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c55, i64 0, i64 %idxprom56
  %imag58 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx57, i32 0, i32 1
  %237 = bitcast double* %imag58 to i8*
  %238 = call i64 @getAddr(i8* %237)
  %239 = load double, double* %imag58, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.1, i32 0, i32 0), i32 %190, i32 %193, double %207, double %221, double %230, double %239)
  br label %if.end59

if.end59:                                         ; preds = %if.then36, %if.end
  %240 = bitcast i32* %flag to i8*
  %241 = call i64 @getAddr(i8* %240)
  %242 = load i32, i32* %flag, align 4
  %tobool60 = icmp ne i32 %242, 0
  br i1 %tobool60, label %if.then61, label %if.end62

if.then61:                                        ; preds = %if.end59
  call void @terminate(i32 0)
  br label %if.end62

if.end62:                                         ; preds = %if.then61, %if.end59
  %243 = bitcast double* %r_diff to i8*
  %244 = call i64 @getAddr(i8* %243)
  %245 = load double, double* %r_diff, align 8
  %246 = bitcast double* %r_diff to i8*
  %247 = call i64 @getAddr(i8* %246)
  %248 = load double, double* %r_diff, align 8
  %mul63 = fmul double %245, %248
  %249 = call i64 @computeReal(i32 16, i64 %244, i64 %247, double %245, double %248, double %mul63, i32 396)
  %250 = bitcast double* %i_diff to i8*
  %251 = call i64 @getAddr(i8* %250)
  %252 = load double, double* %i_diff, align 8
  %253 = bitcast double* %i_diff to i8*
  %254 = call i64 @getAddr(i8* %253)
  %255 = load double, double* %i_diff, align 8
  %mul64 = fmul double %252, %255
  %256 = call i64 @computeReal(i32 16, i64 %251, i64 %254, double %252, double %255, double %mul64, i32 399)
  %add = fadd double %mul63, %mul64
  %257 = call i64 @computeReal(i32 12, i64 %249, i64 %256, double %mul63, double %mul64, double %add, i32 400)
  %258 = bitcast double* %sum to i8*
  %259 = call i64 @getAddr(i8* %258)
  %260 = load double, double* %sum, align 8
  %add65 = fadd double %260, %add
  %261 = call i64 @computeReal(i32 12, i64 %259, i64 %257, double %260, double %add, double %add65, i32 402)
  %262 = bitcast double* %sum to i8*
  %263 = call i64 @getAddr(i8* %262)
  call void @setRealTemp(i64 %263, i64 %261)
  store double %add65, double* %sum, align 8
  br label %for.inc66

for.inc66:                                        ; preds = %if.end62
  %264 = bitcast i32* %k to i8*
  %265 = call i64 @getAddr(i8* %264)
  %266 = load i32, i32* %k, align 4
  %inc67 = add nsw i32 %266, 1
  %267 = bitcast i32* %k to i8*
  store i32 %inc67, i32* %k, align 4
  br label %for.cond9

for.end68:                                        ; preds = %for.cond9
  %268 = bitcast %struct.site** %s to i8*
  %269 = call i64 @getAddr(i8* %268)
  %270 = load %struct.site*, %struct.site** %s, align 8
  %271 = bitcast %struct.site* %270 to i8*
  %272 = bitcast i32* %dest.addr to i8*
  %273 = call i64 @getAddr(i8* %272)
  %274 = load i32, i32* %dest.addr, align 4
  %idx.ext69 = sext i32 %274 to i64
  %add.ptr70 = getelementptr inbounds i8, i8* %271, i64 %idx.ext69
  %275 = bitcast i8* %add.ptr70 to %struct.su3_vector*
  %call71 = call double @magsq_su3vec(%struct.su3_vector* %275)
  %276 = bitcast double* %sum2 to i8*
  %277 = call i64 @getAddr(i8* %276)
  %278 = load double, double* %sum2, align 8
  %add72 = fadd double %278, %call71
  %279 = bitcast double* %sum2 to i8*
  %280 = call i64 @getAddr(i8* %279)
  store double %add72, double* %sum2, align 8
  br label %for.inc73

for.inc73:                                        ; preds = %for.end68
  %281 = bitcast i32* %i to i8*
  %282 = call i64 @getAddr(i8* %281)
  %283 = load i32, i32* %i, align 4
  %inc74 = add nsw i32 %283, 1
  %284 = bitcast i32* %i to i8*
  store i32 %inc74, i32* %i, align 4
  %285 = bitcast %struct.site** %s to i8*
  %286 = call i64 @getAddr(i8* %285)
  %287 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr75 = getelementptr inbounds %struct.site, %struct.site* %287, i32 1
  %288 = bitcast %struct.site** %s to i8*
  %289 = call i64 @getAddr(i8* %288)
  %290 = bitcast %struct.site* %incdec.ptr75 to i8*
  %291 = call i64 @getAddr(i8* %290)
  call void @setRealTemp(i64 %289, i64 %291)
  store %struct.site* %incdec.ptr75, %struct.site** %s, align 8
  br label %for.cond5

for.end76:                                        ; preds = %for.cond5
  call void @g_doublesum(double* %sum)
  call void @g_doublesum(double* %sum2)
  call void (...) @g_sync()
  %292 = bitcast i32* @this_node to i8*
  %293 = call i64 @getAddr(i8* %292)
  %294 = load i32, i32* @this_node, align 4
  %cmp77 = icmp eq i32 %294, 0
  br i1 %cmp77, label %if.then79, label %if.end83

if.then79:                                        ; preds = %for.end76
  %295 = bitcast double* %sum to i8*
  %296 = call i64 @getAddr(i8* %295)
  %297 = load double, double* %sum, align 8
  %298 = bitcast double* %sum2 to i8*
  %299 = call i64 @getAddr(i8* %298)
  %300 = load double, double* %sum2, align 8
  %div = fdiv double %297, %300
  %301 = call i64 @computeReal(i32 19, i64 %296, i64 %299, double %297, double %300, double %div, i32 435)
  %call80 = call double @sqrt(double %div) #6
  %302 = call i64 @handleMathFunc(i32 1, double %div, i64 %301, double %call80, i32 436)
  %call81 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.2, i32 0, i32 0), double %call80)
  %303 = bitcast %struct._IO_FILE** @stdout to i8*
  %304 = call i64 @getAddr(i8* %303)
  %305 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call82 = call i32 @fflush(%struct._IO_FILE* %305)
  br label %if.end83

if.end83:                                         ; preds = %if.then79, %for.end76
  %306 = bitcast void (i32, i32, double, double)* @check_invert to i8*
  %307 = call i64 @getAddr(i8* %306)
  call void @funcExit(i64 %307)
  call void @cleanComputeReal(i32 258)
  call void @cleanComputeReal(i32 306)
  call void @cleanComputeReal(i32 328)
  call void @cleanComputeReal(i32 331)
  call void @cleanComputeReal(i32 336)
  call void @cleanComputeReal(i32 396)
  call void @cleanComputeReal(i32 399)
  call void @cleanComputeReal(i32 400)
  call void @cleanComputeReal(i32 402)
  call void @cleanComputeReal(i32 435)
  call void @cleanComputeReal(i32 436)
  ret void
}

declare dso_local void @scalar_mult_add_su3_vector(%struct.su3_vector*, %struct.su3_vector*, double, %struct.su3_vector*) #1

; Function Attrs: nounwind readnone speculatable
declare double @llvm.fabs.f64(double) #3

declare dso_local void @terminate(i32) #1

declare dso_local double @magsq_su3vec(%struct.su3_vector*) #1

declare dso_local void @g_doublesum(double*) #1

declare dso_local void @g_sync(...) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #4

declare dso_local i32 @fflush(%struct._IO_FILE*) #1

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @funcExit(i64)

declare void @handleAlloca(i64)

declare void @setRealFunArg(i32, i64, i64, double)

declare void @addFunArg(i32, i64, i64)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @trackReturn(i64)

declare void @cleanComputeReal(i32)

declare void @setRealTemp(i64, i64)

declare void @setRealConstant(i64, double)

declare i64 @handleMathFunc(i32, double, i64, double, i32)

declare void @checkBranch(double, i64, double, i64, i32, i1, i32)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
