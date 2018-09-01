; ModuleID = 'mdef_inst.bc'
source_filename = "mdef.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.mdef_t = type { i32, i32, i32, i32, i32, i32, %struct.hash_table_t*, %struct.ciphone_t*, %struct.phone_t*, i16**, i32, i16*, i8*, i32*, i8, %struct.ph_lc_s*** }
%struct.hash_table_t = type { %struct.hash_entry_s*, i32, i8 }
%struct.hash_entry_s = type { i8*, i32, i32, %struct.hash_entry_s* }
%struct.ciphone_t = type { i8*, i32 }
%struct.phone_t = type { i32, i32, i8, i8, i8, i32 }
%struct.ph_lc_s = type { i8, %struct.ph_rc_s*, %struct.ph_lc_s* }
%struct.ph_rc_s = type { i8, i32, %struct.ph_rc_s* }
%struct.gnode_s = type { %union.anytype_s, %struct.gnode_s* }
%union.anytype_s = type { i8* }

@.str = private unnamed_addr constant [12 x i8] c"%d ciphone\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"%d phone\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"%d emitstate\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"%d cisen\0A\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%d sen\0A\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"%d tmat\0A\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"%3d %5d\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c" %5d\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c" %3d\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"\09%s\0A\00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"m\00", align 1
@.str.12 = private unnamed_addr constant [7 x i8] c"mdef.c\00", align 1
@__PRETTY_FUNCTION__.mdef_ciphone_id = private unnamed_addr constant [44 x i8] c"s3cipid_t mdef_ciphone_id(mdef_t *, char *)\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"ci\00", align 1
@__PRETTY_FUNCTION__.mdef_ciphone_str = private unnamed_addr constant [50 x i8] c"const char *mdef_ciphone_str(mdef_t *, s3cipid_t)\00", align 1
@.str.14 = private unnamed_addr constant [33 x i8] c"(id >= 0) && (id < m->n_ciphone)\00", align 1
@__PRETTY_FUNCTION__.mdef_phone_str = private unnamed_addr constant [48 x i8] c"int32 mdef_phone_str(mdef_t *, s3pid_t, char *)\00", align 1
@.str.15 = private unnamed_addr constant [33 x i8] c"(pid >= 0) && (pid < m->n_phone)\00", align 1
@.str.16 = private unnamed_addr constant [6 x i8] c"besiu\00", align 1
@.str.17 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.18 = private unnamed_addr constant [14 x i8] c"(%s,%s,%s,%c)\00", align 1
@__PRETTY_FUNCTION__.mdef_phone_id = private unnamed_addr constant [78 x i8] c"s3pid_t mdef_phone_id(mdef_t *, s3cipid_t, s3cipid_t, s3cipid_t, word_posn_t)\00", align 1
@.str.19 = private unnamed_addr constant [33 x i8] c"(ci >= 0) && (ci < m->n_ciphone)\00", align 1
@.str.20 = private unnamed_addr constant [33 x i8] c"(lc >= 0) && (lc < m->n_ciphone)\00", align 1
@.str.21 = private unnamed_addr constant [33 x i8] c"(rc >= 0) && (rc < m->n_ciphone)\00", align 1
@.str.22 = private unnamed_addr constant [36 x i8] c"(wpos >= 0) && (wpos < N_WORD_POSN)\00", align 1
@__PRETTY_FUNCTION__.mdef_phone_id_nearest = private unnamed_addr constant [86 x i8] c"s3pid_t mdef_phone_id_nearest(mdef_t *, s3cipid_t, s3cipid_t, s3cipid_t, word_posn_t)\00", align 1
@.str.23 = private unnamed_addr constant [31 x i8] c"(b >= 0) && (b < m->n_ciphone)\00", align 1
@.str.24 = private unnamed_addr constant [34 x i8] c"(pos >= 0) && (pos < N_WORD_POSN)\00", align 1
@.str.25 = private unnamed_addr constant [31 x i8] c"(l >= 0) && (l < m->n_ciphone)\00", align 1
@.str.26 = private unnamed_addr constant [31 x i8] c"(r >= 0) && (r < m->n_ciphone)\00", align 1
@__PRETTY_FUNCTION__.mdef_phone_components = private unnamed_addr constant [101 x i8] c"int32 mdef_phone_components(mdef_t *, s3pid_t, s3cipid_t *, s3cipid_t *, s3cipid_t *, word_posn_t *)\00", align 1
@.str.27 = private unnamed_addr constant [29 x i8] c"(p >= 0) && (p < m->n_phone)\00", align 1
@__PRETTY_FUNCTION__.mdef_is_ciphone = private unnamed_addr constant [41 x i8] c"int32 mdef_is_ciphone(mdef_t *, s3pid_t)\00", align 1
@.str.28 = private unnamed_addr constant [12 x i8] c"FATAL_ERROR\00", align 1
@.str.29 = private unnamed_addr constant [14 x i8] c"No mdef-file\0A\00", align 1
@.str.30 = private unnamed_addr constant [5 x i8] c"INFO\00", align 1
@.str.31 = private unnamed_addr constant [30 x i8] c"Reading model definition: %s\0A\00", align 1
@.str.32 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.33 = private unnamed_addr constant [13 x i8] c"SYSTEM_ERROR\00", align 1
@.str.34 = private unnamed_addr constant [20 x i8] c"fopen(%s,r) failed\0A\00", align 1
@.str.35 = private unnamed_addr constant [16 x i8] c"Empty file: %s\0A\00", align 1
@.str.36 = private unnamed_addr constant [4 x i8] c"0.3\00", align 1
@.str.37 = private unnamed_addr constant [41 x i8] c"Version error: Expecing %s, but read %s\0A\00", align 1
@.str.38 = private unnamed_addr constant [19 x i8] c"Incomplete header\0A\00", align 1
@.str.39 = private unnamed_addr constant [6 x i8] c"%d %s\00", align 1
@.str.40 = private unnamed_addr constant [21 x i8] c"Error in header: %s\0A\00", align 1
@.str.41 = private unnamed_addr constant [7 x i8] c"n_base\00", align 1
@.str.42 = private unnamed_addr constant [6 x i8] c"n_tri\00", align 1
@.str.43 = private unnamed_addr constant [12 x i8] c"n_state_map\00", align 1
@.str.44 = private unnamed_addr constant [16 x i8] c"n_tied_ci_state\00", align 1
@.str.45 = private unnamed_addr constant [13 x i8] c"n_tied_state\00", align 1
@.str.46 = private unnamed_addr constant [12 x i8] c"n_tied_tmat\00", align 1
@.str.47 = private unnamed_addr constant [25 x i8] c"Unknown header line: %s\0A\00", align 1
@.str.48 = private unnamed_addr constant [21 x i8] c"%s: Error in header\0A\00", align 1
@.str.49 = private unnamed_addr constant [40 x i8] c"%s: #CI phones (%d) exceeds limit (%d)\0A\00", align 1
@.str.50 = private unnamed_addr constant [37 x i8] c"%s: #Phones (%d) exceeds limit (%d)\0A\00", align 1
@.str.51 = private unnamed_addr constant [38 x i8] c"%s: #senones (%d) exceeds limit (%d)\0A\00", align 1
@.str.52 = private unnamed_addr constant [36 x i8] c"%s: #tmats (%d) exceeds limit (%d)\0A\00", align 1
@.str.53 = private unnamed_addr constant [56 x i8] c"Header error: n_state_map not a multiple of n_ci*n_tri\0A\00", align 1
@.str.54 = private unnamed_addr constant [34 x i8] c"Premature EOF reading CIphone %d\0A\00", align 1
@.str.55 = private unnamed_addr constant [4 x i8] c"SIL\00", align 1
@.str.56 = private unnamed_addr constant [32 x i8] c"Premature EOF reading phone %d\0A\00", align 1
@.str.57 = private unnamed_addr constant [6 x i8] c"ERROR\00", align 1
@.str.58 = private unnamed_addr constant [45 x i8] c"Non-empty file beyond expected #phones (%d)\0A\00", align 1
@.str.59 = private unnamed_addr constant [57 x i8] c"#CI-senones(%d) != #CI-phone(%d) x #emitting-states(%d)\0A\00", align 1
@.str.60 = private unnamed_addr constant [57 x i8] c"Unreferenced senone %d; cannot determine parent CIphone\0A\00", align 1
@.str.61 = private unnamed_addr constant [14 x i8] c"n == m->n_sen\00", align 1
@__PRETTY_FUNCTION__.mdef_init = private unnamed_addr constant [26 x i8] c"mdef_t *mdef_init(char *)\00", align 1
@.str.62 = private unnamed_addr constant [77 x i8] c"%d CI-phone, %d CD-phone, %d emitstate/phone, %d CI-sen, %d Sen, %d Sen-Seq\0A\00", align 1
@.str.63 = private unnamed_addr constant [5 x i8] c"%s%n\00", align 1
@.str.64 = private unnamed_addr constant [29 x i8] c"Missing base phone name: %s\0A\00", align 1
@.str.65 = private unnamed_addr constant [26 x i8] c"Duplicate base phone: %s\0A\00", align 1
@.str.66 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.67 = private unnamed_addr constant [37 x i8] c"Bad context info for base phone: %s\0A\00", align 1
@.str.68 = private unnamed_addr constant [35 x i8] c"Missing filler atribute field: %s\0A\00", align 1
@.str.69 = private unnamed_addr constant [7 x i8] c"filler\00", align 1
@.str.70 = private unnamed_addr constant [4 x i8] c"n/a\00", align 1
@.str.71 = private unnamed_addr constant [32 x i8] c"Bad filler attribute field: %s\0A\00", align 1
@.str.72 = private unnamed_addr constant [17 x i8] c"p < m->n_ciphone\00", align 1
@__PRETTY_FUNCTION__.ciphone_add = private unnamed_addr constant [44 x i8] c"void ciphone_add(mdef_t *, char *, s3pid_t)\00", align 1
@.str.73 = private unnamed_addr constant [43 x i8] c"hash_enter(%s) failed; duplicate CIphone?\0A\00", align 1
@.str.74 = private unnamed_addr constant [15 x i8] c"p < m->n_phone\00", align 1
@__PRETTY_FUNCTION__.triphone_add = private unnamed_addr constant [83 x i8] c"void triphone_add(mdef_t *, s3cipid_t, s3cipid_t, s3cipid_t, word_posn_t, s3pid_t)\00", align 1
@.str.75 = private unnamed_addr constant [24 x i8] c"Duplicate triphone: %s\0A\00", align 1
@.str.76 = private unnamed_addr constant [5 x i8] c"%d%n\00", align 1
@.str.77 = private unnamed_addr constant [41 x i8] c"Missing or bad transition matrix id: %s\0A\00", align 1
@.str.78 = private unnamed_addr constant [39 x i8] c"tmat-id(%d) > #tmat in header(%d): %s\0A\00", align 1
@.str.79 = private unnamed_addr constant [46 x i8] c"Missing or bad state[%d]->senone mapping: %s\0A\00", align 1
@.str.80 = private unnamed_addr constant [40 x i8] c"CI-senone-id(%d) > #CI-senones(%d): %s\0A\00", align 1
@.str.81 = private unnamed_addr constant [34 x i8] c"Senone-id(%d) > #senones(%d): %s\0A\00", align 1
@.str.82 = private unnamed_addr constant [2 x i8] c"N\00", align 1
@.str.83 = private unnamed_addr constant [37 x i8] c"Missing non-emitting state spec: %s\0A\00", align 1
@.str.84 = private unnamed_addr constant [47 x i8] c"Non-empty beyond non-emitting final state: %s\0A\00", align 1
@.str.85 = private unnamed_addr constant [24 x i8] c"Unknown base phone: %s\0A\00", align 1
@.str.86 = private unnamed_addr constant [26 x i8] c"Missing left context: %s\0A\00", align 1
@.str.87 = private unnamed_addr constant [26 x i8] c"Unknown left context: %s\0A\00", align 1
@.str.88 = private unnamed_addr constant [27 x i8] c"Missing right context: %s\0A\00", align 1
@.str.89 = private unnamed_addr constant [28 x i8] c"Unknown right  context: %s\0A\00", align 1
@.str.90 = private unnamed_addr constant [39 x i8] c"Missing or bad word-position spec: %s\0A\00", align 1
@.str.91 = private unnamed_addr constant [28 x i8] c"Bad word-position spec: %s\0A\00", align 1
@.str.92 = private unnamed_addr constant [36 x i8] c"Missing filler attribute field: %s\0A\00", align 1
@.str.93 = private unnamed_addr constant [12 x i8] c"j == n_sseq\00", align 1
@__PRETTY_FUNCTION__.sseq_compress = private unnamed_addr constant [29 x i8] c"void sseq_compress(mdef_t *)\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @mdef_dump(%struct._IO_FILE* %fp, %struct.mdef_t* %m) #0 {
entry:
  %0 = bitcast void (%struct._IO_FILE*, %struct.mdef_t*)* @mdef_dump to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %fp.addr = alloca %struct._IO_FILE*, align 8
  %m.addr = alloca %struct.mdef_t*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %ssid = alloca i32, align 4
  %buf = alloca [1024 x i8], align 16
  %2 = bitcast %struct._IO_FILE** %fp.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct._IO_FILE* %fp to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %fp.addr, align 8
  %6 = bitcast %struct.mdef_t** %m.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = bitcast %struct.mdef_t* %m to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @setRealTemp(i64 %7, i64 %9)
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %10 = bitcast %struct._IO_FILE** %fp.addr to i8*
  %11 = call i64 @getAddr(i8* %10)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %13 = bitcast %struct.mdef_t** %m.addr to i8*
  %14 = call i64 @getAddr(i8* %13)
  %15 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %15, i32 0, i32 0
  %16 = bitcast i32* %n_ciphone to i8*
  %17 = call i64 @getAddr(i8* %16)
  %18 = load i32, i32* %n_ciphone, align 8
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 %18)
  %19 = bitcast %struct._IO_FILE** %fp.addr to i8*
  %20 = call i64 @getAddr(i8* %19)
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %22 = bitcast %struct.mdef_t** %m.addr to i8*
  %23 = call i64 @getAddr(i8* %22)
  %24 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %24, i32 0, i32 1
  %25 = bitcast i32* %n_phone to i8*
  %26 = call i64 @getAddr(i8* %25)
  %27 = load i32, i32* %n_phone, align 4
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 %27)
  %28 = bitcast %struct._IO_FILE** %fp.addr to i8*
  %29 = call i64 @getAddr(i8* %28)
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %31 = bitcast %struct.mdef_t** %m.addr to i8*
  %32 = call i64 @getAddr(i8* %31)
  %33 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_emit_state = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %33, i32 0, i32 2
  %34 = bitcast i32* %n_emit_state to i8*
  %35 = call i64 @getAddr(i8* %34)
  %36 = load i32, i32* %n_emit_state, align 8
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 %36)
  %37 = bitcast %struct._IO_FILE** %fp.addr to i8*
  %38 = call i64 @getAddr(i8* %37)
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %40 = bitcast %struct.mdef_t** %m.addr to i8*
  %41 = call i64 @getAddr(i8* %40)
  %42 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ci_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %42, i32 0, i32 3
  %43 = bitcast i32* %n_ci_sen to i8*
  %44 = call i64 @getAddr(i8* %43)
  %45 = load i32, i32* %n_ci_sen, align 4
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0), i32 %45)
  %46 = bitcast %struct._IO_FILE** %fp.addr to i8*
  %47 = call i64 @getAddr(i8* %46)
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %49 = bitcast %struct.mdef_t** %m.addr to i8*
  %50 = call i64 @getAddr(i8* %49)
  %51 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %51, i32 0, i32 4
  %52 = bitcast i32* %n_sen to i8*
  %53 = call i64 @getAddr(i8* %52)
  %54 = load i32, i32* %n_sen, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i32 %54)
  %55 = bitcast %struct._IO_FILE** %fp.addr to i8*
  %56 = call i64 @getAddr(i8* %55)
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %58 = bitcast %struct.mdef_t** %m.addr to i8*
  %59 = call i64 @getAddr(i8* %58)
  %60 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_tmat = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %60, i32 0, i32 5
  %61 = bitcast i32* %n_tmat to i8*
  %62 = call i64 @getAddr(i8* %61)
  %63 = load i32, i32* %n_tmat, align 4
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i32 0, i32 0), i32 %63)
  %64 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc42, %entry
  %65 = bitcast i32* %i to i8*
  %66 = call i64 @getAddr(i8* %65)
  %67 = load i32, i32* %i, align 4
  %68 = bitcast %struct.mdef_t** %m.addr to i8*
  %69 = call i64 @getAddr(i8* %68)
  %70 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone6 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %70, i32 0, i32 1
  %71 = bitcast i32* %n_phone6 to i8*
  %72 = call i64 @getAddr(i8* %71)
  %73 = load i32, i32* %n_phone6, align 4
  %cmp = icmp slt i32 %67, %73
  br i1 %cmp, label %for.body, label %for.end44

for.body:                                         ; preds = %for.cond
  %74 = bitcast %struct.mdef_t** %m.addr to i8*
  %75 = call i64 @getAddr(i8* %74)
  %76 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %77 = bitcast i32* %i to i8*
  %78 = call i64 @getAddr(i8* %77)
  %79 = load i32, i32* %i, align 4
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %80 = bitcast i32 (%struct.mdef_t*, i32, i8*)* @mdef_phone_str to i8*
  %81 = call i64 @getAddr(i8* %80)
  call void @addFunArg(i32 1, i64 %81, i64 %78)
  %call7 = call i32 @mdef_phone_str(%struct.mdef_t* %76, i32 %79, i8* %arraydecay)
  %82 = bitcast %struct.mdef_t** %m.addr to i8*
  %83 = call i64 @getAddr(i8* %82)
  %84 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %84, i32 0, i32 8
  %85 = bitcast %struct.phone_t** %phone to i8*
  %86 = call i64 @getAddr(i8* %85)
  %87 = load %struct.phone_t*, %struct.phone_t** %phone, align 8
  %88 = bitcast i32* %i to i8*
  %89 = call i64 @getAddr(i8* %88)
  %90 = load i32, i32* %i, align 4
  %idxprom = sext i32 %90 to i64
  %arrayidx = getelementptr inbounds %struct.phone_t, %struct.phone_t* %87, i64 %idxprom
  %ssid8 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx, i32 0, i32 0
  %91 = bitcast i32* %ssid8 to i8*
  %92 = call i64 @getAddr(i8* %91)
  %93 = load i32, i32* %ssid8, align 4
  %94 = bitcast i32* %ssid to i8*
  store i32 %93, i32* %ssid, align 4
  %95 = bitcast %struct._IO_FILE** %fp.addr to i8*
  %96 = call i64 @getAddr(i8* %95)
  %97 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %98 = bitcast %struct.mdef_t** %m.addr to i8*
  %99 = call i64 @getAddr(i8* %98)
  %100 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone9 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %100, i32 0, i32 8
  %101 = bitcast %struct.phone_t** %phone9 to i8*
  %102 = call i64 @getAddr(i8* %101)
  %103 = load %struct.phone_t*, %struct.phone_t** %phone9, align 8
  %104 = bitcast i32* %i to i8*
  %105 = call i64 @getAddr(i8* %104)
  %106 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %106 to i64
  %arrayidx11 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %103, i64 %idxprom10
  %tmat = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx11, i32 0, i32 1
  %107 = bitcast i32* %tmat to i8*
  %108 = call i64 @getAddr(i8* %107)
  %109 = load i32, i32* %tmat, align 4
  %110 = bitcast i32* %ssid to i8*
  %111 = call i64 @getAddr(i8* %110)
  %112 = load i32, i32* %ssid, align 4
  %call12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %97, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i32 0, i32 0), i32 %109, i32 %112)
  %113 = bitcast i32* %j to i8*
  store i32 0, i32* %j, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc, %for.body
  %114 = bitcast i32* %j to i8*
  %115 = call i64 @getAddr(i8* %114)
  %116 = load i32, i32* %j, align 4
  %117 = bitcast %struct.mdef_t** %m.addr to i8*
  %118 = call i64 @getAddr(i8* %117)
  %119 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_emit_state14 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %119, i32 0, i32 2
  %120 = bitcast i32* %n_emit_state14 to i8*
  %121 = call i64 @getAddr(i8* %120)
  %122 = load i32, i32* %n_emit_state14, align 8
  %cmp15 = icmp slt i32 %116, %122
  br i1 %cmp15, label %for.body16, label %for.end

for.body16:                                       ; preds = %for.cond13
  %123 = bitcast %struct._IO_FILE** %fp.addr to i8*
  %124 = call i64 @getAddr(i8* %123)
  %125 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %126 = bitcast %struct.mdef_t** %m.addr to i8*
  %127 = call i64 @getAddr(i8* %126)
  %128 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sseq = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %128, i32 0, i32 9
  %129 = bitcast i16*** %sseq to i8*
  %130 = call i64 @getAddr(i8* %129)
  %131 = load i16**, i16*** %sseq, align 8
  %132 = bitcast i32* %ssid to i8*
  %133 = call i64 @getAddr(i8* %132)
  %134 = load i32, i32* %ssid, align 4
  %idxprom17 = sext i32 %134 to i64
  %arrayidx18 = getelementptr inbounds i16*, i16** %131, i64 %idxprom17
  %135 = bitcast i16** %arrayidx18 to i8*
  %136 = call i64 @getAddr(i8* %135)
  %137 = load i16*, i16** %arrayidx18, align 8
  %138 = bitcast i32* %j to i8*
  %139 = call i64 @getAddr(i8* %138)
  %140 = load i32, i32* %j, align 4
  %idxprom19 = sext i32 %140 to i64
  %arrayidx20 = getelementptr inbounds i16, i16* %137, i64 %idxprom19
  %141 = bitcast i16* %arrayidx20 to i8*
  %142 = call i64 @getAddr(i8* %141)
  %143 = load i16, i16* %arrayidx20, align 2
  %conv = sext i16 %143 to i32
  %call21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %125, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i32 %conv)
  br label %for.inc

for.inc:                                          ; preds = %for.body16
  %144 = bitcast i32* %j to i8*
  %145 = call i64 @getAddr(i8* %144)
  %146 = load i32, i32* %j, align 4
  %inc = add nsw i32 %146, 1
  %147 = bitcast i32* %j to i8*
  store i32 %inc, i32* %j, align 4
  br label %for.cond13

for.end:                                          ; preds = %for.cond13
  %148 = bitcast %struct._IO_FILE** %fp.addr to i8*
  %149 = call i64 @getAddr(i8* %148)
  %150 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %150, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0))
  %151 = bitcast i32* %j to i8*
  store i32 0, i32* %j, align 4
  br label %for.cond23

for.cond23:                                       ; preds = %for.inc37, %for.end
  %152 = bitcast i32* %j to i8*
  %153 = call i64 @getAddr(i8* %152)
  %154 = load i32, i32* %j, align 4
  %155 = bitcast %struct.mdef_t** %m.addr to i8*
  %156 = call i64 @getAddr(i8* %155)
  %157 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_emit_state24 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %157, i32 0, i32 2
  %158 = bitcast i32* %n_emit_state24 to i8*
  %159 = call i64 @getAddr(i8* %158)
  %160 = load i32, i32* %n_emit_state24, align 8
  %cmp25 = icmp slt i32 %154, %160
  br i1 %cmp25, label %for.body27, label %for.end39

for.body27:                                       ; preds = %for.cond23
  %161 = bitcast %struct._IO_FILE** %fp.addr to i8*
  %162 = call i64 @getAddr(i8* %161)
  %163 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %164 = bitcast %struct.mdef_t** %m.addr to i8*
  %165 = call i64 @getAddr(i8* %164)
  %166 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %cd2cisen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %166, i32 0, i32 11
  %167 = bitcast i16** %cd2cisen to i8*
  %168 = call i64 @getAddr(i8* %167)
  %169 = load i16*, i16** %cd2cisen, align 8
  %170 = bitcast %struct.mdef_t** %m.addr to i8*
  %171 = call i64 @getAddr(i8* %170)
  %172 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sseq28 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %172, i32 0, i32 9
  %173 = bitcast i16*** %sseq28 to i8*
  %174 = call i64 @getAddr(i8* %173)
  %175 = load i16**, i16*** %sseq28, align 8
  %176 = bitcast i32* %ssid to i8*
  %177 = call i64 @getAddr(i8* %176)
  %178 = load i32, i32* %ssid, align 4
  %idxprom29 = sext i32 %178 to i64
  %arrayidx30 = getelementptr inbounds i16*, i16** %175, i64 %idxprom29
  %179 = bitcast i16** %arrayidx30 to i8*
  %180 = call i64 @getAddr(i8* %179)
  %181 = load i16*, i16** %arrayidx30, align 8
  %182 = bitcast i32* %j to i8*
  %183 = call i64 @getAddr(i8* %182)
  %184 = load i32, i32* %j, align 4
  %idxprom31 = sext i32 %184 to i64
  %arrayidx32 = getelementptr inbounds i16, i16* %181, i64 %idxprom31
  %185 = bitcast i16* %arrayidx32 to i8*
  %186 = call i64 @getAddr(i8* %185)
  %187 = load i16, i16* %arrayidx32, align 2
  %idxprom33 = sext i16 %187 to i64
  %arrayidx34 = getelementptr inbounds i16, i16* %169, i64 %idxprom33
  %188 = bitcast i16* %arrayidx34 to i8*
  %189 = call i64 @getAddr(i8* %188)
  %190 = load i16, i16* %arrayidx34, align 2
  %conv35 = sext i16 %190 to i32
  %call36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %163, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i32 %conv35)
  br label %for.inc37

for.inc37:                                        ; preds = %for.body27
  %191 = bitcast i32* %j to i8*
  %192 = call i64 @getAddr(i8* %191)
  %193 = load i32, i32* %j, align 4
  %inc38 = add nsw i32 %193, 1
  %194 = bitcast i32* %j to i8*
  store i32 %inc38, i32* %j, align 4
  br label %for.cond23

for.end39:                                        ; preds = %for.cond23
  %195 = bitcast %struct._IO_FILE** %fp.addr to i8*
  %196 = call i64 @getAddr(i8* %195)
  %197 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %arraydecay40 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %call41 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %197, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i32 0, i32 0), i8* %arraydecay40)
  br label %for.inc42

for.inc42:                                        ; preds = %for.end39
  %198 = bitcast i32* %i to i8*
  %199 = call i64 @getAddr(i8* %198)
  %200 = load i32, i32* %i, align 4
  %inc43 = add nsw i32 %200, 1
  %201 = bitcast i32* %i to i8*
  store i32 %inc43, i32* %i, align 4
  br label %for.cond

for.end44:                                        ; preds = %for.cond
  %202 = bitcast %struct._IO_FILE** %fp.addr to i8*
  %203 = call i64 @getAddr(i8* %202)
  %204 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %call45 = call i32 @fflush(%struct._IO_FILE* %204)
  %205 = bitcast void (%struct._IO_FILE*, %struct.mdef_t*)* @mdef_dump to i8*
  %206 = call i64 @getAddr(i8* %205)
  call void @funcExit(i64 %206)
  ret void
}

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mdef_phone_str(%struct.mdef_t* %m, i32 %pid, i8* %buf) #0 {
entry:
  %0 = bitcast i32 (%struct.mdef_t*, i32, i8*)* @mdef_phone_str to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %m.addr = alloca %struct.mdef_t*, align 8
  %pid.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 8
  %wpos_name = alloca i8*, align 8
  %2 = bitcast %struct.mdef_t** %m.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.mdef_t* %m to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %6 = bitcast i32* %pid.addr to i8*
  store i32 %pid, i32* %pid.addr, align 4
  %7 = bitcast i8** %buf.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  %9 = bitcast i8* %buf to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void @setRealTemp(i64 %8, i64 %10)
  store i8* %buf, i8** %buf.addr, align 8
  %11 = bitcast %struct.mdef_t** %m.addr to i8*
  %12 = call i64 @getAddr(i8* %11)
  %13 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %tobool = icmp ne %struct.mdef_t* %13, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 229, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__PRETTY_FUNCTION__.mdef_phone_str, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %14, %cond.true
  %15 = bitcast i32* %pid.addr to i8*
  %16 = call i64 @getAddr(i8* %15)
  %17 = load i32, i32* %pid.addr, align 4
  %cmp = icmp sge i32 %17, 0
  br i1 %cmp, label %land.lhs.true, label %cond.false3

land.lhs.true:                                    ; preds = %cond.end
  %18 = bitcast i32* %pid.addr to i8*
  %19 = call i64 @getAddr(i8* %18)
  %20 = load i32, i32* %pid.addr, align 4
  %21 = bitcast %struct.mdef_t** %m.addr to i8*
  %22 = call i64 @getAddr(i8* %21)
  %23 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %23, i32 0, i32 1
  %24 = bitcast i32* %n_phone to i8*
  %25 = call i64 @getAddr(i8* %24)
  %26 = load i32, i32* %n_phone, align 4
  %cmp1 = icmp slt i32 %20, %26
  br i1 %cmp1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %land.lhs.true
  br label %cond.end4

cond.false3:                                      ; preds = %land.lhs.true, %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 230, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__PRETTY_FUNCTION__.mdef_phone_str, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end4

cond.end4:                                        ; preds = %27, %cond.true2
  %28 = bitcast i8** %wpos_name to i8*
  %29 = call i64 @getAddr(i8* %28)
  %30 = bitcast i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0) to i8*
  %31 = call i64 @getAddr(i8* %30)
  call void @setRealTemp(i64 %29, i64 %31)
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0), i8** %wpos_name, align 8
  %32 = bitcast i8** %buf.addr to i8*
  %33 = call i64 @getAddr(i8* %32)
  %34 = load i8*, i8** %buf.addr, align 8
  %arrayidx = getelementptr inbounds i8, i8* %34, i64 0
  %35 = bitcast i8* %arrayidx to i8*
  store i8 0, i8* %arrayidx, align 1
  %36 = bitcast i32* %pid.addr to i8*
  %37 = call i64 @getAddr(i8* %36)
  %38 = load i32, i32* %pid.addr, align 4
  %39 = bitcast %struct.mdef_t** %m.addr to i8*
  %40 = call i64 @getAddr(i8* %39)
  %41 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %41, i32 0, i32 0
  %42 = bitcast i32* %n_ciphone to i8*
  %43 = call i64 @getAddr(i8* %42)
  %44 = load i32, i32* %n_ciphone, align 8
  %cmp5 = icmp slt i32 %38, %44
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end4
  %45 = bitcast i8** %buf.addr to i8*
  %46 = call i64 @getAddr(i8* %45)
  %47 = load i8*, i8** %buf.addr, align 8
  %48 = bitcast %struct.mdef_t** %m.addr to i8*
  %49 = call i64 @getAddr(i8* %48)
  %50 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %51 = bitcast i32* %pid.addr to i8*
  %52 = call i64 @getAddr(i8* %51)
  %53 = load i32, i32* %pid.addr, align 4
  %conv = trunc i32 %53 to i8
  %54 = bitcast i8* (%struct.mdef_t*, i8)* @mdef_ciphone_str to i8*
  %55 = call i64 @getAddr(i8* %54)
  %call = call i8* @mdef_ciphone_str(%struct.mdef_t* %50, i8 signext %conv)
  %call6 = call i32 (i8*, i8*, ...) @sprintf(i8* %47, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.17, i32 0, i32 0), i8* %call) #7
  br label %if.end

if.else:                                          ; preds = %cond.end4
  %56 = bitcast i8** %buf.addr to i8*
  %57 = call i64 @getAddr(i8* %56)
  %58 = load i8*, i8** %buf.addr, align 8
  %59 = bitcast %struct.mdef_t** %m.addr to i8*
  %60 = call i64 @getAddr(i8* %59)
  %61 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %62 = bitcast %struct.mdef_t** %m.addr to i8*
  %63 = call i64 @getAddr(i8* %62)
  %64 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %64, i32 0, i32 8
  %65 = bitcast %struct.phone_t** %phone to i8*
  %66 = call i64 @getAddr(i8* %65)
  %67 = load %struct.phone_t*, %struct.phone_t** %phone, align 8
  %68 = bitcast i32* %pid.addr to i8*
  %69 = call i64 @getAddr(i8* %68)
  %70 = load i32, i32* %pid.addr, align 4
  %idxprom = sext i32 %70 to i64
  %arrayidx7 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %67, i64 %idxprom
  %ci = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx7, i32 0, i32 2
  %71 = bitcast i8* %ci to i8*
  %72 = call i64 @getAddr(i8* %71)
  %73 = load i8, i8* %ci, align 4
  %74 = bitcast i8* (%struct.mdef_t*, i8)* @mdef_ciphone_str to i8*
  %75 = call i64 @getAddr(i8* %74)
  call void @addFunArg(i32 1, i64 %75, i64 %72)
  %call8 = call i8* @mdef_ciphone_str(%struct.mdef_t* %61, i8 signext %73)
  %76 = bitcast %struct.mdef_t** %m.addr to i8*
  %77 = call i64 @getAddr(i8* %76)
  %78 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %79 = bitcast %struct.mdef_t** %m.addr to i8*
  %80 = call i64 @getAddr(i8* %79)
  %81 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone9 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %81, i32 0, i32 8
  %82 = bitcast %struct.phone_t** %phone9 to i8*
  %83 = call i64 @getAddr(i8* %82)
  %84 = load %struct.phone_t*, %struct.phone_t** %phone9, align 8
  %85 = bitcast i32* %pid.addr to i8*
  %86 = call i64 @getAddr(i8* %85)
  %87 = load i32, i32* %pid.addr, align 4
  %idxprom10 = sext i32 %87 to i64
  %arrayidx11 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %84, i64 %idxprom10
  %lc = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx11, i32 0, i32 3
  %88 = bitcast i8* %lc to i8*
  %89 = call i64 @getAddr(i8* %88)
  %90 = load i8, i8* %lc, align 1
  %91 = bitcast i8* (%struct.mdef_t*, i8)* @mdef_ciphone_str to i8*
  %92 = call i64 @getAddr(i8* %91)
  call void @addFunArg(i32 1, i64 %92, i64 %89)
  %call12 = call i8* @mdef_ciphone_str(%struct.mdef_t* %78, i8 signext %90)
  %93 = bitcast %struct.mdef_t** %m.addr to i8*
  %94 = call i64 @getAddr(i8* %93)
  %95 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %96 = bitcast %struct.mdef_t** %m.addr to i8*
  %97 = call i64 @getAddr(i8* %96)
  %98 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone13 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %98, i32 0, i32 8
  %99 = bitcast %struct.phone_t** %phone13 to i8*
  %100 = call i64 @getAddr(i8* %99)
  %101 = load %struct.phone_t*, %struct.phone_t** %phone13, align 8
  %102 = bitcast i32* %pid.addr to i8*
  %103 = call i64 @getAddr(i8* %102)
  %104 = load i32, i32* %pid.addr, align 4
  %idxprom14 = sext i32 %104 to i64
  %arrayidx15 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %101, i64 %idxprom14
  %rc = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx15, i32 0, i32 4
  %105 = bitcast i8* %rc to i8*
  %106 = call i64 @getAddr(i8* %105)
  %107 = load i8, i8* %rc, align 2
  %108 = bitcast i8* (%struct.mdef_t*, i8)* @mdef_ciphone_str to i8*
  %109 = call i64 @getAddr(i8* %108)
  call void @addFunArg(i32 1, i64 %109, i64 %106)
  %call16 = call i8* @mdef_ciphone_str(%struct.mdef_t* %95, i8 signext %107)
  %110 = bitcast i8** %wpos_name to i8*
  %111 = call i64 @getAddr(i8* %110)
  %112 = load i8*, i8** %wpos_name, align 8
  %113 = bitcast %struct.mdef_t** %m.addr to i8*
  %114 = call i64 @getAddr(i8* %113)
  %115 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone17 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %115, i32 0, i32 8
  %116 = bitcast %struct.phone_t** %phone17 to i8*
  %117 = call i64 @getAddr(i8* %116)
  %118 = load %struct.phone_t*, %struct.phone_t** %phone17, align 8
  %119 = bitcast i32* %pid.addr to i8*
  %120 = call i64 @getAddr(i8* %119)
  %121 = load i32, i32* %pid.addr, align 4
  %idxprom18 = sext i32 %121 to i64
  %arrayidx19 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %118, i64 %idxprom18
  %wpos = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx19, i32 0, i32 5
  %122 = bitcast i32* %wpos to i8*
  %123 = call i64 @getAddr(i8* %122)
  %124 = load i32, i32* %wpos, align 4
  %idxprom20 = zext i32 %124 to i64
  %arrayidx21 = getelementptr inbounds i8, i8* %112, i64 %idxprom20
  %125 = bitcast i8* %arrayidx21 to i8*
  %126 = call i64 @getAddr(i8* %125)
  %127 = load i8, i8* %arrayidx21, align 1
  %conv22 = sext i8 %127 to i32
  %call23 = call i32 (i8*, i8*, ...) @sprintf(i8* %58, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.18, i32 0, i32 0), i8* %call8, i8* %call12, i8* %call16, i32 %conv22) #7
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %128 = bitcast i32 (%struct.mdef_t*, i32, i8*)* @mdef_phone_str to i8*
  %129 = call i64 @getAddr(i8* %128)
  call void @funcExit(i64 %129)
  ret i32 0
}

declare dso_local i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i8 @mdef_ciphone_id(%struct.mdef_t* %m, i8* %ci) #0 {
entry:
  %0 = bitcast i8 (%struct.mdef_t*, i8*)* @mdef_ciphone_id to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %retval = alloca i8, align 1
  %m.addr = alloca %struct.mdef_t*, align 8
  %ci.addr = alloca i8*, align 8
  %id = alloca i32, align 4
  %2 = bitcast %struct.mdef_t** %m.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.mdef_t* %m to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %6 = bitcast i8** %ci.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = bitcast i8* %ci to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @setRealTemp(i64 %7, i64 %9)
  store i8* %ci, i8** %ci.addr, align 8
  %10 = bitcast %struct.mdef_t** %m.addr to i8*
  %11 = call i64 @getAddr(i8* %10)
  %12 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %tobool = icmp ne %struct.mdef_t* %12, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 207, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__PRETTY_FUNCTION__.mdef_ciphone_id, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %13, %cond.true
  %14 = bitcast i8** %ci.addr to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = load i8*, i8** %ci.addr, align 8
  %tobool1 = icmp ne i8* %16, null
  br i1 %tobool1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %cond.end
  br label %cond.end4

cond.false3:                                      ; preds = %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 208, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__PRETTY_FUNCTION__.mdef_ciphone_id, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end4

cond.end4:                                        ; preds = %17, %cond.true2
  %18 = bitcast %struct.mdef_t** %m.addr to i8*
  %19 = call i64 @getAddr(i8* %18)
  %20 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone_ht = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %20, i32 0, i32 6
  %21 = bitcast %struct.hash_table_t** %ciphone_ht to i8*
  %22 = call i64 @getAddr(i8* %21)
  %23 = load %struct.hash_table_t*, %struct.hash_table_t** %ciphone_ht, align 8
  %24 = bitcast i8** %ci.addr to i8*
  %25 = call i64 @getAddr(i8* %24)
  %26 = load i8*, i8** %ci.addr, align 8
  %27 = bitcast i32 (%struct.hash_table_t*, i8*, i32*)* @hash_lookup to i8*
  %28 = call i64 @getAddr(i8* %27)
  %call = call i32 @hash_lookup(%struct.hash_table_t* %23, i8* %26, i32* %id)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end4
  %29 = bitcast i8* %retval to i8*
  store i8 -1, i8* %retval, align 1
  br label %return

if.end:                                           ; preds = %cond.end4
  %30 = bitcast i32* %id to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = load i32, i32* %id, align 4
  %conv = trunc i32 %32 to i8
  %33 = bitcast i8* %retval to i8*
  store i8 %conv, i8* %retval, align 1
  br label %return

return:                                           ; preds = %if.end, %if.then
  %34 = bitcast i8* %retval to i8*
  %35 = call i64 @getAddr(i8* %34)
  %36 = load i8, i8* %retval, align 1
  %37 = bitcast i8 (%struct.mdef_t*, i8*)* @mdef_ciphone_id to i8*
  %38 = call i64 @getAddr(i8* %37)
  call void @funcExit(i64 %38)
  %39 = bitcast i8 (%struct.mdef_t*, i8*)* @mdef_ciphone_id to i8*
  %40 = call i64 @getAddr(i8* %39)
  call void @trackReturn(i64 %40, i64 %35)
  ret i8 %36
}

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #2

declare dso_local i32 @hash_lookup(%struct.hash_table_t*, i8*, i32*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @mdef_ciphone_str(%struct.mdef_t* %m, i8 signext %id) #0 {
entry:
  %0 = bitcast i8* (%struct.mdef_t*, i8)* @mdef_ciphone_str to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %m.addr = alloca %struct.mdef_t*, align 8
  %id.addr = alloca i8, align 1
  %2 = bitcast %struct.mdef_t** %m.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.mdef_t* %m to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %6 = bitcast i8* %id.addr to i8*
  store i8 %id, i8* %id.addr, align 1
  %7 = bitcast %struct.mdef_t** %m.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  %9 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %tobool = icmp ne %struct.mdef_t* %9, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 218, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__PRETTY_FUNCTION__.mdef_ciphone_str, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %10, %cond.true
  %11 = bitcast i8* %id.addr to i8*
  %12 = call i64 @getAddr(i8* %11)
  %13 = load i8, i8* %id.addr, align 1
  %conv = sext i8 %13 to i32
  %cmp = icmp sge i32 %conv, 0
  br i1 %cmp, label %land.lhs.true, label %cond.false6

land.lhs.true:                                    ; preds = %cond.end
  %14 = bitcast i8* %id.addr to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = load i8, i8* %id.addr, align 1
  %conv2 = sext i8 %16 to i32
  %17 = bitcast %struct.mdef_t** %m.addr to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %19, i32 0, i32 0
  %20 = bitcast i32* %n_ciphone to i8*
  %21 = call i64 @getAddr(i8* %20)
  %22 = load i32, i32* %n_ciphone, align 8
  %cmp3 = icmp slt i32 %conv2, %22
  br i1 %cmp3, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %land.lhs.true
  br label %cond.end7

cond.false6:                                      ; preds = %land.lhs.true, %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 219, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__PRETTY_FUNCTION__.mdef_ciphone_str, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end7

cond.end7:                                        ; preds = %23, %cond.true5
  %24 = bitcast %struct.mdef_t** %m.addr to i8*
  %25 = call i64 @getAddr(i8* %24)
  %26 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %26, i32 0, i32 7
  %27 = bitcast %struct.ciphone_t** %ciphone to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone, align 8
  %30 = bitcast i8* %id.addr to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = load i8, i8* %id.addr, align 1
  %conv8 = sext i8 %32 to i32
  %idxprom = sext i32 %conv8 to i64
  %arrayidx = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %29, i64 %idxprom
  %name = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx, i32 0, i32 0
  %33 = bitcast i8** %name to i8*
  %34 = call i64 @getAddr(i8* %33)
  %35 = load i8*, i8** %name, align 8
  %36 = bitcast i8* (%struct.mdef_t*, i8)* @mdef_ciphone_str to i8*
  %37 = call i64 @getAddr(i8* %36)
  call void @funcExit(i64 %37)
  %38 = bitcast i8* (%struct.mdef_t*, i8)* @mdef_ciphone_str to i8*
  %39 = call i64 @getAddr(i8* %38)
  call void @trackReturn(i64 %39, i64 %34)
  ret i8* %35
}

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mdef_phone_id(%struct.mdef_t* %m, i8 signext %ci, i8 signext %lc, i8 signext %rc, i32 %wpos) #0 {
entry:
  %0 = bitcast i32 (%struct.mdef_t*, i8, i8, i8, i32)* @mdef_phone_id to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %retval = alloca i32, align 4
  %m.addr = alloca %struct.mdef_t*, align 8
  %ci.addr = alloca i8, align 1
  %lc.addr = alloca i8, align 1
  %rc.addr = alloca i8, align 1
  %wpos.addr = alloca i32, align 4
  %lcptr = alloca %struct.ph_lc_s*, align 8
  %rcptr = alloca %struct.ph_rc_s*, align 8
  %newl = alloca i8, align 1
  %newr = alloca i8, align 1
  %2 = bitcast %struct.mdef_t** %m.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.mdef_t* %m to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %6 = bitcast i8* %ci.addr to i8*
  store i8 %ci, i8* %ci.addr, align 1
  %7 = bitcast i8* %lc.addr to i8*
  store i8 %lc, i8* %lc.addr, align 1
  %8 = bitcast i8* %rc.addr to i8*
  store i8 %rc, i8* %rc.addr, align 1
  %9 = bitcast i32* %wpos.addr to i8*
  store i32 %wpos, i32* %wpos.addr, align 4
  %10 = bitcast %struct.mdef_t** %m.addr to i8*
  %11 = call i64 @getAddr(i8* %10)
  %12 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %tobool = icmp ne %struct.mdef_t* %12, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 254, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %13, %cond.true
  %14 = bitcast i8* %ci.addr to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = load i8, i8* %ci.addr, align 1
  %conv = sext i8 %16 to i32
  %cmp = icmp sge i32 %conv, 0
  br i1 %cmp, label %land.lhs.true, label %cond.false6

land.lhs.true:                                    ; preds = %cond.end
  %17 = bitcast i8* %ci.addr to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = load i8, i8* %ci.addr, align 1
  %conv2 = sext i8 %19 to i32
  %20 = bitcast %struct.mdef_t** %m.addr to i8*
  %21 = call i64 @getAddr(i8* %20)
  %22 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %22, i32 0, i32 0
  %23 = bitcast i32* %n_ciphone to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = load i32, i32* %n_ciphone, align 8
  %cmp3 = icmp slt i32 %conv2, %25
  br i1 %cmp3, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %land.lhs.true
  br label %cond.end7

cond.false6:                                      ; preds = %land.lhs.true, %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 255, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end7

cond.end7:                                        ; preds = %26, %cond.true5
  %27 = bitcast i8* %lc.addr to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load i8, i8* %lc.addr, align 1
  %conv8 = sext i8 %29 to i32
  %cmp9 = icmp sge i32 %conv8, 0
  br i1 %cmp9, label %land.lhs.true11, label %cond.false17

land.lhs.true11:                                  ; preds = %cond.end7
  %30 = bitcast i8* %lc.addr to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = load i8, i8* %lc.addr, align 1
  %conv12 = sext i8 %32 to i32
  %33 = bitcast %struct.mdef_t** %m.addr to i8*
  %34 = call i64 @getAddr(i8* %33)
  %35 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone13 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %35, i32 0, i32 0
  %36 = bitcast i32* %n_ciphone13 to i8*
  %37 = call i64 @getAddr(i8* %36)
  %38 = load i32, i32* %n_ciphone13, align 8
  %cmp14 = icmp slt i32 %conv12, %38
  br i1 %cmp14, label %cond.true16, label %cond.false17

cond.true16:                                      ; preds = %land.lhs.true11
  br label %cond.end18

cond.false17:                                     ; preds = %land.lhs.true11, %cond.end7
  call void @__assert_fail(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 256, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end18

cond.end18:                                       ; preds = %39, %cond.true16
  %40 = bitcast i8* %rc.addr to i8*
  %41 = call i64 @getAddr(i8* %40)
  %42 = load i8, i8* %rc.addr, align 1
  %conv19 = sext i8 %42 to i32
  %cmp20 = icmp sge i32 %conv19, 0
  br i1 %cmp20, label %land.lhs.true22, label %cond.false28

land.lhs.true22:                                  ; preds = %cond.end18
  %43 = bitcast i8* %rc.addr to i8*
  %44 = call i64 @getAddr(i8* %43)
  %45 = load i8, i8* %rc.addr, align 1
  %conv23 = sext i8 %45 to i32
  %46 = bitcast %struct.mdef_t** %m.addr to i8*
  %47 = call i64 @getAddr(i8* %46)
  %48 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone24 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %48, i32 0, i32 0
  %49 = bitcast i32* %n_ciphone24 to i8*
  %50 = call i64 @getAddr(i8* %49)
  %51 = load i32, i32* %n_ciphone24, align 8
  %cmp25 = icmp slt i32 %conv23, %51
  br i1 %cmp25, label %cond.true27, label %cond.false28

cond.true27:                                      ; preds = %land.lhs.true22
  br label %cond.end29

cond.false28:                                     ; preds = %land.lhs.true22, %cond.end18
  call void @__assert_fail(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 257, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end29

cond.end29:                                       ; preds = %52, %cond.true27
  %53 = bitcast i32* %wpos.addr to i8*
  %54 = call i64 @getAddr(i8* %53)
  %55 = load i32, i32* %wpos.addr, align 4
  %cmp30 = icmp uge i32 %55, 0
  br i1 %cmp30, label %land.lhs.true32, label %cond.false36

land.lhs.true32:                                  ; preds = %cond.end29
  %56 = bitcast i32* %wpos.addr to i8*
  %57 = call i64 @getAddr(i8* %56)
  %58 = load i32, i32* %wpos.addr, align 4
  %cmp33 = icmp ult i32 %58, 4
  br i1 %cmp33, label %cond.true35, label %cond.false36

cond.true35:                                      ; preds = %land.lhs.true32
  br label %cond.end37

cond.false36:                                     ; preds = %land.lhs.true32, %cond.end29
  call void @__assert_fail(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 258, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end37

cond.end37:                                       ; preds = %59, %cond.true35
  %60 = bitcast %struct.mdef_t** %m.addr to i8*
  %61 = call i64 @getAddr(i8* %60)
  %62 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %62, i32 0, i32 15
  %63 = bitcast %struct.ph_lc_s**** %wpos_ci_lclist to i8*
  %64 = call i64 @getAddr(i8* %63)
  %65 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist, align 8
  %66 = bitcast i32* %wpos.addr to i8*
  %67 = call i64 @getAddr(i8* %66)
  %68 = load i32, i32* %wpos.addr, align 4
  %idxprom = zext i32 %68 to i64
  %arrayidx = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %65, i64 %idxprom
  %69 = bitcast %struct.ph_lc_s*** %arrayidx to i8*
  %70 = call i64 @getAddr(i8* %69)
  %71 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx, align 8
  %72 = bitcast i8* %ci.addr to i8*
  %73 = call i64 @getAddr(i8* %72)
  %74 = load i8, i8* %ci.addr, align 1
  %conv38 = sext i8 %74 to i32
  %idxprom39 = sext i32 %conv38 to i64
  %arrayidx40 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %71, i64 %idxprom39
  %75 = bitcast %struct.ph_lc_s** %arrayidx40 to i8*
  %76 = call i64 @getAddr(i8* %75)
  %77 = load %struct.ph_lc_s*, %struct.ph_lc_s** %arrayidx40, align 8
  %78 = bitcast i8* %lc.addr to i8*
  %79 = call i64 @getAddr(i8* %78)
  %80 = load i8, i8* %lc.addr, align 1
  %81 = bitcast %struct.ph_lc_s* (%struct.ph_lc_s*, i8)* @find_ph_lc to i8*
  %82 = call i64 @getAddr(i8* %81)
  call void @addFunArg(i32 1, i64 %82, i64 %79)
  %call = call %struct.ph_lc_s* @find_ph_lc(%struct.ph_lc_s* %77, i8 signext %80)
  %83 = bitcast %struct.ph_lc_s** %lcptr to i8*
  %84 = call i64 @getAddr(i8* %83)
  %85 = bitcast %struct.ph_lc_s* %call to i8*
  %86 = call i64 @getAddr(i8* %85)
  call void @setRealTemp(i64 %84, i64 %86)
  store %struct.ph_lc_s* %call, %struct.ph_lc_s** %lcptr, align 8
  %cmp41 = icmp eq %struct.ph_lc_s* %call, null
  br i1 %cmp41, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end37
  %87 = bitcast %struct.ph_lc_s** %lcptr to i8*
  %88 = call i64 @getAddr(i8* %87)
  %89 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %rclist = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %89, i32 0, i32 1
  %90 = bitcast %struct.ph_rc_s** %rclist to i8*
  %91 = call i64 @getAddr(i8* %90)
  %92 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rclist, align 8
  %93 = bitcast i8* %rc.addr to i8*
  %94 = call i64 @getAddr(i8* %93)
  %95 = load i8, i8* %rc.addr, align 1
  %96 = bitcast %struct.ph_rc_s* (%struct.ph_rc_s*, i8)* @find_ph_rc to i8*
  %97 = call i64 @getAddr(i8* %96)
  call void @addFunArg(i32 1, i64 %97, i64 %94)
  %call43 = call %struct.ph_rc_s* @find_ph_rc(%struct.ph_rc_s* %92, i8 signext %95)
  %98 = bitcast %struct.ph_rc_s** %rcptr to i8*
  %99 = call i64 @getAddr(i8* %98)
  %100 = bitcast %struct.ph_rc_s* %call43 to i8*
  %101 = call i64 @getAddr(i8* %100)
  call void @setRealTemp(i64 %99, i64 %101)
  store %struct.ph_rc_s* %call43, %struct.ph_rc_s** %rcptr, align 8
  %cmp44 = icmp eq %struct.ph_rc_s* %call43, null
  br i1 %cmp44, label %if.then, label %if.end87

if.then:                                          ; preds = %lor.lhs.false, %cond.end37
  %102 = bitcast %struct.mdef_t** %m.addr to i8*
  %103 = call i64 @getAddr(i8* %102)
  %104 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sil = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %104, i32 0, i32 14
  %105 = bitcast i8* %sil to i8*
  %106 = call i64 @getAddr(i8* %105)
  %107 = load i8, i8* %sil, align 8
  %conv46 = sext i8 %107 to i32
  %cmp47 = icmp slt i32 %conv46, 0
  br i1 %cmp47, label %if.then49, label %if.end

if.then49:                                        ; preds = %if.then
  %108 = bitcast i32* %retval to i8*
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %109 = bitcast %struct.mdef_t** %m.addr to i8*
  %110 = call i64 @getAddr(i8* %109)
  %111 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %111, i32 0, i32 7
  %112 = bitcast %struct.ciphone_t** %ciphone to i8*
  %113 = call i64 @getAddr(i8* %112)
  %114 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone, align 8
  %115 = bitcast i8* %lc.addr to i8*
  %116 = call i64 @getAddr(i8* %115)
  %117 = load i8, i8* %lc.addr, align 1
  %conv50 = sext i8 %117 to i32
  %idxprom51 = sext i32 %conv50 to i64
  %arrayidx52 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %114, i64 %idxprom51
  %filler = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx52, i32 0, i32 1
  %118 = bitcast i32* %filler to i8*
  %119 = call i64 @getAddr(i8* %118)
  %120 = load i32, i32* %filler, align 8
  %tobool53 = icmp ne i32 %120, 0
  br i1 %tobool53, label %cond.true54, label %cond.false57

cond.true54:                                      ; preds = %if.end
  %121 = bitcast %struct.mdef_t** %m.addr to i8*
  %122 = call i64 @getAddr(i8* %121)
  %123 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sil55 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %123, i32 0, i32 14
  %124 = bitcast i8* %sil55 to i8*
  %125 = call i64 @getAddr(i8* %124)
  %126 = load i8, i8* %sil55, align 8
  %conv56 = sext i8 %126 to i32
  br label %cond.end59

cond.false57:                                     ; preds = %if.end
  %127 = bitcast i8* %lc.addr to i8*
  %128 = call i64 @getAddr(i8* %127)
  %129 = load i8, i8* %lc.addr, align 1
  %conv58 = sext i8 %129 to i32
  br label %cond.end59

cond.end59:                                       ; preds = %cond.false57, %cond.true54
  %cond = phi i32 [ %conv56, %cond.true54 ], [ %conv58, %cond.false57 ]
  %conv60 = trunc i32 %cond to i8
  %130 = bitcast i8* %newl to i8*
  store i8 %conv60, i8* %newl, align 1
  %131 = bitcast %struct.mdef_t** %m.addr to i8*
  %132 = call i64 @getAddr(i8* %131)
  %133 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone61 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %133, i32 0, i32 7
  %134 = bitcast %struct.ciphone_t** %ciphone61 to i8*
  %135 = call i64 @getAddr(i8* %134)
  %136 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone61, align 8
  %137 = bitcast i8* %rc.addr to i8*
  %138 = call i64 @getAddr(i8* %137)
  %139 = load i8, i8* %rc.addr, align 1
  %conv62 = sext i8 %139 to i32
  %idxprom63 = sext i32 %conv62 to i64
  %arrayidx64 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %136, i64 %idxprom63
  %filler65 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx64, i32 0, i32 1
  %140 = bitcast i32* %filler65 to i8*
  %141 = call i64 @getAddr(i8* %140)
  %142 = load i32, i32* %filler65, align 8
  %tobool66 = icmp ne i32 %142, 0
  br i1 %tobool66, label %cond.true67, label %cond.false70

cond.true67:                                      ; preds = %cond.end59
  %143 = bitcast %struct.mdef_t** %m.addr to i8*
  %144 = call i64 @getAddr(i8* %143)
  %145 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sil68 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %145, i32 0, i32 14
  %146 = bitcast i8* %sil68 to i8*
  %147 = call i64 @getAddr(i8* %146)
  %148 = load i8, i8* %sil68, align 8
  %conv69 = sext i8 %148 to i32
  br label %cond.end72

cond.false70:                                     ; preds = %cond.end59
  %149 = bitcast i8* %rc.addr to i8*
  %150 = call i64 @getAddr(i8* %149)
  %151 = load i8, i8* %rc.addr, align 1
  %conv71 = sext i8 %151 to i32
  br label %cond.end72

cond.end72:                                       ; preds = %cond.false70, %cond.true67
  %cond73 = phi i32 [ %conv69, %cond.true67 ], [ %conv71, %cond.false70 ]
  %conv74 = trunc i32 %cond73 to i8
  %152 = bitcast i8* %newr to i8*
  store i8 %conv74, i8* %newr, align 1
  %153 = bitcast i8* %newl to i8*
  %154 = call i64 @getAddr(i8* %153)
  %155 = load i8, i8* %newl, align 1
  %conv75 = sext i8 %155 to i32
  %156 = bitcast i8* %lc.addr to i8*
  %157 = call i64 @getAddr(i8* %156)
  %158 = load i8, i8* %lc.addr, align 1
  %conv76 = sext i8 %158 to i32
  %cmp77 = icmp eq i32 %conv75, %conv76
  br i1 %cmp77, label %land.lhs.true79, label %if.end85

land.lhs.true79:                                  ; preds = %cond.end72
  %159 = bitcast i8* %newr to i8*
  %160 = call i64 @getAddr(i8* %159)
  %161 = load i8, i8* %newr, align 1
  %conv80 = sext i8 %161 to i32
  %162 = bitcast i8* %rc.addr to i8*
  %163 = call i64 @getAddr(i8* %162)
  %164 = load i8, i8* %rc.addr, align 1
  %conv81 = sext i8 %164 to i32
  %cmp82 = icmp eq i32 %conv80, %conv81
  br i1 %cmp82, label %if.then84, label %if.end85

if.then84:                                        ; preds = %land.lhs.true79
  %165 = bitcast i32* %retval to i8*
  store i32 -1, i32* %retval, align 4
  br label %return

if.end85:                                         ; preds = %land.lhs.true79, %cond.end72
  %166 = bitcast %struct.mdef_t** %m.addr to i8*
  %167 = call i64 @getAddr(i8* %166)
  %168 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %169 = bitcast i8* %ci.addr to i8*
  %170 = call i64 @getAddr(i8* %169)
  %171 = load i8, i8* %ci.addr, align 1
  %172 = bitcast i8* %newl to i8*
  %173 = call i64 @getAddr(i8* %172)
  %174 = load i8, i8* %newl, align 1
  %175 = bitcast i8* %newr to i8*
  %176 = call i64 @getAddr(i8* %175)
  %177 = load i8, i8* %newr, align 1
  %178 = bitcast i32* %wpos.addr to i8*
  %179 = call i64 @getAddr(i8* %178)
  %180 = load i32, i32* %wpos.addr, align 4
  %181 = bitcast i32 (%struct.mdef_t*, i8, i8, i8, i32)* @mdef_phone_id to i8*
  %182 = call i64 @getAddr(i8* %181)
  call void @addFunArg(i32 1, i64 %182, i64 %170)
  call void @addFunArg(i32 2, i64 %182, i64 %173)
  call void @addFunArg(i32 3, i64 %182, i64 %176)
  call void @addFunArg(i32 4, i64 %182, i64 %179)
  %call86 = call i32 @mdef_phone_id(%struct.mdef_t* %168, i8 signext %171, i8 signext %174, i8 signext %177, i32 %180)
  %183 = bitcast i32* %retval to i8*
  store i32 %call86, i32* %retval, align 4
  br label %return

if.end87:                                         ; preds = %lor.lhs.false
  %184 = bitcast %struct.ph_rc_s** %rcptr to i8*
  %185 = call i64 @getAddr(i8* %184)
  %186 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %pid = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %186, i32 0, i32 1
  %187 = bitcast i32* %pid to i8*
  %188 = call i64 @getAddr(i8* %187)
  %189 = load i32, i32* %pid, align 4
  %190 = bitcast i32* %retval to i8*
  store i32 %189, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end87, %if.end85, %if.then84, %if.then49
  %191 = bitcast i32* %retval to i8*
  %192 = call i64 @getAddr(i8* %191)
  %193 = load i32, i32* %retval, align 4
  %194 = bitcast i32 (%struct.mdef_t*, i8, i8, i8, i32)* @mdef_phone_id to i8*
  %195 = call i64 @getAddr(i8* %194)
  call void @funcExit(i64 %195)
  %196 = bitcast i32 (%struct.mdef_t*, i8, i8, i8, i32)* @mdef_phone_id to i8*
  %197 = call i64 @getAddr(i8* %196)
  call void @trackReturn(i64 %197, i64 %192)
  ret i32 %193
}

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct.ph_lc_s* @find_ph_lc(%struct.ph_lc_s* %lclist, i8 signext %lc) #0 {
entry:
  %0 = bitcast %struct.ph_lc_s* (%struct.ph_lc_s*, i8)* @find_ph_lc to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %lclist.addr = alloca %struct.ph_lc_s*, align 8
  %lc.addr = alloca i8, align 1
  %lcptr = alloca %struct.ph_lc_s*, align 8
  %2 = bitcast %struct.ph_lc_s** %lclist.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.ph_lc_s* %lclist to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.ph_lc_s* %lclist, %struct.ph_lc_s** %lclist.addr, align 8
  %6 = bitcast i8* %lc.addr to i8*
  store i8 %lc, i8* %lc.addr, align 1
  %7 = bitcast %struct.ph_lc_s** %lclist.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  %9 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lclist.addr, align 8
  %10 = bitcast %struct.ph_lc_s** %lcptr to i8*
  %11 = call i64 @getAddr(i8* %10)
  %12 = bitcast %struct.ph_lc_s* %9 to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @setRealTemp(i64 %11, i64 %13)
  store %struct.ph_lc_s* %9, %struct.ph_lc_s** %lcptr, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %14 = bitcast %struct.ph_lc_s** %lcptr to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %tobool = icmp ne %struct.ph_lc_s* %16, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %17 = bitcast %struct.ph_lc_s** %lcptr to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %lc1 = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %19, i32 0, i32 0
  %20 = bitcast i8* %lc1 to i8*
  %21 = call i64 @getAddr(i8* %20)
  %22 = load i8, i8* %lc1, align 8
  %conv = sext i8 %22 to i32
  %23 = bitcast i8* %lc.addr to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = load i8, i8* %lc.addr, align 1
  %conv2 = sext i8 %25 to i32
  %cmp = icmp ne i32 %conv, %conv2
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %26 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ]
  br i1 %26, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %27 = bitcast %struct.ph_lc_s** %lcptr to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %next = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %29, i32 0, i32 2
  %30 = bitcast %struct.ph_lc_s** %next to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = load %struct.ph_lc_s*, %struct.ph_lc_s** %next, align 8
  %33 = bitcast %struct.ph_lc_s** %lcptr to i8*
  %34 = call i64 @getAddr(i8* %33)
  %35 = bitcast %struct.ph_lc_s* %32 to i8*
  %36 = call i64 @getAddr(i8* %35)
  call void @setRealTemp(i64 %34, i64 %36)
  store %struct.ph_lc_s* %32, %struct.ph_lc_s** %lcptr, align 8
  br label %for.cond

for.end:                                          ; preds = %land.end
  %37 = bitcast %struct.ph_lc_s** %lcptr to i8*
  %38 = call i64 @getAddr(i8* %37)
  %39 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %40 = bitcast %struct.ph_lc_s* (%struct.ph_lc_s*, i8)* @find_ph_lc to i8*
  %41 = call i64 @getAddr(i8* %40)
  call void @funcExit(i64 %41)
  %42 = bitcast %struct.ph_lc_s* (%struct.ph_lc_s*, i8)* @find_ph_lc to i8*
  %43 = call i64 @getAddr(i8* %42)
  call void @trackReturn(i64 %43, i64 %38)
  ret %struct.ph_lc_s* %39
}

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct.ph_rc_s* @find_ph_rc(%struct.ph_rc_s* %rclist, i8 signext %rc) #0 {
entry:
  %0 = bitcast %struct.ph_rc_s* (%struct.ph_rc_s*, i8)* @find_ph_rc to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %rclist.addr = alloca %struct.ph_rc_s*, align 8
  %rc.addr = alloca i8, align 1
  %rcptr = alloca %struct.ph_rc_s*, align 8
  %2 = bitcast %struct.ph_rc_s** %rclist.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.ph_rc_s* %rclist to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.ph_rc_s* %rclist, %struct.ph_rc_s** %rclist.addr, align 8
  %6 = bitcast i8* %rc.addr to i8*
  store i8 %rc, i8* %rc.addr, align 1
  %7 = bitcast %struct.ph_rc_s** %rclist.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  %9 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rclist.addr, align 8
  %10 = bitcast %struct.ph_rc_s** %rcptr to i8*
  %11 = call i64 @getAddr(i8* %10)
  %12 = bitcast %struct.ph_rc_s* %9 to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @setRealTemp(i64 %11, i64 %13)
  store %struct.ph_rc_s* %9, %struct.ph_rc_s** %rcptr, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %14 = bitcast %struct.ph_rc_s** %rcptr to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %tobool = icmp ne %struct.ph_rc_s* %16, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %17 = bitcast %struct.ph_rc_s** %rcptr to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %rc1 = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %19, i32 0, i32 0
  %20 = bitcast i8* %rc1 to i8*
  %21 = call i64 @getAddr(i8* %20)
  %22 = load i8, i8* %rc1, align 8
  %conv = sext i8 %22 to i32
  %23 = bitcast i8* %rc.addr to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = load i8, i8* %rc.addr, align 1
  %conv2 = sext i8 %25 to i32
  %cmp = icmp ne i32 %conv, %conv2
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %26 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ]
  br i1 %26, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %27 = bitcast %struct.ph_rc_s** %rcptr to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %next = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %29, i32 0, i32 2
  %30 = bitcast %struct.ph_rc_s** %next to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = load %struct.ph_rc_s*, %struct.ph_rc_s** %next, align 8
  %33 = bitcast %struct.ph_rc_s** %rcptr to i8*
  %34 = call i64 @getAddr(i8* %33)
  %35 = bitcast %struct.ph_rc_s* %32 to i8*
  %36 = call i64 @getAddr(i8* %35)
  call void @setRealTemp(i64 %34, i64 %36)
  store %struct.ph_rc_s* %32, %struct.ph_rc_s** %rcptr, align 8
  br label %for.cond

for.end:                                          ; preds = %land.end
  %37 = bitcast %struct.ph_rc_s** %rcptr to i8*
  %38 = call i64 @getAddr(i8* %37)
  %39 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %40 = bitcast %struct.ph_rc_s* (%struct.ph_rc_s*, i8)* @find_ph_rc to i8*
  %41 = call i64 @getAddr(i8* %40)
  call void @funcExit(i64 %41)
  %42 = bitcast %struct.ph_rc_s* (%struct.ph_rc_s*, i8)* @find_ph_rc to i8*
  %43 = call i64 @getAddr(i8* %42)
  call void @trackReturn(i64 %43, i64 %38)
  ret %struct.ph_rc_s* %39
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mdef_phone_id_nearest(%struct.mdef_t* %m, i8 signext %b, i8 signext %l, i8 signext %r, i32 %pos) #0 {
entry:
  %0 = bitcast i32 (%struct.mdef_t*, i8, i8, i8, i32)* @mdef_phone_id_nearest to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %retval = alloca i32, align 4
  %m.addr = alloca %struct.mdef_t*, align 8
  %b.addr = alloca i8, align 1
  %l.addr = alloca i8, align 1
  %r.addr = alloca i8, align 1
  %pos.addr = alloca i32, align 4
  %tmppos = alloca i32, align 4
  %p = alloca i32, align 4
  %newl = alloca i8, align 1
  %newr = alloca i8, align 1
  %wpos_name = alloca i8*, align 8
  %2 = bitcast %struct.mdef_t** %m.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.mdef_t* %m to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %6 = bitcast i8* %b.addr to i8*
  store i8 %b, i8* %b.addr, align 1
  %7 = bitcast i8* %l.addr to i8*
  store i8 %l, i8* %l.addr, align 1
  %8 = bitcast i8* %r.addr to i8*
  store i8 %r, i8* %r.addr, align 1
  %9 = bitcast i32* %pos.addr to i8*
  store i32 %pos, i32* %pos.addr, align 4
  %10 = bitcast %struct.mdef_t** %m.addr to i8*
  %11 = call i64 @getAddr(i8* %10)
  %12 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %tobool = icmp ne %struct.mdef_t* %12, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 286, i8* getelementptr inbounds ([86 x i8], [86 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id_nearest, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %13, %cond.true
  %14 = bitcast i8* %b.addr to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = load i8, i8* %b.addr, align 1
  %conv = sext i8 %16 to i32
  %cmp = icmp sge i32 %conv, 0
  br i1 %cmp, label %land.lhs.true, label %cond.false6

land.lhs.true:                                    ; preds = %cond.end
  %17 = bitcast i8* %b.addr to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = load i8, i8* %b.addr, align 1
  %conv2 = sext i8 %19 to i32
  %20 = bitcast %struct.mdef_t** %m.addr to i8*
  %21 = call i64 @getAddr(i8* %20)
  %22 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %22, i32 0, i32 0
  %23 = bitcast i32* %n_ciphone to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = load i32, i32* %n_ciphone, align 8
  %cmp3 = icmp slt i32 %conv2, %25
  br i1 %cmp3, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %land.lhs.true
  br label %cond.end7

cond.false6:                                      ; preds = %land.lhs.true, %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 287, i8* getelementptr inbounds ([86 x i8], [86 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id_nearest, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end7

cond.end7:                                        ; preds = %26, %cond.true5
  %27 = bitcast i32* %pos.addr to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load i32, i32* %pos.addr, align 4
  %cmp8 = icmp uge i32 %29, 0
  br i1 %cmp8, label %land.lhs.true10, label %cond.false14

land.lhs.true10:                                  ; preds = %cond.end7
  %30 = bitcast i32* %pos.addr to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = load i32, i32* %pos.addr, align 4
  %cmp11 = icmp ult i32 %32, 4
  br i1 %cmp11, label %cond.true13, label %cond.false14

cond.true13:                                      ; preds = %land.lhs.true10
  br label %cond.end15

cond.false14:                                     ; preds = %land.lhs.true10, %cond.end7
  call void @__assert_fail(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 288, i8* getelementptr inbounds ([86 x i8], [86 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id_nearest, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end15

cond.end15:                                       ; preds = %33, %cond.true13
  %34 = bitcast i8* %l.addr to i8*
  %35 = call i64 @getAddr(i8* %34)
  %36 = load i8, i8* %l.addr, align 1
  %conv16 = sext i8 %36 to i32
  %cmp17 = icmp slt i32 %conv16, 0
  br i1 %cmp17, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end15
  %37 = bitcast i8* %r.addr to i8*
  %38 = call i64 @getAddr(i8* %37)
  %39 = load i8, i8* %r.addr, align 1
  %conv19 = sext i8 %39 to i32
  %cmp20 = icmp slt i32 %conv19, 0
  br i1 %cmp20, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %cond.end15
  %40 = bitcast i8* %b.addr to i8*
  %41 = call i64 @getAddr(i8* %40)
  %42 = load i8, i8* %b.addr, align 1
  %conv22 = sext i8 %42 to i32
  %43 = bitcast i32* %retval to i8*
  store i32 %conv22, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %44 = bitcast i8* %l.addr to i8*
  %45 = call i64 @getAddr(i8* %44)
  %46 = load i8, i8* %l.addr, align 1
  %conv23 = sext i8 %46 to i32
  %cmp24 = icmp sge i32 %conv23, 0
  br i1 %cmp24, label %land.lhs.true26, label %cond.false32

land.lhs.true26:                                  ; preds = %if.end
  %47 = bitcast i8* %l.addr to i8*
  %48 = call i64 @getAddr(i8* %47)
  %49 = load i8, i8* %l.addr, align 1
  %conv27 = sext i8 %49 to i32
  %50 = bitcast %struct.mdef_t** %m.addr to i8*
  %51 = call i64 @getAddr(i8* %50)
  %52 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone28 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %52, i32 0, i32 0
  %53 = bitcast i32* %n_ciphone28 to i8*
  %54 = call i64 @getAddr(i8* %53)
  %55 = load i32, i32* %n_ciphone28, align 8
  %cmp29 = icmp slt i32 %conv27, %55
  br i1 %cmp29, label %cond.true31, label %cond.false32

cond.true31:                                      ; preds = %land.lhs.true26
  br label %cond.end33

cond.false32:                                     ; preds = %land.lhs.true26, %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 293, i8* getelementptr inbounds ([86 x i8], [86 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id_nearest, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end33

cond.end33:                                       ; preds = %56, %cond.true31
  %57 = bitcast i8* %r.addr to i8*
  %58 = call i64 @getAddr(i8* %57)
  %59 = load i8, i8* %r.addr, align 1
  %conv34 = sext i8 %59 to i32
  %cmp35 = icmp sge i32 %conv34, 0
  br i1 %cmp35, label %land.lhs.true37, label %cond.false43

land.lhs.true37:                                  ; preds = %cond.end33
  %60 = bitcast i8* %r.addr to i8*
  %61 = call i64 @getAddr(i8* %60)
  %62 = load i8, i8* %r.addr, align 1
  %conv38 = sext i8 %62 to i32
  %63 = bitcast %struct.mdef_t** %m.addr to i8*
  %64 = call i64 @getAddr(i8* %63)
  %65 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone39 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %65, i32 0, i32 0
  %66 = bitcast i32* %n_ciphone39 to i8*
  %67 = call i64 @getAddr(i8* %66)
  %68 = load i32, i32* %n_ciphone39, align 8
  %cmp40 = icmp slt i32 %conv38, %68
  br i1 %cmp40, label %cond.true42, label %cond.false43

cond.true42:                                      ; preds = %land.lhs.true37
  br label %cond.end44

cond.false43:                                     ; preds = %land.lhs.true37, %cond.end33
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 294, i8* getelementptr inbounds ([86 x i8], [86 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id_nearest, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end44

cond.end44:                                       ; preds = %69, %cond.true42
  %70 = bitcast %struct.mdef_t** %m.addr to i8*
  %71 = call i64 @getAddr(i8* %70)
  %72 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %73 = bitcast i8* %b.addr to i8*
  %74 = call i64 @getAddr(i8* %73)
  %75 = load i8, i8* %b.addr, align 1
  %76 = bitcast i8* %l.addr to i8*
  %77 = call i64 @getAddr(i8* %76)
  %78 = load i8, i8* %l.addr, align 1
  %79 = bitcast i8* %r.addr to i8*
  %80 = call i64 @getAddr(i8* %79)
  %81 = load i8, i8* %r.addr, align 1
  %82 = bitcast i32* %pos.addr to i8*
  %83 = call i64 @getAddr(i8* %82)
  %84 = load i32, i32* %pos.addr, align 4
  %85 = bitcast i32 (%struct.mdef_t*, i8, i8, i8, i32)* @mdef_phone_id to i8*
  %86 = call i64 @getAddr(i8* %85)
  call void @addFunArg(i32 1, i64 %86, i64 %74)
  call void @addFunArg(i32 2, i64 %86, i64 %77)
  call void @addFunArg(i32 3, i64 %86, i64 %80)
  call void @addFunArg(i32 4, i64 %86, i64 %83)
  %call = call i32 @mdef_phone_id(%struct.mdef_t* %72, i8 signext %75, i8 signext %78, i8 signext %81, i32 %84)
  %87 = bitcast i32* %p to i8*
  store i32 %call, i32* %p, align 4
  %88 = bitcast i32* %p to i8*
  %89 = call i64 @getAddr(i8* %88)
  %90 = load i32, i32* %p, align 4
  %cmp45 = icmp sge i32 %90, 0
  br i1 %cmp45, label %if.then47, label %if.end48

if.then47:                                        ; preds = %cond.end44
  %91 = bitcast i32* %p to i8*
  %92 = call i64 @getAddr(i8* %91)
  %93 = load i32, i32* %p, align 4
  %94 = bitcast i32* %retval to i8*
  store i32 %93, i32* %retval, align 4
  br label %return

if.end48:                                         ; preds = %cond.end44
  %95 = bitcast i32* %tmppos to i8*
  store i32 0, i32* %tmppos, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end48
  %96 = bitcast i32* %tmppos to i8*
  %97 = call i64 @getAddr(i8* %96)
  %98 = load i32, i32* %tmppos, align 4
  %cmp49 = icmp ult i32 %98, 4
  br i1 %cmp49, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %99 = bitcast i32* %tmppos to i8*
  %100 = call i64 @getAddr(i8* %99)
  %101 = load i32, i32* %tmppos, align 4
  %102 = bitcast i32* %pos.addr to i8*
  %103 = call i64 @getAddr(i8* %102)
  %104 = load i32, i32* %pos.addr, align 4
  %cmp51 = icmp ne i32 %101, %104
  br i1 %cmp51, label %if.then53, label %if.end59

if.then53:                                        ; preds = %for.body
  %105 = bitcast %struct.mdef_t** %m.addr to i8*
  %106 = call i64 @getAddr(i8* %105)
  %107 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %108 = bitcast i8* %b.addr to i8*
  %109 = call i64 @getAddr(i8* %108)
  %110 = load i8, i8* %b.addr, align 1
  %111 = bitcast i8* %l.addr to i8*
  %112 = call i64 @getAddr(i8* %111)
  %113 = load i8, i8* %l.addr, align 1
  %114 = bitcast i8* %r.addr to i8*
  %115 = call i64 @getAddr(i8* %114)
  %116 = load i8, i8* %r.addr, align 1
  %117 = bitcast i32* %tmppos to i8*
  %118 = call i64 @getAddr(i8* %117)
  %119 = load i32, i32* %tmppos, align 4
  %120 = bitcast i32 (%struct.mdef_t*, i8, i8, i8, i32)* @mdef_phone_id to i8*
  %121 = call i64 @getAddr(i8* %120)
  call void @addFunArg(i32 1, i64 %121, i64 %109)
  call void @addFunArg(i32 2, i64 %121, i64 %112)
  call void @addFunArg(i32 3, i64 %121, i64 %115)
  call void @addFunArg(i32 4, i64 %121, i64 %118)
  %call54 = call i32 @mdef_phone_id(%struct.mdef_t* %107, i8 signext %110, i8 signext %113, i8 signext %116, i32 %119)
  %122 = bitcast i32* %p to i8*
  store i32 %call54, i32* %p, align 4
  %123 = bitcast i32* %p to i8*
  %124 = call i64 @getAddr(i8* %123)
  %125 = load i32, i32* %p, align 4
  %cmp55 = icmp sge i32 %125, 0
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.then53
  %126 = bitcast i32* %p to i8*
  %127 = call i64 @getAddr(i8* %126)
  %128 = load i32, i32* %p, align 4
  %129 = bitcast i32* %retval to i8*
  store i32 %128, i32* %retval, align 4
  br label %return

if.end58:                                         ; preds = %if.then53
  br label %if.end59

if.end59:                                         ; preds = %if.end58, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end59
  %130 = bitcast i32* %tmppos to i8*
  %131 = call i64 @getAddr(i8* %130)
  %132 = load i32, i32* %tmppos, align 4
  %inc = add i32 %132, 1
  %133 = bitcast i32* %tmppos to i8*
  store i32 %inc, i32* %tmppos, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %134 = bitcast %struct.mdef_t** %m.addr to i8*
  %135 = call i64 @getAddr(i8* %134)
  %136 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sil = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %136, i32 0, i32 14
  %137 = bitcast i8* %sil to i8*
  %138 = call i64 @getAddr(i8* %137)
  %139 = load i8, i8* %sil, align 8
  %conv60 = sext i8 %139 to i32
  %cmp61 = icmp sge i32 %conv60, 0
  br i1 %cmp61, label %if.then63, label %if.end119

if.then63:                                        ; preds = %for.end
  %140 = bitcast %struct.mdef_t** %m.addr to i8*
  %141 = call i64 @getAddr(i8* %140)
  %142 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %142, i32 0, i32 7
  %143 = bitcast %struct.ciphone_t** %ciphone to i8*
  %144 = call i64 @getAddr(i8* %143)
  %145 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone, align 8
  %146 = bitcast i8* %l.addr to i8*
  %147 = call i64 @getAddr(i8* %146)
  %148 = load i8, i8* %l.addr, align 1
  %conv64 = sext i8 %148 to i32
  %idxprom = sext i32 %conv64 to i64
  %arrayidx = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %145, i64 %idxprom
  %filler = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx, i32 0, i32 1
  %149 = bitcast i32* %filler to i8*
  %150 = call i64 @getAddr(i8* %149)
  %151 = load i32, i32* %filler, align 8
  %tobool65 = icmp ne i32 %151, 0
  br i1 %tobool65, label %cond.true66, label %cond.false69

cond.true66:                                      ; preds = %if.then63
  %152 = bitcast %struct.mdef_t** %m.addr to i8*
  %153 = call i64 @getAddr(i8* %152)
  %154 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sil67 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %154, i32 0, i32 14
  %155 = bitcast i8* %sil67 to i8*
  %156 = call i64 @getAddr(i8* %155)
  %157 = load i8, i8* %sil67, align 8
  %conv68 = sext i8 %157 to i32
  br label %cond.end71

cond.false69:                                     ; preds = %if.then63
  %158 = bitcast i8* %l.addr to i8*
  %159 = call i64 @getAddr(i8* %158)
  %160 = load i8, i8* %l.addr, align 1
  %conv70 = sext i8 %160 to i32
  br label %cond.end71

cond.end71:                                       ; preds = %cond.false69, %cond.true66
  %cond = phi i32 [ %conv68, %cond.true66 ], [ %conv70, %cond.false69 ]
  %conv72 = trunc i32 %cond to i8
  %161 = bitcast i8* %newl to i8*
  store i8 %conv72, i8* %newl, align 1
  %162 = bitcast %struct.mdef_t** %m.addr to i8*
  %163 = call i64 @getAddr(i8* %162)
  %164 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone73 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %164, i32 0, i32 7
  %165 = bitcast %struct.ciphone_t** %ciphone73 to i8*
  %166 = call i64 @getAddr(i8* %165)
  %167 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone73, align 8
  %168 = bitcast i8* %r.addr to i8*
  %169 = call i64 @getAddr(i8* %168)
  %170 = load i8, i8* %r.addr, align 1
  %conv74 = sext i8 %170 to i32
  %idxprom75 = sext i32 %conv74 to i64
  %arrayidx76 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %167, i64 %idxprom75
  %filler77 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx76, i32 0, i32 1
  %171 = bitcast i32* %filler77 to i8*
  %172 = call i64 @getAddr(i8* %171)
  %173 = load i32, i32* %filler77, align 8
  %tobool78 = icmp ne i32 %173, 0
  br i1 %tobool78, label %cond.true79, label %cond.false82

cond.true79:                                      ; preds = %cond.end71
  %174 = bitcast %struct.mdef_t** %m.addr to i8*
  %175 = call i64 @getAddr(i8* %174)
  %176 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sil80 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %176, i32 0, i32 14
  %177 = bitcast i8* %sil80 to i8*
  %178 = call i64 @getAddr(i8* %177)
  %179 = load i8, i8* %sil80, align 8
  %conv81 = sext i8 %179 to i32
  br label %cond.end84

cond.false82:                                     ; preds = %cond.end71
  %180 = bitcast i8* %r.addr to i8*
  %181 = call i64 @getAddr(i8* %180)
  %182 = load i8, i8* %r.addr, align 1
  %conv83 = sext i8 %182 to i32
  br label %cond.end84

cond.end84:                                       ; preds = %cond.false82, %cond.true79
  %cond85 = phi i32 [ %conv81, %cond.true79 ], [ %conv83, %cond.false82 ]
  %conv86 = trunc i32 %cond85 to i8
  %183 = bitcast i8* %newr to i8*
  store i8 %conv86, i8* %newr, align 1
  %184 = bitcast i8* %newl to i8*
  %185 = call i64 @getAddr(i8* %184)
  %186 = load i8, i8* %newl, align 1
  %conv87 = sext i8 %186 to i32
  %187 = bitcast i8* %l.addr to i8*
  %188 = call i64 @getAddr(i8* %187)
  %189 = load i8, i8* %l.addr, align 1
  %conv88 = sext i8 %189 to i32
  %cmp89 = icmp ne i32 %conv87, %conv88
  br i1 %cmp89, label %if.then96, label %lor.lhs.false91

lor.lhs.false91:                                  ; preds = %cond.end84
  %190 = bitcast i8* %newr to i8*
  %191 = call i64 @getAddr(i8* %190)
  %192 = load i8, i8* %newr, align 1
  %conv92 = sext i8 %192 to i32
  %193 = bitcast i8* %r.addr to i8*
  %194 = call i64 @getAddr(i8* %193)
  %195 = load i8, i8* %r.addr, align 1
  %conv93 = sext i8 %195 to i32
  %cmp94 = icmp ne i32 %conv92, %conv93
  br i1 %cmp94, label %if.then96, label %if.end118

if.then96:                                        ; preds = %lor.lhs.false91, %cond.end84
  %196 = bitcast %struct.mdef_t** %m.addr to i8*
  %197 = call i64 @getAddr(i8* %196)
  %198 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %199 = bitcast i8* %b.addr to i8*
  %200 = call i64 @getAddr(i8* %199)
  %201 = load i8, i8* %b.addr, align 1
  %202 = bitcast i8* %newl to i8*
  %203 = call i64 @getAddr(i8* %202)
  %204 = load i8, i8* %newl, align 1
  %205 = bitcast i8* %newr to i8*
  %206 = call i64 @getAddr(i8* %205)
  %207 = load i8, i8* %newr, align 1
  %208 = bitcast i32* %pos.addr to i8*
  %209 = call i64 @getAddr(i8* %208)
  %210 = load i32, i32* %pos.addr, align 4
  %211 = bitcast i32 (%struct.mdef_t*, i8, i8, i8, i32)* @mdef_phone_id to i8*
  %212 = call i64 @getAddr(i8* %211)
  call void @addFunArg(i32 1, i64 %212, i64 %200)
  call void @addFunArg(i32 2, i64 %212, i64 %203)
  call void @addFunArg(i32 3, i64 %212, i64 %206)
  call void @addFunArg(i32 4, i64 %212, i64 %209)
  %call97 = call i32 @mdef_phone_id(%struct.mdef_t* %198, i8 signext %201, i8 signext %204, i8 signext %207, i32 %210)
  %213 = bitcast i32* %p to i8*
  store i32 %call97, i32* %p, align 4
  %214 = bitcast i32* %p to i8*
  %215 = call i64 @getAddr(i8* %214)
  %216 = load i32, i32* %p, align 4
  %cmp98 = icmp sge i32 %216, 0
  br i1 %cmp98, label %if.then100, label %if.end101

if.then100:                                       ; preds = %if.then96
  %217 = bitcast i32* %p to i8*
  %218 = call i64 @getAddr(i8* %217)
  %219 = load i32, i32* %p, align 4
  %220 = bitcast i32* %retval to i8*
  store i32 %219, i32* %retval, align 4
  br label %return

if.end101:                                        ; preds = %if.then96
  %221 = bitcast i32* %tmppos to i8*
  store i32 0, i32* %tmppos, align 4
  br label %for.cond102

for.cond102:                                      ; preds = %for.inc115, %if.end101
  %222 = bitcast i32* %tmppos to i8*
  %223 = call i64 @getAddr(i8* %222)
  %224 = load i32, i32* %tmppos, align 4
  %cmp103 = icmp ult i32 %224, 4
  br i1 %cmp103, label %for.body105, label %for.end117

for.body105:                                      ; preds = %for.cond102
  %225 = bitcast i32* %tmppos to i8*
  %226 = call i64 @getAddr(i8* %225)
  %227 = load i32, i32* %tmppos, align 4
  %228 = bitcast i32* %pos.addr to i8*
  %229 = call i64 @getAddr(i8* %228)
  %230 = load i32, i32* %pos.addr, align 4
  %cmp106 = icmp ne i32 %227, %230
  br i1 %cmp106, label %if.then108, label %if.end114

if.then108:                                       ; preds = %for.body105
  %231 = bitcast %struct.mdef_t** %m.addr to i8*
  %232 = call i64 @getAddr(i8* %231)
  %233 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %234 = bitcast i8* %b.addr to i8*
  %235 = call i64 @getAddr(i8* %234)
  %236 = load i8, i8* %b.addr, align 1
  %237 = bitcast i8* %newl to i8*
  %238 = call i64 @getAddr(i8* %237)
  %239 = load i8, i8* %newl, align 1
  %240 = bitcast i8* %newr to i8*
  %241 = call i64 @getAddr(i8* %240)
  %242 = load i8, i8* %newr, align 1
  %243 = bitcast i32* %tmppos to i8*
  %244 = call i64 @getAddr(i8* %243)
  %245 = load i32, i32* %tmppos, align 4
  %246 = bitcast i32 (%struct.mdef_t*, i8, i8, i8, i32)* @mdef_phone_id to i8*
  %247 = call i64 @getAddr(i8* %246)
  call void @addFunArg(i32 1, i64 %247, i64 %235)
  call void @addFunArg(i32 2, i64 %247, i64 %238)
  call void @addFunArg(i32 3, i64 %247, i64 %241)
  call void @addFunArg(i32 4, i64 %247, i64 %244)
  %call109 = call i32 @mdef_phone_id(%struct.mdef_t* %233, i8 signext %236, i8 signext %239, i8 signext %242, i32 %245)
  %248 = bitcast i32* %p to i8*
  store i32 %call109, i32* %p, align 4
  %249 = bitcast i32* %p to i8*
  %250 = call i64 @getAddr(i8* %249)
  %251 = load i32, i32* %p, align 4
  %cmp110 = icmp sge i32 %251, 0
  br i1 %cmp110, label %if.then112, label %if.end113

if.then112:                                       ; preds = %if.then108
  %252 = bitcast i32* %p to i8*
  %253 = call i64 @getAddr(i8* %252)
  %254 = load i32, i32* %p, align 4
  %255 = bitcast i32* %retval to i8*
  store i32 %254, i32* %retval, align 4
  br label %return

if.end113:                                        ; preds = %if.then108
  br label %if.end114

if.end114:                                        ; preds = %if.end113, %for.body105
  br label %for.inc115

for.inc115:                                       ; preds = %if.end114
  %256 = bitcast i32* %tmppos to i8*
  %257 = call i64 @getAddr(i8* %256)
  %258 = load i32, i32* %tmppos, align 4
  %inc116 = add i32 %258, 1
  %259 = bitcast i32* %tmppos to i8*
  store i32 %inc116, i32* %tmppos, align 4
  br label %for.cond102

for.end117:                                       ; preds = %for.cond102
  br label %if.end118

if.end118:                                        ; preds = %for.end117, %lor.lhs.false91
  br label %if.end119

if.end119:                                        ; preds = %if.end118, %for.end
  %260 = bitcast %struct.mdef_t** %m.addr to i8*
  %261 = call i64 @getAddr(i8* %260)
  %262 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %262, i32 0, i32 1
  %263 = bitcast i32* %n_phone to i8*
  %264 = call i64 @getAddr(i8* %263)
  %265 = load i32, i32* %n_phone, align 4
  %266 = bitcast %struct.mdef_t** %m.addr to i8*
  %267 = call i64 @getAddr(i8* %266)
  %268 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone120 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %268, i32 0, i32 0
  %269 = bitcast i32* %n_ciphone120 to i8*
  %270 = call i64 @getAddr(i8* %269)
  %271 = load i32, i32* %n_ciphone120, align 8
  %cmp121 = icmp sgt i32 %265, %271
  br i1 %cmp121, label %land.lhs.true123, label %if.end131

land.lhs.true123:                                 ; preds = %if.end119
  %272 = bitcast %struct.mdef_t** %m.addr to i8*
  %273 = call i64 @getAddr(i8* %272)
  %274 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone124 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %274, i32 0, i32 7
  %275 = bitcast %struct.ciphone_t** %ciphone124 to i8*
  %276 = call i64 @getAddr(i8* %275)
  %277 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone124, align 8
  %278 = bitcast i8* %b.addr to i8*
  %279 = call i64 @getAddr(i8* %278)
  %280 = load i8, i8* %b.addr, align 1
  %conv125 = sext i8 %280 to i32
  %idxprom126 = sext i32 %conv125 to i64
  %arrayidx127 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %277, i64 %idxprom126
  %filler128 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx127, i32 0, i32 1
  %281 = bitcast i32* %filler128 to i8*
  %282 = call i64 @getAddr(i8* %281)
  %283 = load i32, i32* %filler128, align 8
  %tobool129 = icmp ne i32 %283, 0
  br i1 %tobool129, label %if.end131, label %if.then130

if.then130:                                       ; preds = %land.lhs.true123
  %284 = bitcast i8** %wpos_name to i8*
  %285 = call i64 @getAddr(i8* %284)
  %286 = bitcast i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0) to i8*
  %287 = call i64 @getAddr(i8* %286)
  call void @setRealTemp(i64 %285, i64 %287)
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0), i8** %wpos_name, align 8
  br label %if.end131

if.end131:                                        ; preds = %if.then130, %land.lhs.true123, %if.end119
  %288 = bitcast i8* %b.addr to i8*
  %289 = call i64 @getAddr(i8* %288)
  %290 = load i8, i8* %b.addr, align 1
  %conv132 = sext i8 %290 to i32
  %291 = bitcast i32* %retval to i8*
  store i32 %conv132, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end131, %if.then112, %if.then100, %if.then57, %if.then47, %if.then
  %292 = bitcast i32* %retval to i8*
  %293 = call i64 @getAddr(i8* %292)
  %294 = load i32, i32* %retval, align 4
  %295 = bitcast i32 (%struct.mdef_t*, i8, i8, i8, i32)* @mdef_phone_id_nearest to i8*
  %296 = call i64 @getAddr(i8* %295)
  call void @funcExit(i64 %296)
  %297 = bitcast i32 (%struct.mdef_t*, i8, i8, i8, i32)* @mdef_phone_id_nearest to i8*
  %298 = call i64 @getAddr(i8* %297)
  call void @trackReturn(i64 %298, i64 %293)
  ret i32 %294
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mdef_phone_components(%struct.mdef_t* %m, i32 %p, i8* %b, i8* %l, i8* %r, i32* %pos) #0 {
entry:
  %0 = bitcast i32 (%struct.mdef_t*, i32, i8*, i8*, i8*, i32*)* @mdef_phone_components to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %m.addr = alloca %struct.mdef_t*, align 8
  %p.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %l.addr = alloca i8*, align 8
  %r.addr = alloca i8*, align 8
  %pos.addr = alloca i32*, align 8
  %2 = bitcast %struct.mdef_t** %m.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.mdef_t* %m to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %6 = bitcast i32* %p.addr to i8*
  store i32 %p, i32* %p.addr, align 4
  %7 = bitcast i8** %b.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  %9 = bitcast i8* %b to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void @setRealTemp(i64 %8, i64 %10)
  store i8* %b, i8** %b.addr, align 8
  %11 = bitcast i8** %l.addr to i8*
  %12 = call i64 @getAddr(i8* %11)
  %13 = bitcast i8* %l to i8*
  %14 = call i64 @getAddr(i8* %13)
  call void @setRealTemp(i64 %12, i64 %14)
  store i8* %l, i8** %l.addr, align 8
  %15 = bitcast i8** %r.addr to i8*
  %16 = call i64 @getAddr(i8* %15)
  %17 = bitcast i8* %r to i8*
  %18 = call i64 @getAddr(i8* %17)
  call void @setRealTemp(i64 %16, i64 %18)
  store i8* %r, i8** %r.addr, align 8
  %19 = bitcast i32** %pos.addr to i8*
  %20 = call i64 @getAddr(i8* %19)
  %21 = bitcast i32* %pos to i8*
  %22 = call i64 @getAddr(i8* %21)
  call void @setRealTemp(i64 %20, i64 %22)
  store i32* %pos, i32** %pos.addr, align 8
  %23 = bitcast %struct.mdef_t** %m.addr to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %tobool = icmp ne %struct.mdef_t* %25, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 350, i8* getelementptr inbounds ([101 x i8], [101 x i8]* @__PRETTY_FUNCTION__.mdef_phone_components, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %26, %cond.true
  %27 = bitcast i32* %p.addr to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load i32, i32* %p.addr, align 4
  %cmp = icmp sge i32 %29, 0
  br i1 %cmp, label %land.lhs.true, label %cond.false3

land.lhs.true:                                    ; preds = %cond.end
  %30 = bitcast i32* %p.addr to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = load i32, i32* %p.addr, align 4
  %33 = bitcast %struct.mdef_t** %m.addr to i8*
  %34 = call i64 @getAddr(i8* %33)
  %35 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %35, i32 0, i32 1
  %36 = bitcast i32* %n_phone to i8*
  %37 = call i64 @getAddr(i8* %36)
  %38 = load i32, i32* %n_phone, align 4
  %cmp1 = icmp slt i32 %32, %38
  br i1 %cmp1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %land.lhs.true
  br label %cond.end4

cond.false3:                                      ; preds = %land.lhs.true, %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 351, i8* getelementptr inbounds ([101 x i8], [101 x i8]* @__PRETTY_FUNCTION__.mdef_phone_components, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end4

cond.end4:                                        ; preds = %39, %cond.true2
  %40 = bitcast %struct.mdef_t** %m.addr to i8*
  %41 = call i64 @getAddr(i8* %40)
  %42 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %42, i32 0, i32 8
  %43 = bitcast %struct.phone_t** %phone to i8*
  %44 = call i64 @getAddr(i8* %43)
  %45 = load %struct.phone_t*, %struct.phone_t** %phone, align 8
  %46 = bitcast i32* %p.addr to i8*
  %47 = call i64 @getAddr(i8* %46)
  %48 = load i32, i32* %p.addr, align 4
  %idxprom = sext i32 %48 to i64
  %arrayidx = getelementptr inbounds %struct.phone_t, %struct.phone_t* %45, i64 %idxprom
  %ci = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx, i32 0, i32 2
  %49 = bitcast i8* %ci to i8*
  %50 = call i64 @getAddr(i8* %49)
  %51 = load i8, i8* %ci, align 4
  %52 = bitcast i8** %b.addr to i8*
  %53 = call i64 @getAddr(i8* %52)
  %54 = load i8*, i8** %b.addr, align 8
  %55 = bitcast i8* %54 to i8*
  store i8 %51, i8* %54, align 1
  %56 = bitcast %struct.mdef_t** %m.addr to i8*
  %57 = call i64 @getAddr(i8* %56)
  %58 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone5 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %58, i32 0, i32 8
  %59 = bitcast %struct.phone_t** %phone5 to i8*
  %60 = call i64 @getAddr(i8* %59)
  %61 = load %struct.phone_t*, %struct.phone_t** %phone5, align 8
  %62 = bitcast i32* %p.addr to i8*
  %63 = call i64 @getAddr(i8* %62)
  %64 = load i32, i32* %p.addr, align 4
  %idxprom6 = sext i32 %64 to i64
  %arrayidx7 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %61, i64 %idxprom6
  %lc = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx7, i32 0, i32 3
  %65 = bitcast i8* %lc to i8*
  %66 = call i64 @getAddr(i8* %65)
  %67 = load i8, i8* %lc, align 1
  %68 = bitcast i8** %l.addr to i8*
  %69 = call i64 @getAddr(i8* %68)
  %70 = load i8*, i8** %l.addr, align 8
  %71 = bitcast i8* %70 to i8*
  store i8 %67, i8* %70, align 1
  %72 = bitcast %struct.mdef_t** %m.addr to i8*
  %73 = call i64 @getAddr(i8* %72)
  %74 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone8 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %74, i32 0, i32 8
  %75 = bitcast %struct.phone_t** %phone8 to i8*
  %76 = call i64 @getAddr(i8* %75)
  %77 = load %struct.phone_t*, %struct.phone_t** %phone8, align 8
  %78 = bitcast i32* %p.addr to i8*
  %79 = call i64 @getAddr(i8* %78)
  %80 = load i32, i32* %p.addr, align 4
  %idxprom9 = sext i32 %80 to i64
  %arrayidx10 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %77, i64 %idxprom9
  %rc = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx10, i32 0, i32 4
  %81 = bitcast i8* %rc to i8*
  %82 = call i64 @getAddr(i8* %81)
  %83 = load i8, i8* %rc, align 2
  %84 = bitcast i8** %r.addr to i8*
  %85 = call i64 @getAddr(i8* %84)
  %86 = load i8*, i8** %r.addr, align 8
  %87 = bitcast i8* %86 to i8*
  store i8 %83, i8* %86, align 1
  %88 = bitcast %struct.mdef_t** %m.addr to i8*
  %89 = call i64 @getAddr(i8* %88)
  %90 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone11 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %90, i32 0, i32 8
  %91 = bitcast %struct.phone_t** %phone11 to i8*
  %92 = call i64 @getAddr(i8* %91)
  %93 = load %struct.phone_t*, %struct.phone_t** %phone11, align 8
  %94 = bitcast i32* %p.addr to i8*
  %95 = call i64 @getAddr(i8* %94)
  %96 = load i32, i32* %p.addr, align 4
  %idxprom12 = sext i32 %96 to i64
  %arrayidx13 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %93, i64 %idxprom12
  %wpos = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx13, i32 0, i32 5
  %97 = bitcast i32* %wpos to i8*
  %98 = call i64 @getAddr(i8* %97)
  %99 = load i32, i32* %wpos, align 4
  %100 = bitcast i32** %pos.addr to i8*
  %101 = call i64 @getAddr(i8* %100)
  %102 = load i32*, i32** %pos.addr, align 8
  %103 = bitcast i32* %102 to i8*
  store i32 %99, i32* %102, align 4
  %104 = bitcast i32 (%struct.mdef_t*, i32, i8*, i8*, i8*, i32*)* @mdef_phone_components to i8*
  %105 = call i64 @getAddr(i8* %104)
  call void @funcExit(i64 %105)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mdef_is_ciphone(%struct.mdef_t* %m, i32 %p) #0 {
entry:
  %0 = bitcast i32 (%struct.mdef_t*, i32)* @mdef_is_ciphone to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %m.addr = alloca %struct.mdef_t*, align 8
  %p.addr = alloca i32, align 4
  %2 = bitcast %struct.mdef_t** %m.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.mdef_t* %m to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %6 = bitcast i32* %p.addr to i8*
  store i32 %p, i32* %p.addr, align 4
  %7 = bitcast %struct.mdef_t** %m.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  %9 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %tobool = icmp ne %struct.mdef_t* %9, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 364, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__PRETTY_FUNCTION__.mdef_is_ciphone, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %10, %cond.true
  %11 = bitcast i32* %p.addr to i8*
  %12 = call i64 @getAddr(i8* %11)
  %13 = load i32, i32* %p.addr, align 4
  %cmp = icmp sge i32 %13, 0
  br i1 %cmp, label %land.lhs.true, label %cond.false3

land.lhs.true:                                    ; preds = %cond.end
  %14 = bitcast i32* %p.addr to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = load i32, i32* %p.addr, align 4
  %17 = bitcast %struct.mdef_t** %m.addr to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %19, i32 0, i32 1
  %20 = bitcast i32* %n_phone to i8*
  %21 = call i64 @getAddr(i8* %20)
  %22 = load i32, i32* %n_phone, align 4
  %cmp1 = icmp slt i32 %16, %22
  br i1 %cmp1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %land.lhs.true
  br label %cond.end4

cond.false3:                                      ; preds = %land.lhs.true, %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 365, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__PRETTY_FUNCTION__.mdef_is_ciphone, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end4

cond.end4:                                        ; preds = %23, %cond.true2
  %24 = bitcast i32* %p.addr to i8*
  %25 = call i64 @getAddr(i8* %24)
  %26 = load i32, i32* %p.addr, align 4
  %27 = bitcast %struct.mdef_t** %m.addr to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %29, i32 0, i32 0
  %30 = bitcast i32* %n_ciphone to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = load i32, i32* %n_ciphone, align 8
  %cmp5 = icmp slt i32 %26, %32
  %33 = zext i1 %cmp5 to i64
  %cond = select i1 %cmp5, i32 1, i32 0
  %34 = bitcast i32 (%struct.mdef_t*, i32)* @mdef_is_ciphone to i8*
  %35 = call i64 @getAddr(i8* %34)
  call void @funcExit(i64 %35)
  ret i32 %cond
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.mdef_t* @mdef_init(i8* %mdeffile) #0 {
entry:
  %0 = bitcast %struct.mdef_t* (i8*)* @mdef_init to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %mdeffile.addr = alloca i8*, align 8
  %fp = alloca %struct._IO_FILE*, align 8
  %n_ci = alloca i32, align 4
  %n_tri = alloca i32, align 4
  %n_map = alloca i32, align 4
  %n = alloca i32, align 4
  %tag = alloca [1024 x i8], align 16
  %buf = alloca [1024 x i8], align 16
  %senmap = alloca i16**, align 8
  %p = alloca i32, align 4
  %s = alloca i32, align 4
  %ci = alloca i32, align 4
  %cd = alloca i32, align 4
  %m = alloca %struct.mdef_t*, align 8
  %cdsen_start = alloca i32*, align 8
  %cdsen_end = alloca i32*, align 8
  %2 = bitcast i8** %mdeffile.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast i8* %mdeffile to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store i8* %mdeffile, i8** %mdeffile.addr, align 8
  %6 = bitcast i8** %mdeffile.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = load i8*, i8** %mdeffile.addr, align 8
  %tobool = icmp ne i8* %8, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %9 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 592, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %11 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %12 = call i64 @getAddr(i8* %11)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.29, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %13 = bitcast void (i8*, i64, i8*)* @_E__pr_info_header to i8*
  %14 = call i64 @getAddr(i8* %13)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 594, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.30, i32 0, i32 0))
  %15 = bitcast i8** %mdeffile.addr to i8*
  %16 = call i64 @getAddr(i8* %15)
  %17 = load i8*, i8** %mdeffile.addr, align 8
  %18 = bitcast void (i8*, ...)* @_E__pr_info to i8*
  %19 = call i64 @getAddr(i8* %18)
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.31, i32 0, i32 0), i8* %17)
  %20 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %21 = call i64 @getAddr(i8* %20)
  %call = call i8* @__ckd_calloc__(i64 1, i64 104, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 596)
  %22 = bitcast i8* %call to %struct.mdef_t*
  %23 = bitcast %struct.mdef_t** %m to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = bitcast %struct.mdef_t* %22 to i8*
  %26 = call i64 @getAddr(i8* %25)
  call void @setRealTemp(i64 %24, i64 %26)
  store %struct.mdef_t* %22, %struct.mdef_t** %m, align 8
  %27 = bitcast i8** %mdeffile.addr to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load i8*, i8** %mdeffile.addr, align 8
  %call1 = call %struct._IO_FILE* @fopen(i8* %29, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.32, i32 0, i32 0))
  %30 = bitcast %struct._IO_FILE** %fp to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = bitcast %struct._IO_FILE* %call1 to i8*
  %33 = call i64 @getAddr(i8* %32)
  call void @setRealTemp(i64 %31, i64 %33)
  store %struct._IO_FILE* %call1, %struct._IO_FILE** %fp, align 8
  %cmp = icmp eq %struct._IO_FILE* %call1, null
  br i1 %cmp, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %34 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %35 = call i64 @getAddr(i8* %34)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 599, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.33, i32 0, i32 0))
  %36 = bitcast i8** %mdeffile.addr to i8*
  %37 = call i64 @getAddr(i8* %36)
  %38 = load i8*, i8** %mdeffile.addr, align 8
  %39 = bitcast void (i8*, ...)* @_E__fatal_sys_error to i8*
  %40 = call i64 @getAddr(i8* %39)
  call void (i8*, ...) @_E__fatal_sys_error(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.34, i32 0, i32 0), i8* %38)
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %41 = bitcast %struct._IO_FILE** %fp to i8*
  %42 = call i64 @getAddr(i8* %41)
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %44 = bitcast i32 (i8*, i32, %struct._IO_FILE*)* @noncomment_line to i8*
  %45 = call i64 @getAddr(i8* %44)
  %call4 = call i32 @noncomment_line(i8* %arraydecay, i32 1024, %struct._IO_FILE* %43)
  %cmp5 = icmp slt i32 %call4, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end3
  %46 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %47 = call i64 @getAddr(i8* %46)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 602, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %48 = bitcast i8** %mdeffile.addr to i8*
  %49 = call i64 @getAddr(i8* %48)
  %50 = load i8*, i8** %mdeffile.addr, align 8
  %51 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %52 = call i64 @getAddr(i8* %51)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.35, i32 0, i32 0), i8* %50)
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end3
  %arraydecay8 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %call9 = call i32 @strncmp(i8* %arraydecay8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.36, i32 0, i32 0), i64 3) #8
  %cmp10 = icmp ne i32 %call9, 0
  br i1 %cmp10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %if.end7
  %53 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %54 = call i64 @getAddr(i8* %53)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 605, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %arraydecay12 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %55 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %56 = call i64 @getAddr(i8* %55)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.37, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.36, i32 0, i32 0), i8* %arraydecay12)
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %if.end7
  %57 = bitcast i32* %n_ci to i8*
  store i32 -1, i32* %n_ci, align 4
  %58 = bitcast i32* %n_tri to i8*
  store i32 -1, i32* %n_tri, align 4
  %59 = bitcast i32* %n_map to i8*
  store i32 -1, i32* %n_map, align 4
  %60 = bitcast %struct.mdef_t** %m to i8*
  %61 = call i64 @getAddr(i8* %60)
  %62 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %62, i32 0, i32 3
  %63 = bitcast i32* %n_ci_sen to i8*
  store i32 -1, i32* %n_ci_sen, align 4
  %64 = bitcast %struct.mdef_t** %m to i8*
  %65 = call i64 @getAddr(i8* %64)
  %66 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %66, i32 0, i32 4
  %67 = bitcast i32* %n_sen to i8*
  store i32 -1, i32* %n_sen, align 8
  %68 = bitcast %struct.mdef_t** %m to i8*
  %69 = call i64 @getAddr(i8* %68)
  %70 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_tmat = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %70, i32 0, i32 5
  %71 = bitcast i32* %n_tmat to i8*
  store i32 -1, i32* %n_tmat, align 4
  br label %do.body

do.body:                                          ; preds = %lor.end, %if.end13
  %arraydecay14 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %72 = bitcast %struct._IO_FILE** %fp to i8*
  %73 = call i64 @getAddr(i8* %72)
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %75 = bitcast i32 (i8*, i32, %struct._IO_FILE*)* @noncomment_line to i8*
  %76 = call i64 @getAddr(i8* %75)
  %call15 = call i32 @noncomment_line(i8* %arraydecay14, i32 1024, %struct._IO_FILE* %74)
  %cmp16 = icmp slt i32 %call15, 0
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %do.body
  %77 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %78 = call i64 @getAddr(i8* %77)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 616, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %79 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %80 = call i64 @getAddr(i8* %79)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.38, i32 0, i32 0))
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %do.body
  %arraydecay19 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %arraydecay20 = getelementptr inbounds [1024 x i8], [1024 x i8]* %tag, i32 0, i32 0
  %call21 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %arraydecay19, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.39, i32 0, i32 0), i32* %n, i8* %arraydecay20) #7
  %cmp22 = icmp ne i32 %call21, 2
  br i1 %cmp22, label %if.then24, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end18
  %81 = bitcast i32* %n to i8*
  %82 = call i64 @getAddr(i8* %81)
  %83 = load i32, i32* %n, align 4
  %cmp23 = icmp slt i32 %83, 0
  br i1 %cmp23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %lor.lhs.false, %if.end18
  %84 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %85 = call i64 @getAddr(i8* %84)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 619, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %arraydecay25 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %86 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %87 = call i64 @getAddr(i8* %86)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.40, i32 0, i32 0), i8* %arraydecay25)
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %lor.lhs.false
  %arraydecay27 = getelementptr inbounds [1024 x i8], [1024 x i8]* %tag, i32 0, i32 0
  %call28 = call i32 @strcmp(i8* %arraydecay27, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0)) #8
  %cmp29 = icmp eq i32 %call28, 0
  br i1 %cmp29, label %if.then30, label %if.else

if.then30:                                        ; preds = %if.end26
  %88 = bitcast i32* %n to i8*
  %89 = call i64 @getAddr(i8* %88)
  %90 = load i32, i32* %n, align 4
  %91 = bitcast i32* %n_ci to i8*
  store i32 %90, i32* %n_ci, align 4
  br label %if.end65

if.else:                                          ; preds = %if.end26
  %arraydecay31 = getelementptr inbounds [1024 x i8], [1024 x i8]* %tag, i32 0, i32 0
  %call32 = call i32 @strcmp(i8* %arraydecay31, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.42, i32 0, i32 0)) #8
  %cmp33 = icmp eq i32 %call32, 0
  br i1 %cmp33, label %if.then34, label %if.else35

if.then34:                                        ; preds = %if.else
  %92 = bitcast i32* %n to i8*
  %93 = call i64 @getAddr(i8* %92)
  %94 = load i32, i32* %n, align 4
  %95 = bitcast i32* %n_tri to i8*
  store i32 %94, i32* %n_tri, align 4
  br label %if.end64

if.else35:                                        ; preds = %if.else
  %arraydecay36 = getelementptr inbounds [1024 x i8], [1024 x i8]* %tag, i32 0, i32 0
  %call37 = call i32 @strcmp(i8* %arraydecay36, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.43, i32 0, i32 0)) #8
  %cmp38 = icmp eq i32 %call37, 0
  br i1 %cmp38, label %if.then39, label %if.else40

if.then39:                                        ; preds = %if.else35
  %96 = bitcast i32* %n to i8*
  %97 = call i64 @getAddr(i8* %96)
  %98 = load i32, i32* %n, align 4
  %99 = bitcast i32* %n_map to i8*
  store i32 %98, i32* %n_map, align 4
  br label %if.end63

if.else40:                                        ; preds = %if.else35
  %arraydecay41 = getelementptr inbounds [1024 x i8], [1024 x i8]* %tag, i32 0, i32 0
  %call42 = call i32 @strcmp(i8* %arraydecay41, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.44, i32 0, i32 0)) #8
  %cmp43 = icmp eq i32 %call42, 0
  br i1 %cmp43, label %if.then44, label %if.else46

if.then44:                                        ; preds = %if.else40
  %100 = bitcast i32* %n to i8*
  %101 = call i64 @getAddr(i8* %100)
  %102 = load i32, i32* %n, align 4
  %103 = bitcast %struct.mdef_t** %m to i8*
  %104 = call i64 @getAddr(i8* %103)
  %105 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen45 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %105, i32 0, i32 3
  %106 = bitcast i32* %n_ci_sen45 to i8*
  store i32 %102, i32* %n_ci_sen45, align 4
  br label %if.end62

if.else46:                                        ; preds = %if.else40
  %arraydecay47 = getelementptr inbounds [1024 x i8], [1024 x i8]* %tag, i32 0, i32 0
  %call48 = call i32 @strcmp(i8* %arraydecay47, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.45, i32 0, i32 0)) #8
  %cmp49 = icmp eq i32 %call48, 0
  br i1 %cmp49, label %if.then50, label %if.else52

if.then50:                                        ; preds = %if.else46
  %107 = bitcast i32* %n to i8*
  %108 = call i64 @getAddr(i8* %107)
  %109 = load i32, i32* %n, align 4
  %110 = bitcast %struct.mdef_t** %m to i8*
  %111 = call i64 @getAddr(i8* %110)
  %112 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen51 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %112, i32 0, i32 4
  %113 = bitcast i32* %n_sen51 to i8*
  store i32 %109, i32* %n_sen51, align 8
  br label %if.end61

if.else52:                                        ; preds = %if.else46
  %arraydecay53 = getelementptr inbounds [1024 x i8], [1024 x i8]* %tag, i32 0, i32 0
  %call54 = call i32 @strcmp(i8* %arraydecay53, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i32 0, i32 0)) #8
  %cmp55 = icmp eq i32 %call54, 0
  br i1 %cmp55, label %if.then56, label %if.else58

if.then56:                                        ; preds = %if.else52
  %114 = bitcast i32* %n to i8*
  %115 = call i64 @getAddr(i8* %114)
  %116 = load i32, i32* %n, align 4
  %117 = bitcast %struct.mdef_t** %m to i8*
  %118 = call i64 @getAddr(i8* %117)
  %119 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_tmat57 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %119, i32 0, i32 5
  %120 = bitcast i32* %n_tmat57 to i8*
  store i32 %116, i32* %n_tmat57, align 4
  br label %if.end60

if.else58:                                        ; preds = %if.else52
  %121 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %122 = call i64 @getAddr(i8* %121)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 634, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %arraydecay59 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %123 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %124 = call i64 @getAddr(i8* %123)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.47, i32 0, i32 0), i8* %arraydecay59)
  br label %if.end60

if.end60:                                         ; preds = %if.else58, %if.then56
  br label %if.end61

if.end61:                                         ; preds = %if.end60, %if.then50
  br label %if.end62

if.end62:                                         ; preds = %if.end61, %if.then44
  br label %if.end63

if.end63:                                         ; preds = %if.end62, %if.then39
  br label %if.end64

if.end64:                                         ; preds = %if.end63, %if.then34
  br label %if.end65

if.end65:                                         ; preds = %if.end64, %if.then30
  br label %do.cond

do.cond:                                          ; preds = %if.end65
  %125 = bitcast i32* %n_ci to i8*
  %126 = call i64 @getAddr(i8* %125)
  %127 = load i32, i32* %n_ci, align 4
  %cmp66 = icmp slt i32 %127, 0
  br i1 %cmp66, label %lor.end, label %lor.lhs.false67

lor.lhs.false67:                                  ; preds = %do.cond
  %128 = bitcast i32* %n_tri to i8*
  %129 = call i64 @getAddr(i8* %128)
  %130 = load i32, i32* %n_tri, align 4
  %cmp68 = icmp slt i32 %130, 0
  br i1 %cmp68, label %lor.end, label %lor.lhs.false69

lor.lhs.false69:                                  ; preds = %lor.lhs.false67
  %131 = bitcast i32* %n_map to i8*
  %132 = call i64 @getAddr(i8* %131)
  %133 = load i32, i32* %n_map, align 4
  %cmp70 = icmp slt i32 %133, 0
  br i1 %cmp70, label %lor.end, label %lor.lhs.false71

lor.lhs.false71:                                  ; preds = %lor.lhs.false69
  %134 = bitcast %struct.mdef_t** %m to i8*
  %135 = call i64 @getAddr(i8* %134)
  %136 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen72 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %136, i32 0, i32 3
  %137 = bitcast i32* %n_ci_sen72 to i8*
  %138 = call i64 @getAddr(i8* %137)
  %139 = load i32, i32* %n_ci_sen72, align 4
  %cmp73 = icmp slt i32 %139, 0
  br i1 %cmp73, label %lor.end, label %lor.lhs.false74

lor.lhs.false74:                                  ; preds = %lor.lhs.false71
  %140 = bitcast %struct.mdef_t** %m to i8*
  %141 = call i64 @getAddr(i8* %140)
  %142 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen75 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %142, i32 0, i32 4
  %143 = bitcast i32* %n_sen75 to i8*
  %144 = call i64 @getAddr(i8* %143)
  %145 = load i32, i32* %n_sen75, align 8
  %cmp76 = icmp slt i32 %145, 0
  br i1 %cmp76, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false74
  %146 = bitcast %struct.mdef_t** %m to i8*
  %147 = call i64 @getAddr(i8* %146)
  %148 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_tmat77 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %148, i32 0, i32 5
  %149 = bitcast i32* %n_tmat77 to i8*
  %150 = call i64 @getAddr(i8* %149)
  %151 = load i32, i32* %n_tmat77, align 4
  %cmp78 = icmp slt i32 %151, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false74, %lor.lhs.false71, %lor.lhs.false69, %lor.lhs.false67, %do.cond
  %152 = phi i1 [ true, %lor.lhs.false74 ], [ true, %lor.lhs.false71 ], [ true, %lor.lhs.false69 ], [ true, %lor.lhs.false67 ], [ true, %do.cond ], [ %cmp78, %lor.rhs ]
  br i1 %152, label %do.body, label %do.end

do.end:                                           ; preds = %lor.end
  %153 = bitcast i32* %n_ci to i8*
  %154 = call i64 @getAddr(i8* %153)
  %155 = load i32, i32* %n_ci, align 4
  %cmp79 = icmp eq i32 %155, 0
  br i1 %cmp79, label %if.then90, label %lor.lhs.false80

lor.lhs.false80:                                  ; preds = %do.end
  %156 = bitcast %struct.mdef_t** %m to i8*
  %157 = call i64 @getAddr(i8* %156)
  %158 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen81 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %158, i32 0, i32 3
  %159 = bitcast i32* %n_ci_sen81 to i8*
  %160 = call i64 @getAddr(i8* %159)
  %161 = load i32, i32* %n_ci_sen81, align 4
  %cmp82 = icmp eq i32 %161, 0
  br i1 %cmp82, label %if.then90, label %lor.lhs.false83

lor.lhs.false83:                                  ; preds = %lor.lhs.false80
  %162 = bitcast %struct.mdef_t** %m to i8*
  %163 = call i64 @getAddr(i8* %162)
  %164 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_tmat84 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %164, i32 0, i32 5
  %165 = bitcast i32* %n_tmat84 to i8*
  %166 = call i64 @getAddr(i8* %165)
  %167 = load i32, i32* %n_tmat84, align 4
  %cmp85 = icmp eq i32 %167, 0
  br i1 %cmp85, label %if.then90, label %lor.lhs.false86

lor.lhs.false86:                                  ; preds = %lor.lhs.false83
  %168 = bitcast %struct.mdef_t** %m to i8*
  %169 = call i64 @getAddr(i8* %168)
  %170 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen87 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %170, i32 0, i32 3
  %171 = bitcast i32* %n_ci_sen87 to i8*
  %172 = call i64 @getAddr(i8* %171)
  %173 = load i32, i32* %n_ci_sen87, align 4
  %174 = bitcast %struct.mdef_t** %m to i8*
  %175 = call i64 @getAddr(i8* %174)
  %176 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen88 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %176, i32 0, i32 4
  %177 = bitcast i32* %n_sen88 to i8*
  %178 = call i64 @getAddr(i8* %177)
  %179 = load i32, i32* %n_sen88, align 8
  %cmp89 = icmp sgt i32 %173, %179
  br i1 %cmp89, label %if.then90, label %if.end91

if.then90:                                        ; preds = %lor.lhs.false86, %lor.lhs.false83, %lor.lhs.false80, %do.end
  %180 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %181 = call i64 @getAddr(i8* %180)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 639, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %182 = bitcast i8** %mdeffile.addr to i8*
  %183 = call i64 @getAddr(i8* %182)
  %184 = load i8*, i8** %mdeffile.addr, align 8
  %185 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %186 = call i64 @getAddr(i8* %185)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.48, i32 0, i32 0), i8* %184)
  br label %if.end91

if.end91:                                         ; preds = %if.then90, %lor.lhs.false86
  %187 = bitcast i32* %n_ci to i8*
  %188 = call i64 @getAddr(i8* %187)
  %189 = load i32, i32* %n_ci, align 4
  %cmp92 = icmp sge i32 %189, 127
  br i1 %cmp92, label %if.then93, label %if.end94

if.then93:                                        ; preds = %if.end91
  %190 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %191 = call i64 @getAddr(i8* %190)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 643, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %192 = bitcast i8** %mdeffile.addr to i8*
  %193 = call i64 @getAddr(i8* %192)
  %194 = load i8*, i8** %mdeffile.addr, align 8
  %195 = bitcast i32* %n_ci to i8*
  %196 = call i64 @getAddr(i8* %195)
  %197 = load i32, i32* %n_ci, align 4
  %198 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %199 = call i64 @getAddr(i8* %198)
  call void @addFunArg(i32 2, i64 %199, i64 %196)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.49, i32 0, i32 0), i8* %194, i32 %197, i32 127)
  br label %if.end94

if.end94:                                         ; preds = %if.then93, %if.end91
  %200 = bitcast i32* %n_ci to i8*
  %201 = call i64 @getAddr(i8* %200)
  %202 = load i32, i32* %n_ci, align 4
  %203 = bitcast i32* %n_tri to i8*
  %204 = call i64 @getAddr(i8* %203)
  %205 = load i32, i32* %n_tri, align 4
  %add = add nsw i32 %202, %205
  %cmp95 = icmp sge i32 %add, 2147483646
  br i1 %cmp95, label %if.then96, label %if.end98

if.then96:                                        ; preds = %if.end94
  %206 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %207 = call i64 @getAddr(i8* %206)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 645, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %208 = bitcast i8** %mdeffile.addr to i8*
  %209 = call i64 @getAddr(i8* %208)
  %210 = load i8*, i8** %mdeffile.addr, align 8
  %211 = bitcast i32* %n_ci to i8*
  %212 = call i64 @getAddr(i8* %211)
  %213 = load i32, i32* %n_ci, align 4
  %214 = bitcast i32* %n_tri to i8*
  %215 = call i64 @getAddr(i8* %214)
  %216 = load i32, i32* %n_tri, align 4
  %add97 = add nsw i32 %213, %216
  %217 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %218 = call i64 @getAddr(i8* %217)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.50, i32 0, i32 0), i8* %210, i32 %add97, i32 2147483646)
  br label %if.end98

if.end98:                                         ; preds = %if.then96, %if.end94
  %219 = bitcast %struct.mdef_t** %m to i8*
  %220 = call i64 @getAddr(i8* %219)
  %221 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen99 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %221, i32 0, i32 4
  %222 = bitcast i32* %n_sen99 to i8*
  %223 = call i64 @getAddr(i8* %222)
  %224 = load i32, i32* %n_sen99, align 8
  %cmp100 = icmp sge i32 %224, 32766
  br i1 %cmp100, label %if.then101, label %if.end103

if.then101:                                       ; preds = %if.end98
  %225 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %226 = call i64 @getAddr(i8* %225)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 647, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %227 = bitcast i8** %mdeffile.addr to i8*
  %228 = call i64 @getAddr(i8* %227)
  %229 = load i8*, i8** %mdeffile.addr, align 8
  %230 = bitcast %struct.mdef_t** %m to i8*
  %231 = call i64 @getAddr(i8* %230)
  %232 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen102 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %232, i32 0, i32 4
  %233 = bitcast i32* %n_sen102 to i8*
  %234 = call i64 @getAddr(i8* %233)
  %235 = load i32, i32* %n_sen102, align 8
  %236 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %237 = call i64 @getAddr(i8* %236)
  call void @addFunArg(i32 2, i64 %237, i64 %234)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.51, i32 0, i32 0), i8* %229, i32 %235, i32 32766)
  br label %if.end103

if.end103:                                        ; preds = %if.then101, %if.end98
  %238 = bitcast %struct.mdef_t** %m to i8*
  %239 = call i64 @getAddr(i8* %238)
  %240 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_tmat104 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %240, i32 0, i32 5
  %241 = bitcast i32* %n_tmat104 to i8*
  %242 = call i64 @getAddr(i8* %241)
  %243 = load i32, i32* %n_tmat104, align 4
  %cmp105 = icmp sge i32 %243, 2147483646
  br i1 %cmp105, label %if.then106, label %if.end108

if.then106:                                       ; preds = %if.end103
  %244 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %245 = call i64 @getAddr(i8* %244)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 649, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %246 = bitcast i8** %mdeffile.addr to i8*
  %247 = call i64 @getAddr(i8* %246)
  %248 = load i8*, i8** %mdeffile.addr, align 8
  %249 = bitcast %struct.mdef_t** %m to i8*
  %250 = call i64 @getAddr(i8* %249)
  %251 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_tmat107 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %251, i32 0, i32 5
  %252 = bitcast i32* %n_tmat107 to i8*
  %253 = call i64 @getAddr(i8* %252)
  %254 = load i32, i32* %n_tmat107, align 4
  %255 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %256 = call i64 @getAddr(i8* %255)
  call void @addFunArg(i32 2, i64 %256, i64 %253)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.52, i32 0, i32 0), i8* %248, i32 %254, i32 2147483646)
  br label %if.end108

if.end108:                                        ; preds = %if.then106, %if.end103
  %257 = bitcast i32* %n_map to i8*
  %258 = call i64 @getAddr(i8* %257)
  %259 = load i32, i32* %n_map, align 4
  %260 = bitcast i32* %n_ci to i8*
  %261 = call i64 @getAddr(i8* %260)
  %262 = load i32, i32* %n_ci, align 4
  %263 = bitcast i32* %n_tri to i8*
  %264 = call i64 @getAddr(i8* %263)
  %265 = load i32, i32* %n_tri, align 4
  %add109 = add nsw i32 %262, %265
  %div = sdiv i32 %259, %add109
  %sub = sub nsw i32 %div, 1
  %266 = bitcast %struct.mdef_t** %m to i8*
  %267 = call i64 @getAddr(i8* %266)
  %268 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_emit_state = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %268, i32 0, i32 2
  %269 = bitcast i32* %n_emit_state to i8*
  store i32 %sub, i32* %n_emit_state, align 8
  %270 = bitcast %struct.mdef_t** %m to i8*
  %271 = call i64 @getAddr(i8* %270)
  %272 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_emit_state110 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %272, i32 0, i32 2
  %273 = bitcast i32* %n_emit_state110 to i8*
  %274 = call i64 @getAddr(i8* %273)
  %275 = load i32, i32* %n_emit_state110, align 8
  %add111 = add nsw i32 %275, 1
  %276 = bitcast i32* %n_ci to i8*
  %277 = call i64 @getAddr(i8* %276)
  %278 = load i32, i32* %n_ci, align 4
  %279 = bitcast i32* %n_tri to i8*
  %280 = call i64 @getAddr(i8* %279)
  %281 = load i32, i32* %n_tri, align 4
  %add112 = add nsw i32 %278, %281
  %mul = mul nsw i32 %add111, %add112
  %282 = bitcast i32* %n_map to i8*
  %283 = call i64 @getAddr(i8* %282)
  %284 = load i32, i32* %n_map, align 4
  %cmp113 = icmp ne i32 %mul, %284
  br i1 %cmp113, label %if.then114, label %if.end115

if.then114:                                       ; preds = %if.end108
  %285 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %286 = call i64 @getAddr(i8* %285)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 653, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %287 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %288 = call i64 @getAddr(i8* %287)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.53, i32 0, i32 0))
  br label %if.end115

if.end115:                                        ; preds = %if.then114, %if.end108
  %289 = bitcast i32* %n_ci to i8*
  %290 = call i64 @getAddr(i8* %289)
  %291 = load i32, i32* %n_ci, align 4
  %292 = bitcast %struct.mdef_t** %m to i8*
  %293 = call i64 @getAddr(i8* %292)
  %294 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %294, i32 0, i32 0
  %295 = bitcast i32* %n_ciphone to i8*
  store i32 %291, i32* %n_ciphone, align 8
  %296 = bitcast i32* %n_ci to i8*
  %297 = call i64 @getAddr(i8* %296)
  %298 = load i32, i32* %n_ci, align 4
  %299 = bitcast %struct.hash_table_t* (i32, i32)* @hash_new to i8*
  %300 = call i64 @getAddr(i8* %299)
  call void @addFunArg(i32 0, i64 %300, i64 %297)
  %call116 = call %struct.hash_table_t* @hash_new(i32 %298, i32 1)
  %301 = bitcast %struct.mdef_t** %m to i8*
  %302 = call i64 @getAddr(i8* %301)
  %303 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %ciphone_ht = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %303, i32 0, i32 6
  %304 = bitcast %struct.hash_table_t** %ciphone_ht to i8*
  %305 = call i64 @getAddr(i8* %304)
  %306 = bitcast %struct.hash_table_t* %call116 to i8*
  %307 = call i64 @getAddr(i8* %306)
  call void @setRealTemp(i64 %305, i64 %307)
  store %struct.hash_table_t* %call116, %struct.hash_table_t** %ciphone_ht, align 8
  %308 = bitcast i32* %n_ci to i8*
  %309 = call i64 @getAddr(i8* %308)
  %310 = load i32, i32* %n_ci, align 4
  %conv = sext i32 %310 to i64
  %311 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %312 = call i64 @getAddr(i8* %311)
  %call117 = call i8* @__ckd_calloc__(i64 %conv, i64 16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 658)
  %313 = bitcast i8* %call117 to %struct.ciphone_t*
  %314 = bitcast %struct.mdef_t** %m to i8*
  %315 = call i64 @getAddr(i8* %314)
  %316 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %316, i32 0, i32 7
  %317 = bitcast %struct.ciphone_t** %ciphone to i8*
  %318 = call i64 @getAddr(i8* %317)
  %319 = bitcast %struct.ciphone_t* %313 to i8*
  %320 = call i64 @getAddr(i8* %319)
  call void @setRealTemp(i64 %318, i64 %320)
  store %struct.ciphone_t* %313, %struct.ciphone_t** %ciphone, align 8
  %321 = bitcast i32* %n_ci to i8*
  %322 = call i64 @getAddr(i8* %321)
  %323 = load i32, i32* %n_ci, align 4
  %324 = bitcast i32* %n_tri to i8*
  %325 = call i64 @getAddr(i8* %324)
  %326 = load i32, i32* %n_tri, align 4
  %add118 = add nsw i32 %323, %326
  %327 = bitcast %struct.mdef_t** %m to i8*
  %328 = call i64 @getAddr(i8* %327)
  %329 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %329, i32 0, i32 1
  %330 = bitcast i32* %n_phone to i8*
  store i32 %add118, i32* %n_phone, align 4
  %331 = bitcast %struct.mdef_t** %m to i8*
  %332 = call i64 @getAddr(i8* %331)
  %333 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_phone119 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %333, i32 0, i32 1
  %334 = bitcast i32* %n_phone119 to i8*
  %335 = call i64 @getAddr(i8* %334)
  %336 = load i32, i32* %n_phone119, align 4
  %conv120 = sext i32 %336 to i64
  %337 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %338 = call i64 @getAddr(i8* %337)
  %call121 = call i8* @__ckd_calloc__(i64 %conv120, i64 16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 666)
  %339 = bitcast i8* %call121 to %struct.phone_t*
  %340 = bitcast %struct.mdef_t** %m to i8*
  %341 = call i64 @getAddr(i8* %340)
  %342 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %342, i32 0, i32 8
  %343 = bitcast %struct.phone_t** %phone to i8*
  %344 = call i64 @getAddr(i8* %343)
  %345 = bitcast %struct.phone_t* %339 to i8*
  %346 = call i64 @getAddr(i8* %345)
  call void @setRealTemp(i64 %344, i64 %346)
  store %struct.phone_t* %339, %struct.phone_t** %phone, align 8
  %347 = bitcast %struct.mdef_t** %m to i8*
  %348 = call i64 @getAddr(i8* %347)
  %349 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_phone122 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %349, i32 0, i32 1
  %350 = bitcast i32* %n_phone122 to i8*
  %351 = call i64 @getAddr(i8* %350)
  %352 = load i32, i32* %n_phone122, align 4
  %353 = bitcast %struct.mdef_t** %m to i8*
  %354 = call i64 @getAddr(i8* %353)
  %355 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_emit_state123 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %355, i32 0, i32 2
  %356 = bitcast i32* %n_emit_state123 to i8*
  %357 = call i64 @getAddr(i8* %356)
  %358 = load i32, i32* %n_emit_state123, align 8
  %359 = bitcast i8** (i32, i32, i32, i8*, i32)* @__ckd_calloc_2d__ to i8*
  %360 = call i64 @getAddr(i8* %359)
  call void @addFunArg(i32 0, i64 %360, i64 %351)
  call void @addFunArg(i32 1, i64 %360, i64 %357)
  %call124 = call i8** @__ckd_calloc_2d__(i32 %352, i32 %358, i32 2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 669)
  %361 = bitcast i8** %call124 to i16**
  %362 = bitcast i16*** %senmap to i8*
  %363 = call i64 @getAddr(i8* %362)
  %364 = bitcast i16** %361 to i8*
  %365 = call i64 @getAddr(i8* %364)
  call void @setRealTemp(i64 %363, i64 %365)
  store i16** %361, i16*** %senmap, align 8
  %366 = bitcast i16*** %senmap to i8*
  %367 = call i64 @getAddr(i8* %366)
  %368 = load i16**, i16*** %senmap, align 8
  %369 = bitcast %struct.mdef_t** %m to i8*
  %370 = call i64 @getAddr(i8* %369)
  %371 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sseq = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %371, i32 0, i32 9
  %372 = bitcast i16*** %sseq to i8*
  %373 = call i64 @getAddr(i8* %372)
  %374 = bitcast i16** %368 to i8*
  %375 = call i64 @getAddr(i8* %374)
  call void @setRealTemp(i64 %373, i64 %375)
  store i16** %368, i16*** %sseq, align 8
  %376 = bitcast %struct.mdef_t** %m to i8*
  %377 = call i64 @getAddr(i8* %376)
  %378 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone125 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %378, i32 0, i32 0
  %379 = bitcast i32* %n_ciphone125 to i8*
  %380 = call i64 @getAddr(i8* %379)
  %381 = load i32, i32* %n_ciphone125, align 8
  %382 = bitcast i8** (i32, i32, i32, i8*, i32)* @__ckd_calloc_2d__ to i8*
  %383 = call i64 @getAddr(i8* %382)
  call void @addFunArg(i32 1, i64 %383, i64 %380)
  %call126 = call i8** @__ckd_calloc_2d__(i32 4, i32 %381, i32 8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 673)
  %384 = bitcast i8** %call126 to %struct.ph_lc_s***
  %385 = bitcast %struct.mdef_t** %m to i8*
  %386 = call i64 @getAddr(i8* %385)
  %387 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %wpos_ci_lclist = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %387, i32 0, i32 15
  %388 = bitcast %struct.ph_lc_s**** %wpos_ci_lclist to i8*
  %389 = call i64 @getAddr(i8* %388)
  %390 = bitcast %struct.ph_lc_s*** %384 to i8*
  %391 = call i64 @getAddr(i8* %390)
  call void @setRealTemp(i64 %389, i64 %391)
  store %struct.ph_lc_s*** %384, %struct.ph_lc_s**** %wpos_ci_lclist, align 8
  %392 = bitcast i32* %p to i8*
  store i32 0, i32* %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end115
  %393 = bitcast i32* %p to i8*
  %394 = call i64 @getAddr(i8* %393)
  %395 = load i32, i32* %p, align 4
  %396 = bitcast i32* %n_ci to i8*
  %397 = call i64 @getAddr(i8* %396)
  %398 = load i32, i32* %n_ci, align 4
  %cmp127 = icmp slt i32 %395, %398
  br i1 %cmp127, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay129 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %399 = bitcast %struct._IO_FILE** %fp to i8*
  %400 = call i64 @getAddr(i8* %399)
  %401 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %402 = bitcast i32 (i8*, i32, %struct._IO_FILE*)* @noncomment_line to i8*
  %403 = call i64 @getAddr(i8* %402)
  %call130 = call i32 @noncomment_line(i8* %arraydecay129, i32 1024, %struct._IO_FILE* %401)
  %cmp131 = icmp slt i32 %call130, 0
  br i1 %cmp131, label %if.then133, label %if.end134

if.then133:                                       ; preds = %for.body
  %404 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %405 = call i64 @getAddr(i8* %404)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 683, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %406 = bitcast i32* %p to i8*
  %407 = call i64 @getAddr(i8* %406)
  %408 = load i32, i32* %p, align 4
  %409 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %410 = call i64 @getAddr(i8* %409)
  call void @addFunArg(i32 1, i64 %410, i64 %407)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.54, i32 0, i32 0), i32 %408)
  br label %if.end134

if.end134:                                        ; preds = %if.then133, %for.body
  %411 = bitcast %struct.mdef_t** %m to i8*
  %412 = call i64 @getAddr(i8* %411)
  %413 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %arraydecay135 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %414 = bitcast i32* %p to i8*
  %415 = call i64 @getAddr(i8* %414)
  %416 = load i32, i32* %p, align 4
  %417 = bitcast void (%struct.mdef_t*, i8*, i32)* @parse_base_line to i8*
  %418 = call i64 @getAddr(i8* %417)
  call void @addFunArg(i32 2, i64 %418, i64 %415)
  call void @parse_base_line(%struct.mdef_t* %413, i8* %arraydecay135, i32 %416)
  br label %for.inc

for.inc:                                          ; preds = %if.end134
  %419 = bitcast i32* %p to i8*
  %420 = call i64 @getAddr(i8* %419)
  %421 = load i32, i32* %p, align 4
  %inc = add nsw i32 %421, 1
  %422 = bitcast i32* %p to i8*
  store i32 %inc, i32* %p, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %423 = bitcast %struct.mdef_t** %m to i8*
  %424 = call i64 @getAddr(i8* %423)
  %425 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %426 = bitcast i8 (%struct.mdef_t*, i8*)* @mdef_ciphone_id to i8*
  %427 = call i64 @getAddr(i8* %426)
  %call136 = call signext i8 @mdef_ciphone_id(%struct.mdef_t* %425, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.55, i32 0, i32 0))
  %428 = bitcast %struct.mdef_t** %m to i8*
  %429 = call i64 @getAddr(i8* %428)
  %430 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sil = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %430, i32 0, i32 14
  %431 = bitcast i8* %sil to i8*
  store i8 %call136, i8* %sil, align 8
  br label %for.cond137

for.cond137:                                      ; preds = %for.inc149, %for.end
  %432 = bitcast i32* %p to i8*
  %433 = call i64 @getAddr(i8* %432)
  %434 = load i32, i32* %p, align 4
  %435 = bitcast %struct.mdef_t** %m to i8*
  %436 = call i64 @getAddr(i8* %435)
  %437 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_phone138 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %437, i32 0, i32 1
  %438 = bitcast i32* %n_phone138 to i8*
  %439 = call i64 @getAddr(i8* %438)
  %440 = load i32, i32* %n_phone138, align 4
  %cmp139 = icmp slt i32 %434, %440
  br i1 %cmp139, label %for.body141, label %for.end151

for.body141:                                      ; preds = %for.cond137
  %arraydecay142 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %441 = bitcast %struct._IO_FILE** %fp to i8*
  %442 = call i64 @getAddr(i8* %441)
  %443 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %444 = bitcast i32 (i8*, i32, %struct._IO_FILE*)* @noncomment_line to i8*
  %445 = call i64 @getAddr(i8* %444)
  %call143 = call i32 @noncomment_line(i8* %arraydecay142, i32 1024, %struct._IO_FILE* %443)
  %cmp144 = icmp slt i32 %call143, 0
  br i1 %cmp144, label %if.then146, label %if.end147

if.then146:                                       ; preds = %for.body141
  %446 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %447 = call i64 @getAddr(i8* %446)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 691, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %448 = bitcast i32* %p to i8*
  %449 = call i64 @getAddr(i8* %448)
  %450 = load i32, i32* %p, align 4
  %451 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %452 = call i64 @getAddr(i8* %451)
  call void @addFunArg(i32 1, i64 %452, i64 %449)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.56, i32 0, i32 0), i32 %450)
  br label %if.end147

if.end147:                                        ; preds = %if.then146, %for.body141
  %453 = bitcast %struct.mdef_t** %m to i8*
  %454 = call i64 @getAddr(i8* %453)
  %455 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %arraydecay148 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %456 = bitcast i32* %p to i8*
  %457 = call i64 @getAddr(i8* %456)
  %458 = load i32, i32* %p, align 4
  %459 = bitcast void (%struct.mdef_t*, i8*, i32)* @parse_tri_line to i8*
  %460 = call i64 @getAddr(i8* %459)
  call void @addFunArg(i32 2, i64 %460, i64 %457)
  call void @parse_tri_line(%struct.mdef_t* %455, i8* %arraydecay148, i32 %458)
  br label %for.inc149

for.inc149:                                       ; preds = %if.end147
  %461 = bitcast i32* %p to i8*
  %462 = call i64 @getAddr(i8* %461)
  %463 = load i32, i32* %p, align 4
  %inc150 = add nsw i32 %463, 1
  %464 = bitcast i32* %p to i8*
  store i32 %inc150, i32* %p, align 4
  br label %for.cond137

for.end151:                                       ; preds = %for.cond137
  %arraydecay152 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %465 = bitcast %struct._IO_FILE** %fp to i8*
  %466 = call i64 @getAddr(i8* %465)
  %467 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %468 = bitcast i32 (i8*, i32, %struct._IO_FILE*)* @noncomment_line to i8*
  %469 = call i64 @getAddr(i8* %468)
  %call153 = call i32 @noncomment_line(i8* %arraydecay152, i32 1024, %struct._IO_FILE* %467)
  %cmp154 = icmp sge i32 %call153, 0
  br i1 %cmp154, label %if.then156, label %if.end158

if.then156:                                       ; preds = %for.end151
  %470 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %471 = call i64 @getAddr(i8* %470)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 696, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.57, i32 0, i32 0))
  %472 = bitcast %struct.mdef_t** %m to i8*
  %473 = call i64 @getAddr(i8* %472)
  %474 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_phone157 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %474, i32 0, i32 1
  %475 = bitcast i32* %n_phone157 to i8*
  %476 = call i64 @getAddr(i8* %475)
  %477 = load i32, i32* %n_phone157, align 4
  %478 = bitcast void (i8*, ...)* @_E__pr_warn to i8*
  %479 = call i64 @getAddr(i8* %478)
  call void @addFunArg(i32 1, i64 %479, i64 %476)
  call void (i8*, ...) @_E__pr_warn(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.58, i32 0, i32 0), i32 %477)
  br label %if.end158

if.end158:                                        ; preds = %if.then156, %for.end151
  %480 = bitcast %struct.mdef_t** %m to i8*
  %481 = call i64 @getAddr(i8* %480)
  %482 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone159 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %482, i32 0, i32 0
  %483 = bitcast i32* %n_ciphone159 to i8*
  %484 = call i64 @getAddr(i8* %483)
  %485 = load i32, i32* %n_ciphone159, align 8
  %486 = bitcast %struct.mdef_t** %m to i8*
  %487 = call i64 @getAddr(i8* %486)
  %488 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_emit_state160 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %488, i32 0, i32 2
  %489 = bitcast i32* %n_emit_state160 to i8*
  %490 = call i64 @getAddr(i8* %489)
  %491 = load i32, i32* %n_emit_state160, align 8
  %mul161 = mul nsw i32 %485, %491
  %492 = bitcast %struct.mdef_t** %m to i8*
  %493 = call i64 @getAddr(i8* %492)
  %494 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen162 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %494, i32 0, i32 3
  %495 = bitcast i32* %n_ci_sen162 to i8*
  %496 = call i64 @getAddr(i8* %495)
  %497 = load i32, i32* %n_ci_sen162, align 4
  %cmp163 = icmp ne i32 %mul161, %497
  br i1 %cmp163, label %if.then165, label %if.end169

if.then165:                                       ; preds = %if.end158
  %498 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %499 = call i64 @getAddr(i8* %498)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 700, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %500 = bitcast %struct.mdef_t** %m to i8*
  %501 = call i64 @getAddr(i8* %500)
  %502 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen166 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %502, i32 0, i32 3
  %503 = bitcast i32* %n_ci_sen166 to i8*
  %504 = call i64 @getAddr(i8* %503)
  %505 = load i32, i32* %n_ci_sen166, align 4
  %506 = bitcast %struct.mdef_t** %m to i8*
  %507 = call i64 @getAddr(i8* %506)
  %508 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone167 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %508, i32 0, i32 0
  %509 = bitcast i32* %n_ciphone167 to i8*
  %510 = call i64 @getAddr(i8* %509)
  %511 = load i32, i32* %n_ciphone167, align 8
  %512 = bitcast %struct.mdef_t** %m to i8*
  %513 = call i64 @getAddr(i8* %512)
  %514 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_emit_state168 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %514, i32 0, i32 2
  %515 = bitcast i32* %n_emit_state168 to i8*
  %516 = call i64 @getAddr(i8* %515)
  %517 = load i32, i32* %n_emit_state168, align 8
  %518 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %519 = call i64 @getAddr(i8* %518)
  call void @addFunArg(i32 1, i64 %519, i64 %504)
  call void @addFunArg(i32 2, i64 %519, i64 %510)
  call void @addFunArg(i32 3, i64 %519, i64 %516)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.59, i32 0, i32 0), i32 %505, i32 %511, i32 %517)
  br label %if.end169

if.end169:                                        ; preds = %if.then165, %if.end158
  %520 = bitcast %struct.mdef_t** %m to i8*
  %521 = call i64 @getAddr(i8* %520)
  %522 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen170 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %522, i32 0, i32 4
  %523 = bitcast i32* %n_sen170 to i8*
  %524 = call i64 @getAddr(i8* %523)
  %525 = load i32, i32* %n_sen170, align 8
  %conv171 = sext i32 %525 to i64
  %526 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %527 = call i64 @getAddr(i8* %526)
  %call172 = call i8* @__ckd_calloc__(i64 %conv171, i64 2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 702)
  %528 = bitcast i8* %call172 to i16*
  %529 = bitcast %struct.mdef_t** %m to i8*
  %530 = call i64 @getAddr(i8* %529)
  %531 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %cd2cisen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %531, i32 0, i32 11
  %532 = bitcast i16** %cd2cisen to i8*
  %533 = call i64 @getAddr(i8* %532)
  %534 = bitcast i16* %528 to i8*
  %535 = call i64 @getAddr(i8* %534)
  call void @setRealTemp(i64 %533, i64 %535)
  store i16* %528, i16** %cd2cisen, align 8
  %536 = bitcast %struct.mdef_t** %m to i8*
  %537 = call i64 @getAddr(i8* %536)
  %538 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen173 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %538, i32 0, i32 4
  %539 = bitcast i32* %n_sen173 to i8*
  %540 = call i64 @getAddr(i8* %539)
  %541 = load i32, i32* %n_sen173, align 8
  %conv174 = sext i32 %541 to i64
  %542 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %543 = call i64 @getAddr(i8* %542)
  %call175 = call i8* @__ckd_calloc__(i64 %conv174, i64 1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 704)
  %544 = bitcast %struct.mdef_t** %m to i8*
  %545 = call i64 @getAddr(i8* %544)
  %546 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %546, i32 0, i32 12
  %547 = bitcast i8** %sen2cimap to i8*
  %548 = call i64 @getAddr(i8* %547)
  %549 = bitcast i8* %call175 to i8*
  %550 = call i64 @getAddr(i8* %549)
  call void @setRealTemp(i64 %548, i64 %550)
  store i8* %call175, i8** %sen2cimap, align 8
  %551 = bitcast i32* %s to i8*
  store i32 0, i32* %s, align 4
  br label %for.cond176

for.cond176:                                      ; preds = %for.inc182, %if.end169
  %552 = bitcast i32* %s to i8*
  %553 = call i64 @getAddr(i8* %552)
  %554 = load i32, i32* %s, align 4
  %555 = bitcast %struct.mdef_t** %m to i8*
  %556 = call i64 @getAddr(i8* %555)
  %557 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen177 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %557, i32 0, i32 4
  %558 = bitcast i32* %n_sen177 to i8*
  %559 = call i64 @getAddr(i8* %558)
  %560 = load i32, i32* %n_sen177, align 8
  %cmp178 = icmp slt i32 %554, %560
  br i1 %cmp178, label %for.body180, label %for.end184

for.body180:                                      ; preds = %for.cond176
  %561 = bitcast %struct.mdef_t** %m to i8*
  %562 = call i64 @getAddr(i8* %561)
  %563 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap181 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %563, i32 0, i32 12
  %564 = bitcast i8** %sen2cimap181 to i8*
  %565 = call i64 @getAddr(i8* %564)
  %566 = load i8*, i8** %sen2cimap181, align 8
  %567 = bitcast i32* %s to i8*
  %568 = call i64 @getAddr(i8* %567)
  %569 = load i32, i32* %s, align 4
  %idxprom = sext i32 %569 to i64
  %arrayidx = getelementptr inbounds i8, i8* %566, i64 %idxprom
  %570 = bitcast i8* %arrayidx to i8*
  store i8 -1, i8* %arrayidx, align 1
  br label %for.inc182

for.inc182:                                       ; preds = %for.body180
  %571 = bitcast i32* %s to i8*
  %572 = call i64 @getAddr(i8* %571)
  %573 = load i32, i32* %s, align 4
  %inc183 = add nsw i32 %573, 1
  %574 = bitcast i32* %s to i8*
  store i32 %inc183, i32* %s, align 4
  br label %for.cond176

for.end184:                                       ; preds = %for.cond176
  %575 = bitcast i32* %s to i8*
  store i32 0, i32* %s, align 4
  br label %for.cond185

for.cond185:                                      ; preds = %for.inc200, %for.end184
  %576 = bitcast i32* %s to i8*
  %577 = call i64 @getAddr(i8* %576)
  %578 = load i32, i32* %s, align 4
  %579 = bitcast %struct.mdef_t** %m to i8*
  %580 = call i64 @getAddr(i8* %579)
  %581 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen186 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %581, i32 0, i32 3
  %582 = bitcast i32* %n_ci_sen186 to i8*
  %583 = call i64 @getAddr(i8* %582)
  %584 = load i32, i32* %n_ci_sen186, align 4
  %cmp187 = icmp slt i32 %578, %584
  br i1 %cmp187, label %for.body189, label %for.end202

for.body189:                                      ; preds = %for.cond185
  %585 = bitcast i32* %s to i8*
  %586 = call i64 @getAddr(i8* %585)
  %587 = load i32, i32* %s, align 4
  %conv190 = trunc i32 %587 to i16
  %588 = bitcast %struct.mdef_t** %m to i8*
  %589 = call i64 @getAddr(i8* %588)
  %590 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %cd2cisen191 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %590, i32 0, i32 11
  %591 = bitcast i16** %cd2cisen191 to i8*
  %592 = call i64 @getAddr(i8* %591)
  %593 = load i16*, i16** %cd2cisen191, align 8
  %594 = bitcast i32* %s to i8*
  %595 = call i64 @getAddr(i8* %594)
  %596 = load i32, i32* %s, align 4
  %idxprom192 = sext i32 %596 to i64
  %arrayidx193 = getelementptr inbounds i16, i16* %593, i64 %idxprom192
  %597 = bitcast i16* %arrayidx193 to i8*
  store i16 %conv190, i16* %arrayidx193, align 2
  %598 = bitcast i32* %s to i8*
  %599 = call i64 @getAddr(i8* %598)
  %600 = load i32, i32* %s, align 4
  %601 = bitcast %struct.mdef_t** %m to i8*
  %602 = call i64 @getAddr(i8* %601)
  %603 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_emit_state194 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %603, i32 0, i32 2
  %604 = bitcast i32* %n_emit_state194 to i8*
  %605 = call i64 @getAddr(i8* %604)
  %606 = load i32, i32* %n_emit_state194, align 8
  %div195 = sdiv i32 %600, %606
  %conv196 = trunc i32 %div195 to i8
  %607 = bitcast %struct.mdef_t** %m to i8*
  %608 = call i64 @getAddr(i8* %607)
  %609 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap197 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %609, i32 0, i32 12
  %610 = bitcast i8** %sen2cimap197 to i8*
  %611 = call i64 @getAddr(i8* %610)
  %612 = load i8*, i8** %sen2cimap197, align 8
  %613 = bitcast i32* %s to i8*
  %614 = call i64 @getAddr(i8* %613)
  %615 = load i32, i32* %s, align 4
  %idxprom198 = sext i32 %615 to i64
  %arrayidx199 = getelementptr inbounds i8, i8* %612, i64 %idxprom198
  %616 = bitcast i8* %arrayidx199 to i8*
  store i8 %conv196, i8* %arrayidx199, align 1
  br label %for.inc200

for.inc200:                                       ; preds = %for.body189
  %617 = bitcast i32* %s to i8*
  %618 = call i64 @getAddr(i8* %617)
  %619 = load i32, i32* %s, align 4
  %inc201 = add nsw i32 %619, 1
  %620 = bitcast i32* %s to i8*
  store i32 %inc201, i32* %s, align 4
  br label %for.cond185

for.end202:                                       ; preds = %for.cond185
  %621 = bitcast i32* %n_ci to i8*
  %622 = call i64 @getAddr(i8* %621)
  %623 = load i32, i32* %n_ci, align 4
  %624 = bitcast i32* %p to i8*
  store i32 %623, i32* %p, align 4
  br label %for.cond203

for.cond203:                                      ; preds = %for.inc244, %for.end202
  %625 = bitcast i32* %p to i8*
  %626 = call i64 @getAddr(i8* %625)
  %627 = load i32, i32* %p, align 4
  %628 = bitcast %struct.mdef_t** %m to i8*
  %629 = call i64 @getAddr(i8* %628)
  %630 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_phone204 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %630, i32 0, i32 1
  %631 = bitcast i32* %n_phone204 to i8*
  %632 = call i64 @getAddr(i8* %631)
  %633 = load i32, i32* %n_phone204, align 4
  %cmp205 = icmp slt i32 %627, %633
  br i1 %cmp205, label %for.body207, label %for.end246

for.body207:                                      ; preds = %for.cond203
  %634 = bitcast i32* %s to i8*
  store i32 0, i32* %s, align 4
  br label %for.cond208

for.cond208:                                      ; preds = %for.inc241, %for.body207
  %635 = bitcast i32* %s to i8*
  %636 = call i64 @getAddr(i8* %635)
  %637 = load i32, i32* %s, align 4
  %638 = bitcast %struct.mdef_t** %m to i8*
  %639 = call i64 @getAddr(i8* %638)
  %640 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_emit_state209 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %640, i32 0, i32 2
  %641 = bitcast i32* %n_emit_state209 to i8*
  %642 = call i64 @getAddr(i8* %641)
  %643 = load i32, i32* %n_emit_state209, align 8
  %cmp210 = icmp slt i32 %637, %643
  br i1 %cmp210, label %for.body212, label %for.end243

for.body212:                                      ; preds = %for.cond208
  %644 = bitcast %struct.mdef_t** %m to i8*
  %645 = call i64 @getAddr(i8* %644)
  %646 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sseq213 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %646, i32 0, i32 9
  %647 = bitcast i16*** %sseq213 to i8*
  %648 = call i64 @getAddr(i8* %647)
  %649 = load i16**, i16*** %sseq213, align 8
  %650 = bitcast i32* %p to i8*
  %651 = call i64 @getAddr(i8* %650)
  %652 = load i32, i32* %p, align 4
  %idxprom214 = sext i32 %652 to i64
  %arrayidx215 = getelementptr inbounds i16*, i16** %649, i64 %idxprom214
  %653 = bitcast i16** %arrayidx215 to i8*
  %654 = call i64 @getAddr(i8* %653)
  %655 = load i16*, i16** %arrayidx215, align 8
  %656 = bitcast i32* %s to i8*
  %657 = call i64 @getAddr(i8* %656)
  %658 = load i32, i32* %s, align 4
  %idxprom216 = sext i32 %658 to i64
  %arrayidx217 = getelementptr inbounds i16, i16* %655, i64 %idxprom216
  %659 = bitcast i16* %arrayidx217 to i8*
  %660 = call i64 @getAddr(i8* %659)
  %661 = load i16, i16* %arrayidx217, align 2
  %conv218 = sext i16 %661 to i32
  %662 = bitcast i32* %cd to i8*
  store i32 %conv218, i32* %cd, align 4
  %663 = bitcast %struct.mdef_t** %m to i8*
  %664 = call i64 @getAddr(i8* %663)
  %665 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sseq219 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %665, i32 0, i32 9
  %666 = bitcast i16*** %sseq219 to i8*
  %667 = call i64 @getAddr(i8* %666)
  %668 = load i16**, i16*** %sseq219, align 8
  %669 = bitcast %struct.mdef_t** %m to i8*
  %670 = call i64 @getAddr(i8* %669)
  %671 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %phone220 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %671, i32 0, i32 8
  %672 = bitcast %struct.phone_t** %phone220 to i8*
  %673 = call i64 @getAddr(i8* %672)
  %674 = load %struct.phone_t*, %struct.phone_t** %phone220, align 8
  %675 = bitcast i32* %p to i8*
  %676 = call i64 @getAddr(i8* %675)
  %677 = load i32, i32* %p, align 4
  %idxprom221 = sext i32 %677 to i64
  %arrayidx222 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %674, i64 %idxprom221
  %ci223 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx222, i32 0, i32 2
  %678 = bitcast i8* %ci223 to i8*
  %679 = call i64 @getAddr(i8* %678)
  %680 = load i8, i8* %ci223, align 4
  %conv224 = sext i8 %680 to i32
  %idxprom225 = sext i32 %conv224 to i64
  %arrayidx226 = getelementptr inbounds i16*, i16** %668, i64 %idxprom225
  %681 = bitcast i16** %arrayidx226 to i8*
  %682 = call i64 @getAddr(i8* %681)
  %683 = load i16*, i16** %arrayidx226, align 8
  %684 = bitcast i32* %s to i8*
  %685 = call i64 @getAddr(i8* %684)
  %686 = load i32, i32* %s, align 4
  %idxprom227 = sext i32 %686 to i64
  %arrayidx228 = getelementptr inbounds i16, i16* %683, i64 %idxprom227
  %687 = bitcast i16* %arrayidx228 to i8*
  %688 = call i64 @getAddr(i8* %687)
  %689 = load i16, i16* %arrayidx228, align 2
  %conv229 = sext i16 %689 to i32
  %690 = bitcast i32* %ci to i8*
  store i32 %conv229, i32* %ci, align 4
  %691 = bitcast i32* %ci to i8*
  %692 = call i64 @getAddr(i8* %691)
  %693 = load i32, i32* %ci, align 4
  %conv230 = trunc i32 %693 to i16
  %694 = bitcast %struct.mdef_t** %m to i8*
  %695 = call i64 @getAddr(i8* %694)
  %696 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %cd2cisen231 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %696, i32 0, i32 11
  %697 = bitcast i16** %cd2cisen231 to i8*
  %698 = call i64 @getAddr(i8* %697)
  %699 = load i16*, i16** %cd2cisen231, align 8
  %700 = bitcast i32* %cd to i8*
  %701 = call i64 @getAddr(i8* %700)
  %702 = load i32, i32* %cd, align 4
  %idxprom232 = sext i32 %702 to i64
  %arrayidx233 = getelementptr inbounds i16, i16* %699, i64 %idxprom232
  %703 = bitcast i16* %arrayidx233 to i8*
  store i16 %conv230, i16* %arrayidx233, align 2
  %704 = bitcast %struct.mdef_t** %m to i8*
  %705 = call i64 @getAddr(i8* %704)
  %706 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %phone234 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %706, i32 0, i32 8
  %707 = bitcast %struct.phone_t** %phone234 to i8*
  %708 = call i64 @getAddr(i8* %707)
  %709 = load %struct.phone_t*, %struct.phone_t** %phone234, align 8
  %710 = bitcast i32* %p to i8*
  %711 = call i64 @getAddr(i8* %710)
  %712 = load i32, i32* %p, align 4
  %idxprom235 = sext i32 %712 to i64
  %arrayidx236 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %709, i64 %idxprom235
  %ci237 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx236, i32 0, i32 2
  %713 = bitcast i8* %ci237 to i8*
  %714 = call i64 @getAddr(i8* %713)
  %715 = load i8, i8* %ci237, align 4
  %716 = bitcast %struct.mdef_t** %m to i8*
  %717 = call i64 @getAddr(i8* %716)
  %718 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap238 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %718, i32 0, i32 12
  %719 = bitcast i8** %sen2cimap238 to i8*
  %720 = call i64 @getAddr(i8* %719)
  %721 = load i8*, i8** %sen2cimap238, align 8
  %722 = bitcast i32* %cd to i8*
  %723 = call i64 @getAddr(i8* %722)
  %724 = load i32, i32* %cd, align 4
  %idxprom239 = sext i32 %724 to i64
  %arrayidx240 = getelementptr inbounds i8, i8* %721, i64 %idxprom239
  %725 = bitcast i8* %arrayidx240 to i8*
  store i8 %715, i8* %arrayidx240, align 1
  br label %for.inc241

for.inc241:                                       ; preds = %for.body212
  %726 = bitcast i32* %s to i8*
  %727 = call i64 @getAddr(i8* %726)
  %728 = load i32, i32* %s, align 4
  %inc242 = add nsw i32 %728, 1
  %729 = bitcast i32* %s to i8*
  store i32 %inc242, i32* %s, align 4
  br label %for.cond208

for.end243:                                       ; preds = %for.cond208
  br label %for.inc244

for.inc244:                                       ; preds = %for.end243
  %730 = bitcast i32* %p to i8*
  %731 = call i64 @getAddr(i8* %730)
  %732 = load i32, i32* %p, align 4
  %inc245 = add nsw i32 %732, 1
  %733 = bitcast i32* %p to i8*
  store i32 %inc245, i32* %p, align 4
  br label %for.cond203

for.end246:                                       ; preds = %for.cond203
  %734 = bitcast %struct.mdef_t** %m to i8*
  %735 = call i64 @getAddr(i8* %734)
  %736 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone247 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %736, i32 0, i32 0
  %737 = bitcast i32* %n_ciphone247 to i8*
  %738 = call i64 @getAddr(i8* %737)
  %739 = load i32, i32* %n_ciphone247, align 8
  %conv248 = sext i32 %739 to i64
  %740 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %741 = call i64 @getAddr(i8* %740)
  %call249 = call i8* @__ckd_calloc__(i64 %conv248, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 726)
  %742 = bitcast i8* %call249 to i32*
  %743 = bitcast i32** %cdsen_start to i8*
  %744 = call i64 @getAddr(i8* %743)
  %745 = bitcast i32* %742 to i8*
  %746 = call i64 @getAddr(i8* %745)
  call void @setRealTemp(i64 %744, i64 %746)
  store i32* %742, i32** %cdsen_start, align 8
  %747 = bitcast %struct.mdef_t** %m to i8*
  %748 = call i64 @getAddr(i8* %747)
  %749 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone250 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %749, i32 0, i32 0
  %750 = bitcast i32* %n_ciphone250 to i8*
  %751 = call i64 @getAddr(i8* %750)
  %752 = load i32, i32* %n_ciphone250, align 8
  %conv251 = sext i32 %752 to i64
  %753 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %754 = call i64 @getAddr(i8* %753)
  %call252 = call i8* @__ckd_calloc__(i64 %conv251, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 728)
  %755 = bitcast i8* %call252 to i32*
  %756 = bitcast i32** %cdsen_end to i8*
  %757 = call i64 @getAddr(i8* %756)
  %758 = bitcast i32* %755 to i8*
  %759 = call i64 @getAddr(i8* %758)
  call void @setRealTemp(i64 %757, i64 %759)
  store i32* %755, i32** %cdsen_end, align 8
  %760 = bitcast %struct.mdef_t** %m to i8*
  %761 = call i64 @getAddr(i8* %760)
  %762 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen253 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %762, i32 0, i32 3
  %763 = bitcast i32* %n_ci_sen253 to i8*
  %764 = call i64 @getAddr(i8* %763)
  %765 = load i32, i32* %n_ci_sen253, align 4
  %766 = bitcast i32* %s to i8*
  store i32 %765, i32* %s, align 4
  br label %for.cond254

for.cond254:                                      ; preds = %for.inc288, %for.end246
  %767 = bitcast i32* %s to i8*
  %768 = call i64 @getAddr(i8* %767)
  %769 = load i32, i32* %s, align 4
  %770 = bitcast %struct.mdef_t** %m to i8*
  %771 = call i64 @getAddr(i8* %770)
  %772 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen255 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %772, i32 0, i32 4
  %773 = bitcast i32* %n_sen255 to i8*
  %774 = call i64 @getAddr(i8* %773)
  %775 = load i32, i32* %n_sen255, align 8
  %cmp256 = icmp slt i32 %769, %775
  br i1 %cmp256, label %for.body258, label %for.end290

for.body258:                                      ; preds = %for.cond254
  %776 = bitcast %struct.mdef_t** %m to i8*
  %777 = call i64 @getAddr(i8* %776)
  %778 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap259 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %778, i32 0, i32 12
  %779 = bitcast i8** %sen2cimap259 to i8*
  %780 = call i64 @getAddr(i8* %779)
  %781 = load i8*, i8** %sen2cimap259, align 8
  %782 = bitcast i32* %s to i8*
  %783 = call i64 @getAddr(i8* %782)
  %784 = load i32, i32* %s, align 4
  %idxprom260 = sext i32 %784 to i64
  %arrayidx261 = getelementptr inbounds i8, i8* %781, i64 %idxprom260
  %785 = bitcast i8* %arrayidx261 to i8*
  %786 = call i64 @getAddr(i8* %785)
  %787 = load i8, i8* %arrayidx261, align 1
  %conv262 = sext i8 %787 to i32
  %cmp263 = icmp slt i32 %conv262, 0
  br i1 %cmp263, label %if.then265, label %if.end266

if.then265:                                       ; preds = %for.body258
  br label %for.inc288

if.end266:                                        ; preds = %for.body258
  %788 = bitcast i32** %cdsen_start to i8*
  %789 = call i64 @getAddr(i8* %788)
  %790 = load i32*, i32** %cdsen_start, align 8
  %791 = bitcast %struct.mdef_t** %m to i8*
  %792 = call i64 @getAddr(i8* %791)
  %793 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap267 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %793, i32 0, i32 12
  %794 = bitcast i8** %sen2cimap267 to i8*
  %795 = call i64 @getAddr(i8* %794)
  %796 = load i8*, i8** %sen2cimap267, align 8
  %797 = bitcast i32* %s to i8*
  %798 = call i64 @getAddr(i8* %797)
  %799 = load i32, i32* %s, align 4
  %idxprom268 = sext i32 %799 to i64
  %arrayidx269 = getelementptr inbounds i8, i8* %796, i64 %idxprom268
  %800 = bitcast i8* %arrayidx269 to i8*
  %801 = call i64 @getAddr(i8* %800)
  %802 = load i8, i8* %arrayidx269, align 1
  %conv270 = sext i8 %802 to i32
  %idxprom271 = sext i32 %conv270 to i64
  %arrayidx272 = getelementptr inbounds i32, i32* %790, i64 %idxprom271
  %803 = bitcast i32* %arrayidx272 to i8*
  %804 = call i64 @getAddr(i8* %803)
  %805 = load i32, i32* %arrayidx272, align 4
  %tobool273 = icmp ne i32 %805, 0
  br i1 %tobool273, label %if.end281, label %if.then274

if.then274:                                       ; preds = %if.end266
  %806 = bitcast i32* %s to i8*
  %807 = call i64 @getAddr(i8* %806)
  %808 = load i32, i32* %s, align 4
  %809 = bitcast i32** %cdsen_start to i8*
  %810 = call i64 @getAddr(i8* %809)
  %811 = load i32*, i32** %cdsen_start, align 8
  %812 = bitcast %struct.mdef_t** %m to i8*
  %813 = call i64 @getAddr(i8* %812)
  %814 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap275 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %814, i32 0, i32 12
  %815 = bitcast i8** %sen2cimap275 to i8*
  %816 = call i64 @getAddr(i8* %815)
  %817 = load i8*, i8** %sen2cimap275, align 8
  %818 = bitcast i32* %s to i8*
  %819 = call i64 @getAddr(i8* %818)
  %820 = load i32, i32* %s, align 4
  %idxprom276 = sext i32 %820 to i64
  %arrayidx277 = getelementptr inbounds i8, i8* %817, i64 %idxprom276
  %821 = bitcast i8* %arrayidx277 to i8*
  %822 = call i64 @getAddr(i8* %821)
  %823 = load i8, i8* %arrayidx277, align 1
  %conv278 = sext i8 %823 to i32
  %idxprom279 = sext i32 %conv278 to i64
  %arrayidx280 = getelementptr inbounds i32, i32* %811, i64 %idxprom279
  %824 = bitcast i32* %arrayidx280 to i8*
  store i32 %808, i32* %arrayidx280, align 4
  br label %if.end281

if.end281:                                        ; preds = %if.then274, %if.end266
  %825 = bitcast i32* %s to i8*
  %826 = call i64 @getAddr(i8* %825)
  %827 = load i32, i32* %s, align 4
  %828 = bitcast i32** %cdsen_end to i8*
  %829 = call i64 @getAddr(i8* %828)
  %830 = load i32*, i32** %cdsen_end, align 8
  %831 = bitcast %struct.mdef_t** %m to i8*
  %832 = call i64 @getAddr(i8* %831)
  %833 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap282 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %833, i32 0, i32 12
  %834 = bitcast i8** %sen2cimap282 to i8*
  %835 = call i64 @getAddr(i8* %834)
  %836 = load i8*, i8** %sen2cimap282, align 8
  %837 = bitcast i32* %s to i8*
  %838 = call i64 @getAddr(i8* %837)
  %839 = load i32, i32* %s, align 4
  %idxprom283 = sext i32 %839 to i64
  %arrayidx284 = getelementptr inbounds i8, i8* %836, i64 %idxprom283
  %840 = bitcast i8* %arrayidx284 to i8*
  %841 = call i64 @getAddr(i8* %840)
  %842 = load i8, i8* %arrayidx284, align 1
  %conv285 = sext i8 %842 to i32
  %idxprom286 = sext i32 %conv285 to i64
  %arrayidx287 = getelementptr inbounds i32, i32* %830, i64 %idxprom286
  %843 = bitcast i32* %arrayidx287 to i8*
  store i32 %827, i32* %arrayidx287, align 4
  br label %for.inc288

for.inc288:                                       ; preds = %if.end281, %if.then265
  %844 = bitcast i32* %s to i8*
  %845 = call i64 @getAddr(i8* %844)
  %846 = load i32, i32* %s, align 4
  %inc289 = add nsw i32 %846, 1
  %847 = bitcast i32* %s to i8*
  store i32 %inc289, i32* %s, align 4
  br label %for.cond254

for.end290:                                       ; preds = %for.cond254
  %848 = bitcast %struct.mdef_t** %m to i8*
  %849 = call i64 @getAddr(i8* %848)
  %850 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen291 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %850, i32 0, i32 3
  %851 = bitcast i32* %n_ci_sen291 to i8*
  %852 = call i64 @getAddr(i8* %851)
  %853 = load i32, i32* %n_ci_sen291, align 4
  %854 = bitcast i32* %s to i8*
  store i32 %853, i32* %s, align 4
  br label %for.cond292

for.cond292:                                      ; preds = %for.inc332, %for.end290
  %855 = bitcast i32* %s to i8*
  %856 = call i64 @getAddr(i8* %855)
  %857 = load i32, i32* %s, align 4
  %858 = bitcast %struct.mdef_t** %m to i8*
  %859 = call i64 @getAddr(i8* %858)
  %860 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen293 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %860, i32 0, i32 4
  %861 = bitcast i32* %n_sen293 to i8*
  %862 = call i64 @getAddr(i8* %861)
  %863 = load i32, i32* %n_sen293, align 8
  %cmp294 = icmp slt i32 %857, %863
  br i1 %cmp294, label %for.body296, label %for.end334

for.body296:                                      ; preds = %for.cond292
  %864 = bitcast %struct.mdef_t** %m to i8*
  %865 = call i64 @getAddr(i8* %864)
  %866 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap297 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %866, i32 0, i32 12
  %867 = bitcast i8** %sen2cimap297 to i8*
  %868 = call i64 @getAddr(i8* %867)
  %869 = load i8*, i8** %sen2cimap297, align 8
  %870 = bitcast i32* %s to i8*
  %871 = call i64 @getAddr(i8* %870)
  %872 = load i32, i32* %s, align 4
  %idxprom298 = sext i32 %872 to i64
  %arrayidx299 = getelementptr inbounds i8, i8* %869, i64 %idxprom298
  %873 = bitcast i8* %arrayidx299 to i8*
  %874 = call i64 @getAddr(i8* %873)
  %875 = load i8, i8* %arrayidx299, align 1
  %conv300 = sext i8 %875 to i32
  %cmp301 = icmp sge i32 %conv300, 0
  br i1 %cmp301, label %if.then303, label %if.end304

if.then303:                                       ; preds = %for.body296
  br label %for.inc332

if.end304:                                        ; preds = %for.body296
  %876 = bitcast i32* %p to i8*
  store i32 0, i32* %p, align 4
  br label %for.cond305

for.cond305:                                      ; preds = %for.inc320, %if.end304
  %877 = bitcast i32* %p to i8*
  %878 = call i64 @getAddr(i8* %877)
  %879 = load i32, i32* %p, align 4
  %880 = bitcast %struct.mdef_t** %m to i8*
  %881 = call i64 @getAddr(i8* %880)
  %882 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone306 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %882, i32 0, i32 0
  %883 = bitcast i32* %n_ciphone306 to i8*
  %884 = call i64 @getAddr(i8* %883)
  %885 = load i32, i32* %n_ciphone306, align 8
  %cmp307 = icmp slt i32 %879, %885
  br i1 %cmp307, label %for.body309, label %for.end322

for.body309:                                      ; preds = %for.cond305
  %886 = bitcast i32* %s to i8*
  %887 = call i64 @getAddr(i8* %886)
  %888 = load i32, i32* %s, align 4
  %889 = bitcast i32** %cdsen_start to i8*
  %890 = call i64 @getAddr(i8* %889)
  %891 = load i32*, i32** %cdsen_start, align 8
  %892 = bitcast i32* %p to i8*
  %893 = call i64 @getAddr(i8* %892)
  %894 = load i32, i32* %p, align 4
  %idxprom310 = sext i32 %894 to i64
  %arrayidx311 = getelementptr inbounds i32, i32* %891, i64 %idxprom310
  %895 = bitcast i32* %arrayidx311 to i8*
  %896 = call i64 @getAddr(i8* %895)
  %897 = load i32, i32* %arrayidx311, align 4
  %cmp312 = icmp sgt i32 %888, %897
  br i1 %cmp312, label %land.lhs.true, label %if.end319

land.lhs.true:                                    ; preds = %for.body309
  %898 = bitcast i32* %s to i8*
  %899 = call i64 @getAddr(i8* %898)
  %900 = load i32, i32* %s, align 4
  %901 = bitcast i32** %cdsen_end to i8*
  %902 = call i64 @getAddr(i8* %901)
  %903 = load i32*, i32** %cdsen_end, align 8
  %904 = bitcast i32* %p to i8*
  %905 = call i64 @getAddr(i8* %904)
  %906 = load i32, i32* %p, align 4
  %idxprom314 = sext i32 %906 to i64
  %arrayidx315 = getelementptr inbounds i32, i32* %903, i64 %idxprom314
  %907 = bitcast i32* %arrayidx315 to i8*
  %908 = call i64 @getAddr(i8* %907)
  %909 = load i32, i32* %arrayidx315, align 4
  %cmp316 = icmp slt i32 %900, %909
  br i1 %cmp316, label %if.then318, label %if.end319

if.then318:                                       ; preds = %land.lhs.true
  br label %for.end322

if.end319:                                        ; preds = %land.lhs.true, %for.body309
  br label %for.inc320

for.inc320:                                       ; preds = %if.end319
  %910 = bitcast i32* %p to i8*
  %911 = call i64 @getAddr(i8* %910)
  %912 = load i32, i32* %p, align 4
  %inc321 = add nsw i32 %912, 1
  %913 = bitcast i32* %p to i8*
  store i32 %inc321, i32* %p, align 4
  br label %for.cond305

for.end322:                                       ; preds = %if.then318, %for.cond305
  %914 = bitcast i32* %p to i8*
  %915 = call i64 @getAddr(i8* %914)
  %916 = load i32, i32* %p, align 4
  %917 = bitcast %struct.mdef_t** %m to i8*
  %918 = call i64 @getAddr(i8* %917)
  %919 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone323 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %919, i32 0, i32 0
  %920 = bitcast i32* %n_ciphone323 to i8*
  %921 = call i64 @getAddr(i8* %920)
  %922 = load i32, i32* %n_ciphone323, align 8
  %cmp324 = icmp sge i32 %916, %922
  br i1 %cmp324, label %if.then326, label %if.end327

if.then326:                                       ; preds = %for.end322
  %923 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %924 = call i64 @getAddr(i8* %923)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 750, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %925 = bitcast i32* %s to i8*
  %926 = call i64 @getAddr(i8* %925)
  %927 = load i32, i32* %s, align 4
  %928 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %929 = call i64 @getAddr(i8* %928)
  call void @addFunArg(i32 1, i64 %929, i64 %926)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.60, i32 0, i32 0), i32 %927)
  br label %if.end327

if.end327:                                        ; preds = %if.then326, %for.end322
  %930 = bitcast i32* %p to i8*
  %931 = call i64 @getAddr(i8* %930)
  %932 = load i32, i32* %p, align 4
  %conv328 = trunc i32 %932 to i8
  %933 = bitcast %struct.mdef_t** %m to i8*
  %934 = call i64 @getAddr(i8* %933)
  %935 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap329 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %935, i32 0, i32 12
  %936 = bitcast i8** %sen2cimap329 to i8*
  %937 = call i64 @getAddr(i8* %936)
  %938 = load i8*, i8** %sen2cimap329, align 8
  %939 = bitcast i32* %s to i8*
  %940 = call i64 @getAddr(i8* %939)
  %941 = load i32, i32* %s, align 4
  %idxprom330 = sext i32 %941 to i64
  %arrayidx331 = getelementptr inbounds i8, i8* %938, i64 %idxprom330
  %942 = bitcast i8* %arrayidx331 to i8*
  store i8 %conv328, i8* %arrayidx331, align 1
  br label %for.inc332

for.inc332:                                       ; preds = %if.end327, %if.then303
  %943 = bitcast i32* %s to i8*
  %944 = call i64 @getAddr(i8* %943)
  %945 = load i32, i32* %s, align 4
  %inc333 = add nsw i32 %945, 1
  %946 = bitcast i32* %s to i8*
  store i32 %inc333, i32* %s, align 4
  br label %for.cond292

for.end334:                                       ; preds = %for.cond292
  %947 = bitcast %struct.mdef_t** %m to i8*
  %948 = call i64 @getAddr(i8* %947)
  %949 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone335 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %949, i32 0, i32 0
  %950 = bitcast i32* %n_ciphone335 to i8*
  %951 = call i64 @getAddr(i8* %950)
  %952 = load i32, i32* %n_ciphone335, align 8
  %conv336 = sext i32 %952 to i64
  %953 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %954 = call i64 @getAddr(i8* %953)
  %call337 = call i8* @__ckd_calloc__(i64 %conv336, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 755)
  %955 = bitcast i8* %call337 to i32*
  %956 = bitcast %struct.mdef_t** %m to i8*
  %957 = call i64 @getAddr(i8* %956)
  %958 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %ciphone2n_cd_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %958, i32 0, i32 13
  %959 = bitcast i32** %ciphone2n_cd_sen to i8*
  %960 = call i64 @getAddr(i8* %959)
  %961 = bitcast i32* %955 to i8*
  %962 = call i64 @getAddr(i8* %961)
  call void @setRealTemp(i64 %960, i64 %962)
  store i32* %955, i32** %ciphone2n_cd_sen, align 8
  %963 = bitcast i32* %n to i8*
  store i32 0, i32* %n, align 4
  %964 = bitcast i32* %p to i8*
  store i32 0, i32* %p, align 4
  br label %for.cond338

for.cond338:                                      ; preds = %for.inc362, %for.end334
  %965 = bitcast i32* %p to i8*
  %966 = call i64 @getAddr(i8* %965)
  %967 = load i32, i32* %p, align 4
  %968 = bitcast %struct.mdef_t** %m to i8*
  %969 = call i64 @getAddr(i8* %968)
  %970 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone339 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %970, i32 0, i32 0
  %971 = bitcast i32* %n_ciphone339 to i8*
  %972 = call i64 @getAddr(i8* %971)
  %973 = load i32, i32* %n_ciphone339, align 8
  %cmp340 = icmp slt i32 %967, %973
  br i1 %cmp340, label %for.body342, label %for.end364

for.body342:                                      ; preds = %for.cond338
  %974 = bitcast i32** %cdsen_start to i8*
  %975 = call i64 @getAddr(i8* %974)
  %976 = load i32*, i32** %cdsen_start, align 8
  %977 = bitcast i32* %p to i8*
  %978 = call i64 @getAddr(i8* %977)
  %979 = load i32, i32* %p, align 4
  %idxprom343 = sext i32 %979 to i64
  %arrayidx344 = getelementptr inbounds i32, i32* %976, i64 %idxprom343
  %980 = bitcast i32* %arrayidx344 to i8*
  %981 = call i64 @getAddr(i8* %980)
  %982 = load i32, i32* %arrayidx344, align 4
  %cmp345 = icmp sgt i32 %982, 0
  br i1 %cmp345, label %if.then347, label %if.end361

if.then347:                                       ; preds = %for.body342
  %983 = bitcast i32** %cdsen_end to i8*
  %984 = call i64 @getAddr(i8* %983)
  %985 = load i32*, i32** %cdsen_end, align 8
  %986 = bitcast i32* %p to i8*
  %987 = call i64 @getAddr(i8* %986)
  %988 = load i32, i32* %p, align 4
  %idxprom348 = sext i32 %988 to i64
  %arrayidx349 = getelementptr inbounds i32, i32* %985, i64 %idxprom348
  %989 = bitcast i32* %arrayidx349 to i8*
  %990 = call i64 @getAddr(i8* %989)
  %991 = load i32, i32* %arrayidx349, align 4
  %992 = bitcast i32** %cdsen_start to i8*
  %993 = call i64 @getAddr(i8* %992)
  %994 = load i32*, i32** %cdsen_start, align 8
  %995 = bitcast i32* %p to i8*
  %996 = call i64 @getAddr(i8* %995)
  %997 = load i32, i32* %p, align 4
  %idxprom350 = sext i32 %997 to i64
  %arrayidx351 = getelementptr inbounds i32, i32* %994, i64 %idxprom350
  %998 = bitcast i32* %arrayidx351 to i8*
  %999 = call i64 @getAddr(i8* %998)
  %1000 = load i32, i32* %arrayidx351, align 4
  %sub352 = sub nsw i32 %991, %1000
  %add353 = add nsw i32 %sub352, 1
  %1001 = bitcast %struct.mdef_t** %m to i8*
  %1002 = call i64 @getAddr(i8* %1001)
  %1003 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %ciphone2n_cd_sen354 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %1003, i32 0, i32 13
  %1004 = bitcast i32** %ciphone2n_cd_sen354 to i8*
  %1005 = call i64 @getAddr(i8* %1004)
  %1006 = load i32*, i32** %ciphone2n_cd_sen354, align 8
  %1007 = bitcast i32* %p to i8*
  %1008 = call i64 @getAddr(i8* %1007)
  %1009 = load i32, i32* %p, align 4
  %idxprom355 = sext i32 %1009 to i64
  %arrayidx356 = getelementptr inbounds i32, i32* %1006, i64 %idxprom355
  %1010 = bitcast i32* %arrayidx356 to i8*
  store i32 %add353, i32* %arrayidx356, align 4
  %1011 = bitcast %struct.mdef_t** %m to i8*
  %1012 = call i64 @getAddr(i8* %1011)
  %1013 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %ciphone2n_cd_sen357 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %1013, i32 0, i32 13
  %1014 = bitcast i32** %ciphone2n_cd_sen357 to i8*
  %1015 = call i64 @getAddr(i8* %1014)
  %1016 = load i32*, i32** %ciphone2n_cd_sen357, align 8
  %1017 = bitcast i32* %p to i8*
  %1018 = call i64 @getAddr(i8* %1017)
  %1019 = load i32, i32* %p, align 4
  %idxprom358 = sext i32 %1019 to i64
  %arrayidx359 = getelementptr inbounds i32, i32* %1016, i64 %idxprom358
  %1020 = bitcast i32* %arrayidx359 to i8*
  %1021 = call i64 @getAddr(i8* %1020)
  %1022 = load i32, i32* %arrayidx359, align 4
  %1023 = bitcast i32* %n to i8*
  %1024 = call i64 @getAddr(i8* %1023)
  %1025 = load i32, i32* %n, align 4
  %add360 = add nsw i32 %1025, %1022
  %1026 = bitcast i32* %n to i8*
  store i32 %add360, i32* %n, align 4
  br label %if.end361

if.end361:                                        ; preds = %if.then347, %for.body342
  br label %for.inc362

for.inc362:                                       ; preds = %if.end361
  %1027 = bitcast i32* %p to i8*
  %1028 = call i64 @getAddr(i8* %1027)
  %1029 = load i32, i32* %p, align 4
  %inc363 = add nsw i32 %1029, 1
  %1030 = bitcast i32* %p to i8*
  store i32 %inc363, i32* %p, align 4
  br label %for.cond338

for.end364:                                       ; preds = %for.cond338
  %1031 = bitcast %struct.mdef_t** %m to i8*
  %1032 = call i64 @getAddr(i8* %1031)
  %1033 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen365 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %1033, i32 0, i32 3
  %1034 = bitcast i32* %n_ci_sen365 to i8*
  %1035 = call i64 @getAddr(i8* %1034)
  %1036 = load i32, i32* %n_ci_sen365, align 4
  %1037 = bitcast i32* %n to i8*
  %1038 = call i64 @getAddr(i8* %1037)
  %1039 = load i32, i32* %n, align 4
  %add366 = add nsw i32 %1039, %1036
  %1040 = bitcast i32* %n to i8*
  store i32 %add366, i32* %n, align 4
  %1041 = bitcast i32* %n to i8*
  %1042 = call i64 @getAddr(i8* %1041)
  %1043 = load i32, i32* %n, align 4
  %1044 = bitcast %struct.mdef_t** %m to i8*
  %1045 = call i64 @getAddr(i8* %1044)
  %1046 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen367 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %1046, i32 0, i32 4
  %1047 = bitcast i32* %n_sen367 to i8*
  %1048 = call i64 @getAddr(i8* %1047)
  %1049 = load i32, i32* %n_sen367, align 8
  %cmp368 = icmp eq i32 %1043, %1049
  br i1 %cmp368, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end364
  br label %cond.end

cond.false:                                       ; preds = %for.end364
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 764, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__PRETTY_FUNCTION__.mdef_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %1050, %cond.true
  %1051 = bitcast i32** %cdsen_start to i8*
  %1052 = call i64 @getAddr(i8* %1051)
  %1053 = load i32*, i32** %cdsen_start, align 8
  %1054 = bitcast i32* %1053 to i8*
  %1055 = bitcast void (i8*)* @ckd_free to i8*
  %1056 = call i64 @getAddr(i8* %1055)
  call void @ckd_free(i8* %1054)
  %1057 = bitcast i32** %cdsen_end to i8*
  %1058 = call i64 @getAddr(i8* %1057)
  %1059 = load i32*, i32** %cdsen_end, align 8
  %1060 = bitcast i32* %1059 to i8*
  %1061 = bitcast void (i8*)* @ckd_free to i8*
  %1062 = call i64 @getAddr(i8* %1061)
  call void @ckd_free(i8* %1060)
  %1063 = bitcast %struct.mdef_t** %m to i8*
  %1064 = call i64 @getAddr(i8* %1063)
  %1065 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %1066 = bitcast void (%struct.mdef_t*)* @sseq_compress to i8*
  %1067 = call i64 @getAddr(i8* %1066)
  call void @sseq_compress(%struct.mdef_t* %1065)
  %1068 = bitcast void (i8*, i64, i8*)* @_E__pr_info_header to i8*
  %1069 = call i64 @getAddr(i8* %1068)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 771, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.30, i32 0, i32 0))
  %1070 = bitcast %struct.mdef_t** %m to i8*
  %1071 = call i64 @getAddr(i8* %1070)
  %1072 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone370 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %1072, i32 0, i32 0
  %1073 = bitcast i32* %n_ciphone370 to i8*
  %1074 = call i64 @getAddr(i8* %1073)
  %1075 = load i32, i32* %n_ciphone370, align 8
  %1076 = bitcast %struct.mdef_t** %m to i8*
  %1077 = call i64 @getAddr(i8* %1076)
  %1078 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_phone371 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %1078, i32 0, i32 1
  %1079 = bitcast i32* %n_phone371 to i8*
  %1080 = call i64 @getAddr(i8* %1079)
  %1081 = load i32, i32* %n_phone371, align 4
  %1082 = bitcast %struct.mdef_t** %m to i8*
  %1083 = call i64 @getAddr(i8* %1082)
  %1084 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone372 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %1084, i32 0, i32 0
  %1085 = bitcast i32* %n_ciphone372 to i8*
  %1086 = call i64 @getAddr(i8* %1085)
  %1087 = load i32, i32* %n_ciphone372, align 8
  %sub373 = sub nsw i32 %1081, %1087
  %1088 = bitcast %struct.mdef_t** %m to i8*
  %1089 = call i64 @getAddr(i8* %1088)
  %1090 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_emit_state374 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %1090, i32 0, i32 2
  %1091 = bitcast i32* %n_emit_state374 to i8*
  %1092 = call i64 @getAddr(i8* %1091)
  %1093 = load i32, i32* %n_emit_state374, align 8
  %1094 = bitcast %struct.mdef_t** %m to i8*
  %1095 = call i64 @getAddr(i8* %1094)
  %1096 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen375 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %1096, i32 0, i32 3
  %1097 = bitcast i32* %n_ci_sen375 to i8*
  %1098 = call i64 @getAddr(i8* %1097)
  %1099 = load i32, i32* %n_ci_sen375, align 4
  %1100 = bitcast %struct.mdef_t** %m to i8*
  %1101 = call i64 @getAddr(i8* %1100)
  %1102 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen376 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %1102, i32 0, i32 4
  %1103 = bitcast i32* %n_sen376 to i8*
  %1104 = call i64 @getAddr(i8* %1103)
  %1105 = load i32, i32* %n_sen376, align 8
  %1106 = bitcast %struct.mdef_t** %m to i8*
  %1107 = call i64 @getAddr(i8* %1106)
  %1108 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sseq = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %1108, i32 0, i32 10
  %1109 = bitcast i32* %n_sseq to i8*
  %1110 = call i64 @getAddr(i8* %1109)
  %1111 = load i32, i32* %n_sseq, align 8
  %1112 = bitcast void (i8*, ...)* @_E__pr_info to i8*
  %1113 = call i64 @getAddr(i8* %1112)
  call void @addFunArg(i32 1, i64 %1113, i64 %1074)
  call void @addFunArg(i32 3, i64 %1113, i64 %1092)
  call void @addFunArg(i32 4, i64 %1113, i64 %1098)
  call void @addFunArg(i32 5, i64 %1113, i64 %1104)
  call void @addFunArg(i32 6, i64 %1113, i64 %1110)
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.62, i32 0, i32 0), i32 %1075, i32 %sub373, i32 %1093, i32 %1099, i32 %1105, i32 %1111)
  %1114 = bitcast %struct._IO_FILE** %fp to i8*
  %1115 = call i64 @getAddr(i8* %1114)
  %1116 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call377 = call i32 @fclose(%struct._IO_FILE* %1116)
  %1117 = bitcast %struct.mdef_t** %m to i8*
  %1118 = call i64 @getAddr(i8* %1117)
  %1119 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %1120 = bitcast %struct.mdef_t* (i8*)* @mdef_init to i8*
  %1121 = call i64 @getAddr(i8* %1120)
  call void @funcExit(i64 %1121)
  %1122 = bitcast %struct.mdef_t* (i8*)* @mdef_init to i8*
  %1123 = call i64 @getAddr(i8* %1122)
  call void @trackReturn(i64 %1123, i64 %1118)
  ret %struct.mdef_t* %1119
}

declare dso_local void @_E__pr_header(i8*, i64, i8*) #1

declare dso_local void @_E__die_error(i8*, ...) #1

declare dso_local void @_E__pr_info_header(i8*, i64, i8*) #1

declare dso_local void @_E__pr_info(i8*, ...) #1

declare dso_local i8* @__ckd_calloc__(i64, i64, i8*, i32) #1

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #1

declare dso_local void @_E__fatal_sys_error(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @noncomment_line(i8* %line, i32 %size, %struct._IO_FILE* %fp) #0 {
entry:
  %0 = bitcast i32 (i8*, i32, %struct._IO_FILE*)* @noncomment_line to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %retval = alloca i32, align 4
  %line.addr = alloca i8*, align 8
  %size.addr = alloca i32, align 4
  %fp.addr = alloca %struct._IO_FILE*, align 8
  %2 = bitcast i8** %line.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast i8* %line to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store i8* %line, i8** %line.addr, align 8
  %6 = bitcast i32* %size.addr to i8*
  store i32 %size, i32* %size.addr, align 4
  %7 = bitcast %struct._IO_FILE** %fp.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  %9 = bitcast %struct._IO_FILE* %fp to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void @setRealTemp(i64 %8, i64 %10)
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %fp.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %11 = bitcast i8** %line.addr to i8*
  %12 = call i64 @getAddr(i8* %11)
  %13 = load i8*, i8** %line.addr, align 8
  %14 = bitcast i32* %size.addr to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = load i32, i32* %size.addr, align 4
  %17 = bitcast %struct._IO_FILE** %fp.addr to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %call = call i8* @fgets(i8* %13, i32 %16, %struct._IO_FILE* %19)
  %cmp = icmp ne i8* %call, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %20 = bitcast i8** %line.addr to i8*
  %21 = call i64 @getAddr(i8* %20)
  %22 = load i8*, i8** %line.addr, align 8
  %arrayidx = getelementptr inbounds i8, i8* %22, i64 0
  %23 = bitcast i8* %arrayidx to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %25 to i32
  %cmp1 = icmp ne i32 %conv, 35
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %26 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %27 = bitcast i32* %retval to i8*
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %28 = bitcast i32* %retval to i8*
  %29 = call i64 @getAddr(i8* %28)
  %30 = load i32, i32* %retval, align 4
  %31 = bitcast i32 (i8*, i32, %struct._IO_FILE*)* @noncomment_line to i8*
  %32 = call i64 @getAddr(i8* %31)
  call void @funcExit(i64 %32)
  %33 = bitcast i32 (i8*, i32, %struct._IO_FILE*)* @noncomment_line to i8*
  %34 = call i64 @getAddr(i8* %33)
  call void @trackReturn(i64 %34, i64 %29)
  ret i32 %30
}

; Function Attrs: nounwind readonly
declare dso_local i32 @strncmp(i8*, i8*, i64) #4

; Function Attrs: nounwind
declare dso_local i32 @__isoc99_sscanf(i8*, i8*, ...) #3

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #4

declare dso_local %struct.hash_table_t* @hash_new(i32, i32) #1

declare dso_local i8** @__ckd_calloc_2d__(i32, i32, i32, i8*, i32) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @parse_base_line(%struct.mdef_t* %m, i8* %line, i32 %p) #0 {
entry:
  %0 = bitcast void (%struct.mdef_t*, i8*, i32)* @parse_base_line to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %m.addr = alloca %struct.mdef_t*, align 8
  %line.addr = alloca i8*, align 8
  %p.addr = alloca i32, align 4
  %wlen = alloca i32, align 4
  %n = alloca i32, align 4
  %word = alloca [1024 x i8], align 16
  %lp = alloca i8*, align 8
  %ci = alloca i8, align 1
  %2 = bitcast %struct.mdef_t** %m.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.mdef_t* %m to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %6 = bitcast i8** %line.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = bitcast i8* %line to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @setRealTemp(i64 %7, i64 %9)
  store i8* %line, i8** %line.addr, align 8
  %10 = bitcast i32* %p.addr to i8*
  store i32 %p, i32* %p.addr, align 4
  %11 = bitcast i8** %line.addr to i8*
  %12 = call i64 @getAddr(i8* %11)
  %13 = load i8*, i8** %line.addr, align 8
  %14 = bitcast i8** %lp to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = bitcast i8* %13 to i8*
  %17 = call i64 @getAddr(i8* %16)
  call void @setRealTemp(i64 %15, i64 %17)
  store i8* %13, i8** %lp, align 8
  %18 = bitcast i8** %lp to i8*
  %19 = call i64 @getAddr(i8* %18)
  %20 = load i8*, i8** %lp, align 8
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %20, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay, i32* %wlen) #7
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %21 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %22 = call i64 @getAddr(i8* %21)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 421, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %23 = bitcast i8** %line.addr to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = load i8*, i8** %line.addr, align 8
  %26 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %27 = call i64 @getAddr(i8* %26)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.64, i32 0, i32 0), i8* %25)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %28 = bitcast i32* %wlen to i8*
  %29 = call i64 @getAddr(i8* %28)
  %30 = load i32, i32* %wlen, align 4
  %31 = bitcast i8** %lp to i8*
  %32 = call i64 @getAddr(i8* %31)
  %33 = load i8*, i8** %lp, align 8
  %idx.ext = sext i32 %30 to i64
  %add.ptr = getelementptr inbounds i8, i8* %33, i64 %idx.ext
  %34 = bitcast i8** %lp to i8*
  %35 = call i64 @getAddr(i8* %34)
  %36 = bitcast i8* %add.ptr to i8*
  %37 = call i64 @getAddr(i8* %36)
  call void @setRealTemp(i64 %35, i64 %37)
  store i8* %add.ptr, i8** %lp, align 8
  %38 = bitcast %struct.mdef_t** %m.addr to i8*
  %39 = call i64 @getAddr(i8* %38)
  %40 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %arraydecay1 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %41 = bitcast i8 (%struct.mdef_t*, i8*)* @mdef_ciphone_id to i8*
  %42 = call i64 @getAddr(i8* %41)
  %call2 = call signext i8 @mdef_ciphone_id(%struct.mdef_t* %40, i8* %arraydecay1)
  %43 = bitcast i8* %ci to i8*
  store i8 %call2, i8* %ci, align 1
  %44 = bitcast i8* %ci to i8*
  %45 = call i64 @getAddr(i8* %44)
  %46 = load i8, i8* %ci, align 1
  %conv = sext i8 %46 to i32
  %cmp3 = icmp sge i32 %conv, 0
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  %47 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %48 = call i64 @getAddr(i8* %47)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 427, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %49 = bitcast i8** %line.addr to i8*
  %50 = call i64 @getAddr(i8* %49)
  %51 = load i8*, i8** %line.addr, align 8
  %52 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %53 = call i64 @getAddr(i8* %52)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.65, i32 0, i32 0), i8* %51)
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  %54 = bitcast %struct.mdef_t** %m.addr to i8*
  %55 = call i64 @getAddr(i8* %54)
  %56 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %arraydecay7 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %57 = bitcast i32* %p.addr to i8*
  %58 = call i64 @getAddr(i8* %57)
  %59 = load i32, i32* %p.addr, align 4
  %60 = bitcast void (%struct.mdef_t*, i8*, i32)* @ciphone_add to i8*
  %61 = call i64 @getAddr(i8* %60)
  call void @addFunArg(i32 2, i64 %61, i64 %58)
  call void @ciphone_add(%struct.mdef_t* %56, i8* %arraydecay7, i32 %59)
  %62 = bitcast i32* %p.addr to i8*
  %63 = call i64 @getAddr(i8* %62)
  %64 = load i32, i32* %p.addr, align 4
  %conv8 = trunc i32 %64 to i8
  %65 = bitcast i8* %ci to i8*
  store i8 %conv8, i8* %ci, align 1
  %66 = bitcast i32* %n to i8*
  store i32 0, i32* %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end6
  %67 = bitcast i32* %n to i8*
  %68 = call i64 @getAddr(i8* %67)
  %69 = load i32, i32* %n, align 4
  %cmp9 = icmp slt i32 %69, 3
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %70 = bitcast i8** %lp to i8*
  %71 = call i64 @getAddr(i8* %70)
  %72 = load i8*, i8** %lp, align 8
  %arraydecay11 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call12 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %72, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay11, i32* %wlen) #7
  %cmp13 = icmp ne i32 %call12, 1
  br i1 %cmp13, label %if.then19, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %arraydecay15 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call16 = call i32 @strcmp(i8* %arraydecay15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.66, i32 0, i32 0)) #8
  %cmp17 = icmp ne i32 %call16, 0
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %lor.lhs.false, %for.body
  %73 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %74 = call i64 @getAddr(i8* %73)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 436, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %75 = bitcast i8** %line.addr to i8*
  %76 = call i64 @getAddr(i8* %75)
  %77 = load i8*, i8** %line.addr, align 8
  %78 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %79 = call i64 @getAddr(i8* %78)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.67, i32 0, i32 0), i8* %77)
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %lor.lhs.false
  %80 = bitcast i32* %wlen to i8*
  %81 = call i64 @getAddr(i8* %80)
  %82 = load i32, i32* %wlen, align 4
  %83 = bitcast i8** %lp to i8*
  %84 = call i64 @getAddr(i8* %83)
  %85 = load i8*, i8** %lp, align 8
  %idx.ext21 = sext i32 %82 to i64
  %add.ptr22 = getelementptr inbounds i8, i8* %85, i64 %idx.ext21
  %86 = bitcast i8** %lp to i8*
  %87 = call i64 @getAddr(i8* %86)
  %88 = bitcast i8* %add.ptr22 to i8*
  %89 = call i64 @getAddr(i8* %88)
  call void @setRealTemp(i64 %87, i64 %89)
  store i8* %add.ptr22, i8** %lp, align 8
  br label %for.inc

for.inc:                                          ; preds = %if.end20
  %90 = bitcast i32* %n to i8*
  %91 = call i64 @getAddr(i8* %90)
  %92 = load i32, i32* %n, align 4
  %inc = add nsw i32 %92, 1
  %93 = bitcast i32* %n to i8*
  store i32 %inc, i32* %n, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %94 = bitcast i8** %lp to i8*
  %95 = call i64 @getAddr(i8* %94)
  %96 = load i8*, i8** %lp, align 8
  %arraydecay23 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call24 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %96, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay23, i32* %wlen) #7
  %cmp25 = icmp ne i32 %call24, 1
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %for.end
  %97 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %98 = call i64 @getAddr(i8* %97)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 442, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %99 = bitcast i8** %line.addr to i8*
  %100 = call i64 @getAddr(i8* %99)
  %101 = load i8*, i8** %line.addr, align 8
  %102 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %103 = call i64 @getAddr(i8* %102)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.68, i32 0, i32 0), i8* %101)
  br label %if.end28

if.end28:                                         ; preds = %if.then27, %for.end
  %104 = bitcast i32* %wlen to i8*
  %105 = call i64 @getAddr(i8* %104)
  %106 = load i32, i32* %wlen, align 4
  %107 = bitcast i8** %lp to i8*
  %108 = call i64 @getAddr(i8* %107)
  %109 = load i8*, i8** %lp, align 8
  %idx.ext29 = sext i32 %106 to i64
  %add.ptr30 = getelementptr inbounds i8, i8* %109, i64 %idx.ext29
  %110 = bitcast i8** %lp to i8*
  %111 = call i64 @getAddr(i8* %110)
  %112 = bitcast i8* %add.ptr30 to i8*
  %113 = call i64 @getAddr(i8* %112)
  call void @setRealTemp(i64 %111, i64 %113)
  store i8* %add.ptr30, i8** %lp, align 8
  %arraydecay31 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call32 = call i32 @strcmp(i8* %arraydecay31, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.69, i32 0, i32 0)) #8
  %cmp33 = icmp eq i32 %call32, 0
  br i1 %cmp33, label %if.then35, label %if.else

if.then35:                                        ; preds = %if.end28
  %114 = bitcast %struct.mdef_t** %m.addr to i8*
  %115 = call i64 @getAddr(i8* %114)
  %116 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %116, i32 0, i32 7
  %117 = bitcast %struct.ciphone_t** %ciphone to i8*
  %118 = call i64 @getAddr(i8* %117)
  %119 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone, align 8
  %120 = bitcast i8* %ci to i8*
  %121 = call i64 @getAddr(i8* %120)
  %122 = load i8, i8* %ci, align 1
  %conv36 = sext i8 %122 to i32
  %idxprom = sext i32 %conv36 to i64
  %arrayidx = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %119, i64 %idxprom
  %filler = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx, i32 0, i32 1
  %123 = bitcast i32* %filler to i8*
  store i32 1, i32* %filler, align 8
  br label %if.end49

if.else:                                          ; preds = %if.end28
  %arraydecay37 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call38 = call i32 @strcmp(i8* %arraydecay37, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.70, i32 0, i32 0)) #8
  %cmp39 = icmp eq i32 %call38, 0
  br i1 %cmp39, label %if.then41, label %if.else47

if.then41:                                        ; preds = %if.else
  %124 = bitcast %struct.mdef_t** %m.addr to i8*
  %125 = call i64 @getAddr(i8* %124)
  %126 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone42 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %126, i32 0, i32 7
  %127 = bitcast %struct.ciphone_t** %ciphone42 to i8*
  %128 = call i64 @getAddr(i8* %127)
  %129 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone42, align 8
  %130 = bitcast i8* %ci to i8*
  %131 = call i64 @getAddr(i8* %130)
  %132 = load i8, i8* %ci, align 1
  %conv43 = sext i8 %132 to i32
  %idxprom44 = sext i32 %conv43 to i64
  %arrayidx45 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %129, i64 %idxprom44
  %filler46 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx45, i32 0, i32 1
  %133 = bitcast i32* %filler46 to i8*
  store i32 0, i32* %filler46, align 8
  br label %if.end48

if.else47:                                        ; preds = %if.else
  %134 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %135 = call i64 @getAddr(i8* %134)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 449, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %136 = bitcast i8** %line.addr to i8*
  %137 = call i64 @getAddr(i8* %136)
  %138 = load i8*, i8** %line.addr, align 8
  %139 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %140 = call i64 @getAddr(i8* %139)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.71, i32 0, i32 0), i8* %138)
  br label %if.end48

if.end48:                                         ; preds = %if.else47, %if.then41
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.then35
  %141 = bitcast %struct.mdef_t** %m.addr to i8*
  %142 = call i64 @getAddr(i8* %141)
  %143 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %144 = bitcast i8* %ci to i8*
  %145 = call i64 @getAddr(i8* %144)
  %146 = load i8, i8* %ci, align 1
  %147 = bitcast i32* %p.addr to i8*
  %148 = call i64 @getAddr(i8* %147)
  %149 = load i32, i32* %p.addr, align 4
  %150 = bitcast void (%struct.mdef_t*, i8, i8, i8, i32, i32)* @triphone_add to i8*
  %151 = call i64 @getAddr(i8* %150)
  call void @addFunArg(i32 1, i64 %151, i64 %145)
  call void @addFunArg(i32 5, i64 %151, i64 %148)
  call void @triphone_add(%struct.mdef_t* %143, i8 signext %146, i8 signext -1, i8 signext -1, i32 4, i32 %149)
  %152 = bitcast %struct.mdef_t** %m.addr to i8*
  %153 = call i64 @getAddr(i8* %152)
  %154 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %155 = bitcast i8** %line.addr to i8*
  %156 = call i64 @getAddr(i8* %155)
  %157 = load i8*, i8** %line.addr, align 8
  %158 = bitcast i8** %lp to i8*
  %159 = call i64 @getAddr(i8* %158)
  %160 = load i8*, i8** %lp, align 8
  %161 = bitcast i8** %line.addr to i8*
  %162 = call i64 @getAddr(i8* %161)
  %163 = load i8*, i8** %line.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %160 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %163 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv50 = trunc i64 %sub.ptr.sub to i32
  %164 = bitcast i32* %p.addr to i8*
  %165 = call i64 @getAddr(i8* %164)
  %166 = load i32, i32* %p.addr, align 4
  %167 = bitcast void (%struct.mdef_t*, i8*, i32, i32)* @parse_tmat_senmap to i8*
  %168 = call i64 @getAddr(i8* %167)
  call void @addFunArg(i32 3, i64 %168, i64 %165)
  call void @parse_tmat_senmap(%struct.mdef_t* %154, i8* %157, i32 %conv50, i32 %166)
  %169 = bitcast void (%struct.mdef_t*, i8*, i32)* @parse_base_line to i8*
  %170 = call i64 @getAddr(i8* %169)
  call void @funcExit(i64 %170)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @parse_tri_line(%struct.mdef_t* %m, i8* %line, i32 %p) #0 {
entry:
  %0 = bitcast void (%struct.mdef_t*, i8*, i32)* @parse_tri_line to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %m.addr = alloca %struct.mdef_t*, align 8
  %line.addr = alloca i8*, align 8
  %p.addr = alloca i32, align 4
  %wlen = alloca i32, align 4
  %word = alloca [1024 x i8], align 16
  %lp = alloca i8*, align 8
  %ci = alloca i8, align 1
  %lc = alloca i8, align 1
  %rc = alloca i8, align 1
  %wpos = alloca i32, align 4
  %2 = bitcast %struct.mdef_t** %m.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.mdef_t* %m to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %6 = bitcast i8** %line.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = bitcast i8* %line to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @setRealTemp(i64 %7, i64 %9)
  store i8* %line, i8** %line.addr, align 8
  %10 = bitcast i32* %p.addr to i8*
  store i32 %p, i32* %p.addr, align 4
  %11 = bitcast i32* %wpos to i8*
  store i32 0, i32* %wpos, align 4
  %12 = bitcast i8** %line.addr to i8*
  %13 = call i64 @getAddr(i8* %12)
  %14 = load i8*, i8** %line.addr, align 8
  %15 = bitcast i8** %lp to i8*
  %16 = call i64 @getAddr(i8* %15)
  %17 = bitcast i8* %14 to i8*
  %18 = call i64 @getAddr(i8* %17)
  call void @setRealTemp(i64 %16, i64 %18)
  store i8* %14, i8** %lp, align 8
  %19 = bitcast i8** %lp to i8*
  %20 = call i64 @getAddr(i8* %19)
  %21 = load i8*, i8** %lp, align 8
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %21, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay, i32* %wlen) #7
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %22 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %23 = call i64 @getAddr(i8* %22)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 469, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %24 = bitcast i8** %line.addr to i8*
  %25 = call i64 @getAddr(i8* %24)
  %26 = load i8*, i8** %line.addr, align 8
  %27 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %28 = call i64 @getAddr(i8* %27)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.64, i32 0, i32 0), i8* %26)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %29 = bitcast i32* %wlen to i8*
  %30 = call i64 @getAddr(i8* %29)
  %31 = load i32, i32* %wlen, align 4
  %32 = bitcast i8** %lp to i8*
  %33 = call i64 @getAddr(i8* %32)
  %34 = load i8*, i8** %lp, align 8
  %idx.ext = sext i32 %31 to i64
  %add.ptr = getelementptr inbounds i8, i8* %34, i64 %idx.ext
  %35 = bitcast i8** %lp to i8*
  %36 = call i64 @getAddr(i8* %35)
  %37 = bitcast i8* %add.ptr to i8*
  %38 = call i64 @getAddr(i8* %37)
  call void @setRealTemp(i64 %36, i64 %38)
  store i8* %add.ptr, i8** %lp, align 8
  %39 = bitcast %struct.mdef_t** %m.addr to i8*
  %40 = call i64 @getAddr(i8* %39)
  %41 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %arraydecay1 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %42 = bitcast i8 (%struct.mdef_t*, i8*)* @mdef_ciphone_id to i8*
  %43 = call i64 @getAddr(i8* %42)
  %call2 = call signext i8 @mdef_ciphone_id(%struct.mdef_t* %41, i8* %arraydecay1)
  %44 = bitcast i8* %ci to i8*
  store i8 %call2, i8* %ci, align 1
  %45 = bitcast i8* %ci to i8*
  %46 = call i64 @getAddr(i8* %45)
  %47 = load i8, i8* %ci, align 1
  %conv = sext i8 %47 to i32
  %cmp3 = icmp slt i32 %conv, 0
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  %48 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %49 = call i64 @getAddr(i8* %48)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 474, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %50 = bitcast i8** %line.addr to i8*
  %51 = call i64 @getAddr(i8* %50)
  %52 = load i8*, i8** %line.addr, align 8
  %53 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %54 = call i64 @getAddr(i8* %53)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.85, i32 0, i32 0), i8* %52)
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  %55 = bitcast i8** %lp to i8*
  %56 = call i64 @getAddr(i8* %55)
  %57 = load i8*, i8** %lp, align 8
  %arraydecay7 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call8 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %57, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay7, i32* %wlen) #7
  %cmp9 = icmp ne i32 %call8, 1
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end6
  %58 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %59 = call i64 @getAddr(i8* %58)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 478, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %60 = bitcast i8** %line.addr to i8*
  %61 = call i64 @getAddr(i8* %60)
  %62 = load i8*, i8** %line.addr, align 8
  %63 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %64 = call i64 @getAddr(i8* %63)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.86, i32 0, i32 0), i8* %62)
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end6
  %65 = bitcast i32* %wlen to i8*
  %66 = call i64 @getAddr(i8* %65)
  %67 = load i32, i32* %wlen, align 4
  %68 = bitcast i8** %lp to i8*
  %69 = call i64 @getAddr(i8* %68)
  %70 = load i8*, i8** %lp, align 8
  %idx.ext13 = sext i32 %67 to i64
  %add.ptr14 = getelementptr inbounds i8, i8* %70, i64 %idx.ext13
  %71 = bitcast i8** %lp to i8*
  %72 = call i64 @getAddr(i8* %71)
  %73 = bitcast i8* %add.ptr14 to i8*
  %74 = call i64 @getAddr(i8* %73)
  call void @setRealTemp(i64 %72, i64 %74)
  store i8* %add.ptr14, i8** %lp, align 8
  %75 = bitcast %struct.mdef_t** %m.addr to i8*
  %76 = call i64 @getAddr(i8* %75)
  %77 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %arraydecay15 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %78 = bitcast i8 (%struct.mdef_t*, i8*)* @mdef_ciphone_id to i8*
  %79 = call i64 @getAddr(i8* %78)
  %call16 = call signext i8 @mdef_ciphone_id(%struct.mdef_t* %77, i8* %arraydecay15)
  %80 = bitcast i8* %lc to i8*
  store i8 %call16, i8* %lc, align 1
  %81 = bitcast i8* %lc to i8*
  %82 = call i64 @getAddr(i8* %81)
  %83 = load i8, i8* %lc, align 1
  %conv17 = sext i8 %83 to i32
  %cmp18 = icmp slt i32 %conv17, 0
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end12
  %84 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %85 = call i64 @getAddr(i8* %84)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 482, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %86 = bitcast i8** %line.addr to i8*
  %87 = call i64 @getAddr(i8* %86)
  %88 = load i8*, i8** %line.addr, align 8
  %89 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %90 = call i64 @getAddr(i8* %89)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.87, i32 0, i32 0), i8* %88)
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %if.end12
  %91 = bitcast i8** %lp to i8*
  %92 = call i64 @getAddr(i8* %91)
  %93 = load i8*, i8** %lp, align 8
  %arraydecay22 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call23 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %93, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay22, i32* %wlen) #7
  %cmp24 = icmp ne i32 %call23, 1
  br i1 %cmp24, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end21
  %94 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %95 = call i64 @getAddr(i8* %94)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 486, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %96 = bitcast i8** %line.addr to i8*
  %97 = call i64 @getAddr(i8* %96)
  %98 = load i8*, i8** %line.addr, align 8
  %99 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %100 = call i64 @getAddr(i8* %99)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.88, i32 0, i32 0), i8* %98)
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %if.end21
  %101 = bitcast i32* %wlen to i8*
  %102 = call i64 @getAddr(i8* %101)
  %103 = load i32, i32* %wlen, align 4
  %104 = bitcast i8** %lp to i8*
  %105 = call i64 @getAddr(i8* %104)
  %106 = load i8*, i8** %lp, align 8
  %idx.ext28 = sext i32 %103 to i64
  %add.ptr29 = getelementptr inbounds i8, i8* %106, i64 %idx.ext28
  %107 = bitcast i8** %lp to i8*
  %108 = call i64 @getAddr(i8* %107)
  %109 = bitcast i8* %add.ptr29 to i8*
  %110 = call i64 @getAddr(i8* %109)
  call void @setRealTemp(i64 %108, i64 %110)
  store i8* %add.ptr29, i8** %lp, align 8
  %111 = bitcast %struct.mdef_t** %m.addr to i8*
  %112 = call i64 @getAddr(i8* %111)
  %113 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %arraydecay30 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %114 = bitcast i8 (%struct.mdef_t*, i8*)* @mdef_ciphone_id to i8*
  %115 = call i64 @getAddr(i8* %114)
  %call31 = call signext i8 @mdef_ciphone_id(%struct.mdef_t* %113, i8* %arraydecay30)
  %116 = bitcast i8* %rc to i8*
  store i8 %call31, i8* %rc, align 1
  %117 = bitcast i8* %rc to i8*
  %118 = call i64 @getAddr(i8* %117)
  %119 = load i8, i8* %rc, align 1
  %conv32 = sext i8 %119 to i32
  %cmp33 = icmp slt i32 %conv32, 0
  br i1 %cmp33, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end27
  %120 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %121 = call i64 @getAddr(i8* %120)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 490, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %122 = bitcast i8** %line.addr to i8*
  %123 = call i64 @getAddr(i8* %122)
  %124 = load i8*, i8** %line.addr, align 8
  %125 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %126 = call i64 @getAddr(i8* %125)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.89, i32 0, i32 0), i8* %124)
  br label %if.end36

if.end36:                                         ; preds = %if.then35, %if.end27
  %127 = bitcast i8** %lp to i8*
  %128 = call i64 @getAddr(i8* %127)
  %129 = load i8*, i8** %lp, align 8
  %arraydecay37 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call38 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %129, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay37, i32* %wlen) #7
  %cmp39 = icmp ne i32 %call38, 1
  br i1 %cmp39, label %if.then44, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end36
  %arrayidx = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i64 0, i64 1
  %130 = bitcast i8* %arrayidx to i8*
  %131 = call i64 @getAddr(i8* %130)
  %132 = load i8, i8* %arrayidx, align 1
  %conv41 = sext i8 %132 to i32
  %cmp42 = icmp ne i32 %conv41, 0
  br i1 %cmp42, label %if.then44, label %if.end45

if.then44:                                        ; preds = %lor.lhs.false, %if.end36
  %133 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %134 = call i64 @getAddr(i8* %133)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 494, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %135 = bitcast i8** %line.addr to i8*
  %136 = call i64 @getAddr(i8* %135)
  %137 = load i8*, i8** %line.addr, align 8
  %138 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %139 = call i64 @getAddr(i8* %138)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.90, i32 0, i32 0), i8* %137)
  br label %if.end45

if.end45:                                         ; preds = %if.then44, %lor.lhs.false
  %140 = bitcast i32* %wlen to i8*
  %141 = call i64 @getAddr(i8* %140)
  %142 = load i32, i32* %wlen, align 4
  %143 = bitcast i8** %lp to i8*
  %144 = call i64 @getAddr(i8* %143)
  %145 = load i8*, i8** %lp, align 8
  %idx.ext46 = sext i32 %142 to i64
  %add.ptr47 = getelementptr inbounds i8, i8* %145, i64 %idx.ext46
  %146 = bitcast i8** %lp to i8*
  %147 = call i64 @getAddr(i8* %146)
  %148 = bitcast i8* %add.ptr47 to i8*
  %149 = call i64 @getAddr(i8* %148)
  call void @setRealTemp(i64 %147, i64 %149)
  store i8* %add.ptr47, i8** %lp, align 8
  %arrayidx48 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i64 0, i64 0
  %150 = bitcast i8* %arrayidx48 to i8*
  %151 = call i64 @getAddr(i8* %150)
  %152 = load i8, i8* %arrayidx48, align 16
  %conv49 = sext i8 %152 to i32
  switch i32 %conv49, label %sw.default [
    i32 98, label %sw.bb
    i32 101, label %sw.bb50
    i32 115, label %sw.bb51
    i32 105, label %sw.bb52
  ]

sw.bb:                                            ; preds = %if.end45
  %153 = bitcast i32* %wpos to i8*
  store i32 0, i32* %wpos, align 4
  br label %sw.epilog

sw.bb50:                                          ; preds = %if.end45
  %154 = bitcast i32* %wpos to i8*
  store i32 1, i32* %wpos, align 4
  br label %sw.epilog

sw.bb51:                                          ; preds = %if.end45
  %155 = bitcast i32* %wpos to i8*
  store i32 2, i32* %wpos, align 4
  br label %sw.epilog

sw.bb52:                                          ; preds = %if.end45
  %156 = bitcast i32* %wpos to i8*
  store i32 3, i32* %wpos, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %if.end45
  %157 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %158 = call i64 @getAddr(i8* %157)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 501, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %159 = bitcast i8** %line.addr to i8*
  %160 = call i64 @getAddr(i8* %159)
  %161 = load i8*, i8** %line.addr, align 8
  %162 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %163 = call i64 @getAddr(i8* %162)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.91, i32 0, i32 0), i8* %161)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb52, %sw.bb51, %sw.bb50, %sw.bb
  %164 = bitcast i8** %lp to i8*
  %165 = call i64 @getAddr(i8* %164)
  %166 = load i8*, i8** %lp, align 8
  %arraydecay53 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call54 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %166, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay53, i32* %wlen) #7
  %cmp55 = icmp ne i32 %call54, 1
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %sw.epilog
  %167 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %168 = call i64 @getAddr(i8* %167)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 506, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %169 = bitcast i8** %line.addr to i8*
  %170 = call i64 @getAddr(i8* %169)
  %171 = load i8*, i8** %line.addr, align 8
  %172 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %173 = call i64 @getAddr(i8* %172)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.92, i32 0, i32 0), i8* %171)
  br label %if.end58

if.end58:                                         ; preds = %if.then57, %sw.epilog
  %174 = bitcast i32* %wlen to i8*
  %175 = call i64 @getAddr(i8* %174)
  %176 = load i32, i32* %wlen, align 4
  %177 = bitcast i8** %lp to i8*
  %178 = call i64 @getAddr(i8* %177)
  %179 = load i8*, i8** %lp, align 8
  %idx.ext59 = sext i32 %176 to i64
  %add.ptr60 = getelementptr inbounds i8, i8* %179, i64 %idx.ext59
  %180 = bitcast i8** %lp to i8*
  %181 = call i64 @getAddr(i8* %180)
  %182 = bitcast i8* %add.ptr60 to i8*
  %183 = call i64 @getAddr(i8* %182)
  call void @setRealTemp(i64 %181, i64 %183)
  store i8* %add.ptr60, i8** %lp, align 8
  %arraydecay61 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call62 = call i32 @strcmp(i8* %arraydecay61, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.69, i32 0, i32 0)) #8
  %cmp63 = icmp eq i32 %call62, 0
  br i1 %cmp63, label %land.lhs.true, label %lor.lhs.false67

land.lhs.true:                                    ; preds = %if.end58
  %184 = bitcast %struct.mdef_t** %m.addr to i8*
  %185 = call i64 @getAddr(i8* %184)
  %186 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %186, i32 0, i32 7
  %187 = bitcast %struct.ciphone_t** %ciphone to i8*
  %188 = call i64 @getAddr(i8* %187)
  %189 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone, align 8
  %190 = bitcast i8* %ci to i8*
  %191 = call i64 @getAddr(i8* %190)
  %192 = load i8, i8* %ci, align 1
  %conv65 = sext i8 %192 to i32
  %idxprom = sext i32 %conv65 to i64
  %arrayidx66 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %189, i64 %idxprom
  %filler = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx66, i32 0, i32 1
  %193 = bitcast i32* %filler to i8*
  %194 = call i64 @getAddr(i8* %193)
  %195 = load i32, i32* %filler, align 8
  %tobool = icmp ne i32 %195, 0
  br i1 %tobool, label %if.then79, label %lor.lhs.false67

lor.lhs.false67:                                  ; preds = %land.lhs.true, %if.end58
  %arraydecay68 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call69 = call i32 @strcmp(i8* %arraydecay68, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.70, i32 0, i32 0)) #8
  %cmp70 = icmp eq i32 %call69, 0
  br i1 %cmp70, label %land.lhs.true72, label %if.else

land.lhs.true72:                                  ; preds = %lor.lhs.false67
  %196 = bitcast %struct.mdef_t** %m.addr to i8*
  %197 = call i64 @getAddr(i8* %196)
  %198 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone73 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %198, i32 0, i32 7
  %199 = bitcast %struct.ciphone_t** %ciphone73 to i8*
  %200 = call i64 @getAddr(i8* %199)
  %201 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone73, align 8
  %202 = bitcast i8* %ci to i8*
  %203 = call i64 @getAddr(i8* %202)
  %204 = load i8, i8* %ci, align 1
  %conv74 = sext i8 %204 to i32
  %idxprom75 = sext i32 %conv74 to i64
  %arrayidx76 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %201, i64 %idxprom75
  %filler77 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx76, i32 0, i32 1
  %205 = bitcast i32* %filler77 to i8*
  %206 = call i64 @getAddr(i8* %205)
  %207 = load i32, i32* %filler77, align 8
  %tobool78 = icmp ne i32 %207, 0
  br i1 %tobool78, label %if.else, label %if.then79

if.then79:                                        ; preds = %land.lhs.true72, %land.lhs.true
  br label %if.end80

if.else:                                          ; preds = %land.lhs.true72, %lor.lhs.false67
  %208 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %209 = call i64 @getAddr(i8* %208)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 512, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %210 = bitcast i8** %line.addr to i8*
  %211 = call i64 @getAddr(i8* %210)
  %212 = load i8*, i8** %line.addr, align 8
  %213 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %214 = call i64 @getAddr(i8* %213)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.71, i32 0, i32 0), i8* %212)
  br label %if.end80

if.end80:                                         ; preds = %if.else, %if.then79
  %215 = bitcast %struct.mdef_t** %m.addr to i8*
  %216 = call i64 @getAddr(i8* %215)
  %217 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %218 = bitcast i8* %ci to i8*
  %219 = call i64 @getAddr(i8* %218)
  %220 = load i8, i8* %ci, align 1
  %221 = bitcast i8* %lc to i8*
  %222 = call i64 @getAddr(i8* %221)
  %223 = load i8, i8* %lc, align 1
  %224 = bitcast i8* %rc to i8*
  %225 = call i64 @getAddr(i8* %224)
  %226 = load i8, i8* %rc, align 1
  %227 = bitcast i32* %wpos to i8*
  %228 = call i64 @getAddr(i8* %227)
  %229 = load i32, i32* %wpos, align 4
  %230 = bitcast i32* %p.addr to i8*
  %231 = call i64 @getAddr(i8* %230)
  %232 = load i32, i32* %p.addr, align 4
  %233 = bitcast void (%struct.mdef_t*, i8, i8, i8, i32, i32)* @triphone_add to i8*
  %234 = call i64 @getAddr(i8* %233)
  call void @addFunArg(i32 1, i64 %234, i64 %219)
  call void @addFunArg(i32 2, i64 %234, i64 %222)
  call void @addFunArg(i32 3, i64 %234, i64 %225)
  call void @addFunArg(i32 4, i64 %234, i64 %228)
  call void @addFunArg(i32 5, i64 %234, i64 %231)
  call void @triphone_add(%struct.mdef_t* %217, i8 signext %220, i8 signext %223, i8 signext %226, i32 %229, i32 %232)
  %235 = bitcast %struct.mdef_t** %m.addr to i8*
  %236 = call i64 @getAddr(i8* %235)
  %237 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %238 = bitcast i8** %line.addr to i8*
  %239 = call i64 @getAddr(i8* %238)
  %240 = load i8*, i8** %line.addr, align 8
  %241 = bitcast i8** %lp to i8*
  %242 = call i64 @getAddr(i8* %241)
  %243 = load i8*, i8** %lp, align 8
  %244 = bitcast i8** %line.addr to i8*
  %245 = call i64 @getAddr(i8* %244)
  %246 = load i8*, i8** %line.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %243 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %246 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv81 = trunc i64 %sub.ptr.sub to i32
  %247 = bitcast i32* %p.addr to i8*
  %248 = call i64 @getAddr(i8* %247)
  %249 = load i32, i32* %p.addr, align 4
  %250 = bitcast void (%struct.mdef_t*, i8*, i32, i32)* @parse_tmat_senmap to i8*
  %251 = call i64 @getAddr(i8* %250)
  call void @addFunArg(i32 3, i64 %251, i64 %248)
  call void @parse_tmat_senmap(%struct.mdef_t* %237, i8* %240, i32 %conv81, i32 %249)
  %252 = bitcast void (%struct.mdef_t*, i8*, i32)* @parse_tri_line to i8*
  %253 = call i64 @getAddr(i8* %252)
  call void @funcExit(i64 %253)
  ret void
}

declare dso_local void @_E__pr_warn(i8*, ...) #1

declare dso_local void @ckd_free(i8*) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @sseq_compress(%struct.mdef_t* %m) #0 {
entry:
  %0 = bitcast void (%struct.mdef_t*)* @sseq_compress to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %m.addr = alloca %struct.mdef_t*, align 8
  %h = alloca %struct.hash_table_t*, align 8
  %sseq = alloca i16**, align 8
  %n_sseq = alloca i32, align 4
  %p = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %g = alloca %struct.gnode_s*, align 8
  %gn = alloca %struct.gnode_s*, align 8
  %he = alloca %struct.hash_entry_s*, align 8
  %2 = bitcast %struct.mdef_t** %m.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.mdef_t* %m to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %6 = bitcast %struct.mdef_t** %m.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_emit_state = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %8, i32 0, i32 2
  %9 = bitcast i32* %n_emit_state to i8*
  %10 = call i64 @getAddr(i8* %9)
  %11 = load i32, i32* %n_emit_state, align 8
  %conv = sext i32 %11 to i64
  %mul = mul i64 %conv, 2
  %conv1 = trunc i64 %mul to i32
  %12 = bitcast i32* %k to i8*
  store i32 %conv1, i32* %k, align 4
  %13 = bitcast %struct.mdef_t** %m.addr to i8*
  %14 = call i64 @getAddr(i8* %13)
  %15 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %15, i32 0, i32 1
  %16 = bitcast i32* %n_phone to i8*
  %17 = call i64 @getAddr(i8* %16)
  %18 = load i32, i32* %n_phone, align 4
  %19 = bitcast %struct.hash_table_t* (i32, i32)* @hash_new to i8*
  %20 = call i64 @getAddr(i8* %19)
  call void @addFunArg(i32 0, i64 %20, i64 %17)
  %call = call %struct.hash_table_t* @hash_new(i32 %18, i32 0)
  %21 = bitcast %struct.hash_table_t** %h to i8*
  %22 = call i64 @getAddr(i8* %21)
  %23 = bitcast %struct.hash_table_t* %call to i8*
  %24 = call i64 @getAddr(i8* %23)
  call void @setRealTemp(i64 %22, i64 %24)
  store %struct.hash_table_t* %call, %struct.hash_table_t** %h, align 8
  %25 = bitcast i32* %n_sseq to i8*
  store i32 0, i32* %n_sseq, align 4
  %26 = bitcast i32* %p to i8*
  store i32 0, i32* %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %27 = bitcast i32* %p to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load i32, i32* %p, align 4
  %30 = bitcast %struct.mdef_t** %m.addr to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone2 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %32, i32 0, i32 1
  %33 = bitcast i32* %n_phone2 to i8*
  %34 = call i64 @getAddr(i8* %33)
  %35 = load i32, i32* %n_phone2, align 4
  %cmp = icmp slt i32 %29, %35
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %36 = bitcast %struct.hash_table_t** %h to i8*
  %37 = call i64 @getAddr(i8* %36)
  %38 = load %struct.hash_table_t*, %struct.hash_table_t** %h, align 8
  %39 = bitcast %struct.mdef_t** %m.addr to i8*
  %40 = call i64 @getAddr(i8* %39)
  %41 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sseq4 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %41, i32 0, i32 9
  %42 = bitcast i16*** %sseq4 to i8*
  %43 = call i64 @getAddr(i8* %42)
  %44 = load i16**, i16*** %sseq4, align 8
  %45 = bitcast i32* %p to i8*
  %46 = call i64 @getAddr(i8* %45)
  %47 = load i32, i32* %p, align 4
  %idxprom = sext i32 %47 to i64
  %arrayidx = getelementptr inbounds i16*, i16** %44, i64 %idxprom
  %48 = bitcast i16** %arrayidx to i8*
  %49 = call i64 @getAddr(i8* %48)
  %50 = load i16*, i16** %arrayidx, align 8
  %51 = bitcast i16* %50 to i8*
  %52 = bitcast i32* %k to i8*
  %53 = call i64 @getAddr(i8* %52)
  %54 = load i32, i32* %k, align 4
  %55 = bitcast i32* %n_sseq to i8*
  %56 = call i64 @getAddr(i8* %55)
  %57 = load i32, i32* %n_sseq, align 4
  %58 = bitcast i32 (%struct.hash_table_t*, i8*, i32, i32)* @hash_enter_bkey to i8*
  %59 = call i64 @getAddr(i8* %58)
  call void @addFunArg(i32 2, i64 %59, i64 %53)
  call void @addFunArg(i32 3, i64 %59, i64 %56)
  %call5 = call i32 @hash_enter_bkey(%struct.hash_table_t* %38, i8* %51, i32 %54, i32 %57)
  %60 = bitcast i32* %j to i8*
  store i32 %call5, i32* %j, align 4
  %61 = bitcast i32* %n_sseq to i8*
  %62 = call i64 @getAddr(i8* %61)
  %63 = load i32, i32* %n_sseq, align 4
  %cmp6 = icmp eq i32 %call5, %63
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %64 = bitcast i32* %n_sseq to i8*
  %65 = call i64 @getAddr(i8* %64)
  %66 = load i32, i32* %n_sseq, align 4
  %inc = add nsw i32 %66, 1
  %67 = bitcast i32* %n_sseq to i8*
  store i32 %inc, i32* %n_sseq, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %68 = bitcast i32* %j to i8*
  %69 = call i64 @getAddr(i8* %68)
  %70 = load i32, i32* %j, align 4
  %71 = bitcast %struct.mdef_t** %m.addr to i8*
  %72 = call i64 @getAddr(i8* %71)
  %73 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %73, i32 0, i32 8
  %74 = bitcast %struct.phone_t** %phone to i8*
  %75 = call i64 @getAddr(i8* %74)
  %76 = load %struct.phone_t*, %struct.phone_t** %phone, align 8
  %77 = bitcast i32* %p to i8*
  %78 = call i64 @getAddr(i8* %77)
  %79 = load i32, i32* %p, align 4
  %idxprom8 = sext i32 %79 to i64
  %arrayidx9 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %76, i64 %idxprom8
  %ssid = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx9, i32 0, i32 0
  %80 = bitcast i32* %ssid to i8*
  store i32 %70, i32* %ssid, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %81 = bitcast i32* %p to i8*
  %82 = call i64 @getAddr(i8* %81)
  %83 = load i32, i32* %p, align 4
  %inc10 = add nsw i32 %83, 1
  %84 = bitcast i32* %p to i8*
  store i32 %inc10, i32* %p, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %85 = bitcast i32* %n_sseq to i8*
  %86 = call i64 @getAddr(i8* %85)
  %87 = load i32, i32* %n_sseq, align 4
  %88 = bitcast %struct.mdef_t** %m.addr to i8*
  %89 = call i64 @getAddr(i8* %88)
  %90 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_emit_state11 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %90, i32 0, i32 2
  %91 = bitcast i32* %n_emit_state11 to i8*
  %92 = call i64 @getAddr(i8* %91)
  %93 = load i32, i32* %n_emit_state11, align 8
  %94 = bitcast i8** (i32, i32, i32, i8*, i32)* @__ckd_calloc_2d__ to i8*
  %95 = call i64 @getAddr(i8* %94)
  call void @addFunArg(i32 0, i64 %95, i64 %86)
  call void @addFunArg(i32 1, i64 %95, i64 %92)
  %call12 = call i8** @__ckd_calloc_2d__(i32 %87, i32 %93, i32 2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 546)
  %96 = bitcast i8** %call12 to i16**
  %97 = bitcast i16*** %sseq to i8*
  %98 = call i64 @getAddr(i8* %97)
  %99 = bitcast i16** %96 to i8*
  %100 = call i64 @getAddr(i8* %99)
  call void @setRealTemp(i64 %98, i64 %100)
  store i16** %96, i16*** %sseq, align 8
  %101 = bitcast %struct.hash_table_t** %h to i8*
  %102 = call i64 @getAddr(i8* %101)
  %103 = load %struct.hash_table_t*, %struct.hash_table_t** %h, align 8
  %104 = bitcast %struct.gnode_s* (%struct.hash_table_t*, i32*)* @hash_tolist to i8*
  %105 = call i64 @getAddr(i8* %104)
  %call13 = call %struct.gnode_s* @hash_tolist(%struct.hash_table_t* %103, i32* %j)
  %106 = bitcast %struct.gnode_s** %g to i8*
  %107 = call i64 @getAddr(i8* %106)
  %108 = bitcast %struct.gnode_s* %call13 to i8*
  %109 = call i64 @getAddr(i8* %108)
  call void @setRealTemp(i64 %107, i64 %109)
  store %struct.gnode_s* %call13, %struct.gnode_s** %g, align 8
  %110 = bitcast i32* %j to i8*
  %111 = call i64 @getAddr(i8* %110)
  %112 = load i32, i32* %j, align 4
  %113 = bitcast i32* %n_sseq to i8*
  %114 = call i64 @getAddr(i8* %113)
  %115 = load i32, i32* %n_sseq, align 4
  %cmp14 = icmp eq i32 %112, %115
  br i1 %cmp14, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  br label %cond.end

cond.false:                                       ; preds = %for.end
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.93, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 549, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.sseq_compress, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %116, %cond.true
  %117 = bitcast %struct.gnode_s** %g to i8*
  %118 = call i64 @getAddr(i8* %117)
  %119 = load %struct.gnode_s*, %struct.gnode_s** %g, align 8
  %120 = bitcast %struct.gnode_s** %gn to i8*
  %121 = call i64 @getAddr(i8* %120)
  %122 = bitcast %struct.gnode_s* %119 to i8*
  %123 = call i64 @getAddr(i8* %122)
  call void @setRealTemp(i64 %121, i64 %123)
  store %struct.gnode_s* %119, %struct.gnode_s** %gn, align 8
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc21, %cond.end
  %124 = bitcast %struct.gnode_s** %gn to i8*
  %125 = call i64 @getAddr(i8* %124)
  %126 = load %struct.gnode_s*, %struct.gnode_s** %gn, align 8
  %tobool = icmp ne %struct.gnode_s* %126, null
  br i1 %tobool, label %for.body17, label %for.end22

for.body17:                                       ; preds = %for.cond16
  %127 = bitcast %struct.gnode_s** %gn to i8*
  %128 = call i64 @getAddr(i8* %127)
  %129 = load %struct.gnode_s*, %struct.gnode_s** %gn, align 8
  %data = getelementptr inbounds %struct.gnode_s, %struct.gnode_s* %129, i32 0, i32 0
  %ptr = bitcast %union.anytype_s* %data to i8**
  %130 = bitcast i8** %ptr to i8*
  %131 = call i64 @getAddr(i8* %130)
  %132 = load i8*, i8** %ptr, align 8
  %133 = bitcast i8* %132 to %struct.hash_entry_s*
  %134 = bitcast %struct.hash_entry_s** %he to i8*
  %135 = call i64 @getAddr(i8* %134)
  %136 = bitcast %struct.hash_entry_s* %133 to i8*
  %137 = call i64 @getAddr(i8* %136)
  call void @setRealTemp(i64 %135, i64 %137)
  store %struct.hash_entry_s* %133, %struct.hash_entry_s** %he, align 8
  %138 = bitcast %struct.hash_entry_s** %he to i8*
  %139 = call i64 @getAddr(i8* %138)
  %140 = load %struct.hash_entry_s*, %struct.hash_entry_s** %he, align 8
  %val = getelementptr inbounds %struct.hash_entry_s, %struct.hash_entry_s* %140, i32 0, i32 2
  %141 = bitcast i32* %val to i8*
  %142 = call i64 @getAddr(i8* %141)
  %143 = load i32, i32* %val, align 4
  %144 = bitcast i32* %j to i8*
  store i32 %143, i32* %j, align 4
  %145 = bitcast i16*** %sseq to i8*
  %146 = call i64 @getAddr(i8* %145)
  %147 = load i16**, i16*** %sseq, align 8
  %148 = bitcast i32* %j to i8*
  %149 = call i64 @getAddr(i8* %148)
  %150 = load i32, i32* %j, align 4
  %idxprom18 = sext i32 %150 to i64
  %arrayidx19 = getelementptr inbounds i16*, i16** %147, i64 %idxprom18
  %151 = bitcast i16** %arrayidx19 to i8*
  %152 = call i64 @getAddr(i8* %151)
  %153 = load i16*, i16** %arrayidx19, align 8
  %154 = bitcast i16* %153 to i8*
  %155 = bitcast %struct.hash_entry_s** %he to i8*
  %156 = call i64 @getAddr(i8* %155)
  %157 = load %struct.hash_entry_s*, %struct.hash_entry_s** %he, align 8
  %key = getelementptr inbounds %struct.hash_entry_s, %struct.hash_entry_s* %157, i32 0, i32 0
  %158 = bitcast i8** %key to i8*
  %159 = call i64 @getAddr(i8* %158)
  %160 = load i8*, i8** %key, align 8
  %161 = bitcast i32* %k to i8*
  %162 = call i64 @getAddr(i8* %161)
  %163 = load i32, i32* %k, align 4
  %conv20 = sext i32 %163 to i64
  %164 = bitcast i8* %154 to i8*
  %165 = bitcast i8* %160 to i8*
  %166 = bitcast i64 %conv20 to i64
  %167 = call i64 @getAddr(i8* %164)
  %168 = call i64 @getAddr(i8* %165)
  call void @handleLLVMMemcpy(i64 %167, i64 %168, i64 %166)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %154, i8* align 1 %160, i64 %conv20, i1 false)
  br label %for.inc21

for.inc21:                                        ; preds = %for.body17
  %169 = bitcast %struct.gnode_s** %gn to i8*
  %170 = call i64 @getAddr(i8* %169)
  %171 = load %struct.gnode_s*, %struct.gnode_s** %gn, align 8
  %next = getelementptr inbounds %struct.gnode_s, %struct.gnode_s* %171, i32 0, i32 1
  %172 = bitcast %struct.gnode_s** %next to i8*
  %173 = call i64 @getAddr(i8* %172)
  %174 = load %struct.gnode_s*, %struct.gnode_s** %next, align 8
  %175 = bitcast %struct.gnode_s** %gn to i8*
  %176 = call i64 @getAddr(i8* %175)
  %177 = bitcast %struct.gnode_s* %174 to i8*
  %178 = call i64 @getAddr(i8* %177)
  call void @setRealTemp(i64 %176, i64 %178)
  store %struct.gnode_s* %174, %struct.gnode_s** %gn, align 8
  br label %for.cond16

for.end22:                                        ; preds = %for.cond16
  %179 = bitcast %struct.gnode_s** %g to i8*
  %180 = call i64 @getAddr(i8* %179)
  %181 = load %struct.gnode_s*, %struct.gnode_s** %g, align 8
  %182 = bitcast void (%struct.gnode_s*)* @glist_free to i8*
  %183 = call i64 @getAddr(i8* %182)
  call void @glist_free(%struct.gnode_s* %181)
  %184 = bitcast %struct.mdef_t** %m.addr to i8*
  %185 = call i64 @getAddr(i8* %184)
  %186 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sseq23 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %186, i32 0, i32 9
  %187 = bitcast i16*** %sseq23 to i8*
  %188 = call i64 @getAddr(i8* %187)
  %189 = load i16**, i16*** %sseq23, align 8
  %190 = bitcast i16** %189 to i8**
  %191 = bitcast void (i8**)* @ckd_free_2d to i8*
  %192 = call i64 @getAddr(i8* %191)
  call void @ckd_free_2d(i8** %190)
  %193 = bitcast i16*** %sseq to i8*
  %194 = call i64 @getAddr(i8* %193)
  %195 = load i16**, i16*** %sseq, align 8
  %196 = bitcast %struct.mdef_t** %m.addr to i8*
  %197 = call i64 @getAddr(i8* %196)
  %198 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sseq24 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %198, i32 0, i32 9
  %199 = bitcast i16*** %sseq24 to i8*
  %200 = call i64 @getAddr(i8* %199)
  %201 = bitcast i16** %195 to i8*
  %202 = call i64 @getAddr(i8* %201)
  call void @setRealTemp(i64 %200, i64 %202)
  store i16** %195, i16*** %sseq24, align 8
  %203 = bitcast i32* %n_sseq to i8*
  %204 = call i64 @getAddr(i8* %203)
  %205 = load i32, i32* %n_sseq, align 4
  %206 = bitcast %struct.mdef_t** %m.addr to i8*
  %207 = call i64 @getAddr(i8* %206)
  %208 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_sseq25 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %208, i32 0, i32 10
  %209 = bitcast i32* %n_sseq25 to i8*
  store i32 %205, i32* %n_sseq25, align 8
  %210 = bitcast %struct.hash_table_t** %h to i8*
  %211 = call i64 @getAddr(i8* %210)
  %212 = load %struct.hash_table_t*, %struct.hash_table_t** %h, align 8
  %213 = bitcast void (%struct.hash_table_t*)* @hash_free to i8*
  %214 = call i64 @getAddr(i8* %213)
  call void @hash_free(%struct.hash_table_t* %212)
  %215 = bitcast void (%struct.mdef_t*)* @sseq_compress to i8*
  %216 = call i64 @getAddr(i8* %215)
  call void @funcExit(i64 %216)
  ret void
}

declare dso_local i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @mdef_sseq2sen_active(%struct.mdef_t* %mdef, i32* %sseq, i32* %sen) #0 {
entry:
  %0 = bitcast void (%struct.mdef_t*, i32*, i32*)* @mdef_sseq2sen_active to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %mdef.addr = alloca %struct.mdef_t*, align 8
  %sseq.addr = alloca i32*, align 8
  %sen.addr = alloca i32*, align 8
  %ss = alloca i32, align 4
  %i = alloca i32, align 4
  %sp = alloca i16*, align 8
  %2 = bitcast %struct.mdef_t** %mdef.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.mdef_t* %mdef to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.mdef_t* %mdef, %struct.mdef_t** %mdef.addr, align 8
  %6 = bitcast i32** %sseq.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = bitcast i32* %sseq to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @setRealTemp(i64 %7, i64 %9)
  store i32* %sseq, i32** %sseq.addr, align 8
  %10 = bitcast i32** %sen.addr to i8*
  %11 = call i64 @getAddr(i8* %10)
  %12 = bitcast i32* %sen to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @setRealTemp(i64 %11, i64 %13)
  store i32* %sen, i32** %sen.addr, align 8
  %14 = bitcast i32* %ss to i8*
  store i32 0, i32* %ss, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc11, %entry
  %15 = bitcast i32* %ss to i8*
  %16 = call i64 @getAddr(i8* %15)
  %17 = load i32, i32* %ss, align 4
  %18 = bitcast %struct.mdef_t** %mdef.addr to i8*
  %19 = call i64 @getAddr(i8* %18)
  %20 = load %struct.mdef_t*, %struct.mdef_t** %mdef.addr, align 8
  %n_sseq = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %20, i32 0, i32 10
  %21 = bitcast i32* %n_sseq to i8*
  %22 = call i64 @getAddr(i8* %21)
  %23 = load i32, i32* %n_sseq, align 8
  %cmp = icmp slt i32 %17, %23
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  %24 = bitcast i32** %sseq.addr to i8*
  %25 = call i64 @getAddr(i8* %24)
  %26 = load i32*, i32** %sseq.addr, align 8
  %27 = bitcast i32* %ss to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load i32, i32* %ss, align 4
  %idxprom = sext i32 %29 to i64
  %arrayidx = getelementptr inbounds i32, i32* %26, i64 %idxprom
  %30 = bitcast i32* %arrayidx to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = load i32, i32* %arrayidx, align 4
  %tobool = icmp ne i32 %32, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %33 = bitcast %struct.mdef_t** %mdef.addr to i8*
  %34 = call i64 @getAddr(i8* %33)
  %35 = load %struct.mdef_t*, %struct.mdef_t** %mdef.addr, align 8
  %sseq1 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %35, i32 0, i32 9
  %36 = bitcast i16*** %sseq1 to i8*
  %37 = call i64 @getAddr(i8* %36)
  %38 = load i16**, i16*** %sseq1, align 8
  %39 = bitcast i32* %ss to i8*
  %40 = call i64 @getAddr(i8* %39)
  %41 = load i32, i32* %ss, align 4
  %idxprom2 = sext i32 %41 to i64
  %arrayidx3 = getelementptr inbounds i16*, i16** %38, i64 %idxprom2
  %42 = bitcast i16** %arrayidx3 to i8*
  %43 = call i64 @getAddr(i8* %42)
  %44 = load i16*, i16** %arrayidx3, align 8
  %45 = bitcast i16** %sp to i8*
  %46 = call i64 @getAddr(i8* %45)
  %47 = bitcast i16* %44 to i8*
  %48 = call i64 @getAddr(i8* %47)
  call void @setRealTemp(i64 %46, i64 %48)
  store i16* %44, i16** %sp, align 8
  %49 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %if.then
  %50 = bitcast i32* %i to i8*
  %51 = call i64 @getAddr(i8* %50)
  %52 = load i32, i32* %i, align 4
  %53 = bitcast %struct.mdef_t** %mdef.addr to i8*
  %54 = call i64 @getAddr(i8* %53)
  %55 = load %struct.mdef_t*, %struct.mdef_t** %mdef.addr, align 8
  %n_emit_state = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %55, i32 0, i32 2
  %56 = bitcast i32* %n_emit_state to i8*
  %57 = call i64 @getAddr(i8* %56)
  %58 = load i32, i32* %n_emit_state, align 8
  %cmp5 = icmp slt i32 %52, %58
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %59 = bitcast i32** %sen.addr to i8*
  %60 = call i64 @getAddr(i8* %59)
  %61 = load i32*, i32** %sen.addr, align 8
  %62 = bitcast i16** %sp to i8*
  %63 = call i64 @getAddr(i8* %62)
  %64 = load i16*, i16** %sp, align 8
  %65 = bitcast i32* %i to i8*
  %66 = call i64 @getAddr(i8* %65)
  %67 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %67 to i64
  %arrayidx8 = getelementptr inbounds i16, i16* %64, i64 %idxprom7
  %68 = bitcast i16* %arrayidx8 to i8*
  %69 = call i64 @getAddr(i8* %68)
  %70 = load i16, i16* %arrayidx8, align 2
  %idxprom9 = sext i16 %70 to i64
  %arrayidx10 = getelementptr inbounds i32, i32* %61, i64 %idxprom9
  %71 = bitcast i32* %arrayidx10 to i8*
  store i32 1, i32* %arrayidx10, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %72 = bitcast i32* %i to i8*
  %73 = call i64 @getAddr(i8* %72)
  %74 = load i32, i32* %i, align 4
  %inc = add nsw i32 %74, 1
  %75 = bitcast i32* %i to i8*
  store i32 %inc, i32* %i, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %if.end

if.end:                                           ; preds = %for.end, %for.body
  br label %for.inc11

for.inc11:                                        ; preds = %if.end
  %76 = bitcast i32* %ss to i8*
  %77 = call i64 @getAddr(i8* %76)
  %78 = load i32, i32* %ss, align 4
  %inc12 = add nsw i32 %78, 1
  %79 = bitcast i32* %ss to i8*
  store i32 %inc12, i32* %ss, align 4
  br label %for.cond

for.end13:                                        ; preds = %for.cond
  %80 = bitcast void (%struct.mdef_t*, i32*, i32*)* @mdef_sseq2sen_active to i8*
  %81 = call i64 @getAddr(i8* %80)
  call void @funcExit(i64 %81)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @mdef_free_recursive_lc(%struct.ph_lc_s* %lc) #0 {
entry:
  %0 = bitcast void (%struct.ph_lc_s*)* @mdef_free_recursive_lc to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %lc.addr = alloca %struct.ph_lc_s*, align 8
  %2 = bitcast %struct.ph_lc_s** %lc.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.ph_lc_s* %lc to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.ph_lc_s* %lc, %struct.ph_lc_s** %lc.addr, align 8
  %6 = bitcast %struct.ph_lc_s** %lc.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lc.addr, align 8
  %cmp = icmp eq %struct.ph_lc_s* %8, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %9 = bitcast %struct.ph_lc_s** %lc.addr to i8*
  %10 = call i64 @getAddr(i8* %9)
  %11 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lc.addr, align 8
  %rclist = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %11, i32 0, i32 1
  %12 = bitcast %struct.ph_rc_s** %rclist to i8*
  %13 = call i64 @getAddr(i8* %12)
  %14 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rclist, align 8
  %tobool = icmp ne %struct.ph_rc_s* %14, null
  br i1 %tobool, label %if.then1, label %if.end3

if.then1:                                         ; preds = %if.end
  %15 = bitcast %struct.ph_lc_s** %lc.addr to i8*
  %16 = call i64 @getAddr(i8* %15)
  %17 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lc.addr, align 8
  %rclist2 = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %17, i32 0, i32 1
  %18 = bitcast %struct.ph_rc_s** %rclist2 to i8*
  %19 = call i64 @getAddr(i8* %18)
  %20 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rclist2, align 8
  %21 = bitcast void (%struct.ph_rc_s*)* @mdef_free_recursive_rc to i8*
  %22 = call i64 @getAddr(i8* %21)
  call void @mdef_free_recursive_rc(%struct.ph_rc_s* %20)
  br label %if.end3

if.end3:                                          ; preds = %if.then1, %if.end
  %23 = bitcast %struct.ph_lc_s** %lc.addr to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lc.addr, align 8
  %next = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %25, i32 0, i32 2
  %26 = bitcast %struct.ph_lc_s** %next to i8*
  %27 = call i64 @getAddr(i8* %26)
  %28 = load %struct.ph_lc_s*, %struct.ph_lc_s** %next, align 8
  %tobool4 = icmp ne %struct.ph_lc_s* %28, null
  br i1 %tobool4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end3
  %29 = bitcast %struct.ph_lc_s** %lc.addr to i8*
  %30 = call i64 @getAddr(i8* %29)
  %31 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lc.addr, align 8
  %next6 = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %31, i32 0, i32 2
  %32 = bitcast %struct.ph_lc_s** %next6 to i8*
  %33 = call i64 @getAddr(i8* %32)
  %34 = load %struct.ph_lc_s*, %struct.ph_lc_s** %next6, align 8
  %35 = bitcast void (%struct.ph_lc_s*)* @mdef_free_recursive_lc to i8*
  %36 = call i64 @getAddr(i8* %35)
  call void @mdef_free_recursive_lc(%struct.ph_lc_s* %34)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end3
  %37 = bitcast %struct.ph_lc_s** %lc.addr to i8*
  %38 = call i64 @getAddr(i8* %37)
  %39 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lc.addr, align 8
  %40 = bitcast %struct.ph_lc_s* %39 to i8*
  %41 = bitcast void (i8*)* @ckd_free to i8*
  %42 = call i64 @getAddr(i8* %41)
  call void @ckd_free(i8* %40)
  br label %return

return:                                           ; preds = %if.end7, %if.then
  %43 = bitcast void (%struct.ph_lc_s*)* @mdef_free_recursive_lc to i8*
  %44 = call i64 @getAddr(i8* %43)
  call void @funcExit(i64 %44)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @mdef_free_recursive_rc(%struct.ph_rc_s* %rc) #0 {
entry:
  %0 = bitcast void (%struct.ph_rc_s*)* @mdef_free_recursive_rc to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %rc.addr = alloca %struct.ph_rc_s*, align 8
  %2 = bitcast %struct.ph_rc_s** %rc.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.ph_rc_s* %rc to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.ph_rc_s* %rc, %struct.ph_rc_s** %rc.addr, align 8
  %6 = bitcast %struct.ph_rc_s** %rc.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rc.addr, align 8
  %cmp = icmp eq %struct.ph_rc_s* %8, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %9 = bitcast %struct.ph_rc_s** %rc.addr to i8*
  %10 = call i64 @getAddr(i8* %9)
  %11 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rc.addr, align 8
  %next = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %11, i32 0, i32 2
  %12 = bitcast %struct.ph_rc_s** %next to i8*
  %13 = call i64 @getAddr(i8* %12)
  %14 = load %struct.ph_rc_s*, %struct.ph_rc_s** %next, align 8
  %tobool = icmp ne %struct.ph_rc_s* %14, null
  br i1 %tobool, label %if.then1, label %if.end3

if.then1:                                         ; preds = %if.end
  %15 = bitcast %struct.ph_rc_s** %rc.addr to i8*
  %16 = call i64 @getAddr(i8* %15)
  %17 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rc.addr, align 8
  %next2 = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %17, i32 0, i32 2
  %18 = bitcast %struct.ph_rc_s** %next2 to i8*
  %19 = call i64 @getAddr(i8* %18)
  %20 = load %struct.ph_rc_s*, %struct.ph_rc_s** %next2, align 8
  %21 = bitcast void (%struct.ph_rc_s*)* @mdef_free_recursive_rc to i8*
  %22 = call i64 @getAddr(i8* %21)
  call void @mdef_free_recursive_rc(%struct.ph_rc_s* %20)
  br label %if.end3

if.end3:                                          ; preds = %if.then1, %if.end
  %23 = bitcast %struct.ph_rc_s** %rc.addr to i8*
  %24 = call i64 @getAddr(i8* %23)
  %25 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rc.addr, align 8
  %26 = bitcast %struct.ph_rc_s* %25 to i8*
  %27 = bitcast void (i8*)* @ckd_free to i8*
  %28 = call i64 @getAddr(i8* %27)
  call void @ckd_free(i8* %26)
  br label %return

return:                                           ; preds = %if.end3, %if.then
  %29 = bitcast void (%struct.ph_rc_s*)* @mdef_free_recursive_rc to i8*
  %30 = call i64 @getAddr(i8* %29)
  call void @funcExit(i64 %30)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @mdef_free(%struct.mdef_t* %m) #0 {
entry:
  %0 = bitcast void (%struct.mdef_t*)* @mdef_free to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %m.addr = alloca %struct.mdef_t*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %2 = bitcast %struct.mdef_t** %m.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.mdef_t* %m to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %6 = bitcast %struct.mdef_t** %m.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %tobool = icmp ne %struct.mdef_t* %8, null
  br i1 %tobool, label %if.then, label %if.end97

if.then:                                          ; preds = %entry
  %9 = bitcast %struct.mdef_t** %m.addr to i8*
  %10 = call i64 @getAddr(i8* %9)
  %11 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone2n_cd_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %11, i32 0, i32 13
  %12 = bitcast i32** %ciphone2n_cd_sen to i8*
  %13 = call i64 @getAddr(i8* %12)
  %14 = load i32*, i32** %ciphone2n_cd_sen, align 8
  %tobool1 = icmp ne i32* %14, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %15 = bitcast %struct.mdef_t** %m.addr to i8*
  %16 = call i64 @getAddr(i8* %15)
  %17 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone2n_cd_sen3 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %17, i32 0, i32 13
  %18 = bitcast i32** %ciphone2n_cd_sen3 to i8*
  %19 = call i64 @getAddr(i8* %18)
  %20 = load i32*, i32** %ciphone2n_cd_sen3, align 8
  %21 = bitcast i32* %20 to i8*
  %22 = bitcast void (i8*)* @ckd_free to i8*
  %23 = call i64 @getAddr(i8* %22)
  call void @ckd_free(i8* %21)
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %24 = bitcast %struct.mdef_t** %m.addr to i8*
  %25 = call i64 @getAddr(i8* %24)
  %26 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sen2cimap = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %26, i32 0, i32 12
  %27 = bitcast i8** %sen2cimap to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load i8*, i8** %sen2cimap, align 8
  %tobool4 = icmp ne i8* %29, null
  br i1 %tobool4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %30 = bitcast %struct.mdef_t** %m.addr to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sen2cimap6 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %32, i32 0, i32 12
  %33 = bitcast i8** %sen2cimap6 to i8*
  %34 = call i64 @getAddr(i8* %33)
  %35 = load i8*, i8** %sen2cimap6, align 8
  %36 = bitcast void (i8*)* @ckd_free to i8*
  %37 = call i64 @getAddr(i8* %36)
  call void @ckd_free(i8* %35)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  %38 = bitcast %struct.mdef_t** %m.addr to i8*
  %39 = call i64 @getAddr(i8* %38)
  %40 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %cd2cisen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %40, i32 0, i32 11
  %41 = bitcast i16** %cd2cisen to i8*
  %42 = call i64 @getAddr(i8* %41)
  %43 = load i16*, i16** %cd2cisen, align 8
  %tobool8 = icmp ne i16* %43, null
  br i1 %tobool8, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end7
  %44 = bitcast %struct.mdef_t** %m.addr to i8*
  %45 = call i64 @getAddr(i8* %44)
  %46 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %cd2cisen10 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %46, i32 0, i32 11
  %47 = bitcast i16** %cd2cisen10 to i8*
  %48 = call i64 @getAddr(i8* %47)
  %49 = load i16*, i16** %cd2cisen10, align 8
  %50 = bitcast i16* %49 to i8*
  %51 = bitcast void (i8*)* @ckd_free to i8*
  %52 = call i64 @getAddr(i8* %51)
  call void @ckd_free(i8* %50)
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.end7
  %53 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc30, %if.end11
  %54 = bitcast i32* %i to i8*
  %55 = call i64 @getAddr(i8* %54)
  %56 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %56, 4
  br i1 %cmp, label %for.body, label %for.end32

for.body:                                         ; preds = %for.cond
  %57 = bitcast i32* %j to i8*
  store i32 0, i32* %j, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc, %for.body
  %58 = bitcast i32* %j to i8*
  %59 = call i64 @getAddr(i8* %58)
  %60 = load i32, i32* %j, align 4
  %61 = bitcast %struct.mdef_t** %m.addr to i8*
  %62 = call i64 @getAddr(i8* %61)
  %63 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %63, i32 0, i32 0
  %64 = bitcast i32* %n_ciphone to i8*
  %65 = call i64 @getAddr(i8* %64)
  %66 = load i32, i32* %n_ciphone, align 8
  %cmp13 = icmp slt i32 %60, %66
  br i1 %cmp13, label %for.body14, label %for.end

for.body14:                                       ; preds = %for.cond12
  %67 = bitcast %struct.mdef_t** %m.addr to i8*
  %68 = call i64 @getAddr(i8* %67)
  %69 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %69, i32 0, i32 15
  %70 = bitcast %struct.ph_lc_s**** %wpos_ci_lclist to i8*
  %71 = call i64 @getAddr(i8* %70)
  %72 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist, align 8
  %73 = bitcast i32* %i to i8*
  %74 = call i64 @getAddr(i8* %73)
  %75 = load i32, i32* %i, align 4
  %idxprom = sext i32 %75 to i64
  %arrayidx = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %72, i64 %idxprom
  %76 = bitcast %struct.ph_lc_s*** %arrayidx to i8*
  %77 = call i64 @getAddr(i8* %76)
  %78 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx, align 8
  %79 = bitcast i32* %j to i8*
  %80 = call i64 @getAddr(i8* %79)
  %81 = load i32, i32* %j, align 4
  %idxprom15 = sext i32 %81 to i64
  %arrayidx16 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %78, i64 %idxprom15
  %82 = bitcast %struct.ph_lc_s** %arrayidx16 to i8*
  %83 = call i64 @getAddr(i8* %82)
  %84 = load %struct.ph_lc_s*, %struct.ph_lc_s** %arrayidx16, align 8
  %tobool17 = icmp ne %struct.ph_lc_s* %84, null
  br i1 %tobool17, label %if.then18, label %if.end29

if.then18:                                        ; preds = %for.body14
  %85 = bitcast %struct.mdef_t** %m.addr to i8*
  %86 = call i64 @getAddr(i8* %85)
  %87 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist19 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %87, i32 0, i32 15
  %88 = bitcast %struct.ph_lc_s**** %wpos_ci_lclist19 to i8*
  %89 = call i64 @getAddr(i8* %88)
  %90 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist19, align 8
  %91 = bitcast i32* %i to i8*
  %92 = call i64 @getAddr(i8* %91)
  %93 = load i32, i32* %i, align 4
  %idxprom20 = sext i32 %93 to i64
  %arrayidx21 = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %90, i64 %idxprom20
  %94 = bitcast %struct.ph_lc_s*** %arrayidx21 to i8*
  %95 = call i64 @getAddr(i8* %94)
  %96 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx21, align 8
  %97 = bitcast i32* %j to i8*
  %98 = call i64 @getAddr(i8* %97)
  %99 = load i32, i32* %j, align 4
  %idxprom22 = sext i32 %99 to i64
  %arrayidx23 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %96, i64 %idxprom22
  %100 = bitcast %struct.ph_lc_s** %arrayidx23 to i8*
  %101 = call i64 @getAddr(i8* %100)
  %102 = load %struct.ph_lc_s*, %struct.ph_lc_s** %arrayidx23, align 8
  %next = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %102, i32 0, i32 2
  %103 = bitcast %struct.ph_lc_s** %next to i8*
  %104 = call i64 @getAddr(i8* %103)
  %105 = load %struct.ph_lc_s*, %struct.ph_lc_s** %next, align 8
  %106 = bitcast void (%struct.ph_lc_s*)* @mdef_free_recursive_lc to i8*
  %107 = call i64 @getAddr(i8* %106)
  call void @mdef_free_recursive_lc(%struct.ph_lc_s* %105)
  %108 = bitcast %struct.mdef_t** %m.addr to i8*
  %109 = call i64 @getAddr(i8* %108)
  %110 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist24 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %110, i32 0, i32 15
  %111 = bitcast %struct.ph_lc_s**** %wpos_ci_lclist24 to i8*
  %112 = call i64 @getAddr(i8* %111)
  %113 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist24, align 8
  %114 = bitcast i32* %i to i8*
  %115 = call i64 @getAddr(i8* %114)
  %116 = load i32, i32* %i, align 4
  %idxprom25 = sext i32 %116 to i64
  %arrayidx26 = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %113, i64 %idxprom25
  %117 = bitcast %struct.ph_lc_s*** %arrayidx26 to i8*
  %118 = call i64 @getAddr(i8* %117)
  %119 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx26, align 8
  %120 = bitcast i32* %j to i8*
  %121 = call i64 @getAddr(i8* %120)
  %122 = load i32, i32* %j, align 4
  %idxprom27 = sext i32 %122 to i64
  %arrayidx28 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %119, i64 %idxprom27
  %123 = bitcast %struct.ph_lc_s** %arrayidx28 to i8*
  %124 = call i64 @getAddr(i8* %123)
  %125 = load %struct.ph_lc_s*, %struct.ph_lc_s** %arrayidx28, align 8
  %rclist = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %125, i32 0, i32 1
  %126 = bitcast %struct.ph_rc_s** %rclist to i8*
  %127 = call i64 @getAddr(i8* %126)
  %128 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rclist, align 8
  %129 = bitcast void (%struct.ph_rc_s*)* @mdef_free_recursive_rc to i8*
  %130 = call i64 @getAddr(i8* %129)
  call void @mdef_free_recursive_rc(%struct.ph_rc_s* %128)
  br label %if.end29

if.end29:                                         ; preds = %if.then18, %for.body14
  br label %for.inc

for.inc:                                          ; preds = %if.end29
  %131 = bitcast i32* %j to i8*
  %132 = call i64 @getAddr(i8* %131)
  %133 = load i32, i32* %j, align 4
  %inc = add nsw i32 %133, 1
  %134 = bitcast i32* %j to i8*
  store i32 %inc, i32* %j, align 4
  br label %for.cond12

for.end:                                          ; preds = %for.cond12
  br label %for.inc30

for.inc30:                                        ; preds = %for.end
  %135 = bitcast i32* %i to i8*
  %136 = call i64 @getAddr(i8* %135)
  %137 = load i32, i32* %i, align 4
  %inc31 = add nsw i32 %137, 1
  %138 = bitcast i32* %i to i8*
  store i32 %inc31, i32* %i, align 4
  br label %for.cond

for.end32:                                        ; preds = %for.cond
  %139 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc56, %for.end32
  %140 = bitcast i32* %i to i8*
  %141 = call i64 @getAddr(i8* %140)
  %142 = load i32, i32* %i, align 4
  %cmp34 = icmp slt i32 %142, 4
  br i1 %cmp34, label %for.body35, label %for.end58

for.body35:                                       ; preds = %for.cond33
  %143 = bitcast i32* %j to i8*
  store i32 0, i32* %j, align 4
  br label %for.cond36

for.cond36:                                       ; preds = %for.inc53, %for.body35
  %144 = bitcast i32* %j to i8*
  %145 = call i64 @getAddr(i8* %144)
  %146 = load i32, i32* %j, align 4
  %147 = bitcast %struct.mdef_t** %m.addr to i8*
  %148 = call i64 @getAddr(i8* %147)
  %149 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone37 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %149, i32 0, i32 0
  %150 = bitcast i32* %n_ciphone37 to i8*
  %151 = call i64 @getAddr(i8* %150)
  %152 = load i32, i32* %n_ciphone37, align 8
  %cmp38 = icmp slt i32 %146, %152
  br i1 %cmp38, label %for.body39, label %for.end55

for.body39:                                       ; preds = %for.cond36
  %153 = bitcast %struct.mdef_t** %m.addr to i8*
  %154 = call i64 @getAddr(i8* %153)
  %155 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist40 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %155, i32 0, i32 15
  %156 = bitcast %struct.ph_lc_s**** %wpos_ci_lclist40 to i8*
  %157 = call i64 @getAddr(i8* %156)
  %158 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist40, align 8
  %159 = bitcast i32* %i to i8*
  %160 = call i64 @getAddr(i8* %159)
  %161 = load i32, i32* %i, align 4
  %idxprom41 = sext i32 %161 to i64
  %arrayidx42 = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %158, i64 %idxprom41
  %162 = bitcast %struct.ph_lc_s*** %arrayidx42 to i8*
  %163 = call i64 @getAddr(i8* %162)
  %164 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx42, align 8
  %165 = bitcast i32* %j to i8*
  %166 = call i64 @getAddr(i8* %165)
  %167 = load i32, i32* %j, align 4
  %idxprom43 = sext i32 %167 to i64
  %arrayidx44 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %164, i64 %idxprom43
  %168 = bitcast %struct.ph_lc_s** %arrayidx44 to i8*
  %169 = call i64 @getAddr(i8* %168)
  %170 = load %struct.ph_lc_s*, %struct.ph_lc_s** %arrayidx44, align 8
  %tobool45 = icmp ne %struct.ph_lc_s* %170, null
  br i1 %tobool45, label %if.then46, label %if.end52

if.then46:                                        ; preds = %for.body39
  %171 = bitcast %struct.mdef_t** %m.addr to i8*
  %172 = call i64 @getAddr(i8* %171)
  %173 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist47 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %173, i32 0, i32 15
  %174 = bitcast %struct.ph_lc_s**** %wpos_ci_lclist47 to i8*
  %175 = call i64 @getAddr(i8* %174)
  %176 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist47, align 8
  %177 = bitcast i32* %i to i8*
  %178 = call i64 @getAddr(i8* %177)
  %179 = load i32, i32* %i, align 4
  %idxprom48 = sext i32 %179 to i64
  %arrayidx49 = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %176, i64 %idxprom48
  %180 = bitcast %struct.ph_lc_s*** %arrayidx49 to i8*
  %181 = call i64 @getAddr(i8* %180)
  %182 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx49, align 8
  %183 = bitcast i32* %j to i8*
  %184 = call i64 @getAddr(i8* %183)
  %185 = load i32, i32* %j, align 4
  %idxprom50 = sext i32 %185 to i64
  %arrayidx51 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %182, i64 %idxprom50
  %186 = bitcast %struct.ph_lc_s** %arrayidx51 to i8*
  %187 = call i64 @getAddr(i8* %186)
  %188 = load %struct.ph_lc_s*, %struct.ph_lc_s** %arrayidx51, align 8
  %189 = bitcast %struct.ph_lc_s* %188 to i8*
  %190 = bitcast void (i8*)* @ckd_free to i8*
  %191 = call i64 @getAddr(i8* %190)
  call void @ckd_free(i8* %189)
  br label %if.end52

if.end52:                                         ; preds = %if.then46, %for.body39
  br label %for.inc53

for.inc53:                                        ; preds = %if.end52
  %192 = bitcast i32* %j to i8*
  %193 = call i64 @getAddr(i8* %192)
  %194 = load i32, i32* %j, align 4
  %inc54 = add nsw i32 %194, 1
  %195 = bitcast i32* %j to i8*
  store i32 %inc54, i32* %j, align 4
  br label %for.cond36

for.end55:                                        ; preds = %for.cond36
  br label %for.inc56

for.inc56:                                        ; preds = %for.end55
  %196 = bitcast i32* %i to i8*
  %197 = call i64 @getAddr(i8* %196)
  %198 = load i32, i32* %i, align 4
  %inc57 = add nsw i32 %198, 1
  %199 = bitcast i32* %i to i8*
  store i32 %inc57, i32* %i, align 4
  br label %for.cond33

for.end58:                                        ; preds = %for.cond33
  %200 = bitcast %struct.mdef_t** %m.addr to i8*
  %201 = call i64 @getAddr(i8* %200)
  %202 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist59 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %202, i32 0, i32 15
  %203 = bitcast %struct.ph_lc_s**** %wpos_ci_lclist59 to i8*
  %204 = call i64 @getAddr(i8* %203)
  %205 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist59, align 8
  %tobool60 = icmp ne %struct.ph_lc_s*** %205, null
  br i1 %tobool60, label %if.then61, label %if.end63

if.then61:                                        ; preds = %for.end58
  %206 = bitcast %struct.mdef_t** %m.addr to i8*
  %207 = call i64 @getAddr(i8* %206)
  %208 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist62 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %208, i32 0, i32 15
  %209 = bitcast %struct.ph_lc_s**** %wpos_ci_lclist62 to i8*
  %210 = call i64 @getAddr(i8* %209)
  %211 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist62, align 8
  %212 = bitcast %struct.ph_lc_s*** %211 to i8*
  %213 = bitcast i8* %212 to i8**
  %214 = bitcast void (i8**)* @ckd_free_2d to i8*
  %215 = call i64 @getAddr(i8* %214)
  call void @ckd_free_2d(i8** %213)
  br label %if.end63

if.end63:                                         ; preds = %if.then61, %for.end58
  %216 = bitcast %struct.mdef_t** %m.addr to i8*
  %217 = call i64 @getAddr(i8* %216)
  %218 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sseq = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %218, i32 0, i32 9
  %219 = bitcast i16*** %sseq to i8*
  %220 = call i64 @getAddr(i8* %219)
  %221 = load i16**, i16*** %sseq, align 8
  %tobool64 = icmp ne i16** %221, null
  br i1 %tobool64, label %if.then65, label %if.end67

if.then65:                                        ; preds = %if.end63
  %222 = bitcast %struct.mdef_t** %m.addr to i8*
  %223 = call i64 @getAddr(i8* %222)
  %224 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sseq66 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %224, i32 0, i32 9
  %225 = bitcast i16*** %sseq66 to i8*
  %226 = call i64 @getAddr(i8* %225)
  %227 = load i16**, i16*** %sseq66, align 8
  %228 = bitcast i16** %227 to i8*
  %229 = bitcast i8* %228 to i8**
  %230 = bitcast void (i8**)* @ckd_free_2d to i8*
  %231 = call i64 @getAddr(i8* %230)
  call void @ckd_free_2d(i8** %229)
  br label %if.end67

if.end67:                                         ; preds = %if.then65, %if.end63
  %232 = bitcast %struct.mdef_t** %m.addr to i8*
  %233 = call i64 @getAddr(i8* %232)
  %234 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %234, i32 0, i32 8
  %235 = bitcast %struct.phone_t** %phone to i8*
  %236 = call i64 @getAddr(i8* %235)
  %237 = load %struct.phone_t*, %struct.phone_t** %phone, align 8
  %tobool68 = icmp ne %struct.phone_t* %237, null
  br i1 %tobool68, label %if.then69, label %if.end71

if.then69:                                        ; preds = %if.end67
  %238 = bitcast %struct.mdef_t** %m.addr to i8*
  %239 = call i64 @getAddr(i8* %238)
  %240 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone70 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %240, i32 0, i32 8
  %241 = bitcast %struct.phone_t** %phone70 to i8*
  %242 = call i64 @getAddr(i8* %241)
  %243 = load %struct.phone_t*, %struct.phone_t** %phone70, align 8
  %244 = bitcast %struct.phone_t* %243 to i8*
  %245 = bitcast void (i8*)* @ckd_free to i8*
  %246 = call i64 @getAddr(i8* %245)
  call void @ckd_free(i8* %244)
  br label %if.end71

if.end71:                                         ; preds = %if.then69, %if.end67
  %247 = bitcast %struct.mdef_t** %m.addr to i8*
  %248 = call i64 @getAddr(i8* %247)
  %249 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone_ht = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %249, i32 0, i32 6
  %250 = bitcast %struct.hash_table_t** %ciphone_ht to i8*
  %251 = call i64 @getAddr(i8* %250)
  %252 = load %struct.hash_table_t*, %struct.hash_table_t** %ciphone_ht, align 8
  %tobool72 = icmp ne %struct.hash_table_t* %252, null
  br i1 %tobool72, label %if.then73, label %if.end75

if.then73:                                        ; preds = %if.end71
  %253 = bitcast %struct.mdef_t** %m.addr to i8*
  %254 = call i64 @getAddr(i8* %253)
  %255 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone_ht74 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %255, i32 0, i32 6
  %256 = bitcast %struct.hash_table_t** %ciphone_ht74 to i8*
  %257 = call i64 @getAddr(i8* %256)
  %258 = load %struct.hash_table_t*, %struct.hash_table_t** %ciphone_ht74, align 8
  %259 = bitcast void (%struct.hash_table_t*)* @hash_free to i8*
  %260 = call i64 @getAddr(i8* %259)
  call void @hash_free(%struct.hash_table_t* %258)
  br label %if.end75

if.end75:                                         ; preds = %if.then73, %if.end71
  %261 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond76

for.cond76:                                       ; preds = %for.inc89, %if.end75
  %262 = bitcast i32* %i to i8*
  %263 = call i64 @getAddr(i8* %262)
  %264 = load i32, i32* %i, align 4
  %265 = bitcast %struct.mdef_t** %m.addr to i8*
  %266 = call i64 @getAddr(i8* %265)
  %267 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone77 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %267, i32 0, i32 0
  %268 = bitcast i32* %n_ciphone77 to i8*
  %269 = call i64 @getAddr(i8* %268)
  %270 = load i32, i32* %n_ciphone77, align 8
  %cmp78 = icmp slt i32 %264, %270
  br i1 %cmp78, label %for.body79, label %for.end91

for.body79:                                       ; preds = %for.cond76
  %271 = bitcast %struct.mdef_t** %m.addr to i8*
  %272 = call i64 @getAddr(i8* %271)
  %273 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %273, i32 0, i32 7
  %274 = bitcast %struct.ciphone_t** %ciphone to i8*
  %275 = call i64 @getAddr(i8* %274)
  %276 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone, align 8
  %277 = bitcast i32* %i to i8*
  %278 = call i64 @getAddr(i8* %277)
  %279 = load i32, i32* %i, align 4
  %idxprom80 = sext i32 %279 to i64
  %arrayidx81 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %276, i64 %idxprom80
  %name = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx81, i32 0, i32 0
  %280 = bitcast i8** %name to i8*
  %281 = call i64 @getAddr(i8* %280)
  %282 = load i8*, i8** %name, align 8
  %tobool82 = icmp ne i8* %282, null
  br i1 %tobool82, label %if.then83, label %if.end88

if.then83:                                        ; preds = %for.body79
  %283 = bitcast %struct.mdef_t** %m.addr to i8*
  %284 = call i64 @getAddr(i8* %283)
  %285 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone84 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %285, i32 0, i32 7
  %286 = bitcast %struct.ciphone_t** %ciphone84 to i8*
  %287 = call i64 @getAddr(i8* %286)
  %288 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone84, align 8
  %289 = bitcast i32* %i to i8*
  %290 = call i64 @getAddr(i8* %289)
  %291 = load i32, i32* %i, align 4
  %idxprom85 = sext i32 %291 to i64
  %arrayidx86 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %288, i64 %idxprom85
  %name87 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx86, i32 0, i32 0
  %292 = bitcast i8** %name87 to i8*
  %293 = call i64 @getAddr(i8* %292)
  %294 = load i8*, i8** %name87, align 8
  %295 = bitcast void (i8*)* @ckd_free to i8*
  %296 = call i64 @getAddr(i8* %295)
  call void @ckd_free(i8* %294)
  br label %if.end88

if.end88:                                         ; preds = %if.then83, %for.body79
  br label %for.inc89

for.inc89:                                        ; preds = %if.end88
  %297 = bitcast i32* %i to i8*
  %298 = call i64 @getAddr(i8* %297)
  %299 = load i32, i32* %i, align 4
  %inc90 = add nsw i32 %299, 1
  %300 = bitcast i32* %i to i8*
  store i32 %inc90, i32* %i, align 4
  br label %for.cond76

for.end91:                                        ; preds = %for.cond76
  %301 = bitcast %struct.mdef_t** %m.addr to i8*
  %302 = call i64 @getAddr(i8* %301)
  %303 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone92 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %303, i32 0, i32 7
  %304 = bitcast %struct.ciphone_t** %ciphone92 to i8*
  %305 = call i64 @getAddr(i8* %304)
  %306 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone92, align 8
  %tobool93 = icmp ne %struct.ciphone_t* %306, null
  br i1 %tobool93, label %if.then94, label %if.end96

if.then94:                                        ; preds = %for.end91
  %307 = bitcast %struct.mdef_t** %m.addr to i8*
  %308 = call i64 @getAddr(i8* %307)
  %309 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone95 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %309, i32 0, i32 7
  %310 = bitcast %struct.ciphone_t** %ciphone95 to i8*
  %311 = call i64 @getAddr(i8* %310)
  %312 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone95, align 8
  %313 = bitcast %struct.ciphone_t* %312 to i8*
  %314 = bitcast void (i8*)* @ckd_free to i8*
  %315 = call i64 @getAddr(i8* %314)
  call void @ckd_free(i8* %313)
  br label %if.end96

if.end96:                                         ; preds = %if.then94, %for.end91
  %316 = bitcast %struct.mdef_t** %m.addr to i8*
  %317 = call i64 @getAddr(i8* %316)
  %318 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %319 = bitcast %struct.mdef_t* %318 to i8*
  %320 = bitcast void (i8*)* @ckd_free to i8*
  %321 = call i64 @getAddr(i8* %320)
  call void @ckd_free(i8* %319)
  br label %if.end97

if.end97:                                         ; preds = %if.end96, %entry
  %322 = bitcast void (%struct.mdef_t*)* @mdef_free to i8*
  %323 = call i64 @getAddr(i8* %322)
  call void @funcExit(i64 %323)
  ret void
}

declare dso_local void @ckd_free_2d(i8**) #1

declare dso_local void @hash_free(%struct.hash_table_t*) #1

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @ciphone_add(%struct.mdef_t* %m, i8* %ci, i32 %p) #0 {
entry:
  %0 = bitcast void (%struct.mdef_t*, i8*, i32)* @ciphone_add to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %m.addr = alloca %struct.mdef_t*, align 8
  %ci.addr = alloca i8*, align 8
  %p.addr = alloca i32, align 4
  %2 = bitcast %struct.mdef_t** %m.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.mdef_t* %m to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %6 = bitcast i8** %ci.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = bitcast i8* %ci to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @setRealTemp(i64 %7, i64 %9)
  store i8* %ci, i8** %ci.addr, align 8
  %10 = bitcast i32* %p.addr to i8*
  store i32 %p, i32* %p.addr, align 4
  %11 = bitcast i32* %p.addr to i8*
  %12 = call i64 @getAddr(i8* %11)
  %13 = load i32, i32* %p.addr, align 4
  %14 = bitcast %struct.mdef_t** %m.addr to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %16, i32 0, i32 0
  %17 = bitcast i32* %n_ciphone to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = load i32, i32* %n_ciphone, align 8
  %cmp = icmp slt i32 %13, %19
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.72, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 136, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__PRETTY_FUNCTION__.ciphone_add, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %20, %cond.true
  %21 = bitcast i8** %ci.addr to i8*
  %22 = call i64 @getAddr(i8* %21)
  %23 = load i8*, i8** %ci.addr, align 8
  %24 = bitcast i8* (i8*, i8*, i32)* @__ckd_salloc__ to i8*
  %25 = call i64 @getAddr(i8* %24)
  %call = call i8* @__ckd_salloc__(i8* %23, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 138)
  %26 = bitcast %struct.mdef_t** %m.addr to i8*
  %27 = call i64 @getAddr(i8* %26)
  %28 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %28, i32 0, i32 7
  %29 = bitcast %struct.ciphone_t** %ciphone to i8*
  %30 = call i64 @getAddr(i8* %29)
  %31 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone, align 8
  %32 = bitcast i32* %p.addr to i8*
  %33 = call i64 @getAddr(i8* %32)
  %34 = load i32, i32* %p.addr, align 4
  %idxprom = sext i32 %34 to i64
  %arrayidx = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %31, i64 %idxprom
  %name = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx, i32 0, i32 0
  %35 = bitcast i8** %name to i8*
  %36 = call i64 @getAddr(i8* %35)
  %37 = bitcast i8* %call to i8*
  %38 = call i64 @getAddr(i8* %37)
  call void @setRealTemp(i64 %36, i64 %38)
  store i8* %call, i8** %name, align 8
  %39 = bitcast %struct.mdef_t** %m.addr to i8*
  %40 = call i64 @getAddr(i8* %39)
  %41 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone_ht = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %41, i32 0, i32 6
  %42 = bitcast %struct.hash_table_t** %ciphone_ht to i8*
  %43 = call i64 @getAddr(i8* %42)
  %44 = load %struct.hash_table_t*, %struct.hash_table_t** %ciphone_ht, align 8
  %45 = bitcast %struct.mdef_t** %m.addr to i8*
  %46 = call i64 @getAddr(i8* %45)
  %47 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone1 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %47, i32 0, i32 7
  %48 = bitcast %struct.ciphone_t** %ciphone1 to i8*
  %49 = call i64 @getAddr(i8* %48)
  %50 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone1, align 8
  %51 = bitcast i32* %p.addr to i8*
  %52 = call i64 @getAddr(i8* %51)
  %53 = load i32, i32* %p.addr, align 4
  %idxprom2 = sext i32 %53 to i64
  %arrayidx3 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %50, i64 %idxprom2
  %name4 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx3, i32 0, i32 0
  %54 = bitcast i8** %name4 to i8*
  %55 = call i64 @getAddr(i8* %54)
  %56 = load i8*, i8** %name4, align 8
  %57 = bitcast i32* %p.addr to i8*
  %58 = call i64 @getAddr(i8* %57)
  %59 = load i32, i32* %p.addr, align 4
  %60 = bitcast i32 (%struct.hash_table_t*, i8*, i32)* @hash_enter to i8*
  %61 = call i64 @getAddr(i8* %60)
  call void @addFunArg(i32 2, i64 %61, i64 %58)
  %call5 = call i32 @hash_enter(%struct.hash_table_t* %44, i8* %56, i32 %59)
  %62 = bitcast i32* %p.addr to i8*
  %63 = call i64 @getAddr(i8* %62)
  %64 = load i32, i32* %p.addr, align 4
  %cmp6 = icmp ne i32 %call5, %64
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %65 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %66 = call i64 @getAddr(i8* %65)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 140, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %67 = bitcast %struct.mdef_t** %m.addr to i8*
  %68 = call i64 @getAddr(i8* %67)
  %69 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone7 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %69, i32 0, i32 7
  %70 = bitcast %struct.ciphone_t** %ciphone7 to i8*
  %71 = call i64 @getAddr(i8* %70)
  %72 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone7, align 8
  %73 = bitcast i32* %p.addr to i8*
  %74 = call i64 @getAddr(i8* %73)
  %75 = load i32, i32* %p.addr, align 4
  %idxprom8 = sext i32 %75 to i64
  %arrayidx9 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %72, i64 %idxprom8
  %name10 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx9, i32 0, i32 0
  %76 = bitcast i8** %name10 to i8*
  %77 = call i64 @getAddr(i8* %76)
  %78 = load i8*, i8** %name10, align 8
  %79 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %80 = call i64 @getAddr(i8* %79)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.73, i32 0, i32 0), i8* %78)
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %81 = bitcast void (%struct.mdef_t*, i8*, i32)* @ciphone_add to i8*
  %82 = call i64 @getAddr(i8* %81)
  call void @funcExit(i64 %82)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @triphone_add(%struct.mdef_t* %m, i8 signext %ci, i8 signext %lc, i8 signext %rc, i32 %wpos, i32 %p) #0 {
entry:
  %0 = bitcast void (%struct.mdef_t*, i8, i8, i8, i32, i32)* @triphone_add to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %m.addr = alloca %struct.mdef_t*, align 8
  %ci.addr = alloca i8, align 1
  %lc.addr = alloca i8, align 1
  %rc.addr = alloca i8, align 1
  %wpos.addr = alloca i32, align 4
  %p.addr = alloca i32, align 4
  %lcptr = alloca %struct.ph_lc_s*, align 8
  %rcptr = alloca %struct.ph_rc_s*, align 8
  %buf = alloca [4096 x i8], align 16
  %2 = bitcast %struct.mdef_t** %m.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.mdef_t* %m to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %6 = bitcast i8* %ci.addr to i8*
  store i8 %ci, i8* %ci.addr, align 1
  %7 = bitcast i8* %lc.addr to i8*
  store i8 %lc, i8* %lc.addr, align 1
  %8 = bitcast i8* %rc.addr to i8*
  store i8 %rc, i8* %rc.addr, align 1
  %9 = bitcast i32* %wpos.addr to i8*
  store i32 %wpos, i32* %wpos.addr, align 4
  %10 = bitcast i32* %p.addr to i8*
  store i32 %p, i32* %p.addr, align 4
  %11 = bitcast i32* %p.addr to i8*
  %12 = call i64 @getAddr(i8* %11)
  %13 = load i32, i32* %p.addr, align 4
  %14 = bitcast %struct.mdef_t** %m.addr to i8*
  %15 = call i64 @getAddr(i8* %14)
  %16 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %16, i32 0, i32 1
  %17 = bitcast i32* %n_phone to i8*
  %18 = call i64 @getAddr(i8* %17)
  %19 = load i32, i32* %n_phone, align 4
  %cmp = icmp slt i32 %13, %19
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.74, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 169, i8* getelementptr inbounds ([83 x i8], [83 x i8]* @__PRETTY_FUNCTION__.triphone_add, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %20, %cond.true
  %21 = bitcast i8* %ci.addr to i8*
  %22 = call i64 @getAddr(i8* %21)
  %23 = load i8, i8* %ci.addr, align 1
  %24 = bitcast %struct.mdef_t** %m.addr to i8*
  %25 = call i64 @getAddr(i8* %24)
  %26 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %26, i32 0, i32 8
  %27 = bitcast %struct.phone_t** %phone to i8*
  %28 = call i64 @getAddr(i8* %27)
  %29 = load %struct.phone_t*, %struct.phone_t** %phone, align 8
  %30 = bitcast i32* %p.addr to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = load i32, i32* %p.addr, align 4
  %idxprom = sext i32 %32 to i64
  %arrayidx = getelementptr inbounds %struct.phone_t, %struct.phone_t* %29, i64 %idxprom
  %ci1 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx, i32 0, i32 2
  %33 = bitcast i8* %ci1 to i8*
  store i8 %23, i8* %ci1, align 4
  %34 = bitcast i8* %lc.addr to i8*
  %35 = call i64 @getAddr(i8* %34)
  %36 = load i8, i8* %lc.addr, align 1
  %37 = bitcast %struct.mdef_t** %m.addr to i8*
  %38 = call i64 @getAddr(i8* %37)
  %39 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone2 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %39, i32 0, i32 8
  %40 = bitcast %struct.phone_t** %phone2 to i8*
  %41 = call i64 @getAddr(i8* %40)
  %42 = load %struct.phone_t*, %struct.phone_t** %phone2, align 8
  %43 = bitcast i32* %p.addr to i8*
  %44 = call i64 @getAddr(i8* %43)
  %45 = load i32, i32* %p.addr, align 4
  %idxprom3 = sext i32 %45 to i64
  %arrayidx4 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %42, i64 %idxprom3
  %lc5 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx4, i32 0, i32 3
  %46 = bitcast i8* %lc5 to i8*
  store i8 %36, i8* %lc5, align 1
  %47 = bitcast i8* %rc.addr to i8*
  %48 = call i64 @getAddr(i8* %47)
  %49 = load i8, i8* %rc.addr, align 1
  %50 = bitcast %struct.mdef_t** %m.addr to i8*
  %51 = call i64 @getAddr(i8* %50)
  %52 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone6 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %52, i32 0, i32 8
  %53 = bitcast %struct.phone_t** %phone6 to i8*
  %54 = call i64 @getAddr(i8* %53)
  %55 = load %struct.phone_t*, %struct.phone_t** %phone6, align 8
  %56 = bitcast i32* %p.addr to i8*
  %57 = call i64 @getAddr(i8* %56)
  %58 = load i32, i32* %p.addr, align 4
  %idxprom7 = sext i32 %58 to i64
  %arrayidx8 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %55, i64 %idxprom7
  %rc9 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx8, i32 0, i32 4
  %59 = bitcast i8* %rc9 to i8*
  store i8 %49, i8* %rc9, align 2
  %60 = bitcast i32* %wpos.addr to i8*
  %61 = call i64 @getAddr(i8* %60)
  %62 = load i32, i32* %wpos.addr, align 4
  %63 = bitcast %struct.mdef_t** %m.addr to i8*
  %64 = call i64 @getAddr(i8* %63)
  %65 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone10 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %65, i32 0, i32 8
  %66 = bitcast %struct.phone_t** %phone10 to i8*
  %67 = call i64 @getAddr(i8* %66)
  %68 = load %struct.phone_t*, %struct.phone_t** %phone10, align 8
  %69 = bitcast i32* %p.addr to i8*
  %70 = call i64 @getAddr(i8* %69)
  %71 = load i32, i32* %p.addr, align 4
  %idxprom11 = sext i32 %71 to i64
  %arrayidx12 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %68, i64 %idxprom11
  %wpos13 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx12, i32 0, i32 5
  %72 = bitcast i32* %wpos13 to i8*
  store i32 %62, i32* %wpos13, align 4
  %73 = bitcast i32* %p.addr to i8*
  %74 = call i64 @getAddr(i8* %73)
  %75 = load i32, i32* %p.addr, align 4
  %76 = bitcast %struct.mdef_t** %m.addr to i8*
  %77 = call i64 @getAddr(i8* %76)
  %78 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %78, i32 0, i32 0
  %79 = bitcast i32* %n_ciphone to i8*
  %80 = call i64 @getAddr(i8* %79)
  %81 = load i32, i32* %n_ciphone, align 8
  %cmp14 = icmp sge i32 %75, %81
  br i1 %cmp14, label %if.then, label %if.end49

if.then:                                          ; preds = %cond.end
  %82 = bitcast %struct.mdef_t** %m.addr to i8*
  %83 = call i64 @getAddr(i8* %82)
  %84 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %84, i32 0, i32 15
  %85 = bitcast %struct.ph_lc_s**** %wpos_ci_lclist to i8*
  %86 = call i64 @getAddr(i8* %85)
  %87 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist, align 8
  %88 = bitcast i32* %wpos.addr to i8*
  %89 = call i64 @getAddr(i8* %88)
  %90 = load i32, i32* %wpos.addr, align 4
  %idxprom15 = zext i32 %90 to i64
  %arrayidx16 = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %87, i64 %idxprom15
  %91 = bitcast %struct.ph_lc_s*** %arrayidx16 to i8*
  %92 = call i64 @getAddr(i8* %91)
  %93 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx16, align 8
  %94 = bitcast i8* %ci.addr to i8*
  %95 = call i64 @getAddr(i8* %94)
  %96 = load i8, i8* %ci.addr, align 1
  %conv = sext i8 %96 to i32
  %idxprom17 = sext i32 %conv to i64
  %arrayidx18 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %93, i64 %idxprom17
  %97 = bitcast %struct.ph_lc_s** %arrayidx18 to i8*
  %98 = call i64 @getAddr(i8* %97)
  %99 = load %struct.ph_lc_s*, %struct.ph_lc_s** %arrayidx18, align 8
  %100 = bitcast i8* %lc.addr to i8*
  %101 = call i64 @getAddr(i8* %100)
  %102 = load i8, i8* %lc.addr, align 1
  %103 = bitcast %struct.ph_lc_s* (%struct.ph_lc_s*, i8)* @find_ph_lc to i8*
  %104 = call i64 @getAddr(i8* %103)
  call void @addFunArg(i32 1, i64 %104, i64 %101)
  %call = call %struct.ph_lc_s* @find_ph_lc(%struct.ph_lc_s* %99, i8 signext %102)
  %105 = bitcast %struct.ph_lc_s** %lcptr to i8*
  %106 = call i64 @getAddr(i8* %105)
  %107 = bitcast %struct.ph_lc_s* %call to i8*
  %108 = call i64 @getAddr(i8* %107)
  call void @setRealTemp(i64 %106, i64 %108)
  store %struct.ph_lc_s* %call, %struct.ph_lc_s** %lcptr, align 8
  %cmp19 = icmp eq %struct.ph_lc_s* %call, null
  br i1 %cmp19, label %if.then21, label %if.end

if.then21:                                        ; preds = %if.then
  %109 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %110 = call i64 @getAddr(i8* %109)
  %call22 = call i8* @__ckd_calloc__(i64 1, i64 24, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 182)
  %111 = bitcast i8* %call22 to %struct.ph_lc_s*
  %112 = bitcast %struct.ph_lc_s** %lcptr to i8*
  %113 = call i64 @getAddr(i8* %112)
  %114 = bitcast %struct.ph_lc_s* %111 to i8*
  %115 = call i64 @getAddr(i8* %114)
  call void @setRealTemp(i64 %113, i64 %115)
  store %struct.ph_lc_s* %111, %struct.ph_lc_s** %lcptr, align 8
  %116 = bitcast i8* %lc.addr to i8*
  %117 = call i64 @getAddr(i8* %116)
  %118 = load i8, i8* %lc.addr, align 1
  %119 = bitcast %struct.ph_lc_s** %lcptr to i8*
  %120 = call i64 @getAddr(i8* %119)
  %121 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %lc23 = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %121, i32 0, i32 0
  %122 = bitcast i8* %lc23 to i8*
  store i8 %118, i8* %lc23, align 8
  %123 = bitcast %struct.mdef_t** %m.addr to i8*
  %124 = call i64 @getAddr(i8* %123)
  %125 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist24 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %125, i32 0, i32 15
  %126 = bitcast %struct.ph_lc_s**** %wpos_ci_lclist24 to i8*
  %127 = call i64 @getAddr(i8* %126)
  %128 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist24, align 8
  %129 = bitcast i32* %wpos.addr to i8*
  %130 = call i64 @getAddr(i8* %129)
  %131 = load i32, i32* %wpos.addr, align 4
  %idxprom25 = zext i32 %131 to i64
  %arrayidx26 = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %128, i64 %idxprom25
  %132 = bitcast %struct.ph_lc_s*** %arrayidx26 to i8*
  %133 = call i64 @getAddr(i8* %132)
  %134 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx26, align 8
  %135 = bitcast i8* %ci.addr to i8*
  %136 = call i64 @getAddr(i8* %135)
  %137 = load i8, i8* %ci.addr, align 1
  %conv27 = sext i8 %137 to i32
  %idxprom28 = sext i32 %conv27 to i64
  %arrayidx29 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %134, i64 %idxprom28
  %138 = bitcast %struct.ph_lc_s** %arrayidx29 to i8*
  %139 = call i64 @getAddr(i8* %138)
  %140 = load %struct.ph_lc_s*, %struct.ph_lc_s** %arrayidx29, align 8
  %141 = bitcast %struct.ph_lc_s** %lcptr to i8*
  %142 = call i64 @getAddr(i8* %141)
  %143 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %next = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %143, i32 0, i32 2
  %144 = bitcast %struct.ph_lc_s** %next to i8*
  %145 = call i64 @getAddr(i8* %144)
  %146 = bitcast %struct.ph_lc_s* %140 to i8*
  %147 = call i64 @getAddr(i8* %146)
  call void @setRealTemp(i64 %145, i64 %147)
  store %struct.ph_lc_s* %140, %struct.ph_lc_s** %next, align 8
  %148 = bitcast %struct.ph_lc_s** %lcptr to i8*
  %149 = call i64 @getAddr(i8* %148)
  %150 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %151 = bitcast %struct.mdef_t** %m.addr to i8*
  %152 = call i64 @getAddr(i8* %151)
  %153 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist30 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %153, i32 0, i32 15
  %154 = bitcast %struct.ph_lc_s**** %wpos_ci_lclist30 to i8*
  %155 = call i64 @getAddr(i8* %154)
  %156 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist30, align 8
  %157 = bitcast i32* %wpos.addr to i8*
  %158 = call i64 @getAddr(i8* %157)
  %159 = load i32, i32* %wpos.addr, align 4
  %idxprom31 = zext i32 %159 to i64
  %arrayidx32 = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %156, i64 %idxprom31
  %160 = bitcast %struct.ph_lc_s*** %arrayidx32 to i8*
  %161 = call i64 @getAddr(i8* %160)
  %162 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx32, align 8
  %163 = bitcast i8* %ci.addr to i8*
  %164 = call i64 @getAddr(i8* %163)
  %165 = load i8, i8* %ci.addr, align 1
  %conv33 = sext i8 %165 to i32
  %idxprom34 = sext i32 %conv33 to i64
  %arrayidx35 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %162, i64 %idxprom34
  %166 = bitcast %struct.ph_lc_s** %arrayidx35 to i8*
  %167 = call i64 @getAddr(i8* %166)
  %168 = bitcast %struct.ph_lc_s* %150 to i8*
  %169 = call i64 @getAddr(i8* %168)
  call void @setRealTemp(i64 %167, i64 %169)
  store %struct.ph_lc_s* %150, %struct.ph_lc_s** %arrayidx35, align 8
  br label %if.end

if.end:                                           ; preds = %if.then21, %if.then
  %170 = bitcast %struct.ph_lc_s** %lcptr to i8*
  %171 = call i64 @getAddr(i8* %170)
  %172 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %rclist = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %172, i32 0, i32 1
  %173 = bitcast %struct.ph_rc_s** %rclist to i8*
  %174 = call i64 @getAddr(i8* %173)
  %175 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rclist, align 8
  %176 = bitcast i8* %rc.addr to i8*
  %177 = call i64 @getAddr(i8* %176)
  %178 = load i8, i8* %rc.addr, align 1
  %179 = bitcast %struct.ph_rc_s* (%struct.ph_rc_s*, i8)* @find_ph_rc to i8*
  %180 = call i64 @getAddr(i8* %179)
  call void @addFunArg(i32 1, i64 %180, i64 %177)
  %call36 = call %struct.ph_rc_s* @find_ph_rc(%struct.ph_rc_s* %175, i8 signext %178)
  %181 = bitcast %struct.ph_rc_s** %rcptr to i8*
  %182 = call i64 @getAddr(i8* %181)
  %183 = bitcast %struct.ph_rc_s* %call36 to i8*
  %184 = call i64 @getAddr(i8* %183)
  call void @setRealTemp(i64 %182, i64 %184)
  store %struct.ph_rc_s* %call36, %struct.ph_rc_s** %rcptr, align 8
  %cmp37 = icmp ne %struct.ph_rc_s* %call36, null
  br i1 %cmp37, label %if.then39, label %if.end42

if.then39:                                        ; preds = %if.end
  %185 = bitcast %struct.mdef_t** %m.addr to i8*
  %186 = call i64 @getAddr(i8* %185)
  %187 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %188 = bitcast %struct.ph_rc_s** %rcptr to i8*
  %189 = call i64 @getAddr(i8* %188)
  %190 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %pid = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %190, i32 0, i32 1
  %191 = bitcast i32* %pid to i8*
  %192 = call i64 @getAddr(i8* %191)
  %193 = load i32, i32* %pid, align 4
  %arraydecay = getelementptr inbounds [4096 x i8], [4096 x i8]* %buf, i32 0, i32 0
  %194 = bitcast i32 (%struct.mdef_t*, i32, i8*)* @mdef_phone_str to i8*
  %195 = call i64 @getAddr(i8* %194)
  call void @addFunArg(i32 1, i64 %195, i64 %192)
  %call40 = call i32 @mdef_phone_str(%struct.mdef_t* %187, i32 %193, i8* %arraydecay)
  %196 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %197 = call i64 @getAddr(i8* %196)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 191, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %arraydecay41 = getelementptr inbounds [4096 x i8], [4096 x i8]* %buf, i32 0, i32 0
  %198 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %199 = call i64 @getAddr(i8* %198)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.75, i32 0, i32 0), i8* %arraydecay41)
  br label %if.end42

if.end42:                                         ; preds = %if.then39, %if.end
  %200 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %201 = call i64 @getAddr(i8* %200)
  %call43 = call i8* @__ckd_calloc__(i64 1, i64 16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 194)
  %202 = bitcast i8* %call43 to %struct.ph_rc_s*
  %203 = bitcast %struct.ph_rc_s** %rcptr to i8*
  %204 = call i64 @getAddr(i8* %203)
  %205 = bitcast %struct.ph_rc_s* %202 to i8*
  %206 = call i64 @getAddr(i8* %205)
  call void @setRealTemp(i64 %204, i64 %206)
  store %struct.ph_rc_s* %202, %struct.ph_rc_s** %rcptr, align 8
  %207 = bitcast i8* %rc.addr to i8*
  %208 = call i64 @getAddr(i8* %207)
  %209 = load i8, i8* %rc.addr, align 1
  %210 = bitcast %struct.ph_rc_s** %rcptr to i8*
  %211 = call i64 @getAddr(i8* %210)
  %212 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %rc44 = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %212, i32 0, i32 0
  %213 = bitcast i8* %rc44 to i8*
  store i8 %209, i8* %rc44, align 8
  %214 = bitcast i32* %p.addr to i8*
  %215 = call i64 @getAddr(i8* %214)
  %216 = load i32, i32* %p.addr, align 4
  %217 = bitcast %struct.ph_rc_s** %rcptr to i8*
  %218 = call i64 @getAddr(i8* %217)
  %219 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %pid45 = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %219, i32 0, i32 1
  %220 = bitcast i32* %pid45 to i8*
  store i32 %216, i32* %pid45, align 4
  %221 = bitcast %struct.ph_lc_s** %lcptr to i8*
  %222 = call i64 @getAddr(i8* %221)
  %223 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %rclist46 = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %223, i32 0, i32 1
  %224 = bitcast %struct.ph_rc_s** %rclist46 to i8*
  %225 = call i64 @getAddr(i8* %224)
  %226 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rclist46, align 8
  %227 = bitcast %struct.ph_rc_s** %rcptr to i8*
  %228 = call i64 @getAddr(i8* %227)
  %229 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %next47 = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %229, i32 0, i32 2
  %230 = bitcast %struct.ph_rc_s** %next47 to i8*
  %231 = call i64 @getAddr(i8* %230)
  %232 = bitcast %struct.ph_rc_s* %226 to i8*
  %233 = call i64 @getAddr(i8* %232)
  call void @setRealTemp(i64 %231, i64 %233)
  store %struct.ph_rc_s* %226, %struct.ph_rc_s** %next47, align 8
  %234 = bitcast %struct.ph_rc_s** %rcptr to i8*
  %235 = call i64 @getAddr(i8* %234)
  %236 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %237 = bitcast %struct.ph_lc_s** %lcptr to i8*
  %238 = call i64 @getAddr(i8* %237)
  %239 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %rclist48 = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %239, i32 0, i32 1
  %240 = bitcast %struct.ph_rc_s** %rclist48 to i8*
  %241 = call i64 @getAddr(i8* %240)
  %242 = bitcast %struct.ph_rc_s* %236 to i8*
  %243 = call i64 @getAddr(i8* %242)
  call void @setRealTemp(i64 %241, i64 %243)
  store %struct.ph_rc_s* %236, %struct.ph_rc_s** %rclist48, align 8
  br label %if.end49

if.end49:                                         ; preds = %if.end42, %cond.end
  %244 = bitcast void (%struct.mdef_t*, i8, i8, i8, i32, i32)* @triphone_add to i8*
  %245 = call i64 @getAddr(i8* %244)
  call void @funcExit(i64 %245)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @parse_tmat_senmap(%struct.mdef_t* %m, i8* %line, i32 %off, i32 %p) #0 {
entry:
  %0 = bitcast void (%struct.mdef_t*, i8*, i32, i32)* @parse_tmat_senmap to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %m.addr = alloca %struct.mdef_t*, align 8
  %line.addr = alloca i8*, align 8
  %off.addr = alloca i32, align 4
  %p.addr = alloca i32, align 4
  %wlen = alloca i32, align 4
  %n = alloca i32, align 4
  %s = alloca i32, align 4
  %word = alloca [1024 x i8], align 16
  %lp = alloca i8*, align 8
  %2 = bitcast %struct.mdef_t** %m.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  %4 = bitcast %struct.mdef_t* %m to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @setRealTemp(i64 %3, i64 %5)
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %6 = bitcast i8** %line.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  %8 = bitcast i8* %line to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @setRealTemp(i64 %7, i64 %9)
  store i8* %line, i8** %line.addr, align 8
  %10 = bitcast i32* %off.addr to i8*
  store i32 %off, i32* %off.addr, align 4
  %11 = bitcast i32* %p.addr to i8*
  store i32 %p, i32* %p.addr, align 4
  %12 = bitcast i8** %line.addr to i8*
  %13 = call i64 @getAddr(i8* %12)
  %14 = load i8*, i8** %line.addr, align 8
  %15 = bitcast i32* %off.addr to i8*
  %16 = call i64 @getAddr(i8* %15)
  %17 = load i32, i32* %off.addr, align 4
  %idx.ext = sext i32 %17 to i64
  %add.ptr = getelementptr inbounds i8, i8* %14, i64 %idx.ext
  %18 = bitcast i8** %lp to i8*
  %19 = call i64 @getAddr(i8* %18)
  %20 = bitcast i8* %add.ptr to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void @setRealTemp(i64 %19, i64 %21)
  store i8* %add.ptr, i8** %lp, align 8
  %22 = bitcast i8** %lp to i8*
  %23 = call i64 @getAddr(i8* %22)
  %24 = load i8*, i8** %lp, align 8
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %24, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.76, i32 0, i32 0), i32* %n, i32* %wlen) #7
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %25 = bitcast i32* %n to i8*
  %26 = call i64 @getAddr(i8* %25)
  %27 = load i32, i32* %n, align 4
  %cmp1 = icmp slt i32 %27, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %28 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %29 = call i64 @getAddr(i8* %28)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 381, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %30 = bitcast i8** %line.addr to i8*
  %31 = call i64 @getAddr(i8* %30)
  %32 = load i8*, i8** %line.addr, align 8
  %33 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %34 = call i64 @getAddr(i8* %33)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.77, i32 0, i32 0), i8* %32)
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %35 = bitcast i32* %n to i8*
  %36 = call i64 @getAddr(i8* %35)
  %37 = load i32, i32* %n, align 4
  %38 = bitcast %struct.mdef_t** %m.addr to i8*
  %39 = call i64 @getAddr(i8* %38)
  %40 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %40, i32 0, i32 8
  %41 = bitcast %struct.phone_t** %phone to i8*
  %42 = call i64 @getAddr(i8* %41)
  %43 = load %struct.phone_t*, %struct.phone_t** %phone, align 8
  %44 = bitcast i32* %p.addr to i8*
  %45 = call i64 @getAddr(i8* %44)
  %46 = load i32, i32* %p.addr, align 4
  %idxprom = sext i32 %46 to i64
  %arrayidx = getelementptr inbounds %struct.phone_t, %struct.phone_t* %43, i64 %idxprom
  %tmat = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx, i32 0, i32 1
  %47 = bitcast i32* %tmat to i8*
  store i32 %37, i32* %tmat, align 4
  %48 = bitcast %struct.mdef_t** %m.addr to i8*
  %49 = call i64 @getAddr(i8* %48)
  %50 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_tmat = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %50, i32 0, i32 5
  %51 = bitcast i32* %n_tmat to i8*
  %52 = call i64 @getAddr(i8* %51)
  %53 = load i32, i32* %n_tmat, align 4
  %54 = bitcast i32* %n to i8*
  %55 = call i64 @getAddr(i8* %54)
  %56 = load i32, i32* %n, align 4
  %cmp2 = icmp sle i32 %53, %56
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %57 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %58 = call i64 @getAddr(i8* %57)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 384, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %59 = bitcast i32* %n to i8*
  %60 = call i64 @getAddr(i8* %59)
  %61 = load i32, i32* %n, align 4
  %62 = bitcast %struct.mdef_t** %m.addr to i8*
  %63 = call i64 @getAddr(i8* %62)
  %64 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_tmat4 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %64, i32 0, i32 5
  %65 = bitcast i32* %n_tmat4 to i8*
  %66 = call i64 @getAddr(i8* %65)
  %67 = load i32, i32* %n_tmat4, align 4
  %68 = bitcast i8** %line.addr to i8*
  %69 = call i64 @getAddr(i8* %68)
  %70 = load i8*, i8** %line.addr, align 8
  %71 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %72 = call i64 @getAddr(i8* %71)
  call void @addFunArg(i32 1, i64 %72, i64 %60)
  call void @addFunArg(i32 2, i64 %72, i64 %66)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.78, i32 0, i32 0), i32 %61, i32 %67, i8* %70)
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %73 = bitcast i32* %wlen to i8*
  %74 = call i64 @getAddr(i8* %73)
  %75 = load i32, i32* %wlen, align 4
  %76 = bitcast i8** %lp to i8*
  %77 = call i64 @getAddr(i8* %76)
  %78 = load i8*, i8** %lp, align 8
  %idx.ext6 = sext i32 %75 to i64
  %add.ptr7 = getelementptr inbounds i8, i8* %78, i64 %idx.ext6
  %79 = bitcast i8** %lp to i8*
  %80 = call i64 @getAddr(i8* %79)
  %81 = bitcast i8* %add.ptr7 to i8*
  %82 = call i64 @getAddr(i8* %81)
  call void @setRealTemp(i64 %80, i64 %82)
  store i8* %add.ptr7, i8** %lp, align 8
  %83 = bitcast i32* %n to i8*
  store i32 0, i32* %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end5
  %84 = bitcast i32* %n to i8*
  %85 = call i64 @getAddr(i8* %84)
  %86 = load i32, i32* %n, align 4
  %87 = bitcast %struct.mdef_t** %m.addr to i8*
  %88 = call i64 @getAddr(i8* %87)
  %89 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_emit_state = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %89, i32 0, i32 2
  %90 = bitcast i32* %n_emit_state to i8*
  %91 = call i64 @getAddr(i8* %90)
  %92 = load i32, i32* %n_emit_state, align 8
  %cmp8 = icmp slt i32 %86, %92
  br i1 %cmp8, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %93 = bitcast i8** %lp to i8*
  %94 = call i64 @getAddr(i8* %93)
  %95 = load i8*, i8** %lp, align 8
  %call9 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %95, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.76, i32 0, i32 0), i32* %s, i32* %wlen) #7
  %cmp10 = icmp ne i32 %call9, 1
  br i1 %cmp10, label %if.then13, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %for.body
  %96 = bitcast i32* %s to i8*
  %97 = call i64 @getAddr(i8* %96)
  %98 = load i32, i32* %s, align 4
  %cmp12 = icmp slt i32 %98, 0
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %lor.lhs.false11, %for.body
  %99 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %100 = call i64 @getAddr(i8* %99)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 390, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %101 = bitcast i32* %n to i8*
  %102 = call i64 @getAddr(i8* %101)
  %103 = load i32, i32* %n, align 4
  %104 = bitcast i8** %line.addr to i8*
  %105 = call i64 @getAddr(i8* %104)
  %106 = load i8*, i8** %line.addr, align 8
  %107 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %108 = call i64 @getAddr(i8* %107)
  call void @addFunArg(i32 1, i64 %108, i64 %102)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.79, i32 0, i32 0), i32 %103, i8* %106)
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %lor.lhs.false11
  %109 = bitcast i32* %p.addr to i8*
  %110 = call i64 @getAddr(i8* %109)
  %111 = load i32, i32* %p.addr, align 4
  %112 = bitcast %struct.mdef_t** %m.addr to i8*
  %113 = call i64 @getAddr(i8* %112)
  %114 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %114, i32 0, i32 0
  %115 = bitcast i32* %n_ciphone to i8*
  %116 = call i64 @getAddr(i8* %115)
  %117 = load i32, i32* %n_ciphone, align 8
  %cmp15 = icmp slt i32 %111, %117
  br i1 %cmp15, label %land.lhs.true, label %if.end19

land.lhs.true:                                    ; preds = %if.end14
  %118 = bitcast %struct.mdef_t** %m.addr to i8*
  %119 = call i64 @getAddr(i8* %118)
  %120 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ci_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %120, i32 0, i32 3
  %121 = bitcast i32* %n_ci_sen to i8*
  %122 = call i64 @getAddr(i8* %121)
  %123 = load i32, i32* %n_ci_sen, align 4
  %124 = bitcast i32* %s to i8*
  %125 = call i64 @getAddr(i8* %124)
  %126 = load i32, i32* %s, align 4
  %cmp16 = icmp sle i32 %123, %126
  br i1 %cmp16, label %if.then17, label %if.end19

if.then17:                                        ; preds = %land.lhs.true
  %127 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %128 = call i64 @getAddr(i8* %127)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 392, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %129 = bitcast i32* %s to i8*
  %130 = call i64 @getAddr(i8* %129)
  %131 = load i32, i32* %s, align 4
  %132 = bitcast %struct.mdef_t** %m.addr to i8*
  %133 = call i64 @getAddr(i8* %132)
  %134 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ci_sen18 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %134, i32 0, i32 3
  %135 = bitcast i32* %n_ci_sen18 to i8*
  %136 = call i64 @getAddr(i8* %135)
  %137 = load i32, i32* %n_ci_sen18, align 4
  %138 = bitcast i8** %line.addr to i8*
  %139 = call i64 @getAddr(i8* %138)
  %140 = load i8*, i8** %line.addr, align 8
  %141 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %142 = call i64 @getAddr(i8* %141)
  call void @addFunArg(i32 1, i64 %142, i64 %130)
  call void @addFunArg(i32 2, i64 %142, i64 %136)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.80, i32 0, i32 0), i32 %131, i32 %137, i8* %140)
  br label %if.end19

if.end19:                                         ; preds = %if.then17, %land.lhs.true, %if.end14
  %143 = bitcast %struct.mdef_t** %m.addr to i8*
  %144 = call i64 @getAddr(i8* %143)
  %145 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %145, i32 0, i32 4
  %146 = bitcast i32* %n_sen to i8*
  %147 = call i64 @getAddr(i8* %146)
  %148 = load i32, i32* %n_sen, align 8
  %149 = bitcast i32* %s to i8*
  %150 = call i64 @getAddr(i8* %149)
  %151 = load i32, i32* %s, align 4
  %cmp20 = icmp sle i32 %148, %151
  br i1 %cmp20, label %if.then21, label %if.end23

if.then21:                                        ; preds = %if.end19
  %152 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %153 = call i64 @getAddr(i8* %152)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 394, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %154 = bitcast i32* %s to i8*
  %155 = call i64 @getAddr(i8* %154)
  %156 = load i32, i32* %s, align 4
  %157 = bitcast %struct.mdef_t** %m.addr to i8*
  %158 = call i64 @getAddr(i8* %157)
  %159 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_sen22 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %159, i32 0, i32 4
  %160 = bitcast i32* %n_sen22 to i8*
  %161 = call i64 @getAddr(i8* %160)
  %162 = load i32, i32* %n_sen22, align 8
  %163 = bitcast i8** %line.addr to i8*
  %164 = call i64 @getAddr(i8* %163)
  %165 = load i8*, i8** %line.addr, align 8
  %166 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %167 = call i64 @getAddr(i8* %166)
  call void @addFunArg(i32 1, i64 %167, i64 %155)
  call void @addFunArg(i32 2, i64 %167, i64 %161)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.81, i32 0, i32 0), i32 %156, i32 %162, i8* %165)
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.end19
  %168 = bitcast i32* %s to i8*
  %169 = call i64 @getAddr(i8* %168)
  %170 = load i32, i32* %s, align 4
  %conv = trunc i32 %170 to i16
  %171 = bitcast %struct.mdef_t** %m.addr to i8*
  %172 = call i64 @getAddr(i8* %171)
  %173 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sseq = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %173, i32 0, i32 9
  %174 = bitcast i16*** %sseq to i8*
  %175 = call i64 @getAddr(i8* %174)
  %176 = load i16**, i16*** %sseq, align 8
  %177 = bitcast i32* %p.addr to i8*
  %178 = call i64 @getAddr(i8* %177)
  %179 = load i32, i32* %p.addr, align 4
  %idxprom24 = sext i32 %179 to i64
  %arrayidx25 = getelementptr inbounds i16*, i16** %176, i64 %idxprom24
  %180 = bitcast i16** %arrayidx25 to i8*
  %181 = call i64 @getAddr(i8* %180)
  %182 = load i16*, i16** %arrayidx25, align 8
  %183 = bitcast i32* %n to i8*
  %184 = call i64 @getAddr(i8* %183)
  %185 = load i32, i32* %n, align 4
  %idxprom26 = sext i32 %185 to i64
  %arrayidx27 = getelementptr inbounds i16, i16* %182, i64 %idxprom26
  %186 = bitcast i16* %arrayidx27 to i8*
  store i16 %conv, i16* %arrayidx27, align 2
  %187 = bitcast i32* %wlen to i8*
  %188 = call i64 @getAddr(i8* %187)
  %189 = load i32, i32* %wlen, align 4
  %190 = bitcast i8** %lp to i8*
  %191 = call i64 @getAddr(i8* %190)
  %192 = load i8*, i8** %lp, align 8
  %idx.ext28 = sext i32 %189 to i64
  %add.ptr29 = getelementptr inbounds i8, i8* %192, i64 %idx.ext28
  %193 = bitcast i8** %lp to i8*
  %194 = call i64 @getAddr(i8* %193)
  %195 = bitcast i8* %add.ptr29 to i8*
  %196 = call i64 @getAddr(i8* %195)
  call void @setRealTemp(i64 %194, i64 %196)
  store i8* %add.ptr29, i8** %lp, align 8
  br label %for.inc

for.inc:                                          ; preds = %if.end23
  %197 = bitcast i32* %n to i8*
  %198 = call i64 @getAddr(i8* %197)
  %199 = load i32, i32* %n, align 4
  %inc = add nsw i32 %199, 1
  %200 = bitcast i32* %n to i8*
  store i32 %inc, i32* %n, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %201 = bitcast i8** %lp to i8*
  %202 = call i64 @getAddr(i8* %201)
  %203 = load i8*, i8** %lp, align 8
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call30 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %203, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay, i32* %wlen) #7
  %cmp31 = icmp ne i32 %call30, 1
  br i1 %cmp31, label %if.then38, label %lor.lhs.false33

lor.lhs.false33:                                  ; preds = %for.end
  %arraydecay34 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call35 = call i32 @strcmp(i8* %arraydecay34, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.82, i32 0, i32 0)) #8
  %cmp36 = icmp ne i32 %call35, 0
  br i1 %cmp36, label %if.then38, label %if.end39

if.then38:                                        ; preds = %lor.lhs.false33, %for.end
  %204 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %205 = call i64 @getAddr(i8* %204)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 402, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %206 = bitcast i8** %line.addr to i8*
  %207 = call i64 @getAddr(i8* %206)
  %208 = load i8*, i8** %line.addr, align 8
  %209 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %210 = call i64 @getAddr(i8* %209)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.83, i32 0, i32 0), i8* %208)
  br label %if.end39

if.end39:                                         ; preds = %if.then38, %lor.lhs.false33
  %211 = bitcast i32* %wlen to i8*
  %212 = call i64 @getAddr(i8* %211)
  %213 = load i32, i32* %wlen, align 4
  %214 = bitcast i8** %lp to i8*
  %215 = call i64 @getAddr(i8* %214)
  %216 = load i8*, i8** %lp, align 8
  %idx.ext40 = sext i32 %213 to i64
  %add.ptr41 = getelementptr inbounds i8, i8* %216, i64 %idx.ext40
  %217 = bitcast i8** %lp to i8*
  %218 = call i64 @getAddr(i8* %217)
  %219 = bitcast i8* %add.ptr41 to i8*
  %220 = call i64 @getAddr(i8* %219)
  call void @setRealTemp(i64 %218, i64 %220)
  store i8* %add.ptr41, i8** %lp, align 8
  %221 = bitcast i8** %lp to i8*
  %222 = call i64 @getAddr(i8* %221)
  %223 = load i8*, i8** %lp, align 8
  %arraydecay42 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call43 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %223, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay42, i32* %wlen) #7
  %cmp44 = icmp eq i32 %call43, 1
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.end39
  %224 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %225 = call i64 @getAddr(i8* %224)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 407, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %226 = bitcast i8** %line.addr to i8*
  %227 = call i64 @getAddr(i8* %226)
  %228 = load i8*, i8** %line.addr, align 8
  %229 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %230 = call i64 @getAddr(i8* %229)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.84, i32 0, i32 0), i8* %228)
  br label %if.end47

if.end47:                                         ; preds = %if.then46, %if.end39
  %231 = bitcast void (%struct.mdef_t*, i8*, i32, i32)* @parse_tmat_senmap to i8*
  %232 = call i64 @getAddr(i8* %231)
  call void @funcExit(i64 %232)
  ret void
}

declare dso_local i8* @__ckd_salloc__(i8*, i8*, i32) #1

declare dso_local i32 @hash_enter(%struct.hash_table_t*, i8*, i32) #1

declare dso_local i32 @hash_enter_bkey(%struct.hash_table_t*, i8*, i32, i32) #1

declare dso_local %struct.gnode_s* @hash_tolist(%struct.hash_table_t*, i32*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #5

declare dso_local void @glist_free(%struct.gnode_s*) #1

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @funcExit(i64)

declare void @setRealTemp(i64, i64)

declare void @addFunArg(i32, i64, i64)

declare void @trackReturn(i64, i64)

declare void @handleLLVMMemcpy(i64, i64, i64)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
