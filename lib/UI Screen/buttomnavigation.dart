import 'package:askun_delivery_app/UI%20Screen/homepage/homepage.dart';
import 'package:askun_delivery_app/UI%20Screen/mycart/mycart.dart';
import 'package:askun_delivery_app/UI%20Screen/orderHistory/orderhistory.dart';
import 'package:askun_delivery_app/UI%20Screen/profile/profileScreen.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation(
      { super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  late List<Widget> widgetOptions;
  // final List<Widget> _pages = [
  //    HomeScreen(), // Replace with your HomeScreen implementation
  //   Text('sadf'), // Replace with your FavoritesScreen implementation
  //   const CartScreen(), // Replace with your ProfileScreen implementation
  //   const OrderHistoryScreen(), // Replace with your fourth screen implementation
  // ];
  @override
  void initState() {
    super.initState();
    // Initialize widgetOptions here after the widget is fully initialized.
    widgetOptions = [
      HomeScreen(),
      const ProfileScreen(),
      const CartScreen(),
      const OrderHistoryScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: primaryColor,
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: secondPrimaryColor,
          backgroundColor: Theme.of(context)
              .primaryColor, // Replace with your desired background color
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: MyStrings.home.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: MyStrings.profile.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart_outlined),
              label: MyStrings.cart.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.history),
              label: MyStrings.orderHistory.tr(),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
