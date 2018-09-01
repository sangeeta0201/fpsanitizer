; ModuleID = 'f_meas_inst.bc'
source_filename = "f_meas.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.site = type { i16, i16, i16, i16, i8, i32, %struct.double_prn, i32, [4 x %struct.su3_matrix], [4 x %struct.anti_hermitmat], [4 x double], %struct.su3_vector, %struct.su3_vector, %struct.su3_vector, %struct.su3_vector, %struct.su3_vector, %struct.su3_vector, [4 x %struct.su3_vector], %struct.su3_matrix, %struct.su3_matrix }
%struct.double_prn = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, double }
%struct.anti_hermitmat = type { %struct.complex, %struct.complex, %struct.complex, double, double, double, double }
%struct.complex = type { double, double }
%struct.su3_vector = type { [3 x %struct.complex] }
%struct.su3_matrix = type { [3 x [3 x %struct.complex]] }

@lattice = external dso_local global %struct.site*, align 8
@even_sites_on_node = external dso_local global i32, align 4
@sites_on_node = external dso_local global i32, align 4
@volume = external dso_local global i32, align 4
@this_node = external dso_local global i32, align 4
@.str = private unnamed_addr constant [38 x i8] c"PBP: mass %e     %e  %e ( %d of %d )\0A\00", align 1
@.str.1 = private unnamed_addr constant [38 x i8] c"FACTION: mass = %e,  %e ( %d of %d )\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @f_meas_imp(i32 %phi_off, i32 %xxx_off, double %mass) #0 {
entry:
  %0 = bitcast i8* null to i8*
  %1 = bitcast void (i32, i32, double)* @f_meas_imp to i8*
  %2 = call i64 @getAddr(i8* %1)
  call void @funcInit(i64 %2)
  %phi_off.addr = alloca i32, align 4
  %3 = bitcast i32* %phi_off.addr to i8*
  %4 = call i64 @getAddr(i8* %3)
  call void @handleAlloca(i64 %4)
  %xxx_off.addr = alloca i32, align 4
  %5 = bitcast i32* %xxx_off.addr to i8*
  %6 = call i64 @getAddr(i8* %5)
  call void @handleAlloca(i64 %6)
  %mass.addr = alloca double, align 8
  %7 = bitcast double* %mass.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  call void @handleAlloca(i64 %8)
  %r_psi_bar_psi_even = alloca double, align 8
  %9 = bitcast double* %r_psi_bar_psi_even to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void @handleAlloca(i64 %10)
  %r_psi_bar_psi_odd = alloca double, align 8
  %11 = bitcast double* %r_psi_bar_psi_odd to i8*
  %12 = call i64 @getAddr(i8* %11)
  call void @handleAlloca(i64 %12)
  %r_ferm_action = alloca double, align 8
  %13 = bitcast double* %r_ferm_action to i8*
  %14 = call i64 @getAddr(i8* %13)
  call void @handleAlloca(i64 %14)
  %i = alloca i32, align 4
  %15 = bitcast i32* %i to i8*
  %16 = call i64 @getAddr(i8* %15)
  call void @handleAlloca(i64 %16)
  %st = alloca %struct.site*, align 8
  %17 = bitcast %struct.site** %st to i8*
  %18 = call i64 @getAddr(i8* %17)
  call void @handleAlloca(i64 %18)
  %rpbp_e = alloca double, align 8
  %19 = bitcast double* %rpbp_e to i8*
  %20 = call i64 @getAddr(i8* %19)
  call void @handleAlloca(i64 %20)
  %rpbp_o = alloca double, align 8
  %21 = bitcast double* %rpbp_o to i8*
  %22 = call i64 @getAddr(i8* %21)
  call void @handleAlloca(i64 %22)
  %rfaction = alloca double, align 8
  %23 = bitcast double* %rfaction to i8*
  %24 = call i64 @getAddr(i8* %23)
  call void @handleAlloca(i64 %24)
  %cc = alloca %struct.complex, align 8
  %25 = bitcast %struct.complex* %cc to i8*
  %26 = call i64 @getAddr(i8* %25)
  call void @handleAlloca(i64 %26)
  %npbp_reps = alloca i32, align 4
  %27 = bitcast i32* %npbp_reps to i8*
  %28 = call i64 @getAddr(i8* %27)
  call void @handleAlloca(i64 %28)
  %jpbp_reps = alloca i32, align 4
  %29 = bitcast i32* %jpbp_reps to i8*
  %30 = call i64 @getAddr(i8* %29)
  call void @handleAlloca(i64 %30)
  %tmp = alloca %struct.complex, align 8
  %31 = bitcast %struct.complex* %tmp to i8*
  %32 = call i64 @getAddr(i8* %31)
  call void @handleAlloca(i64 %32)
  %tmp9 = alloca %struct.complex, align 8
  %33 = bitcast %struct.complex* %tmp9 to i8*
  %34 = call i64 @getAddr(i8* %33)
  call void @handleAlloca(i64 %34)
  %tmp21 = alloca %struct.complex, align 8
  %35 = bitcast %struct.complex* %tmp21 to i8*
  %36 = call i64 @getAddr(i8* %35)
  call void @handleAlloca(i64 %36)
  %37 = bitcast i32* %phi_off.addr to i8*
  store i32 %phi_off, i32* %phi_off.addr, align 4
  %38 = bitcast i32* %xxx_off.addr to i8*
  store i32 %xxx_off, i32* %xxx_off.addr, align 4
  %39 = bitcast double* %mass.addr to i8*
  %40 = call i64 @getAddr(i8* %39)
  %41 = bitcast void (i32, i32, double)* @f_meas_imp to i8*
  %42 = call i64 @getAddr(i8* %41)
  call void @setRealFunArg(i32 2, i64 %42, i64 %40, double %mass)
  store double %mass, double* %mass.addr, align 8
  %43 = bitcast i32* %npbp_reps to i8*
  store i32 1, i32* %npbp_reps, align 4
  %44 = bitcast i32* %jpbp_reps to i8*
  store i32 0, i32* %jpbp_reps, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc49, %entry
  %45 = bitcast i32* %jpbp_reps to i8*
  %46 = call i64 @getAddr(i8* %45)
  %47 = load i32, i32* %jpbp_reps, align 4
  %48 = bitcast i32* %npbp_reps to i8*
  %49 = call i64 @getAddr(i8* %48)
  %50 = load i32, i32* %npbp_reps, align 4
  %cmp = icmp slt i32 %47, %50
  br i1 %cmp, label %for.body, label %for.end51

for.body:                                         ; preds = %for.cond
  %51 = bitcast double* %rfaction to i8*
  %52 = call i64 @getAddr(i8* %51)
  call void @setRealConstant(i64 %52, double 0.000000e+00)
  store double 0.000000e+00, double* %rfaction, align 8
  %53 = bitcast double* %rpbp_o to i8*
  %54 = call i64 @getAddr(i8* %53)
  call void @setRealConstant(i64 %54, double 0.000000e+00)
  store double 0.000000e+00, double* %rpbp_o, align 8
  %55 = bitcast double* %rpbp_e to i8*
  %56 = call i64 @getAddr(i8* %55)
  call void @setRealConstant(i64 %56, double 0.000000e+00)
  store double 0.000000e+00, double* %rpbp_e, align 8
  %57 = bitcast i32* %phi_off.addr to i8*
  %58 = call i64 @getAddr(i8* %57)
  %59 = load i32, i32* %phi_off.addr, align 4
  %60 = bitcast double* %mass.addr to i8*
  %61 = call i64 @getAddr(i8* %60)
  %62 = load double, double* %mass.addr, align 8
  %63 = bitcast void (i32, double, i32)* @grsource_imp to i8*
  %64 = call i64 @getAddr(i8* %63)
  call void @addFunArg(i32 0, i64 %64, i64 %58)
  %65 = bitcast void (i32, double, i32)* @grsource_imp to i8*
  %66 = call i64 @getAddr(i8* %65)
  call void @addFunArg(i32 1, i64 %66, i64 %61)
  call void @grsource_imp(i32 %59, double %62, i32 3)
  %67 = bitcast %struct.site** @lattice to i8*
  %68 = call i64 @getAddr(i8* %67)
  %69 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx = getelementptr inbounds %struct.site, %struct.site* %69, i64 0
  %g_rand = getelementptr inbounds %struct.site, %struct.site* %arrayidx, i32 0, i32 16
  %70 = bitcast %struct.su3_vector* %g_rand to i8*
  %71 = bitcast %struct.site** @lattice to i8*
  %72 = call i64 @getAddr(i8* %71)
  %73 = load %struct.site*, %struct.site** @lattice, align 8
  %arrayidx1 = getelementptr inbounds %struct.site, %struct.site* %73, i64 0
  %74 = bitcast %struct.site* %arrayidx1 to i8*
  %sub.ptr.lhs.cast = ptrtoint i8* %70 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %74 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv = trunc i64 %sub.ptr.sub to i32
  %75 = bitcast i32* %xxx_off.addr to i8*
  %76 = call i64 @getAddr(i8* %75)
  %77 = load i32, i32* %xxx_off.addr, align 4
  %78 = bitcast i32* %phi_off.addr to i8*
  %79 = call i64 @getAddr(i8* %78)
  %80 = load i32, i32* %phi_off.addr, align 4
  %81 = bitcast double* %mass.addr to i8*
  %82 = call i64 @getAddr(i8* %81)
  %83 = load double, double* %mass.addr, align 8
  %84 = bitcast i32 (i32, i32, i32, double)* @mat_invert_uml to i8*
  %85 = call i64 @getAddr(i8* %84)
  call void @addFunArg(i32 1, i64 %85, i64 %76)
  %86 = bitcast i32 (i32, i32, i32, double)* @mat_invert_uml to i8*
  %87 = call i64 @getAddr(i8* %86)
  call void @addFunArg(i32 2, i64 %87, i64 %79)
  %88 = bitcast i32 (i32, i32, i32, double)* @mat_invert_uml to i8*
  %89 = call i64 @getAddr(i8* %88)
  call void @addFunArg(i32 3, i64 %89, i64 %82)
  %call = call i32 @mat_invert_uml(i32 %conv, i32 %77, i32 %80, double %83)
  %90 = bitcast i32* %i to i8*
  store i32 0, i32* %i, align 4
  %91 = bitcast %struct.site** @lattice to i8*
  %92 = call i64 @getAddr(i8* %91)
  %93 = load %struct.site*, %struct.site** @lattice, align 8
  %94 = bitcast %struct.site** %st to i8*
  %95 = call i64 @getAddr(i8* %94)
  %96 = bitcast %struct.site* %93 to i8*
  %97 = call i64 @getAddr(i8* %96)
  call void @setRealTemp(i64 %95, i64 %97)
  store %struct.site* %93, %struct.site** %st, align 8
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %98 = bitcast i32* %i to i8*
  %99 = call i64 @getAddr(i8* %98)
  %100 = load i32, i32* %i, align 4
  %101 = bitcast i32* @even_sites_on_node to i8*
  %102 = call i64 @getAddr(i8* %101)
  %103 = load i32, i32* @even_sites_on_node, align 4
  %cmp3 = icmp slt i32 %100, %103
  br i1 %cmp3, label %for.body5, label %for.end

for.body5:                                        ; preds = %for.cond2
  %104 = bitcast %struct.site** %st to i8*
  %105 = call i64 @getAddr(i8* %104)
  %106 = load %struct.site*, %struct.site** %st, align 8
  %107 = bitcast %struct.site* %106 to i8*
  %108 = bitcast i32* %phi_off.addr to i8*
  %109 = call i64 @getAddr(i8* %108)
  %110 = load i32, i32* %phi_off.addr, align 4
  %idx.ext = sext i32 %110 to i64
  %add.ptr = getelementptr inbounds i8, i8* %107, i64 %idx.ext
  %111 = bitcast i8* %add.ptr to %struct.su3_vector*
  %112 = bitcast %struct.site** %st to i8*
  %113 = call i64 @getAddr(i8* %112)
  %114 = load %struct.site*, %struct.site** %st, align 8
  %115 = bitcast %struct.site* %114 to i8*
  %116 = bitcast i32* %xxx_off.addr to i8*
  %117 = call i64 @getAddr(i8* %116)
  %118 = load i32, i32* %xxx_off.addr, align 4
  %idx.ext6 = sext i32 %118 to i64
  %add.ptr7 = getelementptr inbounds i8, i8* %115, i64 %idx.ext6
  %119 = bitcast i8* %add.ptr7 to %struct.su3_vector*
  %call8 = call { double, double } @su3_dot(%struct.su3_vector* %111, %struct.su3_vector* %119)
  %120 = bitcast %struct.complex* %tmp to { double, double }*
  %121 = getelementptr inbounds { double, double }, { double, double }* %120, i32 0, i32 0
  %122 = extractvalue { double, double } %call8, 0
  %123 = bitcast double* %121 to i8*
  %124 = call i64 @getAddr(i8* %123)
  store double %122, double* %121, align 8
  %125 = getelementptr inbounds { double, double }, { double, double }* %120, i32 0, i32 1
  %126 = extractvalue { double, double } %call8, 1
  %127 = bitcast double* %125 to i8*
  %128 = call i64 @getAddr(i8* %127)
  store double %126, double* %125, align 8
  %129 = bitcast %struct.complex* %cc to i8*
  %130 = bitcast %struct.complex* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %129, i8* align 8 %130, i64 16, i1 false)
  %real = getelementptr inbounds %struct.complex, %struct.complex* %cc, i32 0, i32 0
  %131 = bitcast double* %real to i8*
  %132 = call i64 @getAddr(i8* %131)
  %133 = load double, double* %real, align 8
  %134 = bitcast double* %rfaction to i8*
  %135 = call i64 @getAddr(i8* %134)
  %136 = load double, double* %rfaction, align 8
  %add = fadd double %136, %133
  %137 = call i64 @computeReal(i32 12, i64 %135, i64 %132, double %136, double %133, double %add, i32 85)
  %138 = bitcast double* %rfaction to i8*
  %139 = call i64 @getAddr(i8* %138)
  call void @setRealTemp(i64 %139, i64 %137)
  store double %add, double* %rfaction, align 8
  %140 = bitcast %struct.site** %st to i8*
  %141 = call i64 @getAddr(i8* %140)
  %142 = load %struct.site*, %struct.site** %st, align 8
  %g_rand10 = getelementptr inbounds %struct.site, %struct.site* %142, i32 0, i32 16
  %143 = bitcast %struct.site** %st to i8*
  %144 = call i64 @getAddr(i8* %143)
  %145 = load %struct.site*, %struct.site** %st, align 8
  %146 = bitcast %struct.site* %145 to i8*
  %147 = bitcast i32* %xxx_off.addr to i8*
  %148 = call i64 @getAddr(i8* %147)
  %149 = load i32, i32* %xxx_off.addr, align 4
  %idx.ext11 = sext i32 %149 to i64
  %add.ptr12 = getelementptr inbounds i8, i8* %146, i64 %idx.ext11
  %150 = bitcast i8* %add.ptr12 to %struct.su3_vector*
  %call13 = call { double, double } @su3_dot(%struct.su3_vector* %g_rand10, %struct.su3_vector* %150)
  %151 = bitcast %struct.complex* %tmp9 to { double, double }*
  %152 = getelementptr inbounds { double, double }, { double, double }* %151, i32 0, i32 0
  %153 = extractvalue { double, double } %call13, 0
  %154 = bitcast double* %152 to i8*
  %155 = call i64 @getAddr(i8* %154)
  store double %153, double* %152, align 8
  %156 = getelementptr inbounds { double, double }, { double, double }* %151, i32 0, i32 1
  %157 = extractvalue { double, double } %call13, 1
  %158 = bitcast double* %156 to i8*
  %159 = call i64 @getAddr(i8* %158)
  store double %157, double* %156, align 8
  %160 = bitcast %struct.complex* %cc to i8*
  %161 = bitcast %struct.complex* %tmp9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %160, i8* align 8 %161, i64 16, i1 false)
  %real14 = getelementptr inbounds %struct.complex, %struct.complex* %cc, i32 0, i32 0
  %162 = bitcast double* %real14 to i8*
  %163 = call i64 @getAddr(i8* %162)
  %164 = load double, double* %real14, align 8
  %165 = bitcast double* %rpbp_e to i8*
  %166 = call i64 @getAddr(i8* %165)
  %167 = load double, double* %rpbp_e, align 8
  %add15 = fadd double %167, %164
  %168 = call i64 @computeReal(i32 12, i64 %166, i64 %163, double %167, double %164, double %add15, i32 109)
  %169 = bitcast double* %rpbp_e to i8*
  %170 = call i64 @getAddr(i8* %169)
  call void @setRealTemp(i64 %170, i64 %168)
  store double %add15, double* %rpbp_e, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body5
  %171 = bitcast i32* %i to i8*
  %172 = call i64 @getAddr(i8* %171)
  %173 = load i32, i32* %i, align 4
  %inc = add nsw i32 %173, 1
  %174 = bitcast i32* %i to i8*
  store i32 %inc, i32* %i, align 4
  %175 = bitcast %struct.site** %st to i8*
  %176 = call i64 @getAddr(i8* %175)
  %177 = load %struct.site*, %struct.site** %st, align 8
  %incdec.ptr = getelementptr inbounds %struct.site, %struct.site* %177, i32 1
  %178 = bitcast %struct.site** %st to i8*
  %179 = call i64 @getAddr(i8* %178)
  %180 = bitcast %struct.site* %incdec.ptr to i8*
  %181 = call i64 @getAddr(i8* %180)
  call void @setRealTemp(i64 %179, i64 %181)
  store %struct.site* %incdec.ptr, %struct.site** %st, align 8
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  %182 = bitcast i32* @even_sites_on_node to i8*
  %183 = call i64 @getAddr(i8* %182)
  %184 = load i32, i32* @even_sites_on_node, align 4
  %185 = bitcast i32* %i to i8*
  store i32 %184, i32* %i, align 4
  %186 = bitcast %struct.site** @lattice to i8*
  %187 = call i64 @getAddr(i8* %186)
  %188 = load %struct.site*, %struct.site** @lattice, align 8
  %189 = bitcast i32* %i to i8*
  %190 = call i64 @getAddr(i8* %189)
  %191 = load i32, i32* %i, align 4
  %idxprom = sext i32 %191 to i64
  %arrayidx16 = getelementptr inbounds %struct.site, %struct.site* %188, i64 %idxprom
  %192 = bitcast %struct.site** %st to i8*
  %193 = call i64 @getAddr(i8* %192)
  %194 = bitcast %struct.site* %arrayidx16 to i8*
  %195 = call i64 @getAddr(i8* %194)
  call void @setRealTemp(i64 %193, i64 %195)
  store %struct.site* %arrayidx16, %struct.site** %st, align 8
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc28, %for.end
  %196 = bitcast i32* %i to i8*
  %197 = call i64 @getAddr(i8* %196)
  %198 = load i32, i32* %i, align 4
  %199 = bitcast i32* @sites_on_node to i8*
  %200 = call i64 @getAddr(i8* %199)
  %201 = load i32, i32* @sites_on_node, align 4
  %cmp18 = icmp slt i32 %198, %201
  br i1 %cmp18, label %for.body20, label %for.end31

for.body20:                                       ; preds = %for.cond17
  %202 = bitcast %struct.site** %st to i8*
  %203 = call i64 @getAddr(i8* %202)
  %204 = load %struct.site*, %struct.site** %st, align 8
  %g_rand22 = getelementptr inbounds %struct.site, %struct.site* %204, i32 0, i32 16
  %205 = bitcast %struct.site** %st to i8*
  %206 = call i64 @getAddr(i8* %205)
  %207 = load %struct.site*, %struct.site** %st, align 8
  %208 = bitcast %struct.site* %207 to i8*
  %209 = bitcast i32* %xxx_off.addr to i8*
  %210 = call i64 @getAddr(i8* %209)
  %211 = load i32, i32* %xxx_off.addr, align 4
  %idx.ext23 = sext i32 %211 to i64
  %add.ptr24 = getelementptr inbounds i8, i8* %208, i64 %idx.ext23
  %212 = bitcast i8* %add.ptr24 to %struct.su3_vector*
  %call25 = call { double, double } @su3_dot(%struct.su3_vector* %g_rand22, %struct.su3_vector* %212)
  %213 = bitcast %struct.complex* %tmp21 to { double, double }*
  %214 = getelementptr inbounds { double, double }, { double, double }* %213, i32 0, i32 0
  %215 = extractvalue { double, double } %call25, 0
  %216 = bitcast double* %214 to i8*
  %217 = call i64 @getAddr(i8* %216)
  store double %215, double* %214, align 8
  %218 = getelementptr inbounds { double, double }, { double, double }* %213, i32 0, i32 1
  %219 = extractvalue { double, double } %call25, 1
  %220 = bitcast double* %218 to i8*
  %221 = call i64 @getAddr(i8* %220)
  store double %219, double* %218, align 8
  %222 = bitcast %struct.complex* %cc to i8*
  %223 = bitcast %struct.complex* %tmp21 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %222, i8* align 8 %223, i64 16, i1 false)
  %real26 = getelementptr inbounds %struct.complex, %struct.complex* %cc, i32 0, i32 0
  %224 = bitcast double* %real26 to i8*
  %225 = call i64 @getAddr(i8* %224)
  %226 = load double, double* %real26, align 8
  %227 = bitcast double* %rpbp_o to i8*
  %228 = call i64 @getAddr(i8* %227)
  %229 = load double, double* %rpbp_o, align 8
  %add27 = fadd double %229, %226
  %230 = call i64 @computeReal(i32 12, i64 %228, i64 %225, double %229, double %226, double %add27, i32 153)
  %231 = bitcast double* %rpbp_o to i8*
  %232 = call i64 @getAddr(i8* %231)
  call void @setRealTemp(i64 %232, i64 %230)
  store double %add27, double* %rpbp_o, align 8
  br label %for.inc28

for.inc28:                                        ; preds = %for.body20
  %233 = bitcast i32* %i to i8*
  %234 = call i64 @getAddr(i8* %233)
  %235 = load i32, i32* %i, align 4
  %inc29 = add nsw i32 %235, 1
  %236 = bitcast i32* %i to i8*
  store i32 %inc29, i32* %i, align 4
  %237 = bitcast %struct.site** %st to i8*
  %238 = call i64 @getAddr(i8* %237)
  %239 = load %struct.site*, %struct.site** %st, align 8
  %incdec.ptr30 = getelementptr inbounds %struct.site, %struct.site* %239, i32 1
  %240 = bitcast %struct.site** %st to i8*
  %241 = call i64 @getAddr(i8* %240)
  %242 = bitcast %struct.site* %incdec.ptr30 to i8*
  %243 = call i64 @getAddr(i8* %242)
  call void @setRealTemp(i64 %241, i64 %243)
  store %struct.site* %incdec.ptr30, %struct.site** %st, align 8
  br label %for.cond17

for.end31:                                        ; preds = %for.cond17
  call void @g_doublesum(double* %rpbp_o)
  call void @g_doublesum(double* %rpbp_e)
  call void @g_doublesum(double* %rfaction)
  %244 = bitcast double* %rpbp_o to i8*
  %245 = call i64 @getAddr(i8* %244)
  %246 = load double, double* %rpbp_o, align 8
  %247 = bitcast i32* @volume to i8*
  %248 = call i64 @getAddr(i8* %247)
  %249 = load i32, i32* @volume, align 4
  %conv32 = sitofp i32 %249 to double
  %div = fdiv double 2.000000e+00, %conv32
  %250 = call i64 @computeReal(i32 19, i64 0, i64 0, double 2.000000e+00, double %conv32, double %div, i32 169)
  %mul = fmul double %246, %div
  %251 = call i64 @computeReal(i32 16, i64 %245, i64 %250, double %246, double %div, double %mul, i32 170)
  %252 = bitcast double* %r_psi_bar_psi_odd to i8*
  %253 = call i64 @getAddr(i8* %252)
  call void @setRealTemp(i64 %253, i64 %251)
  store double %mul, double* %r_psi_bar_psi_odd, align 8
  %254 = bitcast double* %rpbp_e to i8*
  %255 = call i64 @getAddr(i8* %254)
  %256 = load double, double* %rpbp_e, align 8
  %257 = bitcast i32* @volume to i8*
  %258 = call i64 @getAddr(i8* %257)
  %259 = load i32, i32* @volume, align 4
  %conv33 = sitofp i32 %259 to double
  %div34 = fdiv double 2.000000e+00, %conv33
  %260 = call i64 @computeReal(i32 19, i64 0, i64 0, double 2.000000e+00, double %conv33, double %div34, i32 175)
  %mul35 = fmul double %256, %div34
  %261 = call i64 @computeReal(i32 16, i64 %255, i64 %260, double %256, double %div34, double %mul35, i32 176)
  %262 = bitcast double* %r_psi_bar_psi_even to i8*
  %263 = call i64 @getAddr(i8* %262)
  call void @setRealTemp(i64 %263, i64 %261)
  store double %mul35, double* %r_psi_bar_psi_even, align 8
  %264 = bitcast double* %rfaction to i8*
  %265 = call i64 @getAddr(i8* %264)
  %266 = load double, double* %rfaction, align 8
  %267 = bitcast i32* @volume to i8*
  %268 = call i64 @getAddr(i8* %267)
  %269 = load i32, i32* @volume, align 4
  %conv36 = sitofp i32 %269 to double
  %div37 = fdiv double 1.000000e+00, %conv36
  %270 = call i64 @computeReal(i32 19, i64 0, i64 0, double 1.000000e+00, double %conv36, double %div37, i32 181)
  %mul38 = fmul double %266, %div37
  %271 = call i64 @computeReal(i32 16, i64 %265, i64 %270, double %266, double %div37, double %mul38, i32 182)
  %272 = bitcast double* %r_ferm_action to i8*
  %273 = call i64 @getAddr(i8* %272)
  call void @setRealTemp(i64 %273, i64 %271)
  store double %mul38, double* %r_ferm_action, align 8
  %274 = bitcast i32* @this_node to i8*
  %275 = call i64 @getAddr(i8* %274)
  %276 = load i32, i32* @this_node, align 4
  %cmp39 = icmp eq i32 %276, 0
  br i1 %cmp39, label %if.then, label %if.end

if.then:                                          ; preds = %for.end31
  %277 = bitcast double* %mass.addr to i8*
  %278 = call i64 @getAddr(i8* %277)
  %279 = load double, double* %mass.addr, align 8
  %280 = bitcast double* %r_psi_bar_psi_even to i8*
  %281 = call i64 @getAddr(i8* %280)
  %282 = load double, double* %r_psi_bar_psi_even, align 8
  %283 = bitcast double* %r_psi_bar_psi_odd to i8*
  %284 = call i64 @getAddr(i8* %283)
  %285 = load double, double* %r_psi_bar_psi_odd, align 8
  %286 = bitcast i32* %jpbp_reps to i8*
  %287 = call i64 @getAddr(i8* %286)
  %288 = load i32, i32* %jpbp_reps, align 4
  %add41 = add nsw i32 %288, 1
  %289 = bitcast i32* %npbp_reps to i8*
  %290 = call i64 @getAddr(i8* %289)
  %291 = load i32, i32* %npbp_reps, align 4
  %call42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0), double %279, double %282, double %285, i32 %add41, i32 %291)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end31
  %292 = bitcast i32* @this_node to i8*
  %293 = call i64 @getAddr(i8* %292)
  %294 = load i32, i32* @this_node, align 4
  %cmp43 = icmp eq i32 %294, 0
  br i1 %cmp43, label %if.then45, label %if.end48

if.then45:                                        ; preds = %if.end
  %295 = bitcast double* %mass.addr to i8*
  %296 = call i64 @getAddr(i8* %295)
  %297 = load double, double* %mass.addr, align 8
  %298 = bitcast double* %r_ferm_action to i8*
  %299 = call i64 @getAddr(i8* %298)
  %300 = load double, double* %r_ferm_action, align 8
  %301 = bitcast i32* %jpbp_reps to i8*
  %302 = call i64 @getAddr(i8* %301)
  %303 = load i32, i32* %jpbp_reps, align 4
  %add46 = add nsw i32 %303, 1
  %304 = bitcast i32* %npbp_reps to i8*
  %305 = call i64 @getAddr(i8* %304)
  %306 = load i32, i32* %npbp_reps, align 4
  %call47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.1, i32 0, i32 0), double %297, double %300, i32 %add46, i32 %306)
  br label %if.end48

if.end48:                                         ; preds = %if.then45, %if.end
  br label %for.inc49

for.inc49:                                        ; preds = %if.end48
  %307 = bitcast i32* %jpbp_reps to i8*
  %308 = call i64 @getAddr(i8* %307)
  %309 = load i32, i32* %jpbp_reps, align 4
  %inc50 = add nsw i32 %309, 1
  %310 = bitcast i32* %jpbp_reps to i8*
  store i32 %inc50, i32* %jpbp_reps, align 4
  br label %for.cond

for.end51:                                        ; preds = %for.cond
  %311 = bitcast void (i32, i32, double)* @f_meas_imp to i8*
  %312 = call i64 @getAddr(i8* %311)
  call void @funcExit(i64 %312)
  call void @cleanComputeReal(i32 85)
  call void @cleanComputeReal(i32 109)
  call void @cleanComputeReal(i32 153)
  call void @cleanComputeReal(i32 169)
  call void @cleanComputeReal(i32 170)
  call void @cleanComputeReal(i32 175)
  call void @cleanComputeReal(i32 176)
  call void @cleanComputeReal(i32 181)
  call void @cleanComputeReal(i32 182)
  ret void
}

declare dso_local void @grsource_imp(i32, double, i32) #1

declare dso_local i32 @mat_invert_uml(i32, i32, i32, double) #1

declare dso_local { double, double } @su3_dot(%struct.su3_vector*, %struct.su3_vector*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #2

declare dso_local void @g_doublesum(double*) #1

declare dso_local i32 @printf(i8*, ...) #1

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @funcExit(i64)

declare void @handleAlloca(i64)

declare void @setRealFunArg(i32, i64, i64, double)

declare void @setRealConstant(i64, double)

declare void @addFunArg(i32, i64, i64)

declare void @setRealTemp(i64, i64)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @cleanComputeReal(i32)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
