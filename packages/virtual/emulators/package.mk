# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2022 - Fewtarius

PKG_NAME="emulators"
PKG_LICENSE="Apache-2.0"
PKG_SITE="www.jelos.org"
PKG_SECTION="virtual"
PKG_LONGDESC="Emulation metapackage."

PKG_EMUS="flycastsa hatarisa hypseus-singe hypseus-singe moonlight openbor pico-8          \
         PPSSPPSDL scummvmsa vicesa"

PKG_RETROARCH="core-info libretro-database retroarch retroarch-assets retroarch-joypads                  \
              retroarch-overlays slang-shaders"

LIBRETRO_CORES="2048 81 a5200 atari800 beetle-gba beetle-lynx beetle-ngp beetle-pce beetle-pce-fast      \
                beetle-pcfx bsnes bsnes-mercury-performance beetle-supafaust beetle-supergrafx           \
                beetle-vb beetle-wswan beetle-saturn bluemsx cannonball cap32 crocods daphne dinothawr   \
                dosbox-svn dosbox-pure duckstation easyrpg fake08 fbalpha2012 fbalpha2019                \
                fbneo fceumm fmsx flycast freechaf freeintv freej2me fuse-libretro gambatte gearboy      \
                gearcoleco gearsystem genesis-plus-gx genesis-plus-gx-wide gme gw-libretro handy hatari  \
                mame2000 mame2003-plus mame2010 mame2015 melonds meowpc98 mesen mgba mrboom mupen64plus  \
                mupen64plus-nx neocd_libretro nestopia np2kai nxengine o2em opera parallel-n64           \
                pcsx_rearmed picodrive pokemini potator prboom prosystem ppsspp puae px68k quasi88       \
                quicknes race reminiscence sameboy sameduck scummvm smsplus-gx snes9x snes9x2002         \
                snes9x2005_plus snes9x2010 stella stella-2014 swanstation TIC-80 tgbdual tyrquake uzem   \
                vba-next vbam vecx vice yabasanshiro virtualjaguar xmil xrick"

### Emulators or cores for specific devices
case "${DEVICE}" in
  handheld)
    PKG_DEPENDS_TARGET+=" duckstationsa dolphin dolphinsa cemu citra citrasa desmume lrps2 mame melondssa minivmac minivmacsa       \
                        pcsx2sa play primehack rpcs3sa xemu yuzusa"
    LIBRETRO_CORES+=" beetle-psx bsnes-hd"
  ;;
  RK3588)
    PKG_DEPENDS_TARGET+=" duckstationsa dolphin dolphinsa aethersx2 mame pcsx_rearmed box86 box64"
    LIBRETRO_CORES+=" beetle-psx bsnes-hd"
    PKG_EMUS+=" yabasanshiroSA"
  ;;
  RK3566)
    PKG_DEPENDS_TARGET+=" common-shaders glsl-shaders pcsx_rearmed box86 box64"
    PKG_EMUS+=" yabasanshiroSA"
  ;;
esac

PKG_DEPENDS_TARGET+=" ${PKG_EMUS} ${PKG_RETROARCH} ${LIBRETRO_CORES}"
