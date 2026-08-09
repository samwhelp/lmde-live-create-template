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

function model_lmde_swap_packages () {

	##
	## ## Install Lmde swap packages
	##

	apt install -y \
		linuxmint-keyring \
		base-files \
	--install-recommends

}




################################################################################
# Main
################################################################################

function portal_lmde_swap_packages () {

	core_check_permission

	print_info "Installing Lmde APT configuration and keyring packages ..."
	model_lmde_swap_packages
	judge "Install Lmde basic packages"

}

portal_lmde_swap_packages
