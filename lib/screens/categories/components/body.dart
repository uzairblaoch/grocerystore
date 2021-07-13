import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/api/utils.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/productsByCategory.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  final String categoryName;
  Body({Key key, this.categoryName});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var image_base_url = 'http://grocerystore.codingoverflow.com/storage/';
  bool isfavourite = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.8;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: FutureBuilder<ProductsByCategory>(
        future: Utils().productsByCategory(widget.categoryName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, DetailsScreen.routeName,
                        arguments: {
                          'productId': snapshot.data?.data[index].id,
                          'productName': snapshot.data?.data[index].productName,
                          'description': snapshot.data?.data[index].description,
                          'sale_price': snapshot.data?.data[index].salePrice,
                          'images': image_base_url +
                              snapshot.data?.data[index].productGalleries[0]
                                  ['product_image']
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AspectRatio(
                            aspectRatio: 1.5,
                            child: Container(
                              padding: EdgeInsets.all(
                                  getProportionateScreenWidth(10)),
                              decoration: BoxDecoration(
                                color: kSecondaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.network(image_base_url +
                                  snapshot.data.data[index].productGalleries[0]
                                      ['product_image']),
                            ),
                          ),
                        ),
                        //const SizedBox(height: 2),
                        Text(
                          snapshot.data.data[index].productName,
                          style: TextStyle(color: Colors.black),
                          maxLines: 1,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rs ${snapshot.data?.data[index].salePrice}",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor,
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                if (isfavourite == false) {
                                  setState(() {
                                    isfavourite = true;
                                  });
                                } else {
                                  setState(() {
                                    isfavourite = false;
                                  });
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(
                                    getProportionateScreenWidth(8)),
                                height: getProportionateScreenWidth(28),
                                width: getProportionateScreenWidth(28),
                                decoration: BoxDecoration(
                                  color: kSecondaryColor.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  "assets/icons/Heart Icon_2.svg",
                                  color: isfavourite ? Colors.red : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}