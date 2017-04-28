#!/usr/bin/env sh

# Set Variables
homesh="$HOME/sh"
mkd="/bin/mkdir -p"
readp="read -p"
ece="/bin/echo -e"
ec_bb="\033[46;30m"
ec_wr="\033[47;31m"
ec_0="\033[0m"
ec_pr="$0 ERROR: Permission Denied"
ec_yn="Please enetr Y or N."

# Welcome and Copyright
$ece "\n"$ec_bb"XMX Number Circulator"$ec_0"\n"
echo "Copyright (C) 2017 YuanYuan in BLMF club"
echo "Lincesed under by GNU GPLv3+: GNU GPL 3 and later <http://www.gnu.org/lincese/>"
$ece "This is free software; you are free to change and redistribute it.\n"

# Get Parameter
$readp "Start= " strI
$readp "End= " endI
$readp "Step= " stpI
echo "(1-echo text; 2-mksh; 3-mkdir; 4-echo nmuber)"
$readp "Operation= " optI
if [ $optI = 1 ]; then
    $readp "Enter Text You Want to Dispaly: " texI
    $readp "Warp? (Y or N): " wrpI
    $readp "Text of Endline: " enlI
    echo ""
elif [ $optI = 2 -o $optI = 3 ]; then
    $ece ""$ec_wr"This script will create .sh files or directories in your HOME diretcory!"$ec_0""
    $ece ""$ec_wr"Please enter CTRL+C to stopped!"$ec_0""
    $readp "Add Prefix? (Y or N): " adpI
    if [ $adpI = y -o $adpI = Y ]; then
        $readp "Prefix: " preI
    fi
    echo ""
else
    echo ""
fi

# Main Program
for ((i = $strI; i <= $endI; i += $stpI)); do
    case $optI in
        1)
            case $wrpI in
                y|Y)
                    echo "$texI$i$enlI" ;;
                n|N)
                    echo -n "$texI$i$enlI" ;;
                *)
                    echo "$ec_yn"
                    exit 1 ;;
            esac ;;
        2)
            case $adpI in
                y|Y)
                    if [ ! -e $homesh ]; then
                        if [ ! -w $HOME ]; then
                            echo "$ec_pr"
                            exit 1
                        else
                            $mkd $homesh
                            touch $homesh/$preI$i.sh
                            chmod 755 $homesh/$preI$i.sh
                            echo "The $homesh$preI$i.sh is created!"
                        fi
                    else
                        touch $homesh/$preI$i.sh
                        chmod 755 $homesh/$preI$i.sh
                        echo "The $homesh$preI$i.sh is created!"
                    fi ;;
                n|N)
                    if [ ! -e $homesh ]; then
                        if [ ! -w $HOME ]; then
                            echo "$ec_pr"
                            exit 1
                        else
                            $mkd $homesh
                            touch $homesh/$i.sh
                            chmod 755 $homesh/$i.sh
                            echo "The $homesh/$i.sh is created!"
                        fi
                    else
                        touch $homesh/$i.sh
                        chmod 755 $homesh/$i.sh
                        echo "The $homesh/$i.sh is created!"
                    fi ;;
                *)
                    echo "$ec_yn"
                    exit 1 ;;
            esac ;;
        3)
            case $adpI in
                y|Y)
                    if [ ! -w $HOME ]; then
                        echo "$ec_pr"
                        exit 1
                    else
                        $mkd $HOME/$preI$i
                        chmod 744 $HOME/$preI$i
                        echo "The $HOME/$preI$i is created!"
                    fi ;;
                n|N)
                    if [ ! -w $HOME ]; then
                        echo "$ec_pr"
                        exit 1
                    else
                        $mkd $HOME/$i
                        chmod 744 $HOME/$i
                        echo "The $HOME/$i is created!"
                    fi ;;
            esac ;;
        4)
            echo "$i" ;;
        [5-9])
            echo "You Are Rubbish !"
            exit 1 ;;
        *)
            echo "You Are Big Rubbish! HA HA HA!" ;;
    esac
done

# Clear Variables
unset i
unset preI
unset enlI
unset texI
unset strI
unset endI
unset optI
unset stpI

# Thanks
$ece "\n"$ec_bb"Completed!"$ec_0""
echo ""
