import 'package:askun_delivery_app/UI%20Screen/searchpage/serachpage.dart';
import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../utilites/constant.dart';
import 'demo.dart';
import 'homepage/homepage.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';


class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  final widgetOptions = [
    HomeScreen(),
    DemoPage(),
    serachPage(),
    DemoPage(),
    HomeScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: DiamondBottomNavigation(
          itemIcons: const [
            Icons.home,
            Icons.shopping_cart_rounded,
            Icons.favorite,
            Icons.person,
          ],
          centerIcon: Icons.search_rounded,
          selectedIndex: selectedIndex,
          onItemPressed: onItemTapped,
          unselectedColor: primaryColor,
          selectedColor: blackColor,
          selectedLightColor: primaryColor,
          height: 50,
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   unselectedItemColor:Colors.black,
      //   showUnselectedLabels: true,
      //   backgroundColor: Colors.pinkAccent,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home_outlined), title: Text('Home',)),
      //     BottomNavigationBarItem(icon:  Icon(Icons.search), title: Text('Search')),
      //     BottomNavigationBarItem(icon: Icon(Icons.pause_circle_outline), title: Text('Courses')),
      //     BottomNavigationBarItem(icon: Icon(Icons.assignment_turned_in_outlined),title  : Text('Wishlist')),
      //     BottomNavigationBarItem(icon: Icon(Icons.rate_review_outlined), title: Text('Testimonial')),
      //     BottomNavigationBarItem(icon: Icon(Icons.account_circle),title: Text('Account')),
      //   ],
      //   currentIndex: selectedIndex,
      //   fixedColor:primaryColor,
      //   onTap: onItemTapped,
      // ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}