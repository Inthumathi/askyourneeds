import 'dart:async';
import 'package:askun_delivery_app/UI%20Screen/mycart/mycart.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:page_transition/page_transition.dart';


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

  List<DailyNeeds> DailyNeedsList = <DailyNeeds>[
    DailyNeeds(
      cateName: "Groceries",
      img: MyStrings.img3,
    ),
    DailyNeeds(
      cateName: "Meat",
      img: MyStrings.img3,
    ),
    DailyNeeds(
      cateName: "Vegetableand Fruits",
      img: MyStrings.img3,
    ),
    DailyNeeds(
      cateName: "Dairy Products",
      img: MyStrings.img3,
    ),
    DailyNeeds(
      cateName: "Prasadatu",
      img: MyStrings.img3,
    ),
    DailyNeeds(
      cateName: "Home Foods",
      img: MyStrings.img3,
    ),
  ];

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
      backgroundColor: Color(0xfff3f1f6),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: whiteColor)),
        backgroundColor: primaryColor,
        title: Text("Product description"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightSpace,
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
                height: 200
              ),
            ),
            heightSpace,
            heightSpace,
            Container(
              color: whiteColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                        text: "Kurnool Old Rice",
                        fontWeight: FontWeight.w600,
                        size: 20),
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SmallText(
                                  text: "Qty",
                                  size: 16,
                                ),
                                SizedBox(width: 10),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: dropdownValue,
                                    items: <String>['100kg', '200kg']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: SmallText(
                                          text: value,
                                          color: primaryColor,
                                          size: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                SmallText(
                                  text: "MRP:",size: 15,
                                ),
                                SmallText(
                                  text: '\u{20B9} 300',size: 18,color: Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: const CartScreen()));
                          },
                          child: Container(
                            child: Center(child: SmallText(text: "Add to Cart",color: Colors.white,)),
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: primaryColor,
                              border: Border.all(width: 1.0, color: primaryColor),
                            ),

                            ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            heightSpace,
            Padding(
              padding: const EdgeInsets.fromLTRB(10,20,10,5),
              child: SmallText(
                  text: "Product Description",
                  fontWeight: FontWeight.w600,
                  size: 16),
            ),
            Container(
              color: whiteColor,
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 5),
                child:SmallText(text:
                  ' Dummy Product description in details',)
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,20,10,5),
              child: SmallText(
                  text: "Similar Product",
                  fontWeight: FontWeight.w600,
                  size: 16),
            ),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: 270,
              child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,

                  itemCount: DailyNeedsList.length, itemBuilder: (context, index) {

                return Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8),
                  child: Container(
                    width: 200,
                    child: Card(
                      color:whiteColor,
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              SmallText(
                                text: DailyNeedsList[index]
                                    .cateName,
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                size: 18,
                                textAlign: TextAlign.center,
                                maxline: 1,
                              ),
                              SizedBox(height: 15),
                              Image.asset(
                                DailyNeedsList[index].img,
                                width: 150,
                                // height: 140,
                              ),
                              SizedBox(height: 15),
                              SmallText(text: MyStrings.qty,size: 17),
                              SizedBox(height: 10),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SmallText(text: '\u{20B9} 300',size: 18,color: blueGrey,fontWeight: FontWeight.w600,),
                                  Container(
                                    width: 100,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(5),
                                       color: primaryColor,
                                     ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(child: SmallText(text: MyStrings.add,color: whiteColor,fontWeight: FontWeight.w500,)),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

}
