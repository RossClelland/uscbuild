#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

USCOIND=${USCOIND:-$SRCDIR/uscoind}
USCOINCLI=${USCOINCLI:-$SRCDIR/uscoin-cli}
USCOINTX=${USCOINTX:-$SRCDIR/uscoin-tx}
USCOINQT=${USCOINQT:-$SRCDIR/qt/uscoin-qt}

[ ! -x $USCOIND ] && echo "$USCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
UCSVER=($($USCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for uscoind if --version-string is not set,
# but has different outcomes for uscoin-qt and uscoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$USCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $USCOIND $USCOINCLI $USCOINTX $USCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${UCSVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${UCSVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
