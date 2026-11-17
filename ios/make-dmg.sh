#!/bin/bash
# Builds the Mac app, signs it with your Developer ID and packs it into "Banana King 3D.dmg" in the game folder.
#   usage: ./make-dmg.sh
#   To also notarize (needed only to share the DMG with other Macs), first save your credentials once with
#     xcrun notarytool store-credentials notary --apple-id <your Apple ID> --team-id U88T3SPD73
#   and then run:  NOTARY_PROFILE=notary ./make-dmg.sh
set -e
cd "$(dirname "$0")"
IDENTITY="${IDENTITY:-348EDBC8335629BE00351E99886804698887321E}"   # Developer ID Application: Gary Phelps (U88T3SPD73)
rm -rf build/mac build/macsym
xcodebuild -project BananaKing3D.xcodeproj -target BananaKing3DMac -configuration Release \
  SYMROOT="$PWD/build/macsym" CODE_SIGNING_ALLOWED=NO build -quiet
APP="build/macsym/Release/Banana King 3D.app"
mkdir -p build/mac/stage
cp -R "$APP" build/mac/stage/
ln -s /Applications build/mac/stage/Applications
codesign --force --options runtime --timestamp --sign "$IDENTITY" "build/mac/stage/Banana King 3D.app"
codesign --verify --deep --strict "build/mac/stage/Banana King 3D.app"
DMG="../Banana King 3D.dmg"
rm -f "$DMG"
hdiutil create -volname "Banana King 3D" -srcfolder build/mac/stage -ov -format UDZO "$DMG" -quiet
codesign --force --timestamp --sign "$IDENTITY" "$DMG"
if [ -n "$NOTARY_PROFILE" ]; then
  xcrun notarytool submit "$DMG" --keychain-profile "$NOTARY_PROFILE" --wait
  xcrun stapler staple "$DMG"
fi
echo "made: $(cd .. && pwd)/Banana King 3D.dmg"
