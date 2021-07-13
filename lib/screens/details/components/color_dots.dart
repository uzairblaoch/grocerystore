import 'package:flutter/material.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Increment extends StatefulWidget {
  @override
  _IncrementState createState() => _IncrementState();
}

class _IncrementState extends State<Increment> {
  static int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Align(
              child: Text(
                itemCount.toString(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
          ),
          Text(" x Unit"),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {
              setState(() {
                itemCount == 1 ? itemCount = 1 : itemCount--;
              });
            },
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {
              setState(() {
                itemCount++;
              });
            },
          ),
        ],
      ),
    );
  }
}

/*
class ColorDots extends StatelessWidget {
  const ColorDots({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 3;
    int itemCount = 1;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Align(
              child: Text(
                itemCount.toString(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
          ),
          Text(" x Unit"),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {},
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {
              (context as Element).markNeedsBuild();
              itemCount++;
            },
          ),
        ],
      ),
    );
  }
}*/
/*
class ColorDot extends StatelessWidget {
  const ColorDot({
    Key key,
    @required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
*/