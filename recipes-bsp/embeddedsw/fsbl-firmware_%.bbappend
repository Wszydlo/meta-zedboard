FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append = " file://set-zed-board.patch "

YAML_COMPILER_FLAGS:append = " -DRSA_SUPPORT"
