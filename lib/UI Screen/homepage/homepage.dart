import 'dart:core';
import 'package:askun_delivery_app/Models/Category/DailyNeeds.dart';
import 'package:askun_delivery_app/Models/advertiesment/advertiesment.dart';
import 'package:askun_delivery_app/UI%20Screen/address/address.dart';
import 'package:askun_delivery_app/UI%20Screen/categories/dailyneeds/groceirspage.dart';
import 'package:askun_delivery_app/UI%20Screen/categories/viewcategoriesdetails.dart';
import 'package:askun_delivery_app/UI%20Screen/login%20page/login.dart';
import 'package:askun_delivery_app/UI%20Screen/notification/notification.dart';
import 'package:askun_delivery_app/UI%20Screen/searchpage/serachpage.dart';
import 'package:askun_delivery_app/services/service.dart';
import 'package:askun_delivery_app/utilites/api_constant.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/loader.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:page_transition/page_transition.dart';

AdvertisementResponse? _adsList;

// Banner Image
// final List<String> imgList = [
//   'assets/home/img1.png',
//   'assets/home/img2.png',
//   'assets/home/img3.png',
//   'assets/home/img4.png',
//   'assets/home/img5.png',
//   'assets/home/img6.png',
// ];

// Language
class Language {
  Locale locale;
  String langName;

  Language({required this.locale, required this.langName});
}

// Banner fetch image

final List<Widget> imageSliders = _adsList!.message!
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(_adsList!.message!.first.name.toString(),
                  fit: BoxFit.cover, width: 1000.0)),
        ))
    .toList();

// Categories

class DailyNeeds {
  final String cateName;
  final String img;

  DailyNeeds({required this.cateName, required this.img});
}

class Food {
  final String cateName;
  final String img;

  Food({required this.cateName, required this.img});
}

class Service {
  final String cateName;
  final String img;

  Service({required this.cateName, required this.img});
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

  List<Food> Foodlist = <Food>[
    Food(
      cateName: "spicyFamilyResturant",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "kritungaResturant",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "tastyFoodCourt",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "bakery-RupaBakery",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "teaTime",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "grandsVajraj's",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "Tandoori",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "Venkateshwara Hotel",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "Kababa & Grills",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "Ruchi Mess",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "Fruit Juices",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "Brundavan Family Resturant",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "Thaneer Tea House",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "Good Morning tiffns",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "Good Morning ",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "Evening Snacks",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "waahh Mandi Resturant",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "Ice Cream & Milkshakes",
      img: MyStrings.img3,
    ),
  ];
  List<Service> AskforService = <Service>[
    Service(
      cateName: "electrician",
      img: MyStrings.img3,
    ),
    Service(
      cateName: "plumber",
      img: MyStrings.img3,
    ),
    Service(
      cateName: "painting",
      img: MyStrings.img3,
    ),
    Service(
      cateName: "appliances",
      img: MyStrings.img3,
    ),
    Service(
      cateName: "cabServices",
      img: MyStrings.img3,
    ),
    Service(
      cateName: "packersandMovers",
      img: MyStrings.img3,
    ),
    Service(
      cateName: "packersandMovers",
      img: MyStrings.img3,
    ),
    Service(
      cateName: "Contruction",
      img: MyStrings.img3,
    ),
    Service(
      cateName: "Event Management",
      img: MyStrings.img3,
    ),
    Service(
      cateName: "Interior Designing",
      img: MyStrings.img3,
    ),
    Service(
      cateName: "Carpentary",
      img: MyStrings.img3,
    ),
    Service(
      cateName: "Beauty & Spa sri Nithya's",
      img: MyStrings.img3,
    ),
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
  final _advancedDrawerController = AdvancedDrawerController();
  String currentStreet = "";
  String pincode = "";
  bool currentLocation = false;
  final bool _isLoading = false;
  List<DailyNeedsCategory> categories = [];

  @override
  void initState() {
    super.initState();
    selectedLanguage = getFlag('DE');
    _determinePosition();
    _getCarouselImages(widget.accessToken.toString());
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
      });
    } catch (e) {
      print(e);
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
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                children: [
                  ListTile(
                      title: Row(
                    children: [
                      Icon(Icons.account_circle, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.profile,
                        color: whiteColor,
                        size: 18,
                      )
                    ],
                  )),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    color: whiteColor.withOpacity(0.5),
                    height: 1,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  ListTile(
                      title: Row(
                    children: [
                      Icon(Icons.add_shopping_cart, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.myOrder,
                        color: whiteColor,
                        size: 18,
                      )
                    ],
                  )),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    color: whiteColor.withOpacity(0.5),
                    height: 1,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  ListTile(
                      title: Row(
                    children: [
                      Icon(Icons.local_offer_outlined, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.offerAndPromo,
                        color: whiteColor,
                        size: 18,
                      )
                    ],
                  )),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    color: whiteColor.withOpacity(0.5),
                    height: 1,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  ListTile(
                      title: Row(
                    children: [
                      Icon(Icons.language_outlined, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.changeLanguage,
                        color: whiteColor,
                        size: 18,
                      )
                    ],
                  )),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    color: whiteColor.withOpacity(0.5),
                    height: 1,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  ListTile(
                      title: Row(
                    children: [
                      Icon(Icons.edit_document, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.complaints,
                        color: whiteColor,
                        size: 18,
                      )
                    ],
                  )),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    color: whiteColor.withOpacity(0.5),
                    height: 1,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  ListTile(
                      title: Row(
                    children: [
                      Icon(Icons.article_outlined, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.privacyPolicy,
                        color: whiteColor,
                        size: 18,
                      )
                    ],
                  )),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    color: whiteColor.withOpacity(0.5),
                    height: 1,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  ListTile(
                      title: Row(
                    children: [
                      Icon(Icons.security_outlined, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.security,
                        color: whiteColor,
                        size: 18,
                      )
                    ],
                  )),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    color: whiteColor.withOpacity(0.5),
                    height: 1,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  ListTile(
                      title: Row(
                    children: [
                      Icon(Icons.support_agent_outlined, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.support,
                        color: whiteColor,
                        size: 18,
                      )
                    ],
                  )),
                  SizedBox(
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
                  // _logout();
                },
                title: Row(
                  children: [
                    Icon(Icons.logout_outlined, color: whiteColor),
                    widthSpace,
                    SmallText(
                      text: MyStrings.signOut,
                      color: whiteColor,
                      size: 18,
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
                icon: Icon(Icons.notifications),
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
                          text: MyStrings.searchForSomething,
                          color: blueGrey,
                        ),
                      ],
                    ),
                  ),
                  // child: const Center(
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //         hintText: 'Search for something',
                  //         prefixIcon: Icon(Icons.search),
                  //       ),
                  //   ),
                  // ),
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
                                      text:
                                          '${currentStreet} ${currentState} - ${pincode}',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2.2,
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
                            text: MyStrings.callNow,
                            color: whiteColor,
                            fontWeight: FontWeight.w900,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2.2,
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
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                _imgList.isNotEmpty
                    ? CarouselSlider.builder(
                        itemCount: _imgList.length,
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          final message = _imgList[index];
                          final imgUrl =
                              ApiConstants.imageBaseURL + message.img!;
                          return Image.network(
                            imgUrl,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.9,
                          initialPage: 0,
                          autoPlayInterval: Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          onPageChanged: (index, reason) {},
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
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
                                        ? Colors.white
                                        : primaryColor)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                heightSpace,
                heightSpace,
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                        text: MyStrings.dailyNeeds,
                        fontWeight: FontWeight.bold,
                        size: 20,
                      ),
                      heightSpace,
                      // _isLoading
                      //     ? const Center(child: CircularProgressIndicator())
                      //     :
                      GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 2.2,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: 6,
                          primary: false,
                          physics: const NeverScrollableScrollPhysics(),
                          // controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                DailyNeedsList[index].cateName == 'groceries'
                                    ? Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child: const GroceriesPage()))
                                    : const SizedBox();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
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
                            );
                          }),
                      heightSpace,
                      Center(
                          child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: const ViewCategories()));
                              },
                              height: 40,
                              minWidth: MediaQuery.of(context).size.width / 1.2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: primaryColor,
                              child: SmallText(
                                text: MyStrings.viewAll,
                                fontWeight: FontWeight.w500,
                                color: whiteColor,
                              ))),
                      heightSpace,
                      heightSpace,
                      heightSpace,
                      SmallText(
                        text: 'foods&Beverages'.tr(),
                        size: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 2,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: 6,
                          primary: false,
                          physics: const NeverScrollableScrollPhysics(),
                          // controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Foodlist[index].img,
                                  ),
                                  heightSpace,
                                  SmallText(
                                    text: Foodlist[index].cateName.tr(),
                                    fontWeight: FontWeight.w500,
                                    size: 14,
                                    textAlign: TextAlign.center,
                                    maxline: 1,
                                  ),
                                ],
                              ),
                            );
                          }),
                      heightSpace,
                      heightSpace,
                      heightSpace,
                      SmallText(
                        text: 'askforServices'.tr(),
                        size: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      heightSpace,
                      GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 2,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: 6,
                          primary: false,
                          physics: const NeverScrollableScrollPhysics(),
                          // controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AskforService[index].img,
                                  ),
                                  heightSpace,
                                  SmallText(
                                    text: AskforService[index].cateName.tr(),
                                    color: blackColor,
                                    fontWeight: FontWeight.w500,
                                    size: 14,
                                    textAlign: TextAlign.center,
                                    maxline: 1,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ]),
            ]),
          ),
        ],
      ),
    );

    //   AdvancedDrawer(
    //   backdropColor: circleColor,
    //   controller: _advancedDrawerController,
    //   animationCurve: Curves.easeInOut,
    //   animationDuration: const Duration(milliseconds: 300),
    //   animateChildDecoration: true,
    //   rtlOpening: false,
    //   // openScale: 1.0,
    //   disabledGestures: false,
    //   childDecoration: const BoxDecoration(
    //       borderRadius: BorderRadius.all(Radius.circular(16))),
    //   drawer: SafeArea(
    //     child: ListTileTheme(
    //       textColor: Colors.black,
    //       iconColor: Colors.black,
    //       child: ListView(
    //         // mainAxisSize: MainAxisSize.max,
    //         children: [
    //           Row(
    //             children: [
    //               Container(
    //                 // width: 100.0,
    //                 // height: 100.0,
    //                 margin: const EdgeInsets.only(
    //                   top: 24.0,
    //                   bottom: 20.0,
    //                   left: 10,
    //                 ),
    //                 clipBehavior: Clip.antiAlias,
    //                 decoration: const BoxDecoration(
    //                   color: Colors.black26,
    //                   shape: BoxShape.circle,
    //                 ),
    //                 child: Image.asset(
    //                   'assets/logo.png',
    //                   height: 75,
    //                   width: 75,
    //                 ),
    //               ),
    //               widthSpace,
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Row(
    //                     children: [
    //                       Icon(
    //                         Icons.person,
    //                         color: primaryColor,
    //                         size: 28.0,
    //                       ),
    //                       const SizedBox(
    //                         width: 5,
    //                       ),
    //                       Container(
    //                           width: MediaQuery.of(context).size.width / 2.4,
    //                           child: SmallText(
    //                             text: 'Venkata Narasimha',
    //                             size: 16,
    //                             fontWeight: FontWeight.bold,
    //                           )),
    //                     ],
    //                   ),
    //                   const SizedBox(
    //                     height: 5,
    //                   ),
    //                   Row(
    //                     children: [
    //                       Icon(
    //                         Icons.call,
    //                         color: primaryColor,
    //                         size: 28.0,
    //                       ),
    //                       const SizedBox(
    //                         width: 5,
    //                       ),
    //                       SmallText(
    //                         text: "9876543210",
    //                         size: 16,
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //           heightSpace,
    //           Padding(
    //             padding: const EdgeInsets.only(left: 20.0),
    //             child: Container(
    //               width: MediaQuery.of(context).size.width,
    //               height: 1,
    //               color: primaryColor,
    //             ),
    //           ),
    //           heightSpace,
    //           heightSpace,
    //           ListTile(
    //             contentPadding: const EdgeInsets.only(left: 30),
    //             onTap: () {},
    //             leading: const Image(
    //               image: AssetImage('assets/drawer/orderhistoy.png'),
    //             ),
    //             title: SmallText(
    //               text: MyStrings.orderHistory,
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //           ListTile(
    //             contentPadding: EdgeInsets.only(left: 30, top: 5),
    //             onTap: () {},
    //             leading: const Image(
    //               image: AssetImage('assets/drawer/offer.png'),
    //             ),
    //             title: SmallText(
    //               text: MyStrings.offers,
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //           ListTile(
    //             contentPadding: EdgeInsets.only(left: 30, top: 5),
    //             onTap: () {},
    //             leading: const Image(
    //               image: AssetImage('assets/drawer/wallet.png'),
    //             ),
    //             title: SmallText(
    //               text: MyStrings.wallet,
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //           ListTile(
    //             contentPadding: EdgeInsets.only(left: 30, top: 5),
    //             onTap: () {},
    //             leading: const Image(
    //               image: AssetImage('assets/drawer/refer.png'),
    //             ),
    //             title: SmallText(
    //               text: MyStrings.refer,
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //           ListTile(
    //             contentPadding: const EdgeInsets.only(left: 30, top: 5),
    //             onTap: () {},
    //             leading: const Image(
    //               image: AssetImage('assets/drawer/complain.png'),
    //             ),
    //             title: SmallText(
    //               text: MyStrings.allCompliant,
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //           ListTile(
    //             contentPadding: const EdgeInsets.only(left: 30, top: 5),
    //             onTap: () {},
    //             leading: const Image(
    //               image: AssetImage('assets/drawer/replacement.png'),
    //             ),
    //             title: SmallText(
    //               text: MyStrings.replacementRequest,
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //           ListTile(
    //             contentPadding: const EdgeInsets.only(left: 30, top: 5),
    //             onTap: () {},
    //             leading: const Image(
    //               image: AssetImage('assets/drawer/rateus.png'),
    //             ),
    //             title: SmallText(
    //               text: MyStrings.rateUs,
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //           ListTile(
    //             contentPadding: const EdgeInsets.only(left: 30, top: 5),
    //             onTap: () {},
    //             leading: const Image(
    //               image: AssetImage('assets/drawer/faq.png'),
    //             ),
    //             title: SmallText(
    //               text: MyStrings.faq,
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //           ListTile(
    //             contentPadding: const EdgeInsets.only(left: 30, top: 5),
    //             onTap: () {},
    //             leading: const Image(
    //               image: AssetImage('assets/drawer/about.png'),
    //             ),
    //             title: SmallText(
    //               text: MyStrings.aboutUs,
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //           ListTile(
    //             contentPadding: const EdgeInsets.only(left: 30, top: 5),
    //             onTap: () {},
    //             leading: const Image(
    //               image: AssetImage('assets/drawer/terms.png'),
    //             ),
    //             title: SmallText(
    //               text: MyStrings.termsOfUse,
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //           ListTile(
    //             contentPadding: const EdgeInsets.only(left: 30, top: 5),
    //             onTap: () {},
    //             leading: const Image(
    //               image: AssetImage('assets/drawer/privacy.png'),
    //             ),
    //             title: SmallText(
    //               text: MyStrings.privacyAndpolicy,
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //           ListTile(
    //             contentPadding: const EdgeInsets.only(left: 30, top: 5),
    //             onTap: () {
    //               _logout('${widget.refreshToken}');
    //             },
    //             leading: const Image(
    //               image: AssetImage('assets/drawer/logout.png'),
    //             ),
    //             title: SmallText(
    //               text: MyStrings.logOut,
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   child: Scaffold(
    //     backgroundColor: bgColor,
    //     appBar: AppBar(
    //       title: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 10),
    //         child: Image.asset('assets/logo.png'),
    //       ),
    //       leading: IconButton(
    //         onPressed: _handleMenuButtonPressed,
    //         icon: ValueListenableBuilder<AdvancedDrawerValue>(
    //           valueListenable: _advancedDrawerController,
    //           builder: (_, value, __) {
    //             return AnimatedSwitcher(
    //               duration: const Duration(milliseconds: 250),
    //               child: Icon(
    //                 value.visible ? Icons.clear : Icons.menu,
    //                 key: ValueKey<bool>(value.visible),
    //               ),
    //             );
    //           },
    //         ),
    //       ),
    //       actions: [
    //         IconButton(
    //           onPressed: () {},
    //           icon: const Icon(Icons.notifications, size: 30),
    //         ),
    //       ],
    //     ),
    //     body: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           Container(
    //             color: locationContainerColor,
    //             child: InkWell(
    //               onTap: () {
    //                 Navigator.push(
    //                     context,
    //                     PageTransition(
    //                         type: PageTransitionType.rightToLeft,
    //                         child: const AddressScreen()));
    //               },
    //               child: Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                     vertical: 10, horizontal: 10),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     widthSpace,
    //                     Icon(
    //                       Icons.location_on,
    //                       size: 25,
    //                       color: iconColor,
    //                     ),
    //                     const SizedBox(
    //                       width: 5,
    //                     ),
    //                     Row(
    //                       children: [
    //                         widget.selectedAddress == null
    //                             ? const SizedBox()
    //                             : SmallText(
    //                           text:
    //                           widget.selectedAddress.toString(),
    //                         ),
    //                         currentStreet == "" &&
    //                             widget.selectedAddress == null
    //                             ? SmallText(
    //                           text: "Delivery Location",
    //                         )
    //                             : SmallText(
    //                           text: currentStreet,
    //                         ),
    //                         Padding(
    //                           padding: const EdgeInsets.only(top: 3.0),
    //                           child: Icon(
    //                             Icons.keyboard_arrow_down_sharp,
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //           heightSpace,
    //           Container(
    //             color: locationContainerColor,
    //             child: Row(
    //               children: languageList.map((Language language) {
    //                 return Expanded(
    //                   child: RadioListTile<Locale>(
    //                     activeColor: primaryColor,
    //                     title: SmallText(
    //                       text: language.langName,
    //                       size: 16,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                     value: language.locale,
    //                     groupValue: Localizations.localeOf(context),
    //                     onChanged: (Locale? value) {
    //                       setState(() {
    //                         context.setLocale(value!);
    //                       });
    //                     },
    //                     contentPadding: EdgeInsets.zero,
    //                   ),
    //                 );
    //               }).toList(),
    //             ),
    //           ),
    //           heightSpace,
    //           Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: [
    //               Container(
    //                 height: 60,
    //                 width: MediaQuery.of(context).size.width/2.2,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     gradient: LinearGradient(
    //                         begin: const FractionalOffset(0.0, 0.0),
    //                         end: const FractionalOffset(0.4, 0.0),
    //                         colors: <Color>[secondPrimaryColor, const Color(0xff33056F).withOpacity(0.77)])),
    //                 child: Row(mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     const Image(image:  AssetImage('assets/home/phone.png'),width: 40,height: 40,),
    //                     widthSpace,
    //                     SmallText(text: MyStrings.callNow,color: whiteColor,fontWeight: FontWeight.w900,size: 18,)
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 height: 60,
    //                 width: MediaQuery.of(context).size.width/2.2,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     gradient: LinearGradient(
    //                         begin: const FractionalOffset(0.0, 0.0),
    //                         end: const FractionalOffset(0.4, 0.0),
    //                         colors: <Color>[secondPrimaryColor, const Color(0xff33056F).withOpacity(0.77)])),
    //                 child: Row(mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     const Image(image:  AssetImage('assets/home/whatsapp.png'),width: 40,height: 40,),
    //                     widthSpace,
    //                     SmallText(text: MyStrings.whatsapp,color: whiteColor,fontWeight: FontWeight.w900,size: 18,)
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SizedBox(height: 30,),
    //
    //           // CarouselSlider(
    //           //   items: imageSliders,
    //           //   carouselController: _controller,
    //           //   options: CarouselOptions(
    //           //       autoPlay: true,
    //           //       disableCenter: false,
    //           //       initialPage: 0,
    //           //       enlargeCenterPage: false,
    //           //       aspectRatio: 2.0,
    //           //       onPageChanged: (index, reason) {
    //           //         setState(() {
    //           //           _current = index;
    //           //         });
    //           //       }),
    //           // ),
    //
    //           _imgList.isNotEmpty
    //               ? CarouselSlider.builder(
    //             itemCount: _imgList.length,
    //             itemBuilder:
    //                 (BuildContext context, int index, int realIndex) {
    //               final message = _imgList[index];
    //               final imgUrl = ApiConstants.imageBaseURL + message.img!;
    //               return Image.network(
    //                 imgUrl,
    //                 fit: BoxFit.cover,
    //                 width: MediaQuery.of(context).size.width,
    //               );
    //             },
    //             options: CarouselOptions(
    //               autoPlay: true,
    //               aspectRatio: 16 / 9,
    //               viewportFraction: 0.9,
    //               initialPage: 0,
    //               autoPlayInterval: Duration(seconds: 5),
    //               autoPlayAnimationDuration: Duration(milliseconds: 800),
    //               autoPlayCurve: Curves.fastOutSlowIn,
    //               enlargeCenterPage: true,
    //               enableInfiniteScroll: true,
    //               onPageChanged: (index, reason) {},
    //             ),
    //           )
    //               : Center(
    //             child: CircularProgressIndicator(),
    //           ),
    //           heightSpace,
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 75  ),
    //             child: TextField(
    //               cursorColor: secondPrimaryColor,
    //               keyboardType: TextInputType.number,
    //               decoration: InputDecoration(
    //                 filled: true,
    //                 hoverColor: primaryColor,
    //                 focusColor: primaryColor,
    //                 isDense: true,
    //                 counterText: "",
    //                 contentPadding:
    //                 const EdgeInsets.fromLTRB(10, 12, 10, 12),
    //                 border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(50)
    //                 ),
    //                 focusedBorder: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(50)
    //
    //                 ),
    //
    //                 prefixIcon:Icon(Icons.search,color: blackColor),
    //               ),
    //             ),
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: _imgList.asMap().entries.map((entry) {
    //               return GestureDetector(
    //                 onTap: () => _controller.animateToPage(entry.key),
    //                 child: Container(
    //                   width: 12.0,
    //                   height: 12.0,
    //                   margin: const EdgeInsets.symmetric(
    //                       vertical: 8.0, horizontal: 4.0),
    //                   decoration: BoxDecoration(
    //                       shape: BoxShape.circle,
    //                       color: (Theme.of(context).brightness ==
    //                           Brightness.dark
    //                           ? Colors.white
    //                           : primaryColor)
    //                           .withOpacity(_current == entry.key ? 0.9 : 0.4)),
    //                 ),
    //               );
    //             }).toList(),
    //           ),
    //           heightSpace,
    //           heightSpace,
    //
    //           Padding(
    //             padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
    //             child: Column(
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     SmallText(
    //                       text: 'dailyneeds'.tr(),
    //                       fontWeight: FontWeight.bold,
    //                       size: 20,
    //                     ),
    //                     InkWell(
    //                       onTap: () {},
    //                       child: Row(
    //                         children: [
    //                           Text("See More",
    //                               style: TextStyle(
    //                                   fontSize: 17,
    //                                   color: seeColor,
    //                                   fontWeight: FontWeight.bold)),
    //                           Icon(
    //                             Icons.arrow_drop_down_outlined,
    //                             size: 35,
    //                             color: primaryColor,
    //                           )
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 heightSpace,
    //                 _isLoading
    //                     ? const Center(child: CircularProgressIndicator())
    //                     : GridView.builder(
    //                     gridDelegate:
    //                     const SliverGridDelegateWithFixedCrossAxisCount(
    //                       childAspectRatio: 2 / 2.2,
    //                       crossAxisCount: 3,
    //                       mainAxisSpacing: 10,
    //                       crossAxisSpacing: 10,
    //                     ),
    //                     itemCount: categories.length,
    //                     primary: false,
    //                     physics: const NeverScrollableScrollPhysics(),
    //                     // controller: ScrollController(keepScrollOffset: false),
    //                     shrinkWrap: true,
    //                     itemBuilder: (BuildContext ctx, index) {
    //                       return GestureDetector(
    //                         onTap: () {
    //                           DailyNeedsList[index].cateName == 'groceries'
    //                               ? Navigator.push(
    //                               context,
    //                               PageTransition(
    //                                   type: PageTransitionType
    //                                       .rightToLeft,
    //                                   child: const GroceriesPage()))
    //                               : const SizedBox();
    //                         },
    //                         child: Card(
    //                           elevation: 5,
    //                           shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(15),
    //                           ),
    //                           child: Container(
    //                               decoration: BoxDecoration(
    //                                   color: containerColor,
    //                                   borderRadius:
    //                                   BorderRadius.circular(15),
    //                                   border: Border.all(
    //                                       color: primaryColor
    //                                           .withOpacity(0.4))),
    //                               child: Padding(
    //                                 padding: const EdgeInsets.all(8.0),
    //                                 child: Column(
    //                                   mainAxisAlignment:
    //                                   MainAxisAlignment.center,
    //                                   children: [
    //                                     Image.asset(
    //                                       DailyNeedsList[index].img,
    //                                     ),
    //                                     heightSpace,
    //                                     SmallText(
    //                                       text: categories[index]
    //                                           .name
    //                                           .toString(),
    //                                       color: primaryColor,
    //                                       fontWeight: FontWeight.bold,
    //                                       size: 14,
    //                                       textAlign: TextAlign.center,
    //                                       maxline: 1,
    //                                     ),
    //                                   ],
    //                                 ),
    //                               )),
    //                         ),
    //                       );
    //                     }),
    //                 heightSpace,
    //                 heightSpace,
    //                 heightSpace,
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     SmallText(
    //                       text: 'foods&Beverages'.tr(),
    //                       size: 20,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                     Row(
    //                       children: [
    //                         Text("See Less",
    //                             style: TextStyle(
    //                                 fontSize: 17,
    //                                 color: seeColor,
    //                                 fontWeight: FontWeight.bold)),
    //                         Icon(
    //                           Icons.arrow_drop_up_sharp,
    //                           size: 35,
    //                           color: primaryColor,
    //                         )
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //                 heightSpace,
    //                 GridView.builder(
    //                     gridDelegate:
    //                     const SliverGridDelegateWithFixedCrossAxisCount(
    //                       childAspectRatio: 2 / 2.2,
    //                       crossAxisCount: 3,
    //                       mainAxisSpacing: 10,
    //                       crossAxisSpacing: 10,
    //                     ),
    //                     itemCount: Foodlist.length,
    //                     primary: false,
    //                     physics: const NeverScrollableScrollPhysics(),
    //                     // controller: ScrollController(keepScrollOffset: false),
    //                     shrinkWrap: true,
    //                     itemBuilder: (BuildContext ctx, index) {
    //                       return GestureDetector(
    //                         onTap: () {},
    //                         child: Card(
    //                           elevation: 5,
    //                           shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(15),
    //                           ),
    //                           child: Container(
    //                               decoration: BoxDecoration(
    //                                   color: containerColor,
    //                                   borderRadius: BorderRadius.circular(10),
    //                                   border: Border.all(
    //                                       color:
    //                                       primaryColor.withOpacity(0.4))),
    //                               child: Padding(
    //                                 padding: const EdgeInsets.all(8.0),
    //                                 child: Column(
    //                                   mainAxisAlignment:
    //                                   MainAxisAlignment.center,
    //                                   children: [
    //                                     Image.asset(
    //                                       Foodlist[index].img,
    //                                     ),
    //                                     heightSpace,
    //                                     SmallText(
    //                                       text: Foodlist[index].cateName.tr(),
    //                                       color: primaryColor,
    //                                       fontWeight: FontWeight.bold,
    //                                       size: 14,
    //                                       textAlign: TextAlign.center,
    //                                       maxline: 1,
    //                                     ),
    //                                   ],
    //                                 ),
    //                               )),
    //                         ),
    //                       );
    //                     }),
    //                 heightSpace,
    //                 heightSpace,
    //                 heightSpace,
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     SmallText(
    //                       text: 'askforServices'.tr(),
    //                       size: 20,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                     Row(
    //                       children: [
    //                         Text("See More",
    //                             style: TextStyle(
    //                                 fontSize: 17,
    //                                 color: seeColor,
    //                                 fontWeight: FontWeight.bold)),
    //                         Icon(
    //                           Icons.arrow_drop_down_outlined,
    //                           size: 35,
    //                           color: primaryColor,
    //                         )
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //                 heightSpace,
    //                 GridView.builder(
    //                     gridDelegate:
    //                     const SliverGridDelegateWithFixedCrossAxisCount(
    //                       childAspectRatio: 2 / 2.2,
    //                       crossAxisCount: 3,
    //                       mainAxisSpacing: 10,
    //                       crossAxisSpacing: 10,
    //                     ),
    //                     itemCount: AskforService.length,
    //                     primary: false,
    //                     physics: const NeverScrollableScrollPhysics(),
    //                     // controller: ScrollController(keepScrollOffset: false),
    //                     shrinkWrap: true,
    //                     itemBuilder: (BuildContext ctx, index) {
    //                       return GestureDetector(
    //                         onTap: () {},
    //                         child: Card(
    //                           elevation: 5,
    //                           shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(15),
    //                           ),
    //                           child: Container(
    //                               decoration: BoxDecoration(
    //                                   color: containerColor,
    //                                   borderRadius: BorderRadius.circular(10),
    //                                   border: Border.all(
    //                                       color:
    //                                       primaryColor.withOpacity(0.4))),
    //                               child: Padding(
    //                                 padding: const EdgeInsets.all(8.0),
    //                                 child: Column(
    //                                   mainAxisAlignment:
    //                                   MainAxisAlignment.center,
    //                                   children: [
    //                                     Image.asset(
    //                                       AskforService[index].img,
    //                                     ),
    //                                     heightSpace,
    //                                     SmallText(
    //                                       text: AskforService[index]
    //                                           .cateName
    //                                           .tr(),
    //                                       color: primaryColor,
    //                                       fontWeight: FontWeight.bold,
    //                                       size: 14,
    //                                       textAlign: TextAlign.center,
    //                                       maxline: 1,
    //                                     ),
    //                                   ],
    //                                 ),
    //                               )),
    //                         ),
    //                       );
    //                     }),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  _logout(
    String refreshToken,
  ) async {
    startLoader();
    Webservice()
        .callLogoutService(refreshToken: refreshToken)
        .then((onResponse) async {
      stopLoader();
      if (onResponse.status == true) {
        Fluttertoast.showToast(msg: 'Logout Successfully');
        await Future.delayed(const Duration(seconds: 2));
        Future.microtask(() {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const LoginPage()),
            (route) => false,
          );
        });
      } else {
        Fluttertoast.showToast(msg: "Invalid OTP");
      }
    }).catchError((error) async {
      stopLoader();
      print(error);
    });
  }

  String getFlag(String countryCode) {
    return countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  final List<Message> _imgList = [];

  void _getCarouselImages(String accessToken) async {
    try {
      final onResponse = await Webservice().getHomeCarouselService(
        accessToken: accessToken,
      );

      if (onResponse.status == true) {
        for (var i = 0; i < onResponse.message!.length; i++) {
          var message = onResponse.message![i];
          _imgList.add(message);
          print('Image ${i + 1}: ${ApiConstants.imageBaseURL + message.img!}');
        }
      } else {
        // Handle error case here
      }
    } catch (error) {
      // Handle error case here
    }
  }

  // Future<void> getCarouselImg(String accessToken) async {
  //   final adsList = await Webservice().getHomeCarouselService(accessToken: accessToken);
  //   setState(() {
  //     _adsList = adsList;
  //   });
  // }

  startLoader() {
    LoadingDialog.showLoaderDialog(context, 'Please Wait..');
  }

  stopLoader() {
    Navigator.of(context).pop();
  }
}
