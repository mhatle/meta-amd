require linux-yocto-amd-4.1.inc

SRC_URI_append_amdfalconx86 += "file://amdfalconx86-gpu-config.cfg \
				file://amdfalconx86-standard-only.cfg \
"
