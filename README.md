# MENA

[![Pub Version](https://img.shields.io/pub/v/mena.svg)](https://pub.dev/packages/mena)
[![Dart SDK Version](https://badgen.net/pub/sdk-version/mena)](https://pub.dev/packages/mena)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub Stars](https://img.shields.io/github/stars/mohamedmaher-dev/mena.svg)](https://github.com/mohamedmaher-dev/mena/stargazers)

**Comprehensive offline MENA country data with localized names, ISO codes, currencies, and dial codes.**

Perfect for building country selectors, phone number inputs, currency converters, and international applications targeting the Middle East and North Africa region.

## 📑 Table of Contents

- [✨ Features](#-features)
- [🚀 Quick Start](#-quick-start)
- [🏴 Flag System](#-flag-system)
  - [Flag Formats](#flag-formats)
  - [Available Sizes](#available-sizes)
  - [Usage Examples](#usage-examples)
- [📚 API Reference](#-api-reference)
  - [Search Methods](#search-methods)
  - [Data Collections](#data-collections)
  - [Models](#models)
    - [MenaItemModel](#menaitemmodel)
    - [CountryName](#countryname)
    - [EmojiSize](#emojisize)
    - [ImageSize](#imagesize)
    - [Currency](#currency)
    - [CurrencyType](#currencytype)
    - [ImageType](#imagetype)
- [💡 Usage Examples](#-usage-examples)
  - [Country Selector](#country-selector)
  - [Phone Number Input](#phone-number-input)
  - [Flag Gallery](#flag-gallery)
  - [Locale Management](#locale-management)
  - [Currency Display](#currency-display)
  - [API Integration](#api-integration)
- [🌍 Supported Countries](#-supported-countries)
  - [Middle East (12 countries)](#middle-east-12-countries)
  - [North Africa (7 countries)](#north-africa-7-countries)
- [📱 Platform Support](#-platform-support)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)
- [🔗 Links](#-links)
- [⭐ Support](#-support)

## ✨ Features

- 🌍 **Complete MENA Coverage**: 19 countries across Middle East and North Africa
- 🔍 **Multiple Search Methods**: Find by ISO code, name, dial code, or currency
- 🌐 **Full Localization**: Arabic and English names (common + official) with automatic locale switching
- 🏴 **Advanced Flag System**: SVG, PNG (emoji-style), and JPEG/PNG images
- 📐 **Flexible Sizing**: 24 emoji sizes + 15 image sizes (width/height based)
- 🎨 **Format Options**: PNG (lossless) and JPEG (compressed) support
- 📱 **Zero Dependencies**: Pure Dart implementation, no external packages
- 🚀 **Offline First**: No network calls - all data bundled with package
- 📊 **JSON Ready**: Built-in serialization for APIs and storage
- 🎯 **Null Safe**: Complete null safety for robust applications
- 📦 **Lightweight**: Minimal footprint, optimized performance

## 🚀 Quick Start

Add to your `pubspec.yaml`:

```yaml
dependencies:
  mena: ^1.0.0
```

Import and use:

```dart
import 'package:mena/mena.dart';

void main() {
  // Find country by ISO code
  final palestine = MENA.getByCode('ps');
  print(palestine?.countryName.en); // "Palestine"
  print(palestine?.countryName.ar); // "فلسطين"

  // Search by name (adapts to current locale - Arabic by default)
  final egypt = MENA.getByName('مصر'); // Arabic search by default
  print(egypt?.currency); // "EGP"

  // Or search explicitly in English
  final egyptEn = MENA.getByEnglishName('Egypt');

  // Set locale to English for subsequent searches
  MENA.setDefaultLocale('en');
  final egyptLocalized = MENA.getByName('Egypt'); // Now uses English

  // Find by phone code
  final palestineByPhone = MENA.getByDialCode('970');
  print(palestineByPhone?.dialCodeWithPlus); // "+970"

  // Get Palestine flag URLs
  print(palestine?.getSvgUrl); // SVG flag
  print(palestine?.getEmojiUrl(EmojiSize.size48x36)); // 48x36 PNG
  print(palestine?.getImageUrl(ImageSize.w160, ImageType.png)); // 160px PNG
}
```

## 🏴 Flag System

MENA provides the most comprehensive flag system available for Dart packages, offering multiple formats and sizes to suit any use case:

### Flag Formats

| Format               | Method                              | Description                         | Best For                            |
| -------------------- | ----------------------------------- | ----------------------------------- | ----------------------------------- |
| **SVG**              | `getSvgUrl`                         | Scalable vector graphics            | High-quality displays, print        |
| **PNG (Emoji)**      | `getEmojiUrl(EmojiSize)`            | Emoji-style flags, exact dimensions | UI icons, emoji displays            |
| **JPEG/PNG (Image)** | `getImageUrl(ImageSize, ImageType)` | Flexible sizing, format choice      | Web optimization, responsive design |

### Available Sizes

#### Emoji Sizes (PNG with exact dimensions)

24 predefined sizes maintaining 4:3 aspect ratio:

- **Tiny**: 16x12, 20x15, 24x18, 28x21, 32x24
- **Small**: 40x30, 48x36, 56x42, 64x48, 72x54
- **Medium**: 80x60, 96x72, 112x84, 128x96, 144x108
- **Large**: 160x120, 192x144, 224x168, 256x192
- **Extra Large**: 320x240, 384x288, 512x384, 640x480, 768x576

#### Image Sizes (Width/Height based)

15 flexible sizes with automatic aspect ratio:

- **Width-based**: w20, w40, w80, w160, w320, w640, w1280, w2560
- **Height-based**: h20, h24, h40, h60, h80, h120, h240

#### Image Types

- **PNG**: Lossless compression, transparency support, sharp edges
- **JPEG**: Lossy compression, smaller file sizes, web optimization

### Usage Examples

```dart
final palestine = MENA.getByCode('ps');

// SVG flag (scalable)
final svgFlag = palestine?.getSvgUrl;
// "https://flagcdn.com/ps.svg"

// Emoji-style PNG flags
final smallEmoji = palestine?.getEmojiUrl(EmojiSize.size24x18);
// "https://flagcdn.com/24x18/ps.png"

final mediumEmoji = palestine?.getEmojiUrl(EmojiSize.size48x36);
// "https://flagcdn.com/48x36/ps.png"

// Flexible image flags
final jpegFlag = palestine?.getImageUrl(ImageSize.w160);
// "https://flagcdn.com/w160/ps.jpg" (default JPEG)

final pngFlag = palestine?.getImageUrl(ImageSize.w160, ImageType.png);
// "https://flagcdn.com/w160/ps.png"

final heightFlag = palestine?.getImageUrl(ImageSize.h120, ImageType.png);
// "https://flagcdn.com/h120/ps.png"
```

## 📚 API Reference

### Search Methods

| Method                      | Description                             | Example                              |
| --------------------------- | --------------------------------------- | ------------------------------------ |
| `getByCode(String)`         | Find by ISO 3166-1 alpha-2 code         | `MENA.getByCode('ps')`               |
| `getByName(String)`         | Find by name (adapts to current locale) | `MENA.getByName('فلسطين')`           |
| `getByEnglishName(String)`  | Find by English name (explicit)         | `MENA.getByEnglishName('Palestine')` |
| `getByArabicName(String)`   | Find by Arabic name (explicit)          | `MENA.getByArabicName('فلسطين')`     |
| `getByDialCode(String)`     | Find by international dial code         | `MENA.getByDialCode('970')`          |
| `getByCurrencyCode(String)` | Find by ISO 4217 currency code          | `MENA.getByCurrencyCode('EGP')`      |
| `getByIndex(int)`           | Get by array index (0-18)               | `MENA.getByIndex(0)`                 |

### Locale Management

| Method                          | Description                          | Example                       |
| ------------------------------- | ------------------------------------ | ----------------------------- |
| `MENA.defaultLocale`            | Get current locale ('ar' or 'en')    | `print(MENA.defaultLocale)`   |
| `MENA.setDefaultLocale(String)` | Set locale for subsequent operations | `MENA.setDefaultLocale('en')` |

### Data Collections

| Collection            | Countries | Description                 |
| --------------------- | --------- | --------------------------- |
| `MENA.allCountries`   | 19        | All MENA countries combined |
| `MENA.middleEast`     | 12        | Middle Eastern countries    |
| `MENA.northernAfrica` | 7         | North African countries     |

### Models

#### MenaItemModel

```dart
class MenaItemModel {
  final CountryName countryName;  // Localized names
  final Currency currency;        // Currency with EN/AR names and symbols
  final String dialCode;          // Phone code (e.g., "971")
  final String code;              // ISO 3166-1 code (e.g., "ae")
  String get getSvgUrl;           // SVG flag URL
  String get dialCodeWithPlus;    // Formatted dial code (e.g., "+971")
  String getEmojiUrl(EmojiSize);  // Emoji flag with specific dimensions
  String getImageUrl(ImageSize, [ImageType]); // Flexible image with size and format
  Map<String, dynamic> toJson();  // JSON serialization
}
```

#### CountryName

```dart
class CountryName {
  final String englishName;  // Common English name
  final String arabicName;   // Common Arabic name
  final String officalEN;    // Official English name
  final String officalAR;    // Official Arabic name

  String get getName;        // Adapts to current locale
  Map<String, dynamic> toJson();
}
```

#### EmojiSize

```dart
enum EmojiSize {
  size16x12, size20x15, size24x18, size28x21, size32x24,
  size40x30, size48x36, size56x42, size64x48, size72x54,
  size80x60, size96x72, size112x84, size128x96, size144x108,
  size160x120, size192x144, size224x168, size256x192,
  size320x240, size384x288, size512x384, size640x480, size768x576;

  String get dimensions;     // e.g., "48x36"
  int get width;            // Calculated width
  int get height;           // Calculated height
  double get aspectRatio;   // Width/height ratio
}
```

#### ImageSize

```dart
enum ImageSize {
  // Width-based
  w20, w40, w80, w160, w320, w640, w1280, w2560,
  // Height-based
  h20, h24, h40, h60, h80, h120, h240;

  String get sizeParam;      // e.g., "w160" or "h120"
  bool get isWidthBased;     // True for width-based sizes
  bool get isHeightBased;    // True for height-based sizes
  int get width;             // Calculated width
  int get height;            // Calculated height
}
```

#### Currency

```dart
class Currency {
  final String code;              // ISO 4217 code (e.g., "ILS", "AED")
  final String enAdjective;       // Country adjective (e.g., "Egyptian", "Saudi")
  final String arAdjective;       // Country adjective Arabic (e.g., "مصري", "سعودي")
  final CurrencyType type;        // Currency type classification

  String get fullEnglishName;     // Full English name (e.g., "Egyptian Pound")
  String get fullArabicName;      // Full Arabic name (e.g., "جنيه مصري")
  String get getFullName;         // Adapts to current locale
  String? get englishSymbol;      // English symbol (ISO code)
  String? get arabicSymbol;       // Arabic symbol (e.g., "₪", "د.إ")
  String? get getSymbol;          // Symbol adapts to current locale
  Map<String, dynamic> toJson();  // JSON serialization
}
```

#### CurrencyType

```dart
enum CurrencyType {
  dinar,      // Traditional gold-based currency (KWD, BHD, JOD, etc.)
  riyal,      // Royal currency denomination (SAR, QAR, OMR, YER)
  dirham,     // Silver-based currency (AED, MAD)
  pound,      // Weight-based system (EGP, SDG, LBP, SYP)
  shekel,     // Ancient weight-based currency (ILS)
  ouguiya;    // Unique non-decimal currency (MRU)

  String get enName;              // "Dinar", "Riyal", etc.
  String get arName;              // "دينار", "ريال", etc. (Arabic)
  String get getName;             // Adapts to current locale
  String get bilingualName;       // "Dinar (دينار)"
  List<String> get menaCurrencies; // Currency codes using this type
}
```

#### ImageType

```dart
enum ImageType {
  png, jpeg;

  String get extension;           // File extension
  bool get supportsTransparency; // PNG supports transparency
  bool get isLossless;           // PNG is lossless
  String get description;        // Human-readable format
}
```

## 💡 Usage Examples

### Country Selector

```dart
import 'package:mena/mena.dart';

class CountrySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<MenaItemModel>(
      items: MENA.allCountries.map((country) {
        return DropdownMenuItem(
          value: country,
          child: Row(
            children: [
              Image.network(
                country.getEmojiUrl(EmojiSize.size20x15),
                width: 20,
                height: 15,
              ),
              SizedBox(width: 8),
              Text(country.countryName.en),
            ],
          ),
        );
      }).toList(),
      onChanged: (country) {
        print('Selected: ${country?.countryName.en}');
      },
    );
  }
}
```

### Phone Number Input

```dart
import 'package:mena/mena.dart';

class PhoneInput extends StatefulWidget {
  @override
  _PhoneInputState createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  MenaItemModel? selectedCountry = MENA.getByCode('ps'); // Default to Palestine

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Country code picker
        DropdownButton<MenaItemModel>(
          value: selectedCountry,
          items: MENA.allCountries.map((country) {
            return DropdownMenuItem(
              value: country,
              child: Text(country.dialCodeWithPlus),
            );
          }).toList(),
          onChanged: (country) {
            setState(() => selectedCountry = country);
          },
        ),
        SizedBox(width: 8),
        // Phone number input
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Phone number',
              prefixText: '${selectedCountry?.dialCodeWithPlus} ',
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
      ],
    );
  }
}
```

### Flag Gallery

```dart
import 'package:mena/mena.dart';

class FlagGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final palestine = MENA.getByCode('ps');

    return Column(
      children: [
        // High-quality SVG flag for Palestine
        Image.network(
          palestine!.getSvgUrl,
          width: 200,
          height: 150,
        ),

        SizedBox(height: 20),

        // Different sizes for different use cases
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Small Palestine flag icon
            Image.network(
              palestine.getEmojiUrl(EmojiSize.size24x18),
              width: 24,
              height: 18,
            ),

            // Medium Palestine flag icon
            Image.network(
              palestine.getEmojiUrl(EmojiSize.size48x36),
              width: 48,
              height: 36,
            ),

            // Large PNG for high quality
            Image.network(
              palestine.getImageUrl(ImageSize.w160, ImageType.png),
              width: 160,
            ),

            // Compressed JPEG for performance
            Image.network(
              palestine.getImageUrl(ImageSize.w160, ImageType.jpeg),
              width: 160,
            ),
          ],
        ),
      ],
    );
  }
}
```

### Locale Management

```dart
import 'package:mena/mena.dart';

void localeExamples() {
  // Default locale is Arabic
  print(MENA.defaultLocale); // 'ar'

  final country = MENA.getByCode('ae');
  print(country?.countryName.getName); // "الإمارات" (Arabic)
  print(country?.currency.getFullName); // "درهم إماراتي" (Arabic)
  print(country?.currency.type.getName); // "درهم" (Arabic)

  // Switch to English
  MENA.setDefaultLocale('en');
  print(country?.countryName.getName); // "United Arab Emirates" (English)
  print(country?.currency.getFullName); // "Emirati Dirham" (English)
  print(country?.currency.type.getName); // "Dirham" (English)

  // Search adapts to current locale
  final search1 = MENA.getByName('Egypt'); // English search
  MENA.setDefaultLocale('ar');
  final search2 = MENA.getByName('مصر'); // Arabic search
}
```

### Currency Display

```dart
import 'package:mena/mena.dart';

void displayPrices() {
  final currencies = ['EGP', 'AED', 'SAR', 'ILS']; // Egypt first

  for (final currencyCode in currencies) {
    final country = MENA.getByCurrencyCode(currencyCode);
    if (country != null) {
      print('Currency: ${country.currency.code}');
      print('English: ${country.currency.fullEnglishName}');
      print('Arabic: ${country.currency.fullArabicName}');
      print('Localized: ${country.currency.getFullName}'); // Adapts to locale
      print('Symbol: ${country.currency.getSymbol ?? 'N/A'}'); // Adapts to locale
      print('Country: ${country.countryName.getName}'); // Adapts to locale
      print('---');
    }
  }
}

// Advanced currency features
void advancedCurrencyFeatures() {
  final palestine = MENA.getByCode('ps');

  if (palestine != null) {
    final currency = palestine.currency;

    // Display price with currency
    print('Price: 100 ${currency.code}'); // "Price: 100 ILS"
    print('In Arabic: ١٠٠ ${currency.ar}'); // "In Arabic: ١٠٠ جنيه مصري"

    // Use symbol if available
    final symbol = currency.symbol ?? currency.code;
    print('With symbol: $symbol 100'); // "With symbol: ₪ 100"

    // Check currency properties
    print('International: ${currency.isInternational}');
    print('Description: ${currency.description}');

    // Currency components and constructed names
    print('Country adjective (EN): ${currency.en}');        // "Palestinian"
    print('Country adjective (AR): ${currency.ar}');        // "فلسطيني"
    print('Currency type (EN): ${currency.type.enName}'); // "Shekel"
    print('Currency type (AR): ${currency.type.arName}'); // "شيكل"

    // New convenient getters
    print('Full English name: ${currency.enName}');         // "Palestinian Shekel"
    print('Full Arabic name: ${currency.arName}');          // "شيكل فلسطيني"

    // Backward compatibility aliases
    print('Full English (alias): ${currency.fullEnglishName}'); // "Palestinian Shekel"
    print('Full Arabic (alias): ${currency.fullArabicName}');   // "شيكل فلسطيني"

    // All name variants
    print('English names: ${currency.englishNames}');
    // ["Palestinian", "Shekel", "Palestinian Shekel"]
    print('Arabic names: ${currency.arabicNames}');
    // ["فلسطيني", "شيكل", "شيكل فلسطيني"]

    // Currency type analysis
    print('Type: ${currency.type.enName}');
    print('Type Arabic: ${currency.type.arName}');
    print('Type Alternative: ${currency.type.enAlternative}');
    print('Type Origin: ${currency.type.origin}');
    print('Gold-based: ${currency.type.isGoldBased}');

    // Name matching examples
    print('Matches "Palestinian": ${currency.matchesName('Palestinian')}'); // true
    print('Matches "Shekel": ${currency.matchesName('Shekel')}');           // true
    print('Matches "شيكل": ${currency.matchesName('شيكل')}');               // true
    print('Matches "Palestinian Shekel": ${currency.matchesName('Palestinian Shekel')}'); // true
  }
}

// Group currencies by type
void analyzeCurrencyTypes() {
  final dinars = MENA.allCountries
      .where((country) => country.currency.type == CurrencyType.dinar)
      .toList();

  final riyals = MENA.allCountries
      .where((country) => country.currency.type == CurrencyType.riyal)
      .toList();

  print('Dinar countries (${dinars.length}): ${dinars.map((c) => c.code).join(", ")}');
  print('Riyal countries (${riyals.length}): ${riyals.map((c) => c.code).join(", ")}');
}
```

### API Integration

```dart
import 'package:mena/mena.dart';
import 'dart:convert';

Future<void> sendCountryData() async {
  final country = MENA.getByCode('sa');

  if (country != null) {
    // Serialize for API
    final payload = {
      'user_country': country.toJson(),
      'currency_preference': country.currency,
      'locale': 'ar_${country.code.toUpperCase()}',
    };

    // Send to API
    final jsonString = json.encode(payload);
    print('API Payload: $jsonString');
  }
}
```

## 🌍 Supported Countries

### Middle East (12 countries)

🇸🇦 Saudi Arabia • 🇦🇪 United Arab Emirates • 🇰🇼 Kuwait • 🇶🇦 Qatar • 🇧🇭 Bahrain • 🇴🇲 Oman • 🇯🇴 Jordan • 🇱🇧 Lebanon • 🇵🇸 Palestine • 🇮🇶 Iraq • 🇸🇾 Syria • 🇾🇪 Yemen

### North Africa (7 countries)

🇪🇬 Egypt • 🇸🇩 Sudan • 🇱🇾 Libya • 🇹🇳 Tunisia • 🇩🇿 Algeria • 🇲🇦 Morocco • 🇲🇷 Mauritania

## 📱 Platform Support

- ✅ **Flutter**: Android, iOS, Web, Desktop
- ✅ **Dart**: Server-side applications
- ✅ **Web**: Browser applications
- ✅ **Desktop**: Windows, macOS, Linux

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Links

- [Package on pub.dev](https://pub.dev/packages/mena)
- [Documentation](https://pub.dev/documentation/mena/latest/)
- [Source Code](https://github.com/mohamedmaher-dev/mena)
- [Issue Tracker](https://github.com/mohamedmaher-dev/mena/issues)

## ⭐ Support

If this package helped you, please consider:

- ⭐ Starring the repository on GitHub
- 👍 Liking the package on pub.dev
- 🐛 Reporting issues or suggesting improvements
- 💰 [Sponsoring the project](https://github.com/sponsors/mohamedmaher-dev)

---

Made with ❤️ for the MENA developer community
