import 'currency_type.dart';

/// Immutable data model representing a currency with localized names.
///
/// This class provides comprehensive currency information including
/// localized names in both English and Arabic languages, plus currency
/// type classification for regional monetary analysis.
///
/// ## Usage:
/// ```dart
/// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
/// final currency = country?.currency;
///
/// print(currency?.code); // "AED"
/// print(currency?.fullEnglishName); // "Emirati Dirham"
/// print(currency?.fullArabicName); // "درهم إماراتي"
/// print(currency?.type); // CurrencyType.dirham
/// print(currency?.getFullName); // Adapts to current locale
/// print(currency?.getSymbol); // Symbol adapts to current locale
/// ```
///
/// ## Properties:
/// - [code]: ISO 4217 currency code (e.g., "AED", "SAR")
/// - [_enAdjective]: English country adjective
/// - [_arAdjective]: Arabic country adjective
/// - [type]: Currency type classification (Dinar, Riyal, etc.)
///
/// @since 1.0.0
class Currency {
  /// Creates a [Currency] with the specified localized names.
  ///
  /// All parameters are required and must not be empty.
  ///
  /// **Parameters:**
  /// - [code]: ISO 4217 currency code (3 uppercase letters)
  /// - [enAdjective]: English country adjective
  /// - [arAdjective]: Arabic country adjective
  /// - [type]: Currency type classification
  ///
  /// **Example:**
  /// ```dart
  /// final currency = Currency(
  ///   code: 'EGP',
  ///   enAdjective: 'Egyptian',      // Country adjective
  ///   arAdjective: 'مصري',         // Country adjective in Arabic
  ///   type: CurrencyType.pound,
  /// );
  /// // Full names: currency.fullEnglishName = "Egyptian Pound"
  /// //            currency.fullArabicName = "جنيه مصري"
  /// ```
  const Currency({
    required this.code,
    required final String enAdjective,
    required final String arAdjective,
    required this.type,
  }) : _enAdjective = enAdjective,
       _arAdjective = arAdjective;

  /// ISO 4217 currency code.
  ///
  /// A standardized three-letter code that uniquely identifies the currency.
  /// Always uppercase (e.g., "AED", "SAR", "ILS").
  ///
  /// **Examples:**
  /// - "AED" - UAE Dirham
  /// - "SAR" - Saudi Riyal
  /// - "ILS" - Palestinian Shekel
  /// - "EGP" - Egyptian Pound
  final String code;

  /// Country adjective in English.
  ///
  /// The nationality or country adjective used to describe the currency.
  /// Combined with currency type to form the full currency name.
  ///
  /// **Examples:**
  /// - "Egyptian" (for EGP - combines with "Pound" to make "Egyptian Pound")
  /// - "Saudi" (for SAR - combines with "Riyal" to make "Saudi Riyal")
  /// - "Emirati" (for AED - combines with "Dirham" to make "Emirati Dirham")
  /// - "Palestinian" (for ILS - combines with "Shekel" to make "Palestinian Shekel")
  final String _enAdjective;

  /// Country adjective in Arabic.
  ///
  /// The nationality or country adjective in Arabic used to describe the currency.
  /// Combined with currency type Arabic name to form the full currency name.
  /// Text direction is right-to-left (RTL).
  ///
  /// **Examples:**
  /// - "مصري" (Egyptian - combines with "جنيه" to make "جنيه مصري")
  /// - "سعودي" (Saudi - combines with "ريال" to make "ريال سعودي")
  /// - "إماراتي" (Emirati - combines with "درهم" to make "درهم إماراتي")
  /// - "فلسطيني" (Palestinian - combines with "شيكل" to make "شيكل فلسطيني")
  final String _arAdjective;

  /// Currency type classification.
  ///
  /// Categorizes the currency by its traditional denomination type,
  /// providing insight into regional monetary patterns and historical origins.
  ///
  /// **Types:**
  /// - [CurrencyType.dinar]: Gold-based traditional currency (KWD, BHD, JOD, etc.)
  /// - [CurrencyType.riyal]: Royal denomination currency (SAR, QAR, OMR, YER)
  /// - [CurrencyType.dirham]: Silver-based currency (AED, MAD)
  /// - [CurrencyType.pound]: Weight-based system (EGP, SDG, LBP, SYP)
  /// - [CurrencyType.shekel]: Ancient weight-based currency (ILS)
  /// - [CurrencyType.ouguiya]: Unique non-decimal currency (MRU)
  ///
  /// **Example:**
  /// ```dart
  /// final currency = MENA.getByCode('ae')?.currency;
  /// print(currency?.type); // CurrencyType.dirham
  /// print(currency?.type.displayName); // "Dirham"
  /// print(currency?.type.origin); // "Greek"
  /// ```
  final CurrencyType type;

  /// Full English currency name.
  ///
  /// Constructs the complete English currency name by combining the
  /// country adjective with the currency type display name.
  ///
  /// **Format:** "{Country Adjective} {Currency Type}"
  ///
  /// **Example:**
  /// ```dart
  /// final currency = MENA.getByCode('eg')?.currency;
  /// print(currency?.enName); // "Egyptian Pound"
  ///
  /// final uaeCurrency = MENA.getByCode('ae')?.currency;
  /// print(uaeCurrency?.enName); // "Emirati Dirham"
  /// ```
  String get fullEnglishName => '$_enAdjective ${type.englishName}';

  /// Full Arabic currency name.
  ///
  /// Constructs the complete Arabic currency name by combining the
  /// currency type Arabic name with the country adjective.
  ///
  /// **Format:** "{Currency Type Arabic} {Country Adjective}"
  ///
  /// **Example:**
  /// ```dart
  /// final currency = MENA.getByCode('eg')?.currency;
  /// print(currency?.arName); // "جنيه مصري"
  ///
  /// final uaeCurrency = MENA.getByCode('ae')?.currency;
  /// print(uaeCurrency?.arName); // "درهم إماراتي"
  /// ```
  String get fullArabicName => '${type.arabicName} $_arAdjective';

  /// Returns the English currency symbol if commonly used.
  ///
  /// **Returns:** Currency symbol or null if not commonly represented
  ///
  /// **Example:**
  /// ```dart
  /// final aed = Currency(code: 'AED', enAdjective: 'Emirati', arAdjective: 'إماراتي');
  /// print(aed.englishSymbol); // "AED"
  /// ```
  String get englishSymbol => code;

  /// Returns the Arabic currency symbol.
  ///
  /// **Returns:** Arabic currency symbol using traditional Arabic abbreviations
  ///
  /// **Example:**
  /// ```dart
  /// final currency = MENA.getBy(query: 'ae', key: MenaKeys.code)?.currency;
  /// print(currency?.arabicSymbol); // "د.إ"
  /// ```
  String get arabicSymbol => switch (code) {
    'AED' => 'د.إ',
    'SAR' => 'ر.س',
    'EGP' => 'ج.م',
    'QAR' => 'ر.ق',
    'KWD' => 'د.ك',
    'BHD' => 'د.ب',
    'OMR' => 'ر.ع',
    'JOD' => 'د.أ',
    'LBP' => 'ل.ل',
    'ILS' => '₪',
    'TND' => 'د.ت',
    'DZD' => 'د.ج',
    'LYD' => 'د.ل',
    'MAD' => 'د.م',
    'IQD' => 'د.ع',
    'SYP' => 'ل.س',
    'SDG' => 'ج.س',
    'YER' => 'ر.ي',
    'MRU' => 'أ.م',
    String() => code, // Fallback to currency code
  };

  /// Serializes the currency to a JSON-compatible map.
  ///
  /// **Returns:** A map containing all currency properties
  ///
  /// **Example:**
  /// ```dart
  /// final currency = Currency(code: 'ILS', enAdjective: 'Palestinian', arAdjective: 'فلسطيني');
  /// final json = currency.toJson();
  /// // {
  /// //   "code": "ILS",
  /// //   "en": "Palestinian",
  /// //   "ar": "فلسطيني"
  /// // }
  /// ```
  Map<String, dynamic> toJson() => {
    'code': code,
    'enAdjective': _enAdjective,
    'arAdjective': _arAdjective,
    'type': type.name,
  };

  /// Creates a [Currency] from a JSON map.
  ///
  /// **Parameters:**
  /// - [json]: Map containing currency data
  ///
  /// **Returns:** A new [Currency] instance
  ///
  /// **Example:**
  /// ```dart
  /// final json = {
  ///   'code': 'SAR',
  ///   'enAdjective': 'Saudi',
  ///   'arAdjective': 'سعودي'
  /// };
  /// final currency = Currency.fromJson(json);
  /// ```
  ///
  /// **Throws:** [ArgumentError] if required fields are missing
  factory Currency.fromJson(Map<String, dynamic> json) {
    final code = json['code'] as String?;
    final en = json['enAdjective'] as String?;
    final ar = json['arAdjective'] as String?;
    final typeString = json['type'] as String?;

    if (code == null || en == null || ar == null || typeString == null) {
      throw ArgumentError(
        'Missing required currency fields: code, en, ar, type',
      );
    }

    final type = CurrencyType.values.firstWhere(
      (t) => t.name == typeString,
      orElse: () => throw ArgumentError('Invalid currency type: $typeString'),
    );

    return Currency(code: code, enAdjective: en, arAdjective: ar, type: type);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Currency &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          _enAdjective == other._enAdjective &&
          _arAdjective == other._arAdjective &&
          type == other.type;

  @override
  int get hashCode =>
      code.hashCode ^
      _enAdjective.hashCode ^
      _arAdjective.hashCode ^
      type.hashCode;

  @override
  String toString() =>
      'Currency(code: $code, enAdjective: $_enAdjective, arAdjective: $_arAdjective)';
}
