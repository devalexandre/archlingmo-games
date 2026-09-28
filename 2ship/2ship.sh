#!/bin/sh
# Launcher for 2 Ship 2 Harkinian. /opt/2ship is read-only, so run from a per-user data dir:
# config, saves, mods and the .o2r generated from your ROM live there.
: "${SHIP_HOME:=${XDG_DATA_HOME:-$HOME/.local/share}/2ship}"
export SHIP_HOME
mkdir -p "$SHIP_HOME" && cd "$SHIP_HOME" || exit 1
exec /opt/2ship/usr/bin/2s2h.elf "$@"
