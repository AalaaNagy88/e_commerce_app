import 'package:e_commerce_app/controllers/app_lang_controller.dart';
import 'package:get/get.dart';

class AppLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppLanguageController>(
      () => AppLanguageController(),
    );
  }
}
