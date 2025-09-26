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
/// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
/// final names = country?.country;
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
/// // Capital cities
/// Text(names?.englishCapital ?? '');  // "Abu Dhabi"
/// Text(names?.arabicCapital ?? '');   // "أبو ظبي"
/// Text(names?.getCapital ?? '');      // Capital adapts to current locale
///
/// // JSON serialization
/// final json = names?.toJson();
/// ```
///
/// @since 1.0.0
class Country {
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

  /// Capital city name in English.
  ///
  /// The name of the country's capital city in English, properly localized
  /// and suitable for display in user interfaces and documentation.
  ///
  /// **Examples:**
  /// - "Abu Dhabi" (UAE capital)
  /// - "Riyadh" (Saudi Arabia capital)
  /// - "Cairo" (Egypt capital)
  /// - "Jerusalem" (Palestine capital)
  ///
  /// **Use Cases:**
  /// - Geographic information displays
  /// - Educational applications
  /// - Travel and tourism apps
  /// - General reference
  final String englishCapital;

  /// Capital city name in Arabic.
  ///
  /// The name of the country's capital city in Arabic script,
  /// following proper Arabic transliteration and cultural conventions.
  ///
  /// **Examples:**
  /// - "أبو ظبي" (UAE capital)
  /// - "الرياض" (Saudi Arabia capital)
  /// - "القاهرة" (Egypt capital)
  /// - "القدس" (Palestine capital)
  ///
  /// **Text Direction:** Right-to-left (RTL)
  /// **Script:** Arabic
  final String arabicCapital;

  /// International dialing code without the leading '+' symbol.
  ///
  /// Used for international phone number formatting and validation.
  /// Always numeric and represents the country calling code.
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getByCode('ae');
  /// final phoneNumber = '+${country?.dialCode}501234567'; // "+971501234567"
  /// ```
  ///
  /// **Note:** For display purposes, you typically want to add the '+' prefix.
  final String dialCode;

  /// ISO 3166-1 alpha-2 country code in lowercase.
  ///
  /// Two-letter country code following international standards.
  /// Used for flag URLs, locale identification, and international systems.
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getByCode('ae');
  /// print('Code: ${country?.code}'); // "ae"
  /// ```
  ///
  /// **Standards Compliance:** Follows ISO 3166-1 alpha-2 specification.
  final String code;

  /// Creates a new immutable [Country] instance.
  ///
  /// All parameters are required and must contain valid, non-empty strings.
  /// Names should be properly localized and culturally appropriate.
  ///
  /// **Parameters:**
  /// - [officalEN]: Official English name (formal/government)
  /// - [officalAR]: Official Arabic name (formal/government)
  /// - [arabicName]: Common Arabic name (everyday usage)
  /// - [englishName]: Common English name (everyday usage)
  /// - [englishCapital]: Capital city name in English
  /// - [arabicCapital]: Capital city name in Arabic
  /// - [dialCode]: International dialing code without the leading '+' symbol
  /// - [code]: ISO 3166-1 alpha-2 country code in lowercase
  ///
  /// **Example:**
  /// ```dart
  /// const names = Country(
  ///   officalEN: 'United Arab Emirates',
  ///   officalAR: 'الإمارات العربية المتحدة',
  ///   arabicName: 'الإمارات',
  ///   englishName: 'United Arab Emirates',
  ///   englishCapital: 'Abu Dhabi',
  ///   arabicCapital: 'أبو ظبي',
  ///   dialCode: '971',
  ///   code: 'ae',
  /// );
  /// ```
  const Country({
    required this.officalEN,
    required this.officalAR,
    required this.arabicName,
    required this.englishName,
    required this.englishCapital,
    required this.arabicCapital,
    required this.dialCode,
    required this.code,
  });

  @override
  String toString() =>
      'Country{officalEN: $officalEN, officalAR: $officalAR, arabicName: $arabicName, englishName: $englishName, englishCapital: $englishCapital, arabicCapital: $arabicCapital}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country &&
          runtimeType == other.runtimeType &&
          officalEN == other.officalEN &&
          officalAR == other.officalAR &&
          arabicName == other.arabicName &&
          englishName == other.englishName &&
          englishCapital == other.englishCapital &&
          arabicCapital == other.arabicCapital;

  @override
  int get hashCode =>
      officalEN.hashCode ^
      officalAR.hashCode ^
      arabicName.hashCode ^
      englishName.hashCode ^
      englishCapital.hashCode ^
      arabicCapital.hashCode;

  /// Returns the country name based on the current default locale.
  ///
  /// **Returns:** The appropriate common name based on [MENA.defaultLocale]
  /// - If locale is 'ar': returns [arabicName] (Arabic common name)
  /// - If locale is 'en': returns [englishName] (English common name)
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
  /// final names = country?.country;
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

  /// Returns the official country name based on the current default locale.
  ///
  /// **Returns:** The appropriate official name based on [MENA.defaultLocale]
  /// - If locale is 'ar': returns [officalAR] (Arabic official name)
  /// - If locale is 'en': returns [officalEN] (English official name)
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
  /// final names = country?.country;
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

  /// Returns the capital city name based on the current default locale.
  ///
  /// **Returns:** The appropriate capital name based on [MENA.defaultLocale]
  /// - If locale is 'ar': returns [arabicCapital] (Arabic capital name)
  /// - If locale is 'en': returns [englishCapital] (English capital name)
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
  /// final names = country?.country;
  ///
  /// // With Arabic locale (default)
  /// print(MENA.defaultLocale); // 'ar'
  /// print(names?.getCapital); // "أبو ظبي"
  ///
  /// // Switch to English locale
  /// MENA.setDefaultLocale('en');
  /// print(names?.getCapital); // "Abu Dhabi"
  /// ```
  ///
  /// **Use Cases:**
  /// - Geographic information displays
  /// - Educational applications
  /// - Travel and tourism interfaces
  /// - Location-based services
  ///
  /// @since 1.0.0
  String get getCapital =>
      MENA.defaultLocale == 'ar' ? arabicCapital : englishCapital;

  /// Serializes this model to a JSON map.
  ///
  /// **Returns:** A map containing all country properties
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
  /// final json = country?.country.toJson();
  /// // {
  /// //   "officalEN": "United Arab Emirates",
  /// //   "officalAR": "الإمارات العربية المتحدة",
  /// //   "arabicName": "الإمارات",
  /// //   "englishName": "United Arab Emirates",
  /// //   "capitalEN": "Abu Dhabi",
  /// //   "capitalAR": "أبو ظبي"
  /// // }
  /// ```
  Map<String, dynamic> toJson() => {
    'officalEN': officalEN,
    'officalAR': officalAR,
    'arabicName': arabicName,
    'englishName': englishName,
    'capitalEN': englishCapital,
    'capitalAR': arabicCapital,
  };
}
