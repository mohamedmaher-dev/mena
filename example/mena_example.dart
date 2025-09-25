/// Comprehensive example demonstrating the MENA package capabilities.
///
/// This file showcases all major features including search methods,
/// data access, localization, and practical use cases.
library;

import 'package:mena/mena.dart';

void main() {
  print(MENA.getByCode('eg')?.currency.fullEnglishName);

  print('=== MENA Package Demo ===\n');

  // Basic search demonstrations
  _demonstrateSearchMethods();

  // Data collections exploration
  _exploreDataCollections();

  // Localization features
  _demonstrateLocalization();

  // Practical use cases
  _practicalUseCases();

  // Error handling examples
  _errorHandlingExamples();
}

/// Demonstrates all available search methods
void _demonstrateSearchMethods() {
  print('🔍 Search Methods Demo:');
  print('------------------------');

  // 1. Search by ISO country code
  final palestine = MENA.getByCode('ps');
  print('By Code (ps): ${palestine?.countryName.en}');

  // 2. Search by English name (partial matching)
  final morocco = MENA.getByName('Morocco');
  print('By Name (Morocco): ${morocco?.countryName.officalEN}');

  // 3. Search by international dial code
  final uae = MENA.getByDialCode('971');
  print(
    'By Dial Code (971): ${uae?.countryName.en} - Currency: ${uae?.currency}',
  );

  // 4. Search by currency code
  final saudi = MENA.getByCurrencyCode('SAR');
  print('By Currency (SAR): ${saudi?.countryName.en}');

  // 5. Direct index access
  final firstCountry = MENA.getByIndex(0);
  print('By Index (0): ${firstCountry?.countryName.en}');

  print('');
}

/// Explores the different data collections
void _exploreDataCollections() {
  print('📊 Data Collections:');
  print('---------------------');

  print('Total MENA Countries: ${MENA.allCountries.length}'); // 19
  print('Middle East Countries: ${MENA.middleEast.length}'); // 12
  print('North Africa Countries: ${MENA.northernAfrica.length}'); // 7

  // List all Middle East countries
  print('\nMiddle East Countries:');
  for (final country in MENA.middleEast) {
    print('  • ${country.countryName.en} (+${country.dialCode})');
  }

  // List all North Africa countries
  print('\nNorth Africa Countries:');
  for (final country in MENA.northernAfrica) {
    print('  • ${country.countryName.en} (${country.currency})');
  }

  print('');
}

/// Demonstrates localization features
void _demonstrateLocalization() {
  print('🌍 Localization Demo:');
  print('----------------------');

  final palestine = MENA.getByCode('ps');
  if (palestine != null) {
    print('Country: ${palestine.code.toUpperCase()} (Palestine)');
    print('English Common: ${palestine.countryName.en}');
    print('English Official: ${palestine.countryName.officalEN}');
    print('Arabic Common: ${palestine.countryName.ar}'); // فلسطين
    print('Arabic Official: ${palestine.countryName.officalAR}'); // دولة فلسطين
    print('Palestine Flag URL: ${palestine.getSvgUrl}');
    print(
      'Small Palestine Emoji (24x18): ${palestine.getEmojiUrl(EmojiSize.size24x18)}',
    );
    print(
      'Medium Palestine Emoji (48x36): ${palestine.getEmojiUrl(EmojiSize.size48x36)}',
    );
    print(
      'Large Palestine Emoji (128x96): ${palestine.getEmojiUrl(EmojiSize.size128x96)}',
    );
    print(
      'Small Palestine Image JPEG (w40): ${palestine.getImageUrl(ImageSize.w40)}',
    );
    print(
      'Medium Palestine Image PNG (w160): ${palestine.getImageUrl(ImageSize.w160, ImageType.png)}',
    );
    print(
      'Large Palestine Image JPEG (w640): ${palestine.getImageUrl(ImageSize.w640, ImageType.jpeg)}',
    );
    print(
      'Height-based PNG (h60): ${palestine.getImageUrl(ImageSize.h60, ImageType.png)}',
    );
    print(
      'Height-based JPEG (h120): ${palestine.getImageUrl(ImageSize.h120, ImageType.jpeg)}',
    );
  }

  print('');
}

/// Shows practical real-world use cases
void _practicalUseCases() {
  print('💼 Practical Use Cases:');
  print('------------------------');

  // Phone number formatting with Palestine
  print('📱 Phone Number Formatting (Palestine):');
  final phoneCountry = MENA.getByDialCode('970');
  if (phoneCountry != null) {
    final localNumber = '501234567';
    final international = '${phoneCountry.dialCodeWithPlus}$localNumber';
    print('  Local: $localNumber');
    print('  International: $international');
    print('  Formatted Code: ${phoneCountry.dialCodeWithPlus}');
    print(
      '  Country: ${phoneCountry.countryName.en} (${phoneCountry.countryName.ar})',
    );
  }

  // E-commerce currency display including Palestine
  print('\n💰 E-commerce Currency:');
  final currencies = ['EGP', 'AED', 'SAR', 'ILS']; // Egypt first
  for (final currencyCode in currencies) {
    final country = MENA.getByCurrencyCode(currencyCode);
    if (country != null) {
      final currency = country.currency;
      print('  ${currency.code}: ${currency.en} (${currency.ar})');
      print(
        '    Symbol: ${currency.symbol ?? 'N/A'} | Country: ${country.countryName.en}',
      );
    }
  }

  // JSON serialization for API with Palestine
  print('\n📡 JSON Serialization (Palestine):');
  final apiCountry = MENA.getByCode('ps');
  if (apiCountry != null) {
    final json = apiCountry.toJson();
    print('  API Payload for ${apiCountry.countryName.en}:');
    print('  {');
    print('    "code": "${json['code']}"');
    print('    "currency": {');
    print('      "code": "${json['currency']['code']}"');
    print('      "en": "${json['currency']['en']}"');
    print('      "ar": "${json['currency']['ar']}"');
    print('    }');
    print('    "dialCode": "${json['dialCode']}"');
    print('    "name": "${json['countryName']['en']}"');
    print('    "nameArabic": "${json['countryName']['ar']}"');
    print('  }');
  }

  print('');
}

/// Demonstrates proper error handling
void _errorHandlingExamples() {
  print('⚠️  Error Handling:');
  print('--------------------');

  // Null safety examples
  print('Safe null handling:');

  final invalidCode = MENA.getByCode('xyz');
  print('  Invalid code result: ${invalidCode ?? 'null (as expected)'}');

  final invalidIndex = MENA.getByIndex(100);
  print('  Out of bounds index: ${invalidIndex ?? 'null (as expected)'}');

  final invalidCurrency = MENA.getByCurrencyCode('USD');
  print('  Non-MENA currency: ${invalidCurrency ?? 'null (as expected)'}');

  // Safe property access
  final safeExample = MENA.getByCode('eg');
  final safeName = safeExample?.countryName.en ?? 'Unknown Country';
  final safeCurrency = safeExample?.currency ?? 'N/A';
  print('  Safe access: $safeName uses $safeCurrency');

  print('\n✅ Demo completed successfully!');
}
