import 'package:askun_delivery_app/UI%20Screen/homepage/homepage.dart';
import 'package:askun_delivery_app/UI%20Screen/productdiscription/productdescription.dart';
import 'package:askun_delivery_app/UI%20Screen/searchpage/serachpage.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:badges/badges.dart' as badges;

// Banner Image
final List<String> imgList = [
  'assets/home/img1.png',
  'assets/home/img2.png',
  'assets/home/img3.png',
  'assets/home/img4.png',
  'assets/home/img5.png',
  'assets/home/img6.png',
];

class Category {
  final String title;
  final String image;
  final List<SubCategory> subCat;

  Category({required this.title, required this.subCat, required this.image});
}

class SubCategory {
  final String title;
  final String MRP;

  SubCategory({required this.title, required this.MRP});
}

class GroceriesPage extends StatefulWidget {
  const GroceriesPage({Key? key}) : super(key: key);

  @override
  State<GroceriesPage> createState() => _GroceriesPageState();
}

class _GroceriesPageState extends State<GroceriesPage> {
  int _selectedCat =
      0; // Initialized to 0, assuming the first category is selected by default
  int _current = 0;
  bool onFavorite = false;
  final CarouselController _controller = CarouselController();
  late bool _showCartBadge;
  int _cartBadgeAmount = 0;
  String _selectedCategoryTitle = "";
  int activeFavorite= 0;
  int activeButton= 0;
  String dropdownValue = '100kg';
  Color color = Colors.red;
  int _counter = 0;


  List<Category> categories = [
    Category(
      title: "Rice and Product",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "krunool Old Rice", MRP: '200'),
        SubCategory(title: "KVR Brown Rice", MRP: '1000'),
        SubCategory(title: "KVR Rice", MRP: '600'),
      ],
    ),
    Category(
      title: "Masala and Spices",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Aachi Mutton Masala", MRP: ''),
        SubCategory(title: "MTR Sambar Powder", MRP: ''),
        SubCategory(title: "Everest Cumin Powder", MRP: ''),
        SubCategory(title: "Eastern hyderabadi briyani masala", MRP: ''),
        SubCategory(title: "Eastern hyderabadi briyani masala", MRP: ''),
        SubCategory(title: "Eastern hyderabadi briyani masala", MRP: ''),
        SubCategory(title: "Eastern hyderabadi briyani masala", MRP: ''),
        SubCategory(title: "Eastern hyderabadi briyani masala", MRP: ''),
        SubCategory(title: "Eastern hyderabadi briyani masala", MRP: ''),
        SubCategory(title: "Eastern hyderabadi briyani masala", MRP: ''),
      ],
    ),
    Category(
      title: "Flours",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Aashirvaad Multigrains Attaa", MRP: ''),
        SubCategory(title: "Aashirvaad Whole wheat flour", MRP: ''),
        SubCategory(title: "Maida flour", MRP: ''),
        SubCategory(title: "Wheat bran", MRP: ''),
        SubCategory(title: "Bombay rava ", MRP: ''),
        SubCategory(title: "Corn flour bran", MRP: ''),
        SubCategory(title: "Ragi flour", MRP: ''),
        SubCategory(title: "Idili rava", MRP: ''),
        SubCategory(title: "Chickpea flour", MRP: ''),
        SubCategory(title: "Annupurna Wheat Atta", MRP: ''),
        SubCategory(title: "Jonna ravva  ", MRP: ''),
      ],
    ),
    Category(
      title: "Body,Skin and Hair",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Choclates and Buscuits",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Health drinks",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "olis and Ghee",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Dales and pulses",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Millets",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Salt,Sugar adn Jaggery",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Cooking and Ingredients",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Tea and Coffee",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Snacks and Numpk",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Instant Cook Items",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Instant Cook Items",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Spreads,Sauces and ketchup",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Oral Care",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Feminine hygiene",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Baby Care and Baby",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Pooja Needs",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Dry Fruits and Dates",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Perfumes and Deodorants",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Sanitizers and HandWash",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Rusk and Cakes",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "TimePass Snacks",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Dite Food",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
    Category(
      title: "Ointment and Cream",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", MRP: ''),
        SubCategory(title: "Subcategory 2.2", MRP: ''),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    _showCartBadge = _cartBadgeAmount > 0;

    return Scaffold(
        backgroundColor: Color(0xffeeeeee),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: blackColor)),
          backgroundColor: whiteColor,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SmallText(
              text: 'Groceries',
              color: primaryColor,
              fontWeight: FontWeight.bold,
              size: 18,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(10.0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: _selectedCategoryTitle == ""
                  ? SmallText(
                      text: "Select Sub Category",
                      fontWeight: FontWeight.w500,
                    )
                  : SmallText(
                      text: _selectedCategoryTitle,
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                      size: 18,
                    ),
            ),
          ),
          actions: [

            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: serachPage()));
              },
              icon: Icon(
                Icons.search,
                size: 25,
                color: blackColor,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            _shoppingCartBadge()
          ],
        ),
        bottomNavigationBar: Material(
          elevation: 10,
          child: Container(
            color: whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 35,
                width: 250,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: SmallText(
                    text: MyStrings.sendOTP,
                    color: whiteColor,
                    fontWeight: FontWeight.w500,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Row(
          children: [
            Material(
              elevation: 10,
              color: whiteColor,
              child: Container(
                width: 75,
                // color: circleColor,
                margin: const EdgeInsets.only(right: 15, top: 15),
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (ctx, i) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCat = i;
                          _selectedCategoryTitle = categories[i].title;
                        });
                      },
                      child: RotatedBox(
                        quarterTurns: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: _selectedCat == i
                                      ? primaryColor.withOpacity(0.7)
                                      : null,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      bottomRight: Radius.circular(25)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                      radius: 22,
                                      backgroundColor: _selectedCat == i
                                          ? null
                                          : primaryColor.withOpacity(0.7),
                                      backgroundImage: AssetImage(
                                        categories[i].image,
                                      )),
                                ),
                              ),
                              Text(
                                "${categories[i].title}",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(
                                        fontWeight:
                                            _selectedCat ==
                                                    i
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                        fontSize: _selectedCat == i ? 14 : 14,
                                        color: _selectedCat == i
                                            ? primaryColor
                                            : Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // child: Container(
                      //   margin: const EdgeInsets.only(bottom: 25.0),
                      //   // width: 50,
                      //   constraints: BoxConstraints(minHeight: 60),
                      //   alignment: Alignment.center,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.only(
                      //         topRight: Radius.circular(10),
                      //         bottomRight: Radius.circular(10)),
                      //     // border: _selectedCat == i ? Border.all() : Border(),
                      //     color: _selectedCat == i
                      //         ? primaryColor
                      //         : Colors.transparent,
                      //     // borderRadius: BorderRadius.circular(9.0),
                      //   ),
                      //   child: RotatedBox(
                      //     quarterTurns: 4,
                      //     child: Text(
                      //       "${categories[i].title}",
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .button
                      //           ?.copyWith(
                      //               fontWeight:
                      //                   _selectedCat ==
                      //                           i
                      //                       ? FontWeight.bold
                      //                       : FontWeight.normal,
                      //               fontSize: _selectedCat == i ? 12 : 12,
                      //               color: _selectedCat == i
                      //                   ? Colors.black
                      //                   : Colors.black),
                      //     ),
                      //   ),
                      // ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: SingleChildScrollView(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 /1.6,
                              crossAxisCount: 2,
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 2,
                            ),
                            itemCount: categories[_selectedCat].subCat.length,
                            primary: false,
                            physics: NeverScrollableScrollPhysics(),
                            // controller: ScrollController(keepScrollOffset: false),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext ctx, i) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {

                                  });
                                },
                                child: Container(
                                    color: whiteColor,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8,top: 5,bottom: 5),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: IconButton(
                                                onPressed: () {
                                                  print("You Pressed");
                                                  setState(() {
                                                    onFavorite = true;
                                                    activeFavorite = i;
                                                  });
                                                },
                                                icon: Icon(
                                                  activeFavorite == i &&
                                                      onFavorite == true
                                                      ? Icons.favorite:Icons.favorite_border,
                                                  color: Colors.red,
                                                  size: 20,
                                                )
                                              // : Icon(
                                              //     Icons.favorite_border,
                                              //     color: Colors.red,
                                              //     size: 20,
                                              //   ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  PageTransition(
                                                      type: PageTransitionType.rightToLeft,
                                                      child:  ProductDescription()));
                                            },
                                            child: Center(
                                              child: Image.asset(
                                                categories[i].image,
                                                width: 100,
                                              ),
                                            ),
                                          ),
                                          heightSpace,
                                          Center(
                                            child: SmallText(
                                              text: categories[_selectedCat]
                                                  .subCat[i]
                                                  .title,
                                              fontWeight: FontWeight.bold,
                                              size: 15,
                                              textAlign: TextAlign.center,
                                              maxline: 1,
                                            ),
                                          ),
                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SmallText(
                                                  text: '\u{20B9}${categories[_selectedCat].subCat[i].MRP}',
                                                  fontWeight: FontWeight.w500
                                              ),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  value: dropdownValue,
                                                  items: <String>[
                                                    '100kg',
                                                    '200kg'
                                                  ].map<DropdownMenuItem<String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: SmallText(
                                                        text: value,
                                                        color: primaryColor,
                                                        size: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                         _counter == 0 && activeButton == i ?
                                          Center(
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _counter++;
                                                  activeButton = i;
                                                });
                                              },
                                              child: Container(
                                                width: 100,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5.0),
                                                  border: Border.all(width: 1.0, color: primaryColor),
                                                ),
                                                child: Center(
                                                  child: SmallText(
                                                    text: MyStrings.add,
                                                    color: primaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ) :
                                          Center(
                                            child: Container(
                                              width: 120,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0),
                                                color: primaryColor,
                                                border: Border.all(width: 1.0, color: primaryColor),
                                              ),
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                    icon: Icon(Icons.remove, size: 16, color: whiteColor),
                                                    onPressed: () {
                                                      setState(() {
                                                        if (_counter > 0) {
                                                          _counter--;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  SmallText(
                                                    text: _counter.toString(),color: whiteColor,fontWeight: FontWeight.w600,
                                                  ),
                                                  IconButton(
                                                    icon: Icon(Icons.add, size: 16, color: whiteColor),
                                                    onPressed: () {
                                                      setState(() {
                                                        if (_counter <25) {
                                                          _counter++;
                                                        }
                                                        else  Fluttertoast.showToast(msg:"You Can't add more that");
                                                      }
                                                     );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    )),
                              );
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _addRemoveCartButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 50,
            child: InkWell(
                onTap: () => setState(() {
                      _cartBadgeAmount++;
                      if (color == Colors.blue) {
                        color = Colors.red;
                      }
                    }),
                child: Icon(Icons.add)),
          ),
          Container(
            width: 50,
            child: InkWell(
              onTap: _showCartBadge
                  ? () => setState(() {
                        _cartBadgeAmount--;
                        color = Colors.blue;
                      })
                  : null,
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }

  Widget _shoppingCartBadge() {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 3),
      showBadge: _showCartBadge,
      badgeContent: Text(
        _cartBadgeAmount.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: blackColor,
          ),
          onPressed: () {}),
    );
  }
}
