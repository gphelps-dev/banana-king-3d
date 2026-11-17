# Banana King 3D: everything to paste into App Store Connect

Each value goes in the App Store Connect field with the same name. Lengths were checked against Apple's limits.

---

## 1. Create the app (App Store Connect → Apps → + → New App)

| Field | Value |
| --- | --- |
| Platforms | iOS |
| Name | `Banana King 3D` |
| Primary Language | English (U.S.) |
| Bundle ID | `com.garyphelps.bananaking3d` (it appears in the list after the first archive from Xcode, or register it at developer.apple.com → Identifiers) |
| SKU | `bananaking3d` |
| User Access | Full Access |

---

## 2. App Information (left sidebar → General → App Information)

| Field | Value |
| --- | --- |
| Name | `Banana King 3D` |
| Subtitle (30 max) | `Jump spikes, grab falling gold` |
| Category | Primary: **Games**, subcategories **Action** and **Family** |
| Content Rights | **No**, it does not contain, show or access third-party content |
| Age Rating | Answer the questionnaire as in section 5. The result should be **4+** |
| Made for Kids | Leave **off** (not in the Kids category) |

---

## 3. Version page (1.0 Prepare for Submission)

### Promotional Text (170 max)

```
Ashton's game is here! Jump over spikes and lasers, grab the gold falling from the sky, find all 5 hidden axolotls and race to the castle.
```

### Description (4000 max)

```
Run, jump and double-jump through a sky full of money in Banana King 3D!

You are the Banana King: a royal with a big round head, a pink eye, a blue wink and a tall gold crown. Race along floating platforms high above the clouds, leap over stone spikes and grass spikes, dodge lasers and crashing cars, and grab everything falling from the sky: money, gold bars, silver coins and bananas.

THINGS TO DO
• Double-jump over spikes and parkour across money blocks, banana blocks, and gold and silver blocks
• Collect cash, gold, silver, bananas and glowing crystals
• Bonk golden $ blocks from below for a shower of money
• Run through the Money House for a jackpot
• Survive the Crystal Mine: jump the ankle laser, wait for the laser gate to blink off, and time your jumps over the spinning laser
• Find all 5 hidden axolotls. Each one you find follows you in a line
• Meet Banana Bob (he says POOP!) and Mr. Rich, who throws money from his cloud
• Bounce on banana pads, ride moving platforms, and switch to first-person to see through the king's eyes
• Reach the castle and the throne to win, while the king's son copies every move you make

MADE BY A DAD AND HIS SON
Banana King 3D started as a drawing. Ashton drew the king, the green sun with sunglasses, the banana chandeliers and the money raining from the sky, and we built his game together.

PLAYS GREAT ON IPAD AND IPHONE
• Big, easy touch buttons
• Works completely offline
• No ads, no in-app purchases, no accounts and no data collection
```

### Keywords (100 bytes max, this is 98)

```
parkour,platformer,jump,runner,obstacle,money,gold,lasers,axolotl,crystals,castle,adventure,family
```

### URLs

| Field | Value |
| --- | --- |
| Support URL | `https://github.com/gphelps-dev/banana-king-3d/blob/main/SUPPORT.md` |
| Marketing URL (optional) | `https://github.com/gphelps-dev/banana-king-3d` |
| Privacy Policy URL (App Privacy page) | `https://github.com/gphelps-dev/banana-king-3d/blob/main/PRIVACY.md` |

### Other version fields

| Field | Value |
| --- | --- |
| Copyright | `2026 Gary Phelps` |
| Version | `1.0` (already set in the app) |
| Build | Pick the build you uploaded from Xcode (it shows up 5 to 30 minutes after uploading) |
| Release | Your choice. "Manually release" lets you press the button yourselves. |

### Screenshots: drag these files in (they're in `appstore/screenshots/`)

| App Store Connect slot | Files | Size |
| --- | --- | --- |
| **iPhone** 6.3" display (Dynamic Island, medium). Required | `iphone-1-runway.png` … `iphone-6-win.png` | 1206 × 2622 |
| **iPad** 13" display. Required, because the app runs on iPad | `ipad13-1-runway.png` … `ipad13-6-win.png` | 2064 × 2752 |

Keep them in the numbered order: runway → jump → crystal mine → money house → first-person → win.
App Store Connect fills in the other iPhone and iPad sizes from these.

---

## 4. App Privacy (left sidebar → App Privacy)

1. Privacy Policy URL: `https://github.com/gphelps-dev/banana-king-3d/blob/main/PRIVACY.md`
2. Data Collection → **Get Started** → **"No, we do not collect data from this app"** → Save.
3. Click **Publish** (top right).

---

## 5. Age rating questionnaire (expected result: 4+)

Answer **None** or **No** to everything:

| Question | Answer | Why |
| --- | --- | --- |
| Parental controls / age assurance | No | Not needed: the app has nothing to control |
| Unrestricted web access | **No** | The app can only show its own bundled game; it cannot open web pages |
| User-generated content, messaging or chat | No | |
| Advertising | No | |
| Cartoon or fantasy violence | None | No fighting; the king just says "OUCH!" and goes back to a checkpoint |
| Realistic violence, horror, mature themes, profanity, sexual content, drugs, alcohol, tobacco, medical | None | |
| Contests | None | |
| Gambling, simulated gambling, loot boxes | No / None | The money is just points you pick up; nothing is bought, bet or won by chance |

---

## 6. Pricing and Availability

| Field | Value |
| --- | --- |
| Price | Free (USD 0) |
| Availability | All countries or regions (or choose) |
| Apple silicon Mac / Apple Vision Pro | Optional. The game works with a keyboard on Mac. Leave on or turn off as you like |

The **EU Digital Services Act** question (trader status) appears under Business. As a free hobby app from an individual, you can usually declare **not a trader**. Read Apple's description before choosing.

---

## 7. App Review Information

| Field | Value |
| --- | --- |
| Sign-in required | **No** |
| Contact | Gary Phelps, your phone number in `+1 …` format, gary.mphelps@gmail.com |

### Notes (paste)

```
Banana King 3D is a complete, self-contained 3D platformer game. The whole game (HTML/JavaScript built on the three.js engine, MIT license) is bundled inside the app and runs fully offline in a WKWebView. The app never loads remote content, never downloads code, and blocks navigation to any address outside its own bundle.

There is no login, no account, no in-app purchase, no advertising, no analytics and no data collection.

How to play: tap the title screen to start. The left and right buttons steer, the up button runs forward, JUMP jumps (tap again in the air for a double jump), and the eye button switches to a first-person view. Reach the castle at the end of the course to win; it takes about 1 to 2 minutes. Stone king statues are checkpoints: if you fall or hit a spike or laser you restart from the last one.

The privacy policy is in the app (the "Privacy" button on the title screen) and at https://github.com/gphelps-dev/banana-king-3d/blob/main/PRIVACY.md.

The game was designed by my son Ashton from his own drawings; we built it together.
```

---

## 8. Things already handled in the app (no action needed)

- App icon: 1024 × 1024, no transparency (`ios/BananaKing/Assets.xcassets/AppIcon.appiconset`)
- Export compliance: `ITSAppUsesNonExemptEncryption = NO` is set, so you won't get the encryption questions on every upload
- Privacy manifest: `PrivacyInfo.xcprivacy` says no tracking and no data collected
- In-app privacy policy: the Privacy button on the title screen
- Launch screen, full screen, every iPad orientation, built with Xcode 26.2 / iOS 26.2 SDK (meets Apple's current minimum)
