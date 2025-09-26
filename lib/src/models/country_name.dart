import '../mena_core.dart';

/// Immutable model containing localized country names in multiple formats.
///
/// This class provides both common (everyday) and official (formal/government)
/// country names in English and Arabic. All text is properly localized and
/// suitable for user interface display.
///
/// ## Name Types:
/// - **Common Names**: Used in everyday conversation and casual contexts
/// - **Official Names**: Used in formal documents, government communications
///
/// ## Language Support:
/// - **English**: Left-to-right text, Latin script
/// - **Arabic**: Right-to-left text, Arabic script with proper diacritics
///
/// ## Example Usage:
/// ```dart
/// final country = MENA.getByCode('ae');
/// final names = country?.countryName;
///
/// // Display in UI
/// Text(names?.englishName ?? '');     // "United Arab Emirates"
/// Text(names?.arabicName ?? '');      // "الإمارات"
/// Text(names?.getName ?? '');         // Common name adapts to current locale
///
/// // For official documents
/// Text(names?.officalEN ?? '');       // "United Arab Emirates"
/// Text(names?.officalAR ?? '');       // "الإمارات العربية المتحدة"
/// Text(names?.getOfficial ?? '');     // Official name adapts to current locale
///
/// // JSON serialization
/// final json = names?.toJson();
/// ```
///
/// @since 1.0.0
class CountryName {
  /// Official country name in English.
  ///
  /// The formal, government-recognized name used in official documents,
  /// treaties, and formal communications. May be longer than common names.
  ///
  /// **Examples:**
  /// - "United Arab Emirates" (vs. common: "UAE")
  /// - "Kingdom of Saudi Arabia" (vs. common: "Saudi Arabia")
  /// - "Arab Republic of Egypt" (vs. common: "Egypt")
  ///
  /// **Use Cases:**
  /// - Legal documents
  /// - Government forms
  /// - International treaties
  /// - Formal correspondence
  final String officalEN;

  /// Official country name in Arabic.
  ///
  /// The formal, government-recognized name in Arabic script.
  /// Includes proper diacritics and follows official transliteration standards.
  ///
  /// **Examples:**
  /// - "الإمارات العربية المتحدة" (UAE official)
  /// - "المملكة العربية السعودية" (Saudi Arabia official)
  /// - "جمهورية مصر العربية" (Egypt official)
  ///
  /// **Text Direction:** Right-to-left (RTL)
  /// **Script:** Arabic with proper diacritics
  final String officalAR;

  /// Common country name in English.
  ///
  /// The name typically used in everyday conversation, news media,
  /// and casual contexts. Usually shorter and more recognizable.
  ///
  /// **Examples:**
  /// - "United Arab Emirates" or "UAE"
  /// - "Saudi Arabia"
  /// - "Egypt"
  ///
  /// **Use Cases:**
  /// - User interface labels
  /// - Dropdown menus
  /// - Search suggestions
  /// - General communication
  final String englishName;

  /// Common country name in Arabic.
  ///
  /// The name typically used in everyday Arabic conversation and media.
  /// Often shorter than the official name while maintaining cultural accuracy.
  ///
  /// **Examples:**
  /// - "الإمارات" (UAE common)
  /// - "السعودية" (Saudi Arabia common)
  /// - "مصر" (Egypt common)
  ///
  /// **Text Direction:** Right-to-left (RTL)
  /// **Script:** Arabic
  final String arabicName;

  /// Creates a new immutable [CountryName] instance.
  ///
  /// All parameters are required and must contain valid, non-empty strings.
  /// Names should be properly localized and culturally appropriate.
  ///
  /// **Parameters:**
  /// - [officalEN]: Official English name (formal/government)
  /// - [officalAR]: Official Arabic name (formal/government)
  /// - [arabicName]: Common Arabic name (everyday usage)
  /// - [englishName]: Common English name (everyday usage)
  ///
  /// **Example:**
  /// ```dart
  /// const names = CountryName(
  ///   officalEN: 'United Arab Emirates',
  ///   officalAR: 'الإمارات العربية المتحدة',
  ///   ar: 'الإمارات',
  ///   en: 'United Arab Emirates',
  /// );
  /// ```
  const CountryName({
    required this.officalEN,
    required this.officalAR,
    required this.arabicName,
    required this.englishName,
  });

  /// Returns the country name based on the current default locale in MENA.
  ///
  /// **Returns:** The appropriate common name based on [MENA.defaultLocale]
  /// - If locale is 'ar': returns [arabicName] (Arabic common name)
  /// - If locale is 'en': returns [englishName] (English common name)
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getByCode('ae');
  /// final names = country?.countryName;
  ///
  /// // With Arabic locale (default)
  /// print(MENA.defaultLocale); // 'ar'
  /// print(names?.getName); // "الإمارات"
  ///
  /// // Switch to English locale
  /// MENA.setDefaultLocale('en');
  /// print(names?.getName); // "United Arab Emirates"
  /// ```
  ///
  /// **Use Cases:**
  /// - Dynamic UI that adapts to current locale
  /// - Internationalized applications
  /// - User preference-based display
  ///
  /// @since 1.0.0
  String get getName => MENA.defaultLocale == 'ar' ? arabicName : englishName;

  /// Returns the official country name based on the current default locale in MENA.
  ///
  /// **Returns:** The appropriate official name based on [MENA.defaultLocale]
  /// - If locale is 'ar': returns [officalAR] (Arabic official name)
  /// - If locale is 'en': returns [officalEN] (English official name)
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getByCode('ae');
  /// final names = country?.countryName;
  ///
  /// // With Arabic locale (default)
  /// print(MENA.defaultLocale); // 'ar'
  /// print(names?.getOfficial); // "الإمارات العربية المتحدة"
  ///
  /// // Switch to English locale
  /// MENA.setDefaultLocale('en');
  /// print(names?.getOfficial); // "United Arab Emirates"
  /// ```
  ///
  /// **Use Cases:**
  /// - Official documents and forms
  /// - Government applications
  /// - Legal documentation
  /// - Formal communications
  ///
  /// @since 1.0.0
  String get getOfficial => MENA.defaultLocale == 'ar' ? officalAR : officalEN;

  @override
  String toString() =>
      'CountryName{officalEN: $officalEN, officalAR: $officalAR, ar: $arabicName, en: $englishName}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryName &&
          runtimeType == other.runtimeType &&
          officalEN == other.officalEN &&
          officalAR == other.officalAR &&
          arabicName == other.arabicName &&
          englishName == other.englishName;

  @override
  int get hashCode =>
      officalEN.hashCode ^
      officalAR.hashCode ^
      arabicName.hashCode ^
      englishName.hashCode;

  /// Serializes this model to a JSON map.
  Map<String, dynamic> toJson() => {
    'officalEN': officalEN,
    'officalAR': officalAR,
    'ar': arabicName,
    'en': englishName,
  };
}
