
Debian
====================
This directory contains files used to package uscoind/uscoin-qt
for Debian-based Linux systems. If you compile uscoind/uscoin-qt yourself, there are some useful files here.

## uscoin: URI support ##


uscoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install uscoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your uscoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/uscoin128.png` to `/usr/share/pixmaps`

uscoin-qt.protocol (KDE)

