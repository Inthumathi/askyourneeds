import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../homepage/homepage.dart';

class ViewCategories extends StatefulWidget {
  const ViewCategories({Key? key}) : super(key: key);

  @override
  State<ViewCategories> createState() => _ViewCategoriesState();
}

class _ViewCategoriesState extends State<ViewCategories> {
  // final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar: AppBar(
       title: SmallText(text: MyStrings.dailyNeeds.toUpperCase(),),
     ),
      body: Column(
        children: [
          CarouselSlider(
            items: imageSliders,
            // carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                disableCenter: false,
                initialPage: 0,
                enlargeCenterPage: false,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
