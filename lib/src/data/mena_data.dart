import '../../mena.dart';

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
      currency: 'EGP',
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
      currency: 'SDG',
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
      currency: 'LYD',
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
      currency: 'TND',
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
      currency: 'DZD',
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
      currency: 'MAD',
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
      currency: 'MRU',
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
      currency: 'SAR',
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
      currency: 'AED',
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
      currency: 'KWD',
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
      currency: 'QAR',
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
      currency: 'BHD',
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
      currency: 'OMR',
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
      currency: 'JOD',
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
      currency: 'LBP',
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
      currency: 'ILS',
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
      currency: 'IQD',
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
      currency: 'SYP',
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
      currency: 'YER',
      dialCode: '967',
      code: 'ye',
    ),
  ];
}
