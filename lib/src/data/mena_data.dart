import '../models/mena_item_model.dart';
import '../models/country.dart';
import '../models/currency.dart';
import '../models/currency_type.dart';

/// Static in-memory dataset for MENA countries.
///
/// The lists below are immutable and safe to reuse across your app.
class MenaData {
  static final List<MenaItemModel> northAfricaCountries = const [
    MenaItemModel(
      country: Country(
        arabicName: 'مصر',
        englishName: 'Egypt',
        officalAR: 'جمهورية مصر العربية',
        officalEN: 'Arab Republic of Egypt',
        englishCapital: 'Cairo',
        arabicCapital: 'القاهرة',
        dialCode: '20',
        code: 'eg',
      ),
      currency: Currency(
        code: 'EGP',
        enAdjective: 'Egyptian',
        arAdjective: 'مصري',
        type: CurrencyType.pound,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'السودان',
        englishName: 'Sudan',
        officalAR: 'جمهورية السودان',
        officalEN: 'Republic of the Sudan',
        englishCapital: 'Khartoum',
        arabicCapital: 'الخرطوم',
        dialCode: '249',
        code: 'sd',
      ),
      currency: Currency(
        code: 'SDG',
        enAdjective: 'Sudanese',
        arAdjective: 'سوداني',
        type: CurrencyType.pound,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'ليبيا',
        englishName: 'Libya',
        officalAR: 'دولة ليبيا',
        officalEN: 'State of Libya',
        englishCapital: 'Tripoli',
        arabicCapital: 'طرابلس',
        dialCode: '218',
        code: 'ly',
      ),
      currency: Currency(
        code: 'LYD',
        enAdjective: 'Libyan',
        arAdjective: 'ليبي',
        type: CurrencyType.dinar,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'تونس',
        englishName: 'Tunisia',
        officalAR: 'الجمهورية التونسية',
        officalEN: 'Republic of Tunisia',
        englishCapital: 'Tunis',
        arabicCapital: 'تونس',
        dialCode: '216',
        code: 'tn',
      ),
      currency: Currency(
        code: 'TND',
        enAdjective: 'Tunisian',
        arAdjective: 'تونسي',
        type: CurrencyType.dinar,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'الجزائر',
        englishName: 'Algeria',
        officalAR: 'الجمهورية الجزائرية الديمقراطية الشعبية',
        officalEN: "People's Democratic Republic of Algeria",
        englishCapital: 'Algiers',
        arabicCapital: 'الجزائر',
        dialCode: '213',
        code: 'dz',
      ),
      currency: Currency(
        code: 'DZD',
        enAdjective: 'Algerian',
        arAdjective: 'جزائري',
        type: CurrencyType.dinar,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'المغرب',
        englishName: 'Morocco',
        officalAR: 'المملكة المغربية',
        officalEN: 'Kingdom of Morocco',
        englishCapital: 'Rabat',
        arabicCapital: 'الرباط',
        dialCode: '212',
        code: 'ma',
      ),
      currency: Currency(
        code: 'MAD',
        enAdjective: 'Moroccan',
        arAdjective: 'مغربي',
        type: CurrencyType.dirham,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'موريتانيا',
        englishName: 'Mauritania',
        officalAR: 'الجمهورية الإسلامية الموريتانية',
        officalEN: 'Islamic Republic of Mauritania',
        englishCapital: 'Nouakchott',
        arabicCapital: 'نواكشوط',
        dialCode: '222',
        code: 'mr',
      ),
      currency: Currency(
        code: 'MRU',
        enAdjective: 'Mauritanian',
        arAdjective: 'موريتانية',
        type: CurrencyType.ouguiya,
      ),
    ),
  ];

  static final List<MenaItemModel> middleEastCountries = const [
    MenaItemModel(
      country: Country(
        arabicName: 'السعودية',
        englishName: 'Saudi Arabia',
        officalAR: 'المملكة العربية السعودية',
        officalEN: 'Kingdom of Saudi Arabia',
        englishCapital: 'Riyadh',
        arabicCapital: 'الرياض',
        dialCode: '966',
        code: 'sa',
      ),
      currency: Currency(
        code: 'SAR',
        enAdjective: 'Saudi',
        arAdjective: 'سعودي',
        type: CurrencyType.riyal,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'الإمارات',
        englishName: 'United Arab Emirates',
        officalAR: 'الإمارات العربية المتحدة',
        officalEN: 'United Arab Emirates',
        englishCapital: 'Abu Dhabi',
        arabicCapital: 'أبو ظبي',
        dialCode: '971',
        code: 'ae',
      ),
      currency: Currency(
        code: 'AED',
        enAdjective: 'Emirati',
        arAdjective: 'إماراتي',
        type: CurrencyType.dirham,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'الكويت',
        englishName: 'Kuwait',
        officalAR: 'دولة الكويت',
        officalEN: 'State of Kuwait',
        englishCapital: 'Kuwait City',
        arabicCapital: 'مدينة الكويت',
        dialCode: '965',
        code: 'kw',
      ),
      currency: Currency(
        code: 'KWD',
        enAdjective: 'Kuwaiti',
        arAdjective: 'كويتي',
        type: CurrencyType.dinar,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'قطر',
        englishName: 'Qatar',
        officalAR: 'دولة قطر',
        officalEN: 'State of Qatar',
        englishCapital: 'Doha',
        arabicCapital: 'الدوحة',
        dialCode: '974',
        code: 'qa',
      ),
      currency: Currency(
        code: 'QAR',
        enAdjective: 'Qatari',
        arAdjective: 'قطري',
        type: CurrencyType.riyal,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'البحرين',
        englishName: 'Bahrain',
        officalAR: 'مملكة البحرين',
        officalEN: 'Kingdom of Bahrain',
        englishCapital: 'Manama',
        arabicCapital: 'المنامة',
        dialCode: '973',
        code: 'bh',
      ),
      currency: Currency(
        code: 'BHD',
        enAdjective: 'Bahraini',
        arAdjective: 'بحريني',
        type: CurrencyType.dinar,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'عُمان',
        englishName: 'Oman',
        officalAR: 'سلطنة عُمان',
        officalEN: 'Sultanate of Oman',
        englishCapital: 'Muscat',
        arabicCapital: 'مسقط',
        dialCode: '968',
        code: 'om',
      ),
      currency: Currency(
        code: 'OMR',
        enAdjective: 'Omani',
        arAdjective: 'عماني',
        type: CurrencyType.riyal,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'الأردن',
        englishName: 'Jordan',
        officalAR: 'المملكة الأردنية الهاشمية',
        officalEN: 'Hashemite Kingdom of Jordan',
        englishCapital: 'Amman',
        arabicCapital: 'عمان',
        dialCode: '962',
        code: 'jo',
      ),
      currency: Currency(
        code: 'JOD',
        enAdjective: 'Jordanian',
        arAdjective: 'أردني',
        type: CurrencyType.dinar,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'لبنان',
        englishName: 'Lebanon',
        officalAR: 'الجمهورية اللبنانية',
        officalEN: 'Lebanese Republic',
        englishCapital: 'Beirut',
        arabicCapital: 'بيروت',
        dialCode: '961',
        code: 'lb',
      ),
      currency: Currency(
        code: 'LBP',
        enAdjective: 'Lebanese',
        arAdjective: 'لبنانية',
        type: CurrencyType.pound,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'فلسطين',
        englishName: 'Palestine',
        officalAR: 'دولة فلسطين',
        officalEN: 'State of Palestine',
        englishCapital: 'Jerusalem',
        arabicCapital: 'القدس',
        dialCode: '970',
        code: 'ps',
      ),
      currency: Currency(
        code: 'ILS',
        enAdjective: 'Palestinian',
        arAdjective: 'فلسطيني',
        type: CurrencyType.shekel,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'العراق',
        englishName: 'Iraq',
        officalAR: 'جمهورية العراق',
        officalEN: 'Republic of Iraq',
        englishCapital: 'Baghdad',
        arabicCapital: 'بغداد',
        dialCode: '964',
        code: 'iq',
      ),
      currency: Currency(
        code: 'IQD',
        enAdjective: 'Iraqi',
        arAdjective: 'عراقي',
        type: CurrencyType.dinar,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'سوريا',
        englishName: 'Syria',
        officalAR: 'الجمهورية العربية السورية',
        officalEN: 'Syrian Arab Republic',
        englishCapital: 'Damascus',
        arabicCapital: 'دمشق',
        dialCode: '963',
        code: 'sy',
      ),
      currency: Currency(
        code: 'SYP',
        enAdjective: 'Syrian',
        arAdjective: 'سورية',
        type: CurrencyType.pound,
      ),
    ),
    MenaItemModel(
      country: Country(
        arabicName: 'اليمن',
        englishName: 'Yemen',
        officalAR: 'الجمهورية اليمنية',
        officalEN: 'Republic of Yemen',
        englishCapital: 'Sana\'a',
        arabicCapital: 'صنعاء',
        dialCode: '967',
        code: 'ye',
      ),
      currency: Currency(
        code: 'YER',
        enAdjective: 'Yemeni',
        arAdjective: 'يمني',
        type: CurrencyType.riyal,
      ),
    ),
  ];
}
