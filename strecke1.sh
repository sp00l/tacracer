#!/bin/bash
echozeichen(){
for (( i=1; i<=$1; i++ )); do
        echo -n "$2"
done
}
Randomrechnung(){
	kurvenmacher2=$(( 32768/$1 ))
	Drehung=$(( $RANDOM/$kurvenmacher2 ))
	echo $Drehung
}
strecke1(){
ausserhalb_strecke=42
streckenrand_farbe1=41
streckenrand_farbe2=47
strassenfarbe1="48;5;8"
strassenfarbe2=40
}
strecke2(){
ausserhalb_strecke=44
streckenrand_farbe1=40
streckenrand_farbe2=47
strassenfarbe1=46
strassenfarbe2=46
}
strecke3(){
ausserhalb_strecke=40
streckenrand_farbe1=43
streckenrand_farbe2=47
strassenfarbe1=40
strassenfarbe2=40
}

strecke(){

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
		kurvenmacher1=$(( $kurvenmacher1 + $LINKSRECHTS ))
		Drehung=$(( $Drehung - 1 ))
	fi
	if [ $streckenrand = $streckenrand_farbe2 ]
	then
	      streckenrand=$streckenrand_farbe1
	else
	      streckenrand=$streckenrand_farbe2
	fi
	echo -ne "\033[${ausserhalb_strecke}m"
        echozeichen "$kurvenmacher1" " "
	echo -ne "\033[${streckenrand}m \033[${strasse}m"
        echozeichen "$wegbreite" " "
	echo -ne "\033[${ausserhalb_strecke}m\033[${streckenrand}m \033[${ausserhalb_strecke}m"
        kurvenmacher2=$(( $tput_Zeichenanzahl - $kurvenmacher1 - $strassenbreite ))
        echozeichen "$kurvenmacher2" " "
	tputweg=$(( $tput_Zeichenanzahl - 0 - $strassenbreite ))
        if [ $kurvenmacher1 -ge $tputweg ]
        then
                kurvenmacher1=$tputweg
        fi
        if [ $kurvenmacher1 -lt 1 ]
        then
                kurvenmacher1=1
        fi
	echo
	kollision[$highscore]="$kurvenmacher1"
	ebreite[$highscore]="$strassenbreite"

}
strecken-start(){
strasse="$strassenfarbe1"
uname=$(uname)
if [ $uname = Darwin -a $TERM = xterm-color ]
then
	strasse=$strassenfarbe2
fi
streckenrand=$streckenrand_farbe1
bgfarbe="$strasse"
strassenbreite=20
wegbreite=$(( $strassenbreite -2 ))
tput_Zeichenanzahl=$(tput cols)
Anfangslinie=$(( $tput_Zeichenanzahl/2-10 ))
kurvenmacher1=$Anfangslinie
LINKSRECHTS=1
Drehung=0
}
