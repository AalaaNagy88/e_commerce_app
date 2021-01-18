import 'package:e_commerce_app/controllers/app_lang_controller.dart';
import 'package:e_commerce_app/widgets/default_screen.dart';
import 'package:e_commerce_app/widgets/languages_droup_down_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/utils.dart';

class ChangeLanguageScreen extends GetView<AppLanguageController> {
  static String routeName = "ChangeLanguageScreen";
  const ChangeLanguageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultScreen(
        title: "language".tr,
        children: [LanguagesDroupDownList()],
      ),
    );
  }
}
