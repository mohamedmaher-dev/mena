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
/// print(type?.description); // "Dirham - Traditional Arabian currency unit"
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
  dinar(
    'Dinar',
    'Traditional Arabian currency unit derived from Roman denarius',
    'دينار',
    'Denarius',
  ),

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
  riyal(
    'Riyal',
    'Royal currency denomination derived from Spanish real',
    'ريال',
    'Rial',
  ),

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
  dirham(
    'Dirham',
    'Silver-based currency derived from Greek drachma',
    'درهم',
    'Drachma',
  ),

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
  pound(
    'Pound',
    'Weight-based currency system with colonial heritage',
    'جنيه',
    'Livre',
  ),

  /// Shekel - Ancient weight-based currency
  ///
  /// **Characteristics:**
  /// - One of the world's oldest currency names
  /// - Biblical and historical significance
  /// - Modern subdivision into 100 agorot
  ///
  /// **MENA Countries Using Shekels:**
  /// - Palestine (ILS) - Shared currency region
  shekel(
    'Shekel',
    'Ancient weight-based currency with biblical origins',
    'شيكل',
    'Sheqel',
  ),

  /// Ouguiya - Unique non-decimal currency
  ///
  /// **Characteristics:**
  /// - Only currency not subdivided by 10s or 100s
  /// - Subdivided into 5 khoums
  /// - Reflects traditional Islamic monetary system
  ///
  /// **MENA Countries Using Ouguiya:**
  /// - Mauritania (MRU) - Unique monetary system
  ouguiya(
    'Ouguiya',
    'Unique non-decimal currency subdivided into 5 khoums',
    'أوقية',
    'Uqiyyah',
  );

  /// Creates a [CurrencyType] with the specified names and description.
  const CurrencyType(
    this.enName,
    this.description,
    this.arName,
    this.enAlternative,
  );

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

  /// Detailed description of the currency type.
  ///
  /// Provides historical context, characteristics, and usage information
  /// for educational and informational purposes.
  final String description;

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

  /// Alternative English name for the currency type.
  ///
  /// Historical or regional variant commonly used in different
  /// contexts or linguistic traditions.
  ///
  /// **Examples:**
  /// - "Denarius" (Roman origin of Dinar)
  /// - "Rial" (alternative spelling of Riyal)
  /// - "Drachma" (Greek origin of Dirham)
  /// - "Livre" (French variant of Pound)
  /// - "Sheqel" (alternative spelling of Shekel)
  /// - "Uqiyyah" (traditional Arabic spelling)
  final String enAlternative;

  /// Backward compatibility alias for [enName].
  ///
  /// **Deprecated:** Use [enName] instead.
  @Deprecated('Use enName instead')
  String get displayName => enName;

  /// Backward compatibility alias for [arName].
  ///
  /// **Deprecated:** Use [arName] instead.
  @Deprecated('Use arName instead')
  String get arTrailing => arName;

  /// Backward compatibility alias for [enAlternative].
  ///
  /// **Deprecated:** Use [enAlternative] instead.
  @Deprecated('Use enAlternative instead')
  String get enTrailing => enAlternative;

  /// Returns the plural form of the currency type.
  ///
  /// **Example:**
  /// ```dart
  /// print(CurrencyType.dinar.pluralName); // "Dinars"
  /// print(CurrencyType.riyal.pluralName); // "Riyals"
  /// ```
  String get pluralName {
    switch (this) {
      case CurrencyType.dinar:
        return 'Dinars';
      case CurrencyType.riyal:
        return 'Riyals';
      case CurrencyType.dirham:
        return 'Dirhams';
      case CurrencyType.pound:
        return 'Pounds';
      case CurrencyType.shekel:
        return 'Shekels';
      case CurrencyType.ouguiya:
        return 'Ouguiyas';
    }
  }

  /// Returns the historical origin of the currency type.
  ///
  /// **Example:**
  /// ```dart
  /// print(CurrencyType.dinar.origin); // "Roman"
  /// print(CurrencyType.dirham.origin); // "Greek"
  /// ```
  String get origin {
    switch (this) {
      case CurrencyType.dinar:
        return 'Roman';
      case CurrencyType.riyal:
        return 'Spanish';
      case CurrencyType.dirham:
        return 'Greek';
      case CurrencyType.pound:
        return 'British';
      case CurrencyType.shekel:
        return 'Ancient Hebrew';
      case CurrencyType.ouguiya:
        return 'Islamic';
    }
  }

  /// Returns true if this currency type is traditionally gold-based.
  bool get isGoldBased {
    switch (this) {
      case CurrencyType.dinar:
        return true;
      case CurrencyType.riyal:
      case CurrencyType.dirham:
      case CurrencyType.pound:
      case CurrencyType.shekel:
      case CurrencyType.ouguiya:
        return false;
    }
  }

  /// Returns true if this currency type is traditionally silver-based.
  bool get isSilverBased {
    switch (this) {
      case CurrencyType.dirham:
      case CurrencyType.pound:
      case CurrencyType.shekel:
        return true;
      case CurrencyType.dinar:
      case CurrencyType.riyal:
      case CurrencyType.ouguiya:
        return false;
    }
  }

  /// Returns true if this currency type uses decimal subdivision.
  ///
  /// **Note:** Most currencies subdivide into 100 smaller units,
  /// except Ouguiya which uses 5 khoums.
  bool get isDecimalBased {
    switch (this) {
      case CurrencyType.ouguiya:
        return false;
      case CurrencyType.dinar:
      case CurrencyType.riyal:
      case CurrencyType.dirham:
      case CurrencyType.pound:
      case CurrencyType.shekel:
        return true;
    }
  }

  /// Returns the typical subdivision unit name.
  ///
  /// **Example:**
  /// ```dart
  /// print(CurrencyType.dinar.subdivisionUnit); // "fils"
  /// print(CurrencyType.pound.subdivisionUnit); // "piastre"
  /// ```
  String get subdivisionUnit {
    switch (this) {
      case CurrencyType.dinar:
        return 'fils';
      case CurrencyType.riyal:
        return 'halala';
      case CurrencyType.dirham:
        return 'fils';
      case CurrencyType.pound:
        return 'piastre';
      case CurrencyType.shekel:
        return 'agora';
      case CurrencyType.ouguiya:
        return 'khoum';
    }
  }

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

  /// Returns a summary of regional usage patterns.
  ///
  /// **Example:**
  /// ```dart
  /// print(CurrencyType.dinar.regionalUsage);
  /// // "7 currencies: Dominant in Gulf states and North Africa"
  /// ```
  String get regionalUsage {
    final count = menaCurrencies.length;
    switch (this) {
      case CurrencyType.dinar:
        return '$count currencies: Dominant in Gulf states and North Africa';
      case CurrencyType.riyal:
        return '$count currencies: Gulf monarchies and Arabian Peninsula';
      case CurrencyType.dirham:
        return '$count currencies: UAE federation and Morocco';
      case CurrencyType.pound:
        return '$count currencies: Levant region and Nile Valley';
      case CurrencyType.shekel:
        return '$count currency: Levantine region';
      case CurrencyType.ouguiya:
        return '$count currency: West African transition zone';
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

  /// Returns all name variants for this currency type.
  ///
  /// **Returns:** Map with name categories and their values
  ///
  /// **Example:**
  /// ```dart
  /// final names = CurrencyType.dirham.allNames;
  /// // {
  /// //   'english': 'Dirham',
  /// //   'arabic': 'درهم',
  /// //   'alternative': 'Drachma',
  /// //   'plural': 'Dirhams',
  /// //   'origin': 'Greek'
  /// // }
  /// ```
  Map<String, String> get allNames => {
    'english': enName,
    'arabic': arName,
    'alternative': enAlternative,
    'plural': pluralName,
    'origin': origin,
  };

  /// Checks if a given name matches any variant of this currency type.
  ///
  /// **Parameters:**
  /// - [name]: Name to check (case-insensitive)
  ///
  /// **Returns:** True if the name matches any variant
  ///
  /// **Example:**
  /// ```dart
  /// final isDinar = CurrencyType.dinar.matchesName('denarius'); // true
  /// final isRiyal = CurrencyType.riyal.matchesName('rial'); // true
  /// final isDirham = CurrencyType.dirham.matchesName('درهم'); // true
  /// ```
  bool matchesName(String name) {
    final lowerName = name.toLowerCase();
    return enName.toLowerCase() == lowerName ||
        arName == name ||
        enAlternative.toLowerCase() == lowerName ||
        pluralName.toLowerCase() == lowerName;
  }

  @override
  String toString() => 'CurrencyType.$name ($enName)';
}
