import 'package:test/test.dart';
import 'package:mena/mena.dart';

void main() {
  group('Data Integrity Tests', () {
    test('should have all expected Middle East countries', () {
      final expectedMiddleEast = {
        'sa',
        'ae',
        'kw',
        'qa',
        'bh',
        'om',
        'jo',
        'lb',
        'ps',
        'iq',
        'sy',
        'ye',
      };
      final actualCodes = MENA.middleEast.map((c) => c.country.code).toSet();
      expect(actualCodes, equals(expectedMiddleEast));
    });

    test('should have all expected North Africa countries', () {
      final expectedNorthAfrica = {'eg', 'sd', 'ly', 'tn', 'dz', 'ma', 'mr'};
      final actualCodes = MENA.northAfrica.map((c) => c.country.code).toSet();
      expect(actualCodes, equals(expectedNorthAfrica));
    });

    test('should have valid dial codes for all countries', () {
      for (final country in MENA.allCountries) {
        expect(country.country.dialCode, isNotEmpty);
        expect(country.country.dialCode, matches(r'^\d+$'));
        expect(int.tryParse(country.country.dialCode), isNotNull);
      }
    });

    test('should have valid ISO codes for all countries', () {
      for (final country in MENA.allCountries) {
        expect(country.country.code, hasLength(2));
        expect(country.country.code, matches(r'^[a-z]{2}$'));
      }
    });

    test('should have valid currency codes for all countries', () {
      for (final country in MENA.allCountries) {
        expect(country.currency.code, hasLength(3));
        expect(country.currency.code, matches(r'^[A-Z]{3}$'));
      }
    });

    test('should have non-empty localized names for all countries', () {
      for (final country in MENA.allCountries) {
        expect(country.country.englishName, isNotEmpty);
        expect(country.country.arabicName, isNotEmpty);
        expect(country.country.officalEN, isNotEmpty);
        expect(country.country.officalAR, isNotEmpty);
        expect(country.country.englishCapital, isNotEmpty);
        expect(country.country.arabicCapital, isNotEmpty);
      }
    });

    test('should have Palestine with correct details', () {
      final palestine = MENA.getBy(query: 'ps', key: MenaKeys.code);
      expect(palestine, isNotNull);
      expect(palestine!.country.englishName, equals('Palestine'));
      expect(palestine.country.arabicName, equals('فلسطين'));
      expect(palestine.country.officalEN, equals('State of Palestine'));
      expect(palestine.country.officalAR, equals('دولة فلسطين'));
      expect(palestine.country.englishCapital, equals('Jerusalem'));
      expect(palestine.country.arabicCapital, equals('القدس'));
      expect(palestine.country.dialCode, equals('970'));
      expect(palestine.currency.code, equals('ILS'));
      expect(palestine.currency.type, equals(CurrencyType.shekel));
    });

    test('should validate currency types match actual countries', () {
      final currencyTypeMap = <String, CurrencyType>{};

      for (final country in MENA.allCountries) {
        currencyTypeMap[country.currency.code] = country.currency.type;
      }

      // Verify each currency type contains the correct currencies
      for (final type in CurrencyType.values) {
        for (final currencyCode in type.menaCurrencies) {
          expect(
            currencyTypeMap[currencyCode],
            equals(type),
            reason: 'Currency $currencyCode should be of type ${type.name}',
          );
        }
      }
    });

    test('should have unique dial codes', () {
      final dialCodes = MENA.allCountries
          .map((c) => c.country.dialCode)
          .toList();
      final uniqueDialCodes = dialCodes.toSet();
      expect(dialCodes.length, equals(uniqueDialCodes.length));
    });

    test('should generate valid flag URLs for all countries', () {
      for (final country in MENA.allCountries) {
        final svgUrl = country.getSvgUrl;
        expect(svgUrl.scheme, equals('https'));
        expect(svgUrl.host, equals('flagcdn.com'));
        expect(svgUrl.path, equals('/${country.country.code}.svg'));

        final emojiUrl = country.getEmojiUrl(EmojiSize.size48x36);
        expect(emojiUrl.scheme, equals('https'));
        expect(emojiUrl.host, equals('flagcdn.com'));
        expect(emojiUrl.path, equals('/48x36/${country.country.code}.png'));

        final imageUrl = country.getImageUrl(ImageSize.w160);
        expect(imageUrl.scheme, equals('https'));
        expect(imageUrl.host, equals('flagcdn.com'));
        expect(imageUrl.path, equals('/w160/${country.country.code}.jpg'));
      }
    });

    test('should have all expected countries with complete data', () {
      final expectedCountries = {
        // Middle East
        'sa': {'name': 'Saudi Arabia', 'currency': 'SAR', 'dial': '966'},
        'ae': {
          'name': 'United Arab Emirates',
          'currency': 'AED',
          'dial': '971',
        },
        'kw': {'name': 'Kuwait', 'currency': 'KWD', 'dial': '965'},
        'qa': {'name': 'Qatar', 'currency': 'QAR', 'dial': '974'},
        'bh': {'name': 'Bahrain', 'currency': 'BHD', 'dial': '973'},
        'om': {'name': 'Oman', 'currency': 'OMR', 'dial': '968'},
        'jo': {'name': 'Jordan', 'currency': 'JOD', 'dial': '962'},
        'lb': {'name': 'Lebanon', 'currency': 'LBP', 'dial': '961'},
        'ps': {'name': 'Palestine', 'currency': 'ILS', 'dial': '970'},
        'iq': {'name': 'Iraq', 'currency': 'IQD', 'dial': '964'},
        'sy': {'name': 'Syria', 'currency': 'SYP', 'dial': '963'},
        'ye': {'name': 'Yemen', 'currency': 'YER', 'dial': '967'},

        // North Africa
        'eg': {'name': 'Egypt', 'currency': 'EGP', 'dial': '20'},
        'sd': {'name': 'Sudan', 'currency': 'SDG', 'dial': '249'},
        'ly': {'name': 'Libya', 'currency': 'LYD', 'dial': '218'},
        'tn': {'name': 'Tunisia', 'currency': 'TND', 'dial': '216'},
        'dz': {'name': 'Algeria', 'currency': 'DZD', 'dial': '213'},
        'ma': {'name': 'Morocco', 'currency': 'MAD', 'dial': '212'},
        'mr': {'name': 'Mauritania', 'currency': 'MRU', 'dial': '222'},
      };

      for (final entry in expectedCountries.entries) {
        final code = entry.key;
        final expected = entry.value;

        final country = MENA.getBy(query: code, key: MenaKeys.code);
        expect(country, isNotNull, reason: 'Country $code should exist');

        expect(
          country!.country.englishName,
          equals(expected['name']),
          reason: 'Country $code should have correct English name',
        );
        expect(
          country.currency.code,
          equals(expected['currency']),
          reason: 'Country $code should have correct currency',
        );
        expect(
          country.country.dialCode,
          equals(expected['dial']),
          reason: 'Country $code should have correct dial code',
        );
      }
    });

    test('should have consistent Arabic script for all Arabic names', () {
      for (final country in MENA.allCountries) {
        // Check that Arabic names contain Arabic characters
        expect(
          country.country.arabicName,
          matches(r'[\u0600-\u06FF]'),
          reason:
              '${country.country.englishName} should have Arabic script in arabicName',
        );
        expect(
          country.country.officalAR,
          matches(r'[\u0600-\u06FF]'),
          reason:
              '${country.country.englishName} should have Arabic script in officalAR',
        );
        expect(
          country.country.arabicCapital,
          matches(r'[\u0600-\u06FF]'),
          reason:
              '${country.country.englishName} should have Arabic script in arabicCapital',
        );
      }
    });

    test('should have consistent currency symbol mappings', () {
      final currencyToSymbol = <String, String>{};

      for (final country in MENA.allCountries) {
        final code = country.currency.code;
        final symbol = country.currency.arabicSymbol;

        if (currencyToSymbol.containsKey(code)) {
          expect(
            currencyToSymbol[code],
            equals(symbol),
            reason:
                'Currency $code should have consistent symbol across countries',
          );
        } else {
          currencyToSymbol[code] = symbol;
        }
      }
    });

    test('should have reasonable dial code ranges', () {
      for (final country in MENA.allCountries) {
        final dialCode = int.parse(country.country.dialCode);

        // Dial codes should be within reasonable international ranges
        expect(dialCode, greaterThan(0));
        expect(dialCode, lessThan(1000));

        // Most MENA countries have dial codes in specific ranges
        final isValidRange = dialCode >= 20 && dialCode <= 999;
        expect(
          isValidRange,
          isTrue,
          reason:
              '${country.country.englishName} dial code $dialCode should be in valid range',
        );
      }
    });

    test('should have no duplicate country names', () {
      final englishNames = MENA.allCountries
          .map((c) => c.country.englishName)
          .toList();
      final uniqueEnglishNames = englishNames.toSet();
      expect(englishNames.length, equals(uniqueEnglishNames.length));

      final arabicNames = MENA.allCountries
          .map((c) => c.country.arabicName)
          .toList();
      final uniqueArabicNames = arabicNames.toSet();
      expect(arabicNames.length, equals(uniqueArabicNames.length));
    });

    test('should have proper capitalization for English names', () {
      for (final country in MENA.allCountries) {
        final englishName = country.country.englishName;

        // Should start with capital letter
        expect(
          englishName[0],
          matches(r'[A-Z]'),
          reason: '$englishName should start with capital letter',
        );

        // Should not be all uppercase (unless it's an acronym like UAE)
        if (englishName.length > 3) {
          expect(
            englishName,
            isNot(equals(englishName.toUpperCase())),
            reason: '$englishName should not be all uppercase',
          );
        }
      }
    });
  });

  group('Edge Cases and Error Handling', () {
    test('should handle empty queries gracefully', () {
      expect(MENA.getBy(query: '', key: MenaKeys.code), isNull);
      expect(MENA.getBy(query: '', key: MenaKeys.englishName), isNull);
      expect(MENA.getBy(query: '', key: MenaKeys.dialCode), isNull);
    });

    test('should handle case variations in search', () {
      final lower = MENA.getBy(query: 'ae', key: MenaKeys.code);
      final upper = MENA.getBy(query: 'AE', key: MenaKeys.code);
      final mixed = MENA.getBy(query: 'Ae', key: MenaKeys.code);

      expect(lower, isNotNull);
      expect(upper, isNull); // Search is case-sensitive
      expect(mixed, isNull); // Search is case-sensitive
    });

    test('should return null for non-existent countries', () {
      expect(MENA.getBy(query: 'xx', key: MenaKeys.code), isNull);
      expect(
        MENA.getBy(query: 'NonExistent', key: MenaKeys.englishName),
        isNull,
      );
      expect(MENA.getBy(query: '000', key: MenaKeys.dialCode), isNull);
      expect(MENA.getBy(query: 'XXX', key: MenaKeys.currencyCode), isNull);
    });

    test('should handle Unicode text correctly', () {
      final arabicCountry = MENA.getBy(
        query: 'فلسطين',
        key: MenaKeys.arabicName,
      );
      expect(arabicCountry, isNotNull);
      expect(arabicCountry!.country.englishName, equals('Palestine'));
    });
  });

  group('Performance Tests', () {
    test('should retrieve countries efficiently by code', () {
      final stopwatch = Stopwatch()..start();

      for (int i = 0; i < 1000; i++) {
        final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
        expect(country, isNotNull);
      }

      stopwatch.stop();
      expect(
        stopwatch.elapsedMilliseconds,
        lessThan(100),
        reason: '1000 lookups should complete in under 100ms',
      );
    });

    test('should generate maps efficiently', () {
      final stopwatch = Stopwatch()..start();

      for (int i = 0; i < 100; i++) {
        final codeMap = MENA.allCountriesMap(MenaKeys.code);
        expect(codeMap.length, equals(19));
      }

      stopwatch.stop();
      expect(
        stopwatch.elapsedMilliseconds,
        lessThan(50),
        reason: '100 map generations should complete in under 50ms',
      );
    });

    test('should handle all search operations efficiently', () {
      final stopwatch = Stopwatch()..start();

      // Test different search operations
      for (int i = 0; i < 100; i++) {
        MENA.getBy(query: 'ae', key: MenaKeys.code);
        MENA.getBy(query: 'egypt', key: MenaKeys.englishName);
        MENA.getBy(query: '971', key: MenaKeys.dialCode);
        MENA.getBy(query: 'AED', key: MenaKeys.currencyCode);
        MENA.getBy(query: 'مصر', key: MenaKeys.arabicName);
      }

      stopwatch.stop();
      expect(
        stopwatch.elapsedMilliseconds,
        lessThan(100),
        reason: '500 mixed search operations should complete in under 100ms',
      );
    });
  });
}
