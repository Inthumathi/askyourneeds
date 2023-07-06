import 'package:askun_delivery_app/UI%20Screen/buttomnavigation.dart';
import 'package:askun_delivery_app/services/service.dart';
import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/loader.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({Key? key}) : super(key: key);

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final TextEditingController _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/bgImage.png',
              ),
              fit: BoxFit.cover)),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: MediaQuery.of(context).size.width, // Set the desired width
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: const Image(
                      image: AssetImage('assets/pincode/logo.png'),
                      width: 250,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  SmallText(
                    text: '${MyStrings.pinCode}:',
                    fontWeight: FontWeight.w500,
                  ),
                  heightSpace,
                  TextField(
                    cursorColor: primaryColor,
                    controller: _pinCodeController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: InputDecoration(
                      filled: false,
                      hoverColor: primaryColor,
                      focusColor: primaryColor,
                      isDense: true,
                      counterText: "",
                      hintText: MyStrings.enterPinCode,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  SmallText(
                    text: MyStrings.pincodeMsg,
                    fontWeight: FontWeight.w600,
                    color: textGreyColor,
                    textAlign: TextAlign.center,
                  ),
                  heightSpace,
                  heightSpace,
                  ElevatedButton(
                    onPressed: () {
                      if (_pinCodeController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please enter your Pincode')),
                        );
                      } else if (_pinCodeController.text.length < 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please enter a valid Pin Code')),
                        );
                      } else {
                         pinCode(_pinCodeController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: sideMenuColor,
                      minimumSize: const Size.fromHeight(60),
                    ),
                    child: SmallText(
                      text: MyStrings.submit,
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    ));
  }
  pinCode(String pinCode) async {
    // networkStatus().then((isReachable) {
    // if (isReachable!) {

    startLoader();

    Webservice()
        .callOnBoardingService(pinCode: pinCode)
        .then((onResponse) async {
      stopLoader();
      print(onResponse!.message);
      if(onResponse.status = true){
        Fluttertoast.showToast(msg: "OnBoarded Successfully");
        Future.microtask(() {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const BottomNavigation(
                )),
                (route) => false,
          );
        });
      }
      else {
        Fluttertoast.showToast(msg: "Failed to Login");
      }


    }).catchError((error) async {
      Fluttertoast.showToast(msg: "Time Out");
      stopLoader();
      print(error);
    });
  }
  startLoader() {
    LoadingDialog.showLoaderDialog(context, 'Please Wait..');
  }

  stopLoader() {
    Navigator.of(context).pop();
  }
}
