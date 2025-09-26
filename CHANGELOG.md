## 1.0.0 - 2025-01-XX

### 🚀 Initial Release - Complete MENA Support with Arabic-First Localization

#### **🌟 Core Features**

- **Complete MENA Dataset**: 19 countries across Middle East and North Africa
- **Arabic-First Localization**: Defaults to Arabic with English support
- **Dynamic Locale Switching**: `MENA.setDefaultLocale('ar'|'en')` for runtime locale changes
- **Advanced Flag System**: SVG, PNG (emoji-style), and JPEG/PNG with flexible sizing
- **Zero Dependencies**: Pure Dart implementation, offline-first

#### **🔍 Search Methods**

- **`getByCode(String)`**: ISO 3166-1 alpha-2 country codes
- **`getByName(String)`**: Smart search that adapts to current locale
- **`getByEnglishName(String)`**: Explicit English name search
- **`getByArabicName(String)`**: Direct Arabic name search
- **`getByDialCode(String)`**: International dialing codes
- **`getByCurrencyCode(String)`**: ISO 4217 currency codes
- **`getByIndex(int)`**: Direct array access (0-18)

#### **🌐 Locale-Aware API**

- **CountryName.getName**: Returns name based on current locale
- **CurrencyType.getName**: Returns currency type based on current locale
- **Currency.getFullName**: Returns full currency name based on current locale
- **Currency.getSymbol**: Returns appropriate symbol based on current locale

#### **💰 Enhanced Currency System**

- **Separate Symbols**: `englishSymbol` (ISO codes) and `arabicSymbol` (traditional symbols)
- **Localized Names**: Full English and Arabic currency names
- **Country Adjectives**: Clear `enAdjective`/`arAdjective` properties

#### **📊 Data Collections**

- **`MENA.allCountries`**: Complete list (19 countries)
- **`MENA.middleEast`**: Middle Eastern countries (12 countries)
- **`MENA.northernAfrica`**: North African countries (7 countries)

#### **🏗️ Models**

- **MenaItemModel**: Core country data with comprehensive flag URL support
- **CountryName**: Localized names (`englishName`, `arabicName`, `officalEN`, `officalAR`)
- **Currency**: Complete currency data with locale-aware getters
- **CurrencyType**: Currency type classification with Arabic/English names

#### **🌍 Countries Included**

**Middle East (12):** Saudi Arabia, UAE, Kuwait, Qatar, Bahrain, Oman, Jordan, Lebanon, Palestine, Iraq, Syria, Yemen

**North Africa (7):** Egypt, Sudan, Libya, Tunisia, Algeria, Morocco, Mauritania

#### **⚙️ Technical Specifications**

- **Dart SDK**: ^3.9.2
- **Dependencies**: None (pure Dart)
- **Null Safety**: Complete null safety support
- **Performance**: Optimized for mobile and web applications
- **Platform Support**: Flutter (Android, iOS, Web, Desktop), Dart server-side

#### **📚 Documentation**

- **Comprehensive README**: Complete API reference with Arabic/English examples
- **Locale Management Guide**: Detailed examples of locale switching
- **Professional Examples**: Country selectors, phone inputs, currency displays
- **API Documentation**: Full Dartdoc with examples and use cases
