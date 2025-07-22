vcpkg_download_distfile(
    ARCHIVE
    URLS "https://evoleapbuilds.blob.core.windows.net/elm-cpp-vcpkg/evoleap.licensing-2025-07-22-09-45-28.zip"
    FILENAME "evoleap-licensing_x64-windows.zip"
    SHA512 "C84bbed2b71284c4cf76844f448840d671dbc225a5968b1005c3b5eba81eec7713ad856a1375eaf7088ca19c87952218dd915667ca76207c54d6a1856fc2d900"
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
