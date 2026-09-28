#!/bin/sh
# Launcher for sm64coopdx.
# Your ROM, config and downloaded mods live in ${XDG_DATA_HOME:-~/.local/share}/sm64coopdx:
# drop your "Super Mario 64 (U)" .z64 onto the window, or copy it into that folder.
# The upstream binary searches "." for libraries (RUNPATH), so always start it
# from that user-owned folder and point the loader at /opt/sm64coopdx first.
data="${XDG_DATA_HOME:-$HOME/.local/share}/sm64coopdx"
mkdir -p "$data" && cd "$data" || exit 1
export LD_LIBRARY_PATH="/opt/sm64coopdx${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec /opt/sm64coopdx/sm64coopdx "$@"
