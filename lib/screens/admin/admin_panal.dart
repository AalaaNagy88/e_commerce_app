import 'package:flutter/material.dart';

import 'add_new_product.dart';

class AdminPanal extends StatelessWidget {
  static String routeName = "AdminPanal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(onPressed: (){Navigator.pushNamed(context, AddNewProduct.routeName);},),
            RaisedButton(onPressed: (){},),
            RaisedButton(onPressed: (){},),
          ],
        ),
      ),
    );
  }
}
