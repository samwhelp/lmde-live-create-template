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

function model_live_debianlive_config_install () {

	local source_dir_path="${BASE_DIR_PATH}/asset/overlay"

	mkdir -p "${source_dir_path}"

	echo cp -rfT "${source_dir_path}" /
	cp -rfT "${source_dir_path}" /

}




################################################################################
# Main
################################################################################

function portal_live_debianlive_config_install () {

	core_check_permission

	print_info "Config /etc/live/config.config.d ..."
	model_live_debianlive_config_install
	judge "Config /etc/live/config.config.d"

}

portal_live_debianlive_config_install
