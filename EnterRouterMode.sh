#!/bin/sh
# FeelFamous Basecamp — RavPower RP-WD03 boot script
# Place this file at the ROOT of the SD card (same level as the basecamp/ folder)
# The device executes this with root permissions every time the SD card mounts.
#
# What it does: creates a symlink from the device's web root into the SD card's
# basecamp folder, so http://10.10.10.254/basecamp/index.html works in any browser.
#
# SD card mounts at: /data/UsbDisk1/Volume1
# Web root is most likely: /www  (standard OpenWrt lighttpd location)

SD_BASECAMP="/data/UsbDisk1/Volume1/basecamp"
WEB_ROOT="/www"

# Remove any stale symlink, create fresh one
rm -f "${WEB_ROOT}/basecamp"
ln -sf "${SD_BASECAMP}" "${WEB_ROOT}/basecamp"

# If /www doesn't exist, try /var/www as fallback
if [ ! -d "${WEB_ROOT}" ]; then
  WEB_ROOT="/var/www"
  rm -f "${WEB_ROOT}/basecamp"
  ln -sf "${SD_BASECAMP}" "${WEB_ROOT}/basecamp"
fi
