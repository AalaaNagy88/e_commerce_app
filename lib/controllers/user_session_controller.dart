import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/services/local_storage.dart';
import 'package:get/state_manager.dart';

class UserSessionController extends GetxController {
  LocalStorage _localStorage = LocalStorage();
  String currentUser;
  @override
  void onInit() async {
    super.onInit();
    currentUser = await _localStorage.readFromDisk(kUserInfoKey) == null
        ? null
        : await _localStorage.readFromDisk(kUserInfoKey);
    update();
  }
}
