vcpkg_download_distfile(
    ARCHIVE
    URLS "https://evoleapbuilds.blob.core.windows.net/elm-cpp-vcpkg/evoleap.licensing-2025-02-11-15-48-37.zip"
    FILENAME "evoleap-licensing_x64-windows.zip"
    SHA512 "29729ebbd3e1a5e6724985a39385fe28bf46bf5f34818840572d2800a4362f66d8c9cf3ead8ae863592755c1bc838b430f664bf2d9a5405b6030d94c3e8ab5ff"
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
