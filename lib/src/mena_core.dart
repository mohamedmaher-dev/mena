import '../mena.dart';
part 'models/search_enum.dart';

/// Provides utilities and data for Middle East and North Africa countries.
///
/// All collections exposed by this class are immutable lists that you can
/// iterate over or use to perform lookups. Use the `getBy*` helpers to find a
/// `MenaItemModel` by ISO lowercased country code, English name, international
/// dial code (without a leading +), or currency code.
class MENA {
  /// Private constructor to prevent instantiation. All members are static.
  MENA._();

  /// All MENA countries combined in a single list.
  static final List<MenaItemModel> allCountries =
      MenaData.middleEastCountries + MenaData.northAfricaCountries;

  /// North Africa countries only.
  static List<MenaItemModel> northernAfrica = MenaData.northAfricaCountries;

  /// Middle East countries only.
  static List<MenaItemModel> middleEast = MenaData.middleEastCountries;

  // Public methods ---------------------------------------------------------

  /// Returns the country at [index] from [allCountries], or `null` if out of
  /// range.
  static MenaItemModel? getByIndex(int index) =>
      (index >= 0 && index < allCountries.length) ? allCountries[index] : null;

  /// Finds a country by its ISO lowercased [code] (e.g. `ps`, `eg`).
  static MenaItemModel? getByCode(String code) =>
      _getBy(code, _SearchEnum.code);

  /// Finds a country by its English [name] (partial, case-insensitive).
  static MenaItemModel? getByName(String name) =>
      _getBy(name, _SearchEnum.name);

  /// Finds a country by its international [dialCode] without the leading `+`.
  static MenaItemModel? getByDialCode(String dialCode) =>
      _getBy(dialCode, _SearchEnum.dialCode);

  /// Finds a country by its [currencyCode] (e.g. `AED`, `SAR`).
  static MenaItemModel? getByCurrencyCode(String currencyCode) =>
      _getBy(currencyCode, _SearchEnum.currency);

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
    _SearchEnum.code => item.code,
    _SearchEnum.name => item.countryName.en,
    _SearchEnum.dialCode => item.dialCode,
    _SearchEnum.currency => item.currency,
  }.toLowerCase();
}
