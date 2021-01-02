import 'package:dotted_border/dotted_border.dart';
import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/providers/user_info_provider.dart';
import 'package:e_commerce_app/screens/user/add_address_screen.dart';
import 'package:e_commerce_app/screens/user/check_out_screen.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class AllAdressesScreen extends StatefulWidget {
  static String routeName = "AllAdressesScreen";

  @override
  _AllAdressesScreenState createState() => _AllAdressesScreenState();
}

class _AllAdressesScreenState extends State<AllAdressesScreen> {
  String _groupValue = "";
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserInfoProvider>(context).user;
    return DefaultScreen(
      title: "Address",
      children: user.address.length == 0
          ? [Center(child: Text("No, addresses addded")), _screenButtons()]
          : [
              Container(
                height: ScreenHelper.givewidth(context, 1.1),
                child: ListView.builder(
                  itemCount: user.address.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(user.address[i].toString()),
                      trailing: Radio(
                        value: user.address[i].toString(),
                        groupValue: _groupValue,
                        onChanged: (value) {
                          setState(() {
                            _groupValue = user.address[i].toString();
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              _screenButtons()
            ],
    );
  }

  _screenButtons() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenHelper.givewidth(context, .1)),
          child: DottedBorder(
              dashPattern: [4, 2],
              strokeWidth: 2,
              color: kMainColor,
              child: Center(
                child: ListTile(
                  onTap: () => Navigator.pushReplacementNamed(
                      context, AddAdressScreen.routeName),
                  title: Text(
                    "Add Address",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: kMainColor),
                  ),
                  leading:
                      Icon(Icons.add_location_alt_rounded, color: kMainColor),
                ),
              )),
        ),
        SizedBox(
          height: ScreenHelper.giveheight(context, .03),
        ),
        CustomButton(
          title: "Checkout",
          onPressed: () => _groupValue != ""
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CheckOutScreen(
                            selectedAddress: _groupValue,
                          )))
              : showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                          content: Text(
                              "Please, select your current addres to continue"),
                          actions: [
                            TextButton(
                                child: Text("Okay"),
                                onPressed: () => Navigator.pop(context)),
                          ])),
        )
      ],
    );
  }
}
