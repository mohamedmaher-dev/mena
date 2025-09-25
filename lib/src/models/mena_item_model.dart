import 'country_name.dart';

/// Represents a MENA country item with localized names and basic metadata.
class MenaItemModel {
  /// Localized country names and official forms.
  final CountryName countryName;

  /// ISO 4217 currency code (e.g. `AED`).
  final String currency;

  /// International dialing code without the leading `+` (e.g. `971`).
  final String dialCode;

  /// ISO 3166-1 alpha-2 lowercased country code (e.g. `ae`).
  final String code;

  /// Creates a new immutable [MenaItemModel].
  const MenaItemModel({
    required this.countryName,
    required this.currency,
    required this.dialCode,
    required this.code,
  });

  /// A public SVG flag URL hosted by flagcdn.com for this country.
  String get svgUrl => 'https://flagcdn.com/$code.svg';

  @override
  String toString() =>
      'Country{countryName: ${countryName.toString()}, currency: $currency, dialCode: $dialCode, code: $code}';

  /// Serializes this model to a JSON map.
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
