vcpkg_download_distfile(
    ARCHIVE
    URLS "https://evoleapbuilds.blob.core.windows.net/elm-cpp-vcpkg/evoleap.licensing-2024-11-08-11-39-33.zip"
    FILENAME "evoleap-licensing_x64-windows.zip"
    SHA512 "8c1e82a35fc6ac3db179d13edc71f8151e2a7fc5dd9ce680961a6d3493776d66d9d30b767fb73a9df23e125bf910895e62d6aefb5417392dc2bc769698793d04"
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
