import 'country_name.dart';

/// Immutable data model representing a MENA country with complete metadata.
///
/// This class encapsulates all essential information about a MENA country,
/// including localized names, international codes, and utility properties.
/// All instances are immutable and safe to use across multiple threads.
///
/// ## Properties Overview:
/// - **Names**: Both common and official names in Arabic and English
/// - **Codes**: ISO country code, currency code, and international dial code
/// - **Utilities**: SVG flag URL, JSON serialization, equality operations
///
/// ## Example Usage:
/// ```dart
/// final country = MENA.getByCode('ae');
/// if (country != null) {
///   print('Country: ${country.countryName.en}');           // "United Arab Emirates"
///   print('Currency: ${country.currency}');                // "AED"
///   print('Phone: +${country.dialCode}');                  // "+971"
///   print('Flag: ${country.svgUrl}');                      // SVG flag URL
///
///   // Serialize to JSON for API calls
///   final json = country.toJson();
///
///   // Safe equality comparison
///   final same = country == MENA.getByCode('ae');          // true
/// }
/// ```
///
/// @since 1.0.0
class MenaItemModel {
  /// Localized country names in both Arabic and English.
  ///
  /// Contains both common names (used in everyday speech) and official names
  /// (used in formal/government contexts). All names are properly localized
  /// and can be used safely in user interfaces.
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getByCode('ae');
  /// print(country?.countryName.en);        // "United Arab Emirates"
  /// print(country?.countryName.ar);        // "الإمارات"
  /// print(country?.countryName.officalEN); // "United Arab Emirates"
  /// print(country?.countryName.officalAR); // "الإمارات العربية المتحدة"
  /// ```
  final CountryName countryName;

  /// ISO 4217 three-letter currency code in uppercase.
  ///
  /// Standard international currency code used in financial systems,
  /// e-commerce platforms, and currency conversion APIs.
  ///
  /// **Common MENA currencies:**
  /// - `AED`: UAE Dirham
  /// - `SAR`: Saudi Riyal
  /// - `EGP`: Egyptian Pound
  /// - `QAR`: Qatari Riyal
  /// - `KWD`: Kuwaiti Dinar
  ///
  /// **Example:**
  /// ```dart
  /// final uae = MENA.getByCode('ae');
  /// print('Price: 100 ${uae?.currency}'); // "Price: 100 AED"
  /// ```
  final String currency;

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

  /// Creates a new immutable [MenaItemModel] instance.
  ///
  /// All parameters are required and must not be null. Once created,
  /// the instance cannot be modified (immutable).
  ///
  /// **Parameters:**
  /// - [countryName]: Localized names for the country
  /// - [currency]: ISO 4217 currency code (3 letters, uppercase)
  /// - [dialCode]: International dialing code (numeric, no '+' prefix)
  /// - [code]: ISO 3166-1 alpha-2 country code (2 letters, lowercase)
  ///
  /// **Example:**
  /// ```dart
  /// const country = MenaItemModel(
  ///   countryName: CountryName(
  ///     en: 'United Arab Emirates',
  ///     ar: 'الإمارات',
  ///     officalEN: 'United Arab Emirates',
  ///     officalAR: 'الإمارات العربية المتحدة',
  ///   ),
  ///   currency: 'AED',
  ///   dialCode: '971',
  ///   code: 'ae',
  /// );
  /// ```
  const MenaItemModel({
    required this.countryName,
    required this.currency,
    required this.dialCode,
    required this.code,
  });

  /// High-quality SVG flag URL provided by flagcdn.com.
  ///
  /// Returns a direct URL to the country's flag in SVG format.
  /// The service is free, fast, and provides consistent flag designs.
  ///
  /// **URL Format:** `https://flagcdn.com/{countryCode}.svg`
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getByCode('ae');
  /// final flagUrl = country?.svgUrl; // "https://flagcdn.com/ae.svg"
  ///
  /// // Use in Flutter Image widget:
  /// Image.network(flagUrl)
  ///
  /// // Use in HTML img tag:
  /// <img src="$flagUrl" alt="UAE Flag" />
  /// ```
  ///
  /// **Note:** The service supports various formats and sizes.
  /// Check flagcdn.com documentation for advanced usage.
  String get svgUrl => 'https://flagcdn.com/$code.svg';

  @override
  String toString() =>
      'Country{countryName: ${countryName.toString()}, currency: $currency, dialCode: $dialCode, code: $code}';

  /// Serializes this model to a JSON-compatible map.
  ///
  /// Converts all properties to a nested map structure suitable for
  /// JSON encoding, API transmission, or local storage.
  ///
  /// **Returns:** A `Map<String, dynamic>` containing all country data.
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getByCode('ae');
  /// final json = country?.toJson();
  ///
  /// // Result:
  /// // {
  /// //   'countryName': {
  /// //     'en': 'United Arab Emirates',
  /// //     'ar': 'الإمارات',
  /// //     'officalEN': 'United Arab Emirates',
  /// //     'officalAR': 'الإمارات العربية المتحدة'
  /// //   },
  /// //   'currency': 'AED',
  /// //   'dialCode': '971',
  /// //   'code': 'ae'
  /// // }
  ///
  /// // Use with json.encode() for API calls:
  /// final jsonString = json.encode(json);
  /// ```
  ///
  /// **Use Cases:**
  /// - REST API payloads
  /// - Local storage (SharedPreferences, SQLite)
  /// - State management serialization
  /// - Data export functionality
  Map<String, dynamic> toJson() => {
    'countryName': countryName.toJson(),
    'currency': currency,
    'dialCode': dialCode,
    'code': code,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenaItemModel &&
          runtimeType == other.runtimeType &&
          countryName == other.countryName &&
          currency == other.currency &&
          dialCode == other.dialCode &&
          code == other.code;

  @override
  int get hashCode =>
      countryName.hashCode ^
      currency.hashCode ^
      dialCode.hashCode ^
      code.hashCode;
}
