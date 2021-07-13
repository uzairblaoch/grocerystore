import 'package:flutter/material.dart';
import 'package:shop_app/screens/categories/components/body.dart';

class CategoriesScreen extends StatelessWidget {
  final String title;
  CategoriesScreen({Key key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Body(categoryName:title),
    );
  }
}
