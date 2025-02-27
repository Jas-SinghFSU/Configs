#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
wpctl set-mute @DEFAULT_SOURCE@ toggle

default_source_line=$(wpctl status | awk '/Sources/{flag=1} flag && /\*/ {print; exit}')

if echo "$default_source_line" | grep -q "MUTED"; then
    pw-play --volume=1 "$SCRIPT_DIR/resources/audio/discord-mute.wav"
else
    pw-play --volume=1 "$SCRIPT_DIR/resources/audio/discord-unmute.wav"
fi
