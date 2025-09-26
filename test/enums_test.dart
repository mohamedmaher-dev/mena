import 'package:test/test.dart';
import 'package:mena/mena.dart';

void main() {
  group('CurrencyType Enum Tests', () {
    test('should have correct English and Arabic names', () {
      expect(CurrencyType.dinar.englishName, equals('Dinar'));
      expect(CurrencyType.dinar.arabicName, equals('دينار'));

      expect(CurrencyType.riyal.englishName, equals('Riyal'));
      expect(CurrencyType.riyal.arabicName, equals('ريال'));

      expect(CurrencyType.dirham.englishName, equals('Dirham'));
      expect(CurrencyType.dirham.arabicName, equals('درهم'));

      expect(CurrencyType.pound.englishName, equals('Pound'));
      expect(CurrencyType.pound.arabicName, equals('جنيه'));

      expect(CurrencyType.shekel.englishName, equals('Shekel'));
      expect(CurrencyType.shekel.arabicName, equals('شيكل'));

      expect(CurrencyType.ouguiya.englishName, equals('Ouguiya'));
      expect(CurrencyType.ouguiya.arabicName, equals('أوقية'));
    });

    test('should return correct MENA currencies for each type', () {
      expect(
        CurrencyType.dinar.menaCurrencies,
        containsAll(['KWD', 'BHD', 'JOD', 'IQD', 'TND', 'DZD', 'LYD']),
      );
      expect(CurrencyType.dinar.menaCurrencies.length, equals(7));

      expect(
        CurrencyType.riyal.menaCurrencies,
        containsAll(['SAR', 'QAR', 'OMR', 'YER']),
      );
      expect(CurrencyType.riyal.menaCurrencies.length, equals(4));

      expect(CurrencyType.dirham.menaCurrencies, containsAll(['AED', 'MAD']));
      expect(CurrencyType.dirham.menaCurrencies.length, equals(2));

      expect(
        CurrencyType.pound.menaCurrencies,
        containsAll(['EGP', 'SDG', 'LBP', 'SYP']),
      );
      expect(CurrencyType.pound.menaCurrencies.length, equals(4));

      expect(CurrencyType.shekel.menaCurrencies, contains('ILS'));
      expect(CurrencyType.shekel.menaCurrencies.length, equals(1));

      expect(CurrencyType.ouguiya.menaCurrencies, contains('MRU'));
      expect(CurrencyType.ouguiya.menaCurrencies.length, equals(1));
    });

    test('should have proper toString implementation', () {
      final str = CurrencyType.dinar.toString();
      expect(str, contains('CurrencyType.dinar'));
      expect(str, contains('Dinar'));
    });
  });

  group('EmojiSize Enum Tests', () {
    test('should parse dimensions correctly', () {
      expect(EmojiSize.size48x36.dimensions, equals('48x36'));
      expect(EmojiSize.size48x36.width, equals(48));
      expect(EmojiSize.size48x36.height, equals(36));
      expect(EmojiSize.size48x36.aspectRatio, closeTo(4 / 3, 0.01));
    });

    test('should categorize sizes correctly', () {
      expect(EmojiSize.size24x18.isSmall, isTrue);
      expect(EmojiSize.size48x36.isMedium, isTrue);
      expect(EmojiSize.size96x72.isLarge, isTrue);
      expect(EmojiSize.size256x192.isExtraLarge, isTrue);
    });

    test('should have proper descriptions', () {
      expect(EmojiSize.size48x36.description, equals('48x36 pixels'));
    });

    test('should maintain 4:3 aspect ratio for all sizes', () {
      for (final size in EmojiSize.values) {
        expect(
          size.aspectRatio,
          closeTo(4 / 3, 0.02),
          reason: 'Size ${size.name} should maintain 4:3 aspect ratio',
        );
      }
    });

    test('should have correct size categorization', () {
      // Test a few key sizes for each category
      expect(EmojiSize.size16x12.isSmall, isTrue);
      expect(EmojiSize.size32x24.isSmall, isTrue);

      expect(EmojiSize.size36x27.isMedium, isTrue);
      expect(EmojiSize.size64x48.isMedium, isTrue);

      expect(EmojiSize.size72x54.isLarge, isTrue);
      expect(EmojiSize.size128x96.isLarge, isTrue);

      expect(EmojiSize.size144x108.isExtraLarge, isTrue);
      expect(EmojiSize.size256x192.isExtraLarge, isTrue);
    });

    test('should parse width and height from dimensions string', () {
      final testCases = [
        EmojiSize.size16x12,
        EmojiSize.size24x18,
        EmojiSize.size48x36,
        EmojiSize.size128x96,
        EmojiSize.size256x192,
      ];

      for (final size in testCases) {
        final parts = size.dimensions.split('x');
        expect(size.width, equals(int.parse(parts[0])));
        expect(size.height, equals(int.parse(parts[1])));
      }
    });
  });

  group('ImageSize Enum Tests', () {
    test('should handle width-based sizes correctly', () {
      expect(ImageSize.w160.isWidthBased, isTrue);
      expect(ImageSize.w160.isHeightBased, isFalse);
      expect(ImageSize.w160.width, equals(160));
      expect(ImageSize.w160.height, equals(120));
      expect(ImageSize.w160.sizeParam, equals('w160'));
    });

    test('should handle height-based sizes correctly', () {
      expect(ImageSize.h120.isHeightBased, isTrue);
      expect(ImageSize.h120.isWidthBased, isFalse);
      expect(ImageSize.h120.height, equals(120));
      expect(ImageSize.h120.width, equals(160));
      expect(ImageSize.h120.sizeParam, equals('h120'));
    });

    test('should categorize sizes correctly', () {
      expect(ImageSize.w40.isSmall, isTrue);
      expect(ImageSize.w160.isMedium, isTrue);
      expect(ImageSize.w640.isLarge, isTrue);
      expect(ImageSize.w1280.isExtraLarge, isTrue);
    });

    test('should maintain 4:3 aspect ratio', () {
      for (final size in ImageSize.values) {
        expect(
          size.aspectRatio,
          closeTo(4 / 3, 0.02),
          reason: 'Size ${size.name} should maintain 4:3 aspect ratio',
        );
      }
    });

    test('should generate correct dimensions string', () {
      expect(ImageSize.w160.dimensions, equals('160x120'));
      expect(ImageSize.h120.dimensions, equals('160x120'));
    });

    test('should calculate height from width correctly', () {
      expect(ImageSize.w40.height, equals(30)); // 40 * 3/4 = 30
      expect(ImageSize.w80.height, equals(60)); // 80 * 3/4 = 60
      expect(ImageSize.w160.height, equals(120)); // 160 * 3/4 = 120
      expect(ImageSize.w320.height, equals(240)); // 320 * 3/4 = 240
    });

    test('should calculate width from height correctly', () {
      expect(ImageSize.h20.width, equals(27)); // 20 * 4/3 ≈ 27
      expect(ImageSize.h40.width, equals(53)); // 40 * 4/3 ≈ 53
      expect(ImageSize.h60.width, equals(80)); // 60 * 4/3 = 80
      expect(ImageSize.h120.width, equals(160)); // 120 * 4/3 = 160
    });

    test('should have correct size categorization', () {
      expect(ImageSize.w20.isSmall, isTrue);
      expect(ImageSize.w80.isSmall, isTrue);

      expect(ImageSize.w160.isMedium, isTrue);
      expect(ImageSize.w320.isMedium, isTrue);

      expect(ImageSize.w640.isLarge, isTrue);

      expect(ImageSize.w1280.isExtraLarge, isTrue);
      expect(ImageSize.w2560.isExtraLarge, isTrue);
    });
  });

  group('ImageType Enum Tests', () {
    test('should have correct properties', () {
      expect(ImageType.png.extension, equals('png'));
      expect(ImageType.png.supportsTransparency, isTrue);
      expect(ImageType.png.isLossless, isTrue);
      expect(ImageType.png.isLossy, isFalse);

      expect(ImageType.jpeg.extension, equals('jpg'));
      expect(ImageType.jpeg.supportsTransparency, isFalse);
      expect(ImageType.jpeg.isLossless, isFalse);
      expect(ImageType.jpeg.isLossy, isTrue);
    });

    test('should have correct descriptions and characteristics', () {
      expect(ImageType.png.description, equals('PNG format'));
      expect(ImageType.png.characteristics, equals('Lossless, Transparency'));

      expect(ImageType.jpeg.description, equals('JPG format'));
      expect(ImageType.jpeg.characteristics, equals('Lossy, Compressed'));
    });

    test('should have proper toString implementation', () {
      expect(ImageType.png.toString(), contains('ImageType.png'));
      expect(ImageType.png.toString(), contains('PNG format'));

      expect(ImageType.jpeg.toString(), contains('ImageType.jpeg'));
      expect(ImageType.jpeg.toString(), contains('JPG format'));
    });
  });

  group('MenaKeys Enum Tests', () {
    test('should have all expected enum values', () {
      final expectedKeys = {
        MenaKeys.code,
        MenaKeys.dialCode,
        MenaKeys.currencyCode,
        MenaKeys.currencyNameByLocale,
        MenaKeys.currencyArabicName,
        MenaKeys.currencyEnglishName,
        MenaKeys.currencySymbolByLocale,
        MenaKeys.currencyArabicSymbol,
        MenaKeys.currencyEnglishSymbol,
        MenaKeys.countryName,
        MenaKeys.arabicName,
        MenaKeys.englishName,
        MenaKeys.officialNameByLocale,
        MenaKeys.officalAr,
        MenaKeys.officalEn,
        MenaKeys.capitalNameByLocale,
        MenaKeys.capitalAr,
        MenaKeys.capitalEn,
      };

      expect(MenaKeys.values.toSet(), equals(expectedKeys));
    });

    test('should have correct number of enum values', () {
      expect(MenaKeys.values.length, equals(18));
    });

    test('should be usable in search functionality', () {
      // This is more of an integration test, but we can verify the keys exist
      for (final key in MenaKeys.values) {
        expect(key, isNotNull);
        expect(key.toString(), isNotEmpty);
      }
    });
  });
}
