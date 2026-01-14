#!/bin/sh

# A modular status bar for dwm
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xorg-xsetroot

# Import functions with "$include /route/to/module"
# It is recommended that you place functions in the subdirectory ./bar-functions and use: . "$DIR/bar-functions/dwm_example.sh"

# Store the directory the script is running from
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

# Change the appearance of the module identifier. if this is set to "unicode", then symbols will be used as identifiers instead of text. E.g. [📪 0] instead of [MAIL 0].
# Requires a font with adequate unicode character support
export IDENTIFIER="unicode"

# Change the charachter(s) used to seperate modules. If two are used, they will be placed at the start and end.
export SEP1=" "
# export SEP2="]"

# Import the modules
. "$DIR/bar-functions/dwm_networkmanager.sh"
. "$DIR/bar-functions/dwm_battery.sh"
# . "$DIR/bar-functions/dwm_resources.sh"
. "$DIR/bar-functions/dwm_pipewire.sh"
. "$DIR/bar-functions/dwm_date.sh"

# . "$DIR/bar-functions/dwm_alsa.sh"
# . "$DIR/bar-functions/dwm_countdown.sh"
# . "$DIR/bar-functions/dwm_alarm.sh"
# . "$DIR/bar-functions/dwm_transmission.sh"
# . "$DIR/bar-functions/dwm_cmus.sh"
# . "$DIR/bar-functions/dwm_mpc.sh"
# . "$DIR/bar-functions/dwm_spotify.sh"
# . "$DIR/bar-functions/dwm_mail.sh"
# . "$DIR/bar-functions/dwm_loadavg.sh"
# . "$DIR/bar-functions/dwm_backlight.sh"
# . "$DIR/bar-functions/dwm_pipewire.sh"
# . "$DIR/bar-functions/dwm_pulse.sh"
# . "$DIR/bar-functions/dwm_weather.sh"
# . "$DIR/bar-functions/dwm_vpn.sh"
# . "$DIR/bar-functions/dwm_keyboard.sh"
# . "$DIR/bar-functions/dwm_ccurse.sh"
# . "$DIR/bar-functions/dwm_connman.sh"
# . "$DIR/bar-functions/dwm_currency.sh"
# . "$DIR/bar-functions/dwm_wpa.sh"

# Update dwm status bar
i=0
j=0
k=0
INTERVAL=0.5
while true
do
# functions to run at slow rate
    [ $i = 0 ] && NETWORK="$(dwm_networkmanager)"
    [ $i = 0 ] && BATT="$(dwm_battery)"
    i=$((i + 1)) && [ "$i" -gt 10 ] && i=0

# functions to run at medium rate
    [ $j = 0 ] && RESC="$(dwm_resources)"
    [ $j = 0 ] && AUDIO="$(dwm_pipewire)"
    j=$((j + 1)) && [ "$j" -gt 5 ] && j=0

# functions to run at fastest rate:
    TIME="$(dwm_date)"

#    [ $k = 1 ] && ALSA="$(dwm_alsa)"
#    [ $k = 1 ] && CONMAN="$(dwm_connman)"
#    [ $k = 1 ] && COUNTDOWN="$(dwm_countdown)"
#    [ $k = 1 ] && ALARM="$(dwm_alarm)"
#    [ $k = 1 ] && TRANS="$(dwm_transmission)"
#    [ $k = 1 ] && CMUS="$(dwm_cmus)"
#    [ $k = 1 ] && MPC="$(dwm_mpc)"
#    [ $k = 1 ] && SPOTIFY="$(dwm_spotify)"
#    [ $k = 1 ] && MAIL="$(dwm_mail)"
#    [ $k = 1 ] && LOAD="$(dwm_loadavg)"
#    [ $k = 1 ] && BKLIGHT="$(dwm_backlight)"
#    [ $k = 1 ] && PULSE="$(dwm_pulse)"
#    [ $k = 1 ] && WX="${__DWM_BAR_WEATHER__}"
#    [ $k = 1 ] && VPN="$(dwm_vpn)"
#    [ $k = 1 ] && KEYBD="$(dwm_keyboard)"
#    [ $k = 1 ] && CCURSE="$(dwm_ccurse)"
#    [ $k = 1 ] && CURRENCY="$(dwm_currency)"
#    [ $k = 1 ] && WPA="$(dwm_wpa)"



    # Append results of each func one by one to the upperbar string
    upperbar="${NETWORK}${BATT}${RESC}${AUDIO}${TIME}"
#    upperbar="$upperbar$ALSA"
#    upperbar="$upperbar$CONMAN"
#    upperbar="$upperbar$COUNTDOWN"
#    upperbar="$upperbar$ALARM"
#    upperbar="$upperbar$TRANS"
#    upperbar="$upperbar$CMUS"
#    upperbar="$upperbar$MPC"
#    upperbar="$upperbar$SPOTIFY"
#    upperbar="$upperbar$MAIL"
#    upperbar="$upperbar$LOAD"
#    upperbar="$upperbar$BKLIGHT"
#    upperbar="$upperbar$PULSE"
#    upperbar="$upperbar$WX"
#    upperbar="$upperbar$VPN"
#    upperbar="$upperbar$KEYBD"
#    upperbar="$upperbar$CCURSE"
#    upperbar="$upperbar$CURRENCY"
#    upperbar="$upperbar$WPA"


    # Append results of each func one by one to the lowerbar string
    # lowerbar=""
    # Uncomment the line below to enable the lowerbar
#    xsetroot -name "$upperbar;$lowerbar"
    # Update rate is 1 / sleep interval
    sleep $INTERVAL
    k=$((k + 1)) && [ "$k" -gt 5 ] && k=0
    xsetroot -name "$upperbar"
done
