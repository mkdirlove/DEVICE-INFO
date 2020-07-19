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

# Scan devices
scan() {
    logo
    read -p " Enter gateway: " gtip
    echo ""
    sudo nmap -sn $gtip/24 | grep MAC 
    echo ""
    read -p " Back to main Menu?(Y/n): " op
    if [[ $op == "Y" || $op == "y" ]]; then
    main
    else
    logo
    sleep 2
    clear
    exit
    fi
}

# Device information
dev_info() {
    logo
    read -p " Enter MAC address (xx:xx:xx:xx:xx:xx): " mac_add
    curl -i -s -k -X 'POST' -H 'User-Agent: Dalvik/2.1.0 (Linux; U; Android 5.0.1; Nexus 5 Build/LRX22C)' -H 'Content-Type: application/x-www-form-urlencoded' 'http://mobile.maps.yandex.net/cellid_location/?clid=1866854&lac=-1&cellid=-1&operatorid=null&countrycode=null&signalstrength=-1&wifinetworks= + $mac_add + :-65&app=ymetro'
    echo ""
    read -p " Scan another device?(Y/n): " op
    if [[ $op == "Y" || $op == "y" ]]; then
    main
    else
    logo
    sleep 2
    clear
    exit
    fi
}

# About tool
about() {
    logo
    echo ""
    echo " This tool is powered by NMAP."
    echo " This can be use to find out if there is an itruder on you network."
    echo     " It will show all the device information using mac address."
    echo ""
    read -p " Back to main Menu?(Y/n): " op
    if [[ $op == "Y" || $op == "y" ]]; then
    main
    else
    logo
    sleep 2
    clear
    exit
    fi
}

# Main function
main() {
    logo
    echo "         [01] Scan devices                     [03] About"
    echo "         [02] Device info                      [00] Exit"
    echo ""
    echo ""
    read -p " Choose action: " act
    if [[ $act == "01" || $act == "1" ]]; then
    scan
    elif [[ $act == "02" || $act == "2" ]]; then 
    dev_info
    elif [[ $act == "03" || $act == "3" ]]; then
    about
    elif [[ $act == "00" || $act == "0" ]]; then
    logo
    sleep 2
    clear
    exit
    fi
}

# Argument start here
main
