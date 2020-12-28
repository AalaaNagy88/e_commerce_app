import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/product_item_provider.dart';
import 'package:e_commerce_app/providers/user_info_provider.dart';
import 'package:e_commerce_app/screens/admin/add_new_product_screen.dart';
import 'package:e_commerce_app/screens/admin/admin_panal_screen.dart';
import 'package:e_commerce_app/screens/admin/edit_product_image_screen.dart';
import 'package:e_commerce_app/screens/admin/edit_product_info_screen.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:e_commerce_app/screens/signup_screen.dart';
import 'package:e_commerce_app/screens/user/cart_screen.dart';
import 'package:e_commerce_app/screens/user/home_screen.dart';
import 'package:e_commerce_app/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'providers/image_picker_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ImagePickerProvider>(
            create: (context) => ImagePickerProvider()),
        ChangeNotifierProvider<UserInfoProvider>(
            create: (context) => UserInfoProvider()),
        ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider()),
        ChangeNotifierProvider<ProductItem>(create: (context) => ProductItem())
      ],
      child: MaterialApp(
          title: 'Bolt',
          theme: ThemeData(
            primaryColor: kMainColor,
          ),
          initialRoute: WelcomeScreen.routeName,
          routes: {
            WelcomeScreen.routeName: (context) => WelcomeScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            SignUpScreen.routeName: (context) => SignUpScreen(),
            AdminPanalScreen.routeName: (context) => AdminPanalScreen(),
            AddNewProductScreen.routeName: (context) => AddNewProductScreen(),
            EditProductInfoScreen.routeName: (context) =>
                EditProductInfoScreen(),
            EditProductImageScreen.routeName: (context) =>
                EditProductImageScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
      CartScreen.routeName:(context)=>CartScreen()
          }),
    );
  }
}
