cmake_minimum_required(VERSION 2.8.4)
project(rapid-gambit NONE)

# FIXME: Detect them
set(RAPID_GAMBIT_ROOT
    "${CMAKE_CURRENT_SOURCE_DIR}")
set(RAPID_SCHEME_ROOT
    "${CMAKE_CURRENT_LIST_DIR}/../rapid-scheme")

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

if(WIN32 OR CYGWIN)
    set(exeext ".exe")
else()
    set(exeext "")
endif()

set(RAPID_GAMBIT "${CMAKE_CURRENT_BINARY_DIR}/rapid-gambit${exeext}")

# Version data for rapid-scheme
set(RAPID_SCHEME_VERSION "${CMAKE_CURRENT_BINARY_DIR}/VERSION-rapid-scheme.scm")

set(rapid-gambit-bootstrap
    rapid-compiler-gambit.scm)

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

set(rapid-gambit-bootstrap
    ${CMAKE_CURRENT_LIST_DIR}/${rapid-gambit-bootstrap})

set(_templist)
foreach(e ${rapid-gambit-srcs})
    list(APPEND _templist ${CMAKE_CURRENT_LIST_DIR}/${e})
endforeach()

set(rapid-gambit-srcs ${_templist})


# FIXME: Use Git to generate version
add_custom_command(OUTPUT ${RAPID_SCHEME_VERSION}
    COMMAND ${CMAKE_COMMAND} -E touch ${RAPID_SCHEME_VERSION})

# core.scm
add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/core.scm
    COMMAND ${CMAKE_COMMAND}
    -DLARCENY=${RAPID_GAMBIT_LARCENY}
    -DRAPID_SCHEME=${RAPID_SCHEME_ROOT}
    -DENTRYPOINT=${rapid-gambit-bootstrap}
    -DOUT=${CMAKE_CURRENT_BINARY_DIR}/core.scm
    -P ${CMAKE_CURRENT_LIST_DIR}/cmake/gen-core-scm.cmake
    DEPENDS 
    ${rapid-gambit-bootstrap}
    ${CMAKE_CURRENT_LIST_DIR}/cmake/gen-core-scm.cmake
    ${RAPID_SCHEME_VERSION}
    COMMENT "Generating R7RS core with Larceny(core.scm)"
    )

# core0.scm
add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/core0.scm
    COMMAND ${RAPID_GAMBIT_GSI}
    ${CMAKE_CURRENT_LIST_DIR}/gen.scm
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    DEPENDS
    ${CMAKE_CURRENT_LIST_DIR}/gen.scm
    ${CMAKE_CURRENT_BINARY_DIR}/core.scm
    COMMENT "Convert Larceny SEXP into Gambit form(core0.scm)")

configure_file(${CMAKE_CURRENT_LIST_DIR}/config.scm.in
    ${CMAKE_CURRENT_BINARY_DIR}/config.scm
    @ONLY)

configure_file(${CMAKE_CURRENT_LIST_DIR}/buildconfig.scm.in
    ${CMAKE_CURRENT_BINARY_DIR}/buildconfig.scm
    @ONLY)

configure_file(${CMAKE_CURRENT_LIST_DIR}/entrypoint.scm.in
    ${CMAKE_CURRENT_BINARY_DIR}/entrypoint.scm
    @ONLY)

# rapid-gambit
add_custom_command(OUTPUT ${RAPID_GAMBIT}
    COMMAND ${RAPID_GAMBIT_GSC}
    -o ${RAPID_GAMBIT}
    -exe
    ${CMAKE_CURRENT_BINARY_DIR}/entrypoint.scm
    DEPENDS
    ${CMAKE_CURRENT_BINARY_DIR}/entrypoint.scm
    ${rapid-gambit-srcs}
    ${CMAKE_CURRENT_BINARY_DIR}/buildconfig.scm
    ${CMAKE_CURRENT_BINARY_DIR}/config.scm
    ${CMAKE_CURRENT_BINARY_DIR}/core0.scm
    COMMENT "Compiling rapid-gambit(take some time...)"
    )

add_custom_target(rapid-gambit ALL
    DEPENDS ${RAPID_GAMBIT})

message(STATUS "")
message(STATUS "rapid-scheme root(RAPID_SCHEME_ROOT) = ${RAPID_SCHEME_ROOT}")
message(STATUS "gsi(RAPID_GAMBIT_GSI) = ${RAPID_GAMBIT_GSI}")
message(STATUS "gsc(RAPID_GAMBIT_GSC) = ${RAPID_GAMBIT_GSC}")
message(STATUS "larceny(RAPID_GAMBIT_LARCENY) = ${RAPID_GAMBIT_LARCENY}")
message(STATUS "")

