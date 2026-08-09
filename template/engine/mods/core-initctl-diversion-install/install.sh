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

function mod_initctl_diversion_package_install () {

local run_cmd=$(cat << __EOF__
	apt-get install -y --no-install-recommends
		dpkg
__EOF__
)


	echo
	echo ${run_cmd}
	echo

	${run_cmd}


	return 0
}

function mod_initctl_diversion_config_install () {


	echo
	echo dpkg-divert --local --rename --add /sbin/initctl
	echo
	dpkg-divert --local --rename --add /sbin/initctl


	if [ -a "/sbin/initctl" ]; then
		echo
		echo rm -f "/sbin/initctl"
		echo
		rm -f "/sbin/initctl"
	fi


	echo
	echo ln -sf /bin/true /sbin/initctl
	echo
	ln -sf /bin/true /sbin/initctl


	#echo
	#echo file /sbin/initctl
	#echo
	#file /sbin/initctl


	echo
	echo ls -al /sbin/initctl
	echo
	ls -al /sbin/initctl || true


	return 0
}

function model_core_initctl_diversion_install () {

	print_info "Setting up initctl diversion install ..."
	mod_initctl_diversion_package_install
	mod_initctl_diversion_config_install
	judge "Set up initctl diversion install"

}




################################################################################
# Main
################################################################################

function portal_core_initctl_diversion_install () {

	core_check_permission

	print_info "Config initctl ..."
	model_core_initctl_diversion_install
	judge "Config initctl"

}

portal_core_initctl_diversion_install
