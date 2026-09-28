#!/bin/sh
# Launcher for Starship. /opt/starship-sf64 is read-only, so run from a per-user data dir:
# config, saves, mods and the .o2r generated from your ROM live there.
: "${SHIP_HOME:=${XDG_DATA_HOME:-$HOME/.local/share}/starship}"
export SHIP_HOME
mkdir -p "$SHIP_HOME" && cd "$SHIP_HOME" || exit 1
exec /opt/starship-sf64/usr/bin/Starship "$@"
