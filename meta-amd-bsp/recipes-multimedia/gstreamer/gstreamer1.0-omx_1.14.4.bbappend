FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

#
# Remove plugins-bad from DEPENDS as it is
# not strictly needed.
#
DEPENDS_remove_amd = "gstreamer1.0-plugins-bad"

SRC_URI += "file://0001-gstomx.conf-add-mesa-omx-bellagio-encoder-avc-decode.patch"

#
# This package should not have commercial license flags.
# There is discussion in the OE community about fixing this
# but in the meantime we'll explicitly remove it here.
#
LICENSE_FLAGS_remove = "commercial"
