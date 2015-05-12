#!/bin/bash
kollision(){
	if [ "$highscore" -ge "$terminallines" ]
	then
	oberstelinie=$(( $highscore - $terminallines + 1 ))
	linkeseite=$(( ${kollision[$oberstelinie]} - 1 ))
		if [ $linkeseite -ge $ort ]
		then
			 
			gameover 
		fi
		rechteseite=$(( ${kollision[$oberstelinie]} + ${ebreite[$oberstelinie]} - 1 ))
		if [ $rechteseite -le $ort ]
		then
			gameover
		fi
	fi

}
