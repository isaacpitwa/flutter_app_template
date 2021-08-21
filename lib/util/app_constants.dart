
import 'package:flutter_app_template/data/model/response/language_model.dart';

class AppConstants {
  static const String BASE_URL = 'https://website.com/';
  static const String THEME = 'theme';

 // Localization
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: '', languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: '', languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
  ];
}