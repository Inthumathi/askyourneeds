import 'package:askun_delivery_app/Models/Sidemenu/userprofile/profile.dart';
import 'package:askun_delivery_app/UI%20Screen/profile/updateProfile.dart';
import 'package:askun_delivery_app/services/service.dart';
import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/loader.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

class Address {
  final String name;

  Address({required this.name});
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _amountController = TextEditingController();
  bool isLoader = false;
  ProfileMessage? profileMessage;
  Contact? contact;
  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  List<Address> addressList = <Address>[
    Address(
      name: 'Money added to wallet from HDFC Bank',
    ),
    Address(
      name: 'John Abrahan',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }

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
          child: isLoader
              ? Center(
                  child: SpinKitFadingCircle(
                    color: sideMenuColor,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallText(
                          text: MyStrings.personalDetails.tr(),
                          size: 16,
                          fontFamily: MyStrings.aclonica,
                          fontWeight: FontWeight.w500,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: const UpdateProfile()));
                          },
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
                          width: 100,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SmallText(
                                text: profileMessage?.name?.toString() ?? '',
                                size: 16,
                                fontFamily: MyStrings.aclonica,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    color: textGreyColor,
                                    size: 20,
                                  ),
                                  widthSpace,
                                  Expanded(
                                    child: SmallText(
                                      text: profileMessage?.email?.toString() ??'',
                                      color: textGreyColor,
                                      fontFamily: MyStrings.aclonica,
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Divider(
                                thickness: 1,
                                color: textGreyColor,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: textGreyColor,
                                    size: 20,

                                  ),
                                  widthSpace,
                                  SmallText(
                                    text: profileMessage?.number?.toString() ?? '',
                                    color: textGreyColor,
                                    fontFamily: MyStrings.aclonica,
                                    size: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Divider(
                                thickness: 1,
                                color: textGreyColor,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              SmallText(
                                text: '${(profileMessage?.address?.toString() ?? '').replaceAll(RegExp(r'[\[\]]'), '')} - ${(profileMessage?.pincode?.toString() ?? '').replaceAll(RegExp(r'[\[\]]'), '')}',
                                color: textGreyColor,
                                fontFamily: MyStrings.aclonica,
                                size: 14,
                                fontWeight: FontWeight.w500,
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SmallText(
                      text: MyStrings.myWallet,
                      fontWeight: FontWeight.w500,
                      fontFamily: MyStrings.aclonica,
                    ),
                    heightSpace,
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/profile/wallet.png'),
                            fit: BoxFit.fill),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallText(
                              text: MyStrings.balance,
                              fontFamily: MyStrings.aclonica,
                              color: whiteColor,
                              size: 16,
                            ),
                            heightSpace,
                            SmallText(
                              text: '₹ 2400.00/-',
                              fontFamily: MyStrings.aclonica,
                              color: whiteColor,
                              size: 16,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            SmallText(
                              text:profileMessage?.name?.toString() ?? '',
                              fontFamily: MyStrings.aclonica,
                              color: whiteColor,
                              size: 16,
                            ),
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
                                hintStyle: const TextStyle(
                                    fontFamily: MyStrings.aclonica),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black54),
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
                                        border: Border.all(
                                            color: const Color(0xffBFBFBF)),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: SmallText(
                                            text: "+\u{20B9}${1000}",
                                            color: blackColor,
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
                                        border: Border.all(
                                            color: const Color(0xffBFBFBF)),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: SmallText(
                                            text: "+\u{20B9}${2000}",
                                            color: blackColor,
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
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                minimumSize: const Size.fromHeight(60),
                              ),
                              onPressed: () {},
                              child: SmallText(
                                text: MyStrings.submit,
                                fontFamily: MyStrings.aclonica,
                              ),
                            ),
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
                          borderRadius: BorderRadius.circular(10)),
                      child: ExpansionTile(
                        collapsedTextColor: blackColor,
                        textColor: blackColor,
                        collapsedIconColor: blackColor,
                        iconColor: blackColor,
                        title: SmallText(
                          text: MyStrings.activity,
                          fontFamily: MyStrings.aclonica,
                        ),
                        children: <Widget>[
                          ListTile(
                            title: ListView.builder(
                              itemCount: addressList.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(
                                            Icons.account_balance,
                                            color: Color(0xff757575),
                                            size: 30,
                                          ),
                                          widthSpace,
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SmallText(
                                                  text: addressList[index].name,
                                                  color:
                                                      const Color(0xff5C5C5C),
                                                  fontWeight: FontWeight.bold,
                                                  size: 18,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                SmallText(
                                                  text: '08-05-2023, 11:32',
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SmallText(
                                            text: '+ ₹2400',
                                            color: const Color(0xff40A527),
                                            fontWeight: FontWeight.w600,
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: blueGrey.withOpacity(0.3),
                                      thickness: 1,
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

  void _getUserDetails() async {
    try {
      setState(() {
        isLoader = true;
      });

      final response = await Webservice().fetchUserProfile();

      if (response.status == true) {
        profileMessage = response.message; // Assign value to profileMessage
        contact = response.contact;
        if (profileMessage != null) {
          if (kDebugMode) {
            print('UserDetails: $profileMessage');
            print('phone number: ${profileMessage!.number}');
          } // Add this line for debugging
        } else {
          // Handle error case here
        }
      } else {
        // Handle error case here
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }

    setState(() {
      isLoader = false;
    });
  }

  startLoader() {
    LoadingDialog.showLoaderDialog(context, 'Please Wait..');
  }

  stopLoader() {
    Navigator.of(context).pop();
  }
}
