PACKAGECONFIG_append_amd = " faad"

EXTRA_OECONF_remove_amd = " --disable-vdpau"
EXTRA_OECONF_append_amd = " --enable-vdpau"

# we do not support wayland
PACKAGECONFIG_remove_amd = "wayland"
