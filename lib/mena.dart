/// MENA: Middle East and North Africa country data and utilities.
///
/// This package provides a comprehensive, offline dataset of MENA countries
/// with convenient search utilities and localized data. Perfect for building
/// international applications, country selectors, phone number inputs, and
/// region-specific features.
///
/// ## Key Features:
/// - **Offline Data**: No network calls required - all data is bundled
/// - **Localized Names**: Both Arabic and English names (common + official)
/// - **Multiple Search Methods**: Find countries by code, name, dial code, or currency
/// - **Flag Support**: Built-in SVG flag URLs via flagcdn.com
/// - **JSON Serialization**: Easy integration with APIs and storage
///
/// ## Quick Start:
/// ```dart
/// import 'package:mena/mena.dart';
///
/// // Find a country by ISO code
/// final country = MENA.getByCode('ae');
/// print(country?.countryName.en); // "United Arab Emirates"
///
/// // Get all Middle East countries
/// final middleEast = MENA.middleEast;
/// print('${middleEast.length} countries'); // "13 countries"
/// ```
///
/// @since 1.0.0
/// @author Mohamed Maher
library;

/// Core library for MENA
export 'src/mena_core.dart';

/// Models for MENA
export 'src/models/mena_item_model.dart';
export 'src/models/country.dart';
export 'src/models/currency.dart';
export 'src/models/currency_type.dart';
export 'src/models/emoji_size.dart';
export 'src/models/image_size.dart';
export 'src/models/image_type.dart';

/// Data sources for MENA
export 'src/data/mena_data.dart';
