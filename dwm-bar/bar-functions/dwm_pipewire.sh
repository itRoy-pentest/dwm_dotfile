#!/bin/sh

# A dwm_bar function to show the master volume of Pipewire
# Philip Collier https://github.com/AB9IL
# GNU GPLv3

dwm_pipewire(){
    color_fg_norm="^c#7493d2^"
    color_reset="^d^"
    VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ print $2 * 100 }')
    STATE=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '/MUTED/{ print "yes" }')

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATE" = "yes" ] || [ "$VOL" -eq 0 ]; then
            printf "%s 󰝟 %s" "$color_fg_norm" "$color_reset"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "%s 󰕿  %s%% %s" "$color_fg_norm" "$VOL" "$color_reset"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "%s 󰖀  %s%% %s" "$color_fg_norm" "$VOL" "$color_reset"
        else
            printf "%s   %s%% %s" "$color_fg_norm" "$VOL" "$color_reset"
        fi 
    else
        if [ "$STATE" = "yes" ] || [ "$VOL" -eq 0 ]; then
            printf "%s MUTE %s" "$color_fg_norm" "$color_reset"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "%s VOL %s%% %s" "$color_fg_norm" "$VOL" "$color_reset"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "%s VOL %s%% %s" "$color_fg_norm" "$VOL" "$color_reset"
        else
            printf "%s VOL %s%% %s" "$color_fg_norm" "$VOL" "$color_reset"
        fi
    fi
    printf "%s\n" "$SEP2"
}

dwm_pipewire
