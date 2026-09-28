#!/bin/sh
# Launcher for Zelda 64: Recompiled. The game loads its UI assets relative to the working
# directory, so start it from /opt/zelda64recomp. Config, saves and the ROM you select
# are stored under ${XDG_CONFIG_HOME:-~/.config}/Zelda64Recompiled.
cd /opt/zelda64recomp || exit 1
exec ./Zelda64Recompiled "$@"
