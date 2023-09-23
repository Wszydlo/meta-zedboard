FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append = " file://set-zed-board.patch "

YAML_COMPILER_FLAGS:append = " -DFSBL_DEBUG_DETAILED -DRSA_SUPPORT"
