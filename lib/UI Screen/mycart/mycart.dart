import 'package:askun_delivery_app/UI%20Screen/searchpage/serachpage.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Cart {
  final String productName;
  final String img;
  final String qty;

  Cart({required this.productName, required this.img, required this.qty});
}

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

final ScrollController _scrollController = ScrollController();

class _CartScreenState extends State<CartScreen> {
  List<Cart> cartList = <Cart>[
    // Cart(productName: "Rice", img: MyStrings.img3, qty: "1KG"),
    // Cart(productName: "Ghee", img: MyStrings.img3, qty: '1L'),
    // Cart(productName: "Apple", img: MyStrings.img3, qty: '1KG'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f1f6),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: SmallText(text: MyStrings.myCart.tr(), size: 20),
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
                        shape: StadiumBorder(), backgroundColor: primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                      child: SmallText(
                          text: MyStrings.startOrdering.tr(), color: whiteColor),
                    ),
                  )
                ],
              ),
            ) // Display this when cartList is empty
          : ListView.builder(
              controller: _scrollController,
              // scrollDirection: Axis.horizontal,
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 18, right: 8, top: 10, bottom: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 180,
                    color: whiteColor,
                    child: Row(
                      children: [
                        Image.asset(
                          cartList[index].img,
                          width: 100,
                          height: 100,
                        ),
                        SmallText(text: cartList[index].productName),
                        SmallText(text: cartList[index].productName),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
