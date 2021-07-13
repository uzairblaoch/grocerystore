import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/api/utils.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/viewCart.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: FutureBuilder<ViewCart>(
        future: Utils().viewCart(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.data.products.length,
              itemBuilder: (BuildContext context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(snapshot.data.data.products[0].id
                      .toString()), //demoCarts[index].product.id.toString()
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      demoCarts.removeAt(index);
                    });
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: CartCard(
                    image:
                        "https://miro.medium.com/max/880/0*H3jZONKqRuAAeHnG.jpg",
                    title: snapshot.data.data.products[index].productName,
                    price: snapshot.data.data.products[index].salePrice,
                    qty: snapshot.data.data.products[index].pivot.qty,
                  ),
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
          );
        },
      ),
    );
  }
}
