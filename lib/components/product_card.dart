import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatefulWidget {
  final int productId;
  final String productName;
  final String description;
  final String sale_price;
  final String images;
  ProductCard({
    Key key,
    @required this.productId,
    @required this.productName,
    @required this.sale_price,
    @required this.description,
    @required this.images,
    this.width = 140,
    this.aspectRetio = 1.02,
    // @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  var image_base_url = 'http://grocerystore.codingoverflow.com/storage/';
  bool isfavourite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /* onTap: () {
         Navigator.pushNamed(context, DetailsScreen.routeName, arguments: {
          'productId': productId,
          'productName': productName,
          'sale_price': sale_price,
           'sale_price': sale_price,
          'images': images
        });
        }*/

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.02,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(image_base_url + widget.images[0]),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.productName,
            style: TextStyle(color: Colors.black),
            maxLines: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${widget.sale_price}",
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
                  padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                  height: getProportionateScreenWidth(28),
                  width: getProportionateScreenWidth(28),
                  decoration: BoxDecoration(
                    color: true //widget.product.isFavourite
                        ? kPrimaryColor.withOpacity(0.15)
                        : kSecondaryColor.withOpacity(0.1),
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
    );
  }
}
