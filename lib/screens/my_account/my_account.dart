import 'package:flutter/material.dart';
import 'package:shop_app/screens/my_account/components/body.dart';

class MyAccount extends StatelessWidget {
  final String title;
  MyAccount({Key key, this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Body(),
    );
  }
}
