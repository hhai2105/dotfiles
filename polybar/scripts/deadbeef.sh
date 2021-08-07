#!/usr/bin/env zsh

maxVol=100
minVol=0
VolUp(){
    curvol=$(deadbeef --volume | grep -Po ".{0,3}%" | sed "s/%//g")
    if [ $curvol -ge $maxVol ]
    then
	exit;
    fi
    deadbeef --volume $(( curvol + 1 ))
}
VolDown(){
    curvol=$(deadbeef --volume | grep -Po ".{0,3}%" | sed "s/%//g")
    if [ $curvol -le $minVol ]
    then
	exit;
    fi
    deadbeef --volume $(( curvol - 1 ))
}
play-pause(){
    deadbeef --play-pause
    
}
main() {
    OUTPUT=$(deadbeef --nowplaying-tf "%artist% - %title% \[ %playback_time% - %length% \]")
    echo "${OUTPUT}"
}
if ! pgrep -x deadbeef-main >/dev/null;
then
    echo "";
    exit;
fi
case "$1" in
    --up)
	VolUp
	;;
    --down)
	VolDown
	;;
    --toggle)
	play-pause
	;;
    *)
	main "$@";
	;;
esac

