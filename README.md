# MENA

[![Pub Version](https://img.shields.io/pub/v/mena.svg)](https://pub.dev/packages/mena)
[![Dart SDK Version](https://badgen.net/pub/sdk-version/mena)](https://pub.dev/packages/mena)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub Stars](https://img.shields.io/github/stars/mohamedmaher-dev/mena.svg)](https://github.com/mohamedmaher-dev/mena/stargazers)

**Comprehensive offline MENA country data with localized names, ISO codes, currencies, and dial codes.**

Perfect for building country selectors, phone number inputs, currency converters, and international applications targeting the Middle East and North Africa region.

## ✨ Features

- 🌍 **Complete MENA Coverage**: 19 countries across Middle East and North Africa
- 🔍 **Multiple Search Methods**: Find by ISO code, name, dial code, or currency
- 🌐 **Full Localization**: Arabic and English names (common + official)
- 📱 **Zero Dependencies**: Pure Dart implementation, no external packages
- 🚀 **Offline First**: No network calls - all data bundled with package
- 🏴 **Flag Support**: High-quality SVG flag URLs via flagcdn.com
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
  final uae = MENA.getByCode('ae');
  print(uae?.countryName.en); // "United Arab Emirates"

  // Search by name
  final egypt = MENA.getByName('Egypt');
  print(egypt?.currency); // "EGP"

  // Find by phone code
  final saudi = MENA.getByDialCode('966');
  print('+${saudi?.dialCode}'); // "+966"
}
```

## 📚 API Reference

### Search Methods

| Method                      | Description                     | Example                         |
| --------------------------- | ------------------------------- | ------------------------------- |
| `getByCode(String)`         | Find by ISO 3166-1 alpha-2 code | `MENA.getByCode('ae')`          |
| `getByName(String)`         | Find by English name (partial)  | `MENA.getByName('Emirates')`    |
| `getByDialCode(String)`     | Find by international dial code | `MENA.getByDialCode('971')`     |
| `getByCurrencyCode(String)` | Find by ISO 4217 currency code  | `MENA.getByCurrencyCode('AED')` |
| `getByIndex(int)`           | Get by array index (0-18)       | `MENA.getByIndex(0)`            |

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
  final String currency;          // ISO 4217 code (e.g., "AED")
  final String dialCode;          // Phone code (e.g., "971")
  final String code;              // ISO 3166-1 code (e.g., "ae")

  String get svgUrl;              // Flag URL
  Map<String, dynamic> toJson();  // JSON serialization
}
```

#### CountryName

```dart
class CountryName {
  final String en;          // Common English name
  final String ar;          // Common Arabic name
  final String officalEN;   // Official English name
  final String officalAR;   // Official Arabic name

  Map<String, dynamic> toJson();
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
              Image.network(country.svgUrl, width: 20),
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
  MenaItemModel? selectedCountry = MENA.getByCode('ae'); // Default to UAE

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
              child: Text('+${country.dialCode}'),
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
              prefixText: '+${selectedCountry?.dialCode} ',
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
      ],
    );
  }
}
```

### Currency Display

```dart
import 'package:mena/mena.dart';

void displayPrices() {
  final currencies = ['AED', 'SAR', 'EGP', 'QAR'];

  for (final currencyCode in currencies) {
    final country = MENA.getByCurrencyCode(currencyCode);
    if (country != null) {
      print('100 ${country.currency} - ${country.countryName.en}');
    }
  }
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
