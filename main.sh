#!/bin/bash
titelbild(){
	clear
	cat titelbild
	sleep 2
	clear
}
stty -echo
terminallines=$(tput lines)
. ./strecke1.sh
. ./auto.sh
. ./kollision.sh
. ./gameover.sh
titelbild
if checkexec "whiptail";
then
strecke=$(whiptail --menu "    tacRACER" 15 25 4 Einführung "" strecke1 "" strecke2 "" strecke3 ""  3>&1 1>&2 2>&3)
else
		strecke=$(bash tacracer_start.sh)
fi
$strecke
strecken-start
while :
do
	highscore=$(( $highscore + 1 ))
	breite=$(( $highscore % 50 ))
	if [ $breite == 0 ]
	then
		strassenbreite=$(( $strassenbreite - 1 ))
		if [ $strassenbreite -lt 6 ]
		then
			strassenbreite=6
		fi
	fi
	wegbreite=$(( $strassenbreite - 2 ))
	strecke
	auto
	kollision
	sleep 0.05
	highscore2=$(( $highscore - $terminallines ))
	echo  -ne "\033]0;tacRACER  Highscore:$highscore2\007"
done
