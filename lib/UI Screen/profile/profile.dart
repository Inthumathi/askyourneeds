import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


class Address {
  final String name;
  final String doorNo;
  final String streetName;
  final String pinCode;
  final String landMark;
  final String phoneNumber;
  final String number;

  Address(
      {required this.name,
        required this.doorNo,
        required this.streetName,
        required this.pinCode,
        required this.landMark,
        required this.phoneNumber,
        required this.number});
}


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
  List<Address> addressList = <Address>[
    Address(
        name: 'Karthick',
        doorNo: 'Door no:A1',
        streetName: 'Gopal Nagar',
        pinCode: '600100',
        landMark: 'Near Football Court Opposite',
        phoneNumber: 'PhoneNumber:',
        number: '9080134122'),
    Address(
        name: 'John Abrahan',
        doorNo: 'Door no:9',
        streetName: 'Gopal Nagar',
        pinCode: '600100',
        landMark: 'Near Football Court Opposite',
        phoneNumber: 'PhoneNumber:',
        number: '9080134122'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: SmallText(text: MyStrings.profile.tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    image: AssetImage('assets/profile/profileImage.png'),
                    width: 120,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SmallText(
                            text: MyStrings.yourName,
                            size: 16,
                            fontFamily: MyStrings.aclonica,
                            fontWeight: FontWeight.w600),
                        const SizedBox(height: 7,),
                        SmallText(
                            text: MyStrings.emailId,
                            color: textGreyColor,
                            fontFamily: MyStrings.aclonica,
                            size: 16,
                            fontWeight: FontWeight.w500),
                        const SizedBox(height: 7,),
                        Divider(
                          thickness: 1,
                          color: textGreyColor,
                        ),
                        const SizedBox(height: 7,),
                        SmallText(
                            text: MyStrings.phoneNumber,
                            color: textGreyColor,
                            fontFamily:MyStrings.aclonica,
                            size: 16,
                            fontWeight: FontWeight.w500),
                        const SizedBox(height: 7,),
                        Divider(
                          thickness: 1,
                          color: textGreyColor,
                        ),
                        const SizedBox(height: 7,),
                        SmallText(
                            text: MyStrings.address,
                            color: textGreyColor,
                            fontFamily:MyStrings.aclonica,
                            size: 16,
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SmallText(text: MyStrings.myWallet, fontWeight: FontWeight.w500,  fontFamily: MyStrings.aclonica,),
              heightSpace,
              Container(
                width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/profile/wallet.png'),
                      fit: BoxFit.fill
                    )
                  ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 35),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(text: MyStrings.balance,fontFamily: MyStrings.aclonica,color: whiteColor,size: 16,),
                      heightSpace,
                      SmallText(text: '₹ 2400.00/-',fontFamily: MyStrings.aclonica,color: whiteColor,size: 16,),
                      const SizedBox(height: 50,),
                      SmallText(text: 'Jaya Kranthi',fontFamily: MyStrings.aclonica,color: whiteColor,size: 16,),

                    ],
                  ),
                ),

              ),
              const SizedBox(height: 40),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                        text: MyStrings.moneyWallet.tr(),
                        fontFamily: MyStrings.aclonica,
                        size: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      heightSpace,
                      TextFormField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Enter Amount',
                          hintStyle: const TextStyle(fontFamily: MyStrings.aclonica),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: SmallText(
                                      text: "+\u{20B9}${500}",
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            widthSpace,
                            Expanded(
                              child: Container(
                                width: 90,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: SmallText(
                                      text: "+\u{20B9}${1000}",
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            widthSpace,
                            Expanded(
                              child: Container(
                                width: 90,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: SmallText(
                                      text: "+\u{20B9}${2000}",
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:  BorderRadius.circular(30.0),
                            ),
                            minimumSize: const Size.fromHeight(60),
                          ),
                          onPressed: (){}, child: SmallText(text: MyStrings.submit,fontFamily: MyStrings.aclonica,)),
                      heightSpace
                    ],
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child:  ExpansionTile(
                  title: SmallText(text: MyStrings.activity,fontFamily: MyStrings.aclonica),
                  children:  <Widget>[
                    ListTile(title: ListView.builder(
                      itemCount: addressList.length,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () {

                                },
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, bottom: 5, left: 10, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.account_balance,color: Color(0xff757575)),
                                        SmallText(
                                            text: addressList[index].name,
                                            color: const Color(0xff181818),
                                            fontWeight: FontWeight.bold,
                                            size: 18),
                                      ],
                                    )),
                              ),
                            ),
                            Divider(
                              color: blueGrey.withOpacity(0.3),thickness: 1,
                            )
                          ],
                        );
                      },
                    ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
