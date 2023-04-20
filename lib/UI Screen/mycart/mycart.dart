import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';


class Cart {
  final String productName;
  final String img;
  final String qty;

  Cart({required this.productName, required this.img, required this.qty});
}
class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}
final ScrollController _scrollController = ScrollController();

class _MyCartState extends State<MyCart> {

  List<Cart> cartList = <Cart>[
    Cart(
      productName: "Rice",
      img: MyStrings.img3,
      qty: "1KG"
    ),
    Cart(
      productName: "Ghee",
      img: MyStrings.img3,
      qty: '1L'
    ),
    Cart(
      productName: "Apple",
      img: MyStrings.img3,
      qty: '1KG'

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f1f6),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: SmallText(text: MyStrings.myCart,size: 20),
      ),
      body: ListView.builder(
          controller: _scrollController,
          // scrollDirection: Axis.horizontal,

          itemCount: cartList.length,
          itemBuilder: (context, index) {

        return Padding(
          padding: const EdgeInsets.only(left: 18,right: 8,top: 10,bottom: 10),
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
      }),
    );
  }
}
