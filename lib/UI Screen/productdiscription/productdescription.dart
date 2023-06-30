import 'dart:async';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class TopPick {
  final String cateName;
  final String img;
  final String offer;
  final String price;

  TopPick(
      {required this.cateName,
        required this.img,
        required this.offer,
        required this.price});
}


class ProductDescription extends StatefulWidget {
  ProductDescription({
    Key? key,
  }) : super(key: key);

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  final List<String> images = [
    'https://picsum.photos/id/1015/300/200',
    'https://picsum.photos/id/1016/300/200',
    'https://picsum.photos/id/1018/300/200',
    'https://picsum.photos/id/1021/300/200',
    'https://picsum.photos/id/1023/300/200'
  ];
  String dropdownValue = '100kg';
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;
  int count = 0;

  List<TopPick> TopPicksList = <TopPick>[
    TopPick(
        cateName: "Groceries",
        img: MyStrings.img3,
        offer: "Save 35%",
        price: "250/-"),
    TopPick(
        cateName: "Meat",
        img: MyStrings.img3,
        offer: "Save 27%",
        price: "100/-"),
    TopPick(
        cateName: "VegetableandFruits",
        img: MyStrings.img3,
        offer: "Save 30%",
        price: "200/-"),
    TopPick(
        cateName: "DairyProducts",
        img: MyStrings.img3,
        offer: "Save 15%",
        price: "700/-"),
    TopPick(
        cateName: "Prasadatu",
        img: MyStrings.img3,
        offer: "Save 10%",
        price: "500/-"),
    TopPick(
        cateName: "HomeFoods",
        img: MyStrings.img3,
        offer: "Save 20%",
        price: "800/-"),
  ];


  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.offset +
              100, // Replace 100 with your desired scroll amount
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectedSubCategoriesBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: selectedSubCategoriesBgColor,
        automaticallyImplyLeading: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.keyboard_arrow_left, color: blackColor)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: blackColor),
                  shape: BoxShape.rectangle),
              child: Center(
                  child: IconButton(
                icon: Icon(Icons.share_outlined, color: blackColor),
                onPressed: () {},
              )),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightSpace,
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final String imageUrl = images[index];
                return Image.network(imageUrl, fit: BoxFit.cover);
              },
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                initialPage: 0,
                // height: 200
              ),
            ),
            heightSpace,
            heightSpace,
            heightSpace,
            Container(
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SmallText(
                            text: "Kurnool Old Rice",
                            fontWeight: FontWeight.w500,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallText(
                          text: '\u{20B9} 300/-',
                          size: 18,
                          fontFamily: MyStrings.poppins,
                          color: secondPrimaryColor,
                        ),
                        count == 0
                            ? GestureDetector(
                                onTap: incrementCount,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: secondPrimaryColor,
                                  ),
                                  child:  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SmallText(
                                     text: MyStrings.addToCart.tr(),
                                      fontFamily: MyStrings.poppins,
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color:secondPrimaryColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 22, vertical: 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: decrementCount,
                                        child:  Icon(
                                          Icons.remove,
                                          size: 22,
                                          color: whiteColor,
                                        ),
                                      ),
                                      widthSpace,
                                      SmallText(
                                        text: '$count',
                                       color: whiteColor,
                                      ),
                                      widthSpace,
                                      InkWell(
                                        onTap: incrementCount,
                                        child: const Icon(
                                          Icons.add,
                                          size: 22,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                    const SizedBox(width: 32),

                    SmallText(
                      text: "About",
                      fontWeight: FontWeight.w500,
                    ),
                    heightSpace,
                    SmallText(
                      text:
                          "A common form of Lorem ipsum reads: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    ),
                    const SizedBox(height: 40,),
                    SmallText(text: MyStrings.similarProducts),
                    const SizedBox(height: 25,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3.5,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: TopPicksList.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10),
                            child: Card(
                              elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    color: whiteColor,
                                  ),
                                  width: 175,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            child: Image(
                                              image: AssetImage(
                                                  TopPicksList[index]
                                                      .img),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SmallText(
                                                text: TopPicksList[index]
                                                    .cateName,
                                                size: 16,
                                                fontWeight:
                                                FontWeight.w600,
                                                overflow: TextOverflow
                                                    .ellipsis),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SmallText(
                                                text:
                                                '\u{20B9} ${TopPicksList[index].price}',
                                                size: 16,
                                                color: secondPrimaryColor,
                                                fontWeight:
                                                FontWeight.w600),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            MaterialButton(
                                              minWidth: double.infinity,
                                              onPressed: () {},
                                              color: secondPrimaryColor,
                                              clipBehavior:
                                              Clip.antiAlias,
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          20.0))),
                                              child: SmallText(
                                                text: MyStrings.addToCart
                                                    .tr(),
                                                color: whiteColor,
                                                fontWeight:
                                                FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }

  void incrementCount() {
    setState(() {
      count++; // Increment the count
    });
  }

  void decrementCount() {
      setState(() {
        count--; // Decrement the count
      });

  }
}
