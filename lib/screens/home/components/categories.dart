import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/api/utils.dart';
import 'package:shop_app/models/GetCategories.dart';
import 'package:shop_app/screens/categories/categories.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  var image_base_url = 'http://grocerystore.codingoverflow.com/storage/';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            width: SizeConfig.screenWidth * 1,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? SizeConfig.screenHeight * 0.12
                : SizeConfig.screenHeight * 0.23,
            child: FutureBuilder<GetCategories>(
                future: Utils().fetchCategories(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.data?.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        return CategoryCard(
                          icon: image_base_url +
                              '${snapshot.data?.data[index].icon}',
                          text: snapshot.data?.data[index].categoryName ?? "",
                          press: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => new CategoriesScreen(
                                    title: snapshot
                                        .data?.data[index].categoryName),
                              ),
                            );
                          },
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
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(70),
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                height: getProportionateScreenHeight(55),
                width: getProportionateScreenWidth(55),
                decoration: BoxDecoration(
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(icon, fit: BoxFit.cover),
              ),
              SizedBox(height: 5),
              Text(text, textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}
