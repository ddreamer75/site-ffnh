##################
# GLUON Settings #
##################

# Use OpenWRT Source commit 4f4cb52e24ddf4e931b783ea8e65ec5d5b530261 from 12-10-2024
# Use Packages Source commit 3ab468be20c6c385ce06403bf1ff952a4de03565 from 12-10-2024
DEFAULT_GLUON_RELEASE := next_1.5.8a_MHE_OWE
FFNH_SITE_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
FFNH_SITE_VERSION_GIT := $(shell git -C $(FFNH_SITE_DIR) describe --tags --abbrev=0 | sed 's/-.*//')

FFNH_SITE_VERSION_FALLBACK := next_1.5.6_MHE
FFNH_SITE_VERSION := $(if $(FFNH_SITE_VERSION_GIT),$(FFNH_SITE_VERSION_GIT),$(FFNH_SITE_VERSION_FALLBACK))

# DEFAULT_GLUON_RELEASE := $(FFNH_SITE_VERSION)~$(shell date '+%Y%m%d')

DEFAULT_GLUON_PRIORITY := 0
# GLUON_DEPRECATED on "upgrade" to only generate sysupgrade images for older/bad devices. Set to "full" to generate factory images for DEPRECATED Devices
GLUON_DEPRECATED := full

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Default priority for updates.
GLUON_PRIORITY ?= ${DEFAULT_GLUON_PRIORITY}

# enable Gluon Autoupdater by default
GLUON_AUTOUPDATER_ENABLED=1

# enable multidomain support
GLUON_MULTIDOMAIN=1

GLUON_LANGS ?= en de
GLUON_WLAN_MESH ?= 11s
GLUON_REGION := eu
