import 'package:e_commerce_app/screens/admin/add_new_product.dart';
import 'package:e_commerce_app/screens/admin/admin_panal.dart';
import 'package:e_commerce_app/screens/admin/edit_product.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:e_commerce_app/screens/signup_screen.dart';
import 'package:e_commerce_app/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'core/providers/image_picker_provider.dart';

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
            create: (context) => ImagePickerProvider())
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
            AdminPanal.routeName: (context) => AdminPanal(),
            AddNewProduct.routeName: (context) => AddNewProduct(),
            EditProduct.routeName: (context) => EditProduct()
          }),
    );
  }
}
