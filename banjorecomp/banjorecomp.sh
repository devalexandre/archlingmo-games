#!/bin/sh
# Launcher for Banjo: Recompiled. The game loads its UI assets relative to the working
# directory, so start it from /opt/banjorecomp. Config, saves and the ROM you select
# are stored under ${XDG_CONFIG_HOME:-~/.config}/BanjoRecompiled.
cd /opt/banjorecomp || exit 1
exec ./BanjoRecompiled "$@"
