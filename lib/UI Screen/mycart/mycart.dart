import 'package:askun_delivery_app/UI%20Screen/address/addaddress.dart';
import 'package:askun_delivery_app/UI%20Screen/address/address.dart';
import 'package:askun_delivery_app/UI%20Screen/mycart/bookSlot.dart';
import 'package:askun_delivery_app/UI%20Screen/searchpage/serachpage.dart';
import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';

class Cart {
  final String img;
  final String productName;
  final String qty;
  final String price;
  int count;

  Cart(
      {required this.img,
      required this.productName,
      required this.qty,
      required this.price,
      required this.count});
}

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

List<Cart> cartList = <Cart>[
  Cart(
      price: '1230',
      img: MyStrings.img1,
      productName: 'Kurnool old rice',
      qty: '25Kg',
      count: 1),
  Cart(
      price: '30',
      img: MyStrings.img2,
      productName: 'Tomato',
      qty: '5Kg',
      count: 1),
];

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

int activeAddress = 0;
bool onpress = false;
int _expandedIndex = -1;

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgMainColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: SmallText(text: MyStrings.myCart.tr(), size: 20),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action here
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification action here
            },
          ),
        ],
      ),
      body: cartList.isEmpty
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                      child: Image(
                    image: AssetImage('assets/cart/EmptyCart.png'),
                    width: 100,
                    height: 100,
                  )),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  SmallText(
                    text: MyStrings.emptyOrder.tr(),
                    fontWeight: FontWeight.w500,
                    size: 18,
                  ),
                  heightSpace,
                  SmallText(
                    text: MyStrings.emptyHistoryMsg.tr(),
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    size: 15,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const SearchScreen())),
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(), backgroundColor: primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                      child: SmallText(
                          text: MyStrings.startOrdering.tr(),
                          color: whiteColor),
                    ),
                  )
                ],
              ),
            ) // Display this when cartList is empty
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 16, right: 16),
                    child: ListView(
                      children: [
                        Center(
                          child: SmallText(
                            text: MyStrings.itemsAdded.toUpperCase(),
                            fontWeight: FontWeight.bold,
                            size: 18,
                          ),
                        ),
                        heightSpace,
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.builder(
                                  itemCount: cartList.length,
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    int count = cartList[index]
                                        .count; // Get the count value for the item

                                    void incrementCount() {
                                      setState(() {
                                        cartList[index]
                                            .count++; // Increment the count
                                      });
                                    }

                                    void decrementCount() {
                                      if (cartList[index].count > 1) {
                                        setState(() {
                                          cartList[index]
                                              .count--; // Decrement the count
                                        });
                                      }
                                    }

                                    return Slidable(
                                      endActionPane: ActionPane(
                                          dragDismissible: true,
                                          motion: const ScrollMotion(),
                                          extentRatio: 0.25,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: InkWell(
                                                child: Icon(Icons.delete,
                                                    color: secondPrimaryColor),
                                                onTap: () {},
                                              ),
                                            ),
                                          ]),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    cartList[index].img),
                                                height: 50,
                                                width: 50,
                                              ),
                                              widthSpace,
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SmallText(
                                                      text: cartList[index]
                                                          .productName,
                                                      size: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          MyStrings.poppins,
                                                    ),
                                                    SmallText(
                                                      text:
                                                          '(${cartList[index].qty})',
                                                      size: 14,
                                                      color: blackColor,
                                                      fontFamily:
                                                          MyStrings.poppins,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  heightSpace,
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: secondPrimaryColor,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15,
                                                          vertical: 2),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            onTap:
                                                                decrementCount, // Call the decrement function
                                                            child: Icon(
                                                              Icons.remove,
                                                              size: 22,
                                                              color: whiteColor,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          SmallText(
                                                            text: '$count',
                                                            color: whiteColor,
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          InkWell(
                                                            onTap:
                                                                incrementCount, // Call the increment function
                                                            child: Icon(
                                                              Icons.add,
                                                              size: 22,
                                                              color: whiteColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  SmallText(
                                                    text:
                                                        '\u{20B9} ${cartList[index].price} /-',
                                                    fontFamily:
                                                        MyStrings.poppins,
                                                    size: 17,
                                                    fontWeight: FontWeight.w500,
                                                    color: secondPrimaryColor,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: dividerColor,
                                            thickness: 2,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add, color: blackColor),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SmallText(
                                          text: 'Add More Items',
                                          color: blackColor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: MyStrings.poppins),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: SmallText(
                              text: MyStrings.chooseTimeSlot.toUpperCase(),
                              fontWeight: FontWeight.bold,
                              size: 18),
                        ),
                        heightSpace,
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: const BookSlotScreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SmallText(
                                    text: MyStrings.chooseTimeSlot,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: MyStrings.poppins,
                                    color: blackColor,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: blackColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: SmallText(
                              text: MyStrings.coupon.toUpperCase(),
                              fontWeight: FontWeight.bold,
                              size: 18),
                        ),
                        heightSpace,
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SmallText(
                                  text: MyStrings.applyCoupon,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: MyStrings.poppins,
                                  color: blackColor,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: blackColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: SmallText(
                              text: MyStrings.billSummary.toUpperCase(),
                              fontWeight: FontWeight.bold,
                              size: 18),
                        ),
                        heightSpace,
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff165815),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SmallText(
                                            text: MyStrings.subTotal,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SmallText(
                                            text: '\u{20B9}1280/-',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                      heightSpace,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.account_balance,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SmallText(
                                                text: MyStrings.gst,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              Icon(
                                                Icons.info_outlined,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                          SmallText(
                                            text: '\u{20B9}1280/-',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                      heightSpace,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                  Icons.local_shipping_outlined,
                                                  color: primaryColor),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SmallText(
                                                text: MyStrings
                                                    .deliveryChargesFor5Kms,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Icon(Icons.info_outlined,
                                                  color: primaryColor),
                                            ],
                                          ),
                                          SmallText(
                                            text: '\u{20B9}1280/-',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                      heightSpace,
                                      Divider(
                                        color: dividerColor,
                                        thickness: 1,
                                      ),
                                      heightSpace,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SmallText(
                                            text: MyStrings.totalAmount,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: MyStrings.poppins,
                                          ),
                                          SmallText(
                                            text: '\u{20B9}1280/-',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                      text: MyStrings.totalSaving,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: MyStrings.poppins,
                                      color: whiteColor,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SmallText(
                                      text: '\u{20B9}280/-',
                                      color: whiteColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), //color of shadow
                        spreadRadius: 7, //spread radius
                        blurRadius: 7, // blur radius
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SmallText(
                                  size: 20,
                                  text: '\u{20B9}1280/-',
                                  fontWeight: FontWeight.w700,
                                ),
                                SmallText(
                                  text: MyStrings.totalAmount,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: secondPrimaryColor),
                              onPressed: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: SmallText(
                                  text: MyStrings.proceedToPay,
                                  color: whiteColor,
                                  fontWeight: FontWeight.w500,
                                  size: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: dividerColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1, // Adjust the flex value as needed
                              child: Row(
                                children: [
                                  Icon(Icons.location_on, color: primaryColor),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: SmallText(
                                      text:
                                          "5-5-578/2, Opposite Vconvention Hall...",
                                      overflow: TextOverflow.ellipsis,
                                      maxline: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  backgroundColor: whiteColor,
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25)),
                                  ),
                                  builder: (context) {
                                    return SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(25),
                                                        topRight:
                                                            Radius.circular(
                                                                25)),
                                                color: addressContainerColor),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SmallText(
                                                    text: MyStrings
                                                        .chooseDeliverAddress,
                                                    fontFamily:
                                                        MyStrings.aclonica,
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      icon: const Icon(
                                                          Icons.clear))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 20, 15, 10),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    PageTransition(
                                                        type: PageTransitionType
                                                            .rightToLeft,
                                                        child:
                                                            const AddAddress()));
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(Icons.add_circle,
                                                      color: primaryColor),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  SmallText(
                                                    text:
                                                        MyStrings.addNewAddress,
                                                    size: 16,
                                                    fontFamily:
                                                        MyStrings.aclonica,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2,
                                            color:
                                                dividerColor.withOpacity(0.3),
                                          ),
                                          ListView.builder(
                                            itemCount: addressList.length,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    activeAddress = index;
                                                  });
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                                                  child: Card(
                                                    elevation: 3,
                                                    color: whiteColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SmallText(
                                                            text: addressList[
                                                                    index]
                                                                .name,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontFamily:
                                                                MyStrings
                                                                    .aclonica,
                                                          ),
                                                          const SizedBox(height: 5,),
                                                          Divider(
                                                            color: dividerColor
                                                                .withOpacity(
                                                                    0.2),
                                                            thickness: 2,
                                                          ),
                                                          const SizedBox(height: 5,),
                                                          SmallText(
                                                              text:
                                                                  '${addressList[index].doorNo}, ${addressList[index].streetName}- ${addressList[index].pinCode},Land Mark: ${addressList[index].landMark}',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: blackColor,
                                                              size: 14,
                                                              fontFamily:
                                                                  MyStrings
                                                                      .aclonica),
                                                          Divider(
                                                            color: dividerColor
                                                                .withOpacity(
                                                                    0.2),
                                                            thickness: 2,
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                  Icons
                                                                      .call,
                                                                  size: 16,
                                                                  ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              SmallText(
                                                                  text: addressList[
                                                                          index]
                                                                      .number,
                                                                  size: 14,
                                                                  fontFamily:
                                                                  MyStrings
                                                                      .aclonica),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: SmallText(
                                text: MyStrings.change,
                                color: sideMenuColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
