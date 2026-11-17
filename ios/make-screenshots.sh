#!/bin/bash
# Makes the App Store screenshots in the simulators, using the game's photo mode.
#   usage: ./make-screenshots.sh <simulator-udid> <name-prefix> [shots...]
#   e.g.   ./make-screenshots.sh C9FC9990-91D9-44B1-95F4-ADBE97025767 ipad13
#          ./make-screenshots.sh C9FC9990-91D9-44B1-95F4-ADBE97025767 ipad13 house   (retake one)
# The simulator must be booted. Pictures land in ../appstore/screenshots/.
set -e
cd "$(dirname "$0")"
DEV="$1"; PREFIX="$2"; BUNDLE=com.garyphelps.bananaking3d
OUT=../appstore/screenshots; mkdir -p "$OUT"
xcodebuild -project BananaKing3D.xcodeproj -scheme BananaKing3D -configuration Debug \
  -destination "platform=iOS Simulator,id=$DEV" -derivedDataPath build/sim build -quiet
xcrun simctl install "$DEV" build/sim/Build/Products/Debug-iphonesimulator/BananaKing3D.app
ALL="runway jump mine house eyes win purple lasers"
SHOTS="${*:3}"; SHOTS="${SHOTS:-$ALL}"
for shot in $SHOTS; do
  n=1; for s in $ALL; do [ "$s" = "$shot" ] && break; n=$((n+1)); done
  xcrun simctl terminate "$DEV" $BUNDLE 2>/dev/null || true
  xcrun simctl launch "$DEV" $BUNDLE -shot $shot >/dev/null
  sleep 14
  xcrun simctl io "$DEV" screenshot --mask=ignored "$OUT/$PREFIX-$n-$shot.png" >/dev/null 2>&1
  # App Store screenshots must not have an alpha channel
  python3 -c "import sys; from PIL import Image; f=sys.argv[1]; Image.open(f).convert('RGB').save(f, optimize=True)" "$OUT/$PREFIX-$n-$shot.png"
  echo "$OUT/$PREFIX-$n-$shot.png"
done
xcrun simctl terminate "$DEV" $BUNDLE 2>/dev/null || true
