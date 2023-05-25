import 'package:askun_delivery_app/UI%20Screen/categories/dailyneeds/groceirspage.dart';
import 'package:askun_delivery_app/UI%20Screen/homepage/homepage.dart';
import 'package:askun_delivery_app/UI%20Screen/searchpage/serachpage.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class ViewCategories extends StatefulWidget {
  final List<String> imagesList = [
    'https://cdn.pixabay.com/photo/2017/12/10/14/47/piza-3010062_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/06/07/01/49/ice-cream-1440830_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/12/27/07/07/brownie-3042106_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/02/25/07/15/food-3179853_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/10/26/11/10/honey-1006972_1280.jpg',
  ];


  ViewCategories({Key? key}) : super(key: key);

  @override
  State<ViewCategories> createState() => _ViewCategoriesState();
}



class _ViewCategoriesState extends State<ViewCategories> {
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
      cateName: "VegetableandFruits",
      img: MyStrings.img3,
    ),
    DailyNeeds(
      cateName: "DairyProducts",
      img: MyStrings.img3,
    ),
    DailyNeeds(
      cateName: "Prasadatu",
      img: MyStrings.img3,
    ),
    DailyNeeds(
      cateName: "HomeFoods",
      img: MyStrings.img3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: categoriesBgColor,
      appBar: AppBar(
        centerTitle: true,
        title: SmallText(text: MyStrings.dailyNeeds),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child:  SearchScreen()));
              },
              icon:Icon(Icons.search_rounded, color: whiteColor)),
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                disableCenter: true,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: false,
                initialPage: 0,
                height: 130,
                autoPlay: true,
                viewportFraction: 1.0,
              ),
              items: widget.imagesList.map((item) {
                return Center(
                  child: Image.asset(
                    item, // Assuming the item is the asset path of the image
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 5,),
            heightSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2 / 2.5,
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemCount: DailyNeedsList.length,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          PageTransition(
                              type:
                              PageTransitionType.rightToLeft,
                              child: const GroceriesPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: whiteColor,borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              height: 75,
                              DailyNeedsList[index].img,
                            ),
                            heightSpace,
                            SmallText(
                              text: DailyNeedsList[index].cateName,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                              size: 14,
                              textAlign: TextAlign.center,
                              maxline: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16), // Add spacing between GridView.builder and "View All" text
          ],
        ),
      ),
    );
  }
}
