import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../utilites/constant.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: SmallText(text: MyStrings.profile.tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(
                    text: MyStrings.personalDetails.tr(),
                    size: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: SmallText(
                      text: MyStrings.edit.tr(),
                      size: 16,
                      fontWeight: FontWeight.w500,
                      color: offerColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    child: Icon(Icons.person, size: 130, color: Colors.black),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(text: MyStrings.yourName,color: Colors.black,size: 16,fontWeight: FontWeight.w500),


                      heightSpace,
                    SmallText(text: MyStrings.emailId,color: Colors.black,size: 16,fontWeight: FontWeight.w500),
                      heightSpace,
                      Container(
                        color: Colors.grey,
                        height: 1,
                        width: 220,
                      ),
                      heightSpace,
                      SmallText(text: MyStrings.phoneNumber,color: Colors.black,size: 16,fontWeight: FontWeight.w500),
                      heightSpace,
                      Container(
                        color: Colors.grey,
                        height: 1,
                        width: 220,
                      ),
                      heightSpace,
                      SmallText(text: MyStrings.address,color: Colors.black,size: 16,fontWeight: FontWeight.w500)
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SmallText(text: MyStrings.myWallet,fontWeight: FontWeight.w500),
              heightSpace,
              const Image(image: AssetImage('assets/profile/wallet.png')),
              const SizedBox(height: 30),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                        text: MyStrings.moneyWallet.tr(),
                        color: Colors.black,
                        size: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        width: 330,
                        child: TextFormField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter amount',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SmallText(
                                          text: "+\u{20B9}${500}",
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 90,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SmallText(
                                          text: "+\u{20B9}${1000}",
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 90,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SmallText(
                                          text: "+\u{20B9}${2000}",
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        alignment: Alignment.topLeft,
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color(0xff33056F),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Color(0xff33056F),
                          ),
                        ),
                        child: Center(
                          child: SmallText(
                            text: "Submit",
                            color: whiteColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              heightSpace,
              SmallText(text:MyStrings.activity.tr(),fontWeight: FontWeight.w500)
            ],
          ),
        ),
      ),
    );
  }
}
