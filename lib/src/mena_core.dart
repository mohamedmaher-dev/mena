import '../mena.dart';
part 'models/mena_item_model.dart';

/// Primary API class providing utilities and data for Middle East and North Africa countries.
///
/// This class serves as the main entry point for accessing MENA country data.
/// All collections exposed by this class are immutable lists that you can
/// safely iterate over or use to perform lookups without worrying about
/// data corruption.
///
/// ## Search Methods:
/// The class provides a unified search method:
/// - [getBy]: Find by key and query using [MenaKeys] (e.g., code, englishName, arabicName, dialCode, currencyCode)
/// - [allCountriesMap]: Build a map keyed by a specific [MenaKeys] for fast lookup
///
/// ## Data Collections:
/// - [allCountries]: Complete list of all MENA countries (19 total)
/// - [middleEast]: Middle Eastern countries only (12 countries)
/// - [northAfrica]: North African countries only (7 countries)
///
/// ## Example Usage:
/// ```dart
/// // Default Arabic locale
/// print(MENA.defaultLocale); // 'ar'
///
/// // Search examples using unified getBy
/// final uae     = MENA.getBy(query: 'ae',            key: MenaKeys.code);
/// final egyptEn = MENA.getBy(query: 'Egypt',          key: MenaKeys.englishName);
/// final egyptAr = MENA.getBy(query: 'مصر',           key: MenaKeys.arabicName);
/// final qatar   = MENA.getBy(query: '974',           key: MenaKeys.dialCode);
/// final saudi   = MENA.getBy(query: 'SAR',           key: MenaKeys.currencyCode);
/// final lebanon = MENA.getBy(query: 'Lebanese Pound', key: MenaKeys.currencyEnglishName);
///
/// // Access flag URL
/// print(uae?.getSvgUrl); // "https://flagcdn.com/ae.svg"
///
/// // Access localized properties
/// print(uae?.getName);            // Uses current locale
/// print(uae?.getCurrencyName);    // Uses current locale
/// print(uae?.getCurrencySymbol);  // Uses current locale
///
/// // Change locale dynamically
/// MENA.setDefaultLocale('en');
/// print(uae?.getName);            // Now returns English name
///
/// // Iterate through regions
/// for (final item in MENA.middleEast) {
///   print('${item.country.englishName}: ${item.dialCodeWithPlus}');
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
  /// This list combines both [middleEast] and [northAfrica] collections.
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
  static List<MenaItemModel> northAfrica = MenaData.northAfricaCountries;

  /// Middle Eastern countries only (12 countries).
  ///
  /// **Countries included**: Saudi Arabia, UAE, Kuwait, Qatar, Bahrain, Oman,
  /// Jordan, Lebanon, Palestine, Iraq, Syria, Yemen.
  ///
  /// These countries are primarily located in Western Asia and the Arabian Peninsula.
  static List<MenaItemModel> middleEast = MenaData.middleEastCountries;

  /// Returns a map of all countries with the specified key type as the key.
  ///
  /// Creates a lookup map for fast country retrieval by the specified key type.
  /// Useful for building custom search functionality or performance optimization.
  ///
  /// **Parameters:**
  /// - [key]: The key type to use for mapping from [MenaKeys]
  ///
  /// **Returns:** A map where keys are the specified property values and values are [MenaItemModel] instances
  ///
  /// **Example:**
  /// ```dart
  /// // Create a code-based lookup map
  /// final codeMap = MENA.allCountriesMap(MenaKeys.code);
  /// final uae = codeMap['ae']; // Direct lookup, very fast
  ///
  /// // Create a dial code lookup map
  /// final dialMap = MENA.allCountriesMap(MenaKeys.dialCode);
  /// final qatar = dialMap['974'];
  ///
  /// // Create currency code lookup
  /// final currencyMap = MENA.allCountriesMap(MenaKeys.currencyCode);
  /// final saudiCountries = currencyMap['SAR'];
  /// ```
  static Map<String, MenaItemModel> allCountriesMap(final MenaKeys key) =>
      Map.fromEntries(
        allCountries.map((e) => MapEntry(_getComparableValue(e, key), e)),
      );

  // Public Search Methods --------------------------------------------------

  // Helper methods ---------------------------------------------------------
  /// Returns a country by the given query and search key type.
  ///
  /// This is the primary search method that provides a unified interface for
  /// finding countries by various criteria. The search is case-insensitive.
  ///
  /// **Parameters:**
  /// - [query]: The search query string (case-insensitive)
  /// - [key]: The search key type from [MenaKeys] enum
  ///
  /// **Returns:** A [MenaItemModel] if found, null otherwise
  ///
  /// **Example:**
  /// ```dart
  /// // Search by country code
  /// final uae = MENA.getBy(query: 'ae', key: MenaKeys.code);
  /// final egypt = MENA.getBy(query: 'EG', key: MenaKeys.code); // Case-insensitive
  ///
  /// // Search by country names
  /// final saudi = MENA.getBy(query: 'Saudi Arabia', key: MenaKeys.englishName);
  /// final lebanon = MENA.getBy(query: 'لبنان', key: MenaKeys.arabicName);
  ///
  /// // Search by communication codes
  /// final qatar = MENA.getBy(query: '974', key: MenaKeys.dialCode);
  ///
  /// // Search by currency
  /// final kuwait = MENA.getBy(query: 'KWD', key: MenaKeys.currencyCode);
  /// final jordan = MENA.getBy(query: 'Jordanian Dinar', key: MenaKeys.currencyEnglishName);
  ///
  /// // Search by capital cities
  /// final palestine = MENA.getBy(query: 'Jerusalem', key: MenaKeys.capitalEn);
  /// final morocco = MENA.getBy(query: 'الرباط', key: MenaKeys.capitalAr);
  /// ```
  static MenaItemModel? getBy({required String query, required MenaKeys key}) =>
      allCountriesMap(key)[query];

  /// Returns a comparable value for the given item and search key type.
  ///
  /// Internal helper method that extracts the appropriate property value
  /// from a [MenaItemModel] based on the search key type. Used by search
  /// and mapping functions.
  ///
  /// **Parameters:**
  /// - [item]: The [MenaItemModel] to extract the value from
  /// - [key]: The search key type from [MenaKeys] enum
  ///
  /// **Returns:** A lowercase string value for comparison
  ///
  /// **Example:**
  /// ```dart
  /// final item = MENA.getBy(query: 'ae', key: MenaKeys.code)!;
  /// final code = MENA._getComparableValue(item, MenaKeys.code); // 'ae'
  /// final name = MENA._getComparableValue(item, MenaKeys.englishName); // 'united arab emirates'
  /// ```
  static String _getComparableValue(MenaItemModel item, MenaKeys key) =>
      switch (key) {
        /// Codes
        MenaKeys.code => item.country.code,
        MenaKeys.dialCode => item.country.dialCode,
        MenaKeys.currencyCode => item.currency.code,

        /// Country Name
        MenaKeys.countryName => _getValueByLocal(
          arabicValue: item.country.arabicName,
          englishValue: item.country.englishName,
        ),
        MenaKeys.arabicName => item.country.arabicName,
        MenaKeys.englishName => item.country.englishName,

        /// Currency Name
        MenaKeys.currencyNameByLocale => _getValueByLocal(
          arabicValue: item.currency.fullArabicName,
          englishValue: item.currency.fullEnglishName,
        ),
        MenaKeys.currencyArabicName => item.currency.fullArabicName,
        MenaKeys.currencyEnglishName => item.currency.fullEnglishName,

        /// Currency Symbol
        MenaKeys.currencySymbolByLocale => _getValueByLocal(
          arabicValue: item.currency.arabicSymbol,
          englishValue: item.currency.englishSymbol,
        ),
        MenaKeys.currencyArabicSymbol => item.currency.arabicSymbol,
        MenaKeys.currencyEnglishSymbol => item.currency.englishSymbol,

        /// Country Official Name
        MenaKeys.officialNameByLocale => _getValueByLocal(
          arabicValue: item.country.officalAR,
          englishValue: item.country.officalEN,
        ),
        MenaKeys.officalAr => item.country.officalAR,
        MenaKeys.officalEn => item.country.officalEN,

        /// Country Capital Name
        MenaKeys.capitalNameByLocale => _getValueByLocal(
          arabicValue: item.country.arabicCapital,
          englishValue: item.country.englishCapital,
        ),
        MenaKeys.capitalAr => item.country.arabicCapital,
        MenaKeys.capitalEn => item.country.englishCapital,
      }.toLowerCase();

  /// Returns the value based on the current default locale.
  ///
  /// Internal helper method that selects between Arabic and English values
  /// based on the current [defaultLocale] setting.
  ///
  /// **Parameters:**
  /// - [arabicValue]: The Arabic language value
  /// - [englishValue]: The English language value
  ///
  /// **Returns:** The appropriate value based on [MENA.defaultLocale]
  /// - If locale is 'ar': returns [arabicValue] (Arabic value)
  /// - If locale is 'en': returns [englishValue] (English value)
  ///
  /// **Example:**
  /// ```dart
  /// // Internal usage within the library
  /// final name = MENA._getValueByLocal(
  ///   arabicValue: 'الإمارات',
  ///   englishValue: 'United Arab Emirates',
  /// ); // Returns appropriate value based on current locale
  /// ```
  ///
  /// **Use Cases:**
  /// - Internal locale-aware property getters
  /// - Consistent locale behavior across the library
  /// - Type-safe locale switching
  ///
  /// @since 1.0.0
  static T _getValueByLocal<T>({
    required T arabicValue,
    required T englishValue,
  }) => MENA.defaultLocale == 'ar' ? arabicValue : englishValue;
}
