if(NOT DEFINED os_dirs)
    file(GLOB os_dirs "*")
endif()

foreach(dir ${os_dirs})
    if(EXISTS ${dir}/CMakeLists.txt)
        add_subdirectory(${dir})
    endif()
    if(EXISTS ${dir}/build.sh)
        execute_process(COMMAND ${dir}/build.sh -n OUTPUT_QUIET ERROR_QUIET)
    endif()
endforeach()
