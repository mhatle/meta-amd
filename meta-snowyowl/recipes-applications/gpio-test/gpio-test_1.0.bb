DESCRIPTION = "Sample application for AMD GPIO driver"
SECTION = "applications"
LICENSE = "BSD"
DEPENDS = "readline"
LIC_FILES_CHKSUM = "\
		    file://gpio-test.c;md5=a3c16a86984fd87136f24605bccd26fd \
		    file://gpio-test.h;md5=c7aaa743b172cf584032f9bfc5e85044 \
		   "

PR = "r1"
PV = "1.0"

SRC_URI = "\
	   file://gpio-test.c \
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
