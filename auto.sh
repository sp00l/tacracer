!/bin/bash
tput=$(tput cols)
ort=$(( $tput / 2 ))
auto(){
	ort2=$(( $ort + 1 ))
	taste=$(perl readkey.pl)
	#read -s -n 1 -t 0.01 taste
	echo -ne "\033[2;${ort2}H"
	echo -ne "\033[${bgfarbe}m"
	echo -ne "\033[1;31m]["
	echo -ne "\033[${terminallines};0H"
	if [ "$taste" = a ]
	then
		ort=$(( $ort - 1 )) 	
	fi

	if [ "$taste" = d ]
	then
		ort=$(( $ort + 1 ))
	fi
}
