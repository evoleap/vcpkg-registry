vcpkg_download_distfile(
    ARCHIVE
    URLS "https://evoleapbuilds.blob.core.windows.net/elm-cpp-vcpkg/evoleap.licensing-2026-09-28-16-07-58.zip"
    FILENAME "evoleap-licensing_x64-windows.zip"
    SHA512 "4fc81ee8d4e572e4c3606753e798e83cf1defd7430e03b2e06a9b78bd497405e50ddd53ed79f119f4b503f37bfd670a3ca93011f9a9b4b8f95f4b4a31ba877d8"
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
