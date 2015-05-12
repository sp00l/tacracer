#!/bin/bash
farbet="48;5;8"
farbes="1;44"
uname=$(uname)
if [ $uname = Darwin -a $TERM = xterm-color ]
then
	farbet=40
	farbes=0
fi

clear
cat -<<'EOF'
_________ _______  _______  _______  _______  _______  _______  _______ 
\__   __/(  ___  )(  ____ \(  ____ )(  ___  )(  ____ \(  ____ \(  ____ )
   ) (   | (   ) || (    \/| (    )|| (   ) || (    \/| (    \/| (    )|
   | |   | (___) || |      | (____)|| (___) || |      | (__    | (____)|
   | |   |  ___  || |      |     __)|  ___  || |      |  __)   |     __)
   | |   | (   ) || |      | (\ (   | (   ) || |      | (      | (\ (   
   | |   | )   ( || (____/\| ) \ \__| )   ( || (____/\| (____/\| ) \ \__
   )_(   |/     \|(_______/|/   \__/|/     \|(_______/(_______/|/   \__/
EOF
echo
echo
echo -e "\033[${farbes}mtacRACER Einführung:"
echo
echo -e "\033[0m"
echo -e "\033[1;34m 1.Schritt: Auswählen der Strecke. Es gibt 4 Strecken, welche alle denn gleichen Schwierigkeitsgrad haben."
echo -e "\033[1;34m 2.Schritt: Das Spiel beginnt. Das Auto '][' lässt sich mit den Tasten A und D steuern."
echo -e "\033[42m              \033[41m \033[${farbet}m           \033[41m \033[42m               "
echo -e "\033[42m              \033[47m \033[${farbet}m     \033[1;31m][\033[0m\033[${farbet}m    \033[47m \033[42m               "
echo -e "\033[42m              \033[41m \033[${farbet}m           \033[41m \033[42m               \033[0m   <<== A steuert das Auto nach links "
echo -e "\033[42m              \033[47m \033[${farbet}m           \033[47m \033[42m               \033[0m   D steuert das Auto nach rechts ==>>\033[42m"
echo -e "\033[42m              \033[41m \033[${farbet}m           \033[41m \033[42m               "
echo -e "\033[42m              \033[47m \033[${farbet}m           \033[47m \033[42m               "
echo -e "\033[42m              \033[41m \033[${farbet}m           \033[41m \033[42m               "
echo -e "\033[0m"
echo -e "\033[1;31m ______________________________________________________________________________"
echo -e "\033[1;31m () \033[1;34mDas Spiel ist dann zu ende, wenn man über die Streckenbegrenzung fährt.\033[1;31m  ()"
echo -e "\033[1;31m () \033[1;34mFür eine gemeisterte Linie gibt es 1 Punkt                             \033[1;31m  ()"
echo -e "\033[1;31m () \033[1;34mWährend des Spiels erhöht sich der Schwierigkeitsgrad der Strecke.     \033[1;31m  ()"
echo -e "\033[1;31m () \033[1;34mUnter dieser URL\033[1;31m http://apr \033[1;34mist es möglich denn Highscore zu betrachten.\033[1;31m ()"
echo -e "\033[1;31m °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°"
echo -e "\033[0m"

