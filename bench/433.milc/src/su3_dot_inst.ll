; ModuleID = 'su3_dot_inst.bc'
source_filename = "su3_dot.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.su3_vector = type { [3 x %struct.complex] }
%struct.complex = type { double, double }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { double, double } @su3_dot(%struct.su3_vector* %a, %struct.su3_vector* %b) #0 {
entry:
  %0 = bitcast i8* null to i8*
  %1 = bitcast { double, double } (%struct.su3_vector*, %struct.su3_vector*)* @su3_dot to i8*
  %2 = call i64 @getAddr(i8* %1)
  call void @funcInit(i64 %2)
  %retval = alloca %struct.complex, align 8
  %3 = bitcast %struct.complex* %retval to i8*
  %4 = call i64 @getAddr(i8* %3)
  call void @handleAlloca(i64 %4)
  %a.addr = alloca %struct.su3_vector*, align 8
  %5 = bitcast %struct.su3_vector** %a.addr to i8*
  %6 = call i64 @getAddr(i8* %5)
  call void @handleAlloca(i64 %6)
  %b.addr = alloca %struct.su3_vector*, align 8
  %7 = bitcast %struct.su3_vector** %b.addr to i8*
  %8 = call i64 @getAddr(i8* %7)
  call void @handleAlloca(i64 %8)
  %temp2 = alloca %struct.complex, align 8
  %9 = bitcast %struct.complex* %temp2 to i8*
  %10 = call i64 @getAddr(i8* %9)
  call void @handleAlloca(i64 %10)
  %11 = bitcast %struct.su3_vector** %a.addr to i8*
  %12 = call i64 @getAddr(i8* %11)
  %13 = bitcast %struct.su3_vector* %a to i8*
  %14 = call i64 @getAddr(i8* %13)
  call void @setRealTemp(i64 %12, i64 %14)
  store %struct.su3_vector* %a, %struct.su3_vector** %a.addr, align 8
  %15 = bitcast %struct.su3_vector** %b.addr to i8*
  %16 = call i64 @getAddr(i8* %15)
  %17 = bitcast %struct.su3_vector* %b to i8*
  %18 = call i64 @getAddr(i8* %17)
  call void @setRealTemp(i64 %16, i64 %18)
  store %struct.su3_vector* %b, %struct.su3_vector** %b.addr, align 8
  %19 = bitcast %struct.su3_vector** %a.addr to i8*
  %20 = call i64 @getAddr(i8* %19)
  %21 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %21, i32 0, i32 0
  %arrayidx = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c, i64 0, i64 0
  %real = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx, i32 0, i32 0
  %22 = bitcast double* %real to i8*
  %23 = call i64 @getAddr(i8* %22)
  %24 = load double, double* %real, align 8
  %25 = bitcast %struct.su3_vector** %b.addr to i8*
  %26 = call i64 @getAddr(i8* %25)
  %27 = load %struct.su3_vector*, %struct.su3_vector** %b.addr, align 8
  %c1 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %27, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c1, i64 0, i64 0
  %real3 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx2, i32 0, i32 0
  %28 = bitcast double* %real3 to i8*
  %29 = call i64 @getAddr(i8* %28)
  %30 = load double, double* %real3, align 8
  %mul = fmul double %24, %30
  %31 = call i64 @computeReal(i32 16, i64 %23, i64 %29, double %24, double %30, double %mul, i32 19)
  %32 = bitcast %struct.su3_vector** %a.addr to i8*
  %33 = call i64 @getAddr(i8* %32)
  %34 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c4 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %34, i32 0, i32 0
  %arrayidx5 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c4, i64 0, i64 0
  %imag = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx5, i32 0, i32 1
  %35 = bitcast double* %imag to i8*
  %36 = call i64 @getAddr(i8* %35)
  %37 = load double, double* %imag, align 8
  %38 = bitcast %struct.su3_vector** %b.addr to i8*
  %39 = call i64 @getAddr(i8* %38)
  %40 = load %struct.su3_vector*, %struct.su3_vector** %b.addr, align 8
  %c6 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %40, i32 0, i32 0
  %arrayidx7 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c6, i64 0, i64 0
  %imag8 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx7, i32 0, i32 1
  %41 = bitcast double* %imag8 to i8*
  %42 = call i64 @getAddr(i8* %41)
  %43 = load double, double* %imag8, align 8
  %mul9 = fmul double %37, %43
  %44 = call i64 @computeReal(i32 16, i64 %36, i64 %42, double %37, double %43, double %mul9, i32 30)
  %add = fadd double %mul, %mul9
  %45 = call i64 @computeReal(i32 12, i64 %31, i64 %44, double %mul, double %mul9, double %add, i32 31)
  %real10 = getelementptr inbounds %struct.complex, %struct.complex* %retval, i32 0, i32 0
  %46 = bitcast double* %real10 to i8*
  %47 = call i64 @getAddr(i8* %46)
  call void @setRealTemp(i64 %47, i64 %45)
  store double %add, double* %real10, align 8
  %48 = bitcast %struct.su3_vector** %a.addr to i8*
  %49 = call i64 @getAddr(i8* %48)
  %50 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c11 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %50, i32 0, i32 0
  %arrayidx12 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c11, i64 0, i64 0
  %real13 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx12, i32 0, i32 0
  %51 = bitcast double* %real13 to i8*
  %52 = call i64 @getAddr(i8* %51)
  %53 = load double, double* %real13, align 8
  %54 = bitcast %struct.su3_vector** %b.addr to i8*
  %55 = call i64 @getAddr(i8* %54)
  %56 = load %struct.su3_vector*, %struct.su3_vector** %b.addr, align 8
  %c14 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %56, i32 0, i32 0
  %arrayidx15 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c14, i64 0, i64 0
  %imag16 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx15, i32 0, i32 1
  %57 = bitcast double* %imag16 to i8*
  %58 = call i64 @getAddr(i8* %57)
  %59 = load double, double* %imag16, align 8
  %mul17 = fmul double %53, %59
  %60 = call i64 @computeReal(i32 16, i64 %52, i64 %58, double %53, double %59, double %mul17, i32 44)
  %61 = bitcast %struct.su3_vector** %a.addr to i8*
  %62 = call i64 @getAddr(i8* %61)
  %63 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c18 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %63, i32 0, i32 0
  %arrayidx19 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c18, i64 0, i64 0
  %imag20 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx19, i32 0, i32 1
  %64 = bitcast double* %imag20 to i8*
  %65 = call i64 @getAddr(i8* %64)
  %66 = load double, double* %imag20, align 8
  %67 = bitcast %struct.su3_vector** %b.addr to i8*
  %68 = call i64 @getAddr(i8* %67)
  %69 = load %struct.su3_vector*, %struct.su3_vector** %b.addr, align 8
  %c21 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %69, i32 0, i32 0
  %arrayidx22 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c21, i64 0, i64 0
  %real23 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx22, i32 0, i32 0
  %70 = bitcast double* %real23 to i8*
  %71 = call i64 @getAddr(i8* %70)
  %72 = load double, double* %real23, align 8
  %mul24 = fmul double %66, %72
  %73 = call i64 @computeReal(i32 16, i64 %65, i64 %71, double %66, double %72, double %mul24, i32 55)
  %sub = fsub double %mul17, %mul24
  %74 = call i64 @computeReal(i32 14, i64 %60, i64 %73, double %mul17, double %mul24, double %sub, i32 56)
  %imag25 = getelementptr inbounds %struct.complex, %struct.complex* %retval, i32 0, i32 1
  %75 = bitcast double* %imag25 to i8*
  %76 = call i64 @getAddr(i8* %75)
  call void @setRealTemp(i64 %76, i64 %74)
  store double %sub, double* %imag25, align 8
  %77 = bitcast %struct.su3_vector** %a.addr to i8*
  %78 = call i64 @getAddr(i8* %77)
  %79 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c26 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %79, i32 0, i32 0
  %arrayidx27 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c26, i64 0, i64 1
  %real28 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx27, i32 0, i32 0
  %80 = bitcast double* %real28 to i8*
  %81 = call i64 @getAddr(i8* %80)
  %82 = load double, double* %real28, align 8
  %83 = bitcast %struct.su3_vector** %b.addr to i8*
  %84 = call i64 @getAddr(i8* %83)
  %85 = load %struct.su3_vector*, %struct.su3_vector** %b.addr, align 8
  %c29 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %85, i32 0, i32 0
  %arrayidx30 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c29, i64 0, i64 1
  %real31 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx30, i32 0, i32 0
  %86 = bitcast double* %real31 to i8*
  %87 = call i64 @getAddr(i8* %86)
  %88 = load double, double* %real31, align 8
  %mul32 = fmul double %82, %88
  %89 = call i64 @computeReal(i32 16, i64 %81, i64 %87, double %82, double %88, double %mul32, i32 69)
  %90 = bitcast %struct.su3_vector** %a.addr to i8*
  %91 = call i64 @getAddr(i8* %90)
  %92 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c33 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %92, i32 0, i32 0
  %arrayidx34 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c33, i64 0, i64 1
  %imag35 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx34, i32 0, i32 1
  %93 = bitcast double* %imag35 to i8*
  %94 = call i64 @getAddr(i8* %93)
  %95 = load double, double* %imag35, align 8
  %96 = bitcast %struct.su3_vector** %b.addr to i8*
  %97 = call i64 @getAddr(i8* %96)
  %98 = load %struct.su3_vector*, %struct.su3_vector** %b.addr, align 8
  %c36 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %98, i32 0, i32 0
  %arrayidx37 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c36, i64 0, i64 1
  %imag38 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx37, i32 0, i32 1
  %99 = bitcast double* %imag38 to i8*
  %100 = call i64 @getAddr(i8* %99)
  %101 = load double, double* %imag38, align 8
  %mul39 = fmul double %95, %101
  %102 = call i64 @computeReal(i32 16, i64 %94, i64 %100, double %95, double %101, double %mul39, i32 80)
  %add40 = fadd double %mul32, %mul39
  %103 = call i64 @computeReal(i32 12, i64 %89, i64 %102, double %mul32, double %mul39, double %add40, i32 81)
  %real41 = getelementptr inbounds %struct.complex, %struct.complex* %temp2, i32 0, i32 0
  %104 = bitcast double* %real41 to i8*
  %105 = call i64 @getAddr(i8* %104)
  call void @setRealTemp(i64 %105, i64 %103)
  store double %add40, double* %real41, align 8
  %106 = bitcast %struct.su3_vector** %a.addr to i8*
  %107 = call i64 @getAddr(i8* %106)
  %108 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c42 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %108, i32 0, i32 0
  %arrayidx43 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c42, i64 0, i64 1
  %real44 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx43, i32 0, i32 0
  %109 = bitcast double* %real44 to i8*
  %110 = call i64 @getAddr(i8* %109)
  %111 = load double, double* %real44, align 8
  %112 = bitcast %struct.su3_vector** %b.addr to i8*
  %113 = call i64 @getAddr(i8* %112)
  %114 = load %struct.su3_vector*, %struct.su3_vector** %b.addr, align 8
  %c45 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %114, i32 0, i32 0
  %arrayidx46 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c45, i64 0, i64 1
  %imag47 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx46, i32 0, i32 1
  %115 = bitcast double* %imag47 to i8*
  %116 = call i64 @getAddr(i8* %115)
  %117 = load double, double* %imag47, align 8
  %mul48 = fmul double %111, %117
  %118 = call i64 @computeReal(i32 16, i64 %110, i64 %116, double %111, double %117, double %mul48, i32 94)
  %119 = bitcast %struct.su3_vector** %a.addr to i8*
  %120 = call i64 @getAddr(i8* %119)
  %121 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c49 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %121, i32 0, i32 0
  %arrayidx50 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c49, i64 0, i64 1
  %imag51 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx50, i32 0, i32 1
  %122 = bitcast double* %imag51 to i8*
  %123 = call i64 @getAddr(i8* %122)
  %124 = load double, double* %imag51, align 8
  %125 = bitcast %struct.su3_vector** %b.addr to i8*
  %126 = call i64 @getAddr(i8* %125)
  %127 = load %struct.su3_vector*, %struct.su3_vector** %b.addr, align 8
  %c52 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %127, i32 0, i32 0
  %arrayidx53 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c52, i64 0, i64 1
  %real54 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx53, i32 0, i32 0
  %128 = bitcast double* %real54 to i8*
  %129 = call i64 @getAddr(i8* %128)
  %130 = load double, double* %real54, align 8
  %mul55 = fmul double %124, %130
  %131 = call i64 @computeReal(i32 16, i64 %123, i64 %129, double %124, double %130, double %mul55, i32 105)
  %sub56 = fsub double %mul48, %mul55
  %132 = call i64 @computeReal(i32 14, i64 %118, i64 %131, double %mul48, double %mul55, double %sub56, i32 106)
  %imag57 = getelementptr inbounds %struct.complex, %struct.complex* %temp2, i32 0, i32 1
  %133 = bitcast double* %imag57 to i8*
  %134 = call i64 @getAddr(i8* %133)
  call void @setRealTemp(i64 %134, i64 %132)
  store double %sub56, double* %imag57, align 8
  %real58 = getelementptr inbounds %struct.complex, %struct.complex* %temp2, i32 0, i32 0
  %135 = bitcast double* %real58 to i8*
  %136 = call i64 @getAddr(i8* %135)
  %137 = load double, double* %real58, align 8
  %real59 = getelementptr inbounds %struct.complex, %struct.complex* %retval, i32 0, i32 0
  %138 = bitcast double* %real59 to i8*
  %139 = call i64 @getAddr(i8* %138)
  %140 = load double, double* %real59, align 8
  %add60 = fadd double %140, %137
  %141 = call i64 @computeReal(i32 12, i64 %139, i64 %136, double %140, double %137, double %add60, i32 113)
  %142 = bitcast double* %real59 to i8*
  %143 = call i64 @getAddr(i8* %142)
  call void @setRealTemp(i64 %143, i64 %141)
  store double %add60, double* %real59, align 8
  %imag61 = getelementptr inbounds %struct.complex, %struct.complex* %temp2, i32 0, i32 1
  %144 = bitcast double* %imag61 to i8*
  %145 = call i64 @getAddr(i8* %144)
  %146 = load double, double* %imag61, align 8
  %imag62 = getelementptr inbounds %struct.complex, %struct.complex* %retval, i32 0, i32 1
  %147 = bitcast double* %imag62 to i8*
  %148 = call i64 @getAddr(i8* %147)
  %149 = load double, double* %imag62, align 8
  %add63 = fadd double %149, %146
  %150 = call i64 @computeReal(i32 12, i64 %148, i64 %145, double %149, double %146, double %add63, i32 119)
  %151 = bitcast double* %imag62 to i8*
  %152 = call i64 @getAddr(i8* %151)
  call void @setRealTemp(i64 %152, i64 %150)
  store double %add63, double* %imag62, align 8
  %153 = bitcast %struct.su3_vector** %a.addr to i8*
  %154 = call i64 @getAddr(i8* %153)
  %155 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c64 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %155, i32 0, i32 0
  %arrayidx65 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c64, i64 0, i64 2
  %real66 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx65, i32 0, i32 0
  %156 = bitcast double* %real66 to i8*
  %157 = call i64 @getAddr(i8* %156)
  %158 = load double, double* %real66, align 8
  %159 = bitcast %struct.su3_vector** %b.addr to i8*
  %160 = call i64 @getAddr(i8* %159)
  %161 = load %struct.su3_vector*, %struct.su3_vector** %b.addr, align 8
  %c67 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %161, i32 0, i32 0
  %arrayidx68 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c67, i64 0, i64 2
  %real69 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx68, i32 0, i32 0
  %162 = bitcast double* %real69 to i8*
  %163 = call i64 @getAddr(i8* %162)
  %164 = load double, double* %real69, align 8
  %mul70 = fmul double %158, %164
  %165 = call i64 @computeReal(i32 16, i64 %157, i64 %163, double %158, double %164, double %mul70, i32 131)
  %166 = bitcast %struct.su3_vector** %a.addr to i8*
  %167 = call i64 @getAddr(i8* %166)
  %168 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c71 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %168, i32 0, i32 0
  %arrayidx72 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c71, i64 0, i64 2
  %imag73 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx72, i32 0, i32 1
  %169 = bitcast double* %imag73 to i8*
  %170 = call i64 @getAddr(i8* %169)
  %171 = load double, double* %imag73, align 8
  %172 = bitcast %struct.su3_vector** %b.addr to i8*
  %173 = call i64 @getAddr(i8* %172)
  %174 = load %struct.su3_vector*, %struct.su3_vector** %b.addr, align 8
  %c74 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %174, i32 0, i32 0
  %arrayidx75 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c74, i64 0, i64 2
  %imag76 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx75, i32 0, i32 1
  %175 = bitcast double* %imag76 to i8*
  %176 = call i64 @getAddr(i8* %175)
  %177 = load double, double* %imag76, align 8
  %mul77 = fmul double %171, %177
  %178 = call i64 @computeReal(i32 16, i64 %170, i64 %176, double %171, double %177, double %mul77, i32 142)
  %add78 = fadd double %mul70, %mul77
  %179 = call i64 @computeReal(i32 12, i64 %165, i64 %178, double %mul70, double %mul77, double %add78, i32 143)
  %real79 = getelementptr inbounds %struct.complex, %struct.complex* %temp2, i32 0, i32 0
  %180 = bitcast double* %real79 to i8*
  %181 = call i64 @getAddr(i8* %180)
  call void @setRealTemp(i64 %181, i64 %179)
  store double %add78, double* %real79, align 8
  %182 = bitcast %struct.su3_vector** %a.addr to i8*
  %183 = call i64 @getAddr(i8* %182)
  %184 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c80 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %184, i32 0, i32 0
  %arrayidx81 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c80, i64 0, i64 2
  %real82 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx81, i32 0, i32 0
  %185 = bitcast double* %real82 to i8*
  %186 = call i64 @getAddr(i8* %185)
  %187 = load double, double* %real82, align 8
  %188 = bitcast %struct.su3_vector** %b.addr to i8*
  %189 = call i64 @getAddr(i8* %188)
  %190 = load %struct.su3_vector*, %struct.su3_vector** %b.addr, align 8
  %c83 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %190, i32 0, i32 0
  %arrayidx84 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c83, i64 0, i64 2
  %imag85 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx84, i32 0, i32 1
  %191 = bitcast double* %imag85 to i8*
  %192 = call i64 @getAddr(i8* %191)
  %193 = load double, double* %imag85, align 8
  %mul86 = fmul double %187, %193
  %194 = call i64 @computeReal(i32 16, i64 %186, i64 %192, double %187, double %193, double %mul86, i32 156)
  %195 = bitcast %struct.su3_vector** %a.addr to i8*
  %196 = call i64 @getAddr(i8* %195)
  %197 = load %struct.su3_vector*, %struct.su3_vector** %a.addr, align 8
  %c87 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %197, i32 0, i32 0
  %arrayidx88 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c87, i64 0, i64 2
  %imag89 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx88, i32 0, i32 1
  %198 = bitcast double* %imag89 to i8*
  %199 = call i64 @getAddr(i8* %198)
  %200 = load double, double* %imag89, align 8
  %201 = bitcast %struct.su3_vector** %b.addr to i8*
  %202 = call i64 @getAddr(i8* %201)
  %203 = load %struct.su3_vector*, %struct.su3_vector** %b.addr, align 8
  %c90 = getelementptr inbounds %struct.su3_vector, %struct.su3_vector* %203, i32 0, i32 0
  %arrayidx91 = getelementptr inbounds [3 x %struct.complex], [3 x %struct.complex]* %c90, i64 0, i64 2
  %real92 = getelementptr inbounds %struct.complex, %struct.complex* %arrayidx91, i32 0, i32 0
  %204 = bitcast double* %real92 to i8*
  %205 = call i64 @getAddr(i8* %204)
  %206 = load double, double* %real92, align 8
  %mul93 = fmul double %200, %206
  %207 = call i64 @computeReal(i32 16, i64 %199, i64 %205, double %200, double %206, double %mul93, i32 167)
  %sub94 = fsub double %mul86, %mul93
  %208 = call i64 @computeReal(i32 14, i64 %194, i64 %207, double %mul86, double %mul93, double %sub94, i32 168)
  %imag95 = getelementptr inbounds %struct.complex, %struct.complex* %temp2, i32 0, i32 1
  %209 = bitcast double* %imag95 to i8*
  %210 = call i64 @getAddr(i8* %209)
  call void @setRealTemp(i64 %210, i64 %208)
  store double %sub94, double* %imag95, align 8
  %real96 = getelementptr inbounds %struct.complex, %struct.complex* %temp2, i32 0, i32 0
  %211 = bitcast double* %real96 to i8*
  %212 = call i64 @getAddr(i8* %211)
  %213 = load double, double* %real96, align 8
  %real97 = getelementptr inbounds %struct.complex, %struct.complex* %retval, i32 0, i32 0
  %214 = bitcast double* %real97 to i8*
  %215 = call i64 @getAddr(i8* %214)
  %216 = load double, double* %real97, align 8
  %add98 = fadd double %216, %213
  %217 = call i64 @computeReal(i32 12, i64 %215, i64 %212, double %216, double %213, double %add98, i32 175)
  %218 = bitcast double* %real97 to i8*
  %219 = call i64 @getAddr(i8* %218)
  call void @setRealTemp(i64 %219, i64 %217)
  store double %add98, double* %real97, align 8
  %imag99 = getelementptr inbounds %struct.complex, %struct.complex* %temp2, i32 0, i32 1
  %220 = bitcast double* %imag99 to i8*
  %221 = call i64 @getAddr(i8* %220)
  %222 = load double, double* %imag99, align 8
  %imag100 = getelementptr inbounds %struct.complex, %struct.complex* %retval, i32 0, i32 1
  %223 = bitcast double* %imag100 to i8*
  %224 = call i64 @getAddr(i8* %223)
  %225 = load double, double* %imag100, align 8
  %add101 = fadd double %225, %222
  %226 = call i64 @computeReal(i32 12, i64 %224, i64 %221, double %225, double %222, double %add101, i32 181)
  %227 = bitcast double* %imag100 to i8*
  %228 = call i64 @getAddr(i8* %227)
  call void @setRealTemp(i64 %228, i64 %226)
  store double %add101, double* %imag100, align 8
  %229 = bitcast %struct.complex* %retval to { double, double }*
  %230 = bitcast { double, double }* %229 to i8*
  %231 = call i64 @getAddr(i8* %230)
  %232 = load { double, double }, { double, double }* %229, align 8
  %233 = bitcast { double, double } (%struct.su3_vector*, %struct.su3_vector*)* @su3_dot to i8*
  %234 = call i64 @getAddr(i8* %233)
  call void @funcExit(i64 %234)
  %235 = bitcast { double, double } (%struct.su3_vector*, %struct.su3_vector*)* @su3_dot to i8*
  %236 = call i64 @getAddr(i8* %235)
  call void @trackReturn(i64 %236, i64 %231)
  call void @cleanComputeReal(i32 19)
  call void @cleanComputeReal(i32 30)
  call void @cleanComputeReal(i32 31)
  call void @cleanComputeReal(i32 44)
  call void @cleanComputeReal(i32 55)
  call void @cleanComputeReal(i32 56)
  call void @cleanComputeReal(i32 69)
  call void @cleanComputeReal(i32 80)
  call void @cleanComputeReal(i32 81)
  call void @cleanComputeReal(i32 94)
  call void @cleanComputeReal(i32 105)
  call void @cleanComputeReal(i32 106)
  call void @cleanComputeReal(i32 113)
  call void @cleanComputeReal(i32 119)
  call void @cleanComputeReal(i32 131)
  call void @cleanComputeReal(i32 142)
  call void @cleanComputeReal(i32 143)
  call void @cleanComputeReal(i32 156)
  call void @cleanComputeReal(i32 167)
  call void @cleanComputeReal(i32 168)
  call void @cleanComputeReal(i32 175)
  call void @cleanComputeReal(i32 181)
  ret { double, double } %232
}

declare i64 @getAddr(i8*)

declare void @funcInit(i64)

declare void @funcExit(i64)

declare void @handleAlloca(i64)

declare void @setRealTemp(i64, i64)

declare i64 @computeReal(i32, i64, i64, double, double, double, i32)

declare void @trackReturn(i64, i64)

declare void @cleanComputeReal(i32)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
