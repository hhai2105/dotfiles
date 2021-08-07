#!/usr/bin/env zsh

main() {
    if ! pgrep -x deadbeef-main >/dev/null;
    then
	echo "";
	exit;
    fi
    OUTPUT=$(deadbeef --nowplaying-tf "%artist% - %title%")
    echo "${OUTPUT}"
}

main "$@"
