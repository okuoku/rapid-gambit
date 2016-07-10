cmake_minimum_required(VERSION 2.8.4)
project(rapid-gambit NONE)

#
# Rapid-Gambit build script.
#
#
# Component locations are saved on CMakeCache.txt
# To change locations,
#
#  cmake -DRAPID_GAMBIT_LARCENY=/path/to/larceny .
#
# on configured directory(or just try 'cmake-gui .').
#

#
# Configurable options
#

set(RAPID_SCHEME_ROOT
    "${CMAKE_CURRENT_LIST_DIR}/rapid-scheme"
    CACHE FILEPATH "Path to rapid-scheme root")

find_program(RAPID_GAMBIT_GSC
    gsc
    HINTS
    /usr/local/Gambit/bin)

find_program(RAPID_GAMBIT_GSI
    gsi
    HINTS
    /usr/local/Gambit/bin)

find_program(RAPID_GAMBIT_LARCENY
    larceny
    )

# set(RAPID_GAMBIT_LARCENY
#    "/cygdrive/c/prog/larceny-0.99-bin-native-ia32-win32/larceny.bat")

set(RAPID_GAMBIT_ROOT # Obsolete (no longer optional)
    "${CMAKE_CURRENT_SOURCE_DIR}")

set(RAPID_GAMBIT_LIBPATH
    "${CMAKE_INSTALL_PREFIX}/share/rapid-gambit/lib")

if(WIN32 OR CYGWIN)
    set(exeext ".exe")
else()
    set(exeext "")
endif()

set(RAPID_GAMBIT "${CMAKE_CURRENT_BINARY_DIR}/rapid-gambit${exeext}")

# Version data for rapid-scheme
set(RAPID_SCHEME_VERSION "${CMAKE_CURRENT_BINARY_DIR}/VERSION-rapid-scheme.scm")

set(rapid-gambit-bootstrap
    build/rapid-compiler-bootstrap.scm)

set(rapid-gambit-main
    src/rapid-gambit-main.scm)

set(rapid-gambit-srcs
    # Rapid-scheme runtimes
    rt/case-lambda.scm
    rt/record-GPL3.scm
    rt/values-utils.scm

    # R7RS runtimes
    r7/_override.scm
    r7/base.scm
    r7/process-context.scm
    r7/write.scm
    r7/char.scm
    r7/eval.scm
    )

set(rapid-gambit-lib-srcs
    lib/rapid-gambit/buildconfig.sld)

set(rapid-gambit-bootstrap
    ${CMAKE_CURRENT_SOURCE_DIR}/${rapid-gambit-bootstrap})
set(rapid-gambit-main
    ${CMAKE_CURRENT_SOURCE_DIR}/${rapid-gambit-main})

macro(list_prefix var prefix)
    set(_templist)
    foreach(e ${${var}})
        list(APPEND _templist ${prefix}${e})
    endforeach()
endmacro()

list_prefix(rapid-gambit-srcs ${CMAKE_CURRENT_SOURCE_DIR}/)
list_prefix(rapid-gambit-lib-srcs ${CMAKE_CURRENT_SOURCE_DIR}/)

# Generate versionfile
add_custom_target(genversion)

add_custom_command(TARGET genversion POST_BUILD
    COMMAND ${CMAKE_COMMAND} 
    -DRAPID_SCHEME=${RAPID_SCHEME_ROOT}
    -DOUT=${RAPID_SCHEME_VERSION}
    -DTEMP=${RAPID_SCHEME_VERSION}.current
    -P ${CMAKE_CURRENT_LIST_DIR}/cmake/gen-version-scm.cmake
    DEPENDS ${CMAKE_CURRENT_LIST_DIR}/cmake/gen-version-scm.cmake
    )

# core.scm
add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/core.scm
    COMMAND ${CMAKE_COMMAND}
    -DLARCENY=${RAPID_GAMBIT_LARCENY}
    -DRAPID_SCHEME=${RAPID_SCHEME_ROOT}
    -DRAPID_GAMBIT=${RAPID_GAMBIT_ROOT}
    -DENTRYPOINT=${rapid-gambit-bootstrap}
    -DMAIN=${rapid-gambit-main}
    -DOUT=${CMAKE_CURRENT_BINARY_DIR}/core.scm
    -P ${CMAKE_CURRENT_LIST_DIR}/cmake/gen-core-scm.cmake
    DEPENDS 
    ${rapid-gambit-bootstrap}
    ${rapid-gambit-main}
    ${rapid-gambit-lib-srcs}
    ${CMAKE_CURRENT_LIST_DIR}/cmake/gen-core-scm.cmake
    ${RAPID_SCHEME_VERSION}
    COMMENT "Generating R7RS core with Larceny(core.scm)"
    )

# core0.scm
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/build/gen.scm.in
    ${CMAKE_CURRENT_BINARY_DIR}/gen.scm
    @ONLY)
add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/core0.scm
    COMMAND ${RAPID_GAMBIT_GSI}
    ${CMAKE_CURRENT_BINARY_DIR}/gen.scm
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    DEPENDS
    ${rapid-gambit-srcs}
    ${CMAKE_CURRENT_BINARY_DIR}/gen.scm
    ${CMAKE_CURRENT_BINARY_DIR}/core.scm
    COMMENT "Expand Larceny SEXP into Gambit forms(core0.scm)")

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/src/config.scm.in
    ${CMAKE_CURRENT_BINARY_DIR}/config.scm
    @ONLY)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/src/buildconfig.scm.in
    ${CMAKE_CURRENT_BINARY_DIR}/buildconfig.scm
    @ONLY)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/src/entrypoint.scm.in
    ${CMAKE_CURRENT_BINARY_DIR}/entrypoint.scm
    @ONLY)

# rapid-gambit

set(compiled-frontend-c
    ${CMAKE_CURRENT_BINARY_DIR}/rapid-gambit.c
    )

add_custom_command(OUTPUT ${compiled-frontend-c}
    COMMAND ${RAPID_GAMBIT_GSC}
    -c
    -track-scheme
    -o ${compiled-frontend-c}
    ${CMAKE_CURRENT_BINARY_DIR}/entrypoint.scm
    COMMENT "Compiling rapid-gambit(SCM->C: takes some time...)"
    DEPENDS
    ${CMAKE_CURRENT_BINARY_DIR}/entrypoint.scm
    ${rapid-gambit-srcs}
    ${CMAKE_CURRENT_BINARY_DIR}/buildconfig.scm
    ${CMAKE_CURRENT_BINARY_DIR}/config.scm
    ${CMAKE_CURRENT_BINARY_DIR}/core0.scm
    )

add_custom_command(OUTPUT ${RAPID_GAMBIT}
    COMMAND ${RAPID_GAMBIT_GSC}
    -o ${RAPID_GAMBIT}
    -cc-options "\"-D___SINGLE_HOST\" -O1"
    -exe
    ${compiled-frontend-c}
    DEPENDS
    ${compiled-frontend-c}
    COMMENT "Compiling rapid-gambit(Codegen: takes some time...)"
    )

add_custom_target(rapid-gambit ALL
    DEPENDS ${RAPID_GAMBIT})
add_dependencies(rapid-gambit genversion)

# install targets
install(PROGRAMS
    ${RAPID_GAMBIT}
    DESTINATION bin)
install(DIRECTORY
    ${RAPID_SCHEME_ROOT}/rapid
    ${RAPID_SCHEME_ROOT}/share/rapid
    ${RAPID_SCHEME_ROOT}/share/scheme
    DESTINATION ${RAPID_GAMBIT_LIBPATH})

message(STATUS "")
message(STATUS "rapid-scheme root(RAPID_SCHEME_ROOT) = ${RAPID_SCHEME_ROOT}")
message(STATUS "gsi(RAPID_GAMBIT_GSI) = ${RAPID_GAMBIT_GSI}")
message(STATUS "gsc(RAPID_GAMBIT_GSC) = ${RAPID_GAMBIT_GSC}")
message(STATUS "larceny(RAPID_GAMBIT_LARCENY) = ${RAPID_GAMBIT_LARCENY}")
message(STATUS "")

