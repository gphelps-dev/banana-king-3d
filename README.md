# Banana King 3D

A 3D parkour game invented by Ashton.

You are the Banana King. Run, jump and double-jump over stone spikes, grass spikes and lasers.
Grab the money, gold, silver and crystals falling from the sky, find all 5 axolotls, and reach
the castle to win. The king's son copies everything you do, and the axolotls you find follow you.

## Play

- **In a browser:** open `index.html`. It works offline.
- **On a Mac:** open **Banana King 3D.dmg** and drag the game into Applications. To make a fresh DMG, run
  `ios/make-dmg.sh` (it builds the Mac app, signs it with the Developer ID and packs it). Or double-click
  **Play Banana King 3D.app** to play in your web browser.
- **On iPad and iPhone:** open `ios/BananaKing3D.xcodeproj` in Xcode and press Run. The app shows the same
  `index.html` full screen. To regenerate the Xcode project after editing `ios/project.yml`, run `xcodegen` in `ios/`.

## App Store

- `appstore/APP_STORE.md`: every field to paste into App Store Connect.
- `appstore/screenshots/`: the iPad 13" and iPhone 6.3" screenshots, made by `ios/make-screenshots.sh`
  with the game's photo mode.
- [PRIVACY.md](PRIVACY.md) and [SUPPORT.md](SUPPORT.md): the privacy policy and support pages the App Store links to.

| Keyboard | Touch | What it does |
| --- | --- | --- |
| W / ↑ | ▲ | Run forward |
| A D / ← → | ◀ ▶ | Steer |
| Space | JUMP | Jump, and press again in the air to double jump |
| V | 👁 | Switch to seeing through the king's eyes |
| R | | Go back to the last checkpoint |

## Change things

Ashton's characters' names are at the top of the script in `index.html`
(`BANANA_NAME`, `RICH_NAME`, `BANANA_SAYS`).

## Credits

Game idea, characters and drawings: Ashton.
3D engine: [three.js](https://threejs.org) r128 (MIT license), in `lib/three.min.js`.
