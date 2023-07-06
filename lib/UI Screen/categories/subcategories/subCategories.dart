import 'dart:io';

import 'package:askun_delivery_app/Models/advertisement/advertiesment.dart';
import 'package:askun_delivery_app/Models/product/dailyneedsproductItems.dart';
import 'package:askun_delivery_app/Models/product/foodandbeverageproductItems.dart';
import 'package:askun_delivery_app/Models/product/serviceproductitems.dart';
import 'package:askun_delivery_app/Models/subcateogries/dailyneeds_subCategories.dart';
import 'package:askun_delivery_app/Models/subcateogries/foodandbeverage.dart';
import 'package:askun_delivery_app/Models/subcateogries/service_subcategories.dart';
import 'package:askun_delivery_app/UI%20Screen/productdiscription/productdescription.dart';
import 'package:askun_delivery_app/UI%20Screen/searchpage/serachpage.dart';
import 'package:askun_delivery_app/services/service.dart';
import 'package:askun_delivery_app/utilities/api_constant.dart';
import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubCategories extends StatefulWidget {
  final String title;
  final String categoryId;
  final CategoriesViewAll cateName;

  const SubCategories(
      {required this.title,
      required this.categoryId,
      required this.cateName,
      Key? key})
      : super(key: key);

  @override
  State<SubCategories> createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  int _selectedCat = 0;
  Set<int> activeButtons = <int>{};
  Map<int, int> countMap = {};
  List<DailyNeedsSubCategoriesResponse> dailyNeedsSubCategories = [];
  List<DailyNeedsSubCategoriesMessage> dailyNeedsSubCategoriesList = [];
  List<RestaurantMenuResponse> foodAndBeverageSubCategories = [];
  List<FoodAndBeverageMessage> foodAndBeverageSubCategoriesList = [];
  List<ServiceSubCategoriesResponse> serviceSubCategories = [];
  List<ServiceSubCategoriesMessage> serviceSubCategoriesList = [];
  List<DailyNeedsProductsItemsResponse> dailyNeedsItems = [];
  List<DailyNeedsProductMessage> dailyNeedsItemsList = [];
  List<FoodAndBeverageProductItemsResponse> foodAndBeverageItems = [];
  List<FoodAndBeverageItemMessage> foodAndBeverageItemsList = [];
  List<ServiceProductItem> serviceItems = [];
  List<ServiceProductItemMessage> serviceItemsList = [];
  int categoryId = 90;
  bool isCategoryLoading = false;
  bool isServiceLoading = false;
  bool isCategoryItemLoading = false;
  List<AdvMessage> _imgList = [];
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _fetchDailyNeedsSubCategories();
    _fetchFoodAndBeverageSubCategories();
    _fetchServiceSubCategories();
    _getCarouselImages();
  }


  void _getCarouselImages() async {
    try {
      isCategoryLoading = true;
      final response = await Webservice().fetchBanners();

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
    isCategoryLoading = false;
  }


  void _fetchDailyNeedsSubCategories() async {
    await _getDailyNeedsSubCategories(
      widget.categoryId.toString(),
    );

    if (dailyNeedsSubCategoriesList.isNotEmpty) {
      _getDailyNeedsSubCategoriesItems(
        dailyNeedsSubCategoriesList[0].sId.toString(),
      );
    }
  }

  void _fetchFoodAndBeverageSubCategories() async {
    await _getFoodAndBeverageSubCategories(
      widget.categoryId.toString(),
    );

    if (foodAndBeverageSubCategoriesList.isNotEmpty) {
      _getFoodAndBeverageSubCategoriesItems(
        foodAndBeverageSubCategoriesList[0].sId.toString(),
      );
    }
  }

  void _fetchServiceSubCategories() async {
    await _getServiceCategories(
      widget.categoryId.toString(),
    );

    if (serviceSubCategoriesList.isNotEmpty) {
      _getServiceItems(
        serviceSubCategoriesList[0].sId.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldBgMainColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: whiteColor),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SmallText(
              text: widget.title,
              color: whiteColor,
              fontWeight: FontWeight.bold,
              size: 18,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const SearchScreen()));
              },
              icon: const Icon(
                Icons.search,
                size: 25,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            isCategoryLoading
                ? SpinKitFadingCircle(
              color: primaryColor,
            )
                : CarouselSlider(
              items: _imgList.map((message) {
                String imageUrl = message.img!;
                if (!imageUrl.startsWith('http')) {
                  imageUrl =
                  '${ApiConstants.bannerImageURL}$imageUrl';
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
                height: 150,
                autoPlay: true,
                viewportFraction: 1.0,
                onPageChanged: (index, _) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Material(
                    elevation: 10,
                    color: whiteColor,
                    child: Container(
                      width: 80,
                      // color: circleColor,
                      margin: const EdgeInsets.only(right: 15, top: 15),
                      child: isCategoryLoading ||
                              isCategoryItemLoading ||
                              isServiceLoading
                          ? SpinKitFadingCircle(
                              color: primaryColor,
                            )
                          : serviceSubCategoriesList.isEmpty &&
                                  foodAndBeverageSubCategoriesList.isEmpty &&
                                  dailyNeedsSubCategoriesList.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Center(
                                    child: SmallText(
                                        text: MyStrings.noProductFound.tr(),
                                        color: blueGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: widget.cateName ==
                                          CategoriesViewAll.service
                                      ? serviceSubCategoriesList.length
                                      : widget.cateName ==
                                              CategoriesViewAll.foodBeverages
                                          ? foodAndBeverageSubCategoriesList.length
                                          : dailyNeedsSubCategoriesList.length,
                                  itemBuilder: (ctx, i) {
                                    final imageUrl = widget.cateName ==
                                            CategoriesViewAll.foodBeverages
                                        ? ApiConstants.restaurantImageURL +
                                            foodAndBeverageSubCategoriesList[i]
                                                .bannerImg
                                                .toString()
                                        : widget.cateName == CategoriesViewAll.service
                                            ? ApiConstants.serviceImageURL +
                                                serviceSubCategoriesList[i]
                                                    .bannerImg
                                                    .toString()
                                            : ApiConstants.dailyNeedsImageBaseURL +
                                                dailyNeedsSubCategoriesList[i]
                                                    .bannerImg
                                                    .toString();

                                    final subCategoryName = widget.cateName ==
                                            CategoriesViewAll.foodBeverages
                                        ? foodAndBeverageSubCategoriesList[i]
                                            .name
                                            .toString()
                                        : widget.cateName == CategoriesViewAll.service
                                            ? serviceSubCategoriesList[i]
                                                .name
                                                .toString()
                                            : Localizations.localeOf(context)
                                                        .languageCode ==
                                                    'hi'
                                                ? dailyNeedsSubCategoriesList[i]
                                                    .hindiName
                                                : Localizations.localeOf(context)
                                                            .languageCode ==
                                                        'te'
                                                    ? dailyNeedsSubCategoriesList[i]
                                                        .teluguName
                                                    : dailyNeedsSubCategoriesList[i]
                                                        .name;

                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedCat = i;
                                        });

                                        final categoryId = widget.cateName ==
                                                CategoriesViewAll.foodBeverages
                                            ? foodAndBeverageSubCategoriesList[i]
                                                .sId
                                                .toString()
                                            : widget.cateName ==
                                                    CategoriesViewAll.service
                                                ? serviceSubCategoriesList[i]
                                                    .sId
                                                    .toString()
                                                : dailyNeedsSubCategoriesList[i]
                                                    .sId
                                                    .toString();

                                        if (widget.cateName ==
                                            CategoriesViewAll.foodBeverages) {
                                          _getFoodAndBeverageSubCategoriesItems(
                                              categoryId,);
                                        } else if (widget.cateName ==
                                            CategoriesViewAll.service) {
                                          _getServiceItems(
                                              categoryId,);
                                        } else {
                                          _getDailyNeedsSubCategoriesItems(
                                              categoryId,);
                                        }
                                      },
                                      child: RotatedBox(
                                        quarterTurns: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, bottom: 10),
                                          child: Column(
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  color: _selectedCat == i
                                                      ? scaffoldBgMainColor
                                                      : null,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topRight: Radius.circular(50),
                                                    bottomRight: Radius.circular(50),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(11),
                                                  child: CircleAvatar(
                                                    radius: 30,
                                                    backgroundColor: _selectedCat == i
                                                        ? primaryColor
                                                        : primaryColor
                                                            .withOpacity(0.7),
                                                    backgroundImage: NetworkImage(
                                                      imageUrl,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(left: 8),
                                                child: SmallText(
                                                  text: subCategoryName.toString(),
                                                  size: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 8, right: 10),
                                child: isCategoryItemLoading
                                    ? SpinKitFadingCircle(
                                        color: primaryColor,
                                      )
                                    : serviceItemsList.isEmpty &&
                                            foodAndBeverageItemsList.isEmpty &&
                                            dailyNeedsItemsList.isEmpty
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8.0),
                                            child: Center(
                                              child: SmallText(
                                                text: MyStrings.noProductFound.tr(),
                                                color: blueGrey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        : GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 1 / 1.7,
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10,
                                            ),
                                            itemCount: widget.cateName ==
                                                    CategoriesViewAll.foodBeverages
                                                ? foodAndBeverageItemsList.length
                                                : widget.cateName ==
                                                        CategoriesViewAll.service
                                                    ? serviceItemsList.length
                                                    : dailyNeedsItemsList.length,
                                            primary: false,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (BuildContext ctx, i) {
                                              bool isActiveButton =
                                                  activeButtons.contains(i);
                                              int itemCounter = countMap[i] ?? 0;
                                              final imageItemUrl = widget
                                                          .cateName ==
                                                      CategoriesViewAll
                                                          .foodBeverages
                                                  ? ApiConstants
                                                          .restaurantImageURL +
                                                      foodAndBeverageItemsList[i]
                                                          .img
                                                          .toString()
                                                  : widget.cateName ==
                                                          CategoriesViewAll.service
                                                      ? ApiConstants
                                                              .serviceImageURL +
                                                          serviceItemsList[i]
                                                              .bannerImg
                                                              .toString()
                                                      : ApiConstants
                                                              .dailyNeedsImageProductBaseURL +
                                                          dailyNeedsItemsList[i]
                                                              .img
                                                              .toString();
                                              final itemName = widget.cateName ==
                                                      CategoriesViewAll
                                                          .foodBeverages
                                                  ? foodAndBeverageItemsList[i]
                                                      .name
                                                      .toString()
                                                  : widget.cateName ==
                                                          CategoriesViewAll.service
                                                      ? serviceItemsList[i]
                                                          .name
                                                          .toString()
                                                      : Localizations.localeOf(
                                                                      context)
                                                                  .languageCode ==
                                                              'hi'
                                                          ? dailyNeedsItemsList[i]
                                                              .hindiName
                                                          : Localizations.localeOf(
                                                                          context)
                                                                      .languageCode ==
                                                                  'te'
                                                              ? dailyNeedsItemsList[
                                                                      i]
                                                                  .teluguName
                                                              : dailyNeedsItemsList[
                                                                      i]
                                                                  .name;
                                              final itemPrice = widget.cateName ==
                                                      CategoriesViewAll
                                                          .foodBeverages
                                                  ? foodAndBeverageItemsList[i]
                                                      .productPrice
                                                      .toString()
                                                  : widget.cateName ==
                                                          CategoriesViewAll.service
                                                      ? serviceItemsList[i]
                                                          .serviceCharge
                                                          .toString()
                                                      : dailyNeedsItemsList[i]
                                                          .productPrice
                                                          .toString();
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .rightToLeft,
                                                      child: ProductDescription(),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 8.0,
                                                      right: 8,
                                                      top: 5,
                                                      bottom: 5,
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              color: starColor,
                                                            ),
                                                            SmallText(
                                                              text: '4.5',
                                                              size: 14,
                                                            ),
                                                          ],
                                                        ),
                                                        heightSpace,
                                                        Center(
                                                          child: Image.network(
                                                            imageItemUrl,
                                                            width: 100,
                                                            height: 50,
                                                          ),
                                                        ),
                                                        heightSpace,
                                                        Center(
                                                          child: SmallText(
                                                            text:
                                                                itemName.toString(),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            size: 15,
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxline: 1,
                                                          ),
                                                        ),
                                                        heightSpace,
                                                        SmallText(
                                                          text: '₹$itemPrice/-',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        if (!isActiveButton &&
                                                            itemCounter == 0)
                                                          Center(
                                                            child: MaterialButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  activeButtons
                                                                      .add(i);
                                                                  countMap[i] = 1;
                                                                });
                                                              },
                                                              color: primaryColor,
                                                              child: SmallText(
                                                                text: MyStrings.add
                                                                    .tr(),
                                                                color: whiteColor,
                                                                size: 14,
                                                                fontWeight:
                                                                    FontWeight.w400,
                                                              ),
                                                            ),
                                                          ),
                                                        heightSpace,
                                                        if (isActiveButton)
                                                          Center(
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                color:
                                                                    secondPrimaryColor,
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  IconButton(
                                                                    onPressed: () {
                                                                      setState(() {
                                                                        if (itemCounter >
                                                                            1) {
                                                                          itemCounter--;
                                                                          countMap[
                                                                                  i] =
                                                                              itemCounter;
                                                                        } else {
                                                                          activeButtons
                                                                              .remove(
                                                                                  i);
                                                                          countMap
                                                                              .remove(
                                                                                  i);
                                                                        }
                                                                      });
                                                                    },
                                                                    icon: Icon(
                                                                      Icons.remove,
                                                                      color:
                                                                          whiteColor,
                                                                    ),
                                                                  ),
                                                                  SmallText(
                                                                    text: itemCounter
                                                                        .toString(),
                                                                    color:
                                                                        whiteColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                  IconButton(
                                                                    onPressed: () {
                                                                      setState(() {
                                                                        if (itemCounter <
                                                                            25) {
                                                                          itemCounter++;
                                                                          countMap[
                                                                                  i] =
                                                                              itemCounter;
                                                                        } else {
                                                                          Fluttertoast
                                                                              .showToast(
                                                                            msg:
                                                                                "You can't add more than 25",
                                                                          );
                                                                        }
                                                                      });
                                                                    },
                                                                    icon: Icon(
                                                                      Icons.add,
                                                                      color:
                                                                          whiteColor,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          right: 10,
                          child: Container(
                            decoration: BoxDecoration(
                                color: secondPrimaryColor,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: whiteColor, width: 2)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: secondPrimaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SmallText(
                                          text: '1 ${MyStrings.addedItemsMsg}',
                                          color: whiteColor,
                                          fontWeight: FontWeight.w500,
                                          size: 15,
                                        ),
                                        SmallText(
                                          text: '\u{20B9} 200/-',
                                          color: whiteColor,
                                          fontWeight: FontWeight.w500,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                    MaterialButton(
                                      onPressed: () {},
                                      color: primaryColor,
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      child: SmallText(
                                          text: MyStrings.goToCart,
                                          color: whiteColor,
                                          size: 12,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Future<void> _getDailyNeedsSubCategories(String categoryId) async {
    isCategoryLoading = true;

    try {
      final response = await Webservice().fetchDailyNeedsSubCategories(
        categoryId: categoryId,
      );
      print(categoryId);
      print('adfbsdfbs');
      if (response.status == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String>? categoryIds = dailyNeedsSubCategoriesList
            .map((subCategory) => subCategory.sId.toString())
            .toList();
        await prefs.setStringList('categoryIds', categoryIds);
        setState(() {
          dailyNeedsSubCategoriesList = response.message!;
        });
      } else {
        // Handle error case here
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    isCategoryLoading = false;
  }

  Future<void> _getDailyNeedsSubCategoriesItems(
      String categoryItemId, ) async {
    isCategoryItemLoading = true;
    try {
      final response = await Webservice().fetchDailyNeedsItems(categoryItemId: categoryItemId);

      if (response.status == true) {
        setState(() {
          dailyNeedsItemsList = response.message!;
        });

        if (kDebugMode) {
          print('Category List: $dailyNeedsItemsList');
        } // Add this line for debugging
      } else {
        // Handle error case here
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    isCategoryItemLoading = false;
  }

  Future<void> _getFoodAndBeverageSubCategories(String categoryId) async {
    isCategoryLoading = true;

    try {
      final response = await Webservice().fetchFoodAndBeverageSubCategories(
        accessToken: 'JWT $accessToken',
        foodCategoryId: categoryId,
      );
      print(categoryId);
      print('adfbsdfbs');
      if (response.status == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String>? categoryIds = foodAndBeverageSubCategoriesList
            .map((subCategory) => subCategory.sId.toString())
            .toList();
        await prefs.setStringList('categoryIds', categoryIds);
        setState(() {
          foodAndBeverageSubCategoriesList = response.message!;
        });
      } else {
        // Handle error case here
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    isCategoryLoading = false;
  }

  Future<void> _getFoodAndBeverageSubCategoriesItems(
      String categoryItemId,) async {
    isCategoryItemLoading = true;
    try {
      final response = await Webservice().fetchFoodAndBeverageItems(categoryItemId: categoryItemId);

      if (response.status == true) {
        setState(() {
          foodAndBeverageItemsList = response.message!;
        });

        if (kDebugMode) {
          print('Category List: $foodAndBeverageItemsList');
        } // Add this line for debugging
      } else {
        // Handle error case here
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    isCategoryItemLoading = false;
  }

  Future<void> _getServiceCategories(String categoryId) async {
    isServiceLoading = true;

    try {
      final response = await Webservice().serviceSubCategories(
        serviceCategoryId: categoryId,
      );
      print(categoryId);
      print('adfbsdfbs');
      if (response.status == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String>? categoryIds = serviceSubCategoriesList
            .map((subCategory) => subCategory.sId.toString())
            .toList();
        await prefs.setStringList('categoryIds', categoryIds);
        setState(() {
          serviceSubCategoriesList = response.message!;
        });
      } else {
        // Handle error case here
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    isServiceLoading = false;
  }

  Future<void> _getServiceItems(
      String categoryItemId,) async {
    isCategoryItemLoading = true;
    try {
      final response = await Webservice().fetchServiceItems(categoryItemId: categoryItemId);

      if (response.status == true) {
        setState(() {
          serviceItemsList = response.message!;
        });

        if (kDebugMode) {
          print('Category List: $serviceItemsList');
        } // Add this line for debugging
      } else {
        // Handle error case here
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    isCategoryItemLoading = false;
  }
}
