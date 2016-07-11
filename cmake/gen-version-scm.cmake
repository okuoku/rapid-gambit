#
# Generate VERSION-rapid-scheme.scm
#
#
# INPUT:
#  RAPID_SCHEME: Full path to rapid-scheme repository root
#  OUT: output path
#  TEMP: temporary output path(always updated)
#

find_package(Git)
set(version "unknown")
if(GIT_FOUND)
    execute_process(
        COMMAND ${GIT_EXECUTABLE}
        describe --always --dirty=-dirty
        WORKING_DIRECTORY ${RAPID_SCHEME}
        OUTPUT_VARIABLE _out
        RESULT_VARIABLE rr
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    if(rr)
        message(STATUS "Failed to fetch version(${rr})")
        set(version "unknown")
    else()
        message(STATUS "rapid-scheme version: ${_out}")
        set(version "${_out}")
    endif()
endif()

file(WRITE ${TEMP} "(define %%rapid-scheme-version \"${version}\")\n")

execute_process(
    COMMAND ${CMAKE_COMMAND}
    -E copy_if_different
    ${TEMP} ${OUT})

if(${version} STREQUAL "unknown")
    message(STATUS "WARNING: Unknown version. Please 'clean' when update rapid-scheme")
    #    message(STATUS "WARNING: Unknown version. Force rebuilding.")
    #execute_process(
    #    COMMAND ${CMAKE_COMMAND}
    #    -E touch ${OUT})
endif()

if(${version} MATCHES "-dirty")
    message(STATUS "WARNING: It seems rapid-scheme repository has uncommitted change(s)")
    #message(STATUS "WARNING: It seems uncommited change exists. Force rebuilding.")
    #execute_process(
    #    COMMAND ${CMAKE_COMMAND}
    #    -E touch ${OUT})
endif()

