import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  var totalItems;

  @override
  void initState() {
    super.initState();
    totalItems = gettotalItems();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfitem: 3,
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          /*IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: totalItems,
            press: () {},
          ),*/
        ],
      ),
    );
  }

  gettotalItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var totalItems = prefs.getInt('totalItems');
    return totalItems;
  }
}
