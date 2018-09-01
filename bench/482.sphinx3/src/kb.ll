; ModuleID = 'kb.bc'
source_filename = "kb.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.kb_t = type { %struct.kbcore_t*, i32, %struct.lextree_t**, %struct.lextree_t**, %struct.lextree_t**, i32, %struct.vithist_t*, float***, i32, i32*, i32*, i32*, i32*, i32, i32, i32**, i32*, i32*, i32, i32, i32, %struct.ascr_t*, %struct.beam_t*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i32, i32, i32, i32*, i32, i32, %struct.ptmr_t, %struct.ptmr_t, %struct.ptmr_t, i32, double, double, double, double, %struct._IO_FILE*, %struct._IO_FILE*, %struct.hyp_t**, i32, i8*, i32 }
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
%struct.lextree_t = type { i32, %struct.gnode_s*, %struct.lextree_lcroot_t*, i32, i32, %struct.lextree_node_t**, %struct.lextree_node_t**, i32, i32, i32, i32 }
%struct.gnode_s = type { %union.anytype_s, %struct.gnode_s* }
%union.anytype_s = type { i8* }
%struct.lextree_lcroot_t = type { i8, %struct.gnode_s* }
%struct.lextree_node_t = type { %struct.hmm_t, %struct.gnode_s*, i32, i32, i32, i32*, i8, i8, i16 }
%struct.hmm_t = type { %struct.hmm_state_t*, %struct.hmm_state_t, %struct.hmm_state_t, i32**, i32 }
%struct.hmm_state_t = type { i32, i32 }
%struct.vithist_t = type { %struct.vithist_entry_t**, i32*, i32, i32, i32, i32, i32*, i32*, %struct.vh_lms2vh_t**, %struct.gnode_s* }
%struct.vithist_entry_t = type { i32, i16, i16, i32, i32, i32, i32, i32, i32, %union.vh_lmstate_t }
%union.vh_lmstate_t = type { %struct.anon }
%struct.anon = type { [2 x i16] }
%struct.vh_lms2vh_t = type { i32, i32, %struct.vithist_entry_t*, %struct.gnode_s* }
%struct.ascr_t = type { i32*, i32* }
%struct.beam_t = type { i32, i32, i32, i32 }
%struct.ptmr_t = type { i8*, double, double, double, double, double, double }
%struct.hyp_t = type { i32, i32, i32, i32, i32, i32, i32 }
%struct.wordprob_t = type { i32, i32 }

@.str = private unnamed_addr constant [9 x i8] c"-logbase\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"-feat\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"-cmn\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"-varnorm\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"-agc\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"-mdef\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"-dict\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"-fdict\00", align 1
@.str.8 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"-lm\00", align 1
@.str.10 = private unnamed_addr constant [9 x i8] c"-lmctlfn\00", align 1
@.str.11 = private unnamed_addr constant [11 x i8] c"-lmdumpdir\00", align 1
@.str.12 = private unnamed_addr constant [9 x i8] c"-fillpen\00", align 1
@.str.13 = private unnamed_addr constant [9 x i8] c"-senmgau\00", align 1
@.str.14 = private unnamed_addr constant [9 x i8] c"-silprob\00", align 1
@.str.15 = private unnamed_addr constant [10 x i8] c"-fillprob\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"-lw\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"-wip\00", align 1
@.str.18 = private unnamed_addr constant [4 x i8] c"-uw\00", align 1
@.str.19 = private unnamed_addr constant [6 x i8] c"-mean\00", align 1
@.str.20 = private unnamed_addr constant [5 x i8] c"-var\00", align 1
@.str.21 = private unnamed_addr constant [10 x i8] c"-varfloor\00", align 1
@.str.22 = private unnamed_addr constant [6 x i8] c"-mixw\00", align 1
@.str.23 = private unnamed_addr constant [11 x i8] c"-mixwfloor\00", align 1
@.str.24 = private unnamed_addr constant [7 x i8] c"-subvq\00", align 1
@.str.25 = private unnamed_addr constant [4 x i8] c"-gs\00", align 1
@.str.26 = private unnamed_addr constant [6 x i8] c"-tmat\00", align 1
@.str.27 = private unnamed_addr constant [11 x i8] c"-tmatfloor\00", align 1
@.str.28 = private unnamed_addr constant [5 x i8] c"kb.c\00", align 1
@.str.29 = private unnamed_addr constant [12 x i8] c"FATAL_ERROR\00", align 1
@.str.30 = private unnamed_addr constant [29 x i8] c"Initialization of kb failed\0A\00", align 1
@.str.31 = private unnamed_addr constant [28 x i8] c"%s or %s not in dictionary\0A\00", align 1
@.str.32 = private unnamed_addr constant [4 x i8] c"<s>\00", align 1
@.str.33 = private unnamed_addr constant [5 x i8] c"</s>\00", align 1
@.str.34 = private unnamed_addr constant [23 x i8] c"%s or %s not in LM %s\0A\00", align 1
@.str.35 = private unnamed_addr constant [20 x i8] c"%s or %s not in LM\0A\00", align 1
@.str.36 = private unnamed_addr constant [47 x i8] c"Tmat contains arcs skipping more than 1 state\0A\00", align 1
@.str.37 = private unnamed_addr constant [32 x i8] c"Silence phone '%s' not in mdef\0A\00", align 1
@.str.38 = private unnamed_addr constant [4 x i8] c"SIL\00", align 1
@.str.39 = private unnamed_addr constant [5 x i8] c"INFO\00", align 1
@.str.40 = private unnamed_addr constant [19 x i8] c"Building lextrees\0A\00", align 1
@.str.41 = private unnamed_addr constant [10 x i8] c"-Nlextree\00", align 1
@.str.42 = private unnamed_addr constant [6 x i8] c"ERROR\00", align 1
@.str.43 = private unnamed_addr constant [57 x i8] c"No. of ugtrees specified: %d; will instantiate 1 ugtree\0A\00", align 1
@.str.44 = private unnamed_addr constant [42 x i8] c"Creating Unigram Table for lm %d name %s\0A\00", align 1
@.str.45 = private unnamed_addr constant [56 x i8] c"Size of word table after unigram + words in class: %d.\0A\00", align 1
@.str.46 = private unnamed_addr constant [23 x i8] c"%d active words in %s\0A\00", align 1
@.str.47 = private unnamed_addr constant [56 x i8] c"Size of word table after adding alternative prons: %d.\0A\00", align 1
@.str.48 = private unnamed_addr constant [12 x i8] c"-treeugprob\00", align 1
@.str.49 = private unnamed_addr constant [47 x i8] c"Lextrees (%d) for lm %d name %s, %d nodes(ug)\0A\00", align 1
@.str.50 = private unnamed_addr constant [24 x i8] c"Creating Unigram Table\0A\00", align 1
@.str.51 = private unnamed_addr constant [55 x i8] c"Size of word table after unigram + words in class: %d\0A\00", align 1
@.str.52 = private unnamed_addr constant [17 x i8] c"%d active words\0A\00", align 1
@.str.53 = private unnamed_addr constant [28 x i8] c"Lextrees(%d), %d nodes(ug)\0A\00", align 1
@.str.54 = private unnamed_addr constant [32 x i8] c"Lextrees(%d), %d nodes(filler)\0A\00", align 1
@.str.55 = private unnamed_addr constant [13 x i8] c"-lextreedump\00", align 1
@.str.56 = private unnamed_addr constant [58 x i8] c"Currently, doesn't support -lextreedump for multiple-LMs\0A\00", align 1
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.57 = private unnamed_addr constant [11 x i8] c"UGTREE %d\0A\00", align 1
@.str.58 = private unnamed_addr constant [15 x i8] c"FILLERTREE %d\0A\00", align 1
@.str.59 = private unnamed_addr constant [11 x i8] c"-subvqbeam\00", align 1
@.str.60 = private unnamed_addr constant [6 x i8] c"-beam\00", align 1
@.str.61 = private unnamed_addr constant [7 x i8] c"-pbeam\00", align 1
@.str.62 = private unnamed_addr constant [7 x i8] c"-wbeam\00", align 1
@.str.63 = private unnamed_addr constant [45 x i8] c"Beam= %d, PBeam= %d, WBeam= %d, SVQBeam= %d\0A\00", align 1
@.str.64 = private unnamed_addr constant [4 x i8] c"-ds\00", align 1
@.str.65 = private unnamed_addr constant [26 x i8] c"Down Sampling Ratio = %d\0A\00", align 1
@.str.66 = private unnamed_addr constant [9 x i8] c"-cond_ds\00", align 1
@.str.67 = private unnamed_addr constant [42 x i8] c"Conditional Down Sampling Parameter = %d\0A\00", align 1
@.str.68 = private unnamed_addr constant [69 x i8] c"Conditional Down Sampling require the use of Gaussian Selection map\0A\00", align 1
@.str.69 = private unnamed_addr constant [7 x i8] c"-gs4gs\00", align 1
@.str.70 = private unnamed_addr constant [51 x i8] c"GS map would be used for Gaussian Selection? = %d\0A\00", align 1
@.str.71 = private unnamed_addr constant [9 x i8] c"-svq4svq\00", align 1
@.str.72 = private unnamed_addr constant [43 x i8] c"SVQ would be used as Gaussian Score ?= %d\0A\00", align 1
@.str.73 = private unnamed_addr constant [10 x i8] c"-ci_pbeam\00", align 1
@.str.74 = private unnamed_addr constant [85 x i8] c"CI phone beam to prune the number of parent CI phones in CI-base GMM Selection = %d\0A\00", align 1
@.str.75 = private unnamed_addr constant [63 x i8] c"Virtually no CI phone beam is applied now. (ci_pbeam>1000000)\0A\00", align 1
@.str.76 = private unnamed_addr constant [11 x i8] c"-wend_beam\00", align 1
@.str.77 = private unnamed_addr constant [27 x i8] c"Word-end pruning beam: %d\0A\00", align 1
@.str.78 = private unnamed_addr constant [11 x i8] c"-pl_window\00", align 1
@.str.79 = private unnamed_addr constant [37 x i8] c"Phoneme look-ahead window size = %d\0A\00", align 1
@.str.80 = private unnamed_addr constant [9 x i8] c"-pl_beam\00", align 1
@.str.81 = private unnamed_addr constant [30 x i8] c"Phoneme look-ahead beam = %d\0A\00", align 1
@.str.82 = private unnamed_addr constant [27 x i8] c"feat_array_alloc() failed\0A\00", align 1
@.str.83 = private unnamed_addr constant [8 x i8] c"-bghist\00", align 1
@.str.84 = private unnamed_addr constant [16 x i8] c"-hmmhistbinsize\00", align 1
@.str.85 = private unnamed_addr constant [8 x i8] c"-hypseg\00", align 1
@.str.86 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.87 = private unnamed_addr constant [50 x i8] c"fopen(%s,w) failed; use FWDXCT: from std logfile\0A\00", align 1
@.str.88 = private unnamed_addr constant [5 x i8] c"-hyp\00", align 1
@.str.89 = private unnamed_addr constant [17 x i8] c"Inside kb_setlm\0A\00", align 1
@.str.90 = private unnamed_addr constant [60 x i8] c"LM name %s cannot be found! Fall back to use base LM model\0A\00", align 1
@.str.91 = private unnamed_addr constant [21 x i8] c"Current LM name %s.\0A\00", align 1
@.str.92 = private unnamed_addr constant [20 x i8] c"Current LM name %s\0A\00", align 1
@.str.93 = private unnamed_addr constant [15 x i8] c"LM ug size %d\0A\00", align 1
@.str.94 = private unnamed_addr constant [15 x i8] c"LM bg size %d\0A\00", align 1
@.str.95 = private unnamed_addr constant [15 x i8] c"LM tg size %d\0A\00", align 1
@.str.96 = private unnamed_addr constant [25 x i8] c"HMM history bin size %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @kb_init(%struct.kb_t* %kb) local_unnamed_addr #0 {
entry:
  %kbcore1 = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 0
  %0 = bitcast %struct.kb_t* %kb to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %0, i8 0, i64 504, i1 false)
  %call = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0)) #5
  %1 = bitcast i8* %call to float*
  %2 = load float, float* %1, align 4, !tbaa !2
  %conv = fpext float %2 to double
  %call2 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0)) #5
  %call3 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)) #5
  %call4 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0)) #5
  %call5 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0)) #5
  %call6 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0)) #5
  %call7 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0)) #5
  %call8 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7, i64 0, i64 0)) #5
  %call9 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0)) #5
  %call10 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.10, i64 0, i64 0)) #5
  %call11 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.11, i64 0, i64 0)) #5
  %call12 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.12, i64 0, i64 0)) #5
  %call13 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.13, i64 0, i64 0)) #5
  %call14 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.14, i64 0, i64 0)) #5
  %3 = bitcast i8* %call14 to float*
  %4 = load float, float* %3, align 4, !tbaa !2
  %conv15 = fpext float %4 to double
  %call16 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.15, i64 0, i64 0)) #5
  %5 = bitcast i8* %call16 to float*
  %6 = load float, float* %5, align 4, !tbaa !2
  %conv17 = fpext float %6 to double
  %call18 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i64 0, i64 0)) #5
  %7 = bitcast i8* %call18 to float*
  %8 = load float, float* %7, align 4, !tbaa !2
  %conv19 = fpext float %8 to double
  %call20 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i64 0, i64 0)) #5
  %9 = bitcast i8* %call20 to float*
  %10 = load float, float* %9, align 4, !tbaa !2
  %conv21 = fpext float %10 to double
  %call22 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i64 0, i64 0)) #5
  %11 = bitcast i8* %call22 to float*
  %12 = load float, float* %11, align 4, !tbaa !2
  %conv23 = fpext float %12 to double
  %call24 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.19, i64 0, i64 0)) #5
  %call25 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.20, i64 0, i64 0)) #5
  %call26 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.21, i64 0, i64 0)) #5
  %13 = bitcast i8* %call26 to float*
  %14 = load float, float* %13, align 4, !tbaa !2
  %conv27 = fpext float %14 to double
  %call28 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.22, i64 0, i64 0)) #5
  %call29 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.23, i64 0, i64 0)) #5
  %15 = bitcast i8* %call29 to float*
  %16 = load float, float* %15, align 4, !tbaa !2
  %conv30 = fpext float %16 to double
  %call31 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.24, i64 0, i64 0)) #5
  %call32 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.25, i64 0, i64 0)) #5
  %call33 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.26, i64 0, i64 0)) #5
  %call34 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.27, i64 0, i64 0)) #5
  %17 = bitcast i8* %call34 to float*
  %18 = load float, float* %17, align 4, !tbaa !2
  %conv35 = fpext float %18 to double
  %call36 = tail call %struct.kbcore_t* @kbcore_init(double %conv, i8* %call2, i8* %call3, i8* %call4, i8* %call5, i8* %call6, i8* %call7, i8* %call8, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.8, i64 0, i64 0), i8* %call9, i8* %call10, i8* %call11, i8* %call12, i8* %call13, double %conv15, double %conv17, double %conv19, double %conv21, double %conv23, i8* %call24, i8* %call25, double %conv27, i8* %call28, double %conv30, i8* %call31, i8* %call32, i8* %call33, double %conv35) #5
  store %struct.kbcore_t* %call36, %struct.kbcore_t** %kbcore1, align 8, !tbaa !6
  %cmp = icmp eq %struct.kbcore_t* %call36, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @_E__pr_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 117, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.29, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.30, i64 0, i64 0)) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %19 = load %struct.kbcore_t*, %struct.kbcore_t** %kbcore1, align 8, !tbaa !6
  %mdef41 = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %19, i64 0, i32 1
  %20 = load %struct.mdef_t*, %struct.mdef_t** %mdef41, align 8, !tbaa !12
  %dict42 = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %19, i64 0, i32 2
  %21 = load %struct.dict_t*, %struct.dict_t** %dict42, align 8, !tbaa !14
  %lm43 = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %19, i64 0, i32 4
  %22 = load %struct.lm_s*, %struct.lm_s** %lm43, align 8, !tbaa !15
  %lmset44 = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %19, i64 0, i32 5
  %23 = load %struct.lmset_s*, %struct.lmset_s** %lmset44, align 8, !tbaa !16
  %dict2pid = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %19, i64 0, i32 3
  %24 = load %struct.dict2pid_t*, %struct.dict2pid_t** %dict2pid, align 8, !tbaa !17
  %startwid = getelementptr inbounds %struct.dict_t, %struct.dict_t* %21, i64 0, i32 11
  %25 = load i32, i32* %startwid, align 8, !tbaa !18
  %cmp45 = icmp slt i32 %25, 0
  br i1 %cmp45, label %if.then49, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %finishwid = getelementptr inbounds %struct.dict_t, %struct.dict_t* %21, i64 0, i32 12
  %26 = load i32, i32* %finishwid, align 4, !tbaa !20
  %cmp47 = icmp slt i32 %26, 0
  br i1 %cmp47, label %if.then49, label %if.end50

if.then49:                                        ; preds = %lor.lhs.false, %if.end
  tail call void @_E__pr_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 129, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.29, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.31, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.32, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.33, i64 0, i64 0)) #5
  br label %if.end50

if.end50:                                         ; preds = %if.then49, %lor.lhs.false
  %tobool = icmp ne %struct.lmset_s* %23, null
  br i1 %tobool, label %for.cond.preheader, label %if.else

for.cond.preheader:                               ; preds = %if.end50
  %n_lm = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %19, i64 0, i32 12
  %27 = load i32, i32* %n_lm, align 8, !tbaa !21
  %cmp52994 = icmp sgt i32 %27, 0
  br i1 %cmp52994, label %for.body, label %if.end83

for.body:                                         ; preds = %for.cond.preheader, %for.inc
  %indvars.iv1018 = phi i64 [ %indvars.iv.next1019, %for.inc ], [ 0, %for.cond.preheader ]
  %lm54 = getelementptr inbounds %struct.lmset_s, %struct.lmset_s* %23, i64 %indvars.iv1018, i32 1
  %28 = load %struct.lm_s*, %struct.lm_s** %lm54, align 8, !tbaa !22
  %startlwid = getelementptr inbounds %struct.lm_s, %struct.lm_s* %28, i64 0, i32 5
  %29 = load i16, i16* %startlwid, align 8, !tbaa !24
  %cmp56 = icmp eq i16 %29, -1
  br i1 %cmp56, label %if.then65, label %lor.lhs.false58

lor.lhs.false58:                                  ; preds = %for.body
  %finishlwid = getelementptr inbounds %struct.lm_s, %struct.lm_s* %28, i64 0, i32 6
  %30 = load i16, i16* %finishlwid, align 2, !tbaa !27
  %cmp63 = icmp eq i16 %30, -1
  br i1 %cmp63, label %if.then65, label %for.inc

if.then65:                                        ; preds = %lor.lhs.false58, %for.body
  tail call void @_E__pr_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 134, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.29, i64 0, i64 0)) #5
  %name = getelementptr inbounds %struct.lmset_s, %struct.lmset_s* %23, i64 %indvars.iv1018, i32 0
  %31 = load i8*, i8** %name, align 8, !tbaa !28
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.34, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.32, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.33, i64 0, i64 0), i8* %31) #5
  br label %for.inc

for.inc:                                          ; preds = %lor.lhs.false58, %if.then65
  %indvars.iv.next1019 = add nuw nsw i64 %indvars.iv1018, 1
  %32 = load i32, i32* %n_lm, align 8, !tbaa !21
  %33 = sext i32 %32 to i64
  %cmp52 = icmp slt i64 %indvars.iv.next1019, %33
  br i1 %cmp52, label %for.body, label %if.end83

if.else:                                          ; preds = %if.end50
  %tobool69 = icmp eq %struct.lm_s* %22, null
  br i1 %tobool69, label %if.end83, label %if.then70

if.then70:                                        ; preds = %if.else
  %startlwid71 = getelementptr inbounds %struct.lm_s, %struct.lm_s* %22, i64 0, i32 5
  %34 = load i16, i16* %startlwid71, align 8, !tbaa !24
  %cmp73 = icmp eq i16 %34, -1
  br i1 %cmp73, label %if.then80, label %lor.lhs.false75

lor.lhs.false75:                                  ; preds = %if.then70
  %finishlwid76 = getelementptr inbounds %struct.lm_s, %struct.lm_s* %22, i64 0, i32 6
  %35 = load i16, i16* %finishlwid76, align 2, !tbaa !27
  %cmp78 = icmp eq i16 %35, -1
  br i1 %cmp78, label %if.then80, label %if.end83

if.then80:                                        ; preds = %lor.lhs.false75, %if.then70
  tail call void @_E__pr_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 138, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.29, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.35, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.32, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.33, i64 0, i64 0)) #5
  br label %if.end83

if.end83:                                         ; preds = %for.inc, %for.cond.preheader, %if.else, %if.then80, %lor.lhs.false75
  %tmat = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %19, i64 0, i32 11
  %36 = load %struct.tmat_t*, %struct.tmat_t** %tmat, align 8, !tbaa !29
  %call84 = tail call i32 @tmat_chk_1skip(%struct.tmat_t* %36) #5
  %cmp85 = icmp slt i32 %call84, 0
  br i1 %cmp85, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end83
  tail call void @_E__pr_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 144, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.29, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.36, i64 0, i64 0)) #5
  br label %if.end88

if.end88:                                         ; preds = %if.then87, %if.end83
  br i1 %tobool, label %for.cond91.preheader, label %if.else150

for.cond91.preheader:                             ; preds = %if.end88
  %n_lm92 = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %19, i64 0, i32 12
  %37 = load i32, i32* %n_lm92, align 8, !tbaa !21
  %cmp93986 = icmp sgt i32 %37, 0
  br i1 %cmp93986, label %for.body95.lr.ph, label %if.end192

for.body95.lr.ph:                                 ; preds = %for.cond91.preheader
  %finishwid130 = getelementptr inbounds %struct.dict_t, %struct.dict_t* %21, i64 0, i32 12
  %word = getelementptr inbounds %struct.dict_t, %struct.dict_t* %21, i64 0, i32 4
  %word142 = getelementptr inbounds %struct.dict_t, %struct.dict_t* %21, i64 0, i32 4
  br label %for.body95

for.body95:                                       ; preds = %for.body95.lr.ph, %for.inc147
  %indvars.iv1016 = phi i64 [ 0, %for.body95.lr.ph ], [ %indvars.iv.next1017, %for.inc147 ]
  %lm98 = getelementptr inbounds %struct.lmset_s, %struct.lmset_s* %23, i64 %indvars.iv1016, i32 1
  %38 = load %struct.lm_s*, %struct.lm_s** %lm98, align 8, !tbaa !22
  %ug = getelementptr inbounds %struct.lm_s, %struct.lm_s* %38, i64 0, i32 9
  %39 = load %struct.ug_t*, %struct.ug_t** %ug, align 8, !tbaa !30
  %startlwid102 = getelementptr inbounds %struct.lm_s, %struct.lm_s* %38, i64 0, i32 5
  %40 = load i16, i16* %startlwid102, align 8, !tbaa !24
  %idxprom103 = zext i16 %40 to i64
  %dictwid = getelementptr inbounds %struct.ug_t, %struct.ug_t* %39, i64 %idxprom103, i32 0
  store i32 -1, i32* %dictwid, align 4, !tbaa !31
  %finishlwid112 = getelementptr inbounds %struct.lm_s, %struct.lm_s* %38, i64 0, i32 6
  %41 = load i16, i16* %finishlwid112, align 2, !tbaa !27
  %idxprom113 = zext i16 %41 to i64
  %dictwid115 = getelementptr inbounds %struct.ug_t, %struct.ug_t* %39, i64 %idxprom113, i32 0
  store i32 -1, i32* %dictwid115, align 4, !tbaa !31
  %w.0980 = load i32, i32* %startwid, align 4, !tbaa !33
  %cmp118981 = icmp sgt i32 %w.0980, -1
  br i1 %cmp118981, label %for.body120.lr.ph, label %for.end129

for.body120.lr.ph:                                ; preds = %for.body95
  %dict2lmwid = getelementptr inbounds %struct.lm_s, %struct.lm_s* %38, i64 0, i32 38
  %42 = load i16*, i16** %dict2lmwid, align 8, !tbaa !34
  %43 = load %struct.dictword_t*, %struct.dictword_t** %word, align 8, !tbaa !35
  br label %for.body120

for.body120:                                      ; preds = %for.body120.lr.ph, %for.body120
  %w.0982 = phi i32 [ %w.0980, %for.body120.lr.ph ], [ %w.0, %for.body120 ]
  %idxprom124 = sext i32 %w.0982 to i64
  %arrayidx125 = getelementptr inbounds i16, i16* %42, i64 %idxprom124
  store i16 -1, i16* %arrayidx125, align 2, !tbaa !36
  %alt = getelementptr inbounds %struct.dictword_t, %struct.dictword_t* %43, i64 %idxprom124, i32 3
  %w.0 = load i32, i32* %alt, align 4, !tbaa !33
  %cmp118 = icmp sgt i32 %w.0, -1
  br i1 %cmp118, label %for.body120, label %for.end129

for.end129:                                       ; preds = %for.body120, %for.body95
  %w.1983 = load i32, i32* %finishwid130, align 4, !tbaa !33
  %cmp132984 = icmp sgt i32 %w.1983, -1
  br i1 %cmp132984, label %for.body134.lr.ph, label %for.inc147

for.body134.lr.ph:                                ; preds = %for.end129
  %dict2lmwid138 = getelementptr inbounds %struct.lm_s, %struct.lm_s* %38, i64 0, i32 38
  %44 = load i16*, i16** %dict2lmwid138, align 8, !tbaa !34
  %45 = load %struct.dictword_t*, %struct.dictword_t** %word142, align 8, !tbaa !35
  br label %for.body134

for.body134:                                      ; preds = %for.body134.lr.ph, %for.body134
  %w.1985 = phi i32 [ %w.1983, %for.body134.lr.ph ], [ %w.1, %for.body134 ]
  %idxprom139 = sext i32 %w.1985 to i64
  %arrayidx140 = getelementptr inbounds i16, i16* %44, i64 %idxprom139
  store i16 -1, i16* %arrayidx140, align 2, !tbaa !36
  %alt145 = getelementptr inbounds %struct.dictword_t, %struct.dictword_t* %45, i64 %idxprom139, i32 3
  %w.1 = load i32, i32* %alt145, align 4, !tbaa !33
  %cmp132 = icmp sgt i32 %w.1, -1
  br i1 %cmp132, label %for.body134, label %for.inc147

for.inc147:                                       ; preds = %for.body134, %for.end129
  %indvars.iv.next1017 = add nuw nsw i64 %indvars.iv1016, 1
  %46 = load i32, i32* %n_lm92, align 8, !tbaa !21
  %47 = sext i32 %46 to i64
  %cmp93 = icmp slt i64 %indvars.iv.next1017, %47
  br i1 %cmp93, label %for.body95, label %if.end192

if.else150:                                       ; preds = %if.end88
  %tobool151 = icmp eq %struct.lm_s* %22, null
  br i1 %tobool151, label %if.end192, label %if.then152

if.then152:                                       ; preds = %if.else150
  %ug153 = getelementptr inbounds %struct.lm_s, %struct.lm_s* %22, i64 0, i32 9
  %48 = load %struct.ug_t*, %struct.ug_t** %ug153, align 8, !tbaa !30
  %startlwid154 = getelementptr inbounds %struct.lm_s, %struct.lm_s* %22, i64 0, i32 5
  %49 = load i16, i16* %startlwid154, align 8, !tbaa !24
  %idxprom155 = zext i16 %49 to i64
  %dictwid157 = getelementptr inbounds %struct.ug_t, %struct.ug_t* %48, i64 %idxprom155, i32 0
  store i32 -1, i32* %dictwid157, align 4, !tbaa !31
  %finishlwid159 = getelementptr inbounds %struct.lm_s, %struct.lm_s* %22, i64 0, i32 6
  %50 = load i16, i16* %finishlwid159, align 2, !tbaa !27
  %idxprom160 = zext i16 %50 to i64
  %dictwid162 = getelementptr inbounds %struct.ug_t, %struct.ug_t* %48, i64 %idxprom160, i32 0
  store i32 -1, i32* %dictwid162, align 4, !tbaa !31
  %w.2991 = load i32, i32* %startwid, align 4, !tbaa !33
  %cmp165992 = icmp sgt i32 %w.2991, -1
  br i1 %cmp165992, label %for.body167.lr.ph, label %for.end176

for.body167.lr.ph:                                ; preds = %if.then152
  %dict2lmwid168 = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %19, i64 0, i32 7
  %51 = load i16*, i16** %dict2lmwid168, align 8, !tbaa !37
  %word172 = getelementptr inbounds %struct.dict_t, %struct.dict_t* %21, i64 0, i32 4
  %52 = load %struct.dictword_t*, %struct.dictword_t** %word172, align 8, !tbaa !35
  br label %for.body167

for.body167:                                      ; preds = %for.body167.lr.ph, %for.body167
  %w.2993 = phi i32 [ %w.2991, %for.body167.lr.ph ], [ %w.2, %for.body167 ]
  %idxprom169 = sext i32 %w.2993 to i64
  %arrayidx170 = getelementptr inbounds i16, i16* %51, i64 %idxprom169
  store i16 -1, i16* %arrayidx170, align 2, !tbaa !36
  %alt175 = getelementptr inbounds %struct.dictword_t, %struct.dictword_t* %52, i64 %idxprom169, i32 3
  %w.2 = load i32, i32* %alt175, align 4, !tbaa !33
  %cmp165 = icmp sgt i32 %w.2, -1
  br i1 %cmp165, label %for.body167, label %for.end176

for.end176:                                       ; preds = %for.body167, %if.then152
  %finishwid177 = getelementptr inbounds %struct.dict_t, %struct.dict_t* %21, i64 0, i32 12
  %w.3988 = load i32, i32* %finishwid177, align 4, !tbaa !33
  %cmp179989 = icmp sgt i32 %w.3988, -1
  br i1 %cmp179989, label %for.body181.lr.ph, label %if.end192

for.body181.lr.ph:                                ; preds = %for.end176
  %dict2lmwid182 = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %19, i64 0, i32 7
  %53 = load i16*, i16** %dict2lmwid182, align 8, !tbaa !37
  %word186 = getelementptr inbounds %struct.dict_t, %struct.dict_t* %21, i64 0, i32 4
  %54 = load %struct.dictword_t*, %struct.dictword_t** %word186, align 8, !tbaa !35
  br label %for.body181

for.body181:                                      ; preds = %for.body181.lr.ph, %for.body181
  %w.3990 = phi i32 [ %w.3988, %for.body181.lr.ph ], [ %w.3, %for.body181 ]
  %idxprom183 = sext i32 %w.3990 to i64
  %arrayidx184 = getelementptr inbounds i16, i16* %53, i64 %idxprom183
  store i16 -1, i16* %arrayidx184, align 2, !tbaa !36
  %alt189 = getelementptr inbounds %struct.dictword_t, %struct.dictword_t* %54, i64 %idxprom183, i32 3
  %w.3 = load i32, i32* %alt189, align 4, !tbaa !33
  %cmp179 = icmp sgt i32 %w.3, -1
  br i1 %cmp179, label %for.body181, label %if.end192

if.end192:                                        ; preds = %for.body181, %for.inc147, %for.end176, %for.cond91.preheader, %if.else150
  %55 = load %struct.mdef_t*, %struct.mdef_t** %mdef41, align 8, !tbaa !12
  %sil194 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %55, i64 0, i32 14
  %56 = load i8, i8* %sil194, align 8, !tbaa !38
  %cmp196 = icmp slt i8 %56, 0
  br i1 %cmp196, label %if.then198, label %if.end199

if.then198:                                       ; preds = %if.end192
  tail call void @_E__pr_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 173, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.29, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.37, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.38, i64 0, i64 0)) #5
  br label %if.end199

if.end199:                                        ; preds = %if.then198, %if.end192
  %n_sen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %20, i64 0, i32 4
  %57 = load i32, i32* %n_sen, align 8, !tbaa !40
  %conv200 = sext i32 %57 to i64
  %call201 = tail call i8* @__ckd_calloc__(i64 %conv200, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 176) #5
  %sen_active = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 11
  %58 = bitcast i32** %sen_active to i8**
  store i8* %call201, i8** %58, align 8, !tbaa !41
  %59 = load i32, i32* %n_sen, align 8, !tbaa !40
  %conv203 = sext i32 %59 to i64
  %call204 = tail call i8* @__ckd_calloc__(i64 %conv203, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 177) #5
  %rec_sen_active = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 12
  %60 = bitcast i32** %rec_sen_active to i8**
  store i8* %call204, i8** %60, align 8, !tbaa !42
  %n_sseq = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %20, i64 0, i32 10
  %61 = load i32, i32* %n_sseq, align 8, !tbaa !43
  %conv205 = sext i32 %61 to i64
  %call206 = tail call i8* @__ckd_calloc__(i64 %conv205, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 178) #5
  %ssid_active = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 9
  %62 = bitcast i32** %ssid_active to i8**
  store i8* %call206, i8** %62, align 8, !tbaa !44
  %n_comsseq = getelementptr inbounds %struct.dict2pid_t, %struct.dict2pid_t* %24, i64 0, i32 7
  %63 = load i32, i32* %n_comsseq, align 4, !tbaa !45
  %conv207 = sext i32 %63 to i64
  %call208 = tail call i8* @__ckd_calloc__(i64 %conv207, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 179) #5
  %comssid_active = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 10
  %64 = bitcast i32** %comssid_active to i8**
  store i8* %call208, i8** %64, align 8, !tbaa !47
  %n_ciphone = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %20, i64 0, i32 0
  %65 = load i32, i32* %n_ciphone, align 8, !tbaa !48
  %add = add nsw i32 %65, 1
  %conv209 = sext i32 %add to i64
  %call210 = tail call i8* @__ckd_calloc__(i64 %conv209, i64 1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 182) #5
  %66 = load i32, i32* %n_ciphone, align 8, !tbaa !48
  %add212 = add nsw i32 %66, 31
  %shr = ashr i32 %add212, 5
  %conv213 = sext i32 %shr to i64
  %call214 = tail call i8* @__ckd_calloc__(i64 %conv213, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 183) #5
  %67 = bitcast i8* %call214 to i32*
  %n_word = getelementptr inbounds %struct.dict_t, %struct.dict_t* %21, i64 0, i32 7
  %68 = load i32, i32* %n_word, align 4, !tbaa !49
  %cmp216977 = icmp sgt i32 %68, 0
  br i1 %cmp216977, label %for.body218.lr.ph, label %for.end241

for.body218.lr.ph:                                ; preds = %if.end199
  %word219 = getelementptr inbounds %struct.dict_t, %struct.dict_t* %21, i64 0, i32 4
  %ciphone227 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %20, i64 0, i32 7
  br label %for.body218

for.body218:                                      ; preds = %for.body218.lr.ph, %for.inc239
  %indvars.iv1014 = phi i64 [ 0, %for.body218.lr.ph ], [ %indvars.iv.next1015, %for.inc239 ]
  %69 = load %struct.dictword_t*, %struct.dictword_t** %word219, align 8, !tbaa !35
  %ciphone = getelementptr inbounds %struct.dictword_t, %struct.dictword_t* %69, i64 %indvars.iv1014, i32 1
  %70 = load i8*, i8** %ciphone, align 8, !tbaa !50
  %pronlen = getelementptr inbounds %struct.dictword_t, %struct.dictword_t* %69, i64 %indvars.iv1014, i32 2
  %71 = load i32, i32* %pronlen, align 8, !tbaa !52
  %sub = add nsw i32 %71, -1
  %idxprom225 = sext i32 %sub to i64
  %arrayidx226 = getelementptr inbounds i8, i8* %70, i64 %idxprom225
  %72 = load i8, i8* %arrayidx226, align 1, !tbaa !53
  %73 = load %struct.ciphone_t*, %struct.ciphone_t** %ciphone227, align 8, !tbaa !54
  %conv228 = sext i8 %72 to i32
  %idxprom229 = sext i8 %72 to i64
  %filler = getelementptr inbounds %struct.ciphone_t, %struct.ciphone_t* %73, i64 %idxprom229, i32 1
  %74 = load i32, i32* %filler, align 8, !tbaa !55
  %tobool231 = icmp eq i32 %74, 0
  br i1 %tobool231, label %if.then232, label %for.inc239

if.then232:                                       ; preds = %for.body218
  %and = and i32 %conv228, 31
  %shl = shl i32 1, %and
  %shr235 = ashr i32 %conv228, 5
  %idxprom236 = sext i32 %shr235 to i64
  %arrayidx237 = getelementptr inbounds i32, i32* %67, i64 %idxprom236
  %75 = load i32, i32* %arrayidx237, align 4, !tbaa !33
  %or = or i32 %75, %shl
  store i32 %or, i32* %arrayidx237, align 4, !tbaa !33
  br label %for.inc239

for.inc239:                                       ; preds = %for.body218, %if.then232
  %indvars.iv.next1015 = add nuw nsw i64 %indvars.iv1014, 1
  %76 = load i32, i32* %n_word, align 4, !tbaa !49
  %77 = sext i32 %76 to i64
  %cmp216 = icmp slt i64 %indvars.iv.next1015, %77
  br i1 %cmp216, label %for.body218, label %for.end241

for.end241:                                       ; preds = %for.inc239, %if.end199
  %sil242 = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %20, i64 0, i32 14
  %78 = load i8, i8* %sil242, align 8, !tbaa !38
  %conv243 = sext i8 %78 to i32
  %and244 = and i32 %conv243, 31
  %shl245 = shl i32 1, %and244
  %shr247 = ashr i32 %conv243, 5
  %idxprom248 = sext i32 %shr247 to i64
  %arrayidx249 = getelementptr inbounds i32, i32* %67, i64 %idxprom248
  %79 = load i32, i32* %arrayidx249, align 4, !tbaa !33
  %or250 = or i32 %shl245, %79
  store i32 %or250, i32* %arrayidx249, align 4, !tbaa !33
  %80 = load i32, i32* %n_ciphone, align 8, !tbaa !48
  %cmp254972 = icmp sgt i32 %80, 0
  br i1 %cmp254972, label %for.body256, label %for.end273

for.body256:                                      ; preds = %for.end241, %for.inc271
  %conv252975 = phi i32 [ %conv252, %for.inc271 ], [ 0, %for.end241 ]
  %ci.0974 = phi i8 [ %inc272, %for.inc271 ], [ 0, %for.end241 ]
  %n_lc.0973 = phi i32 [ %n_lc.1, %for.inc271 ], [ 0, %for.end241 ]
  %shr258 = ashr i32 %conv252975, 5
  %idxprom259 = sext i32 %shr258 to i64
  %arrayidx260 = getelementptr inbounds i32, i32* %67, i64 %idxprom259
  %81 = load i32, i32* %arrayidx260, align 4, !tbaa !33
  %and262 = and i32 %conv252975, 31
  %shl263 = shl i32 1, %and262
  %and264 = and i32 %81, %shl263
  %tobool265 = icmp eq i32 %and264, 0
  br i1 %tobool265, label %for.inc271, label %if.then266

if.then266:                                       ; preds = %for.body256
  %inc267 = add nsw i32 %n_lc.0973, 1
  %idxprom268 = sext i32 %n_lc.0973 to i64
  %arrayidx269 = getelementptr inbounds i8, i8* %call210, i64 %idxprom268
  store i8 %ci.0974, i8* %arrayidx269, align 1, !tbaa !53
  br label %for.inc271

for.inc271:                                       ; preds = %for.body256, %if.then266
  %n_lc.1 = phi i32 [ %inc267, %if.then266 ], [ %n_lc.0973, %for.body256 ]
  %inc272 = add i8 %ci.0974, 1
  %conv252 = sext i8 %inc272 to i32
  %82 = load i32, i32* %n_ciphone, align 8, !tbaa !48
  %cmp254 = icmp sgt i32 %82, %conv252
  br i1 %cmp254, label %for.body256, label %for.end273

for.end273:                                       ; preds = %for.inc271, %for.end241
  %n_lc.0.lcssa = phi i32 [ 0, %for.end241 ], [ %n_lc.1, %for.inc271 ]
  %idxprom274 = sext i32 %n_lc.0.lcssa to i64
  %arrayidx275 = getelementptr inbounds i8, i8* %call210, i64 %idxprom274
  store i8 -1, i8* %arrayidx275, align 1, !tbaa !53
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 197, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.40, i64 0, i64 0)) #5
  %call276 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.41, i64 0, i64 0)) #5
  %83 = bitcast i8* %call276 to i32*
  %84 = load i32, i32* %83, align 4, !tbaa !33
  %n_lextree = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 1
  store i32 %84, i32* %n_lextree, align 8, !tbaa !57
  %cmp278 = icmp slt i32 %84, 1
  br i1 %cmp278, label %if.then280, label %if.end283

if.then280:                                       ; preds = %for.end273
  tail call void @_E__pr_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 201, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.42, i64 0, i64 0)) #5
  %85 = load i32, i32* %n_lextree, align 8, !tbaa !57
  tail call void (i8*, ...) @_E__pr_warn(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.43, i64 0, i64 0), i32 %85) #5
  store i32 1, i32* %n_lextree, align 8, !tbaa !57
  br label %if.end283

if.end283:                                        ; preds = %if.then280, %for.end273
  %86 = load i32, i32* %n_word, align 4, !tbaa !49
  %conv285 = sext i32 %86 to i64
  %call286 = tail call i8* @__ckd_calloc__(i64 %conv285, i64 8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 208) #5
  %87 = bitcast i8* %call286 to %struct.wordprob_t*
  br i1 %tobool, label %if.then288, label %if.else377

if.then288:                                       ; preds = %if.end283
  %n_lm289 = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %19, i64 0, i32 12
  %88 = load i32, i32* %n_lm289, align 8, !tbaa !21
  %89 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %mul = mul nsw i32 %89, %88
  %conv291 = sext i32 %mul to i64
  %call292 = tail call i8* @__ckd_calloc__(i64 %conv291, i64 8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 212) #5
  %ugtreeMulti = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 3
  %90 = bitcast %struct.lextree_t*** %ugtreeMulti to i8**
  store i8* %call292, i8** %90, align 8, !tbaa !58
  %91 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %conv294 = sext i32 %91 to i64
  %call295 = tail call i8* @__ckd_calloc__(i64 %conv294, i64 8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 214) #5
  %ugtree = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 2
  %92 = bitcast %struct.lextree_t*** %ugtree to i8**
  store i8* %call295, i8** %92, align 8, !tbaa !59
  %93 = load i32, i32* %n_lm289, align 8, !tbaa !21
  %cmp298966 = icmp sgt i32 %93, 0
  br i1 %cmp298966, label %for.body300, label %if.end426

for.body300:                                      ; preds = %if.then288, %for.inc374
  %i.2967 = phi i32 [ %inc375, %for.inc374 ], [ 0, %if.then288 ]
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 217, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %idxprom301 = sext i32 %i.2967 to i64
  %name303 = getelementptr inbounds %struct.lmset_s, %struct.lmset_s* %23, i64 %idxprom301, i32 0
  %94 = load i8*, i8** %name303, align 8, !tbaa !28
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.44, i64 0, i64 0), i32 %i.2967, i8* %94) #5
  %95 = load i32, i32* %n_word, align 4, !tbaa !49
  %cmp306959 = icmp sgt i32 %95, 0
  br i1 %cmp306959, label %for.end315.loopexit, label %for.end315

for.end315.loopexit:                              ; preds = %for.body300
  %96 = load i32, i32* %n_word, align 4, !tbaa !49
  %97 = icmp sgt i32 %96, 1
  %smax = select i1 %97, i32 %96, i32 1
  %98 = zext i32 %smax to i64
  %99 = shl nuw nsw i64 %98, 3
  call void @llvm.memset.p0i8.i64(i8* align 4 %call286, i8 -1, i64 %99, i1 false)
  br label %for.end315

for.end315:                                       ; preds = %for.end315.loopexit, %for.body300
  %lm318 = getelementptr inbounds %struct.lmset_s, %struct.lmset_s* %23, i64 %idxprom301, i32 1
  %100 = load %struct.lm_s*, %struct.lm_s** %lm318, align 8, !tbaa !22
  %call319 = tail call i32 @lm_ug_wordprob(%struct.lm_s* %100, %struct.dict_t* nonnull %21, i32 -2147483648, %struct.wordprob_t* %87) #5
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 224, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.45, i64 0, i64 0), i32 %call319) #5
  %cmp320 = icmp slt i32 %call319, 1
  br i1 %cmp320, label %if.then322, label %if.end326

if.then322:                                       ; preds = %for.end315
  tail call void @_E__pr_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 226, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.29, i64 0, i64 0)) #5
  %101 = load i8*, i8** %name303, align 8, !tbaa !28
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.46, i64 0, i64 0), i32 %call319, i8* %101) #5
  br label %if.end326

if.end326:                                        ; preds = %if.then322, %for.end315
  %call327 = tail call i32 @wid_wordprob2alt(%struct.dict_t* nonnull %21, %struct.wordprob_t* %87, i32 %call319) #5
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 228, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.47, i64 0, i64 0), i32 %call327) #5
  %call328 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.48, i64 0, i64 0)) #5
  %102 = bitcast i8* %call328 to i32*
  %103 = load i32, i32* %102, align 4, !tbaa !33
  %cmp329 = icmp eq i32 %103, 0
  br i1 %cmp329, label %for.cond332.preheader, label %if.end342

for.cond332.preheader:                            ; preds = %if.end326
  %cmp333961 = icmp sgt i32 %call327, 0
  br i1 %cmp333961, label %for.body335.preheader, label %if.end342

for.body335.preheader:                            ; preds = %for.cond332.preheader
  %wide.trip.count = zext i32 %call327 to i64
  br label %for.body335

for.body335:                                      ; preds = %for.body335, %for.body335.preheader
  %indvars.iv1006 = phi i64 [ 0, %for.body335.preheader ], [ %indvars.iv.next1007, %for.body335 ]
  %prob338 = getelementptr inbounds %struct.wordprob_t, %struct.wordprob_t* %87, i64 %indvars.iv1006, i32 1
  store i32 -1, i32* %prob338, align 4, !tbaa !60
  %indvars.iv.next1007 = add nuw nsw i64 %indvars.iv1006, 1
  %exitcond = icmp eq i64 %indvars.iv.next1007, %wide.trip.count
  br i1 %exitcond, label %if.end342, label %for.body335

if.end342:                                        ; preds = %for.body335, %for.cond332.preheader, %if.end326
  %i.4 = phi i32 [ %i.2967, %if.end326 ], [ 0, %for.cond332.preheader ], [ %call327, %for.body335 ]
  %104 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %cmp345964 = icmp sgt i32 %104, 0
  br i1 %cmp345964, label %for.body347.lr.ph, label %for.inc374

for.body347.lr.ph:                                ; preds = %if.end342
  %idxprom362 = sext i32 %i.4 to i64
  %name364 = getelementptr inbounds %struct.lmset_s, %struct.lmset_s* %23, i64 %idxprom362, i32 0
  br label %for.body347

for.body347:                                      ; preds = %for.body347.lr.ph, %for.body347
  %j.1965 = phi i32 [ 0, %for.body347.lr.ph ], [ %inc372, %for.body347 ]
  %call348 = tail call %struct.lextree_t* @lextree_build(%struct.kbcore_t* %19, %struct.wordprob_t* %87, i32 %call327, i8* %call210) #5
  %105 = load %struct.lextree_t**, %struct.lextree_t*** %ugtreeMulti, align 8, !tbaa !58
  %106 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %mul351 = mul nsw i32 %106, %i.4
  %add352 = add nsw i32 %mul351, %j.1965
  %idxprom353 = sext i32 %add352 to i64
  %arrayidx354 = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %105, i64 %idxprom353
  store %struct.lextree_t* %call348, %struct.lextree_t** %arrayidx354, align 8, !tbaa !62
  %107 = load %struct.lextree_t**, %struct.lextree_t*** %ugtreeMulti, align 8, !tbaa !58
  %arrayidx360 = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %107, i64 %idxprom353
  %108 = load %struct.lextree_t*, %struct.lextree_t** %arrayidx360, align 8, !tbaa !62
  %type = getelementptr inbounds %struct.lextree_t, %struct.lextree_t* %108, i64 0, i32 0
  store i32 0, i32* %type, align 8, !tbaa !63
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 237, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %109 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %110 = load i8*, i8** %name364, align 8, !tbaa !28
  %111 = load %struct.lextree_t**, %struct.lextree_t*** %ugtreeMulti, align 8, !tbaa !58
  %mul367 = mul nsw i32 %109, %i.4
  %add368 = add nsw i32 %mul367, %j.1965
  %idxprom369 = sext i32 %add368 to i64
  %arrayidx370 = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %111, i64 %idxprom369
  %112 = load %struct.lextree_t*, %struct.lextree_t** %arrayidx370, align 8, !tbaa !62
  %n_node = getelementptr inbounds %struct.lextree_t, %struct.lextree_t* %112, i64 0, i32 4
  %113 = load i32, i32* %n_node, align 4, !tbaa !65
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.49, i64 0, i64 0), i32 %109, i32 %i.4, i8* %110, i32 %113) #5
  %inc372 = add nuw nsw i32 %j.1965, 1
  %114 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %cmp345 = icmp slt i32 %inc372, %114
  br i1 %cmp345, label %for.body347, label %for.inc374

for.inc374:                                       ; preds = %for.body347, %if.end342
  %inc375 = add nsw i32 %i.4, 1
  %115 = load i32, i32* %n_lm289, align 8, !tbaa !21
  %cmp298 = icmp slt i32 %inc375, %115
  br i1 %cmp298, label %for.body300, label %if.end426

if.else377:                                       ; preds = %if.end283
  %tobool378 = icmp eq %struct.lm_s* %22, null
  br i1 %tobool378, label %if.end426, label %if.then379

if.then379:                                       ; preds = %if.else377
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 243, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.50, i64 0, i64 0)) #5
  %call380 = tail call i32 @lm_ug_wordprob(%struct.lm_s* nonnull %22, %struct.dict_t* nonnull %21, i32 -2147483648, %struct.wordprob_t* %87) #5
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 246, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.51, i64 0, i64 0), i32 %call380) #5
  %cmp381 = icmp slt i32 %call380, 1
  br i1 %cmp381, label %if.then383, label %if.end384

if.then383:                                       ; preds = %if.then379
  tail call void @_E__pr_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 248, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.29, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.52, i64 0, i64 0), i32 %call380) #5
  br label %if.end384

if.end384:                                        ; preds = %if.then383, %if.then379
  %call385 = tail call i32 @wid_wordprob2alt(%struct.dict_t* nonnull %21, %struct.wordprob_t* %87, i32 %call380) #5
  %call386 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.48, i64 0, i64 0)) #5
  %116 = bitcast i8* %call386 to i32*
  %117 = load i32, i32* %116, align 4, !tbaa !33
  %cmp387 = icmp eq i32 %117, 0
  %cmp391970 = icmp sgt i32 %call385, 0
  %or.cond = and i1 %cmp387, %cmp391970
  br i1 %or.cond, label %for.body393.preheader, label %if.end400

for.body393.preheader:                            ; preds = %if.end384
  %wide.trip.count1012 = zext i32 %call385 to i64
  br label %for.body393

for.body393:                                      ; preds = %for.body393, %for.body393.preheader
  %indvars.iv1010 = phi i64 [ 0, %for.body393.preheader ], [ %indvars.iv.next1011, %for.body393 ]
  %prob396 = getelementptr inbounds %struct.wordprob_t, %struct.wordprob_t* %87, i64 %indvars.iv1010, i32 1
  store i32 -1, i32* %prob396, align 4, !tbaa !60
  %indvars.iv.next1011 = add nuw nsw i64 %indvars.iv1010, 1
  %exitcond1013 = icmp eq i64 %indvars.iv.next1011, %wide.trip.count1012
  br i1 %exitcond1013, label %if.end400, label %for.body393

if.end400:                                        ; preds = %for.body393, %if.end384
  %118 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %conv402 = sext i32 %118 to i64
  %call403 = tail call i8* @__ckd_calloc__(i64 %conv402, i64 8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 258) #5
  %ugtree404 = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 2
  %119 = bitcast %struct.lextree_t*** %ugtree404 to i8**
  store i8* %call403, i8** %119, align 8, !tbaa !59
  %120 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %cmp407968 = icmp sgt i32 %120, 0
  br i1 %cmp407968, label %for.body409, label %for.end420

for.body409:                                      ; preds = %if.end400, %for.body409
  %indvars.iv1008 = phi i64 [ %indvars.iv.next1009, %for.body409 ], [ 0, %if.end400 ]
  %call410 = tail call %struct.lextree_t* @lextree_build(%struct.kbcore_t* %19, %struct.wordprob_t* %87, i32 %call385, i8* %call210) #5
  %121 = load %struct.lextree_t**, %struct.lextree_t*** %ugtree404, align 8, !tbaa !59
  %arrayidx413 = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %121, i64 %indvars.iv1008
  store %struct.lextree_t* %call410, %struct.lextree_t** %arrayidx413, align 8, !tbaa !62
  %122 = load %struct.lextree_t**, %struct.lextree_t*** %ugtree404, align 8, !tbaa !59
  %arrayidx416 = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %122, i64 %indvars.iv1008
  %123 = load %struct.lextree_t*, %struct.lextree_t** %arrayidx416, align 8, !tbaa !62
  %type417 = getelementptr inbounds %struct.lextree_t, %struct.lextree_t* %123, i64 0, i32 0
  store i32 0, i32* %type417, align 8, !tbaa !63
  %indvars.iv.next1009 = add nuw nsw i64 %indvars.iv1008, 1
  %124 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %125 = sext i32 %124 to i64
  %cmp407 = icmp slt i64 %indvars.iv.next1009, %125
  br i1 %cmp407, label %for.body409, label %for.end420

for.end420:                                       ; preds = %for.body409, %if.end400
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 263, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %126 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %127 = load %struct.lextree_t**, %struct.lextree_t*** %ugtree404, align 8, !tbaa !59
  %128 = load %struct.lextree_t*, %struct.lextree_t** %127, align 8, !tbaa !62
  %n_node424 = getelementptr inbounds %struct.lextree_t, %struct.lextree_t* %128, i64 0, i32 4
  %129 = load i32, i32* %n_node424, align 4, !tbaa !65
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.53, i64 0, i64 0), i32 %126, i32 %129) #5
  br label %if.end426

if.end426:                                        ; preds = %for.inc374, %if.then288, %if.else377, %for.end420
  %filler_start = getelementptr inbounds %struct.dict_t, %struct.dict_t* %21, i64 0, i32 8
  %130 = load i32, i32* %filler_start, align 8, !tbaa !66
  %filler_end = getelementptr inbounds %struct.dict_t, %struct.dict_t* %21, i64 0, i32 9
  %131 = load i32, i32* %filler_end, align 4, !tbaa !67
  %cmp428955 = icmp sgt i32 %130, %131
  br i1 %cmp428955, label %for.end445, label %for.body430.lr.ph

for.body430.lr.ph:                                ; preds = %if.end426
  %fillpen = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %19, i64 0, i32 6
  br label %for.body430

for.body430:                                      ; preds = %for.inc443, %for.body430.lr.ph
  %i.7957 = phi i32 [ %130, %for.body430.lr.ph ], [ %inc444, %for.inc443 ]
  %n.0956 = phi i32 [ 0, %for.body430.lr.ph ], [ %n.1, %for.inc443 ]
  %call431 = tail call i32 @dict_filler_word(%struct.dict_t* nonnull %21, i32 %i.7957) #5
  %tobool432 = icmp eq i32 %call431, 0
  br i1 %tobool432, label %for.inc443, label %if.then433

if.then433:                                       ; preds = %for.body430
  %idxprom434 = sext i32 %n.0956 to i64
  %wid436 = getelementptr inbounds %struct.wordprob_t, %struct.wordprob_t* %87, i64 %idxprom434, i32 0
  store i32 %i.7957, i32* %wid436, align 4, !tbaa !68
  %132 = load %struct.fillpen_t*, %struct.fillpen_t** %fillpen, align 8, !tbaa !69
  %call437 = tail call i32 @fillpen(%struct.fillpen_t* %132, i32 %i.7957) #5
  %prob440 = getelementptr inbounds %struct.wordprob_t, %struct.wordprob_t* %87, i64 %idxprom434, i32 1
  store i32 %call437, i32* %prob440, align 4, !tbaa !60
  %inc441 = add nsw i32 %n.0956, 1
  br label %for.inc443

for.inc443:                                       ; preds = %for.body430, %if.then433
  %n.1 = phi i32 [ %inc441, %if.then433 ], [ %n.0956, %for.body430 ]
  %inc444 = add nsw i32 %i.7957, 1
  %133 = load i32, i32* %filler_end, align 4, !tbaa !67
  %cmp428 = icmp slt i32 %i.7957, %133
  br i1 %cmp428, label %for.body430, label %for.end445

for.end445:                                       ; preds = %for.inc443, %if.end426
  %n.0.lcssa = phi i32 [ 0, %if.end426 ], [ %n.1, %for.inc443 ]
  %134 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %conv447 = sext i32 %134 to i64
  %call448 = tail call i8* @__ckd_calloc__(i64 %conv447, i64 8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 281) #5
  %fillertree = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 4
  %135 = bitcast %struct.lextree_t*** %fillertree to i8**
  store i8* %call448, i8** %135, align 8, !tbaa !70
  %136 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %cmp451953 = icmp sgt i32 %136, 0
  br i1 %cmp451953, label %for.body453, label %for.end464

for.body453:                                      ; preds = %for.end445, %for.body453
  %indvars.iv1002 = phi i64 [ %indvars.iv.next1003, %for.body453 ], [ 0, %for.end445 ]
  %call454 = tail call %struct.lextree_t* @lextree_build(%struct.kbcore_t* %19, %struct.wordprob_t* %87, i32 %n.0.lcssa, i8* null) #5
  %137 = load %struct.lextree_t**, %struct.lextree_t*** %fillertree, align 8, !tbaa !70
  %arrayidx457 = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %137, i64 %indvars.iv1002
  store %struct.lextree_t* %call454, %struct.lextree_t** %arrayidx457, align 8, !tbaa !62
  %138 = load %struct.lextree_t**, %struct.lextree_t*** %fillertree, align 8, !tbaa !70
  %arrayidx460 = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %138, i64 %indvars.iv1002
  %139 = load %struct.lextree_t*, %struct.lextree_t** %arrayidx460, align 8, !tbaa !62
  %type461 = getelementptr inbounds %struct.lextree_t, %struct.lextree_t* %139, i64 0, i32 0
  store i32 -1, i32* %type461, align 8, !tbaa !63
  %indvars.iv.next1003 = add nuw nsw i64 %indvars.iv1002, 1
  %140 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %141 = sext i32 %140 to i64
  %cmp451 = icmp slt i64 %indvars.iv.next1003, %141
  br i1 %cmp451, label %for.body453, label %for.end464

for.end464:                                       ; preds = %for.body453, %for.end445
  tail call void @ckd_free(i8* %call286) #5
  tail call void @ckd_free(i8* %call210) #5
  tail call void @ckd_free(i8* %call214) #5
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 291, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %142 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %143 = load %struct.lextree_t**, %struct.lextree_t*** %fillertree, align 8, !tbaa !70
  %144 = load %struct.lextree_t*, %struct.lextree_t** %143, align 8, !tbaa !62
  %n_node468 = getelementptr inbounds %struct.lextree_t, %struct.lextree_t* %144, i64 0, i32 4
  %145 = load i32, i32* %n_node468, align 4, !tbaa !65
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.54, i64 0, i64 0), i32 %142, i32 %145) #5
  %call469 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.55, i64 0, i64 0)) #5
  %146 = bitcast i8* %call469 to i32*
  %147 = load i32, i32* %146, align 4, !tbaa !33
  %tobool470 = icmp eq i32 %147, 0
  br i1 %tobool470, label %if.end500, label %if.then471

if.then471:                                       ; preds = %for.end464
  br i1 %tobool, label %if.then473, label %if.end474

if.then473:                                       ; preds = %if.then471
  tail call void @_E__pr_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 298, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.29, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.56, i64 0, i64 0)) #5
  br label %if.end474

if.end474:                                        ; preds = %if.then473, %if.then471
  %148 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %cmp477951 = icmp sgt i32 %148, 0
  br i1 %cmp477951, label %for.body479.lr.ph, label %for.cond487.preheader.thread

for.cond487.preheader.thread:                     ; preds = %if.end474
  %149 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !62
  br label %for.end498

for.body479.lr.ph:                                ; preds = %if.end474
  %ugtree481 = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 2
  br label %for.body479

for.cond487.preheader:                            ; preds = %for.body479
  %cmp489949 = icmp sgt i32 %156, 0
  %150 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !62
  br i1 %cmp489949, label %for.body491, label %for.end498

for.body479:                                      ; preds = %for.body479.lr.ph, %for.body479
  %indvars.iv1000 = phi i64 [ 0, %for.body479.lr.ph ], [ %indvars.iv.next1001, %for.body479 ]
  %151 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !62
  %152 = trunc i64 %indvars.iv1000 to i32
  %call480 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %151, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.57, i64 0, i64 0), i32 %152) #6
  %153 = load %struct.lextree_t**, %struct.lextree_t*** %ugtree481, align 8, !tbaa !59
  %arrayidx483 = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %153, i64 %indvars.iv1000
  %154 = load %struct.lextree_t*, %struct.lextree_t** %arrayidx483, align 8, !tbaa !62
  %155 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !62
  tail call void @lextree_dump(%struct.lextree_t* %154, %struct.dict_t* %21, %struct._IO_FILE* %155) #5
  %indvars.iv.next1001 = add nuw nsw i64 %indvars.iv1000, 1
  %156 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %157 = sext i32 %156 to i64
  %cmp477 = icmp slt i64 %indvars.iv.next1001, %157
  br i1 %cmp477, label %for.body479, label %for.cond487.preheader

for.body491:                                      ; preds = %for.cond487.preheader, %for.body491
  %indvars.iv998 = phi i64 [ %indvars.iv.next999, %for.body491 ], [ 0, %for.cond487.preheader ]
  %158 = phi %struct._IO_FILE* [ %165, %for.body491 ], [ %150, %for.cond487.preheader ]
  %159 = trunc i64 %indvars.iv998 to i32
  %call492 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %158, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.58, i64 0, i64 0), i32 %159) #6
  %160 = load %struct.lextree_t**, %struct.lextree_t*** %fillertree, align 8, !tbaa !70
  %arrayidx495 = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %160, i64 %indvars.iv998
  %161 = load %struct.lextree_t*, %struct.lextree_t** %arrayidx495, align 8, !tbaa !62
  %162 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !62
  tail call void @lextree_dump(%struct.lextree_t* %161, %struct.dict_t* %21, %struct._IO_FILE* %162) #5
  %indvars.iv.next999 = add nuw nsw i64 %indvars.iv998, 1
  %163 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %164 = sext i32 %163 to i64
  %cmp489 = icmp slt i64 %indvars.iv.next999, %164
  %165 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !62
  br i1 %cmp489, label %for.body491, label %for.end498

for.end498:                                       ; preds = %for.body491, %for.cond487.preheader.thread, %for.cond487.preheader
  %.lcssa = phi %struct._IO_FILE* [ %150, %for.cond487.preheader ], [ %149, %for.cond487.preheader.thread ], [ %165, %for.body491 ]
  %call499 = tail call i32 @fflush(%struct._IO_FILE* %.lcssa)
  br label %if.end500

if.end500:                                        ; preds = %for.end464, %for.end498
  %mgau = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %19, i64 0, i32 8
  %166 = load %struct.mgau_model_t*, %struct.mgau_model_t** %mgau, align 8, !tbaa !71
  %n_mgau = getelementptr inbounds %struct.mgau_model_t, %struct.mgau_model_t* %166, i64 0, i32 0
  %167 = load i32, i32* %n_mgau, align 8, !tbaa !72
  %168 = load %struct.dict2pid_t*, %struct.dict2pid_t** %dict2pid, align 8, !tbaa !17
  %n_comstate = getelementptr inbounds %struct.dict2pid_t, %struct.dict2pid_t* %168, i64 0, i32 6
  %169 = load i32, i32* %n_comstate, align 8, !tbaa !74
  %call502 = tail call %struct.ascr_t* @ascr_init(i32 %167, i32 %169) #5
  %ascr = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 21
  store %struct.ascr_t* %call502, %struct.ascr_t** %ascr, align 8, !tbaa !75
  %call503 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.59, i64 0, i64 0)) #5
  %170 = bitcast i8* %call503 to double*
  %171 = load double, double* %170, align 8, !tbaa !76
  %call504 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.60, i64 0, i64 0)) #5
  %172 = bitcast i8* %call504 to double*
  %173 = load double, double* %172, align 8, !tbaa !76
  %call505 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.61, i64 0, i64 0)) #5
  %174 = bitcast i8* %call505 to double*
  %175 = load double, double* %174, align 8, !tbaa !76
  %call506 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.62, i64 0, i64 0)) #5
  %176 = bitcast i8* %call506 to double*
  %177 = load double, double* %176, align 8, !tbaa !76
  %call507 = tail call %struct.beam_t* @beam_init(double %171, double %173, double %175, double %177) #5
  %beam = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 22
  store %struct.beam_t* %call507, %struct.beam_t** %beam, align 8, !tbaa !77
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 317, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %178 = load %struct.beam_t*, %struct.beam_t** %beam, align 8, !tbaa !77
  %hmm = getelementptr inbounds %struct.beam_t, %struct.beam_t* %178, i64 0, i32 1
  %179 = load i32, i32* %hmm, align 4, !tbaa !78
  %ptrans = getelementptr inbounds %struct.beam_t, %struct.beam_t* %178, i64 0, i32 2
  %180 = load i32, i32* %ptrans, align 4, !tbaa !80
  %word511 = getelementptr inbounds %struct.beam_t, %struct.beam_t* %178, i64 0, i32 3
  %181 = load i32, i32* %word511, align 4, !tbaa !81
  %subvq = getelementptr inbounds %struct.beam_t, %struct.beam_t* %178, i64 0, i32 0
  %182 = load i32, i32* %subvq, align 4, !tbaa !82
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.63, i64 0, i64 0), i32 %179, i32 %180, i32 %181, i32 %182) #5
  %call513 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.64, i64 0, i64 0)) #5
  %183 = bitcast i8* %call513 to i32*
  %184 = load i32, i32* %183, align 4, !tbaa !33
  %ds_ratio = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 23
  store i32 %184, i32* %ds_ratio, align 8, !tbaa !83
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 322, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %185 = load i32, i32* %ds_ratio, align 8, !tbaa !83
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.65, i64 0, i64 0), i32 %185) #5
  %rec_bstcid = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 13
  store i32 -1, i32* %rec_bstcid, align 8, !tbaa !84
  %skip_count = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 18
  store i32 0, i32* %skip_count, align 8, !tbaa !85
  %call515 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.66, i64 0, i64 0)) #5
  %186 = bitcast i8* %call515 to i32*
  %187 = load i32, i32* %186, align 4, !tbaa !33
  %cond_ds = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 24
  store i32 %187, i32* %cond_ds, align 4, !tbaa !86
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 328, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %188 = load i32, i32* %cond_ds, align 4, !tbaa !86
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.67, i64 0, i64 0), i32 %188) #5
  %189 = load i32, i32* %cond_ds, align 4, !tbaa !86
  %cmp518 = icmp sgt i32 %189, 0
  br i1 %cmp518, label %land.lhs.true, label %if.end524

land.lhs.true:                                    ; preds = %if.end500
  %190 = load %struct.kbcore_t*, %struct.kbcore_t** %kbcore1, align 8, !tbaa !6
  %gs = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %190, i64 0, i32 10
  %191 = load %struct.gs_s*, %struct.gs_s** %gs, align 8, !tbaa !87
  %cmp521 = icmp eq %struct.gs_s* %191, null
  br i1 %cmp521, label %if.then523, label %if.end524

if.then523:                                       ; preds = %land.lhs.true
  tail call void @_E__pr_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 330, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.29, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.68, i64 0, i64 0)) #5
  br label %if.end524

if.end524:                                        ; preds = %if.then523, %land.lhs.true, %if.end500
  %call525 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.69, i64 0, i64 0)) #5
  %192 = bitcast i8* %call525 to i32*
  %193 = load i32, i32* %192, align 4, !tbaa !33
  %gs4gs = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 25
  store i32 %193, i32* %gs4gs, align 8, !tbaa !88
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 333, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %194 = load i32, i32* %gs4gs, align 8, !tbaa !88
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.70, i64 0, i64 0), i32 %194) #5
  %call527 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.71, i64 0, i64 0)) #5
  %195 = bitcast i8* %call527 to i32*
  %196 = load i32, i32* %195, align 4, !tbaa !33
  %svq4svq = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 26
  store i32 %196, i32* %svq4svq, align 4, !tbaa !89
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 336, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %197 = load i32, i32* %svq4svq, align 4, !tbaa !89
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.72, i64 0, i64 0), i32 %197) #5
  %call529 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.73, i64 0, i64 0)) #5
  %198 = bitcast i8* %call529 to float*
  %199 = load float, float* %198, align 4, !tbaa !2
  %conv530 = fpext float %199 to double
  %call531 = tail call i32 @logs3(double %conv530) #5
  %mul532 = sub nsw i32 0, %call531
  %ci_pbeam = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 27
  store i32 %mul532, i32* %ci_pbeam, align 8, !tbaa !90
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 339, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %200 = load i32, i32* %ci_pbeam, align 8, !tbaa !90
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([85 x i8], [85 x i8]* @.str.74, i64 0, i64 0), i32 %200) #5
  %201 = load i32, i32* %ci_pbeam, align 8, !tbaa !90
  %cmp535 = icmp sgt i32 %201, 10000000
  br i1 %cmp535, label %if.then537, label %if.end538

if.then537:                                       ; preds = %if.end524
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 341, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.75, i64 0, i64 0)) #5
  br label %if.end538

if.end538:                                        ; preds = %if.then537, %if.end524
  %call539 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.76, i64 0, i64 0)) #5
  %202 = bitcast i8* %call539 to float*
  %203 = load float, float* %202, align 4, !tbaa !2
  %conv540 = fpext float %203 to double
  %call541 = tail call i32 @logs3(double %conv540) #5
  %mul542 = sub nsw i32 0, %call541
  %wend_beam = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 32
  store i32 %mul542, i32* %wend_beam, align 4, !tbaa !91
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 345, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %204 = load i32, i32* %wend_beam, align 4, !tbaa !91
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.77, i64 0, i64 0), i32 %204) #5
  %call544 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.78, i64 0, i64 0)) #5
  %205 = bitcast i8* %call544 to i32*
  %206 = load i32, i32* %205, align 4, !tbaa !33
  %pl_window = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 28
  store i32 %206, i32* %pl_window, align 4, !tbaa !92
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 348, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %207 = load i32, i32* %pl_window, align 4, !tbaa !92
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.79, i64 0, i64 0), i32 %207) #5
  %pl_window_start = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 29
  store i32 0, i32* %pl_window_start, align 8, !tbaa !93
  %call546 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.80, i64 0, i64 0)) #5
  %208 = bitcast i8* %call546 to float*
  %209 = load float, float* %208, align 4, !tbaa !2
  %conv547 = fpext float %209 to double
  %call548 = tail call i32 @logs3(double %conv547) #5
  %pl_beam = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 31
  store i32 %call548, i32* %pl_beam, align 8, !tbaa !94
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 353, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %210 = load i32, i32* %pl_beam, align 8, !tbaa !94
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.81, i64 0, i64 0), i32 %210) #5
  %cd2cisen = getelementptr inbounds %struct.mdef_t, %struct.mdef_t* %20, i64 0, i32 11
  %211 = load i16*, i16** %cd2cisen, align 8, !tbaa !95
  br label %for.cond550

for.cond550:                                      ; preds = %for.cond550, %if.end538
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond550 ], [ 0, %if.end538 ]
  %arrayidx552 = getelementptr inbounds i16, i16* %211, i64 %indvars.iv
  %212 = load i16, i16* %arrayidx552, align 2, !tbaa !36
  %conv553 = sext i16 %212 to i64
  %213 = and i64 %conv553, 4294967295
  %cmp554 = icmp eq i64 %indvars.iv, %213
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br i1 %cmp554, label %for.cond550, label %for.end559

for.end559:                                       ; preds = %for.cond550
  %214 = trunc i64 %indvars.iv to i32
  %215 = load i32, i32* %pl_window, align 4, !tbaa !92
  %call561 = tail call i8** @__ckd_calloc_2d__(i32 %215, i32 %214, i32 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 358) #5
  %cache_ci_senscr = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 15
  %216 = bitcast i32*** %cache_ci_senscr to i8***
  store i8** %call561, i8*** %216, align 8, !tbaa !96
  %217 = load i32, i32* %pl_window, align 4, !tbaa !92
  %conv563 = sext i32 %217 to i64
  %call564 = tail call i8* @__ckd_calloc__(i64 %conv563, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 359) #5
  %cache_best_list = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 16
  %218 = bitcast i32** %cache_best_list to i8**
  store i8* %call564, i8** %218, align 8, !tbaa !97
  %219 = load i32, i32* %n_ciphone, align 8, !tbaa !48
  %conv566 = sext i32 %219 to i64
  %call567 = tail call i8* @__ckd_calloc__(i64 %conv566, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 360) #5
  %phn_heur_list = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 17
  %220 = bitcast i32** %phn_heur_list to i8**
  store i8* %call567, i8** %220, align 8, !tbaa !98
  %fcb = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %19, i64 0, i32 0
  %221 = load %struct.feat_s*, %struct.feat_s** %fcb, align 8, !tbaa !99
  %call568 = tail call float*** @feat_array_alloc(%struct.feat_s* %221, i32 15000) #5
  %feat = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 7
  store float*** %call568, float**** %feat, align 8, !tbaa !100
  %cmp569 = icmp eq float*** %call568, null
  br i1 %cmp569, label %if.then571, label %if.end572

if.then571:                                       ; preds = %for.end559
  tail call void @_E__pr_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 364, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.29, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.82, i64 0, i64 0)) #5
  br label %if.end572

if.end572:                                        ; preds = %if.then571, %for.end559
  %222 = load %struct.beam_t*, %struct.beam_t** %beam, align 8, !tbaa !77
  %word574 = getelementptr inbounds %struct.beam_t, %struct.beam_t* %222, i64 0, i32 3
  %223 = load i32, i32* %word574, align 4, !tbaa !81
  %call575 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.83, i64 0, i64 0)) #5
  %224 = bitcast i8* %call575 to i32*
  %225 = load i32, i32* %224, align 4, !tbaa !33
  %call576 = tail call %struct.vithist_t* @vithist_init(%struct.kbcore_t* nonnull %19, i32 %223, i32 %225) #5
  %vithist = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 6
  store %struct.vithist_t* %call576, %struct.vithist_t** %vithist, align 8, !tbaa !101
  %tm_sen = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 40
  tail call void @ptmr_init(%struct.ptmr_t* nonnull %tm_sen) #5
  %tm_srch = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 41
  tail call void @ptmr_init(%struct.ptmr_t* nonnull %tm_srch) #5
  %tm_ovrhd = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 42
  tail call void @ptmr_init(%struct.ptmr_t* nonnull %tm_ovrhd) #5
  %tot_fr = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 43
  store i32 0, i32* %tot_fr, align 8, !tbaa !102
  %tot_sen_eval = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 44
  %226 = bitcast double* %tot_sen_eval to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %226, i8 0, i64 32, i1 false)
  %call577 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.84, i64 0, i64 0)) #5
  %227 = bitcast i8* %call577 to i32*
  %228 = load i32, i32* %227, align 4, !tbaa !33
  %hmm_hist_binsize = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 39
  store i32 %228, i32* %hmm_hist_binsize, align 4, !tbaa !103
  %ugtree590 = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 2
  %ugtreeMulti580 = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 3
  %ugtree590.sink = select i1 %tobool, %struct.lextree_t*** %ugtreeMulti580, %struct.lextree_t*** %ugtree590
  %229 = load %struct.lextree_t**, %struct.lextree_t*** %ugtree590.sink, align 8, !tbaa !62
  %230 = load %struct.lextree_t*, %struct.lextree_t** %229, align 8, !tbaa !62
  %n_node592 = getelementptr inbounds %struct.lextree_t, %struct.lextree_t* %230, i64 0, i32 4
  %231 = load i32, i32* %n_node592, align 4, !tbaa !65
  %232 = load %struct.lextree_t**, %struct.lextree_t*** %fillertree, align 8, !tbaa !70
  %233 = load %struct.lextree_t*, %struct.lextree_t** %232, align 8, !tbaa !62
  %n_node595 = getelementptr inbounds %struct.lextree_t, %struct.lextree_t* %233, i64 0, i32 4
  %234 = load i32, i32* %n_node595, align 4, !tbaa !65
  %add596 = add nsw i32 %234, %231
  %235 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %mul598 = mul nsw i32 %add596, %235
  %div = sdiv i32 %mul598, %228
  %add601 = add nsw i32 %div, 1
  %hmm_hist_bins = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 38
  store i32 %add601, i32* %hmm_hist_bins, align 8, !tbaa !104
  %conv603 = sext i32 %add601 to i64
  %call604 = tail call i8* @__ckd_calloc__(i64 %conv603, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 386) #5
  %hmm_hist = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 37
  %236 = bitcast i32** %hmm_hist to i8**
  store i8* %call604, i8** %236, align 8, !tbaa !105
  %call605 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.85, i64 0, i64 0)) #5
  %matchsegfp = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 49
  store %struct._IO_FILE* null, %struct._IO_FILE** %matchsegfp, align 8, !tbaa !106
  %tobool606 = icmp eq i8* %call605, null
  br i1 %tobool606, label %if.end614, label %if.then607

if.then607:                                       ; preds = %if.end572
  %call608 = tail call %struct._IO_FILE* @fopen(i8* nonnull %call605, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.86, i64 0, i64 0))
  store %struct._IO_FILE* %call608, %struct._IO_FILE** %matchsegfp, align 8, !tbaa !106
  %cmp610 = icmp eq %struct._IO_FILE* %call608, null
  br i1 %cmp610, label %if.then612, label %if.end614

if.then612:                                       ; preds = %if.then607
  tail call void @_E__pr_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 397, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.42, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__pr_warn(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.87, i64 0, i64 0), i8* nonnull %call605) #5
  br label %if.end614

if.end614:                                        ; preds = %if.end572, %if.then607, %if.then612
  %call615 = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.88, i64 0, i64 0)) #5
  %matchfp = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 48
  store %struct._IO_FILE* null, %struct._IO_FILE** %matchfp, align 8, !tbaa !107
  %tobool616 = icmp eq i8* %call615, null
  br i1 %tobool616, label %if.end624, label %if.then617

if.then617:                                       ; preds = %if.end614
  %call618 = tail call %struct._IO_FILE* @fopen(i8* nonnull %call615, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.86, i64 0, i64 0))
  store %struct._IO_FILE* %call618, %struct._IO_FILE** %matchfp, align 8, !tbaa !107
  %cmp620 = icmp eq %struct._IO_FILE* %call618, null
  br i1 %cmp620, label %if.then622, label %if.end624

if.then622:                                       ; preds = %if.then617
  tail call void @_E__pr_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 408, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.42, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__pr_warn(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.87, i64 0, i64 0), i8* nonnull %call615) #5
  br label %if.end624

if.end624:                                        ; preds = %if.end614, %if.then617, %if.then622
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #1

declare dso_local %struct.kbcore_t* @kbcore_init(double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, double, double, double, double, double, i8*, i8*, double, i8*, double, i8*, i8*, i8*, double) local_unnamed_addr #2

declare dso_local i8* @cmd_ln_access(i8*) local_unnamed_addr #2

declare dso_local void @_E__pr_header(i8*, i64, i8*) local_unnamed_addr #2

declare dso_local void @_E__die_error(i8*, ...) local_unnamed_addr #2

declare dso_local i32 @tmat_chk_1skip(%struct.tmat_t*) local_unnamed_addr #2

declare dso_local i8* @__ckd_calloc__(i64, i64, i8*, i32) local_unnamed_addr #2

declare dso_local void @_E__pr_info_header(i8*, i64, i8*) local_unnamed_addr #2

declare dso_local void @_E__pr_info(i8*, ...) local_unnamed_addr #2

declare dso_local void @_E__pr_warn(i8*, ...) local_unnamed_addr #2

declare dso_local i32 @lm_ug_wordprob(%struct.lm_s*, %struct.dict_t*, i32, %struct.wordprob_t*) local_unnamed_addr #2

declare dso_local i32 @wid_wordprob2alt(%struct.dict_t*, %struct.wordprob_t*, i32) local_unnamed_addr #2

declare dso_local %struct.lextree_t* @lextree_build(%struct.kbcore_t*, %struct.wordprob_t*, i32, i8*) local_unnamed_addr #2

declare dso_local i32 @dict_filler_word(%struct.dict_t*, i32) local_unnamed_addr #2

declare dso_local i32 @fillpen(%struct.fillpen_t*, i32) local_unnamed_addr #2

declare dso_local void @ckd_free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

declare dso_local void @lextree_dump(%struct.lextree_t*, %struct.dict_t*, %struct._IO_FILE*) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i32 @fflush(%struct._IO_FILE* nocapture) local_unnamed_addr #3

declare dso_local %struct.ascr_t* @ascr_init(i32, i32) local_unnamed_addr #2

declare dso_local %struct.beam_t* @beam_init(double, double, double, double) local_unnamed_addr #2

declare dso_local i32 @logs3(double) local_unnamed_addr #2

declare dso_local i8** @__ckd_calloc_2d__(i32, i32, i32, i8*, i32) local_unnamed_addr #2

declare dso_local float*** @feat_array_alloc(%struct.feat_s*, i32) local_unnamed_addr #2

declare dso_local %struct.vithist_t* @vithist_init(%struct.kbcore_t*, i32, i32) local_unnamed_addr #2

declare dso_local void @ptmr_init(%struct.ptmr_t*) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local void @kb_setlm(i8* %lmname, %struct.kb_t* nocapture %kb) local_unnamed_addr #0 {
entry:
  %kbcore = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 0
  %0 = load %struct.kbcore_t*, %struct.kbcore_t** %kbcore, align 8, !tbaa !6
  %lmset = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %0, i64 0, i32 5
  %1 = load %struct.lmset_s*, %struct.lmset_s** %lmset, align 8, !tbaa !16
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 424, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.89, i64 0, i64 0)) #5
  %lm = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %0, i64 0, i32 4
  store %struct.lm_s* null, %struct.lm_s** %lm, align 8, !tbaa !15
  %n_lextree = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 1
  %2 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %cmp159 = icmp sgt i32 %2, 0
  br i1 %cmp159, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %ugtree = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 2
  %3 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %4 = sext i32 %3 to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv170 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next171, %for.body ]
  %5 = load %struct.lextree_t**, %struct.lextree_t*** %ugtree, align 8, !tbaa !59
  %arrayidx = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %5, i64 %indvars.iv170
  store %struct.lextree_t* null, %struct.lextree_t** %arrayidx, align 8, !tbaa !62
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  %cmp = icmp slt i64 %indvars.iv.next171, %4
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 430, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.89, i64 0, i64 0)) #5
  %cmp1 = icmp eq %struct.lmset_s* %1, null
  br i1 %cmp1, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %for.end
  %call = tail call i8* @cmd_ln_access(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.10, i64 0, i64 0)) #5
  %tobool = icmp eq i8* %call, null
  br i1 %tobool, label %if.end50, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %for.end
  %n_lm = getelementptr inbounds %struct.kbcore_t, %struct.kbcore_t* %0, i64 0, i32 12
  %6 = load i32, i32* %n_lm, align 8, !tbaa !21
  %cmp3157 = icmp sgt i32 %6, 0
  br i1 %cmp3157, label %for.body4, label %for.end29thread-pre-split

for.body4:                                        ; preds = %if.then, %for.inc27
  %indvars.iv168 = phi i64 [ %indvars.iv.next169, %for.inc27 ], [ 0, %if.then ]
  %name = getelementptr inbounds %struct.lmset_s, %struct.lmset_s* %1, i64 %indvars.iv168, i32 0
  %7 = load i8*, i8** %name, align 8, !tbaa !28
  %call7 = tail call i32 @strcmp(i8* %lmname, i8* %7) #5
  %tobool8 = icmp eq i32 %call7, 0
  br i1 %tobool8, label %if.then9, label %for.inc27

if.then9:                                         ; preds = %for.body4
  %8 = trunc i64 %indvars.iv168 to i32
  %9 = and i64 %indvars.iv168, 4294967295
  %lm12 = getelementptr inbounds %struct.lmset_s, %struct.lmset_s* %1, i64 %9, i32 1
  %10 = bitcast %struct.lm_s** %lm12 to i64*
  %11 = load i64, i64* %10, align 8, !tbaa !22
  %12 = bitcast %struct.lm_s** %lm to i64*
  store i64 %11, i64* %12, align 8, !tbaa !15
  %13 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %cmp16155 = icmp sgt i32 %13, 0
  %14 = inttoptr i64 %11 to %struct.lm_s*
  br i1 %cmp16155, label %for.body17.lr.ph, label %for.end29

for.body17.lr.ph:                                 ; preds = %if.then9
  %ugtreeMulti = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 3
  %ugtree21 = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 2
  %15 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %16 = sext i32 %15 to i64
  br label %for.body17

for.body17:                                       ; preds = %for.body17.lr.ph, %for.body17
  %indvars.iv166 = phi i64 [ 0, %for.body17.lr.ph ], [ %indvars.iv.next167, %for.body17 ]
  %17 = phi i32 [ %13, %for.body17.lr.ph ], [ %15, %for.body17 ]
  %18 = load %struct.lextree_t**, %struct.lextree_t*** %ugtreeMulti, align 8, !tbaa !58
  %mul = mul nsw i32 %17, %8
  %19 = trunc i64 %indvars.iv166 to i32
  %add = add nsw i32 %mul, %19
  %idxprom19 = sext i32 %add to i64
  %arrayidx20 = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %18, i64 %idxprom19
  %20 = bitcast %struct.lextree_t** %arrayidx20 to i64*
  %21 = load i64, i64* %20, align 8, !tbaa !62
  %22 = load %struct.lextree_t**, %struct.lextree_t*** %ugtree21, align 8, !tbaa !59
  %arrayidx23 = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %22, i64 %indvars.iv166
  %23 = bitcast %struct.lextree_t** %arrayidx23 to i64*
  store i64 %21, i64* %23, align 8, !tbaa !62
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv166, 1
  %cmp16 = icmp slt i64 %indvars.iv.next167, %16
  br i1 %cmp16, label %for.body17, label %for.end29thread-pre-split

for.inc27:                                        ; preds = %for.body4
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %24 = load i32, i32* %n_lm, align 8, !tbaa !21
  %25 = sext i32 %24 to i64
  %cmp3 = icmp slt i64 %indvars.iv.next169, %25
  br i1 %cmp3, label %for.body4, label %for.end29.loopexit162

for.end29.loopexit162:                            ; preds = %for.inc27
  %26 = trunc i64 %indvars.iv.next169 to i32
  br label %for.end29thread-pre-split

for.end29thread-pre-split:                        ; preds = %for.body17, %if.then, %for.end29.loopexit162
  %i.0150.ph = phi i32 [ %26, %for.end29.loopexit162 ], [ 0, %if.then ], [ %8, %for.body17 ]
  %.pr = load %struct.lm_s*, %struct.lm_s** %lm, align 8, !tbaa !15
  br label %for.end29

for.end29:                                        ; preds = %for.end29thread-pre-split, %if.then9
  %27 = phi %struct.lm_s* [ %.pr, %for.end29thread-pre-split ], [ %14, %if.then9 ]
  %i.0150 = phi i32 [ %i.0150.ph, %for.end29thread-pre-split ], [ %8, %if.then9 ]
  %cmp31 = icmp eq %struct.lm_s* %27, null
  br i1 %cmp31, label %if.then32, label %if.end50

if.then32:                                        ; preds = %for.end29
  tail call void @_E__pr_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 445, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.42, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__pr_warn(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.90, i64 0, i64 0), i8* %lmname) #5
  %lm34 = getelementptr inbounds %struct.lmset_s, %struct.lmset_s* %1, i64 0, i32 1
  %28 = bitcast %struct.lm_s** %lm34 to i64*
  %29 = load i64, i64* %28, align 8, !tbaa !22
  %30 = bitcast %struct.lm_s** %lm to i64*
  store i64 %29, i64* %30, align 8, !tbaa !15
  %31 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %cmp38153 = icmp sgt i32 %31, 0
  br i1 %cmp38153, label %for.body39.lr.ph, label %if.end50

for.body39.lr.ph:                                 ; preds = %if.then32
  %ugtreeMulti40 = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 3
  %ugtree43 = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 2
  %32 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %33 = sext i32 %32 to i64
  br label %for.body39

for.body39:                                       ; preds = %for.body39.lr.ph, %for.body39
  %indvars.iv164 = phi i64 [ 0, %for.body39.lr.ph ], [ %indvars.iv.next165, %for.body39 ]
  %34 = load %struct.lextree_t**, %struct.lextree_t*** %ugtreeMulti40, align 8, !tbaa !58
  %arrayidx42 = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %34, i64 %indvars.iv164
  %35 = bitcast %struct.lextree_t** %arrayidx42 to i64*
  %36 = load i64, i64* %35, align 8, !tbaa !62
  %37 = load %struct.lextree_t**, %struct.lextree_t*** %ugtree43, align 8, !tbaa !59
  %arrayidx45 = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %37, i64 %indvars.iv164
  %38 = bitcast %struct.lextree_t** %arrayidx45 to i64*
  store i64 %36, i64* %38, align 8, !tbaa !62
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %cmp38 = icmp slt i64 %indvars.iv.next165, %33
  br i1 %cmp38, label %for.body39, label %if.end50

if.end50:                                         ; preds = %for.body39, %if.then32, %lor.lhs.false, %for.end29
  %i.1 = phi i32 [ %i.0150, %for.end29 ], [ undef, %lor.lhs.false ], [ %i.0150, %if.then32 ], [ %i.0150, %for.body39 ]
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 453, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %idxprom51 = sext i32 %i.1 to i64
  %name53 = getelementptr inbounds %struct.lmset_s, %struct.lmset_s* %1, i64 %idxprom51, i32 0
  %39 = load i8*, i8** %name53, align 8, !tbaa !28
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.91, i64 0, i64 0), i8* %39) #5
  %ugtree54 = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 2
  %40 = load %struct.lextree_t**, %struct.lextree_t*** %ugtree54, align 8, !tbaa !59
  %41 = load %struct.lextree_t*, %struct.lextree_t** %40, align 8, !tbaa !62
  %n_node = getelementptr inbounds %struct.lextree_t, %struct.lextree_t* %41, i64 0, i32 4
  %42 = load i32, i32* %n_node, align 4, !tbaa !65
  %fillertree = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 4
  %43 = load %struct.lextree_t**, %struct.lextree_t*** %fillertree, align 8, !tbaa !70
  %44 = load %struct.lextree_t*, %struct.lextree_t** %43, align 8, !tbaa !62
  %n_node57 = getelementptr inbounds %struct.lextree_t, %struct.lextree_t* %44, i64 0, i32 4
  %45 = load i32, i32* %n_node57, align 4, !tbaa !65
  %add58 = add nsw i32 %45, %42
  %46 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %mul60 = mul nsw i32 %add58, %46
  %hmm_hist_binsize = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 39
  %47 = load i32, i32* %hmm_hist_binsize, align 4, !tbaa !103
  %div = sdiv i32 %mul60, %47
  %add61 = add nsw i32 %div, 1
  %hmm_hist_bins = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 38
  store i32 %add61, i32* %hmm_hist_bins, align 8, !tbaa !104
  %hmm_hist = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 37
  %48 = bitcast i32** %hmm_hist to i8**
  %49 = load i8*, i8** %48, align 8, !tbaa !105
  %conv = sext i32 %add61 to i64
  %mul63 = shl nsw i64 %conv, 2
  %call64 = tail call i8* @__ckd_realloc__(i8* %49, i64 %mul63, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i32 466) #5
  store i8* %call64, i8** %48, align 8, !tbaa !105
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 468, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %50 = load i8*, i8** %name53, align 8, !tbaa !28
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.92, i64 0, i64 0), i8* %50) #5
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 469, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %51 = load %struct.lm_s*, %struct.lm_s** %lm, align 8, !tbaa !15
  %n_ug = getelementptr inbounds %struct.lm_s, %struct.lm_s* %51, i64 0, i32 0
  %52 = load i32, i32* %n_ug, align 8, !tbaa !108
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.93, i64 0, i64 0), i32 %52) #5
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 470, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %53 = load %struct.lm_s*, %struct.lm_s** %lm, align 8, !tbaa !15
  %n_bg = getelementptr inbounds %struct.lm_s, %struct.lm_s* %53, i64 0, i32 1
  %54 = load i32, i32* %n_bg, align 4, !tbaa !109
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.94, i64 0, i64 0), i32 %54) #5
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 471, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %55 = load %struct.lm_s*, %struct.lm_s** %lm, align 8, !tbaa !15
  %n_tg = getelementptr inbounds %struct.lm_s, %struct.lm_s* %55, i64 0, i32 2
  %56 = load i32, i32* %n_tg, align 8, !tbaa !110
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.95, i64 0, i64 0), i32 %56) #5
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 472, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.96, i64 0, i64 0), i32 %add61) #5
  %57 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %cmp75151 = icmp sgt i32 %57, 0
  br i1 %cmp75151, label %for.body77, label %for.end85

for.body77:                                       ; preds = %if.end50, %for.body77
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body77 ], [ 0, %if.end50 ]
  tail call void @_E__pr_info_header(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 475, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i64 0, i64 0)) #5
  %58 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %59 = load %struct.lextree_t**, %struct.lextree_t*** %ugtree54, align 8, !tbaa !59
  %arrayidx81 = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %59, i64 %indvars.iv
  %60 = load %struct.lextree_t*, %struct.lextree_t** %arrayidx81, align 8, !tbaa !62
  %n_node82 = getelementptr inbounds %struct.lextree_t, %struct.lextree_t* %60, i64 0, i32 4
  %61 = load i32, i32* %n_node82, align 4, !tbaa !65
  tail call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.53, i64 0, i64 0), i32 %58, i32 %61) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %62 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %63 = sext i32 %62 to i64
  %cmp75 = icmp slt i64 %indvars.iv.next, %63
  br i1 %cmp75, label %for.body77, label %for.end85

for.end85:                                        ; preds = %for.body77, %if.end50
  ret void
}

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #4

declare dso_local i8* @__ckd_realloc__(i8*, i64, i8*, i32) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @kb_lextree_active_swap(%struct.kb_t* nocapture readonly %kb) local_unnamed_addr #0 {
entry:
  %n_lextree = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 1
  %0 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %cmp9 = icmp sgt i32 %0, 0
  br i1 %cmp9, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %ugtree = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 2
  %fillertree = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 4
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %1 = load %struct.lextree_t**, %struct.lextree_t*** %ugtree, align 8, !tbaa !59
  %arrayidx = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %1, i64 %indvars.iv
  %2 = load %struct.lextree_t*, %struct.lextree_t** %arrayidx, align 8, !tbaa !62
  tail call void @lextree_active_swap(%struct.lextree_t* %2) #5
  %3 = load %struct.lextree_t**, %struct.lextree_t*** %fillertree, align 8, !tbaa !70
  %arrayidx2 = getelementptr inbounds %struct.lextree_t*, %struct.lextree_t** %3, i64 %indvars.iv
  %4 = load %struct.lextree_t*, %struct.lextree_t** %arrayidx2, align 8, !tbaa !62
  tail call void @lextree_active_swap(%struct.lextree_t* %4) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = load i32, i32* %n_lextree, align 8, !tbaa !57
  %6 = sext i32 %5 to i64
  %cmp = icmp slt i64 %indvars.iv.next, %6
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  ret void
}

declare dso_local void @lextree_active_swap(%struct.lextree_t*) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @kb_freehyps(%struct.kb_t* nocapture %kb) local_unnamed_addr #0 {
entry:
  %hyp_segs = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 50
  %0 = load %struct.hyp_t**, %struct.hyp_t*** %hyp_segs, align 8, !tbaa !111
  %tobool = icmp eq %struct.hyp_t** %0, null
  br i1 %tobool, label %if.end9, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %hyp_seglen = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 51
  %1 = load i32, i32* %hyp_seglen, align 8, !tbaa !112
  %cmp25 = icmp sgt i32 %1, 0
  %2 = load %struct.hyp_t**, %struct.hyp_t*** %hyp_segs, align 8, !tbaa !111
  br i1 %cmp25, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.cond.preheader ]
  %3 = phi %struct.hyp_t** [ %8, %for.inc ], [ %2, %for.cond.preheader ]
  %arrayidx = getelementptr inbounds %struct.hyp_t*, %struct.hyp_t** %3, i64 %indvars.iv
  %4 = load %struct.hyp_t*, %struct.hyp_t** %arrayidx, align 8, !tbaa !62
  %tobool2 = icmp eq %struct.hyp_t* %4, null
  br i1 %tobool2, label %for.inc, label %if.then3

if.then3:                                         ; preds = %for.body
  %5 = bitcast %struct.hyp_t* %4 to i8*
  tail call void @ckd_free(i8* %5) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = load i32, i32* %hyp_seglen, align 8, !tbaa !112
  %7 = sext i32 %6 to i64
  %cmp = icmp slt i64 %indvars.iv.next, %7
  %8 = load %struct.hyp_t**, %struct.hyp_t*** %hyp_segs, align 8, !tbaa !111
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc, %for.cond.preheader
  %.lcssa = phi %struct.hyp_t** [ %2, %for.cond.preheader ], [ %8, %for.inc ]
  %9 = bitcast %struct.hyp_t** %.lcssa to i8*
  tail call void @ckd_free(i8* %9) #5
  store i32 0, i32* %hyp_seglen, align 8, !tbaa !112
  br label %if.end9

if.end9:                                          ; preds = %entry, %for.end
  %hyp_str = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 52
  %10 = load i8*, i8** %hyp_str, align 8, !tbaa !113
  %tobool10 = icmp eq i8* %10, null
  br i1 %tobool10, label %if.end13, label %if.then11

if.then11:                                        ; preds = %if.end9
  tail call void @ckd_free(i8* nonnull %10) #5
  %hyp_strlen = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 53
  store i32 0, i32* %hyp_strlen, align 8, !tbaa !114
  br label %if.end13

if.end13:                                         ; preds = %if.end9, %if.then11
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @kb_free(%struct.kb_t* nocapture %kb) local_unnamed_addr #0 {
entry:
  %vithist1 = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 6
  %0 = load %struct.vithist_t*, %struct.vithist_t** %vithist1, align 8, !tbaa !101
  %sen_active = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 11
  %1 = load i32*, i32** %sen_active, align 8, !tbaa !41
  %tobool = icmp eq i32* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %2 = bitcast i32* %1 to i8*
  tail call void @ckd_free(i8* %2) #5
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %ssid_active = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 9
  %3 = load i32*, i32** %ssid_active, align 8, !tbaa !44
  %tobool3 = icmp eq i32* %3, null
  br i1 %tobool3, label %if.end6, label %if.then4

if.then4:                                         ; preds = %if.end
  %4 = bitcast i32* %3 to i8*
  tail call void @ckd_free(i8* %4) #5
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then4
  %comssid_active = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 10
  %5 = load i32*, i32** %comssid_active, align 8, !tbaa !47
  %tobool7 = icmp eq i32* %5, null
  br i1 %tobool7, label %if.end10, label %if.then8

if.then8:                                         ; preds = %if.end6
  %6 = bitcast i32* %5 to i8*
  tail call void @ckd_free(i8* %6) #5
  br label %if.end10

if.end10:                                         ; preds = %if.end6, %if.then8
  %fillertree = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 4
  %7 = load %struct.lextree_t**, %struct.lextree_t*** %fillertree, align 8, !tbaa !70
  %tobool11 = icmp eq %struct.lextree_t** %7, null
  br i1 %tobool11, label %if.end14, label %if.then12

if.then12:                                        ; preds = %if.end10
  %8 = bitcast %struct.lextree_t** %7 to i8*
  tail call void @ckd_free(i8* %8) #5
  br label %if.end14

if.end14:                                         ; preds = %if.end10, %if.then12
  %hmm_hist = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 37
  %9 = load i32*, i32** %hmm_hist, align 8, !tbaa !105
  %tobool15 = icmp eq i32* %9, null
  br i1 %tobool15, label %if.end18, label %if.then16

if.then16:                                        ; preds = %if.end14
  %10 = bitcast i32* %9 to i8*
  tail call void @ckd_free(i8* %10) #5
  br label %if.end18

if.end18:                                         ; preds = %if.end14, %if.then16
  %tobool19 = icmp eq %struct.vithist_t* %0, null
  br i1 %tobool19, label %if.end23, label %if.then20

if.then20:                                        ; preds = %if.end18
  %11 = bitcast %struct.vithist_t* %0 to i8**
  %12 = load i8*, i8** %11, align 8, !tbaa !115
  tail call void @ckd_free(i8* %12) #5
  %frame_start = getelementptr inbounds %struct.vithist_t, %struct.vithist_t* %0, i64 0, i32 1
  %13 = bitcast i32** %frame_start to i8**
  %14 = load i8*, i8** %13, align 8, !tbaa !117
  tail call void @ckd_free(i8* %14) #5
  %bestscore = getelementptr inbounds %struct.vithist_t, %struct.vithist_t* %0, i64 0, i32 6
  %15 = bitcast i32** %bestscore to i8**
  %16 = load i8*, i8** %15, align 8, !tbaa !118
  tail call void @ckd_free(i8* %16) #5
  %bestvh = getelementptr inbounds %struct.vithist_t, %struct.vithist_t* %0, i64 0, i32 7
  %17 = bitcast i32** %bestvh to i8**
  %18 = load i8*, i8** %17, align 8, !tbaa !119
  tail call void @ckd_free(i8* %18) #5
  %lms2vh_root = getelementptr inbounds %struct.vithist_t, %struct.vithist_t* %0, i64 0, i32 8
  %19 = bitcast %struct.vh_lms2vh_t*** %lms2vh_root to i8**
  %20 = load i8*, i8** %19, align 8, !tbaa !120
  tail call void @ckd_free(i8* %20) #5
  %21 = bitcast %struct.vithist_t** %vithist1 to i8**
  %22 = load i8*, i8** %21, align 8, !tbaa !101
  tail call void @ckd_free(i8* %22) #5
  br label %if.end23

if.end23:                                         ; preds = %if.end18, %if.then20
  %kbcore = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 0
  %23 = load %struct.kbcore_t*, %struct.kbcore_t** %kbcore, align 8, !tbaa !6
  tail call void @kbcore_free(%struct.kbcore_t* %23) #5
  %feat = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 7
  %24 = load float***, float**** %feat, align 8, !tbaa !100
  %tobool24 = icmp eq float*** %24, null
  br i1 %tobool24, label %if.end29, label %if.then25

if.then25:                                        ; preds = %if.end23
  %25 = bitcast float*** %24 to i8***
  %26 = load i8**, i8*** %25, align 8, !tbaa !62
  %27 = load i8*, i8** %26, align 8, !tbaa !62
  tail call void @ckd_free(i8* %27) #5
  %28 = bitcast float**** %feat to i8***
  %29 = load i8**, i8*** %28, align 8, !tbaa !100
  tail call void @ckd_free_2d(i8** %29) #5
  br label %if.end29

if.end29:                                         ; preds = %if.end23, %if.then25
  %cache_ci_senscr = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 15
  %30 = load i32**, i32*** %cache_ci_senscr, align 8, !tbaa !96
  %tobool30 = icmp eq i32** %30, null
  br i1 %tobool30, label %if.end33, label %if.then31

if.then31:                                        ; preds = %if.end29
  %31 = bitcast i32** %30 to i8**
  tail call void @ckd_free_2d(i8** %31) #5
  br label %if.end33

if.end33:                                         ; preds = %if.end29, %if.then31
  %cache_best_list = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 16
  %32 = load i32*, i32** %cache_best_list, align 8, !tbaa !97
  %tobool34 = icmp eq i32* %32, null
  br i1 %tobool34, label %if.end37, label %if.then35

if.then35:                                        ; preds = %if.end33
  %33 = bitcast i32* %32 to i8*
  tail call void @ckd_free(i8* %33) #5
  br label %if.end37

if.end37:                                         ; preds = %if.end33, %if.then35
  %phn_heur_list = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 17
  %34 = load i32*, i32** %phn_heur_list, align 8, !tbaa !98
  %tobool38 = icmp eq i32* %34, null
  br i1 %tobool38, label %if.end41, label %if.then39

if.then39:                                        ; preds = %if.end37
  %35 = bitcast i32* %34 to i8*
  tail call void @ckd_free(i8* %35) #5
  br label %if.end41

if.end41:                                         ; preds = %if.end37, %if.then39
  %matchsegfp = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 49
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %matchsegfp, align 8, !tbaa !106
  %tobool42 = icmp eq %struct._IO_FILE* %36, null
  br i1 %tobool42, label %if.end45, label %if.then43

if.then43:                                        ; preds = %if.end41
  %call = tail call i32 @fclose(%struct._IO_FILE* nonnull %36)
  br label %if.end45

if.end45:                                         ; preds = %if.end41, %if.then43
  %matchfp = getelementptr inbounds %struct.kb_t, %struct.kb_t* %kb, i64 0, i32 48
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** %matchfp, align 8, !tbaa !107
  %tobool46 = icmp eq %struct._IO_FILE* %37, null
  br i1 %tobool46, label %if.end50, label %if.then47

if.then47:                                        ; preds = %if.end45
  %call49 = tail call i32 @fclose(%struct._IO_FILE* nonnull %37)
  br label %if.end50

if.end50:                                         ; preds = %if.end45, %if.then47
  tail call void @kb_freehyps(%struct.kb_t* nonnull %kb)
  ret void
}

declare dso_local void @kbcore_free(%struct.kbcore_t*) local_unnamed_addr #2

declare dso_local void @ckd_free_2d(i8**) local_unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"float", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !8, i64 0}
!7 = !{!"", !8, i64 0, !9, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !9, i64 40, !8, i64 48, !8, i64 56, !9, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !8, i64 96, !9, i64 104, !9, i64 108, !8, i64 112, !8, i64 120, !8, i64 128, !9, i64 136, !9, i64 140, !9, i64 144, !8, i64 152, !8, i64 160, !9, i64 168, !9, i64 172, !9, i64 176, !9, i64 180, !9, i64 184, !9, i64 188, !9, i64 192, !9, i64 196, !9, i64 200, !9, i64 204, !8, i64 208, !9, i64 216, !9, i64 220, !9, i64 224, !8, i64 232, !9, i64 240, !9, i64 244, !10, i64 248, !10, i64 304, !10, i64 360, !9, i64 416, !11, i64 424, !11, i64 432, !11, i64 440, !11, i64 448, !8, i64 456, !8, i64 464, !8, i64 472, !9, i64 480, !8, i64 488, !9, i64 496}
!8 = !{!"any pointer", !4, i64 0}
!9 = !{!"int", !4, i64 0}
!10 = !{!"", !8, i64 0, !11, i64 8, !11, i64 16, !11, i64 24, !11, i64 32, !11, i64 40, !11, i64 48}
!11 = !{!"double", !4, i64 0}
!12 = !{!13, !8, i64 8}
!13 = !{!"", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !9, i64 100}
!14 = !{!13, !8, i64 16}
!15 = !{!13, !8, i64 32}
!16 = !{!13, !8, i64 40}
!17 = !{!13, !8, i64 24}
!18 = !{!19, !9, i64 72}
!19 = !{!"", !8, i64 0, !8, i64 8, !8, i64 16, !9, i64 24, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 52, !9, i64 56, !9, i64 60, !8, i64 64, !9, i64 72, !9, i64 76, !9, i64 80}
!20 = !{!19, !9, i64 76}
!21 = !{!13, !9, i64 96}
!22 = !{!23, !8, i64 8}
!23 = !{!"lmset_s", !8, i64 0, !8, i64 8}
!24 = !{!25, !26, i64 24}
!25 = !{!"lm_s", !9, i64 0, !9, i64 4, !9, i64 8, !9, i64 12, !8, i64 16, !26, i64 24, !26, i64 26, !9, i64 28, !9, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !8, i64 96, !8, i64 104, !9, i64 112, !9, i64 116, !9, i64 120, !8, i64 128, !9, i64 136, !9, i64 140, !9, i64 144, !3, i64 148, !9, i64 152, !8, i64 160, !9, i64 168, !9, i64 172, !9, i64 176, !9, i64 180, !9, i64 184, !9, i64 188, !9, i64 192, !9, i64 196, !9, i64 200, !9, i64 204, !8, i64 208, !9, i64 216, !8, i64 224, !9, i64 232, !8, i64 240}
!26 = !{!"short", !4, i64 0}
!27 = !{!25, !26, i64 26}
!28 = !{!23, !8, i64 0}
!29 = !{!13, !8, i64 88}
!30 = !{!25, !8, i64 40}
!31 = !{!32, !9, i64 0}
!32 = !{!"", !9, i64 0, !4, i64 4, !4, i64 8, !9, i64 12}
!33 = !{!9, !9, i64 0}
!34 = !{!25, !8, i64 208}
!35 = !{!19, !8, i64 32}
!36 = !{!26, !26, i64 0}
!37 = !{!13, !8, i64 56}
!38 = !{!39, !4, i64 88}
!39 = !{!"", !9, i64 0, !9, i64 4, !9, i64 8, !9, i64 12, !9, i64 16, !9, i64 20, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !9, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !4, i64 88, !8, i64 96}
!40 = !{!39, !9, i64 16}
!41 = !{!7, !8, i64 88}
!42 = !{!7, !8, i64 96}
!43 = !{!39, !9, i64 56}
!44 = !{!7, !8, i64 72}
!45 = !{!46, !9, i64 52}
!46 = !{!"", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 52}
!47 = !{!7, !8, i64 80}
!48 = !{!39, !9, i64 0}
!49 = !{!19, !9, i64 52}
!50 = !{!51, !8, i64 8}
!51 = !{!"", !8, i64 0, !8, i64 8, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !8, i64 32}
!52 = !{!51, !9, i64 16}
!53 = !{!4, !4, i64 0}
!54 = !{!39, !8, i64 32}
!55 = !{!56, !9, i64 8}
!56 = !{!"", !8, i64 0, !9, i64 8}
!57 = !{!7, !9, i64 8}
!58 = !{!7, !8, i64 24}
!59 = !{!7, !8, i64 16}
!60 = !{!61, !9, i64 4}
!61 = !{!"", !9, i64 0, !9, i64 4}
!62 = !{!8, !8, i64 0}
!63 = !{!64, !9, i64 0}
!64 = !{!"", !9, i64 0, !8, i64 8, !8, i64 16, !9, i64 24, !9, i64 28, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 52, !9, i64 56, !9, i64 60}
!65 = !{!64, !9, i64 28}
!66 = !{!19, !9, i64 56}
!67 = !{!19, !9, i64 60}
!68 = !{!61, !9, i64 0}
!69 = !{!13, !8, i64 48}
!70 = !{!7, !8, i64 32}
!71 = !{!13, !8, i64 64}
!72 = !{!73, !9, i64 0}
!73 = !{!"", !9, i64 0, !9, i64 4, !9, i64 8, !8, i64 16, !11, i64 24, !9, i64 32, !9, i64 36, !9, i64 40}
!74 = !{!46, !9, i64 48}
!75 = !{!7, !8, i64 152}
!76 = !{!11, !11, i64 0}
!77 = !{!7, !8, i64 160}
!78 = !{!79, !9, i64 4}
!79 = !{!"", !9, i64 0, !9, i64 4, !9, i64 8, !9, i64 12}
!80 = !{!79, !9, i64 8}
!81 = !{!79, !9, i64 12}
!82 = !{!79, !9, i64 0}
!83 = !{!7, !9, i64 168}
!84 = !{!7, !9, i64 104}
!85 = !{!7, !9, i64 136}
!86 = !{!7, !9, i64 172}
!87 = !{!13, !8, i64 80}
!88 = !{!7, !9, i64 176}
!89 = !{!7, !9, i64 180}
!90 = !{!7, !9, i64 184}
!91 = !{!7, !9, i64 204}
!92 = !{!7, !9, i64 188}
!93 = !{!7, !9, i64 192}
!94 = !{!7, !9, i64 200}
!95 = !{!39, !8, i64 64}
!96 = !{!7, !8, i64 112}
!97 = !{!7, !8, i64 120}
!98 = !{!7, !8, i64 128}
!99 = !{!13, !8, i64 0}
!100 = !{!7, !8, i64 56}
!101 = !{!7, !8, i64 48}
!102 = !{!7, !9, i64 416}
!103 = !{!7, !9, i64 244}
!104 = !{!7, !9, i64 240}
!105 = !{!7, !8, i64 232}
!106 = !{!7, !8, i64 464}
!107 = !{!7, !8, i64 456}
!108 = !{!25, !9, i64 0}
!109 = !{!25, !9, i64 4}
!110 = !{!25, !9, i64 8}
!111 = !{!7, !8, i64 472}
!112 = !{!7, !9, i64 480}
!113 = !{!7, !8, i64 488}
!114 = !{!7, !9, i64 496}
!115 = !{!116, !8, i64 0}
!116 = !{!"", !8, i64 0, !8, i64 8, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56}
!117 = !{!116, !8, i64 8}
!118 = !{!116, !8, i64 32}
!119 = !{!116, !8, i64 40}
!120 = !{!116, !8, i64 48}
