#!/usr/bin/env bash

BAR="▁▂▃▄▅▆▇█"
WIDTH=14
RANGE=
STANDBY=0

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]
Options:
  --bar <chars>     Characters for bar animation (default: ▁▂▃▄▅▆▇█)
  --width <num>     Width of the bar (default: length of --bar)
  --range <num>     Max range of the bar (default: length of --bar - 1)
  --stb <mode>      Standby mode:
                       0 - clean
                       1 - blank
                       2 - full
                       3 - lowest
                       <string> - custom string
  --restart         Kill existing cava instance
  --help            Show this message
EOF
    exit 1
}

while [[ $# -gt 0 ]]; do
    case $1 in
        --help) usage ;;
        --bar) BAR="$2"; shift 2 ;;
        --width) WIDTH="$2"; shift 2 ;;
        --range) RANGE="$2"; shift 2 ;;
        --stb) STANDBY="$2"; shift 2 ;;
        --restart)
            pkill -f "cava -p /tmp/bar_cava_config"
            exit 0
            ;;
        *) usage ;;
    esac
done

BAR_LENGTH=${#BAR}
WIDTH=${WIDTH:-$BAR_LENGTH}
RANGE=${RANGE:-$((BAR_LENGTH - 1))}

case $STANDBY in
    0) STB='' ;;
    1) STB="‎ " ;;
    2) STB="${BAR: -1}" ;;
    3) STB="${BAR:0:1}" ;;
    *) STB="$STANDBY" ;;
esac

ASCII_PREDICT=$(printf '0%.0s' $(seq 1 "$WIDTH"))
STB_ASCII="${ASCII_PREDICT//0/$STB}"

SED_DICT="s/;//g"
for ((i=0; i<WIDTH || i<BAR_LENGTH; i++)); do
    if (( i < BAR_LENGTH )); then
        SED_DICT="$SED_DICT;s/$i/${BAR:i:1}/g"
    fi
done
SED_DICT="$SED_DICT;s/$ASCII_PREDICT/$STB_ASCII/g"

CONFIG="/tmp/bar_cava_config"
cat >"$CONFIG" <<EOF
[general]
bars = $WIDTH
sleep_timer = 1
[input]
method = pulse
source = auto
[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = $RANGE
EOF

# Run cava with dictionary
cava -p "$CONFIG" | sed -u "$SED_DICT"
