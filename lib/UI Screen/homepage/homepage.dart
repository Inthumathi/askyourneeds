import 'dart:core';
import 'dart:io';
import 'package:askun_delivery_app/Models/Category/DailyNeeds.dart';
import 'package:askun_delivery_app/Models/advertisement/advertiesment.dart';
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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:page_transition/page_transition.dart';


// Language
class Language {
  Locale locale;
  String langName;

  Language({required this.locale, required this.langName});
}


class DailyNeeds {
  final String cateName;
  final String img;

  DailyNeeds({required this.cateName, required this.img});
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
  final List<String> imageUrls = [
    'https://example.com/image1.jpg',
    'https://example.com/image2.jpg',
    'https://example.com/image3.jpg',
    'https://example.com/image4.jpg',
    'https://example.com/image5.jpg',
  ];

  final String? selectedAddress;
  final String? refreshToken;
  final String? accessToken;

  HomeScreen(
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
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];
  final int _current = 0;
  String currentState = "";
  final CarouselController _controller = CarouselController();
  late String selectedLanguage;
  String currentStreet = "";
  String pincode = "";
  String currentCity = "";
  bool currentLocation = false;
  final bool _isLoading = false;
  List<Message> _imgList = [];
  List<DailyNeedResponse> categories = [];
  List<MessageDailyNeeds> _dailyNeedsList = [];


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
                // Important: Remove any padding from the ListView.
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
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
                      Icon(Icons.add_shopping_cart, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.myOrder,
                        color: whiteColor,
                        size: 18,
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
                        text: MyStrings.offerAndPromo,
                        color: whiteColor,
                        size: 18,
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
                      Icon(Icons.language_outlined, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.changeLanguage,
                        color: whiteColor,
                        size: 18,
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
                        text: MyStrings.complaints,
                        color: whiteColor,
                        size: 18,
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
                        text: MyStrings.privacyPolicy,
                        color: whiteColor,
                        size: 18,
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
                      Icon(Icons.security_outlined, color: whiteColor),
                      widthSpace,
                      SmallText(
                        text: MyStrings.security,
                        color: whiteColor,
                        size: 18,
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
                        text: MyStrings.support,
                        color: whiteColor,
                        size: 18,
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
                          text: MyStrings.searchForSomething,
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
                const SizedBox(
                  height: 30,
                ),
                _imgList.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : CarouselSlider(
                        items: _imgList.map((message) {
                          String imageUrl = message.img!;
                          if (!imageUrl.startsWith('http')) {
                            imageUrl =
                                '${ApiConstants.imageBaseURL}$imageUrl';
                          }

                          return Builder(
                            builder: (BuildContext context) {
                              if (imageUrl.startsWith('http')) {
                                // Load image from network URL
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Image.network(imageUrl, fit: BoxFit.cover,
                                    width: double.infinity,),
                                );
                              } else {
                                // Load image from local file
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Image.file(File(imageUrl),
                                    fit: BoxFit.cover,
                                    width: double.infinity,),
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
                                        child: ViewCategories()));
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
                                    fontWeight: FontWeight.bold,
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
                      Center(
                          child: MaterialButton(
                              onPressed: () {},
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
                                    fontWeight: FontWeight.bold,
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
                      Center(
                          child: MaterialButton(
                              onPressed: () {},
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
                        text: 'Top Picks For You'.tr(),
                        size: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      heightSpace,
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: TopPicksList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: blackColor.withOpacity(0.7),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
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
                                                  TopPicksList[index].img),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: offerColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 3),
                                          child: SmallText(
                                            text: TopPicksList[index].offer,
                                            size: 15,
                                            color: whiteColor,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SmallText(
                                                text: TopPicksList[index]
                                                    .cateName,
                                                size: 16,
                                                fontWeight: FontWeight.w600,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SmallText(
                                                text:
                                                    '\u{20B9} ${TopPicksList[index].price}',
                                                size: 16,
                                                fontWeight: FontWeight.w600),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            MaterialButton(
                                              minWidth: double.infinity,
                                              onPressed: () {},
                                              color: offerColor,
                                              clipBehavior: Clip.antiAlias,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.0))),
                                              child: SmallText(
                                                text: MyStrings.add,
                                                color: whiteColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            );
                          },
                        ),
                      ),
                      heightSpace,
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
      if (kDebugMode) {
        print(error);
      }
    });
  }

  String getFlag(String countryCode) {
    return countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
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
      }    }
  }

  startLoader() {
    LoadingDialog.showLoaderDialog(context, 'Please Wait..');
  }

  stopLoader() {
    Navigator.of(context).pop();
  }
}
