import 'package:flutter/material.dart';
import 'package:shop_app/screens/search/components/body.dart';

import 'components/body.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = "/search";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Products"),
      ),
      body: Body(),
    );
  }
}
