# WelcomeScreen

A lightweight SwiftUI package that provides a polished first-launch screen for iOS, macOS, and tvOS apps. The layout is inspired by Apple’s onboarding style: a centered logo, welcome title, short description, sign-in button, and legal agreement footer with tappable links.

## Features

- **SwiftUI-first** — drop-in `WelcomeScreen` view with a custom logo via `@ViewBuilder`
- **Cross-platform** — iOS 15+, macOS 12+, tvOS 15+
- **Localized UI** — welcome title, sign-in button, and legal text adapt to the user’s locale
- **Legal footer** — license agreement and privacy policy rendered as inline markdown links
- **Customizable** — app name, description, accent color, and sign-in action are provided by your app

## Usage

Add the package to your project, then present `WelcomeScreen` before authentication:

```swift
import SwiftUI
import WelcomeScreen

WelcomeScreen(
    appName: "MyApp",
    description: "The best way to connect, share, and discover.",
    logo: {
        Image("AppLogo")
            .resizable()
            .aspectRatio(contentMode: .fit)
    },
    license: URL(string: "https://example.com/license")!,
    privacy: URL(string: "https://example.com/privacy")!,
    onSignIn: {
        // Start your sign-in flow
    }
)
.accentColor(.blue)
```

### Parameters

| Parameter | Description |
|-----------|-------------|
| `appName` | Your app name, shown below the localized “Welcome to” title |
| `description` | Short tagline (up to 4 lines) |
| `logo` | App icon or logo view (displayed at 120×120 pt) |
| `license` | URL to the license agreement |
| `privacy` | URL to the privacy policy |
| `onSignIn` | Action when the user taps Sign In |

The description and app name are **not** localized by the package — pass them in the language your app uses, or localize them in your host app before passing them in.

## Localization

The following strings are localized inside the package:

- `welcome-to` — title prefix (“Welcome to”)
- `sign-in` — sign-in button label
- `legal-agreement` — footer text with license and privacy links

### Supported languages

| Code | Language |
|------|----------|
| `ar` | Arabic |
| `be` | Belarusian |
| `bg` | Bulgarian |
| `ca` | Catalan |
| `cs` | Czech |
| `da` | Danish |
| `de` | German |
| `el` | Greek |
| `en` | English |
| `es` | Spanish |
| `es-MX` | Spanish (Mexico) |
| `fa` | Persian |
| `fr` | French |
| `he` | Hebrew |
| `hr` | Croatian |
| `hu` | Hungarian |
| `it` | Italian |
| `ja` | Japanese |
| `kk` | Kazakh |
| `ko` | Korean |
| `lt` | Lithuanian |
| `lv` | Latvian |
| `nl` | Dutch |
| `pl` | Polish |
| `pt` | Portuguese |
| `pt-BR` | Portuguese (Brazil) |
| `ru` | Russian |
| `sk` | Slovak |
| `sr` | Serbian |
| `th` | Thai |
| `tr` | Turkish |
| `uk` | Ukrainian |
| `zh-CN` | Chinese (Simplified, China) |
| `zh-Hans` | Chinese (Simplified) |
| `zh-Hans-SG` | Chinese (Simplified, Singapore) |
| `zh-Hant` | Chinese (Traditional) |
| `zh-TW` | Chinese (Traditional, Taiwan) |

## Requirements

- Swift 6.1+
- iOS 15+ / macOS 12+ / tvOS 15+

## License

See [LICENSE](LICENSE).
