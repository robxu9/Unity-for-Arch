#!/usr/bin/env bash

source "$(dirname ${0})/PKGBUILD"

echo "Getting latest Ubuntu version..."
UBUNTU_VER=($(wget -q -O - 'https://launchpad.net/ubuntu/quantal/+source/gnome-screensaver' | sed -n 's/^.*current\ release\ (\(.*\)-\(.*\)).*$/\1 \2/p'))

echo "Getting latest Arch Linux version..."
ARCHLINUX_VER=($(wget -q 'https://www.archlinux.org/packages/extra/x86_64/gnome-screensaver/' -O - | sed -n '/<title>/ s/^.*gnome-screensaver\ \(.*\)-\(.*\)\ (.*$/\1 \2/p'))

echo "Getting latest upstream version..."
UPSTREAM_VER=$(wget -q "http://ftp.gnome.org/pub/GNOME/sources/gnome-screensaver/${_actual_ver%.*}/" -O - | sed -n 's/.*>LATEST-IS-\(.*\)<.*/\1/p')

echo ""

echo -e "PKGBUILD version:   ${_actual_ver} Ubuntu ${_ubuntu_ver} ${_ubuntu_rel}"
echo -e "Upstream version:   ${UPSTREAM_VER}"
echo -e "Arch Linux version: ${ARCHLINUX_VER[@]}"
echo -e "Ubuntu version:     ${UBUNTU_VER[@]}"
