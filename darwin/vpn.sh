#!/bin/bash

# Provides some basic utilities for VPN connections.
readonly cmd="${1}"
readonly vpn="${2}"
readonly password="$(cat "PUT_PW_HERE" | tr -d "\n")"

err() {
	echo "$*" >&2
}

validateCmd() {
	if [[ -z "${cmd}" ]]; then
		err "Command must be provided: [connect, disconnect, status, list]"
		exit 1
	fi
}

validateVpnName() {
	if [[ -z "${vpn}" ]]; then
		err "VPN name must be provided as second argument"
		exit 1
	fi
}

isConnected() {
	networksetup -showpppoestatus "${vpn}" | grep -qv "^connected$"
}

enterPassword() {
	sleep 1
	osascript -e "tell application \"System Events\" to keystroke tab"
	osascript -e "tell application \"System Events\" to keystroke \"${1}\""
	osascript -e "tell application \"System Events\" to keystroke return"
}

# prompt "Question" "Default value"
function prompt() {
	osascript <<EOT
    tell app "System Events"
      text returned of (display dialog "$1" default answer "$2" buttons {"OK", "Cancel"} default button 1 cancel button 2 with title "$(basename $0)")
    end tell
EOT
}

disconnect() {
	scutil --nc stop "${vpn}"
	notify "Disconnected" "Disconnected from ${vpn}."
}

status() {
	scutil --nc status "${vpn}"
}

list() {
	scutil --nc list
}

# notify "Title" "Description"
function notify() {
	osascript -e "display notification \"$2\" with title \"$1\""
}

function notifyConnection() {
	result="$(status "${vpn}")"
	case "$result" in
	*Connected*)
		notify "Connected" "Successfully connected to ${vpn}"
		;;
	*Disconnected*)
		notify "Disconnected" "Failed to connect to ${vpn}"
		;;
	esac
}

connect() {
	if ! isConnected; then
		err "Already connected to '${vpn}'"
		notify "Already connected to '${vpn}'"
		exit 1
	fi

	token=$(prompt "Input Token:" '')

	passwordtoken="$password$token"

	scutil --nc start "${vpn}"
	enterPassword "${passwordtoken}"

	sleep 1
	notifyConnection
}

main() {
	validateCmd

	case "${cmd}" in
	connect)
		validateVpnName
		connect "${vpn}"
		;;
	disconnect)
		validateVpnName
		disconnect "${vpn}"
		;;
	status)
		validateVpnName
		status "${vpn}"
		;;
	list)
		list
		;;
	toggle)
		vpnStatus=$(networksetup -showpppoestatus "${vpn}")
		if [[ "$vpnStatus" == "disconnected" ]]; then
			~/Scripts/vpn.sh connect "${vpn}"
		elif [[ "$vpnStatus" == "connected" ]]; then
			~/Scripts/vpn.sh disconnect "${vpn}"
		fi
		;;
	*)
		err "Unexpected cmd '${cmd}', must be one of [connect, disconnect, status, list]"
		exit 1
		;;
	esac
}

set -e
main "${@}"
set +e
