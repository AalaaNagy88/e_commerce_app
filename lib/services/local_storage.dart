import 'package:get_storage/get_storage.dart';

class LocalStorage {
  saveToDisk(String key, String value) async {
    await GetStorage().write(key, value);
  }

  Future<String> readFromDisk(String key) async {
    return await GetStorage().read(key);
  }

  removeFromDisk(String key) async {
    await GetStorage().remove(key);
  }
}
