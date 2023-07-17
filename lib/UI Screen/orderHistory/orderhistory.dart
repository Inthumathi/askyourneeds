import 'package:askun_delivery_app/UI%20Screen/orderHistory/viewHistory.dart';
import 'package:askun_delivery_app/UI%20Screen/searchpage/serachpage.dart';
import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Order {
  final String orderId;
  final String date;
  final String status;
  final String productName;
  final String totalPrice;
  final String savePrice;

  Order(
      {required this.productName,
      required this.totalPrice,
      required this.status,
      required this.date,
      required this.orderId,
      required this.savePrice});
}

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

final ScrollController _scrollController = ScrollController();

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  List<Order> OrderList = <Order>[
    Order(
        productName:
            "Tomato (1k.g) Milk Packet( 1Ltr) Coriander Leaves(1Bunch) Eggs(1Dozen)",
        date: '30-06-2023 at 16:12',
        orderId: 'ord_jkdogns526',
        savePrice: '₹ 26/-',
        status: 'Delivered',
        totalPrice: '₹ 250/-'),
    Order(
        productName:
            "Tomato (1k.g) Milk Packet( 1Ltr) Coriander Leaves(1Bunch) Eggs(1Dozen)",
        date: '30-06-2023 at 16:12',
        orderId: 'ord_jkdogns754',
        savePrice: '₹ 26/-',
        status: 'Delivered',
        totalPrice: '₹ 250/-'),
    Order(
        productName:
            "Tomato (1k.g) Milk Packet( 1Ltr) Coriander Leaves(1Bunch) Eggs(1Dozen)",
        date: '30-06-2023 at 16:12',
        orderId: 'ord_jkdogns784',
        savePrice: '₹ 26/-',
        status: 'Canceled',
        totalPrice: '₹ 250/-'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orderHistoryBGColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: SmallText(text: MyStrings.myOrder.tr(), size: 20),
      ),
      body: OrderList.isEmpty
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                      child: Image(
                    image: AssetImage('assets/orderHistory/EmptyHistory.png'),
                    width: 100,
                    height: 100,
                  )),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  SmallText(
                    text: MyStrings.emptyHistory.tr(),
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
          : ListView.builder(
              controller: _scrollController,
              // scrollDirection: Axis.horizontal,
              itemCount: OrderList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    color: whiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(
                                  text:
                                      '${MyStrings.orderID.tr()}: ${OrderList[index].orderId}',
                                  color: textGreyColor,
                                  fontFamily: MyStrings.aclonica,
                                  size: 12),
                              SmallText(
                                  text: OrderList[index].date,
                                  color: textGreyColor,
                                  fontFamily: MyStrings.aclonica,
                                  size: 12),
                            ],
                          ),
                        ),
                        heightSpace,
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                  ),
                                  color:  OrderList[index].status== 'Canceled'? deliveryFailureColor: deliverySuccessColor),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: SmallText(
                                    text: OrderList[index].status,
                                    color: whiteColor,
                                    fontFamily: MyStrings.aclonica,
                                    size: 15),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                if (kDebugMode) {
                                  print('Print');
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      topLeft: Radius.circular(25),
                                    ),
                                    color:  OrderList[index].status== 'Canceled'? deliveryFailureColor: deliverySuccessColor),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: SmallText(
                                      text:MyStrings.complaints,
                                      color: whiteColor,
                                      fontFamily: MyStrings.aclonica,
                                      size: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                        heightSpace,
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: SmallText(
                                          text: OrderList[index].productName,
                                          fontFamily: MyStrings.aclonica,
                                          size: 14)),
                                  OrderList[index].status== 'Canceled'? const SizedBox() : Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: deliverySuccessColor),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          SmallText(
                                              text: OrderList[index].savePrice,
                                              color: whiteColor,
                                              size: 12,
                                              fontFamily: MyStrings.aclonica),
                                          SmallText(
                                              text: MyStrings.saved,
                                              color: whiteColor,
                                              size: 11,
                                              fontFamily: MyStrings.aclonica),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              heightSpace,
                              SmallText(
                                  text: OrderList[index].totalPrice,
                                  fontFamily: MyStrings.aclonica,
                                  size: 14),
                              const SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: OrderList[index].status== 'Canceled'? MainAxisAlignment.center: MainAxisAlignment.spaceEvenly,
                                children: [
                                  OrderList[index].status== 'Canceled'? const SizedBox() :  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      side: BorderSide(color: sideMenuColor,width: 2),
                                    ),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                                      child: SmallText(
                                        text: MyStrings.reOrder,
                                        color: sideMenuColor,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: MyStrings.aclonica,
                                      ),
                                    ),
                                  ),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      side: BorderSide(color: sideMenuColor,width: 2),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.rightToLeft,
                                              child:  const ViewHistory()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: SmallText(
                                        text: MyStrings.viewDetails,
                                        color: sideMenuColor,
                                        size: 15,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: MyStrings.aclonica,
                                      ),
                                    ),
                                  )

                                ],)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
