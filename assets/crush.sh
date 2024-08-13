#!/usr/bin/env sh
# PNGCrush Script
if [ -z "$1" ]; then
    echo "Usage: `basename $0` png-image [...]" >&2
    exit 1
fi
for file in "$@"; do
    TMPFILE=`mktemp .crush-png-tmp.XXXXXXXX` || exit 1
    pngcrush -brute -fix -reduce -rem gAMA -rem cHRM -rem iCCP -rem sRGB "$file" "$TMPFILE" 1>/dev/null || exit 1
    mv "$TMPFILE" "$file"
done