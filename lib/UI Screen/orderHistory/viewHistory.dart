import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:flutter/material.dart';

class Order {
  final String orderId;
  final String date;
  final String status;
  final String productName;
  final String totalPrice;
  final String savePrice;

  Order({
    required this.productName,
    required this.totalPrice,
    required this.status,
    required this.date,
    required this.orderId,
    required this.savePrice,
  });
}

class ViewHistory extends StatefulWidget {
  const ViewHistory({Key? key}) : super(key: key);

  @override
  State<ViewHistory> createState() => _ViewHistoryState();
}

class _ViewHistoryState extends State<ViewHistory> {
  List<Order> orderList = <Order>[
    Order(
      productName:
      "Tomato (1k.g) Milk Packet( 1Ltr) Coriander Leaves(1Bunch) Eggs(1Dozen)",
      date: '30-06-2023 at 16:12',
      orderId: 'ord_jkdogns526',
      savePrice: '₹ 26/-',
      status: 'Delivered',
      totalPrice: '₹ 250/-',
    ),
    Order(
      productName:
      "Tomato (1k.g) Milk Packet( 1Ltr) Coriander Leaves(1Bunch) Eggs(1Dozen)",
      date: '30-06-2023 at 16:12',
      orderId: 'ord_jkdogns754',
      savePrice: '₹ 26/-',
      status: 'Delivered',
      totalPrice: '₹ 250/-',
    ),
    Order(
      productName:
      "Tomato (1k.g) Milk Packet( 1Ltr) Coriander Leaves(1Bunch) Eggs(1Dozen)",
      date: '30-06-2023 at 16:12',
      orderId: 'ord_jkdogns784',
      savePrice: '₹ 26/-',
      status: 'Canceled',
      totalPrice: '₹ 250/-',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgMainColor,
      appBar: AppBar(
        title: const SmallText(
          text: MyStrings.viewDetails,
          fontFamily: MyStrings.aclonica,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SmallText(
                                text: '${MyStrings.orderID}:',
                                size: 15,
                              ),
                              heightSpace,
                              const SmallText(
                                text: MyStrings.createdAt,
                                size: 15,
                              ),
                              heightSpace,
                              const SmallText(
                                text: '${MyStrings.deliveryStatus}:  ',
                                size: 15,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SmallText(
                                text: 'ord_hjkdnsk745',
                                size: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              heightSpace,
                              const SmallText(
                                text: '01-07-2023 at 2:40 PM',
                                size: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              heightSpace,
                              const SmallText(
                                text: 'Delivered',
                                size: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Flexible(
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      elevation: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: orderList.length,
                          itemBuilder: (context, index) {
                            final isLastItem = index == orderList.length - 1;
                            return Container(
                              color: whiteColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                      vertical: 8,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        heightSpace,
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Image(
                                              image: AssetImage(
                                                'assets/pincode/logo.png',
                                              ),
                                              width: 30,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                      2,
                                                  child: SmallText(
                                                    text:
                                                    orderList[index].productName,
                                                    fontFamily: MyStrings.aclonica,
                                                    size: 12,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    maxLine: 2,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .local_grocery_store_outlined,
                                                      color: blackColor,
                                                      size: 15,
                                                    ),
                                                    widthSpace,
                                                    const SmallText(text: 'Groceries'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                SmallText(
                                                  text: orderList[index].totalPrice,
                                                  size: 12,
                                                  decoration:
                                                  TextDecoration.lineThrough,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                SmallText(
                                                  text: orderList[index].totalPrice,
                                                  fontFamily: MyStrings.aclonica,
                                                  size: 12,
                                                  color: secondPrimaryColor,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        heightSpace,
                                        if (!isLastItem)
                                          Divider(
                                            thickness: 2,
                                            color: dividerColor.withOpacity(0.3),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              SmallText(text: MyStrings.subTotal),
                              SmallText(text: '₹ 250/-'),
                            ],
                          ),
                          heightSpace,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.account_balance_outlined,
                                        size: 15,
                                        color: primaryColor,
                                      ),
                                      widthSpace,
                                      const SmallText(
                                        text: MyStrings.gst,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      widthSpace,
                                      Icon(
                                        Icons.info_outline,
                                        size: 15,
                                        color: primaryColor,
                                      ),
                                    ],
                                  ),
                                  const SmallText(
                                    text: '₹ 250/-',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              heightSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.delivery_dining,
                                        size: 20,
                                        color: primaryColor,
                                      ),
                                      widthSpace,
                                      const SmallText(
                                        text: MyStrings.deliveryChargesFor5Kms,
                                        size: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      widthSpace,
                                      Icon(
                                        Icons.info_outline,
                                        size: 15,
                                        color: primaryColor,
                                      ),
                                    ],
                                  ),
                                  const SmallText(
                                    text: '₹ 250/-',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              heightSpace,
                              Divider(
                                thickness: 2,
                                color: dividerColor.withOpacity(0.3),
                              ),
                              heightSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  SmallText(
                                    text: MyStrings.totalAmount,
                                    size: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SmallText(
                                    text: '₹ 250/-',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
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
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: secondPrimaryColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: SmallText(
                              text: MyStrings.reOrder,
                              color: secondPrimaryColor,
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: secondPrimaryColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: SmallText(
                              text: MyStrings.suggestProduct,
                              color: secondPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      heightSpace,
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: saveColor,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SmallText(
                        text: 'You have Saved ₹ 26/-',
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
