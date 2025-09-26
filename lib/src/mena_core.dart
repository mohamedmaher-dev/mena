import '../mena.dart';
part 'models/search_enum.dart';

/// Primary API class providing utilities and data for Middle East and North Africa countries.
///
/// This class serves as the main entry point for accessing MENA country data.
/// All collections exposed by this class are immutable lists that you can
/// safely iterate over or use to perform lookups without worrying about
/// data corruption.
///
/// ## Search Methods:
/// The class provides multiple search methods for different use cases:
/// - [getByCode]: Find by ISO 3166-1 alpha-2 code (e.g., 'ae', 'sa')
/// - [getByEnglishName]: Find by English name with partial matching
/// - [getByArabicName]: Find by Arabic name with partial matching
/// - [getByName]: Find by name using current default locale
/// - [getByDialCode]: Find by international dialing code
/// - [getByCurrencyCode]: Find by ISO 4217 currency code
/// - [getByIndex]: Direct array access with bounds checking
///
/// ## Data Collections:
/// - [allCountries]: Complete list of all MENA countries (19 total)
/// - [middleEast]: Middle Eastern countries only (12 countries)
/// - [northernAfrica]: North African countries only (7 countries)
///
/// ## Example Usage:
/// ```dart
/// // Default Arabic locale
/// print(MENA.defaultLocale); // 'ar'
///
/// // Search examples
/// final uae = MENA.getByCode('ae');
/// final egypt = MENA.getByEnglishName('Egypt');
/// final egyptAr = MENA.getByArabicName('مصر');
/// final qatar = MENA.getByDialCode('974');
/// final saudi = MENA.getByCurrencyCode('SAR');
///
/// // Localized search (uses Arabic by default)
/// final saudiAr = MENA.getByName('السعودية');
///
/// // Change to English locale
/// MENA.setDefaultLocale('en');
/// final saudiEn = MENA.getByName('Saudi Arabia');
///
/// // Access flag URL
/// print(uae?.getSvgUrl); // "https://flagcdn.com/ae.svg"
///
/// // Iterate through regions
/// for (final country in MENA.middleEast) {
///   print('${country.countryName.en}: +${country.dialCode}');
/// }
/// ```
///
/// @since 1.0.0
class MENA {
  /// Private constructor to prevent instantiation. All members are static.
  MENA._();

  /// Default locale for the MENA library.
  ///
  /// Set to 'ar' (Arabic) by default to prioritize Arabic language support
  /// in the MENA region. Can be changed to 'en' for English.
  ///
  /// **Supported values:**
  /// - 'ar': Arabic (default)
  /// - 'en': English
  ///
  /// **Example:**
  /// ```dart
  /// print(MENA.defaultLocale); // 'ar'
  /// MENA.setDefaultLocale('en');
  /// print(MENA.defaultLocale); // 'en'
  /// ```
  static String _defaultLocale = 'ar';

  /// Gets the current default locale.
  static String get defaultLocale => _defaultLocale;

  /// Sets the default locale for the MENA library.
  ///
  /// **Parameters:**
  /// - [locale]: The locale to set ('ar' for Arabic, 'en' for English)
  ///
  /// **Example:**
  /// ```dart
  /// MENA.setDefaultLocale('en'); // Use English as default
  /// MENA.setDefaultLocale('ar'); // Use Arabic as default
  /// ```
  static void setDefaultLocale(String locale) {
    if (locale == 'ar' || locale == 'en') {
      _defaultLocale = locale;
    } else {
      throw ArgumentError('Unsupported locale: $locale. Use "ar" or "en".');
    }
  }

  /// Complete list of all MENA countries (19 total).
  ///
  /// This list combines both [middleEast] and [northernAfrica] collections.
  /// The list is immutable and safe to iterate over multiple times.
  ///
  /// **Countries included**: Saudi Arabia, UAE, Kuwait, Qatar, Bahrain, Oman,
  /// Jordan, Lebanon, Palestine, Iraq, Syria, Yemen, Egypt, Sudan, Libya,
  /// Tunisia, Algeria, Morocco, Mauritania.
  static final List<MenaItemModel> allCountries =
      MenaData.middleEastCountries + MenaData.northAfricaCountries;

  /// North African countries only (7 countries).
  ///
  /// **Countries included**: Egypt, Sudan, Libya, Tunisia, Algeria, Morocco, Mauritania.
  ///
  /// These countries are generally considered part of the Maghreb and Nile Valley regions.
  static List<MenaItemModel> northernAfrica = MenaData.northAfricaCountries;

  /// Middle Eastern countries only (12 countries).
  ///
  /// **Countries included**: Saudi Arabia, UAE, Kuwait, Qatar, Bahrain, Oman,
  /// Jordan, Lebanon, Palestine, Iraq, Syria, Yemen.
  ///
  /// These countries are primarily located in Western Asia and the Arabian Peninsula.
  static List<MenaItemModel> middleEast = MenaData.middleEastCountries;

  // Public Search Methods --------------------------------------------------

  /// Returns the country at the specified [index] from [allCountries].
  ///
  /// **Parameters:**
  /// - [index]: Zero-based index (0-18 for the 19 MENA countries)
  ///
  /// **Returns:** The [MenaItemModel] at the given index, or `null` if the
  /// index is out of bounds (negative or >= 19).
  ///
  /// **Example:**
  /// ```dart
  /// final firstCountry = MENA.getByIndex(0);
  /// final invalidIndex = MENA.getByIndex(25); // Returns null
  /// ```
  ///
  /// **Performance:** O(1) - constant time lookup
  static MenaItemModel? getByIndex(int index) =>
      (index >= 0 && index < allCountries.length) ? allCountries[index] : null;

  /// Finds a country by its ISO 3166-1 alpha-2 country [code].
  ///
  /// **Parameters:**
  /// - [code]: Two-letter country code (case-insensitive). Examples: 'AE', 'sa', 'PS'
  ///
  /// **Returns:** The matching [MenaItemModel], or `null` if not found.
  ///
  /// **Example:**
  /// ```dart
  /// final uae = MENA.getByCode('ae');        // ✓ Valid
  /// final saudi = MENA.getByCode('SA');      // ✓ Valid (case-insensitive)
  /// final invalid = MENA.getByCode('xyz');   // null
  /// ```
  ///
  /// **Performance:** O(n) - linear search through 19 countries
  static MenaItemModel? getByCode(String code) =>
      _getBy(code, _SearchEnum.code);

  /// Finds a country by its international dialing [dialCode].
  ///
  /// **Parameters:**
  /// - [dialCode]: Country calling code without the '+' prefix. Examples: '971', '20', '966'
  ///
  /// **Returns:** The matching [MenaItemModel], or `null` if not found.
  ///
  /// **Example:**
  /// ```dart
  /// final uae = MENA.getByDialCode('971');      // ✓ UAE
  /// final egypt = MENA.getByDialCode('20');     // ✓ Egypt
  /// final saudi = MENA.getByDialCode('966');    // ✓ Saudi Arabia
  /// final invalid = MENA.getByDialCode('1');    // null (US code, not MENA)
  /// ```
  ///
  /// **Use Case:** Perfect for phone number input validation and formatting.
  ///
  /// **Performance:** O(n) - linear search through 19 countries
  static MenaItemModel? getByDialCode(String dialCode) =>
      _getBy(dialCode, _SearchEnum.dialCode);

  /// Finds a country by its ISO 4217 [currencyCode].
  ///
  /// **Parameters:**
  /// - [currencyCode]: Three-letter currency code (case-insensitive). Examples: 'AED', 'sar', 'EGP'
  ///
  /// **Returns:** The matching [MenaItemModel], or `null` if not found.
  ///
  /// **Example:**
  /// ```dart
  /// final uae = MENA.getByCurrencyCode('AED');       // ✓ UAE Dirham
  /// final saudi = MENA.getByCurrencyCode('sar');     // ✓ Saudi Riyal (case-insensitive)
  /// final egypt = MENA.getByCurrencyCode('EGP');     // ✓ Egyptian Pound
  /// final invalid = MENA.getByCurrencyCode('USD');   // null (not a MENA currency)
  /// ```
  ///
  /// **Use Case:** Useful for e-commerce, payment processing, and financial applications.
  ///
  /// **Performance:** O(n) - linear search through 19 countries
  static MenaItemModel? getByCurrencyCode(String currencyCode) =>
      _getBy(currencyCode, _SearchEnum.currency);

  /// Finds a country by its Arabic [name] using partial, case-insensitive matching.
  ///
  /// **Parameters:**
  /// - [arabicName]: Full or partial Arabic country name. Examples: 'مصر', 'الإمارات', 'السعودية'
  ///
  /// **Returns:** The first matching [MenaItemModel], or `null` if not found.
  ///
  /// **Example:**
  /// ```dart
  /// final egypt = MENA.getByArabicName('مصر');              // ✓ Exact match
  /// final uae = MENA.getByArabicName('الإمارات');           // ✓ Exact match
  /// final saudi = MENA.getByArabicName('السعودية');         // ✓ Exact match
  /// final partial = MENA.getByArabicName('عربية');         // ✓ Partial match (Saudi Arabia)
  /// ```
  ///
  /// **Performance:** O(n) - linear search with string contains operation

  static MenaItemModel? getByArabicName(String arabicName) =>
      _getBy(arabicName, _SearchEnum.arabicName);

  /// Finds a country by its English [name] using partial, case-insensitive matching.
  ///
  /// **Parameters:**
  /// - [name]: Full or partial English country name. Examples: 'Egypt', 'arab', 'UAE'
  ///
  /// **Returns:** The first matching [MenaItemModel], or `null` if not found.
  ///
  /// **Example:**
  /// ```dart
  /// final egypt = MENA.getByEnglishName('Egypt');        // ✓ Exact match
  /// final uae = MENA.getByEnglishName('emirates');       // ✓ Partial match
  /// final saudi = MENA.getByEnglishName('saudi');        // ✓ Partial match
  /// final invalid = MENA.getByEnglishName('germany');    // null
  /// ```
  ///
  /// **Note:** Returns the first match found. For multiple potential matches,
  /// consider iterating through [allCountries] manually.
  ///
  /// **Performance:** O(n) - linear search with string contains operation
  static MenaItemModel? getByEnglishName(String name) =>
      _getBy(name, _SearchEnum.englishName);

  /// Finds a country by name using the current [defaultLocale].
  ///
  /// **Parameters:**
  /// - [name]: Country name in the default locale language
  ///
  /// **Returns:** The first matching [MenaItemModel], or `null` if not found.
  ///
  /// **Example:**
  /// ```dart
  /// // If defaultLocale is 'ar':
  /// final egypt = MENA.getByName('مصر');          // Uses Arabic search
  ///
  /// // If defaultLocale is 'en':
  /// final egypt = MENA.getByName('Egypt');        // Uses English search
  /// ```
  ///
  /// **Performance:** O(n) - linear search
  static MenaItemModel? getByName(String name) {
    return _defaultLocale == 'ar'
        ? getByArabicName(name)
        : getByEnglishName(name);
  }

  // Helper methods ---------------------------------------------------------
  static MenaItemModel? _getBy(String query, _SearchEnum searchType) {
    query = query.toLowerCase();
    MenaItemModel? result;
    for (var country in allCountries) {
      if (_getComparableValue(country, searchType).contains(query)) {
        result = country;
        break;
      }
    }
    return result;
  }

  static String _getComparableValue(
    MenaItemModel item,
    _SearchEnum searchType,
  ) => switch (searchType) {
    _SearchEnum.code => item.country.code,
    _SearchEnum.englishName => item.country.englishName,
    _SearchEnum.dialCode => item.country.dialCode,
    _SearchEnum.currency => item.currency.code,
    _SearchEnum.arabicName => item.country.arabicName,
  }.toLowerCase();
}
