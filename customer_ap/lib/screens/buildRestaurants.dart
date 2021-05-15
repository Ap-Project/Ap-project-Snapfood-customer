import 'package:flutter/material.dart';
import 'package:flutter_app/data/data.dart';
import 'package:flutter_app/models/restaurant.dart';
import 'package:flutter_app/screens/restaurant_screen.dart';
import 'package:flutter_app/widgets/rating_stars.dart';
class buildRestaurant extends StatefulWidget {
  @override
  _buildRestaurantState createState() => _buildRestaurantState();
}

class _buildRestaurantState extends State<buildRestaurant> {
  @override
  Widget build(BuildContext context) {
    return _buildRestuarants(context);
  }
}

Widget _buildRestuarants(BuildContext context) {
  List<Widget> restuarantList = [];
  restaurants.forEach((Restaurant restaurant) {
    restuarantList.add(GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RestuarantScreen(restaurant: restaurant),
          )),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(width: 1.0, color: Colors.grey[200])),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Hero(
                tag: restaurant.imageUrl,
                child: Image(
                  image: AssetImage(restaurant.imageUrl),
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    restaurant.name,
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  RatingStars(rating: restaurant.rating),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    restaurant.address,
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "0.2 miles away",
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  });
  return Column(
    children: restuarantList,
  );
}