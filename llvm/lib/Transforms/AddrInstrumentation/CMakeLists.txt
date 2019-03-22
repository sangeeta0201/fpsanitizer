add_llvm_loadable_module(AddrInstrumentation
  AddressSanitizer.cpp
	Instrumentation.cpp
  ADDITIONAL_HEADER_DIRS
  ${LLVM_MAIN_INCLUDE_DIR}/llvm/Transforms

  DEPENDS
  intrinsics_gen
  )
