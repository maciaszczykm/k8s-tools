#!/bin/bash

ERROR_STYLE=`tput setaf 1`
INFO_STYLE=`tput setaf 2`
BOLD_STYLE=`tput bold`
RESET_STYLE=`tput sgr0`

function log::info() { echo -e "\n${INFO_STYLE}${BOLD_STYLE}$@${RESET_STYLE}\n"; }
function log::error() { echo -e "\n${ERROR_STYLE}${BOLD_STYLE}$@${RESET_STYLE}\n"; }
