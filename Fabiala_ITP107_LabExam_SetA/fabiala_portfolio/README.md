# ITP107 Laboratory Examination (Set A)
### Personal Portfolio App — Instagram-Style Dark Theme

**Student:** Jhon Michael D. Fabiala
**Professor:** Albert Q. Alforja

---

## Latest revisions

- **Removed the tap-to-change profile picture feature** (image_picker,
  path_provider, shared_preferences) since it hasn't been taught in class
  yet. The profile picture is now simply a **fixed default image** loaded
  from `assets/images/avatar.png`.
- **To use your own photo:** replace the file at `assets/images/avatar.png`
  with your picture — keep the exact same file name (`avatar.png`) — then
  hot-restart the app (`flutter run` again, or a full restart, not just
  hot reload). No code changes needed; the gradient "story ring" color
  around it stays automatically.

## Earlier revisions

- **Skills** text: "Flutter" → **"App Development"**, "Dart" → **"Designing"**.
- Bio tagline: "Flutter Developer • BSIT Student" → **"Web Designer • BSIT
  Student"**.
- Removed the now-unused `about_card.png` and `skills_card.png` from
  `assets/images/` (About Me and Skills are text cards, not images).
- **Code was restructured** to match the section-banner + reusable
  top-level-widget style used in the EventHub reference project: instead of
  one big State class with private `_buildX()` methods, the UI is now split
  into standalone widgets (`ProfileHeader`, `StatItem`, `ProfileTabs`,
  `BottomNavBar`, `TextPostCard`, `InteractivePostCard`, etc.) plus a
  `ProfileData` class holding all editable text/labels in one place. The
  visual output is unchanged.

## Earlier revisions

- **Stats row** now shows **Age (20) / Section (3 IT-B) / Program (BSIT)**
  instead of Posts / Followers / Following.
- **About Me** and **Skills** are now **text cards**, not images.
- The **3 profile tabs** are now **text labels**: Portfolio, About Me, Skill
  (previously icons).
- The **profile picture can now be changed** — tap the avatar to pick a new
  photo from the gallery. The Instagram-style **gradient ring color always
  stays** around it.
- Uses the `image_picker` package (added to `pubspec.yaml`). On iOS you must
  add an `NSPhotoLibraryUsageDescription` key to `ios/Runner/Info.plist`
  (e.g. "This app needs photo library access so you can set your profile
  picture."). On Android, recent versions of the plugin handle the required
  permissions automatically.

---

## How to Run

1. Make sure Flutter is installed: https://docs.flutter.dev/get-started/install
2. Extract this project folder.
3. Open a terminal inside the project folder and run:
   ```
   flutter pub get
   flutter run
   ```
4. Choose an emulator or connected device.

## Where to Find the Required Gesture Button

- Open the app. The feed order is: **About Me → Skills → Interactive Post**.
- Scroll to the **last post** in the feed (marked with a ⚡ bolt icon next to
  the username) to find the gradient **"Click Me"** button.
- **Single Tap** → prints the current date to the Debug Console.
- **Double Tap** → prints the ITP107 professor's full name.
- **Long Press** → prints the student's full name.
- No dialog or snackbar appears on screen for these gestures — the graded
  output is the **Debug Console only** (see terminal / "Run" tab in Android
  Studio / VS Code).

## Widgets Used (7+ required)

| # | Widget            | Where it's used                                     |
|---|--------------------|------------------------------------------------------|
| 1 | `Text`             | Names, bio, captions, likes counter                   |
| 2 | `Image` (asset)    | Avatar, About/Skills post graphics, code preview      |
| 3 | `Container`        | Backgrounds, dividers, the "Click Me" button          |
| 4 | `Card`             | Wraps the interactive post's caption + button area    |
| 5 | `ListView`         | The scrollable feed of posts                          |
| 6 | `ElevatedButton`   | The "Follow" button                                   |
| 7 | `GestureDetector`  | Wraps "Click Me" (tap/double-tap/long-press) & tabs   |
| + | `CircleAvatar`     | Profile picture across the app                        |
| + | `Icon`             | Reaction icons, nav bar, tabs                          |
| + | `RichText`         | Instagram-style bold-username + caption text          |

## Project Structure

```
fabiala_portfolio/
├── lib/
│   └── main.dart
├── assets/
│   └── images/
│       ├── avatar.png
│       ├── about_card.png
│       ├── skills_card.png
│       └── post_preview.png
├── pubspec.yaml
└── README.md
```

## Color Palette (Instagram Dark Theme)

- Background: `#000000` (true black, IG dark mode)
- Surface: `#121212`
- Divider: `#262626`
- Text: `#FAFAFA` (primary) / `#8E8E8E` (secondary, IG gray)
- Link/Button: `#3897F0` (IG blue)
- Like/Heart: `#ED4956` (IG red)
- Accent gradient (avatar ring, Click Me button): classic Instagram
  orange → pink → purple → indigo gradient

This mirrors Instagram's dark-mode profile and feed layout: avatar with
gradient story ring, stats row, Follow/Message buttons, icon-based profile
tabs, and full-width feed posts with header, image, reaction icons, likes
count, and bold-username captions.
