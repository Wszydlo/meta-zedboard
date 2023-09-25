inherit core-image

INITRAMFS_SCRIPTS ?= " \
  initramfs-framework-base \
  initramfs-module-verity \
  "

PACKAGE_INSTALL = " \
  ${INITRAMFS_SCRIPTS} \
  ${VIRTUAL-RUNTIME_base-utils} \
  udev \
  base-passwd \
  openssl cryptsetup openssl-bin \
  ${ROOTFS_BOOTSTRAP_INSTALL} \
  "

IMAGE_FEATURES = ""

export IMAGE_BASENAME = "${MLPREFIX}core-initramfs"
IMAGE_NAME_SUFFIX ?= ""
IMAGE_LINGUAS = ""

LICENSE = "MIT"

IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"

IMAGE_ROOTFS_SIZE = "8192"
IMAGE_ROOTFS_EXTRA_SPACE = "0"

