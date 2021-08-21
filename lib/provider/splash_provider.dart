import 'package:flutter/material.dart';
import 'package:flutter_app_template/data/model/response/base/api_response.dart';
import 'package:flutter_app_template/data/model/response/config_model.dart';
import 'package:flutter_app_template/data/repository/splash_repo.dart';
import 'package:flutter_app_template/helper/api_checker.dart';

class SplashProvider extends ChangeNotifier {
  final SplashRepo splashRepo;
  SplashProvider({@required this.splashRepo});

  ConfigModel _configModel;
  // BaseUrls _baseUrls;
  CurrencyList _myCurrency;

  int _currencyIndex;
  // PackageInfo _packageInfo;
  bool _hasConnection = true;
  bool _fromSetting = false;
  bool _firstTimeConnectionCheck = true;

  // ConfigModel get configModel => _configModel;
  // BaseUrls get baseUrls => _baseUrls;
  // int get currencyIndex => _currencyIndex;
  // PackageInfo get packageInfo => _packageInfo;
  CurrencyList get myCurrency => _myCurrency;

  bool get hasConnection => _hasConnection;
  bool get fromSetting => _fromSetting;
  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;

  Future<bool> initConfig(BuildContext context) async {
    _hasConnection = true;
    //Fetch application Configurations
    ApiResponse apiResponse = await splashRepo.getConfig();
    bool isSuccess;
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      //
      // _configModel = ConfigModel.fromJson(apiResponse.response.data);
      // _baseUrls = ConfigModel.fromJson(apiResponse.response.data).baseUrls;
      // String _currencyCode = splashRepo.getCurrency();
      //
      // getCurrencyData(_currencyCode);
      // _packageInfo = await PackageInfo.fromPlatform();
      isSuccess = true;
    } else {
      isSuccess = false;
      ApiChecker.checkApi(context, apiResponse);
      if(apiResponse.error.toString() == 'Connection to API server failed due to internet connection') {
        _hasConnection = false;
      }
    }
    notifyListeners();
    return isSuccess;
  }

  void setFirstTimeConnectionCheck(bool isChecked) {
    _firstTimeConnectionCheck = isChecked;
  }

  void getCurrencyData(String currencyCode) {
    _configModel.currencyList.forEach((currency) {
      if(currencyCode == currency.code) {
        _myCurrency = currency;
        _currencyIndex = _configModel.currencyList.indexOf(currency);
        return;
      }
    });
  }

  void setCurrency(int index) {
    splashRepo.setCurrency(_configModel.currencyList[index].code);
    getCurrencyData(_configModel.currencyList[index].code);
    notifyListeners();
  }

  void initSharedPrefData() {
    splashRepo.initSharedData();
  }

  void setFromSetting(bool isSetting) {
    _fromSetting = isSetting;
  }
}
