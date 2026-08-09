#!/usr/bin/env bash


################################################################################
# Set up the environment
################################################################################

set -e						# exit on error
set -o pipefail				# exit on pipeline error
set -u						# treat unset variable as error


################################################################################
# Base Path
################################################################################

BASE_DIR_PATH="$(dirname "$(realpath "${0}")")"
LIBS_DIR_PATH="$(realpath "${BASE_DIR_PATH}/../../libs")"


################################################################################
# Init
################################################################################

source "${LIBS_DIR_PATH}/domain/worker/init.sh"




################################################################################
# Model
################################################################################

function mod_initctl_diversion_remove () {

	echo
	echo rm -f /sbin/initctl
	echo
	rm -f /sbin/initctl || true


	echo
	echo dpkg-divert --rename --remove /sbin/initctl
	echo
	dpkg-divert --rename --remove /sbin/initctl || true




	return 0
}

function model_core_initctl_diversion_remove () {

	print_info "Setting up initctl diversion remove ..."
	mod_initctl_diversion_remove
	judge "Set up initctl diversion remove"

}




################################################################################
# Main
################################################################################

function portal_core_initctl_diversion_remove () {

	core_check_permission

	print_info "Config initctl ..."
	model_core_initctl_diversion_remove
	judge "Config initctl"

}

portal_core_initctl_diversion_remove
