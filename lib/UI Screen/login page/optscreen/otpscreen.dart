import 'package:askun_delivery_app/UI%20Screen/buttomnavigation.dart';
import 'package:askun_delivery_app/UI%20Screen/login%20page/optscreen/timer.dart';
import 'package:askun_delivery_app/services/service.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/loader.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  final String? token;
  final String? oTP;

  OTPScreen({Key? key, required this.token, required this.oTP})
      : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();

  // int _counter = 60;
  // late Timer _timer;

  int timeOutInSeconds = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color:circleShapeColor),
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: primaryColor,
                  size: 30,
                )),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  height: 150,
                  width: 150,
                ),
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              SmallText(
                text: MyStrings.verificationMessage,
                fontWeight: FontWeight.w500,
                color: blueGrey,
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              Text(widget.oTP.toString()),
              SmallText(
                text: MyStrings.enterOTP.toUpperCase(),
                fontWeight: FontWeight.w500,
              ),
              heightSpace,
              Form(
                key: formKey,
                child: PinCodeTextField(
                  appContext: context,
                  cursorHeight: 20,
                  length: 6, // Changed from 4 to 6
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.circle,
                    fieldHeight: 75,
                    fieldWidth: 50,
                    selectedColor: const Color(0xffd8d8d8),
                    inactiveColor: const Color(0xffC4C5C4),
                    borderWidth: 1,
                    activeColor: const Color(0xffffdecd),
                    disabledColor: whiteColor,
                    selectedFillColor: const Color(0xffffd8c5),
                    inactiveFillColor: const Color(0xffd8d8d8),
                    activeFillColor: const Color(0xffd8d8d8),
                  ),
                  cursorColor: Colors.black.withOpacity(0.8),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    return true;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TimerButton(
                    label:
                        "Time remaining: ${timeOutInSeconds.toString().substring(timeOutInSeconds.toString().length - 3)}",
                    // timeOutInSeconds: 120,
                    onPressed: () {
                      recentOtp('${widget.token}');
                    },
                    timeOutInSeconds: timeOutInSeconds,
                    // buttonType: ButtonType.ElevatedButton,
                    // color: Colors.green,
                  ),
                  InkWell(
                    onTap: () {
                      if (otpController.text.length < 6) {
                        Fluttertoast.showToast(msg: "Please enter your OTP");
                      } else {
                        _verifyOTP('${widget.token}', otpController.text);
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
                          text: MyStrings.submit,
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//submit api
  _verifyOTP(String token, String verifyOTP) async {
    startLoader();
    Webservice()
        .callVerifyOtpService(token: token, otpCode: verifyOTP)
        .then((onResponse) async {
      stopLoader();
      if (onResponse!.status == true) {
        Fluttertoast.showToast(msg: "Login Successfully");
        await Future.delayed(const Duration(seconds: 2));
        print(onResponse.message!.accesstoken.toString());
        print('Refresh Token: ${onResponse.message!.refreshtoken}');
        print('Access Token: ${onResponse.message!.accesstoken}');
        String? accessToken = onResponse.message!.accesstoken;
        String? refreshToken = onResponse.message!.refreshtoken;
        if (onResponse.message!.isOnboardingCompleted == false) {
          Future.microtask(() {
            displayBottomSheet(context,refreshToken!,accessToken!,);
          });

        } else if (onResponse.message!.isOnboardingCompleted == true) {
          Future.microtask(() {
            Navigator.pushAndRemoveUntil(
              context,
              // MaterialPageRoute(
              //     builder: (BuildContext context) => BottomNavigation(
              //       refreshTokenBottom: onResponse.message!.refreshtoken,
              //       accessTokenBottom: onResponse.message!.accesstoken,
              //     )),
              MaterialPageRoute(
                  builder: (BuildContext context) => BottomNavigation(
                          refreshTokenBottom: onResponse.message!.refreshtoken.toString(),
                          accessTokenBottom: onResponse.message!.accesstoken.toString(),
                  )),
                  (route) => false,
            );
          });
        } else {
          Fluttertoast.showToast(msg: 'Verify OTP Failed');
        }
      } else if (onResponse.status == false) {
        Fluttertoast.showToast(msg: "Ivalid OTP");
      } else {
        Fluttertoast.showToast(msg: "Invalid OTP");
      }
    }).catchError((error) async {
      print('Error: $error');
      if (error.toString().contains('Exception: Failed to login')) {
        Fluttertoast.showToast(msg: "Invalid OTP");
      }
      // handle errors here
      // if (error.toString().contains('Invalid OTP')) {
      //   Fluttertoast.showToast(msg: 'Invalid OTP');
      // }
      stopLoader();
      // print(error);
    });
  }

  //recent otp
  recentOtp(
    String token,
  ) async {
    startLoader();
    Webservice().callRecentOtpService(token: token).then((onResponse) async {
      stopLoader();
    }).catchError((error) async {
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

  void displayBottomSheet(BuildContext context,String refreshToken,String accessToken) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        enableDrag: true,
        isDismissible: false,
        builder: (context) {
          final MediaQueryData mediaQueryData = MediaQuery.of(context);

        return Padding(
            padding:  EdgeInsets.only(bottom:  mediaQueryData.viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height/3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),

                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            SmallText(text: MyStrings.pinCode,fontWeight: FontWeight.w600,size: 18),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: circleShapeColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(Icons.clear,color: primaryColor,),
                                  )),
                            ),
                          ],
                        ),
                      )),
                  heightSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SmallText(text: MyStrings.enterPinCode,color: blueGrey),
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
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10, horizontal: 12),

                            focusedBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color:primaryColor),
                            ),
                          ),
                        ),
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
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
                                pinCode(refreshToken,accessToken,_pinCodeController.text);
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width /2,
                              height: 50,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: SmallText(
                                  text: MyStrings.submit,
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

                ],
              ),
            ),
          );
        });
  }

  pinCode(String refreshToken, String accessToken,String pinCode) async {

    // networkStatus().then((isReachable) {
    // if (isReachable!) {

    startLoader();

    Webservice()
        .callOnBoardingService(accessToken:accessToken ,pinCode: pinCode)
        .then((onResponse) async {
      stopLoader();
      print(onResponse!.message);
      if(onResponse.status = true){
        Future.microtask(() {
          Navigator.pushAndRemoveUntil(
            context,
            // MaterialPageRoute(
            //     builder: (BuildContext context) => BottomNavigation(
            //       refreshTokenBottom:refreshToken ,
            //       accessTokenBottom: accessToken,
            //     )),
            MaterialPageRoute(
                builder: (BuildContext context) => BottomNavigation(
                  refreshTokenBottom: refreshToken,
                  accessTokenBottom: accessToken,
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
}
