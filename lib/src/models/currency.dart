import 'currency_type.dart';

/// Immutable data model representing a currency with localized names.
///
/// This class provides comprehensive currency information including
/// localized names in both English and Arabic languages, plus currency
/// type classification for regional monetary analysis.
///
/// ## Usage:
/// ```dart
/// final currency = Currency(
///   code: 'AED',
///   en: 'UAE Dirham',
///   ar: 'درهم إماراتي',
///   type: CurrencyType.dirham,
/// );
///
/// print(currency.en); // "UAE Dirham"
/// print(currency.ar); // "درهم إماراتي"
/// print(currency.code); // "AED"
/// print(currency.type); // CurrencyType.dirham
/// ```
///
/// ## Properties:
/// - [code]: ISO 4217 currency code (e.g., "AED", "SAR")
/// - [en]: English currency name
/// - [ar]: Arabic currency name
/// - [type]: Currency type classification (Dinar, Riyal, etc.)
///
/// @since 1.1.0
class Currency {
  /// Creates a [Currency] with the specified localized names.
  ///
  /// All parameters are required and must not be empty.
  ///
  /// **Parameters:**
  /// - [code]: ISO 4217 currency code (3 uppercase letters)
  /// - [en]: English currency name
  /// - [ar]: Arabic currency name
  /// - [type]: Currency type classification
  ///
  /// **Example:**
  /// ```dart
  /// final currency = Currency(
  ///   code: 'EGP',
  ///   en: 'Egyptian',      // Country adjective
  ///   ar: 'مصري',         // Country adjective in Arabic
  ///   type: CurrencyType.pound,
  /// );
  /// // Full names: currency.fullEnglishName = "Egyptian Pound"
  /// //            currency.fullArabicName = "جنيه مصري"
  /// ```
  const Currency({
    required this.code,
    required this.en,
    required this.ar,
    required this.type,
  });

  /// ISO 4217 currency code.
  ///
  /// A standardized three-letter code that uniquely identifies the currency.
  /// Always uppercase (e.g., "AED", "SAR", "ILS").
  ///
  /// **Examples:**
  /// - "AED" - UAE Dirham
  /// - "SAR" - Saudi Riyal
  /// - "ILS" - Israeli Shekel
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
  final String en;

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
  final String ar;

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
  String get fullEnglishName => '$en ${type.enName}';

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
  String get fullArabicName => '${type.arName} $ar';

  /// Returns true if this currency is widely used in international trade.
  ///
  /// Based on common usage patterns in the MENA region for
  /// international transactions and forex markets.
  bool get isInternational {
    switch (code) {
      case 'AED':
      case 'SAR':
      case 'QAR':
      case 'KWD':
      case 'BHD':
      case 'OMR':
        return true;
      default:
        return false;
    }
  }

  /// Returns the currency symbol if commonly used.
  ///
  /// **Returns:** Currency symbol or null if not commonly represented
  ///
  /// **Example:**
  /// ```dart
  /// final aed = Currency(code: 'AED', en: 'UAE Dirham', ar: 'درهم إماراتي');
  /// print(aed.symbol); // "د.إ"
  /// ```
  String? get symbol {
    switch (code) {
      case 'AED':
        return 'د.إ';
      case 'SAR':
        return 'ر.س';
      case 'EGP':
        return 'ج.م';
      case 'QAR':
        return 'ر.ق';
      case 'KWD':
        return 'د.ك';
      case 'BHD':
        return 'د.ب';
      case 'OMR':
        return 'ر.ع';
      case 'JOD':
        return 'د.أ';
      case 'LBP':
        return 'ل.ل';
      case 'ILS':
        return '₪';
      default:
        return null;
    }
  }

  /// Human-readable description combining code and English name.
  ///
  /// **Format:** "{code} - {English name}"
  ///
  /// **Example:**
  /// ```dart
  /// final currency = Currency(code: 'AED', en: 'UAE Dirham', ar: 'درهم إماراتي');
  /// print(currency.description); // "AED - UAE Dirham"
  /// ```
  String get description => '$code - $en';

  /// Returns all English name variants.
  ///
  /// **Returns:** List of English names (adjective, type, and full name)
  ///
  /// **Example:**
  /// ```dart
  /// final currency = MENA.getByCode('eg')?.currency;
  /// print(currency?.englishNames); // ["Egyptian", "Pound", "Egyptian Pound"]
  /// ```
  List<String> get englishNames {
    final names = <String>[];
    names.add(en); // Country adjective
    names.add(type.enName); // Currency type name
    names.add(fullEnglishName); // Full constructed name
    return names.toSet().toList(); // Remove duplicates
  }

  /// Returns all Arabic name variants.
  ///
  /// **Returns:** List of Arabic names (adjective, type, and full name)
  ///
  /// **Example:**
  /// ```dart
  /// final currency = MENA.getByCode('eg')?.currency;
  /// print(currency?.arabicNames); // ["مصري", "جنيه", "جنيه مصري"]
  /// ```
  List<String> get arabicNames {
    final names = <String>[];
    names.add(ar); // Country adjective
    names.add(type.arName); // Currency type name
    names.add(fullArabicName); // Full constructed name
    return names.toSet().toList(); // Remove duplicates
  }

  /// Returns all name variants in a structured format.
  ///
  /// **Returns:** Map with categorized name variants
  ///
  /// **Example:**
  /// ```dart
  /// final currency = MENA.getByCode('eg')?.currency;
  /// final names = currency?.allNames;
  /// // {
  /// //   'code': 'EGP',
  /// //   'english': ['Egyptian', 'Pound', 'Egyptian Pound'],
  /// //   'arabic': ['مصري', 'جنيه', 'جنيه مصري'],
  /// //   'type': 'pound',
  /// //   'symbol': 'ج.م'
  /// // }
  /// ```
  Map<String, dynamic> get allNames => {
    'code': code,
    'english': englishNames,
    'arabic': arabicNames,
    'type': type.name,
    'symbol': symbol,
  };

  /// Checks if a given name matches any variant of this currency.
  ///
  /// **Parameters:**
  /// - [name]: Name to check (case-insensitive for English, exact for Arabic)
  ///
  /// **Returns:** True if the name matches any variant
  ///
  /// **Example:**
  /// ```dart
  /// final currency = MENA.getByCode('eg')?.currency;
  /// print(currency?.matchesName('Pound')); // true
  /// print(currency?.matchesName('جنيه')); // true
  /// print(currency?.matchesName('EGP')); // true
  /// ```
  bool matchesName(String name) {
    // Check ISO code
    if (code.toLowerCase() == name.toLowerCase()) return true;

    // Check English names (case-insensitive)
    for (final englishName in englishNames) {
      if (englishName.toLowerCase() == name.toLowerCase()) return true;
    }

    // Check Arabic names (exact match)
    for (final arabicName in arabicNames) {
      if (arabicName == name) return true;
    }

    return false;
  }

  /// Serializes the currency to a JSON-compatible map.
  ///
  /// **Returns:** A map containing all currency properties
  ///
  /// **Example:**
  /// ```dart
  /// final currency = Currency(code: 'ILS', en: 'Israeli Shekel', ar: 'شيكل إسرائيلي');
  /// final json = currency.toJson();
  /// // {
  /// //   "code": "ILS",
  /// //   "en": "Israeli Shekel",
  /// //   "ar": "شيكل إسرائيلي"
  /// // }
  /// ```
  Map<String, dynamic> toJson() => {
    'code': code,
    'en': en,
    'ar': ar,
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
  ///   'en': 'Saudi Riyal',
  ///   'ar': 'ريال سعودي'
  /// };
  /// final currency = Currency.fromJson(json);
  /// ```
  ///
  /// **Throws:** [ArgumentError] if required fields are missing
  factory Currency.fromJson(Map<String, dynamic> json) {
    final code = json['code'] as String?;
    final en = json['en'] as String?;
    final ar = json['ar'] as String?;
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

    return Currency(code: code, en: en, ar: ar, type: type);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Currency &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          en == other.en &&
          ar == other.ar &&
          type == other.type;

  @override
  int get hashCode => code.hashCode ^ en.hashCode ^ ar.hashCode ^ type.hashCode;

  @override
  String toString() => 'Currency(code: $code, en: $en, ar: $ar)';
}
