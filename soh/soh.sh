#!/bin/sh
# Launcher for Ship of Harkinian. /opt/soh is read-only, so run from a per-user data dir:
# config, saves, mods and the .o2r generated from your ROM live there.
: "${SHIP_HOME:=${XDG_DATA_HOME:-$HOME/.local/share}/soh}"
export SHIP_HOME
mkdir -p "$SHIP_HOME" && cd "$SHIP_HOME" || exit 1
exec /opt/soh/usr/bin/soh.elf "$@"
