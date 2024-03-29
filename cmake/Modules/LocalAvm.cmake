# Building the avm repository generates files such as "libaom.a" because it is a fork of aom.
set(LIB_FILENAME "${AVIF_SOURCE_DIR}/ext/avm/build.libavif/${CMAKE_STATIC_LIBRARY_PREFIX}aom${CMAKE_STATIC_LIBRARY_SUFFIX}")
if(NOT EXISTS "${LIB_FILENAME}")
    message(FATAL_ERROR "libavif: ${LIB_FILENAME} (from avm) is missing, bailing out")
endif()

add_library(aom STATIC IMPORTED GLOBAL)
set_target_properties(aom PROPERTIES IMPORTED_LOCATION "${LIB_FILENAME}" AVIF_LOCAL ON)
target_include_directories(aom INTERFACE "${AVIF_SOURCE_DIR}/ext/avm")
# ext/avm/aom/aom_encoder.h includes config/aom_config.h which is generated by the local build of avm.
target_include_directories(aom INTERFACE "${AVIF_SOURCE_DIR}/ext/avm/build.libavif")
