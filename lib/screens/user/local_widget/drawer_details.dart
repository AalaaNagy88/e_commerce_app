import 'package:e_commerce_app/controllers/user_session_controller.dart';
import 'package:e_commerce_app/providers/user_info_provider.dart';
//import 'package:e_commerce_app/screens/user/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../welcome_screen.dart';
import '../order_screen.dart';

class DrawerDetials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            // arrowColor: Colors.white,
            // onDetailsPressed: () {},
            accountName: Text(
              Provider.of<UserInfoProvider>(context).user.name,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white),
            ),
            accountEmail:
                Text(Provider.of<UserInfoProvider>(context).user.email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text("orders".tr),
            onTap: () => Navigator.pushNamed(context, OrderScreen.routeName),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("help".tr),
            // onTap: () =>
            // Navigator.pushNamed(context, SettingsScreen.routeName)
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("about".tr),
          ),
          GetBuilder<UserSessionController>(
              init: UserSessionController(),
              builder: (_) {
                return ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("logout".tr),
                    onTap: () {
                      _.changeUser(null);
                      Navigator.pushNamedAndRemoveUntil(
                          context, WelcomeScreen.routeName, (route) => false);
                    });
              })
        ],
      ),
    );
  }
}
