import 'package:e_commerce_app/providers/user_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            title: Text("orders"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Help"),
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("About"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log out"),
          ),
        ],
      ),
    );
  }
}
