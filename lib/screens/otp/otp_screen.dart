import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  String email;
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) {
      email = arguments['email'];
      SizeConfig().init(context);
      return Scaffold(
        appBar: AppBar(
          title: Text("OTP Verification"),
        ),
        body: Body(email),
      );
    }
  }
}
