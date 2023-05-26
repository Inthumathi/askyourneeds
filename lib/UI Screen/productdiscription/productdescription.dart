import 'dart:async';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class DailyNeeds {
  final String cateName;
  final String img;

  DailyNeeds({required this.cateName, required this.img});
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
  int activeButton= 0;
  Color color = Colors.red;
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;


  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.offset + 100, // Replace 100 with your desired scroll amount
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
      backgroundColor: backGroundColor,
      appBar: AppBar(
      elevation: 0,
        centerTitle: true,
        leading: Container(
          width: 50,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: blackColor),
              shape: BoxShape.rectangle
          ),
          child: Icon(Icons.keyboard_arrow_left, color: blackColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 50,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: blackColor),
                shape: BoxShape.rectangle
              ),
              child: Icon(Icons.share, color: blackColor),
            ),

          )
        ],
        backgroundColor: backGroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightSpace,
            heightSpace,
            Column(
              children: [
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
                    height: 200
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 13,
                      width: 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor
                      ),
                    ),
                    SizedBox(width: 3,),
                    Container(
                      height: 13,
                      width: 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                    ),
                    SizedBox(width: 3,),
                    Container(
                      height: 13,
                      width: 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                    ),
                    SizedBox(width: 3,),
                    Container(
                      height: 13,
                      width: 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                    ),
                    SizedBox(width: 3,),
                    Container(
                      height: 13,
                      width: 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                    ),

                  ],
                ),
              ],
            ),
            heightSpace,
            Container(
              height: 600,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SmallText(
                          text: "Kurnool Old Rice",
                          fontWeight: FontWeight.w500,
                          size: 20,
                        ),
                        SizedBox(width: 60,),
                        Icon(Icons.star, color: addCartColor),
                        SizedBox(width: 2,),
                        SmallText(text: "4.8(41 Reviews)", size: 15),
                      ],
                    ),
                    heightSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10),
                        heightSpace,
                        Row(
                          children: [
                            SmallText(
                              text: '\u{20B9} 300/-',
                              size: 18,
                              color: addCartColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 110,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: addCartColor),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SmallText(text: "Size", color: addCartColor),
                                            SizedBox(height: 5),
                                            SmallText(text: "Medium"),
                                          ],
                                        ),
                                        Icon(Icons.arrow_drop_down_outlined, color: addCartColor),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20), // Add some spacing between the containers
                                Container(
                                  width: 110,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: addCartColor),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SmallText(text: "Energy", color: addCartColor),
                                            SizedBox(height: 5),
                                            SmallText(text: "554 Kcal"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20), // Add some spacing between the containers
                                Container(
                                  width: 110,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: addCartColor),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SmallText(text: "Deliery", color: addCartColor),
                                            SizedBox(height: 5),
                                            SmallText(text: "45 Min"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    SmallText(text: "About",fontWeight: FontWeight.w500,),
                    heightSpace,
                    heightSpace,
                    SmallText(text: "A common form of Lorem ipsum reads: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",),
                    heightSpace,
                    heightSpace,
                    Center(
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          color:addCartColor ,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: addCartColor,
                          )
                        ),
                        child: Center(child: SmallText(text: "Add To Cart",color:whiteColor,size: 18,)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
