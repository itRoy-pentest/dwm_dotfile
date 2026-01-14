#!/bin/sh

# A dwm_bar function to show the master volume of PulseAudio
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_pulse () {
    VOL=$(pacmd list-sinks | grep -A 15 '* index'| awk '/volume: front/{ print $5 }' | sed 's/[%|,]//g')
    STATE=$(pacmd list-sinks | grep -A 15 '* index'| awk '/muted:/{ print $2 }')

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATE" = "yes" ] || [ "$VOL" -eq 0 ]; then
            printf " 󰝟 " 
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf " 󰕿  %s%% " "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf " 󰖀  %s%% " "$VOL"
        else
            printf "   %s%% " "$VOL"
        fi 
    else
        if [ "$STATE" = "yes" ] || [ "$VOL" -eq 0 ]; then
            printf "MUTE"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "VOL %s%% " "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "VOL %s%% " "$VOL"
        else
            printf "VOL %s%% " "$VOL"
        fi
    fi
    printf "%s\n" "$SEP2"
}

dwm_pulse
