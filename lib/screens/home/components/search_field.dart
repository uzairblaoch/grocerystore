import 'package:flutter/material.dart';
import 'package:shop_app/api/utils.dart';
import 'package:shop_app/screens/search/search_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool isSearchProduct = true;
  var response;
  final _searchProduct = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.7,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (text) async {
          setState(() {
            isSearchProduct = false;
          });
        },
        controller: _searchProduct,
        onSubmitted: (value) async {
          Navigator.pushNamed(context, SearchScreen.routeName,
              arguments: {'search': _searchProduct.text});
          //response = await Utils().fetchProductsBySearch(_searchProduct.text);

          // print(response.data);
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search product",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
