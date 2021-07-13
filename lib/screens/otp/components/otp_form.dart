import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:shop_app/api/utils.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/change_password/change_password_screen.dart';
import 'package:shop_app/size_config.dart';

import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  Timer _timer;
  TextEditingController controller = TextEditingController();
  int pinLength = 4;
  bool hasError = false;
  String errorMessage;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PinCodeTextField(
                autofocus: true,
                controller: controller,
                hideCharacter: false,
                highlight: true,
                errorBorderColor: Colors.red,
                highlightColor: Colors.orange,
                defaultBorderColor: Colors.black12,
                hasTextBorderColor: Colors.black26,
                //highlightPinBoxColor: Colors.orange,
                maxLength: pinLength,
                hasError: hasError,

                onTextChanged: (text) {},
                onDone: (text) async {
                  if (arguments != null) {
                    print(arguments['email']);
                    print(controller.text);
                    _timer?.cancel();
                    await EasyLoading.show(
                      status: 'loading...',
                      maskType: EasyLoadingMaskType.black,
                    );
                    var response = await Utils()
                        .checkToken(arguments['email'], controller.text);
                    if (response['message'] == "Invalid token!") {
                    _timer?.cancel();
                    await EasyLoading.showError(response['message']);
                    } else {
                      _timer?.cancel();
                      await EasyLoading.showSuccess(response['message']);
                      Navigator.pushNamed(context, ChangePasswordScreen.routeName,
                          arguments: {'token': controller.text});
                    }
                 }

                },

                pinBoxWidth: SizeConfig.screenWidth * 0.18,
                pinBoxHeight: SizeConfig.screenHeight * 0.1,
                hasUnderline: false,
                wrapAlignment: WrapAlignment.spaceAround,
                pinBoxDecoration:
                    ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                pinTextStyle: Theme.of(context).textTheme.headline1.copyWith(
                      fontSize: SizeConfig.screenWidth * 0.06,
                    ),
                pinTextAnimatedSwitcherTransition:
                    ProvidedPinBoxTextAnimation.scalingTransition,
                pinBoxColor: Colors.white,
                pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
//                    highlightAnimation: true,
                //   highlightAnimationBeginColor: Colors.black,
                // highlightAnimationEndColor: Colors.black,
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          /* DefaultButton(
            text: "Continue",
            press: () {
              
            },
          )*/
        ],
      ),
    );
  }
}
