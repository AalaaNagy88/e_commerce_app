import 'package:e_commerce_app/Utils/translation_class.dart';
import 'package:e_commerce_app/controllers/app_lang_binding.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/product_item_provider.dart';
import 'package:e_commerce_app/providers/user_info_provider.dart';
import 'package:e_commerce_app/screens/admin/add_new_product_screen.dart';
import 'package:e_commerce_app/screens/admin/admin_panal_screen.dart';
import 'package:e_commerce_app/screens/admin/edit_product_image_screen.dart';
import 'package:e_commerce_app/screens/admin/edit_product_info_screen.dart';
import 'package:e_commerce_app/screens/loading.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:e_commerce_app/screens/reset_password_screen.dart';
import 'package:e_commerce_app/screens/signup_screen.dart';
import 'package:e_commerce_app/screens/user/add_address_screen.dart';
import 'package:e_commerce_app/screens/user/all_addresses_screen.dart';
import 'package:e_commerce_app/screens/user/cart_screen.dart';
import 'package:e_commerce_app/screens/user/change_language_screen.dart';
import 'package:e_commerce_app/screens/user/check_out_screen.dart';
import 'package:e_commerce_app/screens/user/confirm_screen.dart';
import 'package:e_commerce_app/screens/user/home_screen.dart';
import 'package:e_commerce_app/screens/user/order_screen.dart';
import 'package:e_commerce_app/screens/user/settings_screen.dart';
import 'package:e_commerce_app/screens/welcome_screen.dart';
import 'package:e_commerce_app/services/store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'controllers/user_session_controller.dart';
import 'providers/image_picker_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Store _store = Store();
    return MultiProvider(
      providers: [
        StreamProvider.value(
          value: _store.loadAllProducts(),
        ),
        ChangeNotifierProvider<ImagePickerProvider>.value(
            value: ImagePickerProvider()),
        ChangeNotifierProvider<UserInfoProvider>.value(
            value: UserInfoProvider()),
        ChangeNotifierProvider<CartProvider>.value(value: CartProvider()),
        ChangeNotifierProvider<ProductItem>.value(value: ProductItem()),
      ],
      child: GetMaterialApp(
        title: 'Bolt',
        theme: ThemeData(
          primaryColor: kMainColor,
        ),
        home: GetBuilder<UserSessionController>(
          init: UserSessionController(),
          builder: (_) {
            return _.currentUser == null
                ? WelcomeScreen()
                : Loading(
                    email: _.currentUser,
                  );
          },
        ),
        routes: {
          WelcomeScreen.routeName: (context) => WelcomeScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          AdminPanalScreen.routeName: (context) => AdminPanalScreen(),
          AddNewProductScreen.routeName: (context) => AddNewProductScreen(),
          EditProductInfoScreen.routeName: (context) => EditProductInfoScreen(),
          EditProductImageScreen.routeName: (context) =>
              EditProductImageScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          AddAdressScreen.routeName: (context) => AddAdressScreen(),
          AllAdressesScreen.routeName: (context) => AllAdressesScreen(),
          CheckOutScreen.routeName: (context) => CheckOutScreen(),
          ConfirmScreen.routeName: (context) => ConfirmScreen(),
          OrderScreen.routeName: (context) => OrderScreen(),
          Loading.routeName: (context) => Loading(),
          SettingsScreen.routeName: (context) => SettingsScreen(),
          ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
          ChangeLanguageScreen.routeName: (context) => ChangeLanguageScreen(),
        },
        translations: TranslationClass(),
        locale: Locale("en"),
        fallbackLocale: Locale("en"),
        getPages: [
          GetPage(
            name: ChangeLanguageScreen.routeName,
            page: () => ChangeLanguageScreen(),
            binding: AppLanguageBinding(),
          ),
        ],
      ),
    );
  }
}
