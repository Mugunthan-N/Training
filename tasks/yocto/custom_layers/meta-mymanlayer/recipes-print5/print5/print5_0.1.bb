DESCRIPTION = "Hello-my second recipe"
SECTION = "print5 section"
LICENSE="CLOSED"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
SRC_URI = "file://print5.c"
S = "${WORKDIR}"
TARGET_CC_ARCH += "${LDFLAGS}"

do_compile() {
         ${CC} print5.c -o print5 
}

do_install() {
         install -d ${D}${bindir}
         install -m 0755 print5 ${D}${bindir}
}
