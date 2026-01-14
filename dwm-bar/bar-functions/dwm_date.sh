#!/bin/sh

# A dwm_bar function that shows the current date and time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Date is formatted like like this: "[Mon 01-01-00 00:00:00]"
dwm_date () {
    color_fg_norm="^c#dddde0^"
    color_reset="^d^"
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "%s   $(date "+%a %Y-%m-%d > %T")%s" "$color_fg_norm" "$color_reset"
    else
        printf "%s DAT  $(date "+%a %Y-%m-%d > %T")%s" "$color_fg_norm" "$color_reset"
    fi
    printf "%s\n" "$SEP2"
}

dwm_date
