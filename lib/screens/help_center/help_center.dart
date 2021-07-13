import 'package:flutter/material.dart';
import 'package:shop_app/screens/help_center/components/body.dart';

class HelpCenter extends StatelessWidget {
  final String title;
  HelpCenter({Key key, this.title});
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
