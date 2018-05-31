# If we don't need RTTI or EH, there's no reason to export anything
# from the hello plugin.
if( NOT LLVM_REQUIRES_RTTI )
  if( NOT LLVM_REQUIRES_EH )
    set(LLVM_EXPORTED_SYMBOL_FILE ${CMAKE_CURRENT_SOURCE_DIR}/FPInstrument.exports)
  endif()
endif()

if(WIN32 OR CYGWIN)
  set(LLVM_LINK_COMPONENTS Core Support)
endif()

add_llvm_loadable_module( LLVMFPInstrument
  FPInstrument.cpp
  Change.cpp
  CreateIDBitcode.cpp
  Transformer.cpp
  config_parser.cpp
  StrChange.cpp
  vjson/block_allocator.cpp
  vjson/json.cpp
  Variables.cpp
  DEPENDS
  intrinsics_gen
  )
