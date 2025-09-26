import 'package:test/test.dart';
import 'package:mena/mena.dart';

void main() {
  group('Country Model Tests', () {
    late Country testCountry;

    setUp(() {
      testCountry = const Country(
        officalEN: 'United Arab Emirates',
        officalAR: 'الإمارات العربية المتحدة',
        arabicName: 'الإمارات',
        englishName: 'United Arab Emirates',
        englishCapital: 'Abu Dhabi',
        arabicCapital: 'أبو ظبي',
        dialCode: '971',
        code: 'ae',
      );
    });

    test('should create country with all properties', () {
      expect(testCountry.officalEN, equals('United Arab Emirates'));
      expect(testCountry.officalAR, equals('الإمارات العربية المتحدة'));
      expect(testCountry.arabicName, equals('الإمارات'));
      expect(testCountry.englishName, equals('United Arab Emirates'));
      expect(testCountry.englishCapital, equals('Abu Dhabi'));
      expect(testCountry.arabicCapital, equals('أبو ظبي'));
      expect(testCountry.dialCode, equals('971'));
      expect(testCountry.code, equals('ae'));
    });

    group('Locale-based Getters', () {
      tearDown(() {
        MENA.setDefaultLocale('ar');
      });

      test('should return Arabic name when locale is Arabic', () {
        MENA.setDefaultLocale('ar');
        expect(testCountry.getName, equals('الإمارات'));
        expect(testCountry.getOfficial, equals('الإمارات العربية المتحدة'));
        expect(testCountry.getCapital, equals('أبو ظبي'));
      });

      test('should return English name when locale is English', () {
        MENA.setDefaultLocale('en');
        expect(testCountry.getName, equals('United Arab Emirates'));
        expect(testCountry.getOfficial, equals('United Arab Emirates'));
        expect(testCountry.getCapital, equals('Abu Dhabi'));
      });
    });

    test('should serialize to JSON correctly', () {
      final json = testCountry.toJson();
      expect(json['officalEN'], equals('United Arab Emirates'));
      expect(json['officalAR'], equals('الإمارات العربية المتحدة'));
      expect(json['arabicName'], equals('الإمارات'));
      expect(json['englishName'], equals('United Arab Emirates'));
      expect(json['capitalEN'], equals('Abu Dhabi'));
      expect(json['capitalAR'], equals('أبو ظبي'));
    });

    test('should implement equality correctly', () {
      final country1 = testCountry;
      final country2 = const Country(
        officalEN: 'United Arab Emirates',
        officalAR: 'الإمارات العربية المتحدة',
        arabicName: 'الإمارات',
        englishName: 'United Arab Emirates',
        englishCapital: 'Abu Dhabi',
        arabicCapital: 'أبو ظبي',
        dialCode: '971',
        code: 'ae',
      );
      final country3 = const Country(
        officalEN: 'Kingdom of Saudi Arabia',
        officalAR: 'المملكة العربية السعودية',
        arabicName: 'السعودية',
        englishName: 'Saudi Arabia',
        englishCapital: 'Riyadh',
        arabicCapital: 'الرياض',
        dialCode: '966',
        code: 'sa',
      );

      expect(country1, equals(country2));
      expect(country1, isNot(equals(country3)));
      expect(country1.hashCode, equals(country2.hashCode));
      expect(country1.hashCode, isNot(equals(country3.hashCode)));
    });

    test('should have proper toString implementation', () {
      final str = testCountry.toString();
      expect(str, contains('Country{'));
      expect(str, contains('United Arab Emirates'));
      expect(str, contains('الإمارات'));
    });
  });

  group('Currency Model Tests', () {
    late Currency testCurrency;

    setUp(() {
      testCurrency = const Currency(
        code: 'AED',
        enAdjective: 'Emirati',
        arAdjective: 'إماراتي',
        type: CurrencyType.dirham,
      );
    });

    test('should create currency with all properties', () {
      expect(testCurrency.code, equals('AED'));
      expect(testCurrency.type, equals(CurrencyType.dirham));
    });

    test('should generate correct full names', () {
      expect(testCurrency.fullEnglishName, equals('Emirati Dirham'));
      expect(testCurrency.fullArabicName, equals('درهم إماراتي'));
    });

    test('should provide correct symbols', () {
      expect(testCurrency.englishSymbol, equals('AED'));
      expect(testCurrency.arabicSymbol, equals('د.إ'));
    });

    test('should handle Palestinian currency correctly', () {
      final ilsCurrency = const Currency(
        code: 'ILS',
        enAdjective: 'Palestinian',
        arAdjective: 'فلسطيني',
        type: CurrencyType.shekel,
      );

      expect(ilsCurrency.fullEnglishName, equals('Palestinian Shekel'));
      expect(ilsCurrency.fullArabicName, equals('شيكل فلسطيني'));
      expect(ilsCurrency.arabicSymbol, equals('₪'));
    });

    test('should serialize to JSON correctly', () {
      final json = testCurrency.toJson();
      expect(json['code'], equals('AED'));
      expect(json['enAdjective'], equals('Emirati'));
      expect(json['arAdjective'], equals('إماراتي'));
      expect(json['type'], equals('dirham'));
    });

    test('should create from JSON correctly', () {
      final json = {
        'code': 'SAR',
        'enAdjective': 'Saudi',
        'arAdjective': 'سعودي',
        'type': 'riyal',
      };

      final currency = Currency.fromJson(json);
      expect(currency.code, equals('SAR'));
      expect(currency.fullEnglishName, equals('Saudi Riyal'));
      expect(currency.type, equals(CurrencyType.riyal));
    });

    test('should throw error for invalid JSON', () {
      expect(
        () => Currency.fromJson({'code': 'AED'}),
        throwsA(isA<ArgumentError>()),
      );

      expect(
        () => Currency.fromJson({
          'code': 'AED',
          'enAdjective': 'Emirati',
          'arAdjective': 'إماراتي',
          'type': 'invalid_type',
        }),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should implement equality correctly', () {
      final currency1 = testCurrency;
      final currency2 = const Currency(
        code: 'AED',
        enAdjective: 'Emirati',
        arAdjective: 'إماراتي',
        type: CurrencyType.dirham,
      );
      final currency3 = const Currency(
        code: 'SAR',
        enAdjective: 'Saudi',
        arAdjective: 'سعودي',
        type: CurrencyType.riyal,
      );

      expect(currency1, equals(currency2));
      expect(currency1, isNot(equals(currency3)));
      expect(currency1.hashCode, equals(currency2.hashCode));
    });

    group('Currency Symbols', () {
      test('should provide correct Arabic symbols for all MENA currencies', () {
        final symbolTests = {
          'AED': 'د.إ',
          'SAR': 'ر.س',
          'EGP': 'ج.م',
          'QAR': 'ر.ق',
          'KWD': 'د.ك',
          'BHD': 'د.ب',
          'OMR': 'ر.ع',
          'JOD': 'د.أ',
          'LBP': 'ل.ل',
          'ILS': '₪',
          'TND': 'د.ت',
          'DZD': 'د.ج',
          'LYD': 'د.ل',
          'MAD': 'د.م',
          'IQD': 'د.ع',
          'SYP': 'ل.س',
          'SDG': 'ج.س',
          'YER': 'ر.ي',
          'MRU': 'أ.م',
        };

        for (final entry in symbolTests.entries) {
          final currency = Currency(
            code: entry.key,
            enAdjective: 'Test',
            arAdjective: 'اختبار',
            type: CurrencyType.dinar,
          );
          expect(
            currency.arabicSymbol,
            equals(entry.value),
            reason: 'Currency ${entry.key} should have symbol ${entry.value}',
          );
        }
      });

      test('should fallback to currency code for unknown currencies', () {
        final unknownCurrency = const Currency(
          code: 'XXX',
          enAdjective: 'Unknown',
          arAdjective: 'غير معروف',
          type: CurrencyType.dinar,
        );
        expect(unknownCurrency.arabicSymbol, equals('XXX'));
      });
    });
  });

  group('MenaItemModel Tests', () {
    late MenaItemModel testItem;

    setUp(() {
      testItem = const MenaItemModel(
        country: Country(
          officalEN: 'State of Palestine',
          officalAR: 'دولة فلسطين',
          arabicName: 'فلسطين',
          englishName: 'Palestine',
          englishCapital: 'Jerusalem',
          arabicCapital: 'القدس',
          dialCode: '970',
          code: 'ps',
        ),
        currency: Currency(
          code: 'ILS',
          enAdjective: 'Palestinian',
          arAdjective: 'فلسطيني',
          type: CurrencyType.shekel,
        ),
      );
    });

    group('Locale-aware Getters', () {
      tearDown(() {
        MENA.setDefaultLocale('ar');
      });

      test('should return Arabic values when locale is Arabic', () {
        MENA.setDefaultLocale('ar');
        expect(testItem.getCountryName, equals('فلسطين'));
        expect(testItem.getOfficialName, equals('دولة فلسطين'));
        expect(testItem.getCapitalName, equals('القدس'));
        expect(testItem.getCurrencyName, equals('شيكل فلسطيني'));
        expect(testItem.getCurrencySymbol, equals('₪'));
      });

      test('should return English values when locale is English', () {
        MENA.setDefaultLocale('en');
        expect(testItem.getCountryName, equals('Palestine'));
        expect(testItem.getOfficialName, equals('State of Palestine'));
        expect(testItem.getCapitalName, equals('Jerusalem'));
        expect(testItem.getCurrencyName, equals('Palestinian Shekel'));
        expect(testItem.getCurrencySymbol, equals('ILS'));
      });
    });

    test('should format dial code with plus', () {
      expect(testItem.dialCodeWithPlus, equals('+970'));
    });

    group('URL Generation', () {
      test('should generate SVG flag URL', () {
        final url = testItem.getSvgUrl;
        expect(url.toString(), equals('https://flagcdn.com/ps.svg'));
        expect(url.scheme, equals('https'));
        expect(url.host, equals('flagcdn.com'));
        expect(url.path, equals('/ps.svg'));
      });

      test('should generate emoji flag URLs', () {
        final smallEmoji = testItem.getEmojiUrl(EmojiSize.size24x18);
        expect(
          smallEmoji.toString(),
          equals('https://flagcdn.com/24x18/ps.png'),
        );

        final largeEmoji = testItem.getEmojiUrl(EmojiSize.size128x96);
        expect(
          largeEmoji.toString(),
          equals('https://flagcdn.com/128x96/ps.png'),
        );
      });

      test('should generate image URLs with different sizes and types', () {
        final jpegImage = testItem.getImageUrl(ImageSize.w160);
        expect(jpegImage.toString(), equals('https://flagcdn.com/w160/ps.jpg'));

        final pngImage = testItem.getImageUrl(ImageSize.w160, ImageType.png);
        expect(pngImage.toString(), equals('https://flagcdn.com/w160/ps.png'));

        final heightImage = testItem.getImageUrl(ImageSize.h120, ImageType.png);
        expect(
          heightImage.toString(),
          equals('https://flagcdn.com/h120/ps.png'),
        );
      });
    });

    test('should serialize to JSON correctly', () {
      final json = testItem.toJson();
      expect(json['country'], isA<Map<String, dynamic>>());
      expect(json['currency'], isA<Map<String, dynamic>>());
      expect(json['country']['englishName'], equals('Palestine'));
      expect(json['currency']['code'], equals('ILS'));
    });

    test('should implement equality correctly', () {
      final item1 = testItem;
      final item2 = const MenaItemModel(
        country: Country(
          officalEN: 'State of Palestine',
          officalAR: 'دولة فلسطين',
          arabicName: 'فلسطين',
          englishName: 'Palestine',
          englishCapital: 'Jerusalem',
          arabicCapital: 'القدس',
          dialCode: '970',
          code: 'ps',
        ),
        currency: Currency(
          code: 'ILS',
          enAdjective: 'Palestinian',
          arAdjective: 'فلسطيني',
          type: CurrencyType.shekel,
        ),
      );

      expect(item1, equals(item2));
      expect(item1.hashCode, equals(item2.hashCode));
    });

    test('should have proper toString implementation', () {
      final str = testItem.toString();
      expect(str, contains('Country{country:'));
      expect(str, contains('currency:'));
    });
  });
}
