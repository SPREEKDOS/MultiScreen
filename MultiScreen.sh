#!/usr/bin/bash
echo -e "Checking prerequisites \n"
if [[  ]]
hash xdotool || echo -e "Installing xdotool \n" && apt install xdotool

source /home/gigasd/.config/Instance/Instance.txt



function check () {
case $1 in
    1)(cd $3 $4 $5 ) || return $2
    ;;
    2)( $3 $4 $5 ) || return $2
    ;;
    3)( $3 $4 $5 ) || $2
    ;;
    4)[[ $3 $4 $5 ]] || return $2
    ;;
    5)[[ $3 $4 $5 ]] || $2
    ;;
esac
}
check 1 1 "/home/$user2 ||" "adduser $user2"
check 1 2 "/home/$user2/.steam ||" "cp -r $HOME/.steam /home/$user2/"
check 1 3 "/home/$user2/.local/share/Steam/ ||" "cp -r $HOME/.local/share/Steam/ /home/$user2/.local/share/"
check 2 4 "hash steam || apt install steam && steam"
check 2 5 "su $user2 && sudo apt install steam"
check 2 6 "whoami == "$user1" || hash steam || sudo apt install steam || steam"
echo -e "steam is ported, installed, launched \n"

check 5 "echo -e "setting up the preference \n" && ${skipset=0} " "-f /$user1/$copafile || -f /$user2/$copafile"

check 2 7 "mkdir /home/$user1/$copath ;; mkdir /home/$user2/$copath ) && touch /home/$user1/$copafile ;; touch /home/$user2/$copafile"

echo -e "choose split-screen mode
[1] Vertical
[2] Horizontal"
read mode
check 4 8 "$mode == 1 || 2"
function skip() {
    if [[ $skipset ]]; then
        $2
    elif [[ $skipset ]]; then
        $1
    else
        skipset=0
    fi
}
skip "echo -e "split-screen_mode=$mode \n" >> /home/$user1/$copafile"
skip "echo -e "split-screen_mode=$mode \n" >> /home/$user1/$copafile"

case $mode in
    1) end=1
    ;;
    2) end=1
    ;;
    *) return 9
    ;;
esac

num=0
declare -a win

function special() {
    while [[ $1 ]]
    do
        $2
    done
}
special "$num -le $end" "echo -e "choose the
    [1] Windows class
    [2] Window ID"
    read Method
    case $Method in
    1) echo -e "Enter windows class \n"
    read winclass
    xdotool --search --class --onlyvisible $winclass
    ;;
    2) echo -e "Enter window $num ID \n"
    ;;
    *) echo -e "Wrong input on $Method"
    ;;
    esac
    read win[ $num ]
    num+=1"

if [[ ! get_num_desktops -e 1 ]]; then
    if [[xdotool getactivewindow get_desktop_for_window -le 2]]; then
        echo -e "script window will be moved to [$workspace] workspace after 5 sec \n"
        sleep 5
        xdotool getactivewindow set_desktop_for_window 1

function hidewindec () { # expand to $3 and $4 if needed
    xdotool set_window --overrideredirect 1 "$1"
    xdotool set_window --overrideredirect 1 "$2"
    xdotool windowunmap --sync "$1"
    xdotool windowunmap --sync "$2"
    xdotool windowmap --sync "$1"
    xdotool windowmap --sync "$2"
}
case $mode in
    1) xdotool windowsize ${win[1]} $((width/2)) $((height-$pheight))
    xdotool windowsize ${win[2]} $((width/2)) $((height-$pheight))
    xdotool windowmove ${win[1]} 0 0
    xdotool windowmove ${win[2]} $((width/2)) 0
    hidewindec ${win[1]} ${win[2]}
    xdotool windowactivate ${win[1]}
    ;;
    2) xdotool windowsize ${win[1]} $width $(($height-$pheight/2))
    xdotool windowsize ${win[2]} $width $(($height-$pheight/2))
    xdotool windowmove ${win[1]} 0 0
    xdotool windowmove ${win[2]} 0 $(($height/2))
    hidewindec ${win[1]} ${win[2]}
    xdotool windowactivate ${win[1]}
    ;;
    *) echo -e "mode value is out of bounds \n"
    return 9
    ;;
esac

# TODO list all controllers

declare -a cont = #get the name by id
num=0
special "$num -le $end" "echo -e "Enter controller $num ID \n"
    read contID[ $num ]
    echo -e "Controller[ $num ]=${cont[ $num ]} \n"
    num+=1"

# Feedback
num=0
special "$num -le $end" "echo -e "Check if Controller [ $num ] with [get cont value from conf] is sending input? /n"
    # send input by id # get that from conf
    # read ans
    # ans =
    num+=1"

# Details
echo -e "Check controllers details \n"
num=0
special "$num -le $end" "echo -e "Controller $num = ${cont[ $num ]} ID[ $num1 ] = ${contID[ $num ]} \n" skip " >> /home/$user1/$copafile" #/ get that from conf
    echo -e "Controller $num = ${cont[ $num ]} ID[ $num1 ] = ${contID[ $num ]} \n" skip ">> /home/$user2/$copafile" #/ get that from conf
    num+=1
    return 10"

#assign controllers to windows
check 3 "cat /home/$user2/$copafile" "cat /home/$user1/$copafile"
