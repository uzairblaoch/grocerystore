import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/api/utils.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/details/components/color_dots.dart';
import 'package:shop_app/screens/details/components/product_description.dart';
import 'package:shop_app/screens/details/components/product_images.dart';
import 'package:shop_app/screens/details/components/top_rounded_container.dart';
import 'package:shop_app/size_config.dart';

import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatefulWidget {
  final int productId;
  final String productName;
  final String description;
  final String sale_price;
  final String images;
  DetailsScreen({
    this.productId,
    this.productName,
    this.description,
    this.sale_price,
    this.images,
  });
  static String routeName = "/details";

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int quantity = 1;
  Timer _timer;
  int selectedImage = 0;
  bool isfavourite = false;
  int productId;
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                width: getProportionateScreenWidth(238),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Hero(
                    tag: arguments['productId'],
                    child: Image.network(arguments['images'] ??
                        "https://miro.medium.com/max/880/0*H3jZONKqRuAAeHnG.jpg"),
                  ),
                ),
              ),
            ],
          ),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Text(
                        arguments['productName'] ?? "",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        if (isfavourite == false) {
                          prefs.setBool('isFav', true);
                          productId = arguments['productId'];
                          var response =
                              await Utils().addToFavourite(productId);
                          if (response['status'] == false) {
                            _timer?.cancel();
                            await EasyLoading.showError('Error');
                          } else {
                            _timer?.cancel();
                            await EasyLoading.showSuccess(response['message']);
                            setState(() {
                              isfavourite = prefs.getBool('isFav');
                            });
                          }
                        } else {
                          prefs.setBool('isFav', false);
                          var response =
                              await Utils().removeFromFavourite(productId);
                          if (response['status'] == false) {
                            _timer?.cancel();
                            await EasyLoading.showError('Error');
                          } else {
                            _timer?.cancel();
                            await EasyLoading.showSuccess(response['message']);
                            setState(() {
                              isfavourite = prefs.getBool('isFav');
                            });
                          }
                        }
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(15)),
                          width: getProportionateScreenWidth(64),
                          decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/Heart Icon_2.svg",
                            color: isfavourite ? Colors.red : Colors.grey,
                            height: getProportionateScreenWidth(16),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: getProportionateScreenWidth(20),
                        right: getProportionateScreenWidth(64),
                      ),
                      child: Text(
                        arguments['description'] ?? " ",
                        maxLines: 5,
                      ),
                    ),
                  ],
                ),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      //    Increment(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Align(
                                  child: Text(
                                    "Rs. " + arguments['sale_price'] ?? "",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  //width: 30,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Align(
                                    child: Text(
                                      "x " + quantity.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //Text(" x Unit"),
                            Spacer(),
                            RoundedIconBtn(
                              icon: Icons.remove,
                              press: () {
                                setState(() {
                                  quantity == 1 ? quantity = 1 : quantity--;
                                });
                              },
                            ),
                            SizedBox(width: getProportionateScreenWidth(20)),
                            RoundedIconBtn(
                              icon: Icons.add,
                              showShadow: true,
                              press: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            bottom: getProportionateScreenWidth(40),
                            top: getProportionateScreenWidth(15),
                          ),
                          child: DefaultButton(
                            text: "Add To Cart",
                            press: () async {
                              String productID =
                                  arguments['productId'].toString();
                              var response = await Utils()
                                  .addToCart(productID, quantity.toString());
                              print(response);
                              if (response['status'] == true) {
                                _timer?.cancel();
                                await EasyLoading.showSuccess(
                                    response['message']);
                              } else {
                                _timer?.cancel();
                                await EasyLoading.showError(
                                    response['message']);
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
