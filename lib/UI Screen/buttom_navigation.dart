import 'package:askun_delivery_app/UI%20Screen/homepage/homepage.dart';
import 'package:askun_delivery_app/UI%20Screen/mycart/mycart.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(), // Replace with your HomeScreen implementation
    Text('sadf'), // Replace with your FavoritesScreen implementation
    CartScreen(), // Replace with your ProfileScreen implementation
    Text("dfjks"), // Replace with your fourth screen implementation
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
            canvasColor: primaryColor,
          ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Theme.of(context).primaryColor, // Replace with your desired background color
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Order History',
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