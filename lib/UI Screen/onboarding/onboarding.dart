import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/loader.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key,required this.accessToken}) : super(key: key);
final String accessToken;
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final TextEditingController _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(text: MyStrings.pinCode),
                  heightSpace,
                  TextField(
                    cursorColor: primaryColor,
                    controller: _pinCodeController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9]')),

                    ],

                    decoration: InputDecoration(
                      filled: true,
                      hoverColor: primaryColor,
                      focusColor: primaryColor,
                      isDense: true,
                      counterText: "",
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                        BorderSide(width: 1, color: blueGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(5.0)),
                        borderSide:
                        BorderSide(width: 1, color: blueGrey),
                      ),
                      suffixIcon: Icon(
                        Icons.phone_android_sharp,
                        size: 25,
                        color: primaryColor,
                      ),

                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        if (_pinCodeController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please enter your Pincode')),
                          );
                        } else if (_pinCodeController.text.length <
                            6) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Please enter a valid Pincode')),
                          );
                        }
                        else{
                          // _pinCode(_pinCodeController.text);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 50,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: SmallText(
                            text: MyStrings.sendOTP,
                            color: whiteColor,
                            fontWeight: FontWeight.w500,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // _pinCode( String mobilenumber) async {
  //
  //   // networkStatus().then((isReachable) {
  //   // if (isReachable!) {
  //
  //   startLoader();
  //
  //   Webservice()
  //       .callLoginService(phoneNumber: mobilenumber)
  //       .then((onResponse) async {
  //     stopLoader();
  //     print(onResponse!.message);
  //     if(onResponse.status = true){
  //       final message = onResponse.message; // Get the message from the response
  //       final otp = onResponse.otp;
  //       Fluttertoast.showToast(msg: "Otp send to your register Mobile number");
  //       await Future.delayed(const Duration(seconds: 2));
  //       Navigator.push(
  //           context,
  //           PageTransition(
  //               type: PageTransitionType.rightToLeft, child:  OTPScreen(token: message, oTP: otp,)));
  //     }
  //     else {
  //       Fluttertoast.showToast(msg: "Failed to Login");
  //     }
  //
  //
  //   }).catchError((error) async {
  //     Fluttertoast.showToast(msg: "Time Out");
  //     stopLoader();
  //     print(error);
  //   });
  // }
  startLoader() {
    LoadingDialog.showLoaderDialog(context, 'Please Wait..');
  }

  stopLoader() {
    Navigator.of(context).pop();
  }
}
