
import 'package:askun_delivery_app/UI%20Screen/buttom_navigation.dart';
import 'package:askun_delivery_app/UI%20Screen/login%20page/optscreen/timer.dart';
import 'package:askun_delivery_app/services/service.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/loader.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class OTPScreen extends StatefulWidget {
final String? token;

   OTPScreen({Key? key,required this.token}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  // int _counter = 60;
  // late Timer _timer;

  int timeOutInSeconds = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:scafoldBodyColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffffd6c2)),
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
              SmallText(
                text: MyStrings.enterOTP.toUpperCase(),
                fontWeight: FontWeight.w500,
              ),
              heightSpace,
              Form(
                key: formKey,
                child: PinCodeTextField (
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  TimerButton(
                    label: "Time remaining: ${timeOutInSeconds.toString().substring(timeOutInSeconds.toString().length - 3)}",
                    // timeOutInSeconds: 120,
                    onPressed: () {
                      recentOtp('${widget.token}');
                    }, timeOutInSeconds: timeOutInSeconds,
                    // buttonType: ButtonType.ElevatedButton,
                    // color: Colors.green,
                  ),
                  InkWell(
                    onTap: () {
                      if(otpController.text.length < 6){
                        Fluttertoast.showToast(msg:"Please enter your OTP");
                      }
                      else{
                        _verifyOTP('${widget.token}',otpController.text);
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
  _verifyOTP(String token,String verifyOTP) async {
    startLoader();
    Webservice()
        .callVerifyOtpService(token: token ,otpCode: verifyOTP )
        .then((onResponse) async {

          stopLoader();
          if(onResponse!.status == true){

            await Future.delayed(const Duration(seconds: 2));
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft, child:  BottomNavigation()));
          }
          else if(onResponse.status == false){
            Fluttertoast.showToast(msg: "Ivalid OTP");
          }
          else{
            Fluttertoast.showToast(msg: "Invalid OTP");

          }
    }).catchError((error) async {
      print('Error: $error');
      if(error.toString().contains('Exception: Failed to login'))
        {
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
  recentOtp(String token, ) async {
    startLoader();
    Webservice()
        .callRecentOtpService(token: token )
        .then((onResponse) async {

          stopLoader();
          // if(onResponse.status == true){
          //
          //   await Future.delayed(const Duration(seconds: 2));
          //   Navigator.push(
          //       context,
          //       PageTransition(
          //           type: PageTransitionType.rightToLeft, child:  BottomNavigation()));
          // }
          // else{
          //   Fluttertoast.showToast(msg: "Invalid OTP");
          //
          // }
    }).catchError((error) async {
      // // handle errors here
      // if (error.toString().contains('Invalid OTP')) {
      //   Fluttertoast.showToast(msg: 'Invalid OTP');
      // }
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
