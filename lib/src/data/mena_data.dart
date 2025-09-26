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
        arabicName: 'مصر',
        englishName: 'Egypt',
        officalAR: 'جمهورية مصر العربية',
        officalEN: 'Arab Republic of Egypt',
      ),
      currency: Currency(
        code: 'EGP',
        enAdjective: 'Egyptian',
        arAdjective: 'مصري',
        type: CurrencyType.pound,
      ),
      dialCode: '20',
      code: 'eg',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'السودان',
        englishName: 'Sudan',
        officalAR: 'جمهورية السودان',
        officalEN: 'Republic of the Sudan',
      ),
      currency: Currency(
        code: 'SDG',
        enAdjective: 'Sudanese',
        arAdjective: 'سوداني',
        type: CurrencyType.pound,
      ),
      dialCode: '249',
      code: 'sd',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'ليبيا',
        englishName: 'Libya',
        officalAR: 'دولة ليبيا',
        officalEN: 'State of Libya',
      ),
      currency: Currency(
        code: 'LYD',
        enAdjective: 'Libyan',
        arAdjective: 'ليبي',
        type: CurrencyType.dinar,
      ),
      dialCode: '218',
      code: 'ly',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'تونس',
        englishName: 'Tunisia',
        officalAR: 'الجمهورية التونسية',
        officalEN: 'Republic of Tunisia',
      ),
      currency: Currency(
        code: 'TND',
        enAdjective: 'Tunisian',
        arAdjective: 'تونسي',
        type: CurrencyType.dinar,
      ),
      dialCode: '216',
      code: 'tn',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'الجزائر',
        englishName: 'Algeria',
        officalAR: 'الجمهورية الجزائرية الديمقراطية الشعبية',
        officalEN: "People's Democratic Republic of Algeria",
      ),
      currency: Currency(
        code: 'DZD',
        enAdjective: 'Algerian',
        arAdjective: 'جزائري',
        type: CurrencyType.dinar,
      ),
      dialCode: '213',
      code: 'dz',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'المغرب',
        englishName: 'Morocco',
        officalAR: 'المملكة المغربية',
        officalEN: 'Kingdom of Morocco',
      ),
      currency: Currency(
        code: 'MAD',
        enAdjective: 'Moroccan',
        arAdjective: 'مغربي',
        type: CurrencyType.dirham,
      ),
      dialCode: '212',
      code: 'ma',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'موريتانيا',
        englishName: 'Mauritania',
        officalAR: 'الجمهورية الإسلامية الموريتانية',
        officalEN: 'Islamic Republic of Mauritania',
      ),
      currency: Currency(
        code: 'MRU',
        enAdjective: 'Mauritanian',
        arAdjective: 'موريتانية',
        type: CurrencyType.ouguiya,
      ),
      dialCode: '222',
      code: 'mr',
    ),
  ];

  static final List<MenaItemModel> middleEastCountries = const [
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'السعودية',
        englishName: 'Saudi Arabia',
        officalAR: 'المملكة العربية السعودية',
        officalEN: 'Kingdom of Saudi Arabia',
      ),
      currency: Currency(
        code: 'SAR',
        enAdjective: 'Saudi',
        arAdjective: 'سعودي',
        type: CurrencyType.riyal,
      ),
      dialCode: '966',
      code: 'sa',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'الإمارات',
        englishName: 'United Arab Emirates',
        officalAR: 'الإمارات العربية المتحدة',
        officalEN: 'United Arab Emirates',
      ),
      currency: Currency(
        code: 'AED',
        enAdjective: 'Emirati',
        arAdjective: 'إماراتي',
        type: CurrencyType.dirham,
      ),
      dialCode: '971',
      code: 'ae',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'الكويت',
        englishName: 'Kuwait',
        officalAR: 'دولة الكويت',
        officalEN: 'State of Kuwait',
      ),
      currency: Currency(
        code: 'KWD',
        enAdjective: 'Kuwaiti',
        arAdjective: 'كويتي',
        type: CurrencyType.dinar,
      ),
      dialCode: '965',
      code: 'kw',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'قطر',
        englishName: 'Qatar',
        officalAR: 'دولة قطر',
        officalEN: 'State of Qatar',
      ),
      currency: Currency(
        code: 'QAR',
        enAdjective: 'Qatari',
        arAdjective: 'قطري',
        type: CurrencyType.riyal,
      ),
      dialCode: '974',
      code: 'qa',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'البحرين',
        englishName: 'Bahrain',
        officalAR: 'مملكة البحرين',
        officalEN: 'Kingdom of Bahrain',
      ),
      currency: Currency(
        code: 'BHD',
        enAdjective: 'Bahraini',
        arAdjective: 'بحريني',
        type: CurrencyType.dinar,
      ),
      dialCode: '973',
      code: 'bh',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'عُمان',
        englishName: 'Oman',
        officalAR: 'سلطنة عُمان',
        officalEN: 'Sultanate of Oman',
      ),
      currency: Currency(
        code: 'OMR',
        enAdjective: 'Omani',
        arAdjective: 'عماني',
        type: CurrencyType.riyal,
      ),
      dialCode: '968',
      code: 'om',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'الأردن',
        englishName: 'Jordan',
        officalAR: 'المملكة الأردنية الهاشمية',
        officalEN: 'Hashemite Kingdom of Jordan',
      ),
      currency: Currency(
        code: 'JOD',
        enAdjective: 'Jordanian',
        arAdjective: 'أردني',
        type: CurrencyType.dinar,
      ),
      dialCode: '962',
      code: 'jo',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'لبنان',
        englishName: 'Lebanon',
        officalAR: 'الجمهورية اللبنانية',
        officalEN: 'Lebanese Republic',
      ),
      currency: Currency(
        code: 'LBP',
        enAdjective: 'Lebanese',
        arAdjective: 'لبنانية',
        type: CurrencyType.pound,
      ),
      dialCode: '961',
      code: 'lb',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'فلسطين',
        englishName: 'Palestine',
        officalAR: 'دولة فلسطين',
        officalEN: 'State of Palestine',
      ),
      currency: Currency(
        code: 'ILS',
        enAdjective: 'Palestinian',
        arAdjective: 'فلسطيني',
        type: CurrencyType.shekel,
      ),
      dialCode: '970',
      code: 'ps',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'العراق',
        englishName: 'Iraq',
        officalAR: 'جمهورية العراق',
        officalEN: 'Republic of Iraq',
      ),
      currency: Currency(
        code: 'IQD',
        enAdjective: 'Iraqi',
        arAdjective: 'عراقي',
        type: CurrencyType.dinar,
      ),
      dialCode: '964',
      code: 'iq',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'سوريا',
        englishName: 'Syria',
        officalAR: 'الجمهورية العربية السورية',
        officalEN: 'Syrian Arab Republic',
      ),
      currency: Currency(
        code: 'SYP',
        enAdjective: 'Syrian',
        arAdjective: 'سورية',
        type: CurrencyType.pound,
      ),
      dialCode: '963',
      code: 'sy',
    ),
    MenaItemModel(
      countryName: CountryName(
        arabicName: 'اليمن',
        englishName: 'Yemen',
        officalAR: 'الجمهورية اليمنية',
        officalEN: 'Republic of Yemen',
      ),
      currency: Currency(
        code: 'YER',
        enAdjective: 'Yemeni',
        arAdjective: 'يمني',
        type: CurrencyType.riyal,
      ),
      dialCode: '967',
      code: 'ye',
    ),
  ];
}
