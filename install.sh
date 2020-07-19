#!/bin/bash

logo() {
clear    
echo ""    
echo "          ____             _               ___        __       "
echo "         |  _ \  _____   _(_) ___ ___     |_ _|_ __  / _| ___  "
echo "         | | | |/ _ \ \ / / |/ __/ _ \_____| || '_ \| |_ / _ \ "
echo "         | |_| |  __/\ V /| | (_|  __/_____| || | | |  _| (_) |"
echo "         |____/ \___| \_/ |_|\___\___|    |___|_| |_|_|  \___/ "
echo ""
echo "              CODED BY: JAYSON CABRILLAS SAN BUENAVENTURA"
echo ""
echo ""
}

# Termux installer
termux_install() {
    logo
    pkg install nmap -y
    pkg install curl -y
    sleep 3
    echo " Installation complete."
}

# Linux installer
linux_install() {
    logo
    sudo apt install nmap -y
    sudo apt install curl -y
    sleep 3
    echo " Installation complete."
}

main() {
    logo
    echo " [01] Install in Termux"
    echo " [02] Install in Linux"
    echo " [00] Abort installation"
    echo ""
    read -p " Choose environment: " envi
    if [[ $envi == "01" || $envi == "1" ]]; then
    termux_install
    elif [[ $envi == "02" || $envi == "2" ]]; then
    linux_install
    elif [[ $envi == "00" || $envi == "0" ]]; then
    logo
    sleep 2
    clear
    exit
    fi
}

# Argument start here
main
