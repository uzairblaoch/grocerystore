import 'package:flutter/widgets.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/categories/categories.dart';
import 'package:shop_app/screens/change_password/change_password_screen.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/favourite/favourite_screen.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/search/search_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  FavouriteScreen.routeName: (context) => FavouriteScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
   'mainScreen': (context) => BottomBar(),
};
