<div align="center">

# MENA

Middle East and North Africa country data and utilities for Dart/Flutter.

[![Pub Version](https://img.shields.io/pub/v/mena.svg)](https://pub.dev/packages/mena)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

</div>

## Features

- Lightweight in-package dataset (no runtime network calls)
- North Africa and Middle East lists, plus a combined list
- Convenient lookups by ISO code, English name, dial code, or currency code
- Simple models with JSON serialization and flag SVG URL helper

## Getting started

Add the dependency in your `pubspec.yaml`:

```yaml
dependencies:
  mena: ^1.0.0
```

Import the library:

```dart
import 'package:mena/mena.dart';
```

## Usage

```dart
import 'package:mena/mena.dart';

void main() {
  // Find by ISO lowercased code
  final ps = MENA.getByCode('ps');

  // By English name (partial, case-insensitive)
  final morocco = MENA.getByName('Morocco');

  // By dial code (without +)
  final uae = MENA.getByDialCode('971');

  // By currency code
  final saudi = MENA.getByCurrencyCode('SAR');

  print(ps?.countryName.en); // Palestine
  print(uae?.svgUrl);        // https://flagcdn.com/ae.svg
}
```

### Data

- `MENA.northernAfrica`: list of North Africa countries
- `MENA.middleEast`: list of Middle East countries
- `MENA.allCountries`: combined list

### Models

- `MenaItemModel`: `countryName`, `currency`, `dialCode`, `code`, `svgUrl`, `toJson()`
- `CountryName`: `en`, `ar`, `officalEN`, `officalAR`, `toJson()`

## Contributing

Issues and PRs are welcome. Please run static analysis and tests before submitting.

## License

MIT
