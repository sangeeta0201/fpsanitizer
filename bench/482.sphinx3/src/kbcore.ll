; ModuleID = 'kbcore.bc'
source_filename = "kbcore.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.kbcore_t = type { %struct.feat_s*, %struct.mdef_t*, %struct.dict_t*, %struct.dict2pid_t*, %struct.lm_s*, %struct.lmset_s*, %struct.fillpen_t*, i16*, %struct.mgau_model_t*, %struct.subvq_t*, %struct.gs_s*, %struct.tmat_t*, i32, i32 }
%struct.feat_s = type { i8*, i32, i32, i32, i32*, i32, i32, i32, i32, void (%struct.feat_s*, float**, float**)* }
%struct.mdef_t = type { i32, i32, i32, i32, i32, i32, %struct.hash_table_t*, %struct.ciphone_t*, %struct.phone_t*, i16**, i32, i16*, i8*, i32*, i8, %struct.ph_lc_s*** }
%struct.hash_table_t = type { %struct.hash_entry_s*, i32, i8 }
%struct.hash_entry_s = type { i8*, i32, i32, %struct.hash_entry_s* }
%struct.ciphone_t = type { i8*, i32 }
%struct.phone_t = type { i32, i32, i8, i8, i8, i32 }
%struct.ph_lc_s = type { i8, %struct.ph_rc_s*, %struct.ph_lc_s* }
%struct.ph_rc_s = type { i8, i32, %struct.ph_rc_s* }
%struct.dict_t = type { %struct.mdef_t*, %struct.hash_table_t*, i8**, i32, %struct.dictword_t*, %struct.hash_table_t*, i32, i32, i32, i32, i32*, i32, i32, i32 }
%struct.dictword_t = type { i8*, i8*, i32, i32, i32, i32, i32* }
%struct.dict2pid_t = type { i32**, i32***, i32**, i16**, i16**, i32*, i32, i32 }
%struct.lm_s = type { i32, i32, i32, i32, i8**, i16, i16, i32, i32, %struct.ug_t*, %struct.bg_t*, %struct.tg_t*, %struct.membg_t*, %struct.tginfo_s**, %union.lmlog_t*, %union.lmlog_t*, %union.lmlog_t*, i32*, i32, i32, i32, %struct._IO_FILE*, i32, i32, i32, float, i32, %struct.lm_tgcache_entry_t*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i16*, i32, %struct.lmclass_s**, i32, i32* }
%struct.ug_t = type { i32, %union.lmlog_t, %union.lmlog_t, i32 }
%union.lmlog_t = type { float }
%struct.bg_t = type { i16, i16, i16, i16 }
%struct.tg_t = type { i16, i16 }
%struct.membg_t = type { %struct.bg_t*, i32 }
%struct.tginfo_s = type { i16, i32, %struct.tg_t*, i32, i32, %struct.tginfo_s* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.lm_tgcache_entry_t = type { [3 x i16], i32 }
%struct.lmclass_s = type { i8*, %struct.lmclass_word_s*, %struct.lmclass_s* }
%struct.lmclass_word_s = type { i8*, i32, i32, %struct.lmclass_word_s* }
%struct.lmset_s = type { i8*, %struct.lm_s* }
%struct.fillpen_t = type { %struct.dict_t*, i32*, double, double }
%struct.mgau_model_t = type { i32, i32, i32, %struct.mgau_t*, double, i32, i32, i32 }
%struct.mgau_t = type { i32, float**, float**, float*, i32* }
%struct.subvq_t = type { %struct.arraysize_t, i32, i32, i32**, %struct.vector_gautbl_t*, i32***, float*, i32**, i32*, i32* }
%struct.arraysize_t = type { i32, i32 }
%struct.vector_gautbl_t = type { i32, i32, float**, float**, float*, double }
%struct.gs_s = type { i32, i32, i32, i32, i32, i32, float**, i32***, %struct._IO_FILE*, i32* }
%struct.tmat_t = type { i32***, i32, i32 }

@.str = private unnamed_addr constant [9 x i8] c"kbcore.c\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"INFO\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"Initializing core models:\0A\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"FATAL_ERROR\00", align 1
@.str.4 = private unnamed_addr constant [35 x i8] c"Please specified the feature type\0A\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"feat_init(%s) failed\0A\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c".cont.\00", align 1
@.str.7 = private unnamed_addr constant [60 x i8] c"#Feature streams(%d) in the feature for continuous HMM!= 1\0A\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c".semi.\00", align 1
@.str.9 = private unnamed_addr constant [65 x i8] c"#Feature streams(%d) in the feature for semi-continuous HMM!= 4\0A\00", align 1
@.str.10 = private unnamed_addr constant [42 x i8] c"Feature should be either .semi. or .cont.\00", align 1
@.str.11 = private unnamed_addr constant [22 x i8] c"mdef_init(%s) failed\0A\00", align 1
@.str.12 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.13 = private unnamed_addr constant [70 x i8] c"Compound word separator(%s) must be empty or single character string\0A\00", align 1
@.str.14 = private unnamed_addr constant [28 x i8] c"dict_init(%s,%s,%s) failed\0A\00", align 1
@.str.15 = private unnamed_addr constant [50 x i8] c"Please only specify either -lmfile or -lmctlfile\0A\00", align 1
@.str.16 = private unnamed_addr constant [52 x i8] c"Please specify either one of -lmfile or -lmctlfile\0A\00", align 1
@.str.17 = private unnamed_addr constant [32 x i8] c"lm_read(%s, %e, %e, %e) failed\0A\00", align 1
@.str.18 = private unnamed_addr constant [21 x i8] c"Reading LM ctl file\0A\00", align 1
@.str.19 = private unnamed_addr constant [22 x i8] c"kb->lmset[0].name %s\0A\00", align 1
@.str.20 = private unnamed_addr constant [34 x i8] c"lm_read_ctl(%s,%e,%e,%e) failed\0A:\00", align 1
@.str.21 = private unnamed_addr constant [55 x i8] c"No dictionary for associating filler penalty file(%s)\0A\00", align 1
@.str.22 = private unnamed_addr constant [25 x i8] c"fillpen_init(%s) failed\0A\00", align 1
@.str.23 = private unnamed_addr constant [32 x i8] c"Dict/LM word-id mapping failed\0A\00", align 1
@.str.24 = private unnamed_addr constant [58 x i8] c"Dict/LM word-id mapping failed for LM index %d, named %s\0A\00", align 1
@.str.25 = private unnamed_addr constant [59 x i8] c"Varfile or mixwfile not specified along with meanfile(%s)\0A\00", align 1
@.str.26 = private unnamed_addr constant [32 x i8] c"gauden_init(%s, %s, %e) failed\0A\00", align 1
@.str.27 = private unnamed_addr constant [32 x i8] c"subvq_init (%s, %e, -1) failed\0A\00", align 1
@.str.28 = private unnamed_addr constant [20 x i8] c"gs_read(%s) failed\0A\00", align 1
@.str.29 = private unnamed_addr constant [41 x i8] c"After reading the number of senones: %d\0A\00", align 1
@.str.30 = private unnamed_addr constant [27 x i8] c"tmat_init (%s, %e) failed\0A\00", align 1
@.str.31 = private unnamed_addr constant [31 x i8] c"Verifying models consistency:\0A\00", align 1
@.str.32 = private unnamed_addr constant [45 x i8] c"Feature streamlen(%d) != mgau streamlen(%d)\0A\00", align 1
@.str.33 = private unnamed_addr constant [40 x i8] c"Mdef #senones(%d) != mgau #senones(%d)\0A\00", align 1
@.str.34 = private unnamed_addr constant [32 x i8] c"Mdef #tmat(%d) != tmatfile(%d)\0A\00", align 1
@.str.35 = private unnamed_addr constant [38 x i8] c"Mdef #states(%d) != tmat #states(%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local %struct.kbcore_t* @kbcore_init(double %logbase, i8* %feattype, i8* %cmn, i8* %varnorm, i8* %agc, i8* %mdeffile, i8* %dictfile, i8* %fdictfile, i8* %compsep, i8* %lmfile, i8* %lmctlfile, i8* %lmdumpdir, i8* %fillpenfile, i8* %senmgau, double %silprob, double %fillprob, double %langwt, double %inspen, double %uw, i8* %meanfile, i8* %varfile, double %varfloor, i8* %mixwfile, double %mixwfloor, i8* %subvqfile, i8* %gsfile, i8* %tmatfile, double %tmatfloor) local_unnamed_addr #0 {
entry:
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 95, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0)) #4
  %call = tail call i8* @__ckd_calloc__(i64 1, i64 104, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i32 97) #4
  %0 = bitcast i8* %call to %struct.kbcore_t*
  %fcb = bitcast i8* %call to %struct.feat_s**
  %mdef = getelementptr inbounds i8, i8* %call, i64 8
  %1 = bitcast i8* %mdef to %struct.mdef_t**
  %dict = getelementptr inbounds i8, i8* %call, i64 16
  %2 = bitcast i8* %dict to %struct.dict_t**
  %dict2pid = getelementptr inbounds i8, i8* %call, i64 24
  %3 = bitcast i8* %dict2pid to %struct.dict2pid_t**
  %lm = getelementptr inbounds i8, i8* %call, i64 32
  %4 = bitcast i8* %lm to %struct.lm_s**
  %fillpen = getelementptr inbounds i8, i8* %call, i64 48
  %5 = bitcast i8* %fillpen to %struct.fillpen_t**
  %dict2lmwid = getelementptr inbounds i8, i8* %call, i64 56
  %6 = bitcast i8* %dict2lmwid to i16**
  %mgau = getelementptr inbounds i8, i8* %call, i64 64
  %7 = bitcast i8* %mgau to %struct.mgau_model_t**
  %svq = getelementptr inbounds i8, i8* %call, i64 72
  %8 = bitcast i8* %svq to %struct.subvq_t**
  %tmat = getelementptr inbounds i8, i8* %call, i64 88
  %9 = bitcast i8* %tmat to %struct.tmat_t**
  %n_lm = getelementptr inbounds i8, i8* %call, i64 96
  %10 = bitcast i8* %n_lm to i32*
  %n_alloclm = getelementptr inbounds i8, i8* %call, i64 100
  %11 = bitcast i8* %n_alloclm to i32*
  call void @llvm.memset.p0i8.i64(i8* align 8 %call, i8 0, i64 40, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %fillpen, i8 0, i64 32, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %tmat, i8 0, i64 16, i1 false)
  %call1 = tail call i32 @logs3_init(double %logbase) #4
  %tobool = icmp eq i8* %feattype, null
  br i1 %tobool, label %if.then, label %if.then3

if.then:                                          ; preds = %entry
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 115, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.4, i64 0, i64 0)) #4
  br label %if.end122

if.then3:                                         ; preds = %entry
  %call4 = tail call %struct.feat_s* @feat_init(i8* nonnull %feattype, i8* %cmn, i8* %varnorm, i8* %agc) #4
  store %struct.feat_s* %call4, %struct.feat_s** %fcb, align 8, !tbaa !2
  %cmp = icmp eq %struct.feat_s* %call4, null
  br i1 %cmp, label %if.then6, label %cond.end

if.then6:                                         ; preds = %if.then3
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 119, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0), i8* nonnull %feattype) #4
  br label %cond.end

cond.end:                                         ; preds = %if.then3, %if.then6
  %call45 = tail call i32 @strcmp(i8* %senmgau, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0)) #4
  %cmp46 = icmp eq i32 %call45, 0
  br i1 %cmp46, label %if.then48, label %cond.end106

if.then48:                                        ; preds = %cond.end
  %12 = load %struct.feat_s*, %struct.feat_s** %fcb, align 8, !tbaa !2
  %n_stream = getelementptr inbounds %struct.feat_s, %struct.feat_s* %12, i64 0, i32 3
  %13 = load i32, i32* %n_stream, align 8, !tbaa !8
  %cmp50 = icmp eq i32 %13, 1
  br i1 %cmp50, label %if.end122, label %if.then52

if.then52:                                        ; preds = %if.then48
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 123, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  %14 = load %struct.feat_s*, %struct.feat_s** %fcb, align 8, !tbaa !2
  %n_stream54 = getelementptr inbounds %struct.feat_s, %struct.feat_s* %14, i64 0, i32 3
  %15 = load i32, i32* %n_stream54, align 8, !tbaa !8
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.7, i64 0, i64 0), i32 %15) #4
  br label %if.end122

cond.end106:                                      ; preds = %cond.end
  %call105 = tail call i32 @strcmp(i8* %senmgau, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0)) #4
  %cmp108 = icmp eq i32 %call105, 0
  br i1 %cmp108, label %if.then110, label %if.else119

if.then110:                                       ; preds = %cond.end106
  %16 = load %struct.feat_s*, %struct.feat_s** %fcb, align 8, !tbaa !2
  %n_stream112 = getelementptr inbounds %struct.feat_s, %struct.feat_s* %16, i64 0, i32 3
  %17 = load i32, i32* %n_stream112, align 8, !tbaa !8
  %cmp113 = icmp eq i32 %17, 4
  br i1 %cmp113, label %if.end122, label %if.then115

if.then115:                                       ; preds = %if.then110
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 126, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  %18 = load %struct.feat_s*, %struct.feat_s** %fcb, align 8, !tbaa !2
  %n_stream117 = getelementptr inbounds %struct.feat_s, %struct.feat_s* %18, i64 0, i32 3
  %19 = load i32, i32* %n_stream117, align 8, !tbaa !8
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.9, i64 0, i64 0), i32 %19) #4
  br label %if.end122

if.else119:                                       ; preds = %cond.end106
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 128, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.10, i64 0, i64 0)) #4
  br label %if.end122

if.end122:                                        ; preds = %if.then, %if.then48, %if.then110, %if.then52, %if.then115, %if.else119
  %tobool123 = icmp eq i8* %mdeffile, null
  br i1 %tobool123, label %if.end131, label %if.then124

if.then124:                                       ; preds = %if.end122
  %call125 = tail call %struct.mdef_t* @mdef_init(i8* nonnull %mdeffile) #4
  store %struct.mdef_t* %call125, %struct.mdef_t** %1, align 8, !tbaa !10
  %cmp127 = icmp eq %struct.mdef_t* %call125, null
  br i1 %cmp127, label %if.then129, label %if.end131

if.then129:                                       ; preds = %if.then124
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 134, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.11, i64 0, i64 0), i8* nonnull %mdeffile) #4
  br label %if.end131

if.end131:                                        ; preds = %if.end122, %if.then124, %if.then129
  %tobool132 = icmp eq i8* %dictfile, null
  br i1 %tobool132, label %if.end162, label %if.then133

if.then133:                                       ; preds = %if.end131
  %tobool134 = icmp eq i8* %compsep, null
  br i1 %tobool134, label %if.end148, label %if.else136

if.else136:                                       ; preds = %if.then133
  %20 = load i8, i8* %compsep, align 1, !tbaa !11
  %cmp139 = icmp eq i8 %20, 0
  br i1 %cmp139, label %if.end148, label %land.lhs.true141

land.lhs.true141:                                 ; preds = %if.else136
  %arrayidx142 = getelementptr inbounds i8, i8* %compsep, i64 1
  %21 = load i8, i8* %arrayidx142, align 1, !tbaa !11
  %cmp144 = icmp eq i8 %21, 0
  br i1 %cmp144, label %if.end148, label %if.then146

if.then146:                                       ; preds = %land.lhs.true141
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 141, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.13, i64 0, i64 0), i8* nonnull %compsep) #4
  br label %if.end148

if.end148:                                        ; preds = %if.then133, %land.lhs.true141, %if.else136, %if.then146
  %compsep.addr.0 = phi i8* [ %compsep, %if.then146 ], [ %compsep, %land.lhs.true141 ], [ %compsep, %if.else136 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0), %if.then133 ]
  %22 = load %struct.mdef_t*, %struct.mdef_t** %1, align 8, !tbaa !10
  %23 = load i8, i8* %compsep.addr.0, align 1, !tbaa !11
  %call151 = tail call %struct.dict_t* @dict_init(%struct.mdef_t* %22, i8* nonnull %dictfile, i8* %fdictfile, i8 signext %23) #4
  store %struct.dict_t* %call151, %struct.dict_t** %2, align 8, !tbaa !12
  %cmp153 = icmp eq %struct.dict_t* %call151, null
  br i1 %cmp153, label %if.then155, label %if.end162

if.then155:                                       ; preds = %if.end148
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 145, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  %tobool156 = icmp eq i8* %fdictfile, null
  %cond160 = select i1 %tobool156, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i64 0, i64 0), i8* %fdictfile
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.14, i64 0, i64 0), i8* nonnull %dictfile, i8* %cond160, i8* %compsep.addr.0) #4
  br label %if.end162

if.end162:                                        ; preds = %if.end131, %if.end148, %if.then155
  %tobool163 = icmp ne i8* %lmfile, null
  %tobool165 = icmp ne i8* %lmctlfile, null
  %or.cond389 = and i1 %tobool163, %tobool165
  br i1 %or.cond389, label %if.then166, label %if.end167

if.then166:                                       ; preds = %if.end162
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 151, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.15, i64 0, i64 0)) #4
  br label %if.end167

if.end167:                                        ; preds = %if.then166, %if.end162
  %or.cond390 = or i1 %tobool163, %tobool165
  br i1 %or.cond390, label %if.end172, label %if.then171

if.then171:                                       ; preds = %if.end167
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 154, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.16, i64 0, i64 0)) #4
  br label %if.end172

if.end172:                                        ; preds = %if.then171, %if.end167
  br i1 %tobool163, label %if.then174, label %if.end181

if.then174:                                       ; preds = %if.end172
  %call175 = tail call %struct.lm_s* @lm_read(i8* nonnull %lmfile, double %langwt, double %inspen, double %uw) #4
  store %struct.lm_s* %call175, %struct.lm_s** %4, align 8, !tbaa !13
  %cmp177 = icmp eq %struct.lm_s* %call175, null
  br i1 %cmp177, label %if.then179, label %if.end181

if.then179:                                       ; preds = %if.then174
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 158, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.17, i64 0, i64 0), i8* nonnull %lmfile, double %langwt, double %inspen, double %uw) #4
  br label %if.end181

if.end181:                                        ; preds = %if.then174, %if.then179, %if.end172
  br i1 %tobool165, label %if.then183, label %if.end196

if.then183:                                       ; preds = %if.end181
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 162, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.18, i64 0, i64 0)) #4
  %24 = load %struct.dict_t*, %struct.dict_t** %2, align 8, !tbaa !12
  %n_word = getelementptr inbounds %struct.dict_t, %struct.dict_t* %24, i64 0, i32 7
  %25 = load i32, i32* %n_word, align 4, !tbaa !14
  %call188 = tail call %struct.lmset_s* @lm_read_ctl(i8* nonnull %lmctlfile, %struct.dict_t* %24, double %langwt, double %uw, double %inspen, i8* %lmdumpdir, i32* nonnull %10, i32* nonnull %11, i32 %25) #4
  %lmset = getelementptr inbounds i8, i8* %call, i64 40
  %26 = bitcast i8* %lmset to %struct.lmset_s**
  store %struct.lmset_s* %call188, %struct.lmset_s** %26, align 8, !tbaa !16
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 165, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)) #4
  %27 = load %struct.lmset_s*, %struct.lmset_s** %26, align 8, !tbaa !16
  %name = getelementptr inbounds %struct.lmset_s, %struct.lmset_s* %27, i64 0, i32 0
  %28 = load i8*, i8** %name, align 8, !tbaa !17
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.19, i64 0, i64 0), i8* %28) #4
  %29 = load %struct.lmset_s*, %struct.lmset_s** %26, align 8, !tbaa !16
  %cmp192 = icmp eq %struct.lmset_s* %29, null
  br i1 %cmp192, label %if.then194, label %if.end196

if.then194:                                       ; preds = %if.then183
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 167, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.20, i64 0, i64 0), i8* nonnull %lmctlfile, double %langwt, double %inspen, double %uw) #4
  br label %if.end196

if.end196:                                        ; preds = %if.then183, %if.then194, %if.end181
  %tobool197 = icmp eq i8* %fillpenfile, null
  br i1 %tobool197, label %lor.lhs.false, label %if.then207

lor.lhs.false:                                    ; preds = %if.end196
  br i1 %tobool163, label %land.lhs.true199, label %lor.lhs.false202

land.lhs.true199:                                 ; preds = %lor.lhs.false
  %30 = load %struct.dict_t*, %struct.dict_t** %2, align 8, !tbaa !12
  %tobool201 = icmp eq %struct.dict_t* %30, null
  br i1 %tobool201, label %lor.lhs.false202, label %if.end211

lor.lhs.false202:                                 ; preds = %land.lhs.true199, %lor.lhs.false
  br i1 %tobool165, label %land.lhs.true204, label %if.end219

land.lhs.true204:                                 ; preds = %lor.lhs.false202
  %31 = load %struct.dict_t*, %struct.dict_t** %2, align 8, !tbaa !12
  %tobool206 = icmp eq %struct.dict_t* %31, null
  br i1 %tobool206, label %if.end264, label %if.end211

if.then207:                                       ; preds = %if.end196
  %.pr = load %struct.dict_t*, %struct.dict_t** %2, align 8, !tbaa !12
  %tobool209 = icmp eq %struct.dict_t* %.pr, null
  br i1 %tobool209, label %if.then210, label %if.end211

if.then210:                                       ; preds = %if.then207
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 173, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.21, i64 0, i64 0), i8* nonnull %fillpenfile) #4
  br label %if.end211

if.end211:                                        ; preds = %land.lhs.true204, %land.lhs.true199, %if.then207, %if.then210
  %32 = load %struct.dict_t*, %struct.dict_t** %2, align 8, !tbaa !12
  %call213 = tail call %struct.fillpen_t* @fillpen_init(%struct.dict_t* %32, i8* %fillpenfile, double %silprob, double %fillprob, double %langwt, double %inspen) #4
  store %struct.fillpen_t* %call213, %struct.fillpen_t** %5, align 8, !tbaa !19
  %cmp215 = icmp eq %struct.fillpen_t* %call213, null
  br i1 %cmp215, label %if.then217, label %if.end219

if.then217:                                       ; preds = %if.end211
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 177, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.22, i64 0, i64 0), i8* %fillpenfile) #4
  br label %if.end219

if.end219:                                        ; preds = %if.end211, %if.then217, %lor.lhs.false202
  %.pr565 = load %struct.dict_t*, %struct.dict_t** %2, align 8, !tbaa !12
  %tobool221 = icmp eq %struct.dict_t* %.pr565, null
  br i1 %tobool221, label %if.end264, label %land.lhs.true222

land.lhs.true222:                                 ; preds = %if.end219
  %33 = load %struct.lm_s*, %struct.lm_s** %4, align 8, !tbaa !13
  %tobool224 = icmp eq %struct.lm_s* %33, null
  br i1 %tobool224, label %land.lhs.true238, label %if.then225

if.then225:                                       ; preds = %land.lhs.true222
  %conv228 = fptosi double %langwt to i32
  %call229 = tail call i16* @wid_dict_lm_map(%struct.dict_t* nonnull %.pr565, %struct.lm_s* nonnull %33, i32 %conv228) #4
  store i16* %call229, i16** %6, align 8, !tbaa !20
  %cmp231 = icmp eq i16* %call229, null
  br i1 %cmp231, label %if.then233, label %if.end235

if.then233:                                       ; preds = %if.then225
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 184, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.23, i64 0, i64 0)) #4
  br label %if.end235

if.end235:                                        ; preds = %if.then225, %if.then233
  %.pr567 = load %struct.dict_t*, %struct.dict_t** %2, align 8, !tbaa !12
  %tobool237 = icmp eq %struct.dict_t* %.pr567, null
  br i1 %tobool237, label %if.end264, label %land.lhs.true238

land.lhs.true238:                                 ; preds = %land.lhs.true222, %if.end235
  %lmset239 = getelementptr inbounds i8, i8* %call, i64 40
  %34 = bitcast i8* %lmset239 to %struct.lmset_s**
  %35 = load %struct.lmset_s*, %struct.lmset_s** %34, align 8, !tbaa !16
  %tobool240 = icmp eq %struct.lmset_s* %35, null
  br i1 %tobool240, label %if.end264, label %for.cond.preheader

for.cond.preheader:                               ; preds = %land.lhs.true238
  %36 = load i32, i32* %10, align 8, !tbaa !21
  %cmp243575 = icmp sgt i32 %36, 0
  br i1 %cmp243575, label %for.body.lr.ph, label %if.end264

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %conv249 = fptosi double %langwt to i32
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %37 = load %struct.dict_t*, %struct.dict_t** %2, align 8, !tbaa !12
  %38 = load %struct.lmset_s*, %struct.lmset_s** %34, align 8, !tbaa !16
  %lm248 = getelementptr inbounds %struct.lmset_s, %struct.lmset_s* %38, i64 %indvars.iv, i32 1
  %39 = load %struct.lm_s*, %struct.lm_s** %lm248, align 8, !tbaa !22
  %call250 = tail call i16* @wid_dict_lm_map(%struct.dict_t* %37, %struct.lm_s* %39, i32 %conv249) #4
  %40 = load %struct.lmset_s*, %struct.lmset_s** %34, align 8, !tbaa !16
  %lm254 = getelementptr inbounds %struct.lmset_s, %struct.lmset_s* %40, i64 %indvars.iv, i32 1
  %41 = load %struct.lm_s*, %struct.lm_s** %lm254, align 8, !tbaa !22
  %dict2lmwid255 = getelementptr inbounds %struct.lm_s, %struct.lm_s* %41, i64 0, i32 38
  store i16* %call250, i16** %dict2lmwid255, align 8, !tbaa !23
  %cmp256 = icmp eq i16* %call250, null
  br i1 %cmp256, label %if.then258, label %for.inc

if.then258:                                       ; preds = %for.body
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 189, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  %42 = load %struct.lmset_s*, %struct.lmset_s** %34, align 8, !tbaa !16
  %name262 = getelementptr inbounds %struct.lmset_s, %struct.lmset_s* %42, i64 %indvars.iv, i32 0
  %43 = load i8*, i8** %name262, align 8, !tbaa !17
  %44 = trunc i64 %indvars.iv to i32
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.24, i64 0, i64 0), i32 %44, i8* %43) #4
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then258
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = load i32, i32* %10, align 8, !tbaa !21
  %46 = sext i32 %45 to i64
  %cmp243 = icmp slt i64 %indvars.iv.next, %46
  br i1 %cmp243, label %for.body, label %if.end264

if.end264:                                        ; preds = %for.inc, %for.cond.preheader, %land.lhs.true204, %if.end219, %land.lhs.true238, %if.end235
  %tobool265 = icmp eq i8* %meanfile, null
  br i1 %tobool265, label %if.end298, label %if.then266

if.then266:                                       ; preds = %if.end264
  %tobool267 = icmp ne i8* %varfile, null
  %tobool269 = icmp ne i8* %mixwfile, null
  %or.cond391 = and i1 %tobool267, %tobool269
  br i1 %or.cond391, label %if.end271, label %if.then270

if.then270:                                       ; preds = %if.then266
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 194, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.25, i64 0, i64 0), i8* nonnull %meanfile) #4
  br label %if.end271

if.end271:                                        ; preds = %if.then266, %if.then270
  %call272 = tail call %struct.mgau_model_t* @mgau_init(i8* nonnull %meanfile, i8* %varfile, double %varfloor, i8* %mixwfile, double %mixwfloor, i32 1, i8* %senmgau) #4
  store %struct.mgau_model_t* %call272, %struct.mgau_model_t** %7, align 8, !tbaa !27
  %cmp275 = icmp eq %struct.mgau_model_t* %call272, null
  br i1 %cmp275, label %if.then277, label %if.end278

if.then277:                                       ; preds = %if.end271
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 197, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.26, i64 0, i64 0), i8* nonnull %meanfile, i8* %varfile, double %varfloor) #4
  br label %if.end278

if.end278:                                        ; preds = %if.then277, %if.end271
  %tobool279 = icmp eq i8* %subvqfile, null
  br i1 %tobool279, label %if.end288, label %if.then280

if.then280:                                       ; preds = %if.end278
  %47 = load %struct.mgau_model_t*, %struct.mgau_model_t** %7, align 8, !tbaa !27
  %call282 = tail call %struct.subvq_t* @subvq_init(i8* nonnull %subvqfile, double %varfloor, i32 -1, %struct.mgau_model_t* %47) #4
  store %struct.subvq_t* %call282, %struct.subvq_t** %8, align 8, !tbaa !28
  %cmp284 = icmp eq %struct.subvq_t* %call282, null
  br i1 %cmp284, label %if.then286, label %if.end288

if.then286:                                       ; preds = %if.then280
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 201, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.27, i64 0, i64 0), i8* nonnull %subvqfile, double %varfloor) #4
  br label %if.end288

if.end288:                                        ; preds = %if.end278, %if.then280, %if.then286
  %tobool289 = icmp eq i8* %gsfile, null
  br i1 %tobool289, label %if.end298, label %if.then290

if.then290:                                       ; preds = %if.end288
  %call291 = tail call %struct.gs_s* @gs_read(i8* nonnull %gsfile) #4
  %gs = getelementptr inbounds i8, i8* %call, i64 80
  %48 = bitcast i8* %gs to %struct.gs_s**
  store %struct.gs_s* %call291, %struct.gs_s** %48, align 8, !tbaa !29
  %cmp292 = icmp eq %struct.gs_s* %call291, null
  br i1 %cmp292, label %if.then294, label %if.end295

if.then294:                                       ; preds = %if.then290
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 207, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.28, i64 0, i64 0), i8* nonnull %gsfile) #4
  br label %if.end295

if.end295:                                        ; preds = %if.then294, %if.then290
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 209, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)) #4
  %49 = load %struct.gs_s*, %struct.gs_s** %48, align 8, !tbaa !29
  %n_mgau = getelementptr inbounds %struct.gs_s, %struct.gs_s* %49, i64 0, i32 0
  %50 = load i32, i32* %n_mgau, align 8, !tbaa !30
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.29, i64 0, i64 0), i32 %50) #4
  br label %if.end298

if.end298:                                        ; preds = %if.end288, %if.end264, %if.end295
  %tobool299 = icmp eq i8* %tmatfile, null
  br i1 %tobool299, label %if.end307, label %if.then300

if.then300:                                       ; preds = %if.end298
  %call301 = tail call %struct.tmat_t* @tmat_init(i8* nonnull %tmatfile, double %tmatfloor) #4
  store %struct.tmat_t* %call301, %struct.tmat_t** %9, align 8, !tbaa !32
  %cmp303 = icmp eq %struct.tmat_t* %call301, null
  br i1 %cmp303, label %if.then305, label %if.end307

if.then305:                                       ; preds = %if.then300
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 216, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.30, i64 0, i64 0), i8* nonnull %tmatfile, double %tmatfloor) #4
  br label %if.end307

if.end307:                                        ; preds = %if.end298, %if.then300, %if.then305
  %51 = load %struct.mdef_t*, %struct.mdef_t** %1, align 8, !tbaa !10
  %tobool309 = icmp eq %struct.mdef_t* %51, null
  br i1 %tobool309, label %if.end318, label %land.lhs.true310

land.lhs.true310:                                 ; preds = %if.end307
  %52 = load %struct.dict_t*, %struct.dict_t** %2, align 8, !tbaa !12
  %tobool312 = icmp eq %struct.dict_t* %52, null
  br i1 %tobool312, label %if.end318, label %if.then313

if.then313:                                       ; preds = %land.lhs.true310
  %call316 = tail call %struct.dict2pid_t* @dict2pid_build(%struct.mdef_t* nonnull %51, %struct.dict_t* nonnull %52) #4
  store %struct.dict2pid_t* %call316, %struct.dict2pid_t** %3, align 8, !tbaa !33
  br label %if.end318

if.end318:                                        ; preds = %land.lhs.true310, %if.end307, %if.then313
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 225, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)) #4
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.31, i64 0, i64 0)) #4
  %53 = load %struct.feat_s*, %struct.feat_s** %fcb, align 8, !tbaa !2
  %tobool320 = icmp eq %struct.feat_s* %53, null
  br i1 %tobool320, label %if.end337, label %land.lhs.true321

land.lhs.true321:                                 ; preds = %if.end318
  %54 = load %struct.mgau_model_t*, %struct.mgau_model_t** %7, align 8, !tbaa !27
  %tobool323 = icmp eq %struct.mgau_model_t* %54, null
  br i1 %tobool323, label %if.end337, label %if.then324

if.then324:                                       ; preds = %land.lhs.true321
  %stream_len = getelementptr inbounds %struct.feat_s, %struct.feat_s* %53, i64 0, i32 4
  %55 = load i32*, i32** %stream_len, align 8, !tbaa !34
  %56 = load i32, i32* %55, align 4, !tbaa !35
  %veclen = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %54, i64 0, i32 2
  %57 = load i32, i32* %veclen, align 8, !tbaa !36
  %cmp328 = icmp eq i32 %56, %57
  br i1 %cmp328, label %if.end337, label %if.then330

if.then330:                                       ; preds = %if.then324
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 230, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  %58 = load %struct.feat_s*, %struct.feat_s** %fcb, align 8, !tbaa !2
  %stream_len332 = getelementptr inbounds %struct.feat_s, %struct.feat_s* %58, i64 0, i32 4
  %59 = load i32*, i32** %stream_len332, align 8, !tbaa !34
  %60 = load i32, i32* %59, align 4, !tbaa !35
  %61 = load %struct.mgau_model_t*, %struct.mgau_model_t** %7, align 8, !tbaa !27
  %veclen335 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %61, i64 0, i32 2
  %62 = load i32, i32* %veclen335, align 8, !tbaa !36
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.32, i64 0, i64 0), i32 %60, i32 %62) #4
  br label %if.end337

if.end337:                                        ; preds = %if.then324, %land.lhs.true321, %if.end318, %if.then330
  %63 = load %struct.mdef_t*, %struct.mdef_t** %1, align 8, !tbaa !10
  %tobool339 = icmp eq %struct.mdef_t* %63, null
  br i1 %tobool339, label %if.end383, label %land.lhs.true340

land.lhs.true340:                                 ; preds = %if.end337
  %64 = load %struct.mgau_model_t*, %struct.mgau_model_t** %7, align 8, !tbaa !27
  %tobool342 = icmp eq %struct.mgau_model_t* %64, null
  br i1 %tobool342, label %land.lhs.true358, label %if.then343

if.then343:                                       ; preds = %land.lhs.true340
  %n_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %63, i64 0, i32 4
  %65 = load i32, i32* %n_sen, align 8, !tbaa !39
  %n_mgau346 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %64, i64 0, i32 0
  %66 = load i32, i32* %n_mgau346, align 8, !tbaa !41
  %cmp347 = icmp eq i32 %65, %66
  br i1 %cmp347, label %if.end355, label %if.then349

if.then349:                                       ; preds = %if.then343
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 237, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  %67 = load %struct.mdef_t*, %struct.mdef_t** %1, align 8, !tbaa !10
  %n_sen351 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %67, i64 0, i32 4
  %68 = load i32, i32* %n_sen351, align 8, !tbaa !39
  %69 = load %struct.mgau_model_t*, %struct.mgau_model_t** %7, align 8, !tbaa !27
  %n_mgau353 = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %69, i64 0, i32 0
  %70 = load i32, i32* %n_mgau353, align 8, !tbaa !41
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.33, i64 0, i64 0), i32 %68, i32 %70) #4
  br label %if.end355

if.end355:                                        ; preds = %if.then343, %if.then349
  %.pr571 = load %struct.mdef_t*, %struct.mdef_t** %1, align 8, !tbaa !10
  %tobool357 = icmp eq %struct.mdef_t* %.pr571, null
  br i1 %tobool357, label %if.end383, label %land.lhs.true358

land.lhs.true358:                                 ; preds = %land.lhs.true340, %if.end355
  %71 = phi %struct.mdef_t* [ %.pr571, %if.end355 ], [ %63, %land.lhs.true340 ]
  %72 = load %struct.tmat_t*, %struct.tmat_t** %9, align 8, !tbaa !32
  %tobool360 = icmp eq %struct.tmat_t* %72, null
  br i1 %tobool360, label %if.end383, label %if.then361

if.then361:                                       ; preds = %land.lhs.true358
  %n_tmat = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %71, i64 0, i32 5
  %73 = load i32, i32* %n_tmat, align 4, !tbaa !42
  %n_tmat364 = getelementptr inbounds %struct.tmat_t, %struct.tmat_t* %72, i64 0, i32 1
  %74 = load i32, i32* %n_tmat364, align 8, !tbaa !43
  %cmp365 = icmp eq i32 %73, %74
  br i1 %cmp365, label %if.end372, label %if.then367

if.then367:                                       ; preds = %if.then361
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 244, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  %75 = load %struct.mdef_t*, %struct.mdef_t** %1, align 8, !tbaa !10
  %n_tmat369 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %75, i64 0, i32 5
  %76 = load i32, i32* %n_tmat369, align 4, !tbaa !42
  %77 = load %struct.tmat_t*, %struct.tmat_t** %9, align 8, !tbaa !32
  %n_tmat371 = getelementptr inbounds %struct.tmat_t, %struct.tmat_t* %77, i64 0, i32 1
  %78 = load i32, i32* %n_tmat371, align 8, !tbaa !43
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.34, i64 0, i64 0), i32 %76, i32 %78) #4
  br label %if.end372

if.end372:                                        ; preds = %if.then361, %if.then367
  %79 = load %struct.mdef_t*, %struct.mdef_t** %1, align 8, !tbaa !10
  %n_emit_state = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %79, i64 0, i32 2
  %80 = load i32, i32* %n_emit_state, align 8, !tbaa !45
  %81 = load %struct.tmat_t*, %struct.tmat_t** %9, align 8, !tbaa !32
  %n_state = getelementptr inbounds %struct.tmat_t, %struct.tmat_t* %81, i64 0, i32 2
  %82 = load i32, i32* %n_state, align 4, !tbaa !46
  %cmp375 = icmp eq i32 %80, %82
  br i1 %cmp375, label %if.end383, label %if.then377

if.then377:                                       ; preds = %if.end372
  tail call void @_E__pr_header(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i64 246, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #4
  %83 = load %struct.mdef_t*, %struct.mdef_t** %1, align 8, !tbaa !10
  %n_emit_state379 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %83, i64 0, i32 2
  %84 = load i32, i32* %n_emit_state379, align 8, !tbaa !45
  %85 = load %struct.tmat_t*, %struct.tmat_t** %9, align 8, !tbaa !32
  %n_state381 = getelementptr inbounds %struct.tmat_t, %struct.tmat_t* %85, i64 0, i32 2
  %86 = load i32, i32* %n_state381, align 4, !tbaa !46
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.35, i64 0, i64 0), i32 %84, i32 %86) #4
  br label %if.end383

if.end383:                                        ; preds = %if.end337, %if.end372, %land.lhs.true358, %if.end355, %if.then377
  ret %struct.kbcore_t* %0
}

declare dso_local void @_E__pr_info_header(i8*, i64, i8*) local_unnamed_addr #1

declare dso_local void @_E__pr_info(i8*, ...) local_unnamed_addr #1

declare dso_local i8* @__ckd_calloc__(i64, i64, i8*, i32) local_unnamed_addr #1

declare dso_local i32 @logs3_init(double) local_unnamed_addr #1

declare dso_local void @_E__pr_header(i8*, i64, i8*) local_unnamed_addr #1

declare dso_local void @_E__die_error(i8*, ...) local_unnamed_addr #1

declare dso_local %struct.feat_s* @feat_init(i8*, i8*, i8*, i8*) local_unnamed_addr #1

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #2

declare dso_local %struct.mdef_t* @mdef_init(i8*) local_unnamed_addr #1

declare dso_local %struct.dict_t* @dict_init(%struct.mdef_t*, i8*, i8*, i8 signext) local_unnamed_addr #1

declare dso_local %struct.lm_s* @lm_read(i8*, double, double, double) local_unnamed_addr #1

declare dso_local %struct.lmset_s* @lm_read_ctl(i8*, %struct.dict_t*, double, double, double, i8*, i32*, i32*, i32) local_unnamed_addr #1

declare dso_local %struct.fillpen_t* @fillpen_init(%struct.dict_t*, i8*, double, double, double, double) local_unnamed_addr #1

declare dso_local i16* @wid_dict_lm_map(%struct.dict_t*, %struct.lm_s*, i32) local_unnamed_addr #1

declare dso_local %struct.mgau_model_t* @mgau_init(i8*, i8*, double, i8*, double, i32, i8*) local_unnamed_addr #1

declare dso_local %struct.subvq_t* @subvq_init(i8*, double, i32, %struct.mgau_model_t*) local_unnamed_addr #1

declare dso_local %struct.gs_s* @gs_read(i8*) local_unnamed_addr #1

declare dso_local %struct.tmat_t* @tmat_init(i8*, double) local_unnamed_addr #1

declare dso_local %struct.dict2pid_t* @dict2pid_build(%struct.mdef_t*, %struct.dict_t*) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local void @kbcore_free(%struct.kbcore_t* %kbcore) local_unnamed_addr #0 {
entry:
  %fcb1 = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %kbcore, i64 0, i32 0
  %0 = load %struct.feat_s*, %struct.feat_s** %fcb1, align 8, !tbaa !2
  %mdef2 = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %kbcore, i64 0, i32 1
  %1 = load %struct.mdef_t*, %struct.mdef_t** %mdef2, align 8, !tbaa !10
  %dict3 = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %kbcore, i64 0, i32 2
  %2 = load %struct.dict_t*, %struct.dict_t** %dict3, align 8, !tbaa !12
  %dict2pid4 = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %kbcore, i64 0, i32 3
  %3 = load %struct.dict2pid_t*, %struct.dict2pid_t** %dict2pid4, align 8, !tbaa !33
  %lm5 = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %kbcore, i64 0, i32 4
  %4 = load %struct.lm_s*, %struct.lm_s** %lm5, align 8, !tbaa !13
  tail call void @lm_free(%struct.lm_s* %4) #4
  tail call void @dict_free(%struct.dict_t* %2) #4
  %comwt = getelementptr inbounds %struct.dict2pid_t, %struct.dict2pid_t* %3, i64 0, i32 5
  %5 = bitcast i32** %comwt to i8**
  %6 = load i8*, i8** %5, align 8, !tbaa !47
  tail call void @ckd_free(i8* %6) #4
  %comsseq = getelementptr inbounds %struct.dict2pid_t, %struct.dict2pid_t* %3, i64 0, i32 4
  %7 = bitcast i16*** %comsseq to i8**
  %8 = load i8*, i8** %7, align 8, !tbaa !49
  tail call void @ckd_free(i8* %8) #4
  %comstate = getelementptr inbounds %struct.dict2pid_t, %struct.dict2pid_t* %3, i64 0, i32 3
  %9 = bitcast i16*** %comstate to i8**
  %10 = load i8*, i8** %9, align 8, !tbaa !50
  tail call void @ckd_free(i8* %10) #4
  %single_lc = getelementptr inbounds %struct.dict2pid_t, %struct.dict2pid_t* %3, i64 0, i32 2
  %11 = bitcast i32*** %single_lc to i8***
  %12 = load i8**, i8*** %11, align 8, !tbaa !51
  tail call void @ckd_free_2d(i8** %12) #4
  %ldiph_lc = getelementptr inbounds %struct.dict2pid_t, %struct.dict2pid_t* %3, i64 0, i32 1
  %13 = bitcast i32**** %ldiph_lc to i8****
  %14 = load i8***, i8**** %13, align 8, !tbaa !52
  tail call void @ckd_free_3d(i8*** %14) #4
  %15 = bitcast %struct.dict2pid_t* %3 to i8**
  %16 = load i8*, i8** %15, align 8, !tbaa !53
  tail call void @ckd_free(i8* %16) #4
  tail call void @mdef_free(%struct.mdef_t* %1) #4
  %fillpen = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %kbcore, i64 0, i32 6
  %17 = load %struct.fillpen_t*, %struct.fillpen_t** %fillpen, align 8, !tbaa !19
  tail call void @fillpen_free(%struct.fillpen_t* %17) #4
  %tmat = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %kbcore, i64 0, i32 11
  %18 = load %struct.tmat_t*, %struct.tmat_t** %tmat, align 8, !tbaa !32
  tail call void @tmat_free(%struct.tmat_t* %18) #4
  %svq = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %kbcore, i64 0, i32 9
  %19 = load %struct.subvq_t*, %struct.subvq_t** %svq, align 8, !tbaa !28
  tail call void @subvq_free(%struct.subvq_t* %19) #4
  %mgau = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %kbcore, i64 0, i32 8
  %20 = load %struct.mgau_model_t*, %struct.mgau_model_t** %mgau, align 8, !tbaa !27
  tail call void @mgau_free(%struct.mgau_model_t* %20) #4
  %tobool = icmp eq %struct.feat_s* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %name = getelementptr inbounds %struct.feat_s, %struct.feat_s* %0, i64 0, i32 0
  %21 = load i8*, i8** %name, align 8, !tbaa !54
  tail call void @ckd_free(i8* %21) #4
  %stream_len = getelementptr inbounds %struct.feat_s, %struct.feat_s* %0, i64 0, i32 4
  %22 = bitcast i32** %stream_len to i8**
  %23 = load i8*, i8** %22, align 8, !tbaa !34
  tail call void @ckd_free(i8* %23) #4
  %24 = bitcast %struct.feat_s* %0 to i8*
  tail call void @ckd_free(i8* %24) #4
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  tail call void (...) @logs_free() #4
  %25 = load %struct.feat_s*, %struct.feat_s** %fcb1, align 8, !tbaa !2
  tail call void @feat_free(%struct.feat_s* %25) #4
  %26 = bitcast %struct.kbcore_t* %kbcore to i8*
  tail call void @ckd_free(i8* %26) #4
  ret void
}

declare dso_local void @lm_free(%struct.lm_s*) local_unnamed_addr #1

declare dso_local void @dict_free(%struct.dict_t*) local_unnamed_addr #1

declare dso_local void @ckd_free(i8*) local_unnamed_addr #1

declare dso_local void @ckd_free_2d(i8**) local_unnamed_addr #1

declare dso_local void @ckd_free_3d(i8***) local_unnamed_addr #1

declare dso_local void @mdef_free(%struct.mdef_t*) local_unnamed_addr #1

declare dso_local void @fillpen_free(%struct.fillpen_t*) local_unnamed_addr #1

declare dso_local void @tmat_free(%struct.tmat_t*) local_unnamed_addr #1

declare dso_local void @subvq_free(%struct.subvq_t*) local_unnamed_addr #1

declare dso_local void @mgau_free(%struct.mgau_model_t*) local_unnamed_addr #1

declare dso_local void @logs_free(...) local_unnamed_addr #1

declare dso_local void @feat_free(%struct.feat_s*) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !4, i64 0}
!3 = !{!"", !4, i64 0, !4, i64 8, !4, i64 16, !4, i64 24, !4, i64 32, !4, i64 40, !4, i64 48, !4, i64 56, !4, i64 64, !4, i64 72, !4, i64 80, !4, i64 88, !7, i64 96, !7, i64 100}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!9, !7, i64 16}
!9 = !{!"feat_s", !4, i64 0, !7, i64 8, !7, i64 12, !7, i64 16, !4, i64 24, !7, i64 32, !7, i64 36, !7, i64 40, !7, i64 44, !4, i64 48}
!10 = !{!3, !4, i64 8}
!11 = !{!5, !5, i64 0}
!12 = !{!3, !4, i64 16}
!13 = !{!3, !4, i64 32}
!14 = !{!15, !7, i64 52}
!15 = !{!"", !4, i64 0, !4, i64 8, !4, i64 16, !7, i64 24, !4, i64 32, !4, i64 40, !7, i64 48, !7, i64 52, !7, i64 56, !7, i64 60, !4, i64 64, !7, i64 72, !7, i64 76, !7, i64 80}
!16 = !{!3, !4, i64 40}
!17 = !{!18, !4, i64 0}
!18 = !{!"lmset_s", !4, i64 0, !4, i64 8}
!19 = !{!3, !4, i64 48}
!20 = !{!3, !4, i64 56}
!21 = !{!3, !7, i64 96}
!22 = !{!18, !4, i64 8}
!23 = !{!24, !4, i64 208}
!24 = !{!"lm_s", !7, i64 0, !7, i64 4, !7, i64 8, !7, i64 12, !4, i64 16, !25, i64 24, !25, i64 26, !7, i64 28, !7, i64 32, !4, i64 40, !4, i64 48, !4, i64 56, !4, i64 64, !4, i64 72, !4, i64 80, !4, i64 88, !4, i64 96, !4, i64 104, !7, i64 112, !7, i64 116, !7, i64 120, !4, i64 128, !7, i64 136, !7, i64 140, !7, i64 144, !26, i64 148, !7, i64 152, !4, i64 160, !7, i64 168, !7, i64 172, !7, i64 176, !7, i64 180, !7, i64 184, !7, i64 188, !7, i64 192, !7, i64 196, !7, i64 200, !7, i64 204, !4, i64 208, !7, i64 216, !4, i64 224, !7, i64 232, !4, i64 240}
!25 = !{!"short", !5, i64 0}
!26 = !{!"float", !5, i64 0}
!27 = !{!3, !4, i64 64}
!28 = !{!3, !4, i64 72}
!29 = !{!3, !4, i64 80}
!30 = !{!31, !7, i64 0}
!31 = !{!"gs_s", !7, i64 0, !7, i64 4, !7, i64 8, !7, i64 12, !7, i64 16, !7, i64 20, !4, i64 24, !4, i64 32, !4, i64 40, !4, i64 48}
!32 = !{!3, !4, i64 88}
!33 = !{!3, !4, i64 24}
!34 = !{!9, !4, i64 24}
!35 = !{!7, !7, i64 0}
!36 = !{!37, !7, i64 8}
!37 = !{!"", !7, i64 0, !7, i64 4, !7, i64 8, !4, i64 16, !38, i64 24, !7, i64 32, !7, i64 36, !7, i64 40}
!38 = !{!"double", !5, i64 0}
!39 = !{!40, !7, i64 16}
!40 = !{!"", !7, i64 0, !7, i64 4, !7, i64 8, !7, i64 12, !7, i64 16, !7, i64 20, !4, i64 24, !4, i64 32, !4, i64 40, !4, i64 48, !7, i64 56, !4, i64 64, !4, i64 72, !4, i64 80, !5, i64 88, !4, i64 96}
!41 = !{!37, !7, i64 0}
!42 = !{!40, !7, i64 20}
!43 = !{!44, !7, i64 8}
!44 = !{!"", !4, i64 0, !7, i64 8, !7, i64 12}
!45 = !{!40, !7, i64 8}
!46 = !{!44, !7, i64 12}
!47 = !{!48, !4, i64 40}
!48 = !{!"", !4, i64 0, !4, i64 8, !4, i64 16, !4, i64 24, !4, i64 32, !4, i64 40, !7, i64 48, !7, i64 52}
!49 = !{!48, !4, i64 32}
!50 = !{!48, !4, i64 24}
!51 = !{!48, !4, i64 16}
!52 = !{!48, !4, i64 8}
!53 = !{!48, !4, i64 0}
!54 = !{!9, !4, i64 0}
