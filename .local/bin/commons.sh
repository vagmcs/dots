#!/usr/bin/env bash

#
# Set Colors
#

bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)

#
# Headers and Logging
#

echo_header() { 
	printf "\n${bold}========== %s ==========${reset}\n" "$@"
}

echo_arrow() { 
	printf "➜ $@\n"
}

echo_success() { 
	printf "${green}✔ %s${reset}\n" "$@"
}

echo_error() { 
	printf "${red}✖ %s${reset}\n" "$@"
}

echo_warn() { 
	printf "${tan}➜ %s${reset}\n" "$@"
}

echo_underline() { 
	printf "${underline}${bold}%s${reset}\n" "$@"
}

echo_bold() { 
	printf "${bold}%s${reset}\n" "$@" 
}

echo_note() { 
	printf "${underline}${bold}${blue}Note:${reset} ${blue}%s${reset}\n" "$@"
}

#
# Seeking Confirmation
#
# Usage: seek_confirmation "Any Question?"
#
# if is_confirmed; then
#   action
# else
#   other action
# fi
#

seek_confirmation() {
	printf "\n${bold}$@${reset}"
  	read -p " (y/n) " -n 1
  	printf "\n"
}

seek_confirmation_head() {
  	printf "\n${bold}$@${reset}"
  	read -p "${bold} (y/n)${reset} " -n 1
  	printf "\n"
}

is_confirmed() {
	if [[ "$REPLY" =~ ^[Yy]$ ]]; then
  		return 0
	fi
	return 1
}

#
# Notifications
#

notify() {
	notify-send "Bash Report" $1
}

notify_long_running() {
	start=$(date +%s)
	"$@"
	[ $(($(date +%s) - start)) -le 15 ] || notify-send "Bash Report" "Command \"$(echo $@)\" took $(($(date +%s) - start)) seconds."
}

