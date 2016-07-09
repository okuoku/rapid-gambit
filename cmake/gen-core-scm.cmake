#
# Bootstrap rapid-scheme with Larceny
#
# INPUT:
#  LARCENY: path to larceny executable
#  RAPID_SCHEME: full path to rapid-scheme repository root
#  ENTRYPOINT: full path to main program
#  OUT: full path to output(core.scm)
#

macro(do_cygpath out pth)
    set(_input ${pth})
    execute_process(
        COMMAND cygpath -m ${_input}
        OUTPUT_VARIABLE _output
        RESULT_VARIABLE rr
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    if(rr)
        message(FATAL_ERROR "cannot convert path ${pth}: ${rr}")
    endif()
    message(STATUS "${_input} => ${_output}")
    set(${out} "${_output}")
endmacro()

find_program(has_cygpath cygpath)

if(has_cygpath)
    # Override paths into Win32
    message(STATUS "We are going to run Win32 Larceny on Cygwin")
    message(STATUS "Paths are converted:")
    do_cygpath(RAPID_SCHEME ${RAPID_SCHEME})
    do_cygpath(ENTRYPOINT ${ENTRYPOINT})
    do_cygpath(OUT ${OUT})
endif()

set(buildline
    ${LARCENY}
    -path
    ${RAPID_SCHEME}
    -r7rs
    -program
    ${ENTRYPOINT}
    --
    -I ${RAPID_SCHEME}
    -I ${RAPID_SCHEME}/share
    -o ${OUT}
    ${ENTRYPOINT}
    )

message(STATUS "Running:")
foreach(e ${buildline})
    message(STATUS "  ${e}")
endforeach()

execute_process(COMMAND ${buildline}
    RESULT_VARIABLE rr)

if(rr)
    message(FATAL_ERROR "Error: ${rr}")
endif()
