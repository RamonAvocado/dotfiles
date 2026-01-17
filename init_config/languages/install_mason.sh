#! /bin/bash

function confirm() {
	local install_function=$1
	yes | $install_function
}
confirm 'sudo pacman -Sy node'
confirm 'sudo pacman -Sy npm'

