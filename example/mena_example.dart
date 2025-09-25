import 'package:mena/mena.dart';

void main() {
  // Find by ISO lowercased code
  final palestine = MENA.getByCode('ps');

  // Get the flag SVG URL
  print(palestine?.svgUrl);

  // Find by English name (partial, case-insensitive)
  final morocco = MENA.getByName('Morocco');
  print(morocco?.countryName.officalEN);

  // Find by dial code without the leading '+'
  final uae = MENA.getByDialCode('971');
  print(uae?.currency); // AED

  // Find by currency code
  final saudi = MENA.getByCurrencyCode('SAR');
  print(saudi?.countryName.en); // Saudi Arabia
}
