/// Localized and official country names in English and Arabic.
class CountryName {
  /// Official country name in English.
  final String officalEN;

  /// Official country name in Arabic.
  final String officalAR;

  /// Common country name in English.
  final String en;

  /// Common country name in Arabic.
  final String ar;

  /// Creates a new immutable [CountryName].
  const CountryName({
    required this.officalEN,
    required this.officalAR,
    required this.ar,
    required this.en,
  });

  @override
  String toString() =>
      'CountryName{officalEN: $officalEN, officalAR: $officalAR, ar: $ar, en: $en}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryName &&
          runtimeType == other.runtimeType &&
          officalEN == other.officalEN &&
          officalAR == other.officalAR &&
          ar == other.ar &&
          en == other.en;

  @override
  int get hashCode =>
      officalEN.hashCode ^ officalAR.hashCode ^ ar.hashCode ^ en.hashCode;

  /// Serializes this model to a JSON map.
  Map<String, dynamic> toJson() => {
    'officalEN': officalEN,
    'officalAR': officalAR,
    'ar': ar,
    'en': en,
  };
}
