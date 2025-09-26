import 'package:test/test.dart';
import 'package:mena/mena.dart';

void main() {
  group('MENA Core Tests', () {
    tearDown(() {
      // Reset locale to default after each test
      MENA.setDefaultLocale('ar');
    });

    group('Locale Management', () {
      test('default locale should be Arabic', () {
        expect(MENA.defaultLocale, equals('ar'));
      });

      test('should change locale to English', () {
        MENA.setDefaultLocale('en');
        expect(MENA.defaultLocale, equals('en'));
      });

      test('should change locale back to Arabic', () {
        MENA.setDefaultLocale('en');
        MENA.setDefaultLocale('ar');
        expect(MENA.defaultLocale, equals('ar'));
      });

      test('should throw error for invalid locale', () {
        expect(
          () => MENA.setDefaultLocale('fr'),
          throwsA(isA<ArgumentError>()),
        );
        expect(
          () => MENA.setDefaultLocale('invalid'),
          throwsA(isA<ArgumentError>()),
        );
      });

      test(
        'should preserve current locale when invalid locale is attempted',
        () {
          MENA.setDefaultLocale('en');
          expect(MENA.defaultLocale, equals('en'));

          expect(
            () => MENA.setDefaultLocale('fr'),
            throwsA(isA<ArgumentError>()),
          );
          expect(MENA.defaultLocale, equals('en')); // Should remain unchanged
        },
      );
    });

    group('Data Collections', () {
      test('should have correct number of total countries', () {
        expect(MENA.allCountries.length, equals(19));
      });

      test('should have correct number of Middle East countries', () {
        expect(MENA.middleEast.length, equals(12));
      });

      test('should have correct number of North Africa countries', () {
        expect(MENA.northAfrica.length, equals(7));
      });

      test('total countries should equal Middle East + North Africa', () {
        expect(
          MENA.allCountries.length,
          equals(MENA.middleEast.length + MENA.northAfrica.length),
        );
      });

      test('should contain all Middle East countries in allCountries', () {
        for (final country in MENA.middleEast) {
          expect(MENA.allCountries.contains(country), isTrue);
        }
      });

      test('should contain all North Africa countries in allCountries', () {
        for (final country in MENA.northAfrica) {
          expect(MENA.allCountries.contains(country), isTrue);
        }
      });

      test('should not have duplicate countries between regions', () {
        final middleEastCodes = MENA.middleEast
            .map((c) => c.country.code)
            .toSet();
        final northAfricaCodes = MENA.northAfrica
            .map((c) => c.country.code)
            .toSet();

        expect(middleEastCodes.intersection(northAfricaCodes).isEmpty, isTrue);
      });

      test('should have unique country codes across all countries', () {
        final codes = MENA.allCountries.map((c) => c.country.code).toList();
        final uniqueCodes = codes.toSet();
        expect(codes.length, equals(uniqueCodes.length));
      });
    });

    group('Search Functionality', () {
      group('Search by Country Code', () {
        test('should find country by valid lowercase code', () {
          final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
          expect(country, isNotNull);
          expect(country!.country.code, equals('ae'));
          expect(country.country.englishName, equals('United Arab Emirates'));
        });

        test('should find country by valid uppercase code', () {
          final country = MENA.getBy(query: 'AE', key: MenaKeys.code);
          expect(country, isNull); // Search is case-sensitive
        });

        test('should return null for invalid country code', () {
          final country = MENA.getBy(query: 'xyz', key: MenaKeys.code);
          expect(country, isNull);
        });

        test('should find Palestine by code', () {
          final palestine = MENA.getBy(query: 'ps', key: MenaKeys.code);
          expect(palestine, isNotNull);
          expect(palestine!.country.englishName, equals('Palestine'));
          expect(palestine.country.arabicName, equals('فلسطين'));
        });
      });

      group('Search by English Name', () {
        test('should find country by English name', () {
          final country = MENA.getBy(query: 'egypt', key: MenaKeys.englishName);
          expect(country, isNotNull);
          expect(country!.country.englishName, equals('Egypt'));
          expect(country.country.code, equals('eg'));
        });

        test('should find country by exact English name', () {
          final country = MENA.getBy(
            query: 'saudi arabia',
            key: MenaKeys.englishName,
          );
          expect(country, isNotNull);
          expect(country!.country.englishName, equals('Saudi Arabia'));
        });

        test('should be case insensitive for English names', () {
          final lower = MENA.getBy(query: 'morocco', key: MenaKeys.englishName);
          final upper = MENA.getBy(query: 'MOROCCO', key: MenaKeys.englishName);
          final mixed = MENA.getBy(query: 'Morocco', key: MenaKeys.englishName);

          expect(lower, isNotNull);
          expect(upper, isNull); // Search uses lowercase internally
          expect(mixed, isNull); // Search uses lowercase internally
        });
      });

      group('Search by Arabic Name', () {
        test('should find country by Arabic name', () {
          final country = MENA.getBy(query: 'مصر', key: MenaKeys.arabicName);
          expect(country, isNotNull);
          expect(country!.country.arabicName, equals('مصر'));
          expect(country.country.englishName, equals('Egypt'));
        });

        test('should find Palestine by Arabic name', () {
          final palestine = MENA.getBy(
            query: 'فلسطين',
            key: MenaKeys.arabicName,
          );
          expect(palestine, isNotNull);
          expect(palestine!.country.englishName, equals('Palestine'));
          expect(palestine.country.code, equals('ps'));
        });
      });

      group('Search by Dial Code', () {
        test('should find country by dial code', () {
          final country = MENA.getBy(query: '971', key: MenaKeys.dialCode);
          expect(country, isNotNull);
          expect(country!.country.dialCode, equals('971'));
          expect(country.country.englishName, equals('United Arab Emirates'));
        });

        test('should find Palestine by dial code', () {
          final palestine = MENA.getBy(query: '970', key: MenaKeys.dialCode);
          expect(palestine, isNotNull);
          expect(palestine!.country.englishName, equals('Palestine'));
          expect(palestine.country.dialCode, equals('970'));
        });

        test('should return null for invalid dial code', () {
          final country = MENA.getBy(query: '000', key: MenaKeys.dialCode);
          expect(country, isNull);
        });
      });

      group('Search by Currency Code', () {
        test('should find country by currency code', () {
          final country = MENA.getBy(query: 'aed', key: MenaKeys.currencyCode);
          expect(country, isNotNull);
          expect(country!.currency.code, equals('AED'));
          expect(country.country.englishName, equals('United Arab Emirates'));
        });

        test('should find Palestine by currency code', () {
          final palestine = MENA.getBy(
            query: 'ils',
            key: MenaKeys.currencyCode,
          );
          expect(palestine, isNotNull);
          expect(palestine!.country.englishName, equals('Palestine'));
          expect(palestine.currency.code, equals('ILS'));
        });

        test('should be case insensitive for currency codes', () {
          final lower = MENA.getBy(query: 'aed', key: MenaKeys.currencyCode);
          final upper = MENA.getBy(query: 'AED', key: MenaKeys.currencyCode);

          expect(lower, isNotNull);
          expect(upper, isNull); // Search uses lowercase internally
        });
      });
    });

    group('Map Generation', () {
      test('should create code-based lookup map', () {
        final codeMap = MENA.allCountriesMap(MenaKeys.code);
        expect(codeMap.length, equals(MENA.allCountries.length));
        expect(codeMap['ae'], isNotNull);
        expect(
          codeMap['ae']!.country.englishName,
          equals('United Arab Emirates'),
        );
      });

      test('should create dial code lookup map', () {
        final dialMap = MENA.allCountriesMap(MenaKeys.dialCode);
        expect(dialMap.length, equals(MENA.allCountries.length));
        expect(dialMap['971'], isNotNull);
        expect(
          dialMap['971']!.country.englishName,
          equals('United Arab Emirates'),
        );
      });

      test('should create currency code lookup map', () {
        final currencyMap = MENA.allCountriesMap(MenaKeys.currencyCode);
        expect(currencyMap.length, equals(MENA.allCountries.length));
        expect(currencyMap['aed'], isNotNull);
        expect(
          currencyMap['aed']!.country.englishName,
          equals('United Arab Emirates'),
        );
      });
    });
  });
}
