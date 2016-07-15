#
# Bootstrap rapid-scheme with chibi-scheme
#
# INPUT:
#  CHIBI_SCHEME: path to chibi-scheme executable
#  RAPID_SCHEME: full path to rapid-scheme repository root
#  RAPID_GAMBIT: full path to rapid-gambit repository root
#  ENTRYPOINT: full path to bootstrap program
#  MAIN: full path to main program
#  OUT: full path to output(core.scm)
#

set(buildline
    ${CHIBI_SCHEME}
    -h 1g
    -I ${RAPID_SCHEME}
    ${ENTRYPOINT}
    -I ${RAPID_SCHEME}
    -I ${RAPID_SCHEME}/share
    -I ${RAPID_GAMBIT}/lib
    -o ${OUT}
    ${MAIN}
    )

message(STATUS "Running:")
foreach(e ${buildline})
    message(STATUS "  ${e}")
endforeach()

message(STATUS "")
message(STATUS "WARNING: Bootstrap using chibi-scheme.")
message(STATUS "WARNING: It will take about 10 minutes.")
message(STATUS "")

execute_process(COMMAND ${buildline}
    RESULT_VARIABLE rr)

if(rr)
    message(FATAL_ERROR "Error: ${rr}")
endif()
