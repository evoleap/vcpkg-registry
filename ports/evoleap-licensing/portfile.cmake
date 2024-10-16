vcpkg_download_distfile(
    ARCHIVE
    URLS "https://evoleapbuilds.blob.core.windows.net/elm-cpp-vcpkg/evoleap.licensing-2024-10-15-14-35-57.zip"
    FILENAME "evoleap-licensing_x64-windows.zip"
    SHA512 "785ff7f68235ab1db82824ff5ba0ae8749b89c72a7cc513ea7ce19d8f37e67c5c528318ae42e0cbbeca9620d96fd68b3d074066eaed318bb10320425e3a6b15a"
)

vcpkg_extract_source_archive(
    ARCHIVE_OUT
    ARCHIVE ${ARCHIVE}
    BASE_DIRECTORY evoleap-licensing_x64-windows
)

message(STATUS "Extracted the archive to ${ARCHIVE_OUT} and will install to ${CURRENT_PACKAGES_DIR}")

file(GLOB binfiles ${ARCHIVE_OUT}/bin/*)
file(GLOB debugbinfiles ${ARCHIVE_OUT}/debug/bin/*)
file(GLOB debuglibfiles ${ARCHIVE_OUT}/debug/lib/*)
file(GLOB includefiles ${ARCHIVE_OUT}/include/*)
file(GLOB libfiles ${ARCHIVE_OUT}/lib/*)
file(GLOB sharefiles ${ARCHIVE_OUT}/share/evoleap-licensing/*)
file(GLOB toolsfiles ${ARCHIVE_OUT}/tools/evoleap-licensing/*)

file(INSTALL ${binfiles} DESTINATION ${CURRENT_PACKAGES_DIR}/bin)
file(INSTALL ${debugbinfiles} DESTINATION ${CURRENT_PACKAGES_DIR}/debug/bin)
file(INSTALL ${debuglibfiles} DESTINATION ${CURRENT_PACKAGES_DIR}/debug/lib)
file(INSTALL ${includefiles} DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${libfiles} DESTINATION ${CURRENT_PACKAGES_DIR}/lib)
file(INSTALL ${sharefiles} DESTINATION ${CURRENT_PACKAGES_DIR}/share/evoleap-licensing)
file(INSTALL ${toolsfiles} DESTINATION ${CURRENT_PACKAGES_DIR}/tools/evoleap-licensing)

# Original portfile.cmake to install locally and create package:
# vcpkg_from_git(
#     OUT_SOURCE_PATH SOURCE_PATH
#     URL "https://github.com/evoleap/evoleap.licensing.cpp.git"
#     REF 5afd26885317ea070f4779125e7c579d4113f0e2
#     SHA512 459f67202cf0dbe64bdf93edea656e6acfcee2ee326a24931a9a1845ab03764a093d2862485f221c11ef7a1bc366af1712c567afacf1acfcb9b90dfec66f8aa4
#     HEAD_REF main
# )

# # Dump some context information for debugging
# # execute_process(COMMAND "${CMAKE_COMMAND}" "-E" "environment")
# # execute_process(COMMAND "cmd.exe" "-c" "pwd")
# # message(STATUS "${CMAKE_CURRENT_LIST_DIR}")

# set(vcpkgInstalled "${CMAKE_CURRENT_LIST_DIR}/../../vcpkg/installed")
# #set(vcpkgInstalled "C:/source/evoleap.licensing.cpp/vcpkg/installed")
# set(buildPlatform "x64")
# set(buildOS "windows")
# set(buildincludes "${vcpkgInstalled}/${buildPlatform}-${buildOS}/include")
# set(vcpkgLib "${vcpkgInstalled}/${buildPlatform}-${buildOS}/lib")
# set(buildlibdirs ${CMAKE_BINARY_DIR}/all_libs)
# set(buildlibs "${vcpkgLib}/*.lib")

# file(MAKE_DIRECTORY ${buildlibdirs})

# # Copy library files
# file(GLOB LIB_FILES "${vcpkgLib}/*.lib")
# file(COPY ${LIB_FILES} DESTINATION ${buildlibdirs})

# # Copy DLL files
# file(GLOB DLL_FILES "${vcpkgInstalled}/${buildPlatform}-${buildOS}/bin/*.dll")
# file(COPY ${DLL_FILES} DESTINATION ${buildlibdirs})

# message(STATUS "${buildlibs}")

# set_property(TARGET ${TARGET_NAME} PROPERTY VS_PACKAGE_REFERENCES "g")

# # Find Nuget (install the latest CLI here: https://www.nuget.org/downloads).
# set(NUGET "${CMAKE_CURRENT_LIST_DIR}/../../Tools/NuGet.exe")
# if(NOT NUGET)
#     message(FATAL "CMake could not find the nuget command line tool. Please install it!")
# else()
#     # Run Nuget using the .config file to installing any missing dependencies to the build directory.
#     execute_process(COMMAND 
#         ${NUGET} restore ${SOURCE_PATH}/src/evoleap.licensing.test/packages.config -SolutionDirectory ${SOURCE_PATH}/src
#     )
# endif()

# vcpkg_install_msbuild(
#     SOURCE_PATH "${SOURCE_PATH}"
#     PROJECT_SUBPATH src/evoleap.licensing.sln
#     OPTIONS
#         "/p:IncludePath=${buildincludes}"
#         "/p:VCPkgLibs=${buildlibdirs}"
#         "/p:VCPkgDeps=\"${buildlibs}\""
#         # /v:diag
#     ${PLATFORM_ARG}
#     ${additional_options}
# )

# # file(GLOB_RECURSE LIB_FILES "${CURRENT_PACKAGES_DIR}/lib/*.lib")
# # file(GLOB_RECURSE DEBUG_LIB_FILES "${CURRENT_PACKAGES_DIR}/debug/lib/*.lib")
# # foreach(file ${LIB_FILES} ${DEBUG_LIB_FILES})
# #     if(NOT file MATCHES "evoleap.licensing.lib")
# #         file(REMOVE ${file})
# #     endif()
# # endforeach()

# file(GLOB GLOB_HEADERS "${SOURCE_PATH}/src/evoleap.licensing/*.h")
# file(COPY ${GLOB_HEADERS} DESTINATION "${CURRENT_PACKAGES_DIR}/include")

# vcpkg_install_copyright(FILE_LIST
#     "${SOURCE_PATH}/LICENSE.txt"
# )
