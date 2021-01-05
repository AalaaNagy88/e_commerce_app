import 'package:e_commerce_app/Utils/langs/ar.dart';
import 'package:get/route_manager.dart';

import 'langs/en.dart';

class TranslationClass extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {"en": en, "ar": ar};
}
