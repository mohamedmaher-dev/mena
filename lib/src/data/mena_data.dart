import '../models/mena_item_model.dart';
import '../models/country_name.dart';
import '../models/currency.dart';
import '../models/currency_type.dart';

/// Static in-memory dataset for MENA countries.
///
/// The lists below are immutable and safe to reuse across your app.
class MenaData {
  static final List<MenaItemModel> northAfricaCountries = const [
    MenaItemModel(
      countryName: CountryName(
        ar: 'مصر',
        en: 'Egypt',
        officalAR: 'جمهورية مصر العربية',
        officalEN: 'Arab Republic of Egypt',
      ),
      currency: Currency(
        code: 'EGP',
        en: 'Egyptian',
        ar: 'مصري',
        type: CurrencyType.pound,
      ),
      dialCode: '20',
      code: 'eg',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'السودان',
        en: 'Sudan',
        officalAR: 'جمهورية السودان',
        officalEN: 'Republic of the Sudan',
      ),
      currency: Currency(
        code: 'SDG',
        en: 'Sudanese',
        ar: 'سوداني',
        type: CurrencyType.pound,
      ),
      dialCode: '249',
      code: 'sd',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'ليبيا',
        en: 'Libya',
        officalAR: 'دولة ليبيا',
        officalEN: 'State of Libya',
      ),
      currency: Currency(
        code: 'LYD',
        en: 'Libyan',
        ar: 'ليبي',
        type: CurrencyType.dinar,
      ),
      dialCode: '218',
      code: 'ly',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'تونس',
        en: 'Tunisia',
        officalAR: 'الجمهورية التونسية',
        officalEN: 'Republic of Tunisia',
      ),
      currency: Currency(
        code: 'TND',
        en: 'Tunisian',
        ar: 'تونسي',
        type: CurrencyType.dinar,
      ),
      dialCode: '216',
      code: 'tn',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'الجزائر',
        en: 'Algeria',
        officalAR: 'الجمهورية الجزائرية الديمقراطية الشعبية',
        officalEN: "People's Democratic Republic of Algeria",
      ),
      currency: Currency(
        code: 'DZD',
        en: 'Algerian',
        ar: 'جزائري',
        type: CurrencyType.dinar,
      ),
      dialCode: '213',
      code: 'dz',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'المغرب',
        en: 'Morocco',
        officalAR: 'المملكة المغربية',
        officalEN: 'Kingdom of Morocco',
      ),
      currency: Currency(
        code: 'MAD',
        en: 'Moroccan',
        ar: 'مغربي',
        type: CurrencyType.dirham,
      ),
      dialCode: '212',
      code: 'ma',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'موريتانيا',
        en: 'Mauritania',
        officalAR: 'الجمهورية الإسلامية الموريتانية',
        officalEN: 'Islamic Republic of Mauritania',
      ),
      currency: Currency(
        code: 'MRU',
        en: 'Mauritanian',
        ar: 'موريتانية',
        type: CurrencyType.ouguiya,
      ),
      dialCode: '222',
      code: 'mr',
    ),
  ];

  static final List<MenaItemModel> middleEastCountries = const [
    MenaItemModel(
      countryName: CountryName(
        ar: 'السعودية',
        en: 'Saudi Arabia',
        officalAR: 'المملكة العربية السعودية',
        officalEN: 'Kingdom of Saudi Arabia',
      ),
      currency: Currency(
        code: 'SAR',
        en: 'Saudi',
        ar: 'سعودي',
        type: CurrencyType.riyal,
      ),
      dialCode: '966',
      code: 'sa',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'الإمارات',
        en: 'United Arab Emirates',
        officalAR: 'الإمارات العربية المتحدة',
        officalEN: 'United Arab Emirates',
      ),
      currency: Currency(
        code: 'AED',
        en: 'Emirati',
        ar: 'إماراتي',
        type: CurrencyType.dirham,
      ),
      dialCode: '971',
      code: 'ae',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'الكويت',
        en: 'Kuwait',
        officalAR: 'دولة الكويت',
        officalEN: 'State of Kuwait',
      ),
      currency: Currency(
        code: 'KWD',
        en: 'Kuwaiti',
        ar: 'كويتي',
        type: CurrencyType.dinar,
      ),
      dialCode: '965',
      code: 'kw',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'قطر',
        en: 'Qatar',
        officalAR: 'دولة قطر',
        officalEN: 'State of Qatar',
      ),
      currency: Currency(
        code: 'QAR',
        en: 'Qatari',
        ar: 'قطري',
        type: CurrencyType.riyal,
      ),
      dialCode: '974',
      code: 'qa',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'البحرين',
        en: 'Bahrain',
        officalAR: 'مملكة البحرين',
        officalEN: 'Kingdom of Bahrain',
      ),
      currency: Currency(
        code: 'BHD',
        en: 'Bahraini',
        ar: 'بحريني',
        type: CurrencyType.dinar,
      ),
      dialCode: '973',
      code: 'bh',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'عُمان',
        en: 'Oman',
        officalAR: 'سلطنة عُمان',
        officalEN: 'Sultanate of Oman',
      ),
      currency: Currency(
        code: 'OMR',
        en: 'Omani',
        ar: 'عماني',
        type: CurrencyType.riyal,
      ),
      dialCode: '968',
      code: 'om',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'الأردن',
        en: 'Jordan',
        officalAR: 'المملكة الأردنية الهاشمية',
        officalEN: 'Hashemite Kingdom of Jordan',
      ),
      currency: Currency(
        code: 'JOD',
        en: 'Jordanian',
        ar: 'أردني',
        type: CurrencyType.dinar,
      ),
      dialCode: '962',
      code: 'jo',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'لبنان',
        en: 'Lebanon',
        officalAR: 'الجمهورية اللبنانية',
        officalEN: 'Lebanese Republic',
      ),
      currency: Currency(
        code: 'LBP',
        en: 'Lebanese',
        ar: 'لبنانية',
        type: CurrencyType.pound,
      ),
      dialCode: '961',
      code: 'lb',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'فلسطين',
        en: 'Palestine',
        officalAR: 'دولة فلسطين',
        officalEN: 'State of Palestine',
      ),
      currency: Currency(
        code: 'ILS',
        en: 'Palestinian',
        ar: 'فلسطيني',
        type: CurrencyType.shekel,
      ),
      dialCode: '970',
      code: 'ps',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'العراق',
        en: 'Iraq',
        officalAR: 'جمهورية العراق',
        officalEN: 'Republic of Iraq',
      ),
      currency: Currency(
        code: 'IQD',
        en: 'Iraqi',
        ar: 'عراقي',
        type: CurrencyType.dinar,
      ),
      dialCode: '964',
      code: 'iq',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'سوريا',
        en: 'Syria',
        officalAR: 'الجمهورية العربية السورية',
        officalEN: 'Syrian Arab Republic',
      ),
      currency: Currency(
        code: 'SYP',
        en: 'Syrian',
        ar: 'سورية',
        type: CurrencyType.pound,
      ),
      dialCode: '963',
      code: 'sy',
    ),
    MenaItemModel(
      countryName: CountryName(
        ar: 'اليمن',
        en: 'Yemen',
        officalAR: 'الجمهورية اليمنية',
        officalEN: 'Republic of Yemen',
      ),
      currency: Currency(
        code: 'YER',
        en: 'Yemeni',
        ar: 'يمني',
        type: CurrencyType.riyal,
      ),
      dialCode: '967',
      code: 'ye',
    ),
  ];
}
