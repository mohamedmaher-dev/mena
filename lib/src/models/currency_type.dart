import '../mena_core.dart';

/// Enumeration of currency types used in the MENA region.
///
/// This enum categorizes currencies by their type/denomination, providing
/// insight into regional monetary systems and historical currency patterns.
///
/// ## Usage:
/// ```dart
/// final currency = MENA.getByCode('ae')?.currency;
/// final type = currency?.type;
/// print(type?.name); // "dirham"
/// print(type?.getName); // Adapts to current locale
/// ```
///
/// ## Regional Patterns:
/// - **Gulf**: Primarily Dinars and Dirhams
/// - **Levant**: Mix of Dinars, Pounds, and Shekels
/// - **North Africa**: Dinars, Dirhams, and Pounds
///
/// @since 1.1.0
enum CurrencyType {
  /// Dinar - Traditional gold-based currency unit
  ///
  /// **Characteristics:**
  /// - Historically derived from the Roman "denarius"
  /// - Typically subdivided into 1000 fils or 100 piastres
  /// - Common in oil-rich nations due to stability
  ///
  /// **MENA Countries Using Dinars:**
  /// - Kuwait (KWD) - Highest valued currency globally
  /// - Bahrain (BHD) - Second highest valued currency
  /// - Jordan (JOD) - Stable regional currency
  /// - Iraq (IQD) - Post-conflict reconstruction currency
  /// - Tunisia (TND) - North African dinar
  /// - Algeria (DZD) - Largest African country by area
  /// - Libya (LYD) - Oil-backed dinar
  dinar('Dinar', 'دينار'),

  /// Riyal/Rial - Royal currency denomination
  ///
  /// **Characteristics:**
  /// - Name derives from Spanish "real" (royal)
  /// - Typically subdivided into 100 halalas or qirsh
  /// - Associated with monarchies and oil economies
  ///
  /// **MENA Countries Using Riyals:**
  /// - Saudi Arabia (SAR) - Largest Arab economy
  /// - Qatar (QAR) - Wealthy Gulf state
  /// - Oman (OMR) - Sultanate currency
  /// - Yemen (YER) - Conflict-affected economy
  riyal('Riyal', 'ريال'),

  /// Dirham - Silver-based traditional currency
  ///
  /// **Characteristics:**
  /// - Historically based on silver weight standards
  /// - Name from Greek "drachma"
  /// - Subdivided into 100 fils
  ///
  /// **MENA Countries Using Dirhams:**
  /// - UAE (AED) - Federation of seven emirates
  /// - Morocco (MAD) - Western North African dirham
  dirham('Dirham', 'درهم'),

  /// Pound - Weight-based currency system
  ///
  /// **Characteristics:**
  /// - Derived from pound weight of silver/gold
  /// - Legacy of British colonial influence
  /// - Subdivided into 100 piastres or qirsh
  ///
  /// **MENA Countries Using Pounds:**
  /// - Egypt (EGP) - Largest Arab population
  /// - Sudan (SDG) - Transitional economy
  /// - Lebanon (LBP) - Financial crisis affected
  /// - Syria (SYP) - Conflict-affected currency
  pound('Pound', 'جنيه'),

  /// Shekel - Ancient weight-based currency
  ///
  /// **Characteristics:**
  /// - One of the world's oldest currency names
  /// - Biblical and historical significance
  /// - Modern subdivision into 100 agorot
  ///
  /// **MENA Countries Using Shekels:**
  /// - Palestine (ILS) - Shared currency region
  shekel('Shekel', 'شيكل'),

  /// Ouguiya - Unique non-decimal currency
  ///
  /// **Characteristics:**
  /// - Only currency not subdivided by 10s or 100s
  /// - Subdivided into 5 khoums
  /// - Reflects traditional Islamic monetary system
  ///
  /// **MENA Countries Using Ouguiya:**
  /// - Mauritania (MRU) - Unique monetary system
  ouguiya('Ouguiya', 'أوقية');

  /// Creates a [CurrencyType] with the specified names.
  const CurrencyType(this.enName, this.arName);

  /// Primary English name of the currency type.
  ///
  /// Standard English name for the currency denomination, properly
  /// capitalized and suitable for user interfaces and documentation.
  ///
  /// **Examples:**
  /// - "Dinar" (gold-based currency)
  /// - "Riyal" (royal denomination)
  /// - "Dirham" (silver-based currency)
  /// - "Pound" (weight-based system)
  /// - "Shekel" (ancient currency)
  /// - "Ouguiya" (unique non-decimal)
  final String enName;

  /// Arabic name of the currency type.
  ///
  /// Traditional Arabic name for this currency denomination type.
  /// Used in Arabic-language financial contexts and documentation.
  ///
  /// **Examples:**
  /// - "دينار" (Dinar)
  /// - "ريال" (Riyal)
  /// - "درهم" (Dirham)
  /// - "جنيه" (Pound/Gineh)
  /// - "شيكل" (Shekel)
  /// - "أوقية" (Ouguiya)
  final String arName;

  /// Returns the currency type name based on the current default locale in MENA.
  ///
  /// **Returns:** The appropriate name based on [MENA.defaultLocale]
  /// - If locale is 'ar': returns [arName] (Arabic name)
  /// - If locale is 'en': returns [enName] (English name)
  ///
  /// **Example:**
  /// ```dart
  /// final currency = MENA.getByCode('ae')?.currency;
  /// final type = currency?.type;
  ///
  /// // With Arabic locale (default)
  /// print(MENA.defaultLocale); // 'ar'
  /// print(type?.getName); // "درهم"
  ///
  /// // Switch to English locale
  /// MENA.setDefaultLocale('en');
  /// print(type?.getName); // "Dirham"
  /// ```
  ///
  /// **Use Cases:**
  /// - Dynamic UI that adapts to current locale
  /// - Internationalized financial applications
  /// - User preference-based currency display
  String get getName => MENA.defaultLocale == 'ar' ? arName : enName;

  /// Returns currencies of this type used in MENA region.
  ///
  /// **Example:**
  /// ```dart
  /// final dinars = CurrencyType.dinar.menaCurrencies;
  /// // Returns: ['KWD', 'BHD', 'JOD', 'IQD', 'TND', 'DZD', 'LYD']
  /// ```
  List<String> get menaCurrencies {
    switch (this) {
      case CurrencyType.dinar:
        return ['KWD', 'BHD', 'JOD', 'IQD', 'TND', 'DZD', 'LYD'];
      case CurrencyType.riyal:
        return ['SAR', 'QAR', 'OMR', 'YER'];
      case CurrencyType.dirham:
        return ['AED', 'MAD'];
      case CurrencyType.pound:
        return ['EGP', 'SDG', 'LBP', 'SYP'];
      case CurrencyType.shekel:
        return ['ILS'];
      case CurrencyType.ouguiya:
        return ['MRU'];
    }
  }

  /// Returns both English and Arabic names.
  ///
  /// **Example:**
  /// ```dart
  /// print(CurrencyType.dinar.bilingualName); // "Dinar (دينار)"
  /// print(CurrencyType.riyal.bilingualName); // "Riyal (ريال)"
  /// ```
  String get bilingualName => '$enName ($arName)';

  @override
  String toString() => 'CurrencyType.$name ($enName)';
}
