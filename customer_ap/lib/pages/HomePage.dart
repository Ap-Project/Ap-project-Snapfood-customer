import 'package:flutter/material.dart';
import 'package:flutter_app/screens/buildRestaurants.dart';
import 'package:flutter_app/widgets/BottomNavBarWidget.dart';
import 'package:flutter_app/widgets/NearestRestaurantWidget.dart';
import 'package:flutter_app/widgets/PopularRestaurantWidget.dart';
import 'package:flutter_app/widgets/SearchWidget.dart';
import 'package:flutter_app/widgets/TopMenus.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        title: Text(
          "Foods",
          style: TextStyle(
              color: Colors.purple,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        //brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SearchWidget(),
            TopMenus(),
            PopularRestaurantsWidget(),
           buildRestaurant(),
            //NearestRestaurantWidget(),
          ],
        ),
      ),
      //bottomNavigationBar: BottomNavBarWidget(),
    );
  }}

