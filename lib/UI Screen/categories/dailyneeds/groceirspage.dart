import 'package:askun_delivery_app/UI%20Screen/productdiscription/productdescription.dart';
import 'package:askun_delivery_app/UI%20Screen/searchpage/serachpage.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class Category {
  final String title;
  final String image;
  final List<SubCategory> subCat;

  Category({required this.title, required this.subCat, required this.image});
}

class SubCategory {
  final String title;
  final String mRP;
  final String rating;
  SubCategory({required this.title, required this.mRP, required this.rating});
}

class GroceriesPage extends StatefulWidget {
  const GroceriesPage({Key? key}) : super(key: key);

  @override
  State<GroceriesPage> createState() => _GroceriesPageState();
}

class _GroceriesPageState extends State<GroceriesPage> {
  int _selectedCat = 0;
  String selectedCategoryTitle = "";
  int activeButton = 0;
  Set<int> activeButtons = <int>{};
  Map<int, int> countMap = {};

  List<Category> categories = [
    Category(
      title: "Rice and Product",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "krunool Old Rice", mRP: '200', rating: '4.5'),
        SubCategory(title: "KVR Brown Rice", mRP: '1000', rating: '3.5'),
        SubCategory(title: "KVR Rice", mRP: '600', rating: '4.2'),
      ],
    ),
    Category(
      title: "Masala and Spices",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Aachi Mutton Masala", mRP: '', rating: '4.5'),
        SubCategory(title: "MTR Sambar Powder", mRP: '', rating: '4.5'),
        SubCategory(title: "Everest Cumin Powder", mRP: '', rating: '4.5'),
        SubCategory(
            title: "Eastern hyderabadi briyani masala", mRP: '', rating: '4.5'),
        SubCategory(
            title: "Eastern hyderabadi briyani masala", mRP: '', rating: '4.5'),
        SubCategory(
            title: "Eastern hyderabadi briyani masala", mRP: '', rating: '4.5'),
        SubCategory(
            title: "Eastern hyderabadi briyani masala", mRP: '', rating: '4.5'),
        SubCategory(
            title: "Eastern hyderabadi briyani masala", mRP: '', rating: '4.5'),
        SubCategory(
            title: "Eastern hyderabadi briyani masala", mRP: '', rating: '4.5'),
        SubCategory(
            title: "Eastern hyderabadi briyani masala", mRP: '', rating: '4.5'),
      ],
    ),
    Category(
      title: "Flours",
      image: MyStrings.img3,
      subCat: [
        SubCategory(
            title: "Aashirvaad Multigrains Attaa", mRP: '', rating: '4.5'),
        SubCategory(
            title: "Aashirvaad Whole wheat flour", mRP: '', rating: '4.5'),
        SubCategory(title: "Maida flour", mRP: '', rating: '4.5'),
        SubCategory(title: "Wheat bran", mRP: '', rating: '4.5'),
        SubCategory(title: "Bombay rava ", mRP: '', rating: '4.5'),
        SubCategory(title: "Corn flour bran", mRP: '', rating: '4.5'),
        SubCategory(title: "Ragi flour", mRP: '', rating: '4.5'),
        SubCategory(title: "Idili rava", mRP: '', rating: '4.5'),
        SubCategory(title: "Chickpea flour", mRP: '', rating: '4.5'),
        SubCategory(title: "Annupurna Wheat Atta", mRP: '', rating: '4.5'),
        SubCategory(title: "Jonna ravva  ", mRP: '', rating: '4.5'),
      ],
    ),
    Category(
      title: "Body,Skin and Hair",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
      ],
    ),
    Category(
      title: "Choclates and Buscuits",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
      ],
    ),
    Category(
      title: "Health drinks",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
      ],
    ),
    Category(
      title: "olis and Ghee",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
      ],
    ),
    Category(
      title: "Dales and pulses",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
      ],
    ),
    Category(
      title: "Millets",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
      ],
    ),
    Category(
      title: "Salt,Sugar adn Jaggery",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
      ],
    ),
    Category(
      title: "Cooking and Ingredients",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
      ],
    ),
    Category(
      title: "Tea and Coffee",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
      ],
    ),
    Category(
      title: "Snacks and Numpk",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
      ],
    ),
    Category(
      title: "Instant Cook Items",
      image: MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 2.1", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
        SubCategory(title: "Subcategory 2.2", mRP: '', rating: '4.5'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: subCategoriesBgColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SmallText(
              text: 'Groceries',
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
                          selectedCategoryTitle = categories[i].title;
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
                                      ? selectedSubCategoriesBgColor
                                      : null,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      bottomRight: Radius.circular(25)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: _selectedCat == i
                                          ? null
                                          : primaryColor.withOpacity(0.7),
                                      backgroundImage: AssetImage(
                                        categories[i].image,
                                      )),
                                ),
                              ),
                              Text(
                                categories[i].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                        fontWeight: _selectedCat == i
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
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Image(
                            image: AssetImage('assets/dummyimage/banner.png')),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 8, right: 10),
                          child: SingleChildScrollView(
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio:  1 / 2,
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: categories[_selectedCat].subCat.length,
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext ctx, i) {
                                bool isActiveButton = activeButtons.contains(i);
                                int itemCounter = countMap[i] ?? 0;

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: ProductDescription(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8.0,
                                        right: 8,
                                        top: 5,
                                        bottom: 5,
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.star,
                                                  color: starColor,
                                                ),
                                              ),
                                              SmallText(
                                                text: categories[_selectedCat].subCat[i].rating,
                                                size: 14,
                                              ),
                                            ],
                                          ),
                                          Center(
                                            child: Image.asset(
                                              categories[i].image,
                                              width: 100,
                                            ),
                                          ),
                                          heightSpace,
                                          Center(
                                            child: SmallText(
                                              text: categories[_selectedCat].subCat[i].title,
                                              fontWeight: FontWeight.w600,
                                              size: 15,
                                              textAlign: TextAlign.center,
                                              maxline: 1,
                                            ),
                                          ),
                                          heightSpace,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SmallText(
                                                text: '\u{20B9}${categories[_selectedCat].subCat[i].mRP}',
                                                fontWeight: FontWeight.w500,
                                              ),
                                              if (!isActiveButton && itemCounter == 0) // Show add button if not active and count is 0
                                                Center(
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        activeButtons.add(i);
                                                        countMap[i] = 1; // Set initial count to 1
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.add_circle,
                                                      color: addCartColor,
                                                      size: 35,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          heightSpace,
                                          isActiveButton?
                                            Center(child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5.0),
                                                  color: Colors.orange,
                                                ),
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (itemCounter > 1) {
                                                            itemCounter--;
                                                          }
                                                          countMap[i] = itemCounter;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons.remove,
                                                        color: whiteColor,
                                                      ),
                                                    ),
                                                    SmallText(
                                                      text: itemCounter.toString(),
                                                      color: whiteColor,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (itemCounter < 25) {
                                                            itemCounter++;
                                                          } else {
                                                            Fluttertoast.showToast(
                                                              msg: "You can't add more than 25",
                                                            );
                                                          }
                                                          countMap[i] = itemCounter;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons.add,
                                                        color: whiteColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),):const SizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
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
                              text: 'Add to cart',
                              color: whiteColor,
                              fontWeight: FontWeight.w500,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
