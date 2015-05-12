#!/bin/bash
echozeichen(){
for (( i=1; i<=$1; i++ )); do
        echo -n "$2"
done
}
Randomrechnung(){
	RANDOM3=$(( 32768/$1 ))
	Drehung=$(( $RANDOM/$RANDOM3 ))
	echo $Drehung
}
strecke3(){

        if [ $Drehung == 0 ]
	then
		if [ $LINKSRECHTS = -1 ]
		then
			LINKSRECHTS=1
		else
			LINKSRECHTS=-1
		fi
		Drehung=$(Randomrechnung "30")
	else
		RANDOM2=$(( $RANDOM2 + $LINKSRECHTS ))
		Drehung=$(( $Drehung - 1 ))
	fi
	if [ $farbe = 43 ]
	then
	      farbe=47
	else
	      farbe=43
	fi
	echo -ne "\033[40m"
        echozeichen "$RANDOM2" " "
	echo -ne "\033[${farbe}m \033[40m"
        echozeichen "$wegbreite" " "
	echo -ne "\033[40m\033[${farbe}m \033[40m"
        RANDOM3=$(( $tput_Zeichenanzahl - $RANDOM2 - $strassenbreite ))
        echozeichen "$RANDOM3" " "
	tputweg=$(( $tput_Zeichenanzahl -1 - $strassenbreite ))
        if [ $RANDOM2 -ge $tputweg ]
        then
                RANDOM2=$tputweg
        fi
        if [ $RANDOM2 -lt 1 ]
        then
                RANDOM2=1
        fi
	echo
	kollision[$highscore]="$RANDOM2"
	ebreite[$highscore]="$strassenbreite"

}
strecke3-start(){
bgfarbe=40
farbe=43
strassenbreite=20
wegbreite=$(( $strassenbreite -2 ))
tput_Zeichenanzahl=$(tput cols)
Astrecke=$(( $tput_Zeichenanzahl/2-10 ))
RANDOM2=$Astrecke
LINKSRECHTS=1
Drehung=0
}
