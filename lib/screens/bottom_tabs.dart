import 'package:customer_app/modules/cart.dart';
import 'package:customer_app/modules/restaurant.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'homepage.dart';
import 'orders.dart';

class BottomTabs extends StatefulWidget {
  static String bottomTabsId = '/BottomTabs';
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedIndex = 0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  List<Widget> screenList = [
    CartScreen(),
    HomePage(),
    Orders(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_sharp,
            ),
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_color),
            title: Text('Orders'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
