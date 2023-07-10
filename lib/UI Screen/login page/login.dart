import 'package:askun_delivery_app/UI%20Screen/buttomnavigation.dart';
import 'package:askun_delivery_app/UI%20Screen/login%20page/pincode/pincode.dart';
import 'package:askun_delivery_app/services/service.dart';
import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/loader.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'optscreen/timer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mobileNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  // final TextEditingController _pinCodeController = TextEditingController();
  int timeOutInSeconds = 120;

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
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmallText(
                    text: MyStrings.loginMsg,
                    size: 20,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                    height: 1.5,
                    color: whiteColor,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    cursorColor: primaryColor,
                    controller: _mobileNumberController,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                      FilteringTextInputFormatter.deny(RegExp(r'^1+')),
                      FilteringTextInputFormatter.deny(RegExp(r'^2+')),
                      FilteringTextInputFormatter.deny(RegExp(r'^3+')),
                      FilteringTextInputFormatter.deny(RegExp(r'^4+')),
                      FilteringTextInputFormatter.deny(RegExp(r'^5+')),
                    ],
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteColor,
                      hoverColor: primaryColor,
                      focusColor: primaryColor,
                      isDense: true,
                      counterText: "",
                      contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      hintText: 'Phone Number',
                      hintStyle: const TextStyle(color: Color(0xffB3B3B3)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                            top: 0.0, left: 10, right: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/login/indianFlag.png',
                              width: 35,
                              height: 35,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '+91 (IN)',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: sideMenuColor,
                      minimumSize: const Size.fromHeight(60),
                    ),
                    onPressed: () {

                      if (_mobileNumberController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Please enter the registered mobile number')),
                        );
                      }
                      else if (_mobileNumberController.text.length < 10) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Please enter a valid mobile number')),
                        );
                      } else {
                        _login(context,_mobileNumberController.text);
                      }
                    },
                    child: SmallText(
                      text: MyStrings.sendOTP,
                      color: whiteColor,
                      fontWeight: FontWeight.w600,
                      size: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  SmallText(
                    text:
                        'By continuing you agree to our Terms of Service, Privacy Policy, Content Policy.',
                    color: whiteColor,
                    size: 15,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _login(BuildContext context,String mobilenumber) async {
    // networkStatus().then((isReachable) {
    // if (isReachable!) {

    startLoader();

    Webservice().callLoginService(phoneNumber: mobilenumber)
        .then((onResponse) async {
      stopLoader();
      if (kDebugMode) {
        print(onResponse!.message);
      }
      if (onResponse!.status = true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('message', onResponse.message.toString());
        prefs.setString('otp', onResponse.otp.toString());
        await Future.delayed(const Duration(seconds: 2));
        Fluttertoast.showToast(msg: "Otp send to your register Mobile number");
        _showOTPBottomSheet(context,mobilenumber,);
        // Navigator.push(
        //    context,
        //    PageTransition(
        //        type: PageTransitionType.rightToLeft, child:  OTPScreen(token: message, oTP: otp,)));
      } else {
        Fluttertoast.showToast(msg: "Failed to Login");
      }
    }).catchError((error) async {
      Fluttertoast.showToast(msg: "Time Out");
      stopLoader();
      if (kDebugMode) {
        print(error);
      }
    });
  }

  startLoader() {
    LoadingDialog.showLoaderDialog(context, 'Please Wait..');
  }

  stopLoader() {
    Navigator.of(context).pop();
  }

  _verifyOTP( String verifyOTP) async {
    startLoader();
    Webservice()
        .callVerifyOtpService( otpCode: verifyOTP)
        .then((onResponse) async {
      stopLoader();
      if (onResponse!.status == true) {
        await Future.delayed(const Duration(seconds: 2));
        Fluttertoast.showToast(msg: "Login Successully");
        if (kDebugMode) {
          print(onResponse.message!.accesstoken.toString());
          print('Refresh Token: ${onResponse.message!.refreshtoken}');
          print('Access Token: ${onResponse.message!.accesstoken}');
        }
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('refreshtoken',  onResponse.message!.refreshtoken.toString());
        prefs.setString('accesstoken', onResponse.message!.accesstoken.toString());

        if (onResponse.message!.isOnboardingCompleted == false) {
          Future.microtask(() {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child:  PinCodeScreen() ));

          });

        } else if (onResponse.message!.isOnboardingCompleted == true) {
          Future.microtask(() {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const BottomNavigation()),
              (route) => false,
            );
          });
        } else {
          Fluttertoast.showToast(msg: 'Verify OTP Failed');
        }
      } else if (onResponse.status == false) {
        Fluttertoast.showToast(msg: "Invalid OTP");
      } else {
        Fluttertoast.showToast(msg: "Invalid OTP");
      }
    }).catchError((error) async {
      if (kDebugMode) {
        print('Error: $error');
      }
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
  recentOtp() async {
    startLoader();
    Webservice().callRecentOtpService().then((onResponse) async {
      stopLoader();
    }).catchError((error) async {
      stopLoader();
      print(error);
    });
  }

  // void displayBottomSheet(
  //     BuildContext context, String refreshToken, String accessToken) {
  //   showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       enableDrag: true,
  //       isDismissible: false,
  //       builder: (context) {
  //         final MediaQueryData mediaQueryData = MediaQuery.of(context);
  //
  //         return Padding(
  //           padding: EdgeInsets.only(bottom: mediaQueryData.viewInsets.bottom),
  //           child: Container(
  //             height: MediaQuery.of(context).size.height / 3,
  //             decoration: const BoxDecoration(
  //                 borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(10),
  //               topRight: Radius.circular(10),
  //             )),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Material(
  //                     elevation: 3,
  //                     child: Padding(
  //                       padding: const EdgeInsets.symmetric(
  //                           vertical: 20, horizontal: 10),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           SmallText(
  //                               text: MyStrings.pinCode,
  //                               fontWeight: FontWeight.w600,
  //                               size: 18),
  //                           InkWell(
  //                             onTap: () {
  //                               Navigator.pop(context);
  //                             },
  //                             child: Container(
  //                                 decoration: BoxDecoration(
  //                                   shape: BoxShape.circle,
  //                                   color: circleShapeColor,
  //                                 ),
  //                                 child: Padding(
  //                                   padding: const EdgeInsets.all(5.0),
  //                                   child: Icon(
  //                                     Icons.clear,
  //                                     color: primaryColor,
  //                                   ),
  //                                 )),
  //                           ),
  //                         ],
  //                       ),
  //                     )),
  //                 heightSpace,
  //                 Padding(
  //                   padding: const EdgeInsets.symmetric(
  //                       horizontal: 20, vertical: 20),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       SmallText(
  //                           text: MyStrings.enterPinCode, color: blueGrey),
  //                       TextField(
  //                         cursorColor: primaryColor,
  //                         controller: _pinCodeController,
  //                         keyboardType: TextInputType.number,
  //                         maxLength: 6,
  //                         inputFormatters: [
  //                           FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
  //                         ],
  //                         decoration: InputDecoration(
  //                           filled: false,
  //                           hoverColor: primaryColor,
  //                           focusColor: primaryColor,
  //                           isDense: true,
  //                           counterText: "",
  //                           contentPadding: const EdgeInsets.symmetric(
  //                               vertical: 10, horizontal: 12),
  //                           focusedBorder: UnderlineInputBorder(
  //                             borderSide: BorderSide(color: primaryColor),
  //                           ),
  //                         ),
  //                       ),
  //                       heightSpace,
  //                       heightSpace,
  //                       heightSpace,
  //                       Align(
  //                         alignment: Alignment.center,
  //                         child: InkWell(
  //                           onTap: () {
  //                             if (_pinCodeController.text.isEmpty) {
  //                               ScaffoldMessenger.of(context).showSnackBar(
  //                                 const SnackBar(
  //                                     content:
  //                                         Text('Please enter your Pincode')),
  //                               );
  //                             } else if (_pinCodeController.text.length < 6) {
  //                               ScaffoldMessenger.of(context).showSnackBar(
  //                                 const SnackBar(
  //                                     content: Text(
  //                                         'Please enter a valid Pin Code')),
  //                               );
  //                             } else {
  //                               pinCode(refreshToken, accessToken,
  //                                   _pinCodeController.text);
  //                             }
  //                           },
  //                           child: Container(
  //                             width: MediaQuery.of(context).size.width / 2,
  //                             height: 50,
  //                             decoration: BoxDecoration(
  //                               color: primaryColor,
  //                               borderRadius: BorderRadius.circular(5),
  //                             ),
  //                             child: Center(
  //                               child: SmallText(
  //                                 text: MyStrings.submit,
  //                                 color: whiteColor,
  //                                 fontWeight: FontWeight.w500,
  //                                 size: 16,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  // pinCode(String refreshToken, String accessToken, String pinCode) async {
  //   // networkStatus().then((isReachable) {
  //   // if (isReachable!) {
  //
  //   startLoader();
  //
  //   Webservice()
  //       .callOnBoardingService(accessToken: accessToken, pinCode: pinCode)
  //       .then((onResponse) async {
  //     stopLoader();
  //     if (kDebugMode) {
  //       print(onResponse!.message);
  //     }
  //     if (onResponse!.status = true) {
  //       Future.microtask(() {
  //         Navigator.pushAndRemoveUntil(
  //           context,
  //           // MaterialPageRoute(
  //           //     builder: (BuildContext context) => BottomNavigation(
  //           //       refreshTokenBottom:refreshToken ,
  //           //       accessTokenBottom: accessToken,
  //           //     )),
  //           MaterialPageRoute(
  //               builder: (BuildContext context) => BottomNavigation(
  //                     refreshTokenBottom: refreshToken,
  //                     accessTokenBottom: accessToken,
  //                   )),
  //           (route) => false,
  //         );
  //       });
  //     } else {
  //       Fluttertoast.showToast(msg: "Failed to Login");
  //     }
  //   }).catchError((error) async {
  //     Fluttertoast.showToast(msg: "Time Out");
  //     stopLoader();
  //     print(error);
  //   });
  // }

  void _showOTPBottomSheet(BuildContext context,mobileNumber) async {
    prefs = await SharedPreferences.getInstance();

    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 35),
                child: Column(
                    mainAxisSize: MainAxisSize.min,

                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SmallText(
                        text:'Enter Verification Code',
                        fontWeight: FontWeight.w600,
                        color: sideMenuColor,
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Center(
                      child: SmallText(
                        text: MyStrings.verificationMessage,
                        fontWeight: FontWeight.w500,
                        color: textGreyColor,
                      ),
                    ),
                    const SizedBox(height: 5,),

                    Center(
                      child: SmallText(
                        text:'+91 - $mobileNumber',
                        fontWeight: FontWeight.bold,
                        size: 16,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextField(
                      cursorColor: primaryColor,
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 6,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteColor,
                        hoverColor: primaryColor,
                        focusColor: primaryColor,
                        hintText: 'Enter OTP',
                        hintStyle: const TextStyle(color: Color(0xffB3B3B3)),
                        isDense: true,
                        counterText: "",
                        contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TimerButton(
                      label:
                      timeOutInSeconds.toString().substring(timeOutInSeconds.toString().length - 3),
                      onPressed: () {
                        recentOtp();                      },
                      timeOutInSeconds: timeOutInSeconds,
                      // buttonType: ButtonType.ElevatedButton,
                      // color: Colors.green,
                    ),
                    // PinCodeTextField(
                    //   appContext: context,
                    //   cursorHeight: 20,
                    //   length: 6, // Changed from 4 to 6
                    //   blinkWhenObscuring: true,
                    //   animationType: AnimationType.fade,
                    //   pinTheme: PinTheme(
                    //     shape: PinCodeFieldShape.circle,
                    //     fieldHeight: 75,
                    //     fieldWidth: 50,
                    //     selectedColor: const Color(0xffd8d8d8),
                    //     inactiveColor: const Color(0xffC4C5C4),
                    //     borderWidth: 1,
                    //     activeColor: const Color(0xffffdecd),
                    //     disabledColor: whiteColor,
                    //     selectedFillColor: const Color(0xffffd8c5),
                    //     inactiveFillColor: const Color(0xffd8d8d8),
                    //     activeFillColor: const Color(0xffd8d8d8),
                    //   ),
                    //   cursorColor: Colors.black.withOpacity(0.8),
                    //   animationDuration: const Duration(milliseconds: 300),
                    //   enableActiveFill: true,
                    //   // controller: otpController,
                    //   keyboardType: TextInputType.number,
                    //   onCompleted: (v) {
                    //     debugPrint("Completed");
                    //   },
                    //   onChanged: (value) {
                    //     debugPrint(value);
                    //     setState(() {
                    //       currentText = value;
                    //     });
                    //   },
                    //   beforeTextPaste: (text) {
                    //     debugPrint("Allowing to paste $text");
                    //     return true;
                    //   },
                    // ),
                    const SizedBox(height: 15,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: sideMenuColor,
                        minimumSize: const Size.fromHeight(60),
                      ),
                      onPressed: (){

                      if (otpController.text.length < 6) {
                        Fluttertoast.showToast(msg: "Please enter your OTP");
                      } else {
                         _verifyOTP( otpController.text);
                      }
                    }, child: SmallText(
                      text: MyStrings.submit,
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                      size: 16,
                    ),),

                 Text(prefs?.getString('otp') ?? '')
                  ]
                ),
              ),
            ),
          );
        });
  }


  @override
  void dispose() {
    // _mobileNumberController.dispose();
    // otpController.dispose();
    // _pinCodeController.dispose();
    super.dispose();
  }
}
