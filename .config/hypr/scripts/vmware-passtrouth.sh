#!/bin/bash

VM_CLASS="Vmware"
PASSTHROUGH_ACTIVE=0

check_state() {
    WINDOW_INFO=$(hyprctl activewindow)
    CURRENT_CLASS=$(echo "$WINDOW_INFO" | grep "class: " | awk '{print $2}' | tr -d '[:cntrl:]')
    IS_FULLSCREEN=$(echo "$WINDOW_INFO" | grep "fullscreen: " | awk '{print $2}' | tr -d '[:cntrl:]')

    if [[ "$CURRENT_CLASS" == "$VM_CLASS" && "$IS_FULLSCREEN" != "0" ]]; then
        if [[ "$PASSTHROUGH_ACTIVE" -eq 0 ]]; then
            echo "activate"
            hyprctl dispatch submap passthrough
            PASSTHROUGH_ACTIVE=1
        fi
    elif [[ "$CURRENT_CLASS" == "$VM_CLASS" && "$IS_FULLSCREEN" == "0" ]]; then
        if [[ "$PASSTHROUGH_ACTIVE" -eq 1 ]]; then
            echo "back"
            hyprctl dispatch submap reset
            PASSTHROUGH_ACTIVE=0
        fi
    fi
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
    if [[ "$line" == activewindow\>\>* || "$line" == fullscreen\>\>* ]]; then
        sleep 0.1
        check_state
    fi
done