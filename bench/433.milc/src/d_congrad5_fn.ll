; ModuleID = 'd_congrad5_fn.bc'
source_filename = "d_congrad5_fn.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.site = type { i16, i16, i16, i16, i8, i32, %struct.double_prn, i32, [4 x %struct.su3_matrix], [4 x %struct.su3_matrix], [4 x %struct.su3_matrix], [4 x %struct.anti_hermitmat], [4 x double], %struct.su3_vector, %struct.su3_vector, %struct.su3_vector, %struct.su3_vector, %struct.su3_vector, %struct.su3_vector, [4 x %struct.su3_vector], [4 x %struct.su3_vector], %struct.su3_vector, %struct.su3_matrix, %struct.su3_matrix }
%struct.double_prn = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, double }
%struct.anti_hermitmat = type { %struct.complex, %struct.complex, %struct.complex, double, double, double, double }
%struct.complex = type { double, double }
%struct.su3_vector = type { [3 x %struct.complex] }
%struct.su3_matrix = type { [3 x [3 x %struct.complex]] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.msg_tag = type { i32, i32, i8*, i32 }
%struct.timeval = type { i64, i64 }

@valid_longlinks = external dso_local global i32, align 4
@valid_fatlinks = external dso_local global i32, align 4
@lattice = external dso_local global %struct.site*, align 8
@even_sites_on_node = external dso_local global i32, align 4
@sites_on_node = external dso_local global i32, align 4
@total_iters = external dso_local global i32, align 4
@this_node = external dso_local global i32, align 4
@.str = private dso_local unnamed_addr constant [59 x i8] c"CG not converged after %d iterations, res. = %e wanted %e\0A\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ks_congrad(i32 %src, i32 %dest, double %mass, i32 %niter, double %rsqmin, i32 %parity, double* %final_rsq_ptr) #0 {
entry:
  %retval = alloca i32, align 4
  %src.addr = alloca i32, align 4
  %dest.addr = alloca i32, align 4
  %mass.addr = alloca double, align 8
  %niter.addr = alloca i32, align 4
  %rsqmin.addr = alloca double, align 8
  %parity.addr = alloca i32, align 4
  %final_rsq_ptr.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %s = alloca %struct.site*, align 8
  %iteration = alloca i32, align 4
  %a = alloca double, align 8
  %b = alloca double, align 8
  %rsq = alloca double, align 8
  %oldrsq = alloca double, align 8
  %pkp = alloca double, align 8
  %msq_x4 = alloca double, align 8
  %source_norm = alloca double, align 8
  %rsqstop = alloca double, align 8
  %l_parity = alloca i32, align 4
  %l_otherparity = alloca i32, align 4
  %tags1 = alloca [16 x %struct.msg_tag*], align 16
  %tags2 = alloca [16 x %struct.msg_tag*], align 16
  %special_started = alloca i32, align 4
  %tv1c = alloca %struct.timeval, align 8
  %tv2c = alloca %struct.timeval, align 8
  %tv1d = alloca %struct.timeval, align 8
  %tv2d = alloca %struct.timeval, align 8
  %dt1 = alloca double, align 8
  %dt2 = alloca double, align 8
  %nflop = alloca double, align 8
  %loopend = alloca i32, align 4
  %loopend126 = alloca i32, align 4
  %loopend160 = alloca i32, align 4
  store i32 %src, i32* %src.addr, align 4
  store i32 %dest, i32* %dest.addr, align 4
  store double %mass, double* %mass.addr, align 8
  store i32 %niter, i32* %niter.addr, align 4
  store double %rsqmin, double* %rsqmin.addr, align 8
  store i32 %parity, i32* %parity.addr, align 4
  store double* %final_rsq_ptr, double** %final_rsq_ptr.addr, align 8
  store double 1.187000e+03, double* %nflop, align 8
  %0 = load i32, i32* %parity.addr, align 4
  %cmp = icmp eq i32 %0, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load double, double* %nflop, align 8
  %mul = fmul double %1, 2.000000e+00
  store double %mul, double* %nflop, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* %special_started, align 4
  %2 = load i32, i32* %parity.addr, align 4
  switch i32 %2, label %sw.epilog [
    i32 2, label %sw.bb
    i32 1, label %sw.bb1
    i32 3, label %sw.bb2
  ]

sw.bb:                                            ; preds = %if.end
  store i32 2, i32* %l_parity, align 4
  store i32 1, i32* %l_otherparity, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %if.end
  store i32 1, i32* %l_parity, align 4
  store i32 2, i32* %l_otherparity, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %if.end
  store i32 2, i32* %l_parity, align 4
  store i32 1, i32* %l_otherparity, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end, %sw.bb2, %sw.bb1, %sw.bb
  %3 = load double, double* %mass.addr, align 8
  %mul3 = fmul double 4.000000e+00, %3
  %4 = load double, double* %mass.addr, align 8
  %mul4 = fmul double %mul3, %4
  store double %mul4, double* %msq_x4, align 8
  store i32 0, i32* %iteration, align 4
  %5 = load i32, i32* @valid_longlinks, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.end6, label %if.then5

if.then5:                                         ; preds = %sw.epilog
  call void (...) @load_longlinks()
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %sw.epilog
  %6 = load i32, i32* @valid_fatlinks, align 4
  %tobool7 = icmp ne i32 %6, 0
  br i1 %tobool7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.end6
  call void (...) @load_fatlinks()
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end6
  br label %start

start:                                            ; preds = %if.then239, %if.then235, %if.then199, %if.then59, %if.end9
  %7 = load i32, i32* %special_started, align 4
  %cmp10 = icmp eq i32 %7, 1
  br i1 %cmp10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %start
  %arraydecay = getelementptr inbounds [16 x %struct.msg_tag*], [16 x %struct.msg_tag*]* %tags1, i32 0, i32 0
  %arraydecay12 = getelementptr inbounds [16 x %struct.msg_tag*], [16 x %struct.msg_tag*]* %tags2, i32 0, i32 0
  call void @cleanup_gathers(%struct.msg_tag** %arraydecay, %struct.msg_tag** %arraydecay12)
  store i32 0, i32* %special_started, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %start
  store double 0.000000e+00, double* %source_norm, align 8
  store double 0.000000e+00, double* %rsq, align 8
  %8 = load i32, i32* %dest.addr, align 4
  %9 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx = getelementptr inbounds %struct.site, %struct.site* %9, i64 0
  %ttt = getelementptr inbounds %struct.site, %struct.site* %arrayidx, i32 0, i32 17
  %10 = bitcast %struct.su3_vector* %ttt to i8*
  %11 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx14 = getelementptr inbounds %struct.site, %struct.site* %11, i64 0
  %12 = bitcast %struct.site* %arrayidx14 to i8*
  %sub.ptr.lhs.cast = ptrtoint i8* %10 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %12 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv = trunc i64 %sub.ptr.sub to i32
  %13 = load i32, i32* %l_otherparity, align 4
  call void @dslash_fn(i32 %8, i32 %conv, i32 %13)
  %14 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx15 = getelementptr inbounds %struct.site, %struct.site* %14, i64 0
  %ttt16 = getelementptr inbounds %struct.site, %struct.site* %arrayidx15, i32 0, i32 17
  %15 = bitcast %struct.su3_vector* %ttt16 to i8*
  %16 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx17 = getelementptr inbounds %struct.site, %struct.site* %16, i64 0
  %17 = bitcast %struct.site* %arrayidx17 to i8*
  %sub.ptr.lhs.cast18 = ptrtoint i8* %15 to i64
  %sub.ptr.rhs.cast19 = ptrtoint i8* %17 to i64
  %sub.ptr.sub20 = sub i64 %sub.ptr.lhs.cast18, %sub.ptr.rhs.cast19
  %conv21 = trunc i64 %sub.ptr.sub20 to i32
  %18 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx22 = getelementptr inbounds %struct.site, %struct.site* %18, i64 0
  %ttt23 = getelementptr inbounds %struct.site, %struct.site* %arrayidx22, i32 0, i32 17
  %19 = bitcast %struct.su3_vector* %ttt23 to i8*
  %20 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx24 = getelementptr inbounds %struct.site, %struct.site* %20, i64 0
  %21 = bitcast %struct.site* %arrayidx24 to i8*
  %sub.ptr.lhs.cast25 = ptrtoint i8* %19 to i64
  %sub.ptr.rhs.cast26 = ptrtoint i8* %21 to i64
  %sub.ptr.sub27 = sub i64 %sub.ptr.lhs.cast25, %sub.ptr.rhs.cast26
  %conv28 = trunc i64 %sub.ptr.sub27 to i32
  %22 = load i32, i32* %l_parity, align 4
  call void @dslash_fn(i32 %conv21, i32 %conv28, i32 %22)
  %23 = load i32, i32* %l_parity, align 4
  %cmp29 = icmp eq i32 %23, 2
  br i1 %cmp29, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end13
  %24 = load i32, i32* @even_sites_on_node, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end13
  %25 = load i32, i32* @sites_on_node, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %24, %cond.true ], [ %25, %cond.false ]
  store i32 %cond, i32* %loopend, align 4
  %26 = load i32, i32* %l_parity, align 4
  %cmp31 = icmp eq i32 %26, 1
  br i1 %cmp31, label %cond.true33, label %cond.false34

cond.true33:                                      ; preds = %cond.end
  %27 = load i32, i32* @even_sites_on_node, align 4
  br label %cond.end35

cond.false34:                                     ; preds = %cond.end
  br label %cond.end35

cond.end35:                                       ; preds = %cond.false34, %cond.true33
  %cond36 = phi i32 [ %27, %cond.true33 ], [ 0, %cond.false34 ]
  store i32 %cond36, i32* %i, align 4
  %28 = load %struct.site*, %struct.site** @lattice, align 8
  %29 = load i32, i32* %i, align 4
  %idxprom = sext i32 %29 to i64
  %arrayidx37 = getelementptr inbounds %struct.site, %struct.site* %28, i64 %idxprom
  store %struct.site* %arrayidx37, %struct.site** %s, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end35
  %30 = load i32, i32* %i, align 4
  %31 = load i32, i32* %loopend, align 4
  %cmp38 = icmp slt i32 %30, %31
  br i1 %cmp38, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %32 = load %struct.site*, %struct.site** %s, align 8
  %ttt40 = getelementptr inbounds %struct.site, %struct.site* %32, i32 0, i32 17
  %33 = load %struct.site*, %struct.site** %s, align 8
  %34 = bitcast %struct.site* %33 to i8*
  %35 = load i32, i32* %dest.addr, align 4
  %idx.ext = sext i32 %35 to i64
  %add.ptr = getelementptr inbounds i8, i8* %34, i64 %idx.ext
  %36 = bitcast i8* %add.ptr to %struct.su3_vector*
  %37 = load double, double* %msq_x4, align 8
  %sub = fsub double -0.000000e+00, %37
  %38 = load %struct.site*, %struct.site** %s, align 8
  %ttt41 = getelementptr inbounds %struct.site, %struct.site* %38, i32 0, i32 17
  call void @scalar_mult_add_su3_vector(%struct.su3_vector* %ttt40, %struct.su3_vector* %36, double %sub, %struct.su3_vector* %ttt41)
  %39 = load %struct.site*, %struct.site** %s, align 8
  %40 = bitcast %struct.site* %39 to i8*
  %41 = load i32, i32* %src.addr, align 4
  %idx.ext42 = sext i32 %41 to i64
  %add.ptr43 = getelementptr inbounds i8, i8* %40, i64 %idx.ext42
  %42 = bitcast i8* %add.ptr43 to %struct.su3_vector*
  %43 = load %struct.site*, %struct.site** %s, align 8
  %ttt44 = getelementptr inbounds %struct.site, %struct.site* %43, i32 0, i32 17
  %44 = load %struct.site*, %struct.site** %s, align 8
  %resid = getelementptr inbounds %struct.site, %struct.site* %44, i32 0, i32 14
  call void @add_su3_vector(%struct.su3_vector* %42, %struct.su3_vector* %ttt44, %struct.su3_vector* %resid)
  %45 = load %struct.site*, %struct.site** %s, align 8
  %cg_p = getelementptr inbounds %struct.site, %struct.site* %45, i32 0, i32 15
  %46 = load %struct.site*, %struct.site** %s, align 8
  %resid45 = getelementptr inbounds %struct.site, %struct.site* %46, i32 0, i32 14
  %47 = bitcast %struct.su3_vector* %cg_p to i8*
  %48 = bitcast %struct.su3_vector* %resid45 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %47, i8* align 8 %48, i64 48, i1 false)
  %49 = load %struct.site*, %struct.site** %s, align 8
  %50 = bitcast %struct.site* %49 to i8*
  %51 = load i32, i32* %src.addr, align 4
  %idx.ext46 = sext i32 %51 to i64
  %add.ptr47 = getelementptr inbounds i8, i8* %50, i64 %idx.ext46
  %52 = bitcast i8* %add.ptr47 to %struct.su3_vector*
  %call = call double @magsq_su3vec(%struct.su3_vector* %52)
  %53 = load double, double* %source_norm, align 8
  %add = fadd double %53, %call
  store double %add, double* %source_norm, align 8
  %54 = load %struct.site*, %struct.site** %s, align 8
  %resid48 = getelementptr inbounds %struct.site, %struct.site* %54, i32 0, i32 14
  %call49 = call double @magsq_su3vec(%struct.su3_vector* %resid48)
  %55 = load double, double* %rsq, align 8
  %add50 = fadd double %55, %call49
  store double %add50, double* %rsq, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %56 = load i32, i32* %i, align 4
  %inc = add nsw i32 %56, 1
  store i32 %inc, i32* %i, align 4
  %57 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr = getelementptr inbounds %struct.site, %struct.site* %57, i32 1
  store %struct.site* %incdec.ptr, %struct.site** %s, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @g_doublesum(double* %source_norm)
  call void @g_doublesum(double* %rsq)
  %58 = load i32, i32* %iteration, align 4
  %inc51 = add nsw i32 %58, 1
  store i32 %inc51, i32* %iteration, align 4
  %59 = load i32, i32* @total_iters, align 4
  %inc52 = add nsw i32 %59, 1
  store i32 %inc52, i32* @total_iters, align 4
  %60 = load double, double* %rsqmin.addr, align 8
  %61 = load double, double* %source_norm, align 8
  %mul53 = fmul double %60, %61
  store double %mul53, double* %rsqstop, align 8
  %62 = load double, double* %rsq, align 8
  %63 = load double, double* %rsqstop, align 8
  %cmp54 = fcmp ole double %62, %63
  br i1 %cmp54, label %if.then56, label %if.end61

if.then56:                                        ; preds = %for.end
  %64 = load i32, i32* %parity.addr, align 4
  %cmp57 = icmp eq i32 %64, 3
  br i1 %cmp57, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.then56
  store i32 1, i32* %l_parity, align 4
  store i32 2, i32* %l_otherparity, align 4
  store i32 2, i32* %parity.addr, align 4
  store i32 0, i32* %iteration, align 4
  br label %start

if.end60:                                         ; preds = %if.then56
  %65 = load double, double* %rsq, align 8
  %66 = load double*, double** %final_rsq_ptr.addr, align 8
  store double %65, double* %66, align 8
  %67 = load i32, i32* %iteration, align 4
  store i32 %67, i32* %retval, align 4
  br label %return

if.end61:                                         ; preds = %for.end
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end61
  %68 = load double, double* %rsq, align 8
  store double %68, double* %oldrsq, align 8
  store double 0.000000e+00, double* %pkp, align 8
  %69 = load i32, i32* %special_started, align 4
  %cmp62 = icmp eq i32 %69, 0
  br i1 %cmp62, label %if.then64, label %if.else

if.then64:                                        ; preds = %do.body
  %70 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx65 = getelementptr inbounds %struct.site, %struct.site* %70, i64 0
  %cg_p66 = getelementptr inbounds %struct.site, %struct.site* %arrayidx65, i32 0, i32 15
  %71 = bitcast %struct.su3_vector* %cg_p66 to i8*
  %72 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx67 = getelementptr inbounds %struct.site, %struct.site* %72, i64 0
  %73 = bitcast %struct.site* %arrayidx67 to i8*
  %sub.ptr.lhs.cast68 = ptrtoint i8* %71 to i64
  %sub.ptr.rhs.cast69 = ptrtoint i8* %73 to i64
  %sub.ptr.sub70 = sub i64 %sub.ptr.lhs.cast68, %sub.ptr.rhs.cast69
  %conv71 = trunc i64 %sub.ptr.sub70 to i32
  %74 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx72 = getelementptr inbounds %struct.site, %struct.site* %74, i64 0
  %ttt73 = getelementptr inbounds %struct.site, %struct.site* %arrayidx72, i32 0, i32 17
  %75 = bitcast %struct.su3_vector* %ttt73 to i8*
  %76 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx74 = getelementptr inbounds %struct.site, %struct.site* %76, i64 0
  %77 = bitcast %struct.site* %arrayidx74 to i8*
  %sub.ptr.lhs.cast75 = ptrtoint i8* %75 to i64
  %sub.ptr.rhs.cast76 = ptrtoint i8* %77 to i64
  %sub.ptr.sub77 = sub i64 %sub.ptr.lhs.cast75, %sub.ptr.rhs.cast76
  %conv78 = trunc i64 %sub.ptr.sub77 to i32
  %78 = load i32, i32* %l_otherparity, align 4
  %arraydecay79 = getelementptr inbounds [16 x %struct.msg_tag*], [16 x %struct.msg_tag*]* %tags2, i32 0, i32 0
  call void @dslash_fn_special(i32 %conv71, i32 %conv78, i32 %78, %struct.msg_tag** %arraydecay79, i32 1)
  %79 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx80 = getelementptr inbounds %struct.site, %struct.site* %79, i64 0
  %ttt81 = getelementptr inbounds %struct.site, %struct.site* %arrayidx80, i32 0, i32 17
  %80 = bitcast %struct.su3_vector* %ttt81 to i8*
  %81 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx82 = getelementptr inbounds %struct.site, %struct.site* %81, i64 0
  %82 = bitcast %struct.site* %arrayidx82 to i8*
  %sub.ptr.lhs.cast83 = ptrtoint i8* %80 to i64
  %sub.ptr.rhs.cast84 = ptrtoint i8* %82 to i64
  %sub.ptr.sub85 = sub i64 %sub.ptr.lhs.cast83, %sub.ptr.rhs.cast84
  %conv86 = trunc i64 %sub.ptr.sub85 to i32
  %83 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx87 = getelementptr inbounds %struct.site, %struct.site* %83, i64 0
  %ttt88 = getelementptr inbounds %struct.site, %struct.site* %arrayidx87, i32 0, i32 17
  %84 = bitcast %struct.su3_vector* %ttt88 to i8*
  %85 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx89 = getelementptr inbounds %struct.site, %struct.site* %85, i64 0
  %86 = bitcast %struct.site* %arrayidx89 to i8*
  %sub.ptr.lhs.cast90 = ptrtoint i8* %84 to i64
  %sub.ptr.rhs.cast91 = ptrtoint i8* %86 to i64
  %sub.ptr.sub92 = sub i64 %sub.ptr.lhs.cast90, %sub.ptr.rhs.cast91
  %conv93 = trunc i64 %sub.ptr.sub92 to i32
  %87 = load i32, i32* %l_parity, align 4
  %arraydecay94 = getelementptr inbounds [16 x %struct.msg_tag*], [16 x %struct.msg_tag*]* %tags1, i32 0, i32 0
  call void @dslash_fn_special(i32 %conv86, i32 %conv93, i32 %87, %struct.msg_tag** %arraydecay94, i32 1)
  store i32 1, i32* %special_started, align 4
  br label %if.end125

if.else:                                          ; preds = %do.body
  %88 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx95 = getelementptr inbounds %struct.site, %struct.site* %88, i64 0
  %cg_p96 = getelementptr inbounds %struct.site, %struct.site* %arrayidx95, i32 0, i32 15
  %89 = bitcast %struct.su3_vector* %cg_p96 to i8*
  %90 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx97 = getelementptr inbounds %struct.site, %struct.site* %90, i64 0
  %91 = bitcast %struct.site* %arrayidx97 to i8*
  %sub.ptr.lhs.cast98 = ptrtoint i8* %89 to i64
  %sub.ptr.rhs.cast99 = ptrtoint i8* %91 to i64
  %sub.ptr.sub100 = sub i64 %sub.ptr.lhs.cast98, %sub.ptr.rhs.cast99
  %conv101 = trunc i64 %sub.ptr.sub100 to i32
  %92 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx102 = getelementptr inbounds %struct.site, %struct.site* %92, i64 0
  %ttt103 = getelementptr inbounds %struct.site, %struct.site* %arrayidx102, i32 0, i32 17
  %93 = bitcast %struct.su3_vector* %ttt103 to i8*
  %94 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx104 = getelementptr inbounds %struct.site, %struct.site* %94, i64 0
  %95 = bitcast %struct.site* %arrayidx104 to i8*
  %sub.ptr.lhs.cast105 = ptrtoint i8* %93 to i64
  %sub.ptr.rhs.cast106 = ptrtoint i8* %95 to i64
  %sub.ptr.sub107 = sub i64 %sub.ptr.lhs.cast105, %sub.ptr.rhs.cast106
  %conv108 = trunc i64 %sub.ptr.sub107 to i32
  %96 = load i32, i32* %l_otherparity, align 4
  %arraydecay109 = getelementptr inbounds [16 x %struct.msg_tag*], [16 x %struct.msg_tag*]* %tags2, i32 0, i32 0
  call void @dslash_fn_special(i32 %conv101, i32 %conv108, i32 %96, %struct.msg_tag** %arraydecay109, i32 0)
  %97 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx110 = getelementptr inbounds %struct.site, %struct.site* %97, i64 0
  %ttt111 = getelementptr inbounds %struct.site, %struct.site* %arrayidx110, i32 0, i32 17
  %98 = bitcast %struct.su3_vector* %ttt111 to i8*
  %99 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx112 = getelementptr inbounds %struct.site, %struct.site* %99, i64 0
  %100 = bitcast %struct.site* %arrayidx112 to i8*
  %sub.ptr.lhs.cast113 = ptrtoint i8* %98 to i64
  %sub.ptr.rhs.cast114 = ptrtoint i8* %100 to i64
  %sub.ptr.sub115 = sub i64 %sub.ptr.lhs.cast113, %sub.ptr.rhs.cast114
  %conv116 = trunc i64 %sub.ptr.sub115 to i32
  %101 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx117 = getelementptr inbounds %struct.site, %struct.site* %101, i64 0
  %ttt118 = getelementptr inbounds %struct.site, %struct.site* %arrayidx117, i32 0, i32 17
  %102 = bitcast %struct.su3_vector* %ttt118 to i8*
  %103 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx119 = getelementptr inbounds %struct.site, %struct.site* %103, i64 0
  %104 = bitcast %struct.site* %arrayidx119 to i8*
  %sub.ptr.lhs.cast120 = ptrtoint i8* %102 to i64
  %sub.ptr.rhs.cast121 = ptrtoint i8* %104 to i64
  %sub.ptr.sub122 = sub i64 %sub.ptr.lhs.cast120, %sub.ptr.rhs.cast121
  %conv123 = trunc i64 %sub.ptr.sub122 to i32
  %105 = load i32, i32* %l_parity, align 4
  %arraydecay124 = getelementptr inbounds [16 x %struct.msg_tag*], [16 x %struct.msg_tag*]* %tags1, i32 0, i32 0
  call void @dslash_fn_special(i32 %conv116, i32 %conv123, i32 %105, %struct.msg_tag** %arraydecay124, i32 0)
  br label %if.end125

if.end125:                                        ; preds = %if.else, %if.then64
  store double 0.000000e+00, double* %pkp, align 8
  %106 = load i32, i32* %l_parity, align 4
  %cmp127 = icmp eq i32 %106, 2
  br i1 %cmp127, label %cond.true129, label %cond.false130

cond.true129:                                     ; preds = %if.end125
  %107 = load i32, i32* @even_sites_on_node, align 4
  br label %cond.end131

cond.false130:                                    ; preds = %if.end125
  %108 = load i32, i32* @sites_on_node, align 4
  br label %cond.end131

cond.end131:                                      ; preds = %cond.false130, %cond.true129
  %cond132 = phi i32 [ %107, %cond.true129 ], [ %108, %cond.false130 ]
  store i32 %cond132, i32* %loopend126, align 4
  %109 = load i32, i32* %l_parity, align 4
  %cmp133 = icmp eq i32 %109, 1
  br i1 %cmp133, label %cond.true135, label %cond.false136

cond.true135:                                     ; preds = %cond.end131
  %110 = load i32, i32* @even_sites_on_node, align 4
  br label %cond.end137

cond.false136:                                    ; preds = %cond.end131
  br label %cond.end137

cond.end137:                                      ; preds = %cond.false136, %cond.true135
  %cond138 = phi i32 [ %110, %cond.true135 ], [ 0, %cond.false136 ]
  store i32 %cond138, i32* %i, align 4
  %111 = load %struct.site*, %struct.site** @lattice, align 8
  %112 = load i32, i32* %i, align 4
  %idxprom139 = sext i32 %112 to i64
  %arrayidx140 = getelementptr inbounds %struct.site, %struct.site* %111, i64 %idxprom139
  store %struct.site* %arrayidx140, %struct.site** %s, align 8
  br label %for.cond141

for.cond141:                                      ; preds = %for.inc153, %cond.end137
  %113 = load i32, i32* %i, align 4
  %114 = load i32, i32* %loopend126, align 4
  %cmp142 = icmp slt i32 %113, %114
  br i1 %cmp142, label %for.body144, label %for.end156

for.body144:                                      ; preds = %for.cond141
  %115 = load %struct.site*, %struct.site** %s, align 8
  %ttt145 = getelementptr inbounds %struct.site, %struct.site* %115, i32 0, i32 17
  %116 = load %struct.site*, %struct.site** %s, align 8
  %cg_p146 = getelementptr inbounds %struct.site, %struct.site* %116, i32 0, i32 15
  %117 = load double, double* %msq_x4, align 8
  %sub147 = fsub double -0.000000e+00, %117
  %118 = load %struct.site*, %struct.site** %s, align 8
  %ttt148 = getelementptr inbounds %struct.site, %struct.site* %118, i32 0, i32 17
  call void @scalar_mult_add_su3_vector(%struct.su3_vector* %ttt145, %struct.su3_vector* %cg_p146, double %sub147, %struct.su3_vector* %ttt148)
  %119 = load %struct.site*, %struct.site** %s, align 8
  %cg_p149 = getelementptr inbounds %struct.site, %struct.site* %119, i32 0, i32 15
  %120 = load %struct.site*, %struct.site** %s, align 8
  %ttt150 = getelementptr inbounds %struct.site, %struct.site* %120, i32 0, i32 17
  %call151 = call double @su3_rdot(%struct.su3_vector* %cg_p149, %struct.su3_vector* %ttt150)
  %121 = load double, double* %pkp, align 8
  %add152 = fadd double %121, %call151
  store double %add152, double* %pkp, align 8
  br label %for.inc153

for.inc153:                                       ; preds = %for.body144
  %122 = load i32, i32* %i, align 4
  %inc154 = add nsw i32 %122, 1
  store i32 %inc154, i32* %i, align 4
  %123 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr155 = getelementptr inbounds %struct.site, %struct.site* %123, i32 1
  store %struct.site* %incdec.ptr155, %struct.site** %s, align 8
  br label %for.cond141

for.end156:                                       ; preds = %for.cond141
  call void @g_doublesum(double* %pkp)
  %124 = load i32, i32* %iteration, align 4
  %inc157 = add nsw i32 %124, 1
  store i32 %inc157, i32* %iteration, align 4
  %125 = load i32, i32* @total_iters, align 4
  %inc158 = add nsw i32 %125, 1
  store i32 %inc158, i32* @total_iters, align 4
  %126 = load double, double* %rsq, align 8
  %sub159 = fsub double -0.000000e+00, %126
  %127 = load double, double* %pkp, align 8
  %div = fdiv double %sub159, %127
  store double %div, double* %a, align 8
  store double 0.000000e+00, double* %rsq, align 8
  %128 = load i32, i32* %l_parity, align 4
  %cmp161 = icmp eq i32 %128, 2
  br i1 %cmp161, label %cond.true163, label %cond.false164

cond.true163:                                     ; preds = %for.end156
  %129 = load i32, i32* @even_sites_on_node, align 4
  br label %cond.end165

cond.false164:                                    ; preds = %for.end156
  %130 = load i32, i32* @sites_on_node, align 4
  br label %cond.end165

cond.end165:                                      ; preds = %cond.false164, %cond.true163
  %cond166 = phi i32 [ %129, %cond.true163 ], [ %130, %cond.false164 ]
  store i32 %cond166, i32* %loopend160, align 4
  %131 = load i32, i32* %l_parity, align 4
  %cmp167 = icmp eq i32 %131, 1
  br i1 %cmp167, label %cond.true169, label %cond.false170

cond.true169:                                     ; preds = %cond.end165
  %132 = load i32, i32* @even_sites_on_node, align 4
  br label %cond.end171

cond.false170:                                    ; preds = %cond.end165
  br label %cond.end171

cond.end171:                                      ; preds = %cond.false170, %cond.true169
  %cond172 = phi i32 [ %132, %cond.true169 ], [ 0, %cond.false170 ]
  store i32 %cond172, i32* %i, align 4
  %133 = load %struct.site*, %struct.site** @lattice, align 8
  %134 = load i32, i32* %i, align 4
  %idxprom173 = sext i32 %134 to i64
  %arrayidx174 = getelementptr inbounds %struct.site, %struct.site* %133, i64 %idxprom173
  store %struct.site* %arrayidx174, %struct.site** %s, align 8
  br label %for.cond175

for.cond175:                                      ; preds = %for.inc190, %cond.end171
  %135 = load i32, i32* %i, align 4
  %136 = load i32, i32* %loopend160, align 4
  %cmp176 = icmp slt i32 %135, %136
  br i1 %cmp176, label %for.body178, label %for.end193

for.body178:                                      ; preds = %for.cond175
  %137 = load %struct.site*, %struct.site** %s, align 8
  %138 = bitcast %struct.site* %137 to i8*
  %139 = load i32, i32* %dest.addr, align 4
  %idx.ext179 = sext i32 %139 to i64
  %add.ptr180 = getelementptr inbounds i8, i8* %138, i64 %idx.ext179
  %140 = bitcast i8* %add.ptr180 to %struct.su3_vector*
  %141 = load %struct.site*, %struct.site** %s, align 8
  %cg_p181 = getelementptr inbounds %struct.site, %struct.site* %141, i32 0, i32 15
  %142 = load double, double* %a, align 8
  %143 = load %struct.site*, %struct.site** %s, align 8
  %144 = bitcast %struct.site* %143 to i8*
  %145 = load i32, i32* %dest.addr, align 4
  %idx.ext182 = sext i32 %145 to i64
  %add.ptr183 = getelementptr inbounds i8, i8* %144, i64 %idx.ext182
  %146 = bitcast i8* %add.ptr183 to %struct.su3_vector*
  call void @scalar_mult_add_su3_vector(%struct.su3_vector* %140, %struct.su3_vector* %cg_p181, double %142, %struct.su3_vector* %146)
  %147 = load %struct.site*, %struct.site** %s, align 8
  %resid184 = getelementptr inbounds %struct.site, %struct.site* %147, i32 0, i32 14
  %148 = load %struct.site*, %struct.site** %s, align 8
  %ttt185 = getelementptr inbounds %struct.site, %struct.site* %148, i32 0, i32 17
  %149 = load double, double* %a, align 8
  %150 = load %struct.site*, %struct.site** %s, align 8
  %resid186 = getelementptr inbounds %struct.site, %struct.site* %150, i32 0, i32 14
  call void @scalar_mult_add_su3_vector(%struct.su3_vector* %resid184, %struct.su3_vector* %ttt185, double %149, %struct.su3_vector* %resid186)
  %151 = load %struct.site*, %struct.site** %s, align 8
  %resid187 = getelementptr inbounds %struct.site, %struct.site* %151, i32 0, i32 14
  %call188 = call double @magsq_su3vec(%struct.su3_vector* %resid187)
  %152 = load double, double* %rsq, align 8
  %add189 = fadd double %152, %call188
  store double %add189, double* %rsq, align 8
  br label %for.inc190

for.inc190:                                       ; preds = %for.body178
  %153 = load i32, i32* %i, align 4
  %inc191 = add nsw i32 %153, 1
  store i32 %inc191, i32* %i, align 4
  %154 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr192 = getelementptr inbounds %struct.site, %struct.site* %154, i32 1
  store %struct.site* %incdec.ptr192, %struct.site** %s, align 8
  br label %for.cond175

for.end193:                                       ; preds = %for.cond175
  call void @g_doublesum(double* %rsq)
  %155 = load double, double* %rsq, align 8
  %156 = load double, double* %rsqstop, align 8
  %cmp194 = fcmp ole double %155, %156
  br i1 %cmp194, label %if.then196, label %if.end207

if.then196:                                       ; preds = %for.end193
  %157 = load i32, i32* %parity.addr, align 4
  %cmp197 = icmp eq i32 %157, 3
  br i1 %cmp197, label %if.then199, label %if.end200

if.then199:                                       ; preds = %if.then196
  store i32 1, i32* %l_parity, align 4
  store i32 2, i32* %l_otherparity, align 4
  store i32 2, i32* %parity.addr, align 4
  store i32 0, i32* %iteration, align 4
  br label %start

if.end200:                                        ; preds = %if.then196
  %158 = load double, double* %rsq, align 8
  %159 = load double*, double** %final_rsq_ptr.addr, align 8
  store double %158, double* %159, align 8
  %160 = load i32, i32* %special_started, align 4
  %cmp201 = icmp eq i32 %160, 1
  br i1 %cmp201, label %if.then203, label %if.end206

if.then203:                                       ; preds = %if.end200
  %arraydecay204 = getelementptr inbounds [16 x %struct.msg_tag*], [16 x %struct.msg_tag*]* %tags1, i32 0, i32 0
  %arraydecay205 = getelementptr inbounds [16 x %struct.msg_tag*], [16 x %struct.msg_tag*]* %tags2, i32 0, i32 0
  call void @cleanup_gathers(%struct.msg_tag** %arraydecay204, %struct.msg_tag** %arraydecay205)
  store i32 0, i32* %special_started, align 4
  br label %if.end206

if.end206:                                        ; preds = %if.then203, %if.end200
  %161 = load i32, i32* %iteration, align 4
  store i32 %161, i32* %retval, align 4
  br label %return

if.end207:                                        ; preds = %for.end193
  %162 = load double, double* %rsq, align 8
  %163 = load double, double* %oldrsq, align 8
  %div208 = fdiv double %162, %163
  store double %div208, double* %b, align 8
  %164 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx209 = getelementptr inbounds %struct.site, %struct.site* %164, i64 0
  %resid210 = getelementptr inbounds %struct.site, %struct.site* %arrayidx209, i32 0, i32 14
  %165 = bitcast %struct.su3_vector* %resid210 to i8*
  %166 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx211 = getelementptr inbounds %struct.site, %struct.site* %166, i64 0
  %167 = bitcast %struct.site* %arrayidx211 to i8*
  %sub.ptr.lhs.cast212 = ptrtoint i8* %165 to i64
  %sub.ptr.rhs.cast213 = ptrtoint i8* %167 to i64
  %sub.ptr.sub214 = sub i64 %sub.ptr.lhs.cast212, %sub.ptr.rhs.cast213
  %conv215 = trunc i64 %sub.ptr.sub214 to i32
  %168 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx216 = getelementptr inbounds %struct.site, %struct.site* %168, i64 0
  %cg_p217 = getelementptr inbounds %struct.site, %struct.site* %arrayidx216, i32 0, i32 15
  %169 = bitcast %struct.su3_vector* %cg_p217 to i8*
  %170 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx218 = getelementptr inbounds %struct.site, %struct.site* %170, i64 0
  %171 = bitcast %struct.site* %arrayidx218 to i8*
  %sub.ptr.lhs.cast219 = ptrtoint i8* %169 to i64
  %sub.ptr.rhs.cast220 = ptrtoint i8* %171 to i64
  %sub.ptr.sub221 = sub i64 %sub.ptr.lhs.cast219, %sub.ptr.rhs.cast220
  %conv222 = trunc i64 %sub.ptr.sub221 to i32
  %172 = load double, double* %b, align 8
  %173 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx223 = getelementptr inbounds %struct.site, %struct.site* %173, i64 0
  %cg_p224 = getelementptr inbounds %struct.site, %struct.site* %arrayidx223, i32 0, i32 15
  %174 = bitcast %struct.su3_vector* %cg_p224 to i8*
  %175 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx225 = getelementptr inbounds %struct.site, %struct.site* %175, i64 0
  %176 = bitcast %struct.site* %arrayidx225 to i8*
  %sub.ptr.lhs.cast226 = ptrtoint i8* %174 to i64
  %sub.ptr.rhs.cast227 = ptrtoint i8* %176 to i64
  %sub.ptr.sub228 = sub i64 %sub.ptr.lhs.cast226, %sub.ptr.rhs.cast227
  %conv229 = trunc i64 %sub.ptr.sub228 to i32
  %177 = load i32, i32* %l_parity, align 4
  call void @scalar_mult_add_latvec(i32 %conv215, i32 %conv222, double %172, i32 %conv229, i32 %177)
  br label %do.cond

do.cond:                                          ; preds = %if.end207
  %178 = load i32, i32* %iteration, align 4
  %179 = load i32, i32* %niter.addr, align 4
  %rem = srem i32 %178, %179
  %cmp230 = icmp ne i32 %rem, 0
  br i1 %cmp230, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %180 = load i32, i32* %iteration, align 4
  %181 = load i32, i32* %niter.addr, align 4
  %mul232 = mul nsw i32 5, %181
  %cmp233 = icmp slt i32 %180, %mul232
  br i1 %cmp233, label %if.then235, label %if.end236

if.then235:                                       ; preds = %do.end
  br label %start

if.end236:                                        ; preds = %do.end
  %182 = load i32, i32* %parity.addr, align 4
  %cmp237 = icmp eq i32 %182, 3
  br i1 %cmp237, label %if.then239, label %if.end240

if.then239:                                       ; preds = %if.end236
  store i32 1, i32* %l_parity, align 4
  store i32 2, i32* %l_otherparity, align 4
  store i32 2, i32* %parity.addr, align 4
  store i32 0, i32* %iteration, align 4
  br label %start

if.end240:                                        ; preds = %if.end236
  %183 = load double, double* %rsq, align 8
  %184 = load double*, double** %final_rsq_ptr.addr, align 8
  store double %183, double* %184, align 8
  %185 = load i32, i32* %special_started, align 4
  %cmp241 = icmp eq i32 %185, 1
  br i1 %cmp241, label %if.then243, label %if.end246

if.then243:                                       ; preds = %if.end240
  %arraydecay244 = getelementptr inbounds [16 x %struct.msg_tag*], [16 x %struct.msg_tag*]* %tags1, i32 0, i32 0
  %arraydecay245 = getelementptr inbounds [16 x %struct.msg_tag*], [16 x %struct.msg_tag*]* %tags2, i32 0, i32 0
  call void @cleanup_gathers(%struct.msg_tag** %arraydecay244, %struct.msg_tag** %arraydecay245)
  store i32 0, i32* %special_started, align 4
  br label %if.end246

if.end246:                                        ; preds = %if.then243, %if.end240
  %186 = load i32, i32* @this_node, align 4
  %cmp247 = icmp eq i32 %186, 0
  br i1 %cmp247, label %if.then249, label %if.end251

if.then249:                                       ; preds = %if.end246
  %187 = load i32, i32* %iteration, align 4
  %188 = load double, double* %rsq, align 8
  %189 = load double, double* %rsqstop, align 8
  %call250 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str, i32 0, i32 0), i32 %187, double %188, double %189)
  br label %if.end251

if.end251:                                        ; preds = %if.then249, %if.end246
  %190 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call252 = call i32 @fflush(%struct._IO_FILE* %190)
  %191 = load i32, i32* %iteration, align 4
  store i32 %191, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end251, %if.end206, %if.end60
  %192 = load i32, i32* %retval, align 4
  ret i32 %192
}

declare dso_local void @load_longlinks(...) #1

declare dso_local void @load_fatlinks(...) #1

declare dso_local void @cleanup_gathers(%struct.msg_tag**, %struct.msg_tag**) #1

declare dso_local void @dslash_fn(i32, i32, i32) #1

declare dso_local void @scalar_mult_add_su3_vector(%struct.su3_vector*, %struct.su3_vector*, double, %struct.su3_vector*) #1

declare dso_local void @add_su3_vector(%struct.su3_vector*, %struct.su3_vector*, %struct.su3_vector*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #2

declare dso_local double @magsq_su3vec(%struct.su3_vector*) #1

declare dso_local void @g_doublesum(double*) #1

declare dso_local void @dslash_fn_special(i32, i32, i32, %struct.msg_tag**, i32) #1

declare dso_local double @su3_rdot(%struct.su3_vector*, %struct.su3_vector*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @scalar_mult_add_latvec(i32 %src1, i32 %src2, double %scalar, i32 %dest, i32 %parity) #0 {
entry:
  %src1.addr = alloca i32, align 4
  %src2.addr = alloca i32, align 4
  %scalar.addr = alloca double, align 8
  %dest.addr = alloca i32, align 4
  %parity.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %s = alloca %struct.site*, align 8
  %spt1 = alloca %struct.su3_vector*, align 8
  %spt2 = alloca %struct.su3_vector*, align 8
  %dpt = alloca %struct.su3_vector*, align 8
  %loopend = alloca i32, align 4
  store i32 %src1, i32* %src1.addr, align 4
  store i32 %src2, i32* %src2.addr, align 4
  store double %scalar, double* %scalar.addr, align 8
  store i32 %dest, i32* %dest.addr, align 4
  store i32 %parity, i32* %parity.addr, align 4
  %0 = load i32, i32* %parity.addr, align 4
  %cmp = icmp eq i32 %0, 2
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* @even_sites_on_node, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, i32* @sites_on_node, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %2, %cond.false ]
  store i32 %cond, i32* %loopend, align 4
  %3 = load i32, i32* %parity.addr, align 4
  %cmp1 = icmp eq i32 %3, 1
  br i1 %cmp1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %cond.end
  %4 = load i32, i32* @even_sites_on_node, align 4
  br label %cond.end4

cond.false3:                                      ; preds = %cond.end
  br label %cond.end4

cond.end4:                                        ; preds = %cond.false3, %cond.true2
  %cond5 = phi i32 [ %4, %cond.true2 ], [ 0, %cond.false3 ]
  store i32 %cond5, i32* %i, align 4
  %5 = load %struct.site*, %struct.site** @lattice, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds %struct.site, %struct.site* %5, i64 %idxprom
  store %struct.site* %arrayidx, %struct.site** %s, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end4
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* %loopend, align 4
  %cmp6 = icmp slt i32 %7, %8
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load %struct.site*, %struct.site** %s, align 8
  %10 = bitcast %struct.site* %9 to i8*
  %11 = load i32, i32* %src1.addr, align 4
  %idx.ext = sext i32 %11 to i64
  %add.ptr = getelementptr inbounds i8, i8* %10, i64 %idx.ext
  %12 = bitcast i8* %add.ptr to %struct.su3_vector*
  store %struct.su3_vector* %12, %struct.su3_vector** %spt1, align 8
  %13 = load %struct.site*, %struct.site** %s, align 8
  %14 = bitcast %struct.site* %13 to i8*
  %15 = load i32, i32* %src2.addr, align 4
  %idx.ext7 = sext i32 %15 to i64
  %add.ptr8 = getelementptr inbounds i8, i8* %14, i64 %idx.ext7
  %16 = bitcast i8* %add.ptr8 to %struct.su3_vector*
  store %struct.su3_vector* %16, %struct.su3_vector** %spt2, align 8
  %17 = load %struct.site*, %struct.site** %s, align 8
  %18 = bitcast %struct.site* %17 to i8*
  %19 = load i32, i32* %dest.addr, align 4
  %idx.ext9 = sext i32 %19 to i64
  %add.ptr10 = getelementptr inbounds i8, i8* %18, i64 %idx.ext9
  %20 = bitcast i8* %add.ptr10 to %struct.su3_vector*
  store %struct.su3_vector* %20, %struct.su3_vector** %dpt, align 8
  %21 = load %struct.su3_vector*, %struct.su3_vector** %spt1, align 8
  %22 = load %struct.su3_vector*, %struct.su3_vector** %spt2, align 8
  %23 = load double, double* %scalar.addr, align 8
  %24 = load %struct.su3_vector*, %struct.su3_vector** %dpt, align 8
  call void @scalar_mult_add_su3_vector(%struct.su3_vector* %21, %struct.su3_vector* %22, double %23, %struct.su3_vector* %24)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %25 = load i32, i32* %i, align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %i, align 4
  %26 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr = getelementptr inbounds %struct.site, %struct.site* %26, i32 1
  store %struct.site* %incdec.ptr, %struct.site** %s, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare dso_local i32 @printf(i8*, ...) #1

declare dso_local i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @clear_latvec(i32 %v, i32 %parity) #0 {
entry:
  %v.addr = alloca i32, align 4
  %parity.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %s = alloca %struct.site*, align 8
  %vv = alloca %struct.su3_vector*, align 8
  store i32 %v, i32* %v.addr, align 4
  store i32 %parity, i32* %parity.addr, align 4
  %0 = load i32, i32* %parity.addr, align 4
  switch i32 %0, label %sw.epilog [
    i32 2, label %sw.bb
    i32 1, label %sw.bb10
    i32 3, label %sw.bb36
  ]

sw.bb:                                            ; preds = %entry
  store i32 0, i32* %i, align 4
  %1 = load %struct.site*, %struct.site** @lattice, align 8
  store %struct.site* %1, %struct.site** %s, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %sw.bb
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* @even_sites_on_node, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  %4 = load %struct.site*, %struct.site** %s, align 8
  %5 = bitcast %struct.site* %4 to i8*
  %6 = load i32, i32* %v.addr, align 4
  %idx.ext = sext i32 %6 to i64
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 %idx.ext
  %7 = bitcast i8* %add.ptr to %struct.su3_vector*
  store %struct.su3_vector* %7, %struct.su3_vector** %vv, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %8 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %8, 3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %9 = load %struct.su3_vector*, %struct.su3_vector** %vv, align 8
  %c = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %9, i32 0, i32 0
  %10 = load i32, i32* %j, align 4
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c, i64 0, i64 %idxprom
  %imag = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx, i32 0, i32 1
  store double 0.000000e+00, double* %imag, align 8
  %11 = load %struct.su3_vector*, %struct.su3_vector** %vv, align 8
  %c4 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %11, i32 0, i32 0
  %12 = load i32, i32* %j, align 4
  %idxprom5 = sext i32 %12 to i64
  %arrayidx6 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c4, i64 0, i64 %idxprom5
  %real = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx6, i32 0, i32 0
  store double 0.000000e+00, double* %real, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %13 = load i32, i32* %j, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %14 = load i32, i32* %i, align 4
  %inc8 = add nsw i32 %14, 1
  store i32 %inc8, i32* %i, align 4
  %15 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr = getelementptr inbounds %struct.site, %struct.site* %15, i32 1
  store %struct.site* %incdec.ptr, %struct.site** %s, align 8
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  br label %sw.epilog

sw.bb10:                                          ; preds = %entry
  %16 = load i32, i32* @even_sites_on_node, align 4
  store i32 %16, i32* %i, align 4
  %17 = load %struct.site*, %struct.site** @lattice, align 8
  %18 = load i32, i32* %i, align 4
  %idxprom11 = sext i32 %18 to i64
  %arrayidx12 = getelementptr inbounds %struct.site, %struct.site* %17, i64 %idxprom11
  store %struct.site* %arrayidx12, %struct.site** %s, align 8
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc32, %sw.bb10
  %19 = load i32, i32* %i, align 4
  %20 = load i32, i32* @sites_on_node, align 4
  %cmp14 = icmp slt i32 %19, %20
  br i1 %cmp14, label %for.body15, label %for.end35

for.body15:                                       ; preds = %for.cond13
  %21 = load %struct.site*, %struct.site** %s, align 8
  %22 = bitcast %struct.site* %21 to i8*
  %23 = load i32, i32* %v.addr, align 4
  %idx.ext16 = sext i32 %23 to i64
  %add.ptr17 = getelementptr inbounds i8, i8* %22, i64 %idx.ext16
  %24 = bitcast i8* %add.ptr17 to %struct.su3_vector*
  store %struct.su3_vector* %24, %struct.su3_vector** %vv, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc29, %for.body15
  %25 = load i32, i32* %j, align 4
  %cmp19 = icmp slt i32 %25, 3
  br i1 %cmp19, label %for.body20, label %for.end31

for.body20:                                       ; preds = %for.cond18
  %26 = load %struct.su3_vector*, %struct.su3_vector** %vv, align 8
  %c21 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %26, i32 0, i32 0
  %27 = load i32, i32* %j, align 4
  %idxprom22 = sext i32 %27 to i64
  %arrayidx23 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c21, i64 0, i64 %idxprom22
  %imag24 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx23, i32 0, i32 1
  store double 0.000000e+00, double* %imag24, align 8
  %28 = load %struct.su3_vector*, %struct.su3_vector** %vv, align 8
  %c25 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %28, i32 0, i32 0
  %29 = load i32, i32* %j, align 4
  %idxprom26 = sext i32 %29 to i64
  %arrayidx27 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c25, i64 0, i64 %idxprom26
  %real28 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx27, i32 0, i32 0
  store double 0.000000e+00, double* %real28, align 8
  br label %for.inc29

for.inc29:                                        ; preds = %for.body20
  %30 = load i32, i32* %j, align 4
  %inc30 = add nsw i32 %30, 1
  store i32 %inc30, i32* %j, align 4
  br label %for.cond18

for.end31:                                        ; preds = %for.cond18
  br label %for.inc32

for.inc32:                                        ; preds = %for.end31
  %31 = load i32, i32* %i, align 4
  %inc33 = add nsw i32 %31, 1
  store i32 %inc33, i32* %i, align 4
  %32 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr34 = getelementptr inbounds %struct.site, %struct.site* %32, i32 1
  store %struct.site* %incdec.ptr34, %struct.site** %s, align 8
  br label %for.cond13

for.end35:                                        ; preds = %for.cond13
  br label %sw.epilog

sw.bb36:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  %33 = load %struct.site*, %struct.site** @lattice, align 8
  store %struct.site* %33, %struct.site** %s, align 8
  br label %for.cond37

for.cond37:                                       ; preds = %for.inc56, %sw.bb36
  %34 = load i32, i32* %i, align 4
  %35 = load i32, i32* @sites_on_node, align 4
  %cmp38 = icmp slt i32 %34, %35
  br i1 %cmp38, label %for.body39, label %for.end59

for.body39:                                       ; preds = %for.cond37
  %36 = load %struct.site*, %struct.site** %s, align 8
  %37 = bitcast %struct.site* %36 to i8*
  %38 = load i32, i32* %v.addr, align 4
  %idx.ext40 = sext i32 %38 to i64
  %add.ptr41 = getelementptr inbounds i8, i8* %37, i64 %idx.ext40
  %39 = bitcast i8* %add.ptr41 to %struct.su3_vector*
  store %struct.su3_vector* %39, %struct.su3_vector** %vv, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond42

for.cond42:                                       ; preds = %for.inc53, %for.body39
  %40 = load i32, i32* %j, align 4
  %cmp43 = icmp slt i32 %40, 3
  br i1 %cmp43, label %for.body44, label %for.end55

for.body44:                                       ; preds = %for.cond42
  %41 = load %struct.su3_vector*, %struct.su3_vector** %vv, align 8
  %c45 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %41, i32 0, i32 0
  %42 = load i32, i32* %j, align 4
  %idxprom46 = sext i32 %42 to i64
  %arrayidx47 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c45, i64 0, i64 %idxprom46
  %imag48 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx47, i32 0, i32 1
  store double 0.000000e+00, double* %imag48, align 8
  %43 = load %struct.su3_vector*, %struct.su3_vector** %vv, align 8
  %c49 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %43, i32 0, i32 0
  %44 = load i32, i32* %j, align 4
  %idxprom50 = sext i32 %44 to i64
  %arrayidx51 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c49, i64 0, i64 %idxprom50
  %real52 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx51, i32 0, i32 0
  store double 0.000000e+00, double* %real52, align 8
  br label %for.inc53

for.inc53:                                        ; preds = %for.body44
  %45 = load i32, i32* %j, align 4
  %inc54 = add nsw i32 %45, 1
  store i32 %inc54, i32* %j, align 4
  br label %for.cond42

for.end55:                                        ; preds = %for.cond42
  br label %for.inc56

for.inc56:                                        ; preds = %for.end55
  %46 = load i32, i32* %i, align 4
  %inc57 = add nsw i32 %46, 1
  store i32 %inc57, i32* %i, align 4
  %47 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr58 = getelementptr inbounds %struct.site, %struct.site* %47, i32 1
  store %struct.site* %incdec.ptr58, %struct.site** %s, align 8
  br label %for.cond37

for.end59:                                        ; preds = %for.cond37
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %for.end59, %for.end35, %for.end9
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @copy_latvec(i32 %src, i32 %dest, i32 %parity) #0 {
entry:
  %src.addr = alloca i32, align 4
  %dest.addr = alloca i32, align 4
  %parity.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %s = alloca %struct.site*, align 8
  %spt = alloca %struct.su3_vector*, align 8
  %dpt = alloca %struct.su3_vector*, align 8
  store i32 %src, i32* %src.addr, align 4
  store i32 %dest, i32* %dest.addr, align 4
  store i32 %parity, i32* %parity.addr, align 4
  %0 = load i32, i32* %parity.addr, align 4
  switch i32 %0, label %sw.epilog [
    i32 2, label %sw.bb
    i32 1, label %sw.bb3
    i32 3, label %sw.bb19
  ]

sw.bb:                                            ; preds = %entry
  store i32 0, i32* %i, align 4
  %1 = load %struct.site*, %struct.site** @lattice, align 8
  store %struct.site* %1, %struct.site** %s, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %sw.bb
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* @even_sites_on_node, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load %struct.site*, %struct.site** @lattice, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds %struct.site, %struct.site* %4, i64 %idxprom
  store %struct.site* %arrayidx, %struct.site** %s, align 8
  %6 = load %struct.site*, %struct.site** %s, align 8
  %7 = bitcast %struct.site* %6 to i8*
  %8 = load i32, i32* %src.addr, align 4
  %idx.ext = sext i32 %8 to i64
  %add.ptr = getelementptr inbounds i8, i8* %7, i64 %idx.ext
  %9 = bitcast i8* %add.ptr to %struct.su3_vector*
  store %struct.su3_vector* %9, %struct.su3_vector** %spt, align 8
  %10 = load %struct.site*, %struct.site** %s, align 8
  %11 = bitcast %struct.site* %10 to i8*
  %12 = load i32, i32* %dest.addr, align 4
  %idx.ext1 = sext i32 %12 to i64
  %add.ptr2 = getelementptr inbounds i8, i8* %11, i64 %idx.ext1
  %13 = bitcast i8* %add.ptr2 to %struct.su3_vector*
  store %struct.su3_vector* %13, %struct.su3_vector** %dpt, align 8
  %14 = load %struct.su3_vector*, %struct.su3_vector** %dpt, align 8
  %15 = load %struct.su3_vector*, %struct.su3_vector** %spt, align 8
  %16 = bitcast %struct.su3_vector* %14 to i8*
  %17 = bitcast %struct.su3_vector* %15 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %16, i8* align 8 %17, i64 48, i1 false)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32, i32* %i, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %i, align 4
  %19 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr = getelementptr inbounds %struct.site, %struct.site* %19, i32 1
  store %struct.site* %incdec.ptr, %struct.site** %s, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %20 = load i32, i32* @even_sites_on_node, align 4
  store i32 %20, i32* %i, align 4
  %21 = load %struct.site*, %struct.site** @lattice, align 8
  %22 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %22 to i64
  %arrayidx5 = getelementptr inbounds %struct.site, %struct.site* %21, i64 %idxprom4
  store %struct.site* %arrayidx5, %struct.site** %s, align 8
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc15, %sw.bb3
  %23 = load i32, i32* %i, align 4
  %24 = load i32, i32* @sites_on_node, align 4
  %cmp7 = icmp slt i32 %23, %24
  br i1 %cmp7, label %for.body8, label %for.end18

for.body8:                                        ; preds = %for.cond6
  %25 = load %struct.site*, %struct.site** @lattice, align 8
  %26 = load i32, i32* %i, align 4
  %idxprom9 = sext i32 %26 to i64
  %arrayidx10 = getelementptr inbounds %struct.site, %struct.site* %25, i64 %idxprom9
  store %struct.site* %arrayidx10, %struct.site** %s, align 8
  %27 = load %struct.site*, %struct.site** %s, align 8
  %28 = bitcast %struct.site* %27 to i8*
  %29 = load i32, i32* %src.addr, align 4
  %idx.ext11 = sext i32 %29 to i64
  %add.ptr12 = getelementptr inbounds i8, i8* %28, i64 %idx.ext11
  %30 = bitcast i8* %add.ptr12 to %struct.su3_vector*
  store %struct.su3_vector* %30, %struct.su3_vector** %spt, align 8
  %31 = load %struct.site*, %struct.site** %s, align 8
  %32 = bitcast %struct.site* %31 to i8*
  %33 = load i32, i32* %dest.addr, align 4
  %idx.ext13 = sext i32 %33 to i64
  %add.ptr14 = getelementptr inbounds i8, i8* %32, i64 %idx.ext13
  %34 = bitcast i8* %add.ptr14 to %struct.su3_vector*
  store %struct.su3_vector* %34, %struct.su3_vector** %dpt, align 8
  %35 = load %struct.su3_vector*, %struct.su3_vector** %dpt, align 8
  %36 = load %struct.su3_vector*, %struct.su3_vector** %spt, align 8
  %37 = bitcast %struct.su3_vector* %35 to i8*
  %38 = bitcast %struct.su3_vector* %36 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %37, i8* align 8 %38, i64 48, i1 false)
  br label %for.inc15

for.inc15:                                        ; preds = %for.body8
  %39 = load i32, i32* %i, align 4
  %inc16 = add nsw i32 %39, 1
  store i32 %inc16, i32* %i, align 4
  %40 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr17 = getelementptr inbounds %struct.site, %struct.site* %40, i32 1
  store %struct.site* %incdec.ptr17, %struct.site** %s, align 8
  br label %for.cond6

for.end18:                                        ; preds = %for.cond6
  br label %sw.epilog

sw.bb19:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  %41 = load %struct.site*, %struct.site** @lattice, align 8
  store %struct.site* %41, %struct.site** %s, align 8
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc29, %sw.bb19
  %42 = load i32, i32* %i, align 4
  %43 = load i32, i32* @sites_on_node, align 4
  %cmp21 = icmp slt i32 %42, %43
  br i1 %cmp21, label %for.body22, label %for.end32

for.body22:                                       ; preds = %for.cond20
  %44 = load %struct.site*, %struct.site** @lattice, align 8
  %45 = load i32, i32* %i, align 4
  %idxprom23 = sext i32 %45 to i64
  %arrayidx24 = getelementptr inbounds %struct.site, %struct.site* %44, i64 %idxprom23
  store %struct.site* %arrayidx24, %struct.site** %s, align 8
  %46 = load %struct.site*, %struct.site** %s, align 8
  %47 = bitcast %struct.site* %46 to i8*
  %48 = load i32, i32* %src.addr, align 4
  %idx.ext25 = sext i32 %48 to i64
  %add.ptr26 = getelementptr inbounds i8, i8* %47, i64 %idx.ext25
  %49 = bitcast i8* %add.ptr26 to %struct.su3_vector*
  store %struct.su3_vector* %49, %struct.su3_vector** %spt, align 8
  %50 = load %struct.site*, %struct.site** %s, align 8
  %51 = bitcast %struct.site* %50 to i8*
  %52 = load i32, i32* %dest.addr, align 4
  %idx.ext27 = sext i32 %52 to i64
  %add.ptr28 = getelementptr inbounds i8, i8* %51, i64 %idx.ext27
  %53 = bitcast i8* %add.ptr28 to %struct.su3_vector*
  store %struct.su3_vector* %53, %struct.su3_vector** %dpt, align 8
  %54 = load %struct.su3_vector*, %struct.su3_vector** %dpt, align 8
  %55 = load %struct.su3_vector*, %struct.su3_vector** %spt, align 8
  %56 = bitcast %struct.su3_vector* %54 to i8*
  %57 = bitcast %struct.su3_vector* %55 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %56, i8* align 8 %57, i64 48, i1 false)
  br label %for.inc29

for.inc29:                                        ; preds = %for.body22
  %58 = load i32, i32* %i, align 4
  %inc30 = add nsw i32 %58, 1
  store i32 %inc30, i32* %i, align 4
  %59 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr31 = getelementptr inbounds %struct.site, %struct.site* %59, i32 1
  store %struct.site* %incdec.ptr31, %struct.site** %s, align 8
  br label %for.cond20

for.end32:                                        ; preds = %for.cond20
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %for.end32, %for.end18, %for.end
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @scalar2_mult_add_su3_vector(%struct.su3_vector* %a, double %s1, %struct.su3_vector* %b, double %s2, %struct.su3_vector* %c) #0 {
entry:
  %a.addr = alloca %struct.su3_vector*, align 8
  %s1.addr = alloca double, align 8
  %b.addr = alloca %struct.su3_vector*, align 8
  %s2.addr = alloca double, align 8
  %c.addr = alloca %struct.su3_vector*, align 8
  %i = alloca i32, align 4
  store %struct.su3_vector* %a, %struct.su3_vector** %a.addr, align 8
  store double %s1, double* %s1.addr, align 8
  store %struct.su3_vector* %b, %struct.su3_vector** %b.addr, align 8
  store double %s2, double* %s2.addr, align 8
  store %struct.su3_vector* %c, %struct.su3_vector** %c.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load double, double* %s1.addr, align 8
  %2 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c1 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %2, i32 0, i32 0
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c1, i64 0, i64 %idxprom
  %real = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx, i32 0, i32 0
  %4 = load double, double* %real, align 8
  %mul = fmul double %1, %4
  %5 = load double, double* %s2.addr, align 8
  %6 = load %struct.su3_vector*, %struct.su3_vector** %b.addr, align 8
  %c2 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %6, i32 0, i32 0
  %7 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %7 to i64
  %arrayidx4 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c2, i64 0, i64 %idxprom3
  %real5 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx4, i32 0, i32 0
  %8 = load double, double* %real5, align 8
  %mul6 = fmul double %5, %8
  %add = fadd double %mul, %mul6
  %9 = load %struct.su3_vector*, %struct.su3_vector** %c.addr, align 8
  %c7 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %9, i32 0, i32 0
  %10 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %10 to i64
  %arrayidx9 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c7, i64 0, i64 %idxprom8
  %real10 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx9, i32 0, i32 0
  store double %add, double* %real10, align 8
  %11 = load double, double* %s1.addr, align 8
  %12 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c11 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %12, i32 0, i32 0
  %13 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %13 to i64
  %arrayidx13 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c11, i64 0, i64 %idxprom12
  %imag = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx13, i32 0, i32 1
  %14 = load double, double* %imag, align 8
  %mul14 = fmul double %11, %14
  %15 = load double, double* %s2.addr, align 8
  %16 = load %struct.su3_vector*, %struct.su3_vector** %b.addr, align 8
  %c15 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %16, i32 0, i32 0
  %17 = load i32, i32* %i, align 4
  %idxprom16 = sext i32 %17 to i64
  %arrayidx17 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c15, i64 0, i64 %idxprom16
  %imag18 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx17, i32 0, i32 1
  %18 = load double, double* %imag18, align 8
  %mul19 = fmul double %15, %18
  %add20 = fadd double %mul14, %mul19
  %19 = load %struct.su3_vector*, %struct.su3_vector** %c.addr, align 8
  %c21 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %19, i32 0, i32 0
  %20 = load i32, i32* %i, align 4
  %idxprom22 = sext i32 %20 to i64
  %arrayidx23 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c21, i64 0, i64 %idxprom22
  %imag24 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx23, i32 0, i32 1
  store double %add20, double* %imag24, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @scalar2_mult_add_latvec(i32 %src1, double %scalar1, i32 %src2, double %scalar2, i32 %dest, i32 %parity) #0 {
entry:
  %src1.addr = alloca i32, align 4
  %scalar1.addr = alloca double, align 8
  %src2.addr = alloca i32, align 4
  %scalar2.addr = alloca double, align 8
  %dest.addr = alloca i32, align 4
  %parity.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %s = alloca %struct.site*, align 8
  %spt1 = alloca %struct.su3_vector*, align 8
  %spt2 = alloca %struct.su3_vector*, align 8
  %dpt = alloca %struct.su3_vector*, align 8
  %loopend = alloca i32, align 4
  store i32 %src1, i32* %src1.addr, align 4
  store double %scalar1, double* %scalar1.addr, align 8
  store i32 %src2, i32* %src2.addr, align 4
  store double %scalar2, double* %scalar2.addr, align 8
  store i32 %dest, i32* %dest.addr, align 4
  store i32 %parity, i32* %parity.addr, align 4
  %0 = load i32, i32* %parity.addr, align 4
  %cmp = icmp eq i32 %0, 2
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* @even_sites_on_node, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, i32* @sites_on_node, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %2, %cond.false ]
  store i32 %cond, i32* %loopend, align 4
  %3 = load i32, i32* %parity.addr, align 4
  %cmp1 = icmp eq i32 %3, 1
  br i1 %cmp1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %cond.end
  %4 = load i32, i32* @even_sites_on_node, align 4
  br label %cond.end4

cond.false3:                                      ; preds = %cond.end
  br label %cond.end4

cond.end4:                                        ; preds = %cond.false3, %cond.true2
  %cond5 = phi i32 [ %4, %cond.true2 ], [ 0, %cond.false3 ]
  store i32 %cond5, i32* %i, align 4
  %5 = load %struct.site*, %struct.site** @lattice, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds %struct.site, %struct.site* %5, i64 %idxprom
  store %struct.site* %arrayidx, %struct.site** %s, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end4
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* %loopend, align 4
  %cmp6 = icmp slt i32 %7, %8
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load %struct.site*, %struct.site** %s, align 8
  %10 = bitcast %struct.site* %9 to i8*
  %11 = load i32, i32* %src1.addr, align 4
  %idx.ext = sext i32 %11 to i64
  %add.ptr = getelementptr inbounds i8, i8* %10, i64 %idx.ext
  %12 = bitcast i8* %add.ptr to %struct.su3_vector*
  store %struct.su3_vector* %12, %struct.su3_vector** %spt1, align 8
  %13 = load %struct.site*, %struct.site** %s, align 8
  %14 = bitcast %struct.site* %13 to i8*
  %15 = load i32, i32* %src2.addr, align 4
  %idx.ext7 = sext i32 %15 to i64
  %add.ptr8 = getelementptr inbounds i8, i8* %14, i64 %idx.ext7
  %16 = bitcast i8* %add.ptr8 to %struct.su3_vector*
  store %struct.su3_vector* %16, %struct.su3_vector** %spt2, align 8
  %17 = load %struct.site*, %struct.site** %s, align 8
  %18 = bitcast %struct.site* %17 to i8*
  %19 = load i32, i32* %dest.addr, align 4
  %idx.ext9 = sext i32 %19 to i64
  %add.ptr10 = getelementptr inbounds i8, i8* %18, i64 %idx.ext9
  %20 = bitcast i8* %add.ptr10 to %struct.su3_vector*
  store %struct.su3_vector* %20, %struct.su3_vector** %dpt, align 8
  %21 = load %struct.su3_vector*, %struct.su3_vector** %spt1, align 8
  %22 = load double, double* %scalar1.addr, align 8
  %23 = load %struct.su3_vector*, %struct.su3_vector** %spt2, align 8
  %24 = load double, double* %scalar2.addr, align 8
  %25 = load %struct.su3_vector*, %struct.su3_vector** %dpt, align 8
  call void @scalar2_mult_add_su3_vector(%struct.su3_vector* %21, double %22, %struct.su3_vector* %23, double %24, %struct.su3_vector* %25)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %26 = load i32, i32* %i, align 4
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* %i, align 4
  %27 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr = getelementptr inbounds %struct.site, %struct.site* %27, i32 1
  store %struct.site* %incdec.ptr, %struct.site** %s, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @scalar_mult_latvec(i32 %src, double %scalar, i32 %dest, i32 %parity) #0 {
entry:
  %src.addr = alloca i32, align 4
  %scalar.addr = alloca double, align 8
  %dest.addr = alloca i32, align 4
  %parity.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %s = alloca %struct.site*, align 8
  %spt = alloca %struct.su3_vector*, align 8
  %dpt = alloca %struct.su3_vector*, align 8
  store i32 %src, i32* %src.addr, align 4
  store double %scalar, double* %scalar.addr, align 8
  store i32 %dest, i32* %dest.addr, align 4
  store i32 %parity, i32* %parity.addr, align 4
  %0 = load i32, i32* %parity.addr, align 4
  switch i32 %0, label %sw.epilog [
    i32 2, label %sw.bb
    i32 1, label %sw.bb3
    i32 3, label %sw.bb15
  ]

sw.bb:                                            ; preds = %entry
  store i32 0, i32* %i, align 4
  %1 = load %struct.site*, %struct.site** @lattice, align 8
  store %struct.site* %1, %struct.site** %s, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %sw.bb
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* @even_sites_on_node, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load %struct.site*, %struct.site** %s, align 8
  %5 = bitcast %struct.site* %4 to i8*
  %6 = load i32, i32* %src.addr, align 4
  %idx.ext = sext i32 %6 to i64
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 %idx.ext
  %7 = bitcast i8* %add.ptr to %struct.su3_vector*
  store %struct.su3_vector* %7, %struct.su3_vector** %spt, align 8
  %8 = load %struct.site*, %struct.site** %s, align 8
  %9 = bitcast %struct.site* %8 to i8*
  %10 = load i32, i32* %dest.addr, align 4
  %idx.ext1 = sext i32 %10 to i64
  %add.ptr2 = getelementptr inbounds i8, i8* %9, i64 %idx.ext1
  %11 = bitcast i8* %add.ptr2 to %struct.su3_vector*
  store %struct.su3_vector* %11, %struct.su3_vector** %dpt, align 8
  %12 = load %struct.su3_vector*, %struct.su3_vector** %spt, align 8
  %13 = load double, double* %scalar.addr, align 8
  %14 = load %struct.su3_vector*, %struct.su3_vector** %dpt, align 8
  call void @scalar_mult_su3_vector(%struct.su3_vector* %12, double %13, %struct.su3_vector* %14)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %i, align 4
  %16 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr = getelementptr inbounds %struct.site, %struct.site* %16, i32 1
  store %struct.site* %incdec.ptr, %struct.site** %s, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %17 = load i32, i32* @even_sites_on_node, align 4
  store i32 %17, i32* %i, align 4
  %18 = load %struct.site*, %struct.site** @lattice, align 8
  %19 = load i32, i32* %i, align 4
  %idxprom = sext i32 %19 to i64
  %arrayidx = getelementptr inbounds %struct.site, %struct.site* %18, i64 %idxprom
  store %struct.site* %arrayidx, %struct.site** %s, align 8
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc11, %sw.bb3
  %20 = load i32, i32* %i, align 4
  %21 = load i32, i32* @sites_on_node, align 4
  %cmp5 = icmp slt i32 %20, %21
  br i1 %cmp5, label %for.body6, label %for.end14

for.body6:                                        ; preds = %for.cond4
  %22 = load %struct.site*, %struct.site** %s, align 8
  %23 = bitcast %struct.site* %22 to i8*
  %24 = load i32, i32* %src.addr, align 4
  %idx.ext7 = sext i32 %24 to i64
  %add.ptr8 = getelementptr inbounds i8, i8* %23, i64 %idx.ext7
  %25 = bitcast i8* %add.ptr8 to %struct.su3_vector*
  store %struct.su3_vector* %25, %struct.su3_vector** %spt, align 8
  %26 = load %struct.site*, %struct.site** %s, align 8
  %27 = bitcast %struct.site* %26 to i8*
  %28 = load i32, i32* %dest.addr, align 4
  %idx.ext9 = sext i32 %28 to i64
  %add.ptr10 = getelementptr inbounds i8, i8* %27, i64 %idx.ext9
  %29 = bitcast i8* %add.ptr10 to %struct.su3_vector*
  store %struct.su3_vector* %29, %struct.su3_vector** %dpt, align 8
  %30 = load %struct.su3_vector*, %struct.su3_vector** %spt, align 8
  %31 = load double, double* %scalar.addr, align 8
  %32 = load %struct.su3_vector*, %struct.su3_vector** %dpt, align 8
  call void @scalar_mult_su3_vector(%struct.su3_vector* %30, double %31, %struct.su3_vector* %32)
  br label %for.inc11

for.inc11:                                        ; preds = %for.body6
  %33 = load i32, i32* %i, align 4
  %inc12 = add nsw i32 %33, 1
  store i32 %inc12, i32* %i, align 4
  %34 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr13 = getelementptr inbounds %struct.site, %struct.site* %34, i32 1
  store %struct.site* %incdec.ptr13, %struct.site** %s, align 8
  br label %for.cond4

for.end14:                                        ; preds = %for.cond4
  br label %sw.epilog

sw.bb15:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  %35 = load %struct.site*, %struct.site** @lattice, align 8
  store %struct.site* %35, %struct.site** %s, align 8
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc23, %sw.bb15
  %36 = load i32, i32* %i, align 4
  %37 = load i32, i32* @sites_on_node, align 4
  %cmp17 = icmp slt i32 %36, %37
  br i1 %cmp17, label %for.body18, label %for.end26

for.body18:                                       ; preds = %for.cond16
  %38 = load %struct.site*, %struct.site** %s, align 8
  %39 = bitcast %struct.site* %38 to i8*
  %40 = load i32, i32* %src.addr, align 4
  %idx.ext19 = sext i32 %40 to i64
  %add.ptr20 = getelementptr inbounds i8, i8* %39, i64 %idx.ext19
  %41 = bitcast i8* %add.ptr20 to %struct.su3_vector*
  store %struct.su3_vector* %41, %struct.su3_vector** %spt, align 8
  %42 = load %struct.site*, %struct.site** %s, align 8
  %43 = bitcast %struct.site* %42 to i8*
  %44 = load i32, i32* %dest.addr, align 4
  %idx.ext21 = sext i32 %44 to i64
  %add.ptr22 = getelementptr inbounds i8, i8* %43, i64 %idx.ext21
  %45 = bitcast i8* %add.ptr22 to %struct.su3_vector*
  store %struct.su3_vector* %45, %struct.su3_vector** %dpt, align 8
  %46 = load %struct.su3_vector*, %struct.su3_vector** %spt, align 8
  %47 = load double, double* %scalar.addr, align 8
  %48 = load %struct.su3_vector*, %struct.su3_vector** %dpt, align 8
  call void @scalar_mult_su3_vector(%struct.su3_vector* %46, double %47, %struct.su3_vector* %48)
  br label %for.inc23

for.inc23:                                        ; preds = %for.body18
  %49 = load i32, i32* %i, align 4
  %inc24 = add nsw i32 %49, 1
  store i32 %inc24, i32* %i, align 4
  %50 = load %struct.site*, %struct.site** %s, align 8
  %incdec.ptr25 = getelementptr inbounds %struct.site, %struct.site* %50, i32 1
  store %struct.site* %incdec.ptr25, %struct.site** %s, align 8
  br label %for.cond16

for.end26:                                        ; preds = %for.cond16
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %for.end26, %for.end14, %for.end
  ret void
}

declare dso_local void @scalar_mult_su3_vector(%struct.su3_vector*, double, %struct.su3_vector*) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
