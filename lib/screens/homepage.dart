import 'package:customer_app/modules/registered_customers.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/screens/home.dart';
import 'package:customer_app/widgets/PopularRestaurantWidget.dart';
import 'package:customer_app/widgets/SearchWidget.dart';
import 'package:customer_app/widgets/TopMenus.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Homepage",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(Icons.wallet_membership_outlined),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 10.0),
            child: Text('${RegisteredCustomersList.registeredList.elementAt(0).credit}'),
          ),
        ],
        //brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            SearchWidget(),
            TopMenus(),
            PopularRestaurantsWidget(),
            Home(),
            //NearestRestaurantWidget(),
          ],
        ),
      ),
      //bottomNavigationBar: BottomNavBarWidget(),
    );
  }}

