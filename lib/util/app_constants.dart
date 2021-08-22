
import 'package:flutter_app_template/data/model/response/language_model.dart';

class AppConstants {
  static const String BASE_URL = 'https://greathabib.com/';
  static const String THEME = 'theme';

 // API Endpoints
  static const String CONFIG_URI = 'api/v1/config';
  static const String REGISTRATION_URI = 'api/v1/auth/register';
  static const String LOGIN_URI = 'api/v1/auth/login';
  static const String FORGET_PASSWORD_URI = 'api/v1/auth/forgot-password';
  static const String TOKEN_URI = 'api/v1/customer/cm-firebase-token';


  // sharePreference
  static const String TOKEN = 'token';
  static const String USER = 'user';
  static const String USER_EMAIL = 'user_email';
  static const String USER_PASSWORD = 'user_password';
  static const String HOME_ADDRESS = 'home_address';
  static const String SEARCH_ADDRESS = 'search_address';
  static const String OFFICE_ADDRESS = 'office_address';
  static const String CART_LIST = 'cart_list';
  static const String CONFIG = 'config';
  static const String GUEST_MODE = 'guest_mode';
  static const String CURRENCY = 'currency';
  static const String LANG_KEY = 'lang';
  static const String TOPIC = 'app_name';


  // Localization
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: '', languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: '', languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
  ];
}