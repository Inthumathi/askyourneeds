import 'dart:core';
import 'dart:io';
import 'package:askun_delivery_app/Models/Category/DailyNeeds.dart';
import 'package:askun_delivery_app/Models/Category/FoodAndBeverage.dart';
import 'package:askun_delivery_app/Models/Category/service.dart';
import 'package:askun_delivery_app/Models/advertisement/advertiesment.dart';
import 'package:askun_delivery_app/UI%20Screen/address/address.dart';
import 'package:askun_delivery_app/UI%20Screen/categories/subcategories/subCategories.dart';
import 'package:askun_delivery_app/UI%20Screen/categories/viewcategoriesdetails.dart';
import 'package:askun_delivery_app/UI%20Screen/login%20page/login.dart';
import 'package:askun_delivery_app/UI%20Screen/notification/notification.dart';
import 'package:askun_delivery_app/UI%20Screen/orderHistory/orderhistory.dart';
import 'package:askun_delivery_app/UI%20Screen/profile/profileScreen.dart';
import 'package:askun_delivery_app/UI%20Screen/searchpage/serachpage.dart';
import 'package:askun_delivery_app/services/service.dart';
import 'package:askun_delivery_app/utilities/api_constant.dart';
import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/loader.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

// Language
class Language {
  Locale locale;
  String langName;

  Language({required this.locale, required this.langName});
}

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

class HomeScreen extends StatefulWidget {
  final String? selectedAddress;
  final String? refreshToken;
  final String? accessToken;

  const HomeScreen(
      {Key? key, this.selectedAddress, this.refreshToken, this.accessToken})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  List<Language> languageList = [
    Language(langName: 'తెలుగు', locale: const Locale('te', 'TE')),
    Language(langName: 'हिंदी', locale: const Locale('hi', 'HI')),
    Language(langName: 'English', locale: const Locale('en', 'US')),
  ];

  int _current = 0;
  String currentState = "";
  final CarouselController _controller = CarouselController();
  late String selectedLanguage;
  String currentStreet = "";
  String pincode = "";
  String currentCity = "";
  bool currentLocation = false;
  List<AdvMessage> _imgList = [];
  List<DailyNeedResponse> categories = [];
  List<MessageDailyNeeds> _categoryList = [];
  List<FoodAndBeverageResponse> foodAndBeverageCategories = [];
  List<FoodAndBeverageMessage> _foodAndBeverageCategoryList = [];
  List<ServiceResponse> serviceCategories = [];
  List<ServiceMessage> _serviceCategoryList = [];
  bool isCategoryLoading = false;

  @override
  void initState() {
    super.initState();
    selectedLanguage = getFlag('DE');
    _determinePosition();
    _getCarouselImages();
    _getDailyNeedsCategories();
    _getFoodAndBeverageCategories();
    _getServiceCategories();
  }

  Future<Position?> _determinePosition() async {
    bool serviceEnable;
    LocationPermission permission;
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      Fluttertoast.showToast(msg: "Please keep your location on");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: "Location Permission Denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: "Permission is Denied Forever");
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        currentStreet = '${place.thoroughfare}';
        currentState = '${place.administrativeArea}';
        pincode = '${place.postalCode}';
        currentCity = '${place.locality}';
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: Drawer(
        backgroundColor: sideMenuColor,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                children: [
                  ListTile(
                    onTap: (){
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child:  const ProfileScreen()));
                    },
                      title: Row(
                    children: [
                      Icon(Icons.account_circle, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.profile.tr(),
                        color: whiteColor,
                        size: 16,
                      )
                    ],
                  )),
                  const SizedBox(
                    height: 3,
                  ),
                  Divider(
                    color: whiteColor.withOpacity(0.5),
                    height: 1,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  ListTile(
                      onTap: (){
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child:  const OrderHistoryScreen()));
                      },
                      title: Row(
                    children: [
                      Icon(Icons.add_shopping_cart, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.myOrder.tr(),
                        color: whiteColor,
                        size: 16,
                      )
                    ],
                  )),
                  const SizedBox(
                    height: 3,
                  ),
                  Divider(
                    color: whiteColor.withOpacity(0.5),
                    height: 1,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  ListTile(
                      title: Row(
                    children: [
                      Icon(Icons.local_offer_outlined, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.offerAndPromo.tr(),
                        color: whiteColor,
                        size: 16,
                      )
                    ],
                  )),
                  const SizedBox(
                    height: 3,
                  ),
                  Divider(
                    color: whiteColor.withOpacity(0.5),
                    height: 1,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  ListTile(
                    onTap: (){},
                      title: Row(
                    children: [
                      Icon(Icons.language_outlined, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.changeLanguage.tr(),
                        color: whiteColor,
                        size: 16,
                      )
                    ],
                  )),
                  const SizedBox(
                    height: 3,
                  ),
                  Divider(
                    color: whiteColor.withOpacity(0.5),
                    height: 1,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  ListTile(
                      title: Row(
                    children: [
                      Icon(Icons.edit_document, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.complaints.tr(),
                        color: whiteColor,
                        size: 16,
                      )
                    ],
                  )),
                  const SizedBox(
                    height: 3,
                  ),
                  Divider(
                    color: whiteColor.withOpacity(0.5),
                    height: 1,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  ListTile(
                      title: Row(
                    children: [
                      Icon(Icons.article_outlined, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.privacyPolicy.tr(),
                        color: whiteColor,
                        size: 16,
                      )
                    ],
                  )),
                  const SizedBox(
                    height: 3,
                  ),
                  Divider(
                    color: whiteColor.withOpacity(0.5),
                    height: 1,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.settings_suggest_outlined, color: whiteColor),
                          widthSpace,
                          SmallText(
                            text: MyStrings.suggestions.tr(),
                            color: whiteColor,
                            size: 16,
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 3,
                  ),
                  Divider(
                    color: whiteColor.withOpacity(0.5),
                    height: 1,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  ListTile(
                      title: Row(
                    children: [
                      Icon(Icons.support_agent_outlined, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.support.tr(),
                        color: whiteColor,
                        size: 16,
                      )
                    ],
                  )),
                  const SizedBox(
                    height: 3,
                  ),
                  Divider(
                    color: whiteColor.withOpacity(0.5),
                    height: 1,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                ],
              ),
            ),
            ListTile(
                onTap: () {
                  _logout();
                },
                title: Row(
                  children: [
                    Icon(Icons.logout_outlined, color: whiteColor),
                    widthSpace,
                    SmallText(
                      text: MyStrings.signOut.tr(),
                      color: whiteColor,
                      size: 16,
                    )
                  ],
                )),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset('assets/logo.png'),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const NotificationScreen()));
                },
                icon: const Icon(Icons.notifications),
              ),
            ],
            bottom: AppBar(
              automaticallyImplyLeading: false,
              title: InkWell(
                onTap: () => Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const SearchScreen())),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: blueGrey,
                        ),
                        widthSpace,
                        SmallText(
                          text: MyStrings.searchForSomething.tr(),
                          color: blueGrey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Column(children: [
                Container(
                  color: locationContainerColor,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const AddressScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          widthSpace,
                          Icon(
                            Icons.location_on,
                            size: 25,
                            color: iconColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              widget.selectedAddress == null
                                  ? const SizedBox()
                                  : SmallText(
                                      text: widget.selectedAddress.toString(),
                                    ),
                              currentStreet == "" &&
                                      widget.selectedAddress == null
                                  ? SmallText(
                                      text: "Delivery Location",
                                    )
                                  : SmallText(
                                      text: '$currentCity - $pincode',
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                heightSpace,
                Container(
                  color: locationContainerColor,
                  child: Row(
                    children: languageList.map((Language language) {
                      return Expanded(
                        child: RadioListTile<Locale>(
                          activeColor: primaryColor,
                          title: SmallText(
                            text: language.langName,
                            size: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          value: language.locale,
                          groupValue: Localizations.localeOf(context),
                          onChanged: (Locale? value) {
                            setState(() {
                              context.setLocale(value!);
                            });
                          },
                          contentPadding: EdgeInsets.zero,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                heightSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => launch("tel://6281297326"),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: const FractionalOffset(0.0, 0.0),
                                    end: const FractionalOffset(0.4, 0.0),
                                    colors: <Color>[
                                      secondPrimaryColor,
                                      const Color(0xff33056F).withOpacity(0.77)
                                    ])),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage('assets/home/phone.png'),
                                  width: 40,
                                  height: 40,
                                ),
                                widthSpace,
                                SmallText(
                                  text: MyStrings.callNow.tr(),
                                  color: whiteColor,
                                  fontWeight: FontWeight.w900,
                                  size: 18,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      widthSpace,
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            String phoneNumber =
                                '6281297326'; // Replace with the desired phone number
                            String message =
                                'Hello,'; // Replace with the desired message

                            // Construct the WhatsApp URL
                            String url =
                                'https://wa.me/$phoneNumber/?text=${Uri.encodeComponent(message)}';

                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch WhatsApp';
                            }
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: const FractionalOffset(0.0, 0.0),
                                    end: const FractionalOffset(0.4, 0.0),
                                    colors: <Color>[
                                      secondPrimaryColor,
                                      const Color(0xff33056F).withOpacity(0.77)
                                    ])),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage('assets/home/whatsapp.png'),
                                  width: 40,
                                  height: 40,
                                ),
                                widthSpace,
                                SmallText(
                                  text: MyStrings.whatsapp,
                                  color: whiteColor,
                                  fontWeight: FontWeight.w900,
                                  size: 18,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
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
                          height: 130,
                          autoPlay: true,
                          viewportFraction: 1.0,
                          onPageChanged: (index, _) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                      ),
                heightSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? whiteColor
                                        : primaryColor)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                heightSpace,
                heightSpace,
                isCategoryLoading
                    ? SpinKitFadingCircle(
                        color: primaryColor,
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallText(
                              text: MyStrings.dailyNeeds.tr(),
                              fontWeight: FontWeight.w600,
                              size: 20,
                            ),
                            GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 2 / 2.9,
                                crossAxisCount: 3,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: _categoryList.length > 6
                                  ? 6
                                  : _categoryList
                                      .length, // Update itemCount to match the length of _categoryList
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext ctx, index) {
                                final imageUrl = ApiConstants
                                        .dailyNeedsImageBaseURL +
                                    _categoryList[index].bannerImg.toString();
                                final categoryName =
                                    Localizations.localeOf(context)
                                                .languageCode ==
                                            'hi'
                                        ? _categoryList[index].hindiName
                                        : Localizations.localeOf(context)
                                                    .languageCode ==
                                                'te'
                                            ? _categoryList[index].teluguName
                                            : _categoryList[index].name;
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: SubCategories(
                                          title: _categoryList[index]
                                              .name
                                              .toString(),
                                          categoryId: _categoryList[index]
                                              .sId!
                                              .toString(),
                                          cateName:
                                              CategoriesViewAll.dailyNeeds,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            heightSpace,
                            Center(
                                child: MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              child: ViewCategories(
                                                categoriesViewAll:
                                                    CategoriesViewAll
                                                        .dailyNeeds,
                                              )));
                                    },
                                    height: 40,
                                    minWidth:
                                        MediaQuery.of(context).size.width / 1.2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    color: primaryColor,
                                    child: SmallText(
                                      text: MyStrings.viewAll.tr(),
                                      fontWeight: FontWeight.w500,
                                      color: whiteColor,
                                    ))),
                            heightSpace,
                            heightSpace,
                            heightSpace,
                            SmallText(
                              text: MyStrings.foodAndBeverages.tr(),
                              size: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 2 / 3,
                                crossAxisCount: 3,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: _foodAndBeverageCategoryList.length > 6
                                  ? 6
                                  : _foodAndBeverageCategoryList
                                      .length, // Update itemCount to match the length of _categoryList
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext ctx, index) {
                                final imageUrl =
                                    ApiConstants.restaurantImageURL +
                                        _foodAndBeverageCategoryList[index]
                                            .bannerImg
                                            .toString();
                                final foodAndBeverageCategoryName =
                                    Localizations.localeOf(context)
                                                .languageCode ==
                                            'hi'
                                        ? _foodAndBeverageCategoryList[index]
                                            .hindiName
                                        : Localizations.localeOf(context)
                                                    .languageCode ==
                                                'te'
                                            ? _foodAndBeverageCategoryList[
                                                    index]
                                                .teluguName
                                            : _foodAndBeverageCategoryList[
                                                    index]
                                                .name;
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: SubCategories(
                                          title: _foodAndBeverageCategoryList[
                                                  index]
                                              .name
                                              .toString(),
                                          categoryId:
                                              _foodAndBeverageCategoryList[
                                                      index]
                                                  .sId
                                                  .toString(),
                                          cateName:
                                              CategoriesViewAll.foodBeverages,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            imageUrl,
                                            fit: BoxFit.cover,
                                            width: 100,
                                            height: 100,
                                          ),
                                        ),
                                        heightSpace,
                                        SmallText(
                                          text: foodAndBeverageCategoryName
                                              .toString(),
                                          color: blackColor,
                                          fontWeight: FontWeight.w500,
                                          size: 14,
                                          textAlign: TextAlign.center,
                                          maxline: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            heightSpace,
                            heightSpace,
                            heightSpace,
                            Center(
                                child: MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              child: ViewCategories(
                                                categoriesViewAll:
                                                    CategoriesViewAll
                                                        .foodBeverages,
                                              )));
                                    },
                                    height: 40,
                                    minWidth:
                                        MediaQuery.of(context).size.width / 1.2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    color: primaryColor,
                                    child: SmallText(
                                      text: MyStrings.viewAll.tr(),
                                      fontWeight: FontWeight.w500,
                                      color: whiteColor,
                                    ))),
                            heightSpace,
                            heightSpace,
                            heightSpace,
                            SmallText(
                              text: MyStrings.service.tr(),
                              size: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            heightSpace,
                            GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 2 / 2.9,
                                crossAxisCount: 3,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: _serviceCategoryList.length > 6
                                  ? 6
                                  : _serviceCategoryList
                                      .length, // Update itemCount to match the length of _categoryList
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext ctx, index) {
                                final imageUrl = ApiConstants.serviceImageURL +
                                    _serviceCategoryList[index]
                                        .bannerImg
                                        .toString();
                                final serviceCategoryName =
                                    Localizations.localeOf(context)
                                                .languageCode ==
                                            'hi'
                                        ? _serviceCategoryList[index].hindiName
                                        : Localizations.localeOf(context)
                                                    .languageCode ==
                                                'te'
                                            ? _serviceCategoryList[index]
                                                .teluguName
                                            : _serviceCategoryList[index].name;
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: SubCategories(
                                          title: _serviceCategoryList[index]
                                              .name
                                              .toString(),
                                          categoryId:
                                              _serviceCategoryList[index]
                                                  .sId
                                                  .toString(),
                                          cateName: CategoriesViewAll.service,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            imageUrl,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            heightSpace,
                            heightSpace,
                            heightSpace,
                            Center(
                                child: MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              child: ViewCategories(
                                                categoriesViewAll:
                                                    CategoriesViewAll.service,
                                              )));
                                    },
                                    height: 40,
                                    minWidth:
                                        MediaQuery.of(context).size.width / 1.2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    color: primaryColor,
                                    child: SmallText(
                                      text: MyStrings.viewAll.tr(),
                                      fontWeight: FontWeight.w500,
                                      color: whiteColor,
                                    ))),
                            heightSpace,
                            heightSpace,
                          ],
                        ),
                      ),
                const Image(image: AssetImage("assets/home/Footerbanner.png")),
                heightSpace,
              ]),
            ]),
          ),
        ],
      ),
    );
  }

  _logout() async {
    startLoader();
    Webservice().callLogoutService().then((onResponse) async {
      stopLoader();
      if (onResponse.status == true) {
        await Future.delayed(const Duration(seconds: 2));
        Fluttertoast.showToast(msg: 'Logout Successfully');
        Future.microtask(() {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const LoginPage()),
            (route) => false,
          );
        });
      } else {
        Fluttertoast.showToast(msg: "Can't Logout");
      }
    }).catchError((error) async {
      stopLoader();
      if (kDebugMode) {
        print(error);
      }
    });
  }

  String getFlag(String countryCode) {
    return countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
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

  void _getDailyNeedsCategories() async {
    try {
      isCategoryLoading = true;
      final response = await Webservice().fetchDailyNeeds();

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
    isCategoryLoading = false;
  }

  void _getFoodAndBeverageCategories() async {
    try {
      isCategoryLoading = true;
      final response = await Webservice().fetchFoodAndBeverage();

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
    isCategoryLoading = false;
  }

  void _getServiceCategories() async {
    try {
      isCategoryLoading = true;
      final response = await Webservice().fetchService();

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
    isCategoryLoading = false;
  }

  startLoader() {
    LoadingDialog.showLoaderDialog(context, 'Please Wait..');
  }

  stopLoader() {
    Navigator.of(context).pop();
  }
}
