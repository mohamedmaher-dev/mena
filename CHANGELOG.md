## 1.0.1 - 2025-01-XX

### 🧪 Enhanced Testing & Quality Assurance

- **Comprehensive Test Suite**: Added 102 tests covering all package functionality
  - **Core Tests**: Locale management, data collections, search functionality (47 tests)
  - **Model Tests**: Country, Currency, MenaItemModel validation (18 tests)
  - **Enum Tests**: CurrencyType, EmojiSize, ImageSize, ImageType, MenaKeys (18 tests)
  - **Data Integrity Tests**: All 19 countries validation, edge cases, performance (19 tests)
- **Palestine Validation**: Comprehensive tests ensuring correct Palestine data (ILS currency, Jerusalem capital, +970 dial code)
- **Performance Testing**: Efficient lookup validation (1000+ operations under 100ms)
- **Unicode Support**: Full Arabic text handling and validation
- **Error Handling**: Comprehensive edge case coverage for production reliability
- **Code Quality**: Zero linting errors, proper test organization across 4 test files

## 1.0.0 - 2025-01-XX

### 🚀 Initial Release - Complete MENA Support with Arabic-First Localization

- `MenaItemModel.code` and `MenaItemModel.dialCode` moved into `Country` as `country.code` and `country.dialCode`
- `countryName` field renamed to `country` (type `Country`)
- Removed internal search enum file; searching APIs remain the same

#### **🌟 Core Features**

- **Complete MENA Dataset**: 19 countries across Middle East and North Africa
- **Arabic-First Localization**: Defaults to Arabic with English support
- **Dynamic Locale Switching**: `MENA.setDefaultLocale('ar'|'en')` for runtime locale changes
- **Advanced Flag System**: SVG, PNG (emoji-style), and JPEG/PNG with flexible sizing
- **Zero Dependencies**: Pure Dart implementation, offline-first

#### **🔍 Unified Search Method**

- **`getBy(query: String, key: MenaKeys)`**: Unified search with specific keys
  - `MenaKeys.code`: ISO 3166-1 alpha-2 country codes
  - `MenaKeys.englishName` / `MenaKeys.arabicName`: Country names
  - `MenaKeys.dialCode`: International dialing codes
  - `MenaKeys.currencyCode`: ISO 4217 currency codes
  - `MenaKeys.capitalEn` / `MenaKeys.capitalAr`: Capital city names
  - `MenaKeys.officalEn` / `MenaKeys.officalAr`: Official country names

#### **🌐 Locale-Aware API**

- **MenaItemModel.getCountryName / getOfficialName / getCapitalName**: Locale-aware country names
- **MenaItemModel.getCurrencyName / getCurrencySymbol**: Locale-aware currency names and symbols

#### **💰 Enhanced Currency System**

- **Separate Symbols**: `englishSymbol` (ISO codes) and `arabicSymbol` (traditional symbols)
- **Localized Names**: Full English and Arabic currency names
- **Country Adjectives**: Private `_enAdjective`/`_arAdjective` properties

#### **📊 Data Collections**

- **`MENA.allCountries`**: Complete list (19 countries)
- **`MENA.middleEast`**: Middle Eastern countries (12 countries)
- **`MENA.northernAfrica`**: North African countries (7 countries)

#### **🏗️ Models**

- **MenaItemModel**: Core country data with comprehensive flag URL support
- **Country**: Localized names + metadata (`code`, `dialCode`, capitals)
- **Currency**: Complete currency data with English/Arabic symbols and names
- **CurrencyType**: Currency type classification with `englishName`/`arabicName` properties

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
