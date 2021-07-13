import 'package:flutter/material.dart';

import 'components/body.dart';

class AddressScreen extends StatelessWidget {
  final String title;
  AddressScreen({Key key, this.title});
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
