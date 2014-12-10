SRCREV_amd = "mesa-10.2.9"
LIC_FILES_CHKSUM_amd = "file://docs/license.html;md5=6a23445982a7a972ac198e93cc1cb3de"
PV_amd = "10.2.0+git${SRCPV}"
DEPENDS_append_amd = " libvdpau"
PACKAGECONFIG_append_amd = " xvmc openvg gallium gallium-egl gallium-gbm r600"
PACKAGECONFIG_append_amd = " gallium-llvm"
MESA_LLVM_RELEASE_amd = "3.4"

# Set DRIDRIVERS with anonymous python so we can effectively
# override the _append_x86-64 assignement from mesa.inc.
python __anonymous () {
    d.setVar("DRIDRIVERS_amd", "radeon")
}

# Install the demos onto the target
RRECOMMENDS_libgl-mesa_append_amd = " mesa-demos"

SRC_URI_amd = "git://anongit.freedesktop.org/git/mesa/mesa;branch=10.2"

DEPENDS_append_amd = " libomxil"
EXTRA_OECONF_append_amd = " \
		 --disable-dri3 \
		 --enable-vdpau \
		 --enable-osmesa \
		 --enable-xa \
		 --enable-glx \
		 --enable-omx \
		 --with-omx-libdir=${libdir}/bellagio \
		"

PACKAGES =+ "libxvmcr600-${PN} libxvmcr600-${PN}-dev"
FILES_libxvmcr600-${PN} = "${libdir}/libXvMCr600${SOLIBS}"
FILES_libxvmcr600-${PN}-dev = "${libdir}/libXvMCr600${SOLIBSDEV} \
                               ${libdir}/libXvMCr600.la"

PACKAGES =+ "libxvmcnouveau-${PN} libxvmcnouveau-${PN}-dev"
FILES_libxvmcnouveau-${PN} = "${libdir}/libXvMCnouveau${SOLIBS}"
FILES_libxvmcnouveau-${PN}-dev = "${libdir}/libXvMCnouveau${SOLIBSDEV} \
                                  ${libdir}/libXvMCnouveau.la"

PACKAGES =+ "libvdpau-${PN} libvdpau-${PN}-dev"
FILES_libvdpau-${PN} = "${libdir}/vdpau/libvdpau*${SOLIBS}"
FILES_libvdpau-${PN}-dev = "${libdir}/vdpau/libvdpau*${SOLIBSDEV} \
                            ${libdir}/vdpau/libvdpau*.la"
FILES_${PN}-dbg += "${libdir}/vdpau/.debug"

PACKAGES =+ "libxatracker-${PN} libxatracker-${PN}-dev"
FILES_libxatracker-${PN} = "${libdir}/libxatracker${SOLIBS}"
FILES_libxatracker-${PN}-dev = "${includedir}/xa_tracker.h \
                                ${includedir}/xa_composite.h \
                                ${includedir}/xa_context.h \
                                ${libdir}/pkgconfig/xatracker.pc \
                                ${libdir}/libxatracker${SOLIBSDEV} \
                                ${libdir}/libxatracker.la \
                                "

#
# libomx files are non-versioned so we put *.so directly in the
# main package as opposed to the -dev package.
#
PACKAGES =+ "libomx-${PN} libomx-${PN}-dev"
FILES_libomx-${PN} = "${libdir}/bellagio/libomx_*.so"
FILES_libomx-${PN}-dev = "${libdir}/bellagio/libomx_*.la"
FILES_${PN}-dbg += "${libdir}/bellagio/.debug"
