
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


   OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  // int _counter = 60;
  // late Timer _timer;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmallText(text:'Didn\'t Receive Anything?',size: 16,color: blueGrey,),
            const SizedBox(width: 5,),
            InkWell(
                onTap: (){
                },
                child: SmallText(text:'Resend Code',fontWeight: FontWeight.w500,color: primaryColor,)),
          ],
        ),
      ),
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
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField (
                      appContext: context,

                      cursorHeight: 20,
                      // pastedTextStyle: TextStyle(
                      //   // color: Colors.green.shade600,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      length: 4,
                      // obscureText: true,
                      // obscuringCharacter: '*',
                      // obscuringWidget: const FlutterLogo(
                      //   size: 24,
                      // ),
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      // validator: (v) {
                      //   if (v!.length < 3) {
                      //     return "I'm from validator";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.circle,
                        fieldHeight: 75,
                        fieldWidth: 60,
                        // borderRadius: BorderRadius.circular(5),
                        // errorBorderColor:  Color(0xffC4C5C4),
                        selectedColor: const Color(0xffd8d8d8),
                        inactiveColor: const Color(0xffC4C5C4),
                        borderWidth: 1,
                        activeColor: const Color(0xffffdecd),
                        disabledColor: whiteColor,
                        selectedFillColor: const Color(0xffffd8c5),
                        inactiveFillColor: const Color(0xffd8d8d8),
                        // fieldHeight: 50,
                        // fieldWidth: 40,
                        activeFillColor: const Color(0xffd8d8d8),
                      ),
                      cursorColor: Colors.black.withOpacity(0.8),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      // errorAnimationController: errorController,
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      // boxShadows: const [
                      //   BoxShadow(
                      //     offset: Offset(0, 1),
                      //     color: Colors.black12,
                      //     blurRadius: 10,
                      //   )
                      // ],
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
                    )),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  TimerButton(
                    label: "Try Again",
                    timeOutInSeconds: 30,
                    onPressed: () {},
                    // buttonType: ButtonType.ElevatedButton,
                    // color: Colors.green,
                  ),
                  InkWell(
                    onTap: () {
                      if(otpController.text.length < 4){
                        Fluttertoast.showToast(msg:"Please enter your OTP");
                      }
                      else{
                        _verifyOTP(otpController.text);
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



  _verifyOTP(String verifyOTP) async {
    startLoader();
    Webservice()
        .callVerifyOtpService(otpCode: verifyOTP)
        .then((onResponse) async {
          print(onResponse!.refresh);
          print(onResponse.access);
          stopLoader();
          if(onResponse.msg=="access token generated successfully"){
            print(onResponse);
            print("SUCCESS");
            await Future.delayed(const Duration(seconds: 2));
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft, child:  BottomNavigation()));
          }
          else{
            Fluttertoast.showToast(msg: "Invalid OTP");

          }
    }).catchError((error) async {
      // handle errors here
      if (error.toString().contains('Invalid OTP')) {
        Fluttertoast.showToast(msg: 'Invalid OTP');
      }
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
