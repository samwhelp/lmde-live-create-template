#!/usr/bin/env bash


################################################################################
# Default Target
################################################################################




################################################################################
# OS system information
################################################################################

# This is the apt source for both the build process and the live system.
# It can be any Debian mirror that you prefer.
# You can change it to any other mirror that you prefer.
APT_SOURCE="http://deb.debian.org/debian"

# This is the target Debian version code name for the build.
# It should match the Debian version you are building against.
# For example, if you are building against Debian 13, this should be "trixie".
# If you are building against Debian 13, this should be "trixie".
# Can be: trixie
TARGET_DEBIAN_VERSION="trixie"

# This is the target CPU architecture.
#   amd64 — Intel / AMD 64-bit
#   arm64 — ARM 64-bit (Raspberry Pi, Snapdragon, Apple Silicon, etc.)
#TARGET_ARCH="$(dpkg --print-architecture)"
TARGET_ARCH=amd64

# This is the name of the target OS.
# Must be lowercase without special characters and spaces
TARGET_NAME="lmde"

# This is the full display name of the target OS.
# Business name. No special characters or spaces
TARGET_BUSINESS_NAME="Lmde"

# Version number. Must be in the format of x.y.z
TARGET_BUILD_VERSION="7.0.0"

# For xorriso -volid
TARGET_ISO_VOLID="LMDE"

################################################################################
# Installer customization
################################################################################

# Packages will be uninstalled during the installation process
TARGET_PACKAGE_REMOVE="
	live-boot \
	live-config \
	live-config-systemd \
	laptop-detect \
	os-prober \
	gparted \
"

################################################################################
# Lmde PKG server configuration
################################################################################

# PKG server URL for Lmde-branded overlay packages.
PKG_SERVER="http://packages.linuxmint.com"

# GPG certificate name on the PKG server (used to download and verify the repo).
# The cert is fetched from: ${PKG_SERVER}/artifacts/certs/${PKG_CERT_NAME}
PKG_CERT_NAME="lmde"
