vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO zeromq/cppzmq
    REF 7742eb369387b3c7caba8483f1dd7e8d89915042
    SHA512 046ca5a6a084f6d6fa4b458423037037537c2849fa30685ec0ed131753e390547123ff1f88ba0247caa106b7c6f7e1e15e8bcabdf5bb4cc552b40bbc0a954678
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        draft ENABLE_DRAFTS
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
        -DCPPZMQ_BUILD_TESTS=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH share/cmake/cppzmq)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/share/${PORT}/libzmq-pkg-config")

# Handle copyright
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
