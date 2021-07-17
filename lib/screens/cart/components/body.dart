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
  void initState() {
    super.initState();
    //Utils().viewCart();
    gettotalItems();
  }

  var image_base_url = 'http://grocerystore.codingoverflow.com/storage/';
  int totalItems = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: FutureBuilder<ViewCart>(
        future: Utils().viewCart(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print(snapshot.data.data.products.length);
            totalItems = snapshot.data.data.products.length;
            print("---------------checking---------------------");
            print(totalItems);
            print("---------------checking---------------------");
            return ListView.builder(
              itemCount: snapshot.data.data.products.length,
              itemBuilder: (BuildContext context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key:
                      UniqueKey() /*Key(snapshot
                              .data.data.products[index].pivot.productId)*/
                  , //demoCarts[index].product.id.toString()
                  direction: DismissDirection.endToStart,
                  /* confirmDismiss: (DismissDirection direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Confirm"),
                          content: const Text(
                              "Are you sure you wish to delete this item?"),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text("DELETE")),
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("CANCEL"),
                            ),
                          ],
                        );
                      },
                    );
                  },*/
                  onDismissed: (direction) async {
                    await Utils().removeCart(snapshot
                        .data.data.products[index].pivot.productId
                        .toString());
                    /* setState(() async {
                      print(direction);

                      // await Utils().viewCart();
                      // ViewCart.removeAt(index);
                    });*/
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
                    image: image_base_url +
                        snapshot.data.data.products[index].productGalleries[0]
                            .productImage,
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

          /*return Center(
            child: Text('Cart is Empty'), //CircularProgressIndicator(
            //   valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
          );*/
        },
      ),
    );
  }

  gettotalItems() async {
    /* print('------------------------------------');
    print(totalItems);
    print('------------------------------------');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('totalItems', totalItems);*/
  }
}
