#!/bin/sh

# A dwm_bar function to show the current network connection/SSID, private IP, and public IP using NetworkManager
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, curl

dwm_networkmanager() {
    ICON1=" " && ICON2=" "
    [ "$IDENTIFIER" = "unicode" ] || ICON1="Eth"
    [ "$IDENTIFIER" = "unicode" ] || ICON2="WiFi"
    color_fg_norm="^c#87af5f^" 
    color_fg_urgent="^c#e54c62^"
    color_reset="^d^"
    CONNAME="$(nmcli -a | grep 'Wired connection' | sed 's/\/.*//g; s/://' | awk 'NR==1{print $1}')"
    [ -z "$CONNAME" ] || RATE="$(cat /sys/class/net/$CONNAME/speed)" 
    [ -z "$CONNAME" ] || SPEED="($RATE Mbps)" 
    [ -z "$CONNAME" ] || CONNAME="${color_fg_norm}${ICON1} $CONNAME"
    [ -z "$CONNAME" ] && CONNAME="${color_fg_urgent}${ICON1} Down${color_fg_norm}"

    WIFI="$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -c 5-)" 
    [ -z "$WIFI" ] || WIFI="${color_fg_norm}${ICON2} $WIFI"
    [ -z "$WIFI" ] && WIFI="${color_fg_urgent}${ICON2} Down${color_fg_norm}"

    # PRIVATE=$(nmcli -a | grep 'inet4 192' | sed 's/\/.*//g' | awk '{print $2}')
    # [ -z "$PRIVATE" ] && PRIVATE="${color_fg_urgent}No IP${color_fg_norm}"
    [ "$IDENTIFIER" = "unicode" ] && NET_DATA="${color_fg_norm}${SEP1} ${CONNAME},${WIFI}; ${SPEED} ${SEP2}${color_reset}"
    [ "$IDENTIFIER" = "unicode" ] || NET_DATA="${color_fg_norm}${SEP1} ${CONNAME},${WIFI}; ${SPEED} ${SEP2}${color_reset}"
    echo "$NET_DATA"
}

dwm_networkmanager
