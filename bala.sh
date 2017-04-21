#!/usr/bin/env bash

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
$ece ""$ec_bb"XMX Number Circulator"$ec_0"\n"
echo "Copyright (C) 2017 YuanYuan in BLMF club"
echo "Lincesed under by GNU GPLv3+: GNU GPL 3 and later <http://www.gnu.org/lincese/>"
$ece "This is free software; you are free to change and redistribute it.\n"

# Get Parameter
$readp "Start= " strI
$readp "End= " endI
$readp "Step= " stpI
echo ""
$readp "Operation= " optI
if [ $optI -eq 1 ]; then
    $readp "Enter text you want to dispaly: " texI
    $readp "Warp? (Y or N): " wrpI
    $readp "Text of endline: " enlI
fi
