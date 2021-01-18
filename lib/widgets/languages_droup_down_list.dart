import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/controllers/app_lang_controller.dart';
import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagesDroupDownList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguageController>(
      init: AppLanguageController(),
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: ScreenHelper.givewidth(context, .8),
          child: DropdownButton(
            underline: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: kButtonColor,
                )),
            items: [
              DropdownMenuItem(
                child: Text("English"),
                value: "en",
              ),
              DropdownMenuItem(
                child: Text("العربية"),
                value: "ar",
              )
            ],
            value: _.appLanguage,
            onChanged: (value) {
              _.changeLanguage(value);
              Get.updateLocale(Locale(value));
            },
          ),
        );
      },
    );
  }
}
