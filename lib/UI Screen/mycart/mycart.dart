import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class Cart {
  final String productName;
  final String img;
  final String qty;

  Cart({required this.productName, required this.img, required this.qty});
}

List<Cart> cartList = <Cart>[
  Cart(
    productName: "Rice",
    img: "path/to/rice.png",
    qty: "1KG",
  ),
  Cart(
    productName: "Ghee",
    img: "path/to/ghee.png",
    qty: "1L",
  ),
];

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f1f6),
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
      body: Container(
        color: categoriesBgColor, // Replace with your desired background color
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SmallText(
                        text: MyStrings.itemsAdded,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 200,
                        width: 350,
                        child: Card(
                          color: whiteColor,
                          elevation: 10,
                          child: ListView.builder(
                            itemCount: cartList.length,
                            itemBuilder: (context, index) {
                              final cartItem = cartList[index];
                              // Customize the appearance of each list item using cartItem data
                              return ListTile(
                                title: Text(cartItem.productName),
                                subtitle: Text(cartItem.qty),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      SmallText(text: MyStrings.offerAndBenefits),
                      SizedBox(height: 8),
                      Container(
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(child: SmallText(text: MyStrings.applyCoupen,fontWeight: FontWeight.w500)),
                              Icon(Icons.arrow_forward_ios,)
                            ],
                          ),
                        ),
                      ),
                      heightSpace,
                      heightSpace,
                      SmallText(text: MyStrings.billSummary,fontWeight: FontWeight.w500,),
                      heightSpace,
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SmallText(text: MyStrings.subTotal),
                                  SmallText(text: '\u{20B9}1280/-'),
                                ],
                              ),
                              heightSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.home),
                                  SmallText(text: MyStrings.subTotal),
                                  SmallText(text: '\u{20B9}1280/-'),

                                ],
                              ),
                              SmallText(text: MyStrings.topPicksForYou)
                            ],
                          ),
                        ),
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
