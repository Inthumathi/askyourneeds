import 'package:askun_delivery_app/UI%20Screen/homepage/homepage.dart';
import 'package:askun_delivery_app/UI%20Screen/mycart/mycart.dart';
import 'package:askun_delivery_app/UI%20Screen/orderHistory/orderhistory.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final String refreshTokenBottom;
  final String accessTokenBottom;
  const BottomNavigation({required this.refreshTokenBottom,required this.accessTokenBottom,super.key});

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
      HomeScreen(refreshToken: widget.refreshTokenBottom,accessToken: widget.accessTokenBottom),
      Text('sadf'),
      const CartScreen(),
      const OrderHistoryScreen(),
      HomeScreen(refreshToken: widget.refreshTokenBottom,accessToken: widget.accessTokenBottom,),
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