DESCRIPTION = "Sample application for AMD GPIO driver"
SECTION = "applications"
LICENSE = "BSD"
DEPENDS = "readline"
LIC_FILES_CHKSUM = "file://gpio-test.c;md5=c07e1063c9d11d0bafd9efb931ad6119 \
                    file://gpio-test.h;md5=c7aaa743b172cf584032f9bfc5e85044 \
                   "

SRC_URI = "file://gpio-test.c \
           file://gpio-test.h \
          "

TARGET_CC_ARCH += "${LDFLAGS}"

S = "${WORKDIR}"

do_compile() {
	${CC} gpio-test.c -o gpio-test -lreadline
}

do_install() {
	install -d ${D}${bindir}
	install -m 0755 gpio-test ${D}${bindir}
}
