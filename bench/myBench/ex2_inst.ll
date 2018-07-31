; ModuleID = 'ex2_inst.bc'
source_filename = "ex2.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::map" = type { %"class.std::_Rb_tree" }
%"class.std::_Rb_tree" = type { %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl" }
%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl" = type { %"struct.std::less", %"struct.std::_Rb_tree_node_base", i64 }
%"struct.std::less" = type { i8 }
%"struct.std::_Rb_tree_node_base" = type { i32, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }
%"class.std::map.0" = type { %"class.std::_Rb_tree.1" }
%"class.std::_Rb_tree.1" = type { %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl" }
%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl" = type { %"struct.std::less", %"struct.std::_Rb_tree_node_base", i64 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Real = type { [1 x %struct.__mpfr_struct] }
%struct.__mpfr_struct = type { i64, i32, i64, i64* }
%"struct.std::_Rb_tree_const_iterator" = type { %"struct.std::_Rb_tree_node_base"* }
%"struct.std::_Rb_tree_iterator" = type { %"struct.std::_Rb_tree_node_base"* }
%"struct.std::pair.13" = type { i64, %struct.Real* }
%"struct.std::pair.5" = type { i64, %struct.Real* }
%"struct.std::pair" = type <{ %"struct.std::_Rb_tree_iterator", i8, [7 x i8] }>
%"struct.std::pair.9" = type { i64, i64 }
%"struct.std::pair.6" = type <{ %"struct.std::_Rb_tree_iterator.7", i8, [7 x i8] }>
%"struct.std::_Rb_tree_iterator.7" = type { %"struct.std::_Rb_tree_node_base"* }
%"struct.std::_Rb_tree_const_iterator.17" = type { %"struct.std::_Rb_tree_node_base"* }
%"struct.std::pair.10" = type { i64, i64 }
%"struct.std::_Rb_tree_node" = type { %"struct.std::_Rb_tree_node_base", %"struct.__gnu_cxx::__aligned_membuf" }
%"struct.__gnu_cxx::__aligned_membuf" = type { [16 x i8] }
%"class.std::allocator" = type { i8 }
%"class.__gnu_cxx::new_allocator" = type { i8 }
%"struct.std::_Rb_tree_node.11" = type { %"struct.std::_Rb_tree_node_base", %"struct.__gnu_cxx::__aligned_membuf.12" }
%"struct.__gnu_cxx::__aligned_membuf.12" = type { [16 x i8] }
%"class.std::allocator.2" = type { i8 }
%"class.__gnu_cxx::new_allocator.3" = type { i8 }
%"struct.std::_Select1st" = type { i8 }
%"struct.std::pair.14" = type { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }
%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node" = type { %"class.std::_Rb_tree.1"* }
%"struct.std::_Select1st.15" = type { i8 }
%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node" = type { %"class.std::_Rb_tree"* }

$_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEEC2Ev = comdat any

$_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEED2Ev = comdat any

$_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEEC2Ev = comdat any

$_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEED2Ev = comdat any

$_ZNKSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE5countERS5_ = comdat any

$_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE2atERS5_ = comdat any

$_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE6insertIS4_ImS1_EvEES4_ISt17_Rb_tree_iteratorIS6_EbEOT_ = comdat any

$_ZNSt4pairImP4RealEC2IRmRS1_Lb1EEEOT_OT0_ = comdat any

$_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEE6insertIS2_ImmEvEES2_ISt17_Rb_tree_iteratorIS4_EbEOT_ = comdat any

$_ZNSt4pairImmEC2IRmS2_Lb1EEEOT_OT0_ = comdat any

$_ZNKSt3mapImmSt4lessImESaISt4pairIKmmEEE5countERS3_ = comdat any

$_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEE2atERS3_ = comdat any

$_ZSt4log2ImEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EED2Ev = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_M_beginEv = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE13_Rb_tree_implIS6_Lb1EED2Ev = comdat any

$__clang_call_terminate = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_S_rightEPSt18_Rb_tree_node_base = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE7_S_leftEPSt18_Rb_tree_node_base = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE12_M_drop_nodeEPSt13_Rb_tree_nodeIS2_E = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE15_M_destroy_nodeEPSt13_Rb_tree_nodeIS2_E = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE11_M_put_nodeEPSt13_Rb_tree_nodeIS2_E = comdat any

$_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmmEEEE7destroyIS3_EEvRS5_PT_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE21_M_get_Node_allocatorEv = comdat any

$_ZNSt13_Rb_tree_nodeISt4pairIKmmEE9_M_valptrEv = comdat any

$_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEE7destroyIS4_EEvPT_ = comdat any

$_ZN9__gnu_cxx16__aligned_membufISt4pairIKmmEE6_M_ptrEv = comdat any

$_ZN9__gnu_cxx16__aligned_membufISt4pairIKmmEE7_M_addrEv = comdat any

$_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmmEEEE10deallocateERS5_PS4_m = comdat any

$_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEE10deallocateEPS5_m = comdat any

$_ZNSaISt13_Rb_tree_nodeISt4pairIKmmEEED2Ev = comdat any

$_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEED2Ev = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EED2Ev = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_beginEv = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EED2Ev = comdat any

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

$_ZSt7forwardIRmEOT_RNSt16remove_referenceIS1_E4typeE = comdat any

$_ZSt7forwardIRP4RealEOT_RNSt16remove_referenceIS3_E4typeE = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EEC2Ev = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE13_Rb_tree_implIS6_Lb1EEC2Ev = comdat any

$_ZNSaISt13_Rb_tree_nodeISt4pairIKmmEEEC2Ev = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE13_Rb_tree_implIS6_Lb1EE13_M_initializeEv = comdat any

$_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEEC2Ev = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EEC2Ev = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EEC2Ev = comdat any

$_ZNSaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEC2Ev = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EE13_M_initializeEv = comdat any

$_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEEC2Ev = comdat any

$_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE4findERS1_ = comdat any

$_ZNKSt23_Rb_tree_const_iteratorISt4pairIKmP4RealEEeqERKS5_ = comdat any

$_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE3endEv = comdat any

$_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE14_M_lower_boundEPKSt13_Rb_tree_nodeIS4_EPKSt18_Rb_tree_node_baseRS1_ = comdat any

$_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_beginEv = comdat any

$_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_M_endEv = comdat any

$_ZNKSt4lessImEclERKmS2_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_S_keyEPKSt18_Rb_tree_node_base = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_S_keyEPKSt13_Rb_tree_nodeIS4_E = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE7_S_leftEPKSt18_Rb_tree_node_base = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_S_rightEPKSt18_Rb_tree_node_base = comdat any

$_ZNSt23_Rb_tree_const_iteratorISt4pairIKmP4RealEEC2EPKSt18_Rb_tree_node_base = comdat any

$_ZNKSt10_Select1stISt4pairIKmP4RealEEclERKS4_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_S_valueEPKSt13_Rb_tree_nodeIS4_E = comdat any

$_ZNKSt13_Rb_tree_nodeISt4pairIKmP4RealEE9_M_valptrEv = comdat any

$_ZNK9__gnu_cxx16__aligned_membufISt4pairIKmP4RealEE6_M_ptrEv = comdat any

$_ZNK9__gnu_cxx16__aligned_membufISt4pairIKmP4RealEE7_M_addrEv = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_S_valueEPKSt18_Rb_tree_node_base = comdat any

$_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE11lower_boundERS5_ = comdat any

$_ZNKSt17_Rb_tree_iteratorISt4pairIKmP4RealEEeqERKS5_ = comdat any

$_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE3endEv = comdat any

$_ZNKSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE8key_compEv = comdat any

$_ZNKSt17_Rb_tree_iteratorISt4pairIKmP4RealEEdeEv = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11lower_boundERS1_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE14_M_lower_boundEPSt13_Rb_tree_nodeIS4_EPSt18_Rb_tree_node_baseRS1_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_M_endEv = comdat any

$_ZNSt17_Rb_tree_iteratorISt4pairIKmP4RealEEC2EPSt18_Rb_tree_node_base = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE3endEv = comdat any

$_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8key_compEv = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE16_M_insert_uniqueIS0_ImS3_EEES0_ISt17_Rb_tree_iteratorIS4_EbEOT_ = comdat any

$_ZSt7forwardISt4pairImP4RealEEOT_RNSt16remove_referenceIS4_E4typeE = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE24_M_get_insert_unique_posERS1_ = comdat any

$_ZNKSt10_Select1stISt4pairIKmP4RealEEclIS0_ImS3_EEERNT_10first_typeERS8_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11_Alloc_nodeC2ERSA_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE10_M_insert_IS0_ImS3_ENSA_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS4_EPSt18_Rb_tree_node_baseSH_OT_RT0_ = comdat any

$_ZNSt4pairISt17_Rb_tree_iteratorIS_IKmP4RealEEbEC2IS5_bLb1EEEOT_OT0_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE5beginEv = comdat any

$_ZNSt4pairIPSt18_Rb_tree_node_baseS1_EC2IRPSt13_Rb_tree_nodeIS_IKmP4RealEERS1_Lb1EEEOT_OT0_ = comdat any

$_ZNSt17_Rb_tree_iteratorISt4pairIKmP4RealEEmmEv = comdat any

$_ZNSt4pairIPSt18_Rb_tree_node_baseS1_EC2IRS1_Lb1EEEOT_RKS1_ = comdat any

$_ZSt7forwardIRPSt13_Rb_tree_nodeISt4pairIKmP4RealEEEOT_RNSt16remove_referenceIS9_E4typeE = comdat any

$_ZSt7forwardIRPSt18_Rb_tree_node_baseEOT_RNSt16remove_referenceIS3_E4typeE = comdat any

$_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11_Alloc_nodeclIS0_ImS3_EEEPSt13_Rb_tree_nodeIS4_EOT_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE14_M_create_nodeIJS0_ImS3_EEEEPSt13_Rb_tree_nodeIS4_EDpOT_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11_M_get_nodeEv = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE17_M_construct_nodeIJS0_ImS3_EEEEvPSt13_Rb_tree_nodeIS4_EDpOT_ = comdat any

$_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEE8allocateERS7_m = comdat any

$_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE8allocateEmPKv = comdat any

$_ZNK9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE8max_sizeEv = comdat any

$_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEE9constructIS5_JS1_ImS4_EEEEvRS7_PT_DpOT0_ = comdat any

$_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE9constructIS6_JS2_ImS5_EEEEvPT_DpOT0_ = comdat any

$_ZNSt4pairIKmP4RealEC2ImS2_Lb1EEEOS_IT_T0_E = comdat any

$_ZSt7forwardImEOT_RNSt16remove_referenceIS0_E4typeE = comdat any

$_ZSt7forwardIP4RealEOT_RNSt16remove_referenceIS2_E4typeE = comdat any

$_ZSt7forwardISt17_Rb_tree_iteratorISt4pairIKmP4RealEEEOT_RNSt16remove_referenceIS7_E4typeE = comdat any

$_ZSt7forwardIbEOT_RNSt16remove_referenceIS0_E4typeE = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE16_M_insert_uniqueIS0_ImmEEES0_ISt17_Rb_tree_iteratorIS2_EbEOT_ = comdat any

$_ZSt7forwardISt4pairImmEEOT_RNSt16remove_referenceIS2_E4typeE = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE24_M_get_insert_unique_posERS1_ = comdat any

$_ZNKSt10_Select1stISt4pairIKmmEEclIS0_ImmEEERNT_10first_typeERS6_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE11_Alloc_nodeC2ERS8_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE10_M_insert_IS0_ImmENS8_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS2_EPSt18_Rb_tree_node_baseSF_OT_RT0_ = comdat any

$_ZNSt4pairISt17_Rb_tree_iteratorIS_IKmmEEbEC2IS3_bLb1EEEOT_OT0_ = comdat any

$_ZNSt17_Rb_tree_iteratorISt4pairIKmmEEC2EPSt18_Rb_tree_node_base = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_M_endEv = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_S_keyEPKSt13_Rb_tree_nodeIS2_E = comdat any

$_ZNKSt17_Rb_tree_iteratorISt4pairIKmmEEeqERKS3_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE5beginEv = comdat any

$_ZNSt4pairIPSt18_Rb_tree_node_baseS1_EC2IRPSt13_Rb_tree_nodeIS_IKmmEERS1_Lb1EEEOT_OT0_ = comdat any

$_ZNSt17_Rb_tree_iteratorISt4pairIKmmEEmmEv = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_S_keyEPKSt18_Rb_tree_node_base = comdat any

$_ZNKSt10_Select1stISt4pairIKmmEEclERKS2_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_S_valueEPKSt13_Rb_tree_nodeIS2_E = comdat any

$_ZNKSt13_Rb_tree_nodeISt4pairIKmmEE9_M_valptrEv = comdat any

$_ZNK9__gnu_cxx16__aligned_membufISt4pairIKmmEE6_M_ptrEv = comdat any

$_ZNK9__gnu_cxx16__aligned_membufISt4pairIKmmEE7_M_addrEv = comdat any

$_ZSt7forwardIRPSt13_Rb_tree_nodeISt4pairIKmmEEEOT_RNSt16remove_referenceIS7_E4typeE = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_S_valueEPKSt18_Rb_tree_node_base = comdat any

$_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE11_Alloc_nodeclIS0_ImmEEEPSt13_Rb_tree_nodeIS2_EOT_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE14_M_create_nodeIJS0_ImmEEEEPSt13_Rb_tree_nodeIS2_EDpOT_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE11_M_get_nodeEv = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE17_M_construct_nodeIJS0_ImmEEEEvPSt13_Rb_tree_nodeIS2_EDpOT_ = comdat any

$_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmmEEEE8allocateERS5_m = comdat any

$_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEE8allocateEmPKv = comdat any

$_ZNK9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEE8max_sizeEv = comdat any

$_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmmEEEE9constructIS3_JS1_ImmEEEEvRS5_PT_DpOT0_ = comdat any

$_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEE9constructIS4_JS2_ImmEEEEvPT_DpOT0_ = comdat any

$_ZNSt4pairIKmmEC2ImmLb1EEEOS_IT_T0_E = comdat any

$_ZSt7forwardISt17_Rb_tree_iteratorISt4pairIKmmEEEOT_RNSt16remove_referenceIS5_E4typeE = comdat any

$_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE4findERS1_ = comdat any

$_ZNKSt23_Rb_tree_const_iteratorISt4pairIKmmEEeqERKS3_ = comdat any

$_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE3endEv = comdat any

$_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE14_M_lower_boundEPKSt13_Rb_tree_nodeIS2_EPKSt18_Rb_tree_node_baseRS1_ = comdat any

$_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_M_beginEv = comdat any

$_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_M_endEv = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE7_S_leftEPKSt18_Rb_tree_node_base = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_S_rightEPKSt18_Rb_tree_node_base = comdat any

$_ZNSt23_Rb_tree_const_iteratorISt4pairIKmmEEC2EPKSt18_Rb_tree_node_base = comdat any

$_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEE11lower_boundERS3_ = comdat any

$_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEE3endEv = comdat any

$_ZNKSt3mapImmSt4lessImESaISt4pairIKmmEEE8key_compEv = comdat any

$_ZNKSt17_Rb_tree_iteratorISt4pairIKmmEEdeEv = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE11lower_boundERS1_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE14_M_lower_boundEPSt13_Rb_tree_nodeIS2_EPSt18_Rb_tree_node_baseRS1_ = comdat any

$_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE3endEv = comdat any

$_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8key_compEv = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@shadowFunArgMap = dso_local global %"class.std::map" zeroinitializer, align 8
@shadowMap = dso_local global %"class.std::map.0" zeroinitializer, align 8
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"addFunArg: updated\0A\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"setRealFunArg: fun arg updated\0A\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"Addr:\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"value:\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%c.%se%ld\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"+nan.0\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"+inf.0\00", align 1
@.str.10 = private unnamed_addr constant [7 x i8] c"-inf.0\00", align 1
@.str.11 = private unnamed_addr constant [7 x i8] c"%fe-%d\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"%fe%d\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.14 = private unnamed_addr constant [32 x i8] c"The rounded shadow value is NaN\00", align 1
@.str.15 = private unnamed_addr constant [29 x i8] c"The rounded shadow value is \00", align 1
@.str.16 = private unnamed_addr constant [25 x i8] c", but NaN was computed.\0A\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c", but \00", align 1
@.str.18 = private unnamed_addr constant [16 x i8] c" was computed.\0A\00", align 1
@.str.19 = private unnamed_addr constant [27 x i8] c"%f bits error (%llu ulps)\0A\00", align 1
@.str.20 = private unnamed_addr constant [20 x i8] c"Result using mpfr:\0A\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8
@.str.21 = private unnamed_addr constant [11 x i8] c"ulpsError:\00", align 1
@.str.22 = private unnamed_addr constant [11 x i8] c"func: :%e\0A\00", align 1
@.str.23 = private unnamed_addr constant [11 x i8] c"main: :%e\0A\00", align 1
@.str.24 = private unnamed_addr constant [8 x i8] c"map::at\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_ex2.cpp, i8* null }]

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
  call void @_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEEC2Ev(%"class.std::map"* @shadowFunArgMap) #3
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::map"*)* @_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEED2Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::map", %"class.std::map"* @shadowFunArgMap, i32 0, i32 0, i32 0, i32 0, i32 0), i8* @__dso_handle) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEEC2Ev(%"class.std::map"* %this) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::map"*, align 8
  store %"class.std::map"* %this, %"class.std::map"** %this.addr, align 8
  %this1 = load %"class.std::map"*, %"class.std::map"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"class.std::map", %"class.std::map"* %this1, i32 0, i32 0
  invoke void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EEC2Ev(%"class.std::_Rb_tree"* %_M_t)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  ret void

terminate.lpad:                                   ; preds = %entry
  %0 = landingpad { i8*, i32 }
          catch i8* null
  %1 = extractvalue { i8*, i32 } %0, 0
  call void @__clang_call_terminate(i8* %1) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEED2Ev(%"class.std::map"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::map"*, align 8
  store %"class.std::map"* %this, %"class.std::map"** %this.addr, align 8
  %this1 = load %"class.std::map"*, %"class.std::map"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"class.std::map", %"class.std::map"* %this1, i32 0, i32 0
  call void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EED2Ev(%"class.std::_Rb_tree"* %_M_t) #3
  ret void
}

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init.2() #0 section ".text.startup" {
entry:
  call void @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEEC2Ev(%"class.std::map.0"* @shadowMap) #3
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::map.0"*)* @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEED2Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::map.0", %"class.std::map.0"* @shadowMap, i32 0, i32 0, i32 0, i32 0, i32 0), i8* @__dso_handle) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEEC2Ev(%"class.std::map.0"* %this) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::map.0"*, align 8
  store %"class.std::map.0"* %this, %"class.std::map.0"** %this.addr, align 8
  %this1 = load %"class.std::map.0"*, %"class.std::map.0"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"class.std::map.0", %"class.std::map.0"* %this1, i32 0, i32 0
  invoke void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EEC2Ev(%"class.std::_Rb_tree.1"* %_M_t)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  ret void

terminate.lpad:                                   ; preds = %entry
  %0 = landingpad { i8*, i32 }
          catch i8* null
  %1 = extractvalue { i8*, i32 } %0, 0
  call void @__clang_call_terminate(i8* %1) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEED2Ev(%"class.std::map.0"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::map.0"*, align 8
  store %"class.std::map.0"* %this, %"class.std::map.0"** %this.addr, align 8
  %this1 = load %"class.std::map.0"*, %"class.std::map.0"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"class.std::map.0", %"class.std::map.0"* %this1, i32 0, i32 0
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EED2Ev(%"class.std::_Rb_tree.1"* %_M_t) #3
  ret void
}

; Function Attrs: noinline optnone uwtable
define dso_local %struct.Real* @getReal(i8* %Addr) #5 {
entry:
  %retval = alloca %struct.Real*, align 8
  %Addr.addr = alloca i8*, align 8
  %AddrInt = alloca i64, align 8
  %real = alloca %struct.Real*, align 8
  store i8* %Addr, i8** %Addr.addr, align 8
  %0 = load i8*, i8** %Addr.addr, align 8
  %1 = ptrtoint i8* %0 to i64
  store i64 %1, i64* %AddrInt, align 8
  %call = call i64 @_ZNKSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE5countERS5_(%"class.std::map.0"* @shadowMap, i64* dereferenceable(8) %AddrInt)
  %cmp = icmp ne i64 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call dereferenceable(8) %struct.Real** @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE2atERS5_(%"class.std::map.0"* @shadowMap, i64* dereferenceable(8) %AddrInt)
  %2 = load %struct.Real*, %struct.Real** %call1, align 8
  store %struct.Real* %2, %struct.Real** %real, align 8
  %3 = load %struct.Real*, %struct.Real** %real, align 8
  store %struct.Real* %3, %struct.Real** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  store %struct.Real* null, %struct.Real** %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load %struct.Real*, %struct.Real** %retval, align 8
  ret %struct.Real* %4
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNKSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE5countERS5_(%"class.std::map.0"* %this, i64* dereferenceable(8) %__x) #5 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::map.0"*, align 8
  %__x.addr = alloca i64*, align 8
  %coerce = alloca %"struct.std::_Rb_tree_const_iterator", align 8
  %ref.tmp = alloca %"struct.std::_Rb_tree_const_iterator", align 8
  store %"class.std::map.0"* %this, %"class.std::map.0"** %this.addr, align 8
  store i64* %__x, i64** %__x.addr, align 8
  %this1 = load %"class.std::map.0"*, %"class.std::map.0"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"class.std::map.0", %"class.std::map.0"* %this1, i32 0, i32 0
  %0 = load i64*, i64** %__x.addr, align 8
  %call = call %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE4findERS1_(%"class.std::_Rb_tree.1"* %_M_t, i64* dereferenceable(8) %0)
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator", %"struct.std::_Rb_tree_const_iterator"* %coerce, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  %_M_t2 = getelementptr inbounds %"class.std::map.0", %"class.std::map.0"* %this1, i32 0, i32 0
  %call3 = call %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE3endEv(%"class.std::_Rb_tree.1"* %_M_t2) #3
  %coerce.dive4 = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator", %"struct.std::_Rb_tree_const_iterator"* %ref.tmp, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call3, %"struct.std::_Rb_tree_node_base"** %coerce.dive4, align 8
  %call5 = call zeroext i1 @_ZNKSt23_Rb_tree_const_iteratorISt4pairIKmP4RealEEeqERKS5_(%"struct.std::_Rb_tree_const_iterator"* %coerce, %"struct.std::_Rb_tree_const_iterator"* dereferenceable(8) %ref.tmp) #3
  %1 = zext i1 %call5 to i64
  %cond = select i1 %call5, i32 0, i32 1
  %conv = sext i32 %cond to i64
  ret i64 %conv
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(8) %struct.Real** @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE2atERS5_(%"class.std::map.0"* %this, i64* dereferenceable(8) %__k) #5 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::map.0"*, align 8
  %__k.addr = alloca i64*, align 8
  %__i = alloca %"struct.std::_Rb_tree_iterator", align 8
  %ref.tmp = alloca %"struct.std::_Rb_tree_iterator", align 8
  %undef.agg.tmp = alloca %"struct.std::less", align 1
  store %"class.std::map.0"* %this, %"class.std::map.0"** %this.addr, align 8
  store i64* %__k, i64** %__k.addr, align 8
  %this1 = load %"class.std::map.0"*, %"class.std::map.0"** %this.addr, align 8
  %0 = load i64*, i64** %__k.addr, align 8
  %call = call %"struct.std::_Rb_tree_node_base"* @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE11lower_boundERS5_(%"class.std::map.0"* %this1, i64* dereferenceable(8) %0)
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %__i, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  %call2 = call %"struct.std::_Rb_tree_node_base"* @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE3endEv(%"class.std::map.0"* %this1) #3
  %coerce.dive3 = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %ref.tmp, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call2, %"struct.std::_Rb_tree_node_base"** %coerce.dive3, align 8
  %call4 = call zeroext i1 @_ZNKSt17_Rb_tree_iteratorISt4pairIKmP4RealEEeqERKS5_(%"struct.std::_Rb_tree_iterator"* %__i, %"struct.std::_Rb_tree_iterator"* dereferenceable(8) %ref.tmp) #3
  br i1 %call4, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  call void @_ZNKSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE8key_compEv(%"class.std::map.0"* %this1)
  %1 = load i64*, i64** %__k.addr, align 8
  %call5 = call dereferenceable(16) %"struct.std::pair.13"* @_ZNKSt17_Rb_tree_iteratorISt4pairIKmP4RealEEdeEv(%"struct.std::_Rb_tree_iterator"* %__i) #3
  %first = getelementptr inbounds %"struct.std::pair.13", %"struct.std::pair.13"* %call5, i32 0, i32 0
  %call6 = call zeroext i1 @_ZNKSt4lessImEclERKmS2_(%"struct.std::less"* %undef.agg.tmp, i64* dereferenceable(8) %1, i64* dereferenceable(8) %first)
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %2 = phi i1 [ true, %entry ], [ %call6, %lor.rhs ]
  br i1 %2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.end
  call void @_ZSt20__throw_out_of_rangePKc(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0)) #14
  unreachable

if.end:                                           ; preds = %lor.end
  %call7 = call dereferenceable(16) %"struct.std::pair.13"* @_ZNKSt17_Rb_tree_iteratorISt4pairIKmP4RealEEdeEv(%"struct.std::_Rb_tree_iterator"* %__i) #3
  %second = getelementptr inbounds %"struct.std::pair.13", %"struct.std::pair.13"* %call7, i32 0, i32 1
  ret %struct.Real** %second
}

; Function Attrs: noinline optnone uwtable
define dso_local i8* @handleMathFunc(i64 %funcCode, i8* %op1) #5 {
entry:
  %funcCode.addr = alloca i64, align 8
  %op1.addr = alloca i8*, align 8
  %op1_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %res_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %real_res = alloca %struct.Real*, align 8
  %real1 = alloca %struct.Real*, align 8
  %Addr = alloca i64, align 8
  %ref.tmp = alloca %"struct.std::pair.5", align 8
  %coerce = alloca %"struct.std::pair", align 8
  store i64 %funcCode, i64* %funcCode.addr, align 8
  store i8* %op1, i8** %op1.addr, align 8
  %call = call i8* @_Znwm(i64 32) #15
  %0 = bitcast i8* %call to %struct.Real*
  store %struct.Real* %0, %struct.Real** %real_res, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op1_mpfr, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay, i64 200)
  %1 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val = getelementptr inbounds %struct.Real, %struct.Real* %1, i32 0, i32 0
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay1, i64 200)
  %2 = load i8*, i8** %op1.addr, align 8
  %call2 = call %struct.Real* @getReal(i8* %2)
  store %struct.Real* %call2, %struct.Real** %real1, align 8
  %3 = load i64, i64* %funcCode.addr, align 8
  switch i64 %3, label %sw.default [
    i64 1, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry
  %4 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val3 = getelementptr inbounds %struct.Real, %struct.Real* %4, i32 0, i32 0
  %arraydecay4 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val3, i32 0, i32 0
  %5 = load %struct.Real*, %struct.Real** %real1, align 8
  %mpfr_val5 = getelementptr inbounds %struct.Real, %struct.Real* %5, i32 0, i32 0
  %arraydecay6 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val5, i32 0, i32 0
  %call7 = call i32 @mpfr_sqrt(%struct.__mpfr_struct* %arraydecay4, %struct.__mpfr_struct* %arraydecay6, i32 3)
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb
  %6 = load %struct.Real*, %struct.Real** %real_res, align 8
  %7 = ptrtoint %struct.Real* %6 to i64
  store i64 %7, i64* %Addr, align 8
  call void @_ZNSt4pairImP4RealEC2IRmRS1_Lb1EEEOT_OT0_(%"struct.std::pair.5"* %ref.tmp, i64* dereferenceable(8) %Addr, %struct.Real** dereferenceable(8) %real_res)
  %call8 = call { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE6insertIS4_ImS1_EvEES4_ISt17_Rb_tree_iteratorIS6_EbEOT_(%"class.std::map.0"* @shadowMap, %"struct.std::pair.5"* dereferenceable(16) %ref.tmp)
  %8 = bitcast %"struct.std::pair"* %coerce to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %9 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %8, i32 0, i32 0
  %10 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call8, 0
  store %"struct.std::_Rb_tree_node_base"* %10, %"struct.std::_Rb_tree_node_base"** %9, align 8
  %11 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %8, i32 0, i32 1
  %12 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call8, 1
  store i8 %12, i8* %11, align 8
  %13 = load %struct.Real*, %struct.Real** %real_res, align 8
  %14 = bitcast %struct.Real* %13 to i8*
  ret i8* %14
}

; Function Attrs: nobuiltin
declare dso_local noalias i8* @_Znwm(i64) #6

declare dso_local void @mpfr_init2(%struct.__mpfr_struct*, i64) #1

declare dso_local i32 @mpfr_sqrt(%struct.__mpfr_struct*, %struct.__mpfr_struct*, i32) #1

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE6insertIS4_ImS1_EvEES4_ISt17_Rb_tree_iteratorIS6_EbEOT_(%"class.std::map.0"* %this, %"struct.std::pair.5"* dereferenceable(16) %__x) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::pair", align 8
  %this.addr = alloca %"class.std::map.0"*, align 8
  %__x.addr = alloca %"struct.std::pair.5"*, align 8
  store %"class.std::map.0"* %this, %"class.std::map.0"** %this.addr, align 8
  store %"struct.std::pair.5"* %__x, %"struct.std::pair.5"** %__x.addr, align 8
  %this1 = load %"class.std::map.0"*, %"class.std::map.0"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"class.std::map.0", %"class.std::map.0"* %this1, i32 0, i32 0
  %0 = load %"struct.std::pair.5"*, %"struct.std::pair.5"** %__x.addr, align 8
  %call = call dereferenceable(16) %"struct.std::pair.5"* @_ZSt7forwardISt4pairImP4RealEEOT_RNSt16remove_referenceIS4_E4typeE(%"struct.std::pair.5"* dereferenceable(16) %0) #3
  %call2 = call { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE16_M_insert_uniqueIS0_ImS3_EEES0_ISt17_Rb_tree_iteratorIS4_EbEOT_(%"class.std::_Rb_tree.1"* %_M_t, %"struct.std::pair.5"* dereferenceable(16) %call)
  %1 = bitcast %"struct.std::pair"* %retval to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %2 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %1, i32 0, i32 0
  %3 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call2, 0
  store %"struct.std::_Rb_tree_node_base"* %3, %"struct.std::_Rb_tree_node_base"** %2, align 8
  %4 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %1, i32 0, i32 1
  %5 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call2, 1
  store i8 %5, i8* %4, align 8
  %6 = bitcast %"struct.std::pair"* %retval to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %7 = load { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %6, align 8
  ret { %"struct.std::_Rb_tree_node_base"*, i8 } %7
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt4pairImP4RealEC2IRmRS1_Lb1EEEOT_OT0_(%"struct.std::pair.5"* %this, i64* dereferenceable(8) %__x, %struct.Real** dereferenceable(8) %__y) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::pair.5"*, align 8
  %__x.addr = alloca i64*, align 8
  %__y.addr = alloca %struct.Real**, align 8
  store %"struct.std::pair.5"* %this, %"struct.std::pair.5"** %this.addr, align 8
  store i64* %__x, i64** %__x.addr, align 8
  store %struct.Real** %__y, %struct.Real*** %__y.addr, align 8
  %this1 = load %"struct.std::pair.5"*, %"struct.std::pair.5"** %this.addr, align 8
  %first = getelementptr inbounds %"struct.std::pair.5", %"struct.std::pair.5"* %this1, i32 0, i32 0
  %0 = load i64*, i64** %__x.addr, align 8
  %call = call dereferenceable(8) i64* @_ZSt7forwardIRmEOT_RNSt16remove_referenceIS1_E4typeE(i64* dereferenceable(8) %0) #3
  %1 = load i64, i64* %call, align 8
  store i64 %1, i64* %first, align 8
  %second = getelementptr inbounds %"struct.std::pair.5", %"struct.std::pair.5"* %this1, i32 0, i32 1
  %2 = load %struct.Real**, %struct.Real*** %__y.addr, align 8
  %call2 = call dereferenceable(8) %struct.Real** @_ZSt7forwardIRP4RealEOT_RNSt16remove_referenceIS3_E4typeE(%struct.Real** dereferenceable(8) %2) #3
  %3 = load %struct.Real*, %struct.Real** %call2, align 8
  store %struct.Real* %3, %struct.Real** %second, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z8handleOpmPA1_13__mpfr_structS1_S1_(i64 %opCode, [1 x %struct.__mpfr_struct]* %res, [1 x %struct.__mpfr_struct]* %op1, [1 x %struct.__mpfr_struct]* %op2) #5 {
entry:
  %opCode.addr = alloca i64, align 8
  %res.addr = alloca [1 x %struct.__mpfr_struct]*, align 8
  %op1.addr = alloca [1 x %struct.__mpfr_struct]*, align 8
  %op2.addr = alloca [1 x %struct.__mpfr_struct]*, align 8
  store i64 %opCode, i64* %opCode.addr, align 8
  store [1 x %struct.__mpfr_struct]* %res, [1 x %struct.__mpfr_struct]** %res.addr, align 8
  store [1 x %struct.__mpfr_struct]* %op1, [1 x %struct.__mpfr_struct]** %op1.addr, align 8
  store [1 x %struct.__mpfr_struct]* %op2, [1 x %struct.__mpfr_struct]** %op2.addr, align 8
  %0 = load i64, i64* %opCode.addr, align 8
  switch i64 %0, label %sw.default [
    i64 12, label %sw.bb
    i64 14, label %sw.bb3
    i64 16, label %sw.bb8
    i64 19, label %sw.bb13
  ]

sw.bb:                                            ; preds = %entry
  %1 = load [1 x %struct.__mpfr_struct]*, [1 x %struct.__mpfr_struct]** %res.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %1, i32 0, i32 0
  %2 = load [1 x %struct.__mpfr_struct]*, [1 x %struct.__mpfr_struct]** %op1.addr, align 8
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %2, i32 0, i32 0
  %3 = load [1 x %struct.__mpfr_struct]*, [1 x %struct.__mpfr_struct]** %op2.addr, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %3, i32 0, i32 0
  %call = call i32 @mpfr_add(%struct.__mpfr_struct* %arraydecay, %struct.__mpfr_struct* %arraydecay1, %struct.__mpfr_struct* %arraydecay2, i32 3)
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %4 = load [1 x %struct.__mpfr_struct]*, [1 x %struct.__mpfr_struct]** %res.addr, align 8
  %arraydecay4 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %4, i32 0, i32 0
  %5 = load [1 x %struct.__mpfr_struct]*, [1 x %struct.__mpfr_struct]** %op1.addr, align 8
  %arraydecay5 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %5, i32 0, i32 0
  %6 = load [1 x %struct.__mpfr_struct]*, [1 x %struct.__mpfr_struct]** %op2.addr, align 8
  %arraydecay6 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %6, i32 0, i32 0
  %call7 = call i32 @mpfr_sub(%struct.__mpfr_struct* %arraydecay4, %struct.__mpfr_struct* %arraydecay5, %struct.__mpfr_struct* %arraydecay6, i32 3)
  br label %sw.epilog

sw.bb8:                                           ; preds = %entry
  %7 = load [1 x %struct.__mpfr_struct]*, [1 x %struct.__mpfr_struct]** %res.addr, align 8
  %arraydecay9 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %7, i32 0, i32 0
  %8 = load [1 x %struct.__mpfr_struct]*, [1 x %struct.__mpfr_struct]** %op1.addr, align 8
  %arraydecay10 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %8, i32 0, i32 0
  %9 = load [1 x %struct.__mpfr_struct]*, [1 x %struct.__mpfr_struct]** %op2.addr, align 8
  %arraydecay11 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %9, i32 0, i32 0
  %call12 = call i32 @mpfr_mul(%struct.__mpfr_struct* %arraydecay9, %struct.__mpfr_struct* %arraydecay10, %struct.__mpfr_struct* %arraydecay11, i32 3)
  br label %sw.epilog

sw.bb13:                                          ; preds = %entry
  %10 = load [1 x %struct.__mpfr_struct]*, [1 x %struct.__mpfr_struct]** %res.addr, align 8
  %arraydecay14 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %10, i32 0, i32 0
  %11 = load [1 x %struct.__mpfr_struct]*, [1 x %struct.__mpfr_struct]** %op1.addr, align 8
  %arraydecay15 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %11, i32 0, i32 0
  %12 = load [1 x %struct.__mpfr_struct]*, [1 x %struct.__mpfr_struct]** %op2.addr, align 8
  %arraydecay16 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %12, i32 0, i32 0
  %call17 = call i32 @mpfr_div(%struct.__mpfr_struct* %arraydecay14, %struct.__mpfr_struct* %arraydecay15, %struct.__mpfr_struct* %arraydecay16, i32 3)
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb13, %sw.bb8, %sw.bb3, %sw.bb
  ret void
}

declare dso_local i32 @mpfr_add(%struct.__mpfr_struct*, %struct.__mpfr_struct*, %struct.__mpfr_struct*, i32) #1

declare dso_local i32 @mpfr_sub(%struct.__mpfr_struct*, %struct.__mpfr_struct*, %struct.__mpfr_struct*, i32) #1

declare dso_local i32 @mpfr_mul(%struct.__mpfr_struct*, %struct.__mpfr_struct*, %struct.__mpfr_struct*, i32) #1

declare dso_local i32 @mpfr_div(%struct.__mpfr_struct*, %struct.__mpfr_struct*, %struct.__mpfr_struct*, i32) #1

; Function Attrs: noinline optnone uwtable
define dso_local i8* @handleOp_1(i64 %opCode, i8* %op1, i8* %op2) #5 {
entry:
  %opCode.addr = alloca i64, align 8
  %op1.addr = alloca i8*, align 8
  %op2.addr = alloca i8*, align 8
  %op1_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %op2_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %res_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %real_res = alloca %struct.Real*, align 8
  %AddrInt1 = alloca i64, align 8
  %AddrInt2 = alloca i64, align 8
  %real1 = alloca %struct.Real*, align 8
  %real2 = alloca %struct.Real*, align 8
  %Addr = alloca i64, align 8
  %ref.tmp = alloca %"struct.std::pair.5", align 8
  %coerce = alloca %"struct.std::pair", align 8
  store i64 %opCode, i64* %opCode.addr, align 8
  store i8* %op1, i8** %op1.addr, align 8
  store i8* %op2, i8** %op2.addr, align 8
  %call = call i8* @_Znwm(i64 32) #15
  %0 = bitcast i8* %call to %struct.Real*
  store %struct.Real* %0, %struct.Real** %real_res, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op1_mpfr, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay, i64 200)
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op2_mpfr, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay1, i64 200)
  %1 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val = getelementptr inbounds %struct.Real, %struct.Real* %1, i32 0, i32 0
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay2, i64 200)
  %2 = load i8*, i8** %op1.addr, align 8
  %3 = ptrtoint i8* %2 to i64
  store i64 %3, i64* %AddrInt1, align 8
  %4 = load i8*, i8** %op2.addr, align 8
  %5 = ptrtoint i8* %4 to i64
  store i64 %5, i64* %AddrInt2, align 8
  %6 = load i8*, i8** %op1.addr, align 8
  %call3 = call %struct.Real* @getReal(i8* %6)
  store %struct.Real* %call3, %struct.Real** %real1, align 8
  %7 = load i8*, i8** %op2.addr, align 8
  %call4 = call %struct.Real* @getReal(i8* %7)
  store %struct.Real* %call4, %struct.Real** %real2, align 8
  %8 = load i64, i64* %opCode.addr, align 8
  %9 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val5 = getelementptr inbounds %struct.Real, %struct.Real* %9, i32 0, i32 0
  %10 = load %struct.Real*, %struct.Real** %real1, align 8
  %mpfr_val6 = getelementptr inbounds %struct.Real, %struct.Real* %10, i32 0, i32 0
  %11 = load %struct.Real*, %struct.Real** %real2, align 8
  %mpfr_val7 = getelementptr inbounds %struct.Real, %struct.Real* %11, i32 0, i32 0
  call void @_Z8handleOpmPA1_13__mpfr_structS1_S1_(i64 %8, [1 x %struct.__mpfr_struct]* %mpfr_val5, [1 x %struct.__mpfr_struct]* %mpfr_val6, [1 x %struct.__mpfr_struct]* %mpfr_val7)
  %12 = load %struct.Real*, %struct.Real** %real_res, align 8
  %13 = ptrtoint %struct.Real* %12 to i64
  store i64 %13, i64* %Addr, align 8
  call void @_ZNSt4pairImP4RealEC2IRmRS1_Lb1EEEOT_OT0_(%"struct.std::pair.5"* %ref.tmp, i64* dereferenceable(8) %Addr, %struct.Real** dereferenceable(8) %real_res)
  %call8 = call { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE6insertIS4_ImS1_EvEES4_ISt17_Rb_tree_iteratorIS6_EbEOT_(%"class.std::map.0"* @shadowMap, %"struct.std::pair.5"* dereferenceable(16) %ref.tmp)
  %14 = bitcast %"struct.std::pair"* %coerce to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %15 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %14, i32 0, i32 0
  %16 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call8, 0
  store %"struct.std::_Rb_tree_node_base"* %16, %"struct.std::_Rb_tree_node_base"** %15, align 8
  %17 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %14, i32 0, i32 1
  %18 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call8, 1
  store i8 %18, i8* %17, align 8
  %19 = load %struct.Real*, %struct.Real** %real_res, align 8
  %20 = bitcast %struct.Real* %19 to i8*
  ret i8* %20
}

; Function Attrs: noinline optnone uwtable
define dso_local i8* @handleOp_2_f(i64 %opCode, float %op1, i8* %op2) #5 {
entry:
  %opCode.addr = alloca i64, align 8
  %op1.addr = alloca float, align 4
  %op2.addr = alloca i8*, align 8
  %op1_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %real_res = alloca %struct.Real*, align 8
  %AddrInt = alloca i64, align 8
  %real = alloca %struct.Real*, align 8
  %Addr = alloca i64, align 8
  %ref.tmp = alloca %"struct.std::pair.5", align 8
  %coerce = alloca %"struct.std::pair", align 8
  store i64 %opCode, i64* %opCode.addr, align 8
  store float %op1, float* %op1.addr, align 4
  store i8* %op2, i8** %op2.addr, align 8
  %call = call i8* @_Znwm(i64 32) #15
  %0 = bitcast i8* %call to %struct.Real*
  store %struct.Real* %0, %struct.Real** %real_res, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op1_mpfr, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay, i64 200)
  %1 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val = getelementptr inbounds %struct.Real, %struct.Real* %1, i32 0, i32 0
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay1, i64 200)
  %2 = load i8*, i8** %op2.addr, align 8
  %3 = ptrtoint i8* %2 to i64
  store i64 %3, i64* %AddrInt, align 8
  %4 = load i8*, i8** %op2.addr, align 8
  %call2 = call %struct.Real* @getReal(i8* %4)
  store %struct.Real* %call2, %struct.Real** %real, align 8
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op1_mpfr, i32 0, i32 0
  %5 = load float, float* %op1.addr, align 4
  %conv = fpext float %5 to double
  %call4 = call i32 @mpfr_set_d(%struct.__mpfr_struct* %arraydecay3, double %conv, i32 3)
  %6 = load i64, i64* %opCode.addr, align 8
  %7 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val5 = getelementptr inbounds %struct.Real, %struct.Real* %7, i32 0, i32 0
  %8 = load %struct.Real*, %struct.Real** %real, align 8
  %mpfr_val6 = getelementptr inbounds %struct.Real, %struct.Real* %8, i32 0, i32 0
  call void @_Z8handleOpmPA1_13__mpfr_structS1_S1_(i64 %6, [1 x %struct.__mpfr_struct]* %mpfr_val5, [1 x %struct.__mpfr_struct]* %mpfr_val6, [1 x %struct.__mpfr_struct]* %op1_mpfr)
  %call7 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %9 = load %struct.Real*, %struct.Real** %real_res, align 8
  %10 = ptrtoint %struct.Real* %9 to i64
  store i64 %10, i64* %Addr, align 8
  call void @_ZNSt4pairImP4RealEC2IRmRS1_Lb1EEEOT_OT0_(%"struct.std::pair.5"* %ref.tmp, i64* dereferenceable(8) %Addr, %struct.Real** dereferenceable(8) %real_res)
  %call8 = call { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE6insertIS4_ImS1_EvEES4_ISt17_Rb_tree_iteratorIS6_EbEOT_(%"class.std::map.0"* @shadowMap, %"struct.std::pair.5"* dereferenceable(16) %ref.tmp)
  %11 = bitcast %"struct.std::pair"* %coerce to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %12 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %11, i32 0, i32 0
  %13 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call8, 0
  store %"struct.std::_Rb_tree_node_base"* %13, %"struct.std::_Rb_tree_node_base"** %12, align 8
  %14 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %11, i32 0, i32 1
  %15 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call8, 1
  store i8 %15, i8* %14, align 8
  %16 = load %struct.Real*, %struct.Real** %real_res, align 8
  %17 = bitcast %struct.Real* %16 to i8*
  ret i8* %17
}

declare dso_local i32 @mpfr_set_d(%struct.__mpfr_struct*, double, i32) #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #1

; Function Attrs: noinline optnone uwtable
define dso_local i8* @handleOp_2_d(i64 %opCode, double %op1, i8* %op2) #5 {
entry:
  %opCode.addr = alloca i64, align 8
  %op1.addr = alloca double, align 8
  %op2.addr = alloca i8*, align 8
  %op1_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %real_res = alloca %struct.Real*, align 8
  %AddrInt = alloca i64, align 8
  %real = alloca %struct.Real*, align 8
  %Addr = alloca i64, align 8
  %ref.tmp = alloca %"struct.std::pair.5", align 8
  %coerce = alloca %"struct.std::pair", align 8
  store i64 %opCode, i64* %opCode.addr, align 8
  store double %op1, double* %op1.addr, align 8
  store i8* %op2, i8** %op2.addr, align 8
  %call = call i8* @_Znwm(i64 32) #15
  %0 = bitcast i8* %call to %struct.Real*
  store %struct.Real* %0, %struct.Real** %real_res, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op1_mpfr, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay, i64 200)
  %1 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val = getelementptr inbounds %struct.Real, %struct.Real* %1, i32 0, i32 0
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay1, i64 200)
  %2 = load i8*, i8** %op2.addr, align 8
  %3 = ptrtoint i8* %2 to i64
  store i64 %3, i64* %AddrInt, align 8
  %4 = load i8*, i8** %op2.addr, align 8
  %call2 = call %struct.Real* @getReal(i8* %4)
  store %struct.Real* %call2, %struct.Real** %real, align 8
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op1_mpfr, i32 0, i32 0
  %5 = load double, double* %op1.addr, align 8
  %call4 = call i32 @mpfr_set_d(%struct.__mpfr_struct* %arraydecay3, double %5, i32 3)
  %6 = load i64, i64* %opCode.addr, align 8
  %7 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val5 = getelementptr inbounds %struct.Real, %struct.Real* %7, i32 0, i32 0
  %8 = load %struct.Real*, %struct.Real** %real, align 8
  %mpfr_val6 = getelementptr inbounds %struct.Real, %struct.Real* %8, i32 0, i32 0
  call void @_Z8handleOpmPA1_13__mpfr_structS1_S1_(i64 %6, [1 x %struct.__mpfr_struct]* %mpfr_val5, [1 x %struct.__mpfr_struct]* %mpfr_val6, [1 x %struct.__mpfr_struct]* %op1_mpfr)
  %9 = load %struct.Real*, %struct.Real** %real_res, align 8
  %10 = ptrtoint %struct.Real* %9 to i64
  store i64 %10, i64* %Addr, align 8
  call void @_ZNSt4pairImP4RealEC2IRmRS1_Lb1EEEOT_OT0_(%"struct.std::pair.5"* %ref.tmp, i64* dereferenceable(8) %Addr, %struct.Real** dereferenceable(8) %real_res)
  %call7 = call { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE6insertIS4_ImS1_EvEES4_ISt17_Rb_tree_iteratorIS6_EbEOT_(%"class.std::map.0"* @shadowMap, %"struct.std::pair.5"* dereferenceable(16) %ref.tmp)
  %11 = bitcast %"struct.std::pair"* %coerce to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %12 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %11, i32 0, i32 0
  %13 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call7, 0
  store %"struct.std::_Rb_tree_node_base"* %13, %"struct.std::_Rb_tree_node_base"** %12, align 8
  %14 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %11, i32 0, i32 1
  %15 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call7, 1
  store i8 %15, i8* %14, align 8
  %16 = load %struct.Real*, %struct.Real** %real_res, align 8
  %17 = bitcast %struct.Real* %16 to i8*
  ret i8* %17
}

; Function Attrs: noinline optnone uwtable
define dso_local i8* @handleOp_3_f(i64 %opCode, i8* %op1, float %op2) #5 {
entry:
  %opCode.addr = alloca i64, align 8
  %op1.addr = alloca i8*, align 8
  %op2.addr = alloca float, align 4
  %op2_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %res_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %real_res = alloca %struct.Real*, align 8
  %AddrInt = alloca i64, align 8
  %real = alloca %struct.Real*, align 8
  %Addr = alloca i64, align 8
  %ref.tmp = alloca %"struct.std::pair.5", align 8
  %coerce = alloca %"struct.std::pair", align 8
  store i64 %opCode, i64* %opCode.addr, align 8
  store i8* %op1, i8** %op1.addr, align 8
  store float %op2, float* %op2.addr, align 4
  %call = call i8* @_Znwm(i64 32) #15
  %0 = bitcast i8* %call to %struct.Real*
  store %struct.Real* %0, %struct.Real** %real_res, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op2_mpfr, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay, i64 200)
  %1 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val = getelementptr inbounds %struct.Real, %struct.Real* %1, i32 0, i32 0
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay1, i64 200)
  %2 = load i8*, i8** %op1.addr, align 8
  %3 = ptrtoint i8* %2 to i64
  store i64 %3, i64* %AddrInt, align 8
  %4 = load i8*, i8** %op1.addr, align 8
  %call2 = call %struct.Real* @getReal(i8* %4)
  store %struct.Real* %call2, %struct.Real** %real, align 8
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op2_mpfr, i32 0, i32 0
  %5 = load float, float* %op2.addr, align 4
  %conv = fpext float %5 to double
  %call4 = call i32 @mpfr_set_d(%struct.__mpfr_struct* %arraydecay3, double %conv, i32 3)
  %6 = load i64, i64* %opCode.addr, align 8
  %7 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val5 = getelementptr inbounds %struct.Real, %struct.Real* %7, i32 0, i32 0
  %8 = load %struct.Real*, %struct.Real** %real, align 8
  %mpfr_val6 = getelementptr inbounds %struct.Real, %struct.Real* %8, i32 0, i32 0
  call void @_Z8handleOpmPA1_13__mpfr_structS1_S1_(i64 %6, [1 x %struct.__mpfr_struct]* %mpfr_val5, [1 x %struct.__mpfr_struct]* %mpfr_val6, [1 x %struct.__mpfr_struct]* %op2_mpfr)
  %9 = load %struct.Real*, %struct.Real** %real_res, align 8
  %10 = ptrtoint %struct.Real* %9 to i64
  store i64 %10, i64* %Addr, align 8
  call void @_ZNSt4pairImP4RealEC2IRmRS1_Lb1EEEOT_OT0_(%"struct.std::pair.5"* %ref.tmp, i64* dereferenceable(8) %Addr, %struct.Real** dereferenceable(8) %real_res)
  %call7 = call { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE6insertIS4_ImS1_EvEES4_ISt17_Rb_tree_iteratorIS6_EbEOT_(%"class.std::map.0"* @shadowMap, %"struct.std::pair.5"* dereferenceable(16) %ref.tmp)
  %11 = bitcast %"struct.std::pair"* %coerce to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %12 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %11, i32 0, i32 0
  %13 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call7, 0
  store %"struct.std::_Rb_tree_node_base"* %13, %"struct.std::_Rb_tree_node_base"** %12, align 8
  %14 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %11, i32 0, i32 1
  %15 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call7, 1
  store i8 %15, i8* %14, align 8
  %16 = load %struct.Real*, %struct.Real** %real_res, align 8
  %17 = bitcast %struct.Real* %16 to i8*
  ret i8* %17
}

; Function Attrs: noinline optnone uwtable
define dso_local i8* @handleOp_3_d(i64 %opCode, i8* %op1, double %op2) #5 {
entry:
  %opCode.addr = alloca i64, align 8
  %op1.addr = alloca i8*, align 8
  %op2.addr = alloca double, align 8
  %op2_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %res_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %real_res = alloca %struct.Real*, align 8
  %AddrInt = alloca i64, align 8
  %real = alloca %struct.Real*, align 8
  %Addr = alloca i64, align 8
  %ref.tmp = alloca %"struct.std::pair.5", align 8
  %coerce = alloca %"struct.std::pair", align 8
  store i64 %opCode, i64* %opCode.addr, align 8
  store i8* %op1, i8** %op1.addr, align 8
  store double %op2, double* %op2.addr, align 8
  %call = call i8* @_Znwm(i64 32) #15
  %0 = bitcast i8* %call to %struct.Real*
  store %struct.Real* %0, %struct.Real** %real_res, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op2_mpfr, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay, i64 200)
  %1 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val = getelementptr inbounds %struct.Real, %struct.Real* %1, i32 0, i32 0
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay1, i64 200)
  %2 = load i8*, i8** %op1.addr, align 8
  %3 = ptrtoint i8* %2 to i64
  store i64 %3, i64* %AddrInt, align 8
  %4 = load i8*, i8** %op1.addr, align 8
  %call2 = call %struct.Real* @getReal(i8* %4)
  store %struct.Real* %call2, %struct.Real** %real, align 8
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op2_mpfr, i32 0, i32 0
  %5 = load double, double* %op2.addr, align 8
  %call4 = call i32 @mpfr_set_d(%struct.__mpfr_struct* %arraydecay3, double %5, i32 3)
  %6 = load i64, i64* %opCode.addr, align 8
  %7 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val5 = getelementptr inbounds %struct.Real, %struct.Real* %7, i32 0, i32 0
  %8 = load %struct.Real*, %struct.Real** %real, align 8
  %mpfr_val6 = getelementptr inbounds %struct.Real, %struct.Real* %8, i32 0, i32 0
  call void @_Z8handleOpmPA1_13__mpfr_structS1_S1_(i64 %6, [1 x %struct.__mpfr_struct]* %mpfr_val5, [1 x %struct.__mpfr_struct]* %mpfr_val6, [1 x %struct.__mpfr_struct]* %op2_mpfr)
  %9 = load %struct.Real*, %struct.Real** %real_res, align 8
  %10 = ptrtoint %struct.Real* %9 to i64
  store i64 %10, i64* %Addr, align 8
  call void @_ZNSt4pairImP4RealEC2IRmRS1_Lb1EEEOT_OT0_(%"struct.std::pair.5"* %ref.tmp, i64* dereferenceable(8) %Addr, %struct.Real** dereferenceable(8) %real_res)
  %call7 = call { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE6insertIS4_ImS1_EvEES4_ISt17_Rb_tree_iteratorIS6_EbEOT_(%"class.std::map.0"* @shadowMap, %"struct.std::pair.5"* dereferenceable(16) %ref.tmp)
  %11 = bitcast %"struct.std::pair"* %coerce to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %12 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %11, i32 0, i32 0
  %13 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call7, 0
  store %"struct.std::_Rb_tree_node_base"* %13, %"struct.std::_Rb_tree_node_base"** %12, align 8
  %14 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %11, i32 0, i32 1
  %15 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call7, 1
  store i8 %15, i8* %14, align 8
  %16 = load %struct.Real*, %struct.Real** %real_res, align 8
  %17 = bitcast %struct.Real* %16 to i8*
  ret i8* %17
}

; Function Attrs: noinline optnone uwtable
define dso_local i8* @handleOp_4_ff(i64 %opCode, float %op1, float %op2) #5 {
entry:
  %opCode.addr = alloca i64, align 8
  %op1.addr = alloca float, align 4
  %op2.addr = alloca float, align 4
  %op1_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %op2_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %real_res = alloca %struct.Real*, align 8
  %AddrInt = alloca i64, align 8
  %ref.tmp = alloca %"struct.std::pair.5", align 8
  %coerce = alloca %"struct.std::pair", align 8
  store i64 %opCode, i64* %opCode.addr, align 8
  store float %op1, float* %op1.addr, align 4
  store float %op2, float* %op2.addr, align 4
  %call = call i8* @_Znwm(i64 32) #15
  %0 = bitcast i8* %call to %struct.Real*
  store %struct.Real* %0, %struct.Real** %real_res, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op1_mpfr, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay, i64 200)
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op2_mpfr, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay1, i64 200)
  %1 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val = getelementptr inbounds %struct.Real, %struct.Real* %1, i32 0, i32 0
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay2, i64 200)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op1_mpfr, i32 0, i32 0
  %2 = load float, float* %op1.addr, align 4
  %conv = fpext float %2 to double
  %call4 = call i32 @mpfr_set_d(%struct.__mpfr_struct* %arraydecay3, double %conv, i32 3)
  %arraydecay5 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op2_mpfr, i32 0, i32 0
  %3 = load float, float* %op2.addr, align 4
  %conv6 = fpext float %3 to double
  %call7 = call i32 @mpfr_set_d(%struct.__mpfr_struct* %arraydecay5, double %conv6, i32 3)
  %4 = load i64, i64* %opCode.addr, align 8
  %5 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val8 = getelementptr inbounds %struct.Real, %struct.Real* %5, i32 0, i32 0
  call void @_Z8handleOpmPA1_13__mpfr_structS1_S1_(i64 %4, [1 x %struct.__mpfr_struct]* %mpfr_val8, [1 x %struct.__mpfr_struct]* %op1_mpfr, [1 x %struct.__mpfr_struct]* %op2_mpfr)
  %6 = load %struct.Real*, %struct.Real** %real_res, align 8
  %7 = ptrtoint %struct.Real* %6 to i64
  store i64 %7, i64* %AddrInt, align 8
  call void @_ZNSt4pairImP4RealEC2IRmRS1_Lb1EEEOT_OT0_(%"struct.std::pair.5"* %ref.tmp, i64* dereferenceable(8) %AddrInt, %struct.Real** dereferenceable(8) %real_res)
  %call9 = call { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE6insertIS4_ImS1_EvEES4_ISt17_Rb_tree_iteratorIS6_EbEOT_(%"class.std::map.0"* @shadowMap, %"struct.std::pair.5"* dereferenceable(16) %ref.tmp)
  %8 = bitcast %"struct.std::pair"* %coerce to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %9 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %8, i32 0, i32 0
  %10 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call9, 0
  store %"struct.std::_Rb_tree_node_base"* %10, %"struct.std::_Rb_tree_node_base"** %9, align 8
  %11 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %8, i32 0, i32 1
  %12 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call9, 1
  store i8 %12, i8* %11, align 8
  %13 = load %struct.Real*, %struct.Real** %real_res, align 8
  %14 = bitcast %struct.Real* %13 to i8*
  ret i8* %14
}

; Function Attrs: noinline optnone uwtable
define dso_local i8* @handleOp_4_fd(i64 %opCode, float %op1, double %op2) #5 {
entry:
  %opCode.addr = alloca i64, align 8
  %op1.addr = alloca float, align 4
  %op2.addr = alloca double, align 8
  %op1_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %op2_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %real_res = alloca %struct.Real*, align 8
  %AddrInt = alloca i64, align 8
  %ref.tmp = alloca %"struct.std::pair.5", align 8
  %coerce = alloca %"struct.std::pair", align 8
  store i64 %opCode, i64* %opCode.addr, align 8
  store float %op1, float* %op1.addr, align 4
  store double %op2, double* %op2.addr, align 8
  %call = call i8* @_Znwm(i64 32) #15
  %0 = bitcast i8* %call to %struct.Real*
  store %struct.Real* %0, %struct.Real** %real_res, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op1_mpfr, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay, i64 200)
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op2_mpfr, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay1, i64 200)
  %1 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val = getelementptr inbounds %struct.Real, %struct.Real* %1, i32 0, i32 0
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay2, i64 200)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op1_mpfr, i32 0, i32 0
  %2 = load float, float* %op1.addr, align 4
  %conv = fpext float %2 to double
  %call4 = call i32 @mpfr_set_d(%struct.__mpfr_struct* %arraydecay3, double %conv, i32 3)
  %arraydecay5 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op2_mpfr, i32 0, i32 0
  %3 = load double, double* %op2.addr, align 8
  %call6 = call i32 @mpfr_set_d(%struct.__mpfr_struct* %arraydecay5, double %3, i32 3)
  %4 = load i64, i64* %opCode.addr, align 8
  %5 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val7 = getelementptr inbounds %struct.Real, %struct.Real* %5, i32 0, i32 0
  call void @_Z8handleOpmPA1_13__mpfr_structS1_S1_(i64 %4, [1 x %struct.__mpfr_struct]* %mpfr_val7, [1 x %struct.__mpfr_struct]* %op1_mpfr, [1 x %struct.__mpfr_struct]* %op2_mpfr)
  %6 = load %struct.Real*, %struct.Real** %real_res, align 8
  %7 = ptrtoint %struct.Real* %6 to i64
  store i64 %7, i64* %AddrInt, align 8
  call void @_ZNSt4pairImP4RealEC2IRmRS1_Lb1EEEOT_OT0_(%"struct.std::pair.5"* %ref.tmp, i64* dereferenceable(8) %AddrInt, %struct.Real** dereferenceable(8) %real_res)
  %call8 = call { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE6insertIS4_ImS1_EvEES4_ISt17_Rb_tree_iteratorIS6_EbEOT_(%"class.std::map.0"* @shadowMap, %"struct.std::pair.5"* dereferenceable(16) %ref.tmp)
  %8 = bitcast %"struct.std::pair"* %coerce to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %9 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %8, i32 0, i32 0
  %10 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call8, 0
  store %"struct.std::_Rb_tree_node_base"* %10, %"struct.std::_Rb_tree_node_base"** %9, align 8
  %11 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %8, i32 0, i32 1
  %12 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call8, 1
  store i8 %12, i8* %11, align 8
  %13 = load %struct.Real*, %struct.Real** %real_res, align 8
  %14 = bitcast %struct.Real* %13 to i8*
  ret i8* %14
}

; Function Attrs: noinline optnone uwtable
define dso_local i8* @handleOp_4_df(i64 %opCode, double %op1, float %op2) #5 {
entry:
  %opCode.addr = alloca i64, align 8
  %op1.addr = alloca double, align 8
  %op2.addr = alloca float, align 4
  %op1_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %op2_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %real_res = alloca %struct.Real*, align 8
  %AddrInt = alloca i64, align 8
  %ref.tmp = alloca %"struct.std::pair.5", align 8
  %coerce = alloca %"struct.std::pair", align 8
  store i64 %opCode, i64* %opCode.addr, align 8
  store double %op1, double* %op1.addr, align 8
  store float %op2, float* %op2.addr, align 4
  %call = call i8* @_Znwm(i64 32) #15
  %0 = bitcast i8* %call to %struct.Real*
  store %struct.Real* %0, %struct.Real** %real_res, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op1_mpfr, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay, i64 200)
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op2_mpfr, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay1, i64 200)
  %1 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val = getelementptr inbounds %struct.Real, %struct.Real* %1, i32 0, i32 0
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay2, i64 200)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op1_mpfr, i32 0, i32 0
  %2 = load double, double* %op1.addr, align 8
  %call4 = call i32 @mpfr_set_d(%struct.__mpfr_struct* %arraydecay3, double %2, i32 3)
  %arraydecay5 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op2_mpfr, i32 0, i32 0
  %3 = load float, float* %op2.addr, align 4
  %conv = fpext float %3 to double
  %call6 = call i32 @mpfr_set_d(%struct.__mpfr_struct* %arraydecay5, double %conv, i32 3)
  %4 = load i64, i64* %opCode.addr, align 8
  %5 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val7 = getelementptr inbounds %struct.Real, %struct.Real* %5, i32 0, i32 0
  call void @_Z8handleOpmPA1_13__mpfr_structS1_S1_(i64 %4, [1 x %struct.__mpfr_struct]* %mpfr_val7, [1 x %struct.__mpfr_struct]* %op1_mpfr, [1 x %struct.__mpfr_struct]* %op2_mpfr)
  %6 = load %struct.Real*, %struct.Real** %real_res, align 8
  %7 = ptrtoint %struct.Real* %6 to i64
  store i64 %7, i64* %AddrInt, align 8
  call void @_ZNSt4pairImP4RealEC2IRmRS1_Lb1EEEOT_OT0_(%"struct.std::pair.5"* %ref.tmp, i64* dereferenceable(8) %AddrInt, %struct.Real** dereferenceable(8) %real_res)
  %call8 = call { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE6insertIS4_ImS1_EvEES4_ISt17_Rb_tree_iteratorIS6_EbEOT_(%"class.std::map.0"* @shadowMap, %"struct.std::pair.5"* dereferenceable(16) %ref.tmp)
  %8 = bitcast %"struct.std::pair"* %coerce to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %9 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %8, i32 0, i32 0
  %10 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call8, 0
  store %"struct.std::_Rb_tree_node_base"* %10, %"struct.std::_Rb_tree_node_base"** %9, align 8
  %11 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %8, i32 0, i32 1
  %12 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call8, 1
  store i8 %12, i8* %11, align 8
  %13 = load %struct.Real*, %struct.Real** %real_res, align 8
  %14 = bitcast %struct.Real* %13 to i8*
  ret i8* %14
}

; Function Attrs: noinline optnone uwtable
define dso_local i8* @handleOp_4_dd(i64 %opCode, double %op1, double %op2) #5 {
entry:
  %opCode.addr = alloca i64, align 8
  %op1.addr = alloca double, align 8
  %op2.addr = alloca double, align 8
  %op1_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %op2_mpfr = alloca [1 x %struct.__mpfr_struct], align 16
  %real_res = alloca %struct.Real*, align 8
  %AddrInt = alloca i64, align 8
  %ref.tmp = alloca %"struct.std::pair.5", align 8
  %coerce = alloca %"struct.std::pair", align 8
  store i64 %opCode, i64* %opCode.addr, align 8
  store double %op1, double* %op1.addr, align 8
  store double %op2, double* %op2.addr, align 8
  %call = call i8* @_Znwm(i64 32) #15
  %0 = bitcast i8* %call to %struct.Real*
  store %struct.Real* %0, %struct.Real** %real_res, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op1_mpfr, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay, i64 200)
  %arraydecay1 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op2_mpfr, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay1, i64 200)
  %1 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val = getelementptr inbounds %struct.Real, %struct.Real* %1, i32 0, i32 0
  %arraydecay2 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay2, i64 200)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op1_mpfr, i32 0, i32 0
  %2 = load double, double* %op1.addr, align 8
  %call4 = call i32 @mpfr_set_d(%struct.__mpfr_struct* %arraydecay3, double %2, i32 3)
  %arraydecay5 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %op2_mpfr, i32 0, i32 0
  %3 = load double, double* %op2.addr, align 8
  %call6 = call i32 @mpfr_set_d(%struct.__mpfr_struct* %arraydecay5, double %3, i32 3)
  %4 = load i64, i64* %opCode.addr, align 8
  %5 = load %struct.Real*, %struct.Real** %real_res, align 8
  %mpfr_val7 = getelementptr inbounds %struct.Real, %struct.Real* %5, i32 0, i32 0
  call void @_Z8handleOpmPA1_13__mpfr_structS1_S1_(i64 %4, [1 x %struct.__mpfr_struct]* %mpfr_val7, [1 x %struct.__mpfr_struct]* %op1_mpfr, [1 x %struct.__mpfr_struct]* %op2_mpfr)
  %6 = load %struct.Real*, %struct.Real** %real_res, align 8
  %7 = ptrtoint %struct.Real* %6 to i64
  store i64 %7, i64* %AddrInt, align 8
  call void @_ZNSt4pairImP4RealEC2IRmRS1_Lb1EEEOT_OT0_(%"struct.std::pair.5"* %ref.tmp, i64* dereferenceable(8) %AddrInt, %struct.Real** dereferenceable(8) %real_res)
  %call8 = call { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE6insertIS4_ImS1_EvEES4_ISt17_Rb_tree_iteratorIS6_EbEOT_(%"class.std::map.0"* @shadowMap, %"struct.std::pair.5"* dereferenceable(16) %ref.tmp)
  %8 = bitcast %"struct.std::pair"* %coerce to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %9 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %8, i32 0, i32 0
  %10 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call8, 0
  store %"struct.std::_Rb_tree_node_base"* %10, %"struct.std::_Rb_tree_node_base"** %9, align 8
  %11 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %8, i32 0, i32 1
  %12 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call8, 1
  store i8 %12, i8* %11, align 8
  %13 = load %struct.Real*, %struct.Real** %real_res, align 8
  %14 = bitcast %struct.Real* %13 to i8*
  ret i8* %14
}

; Function Attrs: noinline optnone uwtable
define dso_local void @addFunArg(i8* %funAddr, i8* %argAddr) #5 {
entry:
  %funAddr.addr = alloca i8*, align 8
  %argAddr.addr = alloca i8*, align 8
  %funAddrInt = alloca i64, align 8
  %argAddrInt = alloca i64, align 8
  %ref.tmp = alloca %"struct.std::pair.9", align 8
  %coerce = alloca %"struct.std::pair.6", align 8
  store i8* %funAddr, i8** %funAddr.addr, align 8
  store i8* %argAddr, i8** %argAddr.addr, align 8
  %0 = load i8*, i8** %funAddr.addr, align 8
  %1 = ptrtoint i8* %0 to i64
  store i64 %1, i64* %funAddrInt, align 8
  %2 = load i8*, i8** %argAddr.addr, align 8
  %3 = ptrtoint i8* %2 to i64
  store i64 %3, i64* %argAddrInt, align 8
  call void @_ZNSt4pairImmEC2IRmS2_Lb1EEEOT_OT0_(%"struct.std::pair.9"* %ref.tmp, i64* dereferenceable(8) %funAddrInt, i64* dereferenceable(8) %argAddrInt)
  %call = call { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEE6insertIS2_ImmEvEES2_ISt17_Rb_tree_iteratorIS4_EbEOT_(%"class.std::map"* @shadowFunArgMap, %"struct.std::pair.9"* dereferenceable(16) %ref.tmp)
  %4 = bitcast %"struct.std::pair.6"* %coerce to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %5 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %4, i32 0, i32 0
  %6 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call, 0
  store %"struct.std::_Rb_tree_node_base"* %6, %"struct.std::_Rb_tree_node_base"** %5, align 8
  %7 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %4, i32 0, i32 1
  %8 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call, 1
  store i8 %8, i8* %7, align 8
  %call1 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEE6insertIS2_ImmEvEES2_ISt17_Rb_tree_iteratorIS4_EbEOT_(%"class.std::map"* %this, %"struct.std::pair.9"* dereferenceable(16) %__x) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::pair.6", align 8
  %this.addr = alloca %"class.std::map"*, align 8
  %__x.addr = alloca %"struct.std::pair.9"*, align 8
  store %"class.std::map"* %this, %"class.std::map"** %this.addr, align 8
  store %"struct.std::pair.9"* %__x, %"struct.std::pair.9"** %__x.addr, align 8
  %this1 = load %"class.std::map"*, %"class.std::map"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"class.std::map", %"class.std::map"* %this1, i32 0, i32 0
  %0 = load %"struct.std::pair.9"*, %"struct.std::pair.9"** %__x.addr, align 8
  %call = call dereferenceable(16) %"struct.std::pair.9"* @_ZSt7forwardISt4pairImmEEOT_RNSt16remove_referenceIS2_E4typeE(%"struct.std::pair.9"* dereferenceable(16) %0) #3
  %call2 = call { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE16_M_insert_uniqueIS0_ImmEEES0_ISt17_Rb_tree_iteratorIS2_EbEOT_(%"class.std::_Rb_tree"* %_M_t, %"struct.std::pair.9"* dereferenceable(16) %call)
  %1 = bitcast %"struct.std::pair.6"* %retval to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %2 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %1, i32 0, i32 0
  %3 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call2, 0
  store %"struct.std::_Rb_tree_node_base"* %3, %"struct.std::_Rb_tree_node_base"** %2, align 8
  %4 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %1, i32 0, i32 1
  %5 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call2, 1
  store i8 %5, i8* %4, align 8
  %6 = bitcast %"struct.std::pair.6"* %retval to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %7 = load { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %6, align 8
  ret { %"struct.std::_Rb_tree_node_base"*, i8 } %7
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt4pairImmEC2IRmS2_Lb1EEEOT_OT0_(%"struct.std::pair.9"* %this, i64* dereferenceable(8) %__x, i64* dereferenceable(8) %__y) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::pair.9"*, align 8
  %__x.addr = alloca i64*, align 8
  %__y.addr = alloca i64*, align 8
  store %"struct.std::pair.9"* %this, %"struct.std::pair.9"** %this.addr, align 8
  store i64* %__x, i64** %__x.addr, align 8
  store i64* %__y, i64** %__y.addr, align 8
  %this1 = load %"struct.std::pair.9"*, %"struct.std::pair.9"** %this.addr, align 8
  %first = getelementptr inbounds %"struct.std::pair.9", %"struct.std::pair.9"* %this1, i32 0, i32 0
  %0 = load i64*, i64** %__x.addr, align 8
  %call = call dereferenceable(8) i64* @_ZSt7forwardIRmEOT_RNSt16remove_referenceIS1_E4typeE(i64* dereferenceable(8) %0) #3
  %1 = load i64, i64* %call, align 8
  store i64 %1, i64* %first, align 8
  %second = getelementptr inbounds %"struct.std::pair.9", %"struct.std::pair.9"* %this1, i32 0, i32 1
  %2 = load i64*, i64** %__y.addr, align 8
  %call2 = call dereferenceable(8) i64* @_ZSt7forwardIRmEOT_RNSt16remove_referenceIS1_E4typeE(i64* dereferenceable(8) %2) #3
  %3 = load i64, i64* %call2, align 8
  store i64 %3, i64* %second, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define dso_local void @setRealFunArg(i8* %funAddr, i8* %toAddr) #5 {
entry:
  %funAddr.addr = alloca i8*, align 8
  %toAddr.addr = alloca i8*, align 8
  %funAddrInt = alloca i64, align 8
  %toAddrInt = alloca i64, align 8
  %shadowAddr = alloca i64, align 8
  %fromReal = alloca %struct.Real*, align 8
  %toReal = alloca %struct.Real*, align 8
  store i8* %funAddr, i8** %funAddr.addr, align 8
  store i8* %toAddr, i8** %toAddr.addr, align 8
  %0 = load i8*, i8** %funAddr.addr, align 8
  %1 = ptrtoint i8* %0 to i64
  store i64 %1, i64* %funAddrInt, align 8
  %2 = load i8*, i8** %toAddr.addr, align 8
  %3 = ptrtoint i8* %2 to i64
  store i64 %3, i64* %toAddrInt, align 8
  %call = call i64 @_ZNKSt3mapImmSt4lessImESaISt4pairIKmmEEE5countERS3_(%"class.std::map"* @shadowFunArgMap, i64* dereferenceable(8) %funAddrInt)
  %cmp = icmp ne i64 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call dereferenceable(8) i64* @_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEE2atERS3_(%"class.std::map"* @shadowFunArgMap, i64* dereferenceable(8) %funAddrInt)
  %4 = load i64, i64* %call1, align 8
  store i64 %4, i64* %shadowAddr, align 8
  %call2 = call dereferenceable(8) %struct.Real** @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE2atERS5_(%"class.std::map.0"* @shadowMap, i64* dereferenceable(8) %shadowAddr)
  %5 = load %struct.Real*, %struct.Real** %call2, align 8
  store %struct.Real* %5, %struct.Real** %fromReal, align 8
  %call3 = call dereferenceable(8) %struct.Real** @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE2atERS5_(%"class.std::map.0"* @shadowMap, i64* dereferenceable(8) %toAddrInt)
  %6 = load %struct.Real*, %struct.Real** %call3, align 8
  store %struct.Real* %6, %struct.Real** %toReal, align 8
  %7 = load %struct.Real*, %struct.Real** %toReal, align 8
  %8 = bitcast %struct.Real* %7 to i8*
  %9 = load %struct.Real*, %struct.Real** %fromReal, align 8
  %10 = bitcast %struct.Real* %9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 8 %10, i64 32, i1 false)
  %call4 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNKSt3mapImmSt4lessImESaISt4pairIKmmEEE5countERS3_(%"class.std::map"* %this, i64* dereferenceable(8) %__x) #5 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::map"*, align 8
  %__x.addr = alloca i64*, align 8
  %coerce = alloca %"struct.std::_Rb_tree_const_iterator.17", align 8
  %ref.tmp = alloca %"struct.std::_Rb_tree_const_iterator.17", align 8
  store %"class.std::map"* %this, %"class.std::map"** %this.addr, align 8
  store i64* %__x, i64** %__x.addr, align 8
  %this1 = load %"class.std::map"*, %"class.std::map"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"class.std::map", %"class.std::map"* %this1, i32 0, i32 0
  %0 = load i64*, i64** %__x.addr, align 8
  %call = call %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE4findERS1_(%"class.std::_Rb_tree"* %_M_t, i64* dereferenceable(8) %0)
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator.17", %"struct.std::_Rb_tree_const_iterator.17"* %coerce, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  %_M_t2 = getelementptr inbounds %"class.std::map", %"class.std::map"* %this1, i32 0, i32 0
  %call3 = call %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE3endEv(%"class.std::_Rb_tree"* %_M_t2) #3
  %coerce.dive4 = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator.17", %"struct.std::_Rb_tree_const_iterator.17"* %ref.tmp, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call3, %"struct.std::_Rb_tree_node_base"** %coerce.dive4, align 8
  %call5 = call zeroext i1 @_ZNKSt23_Rb_tree_const_iteratorISt4pairIKmmEEeqERKS3_(%"struct.std::_Rb_tree_const_iterator.17"* %coerce, %"struct.std::_Rb_tree_const_iterator.17"* dereferenceable(8) %ref.tmp) #3
  %1 = zext i1 %call5 to i64
  %cond = select i1 %call5, i32 0, i32 1
  %conv = sext i32 %cond to i64
  ret i64 %conv
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(8) i64* @_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEE2atERS3_(%"class.std::map"* %this, i64* dereferenceable(8) %__k) #5 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::map"*, align 8
  %__k.addr = alloca i64*, align 8
  %__i = alloca %"struct.std::_Rb_tree_iterator.7", align 8
  %ref.tmp = alloca %"struct.std::_Rb_tree_iterator.7", align 8
  %undef.agg.tmp = alloca %"struct.std::less", align 1
  store %"class.std::map"* %this, %"class.std::map"** %this.addr, align 8
  store i64* %__k, i64** %__k.addr, align 8
  %this1 = load %"class.std::map"*, %"class.std::map"** %this.addr, align 8
  %0 = load i64*, i64** %__k.addr, align 8
  %call = call %"struct.std::_Rb_tree_node_base"* @_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEE11lower_boundERS3_(%"class.std::map"* %this1, i64* dereferenceable(8) %0)
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %__i, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  %call2 = call %"struct.std::_Rb_tree_node_base"* @_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEE3endEv(%"class.std::map"* %this1) #3
  %coerce.dive3 = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %ref.tmp, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call2, %"struct.std::_Rb_tree_node_base"** %coerce.dive3, align 8
  %call4 = call zeroext i1 @_ZNKSt17_Rb_tree_iteratorISt4pairIKmmEEeqERKS3_(%"struct.std::_Rb_tree_iterator.7"* %__i, %"struct.std::_Rb_tree_iterator.7"* dereferenceable(8) %ref.tmp) #3
  br i1 %call4, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  call void @_ZNKSt3mapImmSt4lessImESaISt4pairIKmmEEE8key_compEv(%"class.std::map"* %this1)
  %1 = load i64*, i64** %__k.addr, align 8
  %call5 = call dereferenceable(16) %"struct.std::pair.10"* @_ZNKSt17_Rb_tree_iteratorISt4pairIKmmEEdeEv(%"struct.std::_Rb_tree_iterator.7"* %__i) #3
  %first = getelementptr inbounds %"struct.std::pair.10", %"struct.std::pair.10"* %call5, i32 0, i32 0
  %call6 = call zeroext i1 @_ZNKSt4lessImEclERKmS2_(%"struct.std::less"* %undef.agg.tmp, i64* dereferenceable(8) %1, i64* dereferenceable(8) %first)
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %2 = phi i1 [ true, %entry ], [ %call6, %lor.rhs ]
  br i1 %2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.end
  call void @_ZSt20__throw_out_of_rangePKc(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0)) #14
  unreachable

if.end:                                           ; preds = %lor.end
  %call7 = call dereferenceable(16) %"struct.std::pair.10"* @_ZNKSt17_Rb_tree_iteratorISt4pairIKmmEEdeEv(%"struct.std::_Rb_tree_iterator.7"* %__i) #3
  %second = getelementptr inbounds %"struct.std::pair.10", %"struct.std::pair.10"* %call7, i32 0, i32 1
  ret i64* %second
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #7

; Function Attrs: noinline optnone uwtable
define dso_local void @setRealTemp(i8* %toAddr, i8* %fromAddr) #5 {
entry:
  %toAddr.addr = alloca i8*, align 8
  %fromAddr.addr = alloca i8*, align 8
  %fromAddrInt = alloca i64, align 8
  %toAddrInt = alloca i64, align 8
  %fromReal = alloca %struct.Real*, align 8
  %toReal = alloca %struct.Real*, align 8
  %fromReal6 = alloca %struct.Real*, align 8
  %toReal8 = alloca %struct.Real*, align 8
  %ref.tmp = alloca %"struct.std::pair.5", align 8
  %coerce = alloca %"struct.std::pair", align 8
  store i8* %toAddr, i8** %toAddr.addr, align 8
  store i8* %fromAddr, i8** %fromAddr.addr, align 8
  %0 = load i8*, i8** %fromAddr.addr, align 8
  %1 = ptrtoint i8* %0 to i64
  store i64 %1, i64* %fromAddrInt, align 8
  %2 = load i8*, i8** %toAddr.addr, align 8
  %3 = ptrtoint i8* %2 to i64
  store i64 %3, i64* %toAddrInt, align 8
  %call = call i64 @_ZNKSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE5countERS5_(%"class.std::map.0"* @shadowMap, i64* dereferenceable(8) %toAddrInt)
  %cmp = icmp ne i64 %call, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call1 = call dereferenceable(8) %struct.Real** @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE2atERS5_(%"class.std::map.0"* @shadowMap, i64* dereferenceable(8) %fromAddrInt)
  %4 = load %struct.Real*, %struct.Real** %call1, align 8
  store %struct.Real* %4, %struct.Real** %fromReal, align 8
  %call2 = call dereferenceable(8) %struct.Real** @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE2atERS5_(%"class.std::map.0"* @shadowMap, i64* dereferenceable(8) %toAddrInt)
  %5 = load %struct.Real*, %struct.Real** %call2, align 8
  store %struct.Real* %5, %struct.Real** %toReal, align 8
  %6 = load %struct.Real*, %struct.Real** %toReal, align 8
  %7 = bitcast %struct.Real* %6 to i8*
  %8 = load %struct.Real*, %struct.Real** %fromReal, align 8
  %9 = bitcast %struct.Real* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 8 %9, i64 32, i1 false)
  br label %if.end11

if.else:                                          ; preds = %entry
  %call3 = call i64 @_ZNKSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE5countERS5_(%"class.std::map.0"* @shadowMap, i64* dereferenceable(8) %fromAddrInt)
  %cmp4 = icmp ne i64 %call3, 0
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.else
  %call7 = call dereferenceable(8) %struct.Real** @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE2atERS5_(%"class.std::map.0"* @shadowMap, i64* dereferenceable(8) %fromAddrInt)
  %10 = load %struct.Real*, %struct.Real** %call7, align 8
  store %struct.Real* %10, %struct.Real** %fromReal6, align 8
  %call9 = call i8* @_Znwm(i64 32) #15
  %11 = bitcast i8* %call9 to %struct.Real*
  store %struct.Real* %11, %struct.Real** %toReal8, align 8
  %12 = load %struct.Real*, %struct.Real** %toReal8, align 8
  %mpfr_val = getelementptr inbounds %struct.Real, %struct.Real* %12, i32 0, i32 0
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay, i64 200)
  %13 = load %struct.Real*, %struct.Real** %toReal8, align 8
  %14 = bitcast %struct.Real* %13 to i8*
  %15 = load %struct.Real*, %struct.Real** %fromReal6, align 8
  %16 = bitcast %struct.Real* %15 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %14, i8* align 8 %16, i64 32, i1 false)
  call void @_ZNSt4pairImP4RealEC2IRmRS1_Lb1EEEOT_OT0_(%"struct.std::pair.5"* %ref.tmp, i64* dereferenceable(8) %toAddrInt, %struct.Real** dereferenceable(8) %toReal8)
  %call10 = call { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE6insertIS4_ImS1_EvEES4_ISt17_Rb_tree_iteratorIS6_EbEOT_(%"class.std::map.0"* @shadowMap, %"struct.std::pair.5"* dereferenceable(16) %ref.tmp)
  %17 = bitcast %"struct.std::pair"* %coerce to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %18 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %17, i32 0, i32 0
  %19 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call10, 0
  store %"struct.std::_Rb_tree_node_base"* %19, %"struct.std::_Rb_tree_node_base"** %18, align 8
  %20 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %17, i32 0, i32 1
  %21 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call10, 1
  store i8 %21, i8* %20, align 8
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.else
  br label %if.end11

if.end11:                                         ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline optnone uwtable
define dso_local void @setRealConstant_double(i8* %Addr, double %value) #5 {
entry:
  %Addr.addr = alloca i8*, align 8
  %value.addr = alloca double, align 8
  %AddrInt = alloca i64, align 8
  %real = alloca %struct.Real*, align 8
  %ref.tmp = alloca %"struct.std::pair.5", align 8
  %coerce = alloca %"struct.std::pair", align 8
  store i8* %Addr, i8** %Addr.addr, align 8
  store double %value, double* %value.addr, align 8
  %0 = load i8*, i8** %Addr.addr, align 8
  %1 = ptrtoint i8* %0 to i64
  store i64 %1, i64* %AddrInt, align 8
  %call = call i64 @_ZNKSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE5countERS5_(%"class.std::map.0"* @shadowMap, i64* dereferenceable(8) %AddrInt)
  %tobool = icmp ne i64 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call1 = call i8* @_Znwm(i64 32) #15
  %2 = bitcast i8* %call1 to %struct.Real*
  store %struct.Real* %2, %struct.Real** %real, align 8
  %3 = load %struct.Real*, %struct.Real** %real, align 8
  %mpfr_val = getelementptr inbounds %struct.Real, %struct.Real* %3, i32 0, i32 0
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay, i64 200)
  %4 = load %struct.Real*, %struct.Real** %real, align 8
  %mpfr_val2 = getelementptr inbounds %struct.Real, %struct.Real* %4, i32 0, i32 0
  %arraydecay3 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val2, i32 0, i32 0
  %5 = load double, double* %value.addr, align 8
  %call4 = call i32 @mpfr_set_d(%struct.__mpfr_struct* %arraydecay3, double %5, i32 0)
  call void @_ZNSt4pairImP4RealEC2IRmRS1_Lb1EEEOT_OT0_(%"struct.std::pair.5"* %ref.tmp, i64* dereferenceable(8) %AddrInt, %struct.Real** dereferenceable(8) %real)
  %call5 = call { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE6insertIS4_ImS1_EvEES4_ISt17_Rb_tree_iteratorIS6_EbEOT_(%"class.std::map.0"* @shadowMap, %"struct.std::pair.5"* dereferenceable(16) %ref.tmp)
  %6 = bitcast %"struct.std::pair"* %coerce to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %7 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %6, i32 0, i32 0
  %8 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call5, 0
  store %"struct.std::_Rb_tree_node_base"* %8, %"struct.std::_Rb_tree_node_base"** %7, align 8
  %9 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %6, i32 0, i32 1
  %10 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call5, 1
  store i8 %10, i8* %9, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline optnone uwtable
define dso_local void @setRealConstant_float(i8* %Addr, float %value) #5 {
entry:
  %Addr.addr = alloca i8*, align 8
  %value.addr = alloca float, align 4
  %AddrInt = alloca i64, align 8
  %real = alloca %struct.Real*, align 8
  %ref.tmp = alloca %"struct.std::pair.5", align 8
  %coerce = alloca %"struct.std::pair", align 8
  store i8* %Addr, i8** %Addr.addr, align 8
  store float %value, float* %value.addr, align 4
  %0 = load i8*, i8** %Addr.addr, align 8
  %1 = ptrtoint i8* %0 to i64
  store i64 %1, i64* %AddrInt, align 8
  %call = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0))
  %2 = load i64, i64* %AddrInt, align 8
  %call1 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"* %call, i64 %2)
  %call2 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %call3 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0))
  %3 = load float, float* %value.addr, align 4
  %call4 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEf(%"class.std::basic_ostream"* %call3, float %3)
  %call5 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %call6 = call i64 @_ZNKSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE5countERS5_(%"class.std::map.0"* @shadowMap, i64* dereferenceable(8) %AddrInt)
  %tobool = icmp ne i64 %call6, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call7 = call i8* @_Znwm(i64 32) #15
  %4 = bitcast i8* %call7 to %struct.Real*
  store %struct.Real* %4, %struct.Real** %real, align 8
  %5 = load %struct.Real*, %struct.Real** %real, align 8
  %mpfr_val = getelementptr inbounds %struct.Real, %struct.Real* %5, i32 0, i32 0
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val, i32 0, i32 0
  call void @mpfr_init2(%struct.__mpfr_struct* %arraydecay, i64 200)
  %6 = load %struct.Real*, %struct.Real** %real, align 8
  %mpfr_val8 = getelementptr inbounds %struct.Real, %struct.Real* %6, i32 0, i32 0
  %arraydecay9 = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val8, i32 0, i32 0
  %7 = load float, float* %value.addr, align 4
  %conv = fpext float %7 to double
  %call10 = call i32 @mpfr_set_d(%struct.__mpfr_struct* %arraydecay9, double %conv, i32 0)
  call void @_ZNSt4pairImP4RealEC2IRmRS1_Lb1EEEOT_OT0_(%"struct.std::pair.5"* %ref.tmp, i64* dereferenceable(8) %AddrInt, %struct.Real** dereferenceable(8) %real)
  %call11 = call { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE6insertIS4_ImS1_EvEES4_ISt17_Rb_tree_iteratorIS6_EbEOT_(%"class.std::map.0"* @shadowMap, %"struct.std::pair.5"* dereferenceable(16) %ref.tmp)
  %8 = bitcast %"struct.std::pair"* %coerce to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %9 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %8, i32 0, i32 0
  %10 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call11, 0
  store %"struct.std::_Rb_tree_node_base"* %10, %"struct.std::_Rb_tree_node_base"** %9, align 8
  %11 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %8, i32 0, i32 1
  %12 = extractvalue { %"struct.std::_Rb_tree_node_base"*, i8 } %call11, 1
  store i8 %12, i8* %11, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEm(%"class.std::basic_ostream"*, i64) #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEf(%"class.std::basic_ostream"*, float) #1

; Function Attrs: noinline optnone uwtable
define dso_local double @_Z9getDoubleP4Real(%struct.Real* %real) #5 {
entry:
  %real.addr = alloca %struct.Real*, align 8
  store %struct.Real* %real, %struct.Real** %real.addr, align 8
  %0 = load %struct.Real*, %struct.Real** %real.addr, align 8
  %mpfr_val = getelementptr inbounds %struct.Real, %struct.Real* %0, i32 0, i32 0
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val, i32 0, i32 0
  %call = call double @mpfr_get_d(%struct.__mpfr_struct* %arraydecay, i32 0)
  ret double %call
}

declare dso_local double @mpfr_get_d(%struct.__mpfr_struct*, i32) #1

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z9printRealP4Real(%struct.Real* %real) #5 {
entry:
  %real.addr = alloca %struct.Real*, align 8
  %shadowValStr = alloca i8*, align 8
  %shadowValExpt = alloca i64, align 8
  store %struct.Real* %real, %struct.Real** %real.addr, align 8
  %0 = load %struct.Real*, %struct.Real** %real.addr, align 8
  %mpfr_val = getelementptr inbounds %struct.Real, %struct.Real* %0, i32 0, i32 0
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val, i32 0, i32 0
  %call = call i8* @mpfr_get_str(i8* null, i64* %shadowValExpt, i32 10, i64 15, %struct.__mpfr_struct* %arraydecay, i32 0)
  store i8* %call, i8** %shadowValStr, align 8
  %1 = load i8*, i8** %shadowValStr, align 8
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %3 = load i8*, i8** %shadowValStr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 1
  %4 = load i64, i64* %shadowValExpt, align 8
  %sub = sub nsw i64 %4, 1
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i32 0, i32 0), i32 %conv, i8* %add.ptr, i64 %sub)
  %5 = load i8*, i8** %shadowValStr, align 8
  call void @mpfr_free_str(i8* %5)
  ret void
}

declare dso_local i8* @mpfr_get_str(i8*, i64*, i32, i64, %struct.__mpfr_struct*, i32) #1

declare dso_local i32 @printf(i8*, ...) #1

declare dso_local void @mpfr_free_str(i8*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @_Z4ulpddd(double %x, double %y) #4 {
entry:
  %retval = alloca i64, align 8
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %xx = alloca i64, align 8
  %yy = alloca i64, align 8
  store double %x, double* %x.addr, align 8
  store double %y, double* %y.addr, align 8
  %0 = load double, double* %x.addr, align 8
  %cmp = fcmp oeq double %0, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store double 0.000000e+00, double* %x.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load double, double* %y.addr, align 8
  %cmp1 = fcmp oeq double %1, 0.000000e+00
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store double 0.000000e+00, double* %y.addr, align 8
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %2 = load double, double* %x.addr, align 8
  %3 = load double, double* %x.addr, align 8
  %cmp4 = fcmp une double %2, %3
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  store i64 -2, i64* %retval, align 8
  br label %return

if.end6:                                          ; preds = %if.end3
  %4 = load double, double* %y.addr, align 8
  %5 = load double, double* %y.addr, align 8
  %cmp7 = fcmp une double %4, %5
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  store i64 -2, i64* %retval, align 8
  br label %return

if.end9:                                          ; preds = %if.end6
  %6 = bitcast double* %x.addr to i64*
  %7 = load i64, i64* %6, align 8
  store i64 %7, i64* %xx, align 8
  %8 = load i64, i64* %xx, align 8
  %cmp10 = icmp slt i64 %8, 0
  br i1 %cmp10, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end9
  %9 = load i64, i64* %xx, align 8
  %sub = sub nsw i64 -9223372036854775808, %9
  br label %cond.end

cond.false:                                       ; preds = %if.end9
  %10 = load i64, i64* %xx, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub, %cond.true ], [ %10, %cond.false ]
  store i64 %cond, i64* %xx, align 8
  %11 = bitcast double* %y.addr to i64*
  %12 = load i64, i64* %11, align 8
  store i64 %12, i64* %yy, align 8
  %13 = load i64, i64* %yy, align 8
  %cmp11 = icmp slt i64 %13, 0
  br i1 %cmp11, label %cond.true12, label %cond.false14

cond.true12:                                      ; preds = %cond.end
  %14 = load i64, i64* %yy, align 8
  %sub13 = sub nsw i64 -9223372036854775808, %14
  br label %cond.end15

cond.false14:                                     ; preds = %cond.end
  %15 = load i64, i64* %yy, align 8
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false14, %cond.true12
  %cond16 = phi i64 [ %sub13, %cond.true12 ], [ %15, %cond.false14 ]
  store i64 %cond16, i64* %yy, align 8
  %16 = load i64, i64* %xx, align 8
  %17 = load i64, i64* %yy, align 8
  %cmp17 = icmp sge i64 %16, %17
  br i1 %cmp17, label %cond.true18, label %cond.false20

cond.true18:                                      ; preds = %cond.end15
  %18 = load i64, i64* %xx, align 8
  %19 = load i64, i64* %yy, align 8
  %sub19 = sub nsw i64 %18, %19
  br label %cond.end22

cond.false20:                                     ; preds = %cond.end15
  %20 = load i64, i64* %yy, align 8
  %21 = load i64, i64* %xx, align 8
  %sub21 = sub nsw i64 %20, %21
  br label %cond.end22

cond.end22:                                       ; preds = %cond.false20, %cond.true18
  %cond23 = phi i64 [ %sub19, %cond.true18 ], [ %sub21, %cond.false20 ]
  store i64 %cond23, i64* %retval, align 8
  br label %return

return:                                           ; preds = %cond.end22, %if.then8, %if.then5
  %22 = load i64, i64* %retval, align 8
  ret i64 %22
}

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z7ppFloatd(double %val) #5 {
entry:
  %val.addr = alloca double, align 8
  %i = alloca i32, align 4
  store double %val, double* %val.addr, align 8
  store i32 0, i32* %i, align 4
  %0 = load double, double* %val.addr, align 8
  %1 = load double, double* %val.addr, align 8
  %cmp = fcmp une double %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0))
  br label %if.end52

if.else:                                          ; preds = %entry
  %2 = load double, double* %val.addr, align 8
  %cmp1 = fcmp oeq double %2, 0x7FF0000000000000
  br i1 %cmp1, label %if.then2, label %if.else4

if.then2:                                         ; preds = %if.else
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i32 0, i32 0))
  br label %if.end51

if.else4:                                         ; preds = %if.else
  %3 = load double, double* %val.addr, align 8
  %cmp5 = fcmp oeq double %3, 0xFFF0000000000000
  br i1 %cmp5, label %if.then6, label %if.else8

if.then6:                                         ; preds = %if.else4
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i32 0, i32 0))
  br label %if.end50

if.else8:                                         ; preds = %if.else4
  %4 = load double, double* %val.addr, align 8
  %cmp9 = fcmp ogt double %4, 0.000000e+00
  br i1 %cmp9, label %land.lhs.true, label %if.else14

land.lhs.true:                                    ; preds = %if.else8
  %5 = load double, double* %val.addr, align 8
  %cmp10 = fcmp olt double %5, 1.000000e+00
  br i1 %cmp10, label %if.then11, label %if.else14

if.then11:                                        ; preds = %land.lhs.true
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then11
  %6 = load double, double* %val.addr, align 8
  %cmp12 = fcmp olt double %6, 1.000000e+00
  br i1 %cmp12, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load double, double* %val.addr, align 8
  %mul = fmul double %7, 1.000000e+01
  store double %mul, double* %val.addr, align 8
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %9 = load double, double* %val.addr, align 8
  %10 = load i32, i32* %i, align 4
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), double %9, i32 %10)
  br label %if.end49

if.else14:                                        ; preds = %land.lhs.true, %if.else8
  %11 = load double, double* %val.addr, align 8
  %cmp15 = fcmp olt double %11, 0.000000e+00
  br i1 %cmp15, label %land.lhs.true16, label %if.else26

land.lhs.true16:                                  ; preds = %if.else14
  %12 = load double, double* %val.addr, align 8
  %cmp17 = fcmp ogt double %12, -1.000000e+00
  br i1 %cmp17, label %if.then18, label %if.else26

if.then18:                                        ; preds = %land.lhs.true16
  br label %while.cond19

while.cond19:                                     ; preds = %while.body21, %if.then18
  %13 = load double, double* %val.addr, align 8
  %cmp20 = fcmp ogt double %13, -1.000000e+00
  br i1 %cmp20, label %while.body21, label %while.end24

while.body21:                                     ; preds = %while.cond19
  %14 = load double, double* %val.addr, align 8
  %mul22 = fmul double %14, 1.000000e+01
  store double %mul22, double* %val.addr, align 8
  %15 = load i32, i32* %i, align 4
  %inc23 = add nsw i32 %15, 1
  store i32 %inc23, i32* %i, align 4
  br label %while.cond19

while.end24:                                      ; preds = %while.cond19
  %16 = load double, double* %val.addr, align 8
  %17 = load i32, i32* %i, align 4
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), double %16, i32 %17)
  br label %if.end48

if.else26:                                        ; preds = %land.lhs.true16, %if.else14
  %18 = load double, double* %val.addr, align 8
  %cmp27 = fcmp oge double %18, 0x4023FFFFFCA501AD
  br i1 %cmp27, label %if.then28, label %if.else35

if.then28:                                        ; preds = %if.else26
  br label %while.cond29

while.cond29:                                     ; preds = %while.body31, %if.then28
  %19 = load double, double* %val.addr, align 8
  %cmp30 = fcmp oge double %19, 0x4023FFFFFCA501AD
  br i1 %cmp30, label %while.body31, label %while.end33

while.body31:                                     ; preds = %while.cond29
  %20 = load double, double* %val.addr, align 8
  %div = fdiv double %20, 1.000000e+01
  store double %div, double* %val.addr, align 8
  %21 = load i32, i32* %i, align 4
  %inc32 = add nsw i32 %21, 1
  store i32 %inc32, i32* %i, align 4
  br label %while.cond29

while.end33:                                      ; preds = %while.cond29
  %22 = load double, double* %val.addr, align 8
  %23 = load i32, i32* %i, align 4
  %call34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0), double %22, i32 %23)
  br label %if.end47

if.else35:                                        ; preds = %if.else26
  %24 = load double, double* %val.addr, align 8
  %cmp36 = fcmp ole double %24, 0xC023FFFFFCA501AD
  br i1 %cmp36, label %if.then37, label %if.else45

if.then37:                                        ; preds = %if.else35
  br label %while.cond38

while.cond38:                                     ; preds = %while.body40, %if.then37
  %25 = load double, double* %val.addr, align 8
  %cmp39 = fcmp ole double %25, 0xC023FFFFFCA501AD
  br i1 %cmp39, label %while.body40, label %while.end43

while.body40:                                     ; preds = %while.cond38
  %26 = load double, double* %val.addr, align 8
  %div41 = fdiv double %26, 1.000000e+01
  store double %div41, double* %val.addr, align 8
  %27 = load i32, i32* %i, align 4
  %inc42 = add nsw i32 %27, 1
  store i32 %inc42, i32* %i, align 4
  br label %while.cond38

while.end43:                                      ; preds = %while.cond38
  %28 = load double, double* %val.addr, align 8
  %29 = load i32, i32* %i, align 4
  %call44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0), double %28, i32 %29)
  br label %if.end

if.else45:                                        ; preds = %if.else35
  %30 = load double, double* %val.addr, align 8
  %call46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0), double %30)
  br label %if.end

if.end:                                           ; preds = %if.else45, %while.end43
  br label %if.end47

if.end47:                                         ; preds = %if.end, %while.end33
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %while.end24
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %while.end
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %if.then6
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.then2
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.then
  ret void
}

; Function Attrs: noinline optnone uwtable
define dso_local double @_Z11updateErrorP4Reald(%struct.Real* %realVal, double %computedVal) #5 {
entry:
  %realVal.addr = alloca %struct.Real*, align 8
  %computedVal.addr = alloca double, align 8
  %shadowRounded = alloca double, align 8
  %ulpsError = alloca i64, align 8
  %bitsError = alloca double, align 8
  store %struct.Real* %realVal, %struct.Real** %realVal.addr, align 8
  store double %computedVal, double* %computedVal.addr, align 8
  %0 = load %struct.Real*, %struct.Real** %realVal.addr, align 8
  %call = call double @_Z9getDoubleP4Real(%struct.Real* %0)
  store double %call, double* %shadowRounded, align 8
  %1 = load double, double* %shadowRounded, align 8
  %2 = load double, double* %computedVal.addr, align 8
  %call1 = call i64 @_Z4ulpddd(double %1, double %2)
  store i64 %call1, i64* %ulpsError, align 8
  %3 = load i64, i64* %ulpsError, align 8
  %add = add i64 %3, 1
  %call2 = call double @_ZSt4log2ImEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_(i64 %add)
  store double %call2, double* %bitsError, align 8
  %4 = load double, double* %shadowRounded, align 8
  %5 = load double, double* %shadowRounded, align 8
  %cmp = fcmp une double %4, %5
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.14, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.15, i32 0, i32 0))
  %6 = load double, double* %shadowRounded, align 8
  call void @_Z7ppFloatd(double %6)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %7 = load double, double* %computedVal.addr, align 8
  %8 = load double, double* %computedVal.addr, align 8
  %cmp5 = fcmp une double %7, %8
  br i1 %cmp5, label %if.then6, label %if.else8

if.then6:                                         ; preds = %if.end
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.16, i32 0, i32 0))
  br label %if.end11

if.else8:                                         ; preds = %if.end
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0))
  %9 = load double, double* %computedVal.addr, align 8
  call void @_Z7ppFloatd(double %9)
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.18, i32 0, i32 0))
  br label %if.end11

if.end11:                                         ; preds = %if.else8, %if.then6
  %10 = load double, double* %bitsError, align 8
  %11 = load i64, i64* %ulpsError, align 8
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.19, i32 0, i32 0), double %10, i64 %11)
  %12 = load double, double* %bitsError, align 8
  ret double %12
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local double @_ZSt4log2ImEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_(i64 %__x) #4 comdat {
entry:
  %__x.addr = alloca i64, align 8
  store i64 %__x, i64* %__x.addr, align 8
  %0 = load i64, i64* %__x.addr, align 8
  %conv = uitofp i64 %0 to double
  %call = call double @log2(double %conv) #3
  ret double %call
}

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z10printErrormd(i64 %result_A, double %y) #5 {
entry:
  %result_A.addr = alloca i64, align 8
  %y.addr = alloca double, align 8
  %resReal = alloca %struct.Real*, align 8
  %ulpsError = alloca double, align 8
  store i64 %result_A, i64* %result_A.addr, align 8
  store double %y, double* %y.addr, align 8
  %call = call i64 @_ZNKSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE5countERS5_(%"class.std::map.0"* @shadowMap, i64* dereferenceable(8) %result_A.addr)
  %cmp = icmp ne i64 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call dereferenceable(8) %struct.Real** @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE2atERS5_(%"class.std::map.0"* @shadowMap, i64* dereferenceable(8) %result_A.addr)
  %0 = load %struct.Real*, %struct.Real** %call1, align 8
  store %struct.Real* %0, %struct.Real** %resReal, align 8
  %call2 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.20, i32 0, i32 0))
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %2 = load %struct.Real*, %struct.Real** %resReal, align 8
  %mpfr_val = getelementptr inbounds %struct.Real, %struct.Real* %2, i32 0, i32 0
  %arraydecay = getelementptr inbounds [1 x %struct.__mpfr_struct], [1 x %struct.__mpfr_struct]* %mpfr_val, i32 0, i32 0
  %call3 = call i64 @__gmpfr_out_str(%struct._IO_FILE* %1, i32 10, i64 0, %struct.__mpfr_struct* %arraydecay, i32 3)
  %call4 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %3 = load %struct.Real*, %struct.Real** %resReal, align 8
  %4 = load double, double* %y.addr, align 8
  %call5 = call double @_Z11updateErrorP4Reald(%struct.Real* %3, double %4)
  store double %call5, double* %ulpsError, align 8
  %call6 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.21, i32 0, i32 0))
  %5 = load double, double* %ulpsError, align 8
  %call7 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* %call6, double %5)
  %call8 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare dso_local i64 @__gmpfr_out_str(%struct._IO_FILE*, i32, i64, %struct.__mpfr_struct*, i32) #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"*, double) #1

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z5calcYf(float %x) #5 {
entry:
  %x.addr = alloca float, align 4
  %result = alloca float, align 4
  %result_A = alloca i64, align 8
  %0 = bitcast float* %x.addr to i8*
  %1 = bitcast void (float)* @_Z5calcYf to i8*
  call void @setRealTemp(i8* %1, i8* %0)
  store float %x, float* %x.addr, align 4
  %2 = load float, float* %x.addr, align 4
  %3 = bitcast float 2.000000e+00 to float
  %4 = bitcast float* %x.addr to i8*
  %5 = call i8* bitcast (i8* (i64, float, i8*)* @handleOp_2_f to i8* (i32, float, i8*)*)(i32 16, float %3, i8* %4)
  %mul = fmul float 2.000000e+00, %2
  %6 = bitcast float* %result to i8*
  %7 = bitcast i8* %5 to i8*
  call void @setRealTemp(i8* %6, i8* %7)
  store float %mul, float* %result, align 4
  %8 = ptrtoint float* %result to i64
  %9 = bitcast i64* %result_A to i8*
  store i64 %8, i64* %result_A, align 8
  %10 = load float, float* %result, align 4
  %conv = fpext float %10 to double
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.22, i32 0, i32 0), double %conv)
  %11 = load i64, i64* %result_A, align 8
  %12 = load float, float* %result, align 4
  %conv1 = fpext float %12 to double
  %13 = bitcast void (i64, double)* @_Z10printErrormd to i8*
  %14 = bitcast i64* %result_A to i8*
  call void @addFunArg(i8* %13, i8* %14)
  call void @_Z10printErrormd(i64 %11, double %conv1)
  ret void
}

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main() #8 {
entry:
  %e = alloca float, align 4
  %x = alloca float, align 4
  %y = alloca float, align 4
  %more = alloca float, align 4
  %diffe = alloca float, align 4
  %diff0 = alloca float, align 4
  %zero = alloca float, align 4
  %0 = bitcast float* %e to i8*
  call void @setRealConstant_float(i8* %0, float 0x3E701B2B20000000)
  store float 0x3E701B2B20000000, float* %e, align 4
  %1 = bitcast float* %x to i8*
  call void @setRealConstant_float(i8* %1, float 5.000000e-01)
  store float 5.000000e-01, float* %x, align 4
  %2 = load float, float* %x, align 4
  %3 = bitcast float 1.000000e+00 to float
  %4 = bitcast float* %x to i8*
  %5 = call i8* bitcast (i8* (i64, float, i8*)* @handleOp_2_f to i8* (i32, float, i8*)*)(i32 12, float %3, i8* %4)
  %add = fadd float 1.000000e+00, %2
  %6 = bitcast float* %y to i8*
  %7 = bitcast i8* %5 to i8*
  call void @setRealTemp(i8* %6, i8* %7)
  store float %add, float* %y, align 4
  %8 = load float, float* %y, align 4
  %9 = load float, float* %e, align 4
  %10 = bitcast float* %y to i8*
  %11 = bitcast float* %e to i8*
  %12 = call i8* bitcast (i8* (i64, i8*, i8*)* @handleOp_1 to i8* (i32, i8*, i8*)*)(i32 12, i8* %10, i8* %11)
  %add1 = fadd float %8, %9
  %13 = bitcast float* %more to i8*
  %14 = bitcast i8* %12 to i8*
  call void @setRealTemp(i8* %13, i8* %14)
  store float %add1, float* %more, align 4
  %15 = load float, float* %more, align 4
  %16 = load float, float* %y, align 4
  %17 = bitcast float* %more to i8*
  %18 = bitcast float* %y to i8*
  %19 = call i8* bitcast (i8* (i64, i8*, i8*)* @handleOp_1 to i8* (i32, i8*, i8*)*)(i32 14, i8* %17, i8* %18)
  %sub = fsub float %15, %16
  %20 = bitcast float* %diffe to i8*
  %21 = bitcast i8* %19 to i8*
  call void @setRealTemp(i8* %20, i8* %21)
  store float %sub, float* %diffe, align 4
  %22 = load float, float* %diffe, align 4
  %23 = load float, float* %e, align 4
  %24 = bitcast float* %diffe to i8*
  %25 = bitcast float* %e to i8*
  %26 = call i8* bitcast (i8* (i64, i8*, i8*)* @handleOp_1 to i8* (i32, i8*, i8*)*)(i32 14, i8* %24, i8* %25)
  %sub2 = fsub float %22, %23
  %27 = bitcast float* %diff0 to i8*
  %28 = bitcast i8* %26 to i8*
  call void @setRealTemp(i8* %27, i8* %28)
  store float %sub2, float* %diff0, align 4
  %29 = load float, float* %diff0, align 4
  %30 = load float, float* %diff0, align 4
  %31 = bitcast float* %diff0 to i8*
  %32 = bitcast float* %diff0 to i8*
  %33 = call i8* bitcast (i8* (i64, i8*, i8*)* @handleOp_1 to i8* (i32, i8*, i8*)*)(i32 12, i8* %31, i8* %32)
  %add3 = fadd float %29, %30
  %34 = bitcast float* %zero to i8*
  %35 = bitcast i8* %33 to i8*
  call void @setRealTemp(i8* %34, i8* %35)
  store float %add3, float* %zero, align 4
  %36 = load float, float* %zero, align 4
  %conv = fpext float %36 to double
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.23, i32 0, i32 0), double %conv)
  %37 = load float, float* %zero, align 4
  %38 = bitcast void (float)* @_Z5calcYf to i8*
  %39 = bitcast float* %zero to i8*
  call void @addFunArg(i8* %38, i8* %39)
  call void @_Z5calcYf(float %37)
  %40 = load float, float* %zero, align 4
  %conv4 = fpext float %40 to double
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.23, i32 0, i32 0), double %conv4)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EED2Ev(%"class.std::_Rb_tree"* %this) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %call = call %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_M_beginEv(%"class.std::_Rb_tree"* %this1) #3
  invoke void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E(%"class.std::_Rb_tree"* %this1, %"struct.std::_Rb_tree_node"* %call)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  call void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE13_Rb_tree_implIS6_Lb1EED2Ev(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl) #3
  ret void

lpad:                                             ; preds = %entry
  %0 = landingpad { i8*, i32 }
          catch i8* null
  %1 = extractvalue { i8*, i32 } %0, 0
  store i8* %1, i8** %exn.slot, align 8
  %2 = extractvalue { i8*, i32 } %0, 1
  store i32 %2, i32* %ehselector.slot, align 4
  %_M_impl2 = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  call void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE13_Rb_tree_implIS6_Lb1EED2Ev(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl2) #3
  br label %terminate.handler

terminate.handler:                                ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  call void @__clang_call_terminate(i8* %exn) #13
  unreachable
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E(%"class.std::_Rb_tree"* %this, %"struct.std::_Rb_tree_node"* %__x) #5 comdat align 2 {
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
  %call = call %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_S_rightEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %2) #3
  call void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E(%"class.std::_Rb_tree"* %this1, %"struct.std::_Rb_tree_node"* %call)
  %3 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %4 = bitcast %"struct.std::_Rb_tree_node"* %3 to %"struct.std::_Rb_tree_node_base"*
  %call2 = call %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE7_S_leftEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %4) #3
  store %"struct.std::_Rb_tree_node"* %call2, %"struct.std::_Rb_tree_node"** %__y, align 8
  %5 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  call void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE12_M_drop_nodeEPSt13_Rb_tree_nodeIS2_E(%"class.std::_Rb_tree"* %this1, %"struct.std::_Rb_tree_node"* %5) #3
  %6 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__y, align 8
  store %"struct.std::_Rb_tree_node"* %6, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_M_beginEv(%"class.std::_Rb_tree"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 1
  %_M_parent = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %_M_header, i32 0, i32 1
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_parent, align 8
  %1 = bitcast %"struct.std::_Rb_tree_node_base"* %0 to %"struct.std::_Rb_tree_node"*
  ret %"struct.std::_Rb_tree_node"* %1
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE13_Rb_tree_implIS6_Lb1EED2Ev(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"*, align 8
  store %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"*, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"** %this.addr, align 8
  %0 = bitcast %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this1 to %"class.std::allocator"*
  call void @_ZNSaISt13_Rb_tree_nodeISt4pairIKmmEEED2Ev(%"class.std::allocator"* %0) #3
  ret void
}

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #9 comdat {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #3
  call void @_ZSt9terminatev() #13
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_S_rightEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x) #4 comdat align 2 {
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
define linkonce_odr dso_local %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE7_S_leftEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x) #4 comdat align 2 {
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
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE12_M_drop_nodeEPSt13_Rb_tree_nodeIS2_E(%"class.std::_Rb_tree"* %this, %"struct.std::_Rb_tree_node"* %__p) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %__p.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node"* %__p, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  call void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE15_M_destroy_nodeEPSt13_Rb_tree_nodeIS2_E(%"class.std::_Rb_tree"* %this1, %"struct.std::_Rb_tree_node"* %0) #3
  %1 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  call void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE11_M_put_nodeEPSt13_Rb_tree_nodeIS2_E(%"class.std::_Rb_tree"* %this1, %"struct.std::_Rb_tree_node"* %1) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE15_M_destroy_nodeEPSt13_Rb_tree_nodeIS2_E(%"class.std::_Rb_tree"* %this, %"struct.std::_Rb_tree_node"* %__p) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %__p.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node"* %__p, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %call = call dereferenceable(1) %"class.std::allocator"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE21_M_get_Node_allocatorEv(%"class.std::_Rb_tree"* %this1) #3
  %0 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  %call2 = invoke %"struct.std::pair.10"* @_ZNSt13_Rb_tree_nodeISt4pairIKmmEE9_M_valptrEv(%"struct.std::_Rb_tree_node"* %0)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  invoke void @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmmEEEE7destroyIS3_EEvRS5_PT_(%"class.std::allocator"* dereferenceable(1) %call, %"struct.std::pair.10"* %call2)
          to label %invoke.cont3 unwind label %terminate.lpad

invoke.cont3:                                     ; preds = %invoke.cont
  %1 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  ret void

terminate.lpad:                                   ; preds = %invoke.cont, %entry
  %2 = landingpad { i8*, i32 }
          catch i8* null
  %3 = extractvalue { i8*, i32 } %2, 0
  call void @__clang_call_terminate(i8* %3) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE11_M_put_nodeEPSt13_Rb_tree_nodeIS2_E(%"class.std::_Rb_tree"* %this, %"struct.std::_Rb_tree_node"* %__p) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %__p.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node"* %__p, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %call = call dereferenceable(1) %"class.std::allocator"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE21_M_get_Node_allocatorEv(%"class.std::_Rb_tree"* %this1) #3
  %0 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__p.addr, align 8
  invoke void @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmmEEEE10deallocateERS5_PS4_m(%"class.std::allocator"* dereferenceable(1) %call, %"struct.std::_Rb_tree_node"* %0, i64 1)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  ret void

terminate.lpad:                                   ; preds = %entry
  %1 = landingpad { i8*, i32 }
          catch i8* null
  %2 = extractvalue { i8*, i32 } %1, 0
  call void @__clang_call_terminate(i8* %2) #13
  unreachable
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmmEEEE7destroyIS3_EEvRS5_PT_(%"class.std::allocator"* dereferenceable(1) %__a, %"struct.std::pair.10"* %__p) #5 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator"*, align 8
  %__p.addr = alloca %"struct.std::pair.10"*, align 8
  store %"class.std::allocator"* %__a, %"class.std::allocator"** %__a.addr, align 8
  store %"struct.std::pair.10"* %__p, %"struct.std::pair.10"** %__p.addr, align 8
  %0 = load %"class.std::allocator"*, %"class.std::allocator"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator"* %0 to %"class.__gnu_cxx::new_allocator"*
  %2 = load %"struct.std::pair.10"*, %"struct.std::pair.10"** %__p.addr, align 8
  call void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEE7destroyIS4_EEvPT_(%"class.__gnu_cxx::new_allocator"* %1, %"struct.std::pair.10"* %2)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(1) %"class.std::allocator"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE21_M_get_Node_allocatorEv(%"class.std::_Rb_tree"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %0 = bitcast %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl to %"class.std::allocator"*
  ret %"class.std::allocator"* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::pair.10"* @_ZNSt13_Rb_tree_nodeISt4pairIKmmEE9_M_valptrEv(%"struct.std::_Rb_tree_node"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  store %"struct.std::_Rb_tree_node"* %this, %"struct.std::_Rb_tree_node"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %this.addr, align 8
  %_M_storage = getelementptr inbounds %"struct.std::_Rb_tree_node", %"struct.std::_Rb_tree_node"* %this1, i32 0, i32 1
  %call = call %"struct.std::pair.10"* @_ZN9__gnu_cxx16__aligned_membufISt4pairIKmmEE6_M_ptrEv(%"struct.__gnu_cxx::__aligned_membuf"* %_M_storage) #3
  ret %"struct.std::pair.10"* %call
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEE7destroyIS4_EEvPT_(%"class.__gnu_cxx::new_allocator"* %this, %"struct.std::pair.10"* %__p) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %__p.addr = alloca %"struct.std::pair.10"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  store %"struct.std::pair.10"* %__p, %"struct.std::pair.10"** %__p.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %0 = load %"struct.std::pair.10"*, %"struct.std::pair.10"** %__p.addr, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::pair.10"* @_ZN9__gnu_cxx16__aligned_membufISt4pairIKmmEE6_M_ptrEv(%"struct.__gnu_cxx::__aligned_membuf"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.__gnu_cxx::__aligned_membuf"*, align 8
  store %"struct.__gnu_cxx::__aligned_membuf"* %this, %"struct.__gnu_cxx::__aligned_membuf"** %this.addr, align 8
  %this1 = load %"struct.__gnu_cxx::__aligned_membuf"*, %"struct.__gnu_cxx::__aligned_membuf"** %this.addr, align 8
  %call = call i8* @_ZN9__gnu_cxx16__aligned_membufISt4pairIKmmEE7_M_addrEv(%"struct.__gnu_cxx::__aligned_membuf"* %this1) #3
  %0 = bitcast i8* %call to %"struct.std::pair.10"*
  ret %"struct.std::pair.10"* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i8* @_ZN9__gnu_cxx16__aligned_membufISt4pairIKmmEE7_M_addrEv(%"struct.__gnu_cxx::__aligned_membuf"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.__gnu_cxx::__aligned_membuf"*, align 8
  store %"struct.__gnu_cxx::__aligned_membuf"* %this, %"struct.__gnu_cxx::__aligned_membuf"** %this.addr, align 8
  %this1 = load %"struct.__gnu_cxx::__aligned_membuf"*, %"struct.__gnu_cxx::__aligned_membuf"** %this.addr, align 8
  %_M_storage = getelementptr inbounds %"struct.__gnu_cxx::__aligned_membuf", %"struct.__gnu_cxx::__aligned_membuf"* %this1, i32 0, i32 0
  %0 = bitcast [16 x i8]* %_M_storage to i8*
  ret i8* %0
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmmEEEE10deallocateERS5_PS4_m(%"class.std::allocator"* dereferenceable(1) %__a, %"struct.std::_Rb_tree_node"* %__p, i64 %__n) #5 comdat align 2 {
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
  call void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEE10deallocateEPS5_m(%"class.__gnu_cxx::new_allocator"* %1, %"struct.std::_Rb_tree_node"* %2, i64 %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEE10deallocateEPS5_m(%"class.__gnu_cxx::new_allocator"* %this, %"struct.std::_Rb_tree_node"* %__p, i64) #4 comdat align 2 {
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
declare dso_local void @_ZdlPv(i8*) #10

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSaISt13_Rb_tree_nodeISt4pairIKmmEEED2Ev(%"class.std::allocator"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %this, %"class.std::allocator"** %this.addr, align 8
  %this1 = load %"class.std::allocator"*, %"class.std::allocator"** %this.addr, align 8
  %0 = bitcast %"class.std::allocator"* %this1 to %"class.__gnu_cxx::new_allocator"*
  call void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEED2Ev(%"class.__gnu_cxx::new_allocator"* %0) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEED2Ev(%"class.__gnu_cxx::new_allocator"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EED2Ev(%"class.std::_Rb_tree.1"* %this) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %call = call %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_beginEv(%"class.std::_Rb_tree.1"* %this1) #3
  invoke void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree.1"* %this1, %"struct.std::_Rb_tree_node.11"* %call)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EED2Ev(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl) #3
  ret void

lpad:                                             ; preds = %entry
  %0 = landingpad { i8*, i32 }
          catch i8* null
  %1 = extractvalue { i8*, i32 } %0, 0
  store i8* %1, i8** %exn.slot, align 8
  %2 = extractvalue { i8*, i32 } %0, 1
  store i32 %2, i32* %ehselector.slot, align 4
  %_M_impl2 = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EED2Ev(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl2) #3
  br label %terminate.handler

terminate.handler:                                ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  call void @__clang_call_terminate(i8* %exn) #13
  unreachable
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree.1"* %this, %"struct.std::_Rb_tree_node.11"* %__x) #5 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  %__y = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node.11"* %__x, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %cmp = icmp ne %"struct.std::_Rb_tree_node.11"* %0, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %2 = bitcast %"struct.std::_Rb_tree_node.11"* %1 to %"struct.std::_Rb_tree_node_base"*
  %call = call %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_S_rightEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %2) #3
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree.1"* %this1, %"struct.std::_Rb_tree_node.11"* %call)
  %3 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %4 = bitcast %"struct.std::_Rb_tree_node.11"* %3 to %"struct.std::_Rb_tree_node_base"*
  %call2 = call %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE7_S_leftEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %4) #3
  store %"struct.std::_Rb_tree_node.11"* %call2, %"struct.std::_Rb_tree_node.11"** %__y, align 8
  %5 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE12_M_drop_nodeEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree.1"* %this1, %"struct.std::_Rb_tree_node.11"* %5) #3
  %6 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__y, align 8
  store %"struct.std::_Rb_tree_node.11"* %6, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_beginEv(%"class.std::_Rb_tree.1"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 1
  %_M_parent = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %_M_header, i32 0, i32 1
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_parent, align 8
  %1 = bitcast %"struct.std::_Rb_tree_node_base"* %0 to %"struct.std::_Rb_tree_node.11"*
  ret %"struct.std::_Rb_tree_node.11"* %1
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EED2Ev(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"*, align 8
  store %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"*, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"** %this.addr, align 8
  %0 = bitcast %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this1 to %"class.std::allocator.2"*
  call void @_ZNSaISt13_Rb_tree_nodeISt4pairIKmP4RealEEED2Ev(%"class.std::allocator.2"* %0) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_S_rightEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x) #4 comdat align 2 {
entry:
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  store %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %_M_right = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %0, i32 0, i32 3
  %1 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_right, align 8
  %2 = bitcast %"struct.std::_Rb_tree_node_base"* %1 to %"struct.std::_Rb_tree_node.11"*
  ret %"struct.std::_Rb_tree_node.11"* %2
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE7_S_leftEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x) #4 comdat align 2 {
entry:
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  store %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %_M_left = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %0, i32 0, i32 2
  %1 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_left, align 8
  %2 = bitcast %"struct.std::_Rb_tree_node_base"* %1 to %"struct.std::_Rb_tree_node.11"*
  ret %"struct.std::_Rb_tree_node.11"* %2
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE12_M_drop_nodeEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree.1"* %this, %"struct.std::_Rb_tree_node.11"* %__p) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  %__p.addr = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node.11"* %__p, %"struct.std::_Rb_tree_node.11"** %__p.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__p.addr, align 8
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE15_M_destroy_nodeEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree.1"* %this1, %"struct.std::_Rb_tree_node.11"* %0) #3
  %1 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__p.addr, align 8
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11_M_put_nodeEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree.1"* %this1, %"struct.std::_Rb_tree_node.11"* %1) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE15_M_destroy_nodeEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree.1"* %this, %"struct.std::_Rb_tree_node.11"* %__p) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  %__p.addr = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node.11"* %__p, %"struct.std::_Rb_tree_node.11"** %__p.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %call = call dereferenceable(1) %"class.std::allocator.2"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE21_M_get_Node_allocatorEv(%"class.std::_Rb_tree.1"* %this1) #3
  %0 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__p.addr, align 8
  %call2 = invoke %"struct.std::pair.13"* @_ZNSt13_Rb_tree_nodeISt4pairIKmP4RealEE9_M_valptrEv(%"struct.std::_Rb_tree_node.11"* %0)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  invoke void @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEE7destroyIS5_EEvRS7_PT_(%"class.std::allocator.2"* dereferenceable(1) %call, %"struct.std::pair.13"* %call2)
          to label %invoke.cont3 unwind label %terminate.lpad

invoke.cont3:                                     ; preds = %invoke.cont
  %1 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__p.addr, align 8
  ret void

terminate.lpad:                                   ; preds = %invoke.cont, %entry
  %2 = landingpad { i8*, i32 }
          catch i8* null
  %3 = extractvalue { i8*, i32 } %2, 0
  call void @__clang_call_terminate(i8* %3) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11_M_put_nodeEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree.1"* %this, %"struct.std::_Rb_tree_node.11"* %__p) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  %__p.addr = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node.11"* %__p, %"struct.std::_Rb_tree_node.11"** %__p.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %call = call dereferenceable(1) %"class.std::allocator.2"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE21_M_get_Node_allocatorEv(%"class.std::_Rb_tree.1"* %this1) #3
  %0 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__p.addr, align 8
  invoke void @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEE10deallocateERS7_PS6_m(%"class.std::allocator.2"* dereferenceable(1) %call, %"struct.std::_Rb_tree_node.11"* %0, i64 1)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  ret void

terminate.lpad:                                   ; preds = %entry
  %1 = landingpad { i8*, i32 }
          catch i8* null
  %2 = extractvalue { i8*, i32 } %1, 0
  call void @__clang_call_terminate(i8* %2) #13
  unreachable
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEE7destroyIS5_EEvRS7_PT_(%"class.std::allocator.2"* dereferenceable(1) %__a, %"struct.std::pair.13"* %__p) #5 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator.2"*, align 8
  %__p.addr = alloca %"struct.std::pair.13"*, align 8
  store %"class.std::allocator.2"* %__a, %"class.std::allocator.2"** %__a.addr, align 8
  store %"struct.std::pair.13"* %__p, %"struct.std::pair.13"** %__p.addr, align 8
  %0 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator.2"* %0 to %"class.__gnu_cxx::new_allocator.3"*
  %2 = load %"struct.std::pair.13"*, %"struct.std::pair.13"** %__p.addr, align 8
  call void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE7destroyIS6_EEvPT_(%"class.__gnu_cxx::new_allocator.3"* %1, %"struct.std::pair.13"* %2)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(1) %"class.std::allocator.2"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE21_M_get_Node_allocatorEv(%"class.std::_Rb_tree.1"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %0 = bitcast %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl to %"class.std::allocator.2"*
  ret %"class.std::allocator.2"* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::pair.13"* @_ZNSt13_Rb_tree_nodeISt4pairIKmP4RealEE9_M_valptrEv(%"struct.std::_Rb_tree_node.11"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  store %"struct.std::_Rb_tree_node.11"* %this, %"struct.std::_Rb_tree_node.11"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %this.addr, align 8
  %_M_storage = getelementptr inbounds %"struct.std::_Rb_tree_node.11", %"struct.std::_Rb_tree_node.11"* %this1, i32 0, i32 1
  %call = call %"struct.std::pair.13"* @_ZN9__gnu_cxx16__aligned_membufISt4pairIKmP4RealEE6_M_ptrEv(%"struct.__gnu_cxx::__aligned_membuf.12"* %_M_storage) #3
  ret %"struct.std::pair.13"* %call
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE7destroyIS6_EEvPT_(%"class.__gnu_cxx::new_allocator.3"* %this, %"struct.std::pair.13"* %__p) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  %__p.addr = alloca %"struct.std::pair.13"*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  store %"struct.std::pair.13"* %__p, %"struct.std::pair.13"** %__p.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %0 = load %"struct.std::pair.13"*, %"struct.std::pair.13"** %__p.addr, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::pair.13"* @_ZN9__gnu_cxx16__aligned_membufISt4pairIKmP4RealEE6_M_ptrEv(%"struct.__gnu_cxx::__aligned_membuf.12"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.__gnu_cxx::__aligned_membuf.12"*, align 8
  store %"struct.__gnu_cxx::__aligned_membuf.12"* %this, %"struct.__gnu_cxx::__aligned_membuf.12"** %this.addr, align 8
  %this1 = load %"struct.__gnu_cxx::__aligned_membuf.12"*, %"struct.__gnu_cxx::__aligned_membuf.12"** %this.addr, align 8
  %call = call i8* @_ZN9__gnu_cxx16__aligned_membufISt4pairIKmP4RealEE7_M_addrEv(%"struct.__gnu_cxx::__aligned_membuf.12"* %this1) #3
  %0 = bitcast i8* %call to %"struct.std::pair.13"*
  ret %"struct.std::pair.13"* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i8* @_ZN9__gnu_cxx16__aligned_membufISt4pairIKmP4RealEE7_M_addrEv(%"struct.__gnu_cxx::__aligned_membuf.12"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.__gnu_cxx::__aligned_membuf.12"*, align 8
  store %"struct.__gnu_cxx::__aligned_membuf.12"* %this, %"struct.__gnu_cxx::__aligned_membuf.12"** %this.addr, align 8
  %this1 = load %"struct.__gnu_cxx::__aligned_membuf.12"*, %"struct.__gnu_cxx::__aligned_membuf.12"** %this.addr, align 8
  %_M_storage = getelementptr inbounds %"struct.__gnu_cxx::__aligned_membuf.12", %"struct.__gnu_cxx::__aligned_membuf.12"* %this1, i32 0, i32 0
  %0 = bitcast [16 x i8]* %_M_storage to i8*
  ret i8* %0
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEE10deallocateERS7_PS6_m(%"class.std::allocator.2"* dereferenceable(1) %__a, %"struct.std::_Rb_tree_node.11"* %__p, i64 %__n) #5 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator.2"*, align 8
  %__p.addr = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::allocator.2"* %__a, %"class.std::allocator.2"** %__a.addr, align 8
  store %"struct.std::_Rb_tree_node.11"* %__p, %"struct.std::_Rb_tree_node.11"** %__p.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %0 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator.2"* %0 to %"class.__gnu_cxx::new_allocator.3"*
  %2 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__p.addr, align 8
  %3 = load i64, i64* %__n.addr, align 8
  call void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE10deallocateEPS7_m(%"class.__gnu_cxx::new_allocator.3"* %1, %"struct.std::_Rb_tree_node.11"* %2, i64 %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE10deallocateEPS7_m(%"class.__gnu_cxx::new_allocator.3"* %this, %"struct.std::_Rb_tree_node.11"* %__p, i64) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  %__p.addr = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  %.addr = alloca i64, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node.11"* %__p, %"struct.std::_Rb_tree_node.11"** %__p.addr, align 8
  store i64 %0, i64* %.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %1 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__p.addr, align 8
  %2 = bitcast %"struct.std::_Rb_tree_node.11"* %1 to i8*
  call void @_ZdlPv(i8* %2) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSaISt13_Rb_tree_nodeISt4pairIKmP4RealEEED2Ev(%"class.std::allocator.2"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::allocator.2"*, align 8
  store %"class.std::allocator.2"* %this, %"class.std::allocator.2"** %this.addr, align 8
  %this1 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %this.addr, align 8
  %0 = bitcast %"class.std::allocator.2"* %this1 to %"class.__gnu_cxx::new_allocator.3"*
  call void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEED2Ev(%"class.__gnu_cxx::new_allocator.3"* %0) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEED2Ev(%"class.__gnu_cxx::new_allocator.3"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) i64* @_ZSt7forwardIRmEOT_RNSt16remove_referenceIS1_E4typeE(i64* dereferenceable(8) %__t) #4 comdat {
entry:
  %__t.addr = alloca i64*, align 8
  store i64* %__t, i64** %__t.addr, align 8
  %0 = load i64*, i64** %__t.addr, align 8
  ret i64* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) %struct.Real** @_ZSt7forwardIRP4RealEOT_RNSt16remove_referenceIS3_E4typeE(%struct.Real** dereferenceable(8) %__t) #4 comdat {
entry:
  %__t.addr = alloca %struct.Real**, align 8
  store %struct.Real** %__t, %struct.Real*** %__t.addr, align 8
  %0 = load %struct.Real**, %struct.Real*** %__t.addr, align 8
  ret %struct.Real** %0
}

; Function Attrs: nounwind
declare dso_local double @log2(double) #2

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EEC2Ev(%"class.std::_Rb_tree"* %this) unnamed_addr #5 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  call void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE13_Rb_tree_implIS6_Lb1EEC2Ev(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE13_Rb_tree_implIS6_Lb1EEC2Ev(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"*, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"** %this.addr, align 8
  %0 = bitcast %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this1 to %"class.std::allocator"*
  call void @_ZNSaISt13_Rb_tree_nodeISt4pairIKmmEEEC2Ev(%"class.std::allocator"* %0) #3
  %_M_key_compare = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this1, i32 0, i32 1
  %1 = bitcast %"struct.std::_Rb_tree_node_base"* %_M_header to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1, i8 0, i64 32, i1 false)
  %_M_node_count = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this1, i32 0, i32 2
  store i64 0, i64* %_M_node_count, align 8
  invoke void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE13_Rb_tree_implIS6_Lb1EE13_M_initializeEv(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this1)
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
  %5 = bitcast %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this1 to %"class.std::allocator"*
  call void @_ZNSaISt13_Rb_tree_nodeISt4pairIKmmEEED2Ev(%"class.std::allocator"* %5) #3
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0
  %lpad.val2 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val2
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSaISt13_Rb_tree_nodeISt4pairIKmmEEEC2Ev(%"class.std::allocator"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %this, %"class.std::allocator"** %this.addr, align 8
  %this1 = load %"class.std::allocator"*, %"class.std::allocator"** %this.addr, align 8
  %0 = bitcast %"class.std::allocator"* %this1 to %"class.__gnu_cxx::new_allocator"*
  call void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEEC2Ev(%"class.__gnu_cxx::new_allocator"* %0) #3
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #7

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE13_Rb_tree_implIS6_Lb1EE13_M_initializeEv(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"*, align 8
  store %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"*, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"** %this.addr, align 8
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this1, i32 0, i32 1
  %_M_color = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %_M_header, i32 0, i32 0
  store i32 0, i32* %_M_color, align 8
  %_M_header2 = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this1, i32 0, i32 1
  %_M_parent = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %_M_header2, i32 0, i32 1
  store %"struct.std::_Rb_tree_node_base"* null, %"struct.std::_Rb_tree_node_base"** %_M_parent, align 8
  %_M_header3 = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this1, i32 0, i32 1
  %_M_header4 = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this1, i32 0, i32 1
  %_M_left = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %_M_header4, i32 0, i32 2
  store %"struct.std::_Rb_tree_node_base"* %_M_header3, %"struct.std::_Rb_tree_node_base"** %_M_left, align 8
  %_M_header5 = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this1, i32 0, i32 1
  %_M_header6 = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %this1, i32 0, i32 1
  %_M_right = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %_M_header6, i32 0, i32 3
  store %"struct.std::_Rb_tree_node_base"* %_M_header5, %"struct.std::_Rb_tree_node_base"** %_M_right, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEEC2Ev(%"class.__gnu_cxx::new_allocator"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EEC2Ev(%"class.std::_Rb_tree.1"* %this) unnamed_addr #5 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EEC2Ev(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE13_Rb_tree_implIS8_Lb1EEC2Ev(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"*, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"** %this.addr, align 8
  %0 = bitcast %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this1 to %"class.std::allocator.2"*
  call void @_ZNSaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEC2Ev(%"class.std::allocator.2"* %0) #3
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
  %5 = bitcast %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %this1 to %"class.std::allocator.2"*
  call void @_ZNSaISt13_Rb_tree_nodeISt4pairIKmP4RealEEED2Ev(%"class.std::allocator.2"* %5) #3
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0
  %lpad.val2 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val2
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEC2Ev(%"class.std::allocator.2"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::allocator.2"*, align 8
  store %"class.std::allocator.2"* %this, %"class.std::allocator.2"** %this.addr, align 8
  %this1 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %this.addr, align 8
  %0 = bitcast %"class.std::allocator.2"* %this1 to %"class.__gnu_cxx::new_allocator.3"*
  call void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEEC2Ev(%"class.__gnu_cxx::new_allocator.3"* %0) #3
  ret void
}

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
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEEC2Ev(%"class.__gnu_cxx::new_allocator.3"* %this) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE4findERS1_(%"class.std::_Rb_tree.1"* %this, i64* dereferenceable(8) %__k) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_const_iterator", align 8
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  %__k.addr = alloca i64*, align 8
  %__j = alloca %"struct.std::_Rb_tree_const_iterator", align 8
  %ref.tmp = alloca %"struct.std::_Rb_tree_const_iterator", align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  store i64* %__k, i64** %__k.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %call = call %"struct.std::_Rb_tree_node.11"* @_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_beginEv(%"class.std::_Rb_tree.1"* %this1) #3
  %call2 = call %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_M_endEv(%"class.std::_Rb_tree.1"* %this1) #3
  %0 = load i64*, i64** %__k.addr, align 8
  %call3 = call %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE14_M_lower_boundEPKSt13_Rb_tree_nodeIS4_EPKSt18_Rb_tree_node_baseRS1_(%"class.std::_Rb_tree.1"* %this1, %"struct.std::_Rb_tree_node.11"* %call, %"struct.std::_Rb_tree_node_base"* %call2, i64* dereferenceable(8) %0)
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator", %"struct.std::_Rb_tree_const_iterator"* %__j, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call3, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  %call4 = call %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE3endEv(%"class.std::_Rb_tree.1"* %this1) #3
  %coerce.dive5 = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator", %"struct.std::_Rb_tree_const_iterator"* %ref.tmp, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call4, %"struct.std::_Rb_tree_node_base"** %coerce.dive5, align 8
  %call6 = call zeroext i1 @_ZNKSt23_Rb_tree_const_iteratorISt4pairIKmP4RealEEeqERKS5_(%"struct.std::_Rb_tree_const_iterator"* %__j, %"struct.std::_Rb_tree_const_iterator"* dereferenceable(8) %ref.tmp) #3
  br i1 %call6, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %_M_key_compare = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 0
  %1 = load i64*, i64** %__k.addr, align 8
  %_M_node = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator", %"struct.std::_Rb_tree_const_iterator"* %__j, i32 0, i32 0
  %2 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_node, align 8
  %call7 = call dereferenceable(8) i64* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_S_keyEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %2)
  %call8 = call zeroext i1 @_ZNKSt4lessImEclERKmS2_(%"struct.std::less"* %_M_key_compare, i64* dereferenceable(8) %1, i64* dereferenceable(8) %call7)
  br i1 %call8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %call9 = call %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE3endEv(%"class.std::_Rb_tree.1"* %this1) #3
  %coerce.dive10 = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator", %"struct.std::_Rb_tree_const_iterator"* %retval, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call9, %"struct.std::_Rb_tree_node_base"** %coerce.dive10, align 8
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %3 = bitcast %"struct.std::_Rb_tree_const_iterator"* %retval to i8*
  %4 = bitcast %"struct.std::_Rb_tree_const_iterator"* %__j to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 8 %4, i64 8, i1 false)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %coerce.dive11 = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator", %"struct.std::_Rb_tree_const_iterator"* %retval, i32 0, i32 0
  %5 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive11, align 8
  ret %"struct.std::_Rb_tree_node_base"* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNKSt23_Rb_tree_const_iteratorISt4pairIKmP4RealEEeqERKS5_(%"struct.std::_Rb_tree_const_iterator"* %this, %"struct.std::_Rb_tree_const_iterator"* dereferenceable(8) %__x) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_const_iterator"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_const_iterator"*, align 8
  store %"struct.std::_Rb_tree_const_iterator"* %this, %"struct.std::_Rb_tree_const_iterator"** %this.addr, align 8
  store %"struct.std::_Rb_tree_const_iterator"* %__x, %"struct.std::_Rb_tree_const_iterator"** %__x.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_const_iterator"*, %"struct.std::_Rb_tree_const_iterator"** %this.addr, align 8
  %_M_node = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator", %"struct.std::_Rb_tree_const_iterator"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_node, align 8
  %1 = load %"struct.std::_Rb_tree_const_iterator"*, %"struct.std::_Rb_tree_const_iterator"** %__x.addr, align 8
  %_M_node2 = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator", %"struct.std::_Rb_tree_const_iterator"* %1, i32 0, i32 0
  %2 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_node2, align 8
  %cmp = icmp eq %"struct.std::_Rb_tree_node_base"* %0, %2
  ret i1 %cmp
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE3endEv(%"class.std::_Rb_tree.1"* %this) #4 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_const_iterator", align 8
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 1
  call void @_ZNSt23_Rb_tree_const_iteratorISt4pairIKmP4RealEEC2EPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_const_iterator"* %retval, %"struct.std::_Rb_tree_node_base"* %_M_header) #3
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator", %"struct.std::_Rb_tree_const_iterator"* %retval, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  ret %"struct.std::_Rb_tree_node_base"* %0
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE14_M_lower_boundEPKSt13_Rb_tree_nodeIS4_EPKSt18_Rb_tree_node_baseRS1_(%"class.std::_Rb_tree.1"* %this, %"struct.std::_Rb_tree_node.11"* %__x, %"struct.std::_Rb_tree_node_base"* %__y, i64* dereferenceable(8) %__k) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_const_iterator", align 8
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  %__y.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  %__k.addr = alloca i64*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node.11"* %__x, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  store %"struct.std::_Rb_tree_node_base"* %__y, %"struct.std::_Rb_tree_node_base"** %__y.addr, align 8
  store i64* %__k, i64** %__k.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %cmp = icmp ne %"struct.std::_Rb_tree_node.11"* %0, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %_M_key_compare = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 0
  %1 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %call = call dereferenceable(8) i64* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_S_keyEPKSt13_Rb_tree_nodeIS4_E(%"struct.std::_Rb_tree_node.11"* %1)
  %2 = load i64*, i64** %__k.addr, align 8
  %call2 = call zeroext i1 @_ZNKSt4lessImEclERKmS2_(%"struct.std::less"* %_M_key_compare, i64* dereferenceable(8) %call, i64* dereferenceable(8) %2)
  br i1 %call2, label %if.else, label %if.then

if.then:                                          ; preds = %while.body
  %3 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %4 = bitcast %"struct.std::_Rb_tree_node.11"* %3 to %"struct.std::_Rb_tree_node_base"*
  store %"struct.std::_Rb_tree_node_base"* %4, %"struct.std::_Rb_tree_node_base"** %__y.addr, align 8
  %5 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %6 = bitcast %"struct.std::_Rb_tree_node.11"* %5 to %"struct.std::_Rb_tree_node_base"*
  %call3 = call %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE7_S_leftEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %6) #3
  store %"struct.std::_Rb_tree_node.11"* %call3, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  br label %if.end

if.else:                                          ; preds = %while.body
  %7 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %8 = bitcast %"struct.std::_Rb_tree_node.11"* %7 to %"struct.std::_Rb_tree_node_base"*
  %call4 = call %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_S_rightEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %8) #3
  store %"struct.std::_Rb_tree_node.11"* %call4, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %9 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__y.addr, align 8
  call void @_ZNSt23_Rb_tree_const_iteratorISt4pairIKmP4RealEEC2EPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_const_iterator"* %retval, %"struct.std::_Rb_tree_node_base"* %9) #3
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator", %"struct.std::_Rb_tree_const_iterator"* %retval, i32 0, i32 0
  %10 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  ret %"struct.std::_Rb_tree_node_base"* %10
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node.11"* @_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_beginEv(%"class.std::_Rb_tree.1"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 1
  %_M_parent = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %_M_header, i32 0, i32 1
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_parent, align 8
  %1 = bitcast %"struct.std::_Rb_tree_node_base"* %0 to %"struct.std::_Rb_tree_node.11"*
  ret %"struct.std::_Rb_tree_node.11"* %1
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_M_endEv(%"class.std::_Rb_tree.1"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 1
  ret %"struct.std::_Rb_tree_node_base"* %_M_header
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNKSt4lessImEclERKmS2_(%"struct.std::less"* %this, i64* dereferenceable(8) %__x, i64* dereferenceable(8) %__y) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::less"*, align 8
  %__x.addr = alloca i64*, align 8
  %__y.addr = alloca i64*, align 8
  store %"struct.std::less"* %this, %"struct.std::less"** %this.addr, align 8
  store i64* %__x, i64** %__x.addr, align 8
  store i64* %__y, i64** %__y.addr, align 8
  %this1 = load %"struct.std::less"*, %"struct.std::less"** %this.addr, align 8
  %0 = load i64*, i64** %__x.addr, align 8
  %1 = load i64, i64* %0, align 8
  %2 = load i64*, i64** %__y.addr, align 8
  %3 = load i64, i64* %2, align 8
  %cmp = icmp ult i64 %1, %3
  ret i1 %cmp
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(8) i64* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_S_keyEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x) #5 comdat align 2 {
entry:
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  %tmp = alloca %"struct.std::_Select1st", align 1
  store %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %call = call dereferenceable(16) %"struct.std::pair.13"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_S_valueEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %0)
  %call1 = call dereferenceable(8) i64* @_ZNKSt10_Select1stISt4pairIKmP4RealEEclERKS4_(%"struct.std::_Select1st"* %tmp, %"struct.std::pair.13"* dereferenceable(16) %call)
  ret i64* %call1
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(8) i64* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_S_keyEPKSt13_Rb_tree_nodeIS4_E(%"struct.std::_Rb_tree_node.11"* %__x) #5 comdat align 2 {
entry:
  %__x.addr = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  %tmp = alloca %"struct.std::_Select1st", align 1
  store %"struct.std::_Rb_tree_node.11"* %__x, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %call = call dereferenceable(16) %"struct.std::pair.13"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_S_valueEPKSt13_Rb_tree_nodeIS4_E(%"struct.std::_Rb_tree_node.11"* %0)
  %call1 = call dereferenceable(8) i64* @_ZNKSt10_Select1stISt4pairIKmP4RealEEclERKS4_(%"struct.std::_Select1st"* %tmp, %"struct.std::pair.13"* dereferenceable(16) %call)
  ret i64* %call1
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE7_S_leftEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x) #4 comdat align 2 {
entry:
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  store %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %_M_left = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %0, i32 0, i32 2
  %1 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_left, align 8
  %2 = bitcast %"struct.std::_Rb_tree_node_base"* %1 to %"struct.std::_Rb_tree_node.11"*
  ret %"struct.std::_Rb_tree_node.11"* %2
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_S_rightEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x) #4 comdat align 2 {
entry:
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  store %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %_M_right = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %0, i32 0, i32 3
  %1 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_right, align 8
  %2 = bitcast %"struct.std::_Rb_tree_node_base"* %1 to %"struct.std::_Rb_tree_node.11"*
  ret %"struct.std::_Rb_tree_node.11"* %2
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt23_Rb_tree_const_iteratorISt4pairIKmP4RealEEC2EPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_const_iterator"* %this, %"struct.std::_Rb_tree_node_base"* %__x) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_const_iterator"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  store %"struct.std::_Rb_tree_const_iterator"* %this, %"struct.std::_Rb_tree_const_iterator"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_const_iterator"*, %"struct.std::_Rb_tree_const_iterator"** %this.addr, align 8
  %_M_node = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator", %"struct.std::_Rb_tree_const_iterator"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  store %"struct.std::_Rb_tree_node_base"* %0, %"struct.std::_Rb_tree_node_base"** %_M_node, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) i64* @_ZNKSt10_Select1stISt4pairIKmP4RealEEclERKS4_(%"struct.std::_Select1st"* %this, %"struct.std::pair.13"* dereferenceable(16) %__x) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Select1st"*, align 8
  %__x.addr = alloca %"struct.std::pair.13"*, align 8
  store %"struct.std::_Select1st"* %this, %"struct.std::_Select1st"** %this.addr, align 8
  store %"struct.std::pair.13"* %__x, %"struct.std::pair.13"** %__x.addr, align 8
  %this1 = load %"struct.std::_Select1st"*, %"struct.std::_Select1st"** %this.addr, align 8
  %0 = load %"struct.std::pair.13"*, %"struct.std::pair.13"** %__x.addr, align 8
  %first = getelementptr inbounds %"struct.std::pair.13", %"struct.std::pair.13"* %0, i32 0, i32 0
  ret i64* %first
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %"struct.std::pair.13"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_S_valueEPKSt13_Rb_tree_nodeIS4_E(%"struct.std::_Rb_tree_node.11"* %__x) #5 comdat align 2 {
entry:
  %__x.addr = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  store %"struct.std::_Rb_tree_node.11"* %__x, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %call = call %"struct.std::pair.13"* @_ZNKSt13_Rb_tree_nodeISt4pairIKmP4RealEE9_M_valptrEv(%"struct.std::_Rb_tree_node.11"* %0)
  ret %"struct.std::pair.13"* %call
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::pair.13"* @_ZNKSt13_Rb_tree_nodeISt4pairIKmP4RealEE9_M_valptrEv(%"struct.std::_Rb_tree_node.11"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  store %"struct.std::_Rb_tree_node.11"* %this, %"struct.std::_Rb_tree_node.11"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %this.addr, align 8
  %_M_storage = getelementptr inbounds %"struct.std::_Rb_tree_node.11", %"struct.std::_Rb_tree_node.11"* %this1, i32 0, i32 1
  %call = call %"struct.std::pair.13"* @_ZNK9__gnu_cxx16__aligned_membufISt4pairIKmP4RealEE6_M_ptrEv(%"struct.__gnu_cxx::__aligned_membuf.12"* %_M_storage) #3
  ret %"struct.std::pair.13"* %call
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::pair.13"* @_ZNK9__gnu_cxx16__aligned_membufISt4pairIKmP4RealEE6_M_ptrEv(%"struct.__gnu_cxx::__aligned_membuf.12"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.__gnu_cxx::__aligned_membuf.12"*, align 8
  store %"struct.__gnu_cxx::__aligned_membuf.12"* %this, %"struct.__gnu_cxx::__aligned_membuf.12"** %this.addr, align 8
  %this1 = load %"struct.__gnu_cxx::__aligned_membuf.12"*, %"struct.__gnu_cxx::__aligned_membuf.12"** %this.addr, align 8
  %call = call i8* @_ZNK9__gnu_cxx16__aligned_membufISt4pairIKmP4RealEE7_M_addrEv(%"struct.__gnu_cxx::__aligned_membuf.12"* %this1) #3
  %0 = bitcast i8* %call to %"struct.std::pair.13"*
  ret %"struct.std::pair.13"* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i8* @_ZNK9__gnu_cxx16__aligned_membufISt4pairIKmP4RealEE7_M_addrEv(%"struct.__gnu_cxx::__aligned_membuf.12"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.__gnu_cxx::__aligned_membuf.12"*, align 8
  store %"struct.__gnu_cxx::__aligned_membuf.12"* %this, %"struct.__gnu_cxx::__aligned_membuf.12"** %this.addr, align 8
  %this1 = load %"struct.__gnu_cxx::__aligned_membuf.12"*, %"struct.__gnu_cxx::__aligned_membuf.12"** %this.addr, align 8
  %_M_storage = getelementptr inbounds %"struct.__gnu_cxx::__aligned_membuf.12", %"struct.__gnu_cxx::__aligned_membuf.12"* %this1, i32 0, i32 0
  %0 = bitcast [16 x i8]* %_M_storage to i8*
  ret i8* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %"struct.std::pair.13"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_S_valueEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x) #4 comdat align 2 {
entry:
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  store %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %1 = bitcast %"struct.std::_Rb_tree_node_base"* %0 to %"struct.std::_Rb_tree_node.11"*
  %call = call %"struct.std::pair.13"* @_ZNKSt13_Rb_tree_nodeISt4pairIKmP4RealEE9_M_valptrEv(%"struct.std::_Rb_tree_node.11"* %1)
  ret %"struct.std::pair.13"* %call
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE11lower_boundERS5_(%"class.std::map.0"* %this, i64* dereferenceable(8) %__x) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_iterator", align 8
  %this.addr = alloca %"class.std::map.0"*, align 8
  %__x.addr = alloca i64*, align 8
  store %"class.std::map.0"* %this, %"class.std::map.0"** %this.addr, align 8
  store i64* %__x, i64** %__x.addr, align 8
  %this1 = load %"class.std::map.0"*, %"class.std::map.0"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"class.std::map.0", %"class.std::map.0"* %this1, i32 0, i32 0
  %0 = load i64*, i64** %__x.addr, align 8
  %call = call %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11lower_boundERS1_(%"class.std::_Rb_tree.1"* %_M_t, i64* dereferenceable(8) %0)
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %retval, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  %coerce.dive2 = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %retval, i32 0, i32 0
  %1 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive2, align 8
  ret %"struct.std::_Rb_tree_node_base"* %1
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNKSt17_Rb_tree_iteratorISt4pairIKmP4RealEEeqERKS5_(%"struct.std::_Rb_tree_iterator"* %this, %"struct.std::_Rb_tree_iterator"* dereferenceable(8) %__x) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_iterator"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_iterator"*, align 8
  store %"struct.std::_Rb_tree_iterator"* %this, %"struct.std::_Rb_tree_iterator"** %this.addr, align 8
  store %"struct.std::_Rb_tree_iterator"* %__x, %"struct.std::_Rb_tree_iterator"** %__x.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_iterator"*, %"struct.std::_Rb_tree_iterator"** %this.addr, align 8
  %_M_node = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_node, align 8
  %1 = load %"struct.std::_Rb_tree_iterator"*, %"struct.std::_Rb_tree_iterator"** %__x.addr, align 8
  %_M_node2 = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %1, i32 0, i32 0
  %2 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_node2, align 8
  %cmp = icmp eq %"struct.std::_Rb_tree_node_base"* %0, %2
  ret i1 %cmp
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE3endEv(%"class.std::map.0"* %this) #4 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_iterator", align 8
  %this.addr = alloca %"class.std::map.0"*, align 8
  store %"class.std::map.0"* %this, %"class.std::map.0"** %this.addr, align 8
  %this1 = load %"class.std::map.0"*, %"class.std::map.0"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"class.std::map.0", %"class.std::map.0"* %this1, i32 0, i32 0
  %call = call %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE3endEv(%"class.std::_Rb_tree.1"* %_M_t) #3
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %retval, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  %coerce.dive2 = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %retval, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive2, align 8
  ret %"struct.std::_Rb_tree_node_base"* %0
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNKSt3mapImP4RealSt4lessImESaISt4pairIKmS1_EEE8key_compEv(%"class.std::map.0"* %this) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::less", align 1
  %this.addr = alloca %"class.std::map.0"*, align 8
  %undef.agg.tmp = alloca %"struct.std::less", align 1
  store %"class.std::map.0"* %this, %"class.std::map.0"** %this.addr, align 8
  %this1 = load %"class.std::map.0"*, %"class.std::map.0"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"class.std::map.0", %"class.std::map.0"* %this1, i32 0, i32 0
  call void @_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8key_compEv(%"class.std::_Rb_tree.1"* %_M_t)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %"struct.std::pair.13"* @_ZNKSt17_Rb_tree_iteratorISt4pairIKmP4RealEEdeEv(%"struct.std::_Rb_tree_iterator"* %this) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_iterator"*, align 8
  store %"struct.std::_Rb_tree_iterator"* %this, %"struct.std::_Rb_tree_iterator"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_iterator"*, %"struct.std::_Rb_tree_iterator"** %this.addr, align 8
  %_M_node = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_node, align 8
  %1 = bitcast %"struct.std::_Rb_tree_node_base"* %0 to %"struct.std::_Rb_tree_node.11"*
  %call = invoke %"struct.std::pair.13"* @_ZNSt13_Rb_tree_nodeISt4pairIKmP4RealEE9_M_valptrEv(%"struct.std::_Rb_tree_node.11"* %1)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  ret %"struct.std::pair.13"* %call

terminate.lpad:                                   ; preds = %entry
  %2 = landingpad { i8*, i32 }
          catch i8* null
  %3 = extractvalue { i8*, i32 } %2, 0
  call void @__clang_call_terminate(i8* %3) #13
  unreachable
}

; Function Attrs: noreturn
declare dso_local void @_ZSt20__throw_out_of_rangePKc(i8*) #11

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11lower_boundERS1_(%"class.std::_Rb_tree.1"* %this, i64* dereferenceable(8) %__k) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_iterator", align 8
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  %__k.addr = alloca i64*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  store i64* %__k, i64** %__k.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %call = call %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_beginEv(%"class.std::_Rb_tree.1"* %this1) #3
  %call2 = call %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_M_endEv(%"class.std::_Rb_tree.1"* %this1) #3
  %0 = load i64*, i64** %__k.addr, align 8
  %call3 = call %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE14_M_lower_boundEPSt13_Rb_tree_nodeIS4_EPSt18_Rb_tree_node_baseRS1_(%"class.std::_Rb_tree.1"* %this1, %"struct.std::_Rb_tree_node.11"* %call, %"struct.std::_Rb_tree_node_base"* %call2, i64* dereferenceable(8) %0)
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %retval, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call3, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  %coerce.dive4 = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %retval, i32 0, i32 0
  %1 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive4, align 8
  ret %"struct.std::_Rb_tree_node_base"* %1
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE14_M_lower_boundEPSt13_Rb_tree_nodeIS4_EPSt18_Rb_tree_node_baseRS1_(%"class.std::_Rb_tree.1"* %this, %"struct.std::_Rb_tree_node.11"* %__x, %"struct.std::_Rb_tree_node_base"* %__y, i64* dereferenceable(8) %__k) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_iterator", align 8
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  %__y.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  %__k.addr = alloca i64*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node.11"* %__x, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  store %"struct.std::_Rb_tree_node_base"* %__y, %"struct.std::_Rb_tree_node_base"** %__y.addr, align 8
  store i64* %__k, i64** %__k.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %cmp = icmp ne %"struct.std::_Rb_tree_node.11"* %0, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %_M_key_compare = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 0
  %1 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %call = call dereferenceable(8) i64* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_S_keyEPKSt13_Rb_tree_nodeIS4_E(%"struct.std::_Rb_tree_node.11"* %1)
  %2 = load i64*, i64** %__k.addr, align 8
  %call2 = call zeroext i1 @_ZNKSt4lessImEclERKmS2_(%"struct.std::less"* %_M_key_compare, i64* dereferenceable(8) %call, i64* dereferenceable(8) %2)
  br i1 %call2, label %if.else, label %if.then

if.then:                                          ; preds = %while.body
  %3 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %4 = bitcast %"struct.std::_Rb_tree_node.11"* %3 to %"struct.std::_Rb_tree_node_base"*
  store %"struct.std::_Rb_tree_node_base"* %4, %"struct.std::_Rb_tree_node_base"** %__y.addr, align 8
  %5 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %6 = bitcast %"struct.std::_Rb_tree_node.11"* %5 to %"struct.std::_Rb_tree_node_base"*
  %call3 = call %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE7_S_leftEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %6) #3
  store %"struct.std::_Rb_tree_node.11"* %call3, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  br label %if.end

if.else:                                          ; preds = %while.body
  %7 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  %8 = bitcast %"struct.std::_Rb_tree_node.11"* %7 to %"struct.std::_Rb_tree_node_base"*
  %call4 = call %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_S_rightEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %8) #3
  store %"struct.std::_Rb_tree_node.11"* %call4, %"struct.std::_Rb_tree_node.11"** %__x.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %9 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__y.addr, align 8
  call void @_ZNSt17_Rb_tree_iteratorISt4pairIKmP4RealEEC2EPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_iterator"* %retval, %"struct.std::_Rb_tree_node_base"* %9) #3
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %retval, i32 0, i32 0
  %10 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  ret %"struct.std::_Rb_tree_node_base"* %10
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_M_endEv(%"class.std::_Rb_tree.1"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 1
  ret %"struct.std::_Rb_tree_node_base"* %_M_header
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt17_Rb_tree_iteratorISt4pairIKmP4RealEEC2EPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_iterator"* %this, %"struct.std::_Rb_tree_node_base"* %__x) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_iterator"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  store %"struct.std::_Rb_tree_iterator"* %this, %"struct.std::_Rb_tree_iterator"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_iterator"*, %"struct.std::_Rb_tree_iterator"** %this.addr, align 8
  %_M_node = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  store %"struct.std::_Rb_tree_node_base"* %0, %"struct.std::_Rb_tree_node_base"** %_M_node, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE3endEv(%"class.std::_Rb_tree.1"* %this) #4 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_iterator", align 8
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 1
  call void @_ZNSt17_Rb_tree_iteratorISt4pairIKmP4RealEEC2EPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_iterator"* %retval, %"struct.std::_Rb_tree_node_base"* %_M_header) #3
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %retval, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  ret %"struct.std::_Rb_tree_node_base"* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8key_compEv(%"class.std::_Rb_tree.1"* %this) #4 comdat align 2 {
entry:
  %retval = alloca %"struct.std::less", align 1
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %_M_key_compare = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 0
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE16_M_insert_uniqueIS0_ImS3_EEES0_ISt17_Rb_tree_iteratorIS4_EbEOT_(%"class.std::_Rb_tree.1"* %this, %"struct.std::pair.5"* dereferenceable(16) %__v) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::pair", align 8
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  %__v.addr = alloca %"struct.std::pair.5"*, align 8
  %__res = alloca %"struct.std::pair.14", align 8
  %tmp = alloca %"struct.std::_Select1st", align 1
  %__an = alloca %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node", align 8
  %ref.tmp = alloca %"struct.std::_Rb_tree_iterator", align 8
  %ref.tmp6 = alloca i8, align 1
  %ref.tmp7 = alloca %"struct.std::_Rb_tree_iterator", align 8
  %ref.tmp9 = alloca i8, align 1
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  store %"struct.std::pair.5"* %__v, %"struct.std::pair.5"** %__v.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %0 = load %"struct.std::pair.5"*, %"struct.std::pair.5"** %__v.addr, align 8
  %call = call dereferenceable(8) i64* @_ZNKSt10_Select1stISt4pairIKmP4RealEEclIS0_ImS3_EEERNT_10first_typeERS8_(%"struct.std::_Select1st"* %tmp, %"struct.std::pair.5"* dereferenceable(16) %0)
  %call2 = call { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* } @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE24_M_get_insert_unique_posERS1_(%"class.std::_Rb_tree.1"* %this1, i64* dereferenceable(8) %call)
  %1 = bitcast %"struct.std::pair.14"* %__res to { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }*
  %2 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }, { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }* %1, i32 0, i32 0
  %3 = extractvalue { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* } %call2, 0
  store %"struct.std::_Rb_tree_node_base"* %3, %"struct.std::_Rb_tree_node_base"** %2, align 8
  %4 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }, { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }* %1, i32 0, i32 1
  %5 = extractvalue { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* } %call2, 1
  store %"struct.std::_Rb_tree_node_base"* %5, %"struct.std::_Rb_tree_node_base"** %4, align 8
  %second = getelementptr inbounds %"struct.std::pair.14", %"struct.std::pair.14"* %__res, i32 0, i32 1
  %6 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %second, align 8
  %tobool = icmp ne %"struct.std::_Rb_tree_node_base"* %6, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11_Alloc_nodeC2ERSA_(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"* %__an, %"class.std::_Rb_tree.1"* dereferenceable(48) %this1)
  %first = getelementptr inbounds %"struct.std::pair.14", %"struct.std::pair.14"* %__res, i32 0, i32 0
  %7 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %first, align 8
  %second3 = getelementptr inbounds %"struct.std::pair.14", %"struct.std::pair.14"* %__res, i32 0, i32 1
  %8 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %second3, align 8
  %9 = load %"struct.std::pair.5"*, %"struct.std::pair.5"** %__v.addr, align 8
  %call4 = call dereferenceable(16) %"struct.std::pair.5"* @_ZSt7forwardISt4pairImP4RealEEOT_RNSt16remove_referenceIS4_E4typeE(%"struct.std::pair.5"* dereferenceable(16) %9) #3
  %call5 = call %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE10_M_insert_IS0_ImS3_ENSA_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS4_EPSt18_Rb_tree_node_baseSH_OT_RT0_(%"class.std::_Rb_tree.1"* %this1, %"struct.std::_Rb_tree_node_base"* %7, %"struct.std::_Rb_tree_node_base"* %8, %"struct.std::pair.5"* dereferenceable(16) %call4, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"* dereferenceable(8) %__an)
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %ref.tmp, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call5, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  store i8 1, i8* %ref.tmp6, align 1
  call void @_ZNSt4pairISt17_Rb_tree_iteratorIS_IKmP4RealEEbEC2IS5_bLb1EEEOT_OT0_(%"struct.std::pair"* %retval, %"struct.std::_Rb_tree_iterator"* dereferenceable(8) %ref.tmp, i8* dereferenceable(1) %ref.tmp6)
  br label %return

if.end:                                           ; preds = %entry
  %first8 = getelementptr inbounds %"struct.std::pair.14", %"struct.std::pair.14"* %__res, i32 0, i32 0
  %10 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %first8, align 8
  call void @_ZNSt17_Rb_tree_iteratorISt4pairIKmP4RealEEC2EPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_iterator"* %ref.tmp7, %"struct.std::_Rb_tree_node_base"* %10) #3
  store i8 0, i8* %ref.tmp9, align 1
  call void @_ZNSt4pairISt17_Rb_tree_iteratorIS_IKmP4RealEEbEC2IS5_bLb1EEEOT_OT0_(%"struct.std::pair"* %retval, %"struct.std::_Rb_tree_iterator"* dereferenceable(8) %ref.tmp7, i8* dereferenceable(1) %ref.tmp9)
  br label %return

return:                                           ; preds = %if.end, %if.then
  %11 = bitcast %"struct.std::pair"* %retval to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %12 = load { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %11, align 8
  ret { %"struct.std::_Rb_tree_node_base"*, i8 } %12
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %"struct.std::pair.5"* @_ZSt7forwardISt4pairImP4RealEEOT_RNSt16remove_referenceIS4_E4typeE(%"struct.std::pair.5"* dereferenceable(16) %__t) #4 comdat {
entry:
  %__t.addr = alloca %"struct.std::pair.5"*, align 8
  store %"struct.std::pair.5"* %__t, %"struct.std::pair.5"** %__t.addr, align 8
  %0 = load %"struct.std::pair.5"*, %"struct.std::pair.5"** %__t.addr, align 8
  ret %"struct.std::pair.5"* %0
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* } @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE24_M_get_insert_unique_posERS1_(%"class.std::_Rb_tree.1"* %this, i64* dereferenceable(8) %__k) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::pair.14", align 8
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  %__k.addr = alloca i64*, align 8
  %__x = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  %__y = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  %__comp = alloca i8, align 1
  %__j = alloca %"struct.std::_Rb_tree_iterator", align 8
  %ref.tmp = alloca %"struct.std::_Rb_tree_iterator", align 8
  %ref.tmp20 = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  store i64* %__k, i64** %__k.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %call = call %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_M_beginEv(%"class.std::_Rb_tree.1"* %this1) #3
  store %"struct.std::_Rb_tree_node.11"* %call, %"struct.std::_Rb_tree_node.11"** %__x, align 8
  %call2 = call %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_M_endEv(%"class.std::_Rb_tree.1"* %this1) #3
  store %"struct.std::_Rb_tree_node_base"* %call2, %"struct.std::_Rb_tree_node_base"** %__y, align 8
  store i8 1, i8* %__comp, align 1
  br label %while.cond

while.cond:                                       ; preds = %cond.end, %entry
  %0 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x, align 8
  %cmp = icmp ne %"struct.std::_Rb_tree_node.11"* %0, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x, align 8
  %2 = bitcast %"struct.std::_Rb_tree_node.11"* %1 to %"struct.std::_Rb_tree_node_base"*
  store %"struct.std::_Rb_tree_node_base"* %2, %"struct.std::_Rb_tree_node_base"** %__y, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %_M_key_compare = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 0
  %3 = load i64*, i64** %__k.addr, align 8
  %4 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x, align 8
  %call3 = call dereferenceable(8) i64* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_S_keyEPKSt13_Rb_tree_nodeIS4_E(%"struct.std::_Rb_tree_node.11"* %4)
  %call4 = call zeroext i1 @_ZNKSt4lessImEclERKmS2_(%"struct.std::less"* %_M_key_compare, i64* dereferenceable(8) %3, i64* dereferenceable(8) %call3)
  %frombool = zext i1 %call4 to i8
  store i8 %frombool, i8* %__comp, align 1
  %5 = load i8, i8* %__comp, align 1
  %tobool = trunc i8 %5 to i1
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  %6 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x, align 8
  %7 = bitcast %"struct.std::_Rb_tree_node.11"* %6 to %"struct.std::_Rb_tree_node_base"*
  %call5 = call %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE7_S_leftEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %7) #3
  br label %cond.end

cond.false:                                       ; preds = %while.body
  %8 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__x, align 8
  %9 = bitcast %"struct.std::_Rb_tree_node.11"* %8 to %"struct.std::_Rb_tree_node_base"*
  %call6 = call %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE8_S_rightEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %9) #3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %"struct.std::_Rb_tree_node.11"* [ %call5, %cond.true ], [ %call6, %cond.false ]
  store %"struct.std::_Rb_tree_node.11"* %cond, %"struct.std::_Rb_tree_node.11"** %__x, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %10 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__y, align 8
  call void @_ZNSt17_Rb_tree_iteratorISt4pairIKmP4RealEEC2EPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_iterator"* %__j, %"struct.std::_Rb_tree_node_base"* %10) #3
  %11 = load i8, i8* %__comp, align 1
  %tobool7 = trunc i8 %11 to i1
  br i1 %tobool7, label %if.then, label %if.end12

if.then:                                          ; preds = %while.end
  %call8 = call %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE5beginEv(%"class.std::_Rb_tree.1"* %this1) #3
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %ref.tmp, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call8, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  %call9 = call zeroext i1 @_ZNKSt17_Rb_tree_iteratorISt4pairIKmP4RealEEeqERKS5_(%"struct.std::_Rb_tree_iterator"* %__j, %"struct.std::_Rb_tree_iterator"* dereferenceable(8) %ref.tmp) #3
  br i1 %call9, label %if.then10, label %if.else

if.then10:                                        ; preds = %if.then
  call void @_ZNSt4pairIPSt18_Rb_tree_node_baseS1_EC2IRPSt13_Rb_tree_nodeIS_IKmP4RealEERS1_Lb1EEEOT_OT0_(%"struct.std::pair.14"* %retval, %"struct.std::_Rb_tree_node.11"** dereferenceable(8) %__x, %"struct.std::_Rb_tree_node_base"** dereferenceable(8) %__y)
  br label %return

if.else:                                          ; preds = %if.then
  %call11 = call dereferenceable(8) %"struct.std::_Rb_tree_iterator"* @_ZNSt17_Rb_tree_iteratorISt4pairIKmP4RealEEmmEv(%"struct.std::_Rb_tree_iterator"* %__j) #3
  br label %if.end

if.end:                                           ; preds = %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end, %while.end
  %_M_impl13 = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %_M_key_compare14 = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl13, i32 0, i32 0
  %_M_node = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %__j, i32 0, i32 0
  %12 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_node, align 8
  %call15 = call dereferenceable(8) i64* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_S_keyEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %12)
  %13 = load i64*, i64** %__k.addr, align 8
  %call16 = call zeroext i1 @_ZNKSt4lessImEclERKmS2_(%"struct.std::less"* %_M_key_compare14, i64* dereferenceable(8) %call15, i64* dereferenceable(8) %13)
  br i1 %call16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end12
  call void @_ZNSt4pairIPSt18_Rb_tree_node_baseS1_EC2IRPSt13_Rb_tree_nodeIS_IKmP4RealEERS1_Lb1EEEOT_OT0_(%"struct.std::pair.14"* %retval, %"struct.std::_Rb_tree_node.11"** dereferenceable(8) %__x, %"struct.std::_Rb_tree_node_base"** dereferenceable(8) %__y)
  br label %return

if.end18:                                         ; preds = %if.end12
  %_M_node19 = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %__j, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* null, %"struct.std::_Rb_tree_node_base"** %ref.tmp20, align 8
  call void @_ZNSt4pairIPSt18_Rb_tree_node_baseS1_EC2IRS1_Lb1EEEOT_RKS1_(%"struct.std::pair.14"* %retval, %"struct.std::_Rb_tree_node_base"** dereferenceable(8) %_M_node19, %"struct.std::_Rb_tree_node_base"** dereferenceable(8) %ref.tmp20)
  br label %return

return:                                           ; preds = %if.end18, %if.then17, %if.then10
  %14 = bitcast %"struct.std::pair.14"* %retval to { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }*
  %15 = load { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }, { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }* %14, align 8
  ret { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* } %15
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) i64* @_ZNKSt10_Select1stISt4pairIKmP4RealEEclIS0_ImS3_EEERNT_10first_typeERS8_(%"struct.std::_Select1st"* %this, %"struct.std::pair.5"* dereferenceable(16) %__x) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Select1st"*, align 8
  %__x.addr = alloca %"struct.std::pair.5"*, align 8
  store %"struct.std::_Select1st"* %this, %"struct.std::_Select1st"** %this.addr, align 8
  store %"struct.std::pair.5"* %__x, %"struct.std::pair.5"** %__x.addr, align 8
  %this1 = load %"struct.std::_Select1st"*, %"struct.std::_Select1st"** %this.addr, align 8
  %0 = load %"struct.std::pair.5"*, %"struct.std::pair.5"** %__x.addr, align 8
  %first = getelementptr inbounds %"struct.std::pair.5", %"struct.std::pair.5"* %0, i32 0, i32 0
  ret i64* %first
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11_Alloc_nodeC2ERSA_(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"* %this, %"class.std::_Rb_tree.1"* dereferenceable(48) %__t) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"*, align 8
  %__t.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  store %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"* %this, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"** %this.addr, align 8
  store %"class.std::_Rb_tree.1"* %__t, %"class.std::_Rb_tree.1"** %__t.addr, align 8
  %this1 = load %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"*, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"* %this1, i32 0, i32 0
  %0 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %__t.addr, align 8
  store %"class.std::_Rb_tree.1"* %0, %"class.std::_Rb_tree.1"** %_M_t, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE10_M_insert_IS0_ImS3_ENSA_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS4_EPSt18_Rb_tree_node_baseSH_OT_RT0_(%"class.std::_Rb_tree.1"* %this, %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"* %__p, %"struct.std::pair.5"* dereferenceable(16) %__v, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"* dereferenceable(8) %__node_gen) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_iterator", align 8
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  %__p.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  %__v.addr = alloca %"struct.std::pair.5"*, align 8
  %__node_gen.addr = alloca %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"*, align 8
  %__insert_left = alloca i8, align 1
  %tmp = alloca %"struct.std::_Select1st", align 1
  %__z = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  store %"struct.std::_Rb_tree_node_base"* %__p, %"struct.std::_Rb_tree_node_base"** %__p.addr, align 8
  store %"struct.std::pair.5"* %__v, %"struct.std::pair.5"** %__v.addr, align 8
  store %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"* %__node_gen, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"** %__node_gen.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %cmp = icmp ne %"struct.std::_Rb_tree_node_base"* %0, null
  br i1 %cmp, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__p.addr, align 8
  %call = call %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_M_endEv(%"class.std::_Rb_tree.1"* %this1) #3
  %cmp2 = icmp eq %"struct.std::_Rb_tree_node_base"* %1, %call
  br i1 %cmp2, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %_M_key_compare = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 0
  %2 = load %"struct.std::pair.5"*, %"struct.std::pair.5"** %__v.addr, align 8
  %call3 = call dereferenceable(8) i64* @_ZNKSt10_Select1stISt4pairIKmP4RealEEclIS0_ImS3_EEERNT_10first_typeERS8_(%"struct.std::_Select1st"* %tmp, %"struct.std::pair.5"* dereferenceable(16) %2)
  %3 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__p.addr, align 8
  %call4 = call dereferenceable(8) i64* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE6_S_keyEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %3)
  %call5 = call zeroext i1 @_ZNKSt4lessImEclERKmS2_(%"struct.std::less"* %_M_key_compare, i64* dereferenceable(8) %call3, i64* dereferenceable(8) %call4)
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false, %entry
  %4 = phi i1 [ true, %lor.lhs.false ], [ true, %entry ], [ %call5, %lor.rhs ]
  %frombool = zext i1 %4 to i8
  store i8 %frombool, i8* %__insert_left, align 1
  %5 = load %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"*, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"** %__node_gen.addr, align 8
  %6 = load %"struct.std::pair.5"*, %"struct.std::pair.5"** %__v.addr, align 8
  %call6 = call dereferenceable(16) %"struct.std::pair.5"* @_ZSt7forwardISt4pairImP4RealEEOT_RNSt16remove_referenceIS4_E4typeE(%"struct.std::pair.5"* dereferenceable(16) %6) #3
  %call7 = call %"struct.std::_Rb_tree_node.11"* @_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11_Alloc_nodeclIS0_ImS3_EEEPSt13_Rb_tree_nodeIS4_EOT_(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"* %5, %"struct.std::pair.5"* dereferenceable(16) %call6)
  store %"struct.std::_Rb_tree_node.11"* %call7, %"struct.std::_Rb_tree_node.11"** %__z, align 8
  %7 = load i8, i8* %__insert_left, align 1
  %tobool = trunc i8 %7 to i1
  %8 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__z, align 8
  %9 = bitcast %"struct.std::_Rb_tree_node.11"* %8 to %"struct.std::_Rb_tree_node_base"*
  %10 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__p.addr, align 8
  %_M_impl8 = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl8, i32 0, i32 1
  call void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i1 zeroext %tobool, %"struct.std::_Rb_tree_node_base"* %9, %"struct.std::_Rb_tree_node_base"* %10, %"struct.std::_Rb_tree_node_base"* dereferenceable(32) %_M_header) #3
  %_M_impl9 = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %_M_node_count = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl9, i32 0, i32 2
  %11 = load i64, i64* %_M_node_count, align 8
  %inc = add i64 %11, 1
  store i64 %inc, i64* %_M_node_count, align 8
  %12 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__z, align 8
  %13 = bitcast %"struct.std::_Rb_tree_node.11"* %12 to %"struct.std::_Rb_tree_node_base"*
  call void @_ZNSt17_Rb_tree_iteratorISt4pairIKmP4RealEEC2EPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_iterator"* %retval, %"struct.std::_Rb_tree_node_base"* %13) #3
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %retval, i32 0, i32 0
  %14 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  ret %"struct.std::_Rb_tree_node_base"* %14
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt4pairISt17_Rb_tree_iteratorIS_IKmP4RealEEbEC2IS5_bLb1EEEOT_OT0_(%"struct.std::pair"* %this, %"struct.std::_Rb_tree_iterator"* dereferenceable(8) %__x, i8* dereferenceable(1) %__y) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::pair"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_iterator"*, align 8
  %__y.addr = alloca i8*, align 8
  store %"struct.std::pair"* %this, %"struct.std::pair"** %this.addr, align 8
  store %"struct.std::_Rb_tree_iterator"* %__x, %"struct.std::_Rb_tree_iterator"** %__x.addr, align 8
  store i8* %__y, i8** %__y.addr, align 8
  %this1 = load %"struct.std::pair"*, %"struct.std::pair"** %this.addr, align 8
  %first = getelementptr inbounds %"struct.std::pair", %"struct.std::pair"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_iterator"*, %"struct.std::_Rb_tree_iterator"** %__x.addr, align 8
  %call = call dereferenceable(8) %"struct.std::_Rb_tree_iterator"* @_ZSt7forwardISt17_Rb_tree_iteratorISt4pairIKmP4RealEEEOT_RNSt16remove_referenceIS7_E4typeE(%"struct.std::_Rb_tree_iterator"* dereferenceable(8) %0) #3
  %1 = bitcast %"struct.std::_Rb_tree_iterator"* %first to i8*
  %2 = bitcast %"struct.std::_Rb_tree_iterator"* %call to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %1, i8* align 8 %2, i64 8, i1 false)
  %second = getelementptr inbounds %"struct.std::pair", %"struct.std::pair"* %this1, i32 0, i32 1
  %3 = load i8*, i8** %__y.addr, align 8
  %call2 = call dereferenceable(1) i8* @_ZSt7forwardIbEOT_RNSt16remove_referenceIS0_E4typeE(i8* dereferenceable(1) %3) #3
  %4 = load i8, i8* %call2, align 1
  %tobool = trunc i8 %4 to i1
  %frombool = zext i1 %tobool to i8
  store i8 %frombool, i8* %second, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE5beginEv(%"class.std::_Rb_tree.1"* %this) #4 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_iterator", align 8
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree.1", %"class.std::_Rb_tree.1"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 1
  %_M_left = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %_M_header, i32 0, i32 2
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_left, align 8
  call void @_ZNSt17_Rb_tree_iteratorISt4pairIKmP4RealEEC2EPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_iterator"* %retval, %"struct.std::_Rb_tree_node_base"* %0) #3
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %retval, i32 0, i32 0
  %1 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  ret %"struct.std::_Rb_tree_node_base"* %1
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt4pairIPSt18_Rb_tree_node_baseS1_EC2IRPSt13_Rb_tree_nodeIS_IKmP4RealEERS1_Lb1EEEOT_OT0_(%"struct.std::pair.14"* %this, %"struct.std::_Rb_tree_node.11"** dereferenceable(8) %__x, %"struct.std::_Rb_tree_node_base"** dereferenceable(8) %__y) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::pair.14"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_node.11"**, align 8
  %__y.addr = alloca %"struct.std::_Rb_tree_node_base"**, align 8
  store %"struct.std::pair.14"* %this, %"struct.std::pair.14"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node.11"** %__x, %"struct.std::_Rb_tree_node.11"*** %__x.addr, align 8
  store %"struct.std::_Rb_tree_node_base"** %__y, %"struct.std::_Rb_tree_node_base"*** %__y.addr, align 8
  %this1 = load %"struct.std::pair.14"*, %"struct.std::pair.14"** %this.addr, align 8
  %first = getelementptr inbounds %"struct.std::pair.14", %"struct.std::pair.14"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node.11"**, %"struct.std::_Rb_tree_node.11"*** %__x.addr, align 8
  %call = call dereferenceable(8) %"struct.std::_Rb_tree_node.11"** @_ZSt7forwardIRPSt13_Rb_tree_nodeISt4pairIKmP4RealEEEOT_RNSt16remove_referenceIS9_E4typeE(%"struct.std::_Rb_tree_node.11"** dereferenceable(8) %0) #3
  %1 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %call, align 8
  %2 = bitcast %"struct.std::_Rb_tree_node.11"* %1 to %"struct.std::_Rb_tree_node_base"*
  store %"struct.std::_Rb_tree_node_base"* %2, %"struct.std::_Rb_tree_node_base"** %first, align 8
  %second = getelementptr inbounds %"struct.std::pair.14", %"struct.std::pair.14"* %this1, i32 0, i32 1
  %3 = load %"struct.std::_Rb_tree_node_base"**, %"struct.std::_Rb_tree_node_base"*** %__y.addr, align 8
  %call2 = call dereferenceable(8) %"struct.std::_Rb_tree_node_base"** @_ZSt7forwardIRPSt18_Rb_tree_node_baseEOT_RNSt16remove_referenceIS3_E4typeE(%"struct.std::_Rb_tree_node_base"** dereferenceable(8) %3) #3
  %4 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %call2, align 8
  store %"struct.std::_Rb_tree_node_base"* %4, %"struct.std::_Rb_tree_node_base"** %second, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) %"struct.std::_Rb_tree_iterator"* @_ZNSt17_Rb_tree_iteratorISt4pairIKmP4RealEEmmEv(%"struct.std::_Rb_tree_iterator"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_iterator"*, align 8
  store %"struct.std::_Rb_tree_iterator"* %this, %"struct.std::_Rb_tree_iterator"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_iterator"*, %"struct.std::_Rb_tree_iterator"** %this.addr, align 8
  %_M_node = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_node, align 8
  %call = call %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %0) #16
  %_M_node2 = getelementptr inbounds %"struct.std::_Rb_tree_iterator", %"struct.std::_Rb_tree_iterator"* %this1, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call, %"struct.std::_Rb_tree_node_base"** %_M_node2, align 8
  ret %"struct.std::_Rb_tree_iterator"* %this1
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt4pairIPSt18_Rb_tree_node_baseS1_EC2IRS1_Lb1EEEOT_RKS1_(%"struct.std::pair.14"* %this, %"struct.std::_Rb_tree_node_base"** dereferenceable(8) %__x, %"struct.std::_Rb_tree_node_base"** dereferenceable(8) %__y) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::pair.14"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"**, align 8
  %__y.addr = alloca %"struct.std::_Rb_tree_node_base"**, align 8
  store %"struct.std::pair.14"* %this, %"struct.std::pair.14"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node_base"** %__x, %"struct.std::_Rb_tree_node_base"*** %__x.addr, align 8
  store %"struct.std::_Rb_tree_node_base"** %__y, %"struct.std::_Rb_tree_node_base"*** %__y.addr, align 8
  %this1 = load %"struct.std::pair.14"*, %"struct.std::pair.14"** %this.addr, align 8
  %first = getelementptr inbounds %"struct.std::pair.14", %"struct.std::pair.14"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"**, %"struct.std::_Rb_tree_node_base"*** %__x.addr, align 8
  %call = call dereferenceable(8) %"struct.std::_Rb_tree_node_base"** @_ZSt7forwardIRPSt18_Rb_tree_node_baseEOT_RNSt16remove_referenceIS3_E4typeE(%"struct.std::_Rb_tree_node_base"** dereferenceable(8) %0) #3
  %1 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %call, align 8
  store %"struct.std::_Rb_tree_node_base"* %1, %"struct.std::_Rb_tree_node_base"** %first, align 8
  %second = getelementptr inbounds %"struct.std::pair.14", %"struct.std::pair.14"* %this1, i32 0, i32 1
  %2 = load %"struct.std::_Rb_tree_node_base"**, %"struct.std::_Rb_tree_node_base"*** %__y.addr, align 8
  %3 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %2, align 8
  store %"struct.std::_Rb_tree_node_base"* %3, %"struct.std::_Rb_tree_node_base"** %second, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) %"struct.std::_Rb_tree_node.11"** @_ZSt7forwardIRPSt13_Rb_tree_nodeISt4pairIKmP4RealEEEOT_RNSt16remove_referenceIS9_E4typeE(%"struct.std::_Rb_tree_node.11"** dereferenceable(8) %__t) #4 comdat {
entry:
  %__t.addr = alloca %"struct.std::_Rb_tree_node.11"**, align 8
  store %"struct.std::_Rb_tree_node.11"** %__t, %"struct.std::_Rb_tree_node.11"*** %__t.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node.11"**, %"struct.std::_Rb_tree_node.11"*** %__t.addr, align 8
  ret %"struct.std::_Rb_tree_node.11"** %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) %"struct.std::_Rb_tree_node_base"** @_ZSt7forwardIRPSt18_Rb_tree_node_baseEOT_RNSt16remove_referenceIS3_E4typeE(%"struct.std::_Rb_tree_node_base"** dereferenceable(8) %__t) #4 comdat {
entry:
  %__t.addr = alloca %"struct.std::_Rb_tree_node_base"**, align 8
  store %"struct.std::_Rb_tree_node_base"** %__t, %"struct.std::_Rb_tree_node_base"*** %__t.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node_base"**, %"struct.std::_Rb_tree_node_base"*** %__t.addr, align 8
  ret %"struct.std::_Rb_tree_node_base"** %0
}

; Function Attrs: nounwind readonly
declare dso_local %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"*) #12

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node.11"* @_ZNKSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11_Alloc_nodeclIS0_ImS3_EEEPSt13_Rb_tree_nodeIS4_EOT_(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"* %this, %"struct.std::pair.5"* dereferenceable(16) %__arg) #5 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"*, align 8
  %__arg.addr = alloca %"struct.std::pair.5"*, align 8
  store %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"* %this, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"** %this.addr, align 8
  store %"struct.std::pair.5"* %__arg, %"struct.std::pair.5"** %__arg.addr, align 8
  %this1 = load %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"*, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, Real *>, std::_Select1st<std::pair<const unsigned long, Real *> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, Real *> > >::_Alloc_node"* %this1, i32 0, i32 0
  %0 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %_M_t, align 8
  %1 = load %"struct.std::pair.5"*, %"struct.std::pair.5"** %__arg.addr, align 8
  %call = call dereferenceable(16) %"struct.std::pair.5"* @_ZSt7forwardISt4pairImP4RealEEOT_RNSt16remove_referenceIS4_E4typeE(%"struct.std::pair.5"* dereferenceable(16) %1) #3
  %call2 = call %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE14_M_create_nodeIJS0_ImS3_EEEEPSt13_Rb_tree_nodeIS4_EDpOT_(%"class.std::_Rb_tree.1"* %0, %"struct.std::pair.5"* dereferenceable(16) %call)
  ret %"struct.std::_Rb_tree_node.11"* %call2
}

; Function Attrs: nounwind
declare dso_local void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i1 zeroext, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* dereferenceable(32)) #2

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE14_M_create_nodeIJS0_ImS3_EEEEPSt13_Rb_tree_nodeIS4_EDpOT_(%"class.std::_Rb_tree.1"* %this, %"struct.std::pair.5"* dereferenceable(16) %__args) #5 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  %__args.addr = alloca %"struct.std::pair.5"*, align 8
  %__tmp = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  store %"struct.std::pair.5"* %__args, %"struct.std::pair.5"** %__args.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %call = call %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11_M_get_nodeEv(%"class.std::_Rb_tree.1"* %this1)
  store %"struct.std::_Rb_tree_node.11"* %call, %"struct.std::_Rb_tree_node.11"** %__tmp, align 8
  %0 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__tmp, align 8
  %1 = load %"struct.std::pair.5"*, %"struct.std::pair.5"** %__args.addr, align 8
  %call2 = call dereferenceable(16) %"struct.std::pair.5"* @_ZSt7forwardISt4pairImP4RealEEOT_RNSt16remove_referenceIS4_E4typeE(%"struct.std::pair.5"* dereferenceable(16) %1) #3
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE17_M_construct_nodeIJS0_ImS3_EEEEvPSt13_Rb_tree_nodeIS4_EDpOT_(%"class.std::_Rb_tree.1"* %this1, %"struct.std::_Rb_tree_node.11"* %0, %"struct.std::pair.5"* dereferenceable(16) %call2)
  %2 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__tmp, align 8
  ret %"struct.std::_Rb_tree_node.11"* %2
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node.11"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11_M_get_nodeEv(%"class.std::_Rb_tree.1"* %this) #5 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %call = call dereferenceable(1) %"class.std::allocator.2"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE21_M_get_Node_allocatorEv(%"class.std::_Rb_tree.1"* %this1) #3
  %call2 = call %"struct.std::_Rb_tree_node.11"* @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEE8allocateERS7_m(%"class.std::allocator.2"* dereferenceable(1) %call, i64 1)
  ret %"struct.std::_Rb_tree_node.11"* %call2
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE17_M_construct_nodeIJS0_ImS3_EEEEvPSt13_Rb_tree_nodeIS4_EDpOT_(%"class.std::_Rb_tree.1"* %this, %"struct.std::_Rb_tree_node.11"* %__node, %"struct.std::pair.5"* dereferenceable(16) %__args) #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::_Rb_tree.1"*, align 8
  %__node.addr = alloca %"struct.std::_Rb_tree_node.11"*, align 8
  %__args.addr = alloca %"struct.std::pair.5"*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %"class.std::_Rb_tree.1"* %this, %"class.std::_Rb_tree.1"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node.11"* %__node, %"struct.std::_Rb_tree_node.11"** %__node.addr, align 8
  store %"struct.std::pair.5"* %__args, %"struct.std::pair.5"** %__args.addr, align 8
  %this1 = load %"class.std::_Rb_tree.1"*, %"class.std::_Rb_tree.1"** %this.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__node.addr, align 8
  %1 = bitcast %"struct.std::_Rb_tree_node.11"* %0 to i8*
  %2 = bitcast i8* %1 to %"struct.std::_Rb_tree_node.11"*
  %call = call dereferenceable(1) %"class.std::allocator.2"* @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE21_M_get_Node_allocatorEv(%"class.std::_Rb_tree.1"* %this1) #3
  %3 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__node.addr, align 8
  %call2 = invoke %"struct.std::pair.13"* @_ZNSt13_Rb_tree_nodeISt4pairIKmP4RealEE9_M_valptrEv(%"struct.std::_Rb_tree_node.11"* %3)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %4 = load %"struct.std::pair.5"*, %"struct.std::pair.5"** %__args.addr, align 8
  %call3 = call dereferenceable(16) %"struct.std::pair.5"* @_ZSt7forwardISt4pairImP4RealEEOT_RNSt16remove_referenceIS4_E4typeE(%"struct.std::pair.5"* dereferenceable(16) %4) #3
  invoke void @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEE9constructIS5_JS1_ImS4_EEEEvRS7_PT_DpOT0_(%"class.std::allocator.2"* dereferenceable(1) %call, %"struct.std::pair.13"* %call2, %"struct.std::pair.5"* dereferenceable(16) %call3)
          to label %invoke.cont4 unwind label %lpad

invoke.cont4:                                     ; preds = %invoke.cont
  br label %try.cont

lpad:                                             ; preds = %invoke.cont, %entry
  %5 = landingpad { i8*, i32 }
          catch i8* null
  %6 = extractvalue { i8*, i32 } %5, 0
  store i8* %6, i8** %exn.slot, align 8
  %7 = extractvalue { i8*, i32 } %5, 1
  store i32 %7, i32* %ehselector.slot, align 4
  br label %catch

catch:                                            ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %8 = call i8* @__cxa_begin_catch(i8* %exn) #3
  %9 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__node.addr, align 8
  %10 = load %"struct.std::_Rb_tree_node.11"*, %"struct.std::_Rb_tree_node.11"** %__node.addr, align 8
  call void @_ZNSt8_Rb_treeImSt4pairIKmP4RealESt10_Select1stIS4_ESt4lessImESaIS4_EE11_M_put_nodeEPSt13_Rb_tree_nodeIS4_E(%"class.std::_Rb_tree.1"* %this1, %"struct.std::_Rb_tree_node.11"* %10) #3
  invoke void @__cxa_rethrow() #14
          to label %unreachable unwind label %lpad5

lpad5:                                            ; preds = %catch
  %11 = landingpad { i8*, i32 }
          cleanup
  %12 = extractvalue { i8*, i32 } %11, 0
  store i8* %12, i8** %exn.slot, align 8
  %13 = extractvalue { i8*, i32 } %11, 1
  store i32 %13, i32* %ehselector.slot, align 4
  invoke void @__cxa_end_catch()
          to label %invoke.cont6 unwind label %terminate.lpad

invoke.cont6:                                     ; preds = %lpad5
  br label %eh.resume

try.cont:                                         ; preds = %invoke.cont4
  ret void

eh.resume:                                        ; preds = %invoke.cont6
  %exn7 = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn7, 0
  %lpad.val8 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val8

terminate.lpad:                                   ; preds = %lpad5
  %14 = landingpad { i8*, i32 }
          catch i8* null
  %15 = extractvalue { i8*, i32 } %14, 0
  call void @__clang_call_terminate(i8* %15) #13
  unreachable

unreachable:                                      ; preds = %catch
  unreachable
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node.11"* @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEE8allocateERS7_m(%"class.std::allocator.2"* dereferenceable(1) %__a, i64 %__n) #5 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator.2"*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::allocator.2"* %__a, %"class.std::allocator.2"** %__a.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %0 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator.2"* %0 to %"class.__gnu_cxx::new_allocator.3"*
  %2 = load i64, i64* %__n.addr, align 8
  %call = call %"struct.std::_Rb_tree_node.11"* @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE8allocateEmPKv(%"class.__gnu_cxx::new_allocator.3"* %1, i64 %2, i8* null)
  ret %"struct.std::_Rb_tree_node.11"* %call
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node.11"* @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE8allocateEmPKv(%"class.__gnu_cxx::new_allocator.3"* %this, i64 %__n, i8*) #5 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  %__n.addr = alloca i64, align 8
  %.addr = alloca i8*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  store i8* %0, i8** %.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %1 = load i64, i64* %__n.addr, align 8
  %call = call i64 @_ZNK9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE8max_sizeEv(%"class.__gnu_cxx::new_allocator.3"* %this1) #3
  %cmp = icmp ugt i64 %1, %call
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @_ZSt17__throw_bad_allocv() #14
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i64, i64* %__n.addr, align 8
  %mul = mul i64 %2, 48
  %call2 = call i8* @_Znwm(i64 %mul)
  %3 = bitcast i8* %call2 to %"struct.std::_Rb_tree_node.11"*
  ret %"struct.std::_Rb_tree_node.11"* %3
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNK9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE8max_sizeEv(%"class.__gnu_cxx::new_allocator.3"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  ret i64 384307168202282325
}

; Function Attrs: noreturn
declare dso_local void @_ZSt17__throw_bad_allocv() #11

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmP4RealEEEE9constructIS5_JS1_ImS4_EEEEvRS7_PT_DpOT0_(%"class.std::allocator.2"* dereferenceable(1) %__a, %"struct.std::pair.13"* %__p, %"struct.std::pair.5"* dereferenceable(16) %__args) #5 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator.2"*, align 8
  %__p.addr = alloca %"struct.std::pair.13"*, align 8
  %__args.addr = alloca %"struct.std::pair.5"*, align 8
  store %"class.std::allocator.2"* %__a, %"class.std::allocator.2"** %__a.addr, align 8
  store %"struct.std::pair.13"* %__p, %"struct.std::pair.13"** %__p.addr, align 8
  store %"struct.std::pair.5"* %__args, %"struct.std::pair.5"** %__args.addr, align 8
  %0 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator.2"* %0 to %"class.__gnu_cxx::new_allocator.3"*
  %2 = load %"struct.std::pair.13"*, %"struct.std::pair.13"** %__p.addr, align 8
  %3 = load %"struct.std::pair.5"*, %"struct.std::pair.5"** %__args.addr, align 8
  %call = call dereferenceable(16) %"struct.std::pair.5"* @_ZSt7forwardISt4pairImP4RealEEOT_RNSt16remove_referenceIS4_E4typeE(%"struct.std::pair.5"* dereferenceable(16) %3) #3
  call void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE9constructIS6_JS2_ImS5_EEEEvPT_DpOT0_(%"class.__gnu_cxx::new_allocator.3"* %1, %"struct.std::pair.13"* %2, %"struct.std::pair.5"* dereferenceable(16) %call)
  ret void
}

declare void @__cxa_rethrow()

declare void @__cxa_end_catch()

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmP4RealEEE9constructIS6_JS2_ImS5_EEEEvPT_DpOT0_(%"class.__gnu_cxx::new_allocator.3"* %this, %"struct.std::pair.13"* %__p, %"struct.std::pair.5"* dereferenceable(16) %__args) #5 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  %__p.addr = alloca %"struct.std::pair.13"*, align 8
  %__args.addr = alloca %"struct.std::pair.5"*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  store %"struct.std::pair.13"* %__p, %"struct.std::pair.13"** %__p.addr, align 8
  store %"struct.std::pair.5"* %__args, %"struct.std::pair.5"** %__args.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %0 = load %"struct.std::pair.13"*, %"struct.std::pair.13"** %__p.addr, align 8
  %1 = bitcast %"struct.std::pair.13"* %0 to i8*
  %2 = bitcast i8* %1 to %"struct.std::pair.13"*
  %3 = load %"struct.std::pair.5"*, %"struct.std::pair.5"** %__args.addr, align 8
  %call = call dereferenceable(16) %"struct.std::pair.5"* @_ZSt7forwardISt4pairImP4RealEEOT_RNSt16remove_referenceIS4_E4typeE(%"struct.std::pair.5"* dereferenceable(16) %3) #3
  call void @_ZNSt4pairIKmP4RealEC2ImS2_Lb1EEEOS_IT_T0_E(%"struct.std::pair.13"* %2, %"struct.std::pair.5"* dereferenceable(16) %call)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt4pairIKmP4RealEC2ImS2_Lb1EEEOS_IT_T0_E(%"struct.std::pair.13"* %this, %"struct.std::pair.5"* dereferenceable(16) %__p) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::pair.13"*, align 8
  %__p.addr = alloca %"struct.std::pair.5"*, align 8
  store %"struct.std::pair.13"* %this, %"struct.std::pair.13"** %this.addr, align 8
  store %"struct.std::pair.5"* %__p, %"struct.std::pair.5"** %__p.addr, align 8
  %this1 = load %"struct.std::pair.13"*, %"struct.std::pair.13"** %this.addr, align 8
  %first = getelementptr inbounds %"struct.std::pair.13", %"struct.std::pair.13"* %this1, i32 0, i32 0
  %0 = load %"struct.std::pair.5"*, %"struct.std::pair.5"** %__p.addr, align 8
  %first2 = getelementptr inbounds %"struct.std::pair.5", %"struct.std::pair.5"* %0, i32 0, i32 0
  %call = call dereferenceable(8) i64* @_ZSt7forwardImEOT_RNSt16remove_referenceIS0_E4typeE(i64* dereferenceable(8) %first2) #3
  %1 = load i64, i64* %call, align 8
  store i64 %1, i64* %first, align 8
  %second = getelementptr inbounds %"struct.std::pair.13", %"struct.std::pair.13"* %this1, i32 0, i32 1
  %2 = load %"struct.std::pair.5"*, %"struct.std::pair.5"** %__p.addr, align 8
  %second3 = getelementptr inbounds %"struct.std::pair.5", %"struct.std::pair.5"* %2, i32 0, i32 1
  %call4 = call dereferenceable(8) %struct.Real** @_ZSt7forwardIP4RealEOT_RNSt16remove_referenceIS2_E4typeE(%struct.Real** dereferenceable(8) %second3) #3
  %3 = load %struct.Real*, %struct.Real** %call4, align 8
  store %struct.Real* %3, %struct.Real** %second, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) i64* @_ZSt7forwardImEOT_RNSt16remove_referenceIS0_E4typeE(i64* dereferenceable(8) %__t) #4 comdat {
entry:
  %__t.addr = alloca i64*, align 8
  store i64* %__t, i64** %__t.addr, align 8
  %0 = load i64*, i64** %__t.addr, align 8
  ret i64* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) %struct.Real** @_ZSt7forwardIP4RealEOT_RNSt16remove_referenceIS2_E4typeE(%struct.Real** dereferenceable(8) %__t) #4 comdat {
entry:
  %__t.addr = alloca %struct.Real**, align 8
  store %struct.Real** %__t, %struct.Real*** %__t.addr, align 8
  %0 = load %struct.Real**, %struct.Real*** %__t.addr, align 8
  ret %struct.Real** %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) %"struct.std::_Rb_tree_iterator"* @_ZSt7forwardISt17_Rb_tree_iteratorISt4pairIKmP4RealEEEOT_RNSt16remove_referenceIS7_E4typeE(%"struct.std::_Rb_tree_iterator"* dereferenceable(8) %__t) #4 comdat {
entry:
  %__t.addr = alloca %"struct.std::_Rb_tree_iterator"*, align 8
  store %"struct.std::_Rb_tree_iterator"* %__t, %"struct.std::_Rb_tree_iterator"** %__t.addr, align 8
  %0 = load %"struct.std::_Rb_tree_iterator"*, %"struct.std::_Rb_tree_iterator"** %__t.addr, align 8
  ret %"struct.std::_Rb_tree_iterator"* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(1) i8* @_ZSt7forwardIbEOT_RNSt16remove_referenceIS0_E4typeE(i8* dereferenceable(1) %__t) #4 comdat {
entry:
  %__t.addr = alloca i8*, align 8
  store i8* %__t, i8** %__t.addr, align 8
  %0 = load i8*, i8** %__t.addr, align 8
  ret i8* %0
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local { %"struct.std::_Rb_tree_node_base"*, i8 } @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE16_M_insert_uniqueIS0_ImmEEES0_ISt17_Rb_tree_iteratorIS2_EbEOT_(%"class.std::_Rb_tree"* %this, %"struct.std::pair.9"* dereferenceable(16) %__v) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::pair.6", align 8
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %__v.addr = alloca %"struct.std::pair.9"*, align 8
  %__res = alloca %"struct.std::pair.14", align 8
  %tmp = alloca %"struct.std::_Select1st.15", align 1
  %__an = alloca %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node", align 8
  %ref.tmp = alloca %"struct.std::_Rb_tree_iterator.7", align 8
  %ref.tmp6 = alloca i8, align 1
  %ref.tmp7 = alloca %"struct.std::_Rb_tree_iterator.7", align 8
  %ref.tmp9 = alloca i8, align 1
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  store %"struct.std::pair.9"* %__v, %"struct.std::pair.9"** %__v.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %0 = load %"struct.std::pair.9"*, %"struct.std::pair.9"** %__v.addr, align 8
  %call = call dereferenceable(8) i64* @_ZNKSt10_Select1stISt4pairIKmmEEclIS0_ImmEEERNT_10first_typeERS6_(%"struct.std::_Select1st.15"* %tmp, %"struct.std::pair.9"* dereferenceable(16) %0)
  %call2 = call { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* } @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE24_M_get_insert_unique_posERS1_(%"class.std::_Rb_tree"* %this1, i64* dereferenceable(8) %call)
  %1 = bitcast %"struct.std::pair.14"* %__res to { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }*
  %2 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }, { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }* %1, i32 0, i32 0
  %3 = extractvalue { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* } %call2, 0
  store %"struct.std::_Rb_tree_node_base"* %3, %"struct.std::_Rb_tree_node_base"** %2, align 8
  %4 = getelementptr inbounds { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }, { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }* %1, i32 0, i32 1
  %5 = extractvalue { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* } %call2, 1
  store %"struct.std::_Rb_tree_node_base"* %5, %"struct.std::_Rb_tree_node_base"** %4, align 8
  %second = getelementptr inbounds %"struct.std::pair.14", %"struct.std::pair.14"* %__res, i32 0, i32 1
  %6 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %second, align 8
  %tobool = icmp ne %"struct.std::_Rb_tree_node_base"* %6, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE11_Alloc_nodeC2ERS8_(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"* %__an, %"class.std::_Rb_tree"* dereferenceable(48) %this1)
  %first = getelementptr inbounds %"struct.std::pair.14", %"struct.std::pair.14"* %__res, i32 0, i32 0
  %7 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %first, align 8
  %second3 = getelementptr inbounds %"struct.std::pair.14", %"struct.std::pair.14"* %__res, i32 0, i32 1
  %8 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %second3, align 8
  %9 = load %"struct.std::pair.9"*, %"struct.std::pair.9"** %__v.addr, align 8
  %call4 = call dereferenceable(16) %"struct.std::pair.9"* @_ZSt7forwardISt4pairImmEEOT_RNSt16remove_referenceIS2_E4typeE(%"struct.std::pair.9"* dereferenceable(16) %9) #3
  %call5 = call %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE10_M_insert_IS0_ImmENS8_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS2_EPSt18_Rb_tree_node_baseSF_OT_RT0_(%"class.std::_Rb_tree"* %this1, %"struct.std::_Rb_tree_node_base"* %7, %"struct.std::_Rb_tree_node_base"* %8, %"struct.std::pair.9"* dereferenceable(16) %call4, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"* dereferenceable(8) %__an)
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %ref.tmp, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call5, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  store i8 1, i8* %ref.tmp6, align 1
  call void @_ZNSt4pairISt17_Rb_tree_iteratorIS_IKmmEEbEC2IS3_bLb1EEEOT_OT0_(%"struct.std::pair.6"* %retval, %"struct.std::_Rb_tree_iterator.7"* dereferenceable(8) %ref.tmp, i8* dereferenceable(1) %ref.tmp6)
  br label %return

if.end:                                           ; preds = %entry
  %first8 = getelementptr inbounds %"struct.std::pair.14", %"struct.std::pair.14"* %__res, i32 0, i32 0
  %10 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %first8, align 8
  call void @_ZNSt17_Rb_tree_iteratorISt4pairIKmmEEC2EPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_iterator.7"* %ref.tmp7, %"struct.std::_Rb_tree_node_base"* %10) #3
  store i8 0, i8* %ref.tmp9, align 1
  call void @_ZNSt4pairISt17_Rb_tree_iteratorIS_IKmmEEbEC2IS3_bLb1EEEOT_OT0_(%"struct.std::pair.6"* %retval, %"struct.std::_Rb_tree_iterator.7"* dereferenceable(8) %ref.tmp7, i8* dereferenceable(1) %ref.tmp9)
  br label %return

return:                                           ; preds = %if.end, %if.then
  %11 = bitcast %"struct.std::pair.6"* %retval to { %"struct.std::_Rb_tree_node_base"*, i8 }*
  %12 = load { %"struct.std::_Rb_tree_node_base"*, i8 }, { %"struct.std::_Rb_tree_node_base"*, i8 }* %11, align 8
  ret { %"struct.std::_Rb_tree_node_base"*, i8 } %12
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %"struct.std::pair.9"* @_ZSt7forwardISt4pairImmEEOT_RNSt16remove_referenceIS2_E4typeE(%"struct.std::pair.9"* dereferenceable(16) %__t) #4 comdat {
entry:
  %__t.addr = alloca %"struct.std::pair.9"*, align 8
  store %"struct.std::pair.9"* %__t, %"struct.std::pair.9"** %__t.addr, align 8
  %0 = load %"struct.std::pair.9"*, %"struct.std::pair.9"** %__t.addr, align 8
  ret %"struct.std::pair.9"* %0
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* } @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE24_M_get_insert_unique_posERS1_(%"class.std::_Rb_tree"* %this, i64* dereferenceable(8) %__k) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::pair.14", align 8
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %__k.addr = alloca i64*, align 8
  %__x = alloca %"struct.std::_Rb_tree_node"*, align 8
  %__y = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  %__comp = alloca i8, align 1
  %__j = alloca %"struct.std::_Rb_tree_iterator.7", align 8
  %ref.tmp = alloca %"struct.std::_Rb_tree_iterator.7", align 8
  %ref.tmp20 = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  store i64* %__k, i64** %__k.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %call = call %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_M_beginEv(%"class.std::_Rb_tree"* %this1) #3
  store %"struct.std::_Rb_tree_node"* %call, %"struct.std::_Rb_tree_node"** %__x, align 8
  %call2 = call %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_M_endEv(%"class.std::_Rb_tree"* %this1) #3
  store %"struct.std::_Rb_tree_node_base"* %call2, %"struct.std::_Rb_tree_node_base"** %__y, align 8
  store i8 1, i8* %__comp, align 1
  br label %while.cond

while.cond:                                       ; preds = %cond.end, %entry
  %0 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x, align 8
  %cmp = icmp ne %"struct.std::_Rb_tree_node"* %0, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x, align 8
  %2 = bitcast %"struct.std::_Rb_tree_node"* %1 to %"struct.std::_Rb_tree_node_base"*
  store %"struct.std::_Rb_tree_node_base"* %2, %"struct.std::_Rb_tree_node_base"** %__y, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_key_compare = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 0
  %3 = load i64*, i64** %__k.addr, align 8
  %4 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x, align 8
  %call3 = call dereferenceable(8) i64* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_S_keyEPKSt13_Rb_tree_nodeIS2_E(%"struct.std::_Rb_tree_node"* %4)
  %call4 = call zeroext i1 @_ZNKSt4lessImEclERKmS2_(%"struct.std::less"* %_M_key_compare, i64* dereferenceable(8) %3, i64* dereferenceable(8) %call3)
  %frombool = zext i1 %call4 to i8
  store i8 %frombool, i8* %__comp, align 1
  %5 = load i8, i8* %__comp, align 1
  %tobool = trunc i8 %5 to i1
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  %6 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x, align 8
  %7 = bitcast %"struct.std::_Rb_tree_node"* %6 to %"struct.std::_Rb_tree_node_base"*
  %call5 = call %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE7_S_leftEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %7) #3
  br label %cond.end

cond.false:                                       ; preds = %while.body
  %8 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x, align 8
  %9 = bitcast %"struct.std::_Rb_tree_node"* %8 to %"struct.std::_Rb_tree_node_base"*
  %call6 = call %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_S_rightEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %9) #3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %"struct.std::_Rb_tree_node"* [ %call5, %cond.true ], [ %call6, %cond.false ]
  store %"struct.std::_Rb_tree_node"* %cond, %"struct.std::_Rb_tree_node"** %__x, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %10 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__y, align 8
  call void @_ZNSt17_Rb_tree_iteratorISt4pairIKmmEEC2EPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_iterator.7"* %__j, %"struct.std::_Rb_tree_node_base"* %10) #3
  %11 = load i8, i8* %__comp, align 1
  %tobool7 = trunc i8 %11 to i1
  br i1 %tobool7, label %if.then, label %if.end12

if.then:                                          ; preds = %while.end
  %call8 = call %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE5beginEv(%"class.std::_Rb_tree"* %this1) #3
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %ref.tmp, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call8, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  %call9 = call zeroext i1 @_ZNKSt17_Rb_tree_iteratorISt4pairIKmmEEeqERKS3_(%"struct.std::_Rb_tree_iterator.7"* %__j, %"struct.std::_Rb_tree_iterator.7"* dereferenceable(8) %ref.tmp) #3
  br i1 %call9, label %if.then10, label %if.else

if.then10:                                        ; preds = %if.then
  call void @_ZNSt4pairIPSt18_Rb_tree_node_baseS1_EC2IRPSt13_Rb_tree_nodeIS_IKmmEERS1_Lb1EEEOT_OT0_(%"struct.std::pair.14"* %retval, %"struct.std::_Rb_tree_node"** dereferenceable(8) %__x, %"struct.std::_Rb_tree_node_base"** dereferenceable(8) %__y)
  br label %return

if.else:                                          ; preds = %if.then
  %call11 = call dereferenceable(8) %"struct.std::_Rb_tree_iterator.7"* @_ZNSt17_Rb_tree_iteratorISt4pairIKmmEEmmEv(%"struct.std::_Rb_tree_iterator.7"* %__j) #3
  br label %if.end

if.end:                                           ; preds = %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end, %while.end
  %_M_impl13 = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_key_compare14 = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl13, i32 0, i32 0
  %_M_node = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %__j, i32 0, i32 0
  %12 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_node, align 8
  %call15 = call dereferenceable(8) i64* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_S_keyEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %12)
  %13 = load i64*, i64** %__k.addr, align 8
  %call16 = call zeroext i1 @_ZNKSt4lessImEclERKmS2_(%"struct.std::less"* %_M_key_compare14, i64* dereferenceable(8) %call15, i64* dereferenceable(8) %13)
  br i1 %call16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end12
  call void @_ZNSt4pairIPSt18_Rb_tree_node_baseS1_EC2IRPSt13_Rb_tree_nodeIS_IKmmEERS1_Lb1EEEOT_OT0_(%"struct.std::pair.14"* %retval, %"struct.std::_Rb_tree_node"** dereferenceable(8) %__x, %"struct.std::_Rb_tree_node_base"** dereferenceable(8) %__y)
  br label %return

if.end18:                                         ; preds = %if.end12
  %_M_node19 = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %__j, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* null, %"struct.std::_Rb_tree_node_base"** %ref.tmp20, align 8
  call void @_ZNSt4pairIPSt18_Rb_tree_node_baseS1_EC2IRS1_Lb1EEEOT_RKS1_(%"struct.std::pair.14"* %retval, %"struct.std::_Rb_tree_node_base"** dereferenceable(8) %_M_node19, %"struct.std::_Rb_tree_node_base"** dereferenceable(8) %ref.tmp20)
  br label %return

return:                                           ; preds = %if.end18, %if.then17, %if.then10
  %14 = bitcast %"struct.std::pair.14"* %retval to { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }*
  %15 = load { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }, { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }* %14, align 8
  ret { %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* } %15
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) i64* @_ZNKSt10_Select1stISt4pairIKmmEEclIS0_ImmEEERNT_10first_typeERS6_(%"struct.std::_Select1st.15"* %this, %"struct.std::pair.9"* dereferenceable(16) %__x) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Select1st.15"*, align 8
  %__x.addr = alloca %"struct.std::pair.9"*, align 8
  store %"struct.std::_Select1st.15"* %this, %"struct.std::_Select1st.15"** %this.addr, align 8
  store %"struct.std::pair.9"* %__x, %"struct.std::pair.9"** %__x.addr, align 8
  %this1 = load %"struct.std::_Select1st.15"*, %"struct.std::_Select1st.15"** %this.addr, align 8
  %0 = load %"struct.std::pair.9"*, %"struct.std::pair.9"** %__x.addr, align 8
  %first = getelementptr inbounds %"struct.std::pair.9", %"struct.std::pair.9"* %0, i32 0, i32 0
  ret i64* %first
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE11_Alloc_nodeC2ERS8_(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"* %this, %"class.std::_Rb_tree"* dereferenceable(48) %__t) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"*, align 8
  %__t.addr = alloca %"class.std::_Rb_tree"*, align 8
  store %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"* %this, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"** %this.addr, align 8
  store %"class.std::_Rb_tree"* %__t, %"class.std::_Rb_tree"** %__t.addr, align 8
  %this1 = load %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"*, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"* %this1, i32 0, i32 0
  %0 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %__t.addr, align 8
  store %"class.std::_Rb_tree"* %0, %"class.std::_Rb_tree"** %_M_t, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE10_M_insert_IS0_ImmENS8_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS2_EPSt18_Rb_tree_node_baseSF_OT_RT0_(%"class.std::_Rb_tree"* %this, %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"* %__p, %"struct.std::pair.9"* dereferenceable(16) %__v, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"* dereferenceable(8) %__node_gen) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_iterator.7", align 8
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  %__p.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  %__v.addr = alloca %"struct.std::pair.9"*, align 8
  %__node_gen.addr = alloca %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"*, align 8
  %__insert_left = alloca i8, align 1
  %tmp = alloca %"struct.std::_Select1st.15", align 1
  %__z = alloca %"struct.std::_Rb_tree_node"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  store %"struct.std::_Rb_tree_node_base"* %__p, %"struct.std::_Rb_tree_node_base"** %__p.addr, align 8
  store %"struct.std::pair.9"* %__v, %"struct.std::pair.9"** %__v.addr, align 8
  store %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"* %__node_gen, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"** %__node_gen.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %cmp = icmp ne %"struct.std::_Rb_tree_node_base"* %0, null
  br i1 %cmp, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__p.addr, align 8
  %call = call %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_M_endEv(%"class.std::_Rb_tree"* %this1) #3
  %cmp2 = icmp eq %"struct.std::_Rb_tree_node_base"* %1, %call
  br i1 %cmp2, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_key_compare = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 0
  %2 = load %"struct.std::pair.9"*, %"struct.std::pair.9"** %__v.addr, align 8
  %call3 = call dereferenceable(8) i64* @_ZNKSt10_Select1stISt4pairIKmmEEclIS0_ImmEEERNT_10first_typeERS6_(%"struct.std::_Select1st.15"* %tmp, %"struct.std::pair.9"* dereferenceable(16) %2)
  %3 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__p.addr, align 8
  %call4 = call dereferenceable(8) i64* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_S_keyEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %3)
  %call5 = call zeroext i1 @_ZNKSt4lessImEclERKmS2_(%"struct.std::less"* %_M_key_compare, i64* dereferenceable(8) %call3, i64* dereferenceable(8) %call4)
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false, %entry
  %4 = phi i1 [ true, %lor.lhs.false ], [ true, %entry ], [ %call5, %lor.rhs ]
  %frombool = zext i1 %4 to i8
  store i8 %frombool, i8* %__insert_left, align 1
  %5 = load %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"*, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"** %__node_gen.addr, align 8
  %6 = load %"struct.std::pair.9"*, %"struct.std::pair.9"** %__v.addr, align 8
  %call6 = call dereferenceable(16) %"struct.std::pair.9"* @_ZSt7forwardISt4pairImmEEOT_RNSt16remove_referenceIS2_E4typeE(%"struct.std::pair.9"* dereferenceable(16) %6) #3
  %call7 = call %"struct.std::_Rb_tree_node"* @_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE11_Alloc_nodeclIS0_ImmEEEPSt13_Rb_tree_nodeIS2_EOT_(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"* %5, %"struct.std::pair.9"* dereferenceable(16) %call6)
  store %"struct.std::_Rb_tree_node"* %call7, %"struct.std::_Rb_tree_node"** %__z, align 8
  %7 = load i8, i8* %__insert_left, align 1
  %tobool = trunc i8 %7 to i1
  %8 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__z, align 8
  %9 = bitcast %"struct.std::_Rb_tree_node"* %8 to %"struct.std::_Rb_tree_node_base"*
  %10 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__p.addr, align 8
  %_M_impl8 = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl8, i32 0, i32 1
  call void @_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_(i1 zeroext %tobool, %"struct.std::_Rb_tree_node_base"* %9, %"struct.std::_Rb_tree_node_base"* %10, %"struct.std::_Rb_tree_node_base"* dereferenceable(32) %_M_header) #3
  %_M_impl9 = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_node_count = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl9, i32 0, i32 2
  %11 = load i64, i64* %_M_node_count, align 8
  %inc = add i64 %11, 1
  store i64 %inc, i64* %_M_node_count, align 8
  %12 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__z, align 8
  %13 = bitcast %"struct.std::_Rb_tree_node"* %12 to %"struct.std::_Rb_tree_node_base"*
  call void @_ZNSt17_Rb_tree_iteratorISt4pairIKmmEEC2EPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_iterator.7"* %retval, %"struct.std::_Rb_tree_node_base"* %13) #3
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %retval, i32 0, i32 0
  %14 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  ret %"struct.std::_Rb_tree_node_base"* %14
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt4pairISt17_Rb_tree_iteratorIS_IKmmEEbEC2IS3_bLb1EEEOT_OT0_(%"struct.std::pair.6"* %this, %"struct.std::_Rb_tree_iterator.7"* dereferenceable(8) %__x, i8* dereferenceable(1) %__y) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::pair.6"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_iterator.7"*, align 8
  %__y.addr = alloca i8*, align 8
  store %"struct.std::pair.6"* %this, %"struct.std::pair.6"** %this.addr, align 8
  store %"struct.std::_Rb_tree_iterator.7"* %__x, %"struct.std::_Rb_tree_iterator.7"** %__x.addr, align 8
  store i8* %__y, i8** %__y.addr, align 8
  %this1 = load %"struct.std::pair.6"*, %"struct.std::pair.6"** %this.addr, align 8
  %first = getelementptr inbounds %"struct.std::pair.6", %"struct.std::pair.6"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_iterator.7"*, %"struct.std::_Rb_tree_iterator.7"** %__x.addr, align 8
  %call = call dereferenceable(8) %"struct.std::_Rb_tree_iterator.7"* @_ZSt7forwardISt17_Rb_tree_iteratorISt4pairIKmmEEEOT_RNSt16remove_referenceIS5_E4typeE(%"struct.std::_Rb_tree_iterator.7"* dereferenceable(8) %0) #3
  %1 = bitcast %"struct.std::_Rb_tree_iterator.7"* %first to i8*
  %2 = bitcast %"struct.std::_Rb_tree_iterator.7"* %call to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %1, i8* align 8 %2, i64 8, i1 false)
  %second = getelementptr inbounds %"struct.std::pair.6", %"struct.std::pair.6"* %this1, i32 0, i32 1
  %3 = load i8*, i8** %__y.addr, align 8
  %call2 = call dereferenceable(1) i8* @_ZSt7forwardIbEOT_RNSt16remove_referenceIS0_E4typeE(i8* dereferenceable(1) %3) #3
  %4 = load i8, i8* %call2, align 1
  %tobool = trunc i8 %4 to i1
  %frombool = zext i1 %tobool to i8
  store i8 %frombool, i8* %second, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt17_Rb_tree_iteratorISt4pairIKmmEEC2EPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_iterator.7"* %this, %"struct.std::_Rb_tree_node_base"* %__x) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_iterator.7"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  store %"struct.std::_Rb_tree_iterator.7"* %this, %"struct.std::_Rb_tree_iterator.7"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_iterator.7"*, %"struct.std::_Rb_tree_iterator.7"** %this.addr, align 8
  %_M_node = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  store %"struct.std::_Rb_tree_node_base"* %0, %"struct.std::_Rb_tree_node_base"** %_M_node, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_M_endEv(%"class.std::_Rb_tree"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 1
  ret %"struct.std::_Rb_tree_node_base"* %_M_header
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(8) i64* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_S_keyEPKSt13_Rb_tree_nodeIS2_E(%"struct.std::_Rb_tree_node"* %__x) #5 comdat align 2 {
entry:
  %__x.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  %tmp = alloca %"struct.std::_Select1st.15", align 1
  store %"struct.std::_Rb_tree_node"* %__x, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %call = call dereferenceable(16) %"struct.std::pair.10"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_S_valueEPKSt13_Rb_tree_nodeIS2_E(%"struct.std::_Rb_tree_node"* %0)
  %call1 = call dereferenceable(8) i64* @_ZNKSt10_Select1stISt4pairIKmmEEclERKS2_(%"struct.std::_Select1st.15"* %tmp, %"struct.std::pair.10"* dereferenceable(16) %call)
  ret i64* %call1
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNKSt17_Rb_tree_iteratorISt4pairIKmmEEeqERKS3_(%"struct.std::_Rb_tree_iterator.7"* %this, %"struct.std::_Rb_tree_iterator.7"* dereferenceable(8) %__x) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_iterator.7"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_iterator.7"*, align 8
  store %"struct.std::_Rb_tree_iterator.7"* %this, %"struct.std::_Rb_tree_iterator.7"** %this.addr, align 8
  store %"struct.std::_Rb_tree_iterator.7"* %__x, %"struct.std::_Rb_tree_iterator.7"** %__x.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_iterator.7"*, %"struct.std::_Rb_tree_iterator.7"** %this.addr, align 8
  %_M_node = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_node, align 8
  %1 = load %"struct.std::_Rb_tree_iterator.7"*, %"struct.std::_Rb_tree_iterator.7"** %__x.addr, align 8
  %_M_node2 = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %1, i32 0, i32 0
  %2 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_node2, align 8
  %cmp = icmp eq %"struct.std::_Rb_tree_node_base"* %0, %2
  ret i1 %cmp
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE5beginEv(%"class.std::_Rb_tree"* %this) #4 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_iterator.7", align 8
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 1
  %_M_left = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %_M_header, i32 0, i32 2
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_left, align 8
  call void @_ZNSt17_Rb_tree_iteratorISt4pairIKmmEEC2EPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_iterator.7"* %retval, %"struct.std::_Rb_tree_node_base"* %0) #3
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %retval, i32 0, i32 0
  %1 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  ret %"struct.std::_Rb_tree_node_base"* %1
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt4pairIPSt18_Rb_tree_node_baseS1_EC2IRPSt13_Rb_tree_nodeIS_IKmmEERS1_Lb1EEEOT_OT0_(%"struct.std::pair.14"* %this, %"struct.std::_Rb_tree_node"** dereferenceable(8) %__x, %"struct.std::_Rb_tree_node_base"** dereferenceable(8) %__y) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::pair.14"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_node"**, align 8
  %__y.addr = alloca %"struct.std::_Rb_tree_node_base"**, align 8
  store %"struct.std::pair.14"* %this, %"struct.std::pair.14"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node"** %__x, %"struct.std::_Rb_tree_node"*** %__x.addr, align 8
  store %"struct.std::_Rb_tree_node_base"** %__y, %"struct.std::_Rb_tree_node_base"*** %__y.addr, align 8
  %this1 = load %"struct.std::pair.14"*, %"struct.std::pair.14"** %this.addr, align 8
  %first = getelementptr inbounds %"struct.std::pair.14", %"struct.std::pair.14"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node"**, %"struct.std::_Rb_tree_node"*** %__x.addr, align 8
  %call = call dereferenceable(8) %"struct.std::_Rb_tree_node"** @_ZSt7forwardIRPSt13_Rb_tree_nodeISt4pairIKmmEEEOT_RNSt16remove_referenceIS7_E4typeE(%"struct.std::_Rb_tree_node"** dereferenceable(8) %0) #3
  %1 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %call, align 8
  %2 = bitcast %"struct.std::_Rb_tree_node"* %1 to %"struct.std::_Rb_tree_node_base"*
  store %"struct.std::_Rb_tree_node_base"* %2, %"struct.std::_Rb_tree_node_base"** %first, align 8
  %second = getelementptr inbounds %"struct.std::pair.14", %"struct.std::pair.14"* %this1, i32 0, i32 1
  %3 = load %"struct.std::_Rb_tree_node_base"**, %"struct.std::_Rb_tree_node_base"*** %__y.addr, align 8
  %call2 = call dereferenceable(8) %"struct.std::_Rb_tree_node_base"** @_ZSt7forwardIRPSt18_Rb_tree_node_baseEOT_RNSt16remove_referenceIS3_E4typeE(%"struct.std::_Rb_tree_node_base"** dereferenceable(8) %3) #3
  %4 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %call2, align 8
  store %"struct.std::_Rb_tree_node_base"* %4, %"struct.std::_Rb_tree_node_base"** %second, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) %"struct.std::_Rb_tree_iterator.7"* @_ZNSt17_Rb_tree_iteratorISt4pairIKmmEEmmEv(%"struct.std::_Rb_tree_iterator.7"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_iterator.7"*, align 8
  store %"struct.std::_Rb_tree_iterator.7"* %this, %"struct.std::_Rb_tree_iterator.7"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_iterator.7"*, %"struct.std::_Rb_tree_iterator.7"** %this.addr, align 8
  %_M_node = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_node, align 8
  %call = call %"struct.std::_Rb_tree_node_base"* @_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %0) #16
  %_M_node2 = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %this1, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call, %"struct.std::_Rb_tree_node_base"** %_M_node2, align 8
  ret %"struct.std::_Rb_tree_iterator.7"* %this1
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(8) i64* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_S_keyEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x) #5 comdat align 2 {
entry:
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  %tmp = alloca %"struct.std::_Select1st.15", align 1
  store %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %call = call dereferenceable(16) %"struct.std::pair.10"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_S_valueEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %0)
  %call1 = call dereferenceable(8) i64* @_ZNKSt10_Select1stISt4pairIKmmEEclERKS2_(%"struct.std::_Select1st.15"* %tmp, %"struct.std::pair.10"* dereferenceable(16) %call)
  ret i64* %call1
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) i64* @_ZNKSt10_Select1stISt4pairIKmmEEclERKS2_(%"struct.std::_Select1st.15"* %this, %"struct.std::pair.10"* dereferenceable(16) %__x) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Select1st.15"*, align 8
  %__x.addr = alloca %"struct.std::pair.10"*, align 8
  store %"struct.std::_Select1st.15"* %this, %"struct.std::_Select1st.15"** %this.addr, align 8
  store %"struct.std::pair.10"* %__x, %"struct.std::pair.10"** %__x.addr, align 8
  %this1 = load %"struct.std::_Select1st.15"*, %"struct.std::_Select1st.15"** %this.addr, align 8
  %0 = load %"struct.std::pair.10"*, %"struct.std::pair.10"** %__x.addr, align 8
  %first = getelementptr inbounds %"struct.std::pair.10", %"struct.std::pair.10"* %0, i32 0, i32 0
  ret i64* %first
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %"struct.std::pair.10"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_S_valueEPKSt13_Rb_tree_nodeIS2_E(%"struct.std::_Rb_tree_node"* %__x) #5 comdat align 2 {
entry:
  %__x.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  store %"struct.std::_Rb_tree_node"* %__x, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %call = call %"struct.std::pair.10"* @_ZNKSt13_Rb_tree_nodeISt4pairIKmmEE9_M_valptrEv(%"struct.std::_Rb_tree_node"* %0)
  ret %"struct.std::pair.10"* %call
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::pair.10"* @_ZNKSt13_Rb_tree_nodeISt4pairIKmmEE9_M_valptrEv(%"struct.std::_Rb_tree_node"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  store %"struct.std::_Rb_tree_node"* %this, %"struct.std::_Rb_tree_node"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %this.addr, align 8
  %_M_storage = getelementptr inbounds %"struct.std::_Rb_tree_node", %"struct.std::_Rb_tree_node"* %this1, i32 0, i32 1
  %call = call %"struct.std::pair.10"* @_ZNK9__gnu_cxx16__aligned_membufISt4pairIKmmEE6_M_ptrEv(%"struct.__gnu_cxx::__aligned_membuf"* %_M_storage) #3
  ret %"struct.std::pair.10"* %call
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::pair.10"* @_ZNK9__gnu_cxx16__aligned_membufISt4pairIKmmEE6_M_ptrEv(%"struct.__gnu_cxx::__aligned_membuf"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.__gnu_cxx::__aligned_membuf"*, align 8
  store %"struct.__gnu_cxx::__aligned_membuf"* %this, %"struct.__gnu_cxx::__aligned_membuf"** %this.addr, align 8
  %this1 = load %"struct.__gnu_cxx::__aligned_membuf"*, %"struct.__gnu_cxx::__aligned_membuf"** %this.addr, align 8
  %call = call i8* @_ZNK9__gnu_cxx16__aligned_membufISt4pairIKmmEE7_M_addrEv(%"struct.__gnu_cxx::__aligned_membuf"* %this1) #3
  %0 = bitcast i8* %call to %"struct.std::pair.10"*
  ret %"struct.std::pair.10"* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i8* @_ZNK9__gnu_cxx16__aligned_membufISt4pairIKmmEE7_M_addrEv(%"struct.__gnu_cxx::__aligned_membuf"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.__gnu_cxx::__aligned_membuf"*, align 8
  store %"struct.__gnu_cxx::__aligned_membuf"* %this, %"struct.__gnu_cxx::__aligned_membuf"** %this.addr, align 8
  %this1 = load %"struct.__gnu_cxx::__aligned_membuf"*, %"struct.__gnu_cxx::__aligned_membuf"** %this.addr, align 8
  %_M_storage = getelementptr inbounds %"struct.__gnu_cxx::__aligned_membuf", %"struct.__gnu_cxx::__aligned_membuf"* %this1, i32 0, i32 0
  %0 = bitcast [16 x i8]* %_M_storage to i8*
  ret i8* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) %"struct.std::_Rb_tree_node"** @_ZSt7forwardIRPSt13_Rb_tree_nodeISt4pairIKmmEEEOT_RNSt16remove_referenceIS7_E4typeE(%"struct.std::_Rb_tree_node"** dereferenceable(8) %__t) #4 comdat {
entry:
  %__t.addr = alloca %"struct.std::_Rb_tree_node"**, align 8
  store %"struct.std::_Rb_tree_node"** %__t, %"struct.std::_Rb_tree_node"*** %__t.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node"**, %"struct.std::_Rb_tree_node"*** %__t.addr, align 8
  ret %"struct.std::_Rb_tree_node"** %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %"struct.std::pair.10"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_S_valueEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x) #4 comdat align 2 {
entry:
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  store %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %1 = bitcast %"struct.std::_Rb_tree_node_base"* %0 to %"struct.std::_Rb_tree_node"*
  %call = call %"struct.std::pair.10"* @_ZNKSt13_Rb_tree_nodeISt4pairIKmmEE9_M_valptrEv(%"struct.std::_Rb_tree_node"* %1)
  ret %"struct.std::pair.10"* %call
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node"* @_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE11_Alloc_nodeclIS0_ImmEEEPSt13_Rb_tree_nodeIS2_EOT_(%"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"* %this, %"struct.std::pair.9"* dereferenceable(16) %__arg) #5 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"*, align 8
  %__arg.addr = alloca %"struct.std::pair.9"*, align 8
  store %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"* %this, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"** %this.addr, align 8
  store %"struct.std::pair.9"* %__arg, %"struct.std::pair.9"** %__arg.addr, align 8
  %this1 = load %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"*, %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Alloc_node"* %this1, i32 0, i32 0
  %0 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %_M_t, align 8
  %1 = load %"struct.std::pair.9"*, %"struct.std::pair.9"** %__arg.addr, align 8
  %call = call dereferenceable(16) %"struct.std::pair.9"* @_ZSt7forwardISt4pairImmEEOT_RNSt16remove_referenceIS2_E4typeE(%"struct.std::pair.9"* dereferenceable(16) %1) #3
  %call2 = call %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE14_M_create_nodeIJS0_ImmEEEEPSt13_Rb_tree_nodeIS2_EDpOT_(%"class.std::_Rb_tree"* %0, %"struct.std::pair.9"* dereferenceable(16) %call)
  ret %"struct.std::_Rb_tree_node"* %call2
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE14_M_create_nodeIJS0_ImmEEEEPSt13_Rb_tree_nodeIS2_EDpOT_(%"class.std::_Rb_tree"* %this, %"struct.std::pair.9"* dereferenceable(16) %__args) #5 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %__args.addr = alloca %"struct.std::pair.9"*, align 8
  %__tmp = alloca %"struct.std::_Rb_tree_node"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  store %"struct.std::pair.9"* %__args, %"struct.std::pair.9"** %__args.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %call = call %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE11_M_get_nodeEv(%"class.std::_Rb_tree"* %this1)
  store %"struct.std::_Rb_tree_node"* %call, %"struct.std::_Rb_tree_node"** %__tmp, align 8
  %0 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__tmp, align 8
  %1 = load %"struct.std::pair.9"*, %"struct.std::pair.9"** %__args.addr, align 8
  %call2 = call dereferenceable(16) %"struct.std::pair.9"* @_ZSt7forwardISt4pairImmEEOT_RNSt16remove_referenceIS2_E4typeE(%"struct.std::pair.9"* dereferenceable(16) %1) #3
  call void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE17_M_construct_nodeIJS0_ImmEEEEvPSt13_Rb_tree_nodeIS2_EDpOT_(%"class.std::_Rb_tree"* %this1, %"struct.std::_Rb_tree_node"* %0, %"struct.std::pair.9"* dereferenceable(16) %call2)
  %2 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__tmp, align 8
  ret %"struct.std::_Rb_tree_node"* %2
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE11_M_get_nodeEv(%"class.std::_Rb_tree"* %this) #5 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %call = call dereferenceable(1) %"class.std::allocator"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE21_M_get_Node_allocatorEv(%"class.std::_Rb_tree"* %this1) #3
  %call2 = call %"struct.std::_Rb_tree_node"* @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmmEEEE8allocateERS5_m(%"class.std::allocator"* dereferenceable(1) %call, i64 1)
  ret %"struct.std::_Rb_tree_node"* %call2
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE17_M_construct_nodeIJS0_ImmEEEEvPSt13_Rb_tree_nodeIS2_EDpOT_(%"class.std::_Rb_tree"* %this, %"struct.std::_Rb_tree_node"* %__node, %"struct.std::pair.9"* dereferenceable(16) %__args) #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %__node.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  %__args.addr = alloca %"struct.std::pair.9"*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node"* %__node, %"struct.std::_Rb_tree_node"** %__node.addr, align 8
  store %"struct.std::pair.9"* %__args, %"struct.std::pair.9"** %__args.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %0 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__node.addr, align 8
  %1 = bitcast %"struct.std::_Rb_tree_node"* %0 to i8*
  %2 = bitcast i8* %1 to %"struct.std::_Rb_tree_node"*
  %call = call dereferenceable(1) %"class.std::allocator"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE21_M_get_Node_allocatorEv(%"class.std::_Rb_tree"* %this1) #3
  %3 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__node.addr, align 8
  %call2 = invoke %"struct.std::pair.10"* @_ZNSt13_Rb_tree_nodeISt4pairIKmmEE9_M_valptrEv(%"struct.std::_Rb_tree_node"* %3)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %4 = load %"struct.std::pair.9"*, %"struct.std::pair.9"** %__args.addr, align 8
  %call3 = call dereferenceable(16) %"struct.std::pair.9"* @_ZSt7forwardISt4pairImmEEOT_RNSt16remove_referenceIS2_E4typeE(%"struct.std::pair.9"* dereferenceable(16) %4) #3
  invoke void @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmmEEEE9constructIS3_JS1_ImmEEEEvRS5_PT_DpOT0_(%"class.std::allocator"* dereferenceable(1) %call, %"struct.std::pair.10"* %call2, %"struct.std::pair.9"* dereferenceable(16) %call3)
          to label %invoke.cont4 unwind label %lpad

invoke.cont4:                                     ; preds = %invoke.cont
  br label %try.cont

lpad:                                             ; preds = %invoke.cont, %entry
  %5 = landingpad { i8*, i32 }
          catch i8* null
  %6 = extractvalue { i8*, i32 } %5, 0
  store i8* %6, i8** %exn.slot, align 8
  %7 = extractvalue { i8*, i32 } %5, 1
  store i32 %7, i32* %ehselector.slot, align 4
  br label %catch

catch:                                            ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %8 = call i8* @__cxa_begin_catch(i8* %exn) #3
  %9 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__node.addr, align 8
  %10 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__node.addr, align 8
  call void @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE11_M_put_nodeEPSt13_Rb_tree_nodeIS2_E(%"class.std::_Rb_tree"* %this1, %"struct.std::_Rb_tree_node"* %10) #3
  invoke void @__cxa_rethrow() #14
          to label %unreachable unwind label %lpad5

lpad5:                                            ; preds = %catch
  %11 = landingpad { i8*, i32 }
          cleanup
  %12 = extractvalue { i8*, i32 } %11, 0
  store i8* %12, i8** %exn.slot, align 8
  %13 = extractvalue { i8*, i32 } %11, 1
  store i32 %13, i32* %ehselector.slot, align 4
  invoke void @__cxa_end_catch()
          to label %invoke.cont6 unwind label %terminate.lpad

invoke.cont6:                                     ; preds = %lpad5
  br label %eh.resume

try.cont:                                         ; preds = %invoke.cont4
  ret void

eh.resume:                                        ; preds = %invoke.cont6
  %exn7 = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn7, 0
  %lpad.val8 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val8

terminate.lpad:                                   ; preds = %lpad5
  %14 = landingpad { i8*, i32 }
          catch i8* null
  %15 = extractvalue { i8*, i32 } %14, 0
  call void @__clang_call_terminate(i8* %15) #13
  unreachable

unreachable:                                      ; preds = %catch
  unreachable
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node"* @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmmEEEE8allocateERS5_m(%"class.std::allocator"* dereferenceable(1) %__a, i64 %__n) #5 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator"*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::allocator"* %__a, %"class.std::allocator"** %__a.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %0 = load %"class.std::allocator"*, %"class.std::allocator"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator"* %0 to %"class.__gnu_cxx::new_allocator"*
  %2 = load i64, i64* %__n.addr, align 8
  %call = call %"struct.std::_Rb_tree_node"* @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEE8allocateEmPKv(%"class.__gnu_cxx::new_allocator"* %1, i64 %2, i8* null)
  ret %"struct.std::_Rb_tree_node"* %call
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node"* @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEE8allocateEmPKv(%"class.__gnu_cxx::new_allocator"* %this, i64 %__n, i8*) #5 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %__n.addr = alloca i64, align 8
  %.addr = alloca i8*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  store i8* %0, i8** %.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %1 = load i64, i64* %__n.addr, align 8
  %call = call i64 @_ZNK9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEE8max_sizeEv(%"class.__gnu_cxx::new_allocator"* %this1) #3
  %cmp = icmp ugt i64 %1, %call
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @_ZSt17__throw_bad_allocv() #14
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i64, i64* %__n.addr, align 8
  %mul = mul i64 %2, 48
  %call2 = call i8* @_Znwm(i64 %mul)
  %3 = bitcast i8* %call2 to %"struct.std::_Rb_tree_node"*
  ret %"struct.std::_Rb_tree_node"* %3
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNK9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEE8max_sizeEv(%"class.__gnu_cxx::new_allocator"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  ret i64 384307168202282325
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt16allocator_traitsISaISt13_Rb_tree_nodeISt4pairIKmmEEEE9constructIS3_JS1_ImmEEEEvRS5_PT_DpOT0_(%"class.std::allocator"* dereferenceable(1) %__a, %"struct.std::pair.10"* %__p, %"struct.std::pair.9"* dereferenceable(16) %__args) #5 comdat align 2 {
entry:
  %__a.addr = alloca %"class.std::allocator"*, align 8
  %__p.addr = alloca %"struct.std::pair.10"*, align 8
  %__args.addr = alloca %"struct.std::pair.9"*, align 8
  store %"class.std::allocator"* %__a, %"class.std::allocator"** %__a.addr, align 8
  store %"struct.std::pair.10"* %__p, %"struct.std::pair.10"** %__p.addr, align 8
  store %"struct.std::pair.9"* %__args, %"struct.std::pair.9"** %__args.addr, align 8
  %0 = load %"class.std::allocator"*, %"class.std::allocator"** %__a.addr, align 8
  %1 = bitcast %"class.std::allocator"* %0 to %"class.__gnu_cxx::new_allocator"*
  %2 = load %"struct.std::pair.10"*, %"struct.std::pair.10"** %__p.addr, align 8
  %3 = load %"struct.std::pair.9"*, %"struct.std::pair.9"** %__args.addr, align 8
  %call = call dereferenceable(16) %"struct.std::pair.9"* @_ZSt7forwardISt4pairImmEEOT_RNSt16remove_referenceIS2_E4typeE(%"struct.std::pair.9"* dereferenceable(16) %3) #3
  call void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEE9constructIS4_JS2_ImmEEEEvPT_DpOT0_(%"class.__gnu_cxx::new_allocator"* %1, %"struct.std::pair.10"* %2, %"struct.std::pair.9"* dereferenceable(16) %call)
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKmmEEE9constructIS4_JS2_ImmEEEEvPT_DpOT0_(%"class.__gnu_cxx::new_allocator"* %this, %"struct.std::pair.10"* %__p, %"struct.std::pair.9"* dereferenceable(16) %__args) #5 comdat align 2 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %__p.addr = alloca %"struct.std::pair.10"*, align 8
  %__args.addr = alloca %"struct.std::pair.9"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  store %"struct.std::pair.10"* %__p, %"struct.std::pair.10"** %__p.addr, align 8
  store %"struct.std::pair.9"* %__args, %"struct.std::pair.9"** %__args.addr, align 8
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %0 = load %"struct.std::pair.10"*, %"struct.std::pair.10"** %__p.addr, align 8
  %1 = bitcast %"struct.std::pair.10"* %0 to i8*
  %2 = bitcast i8* %1 to %"struct.std::pair.10"*
  %3 = load %"struct.std::pair.9"*, %"struct.std::pair.9"** %__args.addr, align 8
  %call = call dereferenceable(16) %"struct.std::pair.9"* @_ZSt7forwardISt4pairImmEEOT_RNSt16remove_referenceIS2_E4typeE(%"struct.std::pair.9"* dereferenceable(16) %3) #3
  call void @_ZNSt4pairIKmmEC2ImmLb1EEEOS_IT_T0_E(%"struct.std::pair.10"* %2, %"struct.std::pair.9"* dereferenceable(16) %call)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt4pairIKmmEC2ImmLb1EEEOS_IT_T0_E(%"struct.std::pair.10"* %this, %"struct.std::pair.9"* dereferenceable(16) %__p) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::pair.10"*, align 8
  %__p.addr = alloca %"struct.std::pair.9"*, align 8
  store %"struct.std::pair.10"* %this, %"struct.std::pair.10"** %this.addr, align 8
  store %"struct.std::pair.9"* %__p, %"struct.std::pair.9"** %__p.addr, align 8
  %this1 = load %"struct.std::pair.10"*, %"struct.std::pair.10"** %this.addr, align 8
  %first = getelementptr inbounds %"struct.std::pair.10", %"struct.std::pair.10"* %this1, i32 0, i32 0
  %0 = load %"struct.std::pair.9"*, %"struct.std::pair.9"** %__p.addr, align 8
  %first2 = getelementptr inbounds %"struct.std::pair.9", %"struct.std::pair.9"* %0, i32 0, i32 0
  %call = call dereferenceable(8) i64* @_ZSt7forwardImEOT_RNSt16remove_referenceIS0_E4typeE(i64* dereferenceable(8) %first2) #3
  %1 = load i64, i64* %call, align 8
  store i64 %1, i64* %first, align 8
  %second = getelementptr inbounds %"struct.std::pair.10", %"struct.std::pair.10"* %this1, i32 0, i32 1
  %2 = load %"struct.std::pair.9"*, %"struct.std::pair.9"** %__p.addr, align 8
  %second3 = getelementptr inbounds %"struct.std::pair.9", %"struct.std::pair.9"* %2, i32 0, i32 1
  %call4 = call dereferenceable(8) i64* @_ZSt7forwardImEOT_RNSt16remove_referenceIS0_E4typeE(i64* dereferenceable(8) %second3) #3
  %3 = load i64, i64* %call4, align 8
  store i64 %3, i64* %second, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(8) %"struct.std::_Rb_tree_iterator.7"* @_ZSt7forwardISt17_Rb_tree_iteratorISt4pairIKmmEEEOT_RNSt16remove_referenceIS5_E4typeE(%"struct.std::_Rb_tree_iterator.7"* dereferenceable(8) %__t) #4 comdat {
entry:
  %__t.addr = alloca %"struct.std::_Rb_tree_iterator.7"*, align 8
  store %"struct.std::_Rb_tree_iterator.7"* %__t, %"struct.std::_Rb_tree_iterator.7"** %__t.addr, align 8
  %0 = load %"struct.std::_Rb_tree_iterator.7"*, %"struct.std::_Rb_tree_iterator.7"** %__t.addr, align 8
  ret %"struct.std::_Rb_tree_iterator.7"* %0
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE4findERS1_(%"class.std::_Rb_tree"* %this, i64* dereferenceable(8) %__k) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_const_iterator.17", align 8
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %__k.addr = alloca i64*, align 8
  %__j = alloca %"struct.std::_Rb_tree_const_iterator.17", align 8
  %ref.tmp = alloca %"struct.std::_Rb_tree_const_iterator.17", align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  store i64* %__k, i64** %__k.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %call = call %"struct.std::_Rb_tree_node"* @_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_M_beginEv(%"class.std::_Rb_tree"* %this1) #3
  %call2 = call %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_M_endEv(%"class.std::_Rb_tree"* %this1) #3
  %0 = load i64*, i64** %__k.addr, align 8
  %call3 = call %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE14_M_lower_boundEPKSt13_Rb_tree_nodeIS2_EPKSt18_Rb_tree_node_baseRS1_(%"class.std::_Rb_tree"* %this1, %"struct.std::_Rb_tree_node"* %call, %"struct.std::_Rb_tree_node_base"* %call2, i64* dereferenceable(8) %0)
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator.17", %"struct.std::_Rb_tree_const_iterator.17"* %__j, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call3, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  %call4 = call %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE3endEv(%"class.std::_Rb_tree"* %this1) #3
  %coerce.dive5 = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator.17", %"struct.std::_Rb_tree_const_iterator.17"* %ref.tmp, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call4, %"struct.std::_Rb_tree_node_base"** %coerce.dive5, align 8
  %call6 = call zeroext i1 @_ZNKSt23_Rb_tree_const_iteratorISt4pairIKmmEEeqERKS3_(%"struct.std::_Rb_tree_const_iterator.17"* %__j, %"struct.std::_Rb_tree_const_iterator.17"* dereferenceable(8) %ref.tmp) #3
  br i1 %call6, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_key_compare = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 0
  %1 = load i64*, i64** %__k.addr, align 8
  %_M_node = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator.17", %"struct.std::_Rb_tree_const_iterator.17"* %__j, i32 0, i32 0
  %2 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_node, align 8
  %call7 = call dereferenceable(8) i64* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_S_keyEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %2)
  %call8 = call zeroext i1 @_ZNKSt4lessImEclERKmS2_(%"struct.std::less"* %_M_key_compare, i64* dereferenceable(8) %1, i64* dereferenceable(8) %call7)
  br i1 %call8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %call9 = call %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE3endEv(%"class.std::_Rb_tree"* %this1) #3
  %coerce.dive10 = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator.17", %"struct.std::_Rb_tree_const_iterator.17"* %retval, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call9, %"struct.std::_Rb_tree_node_base"** %coerce.dive10, align 8
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %3 = bitcast %"struct.std::_Rb_tree_const_iterator.17"* %retval to i8*
  %4 = bitcast %"struct.std::_Rb_tree_const_iterator.17"* %__j to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 8 %4, i64 8, i1 false)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %coerce.dive11 = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator.17", %"struct.std::_Rb_tree_const_iterator.17"* %retval, i32 0, i32 0
  %5 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive11, align 8
  ret %"struct.std::_Rb_tree_node_base"* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZNKSt23_Rb_tree_const_iteratorISt4pairIKmmEEeqERKS3_(%"struct.std::_Rb_tree_const_iterator.17"* %this, %"struct.std::_Rb_tree_const_iterator.17"* dereferenceable(8) %__x) #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_const_iterator.17"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_const_iterator.17"*, align 8
  store %"struct.std::_Rb_tree_const_iterator.17"* %this, %"struct.std::_Rb_tree_const_iterator.17"** %this.addr, align 8
  store %"struct.std::_Rb_tree_const_iterator.17"* %__x, %"struct.std::_Rb_tree_const_iterator.17"** %__x.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_const_iterator.17"*, %"struct.std::_Rb_tree_const_iterator.17"** %this.addr, align 8
  %_M_node = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator.17", %"struct.std::_Rb_tree_const_iterator.17"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_node, align 8
  %1 = load %"struct.std::_Rb_tree_const_iterator.17"*, %"struct.std::_Rb_tree_const_iterator.17"** %__x.addr, align 8
  %_M_node2 = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator.17", %"struct.std::_Rb_tree_const_iterator.17"* %1, i32 0, i32 0
  %2 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_node2, align 8
  %cmp = icmp eq %"struct.std::_Rb_tree_node_base"* %0, %2
  ret i1 %cmp
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE3endEv(%"class.std::_Rb_tree"* %this) #4 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_const_iterator.17", align 8
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 1
  call void @_ZNSt23_Rb_tree_const_iteratorISt4pairIKmmEEC2EPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_const_iterator.17"* %retval, %"struct.std::_Rb_tree_node_base"* %_M_header) #3
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator.17", %"struct.std::_Rb_tree_const_iterator.17"* %retval, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  ret %"struct.std::_Rb_tree_node_base"* %0
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE14_M_lower_boundEPKSt13_Rb_tree_nodeIS2_EPKSt18_Rb_tree_node_baseRS1_(%"class.std::_Rb_tree"* %this, %"struct.std::_Rb_tree_node"* %__x, %"struct.std::_Rb_tree_node_base"* %__y, i64* dereferenceable(8) %__k) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_const_iterator.17", align 8
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  %__y.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  %__k.addr = alloca i64*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node"* %__x, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  store %"struct.std::_Rb_tree_node_base"* %__y, %"struct.std::_Rb_tree_node_base"** %__y.addr, align 8
  store i64* %__k, i64** %__k.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %cmp = icmp ne %"struct.std::_Rb_tree_node"* %0, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_key_compare = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 0
  %1 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %call = call dereferenceable(8) i64* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_S_keyEPKSt13_Rb_tree_nodeIS2_E(%"struct.std::_Rb_tree_node"* %1)
  %2 = load i64*, i64** %__k.addr, align 8
  %call2 = call zeroext i1 @_ZNKSt4lessImEclERKmS2_(%"struct.std::less"* %_M_key_compare, i64* dereferenceable(8) %call, i64* dereferenceable(8) %2)
  br i1 %call2, label %if.else, label %if.then

if.then:                                          ; preds = %while.body
  %3 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %4 = bitcast %"struct.std::_Rb_tree_node"* %3 to %"struct.std::_Rb_tree_node_base"*
  store %"struct.std::_Rb_tree_node_base"* %4, %"struct.std::_Rb_tree_node_base"** %__y.addr, align 8
  %5 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %6 = bitcast %"struct.std::_Rb_tree_node"* %5 to %"struct.std::_Rb_tree_node_base"*
  %call3 = call %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE7_S_leftEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %6) #3
  store %"struct.std::_Rb_tree_node"* %call3, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  br label %if.end

if.else:                                          ; preds = %while.body
  %7 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %8 = bitcast %"struct.std::_Rb_tree_node"* %7 to %"struct.std::_Rb_tree_node_base"*
  %call4 = call %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_S_rightEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %8) #3
  store %"struct.std::_Rb_tree_node"* %call4, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %9 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__y.addr, align 8
  call void @_ZNSt23_Rb_tree_const_iteratorISt4pairIKmmEEC2EPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_const_iterator.17"* %retval, %"struct.std::_Rb_tree_node_base"* %9) #3
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator.17", %"struct.std::_Rb_tree_const_iterator.17"* %retval, i32 0, i32 0
  %10 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  ret %"struct.std::_Rb_tree_node_base"* %10
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node"* @_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_M_beginEv(%"class.std::_Rb_tree"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 1
  %_M_parent = getelementptr inbounds %"struct.std::_Rb_tree_node_base", %"struct.std::_Rb_tree_node_base"* %_M_header, i32 0, i32 1
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_parent, align 8
  %1 = bitcast %"struct.std::_Rb_tree_node_base"* %0 to %"struct.std::_Rb_tree_node"*
  ret %"struct.std::_Rb_tree_node"* %1
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_M_endEv(%"class.std::_Rb_tree"* %this) #4 comdat align 2 {
entry:
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 1
  ret %"struct.std::_Rb_tree_node_base"* %_M_header
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE7_S_leftEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x) #4 comdat align 2 {
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
define linkonce_odr dso_local %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_S_rightEPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %__x) #4 comdat align 2 {
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
define linkonce_odr dso_local void @_ZNSt23_Rb_tree_const_iteratorISt4pairIKmmEEC2EPKSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_const_iterator.17"* %this, %"struct.std::_Rb_tree_node_base"* %__x) unnamed_addr #4 comdat align 2 {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_const_iterator.17"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  store %"struct.std::_Rb_tree_const_iterator.17"* %this, %"struct.std::_Rb_tree_const_iterator.17"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node_base"* %__x, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_const_iterator.17"*, %"struct.std::_Rb_tree_const_iterator.17"** %this.addr, align 8
  %_M_node = getelementptr inbounds %"struct.std::_Rb_tree_const_iterator.17", %"struct.std::_Rb_tree_const_iterator.17"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__x.addr, align 8
  store %"struct.std::_Rb_tree_node_base"* %0, %"struct.std::_Rb_tree_node_base"** %_M_node, align 8
  ret void
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEE11lower_boundERS3_(%"class.std::map"* %this, i64* dereferenceable(8) %__x) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_iterator.7", align 8
  %this.addr = alloca %"class.std::map"*, align 8
  %__x.addr = alloca i64*, align 8
  store %"class.std::map"* %this, %"class.std::map"** %this.addr, align 8
  store i64* %__x, i64** %__x.addr, align 8
  %this1 = load %"class.std::map"*, %"class.std::map"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"class.std::map", %"class.std::map"* %this1, i32 0, i32 0
  %0 = load i64*, i64** %__x.addr, align 8
  %call = call %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE11lower_boundERS1_(%"class.std::_Rb_tree"* %_M_t, i64* dereferenceable(8) %0)
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %retval, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  %coerce.dive2 = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %retval, i32 0, i32 0
  %1 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive2, align 8
  ret %"struct.std::_Rb_tree_node_base"* %1
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNSt3mapImmSt4lessImESaISt4pairIKmmEEE3endEv(%"class.std::map"* %this) #4 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_iterator.7", align 8
  %this.addr = alloca %"class.std::map"*, align 8
  store %"class.std::map"* %this, %"class.std::map"** %this.addr, align 8
  %this1 = load %"class.std::map"*, %"class.std::map"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"class.std::map", %"class.std::map"* %this1, i32 0, i32 0
  %call = call %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE3endEv(%"class.std::_Rb_tree"* %_M_t) #3
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %retval, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  %coerce.dive2 = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %retval, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive2, align 8
  ret %"struct.std::_Rb_tree_node_base"* %0
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZNKSt3mapImmSt4lessImESaISt4pairIKmmEEE8key_compEv(%"class.std::map"* %this) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::less", align 1
  %this.addr = alloca %"class.std::map"*, align 8
  %undef.agg.tmp = alloca %"struct.std::less", align 1
  store %"class.std::map"* %this, %"class.std::map"** %this.addr, align 8
  %this1 = load %"class.std::map"*, %"class.std::map"** %this.addr, align 8
  %_M_t = getelementptr inbounds %"class.std::map", %"class.std::map"* %this1, i32 0, i32 0
  call void @_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8key_compEv(%"class.std::_Rb_tree"* %_M_t)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local dereferenceable(16) %"struct.std::pair.10"* @_ZNKSt17_Rb_tree_iteratorISt4pairIKmmEEdeEv(%"struct.std::_Rb_tree_iterator.7"* %this) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"struct.std::_Rb_tree_iterator.7"*, align 8
  store %"struct.std::_Rb_tree_iterator.7"* %this, %"struct.std::_Rb_tree_iterator.7"** %this.addr, align 8
  %this1 = load %"struct.std::_Rb_tree_iterator.7"*, %"struct.std::_Rb_tree_iterator.7"** %this.addr, align 8
  %_M_node = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %this1, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %_M_node, align 8
  %1 = bitcast %"struct.std::_Rb_tree_node_base"* %0 to %"struct.std::_Rb_tree_node"*
  %call = invoke %"struct.std::pair.10"* @_ZNSt13_Rb_tree_nodeISt4pairIKmmEE9_M_valptrEv(%"struct.std::_Rb_tree_node"* %1)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  ret %"struct.std::pair.10"* %call

terminate.lpad:                                   ; preds = %entry
  %2 = landingpad { i8*, i32 }
          catch i8* null
  %3 = extractvalue { i8*, i32 } %2, 0
  call void @__clang_call_terminate(i8* %3) #13
  unreachable
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE11lower_boundERS1_(%"class.std::_Rb_tree"* %this, i64* dereferenceable(8) %__k) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_iterator.7", align 8
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %__k.addr = alloca i64*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  store i64* %__k, i64** %__k.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %call = call %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_M_beginEv(%"class.std::_Rb_tree"* %this1) #3
  %call2 = call %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_M_endEv(%"class.std::_Rb_tree"* %this1) #3
  %0 = load i64*, i64** %__k.addr, align 8
  %call3 = call %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE14_M_lower_boundEPSt13_Rb_tree_nodeIS2_EPSt18_Rb_tree_node_baseRS1_(%"class.std::_Rb_tree"* %this1, %"struct.std::_Rb_tree_node"* %call, %"struct.std::_Rb_tree_node_base"* %call2, i64* dereferenceable(8) %0)
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %retval, i32 0, i32 0
  store %"struct.std::_Rb_tree_node_base"* %call3, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  %coerce.dive4 = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %retval, i32 0, i32 0
  %1 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive4, align 8
  ret %"struct.std::_Rb_tree_node_base"* %1
}

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE14_M_lower_boundEPSt13_Rb_tree_nodeIS2_EPSt18_Rb_tree_node_baseRS1_(%"class.std::_Rb_tree"* %this, %"struct.std::_Rb_tree_node"* %__x, %"struct.std::_Rb_tree_node_base"* %__y, i64* dereferenceable(8) %__k) #5 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_iterator.7", align 8
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  %__x.addr = alloca %"struct.std::_Rb_tree_node"*, align 8
  %__y.addr = alloca %"struct.std::_Rb_tree_node_base"*, align 8
  %__k.addr = alloca i64*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  store %"struct.std::_Rb_tree_node"* %__x, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  store %"struct.std::_Rb_tree_node_base"* %__y, %"struct.std::_Rb_tree_node_base"** %__y.addr, align 8
  store i64* %__k, i64** %__k.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %cmp = icmp ne %"struct.std::_Rb_tree_node"* %0, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_key_compare = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 0
  %1 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %call = call dereferenceable(8) i64* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE6_S_keyEPKSt13_Rb_tree_nodeIS2_E(%"struct.std::_Rb_tree_node"* %1)
  %2 = load i64*, i64** %__k.addr, align 8
  %call2 = call zeroext i1 @_ZNKSt4lessImEclERKmS2_(%"struct.std::less"* %_M_key_compare, i64* dereferenceable(8) %call, i64* dereferenceable(8) %2)
  br i1 %call2, label %if.else, label %if.then

if.then:                                          ; preds = %while.body
  %3 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %4 = bitcast %"struct.std::_Rb_tree_node"* %3 to %"struct.std::_Rb_tree_node_base"*
  store %"struct.std::_Rb_tree_node_base"* %4, %"struct.std::_Rb_tree_node_base"** %__y.addr, align 8
  %5 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %6 = bitcast %"struct.std::_Rb_tree_node"* %5 to %"struct.std::_Rb_tree_node_base"*
  %call3 = call %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE7_S_leftEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %6) #3
  store %"struct.std::_Rb_tree_node"* %call3, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  br label %if.end

if.else:                                          ; preds = %while.body
  %7 = load %"struct.std::_Rb_tree_node"*, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  %8 = bitcast %"struct.std::_Rb_tree_node"* %7 to %"struct.std::_Rb_tree_node_base"*
  %call4 = call %"struct.std::_Rb_tree_node"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8_S_rightEPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_node_base"* %8) #3
  store %"struct.std::_Rb_tree_node"* %call4, %"struct.std::_Rb_tree_node"** %__x.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %9 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %__y.addr, align 8
  call void @_ZNSt17_Rb_tree_iteratorISt4pairIKmmEEC2EPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_iterator.7"* %retval, %"struct.std::_Rb_tree_node_base"* %9) #3
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %retval, i32 0, i32 0
  %10 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  ret %"struct.std::_Rb_tree_node_base"* %10
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local %"struct.std::_Rb_tree_node_base"* @_ZNSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE3endEv(%"class.std::_Rb_tree"* %this) #4 comdat align 2 {
entry:
  %retval = alloca %"struct.std::_Rb_tree_iterator.7", align 8
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_header = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 1
  call void @_ZNSt17_Rb_tree_iteratorISt4pairIKmmEEC2EPSt18_Rb_tree_node_base(%"struct.std::_Rb_tree_iterator.7"* %retval, %"struct.std::_Rb_tree_node_base"* %_M_header) #3
  %coerce.dive = getelementptr inbounds %"struct.std::_Rb_tree_iterator.7", %"struct.std::_Rb_tree_iterator.7"* %retval, i32 0, i32 0
  %0 = load %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"** %coerce.dive, align 8
  ret %"struct.std::_Rb_tree_node_base"* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNKSt8_Rb_treeImSt4pairIKmmESt10_Select1stIS2_ESt4lessImESaIS2_EE8key_compEv(%"class.std::_Rb_tree"* %this) #4 comdat align 2 {
entry:
  %retval = alloca %"struct.std::less", align 1
  %this.addr = alloca %"class.std::_Rb_tree"*, align 8
  store %"class.std::_Rb_tree"* %this, %"class.std::_Rb_tree"** %this.addr, align 8
  %this1 = load %"class.std::_Rb_tree"*, %"class.std::_Rb_tree"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"class.std::_Rb_tree", %"class.std::_Rb_tree"* %this1, i32 0, i32 0
  %_M_key_compare = getelementptr inbounds %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl", %"struct.std::_Rb_tree<unsigned long, std::pair<const unsigned long, unsigned long>, std::_Select1st<std::pair<const unsigned long, unsigned long> >, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, unsigned long> > >::_Rb_tree_impl"* %_M_impl, i32 0, i32 0
  ret void
}

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_ex2.cpp() #0 section ".text.startup" {
entry:
  call void @__cxx_global_var_init()
  call void @__cxx_global_var_init.1()
  call void @__cxx_global_var_init.2()
  ret void
}

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { argmemonly nounwind }
attributes #8 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noinline noreturn nounwind }
attributes #10 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { noreturn nounwind }
attributes #14 = { noreturn }
attributes #15 = { builtin }
attributes #16 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 324638) (llvm/trunk 324636)"}
