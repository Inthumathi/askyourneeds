import 'package:askun_delivery_app/UI%20Screen/homepage/homepage.dart';
import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'addaddress.dart';

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

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  int activeAddress = 0;
  bool onpress = false;
  int _expandedIndex = -1;

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

  void showWidget() {
    setState(() {
      onpress = true;
    });
  }

  void hideWidget() {
    setState(() {
      onpress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:appBarColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
        icon:  Icon((Icons.arrow_back), color: blackColor),),
        title: SmallText(
          text: MyStrings.selectDeliverAddress,
          color: blackColor,
          fontWeight: FontWeight.w500,
          size: 18,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child:  const AddAddress()));
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                          color: blueGrey,
                          width: 1,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.add, color: primaryColor),
                              const SizedBox(
                                width: 15,
                              ),
                              SmallText(
                                text: 'Add Address',
                                size: 16,
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 18, color: primaryColor)
                        ],
                      ),
                    )),
              ),
            ),
            heightSpace,
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: SmallText(
                text: MyStrings.savedAddress,
                color: primaryColor,
                size: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            ListView.builder(
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
                          setState(() {
                            activeAddress = index;
                          });
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child:   HomeScreen(selectedAddress: addressList[activeAddress].streetName)));
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, bottom: 5, left: 10, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallText(
                                        text: addressList[index].name,
                                        color: const Color(0xff181818),
                                        fontWeight: FontWeight.bold,
                                        size: 18),
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        border: Border.all(
                                            width: 1.5,
                                            color: (activeAddress == index)
                                                ? primaryColor
                                                : Colors.blueGrey),
                                      ),
                                      child: Container(
                                        width: 10.0,
                                        height: 10.0,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: (activeAddress == index)
                                              ? primaryColor
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                heightSpace,
                                SmallText(
                                    text: addressList[index].doorNo,
                                    color: addressTextColor),
                                SmallText(
                                    text: addressList[index].streetName,
                                    color: addressTextColor),
                                SmallText(
                                    text: addressList[index].pinCode,
                                    color: addressTextColor),
                                SmallText(
                                    text: addressList[index].landMark,
                                    color: addressTextColor),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.call,
                                            size: 16, color: addressTextColor),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SmallText(
                                            text: addressList[index].number,
                                            color: addressTextColor),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // _expandedIndex == index ? showWidget():hideWidget();
                                        setState(() {
                                          _expandedIndex = _expandedIndex == index
                                              ? -1
                                              : index;
                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: containerLightColor),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Icon(
                                              Icons.more_horiz,
                                              color: primaryColor,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                heightSpace,
                                heightSpace,
                                _expandedIndex == index ?
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.edit_outlined,
                                              color: primaryColor, size: 22),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SmallText(
                                            text: MyStrings.edit,
                                            fontWeight: FontWeight.w500,
                                            size: 17,
                                            color: primaryColor,
                                          )
                                        ],
                                      ),
                                      widthSpace,
                                      Row(
                                        children: [
                                          Icon(Icons.delete,
                                              color: primaryColor, size: 22),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SmallText(
                                            text: MyStrings.remove,
                                            fontWeight: FontWeight.w500,
                                            size: 17,
                                            color: primaryColor,
                                          )
                                        ],
                                      ),
                                    ],
                                  ):const SizedBox(),
                              ],
                            )),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: blueGrey.withOpacity(0.3),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
