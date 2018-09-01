; ModuleID = 'mdef.bc'
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
  %fp.addr = alloca %struct._IO_FILE*, align 8
  %m.addr = alloca %struct.mdef_t*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %ssid = alloca i32, align 4
  %buf = alloca [1024 x i8], align 16
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %fp.addr, align 8
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %1 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %1, i32 0, i32 0
  %2 = load i32, i32* %n_ciphone, align 8
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 %2)
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %4 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %4, i32 0, i32 1
  %5 = load i32, i32* %n_phone, align 4
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 %5)
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %7 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_emit_state = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %7, i32 0, i32 2
  %8 = load i32, i32* %n_emit_state, align 8
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 %8)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %10 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ci_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %10, i32 0, i32 3
  %11 = load i32, i32* %n_ci_sen, align 4
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0), i32 %11)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %13 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %13, i32 0, i32 4
  %14 = load i32, i32* %n_sen, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i32 %14)
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %16 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_tmat = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %16, i32 0, i32 5
  %17 = load i32, i32* %n_tmat, align 4
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i32 0, i32 0), i32 %17)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc42, %entry
  %18 = load i32, i32* %i, align 4
  %19 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone6 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %19, i32 0, i32 1
  %20 = load i32, i32* %n_phone6, align 4
  %cmp = icmp slt i32 %18, %20
  br i1 %cmp, label %for.body, label %for.end44

for.body:                                         ; preds = %for.cond
  %21 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %22 = load i32, i32* %i, align 4
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %call7 = call i32 @mdef_phone_str(%struct.mdef_t* %21, i32 %22, i8* %arraydecay)
  %23 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %23, i32 0, i32 8
  %24 = load %struct.phone_t*, %struct.phone_t** %phone, align 8
  %25 = load i32, i32* %i, align 4
  %idxprom = sext i32 %25 to i64
  %arrayidx = getelementptr inbounds %struct.phone_t, %struct.phone_t* %24, i64 %idxprom
  %ssid8 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx, i32 0, i32 0
  %26 = load i32, i32* %ssid8, align 4
  store i32 %26, i32* %ssid, align 4
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %28 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone9 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %28, i32 0, i32 8
  %29 = load %struct.phone_t*, %struct.phone_t** %phone9, align 8
  %30 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %30 to i64
  %arrayidx11 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %29, i64 %idxprom10
  %tmat = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx11, i32 0, i32 1
  %31 = load i32, i32* %tmat, align 4
  %32 = load i32, i32* %ssid, align 4
  %call12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i32 0, i32 0), i32 %31, i32 %32)
  store i32 0, i32* %j, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc, %for.body
  %33 = load i32, i32* %j, align 4
  %34 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_emit_state14 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %34, i32 0, i32 2
  %35 = load i32, i32* %n_emit_state14, align 8
  %cmp15 = icmp slt i32 %33, %35
  br i1 %cmp15, label %for.body16, label %for.end

for.body16:                                       ; preds = %for.cond13
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %37 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sseq = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %37, i32 0, i32 9
  %38 = load i16**, i16*** %sseq, align 8
  %39 = load i32, i32* %ssid, align 4
  %idxprom17 = sext i32 %39 to i64
  %arrayidx18 = getelementptr inbounds i16*, i16** %38, i64 %idxprom17
  %40 = load i16*, i16** %arrayidx18, align 8
  %41 = load i32, i32* %j, align 4
  %idxprom19 = sext i32 %41 to i64
  %arrayidx20 = getelementptr inbounds i16, i16* %40, i64 %idxprom19
  %42 = load i16, i16* %arrayidx20, align 2
  %conv = sext i16 %42 to i32
  %call21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i32 %conv)
  br label %for.inc

for.inc:                                          ; preds = %for.body16
  %43 = load i32, i32* %j, align 4
  %inc = add nsw i32 %43, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond13

for.end:                                          ; preds = %for.cond13
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0))
  store i32 0, i32* %j, align 4
  br label %for.cond23

for.cond23:                                       ; preds = %for.inc37, %for.end
  %45 = load i32, i32* %j, align 4
  %46 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_emit_state24 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %46, i32 0, i32 2
  %47 = load i32, i32* %n_emit_state24, align 8
  %cmp25 = icmp slt i32 %45, %47
  br i1 %cmp25, label %for.body27, label %for.end39

for.body27:                                       ; preds = %for.cond23
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %49 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %cd2cisen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %49, i32 0, i32 11
  %50 = load i16*, i16** %cd2cisen, align 8
  %51 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sseq28 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %51, i32 0, i32 9
  %52 = load i16**, i16*** %sseq28, align 8
  %53 = load i32, i32* %ssid, align 4
  %idxprom29 = sext i32 %53 to i64
  %arrayidx30 = getelementptr inbounds i16*, i16** %52, i64 %idxprom29
  %54 = load i16*, i16** %arrayidx30, align 8
  %55 = load i32, i32* %j, align 4
  %idxprom31 = sext i32 %55 to i64
  %arrayidx32 = getelementptr inbounds i16, i16* %54, i64 %idxprom31
  %56 = load i16, i16* %arrayidx32, align 2
  %idxprom33 = sext i16 %56 to i64
  %arrayidx34 = getelementptr inbounds i16, i16* %50, i64 %idxprom33
  %57 = load i16, i16* %arrayidx34, align 2
  %conv35 = sext i16 %57 to i32
  %call36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i32 %conv35)
  br label %for.inc37

for.inc37:                                        ; preds = %for.body27
  %58 = load i32, i32* %j, align 4
  %inc38 = add nsw i32 %58, 1
  store i32 %inc38, i32* %j, align 4
  br label %for.cond23

for.end39:                                        ; preds = %for.cond23
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %arraydecay40 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %call41 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %59, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i32 0, i32 0), i8* %arraydecay40)
  br label %for.inc42

for.inc42:                                        ; preds = %for.end39
  %60 = load i32, i32* %i, align 4
  %inc43 = add nsw i32 %60, 1
  store i32 %inc43, i32* %i, align 4
  br label %for.cond

for.end44:                                        ; preds = %for.cond
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %call45 = call i32 @fflush(%struct._IO_FILE* %61)
  ret void
}

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mdef_phone_str(%struct.mdef_t* %m, i32 %pid, i8* %buf) #0 {
entry:
  %m.addr = alloca %struct.mdef_t*, align 8
  %pid.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 8
  %wpos_name = alloca i8*, align 8
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  store i32 %pid, i32* %pid.addr, align 4
  store i8* %buf, i8** %buf.addr, align 8
  %0 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %tobool = icmp ne %struct.mdef_t* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 229, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__PRETTY_FUNCTION__.mdef_phone_str, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %1, %cond.true
  %2 = load i32, i32* %pid.addr, align 4
  %cmp = icmp sge i32 %2, 0
  br i1 %cmp, label %land.lhs.true, label %cond.false3

land.lhs.true:                                    ; preds = %cond.end
  %3 = load i32, i32* %pid.addr, align 4
  %4 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %4, i32 0, i32 1
  %5 = load i32, i32* %n_phone, align 4
  %cmp1 = icmp slt i32 %3, %5
  br i1 %cmp1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %land.lhs.true
  br label %cond.end4

cond.false3:                                      ; preds = %land.lhs.true, %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 230, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__PRETTY_FUNCTION__.mdef_phone_str, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end4

cond.end4:                                        ; preds = %6, %cond.true2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0), i8** %wpos_name, align 8
  %7 = load i8*, i8** %buf.addr, align 8
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 0
  store i8 0, i8* %arrayidx, align 1
  %8 = load i32, i32* %pid.addr, align 4
  %9 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %9, i32 0, i32 0
  %10 = load i32, i32* %n_ciphone, align 8
  %cmp5 = icmp slt i32 %8, %10
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end4
  %11 = load i8*, i8** %buf.addr, align 8
  %12 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %13 = load i32, i32* %pid.addr, align 4
  %conv = trunc i32 %13 to i8
  %call = call i8* @mdef_ciphone_str(%struct.mdef_t* %12, i8 signext %conv)
  %call6 = call i32 (i8*, i8*, ...) @sprintf(i8* %11, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.17, i32 0, i32 0), i8* %call) #7
  br label %if.end

if.else:                                          ; preds = %cond.end4
  %14 = load i8*, i8** %buf.addr, align 8
  %15 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %16 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %16, i32 0, i32 8
  %17 = load %struct.phone_t*, %struct.phone_t** %phone, align 8
  %18 = load i32, i32* %pid.addr, align 4
  %idxprom = sext i32 %18 to i64
  %arrayidx7 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %17, i64 %idxprom
  %ci = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx7, i32 0, i32 2
  %19 = load i8, i8* %ci, align 4
  %call8 = call i8* @mdef_ciphone_str(%struct.mdef_t* %15, i8 signext %19)
  %20 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %21 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone9 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %21, i32 0, i32 8
  %22 = load %struct.phone_t*, %struct.phone_t** %phone9, align 8
  %23 = load i32, i32* %pid.addr, align 4
  %idxprom10 = sext i32 %23 to i64
  %arrayidx11 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %22, i64 %idxprom10
  %lc = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx11, i32 0, i32 3
  %24 = load i8, i8* %lc, align 1
  %call12 = call i8* @mdef_ciphone_str(%struct.mdef_t* %20, i8 signext %24)
  %25 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %26 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone13 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %26, i32 0, i32 8
  %27 = load %struct.phone_t*, %struct.phone_t** %phone13, align 8
  %28 = load i32, i32* %pid.addr, align 4
  %idxprom14 = sext i32 %28 to i64
  %arrayidx15 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %27, i64 %idxprom14
  %rc = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx15, i32 0, i32 4
  %29 = load i8, i8* %rc, align 2
  %call16 = call i8* @mdef_ciphone_str(%struct.mdef_t* %25, i8 signext %29)
  %30 = load i8*, i8** %wpos_name, align 8
  %31 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone17 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %31, i32 0, i32 8
  %32 = load %struct.phone_t*, %struct.phone_t** %phone17, align 8
  %33 = load i32, i32* %pid.addr, align 4
  %idxprom18 = sext i32 %33 to i64
  %arrayidx19 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %32, i64 %idxprom18
  %wpos = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx19, i32 0, i32 5
  %34 = load i32, i32* %wpos, align 4
  %idxprom20 = zext i32 %34 to i64
  %arrayidx21 = getelementptr inbounds i8, i8* %30, i64 %idxprom20
  %35 = load i8, i8* %arrayidx21, align 1
  %conv22 = sext i8 %35 to i32
  %call23 = call i32 (i8*, i8*, ...) @sprintf(i8* %14, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.18, i32 0, i32 0), i8* %call8, i8* %call12, i8* %call16, i32 %conv22) #7
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0
}

declare dso_local i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i8 @mdef_ciphone_id(%struct.mdef_t* %m, i8* %ci) #0 {
entry:
  %retval = alloca i8, align 1
  %m.addr = alloca %struct.mdef_t*, align 8
  %ci.addr = alloca i8*, align 8
  %id = alloca i32, align 4
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  store i8* %ci, i8** %ci.addr, align 8
  %0 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %tobool = icmp ne %struct.mdef_t* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 207, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__PRETTY_FUNCTION__.mdef_ciphone_id, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %1, %cond.true
  %2 = load i8*, i8** %ci.addr, align 8
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %cond.end
  br label %cond.end4

cond.false3:                                      ; preds = %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 208, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__PRETTY_FUNCTION__.mdef_ciphone_id, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end4

cond.end4:                                        ; preds = %3, %cond.true2
  %4 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone_ht = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %4, i32 0, i32 6
  %5 = load %struct.hash_table_t*, %struct.hash_table_t** %ciphone_ht, align 8
  %6 = load i8*, i8** %ci.addr, align 8
  %call = call i32 @hash_lookup(%struct.hash_table_t* %5, i8* %6, i32* %id)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end4
  store i8 -1, i8* %retval, align 1
  br label %return

if.end:                                           ; preds = %cond.end4
  %7 = load i32, i32* %id, align 4
  %conv = trunc i32 %7 to i8
  store i8 %conv, i8* %retval, align 1
  br label %return

return:                                           ; preds = %if.end, %if.then
  %8 = load i8, i8* %retval, align 1
  ret i8 %8
}

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #2

declare dso_local i32 @hash_lookup(%struct.hash_table_t*, i8*, i32*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @mdef_ciphone_str(%struct.mdef_t* %m, i8 signext %id) #0 {
entry:
  %m.addr = alloca %struct.mdef_t*, align 8
  %id.addr = alloca i8, align 1
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  store i8 %id, i8* %id.addr, align 1
  %0 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %tobool = icmp ne %struct.mdef_t* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 218, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__PRETTY_FUNCTION__.mdef_ciphone_str, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %1, %cond.true
  %2 = load i8, i8* %id.addr, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp sge i32 %conv, 0
  br i1 %cmp, label %land.lhs.true, label %cond.false6

land.lhs.true:                                    ; preds = %cond.end
  %3 = load i8, i8* %id.addr, align 1
  %conv2 = sext i8 %3 to i32
  %4 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %4, i32 0, i32 0
  %5 = load i32, i32* %n_ciphone, align 8
  %cmp3 = icmp slt i32 %conv2, %5
  br i1 %cmp3, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %land.lhs.true
  br label %cond.end7

cond.false6:                                      ; preds = %land.lhs.true, %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 219, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__PRETTY_FUNCTION__.mdef_ciphone_str, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end7

cond.end7:                                        ; preds = %6, %cond.true5
  %7 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %7, i32 0, i32 7
  %8 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone, align 8
  %9 = load i8, i8* %id.addr, align 1
  %conv8 = sext i8 %9 to i32
  %idxprom = sext i32 %conv8 to i64
  %arrayidx = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %8, i64 %idxprom
  %name = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx, i32 0, i32 0
  %10 = load i8*, i8** %name, align 8
  ret i8* %10
}

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mdef_phone_id(%struct.mdef_t* %m, i8 signext %ci, i8 signext %lc, i8 signext %rc, i32 %wpos) #0 {
entry:
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
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  store i8 %ci, i8* %ci.addr, align 1
  store i8 %lc, i8* %lc.addr, align 1
  store i8 %rc, i8* %rc.addr, align 1
  store i32 %wpos, i32* %wpos.addr, align 4
  %0 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %tobool = icmp ne %struct.mdef_t* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 254, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %1, %cond.true
  %2 = load i8, i8* %ci.addr, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp sge i32 %conv, 0
  br i1 %cmp, label %land.lhs.true, label %cond.false6

land.lhs.true:                                    ; preds = %cond.end
  %3 = load i8, i8* %ci.addr, align 1
  %conv2 = sext i8 %3 to i32
  %4 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %4, i32 0, i32 0
  %5 = load i32, i32* %n_ciphone, align 8
  %cmp3 = icmp slt i32 %conv2, %5
  br i1 %cmp3, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %land.lhs.true
  br label %cond.end7

cond.false6:                                      ; preds = %land.lhs.true, %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 255, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end7

cond.end7:                                        ; preds = %6, %cond.true5
  %7 = load i8, i8* %lc.addr, align 1
  %conv8 = sext i8 %7 to i32
  %cmp9 = icmp sge i32 %conv8, 0
  br i1 %cmp9, label %land.lhs.true11, label %cond.false17

land.lhs.true11:                                  ; preds = %cond.end7
  %8 = load i8, i8* %lc.addr, align 1
  %conv12 = sext i8 %8 to i32
  %9 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone13 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %9, i32 0, i32 0
  %10 = load i32, i32* %n_ciphone13, align 8
  %cmp14 = icmp slt i32 %conv12, %10
  br i1 %cmp14, label %cond.true16, label %cond.false17

cond.true16:                                      ; preds = %land.lhs.true11
  br label %cond.end18

cond.false17:                                     ; preds = %land.lhs.true11, %cond.end7
  call void @__assert_fail(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 256, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end18

cond.end18:                                       ; preds = %11, %cond.true16
  %12 = load i8, i8* %rc.addr, align 1
  %conv19 = sext i8 %12 to i32
  %cmp20 = icmp sge i32 %conv19, 0
  br i1 %cmp20, label %land.lhs.true22, label %cond.false28

land.lhs.true22:                                  ; preds = %cond.end18
  %13 = load i8, i8* %rc.addr, align 1
  %conv23 = sext i8 %13 to i32
  %14 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone24 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %14, i32 0, i32 0
  %15 = load i32, i32* %n_ciphone24, align 8
  %cmp25 = icmp slt i32 %conv23, %15
  br i1 %cmp25, label %cond.true27, label %cond.false28

cond.true27:                                      ; preds = %land.lhs.true22
  br label %cond.end29

cond.false28:                                     ; preds = %land.lhs.true22, %cond.end18
  call void @__assert_fail(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 257, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end29

cond.end29:                                       ; preds = %16, %cond.true27
  %17 = load i32, i32* %wpos.addr, align 4
  %cmp30 = icmp uge i32 %17, 0
  br i1 %cmp30, label %land.lhs.true32, label %cond.false36

land.lhs.true32:                                  ; preds = %cond.end29
  %18 = load i32, i32* %wpos.addr, align 4
  %cmp33 = icmp ult i32 %18, 4
  br i1 %cmp33, label %cond.true35, label %cond.false36

cond.true35:                                      ; preds = %land.lhs.true32
  br label %cond.end37

cond.false36:                                     ; preds = %land.lhs.true32, %cond.end29
  call void @__assert_fail(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 258, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end37

cond.end37:                                       ; preds = %19, %cond.true35
  %20 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %20, i32 0, i32 15
  %21 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist, align 8
  %22 = load i32, i32* %wpos.addr, align 4
  %idxprom = zext i32 %22 to i64
  %arrayidx = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %21, i64 %idxprom
  %23 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx, align 8
  %24 = load i8, i8* %ci.addr, align 1
  %conv38 = sext i8 %24 to i32
  %idxprom39 = sext i32 %conv38 to i64
  %arrayidx40 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %23, i64 %idxprom39
  %25 = load %struct.ph_lc_s*, %struct.ph_lc_s** %arrayidx40, align 8
  %26 = load i8, i8* %lc.addr, align 1
  %call = call %struct.ph_lc_s* @find_ph_lc(%struct.ph_lc_s* %25, i8 signext %26)
  store %struct.ph_lc_s* %call, %struct.ph_lc_s** %lcptr, align 8
  %cmp41 = icmp eq %struct.ph_lc_s* %call, null
  br i1 %cmp41, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end37
  %27 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %rclist = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %27, i32 0, i32 1
  %28 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rclist, align 8
  %29 = load i8, i8* %rc.addr, align 1
  %call43 = call %struct.ph_rc_s* @find_ph_rc(%struct.ph_rc_s* %28, i8 signext %29)
  store %struct.ph_rc_s* %call43, %struct.ph_rc_s** %rcptr, align 8
  %cmp44 = icmp eq %struct.ph_rc_s* %call43, null
  br i1 %cmp44, label %if.then, label %if.end87

if.then:                                          ; preds = %lor.lhs.false, %cond.end37
  %30 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sil = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %30, i32 0, i32 14
  %31 = load i8, i8* %sil, align 8
  %conv46 = sext i8 %31 to i32
  %cmp47 = icmp slt i32 %conv46, 0
  br i1 %cmp47, label %if.then49, label %if.end

if.then49:                                        ; preds = %if.then
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %32 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %32, i32 0, i32 7
  %33 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone, align 8
  %34 = load i8, i8* %lc.addr, align 1
  %conv50 = sext i8 %34 to i32
  %idxprom51 = sext i32 %conv50 to i64
  %arrayidx52 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %33, i64 %idxprom51
  %filler = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx52, i32 0, i32 1
  %35 = load i32, i32* %filler, align 8
  %tobool53 = icmp ne i32 %35, 0
  br i1 %tobool53, label %cond.true54, label %cond.false57

cond.true54:                                      ; preds = %if.end
  %36 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sil55 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %36, i32 0, i32 14
  %37 = load i8, i8* %sil55, align 8
  %conv56 = sext i8 %37 to i32
  br label %cond.end59

cond.false57:                                     ; preds = %if.end
  %38 = load i8, i8* %lc.addr, align 1
  %conv58 = sext i8 %38 to i32
  br label %cond.end59

cond.end59:                                       ; preds = %cond.false57, %cond.true54
  %cond = phi i32 [ %conv56, %cond.true54 ], [ %conv58, %cond.false57 ]
  %conv60 = trunc i32 %cond to i8
  store i8 %conv60, i8* %newl, align 1
  %39 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone61 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %39, i32 0, i32 7
  %40 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone61, align 8
  %41 = load i8, i8* %rc.addr, align 1
  %conv62 = sext i8 %41 to i32
  %idxprom63 = sext i32 %conv62 to i64
  %arrayidx64 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %40, i64 %idxprom63
  %filler65 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx64, i32 0, i32 1
  %42 = load i32, i32* %filler65, align 8
  %tobool66 = icmp ne i32 %42, 0
  br i1 %tobool66, label %cond.true67, label %cond.false70

cond.true67:                                      ; preds = %cond.end59
  %43 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sil68 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %43, i32 0, i32 14
  %44 = load i8, i8* %sil68, align 8
  %conv69 = sext i8 %44 to i32
  br label %cond.end72

cond.false70:                                     ; preds = %cond.end59
  %45 = load i8, i8* %rc.addr, align 1
  %conv71 = sext i8 %45 to i32
  br label %cond.end72

cond.end72:                                       ; preds = %cond.false70, %cond.true67
  %cond73 = phi i32 [ %conv69, %cond.true67 ], [ %conv71, %cond.false70 ]
  %conv74 = trunc i32 %cond73 to i8
  store i8 %conv74, i8* %newr, align 1
  %46 = load i8, i8* %newl, align 1
  %conv75 = sext i8 %46 to i32
  %47 = load i8, i8* %lc.addr, align 1
  %conv76 = sext i8 %47 to i32
  %cmp77 = icmp eq i32 %conv75, %conv76
  br i1 %cmp77, label %land.lhs.true79, label %if.end85

land.lhs.true79:                                  ; preds = %cond.end72
  %48 = load i8, i8* %newr, align 1
  %conv80 = sext i8 %48 to i32
  %49 = load i8, i8* %rc.addr, align 1
  %conv81 = sext i8 %49 to i32
  %cmp82 = icmp eq i32 %conv80, %conv81
  br i1 %cmp82, label %if.then84, label %if.end85

if.then84:                                        ; preds = %land.lhs.true79
  store i32 -1, i32* %retval, align 4
  br label %return

if.end85:                                         ; preds = %land.lhs.true79, %cond.end72
  %50 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %51 = load i8, i8* %ci.addr, align 1
  %52 = load i8, i8* %newl, align 1
  %53 = load i8, i8* %newr, align 1
  %54 = load i32, i32* %wpos.addr, align 4
  %call86 = call i32 @mdef_phone_id(%struct.mdef_t* %50, i8 signext %51, i8 signext %52, i8 signext %53, i32 %54)
  store i32 %call86, i32* %retval, align 4
  br label %return

if.end87:                                         ; preds = %lor.lhs.false
  %55 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %pid = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %55, i32 0, i32 1
  %56 = load i32, i32* %pid, align 4
  store i32 %56, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end87, %if.end85, %if.then84, %if.then49
  %57 = load i32, i32* %retval, align 4
  ret i32 %57
}

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct.ph_lc_s* @find_ph_lc(%struct.ph_lc_s* %lclist, i8 signext %lc) #0 {
entry:
  %lclist.addr = alloca %struct.ph_lc_s*, align 8
  %lc.addr = alloca i8, align 1
  %lcptr = alloca %struct.ph_lc_s*, align 8
  store %struct.ph_lc_s* %lclist, %struct.ph_lc_s** %lclist.addr, align 8
  store i8 %lc, i8* %lc.addr, align 1
  %0 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lclist.addr, align 8
  store %struct.ph_lc_s* %0, %struct.ph_lc_s** %lcptr, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %tobool = icmp ne %struct.ph_lc_s* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %2 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %lc1 = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %2, i32 0, i32 0
  %3 = load i8, i8* %lc1, align 8
  %conv = sext i8 %3 to i32
  %4 = load i8, i8* %lc.addr, align 1
  %conv2 = sext i8 %4 to i32
  %cmp = icmp ne i32 %conv, %conv2
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %5 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ]
  br i1 %5, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %next = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %6, i32 0, i32 2
  %7 = load %struct.ph_lc_s*, %struct.ph_lc_s** %next, align 8
  store %struct.ph_lc_s* %7, %struct.ph_lc_s** %lcptr, align 8
  br label %for.cond

for.end:                                          ; preds = %land.end
  %8 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  ret %struct.ph_lc_s* %8
}

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct.ph_rc_s* @find_ph_rc(%struct.ph_rc_s* %rclist, i8 signext %rc) #0 {
entry:
  %rclist.addr = alloca %struct.ph_rc_s*, align 8
  %rc.addr = alloca i8, align 1
  %rcptr = alloca %struct.ph_rc_s*, align 8
  store %struct.ph_rc_s* %rclist, %struct.ph_rc_s** %rclist.addr, align 8
  store i8 %rc, i8* %rc.addr, align 1
  %0 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rclist.addr, align 8
  store %struct.ph_rc_s* %0, %struct.ph_rc_s** %rcptr, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %tobool = icmp ne %struct.ph_rc_s* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %2 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %rc1 = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %2, i32 0, i32 0
  %3 = load i8, i8* %rc1, align 8
  %conv = sext i8 %3 to i32
  %4 = load i8, i8* %rc.addr, align 1
  %conv2 = sext i8 %4 to i32
  %cmp = icmp ne i32 %conv, %conv2
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %5 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ]
  br i1 %5, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %next = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %6, i32 0, i32 2
  %7 = load %struct.ph_rc_s*, %struct.ph_rc_s** %next, align 8
  store %struct.ph_rc_s* %7, %struct.ph_rc_s** %rcptr, align 8
  br label %for.cond

for.end:                                          ; preds = %land.end
  %8 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  ret %struct.ph_rc_s* %8
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mdef_phone_id_nearest(%struct.mdef_t* %m, i8 signext %b, i8 signext %l, i8 signext %r, i32 %pos) #0 {
entry:
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
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  store i8 %b, i8* %b.addr, align 1
  store i8 %l, i8* %l.addr, align 1
  store i8 %r, i8* %r.addr, align 1
  store i32 %pos, i32* %pos.addr, align 4
  %0 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %tobool = icmp ne %struct.mdef_t* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 286, i8* getelementptr inbounds ([86 x i8], [86 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id_nearest, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %1, %cond.true
  %2 = load i8, i8* %b.addr, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp sge i32 %conv, 0
  br i1 %cmp, label %land.lhs.true, label %cond.false6

land.lhs.true:                                    ; preds = %cond.end
  %3 = load i8, i8* %b.addr, align 1
  %conv2 = sext i8 %3 to i32
  %4 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %4, i32 0, i32 0
  %5 = load i32, i32* %n_ciphone, align 8
  %cmp3 = icmp slt i32 %conv2, %5
  br i1 %cmp3, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %land.lhs.true
  br label %cond.end7

cond.false6:                                      ; preds = %land.lhs.true, %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 287, i8* getelementptr inbounds ([86 x i8], [86 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id_nearest, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end7

cond.end7:                                        ; preds = %6, %cond.true5
  %7 = load i32, i32* %pos.addr, align 4
  %cmp8 = icmp uge i32 %7, 0
  br i1 %cmp8, label %land.lhs.true10, label %cond.false14

land.lhs.true10:                                  ; preds = %cond.end7
  %8 = load i32, i32* %pos.addr, align 4
  %cmp11 = icmp ult i32 %8, 4
  br i1 %cmp11, label %cond.true13, label %cond.false14

cond.true13:                                      ; preds = %land.lhs.true10
  br label %cond.end15

cond.false14:                                     ; preds = %land.lhs.true10, %cond.end7
  call void @__assert_fail(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 288, i8* getelementptr inbounds ([86 x i8], [86 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id_nearest, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end15

cond.end15:                                       ; preds = %9, %cond.true13
  %10 = load i8, i8* %l.addr, align 1
  %conv16 = sext i8 %10 to i32
  %cmp17 = icmp slt i32 %conv16, 0
  br i1 %cmp17, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end15
  %11 = load i8, i8* %r.addr, align 1
  %conv19 = sext i8 %11 to i32
  %cmp20 = icmp slt i32 %conv19, 0
  br i1 %cmp20, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %cond.end15
  %12 = load i8, i8* %b.addr, align 1
  %conv22 = sext i8 %12 to i32
  store i32 %conv22, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %13 = load i8, i8* %l.addr, align 1
  %conv23 = sext i8 %13 to i32
  %cmp24 = icmp sge i32 %conv23, 0
  br i1 %cmp24, label %land.lhs.true26, label %cond.false32

land.lhs.true26:                                  ; preds = %if.end
  %14 = load i8, i8* %l.addr, align 1
  %conv27 = sext i8 %14 to i32
  %15 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone28 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %15, i32 0, i32 0
  %16 = load i32, i32* %n_ciphone28, align 8
  %cmp29 = icmp slt i32 %conv27, %16
  br i1 %cmp29, label %cond.true31, label %cond.false32

cond.true31:                                      ; preds = %land.lhs.true26
  br label %cond.end33

cond.false32:                                     ; preds = %land.lhs.true26, %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 293, i8* getelementptr inbounds ([86 x i8], [86 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id_nearest, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end33

cond.end33:                                       ; preds = %17, %cond.true31
  %18 = load i8, i8* %r.addr, align 1
  %conv34 = sext i8 %18 to i32
  %cmp35 = icmp sge i32 %conv34, 0
  br i1 %cmp35, label %land.lhs.true37, label %cond.false43

land.lhs.true37:                                  ; preds = %cond.end33
  %19 = load i8, i8* %r.addr, align 1
  %conv38 = sext i8 %19 to i32
  %20 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone39 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %20, i32 0, i32 0
  %21 = load i32, i32* %n_ciphone39, align 8
  %cmp40 = icmp slt i32 %conv38, %21
  br i1 %cmp40, label %cond.true42, label %cond.false43

cond.true42:                                      ; preds = %land.lhs.true37
  br label %cond.end44

cond.false43:                                     ; preds = %land.lhs.true37, %cond.end33
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 294, i8* getelementptr inbounds ([86 x i8], [86 x i8]* @__PRETTY_FUNCTION__.mdef_phone_id_nearest, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end44

cond.end44:                                       ; preds = %22, %cond.true42
  %23 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %24 = load i8, i8* %b.addr, align 1
  %25 = load i8, i8* %l.addr, align 1
  %26 = load i8, i8* %r.addr, align 1
  %27 = load i32, i32* %pos.addr, align 4
  %call = call i32 @mdef_phone_id(%struct.mdef_t* %23, i8 signext %24, i8 signext %25, i8 signext %26, i32 %27)
  store i32 %call, i32* %p, align 4
  %28 = load i32, i32* %p, align 4
  %cmp45 = icmp sge i32 %28, 0
  br i1 %cmp45, label %if.then47, label %if.end48

if.then47:                                        ; preds = %cond.end44
  %29 = load i32, i32* %p, align 4
  store i32 %29, i32* %retval, align 4
  br label %return

if.end48:                                         ; preds = %cond.end44
  store i32 0, i32* %tmppos, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end48
  %30 = load i32, i32* %tmppos, align 4
  %cmp49 = icmp ult i32 %30, 4
  br i1 %cmp49, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %31 = load i32, i32* %tmppos, align 4
  %32 = load i32, i32* %pos.addr, align 4
  %cmp51 = icmp ne i32 %31, %32
  br i1 %cmp51, label %if.then53, label %if.end59

if.then53:                                        ; preds = %for.body
  %33 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %34 = load i8, i8* %b.addr, align 1
  %35 = load i8, i8* %l.addr, align 1
  %36 = load i8, i8* %r.addr, align 1
  %37 = load i32, i32* %tmppos, align 4
  %call54 = call i32 @mdef_phone_id(%struct.mdef_t* %33, i8 signext %34, i8 signext %35, i8 signext %36, i32 %37)
  store i32 %call54, i32* %p, align 4
  %38 = load i32, i32* %p, align 4
  %cmp55 = icmp sge i32 %38, 0
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.then53
  %39 = load i32, i32* %p, align 4
  store i32 %39, i32* %retval, align 4
  br label %return

if.end58:                                         ; preds = %if.then53
  br label %if.end59

if.end59:                                         ; preds = %if.end58, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end59
  %40 = load i32, i32* %tmppos, align 4
  %inc = add i32 %40, 1
  store i32 %inc, i32* %tmppos, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %41 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sil = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %41, i32 0, i32 14
  %42 = load i8, i8* %sil, align 8
  %conv60 = sext i8 %42 to i32
  %cmp61 = icmp sge i32 %conv60, 0
  br i1 %cmp61, label %if.then63, label %if.end119

if.then63:                                        ; preds = %for.end
  %43 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %43, i32 0, i32 7
  %44 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone, align 8
  %45 = load i8, i8* %l.addr, align 1
  %conv64 = sext i8 %45 to i32
  %idxprom = sext i32 %conv64 to i64
  %arrayidx = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %44, i64 %idxprom
  %filler = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx, i32 0, i32 1
  %46 = load i32, i32* %filler, align 8
  %tobool65 = icmp ne i32 %46, 0
  br i1 %tobool65, label %cond.true66, label %cond.false69

cond.true66:                                      ; preds = %if.then63
  %47 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sil67 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %47, i32 0, i32 14
  %48 = load i8, i8* %sil67, align 8
  %conv68 = sext i8 %48 to i32
  br label %cond.end71

cond.false69:                                     ; preds = %if.then63
  %49 = load i8, i8* %l.addr, align 1
  %conv70 = sext i8 %49 to i32
  br label %cond.end71

cond.end71:                                       ; preds = %cond.false69, %cond.true66
  %cond = phi i32 [ %conv68, %cond.true66 ], [ %conv70, %cond.false69 ]
  %conv72 = trunc i32 %cond to i8
  store i8 %conv72, i8* %newl, align 1
  %50 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone73 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %50, i32 0, i32 7
  %51 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone73, align 8
  %52 = load i8, i8* %r.addr, align 1
  %conv74 = sext i8 %52 to i32
  %idxprom75 = sext i32 %conv74 to i64
  %arrayidx76 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %51, i64 %idxprom75
  %filler77 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx76, i32 0, i32 1
  %53 = load i32, i32* %filler77, align 8
  %tobool78 = icmp ne i32 %53, 0
  br i1 %tobool78, label %cond.true79, label %cond.false82

cond.true79:                                      ; preds = %cond.end71
  %54 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sil80 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %54, i32 0, i32 14
  %55 = load i8, i8* %sil80, align 8
  %conv81 = sext i8 %55 to i32
  br label %cond.end84

cond.false82:                                     ; preds = %cond.end71
  %56 = load i8, i8* %r.addr, align 1
  %conv83 = sext i8 %56 to i32
  br label %cond.end84

cond.end84:                                       ; preds = %cond.false82, %cond.true79
  %cond85 = phi i32 [ %conv81, %cond.true79 ], [ %conv83, %cond.false82 ]
  %conv86 = trunc i32 %cond85 to i8
  store i8 %conv86, i8* %newr, align 1
  %57 = load i8, i8* %newl, align 1
  %conv87 = sext i8 %57 to i32
  %58 = load i8, i8* %l.addr, align 1
  %conv88 = sext i8 %58 to i32
  %cmp89 = icmp ne i32 %conv87, %conv88
  br i1 %cmp89, label %if.then96, label %lor.lhs.false91

lor.lhs.false91:                                  ; preds = %cond.end84
  %59 = load i8, i8* %newr, align 1
  %conv92 = sext i8 %59 to i32
  %60 = load i8, i8* %r.addr, align 1
  %conv93 = sext i8 %60 to i32
  %cmp94 = icmp ne i32 %conv92, %conv93
  br i1 %cmp94, label %if.then96, label %if.end118

if.then96:                                        ; preds = %lor.lhs.false91, %cond.end84
  %61 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %62 = load i8, i8* %b.addr, align 1
  %63 = load i8, i8* %newl, align 1
  %64 = load i8, i8* %newr, align 1
  %65 = load i32, i32* %pos.addr, align 4
  %call97 = call i32 @mdef_phone_id(%struct.mdef_t* %61, i8 signext %62, i8 signext %63, i8 signext %64, i32 %65)
  store i32 %call97, i32* %p, align 4
  %66 = load i32, i32* %p, align 4
  %cmp98 = icmp sge i32 %66, 0
  br i1 %cmp98, label %if.then100, label %if.end101

if.then100:                                       ; preds = %if.then96
  %67 = load i32, i32* %p, align 4
  store i32 %67, i32* %retval, align 4
  br label %return

if.end101:                                        ; preds = %if.then96
  store i32 0, i32* %tmppos, align 4
  br label %for.cond102

for.cond102:                                      ; preds = %for.inc115, %if.end101
  %68 = load i32, i32* %tmppos, align 4
  %cmp103 = icmp ult i32 %68, 4
  br i1 %cmp103, label %for.body105, label %for.end117

for.body105:                                      ; preds = %for.cond102
  %69 = load i32, i32* %tmppos, align 4
  %70 = load i32, i32* %pos.addr, align 4
  %cmp106 = icmp ne i32 %69, %70
  br i1 %cmp106, label %if.then108, label %if.end114

if.then108:                                       ; preds = %for.body105
  %71 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %72 = load i8, i8* %b.addr, align 1
  %73 = load i8, i8* %newl, align 1
  %74 = load i8, i8* %newr, align 1
  %75 = load i32, i32* %tmppos, align 4
  %call109 = call i32 @mdef_phone_id(%struct.mdef_t* %71, i8 signext %72, i8 signext %73, i8 signext %74, i32 %75)
  store i32 %call109, i32* %p, align 4
  %76 = load i32, i32* %p, align 4
  %cmp110 = icmp sge i32 %76, 0
  br i1 %cmp110, label %if.then112, label %if.end113

if.then112:                                       ; preds = %if.then108
  %77 = load i32, i32* %p, align 4
  store i32 %77, i32* %retval, align 4
  br label %return

if.end113:                                        ; preds = %if.then108
  br label %if.end114

if.end114:                                        ; preds = %if.end113, %for.body105
  br label %for.inc115

for.inc115:                                       ; preds = %if.end114
  %78 = load i32, i32* %tmppos, align 4
  %inc116 = add i32 %78, 1
  store i32 %inc116, i32* %tmppos, align 4
  br label %for.cond102

for.end117:                                       ; preds = %for.cond102
  br label %if.end118

if.end118:                                        ; preds = %for.end117, %lor.lhs.false91
  br label %if.end119

if.end119:                                        ; preds = %if.end118, %for.end
  %79 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %79, i32 0, i32 1
  %80 = load i32, i32* %n_phone, align 4
  %81 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone120 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %81, i32 0, i32 0
  %82 = load i32, i32* %n_ciphone120, align 8
  %cmp121 = icmp sgt i32 %80, %82
  br i1 %cmp121, label %land.lhs.true123, label %if.end131

land.lhs.true123:                                 ; preds = %if.end119
  %83 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone124 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %83, i32 0, i32 7
  %84 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone124, align 8
  %85 = load i8, i8* %b.addr, align 1
  %conv125 = sext i8 %85 to i32
  %idxprom126 = sext i32 %conv125 to i64
  %arrayidx127 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %84, i64 %idxprom126
  %filler128 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx127, i32 0, i32 1
  %86 = load i32, i32* %filler128, align 8
  %tobool129 = icmp ne i32 %86, 0
  br i1 %tobool129, label %if.end131, label %if.then130

if.then130:                                       ; preds = %land.lhs.true123
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0), i8** %wpos_name, align 8
  br label %if.end131

if.end131:                                        ; preds = %if.then130, %land.lhs.true123, %if.end119
  %87 = load i8, i8* %b.addr, align 1
  %conv132 = sext i8 %87 to i32
  store i32 %conv132, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end131, %if.then112, %if.then100, %if.then57, %if.then47, %if.then
  %88 = load i32, i32* %retval, align 4
  ret i32 %88
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mdef_phone_components(%struct.mdef_t* %m, i32 %p, i8* %b, i8* %l, i8* %r, i32* %pos) #0 {
entry:
  %m.addr = alloca %struct.mdef_t*, align 8
  %p.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %l.addr = alloca i8*, align 8
  %r.addr = alloca i8*, align 8
  %pos.addr = alloca i32*, align 8
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  store i32 %p, i32* %p.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i8* %l, i8** %l.addr, align 8
  store i8* %r, i8** %r.addr, align 8
  store i32* %pos, i32** %pos.addr, align 8
  %0 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %tobool = icmp ne %struct.mdef_t* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 350, i8* getelementptr inbounds ([101 x i8], [101 x i8]* @__PRETTY_FUNCTION__.mdef_phone_components, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %1, %cond.true
  %2 = load i32, i32* %p.addr, align 4
  %cmp = icmp sge i32 %2, 0
  br i1 %cmp, label %land.lhs.true, label %cond.false3

land.lhs.true:                                    ; preds = %cond.end
  %3 = load i32, i32* %p.addr, align 4
  %4 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %4, i32 0, i32 1
  %5 = load i32, i32* %n_phone, align 4
  %cmp1 = icmp slt i32 %3, %5
  br i1 %cmp1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %land.lhs.true
  br label %cond.end4

cond.false3:                                      ; preds = %land.lhs.true, %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 351, i8* getelementptr inbounds ([101 x i8], [101 x i8]* @__PRETTY_FUNCTION__.mdef_phone_components, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end4

cond.end4:                                        ; preds = %6, %cond.true2
  %7 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %7, i32 0, i32 8
  %8 = load %struct.phone_t*, %struct.phone_t** %phone, align 8
  %9 = load i32, i32* %p.addr, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds %struct.phone_t, %struct.phone_t* %8, i64 %idxprom
  %ci = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx, i32 0, i32 2
  %10 = load i8, i8* %ci, align 4
  %11 = load i8*, i8** %b.addr, align 8
  store i8 %10, i8* %11, align 1
  %12 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone5 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %12, i32 0, i32 8
  %13 = load %struct.phone_t*, %struct.phone_t** %phone5, align 8
  %14 = load i32, i32* %p.addr, align 4
  %idxprom6 = sext i32 %14 to i64
  %arrayidx7 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %13, i64 %idxprom6
  %lc = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx7, i32 0, i32 3
  %15 = load i8, i8* %lc, align 1
  %16 = load i8*, i8** %l.addr, align 8
  store i8 %15, i8* %16, align 1
  %17 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone8 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %17, i32 0, i32 8
  %18 = load %struct.phone_t*, %struct.phone_t** %phone8, align 8
  %19 = load i32, i32* %p.addr, align 4
  %idxprom9 = sext i32 %19 to i64
  %arrayidx10 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %18, i64 %idxprom9
  %rc = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx10, i32 0, i32 4
  %20 = load i8, i8* %rc, align 2
  %21 = load i8*, i8** %r.addr, align 8
  store i8 %20, i8* %21, align 1
  %22 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone11 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %22, i32 0, i32 8
  %23 = load %struct.phone_t*, %struct.phone_t** %phone11, align 8
  %24 = load i32, i32* %p.addr, align 4
  %idxprom12 = sext i32 %24 to i64
  %arrayidx13 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %23, i64 %idxprom12
  %wpos = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx13, i32 0, i32 5
  %25 = load i32, i32* %wpos, align 4
  %26 = load i32*, i32** %pos.addr, align 8
  store i32 %25, i32* %26, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mdef_is_ciphone(%struct.mdef_t* %m, i32 %p) #0 {
entry:
  %m.addr = alloca %struct.mdef_t*, align 8
  %p.addr = alloca i32, align 4
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  store i32 %p, i32* %p.addr, align 4
  %0 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %tobool = icmp ne %struct.mdef_t* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 364, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__PRETTY_FUNCTION__.mdef_is_ciphone, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %1, %cond.true
  %2 = load i32, i32* %p.addr, align 4
  %cmp = icmp sge i32 %2, 0
  br i1 %cmp, label %land.lhs.true, label %cond.false3

land.lhs.true:                                    ; preds = %cond.end
  %3 = load i32, i32* %p.addr, align 4
  %4 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %4, i32 0, i32 1
  %5 = load i32, i32* %n_phone, align 4
  %cmp1 = icmp slt i32 %3, %5
  br i1 %cmp1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %land.lhs.true
  br label %cond.end4

cond.false3:                                      ; preds = %land.lhs.true, %cond.end
  call void @__assert_fail(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 365, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__PRETTY_FUNCTION__.mdef_is_ciphone, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end4

cond.end4:                                        ; preds = %6, %cond.true2
  %7 = load i32, i32* %p.addr, align 4
  %8 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %8, i32 0, i32 0
  %9 = load i32, i32* %n_ciphone, align 8
  %cmp5 = icmp slt i32 %7, %9
  %10 = zext i1 %cmp5 to i64
  %cond = select i1 %cmp5, i32 1, i32 0
  ret i32 %cond
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.mdef_t* @mdef_init(i8* %mdeffile) #0 {
entry:
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
  store i8* %mdeffile, i8** %mdeffile.addr, align 8
  %0 = load i8*, i8** %mdeffile.addr, align 8
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 592, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.29, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @_E__pr_info_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 594, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.30, i32 0, i32 0))
  %1 = load i8*, i8** %mdeffile.addr, align 8
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.31, i32 0, i32 0), i8* %1)
  %call = call i8* @__ckd_calloc__(i64 1, i64 104, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 596)
  %2 = bitcast i8* %call to %struct.mdef_t*
  store %struct.mdef_t* %2, %struct.mdef_t** %m, align 8
  %3 = load i8*, i8** %mdeffile.addr, align 8
  %call1 = call %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.32, i32 0, i32 0))
  store %struct._IO_FILE* %call1, %struct._IO_FILE** %fp, align 8
  %cmp = icmp eq %struct._IO_FILE* %call1, null
  br i1 %cmp, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 599, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.33, i32 0, i32 0))
  %4 = load i8*, i8** %mdeffile.addr, align 8
  call void (i8*, ...) @_E__fatal_sys_error(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.34, i32 0, i32 0), i8* %4)
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call4 = call i32 @noncomment_line(i8* %arraydecay, i32 1024, %struct._IO_FILE* %5)
  %cmp5 = icmp slt i32 %call4, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end3
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 602, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %6 = load i8*, i8** %mdeffile.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.35, i32 0, i32 0), i8* %6)
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end3
  %arraydecay8 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %call9 = call i32 @strncmp(i8* %arraydecay8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.36, i32 0, i32 0), i64 3) #8
  %cmp10 = icmp ne i32 %call9, 0
  br i1 %cmp10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %if.end7
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 605, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %arraydecay12 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.37, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.36, i32 0, i32 0), i8* %arraydecay12)
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %if.end7
  store i32 -1, i32* %n_ci, align 4
  store i32 -1, i32* %n_tri, align 4
  store i32 -1, i32* %n_map, align 4
  %7 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %7, i32 0, i32 3
  store i32 -1, i32* %n_ci_sen, align 4
  %8 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %8, i32 0, i32 4
  store i32 -1, i32* %n_sen, align 8
  %9 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_tmat = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %9, i32 0, i32 5
  store i32 -1, i32* %n_tmat, align 4
  br label %do.body

do.body:                                          ; preds = %lor.end, %if.end13
  %arraydecay14 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call15 = call i32 @noncomment_line(i8* %arraydecay14, i32 1024, %struct._IO_FILE* %10)
  %cmp16 = icmp slt i32 %call15, 0
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %do.body
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 616, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.38, i32 0, i32 0))
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %do.body
  %arraydecay19 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %arraydecay20 = getelementptr inbounds [1024 x i8], [1024 x i8]* %tag, i32 0, i32 0
  %call21 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %arraydecay19, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.39, i32 0, i32 0), i32* %n, i8* %arraydecay20) #7
  %cmp22 = icmp ne i32 %call21, 2
  br i1 %cmp22, label %if.then24, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end18
  %11 = load i32, i32* %n, align 4
  %cmp23 = icmp slt i32 %11, 0
  br i1 %cmp23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %lor.lhs.false, %if.end18
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 619, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %arraydecay25 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.40, i32 0, i32 0), i8* %arraydecay25)
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %lor.lhs.false
  %arraydecay27 = getelementptr inbounds [1024 x i8], [1024 x i8]* %tag, i32 0, i32 0
  %call28 = call i32 @strcmp(i8* %arraydecay27, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i32 0, i32 0)) #8
  %cmp29 = icmp eq i32 %call28, 0
  br i1 %cmp29, label %if.then30, label %if.else

if.then30:                                        ; preds = %if.end26
  %12 = load i32, i32* %n, align 4
  store i32 %12, i32* %n_ci, align 4
  br label %if.end65

if.else:                                          ; preds = %if.end26
  %arraydecay31 = getelementptr inbounds [1024 x i8], [1024 x i8]* %tag, i32 0, i32 0
  %call32 = call i32 @strcmp(i8* %arraydecay31, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.42, i32 0, i32 0)) #8
  %cmp33 = icmp eq i32 %call32, 0
  br i1 %cmp33, label %if.then34, label %if.else35

if.then34:                                        ; preds = %if.else
  %13 = load i32, i32* %n, align 4
  store i32 %13, i32* %n_tri, align 4
  br label %if.end64

if.else35:                                        ; preds = %if.else
  %arraydecay36 = getelementptr inbounds [1024 x i8], [1024 x i8]* %tag, i32 0, i32 0
  %call37 = call i32 @strcmp(i8* %arraydecay36, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.43, i32 0, i32 0)) #8
  %cmp38 = icmp eq i32 %call37, 0
  br i1 %cmp38, label %if.then39, label %if.else40

if.then39:                                        ; preds = %if.else35
  %14 = load i32, i32* %n, align 4
  store i32 %14, i32* %n_map, align 4
  br label %if.end63

if.else40:                                        ; preds = %if.else35
  %arraydecay41 = getelementptr inbounds [1024 x i8], [1024 x i8]* %tag, i32 0, i32 0
  %call42 = call i32 @strcmp(i8* %arraydecay41, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.44, i32 0, i32 0)) #8
  %cmp43 = icmp eq i32 %call42, 0
  br i1 %cmp43, label %if.then44, label %if.else46

if.then44:                                        ; preds = %if.else40
  %15 = load i32, i32* %n, align 4
  %16 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen45 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %16, i32 0, i32 3
  store i32 %15, i32* %n_ci_sen45, align 4
  br label %if.end62

if.else46:                                        ; preds = %if.else40
  %arraydecay47 = getelementptr inbounds [1024 x i8], [1024 x i8]* %tag, i32 0, i32 0
  %call48 = call i32 @strcmp(i8* %arraydecay47, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.45, i32 0, i32 0)) #8
  %cmp49 = icmp eq i32 %call48, 0
  br i1 %cmp49, label %if.then50, label %if.else52

if.then50:                                        ; preds = %if.else46
  %17 = load i32, i32* %n, align 4
  %18 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen51 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %18, i32 0, i32 4
  store i32 %17, i32* %n_sen51, align 8
  br label %if.end61

if.else52:                                        ; preds = %if.else46
  %arraydecay53 = getelementptr inbounds [1024 x i8], [1024 x i8]* %tag, i32 0, i32 0
  %call54 = call i32 @strcmp(i8* %arraydecay53, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i32 0, i32 0)) #8
  %cmp55 = icmp eq i32 %call54, 0
  br i1 %cmp55, label %if.then56, label %if.else58

if.then56:                                        ; preds = %if.else52
  %19 = load i32, i32* %n, align 4
  %20 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_tmat57 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %20, i32 0, i32 5
  store i32 %19, i32* %n_tmat57, align 4
  br label %if.end60

if.else58:                                        ; preds = %if.else52
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 634, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %arraydecay59 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
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
  %21 = load i32, i32* %n_ci, align 4
  %cmp66 = icmp slt i32 %21, 0
  br i1 %cmp66, label %lor.end, label %lor.lhs.false67

lor.lhs.false67:                                  ; preds = %do.cond
  %22 = load i32, i32* %n_tri, align 4
  %cmp68 = icmp slt i32 %22, 0
  br i1 %cmp68, label %lor.end, label %lor.lhs.false69

lor.lhs.false69:                                  ; preds = %lor.lhs.false67
  %23 = load i32, i32* %n_map, align 4
  %cmp70 = icmp slt i32 %23, 0
  br i1 %cmp70, label %lor.end, label %lor.lhs.false71

lor.lhs.false71:                                  ; preds = %lor.lhs.false69
  %24 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen72 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %24, i32 0, i32 3
  %25 = load i32, i32* %n_ci_sen72, align 4
  %cmp73 = icmp slt i32 %25, 0
  br i1 %cmp73, label %lor.end, label %lor.lhs.false74

lor.lhs.false74:                                  ; preds = %lor.lhs.false71
  %26 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen75 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %26, i32 0, i32 4
  %27 = load i32, i32* %n_sen75, align 8
  %cmp76 = icmp slt i32 %27, 0
  br i1 %cmp76, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false74
  %28 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_tmat77 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %28, i32 0, i32 5
  %29 = load i32, i32* %n_tmat77, align 4
  %cmp78 = icmp slt i32 %29, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false74, %lor.lhs.false71, %lor.lhs.false69, %lor.lhs.false67, %do.cond
  %30 = phi i1 [ true, %lor.lhs.false74 ], [ true, %lor.lhs.false71 ], [ true, %lor.lhs.false69 ], [ true, %lor.lhs.false67 ], [ true, %do.cond ], [ %cmp78, %lor.rhs ]
  br i1 %30, label %do.body, label %do.end

do.end:                                           ; preds = %lor.end
  %31 = load i32, i32* %n_ci, align 4
  %cmp79 = icmp eq i32 %31, 0
  br i1 %cmp79, label %if.then90, label %lor.lhs.false80

lor.lhs.false80:                                  ; preds = %do.end
  %32 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen81 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %32, i32 0, i32 3
  %33 = load i32, i32* %n_ci_sen81, align 4
  %cmp82 = icmp eq i32 %33, 0
  br i1 %cmp82, label %if.then90, label %lor.lhs.false83

lor.lhs.false83:                                  ; preds = %lor.lhs.false80
  %34 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_tmat84 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %34, i32 0, i32 5
  %35 = load i32, i32* %n_tmat84, align 4
  %cmp85 = icmp eq i32 %35, 0
  br i1 %cmp85, label %if.then90, label %lor.lhs.false86

lor.lhs.false86:                                  ; preds = %lor.lhs.false83
  %36 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen87 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %36, i32 0, i32 3
  %37 = load i32, i32* %n_ci_sen87, align 4
  %38 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen88 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %38, i32 0, i32 4
  %39 = load i32, i32* %n_sen88, align 8
  %cmp89 = icmp sgt i32 %37, %39
  br i1 %cmp89, label %if.then90, label %if.end91

if.then90:                                        ; preds = %lor.lhs.false86, %lor.lhs.false83, %lor.lhs.false80, %do.end
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 639, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %40 = load i8*, i8** %mdeffile.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.48, i32 0, i32 0), i8* %40)
  br label %if.end91

if.end91:                                         ; preds = %if.then90, %lor.lhs.false86
  %41 = load i32, i32* %n_ci, align 4
  %cmp92 = icmp sge i32 %41, 127
  br i1 %cmp92, label %if.then93, label %if.end94

if.then93:                                        ; preds = %if.end91
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 643, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %42 = load i8*, i8** %mdeffile.addr, align 8
  %43 = load i32, i32* %n_ci, align 4
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.49, i32 0, i32 0), i8* %42, i32 %43, i32 127)
  br label %if.end94

if.end94:                                         ; preds = %if.then93, %if.end91
  %44 = load i32, i32* %n_ci, align 4
  %45 = load i32, i32* %n_tri, align 4
  %add = add nsw i32 %44, %45
  %cmp95 = icmp sge i32 %add, 2147483646
  br i1 %cmp95, label %if.then96, label %if.end98

if.then96:                                        ; preds = %if.end94
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 645, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %46 = load i8*, i8** %mdeffile.addr, align 8
  %47 = load i32, i32* %n_ci, align 4
  %48 = load i32, i32* %n_tri, align 4
  %add97 = add nsw i32 %47, %48
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.50, i32 0, i32 0), i8* %46, i32 %add97, i32 2147483646)
  br label %if.end98

if.end98:                                         ; preds = %if.then96, %if.end94
  %49 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen99 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %49, i32 0, i32 4
  %50 = load i32, i32* %n_sen99, align 8
  %cmp100 = icmp sge i32 %50, 32766
  br i1 %cmp100, label %if.then101, label %if.end103

if.then101:                                       ; preds = %if.end98
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 647, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %51 = load i8*, i8** %mdeffile.addr, align 8
  %52 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen102 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %52, i32 0, i32 4
  %53 = load i32, i32* %n_sen102, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.51, i32 0, i32 0), i8* %51, i32 %53, i32 32766)
  br label %if.end103

if.end103:                                        ; preds = %if.then101, %if.end98
  %54 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_tmat104 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %54, i32 0, i32 5
  %55 = load i32, i32* %n_tmat104, align 4
  %cmp105 = icmp sge i32 %55, 2147483646
  br i1 %cmp105, label %if.then106, label %if.end108

if.then106:                                       ; preds = %if.end103
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 649, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %56 = load i8*, i8** %mdeffile.addr, align 8
  %57 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_tmat107 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %57, i32 0, i32 5
  %58 = load i32, i32* %n_tmat107, align 4
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.52, i32 0, i32 0), i8* %56, i32 %58, i32 2147483646)
  br label %if.end108

if.end108:                                        ; preds = %if.then106, %if.end103
  %59 = load i32, i32* %n_map, align 4
  %60 = load i32, i32* %n_ci, align 4
  %61 = load i32, i32* %n_tri, align 4
  %add109 = add nsw i32 %60, %61
  %div = sdiv i32 %59, %add109
  %sub = sub nsw i32 %div, 1
  %62 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_emit_state = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %62, i32 0, i32 2
  store i32 %sub, i32* %n_emit_state, align 8
  %63 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_emit_state110 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %63, i32 0, i32 2
  %64 = load i32, i32* %n_emit_state110, align 8
  %add111 = add nsw i32 %64, 1
  %65 = load i32, i32* %n_ci, align 4
  %66 = load i32, i32* %n_tri, align 4
  %add112 = add nsw i32 %65, %66
  %mul = mul nsw i32 %add111, %add112
  %67 = load i32, i32* %n_map, align 4
  %cmp113 = icmp ne i32 %mul, %67
  br i1 %cmp113, label %if.then114, label %if.end115

if.then114:                                       ; preds = %if.end108
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 653, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.53, i32 0, i32 0))
  br label %if.end115

if.end115:                                        ; preds = %if.then114, %if.end108
  %68 = load i32, i32* %n_ci, align 4
  %69 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %69, i32 0, i32 0
  store i32 %68, i32* %n_ciphone, align 8
  %70 = load i32, i32* %n_ci, align 4
  %call116 = call %struct.hash_table_t* @hash_new(i32 %70, i32 1)
  %71 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %ciphone_ht = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %71, i32 0, i32 6
  store %struct.hash_table_t* %call116, %struct.hash_table_t** %ciphone_ht, align 8
  %72 = load i32, i32* %n_ci, align 4
  %conv = sext i32 %72 to i64
  %call117 = call i8* @__ckd_calloc__(i64 %conv, i64 16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 658)
  %73 = bitcast i8* %call117 to %struct.ciphone_t*
  %74 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %74, i32 0, i32 7
  store %struct.ciphone_t* %73, %struct.ciphone_t** %ciphone, align 8
  %75 = load i32, i32* %n_ci, align 4
  %76 = load i32, i32* %n_tri, align 4
  %add118 = add nsw i32 %75, %76
  %77 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %77, i32 0, i32 1
  store i32 %add118, i32* %n_phone, align 4
  %78 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_phone119 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %78, i32 0, i32 1
  %79 = load i32, i32* %n_phone119, align 4
  %conv120 = sext i32 %79 to i64
  %call121 = call i8* @__ckd_calloc__(i64 %conv120, i64 16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 666)
  %80 = bitcast i8* %call121 to %struct.phone_t*
  %81 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %81, i32 0, i32 8
  store %struct.phone_t* %80, %struct.phone_t** %phone, align 8
  %82 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_phone122 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %82, i32 0, i32 1
  %83 = load i32, i32* %n_phone122, align 4
  %84 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_emit_state123 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %84, i32 0, i32 2
  %85 = load i32, i32* %n_emit_state123, align 8
  %call124 = call i8** @__ckd_calloc_2d__(i32 %83, i32 %85, i32 2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 669)
  %86 = bitcast i8** %call124 to i16**
  store i16** %86, i16*** %senmap, align 8
  %87 = load i16**, i16*** %senmap, align 8
  %88 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sseq = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %88, i32 0, i32 9
  store i16** %87, i16*** %sseq, align 8
  %89 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone125 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %89, i32 0, i32 0
  %90 = load i32, i32* %n_ciphone125, align 8
  %call126 = call i8** @__ckd_calloc_2d__(i32 4, i32 %90, i32 8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 673)
  %91 = bitcast i8** %call126 to %struct.ph_lc_s***
  %92 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %wpos_ci_lclist = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %92, i32 0, i32 15
  store %struct.ph_lc_s*** %91, %struct.ph_lc_s**** %wpos_ci_lclist, align 8
  store i32 0, i32* %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end115
  %93 = load i32, i32* %p, align 4
  %94 = load i32, i32* %n_ci, align 4
  %cmp127 = icmp slt i32 %93, %94
  br i1 %cmp127, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay129 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call130 = call i32 @noncomment_line(i8* %arraydecay129, i32 1024, %struct._IO_FILE* %95)
  %cmp131 = icmp slt i32 %call130, 0
  br i1 %cmp131, label %if.then133, label %if.end134

if.then133:                                       ; preds = %for.body
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 683, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %96 = load i32, i32* %p, align 4
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.54, i32 0, i32 0), i32 %96)
  br label %if.end134

if.end134:                                        ; preds = %if.then133, %for.body
  %97 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %arraydecay135 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %98 = load i32, i32* %p, align 4
  call void @parse_base_line(%struct.mdef_t* %97, i8* %arraydecay135, i32 %98)
  br label %for.inc

for.inc:                                          ; preds = %if.end134
  %99 = load i32, i32* %p, align 4
  %inc = add nsw i32 %99, 1
  store i32 %inc, i32* %p, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %100 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %call136 = call signext i8 @mdef_ciphone_id(%struct.mdef_t* %100, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.55, i32 0, i32 0))
  %101 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sil = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %101, i32 0, i32 14
  store i8 %call136, i8* %sil, align 8
  br label %for.cond137

for.cond137:                                      ; preds = %for.inc149, %for.end
  %102 = load i32, i32* %p, align 4
  %103 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_phone138 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %103, i32 0, i32 1
  %104 = load i32, i32* %n_phone138, align 4
  %cmp139 = icmp slt i32 %102, %104
  br i1 %cmp139, label %for.body141, label %for.end151

for.body141:                                      ; preds = %for.cond137
  %arraydecay142 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %105 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call143 = call i32 @noncomment_line(i8* %arraydecay142, i32 1024, %struct._IO_FILE* %105)
  %cmp144 = icmp slt i32 %call143, 0
  br i1 %cmp144, label %if.then146, label %if.end147

if.then146:                                       ; preds = %for.body141
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 691, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %106 = load i32, i32* %p, align 4
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.56, i32 0, i32 0), i32 %106)
  br label %if.end147

if.end147:                                        ; preds = %if.then146, %for.body141
  %107 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %arraydecay148 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %108 = load i32, i32* %p, align 4
  call void @parse_tri_line(%struct.mdef_t* %107, i8* %arraydecay148, i32 %108)
  br label %for.inc149

for.inc149:                                       ; preds = %if.end147
  %109 = load i32, i32* %p, align 4
  %inc150 = add nsw i32 %109, 1
  store i32 %inc150, i32* %p, align 4
  br label %for.cond137

for.end151:                                       ; preds = %for.cond137
  %arraydecay152 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buf, i32 0, i32 0
  %110 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call153 = call i32 @noncomment_line(i8* %arraydecay152, i32 1024, %struct._IO_FILE* %110)
  %cmp154 = icmp sge i32 %call153, 0
  br i1 %cmp154, label %if.then156, label %if.end158

if.then156:                                       ; preds = %for.end151
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 696, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.57, i32 0, i32 0))
  %111 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_phone157 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %111, i32 0, i32 1
  %112 = load i32, i32* %n_phone157, align 4
  call void (i8*, ...) @_E__pr_warn(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.58, i32 0, i32 0), i32 %112)
  br label %if.end158

if.end158:                                        ; preds = %if.then156, %for.end151
  %113 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone159 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %113, i32 0, i32 0
  %114 = load i32, i32* %n_ciphone159, align 8
  %115 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_emit_state160 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %115, i32 0, i32 2
  %116 = load i32, i32* %n_emit_state160, align 8
  %mul161 = mul nsw i32 %114, %116
  %117 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen162 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %117, i32 0, i32 3
  %118 = load i32, i32* %n_ci_sen162, align 4
  %cmp163 = icmp ne i32 %mul161, %118
  br i1 %cmp163, label %if.then165, label %if.end169

if.then165:                                       ; preds = %if.end158
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 700, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %119 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen166 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %119, i32 0, i32 3
  %120 = load i32, i32* %n_ci_sen166, align 4
  %121 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone167 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %121, i32 0, i32 0
  %122 = load i32, i32* %n_ciphone167, align 8
  %123 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_emit_state168 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %123, i32 0, i32 2
  %124 = load i32, i32* %n_emit_state168, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.59, i32 0, i32 0), i32 %120, i32 %122, i32 %124)
  br label %if.end169

if.end169:                                        ; preds = %if.then165, %if.end158
  %125 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen170 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %125, i32 0, i32 4
  %126 = load i32, i32* %n_sen170, align 8
  %conv171 = sext i32 %126 to i64
  %call172 = call i8* @__ckd_calloc__(i64 %conv171, i64 2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 702)
  %127 = bitcast i8* %call172 to i16*
  %128 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %cd2cisen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %128, i32 0, i32 11
  store i16* %127, i16** %cd2cisen, align 8
  %129 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen173 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %129, i32 0, i32 4
  %130 = load i32, i32* %n_sen173, align 8
  %conv174 = sext i32 %130 to i64
  %call175 = call i8* @__ckd_calloc__(i64 %conv174, i64 1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 704)
  %131 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %131, i32 0, i32 12
  store i8* %call175, i8** %sen2cimap, align 8
  store i32 0, i32* %s, align 4
  br label %for.cond176

for.cond176:                                      ; preds = %for.inc182, %if.end169
  %132 = load i32, i32* %s, align 4
  %133 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen177 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %133, i32 0, i32 4
  %134 = load i32, i32* %n_sen177, align 8
  %cmp178 = icmp slt i32 %132, %134
  br i1 %cmp178, label %for.body180, label %for.end184

for.body180:                                      ; preds = %for.cond176
  %135 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap181 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %135, i32 0, i32 12
  %136 = load i8*, i8** %sen2cimap181, align 8
  %137 = load i32, i32* %s, align 4
  %idxprom = sext i32 %137 to i64
  %arrayidx = getelementptr inbounds i8, i8* %136, i64 %idxprom
  store i8 -1, i8* %arrayidx, align 1
  br label %for.inc182

for.inc182:                                       ; preds = %for.body180
  %138 = load i32, i32* %s, align 4
  %inc183 = add nsw i32 %138, 1
  store i32 %inc183, i32* %s, align 4
  br label %for.cond176

for.end184:                                       ; preds = %for.cond176
  store i32 0, i32* %s, align 4
  br label %for.cond185

for.cond185:                                      ; preds = %for.inc200, %for.end184
  %139 = load i32, i32* %s, align 4
  %140 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen186 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %140, i32 0, i32 3
  %141 = load i32, i32* %n_ci_sen186, align 4
  %cmp187 = icmp slt i32 %139, %141
  br i1 %cmp187, label %for.body189, label %for.end202

for.body189:                                      ; preds = %for.cond185
  %142 = load i32, i32* %s, align 4
  %conv190 = trunc i32 %142 to i16
  %143 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %cd2cisen191 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %143, i32 0, i32 11
  %144 = load i16*, i16** %cd2cisen191, align 8
  %145 = load i32, i32* %s, align 4
  %idxprom192 = sext i32 %145 to i64
  %arrayidx193 = getelementptr inbounds i16, i16* %144, i64 %idxprom192
  store i16 %conv190, i16* %arrayidx193, align 2
  %146 = load i32, i32* %s, align 4
  %147 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_emit_state194 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %147, i32 0, i32 2
  %148 = load i32, i32* %n_emit_state194, align 8
  %div195 = sdiv i32 %146, %148
  %conv196 = trunc i32 %div195 to i8
  %149 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap197 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %149, i32 0, i32 12
  %150 = load i8*, i8** %sen2cimap197, align 8
  %151 = load i32, i32* %s, align 4
  %idxprom198 = sext i32 %151 to i64
  %arrayidx199 = getelementptr inbounds i8, i8* %150, i64 %idxprom198
  store i8 %conv196, i8* %arrayidx199, align 1
  br label %for.inc200

for.inc200:                                       ; preds = %for.body189
  %152 = load i32, i32* %s, align 4
  %inc201 = add nsw i32 %152, 1
  store i32 %inc201, i32* %s, align 4
  br label %for.cond185

for.end202:                                       ; preds = %for.cond185
  %153 = load i32, i32* %n_ci, align 4
  store i32 %153, i32* %p, align 4
  br label %for.cond203

for.cond203:                                      ; preds = %for.inc244, %for.end202
  %154 = load i32, i32* %p, align 4
  %155 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_phone204 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %155, i32 0, i32 1
  %156 = load i32, i32* %n_phone204, align 4
  %cmp205 = icmp slt i32 %154, %156
  br i1 %cmp205, label %for.body207, label %for.end246

for.body207:                                      ; preds = %for.cond203
  store i32 0, i32* %s, align 4
  br label %for.cond208

for.cond208:                                      ; preds = %for.inc241, %for.body207
  %157 = load i32, i32* %s, align 4
  %158 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_emit_state209 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %158, i32 0, i32 2
  %159 = load i32, i32* %n_emit_state209, align 8
  %cmp210 = icmp slt i32 %157, %159
  br i1 %cmp210, label %for.body212, label %for.end243

for.body212:                                      ; preds = %for.cond208
  %160 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sseq213 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %160, i32 0, i32 9
  %161 = load i16**, i16*** %sseq213, align 8
  %162 = load i32, i32* %p, align 4
  %idxprom214 = sext i32 %162 to i64
  %arrayidx215 = getelementptr inbounds i16*, i16** %161, i64 %idxprom214
  %163 = load i16*, i16** %arrayidx215, align 8
  %164 = load i32, i32* %s, align 4
  %idxprom216 = sext i32 %164 to i64
  %arrayidx217 = getelementptr inbounds i16, i16* %163, i64 %idxprom216
  %165 = load i16, i16* %arrayidx217, align 2
  %conv218 = sext i16 %165 to i32
  store i32 %conv218, i32* %cd, align 4
  %166 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sseq219 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %166, i32 0, i32 9
  %167 = load i16**, i16*** %sseq219, align 8
  %168 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %phone220 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %168, i32 0, i32 8
  %169 = load %struct.phone_t*, %struct.phone_t** %phone220, align 8
  %170 = load i32, i32* %p, align 4
  %idxprom221 = sext i32 %170 to i64
  %arrayidx222 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %169, i64 %idxprom221
  %ci223 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx222, i32 0, i32 2
  %171 = load i8, i8* %ci223, align 4
  %conv224 = sext i8 %171 to i32
  %idxprom225 = sext i32 %conv224 to i64
  %arrayidx226 = getelementptr inbounds i16*, i16** %167, i64 %idxprom225
  %172 = load i16*, i16** %arrayidx226, align 8
  %173 = load i32, i32* %s, align 4
  %idxprom227 = sext i32 %173 to i64
  %arrayidx228 = getelementptr inbounds i16, i16* %172, i64 %idxprom227
  %174 = load i16, i16* %arrayidx228, align 2
  %conv229 = sext i16 %174 to i32
  store i32 %conv229, i32* %ci, align 4
  %175 = load i32, i32* %ci, align 4
  %conv230 = trunc i32 %175 to i16
  %176 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %cd2cisen231 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %176, i32 0, i32 11
  %177 = load i16*, i16** %cd2cisen231, align 8
  %178 = load i32, i32* %cd, align 4
  %idxprom232 = sext i32 %178 to i64
  %arrayidx233 = getelementptr inbounds i16, i16* %177, i64 %idxprom232
  store i16 %conv230, i16* %arrayidx233, align 2
  %179 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %phone234 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %179, i32 0, i32 8
  %180 = load %struct.phone_t*, %struct.phone_t** %phone234, align 8
  %181 = load i32, i32* %p, align 4
  %idxprom235 = sext i32 %181 to i64
  %arrayidx236 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %180, i64 %idxprom235
  %ci237 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx236, i32 0, i32 2
  %182 = load i8, i8* %ci237, align 4
  %183 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap238 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %183, i32 0, i32 12
  %184 = load i8*, i8** %sen2cimap238, align 8
  %185 = load i32, i32* %cd, align 4
  %idxprom239 = sext i32 %185 to i64
  %arrayidx240 = getelementptr inbounds i8, i8* %184, i64 %idxprom239
  store i8 %182, i8* %arrayidx240, align 1
  br label %for.inc241

for.inc241:                                       ; preds = %for.body212
  %186 = load i32, i32* %s, align 4
  %inc242 = add nsw i32 %186, 1
  store i32 %inc242, i32* %s, align 4
  br label %for.cond208

for.end243:                                       ; preds = %for.cond208
  br label %for.inc244

for.inc244:                                       ; preds = %for.end243
  %187 = load i32, i32* %p, align 4
  %inc245 = add nsw i32 %187, 1
  store i32 %inc245, i32* %p, align 4
  br label %for.cond203

for.end246:                                       ; preds = %for.cond203
  %188 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone247 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %188, i32 0, i32 0
  %189 = load i32, i32* %n_ciphone247, align 8
  %conv248 = sext i32 %189 to i64
  %call249 = call i8* @__ckd_calloc__(i64 %conv248, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 726)
  %190 = bitcast i8* %call249 to i32*
  store i32* %190, i32** %cdsen_start, align 8
  %191 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone250 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %191, i32 0, i32 0
  %192 = load i32, i32* %n_ciphone250, align 8
  %conv251 = sext i32 %192 to i64
  %call252 = call i8* @__ckd_calloc__(i64 %conv251, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 728)
  %193 = bitcast i8* %call252 to i32*
  store i32* %193, i32** %cdsen_end, align 8
  %194 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen253 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %194, i32 0, i32 3
  %195 = load i32, i32* %n_ci_sen253, align 4
  store i32 %195, i32* %s, align 4
  br label %for.cond254

for.cond254:                                      ; preds = %for.inc288, %for.end246
  %196 = load i32, i32* %s, align 4
  %197 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen255 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %197, i32 0, i32 4
  %198 = load i32, i32* %n_sen255, align 8
  %cmp256 = icmp slt i32 %196, %198
  br i1 %cmp256, label %for.body258, label %for.end290

for.body258:                                      ; preds = %for.cond254
  %199 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap259 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %199, i32 0, i32 12
  %200 = load i8*, i8** %sen2cimap259, align 8
  %201 = load i32, i32* %s, align 4
  %idxprom260 = sext i32 %201 to i64
  %arrayidx261 = getelementptr inbounds i8, i8* %200, i64 %idxprom260
  %202 = load i8, i8* %arrayidx261, align 1
  %conv262 = sext i8 %202 to i32
  %cmp263 = icmp slt i32 %conv262, 0
  br i1 %cmp263, label %if.then265, label %if.end266

if.then265:                                       ; preds = %for.body258
  br label %for.inc288

if.end266:                                        ; preds = %for.body258
  %203 = load i32*, i32** %cdsen_start, align 8
  %204 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap267 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %204, i32 0, i32 12
  %205 = load i8*, i8** %sen2cimap267, align 8
  %206 = load i32, i32* %s, align 4
  %idxprom268 = sext i32 %206 to i64
  %arrayidx269 = getelementptr inbounds i8, i8* %205, i64 %idxprom268
  %207 = load i8, i8* %arrayidx269, align 1
  %conv270 = sext i8 %207 to i32
  %idxprom271 = sext i32 %conv270 to i64
  %arrayidx272 = getelementptr inbounds i32, i32* %203, i64 %idxprom271
  %208 = load i32, i32* %arrayidx272, align 4
  %tobool273 = icmp ne i32 %208, 0
  br i1 %tobool273, label %if.end281, label %if.then274

if.then274:                                       ; preds = %if.end266
  %209 = load i32, i32* %s, align 4
  %210 = load i32*, i32** %cdsen_start, align 8
  %211 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap275 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %211, i32 0, i32 12
  %212 = load i8*, i8** %sen2cimap275, align 8
  %213 = load i32, i32* %s, align 4
  %idxprom276 = sext i32 %213 to i64
  %arrayidx277 = getelementptr inbounds i8, i8* %212, i64 %idxprom276
  %214 = load i8, i8* %arrayidx277, align 1
  %conv278 = sext i8 %214 to i32
  %idxprom279 = sext i32 %conv278 to i64
  %arrayidx280 = getelementptr inbounds i32, i32* %210, i64 %idxprom279
  store i32 %209, i32* %arrayidx280, align 4
  br label %if.end281

if.end281:                                        ; preds = %if.then274, %if.end266
  %215 = load i32, i32* %s, align 4
  %216 = load i32*, i32** %cdsen_end, align 8
  %217 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap282 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %217, i32 0, i32 12
  %218 = load i8*, i8** %sen2cimap282, align 8
  %219 = load i32, i32* %s, align 4
  %idxprom283 = sext i32 %219 to i64
  %arrayidx284 = getelementptr inbounds i8, i8* %218, i64 %idxprom283
  %220 = load i8, i8* %arrayidx284, align 1
  %conv285 = sext i8 %220 to i32
  %idxprom286 = sext i32 %conv285 to i64
  %arrayidx287 = getelementptr inbounds i32, i32* %216, i64 %idxprom286
  store i32 %215, i32* %arrayidx287, align 4
  br label %for.inc288

for.inc288:                                       ; preds = %if.end281, %if.then265
  %221 = load i32, i32* %s, align 4
  %inc289 = add nsw i32 %221, 1
  store i32 %inc289, i32* %s, align 4
  br label %for.cond254

for.end290:                                       ; preds = %for.cond254
  %222 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen291 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %222, i32 0, i32 3
  %223 = load i32, i32* %n_ci_sen291, align 4
  store i32 %223, i32* %s, align 4
  br label %for.cond292

for.cond292:                                      ; preds = %for.inc332, %for.end290
  %224 = load i32, i32* %s, align 4
  %225 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen293 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %225, i32 0, i32 4
  %226 = load i32, i32* %n_sen293, align 8
  %cmp294 = icmp slt i32 %224, %226
  br i1 %cmp294, label %for.body296, label %for.end334

for.body296:                                      ; preds = %for.cond292
  %227 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap297 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %227, i32 0, i32 12
  %228 = load i8*, i8** %sen2cimap297, align 8
  %229 = load i32, i32* %s, align 4
  %idxprom298 = sext i32 %229 to i64
  %arrayidx299 = getelementptr inbounds i8, i8* %228, i64 %idxprom298
  %230 = load i8, i8* %arrayidx299, align 1
  %conv300 = sext i8 %230 to i32
  %cmp301 = icmp sge i32 %conv300, 0
  br i1 %cmp301, label %if.then303, label %if.end304

if.then303:                                       ; preds = %for.body296
  br label %for.inc332

if.end304:                                        ; preds = %for.body296
  store i32 0, i32* %p, align 4
  br label %for.cond305

for.cond305:                                      ; preds = %for.inc320, %if.end304
  %231 = load i32, i32* %p, align 4
  %232 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone306 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %232, i32 0, i32 0
  %233 = load i32, i32* %n_ciphone306, align 8
  %cmp307 = icmp slt i32 %231, %233
  br i1 %cmp307, label %for.body309, label %for.end322

for.body309:                                      ; preds = %for.cond305
  %234 = load i32, i32* %s, align 4
  %235 = load i32*, i32** %cdsen_start, align 8
  %236 = load i32, i32* %p, align 4
  %idxprom310 = sext i32 %236 to i64
  %arrayidx311 = getelementptr inbounds i32, i32* %235, i64 %idxprom310
  %237 = load i32, i32* %arrayidx311, align 4
  %cmp312 = icmp sgt i32 %234, %237
  br i1 %cmp312, label %land.lhs.true, label %if.end319

land.lhs.true:                                    ; preds = %for.body309
  %238 = load i32, i32* %s, align 4
  %239 = load i32*, i32** %cdsen_end, align 8
  %240 = load i32, i32* %p, align 4
  %idxprom314 = sext i32 %240 to i64
  %arrayidx315 = getelementptr inbounds i32, i32* %239, i64 %idxprom314
  %241 = load i32, i32* %arrayidx315, align 4
  %cmp316 = icmp slt i32 %238, %241
  br i1 %cmp316, label %if.then318, label %if.end319

if.then318:                                       ; preds = %land.lhs.true
  br label %for.end322

if.end319:                                        ; preds = %land.lhs.true, %for.body309
  br label %for.inc320

for.inc320:                                       ; preds = %if.end319
  %242 = load i32, i32* %p, align 4
  %inc321 = add nsw i32 %242, 1
  store i32 %inc321, i32* %p, align 4
  br label %for.cond305

for.end322:                                       ; preds = %if.then318, %for.cond305
  %243 = load i32, i32* %p, align 4
  %244 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone323 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %244, i32 0, i32 0
  %245 = load i32, i32* %n_ciphone323, align 8
  %cmp324 = icmp sge i32 %243, %245
  br i1 %cmp324, label %if.then326, label %if.end327

if.then326:                                       ; preds = %for.end322
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 750, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %246 = load i32, i32* %s, align 4
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.60, i32 0, i32 0), i32 %246)
  br label %if.end327

if.end327:                                        ; preds = %if.then326, %for.end322
  %247 = load i32, i32* %p, align 4
  %conv328 = trunc i32 %247 to i8
  %248 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %sen2cimap329 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %248, i32 0, i32 12
  %249 = load i8*, i8** %sen2cimap329, align 8
  %250 = load i32, i32* %s, align 4
  %idxprom330 = sext i32 %250 to i64
  %arrayidx331 = getelementptr inbounds i8, i8* %249, i64 %idxprom330
  store i8 %conv328, i8* %arrayidx331, align 1
  br label %for.inc332

for.inc332:                                       ; preds = %if.end327, %if.then303
  %251 = load i32, i32* %s, align 4
  %inc333 = add nsw i32 %251, 1
  store i32 %inc333, i32* %s, align 4
  br label %for.cond292

for.end334:                                       ; preds = %for.cond292
  %252 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone335 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %252, i32 0, i32 0
  %253 = load i32, i32* %n_ciphone335, align 8
  %conv336 = sext i32 %253 to i64
  %call337 = call i8* @__ckd_calloc__(i64 %conv336, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 755)
  %254 = bitcast i8* %call337 to i32*
  %255 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %ciphone2n_cd_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %255, i32 0, i32 13
  store i32* %254, i32** %ciphone2n_cd_sen, align 8
  store i32 0, i32* %n, align 4
  store i32 0, i32* %p, align 4
  br label %for.cond338

for.cond338:                                      ; preds = %for.inc362, %for.end334
  %256 = load i32, i32* %p, align 4
  %257 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone339 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %257, i32 0, i32 0
  %258 = load i32, i32* %n_ciphone339, align 8
  %cmp340 = icmp slt i32 %256, %258
  br i1 %cmp340, label %for.body342, label %for.end364

for.body342:                                      ; preds = %for.cond338
  %259 = load i32*, i32** %cdsen_start, align 8
  %260 = load i32, i32* %p, align 4
  %idxprom343 = sext i32 %260 to i64
  %arrayidx344 = getelementptr inbounds i32, i32* %259, i64 %idxprom343
  %261 = load i32, i32* %arrayidx344, align 4
  %cmp345 = icmp sgt i32 %261, 0
  br i1 %cmp345, label %if.then347, label %if.end361

if.then347:                                       ; preds = %for.body342
  %262 = load i32*, i32** %cdsen_end, align 8
  %263 = load i32, i32* %p, align 4
  %idxprom348 = sext i32 %263 to i64
  %arrayidx349 = getelementptr inbounds i32, i32* %262, i64 %idxprom348
  %264 = load i32, i32* %arrayidx349, align 4
  %265 = load i32*, i32** %cdsen_start, align 8
  %266 = load i32, i32* %p, align 4
  %idxprom350 = sext i32 %266 to i64
  %arrayidx351 = getelementptr inbounds i32, i32* %265, i64 %idxprom350
  %267 = load i32, i32* %arrayidx351, align 4
  %sub352 = sub nsw i32 %264, %267
  %add353 = add nsw i32 %sub352, 1
  %268 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %ciphone2n_cd_sen354 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %268, i32 0, i32 13
  %269 = load i32*, i32** %ciphone2n_cd_sen354, align 8
  %270 = load i32, i32* %p, align 4
  %idxprom355 = sext i32 %270 to i64
  %arrayidx356 = getelementptr inbounds i32, i32* %269, i64 %idxprom355
  store i32 %add353, i32* %arrayidx356, align 4
  %271 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %ciphone2n_cd_sen357 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %271, i32 0, i32 13
  %272 = load i32*, i32** %ciphone2n_cd_sen357, align 8
  %273 = load i32, i32* %p, align 4
  %idxprom358 = sext i32 %273 to i64
  %arrayidx359 = getelementptr inbounds i32, i32* %272, i64 %idxprom358
  %274 = load i32, i32* %arrayidx359, align 4
  %275 = load i32, i32* %n, align 4
  %add360 = add nsw i32 %275, %274
  store i32 %add360, i32* %n, align 4
  br label %if.end361

if.end361:                                        ; preds = %if.then347, %for.body342
  br label %for.inc362

for.inc362:                                       ; preds = %if.end361
  %276 = load i32, i32* %p, align 4
  %inc363 = add nsw i32 %276, 1
  store i32 %inc363, i32* %p, align 4
  br label %for.cond338

for.end364:                                       ; preds = %for.cond338
  %277 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen365 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %277, i32 0, i32 3
  %278 = load i32, i32* %n_ci_sen365, align 4
  %279 = load i32, i32* %n, align 4
  %add366 = add nsw i32 %279, %278
  store i32 %add366, i32* %n, align 4
  %280 = load i32, i32* %n, align 4
  %281 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen367 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %281, i32 0, i32 4
  %282 = load i32, i32* %n_sen367, align 8
  %cmp368 = icmp eq i32 %280, %282
  br i1 %cmp368, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end364
  br label %cond.end

cond.false:                                       ; preds = %for.end364
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 764, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__PRETTY_FUNCTION__.mdef_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %283, %cond.true
  %284 = load i32*, i32** %cdsen_start, align 8
  %285 = bitcast i32* %284 to i8*
  call void @ckd_free(i8* %285)
  %286 = load i32*, i32** %cdsen_end, align 8
  %287 = bitcast i32* %286 to i8*
  call void @ckd_free(i8* %287)
  %288 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  call void @sseq_compress(%struct.mdef_t* %288)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 771, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.30, i32 0, i32 0))
  %289 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone370 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %289, i32 0, i32 0
  %290 = load i32, i32* %n_ciphone370, align 8
  %291 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_phone371 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %291, i32 0, i32 1
  %292 = load i32, i32* %n_phone371, align 4
  %293 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ciphone372 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %293, i32 0, i32 0
  %294 = load i32, i32* %n_ciphone372, align 8
  %sub373 = sub nsw i32 %292, %294
  %295 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_emit_state374 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %295, i32 0, i32 2
  %296 = load i32, i32* %n_emit_state374, align 8
  %297 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_ci_sen375 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %297, i32 0, i32 3
  %298 = load i32, i32* %n_ci_sen375, align 4
  %299 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sen376 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %299, i32 0, i32 4
  %300 = load i32, i32* %n_sen376, align 8
  %301 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  %n_sseq = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %301, i32 0, i32 10
  %302 = load i32, i32* %n_sseq, align 8
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.62, i32 0, i32 0), i32 %290, i32 %sub373, i32 %296, i32 %298, i32 %300, i32 %302)
  %303 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call377 = call i32 @fclose(%struct._IO_FILE* %303)
  %304 = load %struct.mdef_t*, %struct.mdef_t** %m, align 8
  ret %struct.mdef_t* %304
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
  %retval = alloca i32, align 4
  %line.addr = alloca i8*, align 8
  %size.addr = alloca i32, align 4
  %fp.addr = alloca %struct._IO_FILE*, align 8
  store i8* %line, i8** %line.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %fp.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i8*, i8** %line.addr, align 8
  %1 = load i32, i32* %size.addr, align 4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 8
  %call = call i8* @fgets(i8* %0, i32 %1, %struct._IO_FILE* %2)
  %cmp = icmp ne i8* %call, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i8*, i8** %line.addr, align 8
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %cmp1 = icmp ne i32 %conv, 35
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
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
  %m.addr = alloca %struct.mdef_t*, align 8
  %line.addr = alloca i8*, align 8
  %p.addr = alloca i32, align 4
  %wlen = alloca i32, align 4
  %n = alloca i32, align 4
  %word = alloca [1024 x i8], align 16
  %lp = alloca i8*, align 8
  %ci = alloca i8, align 1
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  store i8* %line, i8** %line.addr, align 8
  store i32 %p, i32* %p.addr, align 4
  %0 = load i8*, i8** %line.addr, align 8
  store i8* %0, i8** %lp, align 8
  %1 = load i8*, i8** %lp, align 8
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay, i32* %wlen) #7
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 421, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %2 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.64, i32 0, i32 0), i8* %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %wlen, align 4
  %4 = load i8*, i8** %lp, align 8
  %idx.ext = sext i32 %3 to i64
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 %idx.ext
  store i8* %add.ptr, i8** %lp, align 8
  %5 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %arraydecay1 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call2 = call signext i8 @mdef_ciphone_id(%struct.mdef_t* %5, i8* %arraydecay1)
  store i8 %call2, i8* %ci, align 1
  %6 = load i8, i8* %ci, align 1
  %conv = sext i8 %6 to i32
  %cmp3 = icmp sge i32 %conv, 0
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 427, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %7 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.65, i32 0, i32 0), i8* %7)
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  %8 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %arraydecay7 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %9 = load i32, i32* %p.addr, align 4
  call void @ciphone_add(%struct.mdef_t* %8, i8* %arraydecay7, i32 %9)
  %10 = load i32, i32* %p.addr, align 4
  %conv8 = trunc i32 %10 to i8
  store i8 %conv8, i8* %ci, align 1
  store i32 0, i32* %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end6
  %11 = load i32, i32* %n, align 4
  %cmp9 = icmp slt i32 %11, 3
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load i8*, i8** %lp, align 8
  %arraydecay11 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call12 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %12, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay11, i32* %wlen) #7
  %cmp13 = icmp ne i32 %call12, 1
  br i1 %cmp13, label %if.then19, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %arraydecay15 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call16 = call i32 @strcmp(i8* %arraydecay15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.66, i32 0, i32 0)) #8
  %cmp17 = icmp ne i32 %call16, 0
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %lor.lhs.false, %for.body
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 436, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %13 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.67, i32 0, i32 0), i8* %13)
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %lor.lhs.false
  %14 = load i32, i32* %wlen, align 4
  %15 = load i8*, i8** %lp, align 8
  %idx.ext21 = sext i32 %14 to i64
  %add.ptr22 = getelementptr inbounds i8, i8* %15, i64 %idx.ext21
  store i8* %add.ptr22, i8** %lp, align 8
  br label %for.inc

for.inc:                                          ; preds = %if.end20
  %16 = load i32, i32* %n, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %n, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %17 = load i8*, i8** %lp, align 8
  %arraydecay23 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call24 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay23, i32* %wlen) #7
  %cmp25 = icmp ne i32 %call24, 1
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %for.end
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 442, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %18 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.68, i32 0, i32 0), i8* %18)
  br label %if.end28

if.end28:                                         ; preds = %if.then27, %for.end
  %19 = load i32, i32* %wlen, align 4
  %20 = load i8*, i8** %lp, align 8
  %idx.ext29 = sext i32 %19 to i64
  %add.ptr30 = getelementptr inbounds i8, i8* %20, i64 %idx.ext29
  store i8* %add.ptr30, i8** %lp, align 8
  %arraydecay31 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call32 = call i32 @strcmp(i8* %arraydecay31, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.69, i32 0, i32 0)) #8
  %cmp33 = icmp eq i32 %call32, 0
  br i1 %cmp33, label %if.then35, label %if.else

if.then35:                                        ; preds = %if.end28
  %21 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %21, i32 0, i32 7
  %22 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone, align 8
  %23 = load i8, i8* %ci, align 1
  %conv36 = sext i8 %23 to i32
  %idxprom = sext i32 %conv36 to i64
  %arrayidx = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %22, i64 %idxprom
  %filler = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx, i32 0, i32 1
  store i32 1, i32* %filler, align 8
  br label %if.end49

if.else:                                          ; preds = %if.end28
  %arraydecay37 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call38 = call i32 @strcmp(i8* %arraydecay37, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.70, i32 0, i32 0)) #8
  %cmp39 = icmp eq i32 %call38, 0
  br i1 %cmp39, label %if.then41, label %if.else47

if.then41:                                        ; preds = %if.else
  %24 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone42 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %24, i32 0, i32 7
  %25 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone42, align 8
  %26 = load i8, i8* %ci, align 1
  %conv43 = sext i8 %26 to i32
  %idxprom44 = sext i32 %conv43 to i64
  %arrayidx45 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %25, i64 %idxprom44
  %filler46 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx45, i32 0, i32 1
  store i32 0, i32* %filler46, align 8
  br label %if.end48

if.else47:                                        ; preds = %if.else
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 449, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %27 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.71, i32 0, i32 0), i8* %27)
  br label %if.end48

if.end48:                                         ; preds = %if.else47, %if.then41
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.then35
  %28 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %29 = load i8, i8* %ci, align 1
  %30 = load i32, i32* %p.addr, align 4
  call void @triphone_add(%struct.mdef_t* %28, i8 signext %29, i8 signext -1, i8 signext -1, i32 4, i32 %30)
  %31 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %32 = load i8*, i8** %line.addr, align 8
  %33 = load i8*, i8** %lp, align 8
  %34 = load i8*, i8** %line.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %33 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %34 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv50 = trunc i64 %sub.ptr.sub to i32
  %35 = load i32, i32* %p.addr, align 4
  call void @parse_tmat_senmap(%struct.mdef_t* %31, i8* %32, i32 %conv50, i32 %35)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @parse_tri_line(%struct.mdef_t* %m, i8* %line, i32 %p) #0 {
entry:
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
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  store i8* %line, i8** %line.addr, align 8
  store i32 %p, i32* %p.addr, align 4
  store i32 0, i32* %wpos, align 4
  %0 = load i8*, i8** %line.addr, align 8
  store i8* %0, i8** %lp, align 8
  %1 = load i8*, i8** %lp, align 8
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay, i32* %wlen) #7
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 469, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %2 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.64, i32 0, i32 0), i8* %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %wlen, align 4
  %4 = load i8*, i8** %lp, align 8
  %idx.ext = sext i32 %3 to i64
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 %idx.ext
  store i8* %add.ptr, i8** %lp, align 8
  %5 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %arraydecay1 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call2 = call signext i8 @mdef_ciphone_id(%struct.mdef_t* %5, i8* %arraydecay1)
  store i8 %call2, i8* %ci, align 1
  %6 = load i8, i8* %ci, align 1
  %conv = sext i8 %6 to i32
  %cmp3 = icmp slt i32 %conv, 0
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 474, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %7 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.85, i32 0, i32 0), i8* %7)
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  %8 = load i8*, i8** %lp, align 8
  %arraydecay7 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call8 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay7, i32* %wlen) #7
  %cmp9 = icmp ne i32 %call8, 1
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end6
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 478, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %9 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.86, i32 0, i32 0), i8* %9)
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end6
  %10 = load i32, i32* %wlen, align 4
  %11 = load i8*, i8** %lp, align 8
  %idx.ext13 = sext i32 %10 to i64
  %add.ptr14 = getelementptr inbounds i8, i8* %11, i64 %idx.ext13
  store i8* %add.ptr14, i8** %lp, align 8
  %12 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %arraydecay15 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call16 = call signext i8 @mdef_ciphone_id(%struct.mdef_t* %12, i8* %arraydecay15)
  store i8 %call16, i8* %lc, align 1
  %13 = load i8, i8* %lc, align 1
  %conv17 = sext i8 %13 to i32
  %cmp18 = icmp slt i32 %conv17, 0
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end12
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 482, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %14 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.87, i32 0, i32 0), i8* %14)
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %if.end12
  %15 = load i8*, i8** %lp, align 8
  %arraydecay22 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call23 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %15, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay22, i32* %wlen) #7
  %cmp24 = icmp ne i32 %call23, 1
  br i1 %cmp24, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end21
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 486, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %16 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.88, i32 0, i32 0), i8* %16)
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %if.end21
  %17 = load i32, i32* %wlen, align 4
  %18 = load i8*, i8** %lp, align 8
  %idx.ext28 = sext i32 %17 to i64
  %add.ptr29 = getelementptr inbounds i8, i8* %18, i64 %idx.ext28
  store i8* %add.ptr29, i8** %lp, align 8
  %19 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %arraydecay30 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call31 = call signext i8 @mdef_ciphone_id(%struct.mdef_t* %19, i8* %arraydecay30)
  store i8 %call31, i8* %rc, align 1
  %20 = load i8, i8* %rc, align 1
  %conv32 = sext i8 %20 to i32
  %cmp33 = icmp slt i32 %conv32, 0
  br i1 %cmp33, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end27
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 490, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %21 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.89, i32 0, i32 0), i8* %21)
  br label %if.end36

if.end36:                                         ; preds = %if.then35, %if.end27
  %22 = load i8*, i8** %lp, align 8
  %arraydecay37 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call38 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %22, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay37, i32* %wlen) #7
  %cmp39 = icmp ne i32 %call38, 1
  br i1 %cmp39, label %if.then44, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end36
  %arrayidx = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i64 0, i64 1
  %23 = load i8, i8* %arrayidx, align 1
  %conv41 = sext i8 %23 to i32
  %cmp42 = icmp ne i32 %conv41, 0
  br i1 %cmp42, label %if.then44, label %if.end45

if.then44:                                        ; preds = %lor.lhs.false, %if.end36
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 494, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %24 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.90, i32 0, i32 0), i8* %24)
  br label %if.end45

if.end45:                                         ; preds = %if.then44, %lor.lhs.false
  %25 = load i32, i32* %wlen, align 4
  %26 = load i8*, i8** %lp, align 8
  %idx.ext46 = sext i32 %25 to i64
  %add.ptr47 = getelementptr inbounds i8, i8* %26, i64 %idx.ext46
  store i8* %add.ptr47, i8** %lp, align 8
  %arrayidx48 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i64 0, i64 0
  %27 = load i8, i8* %arrayidx48, align 16
  %conv49 = sext i8 %27 to i32
  switch i32 %conv49, label %sw.default [
    i32 98, label %sw.bb
    i32 101, label %sw.bb50
    i32 115, label %sw.bb51
    i32 105, label %sw.bb52
  ]

sw.bb:                                            ; preds = %if.end45
  store i32 0, i32* %wpos, align 4
  br label %sw.epilog

sw.bb50:                                          ; preds = %if.end45
  store i32 1, i32* %wpos, align 4
  br label %sw.epilog

sw.bb51:                                          ; preds = %if.end45
  store i32 2, i32* %wpos, align 4
  br label %sw.epilog

sw.bb52:                                          ; preds = %if.end45
  store i32 3, i32* %wpos, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %if.end45
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 501, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %28 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.91, i32 0, i32 0), i8* %28)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb52, %sw.bb51, %sw.bb50, %sw.bb
  %29 = load i8*, i8** %lp, align 8
  %arraydecay53 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call54 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %29, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay53, i32* %wlen) #7
  %cmp55 = icmp ne i32 %call54, 1
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %sw.epilog
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 506, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %30 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.92, i32 0, i32 0), i8* %30)
  br label %if.end58

if.end58:                                         ; preds = %if.then57, %sw.epilog
  %31 = load i32, i32* %wlen, align 4
  %32 = load i8*, i8** %lp, align 8
  %idx.ext59 = sext i32 %31 to i64
  %add.ptr60 = getelementptr inbounds i8, i8* %32, i64 %idx.ext59
  store i8* %add.ptr60, i8** %lp, align 8
  %arraydecay61 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call62 = call i32 @strcmp(i8* %arraydecay61, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.69, i32 0, i32 0)) #8
  %cmp63 = icmp eq i32 %call62, 0
  br i1 %cmp63, label %land.lhs.true, label %lor.lhs.false67

land.lhs.true:                                    ; preds = %if.end58
  %33 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %33, i32 0, i32 7
  %34 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone, align 8
  %35 = load i8, i8* %ci, align 1
  %conv65 = sext i8 %35 to i32
  %idxprom = sext i32 %conv65 to i64
  %arrayidx66 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %34, i64 %idxprom
  %filler = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx66, i32 0, i32 1
  %36 = load i32, i32* %filler, align 8
  %tobool = icmp ne i32 %36, 0
  br i1 %tobool, label %if.then79, label %lor.lhs.false67

lor.lhs.false67:                                  ; preds = %land.lhs.true, %if.end58
  %arraydecay68 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call69 = call i32 @strcmp(i8* %arraydecay68, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.70, i32 0, i32 0)) #8
  %cmp70 = icmp eq i32 %call69, 0
  br i1 %cmp70, label %land.lhs.true72, label %if.else

land.lhs.true72:                                  ; preds = %lor.lhs.false67
  %37 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone73 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %37, i32 0, i32 7
  %38 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone73, align 8
  %39 = load i8, i8* %ci, align 1
  %conv74 = sext i8 %39 to i32
  %idxprom75 = sext i32 %conv74 to i64
  %arrayidx76 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %38, i64 %idxprom75
  %filler77 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx76, i32 0, i32 1
  %40 = load i32, i32* %filler77, align 8
  %tobool78 = icmp ne i32 %40, 0
  br i1 %tobool78, label %if.else, label %if.then79

if.then79:                                        ; preds = %land.lhs.true72, %land.lhs.true
  br label %if.end80

if.else:                                          ; preds = %land.lhs.true72, %lor.lhs.false67
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 512, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %41 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.71, i32 0, i32 0), i8* %41)
  br label %if.end80

if.end80:                                         ; preds = %if.else, %if.then79
  %42 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %43 = load i8, i8* %ci, align 1
  %44 = load i8, i8* %lc, align 1
  %45 = load i8, i8* %rc, align 1
  %46 = load i32, i32* %wpos, align 4
  %47 = load i32, i32* %p.addr, align 4
  call void @triphone_add(%struct.mdef_t* %42, i8 signext %43, i8 signext %44, i8 signext %45, i32 %46, i32 %47)
  %48 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %49 = load i8*, i8** %line.addr, align 8
  %50 = load i8*, i8** %lp, align 8
  %51 = load i8*, i8** %line.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %50 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %51 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv81 = trunc i64 %sub.ptr.sub to i32
  %52 = load i32, i32* %p.addr, align 4
  call void @parse_tmat_senmap(%struct.mdef_t* %48, i8* %49, i32 %conv81, i32 %52)
  ret void
}

declare dso_local void @_E__pr_warn(i8*, ...) #1

declare dso_local void @ckd_free(i8*) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @sseq_compress(%struct.mdef_t* %m) #0 {
entry:
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
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %0 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_emit_state = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %0, i32 0, i32 2
  %1 = load i32, i32* %n_emit_state, align 8
  %conv = sext i32 %1 to i64
  %mul = mul i64 %conv, 2
  %conv1 = trunc i64 %mul to i32
  store i32 %conv1, i32* %k, align 4
  %2 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %2, i32 0, i32 1
  %3 = load i32, i32* %n_phone, align 4
  %call = call %struct.hash_table_t* @hash_new(i32 %3, i32 0)
  store %struct.hash_table_t* %call, %struct.hash_table_t** %h, align 8
  store i32 0, i32* %n_sseq, align 4
  store i32 0, i32* %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %p, align 4
  %5 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone2 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %5, i32 0, i32 1
  %6 = load i32, i32* %n_phone2, align 4
  %cmp = icmp slt i32 %4, %6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load %struct.hash_table_t*, %struct.hash_table_t** %h, align 8
  %8 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sseq4 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %8, i32 0, i32 9
  %9 = load i16**, i16*** %sseq4, align 8
  %10 = load i32, i32* %p, align 4
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds i16*, i16** %9, i64 %idxprom
  %11 = load i16*, i16** %arrayidx, align 8
  %12 = bitcast i16* %11 to i8*
  %13 = load i32, i32* %k, align 4
  %14 = load i32, i32* %n_sseq, align 4
  %call5 = call i32 @hash_enter_bkey(%struct.hash_table_t* %7, i8* %12, i32 %13, i32 %14)
  store i32 %call5, i32* %j, align 4
  %15 = load i32, i32* %n_sseq, align 4
  %cmp6 = icmp eq i32 %call5, %15
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %16 = load i32, i32* %n_sseq, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %n_sseq, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %17 = load i32, i32* %j, align 4
  %18 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %18, i32 0, i32 8
  %19 = load %struct.phone_t*, %struct.phone_t** %phone, align 8
  %20 = load i32, i32* %p, align 4
  %idxprom8 = sext i32 %20 to i64
  %arrayidx9 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %19, i64 %idxprom8
  %ssid = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx9, i32 0, i32 0
  store i32 %17, i32* %ssid, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %21 = load i32, i32* %p, align 4
  %inc10 = add nsw i32 %21, 1
  store i32 %inc10, i32* %p, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %22 = load i32, i32* %n_sseq, align 4
  %23 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_emit_state11 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %23, i32 0, i32 2
  %24 = load i32, i32* %n_emit_state11, align 8
  %call12 = call i8** @__ckd_calloc_2d__(i32 %22, i32 %24, i32 2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 546)
  %25 = bitcast i8** %call12 to i16**
  store i16** %25, i16*** %sseq, align 8
  %26 = load %struct.hash_table_t*, %struct.hash_table_t** %h, align 8
  %call13 = call %struct.gnode_s* @hash_tolist(%struct.hash_table_t* %26, i32* %j)
  store %struct.gnode_s* %call13, %struct.gnode_s** %g, align 8
  %27 = load i32, i32* %j, align 4
  %28 = load i32, i32* %n_sseq, align 4
  %cmp14 = icmp eq i32 %27, %28
  br i1 %cmp14, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  br label %cond.end

cond.false:                                       ; preds = %for.end
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.93, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 549, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.sseq_compress, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %29, %cond.true
  %30 = load %struct.gnode_s*, %struct.gnode_s** %g, align 8
  store %struct.gnode_s* %30, %struct.gnode_s** %gn, align 8
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc21, %cond.end
  %31 = load %struct.gnode_s*, %struct.gnode_s** %gn, align 8
  %tobool = icmp ne %struct.gnode_s* %31, null
  br i1 %tobool, label %for.body17, label %for.end22

for.body17:                                       ; preds = %for.cond16
  %32 = load %struct.gnode_s*, %struct.gnode_s** %gn, align 8
  %data = getelementptr inbounds %struct.gnode_s, %struct.gnode_s* %32, i32 0, i32 0
  %ptr = bitcast %union.anytype_s* %data to i8**
  %33 = load i8*, i8** %ptr, align 8
  %34 = bitcast i8* %33 to %struct.hash_entry_s*
  store %struct.hash_entry_s* %34, %struct.hash_entry_s** %he, align 8
  %35 = load %struct.hash_entry_s*, %struct.hash_entry_s** %he, align 8
  %val = getelementptr inbounds %struct.hash_entry_s, %struct.hash_entry_s* %35, i32 0, i32 2
  %36 = load i32, i32* %val, align 4
  store i32 %36, i32* %j, align 4
  %37 = load i16**, i16*** %sseq, align 8
  %38 = load i32, i32* %j, align 4
  %idxprom18 = sext i32 %38 to i64
  %arrayidx19 = getelementptr inbounds i16*, i16** %37, i64 %idxprom18
  %39 = load i16*, i16** %arrayidx19, align 8
  %40 = bitcast i16* %39 to i8*
  %41 = load %struct.hash_entry_s*, %struct.hash_entry_s** %he, align 8
  %key = getelementptr inbounds %struct.hash_entry_s, %struct.hash_entry_s* %41, i32 0, i32 0
  %42 = load i8*, i8** %key, align 8
  %43 = load i32, i32* %k, align 4
  %conv20 = sext i32 %43 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %40, i8* align 1 %42, i64 %conv20, i1 false)
  br label %for.inc21

for.inc21:                                        ; preds = %for.body17
  %44 = load %struct.gnode_s*, %struct.gnode_s** %gn, align 8
  %next = getelementptr inbounds %struct.gnode_s, %struct.gnode_s* %44, i32 0, i32 1
  %45 = load %struct.gnode_s*, %struct.gnode_s** %next, align 8
  store %struct.gnode_s* %45, %struct.gnode_s** %gn, align 8
  br label %for.cond16

for.end22:                                        ; preds = %for.cond16
  %46 = load %struct.gnode_s*, %struct.gnode_s** %g, align 8
  call void @glist_free(%struct.gnode_s* %46)
  %47 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sseq23 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %47, i32 0, i32 9
  %48 = load i16**, i16*** %sseq23, align 8
  %49 = bitcast i16** %48 to i8**
  call void @ckd_free_2d(i8** %49)
  %50 = load i16**, i16*** %sseq, align 8
  %51 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sseq24 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %51, i32 0, i32 9
  store i16** %50, i16*** %sseq24, align 8
  %52 = load i32, i32* %n_sseq, align 4
  %53 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_sseq25 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %53, i32 0, i32 10
  store i32 %52, i32* %n_sseq25, align 8
  %54 = load %struct.hash_table_t*, %struct.hash_table_t** %h, align 8
  call void @hash_free(%struct.hash_table_t* %54)
  ret void
}

declare dso_local i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @mdef_sseq2sen_active(%struct.mdef_t* %mdef, i32* %sseq, i32* %sen) #0 {
entry:
  %mdef.addr = alloca %struct.mdef_t*, align 8
  %sseq.addr = alloca i32*, align 8
  %sen.addr = alloca i32*, align 8
  %ss = alloca i32, align 4
  %i = alloca i32, align 4
  %sp = alloca i16*, align 8
  store %struct.mdef_t* %mdef, %struct.mdef_t** %mdef.addr, align 8
  store i32* %sseq, i32** %sseq.addr, align 8
  store i32* %sen, i32** %sen.addr, align 8
  store i32 0, i32* %ss, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc11, %entry
  %0 = load i32, i32* %ss, align 4
  %1 = load %struct.mdef_t*, %struct.mdef_t** %mdef.addr, align 8
  %n_sseq = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %1, i32 0, i32 10
  %2 = load i32, i32* %n_sseq, align 8
  %cmp = icmp slt i32 %0, %2
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %sseq.addr, align 8
  %4 = load i32, i32* %ss, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom
  %5 = load i32, i32* %arrayidx, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %6 = load %struct.mdef_t*, %struct.mdef_t** %mdef.addr, align 8
  %sseq1 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %6, i32 0, i32 9
  %7 = load i16**, i16*** %sseq1, align 8
  %8 = load i32, i32* %ss, align 4
  %idxprom2 = sext i32 %8 to i64
  %arrayidx3 = getelementptr inbounds i16*, i16** %7, i64 %idxprom2
  %9 = load i16*, i16** %arrayidx3, align 8
  store i16* %9, i16** %sp, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %if.then
  %10 = load i32, i32* %i, align 4
  %11 = load %struct.mdef_t*, %struct.mdef_t** %mdef.addr, align 8
  %n_emit_state = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %11, i32 0, i32 2
  %12 = load i32, i32* %n_emit_state, align 8
  %cmp5 = icmp slt i32 %10, %12
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %13 = load i32*, i32** %sen.addr, align 8
  %14 = load i16*, i16** %sp, align 8
  %15 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %15 to i64
  %arrayidx8 = getelementptr inbounds i16, i16* %14, i64 %idxprom7
  %16 = load i16, i16* %arrayidx8, align 2
  %idxprom9 = sext i16 %16 to i64
  %arrayidx10 = getelementptr inbounds i32, i32* %13, i64 %idxprom9
  store i32 1, i32* %arrayidx10, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %17 = load i32, i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %if.end

if.end:                                           ; preds = %for.end, %for.body
  br label %for.inc11

for.inc11:                                        ; preds = %if.end
  %18 = load i32, i32* %ss, align 4
  %inc12 = add nsw i32 %18, 1
  store i32 %inc12, i32* %ss, align 4
  br label %for.cond

for.end13:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @mdef_free_recursive_lc(%struct.ph_lc_s* %lc) #0 {
entry:
  %lc.addr = alloca %struct.ph_lc_s*, align 8
  store %struct.ph_lc_s* %lc, %struct.ph_lc_s** %lc.addr, align 8
  %0 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lc.addr, align 8
  %cmp = icmp eq %struct.ph_lc_s* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lc.addr, align 8
  %rclist = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %1, i32 0, i32 1
  %2 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rclist, align 8
  %tobool = icmp ne %struct.ph_rc_s* %2, null
  br i1 %tobool, label %if.then1, label %if.end3

if.then1:                                         ; preds = %if.end
  %3 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lc.addr, align 8
  %rclist2 = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %3, i32 0, i32 1
  %4 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rclist2, align 8
  call void @mdef_free_recursive_rc(%struct.ph_rc_s* %4)
  br label %if.end3

if.end3:                                          ; preds = %if.then1, %if.end
  %5 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lc.addr, align 8
  %next = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %5, i32 0, i32 2
  %6 = load %struct.ph_lc_s*, %struct.ph_lc_s** %next, align 8
  %tobool4 = icmp ne %struct.ph_lc_s* %6, null
  br i1 %tobool4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end3
  %7 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lc.addr, align 8
  %next6 = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %7, i32 0, i32 2
  %8 = load %struct.ph_lc_s*, %struct.ph_lc_s** %next6, align 8
  call void @mdef_free_recursive_lc(%struct.ph_lc_s* %8)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end3
  %9 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lc.addr, align 8
  %10 = bitcast %struct.ph_lc_s* %9 to i8*
  call void @ckd_free(i8* %10)
  br label %return

return:                                           ; preds = %if.end7, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @mdef_free_recursive_rc(%struct.ph_rc_s* %rc) #0 {
entry:
  %rc.addr = alloca %struct.ph_rc_s*, align 8
  store %struct.ph_rc_s* %rc, %struct.ph_rc_s** %rc.addr, align 8
  %0 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rc.addr, align 8
  %cmp = icmp eq %struct.ph_rc_s* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rc.addr, align 8
  %next = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %1, i32 0, i32 2
  %2 = load %struct.ph_rc_s*, %struct.ph_rc_s** %next, align 8
  %tobool = icmp ne %struct.ph_rc_s* %2, null
  br i1 %tobool, label %if.then1, label %if.end3

if.then1:                                         ; preds = %if.end
  %3 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rc.addr, align 8
  %next2 = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %3, i32 0, i32 2
  %4 = load %struct.ph_rc_s*, %struct.ph_rc_s** %next2, align 8
  call void @mdef_free_recursive_rc(%struct.ph_rc_s* %4)
  br label %if.end3

if.end3:                                          ; preds = %if.then1, %if.end
  %5 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rc.addr, align 8
  %6 = bitcast %struct.ph_rc_s* %5 to i8*
  call void @ckd_free(i8* %6)
  br label %return

return:                                           ; preds = %if.end3, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @mdef_free(%struct.mdef_t* %m) #0 {
entry:
  %m.addr = alloca %struct.mdef_t*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  %0 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %tobool = icmp ne %struct.mdef_t* %0, null
  br i1 %tobool, label %if.then, label %if.end97

if.then:                                          ; preds = %entry
  %1 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone2n_cd_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %1, i32 0, i32 13
  %2 = load i32*, i32** %ciphone2n_cd_sen, align 8
  %tobool1 = icmp ne i32* %2, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %3 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone2n_cd_sen3 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %3, i32 0, i32 13
  %4 = load i32*, i32** %ciphone2n_cd_sen3, align 8
  %5 = bitcast i32* %4 to i8*
  call void @ckd_free(i8* %5)
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %6 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sen2cimap = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %6, i32 0, i32 12
  %7 = load i8*, i8** %sen2cimap, align 8
  %tobool4 = icmp ne i8* %7, null
  br i1 %tobool4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %8 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sen2cimap6 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %8, i32 0, i32 12
  %9 = load i8*, i8** %sen2cimap6, align 8
  call void @ckd_free(i8* %9)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  %10 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %cd2cisen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %10, i32 0, i32 11
  %11 = load i16*, i16** %cd2cisen, align 8
  %tobool8 = icmp ne i16* %11, null
  br i1 %tobool8, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end7
  %12 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %cd2cisen10 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %12, i32 0, i32 11
  %13 = load i16*, i16** %cd2cisen10, align 8
  %14 = bitcast i16* %13 to i8*
  call void @ckd_free(i8* %14)
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.end7
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc30, %if.end11
  %15 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %15, 4
  br i1 %cmp, label %for.body, label %for.end32

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc, %for.body
  %16 = load i32, i32* %j, align 4
  %17 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %17, i32 0, i32 0
  %18 = load i32, i32* %n_ciphone, align 8
  %cmp13 = icmp slt i32 %16, %18
  br i1 %cmp13, label %for.body14, label %for.end

for.body14:                                       ; preds = %for.cond12
  %19 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %19, i32 0, i32 15
  %20 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist, align 8
  %21 = load i32, i32* %i, align 4
  %idxprom = sext i32 %21 to i64
  %arrayidx = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %20, i64 %idxprom
  %22 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx, align 8
  %23 = load i32, i32* %j, align 4
  %idxprom15 = sext i32 %23 to i64
  %arrayidx16 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %22, i64 %idxprom15
  %24 = load %struct.ph_lc_s*, %struct.ph_lc_s** %arrayidx16, align 8
  %tobool17 = icmp ne %struct.ph_lc_s* %24, null
  br i1 %tobool17, label %if.then18, label %if.end29

if.then18:                                        ; preds = %for.body14
  %25 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist19 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %25, i32 0, i32 15
  %26 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist19, align 8
  %27 = load i32, i32* %i, align 4
  %idxprom20 = sext i32 %27 to i64
  %arrayidx21 = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %26, i64 %idxprom20
  %28 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx21, align 8
  %29 = load i32, i32* %j, align 4
  %idxprom22 = sext i32 %29 to i64
  %arrayidx23 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %28, i64 %idxprom22
  %30 = load %struct.ph_lc_s*, %struct.ph_lc_s** %arrayidx23, align 8
  %next = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %30, i32 0, i32 2
  %31 = load %struct.ph_lc_s*, %struct.ph_lc_s** %next, align 8
  call void @mdef_free_recursive_lc(%struct.ph_lc_s* %31)
  %32 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist24 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %32, i32 0, i32 15
  %33 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist24, align 8
  %34 = load i32, i32* %i, align 4
  %idxprom25 = sext i32 %34 to i64
  %arrayidx26 = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %33, i64 %idxprom25
  %35 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx26, align 8
  %36 = load i32, i32* %j, align 4
  %idxprom27 = sext i32 %36 to i64
  %arrayidx28 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %35, i64 %idxprom27
  %37 = load %struct.ph_lc_s*, %struct.ph_lc_s** %arrayidx28, align 8
  %rclist = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %37, i32 0, i32 1
  %38 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rclist, align 8
  call void @mdef_free_recursive_rc(%struct.ph_rc_s* %38)
  br label %if.end29

if.end29:                                         ; preds = %if.then18, %for.body14
  br label %for.inc

for.inc:                                          ; preds = %if.end29
  %39 = load i32, i32* %j, align 4
  %inc = add nsw i32 %39, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond12

for.end:                                          ; preds = %for.cond12
  br label %for.inc30

for.inc30:                                        ; preds = %for.end
  %40 = load i32, i32* %i, align 4
  %inc31 = add nsw i32 %40, 1
  store i32 %inc31, i32* %i, align 4
  br label %for.cond

for.end32:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc56, %for.end32
  %41 = load i32, i32* %i, align 4
  %cmp34 = icmp slt i32 %41, 4
  br i1 %cmp34, label %for.body35, label %for.end58

for.body35:                                       ; preds = %for.cond33
  store i32 0, i32* %j, align 4
  br label %for.cond36

for.cond36:                                       ; preds = %for.inc53, %for.body35
  %42 = load i32, i32* %j, align 4
  %43 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone37 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %43, i32 0, i32 0
  %44 = load i32, i32* %n_ciphone37, align 8
  %cmp38 = icmp slt i32 %42, %44
  br i1 %cmp38, label %for.body39, label %for.end55

for.body39:                                       ; preds = %for.cond36
  %45 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist40 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %45, i32 0, i32 15
  %46 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist40, align 8
  %47 = load i32, i32* %i, align 4
  %idxprom41 = sext i32 %47 to i64
  %arrayidx42 = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %46, i64 %idxprom41
  %48 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx42, align 8
  %49 = load i32, i32* %j, align 4
  %idxprom43 = sext i32 %49 to i64
  %arrayidx44 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %48, i64 %idxprom43
  %50 = load %struct.ph_lc_s*, %struct.ph_lc_s** %arrayidx44, align 8
  %tobool45 = icmp ne %struct.ph_lc_s* %50, null
  br i1 %tobool45, label %if.then46, label %if.end52

if.then46:                                        ; preds = %for.body39
  %51 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist47 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %51, i32 0, i32 15
  %52 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist47, align 8
  %53 = load i32, i32* %i, align 4
  %idxprom48 = sext i32 %53 to i64
  %arrayidx49 = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %52, i64 %idxprom48
  %54 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx49, align 8
  %55 = load i32, i32* %j, align 4
  %idxprom50 = sext i32 %55 to i64
  %arrayidx51 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %54, i64 %idxprom50
  %56 = load %struct.ph_lc_s*, %struct.ph_lc_s** %arrayidx51, align 8
  %57 = bitcast %struct.ph_lc_s* %56 to i8*
  call void @ckd_free(i8* %57)
  br label %if.end52

if.end52:                                         ; preds = %if.then46, %for.body39
  br label %for.inc53

for.inc53:                                        ; preds = %if.end52
  %58 = load i32, i32* %j, align 4
  %inc54 = add nsw i32 %58, 1
  store i32 %inc54, i32* %j, align 4
  br label %for.cond36

for.end55:                                        ; preds = %for.cond36
  br label %for.inc56

for.inc56:                                        ; preds = %for.end55
  %59 = load i32, i32* %i, align 4
  %inc57 = add nsw i32 %59, 1
  store i32 %inc57, i32* %i, align 4
  br label %for.cond33

for.end58:                                        ; preds = %for.cond33
  %60 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist59 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %60, i32 0, i32 15
  %61 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist59, align 8
  %tobool60 = icmp ne %struct.ph_lc_s*** %61, null
  br i1 %tobool60, label %if.then61, label %if.end63

if.then61:                                        ; preds = %for.end58
  %62 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist62 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %62, i32 0, i32 15
  %63 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist62, align 8
  %64 = bitcast %struct.ph_lc_s*** %63 to i8*
  %65 = bitcast i8* %64 to i8**
  call void @ckd_free_2d(i8** %65)
  br label %if.end63

if.end63:                                         ; preds = %if.then61, %for.end58
  %66 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sseq = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %66, i32 0, i32 9
  %67 = load i16**, i16*** %sseq, align 8
  %tobool64 = icmp ne i16** %67, null
  br i1 %tobool64, label %if.then65, label %if.end67

if.then65:                                        ; preds = %if.end63
  %68 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sseq66 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %68, i32 0, i32 9
  %69 = load i16**, i16*** %sseq66, align 8
  %70 = bitcast i16** %69 to i8*
  %71 = bitcast i8* %70 to i8**
  call void @ckd_free_2d(i8** %71)
  br label %if.end67

if.end67:                                         ; preds = %if.then65, %if.end63
  %72 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %72, i32 0, i32 8
  %73 = load %struct.phone_t*, %struct.phone_t** %phone, align 8
  %tobool68 = icmp ne %struct.phone_t* %73, null
  br i1 %tobool68, label %if.then69, label %if.end71

if.then69:                                        ; preds = %if.end67
  %74 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone70 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %74, i32 0, i32 8
  %75 = load %struct.phone_t*, %struct.phone_t** %phone70, align 8
  %76 = bitcast %struct.phone_t* %75 to i8*
  call void @ckd_free(i8* %76)
  br label %if.end71

if.end71:                                         ; preds = %if.then69, %if.end67
  %77 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone_ht = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %77, i32 0, i32 6
  %78 = load %struct.hash_table_t*, %struct.hash_table_t** %ciphone_ht, align 8
  %tobool72 = icmp ne %struct.hash_table_t* %78, null
  br i1 %tobool72, label %if.then73, label %if.end75

if.then73:                                        ; preds = %if.end71
  %79 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone_ht74 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %79, i32 0, i32 6
  %80 = load %struct.hash_table_t*, %struct.hash_table_t** %ciphone_ht74, align 8
  call void @hash_free(%struct.hash_table_t* %80)
  br label %if.end75

if.end75:                                         ; preds = %if.then73, %if.end71
  store i32 0, i32* %i, align 4
  br label %for.cond76

for.cond76:                                       ; preds = %for.inc89, %if.end75
  %81 = load i32, i32* %i, align 4
  %82 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone77 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %82, i32 0, i32 0
  %83 = load i32, i32* %n_ciphone77, align 8
  %cmp78 = icmp slt i32 %81, %83
  br i1 %cmp78, label %for.body79, label %for.end91

for.body79:                                       ; preds = %for.cond76
  %84 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %84, i32 0, i32 7
  %85 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone, align 8
  %86 = load i32, i32* %i, align 4
  %idxprom80 = sext i32 %86 to i64
  %arrayidx81 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %85, i64 %idxprom80
  %name = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx81, i32 0, i32 0
  %87 = load i8*, i8** %name, align 8
  %tobool82 = icmp ne i8* %87, null
  br i1 %tobool82, label %if.then83, label %if.end88

if.then83:                                        ; preds = %for.body79
  %88 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone84 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %88, i32 0, i32 7
  %89 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone84, align 8
  %90 = load i32, i32* %i, align 4
  %idxprom85 = sext i32 %90 to i64
  %arrayidx86 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %89, i64 %idxprom85
  %name87 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx86, i32 0, i32 0
  %91 = load i8*, i8** %name87, align 8
  call void @ckd_free(i8* %91)
  br label %if.end88

if.end88:                                         ; preds = %if.then83, %for.body79
  br label %for.inc89

for.inc89:                                        ; preds = %if.end88
  %92 = load i32, i32* %i, align 4
  %inc90 = add nsw i32 %92, 1
  store i32 %inc90, i32* %i, align 4
  br label %for.cond76

for.end91:                                        ; preds = %for.cond76
  %93 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone92 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %93, i32 0, i32 7
  %94 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone92, align 8
  %tobool93 = icmp ne %struct.ciphone_t* %94, null
  br i1 %tobool93, label %if.then94, label %if.end96

if.then94:                                        ; preds = %for.end91
  %95 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone95 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %95, i32 0, i32 7
  %96 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone95, align 8
  %97 = bitcast %struct.ciphone_t* %96 to i8*
  call void @ckd_free(i8* %97)
  br label %if.end96

if.end96:                                         ; preds = %if.then94, %for.end91
  %98 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %99 = bitcast %struct.mdef_t* %98 to i8*
  call void @ckd_free(i8* %99)
  br label %if.end97

if.end97:                                         ; preds = %if.end96, %entry
  ret void
}

declare dso_local void @ckd_free_2d(i8**) #1

declare dso_local void @hash_free(%struct.hash_table_t*) #1

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @ciphone_add(%struct.mdef_t* %m, i8* %ci, i32 %p) #0 {
entry:
  %m.addr = alloca %struct.mdef_t*, align 8
  %ci.addr = alloca i8*, align 8
  %p.addr = alloca i32, align 4
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  store i8* %ci, i8** %ci.addr, align 8
  store i32 %p, i32* %p.addr, align 4
  %0 = load i32, i32* %p.addr, align 4
  %1 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %1, i32 0, i32 0
  %2 = load i32, i32* %n_ciphone, align 8
  %cmp = icmp slt i32 %0, %2
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.72, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 136, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__PRETTY_FUNCTION__.ciphone_add, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %3, %cond.true
  %4 = load i8*, i8** %ci.addr, align 8
  %call = call i8* @__ckd_salloc__(i8* %4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 138)
  %5 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %5, i32 0, i32 7
  %6 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone, align 8
  %7 = load i32, i32* %p.addr, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %6, i64 %idxprom
  %name = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx, i32 0, i32 0
  store i8* %call, i8** %name, align 8
  %8 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone_ht = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %8, i32 0, i32 6
  %9 = load %struct.hash_table_t*, %struct.hash_table_t** %ciphone_ht, align 8
  %10 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone1 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %10, i32 0, i32 7
  %11 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone1, align 8
  %12 = load i32, i32* %p.addr, align 4
  %idxprom2 = sext i32 %12 to i64
  %arrayidx3 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %11, i64 %idxprom2
  %name4 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx3, i32 0, i32 0
  %13 = load i8*, i8** %name4, align 8
  %14 = load i32, i32* %p.addr, align 4
  %call5 = call i32 @hash_enter(%struct.hash_table_t* %9, i8* %13, i32 %14)
  %15 = load i32, i32* %p.addr, align 4
  %cmp6 = icmp ne i32 %call5, %15
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 140, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %16 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %ciphone7 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %16, i32 0, i32 7
  %17 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone7, align 8
  %18 = load i32, i32* %p.addr, align 4
  %idxprom8 = sext i32 %18 to i64
  %arrayidx9 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %17, i64 %idxprom8
  %name10 = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %arrayidx9, i32 0, i32 0
  %19 = load i8*, i8** %name10, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.73, i32 0, i32 0), i8* %19)
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @triphone_add(%struct.mdef_t* %m, i8 signext %ci, i8 signext %lc, i8 signext %rc, i32 %wpos, i32 %p) #0 {
entry:
  %m.addr = alloca %struct.mdef_t*, align 8
  %ci.addr = alloca i8, align 1
  %lc.addr = alloca i8, align 1
  %rc.addr = alloca i8, align 1
  %wpos.addr = alloca i32, align 4
  %p.addr = alloca i32, align 4
  %lcptr = alloca %struct.ph_lc_s*, align 8
  %rcptr = alloca %struct.ph_rc_s*, align 8
  %buf = alloca [4096 x i8], align 16
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  store i8 %ci, i8* %ci.addr, align 1
  store i8 %lc, i8* %lc.addr, align 1
  store i8 %rc, i8* %rc.addr, align 1
  store i32 %wpos, i32* %wpos.addr, align 4
  store i32 %p, i32* %p.addr, align 4
  %0 = load i32, i32* %p.addr, align 4
  %1 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %1, i32 0, i32 1
  %2 = load i32, i32* %n_phone, align 4
  %cmp = icmp slt i32 %0, %2
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.74, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 169, i8* getelementptr inbounds ([83 x i8], [83 x i8]* @__PRETTY_FUNCTION__.triphone_add, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %3, %cond.true
  %4 = load i8, i8* %ci.addr, align 1
  %5 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %5, i32 0, i32 8
  %6 = load %struct.phone_t*, %struct.phone_t** %phone, align 8
  %7 = load i32, i32* %p.addr, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds %struct.phone_t, %struct.phone_t* %6, i64 %idxprom
  %ci1 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx, i32 0, i32 2
  store i8 %4, i8* %ci1, align 4
  %8 = load i8, i8* %lc.addr, align 1
  %9 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone2 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %9, i32 0, i32 8
  %10 = load %struct.phone_t*, %struct.phone_t** %phone2, align 8
  %11 = load i32, i32* %p.addr, align 4
  %idxprom3 = sext i32 %11 to i64
  %arrayidx4 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %10, i64 %idxprom3
  %lc5 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx4, i32 0, i32 3
  store i8 %8, i8* %lc5, align 1
  %12 = load i8, i8* %rc.addr, align 1
  %13 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone6 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %13, i32 0, i32 8
  %14 = load %struct.phone_t*, %struct.phone_t** %phone6, align 8
  %15 = load i32, i32* %p.addr, align 4
  %idxprom7 = sext i32 %15 to i64
  %arrayidx8 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %14, i64 %idxprom7
  %rc9 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx8, i32 0, i32 4
  store i8 %12, i8* %rc9, align 2
  %16 = load i32, i32* %wpos.addr, align 4
  %17 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone10 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %17, i32 0, i32 8
  %18 = load %struct.phone_t*, %struct.phone_t** %phone10, align 8
  %19 = load i32, i32* %p.addr, align 4
  %idxprom11 = sext i32 %19 to i64
  %arrayidx12 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %18, i64 %idxprom11
  %wpos13 = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx12, i32 0, i32 5
  store i32 %16, i32* %wpos13, align 4
  %20 = load i32, i32* %p.addr, align 4
  %21 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %21, i32 0, i32 0
  %22 = load i32, i32* %n_ciphone, align 8
  %cmp14 = icmp sge i32 %20, %22
  br i1 %cmp14, label %if.then, label %if.end49

if.then:                                          ; preds = %cond.end
  %23 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %23, i32 0, i32 15
  %24 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist, align 8
  %25 = load i32, i32* %wpos.addr, align 4
  %idxprom15 = zext i32 %25 to i64
  %arrayidx16 = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %24, i64 %idxprom15
  %26 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx16, align 8
  %27 = load i8, i8* %ci.addr, align 1
  %conv = sext i8 %27 to i32
  %idxprom17 = sext i32 %conv to i64
  %arrayidx18 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %26, i64 %idxprom17
  %28 = load %struct.ph_lc_s*, %struct.ph_lc_s** %arrayidx18, align 8
  %29 = load i8, i8* %lc.addr, align 1
  %call = call %struct.ph_lc_s* @find_ph_lc(%struct.ph_lc_s* %28, i8 signext %29)
  store %struct.ph_lc_s* %call, %struct.ph_lc_s** %lcptr, align 8
  %cmp19 = icmp eq %struct.ph_lc_s* %call, null
  br i1 %cmp19, label %if.then21, label %if.end

if.then21:                                        ; preds = %if.then
  %call22 = call i8* @__ckd_calloc__(i64 1, i64 24, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 182)
  %30 = bitcast i8* %call22 to %struct.ph_lc_s*
  store %struct.ph_lc_s* %30, %struct.ph_lc_s** %lcptr, align 8
  %31 = load i8, i8* %lc.addr, align 1
  %32 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %lc23 = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %32, i32 0, i32 0
  store i8 %31, i8* %lc23, align 8
  %33 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist24 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %33, i32 0, i32 15
  %34 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist24, align 8
  %35 = load i32, i32* %wpos.addr, align 4
  %idxprom25 = zext i32 %35 to i64
  %arrayidx26 = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %34, i64 %idxprom25
  %36 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx26, align 8
  %37 = load i8, i8* %ci.addr, align 1
  %conv27 = sext i8 %37 to i32
  %idxprom28 = sext i32 %conv27 to i64
  %arrayidx29 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %36, i64 %idxprom28
  %38 = load %struct.ph_lc_s*, %struct.ph_lc_s** %arrayidx29, align 8
  %39 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %next = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %39, i32 0, i32 2
  store %struct.ph_lc_s* %38, %struct.ph_lc_s** %next, align 8
  %40 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %41 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %wpos_ci_lclist30 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %41, i32 0, i32 15
  %42 = load %struct.ph_lc_s***, %struct.ph_lc_s**** %wpos_ci_lclist30, align 8
  %43 = load i32, i32* %wpos.addr, align 4
  %idxprom31 = zext i32 %43 to i64
  %arrayidx32 = getelementptr inbounds %struct.ph_lc_s**, %struct.ph_lc_s*** %42, i64 %idxprom31
  %44 = load %struct.ph_lc_s**, %struct.ph_lc_s*** %arrayidx32, align 8
  %45 = load i8, i8* %ci.addr, align 1
  %conv33 = sext i8 %45 to i32
  %idxprom34 = sext i32 %conv33 to i64
  %arrayidx35 = getelementptr inbounds %struct.ph_lc_s*, %struct.ph_lc_s** %44, i64 %idxprom34
  store %struct.ph_lc_s* %40, %struct.ph_lc_s** %arrayidx35, align 8
  br label %if.end

if.end:                                           ; preds = %if.then21, %if.then
  %46 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %rclist = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %46, i32 0, i32 1
  %47 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rclist, align 8
  %48 = load i8, i8* %rc.addr, align 1
  %call36 = call %struct.ph_rc_s* @find_ph_rc(%struct.ph_rc_s* %47, i8 signext %48)
  store %struct.ph_rc_s* %call36, %struct.ph_rc_s** %rcptr, align 8
  %cmp37 = icmp ne %struct.ph_rc_s* %call36, null
  br i1 %cmp37, label %if.then39, label %if.end42

if.then39:                                        ; preds = %if.end
  %49 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %50 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %pid = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %50, i32 0, i32 1
  %51 = load i32, i32* %pid, align 4
  %arraydecay = getelementptr inbounds [4096 x i8], [4096 x i8]* %buf, i32 0, i32 0
  %call40 = call i32 @mdef_phone_str(%struct.mdef_t* %49, i32 %51, i8* %arraydecay)
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 191, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %arraydecay41 = getelementptr inbounds [4096 x i8], [4096 x i8]* %buf, i32 0, i32 0
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.75, i32 0, i32 0), i8* %arraydecay41)
  br label %if.end42

if.end42:                                         ; preds = %if.then39, %if.end
  %call43 = call i8* @__ckd_calloc__(i64 1, i64 16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i32 194)
  %52 = bitcast i8* %call43 to %struct.ph_rc_s*
  store %struct.ph_rc_s* %52, %struct.ph_rc_s** %rcptr, align 8
  %53 = load i8, i8* %rc.addr, align 1
  %54 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %rc44 = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %54, i32 0, i32 0
  store i8 %53, i8* %rc44, align 8
  %55 = load i32, i32* %p.addr, align 4
  %56 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %pid45 = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %56, i32 0, i32 1
  store i32 %55, i32* %pid45, align 4
  %57 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %rclist46 = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %57, i32 0, i32 1
  %58 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rclist46, align 8
  %59 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %next47 = getelementptr inbounds %struct.ph_rc_s, %struct.ph_rc_s* %59, i32 0, i32 2
  store %struct.ph_rc_s* %58, %struct.ph_rc_s** %next47, align 8
  %60 = load %struct.ph_rc_s*, %struct.ph_rc_s** %rcptr, align 8
  %61 = load %struct.ph_lc_s*, %struct.ph_lc_s** %lcptr, align 8
  %rclist48 = getelementptr inbounds %struct.ph_lc_s, %struct.ph_lc_s* %61, i32 0, i32 1
  store %struct.ph_rc_s* %60, %struct.ph_rc_s** %rclist48, align 8
  br label %if.end49

if.end49:                                         ; preds = %if.end42, %cond.end
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @parse_tmat_senmap(%struct.mdef_t* %m, i8* %line, i32 %off, i32 %p) #0 {
entry:
  %m.addr = alloca %struct.mdef_t*, align 8
  %line.addr = alloca i8*, align 8
  %off.addr = alloca i32, align 4
  %p.addr = alloca i32, align 4
  %wlen = alloca i32, align 4
  %n = alloca i32, align 4
  %s = alloca i32, align 4
  %word = alloca [1024 x i8], align 16
  %lp = alloca i8*, align 8
  store %struct.mdef_t* %m, %struct.mdef_t** %m.addr, align 8
  store i8* %line, i8** %line.addr, align 8
  store i32 %off, i32* %off.addr, align 4
  store i32 %p, i32* %p.addr, align 4
  %0 = load i8*, i8** %line.addr, align 8
  %1 = load i32, i32* %off.addr, align 4
  %idx.ext = sext i32 %1 to i64
  %add.ptr = getelementptr inbounds i8, i8* %0, i64 %idx.ext
  store i8* %add.ptr, i8** %lp, align 8
  %2 = load i8*, i8** %lp, align 8
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %2, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.76, i32 0, i32 0), i32* %n, i32* %wlen) #7
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load i32, i32* %n, align 4
  %cmp1 = icmp slt i32 %3, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 381, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %4 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.77, i32 0, i32 0), i8* %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %5 = load i32, i32* %n, align 4
  %6 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %phone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %6, i32 0, i32 8
  %7 = load %struct.phone_t*, %struct.phone_t** %phone, align 8
  %8 = load i32, i32* %p.addr, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds %struct.phone_t, %struct.phone_t* %7, i64 %idxprom
  %tmat = getelementptr inbounds %struct.phone_t, %struct.phone_t* %arrayidx, i32 0, i32 1
  store i32 %5, i32* %tmat, align 4
  %9 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_tmat = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %9, i32 0, i32 5
  %10 = load i32, i32* %n_tmat, align 4
  %11 = load i32, i32* %n, align 4
  %cmp2 = icmp sle i32 %10, %11
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 384, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %12 = load i32, i32* %n, align 4
  %13 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_tmat4 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %13, i32 0, i32 5
  %14 = load i32, i32* %n_tmat4, align 4
  %15 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.78, i32 0, i32 0), i32 %12, i32 %14, i8* %15)
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %16 = load i32, i32* %wlen, align 4
  %17 = load i8*, i8** %lp, align 8
  %idx.ext6 = sext i32 %16 to i64
  %add.ptr7 = getelementptr inbounds i8, i8* %17, i64 %idx.ext6
  store i8* %add.ptr7, i8** %lp, align 8
  store i32 0, i32* %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end5
  %18 = load i32, i32* %n, align 4
  %19 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_emit_state = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %19, i32 0, i32 2
  %20 = load i32, i32* %n_emit_state, align 8
  %cmp8 = icmp slt i32 %18, %20
  br i1 %cmp8, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %21 = load i8*, i8** %lp, align 8
  %call9 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %21, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.76, i32 0, i32 0), i32* %s, i32* %wlen) #7
  %cmp10 = icmp ne i32 %call9, 1
  br i1 %cmp10, label %if.then13, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %for.body
  %22 = load i32, i32* %s, align 4
  %cmp12 = icmp slt i32 %22, 0
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %lor.lhs.false11, %for.body
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 390, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %23 = load i32, i32* %n, align 4
  %24 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.79, i32 0, i32 0), i32 %23, i8* %24)
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %lor.lhs.false11
  %25 = load i32, i32* %p.addr, align 4
  %26 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %26, i32 0, i32 0
  %27 = load i32, i32* %n_ciphone, align 8
  %cmp15 = icmp slt i32 %25, %27
  br i1 %cmp15, label %land.lhs.true, label %if.end19

land.lhs.true:                                    ; preds = %if.end14
  %28 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ci_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %28, i32 0, i32 3
  %29 = load i32, i32* %n_ci_sen, align 4
  %30 = load i32, i32* %s, align 4
  %cmp16 = icmp sle i32 %29, %30
  br i1 %cmp16, label %if.then17, label %if.end19

if.then17:                                        ; preds = %land.lhs.true
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 392, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %31 = load i32, i32* %s, align 4
  %32 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_ci_sen18 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %32, i32 0, i32 3
  %33 = load i32, i32* %n_ci_sen18, align 4
  %34 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.80, i32 0, i32 0), i32 %31, i32 %33, i8* %34)
  br label %if.end19

if.end19:                                         ; preds = %if.then17, %land.lhs.true, %if.end14
  %35 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %35, i32 0, i32 4
  %36 = load i32, i32* %n_sen, align 8
  %37 = load i32, i32* %s, align 4
  %cmp20 = icmp sle i32 %36, %37
  br i1 %cmp20, label %if.then21, label %if.end23

if.then21:                                        ; preds = %if.end19
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 394, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %38 = load i32, i32* %s, align 4
  %39 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %n_sen22 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %39, i32 0, i32 4
  %40 = load i32, i32* %n_sen22, align 8
  %41 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.81, i32 0, i32 0), i32 %38, i32 %40, i8* %41)
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.end19
  %42 = load i32, i32* %s, align 4
  %conv = trunc i32 %42 to i16
  %43 = load %struct.mdef_t*, %struct.mdef_t** %m.addr, align 8
  %sseq = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %43, i32 0, i32 9
  %44 = load i16**, i16*** %sseq, align 8
  %45 = load i32, i32* %p.addr, align 4
  %idxprom24 = sext i32 %45 to i64
  %arrayidx25 = getelementptr inbounds i16*, i16** %44, i64 %idxprom24
  %46 = load i16*, i16** %arrayidx25, align 8
  %47 = load i32, i32* %n, align 4
  %idxprom26 = sext i32 %47 to i64
  %arrayidx27 = getelementptr inbounds i16, i16* %46, i64 %idxprom26
  store i16 %conv, i16* %arrayidx27, align 2
  %48 = load i32, i32* %wlen, align 4
  %49 = load i8*, i8** %lp, align 8
  %idx.ext28 = sext i32 %48 to i64
  %add.ptr29 = getelementptr inbounds i8, i8* %49, i64 %idx.ext28
  store i8* %add.ptr29, i8** %lp, align 8
  br label %for.inc

for.inc:                                          ; preds = %if.end23
  %50 = load i32, i32* %n, align 4
  %inc = add nsw i32 %50, 1
  store i32 %inc, i32* %n, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %51 = load i8*, i8** %lp, align 8
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call30 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %51, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay, i32* %wlen) #7
  %cmp31 = icmp ne i32 %call30, 1
  br i1 %cmp31, label %if.then38, label %lor.lhs.false33

lor.lhs.false33:                                  ; preds = %for.end
  %arraydecay34 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call35 = call i32 @strcmp(i8* %arraydecay34, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.82, i32 0, i32 0)) #8
  %cmp36 = icmp ne i32 %call35, 0
  br i1 %cmp36, label %if.then38, label %if.end39

if.then38:                                        ; preds = %lor.lhs.false33, %for.end
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 402, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %52 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.83, i32 0, i32 0), i8* %52)
  br label %if.end39

if.end39:                                         ; preds = %if.then38, %lor.lhs.false33
  %53 = load i32, i32* %wlen, align 4
  %54 = load i8*, i8** %lp, align 8
  %idx.ext40 = sext i32 %53 to i64
  %add.ptr41 = getelementptr inbounds i8, i8* %54, i64 %idx.ext40
  store i8* %add.ptr41, i8** %lp, align 8
  %55 = load i8*, i8** %lp, align 8
  %arraydecay42 = getelementptr inbounds [1024 x i8], [1024 x i8]* %word, i32 0, i32 0
  %call43 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %55, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i8* %arraydecay42, i32* %wlen) #7
  %cmp44 = icmp eq i32 %call43, 1
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.end39
  call void @_E__pr_header(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i64 407, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0))
  %56 = load i8*, i8** %line.addr, align 8
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.84, i32 0, i32 0), i8* %56)
  br label %if.end47

if.end47:                                         ; preds = %if.then46, %if.end39
  ret void
}

declare dso_local i8* @__ckd_salloc__(i8*, i8*, i32) #1

declare dso_local i32 @hash_enter(%struct.hash_table_t*, i8*, i32) #1

declare dso_local i32 @hash_enter_bkey(%struct.hash_table_t*, i8*, i32, i32) #1

declare dso_local %struct.gnode_s* @hash_tolist(%struct.hash_table_t*, i32*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #5

declare dso_local void @glist_free(%struct.gnode_s*) #1

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
