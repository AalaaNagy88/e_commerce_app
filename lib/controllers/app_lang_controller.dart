import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/services/local_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AppLanguageController extends GetxController {
  LocalStorage _localStorage = LocalStorage();
  String appLanguage = "en";
  @override
  void onInit() async {
    super.onInit();
    appLanguage = await _localStorage.readFromDisk(kSelectedLanguageKey) == null
        ? "en"
        : await _localStorage.readFromDisk(kSelectedLanguageKey);
    Get.updateLocale(Locale(appLanguage));
    update();
  }

  changeLanguage(String x) {
    if (appLanguage == x) return;
    if (x == "ar") {
      appLanguage = x;
      _localStorage.saveToDisk(kSelectedLanguageKey, appLanguage);
    } else {
      appLanguage = x;
      _localStorage.saveToDisk(kSelectedLanguageKey, appLanguage);
    }
  }
}
