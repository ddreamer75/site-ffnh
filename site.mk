##################
# GLUON Settings #
##################
DEFAULT_GLUON_RELEASE := next_1.5.0f_MHE
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
