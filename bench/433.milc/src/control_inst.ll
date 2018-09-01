; ModuleID = 'control_inst.bc'
source_filename = "control.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.site = type { i16, i16, i16, i16, i8, i32, %struct.double_prn, i32, [4 x %struct.su3_matrix], [4 x %struct.anti_hermitmat], [4 x double], %struct.su3_vector, %struct.su3_vector, %struct.su3_vector, %struct.su3_vector, %struct.su3_vector, %struct.su3_vector, [4 x %struct.su3_vector], %struct.su3_matrix, %struct.su3_matrix }
%struct.double_prn = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, double }
%struct.anti_hermitmat = type { %struct.complex, %struct.complex, %struct.complex, double, double, double, double }
%struct.complex = type { double, double }
%struct.su3_vector = type { [3 x %struct.complex] }
%struct.su3_matrix = type { [3 x [3 x %struct.complex]] }
%struct.gauge_file = type { %struct._IO_FILE*, %struct.gauge_header*, i8*, i32, i32*, i32, %struct.gauge_check }
%struct.gauge_header = type { i32, [64 x i8], [4 x i32], i32, i32 }
%struct.gauge_check = type { i32, i32 }

@.str = private unnamed_addr constant [13 x i8] c"magic_number\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"time_stamp\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"checksums\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"nx\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"ny\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"nz\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"nt\00", align 1
@.str.7 = private unnamed_addr constant [19 x i8] c"action.description\00", align 1
@.str.8 = private unnamed_addr constant [18 x i8] c"gauge.description\00", align 1
@.str.9 = private unnamed_addr constant [13 x i8] c"gauge.beta11\00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"gauge.beta12\00", align 1
@.str.11 = private unnamed_addr constant [17 x i8] c"gauge.tadpole.u0\00", align 1
@.str.12 = private unnamed_addr constant [13 x i8] c"gauge.nloops\00", align 1
@.str.13 = private unnamed_addr constant [12 x i8] c"gauge.nreps\00", align 1
@.str.14 = private unnamed_addr constant [24 x i8] c"gauge.previous.filename\00", align 1
@.str.15 = private unnamed_addr constant [26 x i8] c"gauge.previous.time_stamp\00", align 1
@.str.16 = private unnamed_addr constant [25 x i8] c"gauge.previous.checksums\00", align 1
@.str.17 = private unnamed_addr constant [22 x i8] c"gauge.fix.description\00", align 1
@.str.18 = private unnamed_addr constant [20 x i8] c"gauge.fix.tolerance\00", align 1
@.str.19 = private unnamed_addr constant [24 x i8] c"gauge.smear.description\00", align 1
@.str.20 = private unnamed_addr constant [18 x i8] c"gauge.smear.steps\00", align 1
@.str.21 = private unnamed_addr constant [19 x i8] c"gauge.smear.factor\00", align 1
@.str.22 = private unnamed_addr constant [18 x i8] c"quark.description\00", align 1
@.str.23 = private unnamed_addr constant [14 x i8] c"quark.flavors\00", align 1
@.str.24 = private unnamed_addr constant [15 x i8] c"quark.flavors1\00", align 1
@.str.25 = private unnamed_addr constant [15 x i8] c"quark.flavors2\00", align 1
@.str.26 = private unnamed_addr constant [11 x i8] c"quark.mass\00", align 1
@.str.27 = private unnamed_addr constant [12 x i8] c"quark.mass1\00", align 1
@.str.28 = private unnamed_addr constant [12 x i8] c"quark.mass2\00", align 1
@.str.29 = private unnamed_addr constant [12 x i8] c"quark.kappa\00", align 1
@.str.30 = private unnamed_addr constant [14 x i8] c"quark.link.c1\00", align 1
@.str.31 = private unnamed_addr constant [14 x i8] c"quark.link.c3\00", align 1
@.str.32 = private unnamed_addr constant [16 x i8] c"quark.staple.w3\00", align 1
@.str.33 = private unnamed_addr constant [16 x i8] c"quark.clover.c0\00", align 1
@.str.34 = private unnamed_addr constant [16 x i8] c"quark.clover.u0\00", align 1
@.str.35 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@gauge_info_keyword = dso_local global [36 x i8*] [i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.29, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.31, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.32, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.34, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.35, i32 0, i32 0)], align 16
@warms = common dso_local global i32 0, align 4
@this_node = common dso_local global i32 0, align 4
@.str.36 = private unnamed_addr constant [19 x i8] c"WARMUPS COMPLETED\0A\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8
@trajecs = common dso_local global i32 0, align 4
@propinterval = common dso_local global i32 0, align 4
@lattice = common dso_local global %struct.site* null, align 8
@mass = common dso_local global double 0.000000e+00, align 8
@.str.37 = private unnamed_addr constant [19 x i8] c"RUNNING COMPLETED\0A\00", align 1
@.str.38 = private unnamed_addr constant [31 x i8] c"average cg iters for step= %e\0A\00", align 1
@.str.39 = private unnamed_addr constant [18 x i8] c"total_iters = %d\0A\00", align 1
@total_iters = common dso_local global i32 0, align 4
@saveflag = common dso_local global i32 0, align 4
@savefile = common dso_local global [256 x i8] zeroinitializer, align 16
@ensemble_id = common dso_local global [256 x i8] zeroinitializer, align 16
@sequence_number = common dso_local global i32 0, align 4
@nx = common dso_local global i32 0, align 4
@ny = common dso_local global i32 0, align 4
@nz = common dso_local global i32 0, align 4
@nt = common dso_local global i32 0, align 4
@volume = common dso_local global i32 0, align 4
@iseed = common dso_local global i32 0, align 4
@steps = common dso_local global i32 0, align 4
@niter = common dso_local global i32 0, align 4
@nflavors = common dso_local global i32 0, align 4
@epsilon = common dso_local global double 0.000000e+00, align 8
@beta = common dso_local global double 0.000000e+00, align 8
@u0 = common dso_local global double 0.000000e+00, align 8
@rsqmin = common dso_local global double 0.000000e+00, align 8
@rsqprop = common dso_local global double 0.000000e+00, align 8
@startflag = common dso_local global i32 0, align 4
@startfile = common dso_local global [256 x i8] zeroinitializer, align 16
@phases_in = common dso_local global i32 0, align 4
@source_start = common dso_local global i32 0, align 4
@source_inc = common dso_local global i32 0, align 4
@n_sources = common dso_local global i32 0, align 4
@sites_on_node = common dso_local global i32 0, align 4
@even_sites_on_node = common dso_local global i32 0, align 4
@odd_sites_on_node = common dso_local global i32 0, align 4
@number_of_nodes = common dso_local global i32 0, align 4
@valid_longlinks = common dso_local global i32 0, align 4
@valid_fatlinks = common dso_local global i32 0, align 4
@startlat_p = common dso_local global %struct.gauge_file* null, align 8
@node_prn = common dso_local global %struct.double_prn zeroinitializer, align 8
@gen_pt = common dso_local global [16 x i8**] zeroinitializer, align 16
@start_lat_hdr = common dso_local global %struct.gauge_header zeroinitializer, align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %0 = bitcast i8* null to i8*
  %1 = bitcast i32 (i32, i8**)* @main to i8*
  %2 = call i64 @getAddr(i8* %1)
  call void @funcInit(i64 %2)
  %retval = alloca i32, align 4
  %3 = bitcast i32* %retval to i8*
  %4 = call i64 @getAddr(i8* %3)
  call void @handleAlloca(i64 %4)
  %argc.addr = alloca i32, align 4
  %5 = bitcast i32* %argc.addr to i8*
  %6 = call i64 @getAddr(i8* %5)
  call void @handleAlloca(i64 %6)
  %argv.addr = alloca i8**, align 8
  %7 = bitcast i8*** %argv.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  call void @handleAlloca(i64 %8)
  %meascount = alloca i32, align 4
  %9 = bitcast i32* %meascount to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void @handleAlloca(i64 %10)
  %traj_done = alloca i32, align 4
  %11 = bitcast i32* %traj_done to i8*
  %12 = call i64 @getAddr(i8* %11)
  call void @handleAlloca(i64 %12)
  %prompt = alloca i32, align 4
  %13 = bitcast i32* %prompt to i8*
  %14 = call i64 @getAddr(i8* %13)
  call void @handleAlloca(i64 %14)
  %s_iters = alloca i32, align 4
  %15 = bitcast i32* %s_iters to i8*
  %16 = call i64 @getAddr(i8* %15)
  call void @handleAlloca(i64 %16)
  %avs_iters = alloca i32, align 4
  %17 = bitcast i32* %avs_iters to i8*
  %18 = call i64 @getAddr(i8* %17)
  call void @handleAlloca(i64 %18)
  %avspect_iters = alloca i32, align 4
  %19 = bitcast i32* %avspect_iters to i8*
  %20 = call i64 @getAddr(i8* %19)
  call void @handleAlloca(i64 %20)
  %avbcorr_iters = alloca i32, align 4
  %21 = bitcast i32* %avbcorr_iters to i8*
  %22 = call i64 @getAddr(i8* %21)
  call void @handleAlloca(i64 %22)
  %dtime = alloca double, align 8
  %23 = bitcast double* %dtime to i8*
  %24 = call i64 @getAddr(i8* %23)
  call void @handleAlloca(i64 %24)
  %25 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %26 = bitcast i32* %argc.addr to i8*
  store i32 %argc, i32* %argc.addr, align 4
  %27 = bitcast i8*** %argv.addr to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = bitcast i8** %argv to i8*
  %30 = call i64 @getAddr(i8* %29)
  call void @setRealTemp(i64 %28, i64 %30)
  store i8** %argv, i8*** %argv.addr, align 8
  %31 = bitcast i32* %argc.addr to i8*
  %32 = call i64 @getAddr(i8* %31)
  %33 = load i32, i32* %argc.addr, align 4
  %34 = bitcast i8*** %argv.addr to i8*
  %35 = call i64 @getAddr(i8* %34)
  %36 = load i8**, i8*** %argv.addr, align 8
  %37 = bitcast void (i32, i8**)* @initialize_machine to i8*
  %38 = call i64 @getAddr(i8* %37)
  call void @addFunArg(i32 0, i64 %38, i64 %32)
  call void @initialize_machine(i32 %33, i8** %36)
  call void (...) @g_sync()
  %call = call i32 (...) @setup()
  %39 = bitcast i32* %prompt to i8*
  store i32 %call, i32* %prompt, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end57, %entry
  %40 = bitcast i32* %prompt to i8*
  %41 = call i64 @getAddr(i8* %40)
  %42 = load i32, i32* %prompt, align 4
  %43 = bitcast i32 (i32)* @readin to i8*
  %44 = call i64 @getAddr(i8* %43)
  call void @addFunArg(i32 0, i64 %44, i64 %41)
  %call1 = call i32 @readin(i32 %42)
  %cmp = icmp eq i32 %call1, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call2 = call double (...) @dclock()
  %sub = fsub double -0.000000e+00, %call2
  %45 = bitcast double* %dtime to i8*
  %46 = call i64 @getAddr(i8* %45)
  store double %sub, double* %dtime, align 8
  %47 = bitcast i32* %traj_done to i8*
  store i32 0, i32* %traj_done, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.body
  %48 = bitcast i32* %traj_done to i8*
  %49 = call i64 @getAddr(i8* %48)
  %50 = load i32, i32* %traj_done, align 4
  %51 = bitcast i32* @warms to i8*
  %52 = call i64 @getAddr(i8* %51)
  %53 = load i32, i32* @warms, align 4
  %cmp3 = icmp slt i32 %50, %53
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call4 = call i32 (...) @update()
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %54 = bitcast i32* %traj_done to i8*
  %55 = call i64 @getAddr(i8* %54)
  %56 = load i32, i32* %traj_done, align 4
  %inc = add nsw i32 %56, 1
  %57 = bitcast i32* %traj_done to i8*
  store i32 %inc, i32* %traj_done, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %58 = bitcast i32* @this_node to i8*
  %59 = call i64 @getAddr(i8* %58)
  %60 = load i32, i32* @this_node, align 4
  %cmp5 = icmp eq i32 %60, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.36, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  %61 = bitcast %struct._IO_FILE** @stdout to i8*
  %62 = call i64 @getAddr(i8* %61)
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call7 = call i32 @fflush(%struct._IO_FILE* %63)
  %64 = bitcast i32* %meascount to i8*
  store i32 0, i32* %meascount, align 4
  %65 = bitcast i32* %avbcorr_iters to i8*
  store i32 0, i32* %avbcorr_iters, align 4
  %66 = bitcast i32* %avs_iters to i8*
  store i32 0, i32* %avs_iters, align 4
  %67 = bitcast i32* %avspect_iters to i8*
  store i32 0, i32* %avspect_iters, align 4
  %68 = bitcast i32* %traj_done to i8*
  store i32 0, i32* %traj_done, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc25, %if.end
  %69 = bitcast i32* %traj_done to i8*
  %70 = call i64 @getAddr(i8* %69)
  %71 = load i32, i32* %traj_done, align 4
  %72 = bitcast i32* @trajecs to i8*
  %73 = call i64 @getAddr(i8* %72)
  %74 = load i32, i32* @trajecs, align 4
  %cmp9 = icmp slt i32 %71, %74
  br i1 %cmp9, label %for.body10, label %for.end27

for.body10:                                       ; preds = %for.cond8
  %call11 = call i32 (...) @update()
  %75 = bitcast i32* %s_iters to i8*
  store i32 %call11, i32* %s_iters, align 4
  %76 = bitcast i32* %traj_done to i8*
  %77 = call i64 @getAddr(i8* %76)
  %78 = load i32, i32* %traj_done, align 4
  %79 = bitcast i32* @propinterval to i8*
  %80 = call i64 @getAddr(i8* %79)
  %81 = load i32, i32* @propinterval, align 4
  %rem = srem i32 %78, %81
  %82 = bitcast i32* @propinterval to i8*
  %83 = call i64 @getAddr(i8* %82)
  %84 = load i32, i32* @propinterval, align 4
  %sub12 = sub nsw i32 %84, 1
  %cmp13 = icmp eq i32 %rem, %sub12
  br i1 %cmp13, label %if.then14, label %if.end24

if.then14:                                        ; preds = %for.body10
  call void @rephase(i32 0)
  call void @g_measure()
  call void @rephase(i32 1)
  %85 = bitcast %struct.site** @lattice to i8*
  %86 = call i64 @getAddr(i8* %85)
  %87 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx = getelementptr inbounds %struct.site, %struct.site* %87, i64 0
  %phi = getelementptr inbounds %struct.site, %struct.site* %arrayidx, i32 0, i32 11
  %88 = bitcast %struct.su3_vector* %phi to i8*
  %89 = bitcast %struct.site** @lattice to i8*
  %90 = call i64 @getAddr(i8* %89)
  %91 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx15 = getelementptr inbounds %struct.site, %struct.site* %91, i64 0
  %92 = bitcast %struct.site* %arrayidx15 to i8*
  %sub.ptr.lhs.cast = ptrtoint i8* %88 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %92 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv = trunc i64 %sub.ptr.sub to i32
  %93 = bitcast %struct.site** @lattice to i8*
  %94 = call i64 @getAddr(i8* %93)
  %95 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx16 = getelementptr inbounds %struct.site, %struct.site* %95, i64 0
  %xxx = getelementptr inbounds %struct.site, %struct.site* %arrayidx16, i32 0, i32 14
  %96 = bitcast %struct.su3_vector* %xxx to i8*
  %97 = bitcast %struct.site** @lattice to i8*
  %98 = call i64 @getAddr(i8* %97)
  %99 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx17 = getelementptr inbounds %struct.site, %struct.site* %99, i64 0
  %100 = bitcast %struct.site* %arrayidx17 to i8*
  %sub.ptr.lhs.cast18 = ptrtoint i8* %96 to i64
  %sub.ptr.rhs.cast19 = ptrtoint i8* %100 to i64
  %sub.ptr.sub20 = sub i64 %sub.ptr.lhs.cast18, %sub.ptr.rhs.cast19
  %conv21 = trunc i64 %sub.ptr.sub20 to i32
  %101 = bitcast double* @mass to i8*
  %102 = call i64 @getAddr(i8* %101)
  %103 = load double, double* @mass, align 8
  %104 = bitcast void (i32, i32, double)* @f_meas_imp to i8*
  %105 = call i64 @getAddr(i8* %104)
  call void @addFunArg(i32 2, i64 %105, i64 %102)
  call void @f_meas_imp(i32 %conv, i32 %conv21, double %103)
  %106 = bitcast i32* %s_iters to i8*
  %107 = call i64 @getAddr(i8* %106)
  %108 = load i32, i32* %s_iters, align 4
  %109 = bitcast i32* %avs_iters to i8*
  %110 = call i64 @getAddr(i8* %109)
  %111 = load i32, i32* %avs_iters, align 4
  %add = add nsw i32 %111, %108
  %112 = bitcast i32* %avs_iters to i8*
  store i32 %add, i32* %avs_iters, align 4
  %113 = bitcast i32* %meascount to i8*
  %114 = call i64 @getAddr(i8* %113)
  %115 = load i32, i32* %meascount, align 4
  %inc22 = add nsw i32 %115, 1
  %116 = bitcast i32* %meascount to i8*
  store i32 %inc22, i32* %meascount, align 4
  %117 = bitcast %struct._IO_FILE** @stdout to i8*
  %118 = call i64 @getAddr(i8* %117)
  %119 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call23 = call i32 @fflush(%struct._IO_FILE* %119)
  br label %if.end24

if.end24:                                         ; preds = %if.then14, %for.body10
  br label %for.inc25

for.inc25:                                        ; preds = %if.end24
  %120 = bitcast i32* %traj_done to i8*
  %121 = call i64 @getAddr(i8* %120)
  %122 = load i32, i32* %traj_done, align 4
  %inc26 = add nsw i32 %122, 1
  %123 = bitcast i32* %traj_done to i8*
  store i32 %inc26, i32* %traj_done, align 4
  br label %for.cond8

for.end27:                                        ; preds = %for.cond8
  %124 = bitcast i32* @this_node to i8*
  %125 = call i64 @getAddr(i8* %124)
  %126 = load i32, i32* @this_node, align 4
  %cmp28 = icmp eq i32 %126, 0
  br i1 %cmp28, label %if.then30, label %if.end32

if.then30:                                        ; preds = %for.end27
  %call31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.37, i32 0, i32 0))
  br label %if.end32

if.end32:                                         ; preds = %if.then30, %for.end27
  %127 = bitcast %struct._IO_FILE** @stdout to i8*
  %128 = call i64 @getAddr(i8* %127)
  %129 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call33 = call i32 @fflush(%struct._IO_FILE* %129)
  %130 = bitcast i32* %meascount to i8*
  %131 = call i64 @getAddr(i8* %130)
  %132 = load i32, i32* %meascount, align 4
  %cmp34 = icmp sgt i32 %132, 0
  br i1 %cmp34, label %if.then36, label %if.end44

if.then36:                                        ; preds = %if.end32
  %133 = bitcast i32* @this_node to i8*
  %134 = call i64 @getAddr(i8* %133)
  %135 = load i32, i32* @this_node, align 4
  %cmp37 = icmp eq i32 %135, 0
  br i1 %cmp37, label %if.then39, label %if.end43

if.then39:                                        ; preds = %if.then36
  %136 = bitcast i32* %avs_iters to i8*
  %137 = call i64 @getAddr(i8* %136)
  %138 = load i32, i32* %avs_iters, align 4
  %conv40 = sitofp i32 %138 to double
  %139 = bitcast i32* %meascount to i8*
  %140 = call i64 @getAddr(i8* %139)
  %141 = load i32, i32* %meascount, align 4
  %conv41 = sitofp i32 %141 to double
  %div = fdiv double %conv40, %conv41
  %142 = call i64 @computeReal(i32 19, i64 0, i64 0, double %conv40, double %conv41, double %div, i32 128)
  %call42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.38, i32 0, i32 0), double %div)
  br label %if.end43

if.end43:                                         ; preds = %if.then39, %if.then36
  br label %if.end44

if.end44:                                         ; preds = %if.end43, %if.end32
  %call45 = call double (...) @dclock()
  %143 = bitcast double* %dtime to i8*
  %144 = call i64 @getAddr(i8* %143)
  %145 = load double, double* %dtime, align 8
  %add46 = fadd double %145, %call45
  %146 = bitcast double* %dtime to i8*
  %147 = call i64 @getAddr(i8* %146)
  store double %add46, double* %dtime, align 8
  %148 = bitcast i32* @this_node to i8*
  %149 = call i64 @getAddr(i8* %148)
  %150 = load i32, i32* @this_node, align 4
  %cmp47 = icmp eq i32 %150, 0
  br i1 %cmp47, label %if.then49, label %if.end51

if.then49:                                        ; preds = %if.end44
  %151 = bitcast i32* @total_iters to i8*
  %152 = call i64 @getAddr(i8* %151)
  %153 = load i32, i32* @total_iters, align 4
  %call50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.39, i32 0, i32 0), i32 %153)
  br label %if.end51

if.end51:                                         ; preds = %if.then49, %if.end44
  %154 = bitcast %struct._IO_FILE** @stdout to i8*
  %155 = call i64 @getAddr(i8* %154)
  %156 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call52 = call i32 @fflush(%struct._IO_FILE* %156)
  %157 = bitcast i32* @saveflag to i8*
  %158 = call i64 @getAddr(i8* %157)
  %159 = load i32, i32* @saveflag, align 4
  %cmp53 = icmp ne i32 %159, 20
  br i1 %cmp53, label %if.then55, label %if.end57

if.then55:                                        ; preds = %if.end51
  call void @rephase(i32 0)
  %160 = bitcast i32* @saveflag to i8*
  %161 = call i64 @getAddr(i8* %160)
  %162 = load i32, i32* @saveflag, align 4
  %163 = bitcast %struct.gauge_file* (i32, i8*)* @save_lattice to i8*
  %164 = call i64 @getAddr(i8* %163)
  call void @addFunArg(i32 0, i64 %164, i64 %161)
  %call56 = call %struct.gauge_file* @save_lattice(i32 %162, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @savefile, i32 0, i32 0))
  call void @rephase(i32 1)
  br label %if.end57

if.end57:                                         ; preds = %if.then55, %if.end51
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %165 = bitcast i32 (i32, i8**)* @main to i8*
  %166 = call i64 @getAddr(i8* %165)
  call void @funcExit(i64 %166)
  call void @cleanComputeReal(i32 128)
  call void @finish()
  ret i32 0
}

declare dso_local void @initialize_machine(i32, i8**) #1

declare dso_local void @g_sync(...) #1

declare dso_local i32 @setup(...) #1

declare dso_local i32 @readin(i32) #1

declare dso_local double @dclock(...) #1

declare dso_local i32 @update(...) #1

declare dso_local i32 @printf(i8*, ...) #1

declare dso_local i32 @fflush(%struct._IO_FILE*) #1

declare dso_local void @rephase(i32) #1

declare dso_local void @g_measure() #1

declare dso_local void @f_meas_imp(i32, i32, double) #1

declare dso_local %struct.gauge_file* @save_lattice(i32, i8*) #1

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @funcExit(i64)

declare void @handleAlloca(i64)

declare void @setRealTemp(i64, i64)

declare void @addFunArg(i32, i64, i64)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @cleanComputeReal(i32)

declare void @finish()

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
