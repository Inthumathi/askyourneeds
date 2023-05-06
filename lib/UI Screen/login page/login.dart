  import 'package:askun_delivery_app/services/service.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/loader.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'optscreen/otpscreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mobileNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 100, 15, 50),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/logo.png',
                            height: 150,
                            width: 150,
                          ),
                        ),
                        // heightSpace,
                        Center(
                          child: SmallText(
                            text: MyStrings.login,
                            size: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        heightSpace,
                        heightSpace,


                      ],
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Container(
                      // height: MediaQuery.of(context).size.height/5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(text: MyStrings.mobileNumber),
                          heightSpace,
                          TextField(
                            cursorColor: primaryColor,
                            controller: _mobileNumberController,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                              FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                              FilteringTextInputFormatter.deny(RegExp(r'^1+')),
                              FilteringTextInputFormatter.deny(RegExp(r'^2+')),
                              FilteringTextInputFormatter.deny(RegExp(r'^3+')),
                              FilteringTextInputFormatter.deny(RegExp(r'^4+')),
                              FilteringTextInputFormatter.deny(RegExp(r'^5+')),
                            ],

                            decoration: InputDecoration(
                              filled: true,
                              hoverColor: primaryColor,
                              focusColor: primaryColor,
                              isDense: true,
                              counterText: "",
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 12, 10, 12),
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
                              prefixIcon: const Padding(
                                padding: EdgeInsets.only(top: 14.0),
                                child: Text(
                                  '+91',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
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
                                if (_mobileNumberController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Please enter the registered mobile number')),
                                  );
                                } else if (_mobileNumberController.text.length <
                                    10) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please enter a valid mobile number')),
                                  );
                                }
                               else{
                                 _login(_mobileNumberController.text);
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
                    // heightSpace,
                    // heightSpace,
                    // heightSpace,
                    // heightSpace,
                    // Center(
                    //     child: SmallText(
                    //   text: MyStrings.dummyMessage,
                    //   color: blueGrey,
                    //   fontStyle: FontStyle.italic,
                    //   fontWeight: FontWeight.w400,
                    // ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _login( String mobilenumber) async {

    // networkStatus().then((isReachable) {
    // if (isReachable!) {

    startLoader();

    Webservice()
        .callLoginService(phoneNumber: mobilenumber)
        .then((onResponse) async {
          stopLoader();
          print(onResponse!.message);
          if(onResponse.status = true){
            final message = onResponse.message; // Get the message from the response
            final otp = onResponse.otp;
            Fluttertoast.showToast(msg: "Otp send to your register Mobile number");
            await Future.delayed(const Duration(seconds: 2));
                 Navigator.push(
                     context,
                     PageTransition(
                         type: PageTransitionType.rightToLeft, child:  OTPScreen(token: message, oTP: otp,)));
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
