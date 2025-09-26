part of '../mena_core.dart';

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
/// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
/// if (country != null) {
///   print('Country: ${country.getName}');                  // localized name
///   print('Currency: ${country.currency.code}');           // "AED"
///   print('Phone: ${country.dialCodeWithPlus}');           // "+971"
///   print('Flag: ${country.getSvgUrl}');                   // SVG flag URL
///
///   // Serialize to JSON for API calls
///   final json = country.toJson();
///
///   // Safe equality comparison
///   final same = country == MENA.getBy(query: 'ae', key: MenaKeys.code); // true
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
  /// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
  /// print(country?.country.getName);        // localized common name
  /// print(country?.country.getOfficial);    // localized official name
  /// ```
  final Country country;

  /// Currency information with localized names and symbols.
  ///
  /// Complete currency data including ISO 4217 code and localized names
  /// in both English and Arabic. Provides access to currency symbols
  /// and additional metadata.
  ///
  /// **Properties:**
  /// - `code`: ISO 4217 currency code (e.g., "AED", "SAR", "ILS")
  /// - `en`: English currency name (e.g., "UAE Dirham", "Egyptian Pound")
  /// - `ar`: Arabic currency name (e.g., "درهم إماراتي", "جنيه مصري")
  /// - `symbol`: Currency symbol if available (e.g., "د.إ", "₪")
  ///
  /// **Example:**
  /// ```dart
  /// final palestine = MENA.getBy(query: 'ps', key: MenaKeys.code);
  /// print('Code: ${palestine?.currency.code}'); // "ILS"
  /// print('English: ${palestine?.currency.fullEnglishName}'); // "Palestinian Shekel"
  /// print('Arabic: ${palestine?.currency.fullArabicName}'); // "شيكل فلسطيني"
  /// print('Symbol: ${palestine?.currency.arabicSymbol}'); // "₪"
  /// print('Price: 100 ${palestine?.currency.code}'); // "Price: 100 ILS"
  /// ```
  final Currency currency;

  /// Creates a new immutable [MenaItemModel] instance.
  ///
  /// All parameters are required and must not be null. Once created,
  /// the instance cannot be modified (immutable).
  ///
  /// **Parameters:**
  /// - [country]: Localized names for the country
  /// - [currency]: ISO 4217 currency code (3 letters, uppercase)
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
  /// print('Complete model: ${country.toString()}');
  /// ```
  const MenaItemModel({required this.country, required this.currency});

  /// Returns the country name based on the current default locale in MENA.
  ///
  /// **Returns:** The appropriate common name based on [MENA.defaultLocale]
  /// - If locale is 'ar': returns [arabicName] (Arabic common name)
  /// - If locale is 'en': returns [englishName] (English common name)
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
  ///
  /// // With Arabic locale (default)
  /// print(MENA.defaultLocale); // 'ar'
  /// print(country?.getCountryName); // "الإمارات"
  ///
  /// // Switch to English locale
  /// MENA.setDefaultLocale('en');
  /// print(country?.getCountryName); // "United Arab Emirates"
  /// ```
  ///
  /// **Use Cases:**
  /// - Dynamic UI that adapts to current locale
  /// - Internationalized applications
  /// - User preference-based display
  ///
  /// @since 1.0.0
  String get getCountryName => MENA._getValueByLocal(
    arabicValue: country.arabicName,
    englishValue: country.englishName,
  );

  /// Returns the official country name based on the current default locale in MENA.
  ///
  /// **Returns:** The appropriate official name based on [MENA.defaultLocale]
  /// - If locale is 'ar': returns [officalAR] (Arabic official name)
  /// - If locale is 'en': returns [officalEN] (English official name)
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
  ///
  /// // With Arabic locale (default)
  /// print(MENA.defaultLocale); // 'ar'
  /// print(country?.getOfficialName); // "الإمارات العربية المتحدة"
  ///
  /// // Switch to English locale
  /// MENA.setDefaultLocale('en');
  /// print(country?.getOfficialName); // "United Arab Emirates"
  /// ```
  ///
  /// **Use Cases:**
  /// - Official documents and forms
  /// - Government applications
  /// - Legal documentation
  /// - Formal communications
  ///
  /// @since 1.0.0
  String get getOfficialName => MENA._getValueByLocal(
    arabicValue: country.officalAR,
    englishValue: country.officalEN,
  );

  /// Returns the capital city name based on the current default locale in MENA.
  ///
  /// **Returns:** The appropriate capital name based on [MENA.defaultLocale]
  /// - If locale is 'ar': returns [arabicCapital] (Arabic capital name)
  /// - If locale is 'en': returns [englishCapital] (English capital name)
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
  ///
  /// // With Arabic locale (default)
  /// print(MENA.defaultLocale); // 'ar'
  /// print(country?.getCapitalName); // "أبو ظبي"
  ///
  /// // Switch to English locale
  /// MENA.setDefaultLocale('en');
  /// print(country?.getCapitalName); // "Abu Dhabi"
  /// ```
  ///
  /// **Use Cases:**
  /// - Geographic information displays
  /// - Educational applications
  /// - Travel and tourism interfaces
  /// - Location-based services
  ///
  /// @since 1.0.0
  String get getCapitalName => MENA._getValueByLocal(
    arabicValue: country.arabicCapital,
    englishValue: country.englishCapital,
  );

  /// Returns the full currency name based on the current default locale in MENA.
  ///
  /// **Returns:** The appropriate full name based on [MENA.defaultLocale]
  /// - If locale is 'ar': returns [fullArabicName] (Arabic full name)
  /// - If locale is 'en': returns [fullEnglishName] (English full name)
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
  ///
  /// // With Arabic locale (default)
  /// print(MENA.defaultLocale); // 'ar'
  /// print(country?.getCurrencyName); // "درهم إماراتي"
  ///
  /// // Switch to English locale
  /// MENA.setDefaultLocale('en');
  /// print(country?.getCurrencyName); // "Emirati Dirham"
  /// ```
  ///
  /// **Use Cases:**
  /// - Dynamic UI that adapts to current locale
  /// - Internationalized financial applications
  /// - User preference-based currency display
  String get getCurrencyName => MENA._getValueByLocal(
    arabicValue: currency.fullArabicName,
    englishValue: currency.fullEnglishName,
  );

  /// Returns the currency symbol based on the current default locale in MENA.
  ///
  /// **Returns:** The appropriate symbol based on [MENA.defaultLocale]
  /// - If locale is 'ar': returns [arabicSymbol] (Arabic symbol like "د.إ")
  /// - If locale is 'en': returns [englishSymbol] (English symbol like "AED")
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
  ///
  /// // With Arabic locale (default)
  /// print(MENA.defaultLocale); // 'ar'
  /// print(country?.getCurrencySymbol); // "د.إ"
  ///
  /// // Switch to English locale
  /// MENA.setDefaultLocale('en');
  /// print(country?.getCurrencySymbol); // "AED"
  /// ```
  ///
  /// **Use Cases:**
  /// - Price display in e-commerce applications
  /// - Financial dashboards
  /// - Currency conversion interfaces
  String get getCurrencySymbol => MENA._getValueByLocal(
    arabicValue: currency.arabicSymbol,
    englishValue: currency.englishSymbol,
  );

  /// International dialing code with leading '+' symbol.
  ///
  /// Returns the formatted international dialing code ready for display
  /// in phone number inputs, contact forms, and user interfaces.
  ///
  /// **Format:** `+{dialCode}` (e.g., "+971", "+966", "+20")
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
  /// final formatted = country?.dialCodeWithPlus; // "+971"
  ///
  /// // Use in phone number display:
  /// Text('Call: ${country?.dialCodeWithPlus} 501234567');
  ///
  /// // Use in dropdown:
  /// Text('${country?.dialCodeWithPlus} ${country?.getName}');
  /// ```
  ///
  /// **Use Cases:**
  /// - Phone number formatting and display
  /// - Country code dropdowns and selectors
  /// - International contact forms
  /// - Call-to-action buttons with phone numbers
  String get dialCodeWithPlus => '+${country.dialCode}';

  /// High-quality SVG flag URL provided by flagcdn.com.
  ///
  /// Returns a direct URL to the country's flag in SVG format.
  /// The service is free, fast, and provides consistent flag designs.
  ///
  /// **URL Format:** `https://flagcdn.com/{countryCode}.svg`
  ///
  /// **Example:**
  /// ```dart
  /// final palestine = MENA.getBy(query: 'ps', key: MenaKeys.code);
  /// final flagImage = palestine?.getSvgUrl; // "https://flagcdn.com/ps.svg"
  ///
  /// // Use in Flutter Image widget:
  /// Image.network(flagImage)
  ///
  /// // Use in HTML img tag:
  /// <img src="$flagImage" alt="Palestine Flag" />
  /// ```
  ///
  /// **Note:** For specific sizes, use [getEmojiUrl] with [EmojiSize] enum.
  /// Check [flagcdn.com](https://flagcdn.com) for more information.
  Uri get getSvgUrl => Uri.parse('https://flagcdn.com/${country.code}.svg');

  /// Returns an emoji flag URL with the specified [size].
  ///
  /// Provides access to different emoji flag image resolutions for various use cases.
  /// All sizes maintain the standard 4:3 aspect ratio and are served as PNG format.
  /// Perfect for emoji-style flag displays and modern UI designs.
  ///
  /// **Parameters:**
  /// - [size]: The desired flag dimensions from [EmojiSize] enum
  ///
  /// **Returns:** A formatted URL string for the emoji flag image
  ///
  /// **Example:**
  /// ```dart
  /// final palestine = MENA.getBy(query: 'ps', key: MenaKeys.code);
  ///
  /// // Small icon for lists
  /// final smallFlag = palestine?.getEmojiUrl(EmojiSize.size24x18);
  ///
  /// // Medium size for cards
  /// final mediumFlag = palestine?.getEmojiUrl(EmojiSize.size48x36);
  ///
  /// // Large size for headers
  /// final largeFlag = palestine?.getEmojiUrl(EmojiSize.size128x96);
  /// ```
  ///
  /// **Use Cases:**
  /// - Emoji-style flag displays
  /// - Modern UI with icon flags
  /// - High-DPI screen optimization
  /// - Performance optimization (smaller sizes for lists)
  /// - Chat applications and social features
  ///
  /// **URL Format:** `https://flagcdn.com/{dimensions}/{countryCode}.png`
  Uri getEmojiUrl(EmojiSize size) =>
      Uri.parse('https://flagcdn.com/${size.dimensions}/${country.code}.png');

  /// Returns an image flag URL with the specified [size] and [type].
  ///
  /// Provides access to width-based and height-based flag images with automatic
  /// aspect ratio calculation. Supports both width (w) and height (h) based sizing
  /// in multiple image formats.
  ///
  /// **Parameters:**
  /// - [size]: The desired flag size from [ImageSize] enum (width or height based)
  /// - [type]: The image format from [ImageType] enum (defaults to JPEG)
  ///
  /// **Returns:** A formatted URL string for the flag image
  ///
  /// **Example:**
  /// ```dart
  /// final palestine = MENA.getBy(query: 'ps', key: MenaKeys.code);
  ///
  /// // JPEG format (default) - smaller file size
  /// final jpegFlag = palestine?.getImageUrl(ImageSize.w160);
  /// final jpegExplicit = palestine?.getImageUrl(ImageSize.w160, ImageType.jpeg);
  ///
  /// // PNG format - lossless quality
  /// final pngFlag = palestine?.getImageUrl(ImageSize.w160, ImageType.png);
  ///
  /// // Height-based sizing with PNG
  /// final heightFlag = palestine?.getImageUrl(ImageSize.h120, ImageType.png);
  /// ```
  ///
  /// **Use Cases:**
  /// - **JPEG**: Web performance, bandwidth optimization, large displays
  /// - **PNG**: High-quality displays, sharp edges, UI elements
  /// - Flexible width or height-based layouts
  /// - Responsive images with constraint-based sizing
  /// - Print-quality images with precise dimensions
  ///
  /// **URL Format:** `https://flagcdn.com/{sizeParam}/{countryCode}.{extension}`
  Uri getImageUrl(
    ImageSize size, [
    ImageType type = ImageType.jpeg,
  ]) => Uri.parse(
    'https://flagcdn.com/${size.sizeParam}/${country.code}.${type.extension}',
  );

  /// Returns a string representation of the [MenaItemModel].
  ///
  /// **Returns:** A string representation of the [MenaItemModel]
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
  /// print(country?.toString()); // "Country{country: Country{...}, currency: Currency{...}}"
  /// ```
  @override
  String toString() =>
      'Country{country: ${country.toString()}, currency: $currency}';

  /// Serializes this model to a JSON-compatible map.
  ///
  /// Converts all properties to a nested map structure suitable for
  /// JSON encoding, API transmission, or local storage.
  ///
  /// **Returns:** A `Map<String, dynamic>` containing all country data.
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
  /// final json = country?.toJson();
  ///
  /// // Result:
  /// // {
  /// //   'country': {
  /// //     'englishName': 'United Arab Emirates',
  /// //     'arabicName': 'الإمارات',
  /// //     'officalEN': 'United Arab Emirates',
  /// //     'officalAR': 'الإمارات العربية المتحدة',
  /// //     'englishCapital': 'Abu Dhabi',
  /// //     'arabicCapital': 'أبو ظبي'
  /// //   },
  /// //   'currency': {
  /// //     'code': 'AED',
  /// //     'enAdjective': 'Emirati',
  /// //     'arAdjective': 'إماراتي',
  /// //     'type': 'dirham'
  /// //   }
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
    'country': country.toJson(),
    'currency': currency.toJson(),
  };

  /// Returns true if this [MenaItemModel] is equal to another [MenaItemModel].
  ///
  /// **Returns:** True if the [MenaItemModel]s are equal, false otherwise
  ///
  /// **Example:**
  /// ```dart
  /// final country = MENA.getBy(query: 'ae', key: MenaKeys.code);
  /// final other = MENA.getBy(query: 'ae', key: MenaKeys.code);
  /// print(country == other); // true
  /// ```
  ///
  /// **Use Cases:**
  /// - Equality checks in tests
  /// - Data integrity checks
  /// - Performance optimization
  ///
  /// @since 1.0.0
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenaItemModel &&
          runtimeType == other.runtimeType &&
          country == other.country &&
          currency == other.currency;

  @override
  int get hashCode => country.hashCode ^ currency.hashCode;
}
