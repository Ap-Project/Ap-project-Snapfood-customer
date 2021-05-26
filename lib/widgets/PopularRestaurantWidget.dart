import 'package:flutter/material.dart';
import 'package:customer_app/animation/ScaleRoute.dart';
import 'package:customer_app/pages/food_details_page.dart';

class PopularRestaurantsWidget extends StatefulWidget {
  @override
  _PopularRestaurantsWidgetState createState() => _PopularRestaurantsWidgetState();
}

class _PopularRestaurantsWidgetState extends State<PopularRestaurantsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          PopularRestaurantTitle(),
          Expanded(
            child: PopularRestaurantItems(),
          )
        ],
      ),
    );
  }
}

class PopularRestaurantTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String rating;
  String numberOfRating;
  //String price;
  String slug;

  PopularRestaurantTiles(
      {Key key,
        @required this.name,
        @required this.imageUrl,
        @required this.rating,
        @required this.numberOfRating,
        // @required this.price,
        @required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Navigator.push(context, ScaleRoute(page: FoodDetailsPage()));
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(boxShadow: [
              /* BoxShadow(
                color: Color(0xFFfae3e2),
                blurRadius: 15.0,
                offset: Offset(0, 0.75),
              ),*/
            ]),
            child: Card(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: Container(
                  width: 170,
                  height: 210,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              alignment: Alignment.topRight,
                              width: double.infinity,
                              padding: EdgeInsets.only(right: 5, top: 5),
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white70,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFfae3e2),
                                        blurRadius: 25.0,
                                        offset: Offset(0.0, 0.75),
                                      ),
                                    ]),
                                child: Icon(
                                  Icons.favorite,
                                  color: Color(0xFFfb3132),
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Center(
                                child: Image.asset(
                                  'assets/images/popular_foods/' +
                                      imageUrl +
                                      ".png",
                                  width: 130,
                                  height: 140,
                                )),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 5, top: 5),
                            child: Text(name,
                                style: TextStyle(
                                    color: Color(0xFF6e6e71),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.only(right: 5),
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white70,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFfae3e2),
                                      blurRadius: 25.0,
                                      offset: Offset(0.0, 0.75),
                                    ),
                                  ]),
                              child: Icon(
                                Icons.near_me,
                                color: Color(0xFFfb3132),
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(left: 5, top: 5),
                                child: Text(rating,
                                    style: TextStyle(
                                        color: Color(0xFF6e6e71),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 3, left: 5),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0xFFfb3132),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0xFFfb3132),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0xFFfb3132),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0xFFfb3132),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0xFF9b9b9c),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(left: 5, top: 5),
                                child: Text("($numberOfRating)",
                                    style: TextStyle(
                                        color: Color(0xFF6e6e71),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 5, top: 5, right: 5),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class PopularRestaurantTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Popular Restaurants",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFF3a3a3b),
                fontWeight: FontWeight.bold),
          ),
          Text(
            "See all",
            style: TextStyle(
                fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w100),
          )
        ],
      ),
    );
  }
}

class PopularRestaurantItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        PopularRestaurantTiles(
            name: "Restaurant1",
            imageUrl: "ic_popular_food_1",
            rating: '4.9',
            numberOfRating: '200',
            slug: "fried_egg"),
        PopularRestaurantTiles(
            name: "Restaurant2",
            imageUrl: "ic_popular_food_3",
            rating: "4.8",
            numberOfRating: "100",
            slug: ""),
        PopularRestaurantTiles(
            name: "Restaurant3",
            imageUrl: "ic_popular_food_4",
            rating: "4.0",
            numberOfRating: "50",
            slug: ""),
        PopularRestaurantTiles(
            name: "Restaurant3",
            imageUrl: "ic_popular_food_5",
            rating: "4.00",
            numberOfRating: "100",
            slug: ""),
      ],
    );
  }
}