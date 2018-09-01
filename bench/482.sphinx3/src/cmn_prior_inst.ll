; ModuleID = 'cmn_prior_inst.bc'
source_filename = "cmn_prior.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@cmn_prior.cur_mean = internal global float* null, align 8
@cmn_prior.sum = internal global float* null, align 8
@cmn_prior.nframe = internal global i32 0, align 4
@cmn_prior.initialize = internal global i32 1, align 4
@.str = private unnamed_addr constant [12 x i8] c"cmn_prior.c\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"FATAL_ERROR\00", align 1
@.str.2 = private unnamed_addr constant [60 x i8] c"Variance normalization not implemented in live mode decode\0A\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"INFO\00", align 1
@.str.4 = private unnamed_addr constant [33 x i8] c"mean[0]= %.2f, mean[1..%d]= 0.0\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @cmn_prior(float** %incep, i32 %varnorm, i32 %nfr, i32 %ceplen, i32 %endutt) #0 {
entry:
  %0 = bitcast void (float**, i32, i32, i32, i32)* @cmn_prior to i8*
  %1 = call i64 @getAddr(i8* %0)
  call void @funcInit(i64 %1)
  %incep.addr = alloca float**, align 8
  %2 = bitcast float*** %incep.addr to i8*
  %3 = call i64 @getAddr(i8* %2)
  call void @handleAlloca(i64 %3)
  %varnorm.addr = alloca i32, align 4
  %4 = bitcast i32* %varnorm.addr to i8*
  %5 = call i64 @getAddr(i8* %4)
  call void @handleAlloca(i64 %5)
  %nfr.addr = alloca i32, align 4
  %6 = bitcast i32* %nfr.addr to i8*
  %7 = call i64 @getAddr(i8* %6)
  call void @handleAlloca(i64 %7)
  %ceplen.addr = alloca i32, align 4
  %8 = bitcast i32* %ceplen.addr to i8*
  %9 = call i64 @getAddr(i8* %8)
  call void @handleAlloca(i64 %9)
  %endutt.addr = alloca i32, align 4
  %10 = bitcast i32* %endutt.addr to i8*
  %11 = call i64 @getAddr(i8* %10)
  call void @handleAlloca(i64 %11)
  %sf = alloca float, align 4
  %12 = bitcast float* %sf to i8*
  %13 = call i64 @getAddr(i8* %12)
  call void @handleAlloca(i64 %13)
  %i = alloca i32, align 4
  %14 = bitcast i32* %i to i8*
  %15 = call i64 @getAddr(i8* %14)
  call void @handleAlloca(i64 %15)
  %j = alloca i32, align 4
  %16 = bitcast i32* %j to i8*
  %17 = call i64 @getAddr(i8* %16)
  call void @handleAlloca(i64 %17)
  %18 = bitcast float*** %incep.addr to i8*
  %19 = call i64 @getAddr(i8* %18)
  %20 = bitcast float** %incep to i8*
  %21 = call i64 @getAddr(i8* %20)
  call void @setRealTemp(i64 %19, i64 %21)
  store float** %incep, float*** %incep.addr, align 8
  %22 = bitcast i32* %varnorm.addr to i8*
  store i32 %varnorm, i32* %varnorm.addr, align 4
  %23 = bitcast i32* %nfr.addr to i8*
  store i32 %nfr, i32* %nfr.addr, align 4
  %24 = bitcast i32* %ceplen.addr to i8*
  store i32 %ceplen, i32* %ceplen.addr, align 4
  %25 = bitcast i32* %endutt.addr to i8*
  store i32 %endutt, i32* %endutt.addr, align 4
  %26 = bitcast i32* %varnorm.addr to i8*
  %27 = call i64 @getAddr(i8* %26)
  %28 = load i32, i32* %varnorm.addr, align 4
  %tobool = icmp ne i32 %28, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %29 = bitcast void (i8*, i64, i8*)* @_E__pr_header to i8*
  %30 = call i64 @getAddr(i8* %29)
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 61, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0))
  %31 = bitcast void (i8*, ...)* @_E__die_error to i8*
  %32 = call i64 @getAddr(i8* %31)
  call void (i8*, ...) @_E__die_error(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.2, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %33 = bitcast i32* @cmn_prior.initialize to i8*
  %34 = call i64 @getAddr(i8* %33)
  %35 = load i32, i32* @cmn_prior.initialize, align 4
  %tobool1 = icmp ne i32 %35, 0
  br i1 %tobool1, label %if.then2, label %if.end7

if.then2:                                         ; preds = %if.end
  %36 = bitcast i32* %ceplen.addr to i8*
  %37 = call i64 @getAddr(i8* %36)
  %38 = load i32, i32* %ceplen.addr, align 4
  %conv = sext i32 %38 to i64
  %39 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %40 = call i64 @getAddr(i8* %39)
  %call = call i8* @__ckd_calloc__(i64 %conv, i64 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 64)
  %41 = bitcast i8* %call to float*
  %42 = bitcast float** @cmn_prior.cur_mean to i8*
  %43 = call i64 @getAddr(i8* %42)
  %44 = bitcast float* %41 to i8*
  %45 = call i64 @getAddr(i8* %44)
  call void @setRealTemp(i64 %43, i64 %45)
  store float* %41, float** @cmn_prior.cur_mean, align 8
  %46 = bitcast float** @cmn_prior.cur_mean to i8*
  %47 = call i64 @getAddr(i8* %46)
  %48 = load float*, float** @cmn_prior.cur_mean, align 8
  %arrayidx = getelementptr inbounds float, float* %48, i64 0
  %49 = bitcast float* %arrayidx to i8*
  %50 = call i64 @getAddr(i8* %49)
  call void @setRealConstant(i64 %50, float 1.200000e+01)
  store float 1.200000e+01, float* %arrayidx, align 4
  %51 = bitcast i32* %ceplen.addr to i8*
  %52 = call i64 @getAddr(i8* %51)
  %53 = load i32, i32* %ceplen.addr, align 4
  %conv3 = sext i32 %53 to i64
  %54 = bitcast i8* (i64, i64, i8*, i32)* @__ckd_calloc__ to i8*
  %55 = call i64 @getAddr(i8* %54)
  %call4 = call i8* @__ckd_calloc__(i64 %conv3, i64 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 69)
  %56 = bitcast i8* %call4 to float*
  %57 = bitcast float** @cmn_prior.sum to i8*
  %58 = call i64 @getAddr(i8* %57)
  %59 = bitcast float* %56 to i8*
  %60 = call i64 @getAddr(i8* %59)
  call void @setRealTemp(i64 %58, i64 %60)
  store float* %56, float** @cmn_prior.sum, align 8
  %61 = bitcast i32* @cmn_prior.nframe to i8*
  store i32 0, i32* @cmn_prior.nframe, align 4
  %62 = bitcast i32* @cmn_prior.initialize to i8*
  store i32 0, i32* @cmn_prior.initialize, align 4
  %63 = bitcast void (i8*, i64, i8*)* @_E__pr_info_header to i8*
  %64 = call i64 @getAddr(i8* %63)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 72, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0))
  %65 = bitcast float** @cmn_prior.cur_mean to i8*
  %66 = call i64 @getAddr(i8* %65)
  %67 = load float*, float** @cmn_prior.cur_mean, align 8
  %arrayidx5 = getelementptr inbounds float, float* %67, i64 0
  %68 = bitcast float* %arrayidx5 to i8*
  %69 = call i64 @getAddr(i8* %68)
  %70 = load float, float* %arrayidx5, align 4
  %conv6 = fpext float %70 to double
  %71 = bitcast i32* %ceplen.addr to i8*
  %72 = call i64 @getAddr(i8* %71)
  %73 = load i32, i32* %ceplen.addr, align 4
  %sub = sub nsw i32 %73, 1
  %74 = bitcast void (i8*, ...)* @_E__pr_info to i8*
  %75 = call i64 @getAddr(i8* %74)
  call void @addFunArg(i32 1, i64 %75, i64 %69)
  call void (i8*, ...) @_E__pr_info(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.4, i32 0, i32 0), double %conv6, i32 %sub)
  br label %if.end7

if.end7:                                          ; preds = %if.then2, %if.end
  %76 = bitcast i32* %nfr.addr to i8*
  %77 = call i64 @getAddr(i8* %76)
  %78 = load i32, i32* %nfr.addr, align 4
  %cmp = icmp sle i32 %78, 0
  br i1 %cmp, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end7
  br label %if.end97

if.end10:                                         ; preds = %if.end7
  %79 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc30, %if.end10
  %80 = bitcast i32* %i to i8*
  %81 = call i64 @getAddr(i8* %80)
  %82 = load i32, i32* %i, align 4
  %83 = bitcast i32* %nfr.addr to i8*
  %84 = call i64 @getAddr(i8* %83)
  %85 = load i32, i32* %nfr.addr, align 4
  %cmp11 = icmp slt i32 %82, %85
  br i1 %cmp11, label %for.body, label %for.end32

for.body:                                         ; preds = %for.cond
  %86 = bitcast i32* %j to i8*
  store i32 0, i32* %j, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc, %for.body
  %87 = bitcast i32* %j to i8*
  %88 = call i64 @getAddr(i8* %87)
  %89 = load i32, i32* %j, align 4
  %90 = bitcast i32* %ceplen.addr to i8*
  %91 = call i64 @getAddr(i8* %90)
  %92 = load i32, i32* %ceplen.addr, align 4
  %cmp14 = icmp slt i32 %89, %92
  br i1 %cmp14, label %for.body16, label %for.end

for.body16:                                       ; preds = %for.cond13
  %93 = bitcast float*** %incep.addr to i8*
  %94 = call i64 @getAddr(i8* %93)
  %95 = load float**, float*** %incep.addr, align 8
  %96 = bitcast i32* %i to i8*
  %97 = call i64 @getAddr(i8* %96)
  %98 = load i32, i32* %i, align 4
  %idxprom = sext i32 %98 to i64
  %arrayidx17 = getelementptr inbounds float*, float** %95, i64 %idxprom
  %99 = bitcast float** %arrayidx17 to i8*
  %100 = call i64 @getAddr(i8* %99)
  %101 = load float*, float** %arrayidx17, align 8
  %102 = bitcast i32* %j to i8*
  %103 = call i64 @getAddr(i8* %102)
  %104 = load i32, i32* %j, align 4
  %idxprom18 = sext i32 %104 to i64
  %arrayidx19 = getelementptr inbounds float, float* %101, i64 %idxprom18
  %105 = bitcast float* %arrayidx19 to i8*
  %106 = call i64 @getAddr(i8* %105)
  %107 = load float, float* %arrayidx19, align 4
  %108 = bitcast float** @cmn_prior.sum to i8*
  %109 = call i64 @getAddr(i8* %108)
  %110 = load float*, float** @cmn_prior.sum, align 8
  %111 = bitcast i32* %j to i8*
  %112 = call i64 @getAddr(i8* %111)
  %113 = load i32, i32* %j, align 4
  %idxprom20 = sext i32 %113 to i64
  %arrayidx21 = getelementptr inbounds float, float* %110, i64 %idxprom20
  %114 = bitcast float* %arrayidx21 to i8*
  %115 = call i64 @getAddr(i8* %114)
  %116 = load float, float* %arrayidx21, align 4
  %add = fadd float %116, %107
  %117 = call i64 @computeReal(i32 12, i64 %115, i64 %106, float %116, float %107, float %add, i32 79)
  %118 = bitcast float* %arrayidx21 to i8*
  %119 = call i64 @getAddr(i8* %118)
  call void @setRealTemp(i64 %119, i64 %117)
  store float %add, float* %arrayidx21, align 4
  %120 = bitcast float** @cmn_prior.cur_mean to i8*
  %121 = call i64 @getAddr(i8* %120)
  %122 = load float*, float** @cmn_prior.cur_mean, align 8
  %123 = bitcast i32* %j to i8*
  %124 = call i64 @getAddr(i8* %123)
  %125 = load i32, i32* %j, align 4
  %idxprom22 = sext i32 %125 to i64
  %arrayidx23 = getelementptr inbounds float, float* %122, i64 %idxprom22
  %126 = bitcast float* %arrayidx23 to i8*
  %127 = call i64 @getAddr(i8* %126)
  %128 = load float, float* %arrayidx23, align 4
  %129 = bitcast float*** %incep.addr to i8*
  %130 = call i64 @getAddr(i8* %129)
  %131 = load float**, float*** %incep.addr, align 8
  %132 = bitcast i32* %i to i8*
  %133 = call i64 @getAddr(i8* %132)
  %134 = load i32, i32* %i, align 4
  %idxprom24 = sext i32 %134 to i64
  %arrayidx25 = getelementptr inbounds float*, float** %131, i64 %idxprom24
  %135 = bitcast float** %arrayidx25 to i8*
  %136 = call i64 @getAddr(i8* %135)
  %137 = load float*, float** %arrayidx25, align 8
  %138 = bitcast i32* %j to i8*
  %139 = call i64 @getAddr(i8* %138)
  %140 = load i32, i32* %j, align 4
  %idxprom26 = sext i32 %140 to i64
  %arrayidx27 = getelementptr inbounds float, float* %137, i64 %idxprom26
  %141 = bitcast float* %arrayidx27 to i8*
  %142 = call i64 @getAddr(i8* %141)
  %143 = load float, float* %arrayidx27, align 4
  %sub28 = fsub float %143, %128
  %144 = call i64 @computeReal(i32 14, i64 %142, i64 %127, float %143, float %128, float %sub28, i32 95)
  %145 = bitcast float* %arrayidx27 to i8*
  %146 = call i64 @getAddr(i8* %145)
  call void @setRealTemp(i64 %146, i64 %144)
  store float %sub28, float* %arrayidx27, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body16
  %147 = bitcast i32* %j to i8*
  %148 = call i64 @getAddr(i8* %147)
  %149 = load i32, i32* %j, align 4
  %inc = add nsw i32 %149, 1
  %150 = bitcast i32* %j to i8*
  store i32 %inc, i32* %j, align 4
  br label %for.cond13

for.end:                                          ; preds = %for.cond13
  %151 = bitcast i32* @cmn_prior.nframe to i8*
  %152 = call i64 @getAddr(i8* %151)
  %153 = load i32, i32* @cmn_prior.nframe, align 4
  %inc29 = add nsw i32 %153, 1
  %154 = bitcast i32* @cmn_prior.nframe to i8*
  store i32 %inc29, i32* @cmn_prior.nframe, align 4
  br label %for.inc30

for.inc30:                                        ; preds = %for.end
  %155 = bitcast i32* %i to i8*
  %156 = call i64 @getAddr(i8* %155)
  %157 = load i32, i32* %i, align 4
  %inc31 = add nsw i32 %157, 1
  %158 = bitcast i32* %i to i8*
  store i32 %inc31, i32* %i, align 4
  br label %for.cond

for.end32:                                        ; preds = %for.cond
  %159 = bitcast i32* @cmn_prior.nframe to i8*
  %160 = call i64 @getAddr(i8* %159)
  %161 = load i32, i32* @cmn_prior.nframe, align 4
  %cmp33 = icmp sgt i32 %161, 800
  br i1 %cmp33, label %if.then35, label %if.end64

if.then35:                                        ; preds = %for.end32
  %162 = bitcast i32* @cmn_prior.nframe to i8*
  %163 = call i64 @getAddr(i8* %162)
  %164 = load i32, i32* @cmn_prior.nframe, align 4
  %conv36 = sitofp i32 %164 to double
  %div = fdiv double 1.000000e+00, %conv36
  %165 = call i64 bitcast (i64 (i32, i64, i64, float, float, float, i32)* @computeReal to i64 (i32, i64, i64, double, double, double, i32)*)(i32 19, i64 0, i64 0, double 1.000000e+00, double %conv36, double %div, i32 115)
  %conv37 = fptrunc double %div to float
  %166 = bitcast float* %sf to i8*
  %167 = call i64 @getAddr(i8* %166)
  call void @setRealTemp(i64 %167, i64 %165)
  store float %conv37, float* %sf, align 4
  %168 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond38

for.cond38:                                       ; preds = %for.inc46, %if.then35
  %169 = bitcast i32* %i to i8*
  %170 = call i64 @getAddr(i8* %169)
  %171 = load i32, i32* %i, align 4
  %172 = bitcast i32* %ceplen.addr to i8*
  %173 = call i64 @getAddr(i8* %172)
  %174 = load i32, i32* %ceplen.addr, align 4
  %cmp39 = icmp slt i32 %171, %174
  br i1 %cmp39, label %for.body41, label %for.end48

for.body41:                                       ; preds = %for.cond38
  %175 = bitcast float** @cmn_prior.sum to i8*
  %176 = call i64 @getAddr(i8* %175)
  %177 = load float*, float** @cmn_prior.sum, align 8
  %178 = bitcast i32* %i to i8*
  %179 = call i64 @getAddr(i8* %178)
  %180 = load i32, i32* %i, align 4
  %idxprom42 = sext i32 %180 to i64
  %arrayidx43 = getelementptr inbounds float, float* %177, i64 %idxprom42
  %181 = bitcast float* %arrayidx43 to i8*
  %182 = call i64 @getAddr(i8* %181)
  %183 = load float, float* %arrayidx43, align 4
  %184 = bitcast float* %sf to i8*
  %185 = call i64 @getAddr(i8* %184)
  %186 = load float, float* %sf, align 4
  %mul = fmul float %183, %186
  %187 = call i64 @computeReal(i32 16, i64 %182, i64 %185, float %183, float %186, float %mul, i32 130)
  %188 = bitcast float** @cmn_prior.cur_mean to i8*
  %189 = call i64 @getAddr(i8* %188)
  %190 = load float*, float** @cmn_prior.cur_mean, align 8
  %191 = bitcast i32* %i to i8*
  %192 = call i64 @getAddr(i8* %191)
  %193 = load i32, i32* %i, align 4
  %idxprom44 = sext i32 %193 to i64
  %arrayidx45 = getelementptr inbounds float, float* %190, i64 %idxprom44
  %194 = bitcast float* %arrayidx45 to i8*
  %195 = call i64 @getAddr(i8* %194)
  call void @setRealTemp(i64 %195, i64 %187)
  store float %mul, float* %arrayidx45, align 4
  br label %for.inc46

for.inc46:                                        ; preds = %for.body41
  %196 = bitcast i32* %i to i8*
  %197 = call i64 @getAddr(i8* %196)
  %198 = load i32, i32* %i, align 4
  %inc47 = add nsw i32 %198, 1
  %199 = bitcast i32* %i to i8*
  store i32 %inc47, i32* %i, align 4
  br label %for.cond38

for.end48:                                        ; preds = %for.cond38
  %200 = bitcast i32* @cmn_prior.nframe to i8*
  %201 = call i64 @getAddr(i8* %200)
  %202 = load i32, i32* @cmn_prior.nframe, align 4
  %cmp49 = icmp sge i32 %202, 800
  br i1 %cmp49, label %if.then51, label %if.end63

if.then51:                                        ; preds = %for.end48
  %203 = bitcast float* %sf to i8*
  %204 = call i64 @getAddr(i8* %203)
  %205 = load float, float* %sf, align 4
  %mul52 = fmul float 5.000000e+02, %205
  %206 = call i64 @computeReal(i32 16, i64 0, i64 %204, float 5.000000e+02, float %205, float %mul52, i32 145)
  %207 = bitcast float* %sf to i8*
  %208 = call i64 @getAddr(i8* %207)
  call void @setRealTemp(i64 %208, i64 %206)
  store float %mul52, float* %sf, align 4
  %209 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond53

for.cond53:                                       ; preds = %for.inc60, %if.then51
  %210 = bitcast i32* %i to i8*
  %211 = call i64 @getAddr(i8* %210)
  %212 = load i32, i32* %i, align 4
  %213 = bitcast i32* %ceplen.addr to i8*
  %214 = call i64 @getAddr(i8* %213)
  %215 = load i32, i32* %ceplen.addr, align 4
  %cmp54 = icmp slt i32 %212, %215
  br i1 %cmp54, label %for.body56, label %for.end62

for.body56:                                       ; preds = %for.cond53
  %216 = bitcast float* %sf to i8*
  %217 = call i64 @getAddr(i8* %216)
  %218 = load float, float* %sf, align 4
  %219 = bitcast float** @cmn_prior.sum to i8*
  %220 = call i64 @getAddr(i8* %219)
  %221 = load float*, float** @cmn_prior.sum, align 8
  %222 = bitcast i32* %i to i8*
  %223 = call i64 @getAddr(i8* %222)
  %224 = load i32, i32* %i, align 4
  %idxprom57 = sext i32 %224 to i64
  %arrayidx58 = getelementptr inbounds float, float* %221, i64 %idxprom57
  %225 = bitcast float* %arrayidx58 to i8*
  %226 = call i64 @getAddr(i8* %225)
  %227 = load float, float* %arrayidx58, align 4
  %mul59 = fmul float %227, %218
  %228 = call i64 @computeReal(i32 16, i64 %226, i64 %217, float %227, float %218, float %mul59, i32 159)
  %229 = bitcast float* %arrayidx58 to i8*
  %230 = call i64 @getAddr(i8* %229)
  call void @setRealTemp(i64 %230, i64 %228)
  store float %mul59, float* %arrayidx58, align 4
  br label %for.inc60

for.inc60:                                        ; preds = %for.body56
  %231 = bitcast i32* %i to i8*
  %232 = call i64 @getAddr(i8* %231)
  %233 = load i32, i32* %i, align 4
  %inc61 = add nsw i32 %233, 1
  %234 = bitcast i32* %i to i8*
  store i32 %inc61, i32* %i, align 4
  br label %for.cond53

for.end62:                                        ; preds = %for.cond53
  %235 = bitcast i32* @cmn_prior.nframe to i8*
  store i32 500, i32* @cmn_prior.nframe, align 4
  br label %if.end63

if.end63:                                         ; preds = %for.end62, %for.end48
  br label %if.end64

if.end64:                                         ; preds = %if.end63, %for.end32
  %236 = bitcast i32* %endutt.addr to i8*
  %237 = call i64 @getAddr(i8* %236)
  %238 = load i32, i32* %endutt.addr, align 4
  %tobool65 = icmp ne i32 %238, 0
  br i1 %tobool65, label %if.then66, label %if.end97

if.then66:                                        ; preds = %if.end64
  %239 = bitcast i32* @cmn_prior.nframe to i8*
  %240 = call i64 @getAddr(i8* %239)
  %241 = load i32, i32* @cmn_prior.nframe, align 4
  %conv67 = sitofp i32 %241 to double
  %div68 = fdiv double 1.000000e+00, %conv67
  %242 = call i64 bitcast (i64 (i32, i64, i64, float, float, float, i32)* @computeReal to i64 (i32, i64, i64, double, double, double, i32)*)(i32 19, i64 0, i64 0, double 1.000000e+00, double %conv67, double %div68, i32 174)
  %conv69 = fptrunc double %div68 to float
  %243 = bitcast float* %sf to i8*
  %244 = call i64 @getAddr(i8* %243)
  call void @setRealTemp(i64 %244, i64 %242)
  store float %conv69, float* %sf, align 4
  %245 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond70

for.cond70:                                       ; preds = %for.inc79, %if.then66
  %246 = bitcast i32* %i to i8*
  %247 = call i64 @getAddr(i8* %246)
  %248 = load i32, i32* %i, align 4
  %249 = bitcast i32* %ceplen.addr to i8*
  %250 = call i64 @getAddr(i8* %249)
  %251 = load i32, i32* %ceplen.addr, align 4
  %cmp71 = icmp slt i32 %248, %251
  br i1 %cmp71, label %for.body73, label %for.end81

for.body73:                                       ; preds = %for.cond70
  %252 = bitcast float** @cmn_prior.sum to i8*
  %253 = call i64 @getAddr(i8* %252)
  %254 = load float*, float** @cmn_prior.sum, align 8
  %255 = bitcast i32* %i to i8*
  %256 = call i64 @getAddr(i8* %255)
  %257 = load i32, i32* %i, align 4
  %idxprom74 = sext i32 %257 to i64
  %arrayidx75 = getelementptr inbounds float, float* %254, i64 %idxprom74
  %258 = bitcast float* %arrayidx75 to i8*
  %259 = call i64 @getAddr(i8* %258)
  %260 = load float, float* %arrayidx75, align 4
  %261 = bitcast float* %sf to i8*
  %262 = call i64 @getAddr(i8* %261)
  %263 = load float, float* %sf, align 4
  %mul76 = fmul float %260, %263
  %264 = call i64 @computeReal(i32 16, i64 %259, i64 %262, float %260, float %263, float %mul76, i32 189)
  %265 = bitcast float** @cmn_prior.cur_mean to i8*
  %266 = call i64 @getAddr(i8* %265)
  %267 = load float*, float** @cmn_prior.cur_mean, align 8
  %268 = bitcast i32* %i to i8*
  %269 = call i64 @getAddr(i8* %268)
  %270 = load i32, i32* %i, align 4
  %idxprom77 = sext i32 %270 to i64
  %arrayidx78 = getelementptr inbounds float, float* %267, i64 %idxprom77
  %271 = bitcast float* %arrayidx78 to i8*
  %272 = call i64 @getAddr(i8* %271)
  call void @setRealTemp(i64 %272, i64 %264)
  store float %mul76, float* %arrayidx78, align 4
  br label %for.inc79

for.inc79:                                        ; preds = %for.body73
  %273 = bitcast i32* %i to i8*
  %274 = call i64 @getAddr(i8* %273)
  %275 = load i32, i32* %i, align 4
  %inc80 = add nsw i32 %275, 1
  %276 = bitcast i32* %i to i8*
  store i32 %inc80, i32* %i, align 4
  br label %for.cond70

for.end81:                                        ; preds = %for.cond70
  %277 = bitcast i32* @cmn_prior.nframe to i8*
  %278 = call i64 @getAddr(i8* %277)
  %279 = load i32, i32* @cmn_prior.nframe, align 4
  %cmp82 = icmp sgt i32 %279, 800
  br i1 %cmp82, label %if.then84, label %if.end96

if.then84:                                        ; preds = %for.end81
  %280 = bitcast float* %sf to i8*
  %281 = call i64 @getAddr(i8* %280)
  %282 = load float, float* %sf, align 4
  %mul85 = fmul float 5.000000e+02, %282
  %283 = call i64 @computeReal(i32 16, i64 0, i64 %281, float 5.000000e+02, float %282, float %mul85, i32 204)
  %284 = bitcast float* %sf to i8*
  %285 = call i64 @getAddr(i8* %284)
  call void @setRealTemp(i64 %285, i64 %283)
  store float %mul85, float* %sf, align 4
  %286 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  br label %for.cond86

for.cond86:                                       ; preds = %for.inc93, %if.then84
  %287 = bitcast i32* %i to i8*
  %288 = call i64 @getAddr(i8* %287)
  %289 = load i32, i32* %i, align 4
  %290 = bitcast i32* %ceplen.addr to i8*
  %291 = call i64 @getAddr(i8* %290)
  %292 = load i32, i32* %ceplen.addr, align 4
  %cmp87 = icmp slt i32 %289, %292
  br i1 %cmp87, label %for.body89, label %for.end95

for.body89:                                       ; preds = %for.cond86
  %293 = bitcast float* %sf to i8*
  %294 = call i64 @getAddr(i8* %293)
  %295 = load float, float* %sf, align 4
  %296 = bitcast float** @cmn_prior.sum to i8*
  %297 = call i64 @getAddr(i8* %296)
  %298 = load float*, float** @cmn_prior.sum, align 8
  %299 = bitcast i32* %i to i8*
  %300 = call i64 @getAddr(i8* %299)
  %301 = load i32, i32* %i, align 4
  %idxprom90 = sext i32 %301 to i64
  %arrayidx91 = getelementptr inbounds float, float* %298, i64 %idxprom90
  %302 = bitcast float* %arrayidx91 to i8*
  %303 = call i64 @getAddr(i8* %302)
  %304 = load float, float* %arrayidx91, align 4
  %mul92 = fmul float %304, %295
  %305 = call i64 @computeReal(i32 16, i64 %303, i64 %294, float %304, float %295, float %mul92, i32 218)
  %306 = bitcast float* %arrayidx91 to i8*
  %307 = call i64 @getAddr(i8* %306)
  call void @setRealTemp(i64 %307, i64 %305)
  store float %mul92, float* %arrayidx91, align 4
  br label %for.inc93

for.inc93:                                        ; preds = %for.body89
  %308 = bitcast i32* %i to i8*
  %309 = call i64 @getAddr(i8* %308)
  %310 = load i32, i32* %i, align 4
  %inc94 = add nsw i32 %310, 1
  %311 = bitcast i32* %i to i8*
  store i32 %inc94, i32* %i, align 4
  br label %for.cond86

for.end95:                                        ; preds = %for.cond86
  %312 = bitcast i32* @cmn_prior.nframe to i8*
  store i32 500, i32* @cmn_prior.nframe, align 4
  br label %if.end96

if.end96:                                         ; preds = %for.end95, %for.end81
  br label %if.end97

if.end97:                                         ; preds = %if.then9, %if.end96, %if.end64
  %313 = bitcast void (float**, i32, i32, i32, i32)* @cmn_prior to i8*
  %314 = call i64 @getAddr(i8* %313)
  call void @funcExit(i64 %314)
  call void @cleanComputeReal(i32 79)
  call void @cleanComputeReal(i32 95)
  call void @cleanComputeReal(i32 115)
  call void @cleanComputeReal(i32 130)
  call void @cleanComputeReal(i32 145)
  call void @cleanComputeReal(i32 159)
  call void @cleanComputeReal(i32 174)
  call void @cleanComputeReal(i32 189)
  call void @cleanComputeReal(i32 204)
  call void @cleanComputeReal(i32 218)
  ret void
}

declare dso_local void @_E__pr_header(i8*, i64, i8*) #1

declare dso_local void @_E__die_error(i8*, ...) #1

declare dso_local i8* @__ckd_calloc__(i64, i64, i8*, i32) #1

declare dso_local void @_E__pr_info_header(i8*, i64, i8*) #1

declare dso_local void @_E__pr_info(i8*, ...) #1

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @funcExit(i64)

declare void @handleAlloca(i64)

declare void @setRealTemp(i64, i64)

declare void @setRealConstant(i64, float)

declare void @addFunArg(i32, i64, i64)

declare i64 @computeReal(i32, i64, i64, float, float, float, i32)

declare void @cleanComputeReal(i32)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
