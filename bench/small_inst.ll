; ModuleID = 'small_inst.bc'
source_filename = "small.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::map" = type { %"class.std::_Rb_tree" }
%"class.std::_Rb_tree" = type { %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl" }
%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl" = type { %"struct.std::less", %"struct.std::_Rb_tree_node_base", i64 }
%"struct.std::less" = type { i8 }
%"struct.std::_Rb_tree_node_base" = type { i32, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }
%"struct.std::_Rb_tree_node" = type { %"struct.std::_Rb_tree_node_base", %"struct.__gnu_cxx::__aligned_membuf" }
%"struct.__gnu_cxx::__aligned_membuf" = type { [16 x i8] }
%"class.std::allocator" = type { i8 }
%"struct.std::pair" = type { i64, %struct.Real* }
%struct.Real = type { [1 x %struct.__mpfr_struct] }
%struct.__mpfr_struct = type { i64, i32, i64, i64* }
%"class.__gnu_cxx::new_allocator" = type { i8 }

$_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEEC2Ev = comdat any

$_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEED2Ev = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EED2Ev = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_beginEv = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EED2Ev = comdat any

$__clang_call_terminate = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_S_rightEPSt18_Rb_tree_node_base = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE7_S_leftEPSt18_Rb_tree_node_base = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE12_M_drop_nodeEPSt13_Rb_tree_nodeIS4_E = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE15_M_destroy_nodeEPSt13_Rb_tree_nodeIS4_E = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11_M_put_nodeEPSt13_Rb_tree_nodeIS4_E = comdat any

$_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEE7destroyIS5_EEvRS7_PT_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE21_M_get_Node_allocatorEv = comdat any

$_ZNSt13_Rb_tree_nodeISt4pairIKmP4RealEE9_M_valptrEv = comdat any

$_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE7destroyIS6_EEvPT_ = comdat any

$_ZN9__gnu_cxx16__aligned_membufISt4pairIKmP4RealEE6_M_ptrEv = comdat any

$_ZN9__gnu_cxx16__aligned_membufISt4pairIKmP4RealEE7_M_addrEv = comdat any

$_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEE10deallocateERS7_PS6_m = comdat any

$_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE10deallocateEPS7_m = comdat any

$_ZNSaISt13_Rb_tree_nodeISt4pairIKmP4RealEEED2Ev = comdat any

$_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEED2Ev = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EEC2Ev = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EEC2Ev = comdat any

$_ZNSaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEC2Ev = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EE13_M_initializeEv = comdat any

$_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEEC2Ev = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@shadowMap = dso_local global %"class.std::map" zeroinitializer, align 8
@.str = private unnamed_addr constant [4 x i8] c"%e\0A\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_small.cpp, i8* null }]

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3
  ret void
}

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init.1() #0 section ".text.startup" {
entry:
  call void @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEEC2Ev(%"class.std::map"* @shadowMap) #3
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::map"*)* @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEED2Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::map", %"class.std::map"* @shadowMap, i32 0, i32 0, i32 0, i32 0, i32 0), i8* @__dso_handle) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEEC2Ev(%"class.std::map"* %this) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::map"*, align 8
  store %"class.std::map"* %this, %"class.std::map"** %this.addr, align 8
  %this1 = load %"class.std::map"*, %"class.std::map"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"class.std::map", %"class.std::map"* %this1, i32 0, i32 0
  invoke void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EEC2Ev(%"class.std::_Rb_tree"* %_M_t)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  ret void

terminate.lpad:                                   ; preds = %entry
  %0 = landingpad { i8*, i32 }
          catch i8* null
  %1 = extractvalue { i8*, i32 } %0, 0
  call void @__clang_call_terminate(i8* %1) #10
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEED2Ev(%"class.std::map"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::map"*, align 8
  store %"class.std::map"* %this, %"class.std::map"** %this.addr, align 8
  %this1 = load %"class.std::map"*, %"class.std::map"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"class.std::map", %"class.std::map"* %this1, i32 0, i32 0
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EED2Ev(%"class.std::_Rb_tree"* %_M_t) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_Z5calcYPdd(double* %y, double %x) #4 {
entry:
  %y.addr = alloca double*, align 8
  %x.addr = alloca double, align 8
  %0 = bitcast double** %y.addr to i8*
  %1 = bitcast double* %y to i8*
  call void @setRealTemp(i8* %0, i8* %1)
  store double* %y, double** %y.addr, align 8
  %2 = bitcast double* %x.addr to i8*
  call void @setRealConstant_double(i8* %2, double %x)
  store double %x, double* %x.addr, align 8
  %3 = load double, double* %x.addr, align 8
  %4 = bitcast double* %x.addr to i8*
  %5 = bitcast double 1.000000e+00 to double
  %6 = call i8* @handleOp_3_double(i32 12, i8* %4, double %5)
  %add = fadd double %3, 1.000000e+00
  %7 = bitcast i8* %6 to i8*
  %8 = call i8* @handleMathFunc(i32 1, i8* %7)
  %call = call double @sqrt(double %add) #3
  %9 = load double, double* %x.addr, align 8
  %10 = bitcast double* %x.addr to i8*
  %11 = call i8* @handleMathFunc(i32 1, i8* %10)
  %call1 = call double @sqrt(double %9) #3
  %12 = bitcast i8* %8 to i8*
  %13 = bitcast i8* %11 to i8*
  %14 = call i8* @handleOp_1(i32 14, i8* %12, i8* %13)
  %sub = fsub double %call, %call1
  %15 = load double*, double** %y.addr, align 8
  %16 = bitcast double* %15 to i8*
  %17 = bitcast i8* %14 to i8*
  call void @setRealTemp(i8* %16, i8* %17)
  store double %sub, double* %15, align 8
  ret void
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main() #5 {
entry:
  %retval = alloca i32, align 4
  %x = alloca double, align 8
  %y = alloca double, align 8
  %result_A = alloca i64, align 8
  %0 = bitcast i32* %retval to i8*
  store i32 0, i32* %retval, align 4
  %1 = bitcast double* %x to i8*
  call void @setRealConstant_double(i8* %1, double 1.000000e+10)
  store double 1.000000e+10, double* %x, align 8
  %2 = bitcast double* %y to i8*
  call void @setRealConstant_double(i8* %2, double 1.000000e+00)
  store double 1.000000e+00, double* %y, align 8
  %3 = load double, double* %x, align 8
  call void @_Z5calcYPdd(double* %y, double %3)
  %4 = load double, double* %x, align 8
  call void @_Z5calcYPdd(double* %y, double %4)
  %5 = load double, double* %y, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %5)
  %6 = ptrtoint double* %y to i64
  %7 = bitcast i64* %result_A to i8*
  store i64 %6, i64* %result_A, align 8
  %8 = load i64, i64* %result_A, align 8
  %9 = load double, double* %y, align 8
  call void @_Z10printErrormd(i64 %8, double %9)
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

declare dso_local void @_Z10printErrormd(i64, double) #1

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EED2Ev(%"class.std::_Rb_tree"* %this) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %call = call %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_beginEv(%"class.std::_Rb_tree"* %this1) #3
  invoke void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree"* %this1, %"struct.std::_Rb_tree_node"* %call)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EED2Ev(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl) #3
  ret void

lpad:                                             ; preds = %entry
  %0 = landingpad { i8*, i32 }
          catch i8* null
  %1 = extractvalue { i8*, i32 } %0, 0
  store i8* %1, i8** %exn.slot, align 8
  %2 = extractvalue { i8*, i32 } %0, 1
  store i32 %2, i32* %ehselector.slot, align 4
  %_M_impl2 = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EED2Ev(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl2) #3
  br label %terminate.handler

terminate.handler:                                ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  call void @__clang_call_terminate(i8* %exn) #10
  unreachable
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree"* %this, %"struct.std::_Rb_tree_node"* %__x) #6 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  %__y = alloca %"struct.std::_Rb_tree_node"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node"* %__x, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %cmp = icmp ne %"struct.std::_Rb_tree_node"* %0, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %2 = bitcast %"struct.std::_Rb_tree_node"* %1 to %"struct.std::_Rb_tree_node_base"*
  %call = call %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_S_rightEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %2) #3
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree"* %this1, %"struct.std::_Rb_tree_node"* %call)
  %3 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %4 = bitcast %"struct.std::_Rb_tree_node"* %3 to %"struct.std::_Rb_tree_node_base"*
  %call2 = call %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE7_S_leftEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %4) #3
  store %"struct.std::_Rb_tree_node"* %call2, %"struct.std::_Rb_tree_node"** %__y, align 8
  %5 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE12_M_drop_nodeEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree"* %this1, %"struct.std::_Rb_tree_node"* %5) #3
  %6 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__y, align 8
  store %"struct.std::_Rb_tree_node"* %6, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_beginEv(%"class.std::_Rb_tree"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 1
  %_M_parent = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %_M_header, i32 0, i32 1
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_parent, align 8
  %1 = bitcast %"struct.std::_Rb_tree_node_base"* %0 to %"struct.std::_Rb_tree_node"*
  ret %"struct.std::_Rb_tree_node"* %1
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EED2Ev(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"*, align 8
  store %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"*, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"** %this.addr, align 8
  %0 = bitcast %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this1 to %"class.std::allocator"*
  call void @_ZNSaISt13_Rb_tree_nodeISt4pairIKmP4RealEEED2Ev(%"class.std::allocator"* %0) #3
  ret void
}

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #7 comdat {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #3
  call void @_ZSt9terminatev() #10
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_S_rightEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x) #4 comdat align 2 {
entry:
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  store %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %_M_right = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %0, i32 0, i32 3
  %1 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_right, align 8
  %2 = bitcast %"struct.std::_Rb_tree_node_base"* %1 to %"struct.std::_Rb_tree_node"*
  ret %"struct.std::_Rb_tree_node"* %2
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE7_S_leftEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x) #4 comdat align 2 {
entry:
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  store %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %_M_left = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %0, i32 0, i32 2
  %1 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_left, align 8
  %2 = bitcast %"struct.std::_Rb_tree_node_base"* %1 to %"struct.std::_Rb_tree_node"*
  ret %"struct.std::_Rb_tree_node"* %2
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE12_M_drop_nodeEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree"* %this, %"struct.std::_Rb_tree_node"* %__p) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %__p.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node"* %__p, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE15_M_destroy_nodeEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree"* %this1, %"struct.std::_Rb_tree_node"* %0) #3
  %1 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11_M_put_nodeEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree"* %this1, %"struct.std::_Rb_tree_node"* %1) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE15_M_destroy_nodeEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree"* %this, %"struct.std::_Rb_tree_node"* %__p) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %__p.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node"* %__p, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %call = call dereferenceable(1) %"class.std::allocator"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE21_M_get_Node_allocatorEv(%"class.std::_Rb_tree"* %this1) #3
  %0 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  %call2 = invoke %"struct.std::pair"* @_ZNSt13_Rb_tree_nodeISt4pairIKmP4RealEE9_M_valptrEv(%"struct.std::_Rb_tree_node"* %0)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  invoke void @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEE7destroyIS5_EEvRS7_PT_(%"class.std::allocator"* dereferenceable(1) %call, %"struct.std::pair"* %call2)
          to label %invoke.cont3 unwind label %terminate.lpad

invoke.cont3:                                     ; preds = %invoke.cont
  %1 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  ret void

terminate.lpad:                                   ; preds = %invoke.cont, %entry
  %2 = landingpad { i8*, i32 }
          catch i8* null
  %3 = extractvalue { i8*, i32 } %2, 0
  call void @__clang_call_terminate(i8* %3) #10
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11_M_put_nodeEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree"* %this, %"struct.std::_Rb_tree_node"* %__p) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %__p.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node"* %__p, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %call = call dereferenceable(1) %"class.std::allocator"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE21_M_get_Node_allocatorEv(%"class.std::_Rb_tree"* %this1) #3
  %0 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  invoke void @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEE10deallocateERS7_PS6_m(%"class.std::allocator"* dereferenceable(1) %call, %"struct.std::_Rb_tree_node"* %0, i64 1)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  ret void

terminate.lpad:                                   ; preds = %entry
  %1 = landingpad { i8*, i32 }
          catch i8* null
  %2 = extractvalue { i8*, i32 } %1, 0
  call void @__clang_call_terminate(i8* %2) #10
  unreachable
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEE7destroyIS5_EEvRS7_PT_(%"class.std::allocator"* dereferenceable(1) %__a, %"struct.std::pair"* %__p) #6 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator"*, align 8
  %__p.addr = alloca %"struct.std::pair"*, align 8
  store %"class.std::allocator"* %__a, %"class.std::allocator"** %__a.addr, align 8
  store %"struct.std::pair"* %__p, %"struct.std::pair"** %__p.addr, align 8
  %0 = load %"class.std::allocator"*, %"class.std::allocator"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator"* %0 to %"class.__gnu_cxx::new_allocator"*
  %2 = load %"struct.std::pair"*, %"struct.std::pair"** %__p.addr, align 8
  call void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE7destroyIS6_EEvPT_(%"class.__gnu_cxx::new_allocator"* %1, %"struct.std::pair"* %2)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(1) %"class.std::allocator"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE21_M_get_Node_allocatorEv(%"class.std::_Rb_tree"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %0 = bitcast %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl to %"class.std::allocator"*
  ret %"class.std::allocator"* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::pair"* @_ZNSt13_Rb_tree_nodeISt4pairIKmP4RealEE9_M_valptrEv(%"struct.std::_Rb_tree_node"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  store %"struct.std::_Rb_tree_node"* %this, %"struct.std::_Rb_tree_node"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %this.addr, align 8
  %_M_storage = getelementptr inbounds %"struct.std::_Rb_tree_node", %"struct.std::_Rb_tree_node"* %this1, i32 0, i32 1
  %call = call %"struct.std::pair"* @_ZN9__gnu_cxx16__aligned_membufISt4pairIKmP4RealEE6_M_ptrEv(%"struct.__gnu_cxx::__aligned_membuf"* %_M_storage) #3
  ret %"struct.std::pair"* %call
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE7destroyIS6_EEvPT_(%"class.__gnu_cxx::new_allocator"* %this, %"struct.std::pair"* %__p) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %__p.addr = alloca %"struct.std::pair"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  store %"struct.std::pair"* %__p, %"struct.std::pair"** %__p.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %0 = load %"struct.std::pair"*, %"struct.std::pair"** %__p.addr, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::pair"* @_ZN9__gnu_cxx16__aligned_membufISt4pairIKmP4RealEE6_M_ptrEv(%"struct.__gnu_cxx::__aligned_membuf"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.__gnu_cxx::__aligned_membuf"*, align 8
  store %"struct.__gnu_cxx::__aligned_membuf"* %this, %"struct.__gnu_cxx::__aligned_membuf"** %this.addr, align 8
  %this1 = load %"struct.__gnu_cxx::__aligned_membuf"*, %"struct.__gnu_cxx::__aligned_membuf"** %this.addr, align 8
  %call = call i8* @_ZN9__gnu_cxx16__aligned_membufISt4pairIKmP4RealEE7_M_addrEv(%"struct.__gnu_cxx::__aligned_membuf"* %this1) #3
  %0 = bitcast i8* %call to %"struct.std::pair"*
  ret %"struct.std::pair"* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i8* @_ZN9__gnu_cxx16__aligned_membufISt4pairIKmP4RealEE7_M_addrEv(%"struct.__gnu_cxx::__aligned_membuf"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.__gnu_cxx::__aligned_membuf"*, align 8
  store %"struct.__gnu_cxx::__aligned_membuf"* %this, %"struct.__gnu_cxx::__aligned_membuf"** %this.addr, align 8
  %this1 = load %"struct.__gnu_cxx::__aligned_membuf"*, %"struct.__gnu_cxx::__aligned_membuf"** %this.addr, align 8
  %_M_storage = getelementptr inbounds %"struct.__gnu_cxx::__aligned_membuf", %"struct.__gnu_cxx::__aligned_membuf"* %this1, i32 0, i32 0
  %0 = bitcast [16 x i8]* %_M_storage to i8*
  ret i8* %0
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEE10deallocateERS7_PS6_m(%"class.std::allocator"* dereferenceable(1) %__a, %"struct.std::_Rb_tree_node"* %__p, i64 %__n) #6 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator"*, align 8
  %__p.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::allocator"* %__a, %"class.std::allocator"** %__a.addr, align 8
  store %"struct.std::_Rb_tree_node"* %__p, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %0 = load %"class.std::allocator"*, %"class.std::allocator"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator"* %0 to %"class.__gnu_cxx::new_allocator"*
  %2 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  %3 = load i64, i64* %__n.addr, align 8
  call void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE10deallocateEPS7_m(%"class.__gnu_cxx::new_allocator"* %1, %"struct.std::_Rb_tree_node"* %2, i64 %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE10deallocateEPS7_m(%"class.__gnu_cxx::new_allocator"* %this, %"struct.std::_Rb_tree_node"* %__p, i64) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %__p.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  %.addr = alloca i64, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node"* %__p, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  store i64 %0, i64* %.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %1 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  %2 = bitcast %"struct.std::_Rb_tree_node"* %1 to i8*
  call void @_ZdlPv(i8* %2) #3
  ret void
}

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(i8*) #8

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSaISt13_Rb_tree_nodeISt4pairIKmP4RealEEED2Ev(%"class.std::allocator"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %this, %"class.std::allocator"** %this.addr, align 8
  %this1 = load %"class.std::allocator"*, %"class.std::allocator"** %this.addr, align 8
  %0 = bitcast %"class.std::allocator"* %this1 to %"class.__gnu_cxx::new_allocator"*
  call void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEED2Ev(%"class.__gnu_cxx::new_allocator"* %0) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEED2Ev(%"class.__gnu_cxx::new_allocator"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EEC2Ev(%"class.std::_Rb_tree"* %this) unnamed_addr #6 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EEC2Ev(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EEC2Ev(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this) unnamed_addr #6 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"*, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"** %this.addr, align 8
  %0 = bitcast %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this1 to %"class.std::allocator"*
  call void @_ZNSaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEC2Ev(%"class.std::allocator"* %0) #3
  %_M_key_compare = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this1, i32 0, i32 1
  %1 = bitcast %"struct.std::_Rb_tree_node_base"* %_M_header to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1, i8 0, i64 32, i1 false)
  %_M_node_count = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this1, i32 0, i32 2
  store i64 0, i64* %_M_node_count, align 8
  invoke void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EE13_M_initializeEv(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this1)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  ret void

lpad:                                             ; preds = %entry
  %2 = landingpad { i8*, i32 }
          cleanup
  %3 = extractvalue { i8*, i32 } %2, 0
  store i8* %3, i8** %exn.slot, align 8
  %4 = extractvalue { i8*, i32 } %2, 1
  store i32 %4, i32* %ehselector.slot, align 4
  %5 = bitcast %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this1 to %"class.std::allocator"*
  call void @_ZNSaISt13_Rb_tree_nodeISt4pairIKmP4RealEEED2Ev(%"class.std::allocator"* %5) #3
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0
  %lpad.val2 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val2
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEC2Ev(%"class.std::allocator"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %this, %"class.std::allocator"** %this.addr, align 8
  %this1 = load %"class.std::allocator"*, %"class.std::allocator"** %this.addr, align 8
  %0 = bitcast %"class.std::allocator"* %this1 to %"class.__gnu_cxx::new_allocator"*
  call void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEEC2Ev(%"class.__gnu_cxx::new_allocator"* %0) #3
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #9

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EE13_M_initializeEv(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"*, align 8
  store %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"*, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"** %this.addr, align 8
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this1, i32 0, i32 1
  %_M_color = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %_M_header, i32 0, i32 0
  store i32 0, i32* %_M_color, align 8
  %_M_header2 = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this1, i32 0, i32 1
  %_M_parent = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %_M_header2, i32 0, i32 1
  store %"struct.std::_Rb_tree_node_base"* null, %"struct.std::_Rb_tree_node_base"** %_M_parent, align 8
  %_M_header3 = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this1, i32 0, i32 1
  %_M_header4 = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this1, i32 0, i32 1
  %_M_left = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %_M_header4, i32 0, i32 2
  store %"struct.std::_Rb_tree_node_base"* %_M_header3, %"struct.std::_Rb_tree_node_base"** %_M_left, align 8
  %_M_header5 = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this1, i32 0, i32 1
  %_M_header6 = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this1, i32 0, i32 1
  %_M_right = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %_M_header6, i32 0, i32 3
  store %"struct.std::_Rb_tree_node_base"* %_M_header5, %"struct.std::_Rb_tree_node_base"** %_M_right, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEEC2Ev(%"class.__gnu_cxx::new_allocator"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  ret void
}

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_small.cpp() #0 section ".text.startup" {
entry:
  call void @__cxx_global_var_init()
  call void @__cxx_global_var_init.1()
  ret void
}

declare void @setRealTemp(i8*, i8*)

declare void @setRealConstant_double(i8*, double)

declare i8* @handleOp_3_double(i32, i8*, double)

declare i8* @handleMathFunc(i32, i8*)

declare i8* @handleOp_1(i32, i8*, i8*)

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline noreturn nounwind }
attributes #8 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { argmemonly nounwind }
attributes #10 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 324638) (llvm/trunk 324636)"}
