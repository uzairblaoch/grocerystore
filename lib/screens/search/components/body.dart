import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/api/utils.dart';
import 'package:shop_app/models/GetSearchProducts.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var image_base_url = 'http://grocerystore.codingoverflow.com/storage/';
  bool isfavourite = false;
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      body: FutureBuilder<GetSearchProducts>(
        future: Utils().fetchProductsBySearch(arguments['search']),
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
                                  .productImage
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
                                      .productImage),
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
          return Center(child: Text("No product found !"));
        },
      ),
    );
  }
}
