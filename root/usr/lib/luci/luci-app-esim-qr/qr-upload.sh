#!/bin/sh
IMAGE="$1"
TMP="/tmp/esim-qr"

zbarimg --raw "$IMAGE" > "$TMP.txt" 2>/dev/null
CODE=$(cat "$TMP.txt" | tr -d '\n')

if echo "$CODE" | grep -q "^LPA:1"; then
    LPAC_APDU=at AT_DEVICE=/dev/ttyUSB2 lpac profile download -a "$CODE"
    logger "eSIM profile added from QR: $CODE"
    echo "Success! Profile added." > /tmp/esim-result.txt
else
    echo "No valid LPA code found in QR." > /tmp/esim-result.txt
fi
