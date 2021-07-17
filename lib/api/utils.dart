import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/GetCategories.dart';
import 'package:shop_app/models/GetFavouriteProducts.dart';
import 'package:shop_app/models/GetSearchProducts.dart';
import 'package:shop_app/models/PopularProducts.dart';
import 'package:shop_app/models/productsByCategory.dart';
import 'package:shop_app/models/viewCart.dart';

class Utils {
  final String baseUrl = 'grocerystore.codingoverflow.com';
  register(String first_name, String last_name, String email, String password,
      String confirm_password) async {
    var url = Uri.http(baseUrl, '/api/register', {"q": "dart"});
    final response = await http.post(url, body: {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
      'password_confirmation': confirm_password
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  login(String email, String password) async {
    var url = Uri.http(baseUrl, '/api/login', {"q": "dart"});
    final response = await http.post(url, body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 401) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  forgot(String email) async {
    var url = Uri.http(baseUrl, '/api/forgot', {"q": "dart"});
    final response = await http.post(url, body: {
      "email": email,
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 400) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 404) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  checkToken(String email, String token) async {
    var url = Uri.http(baseUrl, '/api/checkToken', {'q': 'dart'});
    final response =
        await http.post(url, body: {'email': email, 'token': token});
    // print(email);
    // print(token);
    print(response);
    if (response.statusCode == 200) {
      final responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    } else if (response.statusCode == 400) {
      final responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    }
  }

  reset(String token, String password, String password_confirm) async {
    var url = Uri.http(baseUrl, '/api/checkToken', {'q': 'dart'});
    final response = await http.post(url, body: {
      'token': token,
      'password': password,
      'password_confirm': password_confirm
    });

    print(response);
    if (response.statusCode == 200) {
      final responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    } else if (response.statusCode == 400) {
      final responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    }
  }

  Future<GetCategories> fetchCategories() async {
    var url = Uri.http(baseUrl, '/api/categories', {"q": "dart"});
    final response = await http.get(url);
    // print(response.body);
    return GetCategories.fromJson(jsonDecode(response.body));
  }

  Future<ProductsByCategory> productsByCategory(String category_name) async {
    var url = Uri.http(baseUrl, '/api/productsByCategory', {"q": "dart"});
    final response = await http.post(url, body: {
      "category_name": category_name,
    });
    // print(response.body);
    return ProductsByCategory.fromJson(jsonDecode(response.body));
  }

  Future<GetPopularProducts> popularProducts() async {
    var url = Uri.http(baseUrl, '/api/getPopularProducts', {"q": "dart"});
    final response = await http.get(url);
    //print(response.body);
    return GetPopularProducts.fromJson(jsonDecode(response.body));
  }

  addToFavourite(int prodId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(prodId.toString());
    var url = Uri.http(baseUrl, '/api/addToFavourite', {"q": "dart"});
    final response = await http.post(url, body: {
      "product_id": prodId.toString(),
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  removeFromFavourite(int prodId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(prodId.toString());
    var url = Uri.http(baseUrl, '/api/removeFromFavourite', {"q": "dart"});
    final response = await http.post(url, body: {
      "product_id": prodId.toString(),
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  Future<GetFavouriteProducts> fetchisFavourite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/getFavourite', {"q": "dart"});
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    return GetFavouriteProducts.fromJson(jsonDecode(response.body));
  }

  contactUs(String name, String email, String message) async {
    var url = Uri.http(baseUrl, '/api/contactus', {"q": "dart"});
    final response = await http
        .post(url, body: {"name": name, "email": email, "message": message});
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  Future<GetSearchProducts> fetchProductsBySearch(String searchItem) async {
    var url = Uri.http(baseUrl, '/api/filterProducts', {"q": "dart"});
    final response = await http.post(url, body: {
      "search": searchItem,
    });
    return GetSearchProducts.fromJson(jsonDecode(response.body));
  }

  address(String street1, String street2, String city, String state,
      String postalcode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(token);
    var url = Uri.http(baseUrl, '/api/address', {"q": "dart"});
    final response = await http.post(url, body: {
      "address": street1,
      "area": street2,
      "city": city,
      "province": state,
      "postal_code": postalcode,
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  addToCart(String product_id, String qty) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('id');
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/addToCart', {"q": "dart"});
    final response = await http.post(url, body: {
      "user_id": id.toString(),
      "payment_method": 'Cash on delivery',
      "product_id": product_id,
      "qty": qty,
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  Future<ViewCart> viewCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/viewCart', {"q": "dart"});
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    return ViewCart.fromJson(jsonDecode(response.body));
  }

  Future<ViewCart> removeCart(String productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/removeFromCart', {"q": "dart"});
    final response = await http.post(url, body: {
      "product_id": productId.toString(),
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    return ViewCart.fromJson(jsonDecode(response.body));
  }

  checkout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/checkout', {"q": "dart"});
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  updateProfile(String first_name, String last_name, String email, String image,
      String password, String confirm_password, String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('id');
    var token = prefs.getString('token');
    var url = Uri.http(baseUrl, '/api/update/$id', {"q": "dart"});
    final response = await http.post(url, body: {
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "image": image,
      "password": password,
      "password_confirmation": confirm_password,
      "phone": phone,
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    } else {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }
}
