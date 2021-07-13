import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/address/components/address_form.dart';
import 'package:shop_app/screens/my_account/components/account_form.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("Add Address", style: headingStyle),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                AddressForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
