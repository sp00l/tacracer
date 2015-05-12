#!/bin/bash
benu=$(id -nu)
checkexec(){
        prog=$1
        OLDIFS=$IFS
        IFS=':'
        for dir in $PATH
        do  
                if [ -x "$dir/$prog" ]; then
                        IFS=$OLDIFS
                        return 0
                fi  
        done

        IFS=$OLDIFS
        return 1
}
gameover(){
if  checkexec  "mplayer";
then
	sleep 0.3
   	mplayer -vo caca "/home/$benu/Arbeitsfläche/game_over"
fi

 reset
        cat -<<'EOF' 
          __ _  __ _ _ __ ___   ___    _____   _____ _ __
         / _` |/ _` | '_ ` _ \ / _ \  / _ \ \ / / _ \ '__|
        | (_| | (_| | | | | | |  __/ | (_) \ V /  __/ |   
         \__, |\__,_|_| |_| |_|\___|  \___/ \_/ \___|_|   
         |___/                                            
EOF
if [ $highscore -le 100 ]
then
	echo -e "\033[1;35mYour Score: $highscore"
	echo -e "\033[1;34mUnter 100 Punkte ?!? Übe besser noch ein bisschen"
else
	if [ $highscore -le 500 -a $highscore -ge 100 ]
	then
		echo -e "\033[1;34mYour Score: $highscore"
		echo -e "\033[1;34mNicht schlecht :-} das ist eine gute Leistung"
	else
		if [ $highscore -ge 500 ]
		then
			echo -e "\033[1;34mYour Score: $highscore"
			echo -e "\033[1;34mDu bist echt gut, du hast gute Chancen in die Hall of Fame von tacRACER zu gelangen"
		fi
	fi
fi
URL (){

if checkexec "curl";
then
	curl -sL  -x/--noproxy $1
else
	wget -qO- --no-proxy $1
fi
}

#URL "http://www.someserver.com/cgi-bin/highscore?$highscore-$USER" > /dev/null
echo
echo -e "\033[1;34m"
echo "Highscore"
echo
echo " Platz  Punkte  Name"
#URL "http://www.someserver.com/cgi-bin/topten"
echo -e "\033[0m" 
echo
exit 
}


