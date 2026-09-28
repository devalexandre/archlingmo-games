# archlingmo-games

PKGBUILDs for native PC ports of classic games, published in the `[archlingmo]`
pacman repo.

- Every package repackages the **official upstream Linux release** from the
  project's own GitHub releases page. No third-party rebuilds or mirrors are used.
- **No game data is included.** Each port needs your own copy of the original
  game (a ROM dump you made yourself) and asks for it on first launch.
- Binaries go to `/opt/<pkg>/`. The `/usr/bin/<pkg>` launcher keeps per-user
  data (config, saves, mods, generated asset archives) in your home directory.

| Package | Game | Upstream | Version | License | Needs |
|---|---|---|---|---|---|
| `soh` | The Legend of Zelda: Ocarina of Time | [HarbourMasters/Shipwright](https://github.com/HarbourMasters/Shipwright) | 9.2.3 | none published (see note) + libultraship MIT | your own copy of *Ocarina of Time* (N64 or GameCube ROM) |
| `2ship` | The Legend of Zelda: Majora's Mask | [2ship2harkinian/2ship2harkinian](https://github.com/2ship2harkinian/2ship2harkinian) | 5.0.1 | CC0-1.0 + libultraship MIT | your own copy of *Majora's Mask* (supported N64 ROM dump) |
| `zelda64recomp` | The Legend of Zelda: Majora's Mask | [Zelda64Recomp/Zelda64Recomp](https://github.com/Zelda64Recomp/Zelda64Recomp) | 1.2.2 | GPL-3.0 | your own copy of *Majora's Mask* (US N64 ROM) |
| `sm64coopdx` | Super Mario 64 (online co-op) | [coop-deluxe/sm64coopdx](https://github.com/coop-deluxe/sm64coopdx) | 1.5.1 | none published (see note) | your own copy of *Super Mario 64* (US ROM) |
| `ghostship` | Super Mario 64 | [HarbourMasters/Ghostship](https://github.com/HarbourMasters/Ghostship) | 3.0.0 | MIT | your own copy of *Super Mario 64* (US or JP ROM) |
| `starship-sf64` | Star Fox 64 | [HarbourMasters/Starship](https://github.com/HarbourMasters/Starship) | 2.0.0 | CC0-1.0 + libultraship MIT | your own copy of *Star Fox 64* (US 1.0 or 1.1 ROM) |
| `spaghettikart` | Mario Kart 64 | [HarbourMasters/SpaghettiKart](https://github.com/HarbourMasters/SpaghettiKart) | 1.0.0 | none published (see note) + libultraship MIT | your own copy of *Mario Kart 64* (US ROM) |
| `banjorecomp` | Banjo-Kazooie | [BanjoRecomp/BanjoRecomp](https://github.com/BanjoRecomp/BanjoRecomp) | 1.0.2 | GPL-3.0 | your own copy of *Banjo-Kazooie* (US ROM) |

**License note:** Ship of Harkinian, SpaghettiKart and sm64coopdx do not
publish a license file for their own code (GitHub shows no license). They make
their binaries freely available, but no explicit redistribution grant exists.
Their packages mark this as `LicenseRef-unknown`; decide before publishing them.
sm64coopdx also bundles Discord's proprietary Game SDK (`libdiscord_game_sdk.so`)
as shipped upstream.

## First launch

| Package | How the ROM is requested | Where your data lives |
|---|---|---|
| `soh`, `2ship`, `ghostship`, `starship-sf64`, `spaghettikart` | dialog "No O2R files found / provide a ROM", then a file picker (zenity) | `~/.local/share/<pkg>/` (`$SHIP_HOME`) |
| `zelda64recomp`, `banjorecomp` | "Select ROM" / "Load ROM" in the launcher menu | `~/.config/Zelda64Recompiled/`, `~/.config/BanjoRecompiled/` |
| `sm64coopdx` | drag and drop the `.z64` onto the window, or copy it into the data folder | `~/.local/share/sm64coopdx/` |

For the HarbourMasters ports (`soh`, `2ship`, ...) you can also copy the ROM
into `~/.local/share/<pkg>/` before starting the game.

## Packaging notes

- The HarbourMasters AppImages are extracted at build time (`--appimage-extract`)
  into `/opt/<pkg>/usr/`. Their own bundled libraries stay in `/opt/<pkg>/usr/lib`
  and are found through the binaries' `$ORIGIN/../lib` RUNPATH.
- `starship-sf64`: the AppImage bundles a full Ubuntu 24.04 graphics and audio
  stack (Mesa, LLVM, Wayland, PulseAudio...). Only the app's own libraries are
  kept (SDL2, libzip.so.4, tinyxml2, spdlog, fmt); the rest comes from Arch.
- `zelda64recomp`, `banjorecomp`: the plain release tarball is used and started
  from `/opt/<pkg>` because the game loads its UI assets relative to the working
  directory. They need a Vulkan driver.
- `sm64coopdx`: the upstream binary has RUNPATH `.`, so the launcher always runs
  it from the user-owned data folder with `LD_LIBRARY_PATH=/opt/sm64coopdx`.
  The built-in `coopdx_updater` is not installed; updates come through pacman.

## Building

```sh
cd <pkg>
makepkg --clean
```
