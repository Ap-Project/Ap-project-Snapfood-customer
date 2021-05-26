import 'package:customer_app/modules/cart.dart';
import 'package:customer_app/modules/customer_registration.dart';
import 'package:customer_app/modules/registered_customers.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/modules/restaurant.dart';
import 'package:customer_app/screens/restaurant_screen.dart';
import 'package:customer_app/widgets/rating_stars.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Restaurants restaurants = new Restaurants();
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: restaurants.restaurantList.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RestaurantScreen(restaurant: restaurants.restaurantList.elementAt(index),whichRestaurant: index,),
                    ));
                bool flag = true;
                for(int i = 0 ; i < RegisteredCustomersList.registeredList.elementAt(0).cart.length;i++){
                  if(RegisteredCustomersList.registeredList.elementAt(0).cart.elementAt(i).restaurantName == restaurants.restaurantList.elementAt(index).restaurantName) {
                    flag = false;
                    break;
                  }
                }
                if(flag){
                  RegisteredCustomersList.registeredList.elementAt(0).cart.add(restaurants.restaurantList.elementAt(index));
                }
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(width: 1.0, color: Colors.grey[200])),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Hero(
                        tag: restaurants.restaurantList.elementAt(index).imageAsset,
                        child: Image(
                          image: AssetImage(restaurants.restaurantList.elementAt(index).imageAsset),
                          height: 100.0,
                          width: 100.0,
                          fit: BoxFit.cover,
                        ),
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
                          restaurants.restaurantList.elementAt(index).restaurantName,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        RatingStars(rating: restaurants.restaurantList.elementAt(index).rating),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          restaurants.stopOverflow(restaurants.restaurantList.elementAt(index).restaurantAddress, size.width ),
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
          );
        });

  }
}
