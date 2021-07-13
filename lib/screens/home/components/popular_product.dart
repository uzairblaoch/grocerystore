import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/api/utils.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/GetCategories.dart';
import 'package:shop_app/models/PopularProducts.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/productsByCategory.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatefulWidget {
  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  var image_base_url = 'http://grocerystore.codingoverflow.com/storage/';
  bool isfavourite = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(35)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: SizeConfig.screenWidth * 1,
                height: SizeConfig.screenHeight * 0.4,
                child: FutureBuilder<GetPopularProducts>(
                    future: Utils().popularProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.data?.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, DetailsScreen.routeName,
                                    arguments: {
                                      'productId':
                                          snapshot.data?.data[index].id,
                                      'productName': snapshot
                                          .data?.data[index].productName,
                                      'description': snapshot
                                          .data?.data[index].description,
                                      'sale_price':
                                          snapshot.data?.data[index].salePrice,
                                      'images': image_base_url +
                                          snapshot.data?.data[index]
                                              .productGalleries[0].productImage,
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        padding: EdgeInsets.all(
                                            getProportionateScreenWidth(10)),
                                        decoration: BoxDecoration(
                                          color:
                                              kSecondaryColor.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Image.network(
                                          image_base_url +
                                              snapshot
                                                  .data
                                                  .data[index]
                                                  .productGalleries[0]
                                                  .productImage,
                                        ),
                                      ),
                                    ),
                                    //const SizedBox(height: 2),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        snapshot.data.data[index].productName,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              getProportionateScreenWidth(18),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Rs ${snapshot.data?.data[index].salePrice}",
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      18),
                                              fontWeight: FontWeight.w600,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 60, 0)),
                                          InkWell(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            onTap: () {
                                              if (isfavourite == false) {
                                                setState(() {
                                                  isfavourite = true;
                                                  print(isfavourite);
                                                });
                                              } else {
                                                setState(() {
                                                  isfavourite = false;
                                                  print(isfavourite);
                                                });
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(
                                                  getProportionateScreenWidth(
                                                      8)),
                                              height:
                                                  getProportionateScreenWidth(
                                                      28),
                                              width:
                                                  getProportionateScreenWidth(
                                                      28),
                                              decoration: BoxDecoration(
                                                color: kSecondaryColor
                                                    .withOpacity(0.15),
                                                shape: BoxShape.circle,
                                              ),
                                              child: SvgPicture.asset(
                                                "assets/icons/Heart Icon_2.svg",
                                                color: isfavourite
                                                    ? Colors.red
                                                    : Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.orange),
                        ),
                      );
                    }),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
