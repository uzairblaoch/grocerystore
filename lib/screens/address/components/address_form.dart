import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shop_app/api/utils.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class AddressForm extends StatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  Timer _timer;
  final _formKey = GlobalKey<FormState>();
  String street;
  String city;
  String state;
  String postalcode;
  String country;
  bool remember = false;
  final _street = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();
  final _postalcoe = TextEditingController();

  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildStreetFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCityFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildStateFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPostalCodeFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Add Address",
            press: () async {
              if (_formKey.currentState.validate()) {
                print(_street);
                print(_city);
                print(_state);
                print(_postalcoe);

                _formKey.currentState.save();
                var response = await Utils().address(_street.text, _street.text,
                    _city.text, _state.text, _postalcoe.text);
                if (response['status'] == false) {
                  _timer?.cancel();
                  await EasyLoading.showError(response['message']);
                } else {
                  _timer?.cancel();
                  await EasyLoading.showSuccess(response['message']);
                  Navigator.pop(context);
                }
                // if all are valid then go to success screen
                //Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildStreetFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => street = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kStreetlNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kStreetlNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Street",
        hintText: "Enter your street",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      controller: _street,
    );
  }

  TextFormField buildCityFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => city = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kCityNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kCityNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "City",
        hintText: "Enter your city",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      controller: _city,
    );
  }

  TextFormField buildStateFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => state = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kStateNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kStateNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "State",
        hintText: "Enter your state",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      controller: _state,
    );
  }

  TextFormField buildPostalCodeFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => postalcode = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPostalCodeNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPostalCodeNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Postal Code",
        hintText: "Enter your postal code",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      controller: _postalcoe,
    );
  }
}
