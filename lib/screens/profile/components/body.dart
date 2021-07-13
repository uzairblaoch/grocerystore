import 'package:flutter/material.dart';
import 'package:shop_app/screens/address/address.dart';
import 'package:shop_app/screens/help_center/help_center.dart';
import 'package:shop_app/screens/my_account/my_account.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new MyAccount(title: "My Account"),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Address",
            icon: "assets/icons/home.svg",
            press: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new AddressScreen(title: "Address"),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new HelpCenter(title: "Help Center"),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
