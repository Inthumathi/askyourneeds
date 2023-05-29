import 'dart:io';
import 'package:askun_delivery_app/Models/Category/DailyNeeds.dart';
import 'package:askun_delivery_app/Models/Category/FoodAndBeverage.dart';
import 'package:askun_delivery_app/Models/Category/service.dart';
import 'package:askun_delivery_app/Models/advertisement/advertiesment.dart';
import 'package:askun_delivery_app/UI%20Screen/categories/dailyneeds/groceirspage.dart';
import 'package:askun_delivery_app/UI%20Screen/searchpage/serachpage.dart';
import 'package:askun_delivery_app/services/service.dart';
import 'package:askun_delivery_app/utilites/api_constant.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class ViewCategories extends StatefulWidget {
  final String? accessToken;
  final CategoriesViewAll categoriesViewAll;
  const ViewCategories({Key? key, this.accessToken,required this.categoriesViewAll}) : super(key: key);

  @override
  State<ViewCategories> createState() => _ViewCategoriesState();
}



class _ViewCategoriesState extends State<ViewCategories> {

  late String selectedLanguage;
  List<DailyNeedResponse> categories = [];
  List<MessageDailyNeeds> _categoryList = [];
  List<Message> _imgList = [];
  List<FoodAndBeverageResponse> foodAndBeverageCategories = [];
  List<FoodAndBeverageMessage> _foodAndBeverageCategoryList = [];
  List<ServiceResponse> serviceCategories = [];
  List<ServiceMessage> _serviceCategoryList = [];


  @override
  void initState() {
    super.initState();
    selectedLanguage = getFlag('DE');
    _getCarouselImages(widget.accessToken.toString());
    _getDailyNeedsCategories(widget.accessToken.toString());
    _getFoodAndBeverageCategories(widget.accessToken.toString());
    _getServiceCategories(widget.accessToken.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: categoriesBgColor,
      appBar: AppBar(
        centerTitle: true,
        title: SmallText(text:widget.categoriesViewAll== CategoriesViewAll.dailyNeeds? MyStrings.dailyNeeds.toUpperCase(): widget.categoriesViewAll== CategoriesViewAll.foodBeverages? MyStrings.foodAndBeverages.toUpperCase():widget.categoriesViewAll== CategoriesViewAll.service?MyStrings.service.toUpperCase():MyStrings.category.toUpperCase() ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child:  const SearchScreen()));
              },
              icon:Icon(Icons.search_rounded, color: whiteColor)),
        ],

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: _imgList.map((message) {
                  String imageUrl = message.img!;
                  if (!imageUrl.startsWith('http')) {
                    imageUrl = '${ApiConstants.bannerImageURL}$imageUrl';
                  }

                  return Builder(
                    builder: (BuildContext context) {
                      if (imageUrl.startsWith('http')) {
                        return Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      } else {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5.0),
                          child: Image.file(
                            File(imageUrl),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        );
                      }
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  disableCenter: true,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  height: 130,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  onPageChanged: (index, _) {
                    setState(() {
                    });
                  },
                ),
              ),

              const SizedBox(height: 5,),
              heightSpace,
             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 3.2,
                    crossAxisCount: 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemCount:widget.categoriesViewAll==CategoriesViewAll.foodBeverages?_foodAndBeverageCategoryList.length:widget.categoriesViewAll==CategoriesViewAll.service?_serviceCategoryList.length: _categoryList.length,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext ctx, index) {
                    if (widget.categoriesViewAll == CategoriesViewAll.dailyNeeds) {
                      final imageUrl = ApiConstants.dailyNeedsImageBaseURL +
                          _categoryList[index].bannerImg.toString();
                      final categoryName = Localizations.localeOf(context).languageCode == 'hi'
                          ? _categoryList[index].hindiName
                          : Localizations.localeOf(context).languageCode == 'te'
                          ? _categoryList[index].teluguName
                          : _categoryList[index].name;

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const GroceriesPage(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                                heightSpace,
                                SmallText(
                                  text: categoryName.toString(),
                                  color: blackColor,
                                  fontWeight: FontWeight.w500,
                                  size: 14,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxline: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    else if (widget.categoriesViewAll == CategoriesViewAll.foodBeverages) {
                      final foodBeverageImageUrl = ApiConstants.restaurantImageURL +
                          _foodAndBeverageCategoryList[index].bannerImg.toString();
                      final foodBeverageCategoryName = Localizations.localeOf(context).languageCode == 'hi'
                          ? _foodAndBeverageCategoryList[index].hindiName
                          : Localizations.localeOf(context).languageCode == 'te'
                          ? _foodAndBeverageCategoryList[index].teluguName
                          : _foodAndBeverageCategoryList[index].name;

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const GroceriesPage(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    foodBeverageImageUrl,
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                                heightSpace,
                                SmallText(
                                  text: foodBeverageCategoryName.toString(),
                                  color: blackColor,
                                  fontWeight: FontWeight.w500,
                                  size: 14,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxline: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    else if (widget.categoriesViewAll == CategoriesViewAll.service) {
                      final serviceImageUrl = ApiConstants.serviceImageURL +
                          _serviceCategoryList[index].bannerImg.toString();
                      final serviceCategoryName = Localizations.localeOf(context).languageCode == 'hi'
                          ? _serviceCategoryList[index].hindiName
                          : Localizations.localeOf(context).languageCode == 'te'
                          ? _serviceCategoryList[index].teluguName
                          : _serviceCategoryList[index].name;

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const GroceriesPage(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    serviceImageUrl,
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                                heightSpace,
                                SmallText(
                                  text: serviceCategoryName.toString(),
                                  color: blackColor,
                                  fontWeight: FontWeight.w500,
                                  size: 14,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxline: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }

                    return const SizedBox.shrink(); // Fallback case when none of the categories match
                  },
                )


             ),
              const SizedBox(height: 16), // Add spacing between GridView.builder and "View All" text
            ],
          ),
        ),
      ),
    );
  }
  String getFlag(String countryCode) {
    return countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  }

  void _getDailyNeedsCategories(String accessToken) async {
    try {
      final response =
      await Webservice().fetchDailyNeeds(accessToken: accessToken);

      if (response.status == true) {
        setState(() {
          _categoryList = response.message!;
        });

        if (kDebugMode) {
          print('Category List: $_categoryList');
        } // Add this line for debugging
      } else {
        // Handle error case here
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  void _getCarouselImages(String accessToken) async {
    try {
      final response =
      await Webservice().fetchBanners(accessToken: accessToken);

      if (response.status == true) {
        setState(() {
          _imgList = response.message!;
        });
        if (kDebugMode) {
          print('Image List: $_imgList');
        } // Add this line for debugging
      } else {
        // Handle error case here
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  void _getFoodAndBeverageCategories(String accessToken) async {
    try {
      final response =
      await Webservice().fetchFoodAndBeverage(accessToken: accessToken);

      if (response.status == true) {
        setState(() {
          _foodAndBeverageCategoryList = response.message!;
        });

        if (kDebugMode) {
          print('Category List: $_foodAndBeverageCategoryList');
        } // Add this line for debugging
      } else {
        // Handle error case here
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  void _getServiceCategories(String accessToken) async {
    try {
      final response =
      await Webservice().fetchService(accessToken: accessToken);

      if (response.status == true) {
        setState(() {
          _serviceCategoryList = response.message!;
        });

        if (kDebugMode) {
          print('Category List: $_serviceCategoryList');
        } // Add this line for debugging
      } else {
        // Handle error case here
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}