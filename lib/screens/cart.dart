import 'package:customer_app/modules/cart.dart';
import 'package:customer_app/modules/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:common_codes/screens/decoration.dart';
import 'package:common_codes/screens/square_image_design.dart';
import 'package:common_codes/screens/date_and_time_row.dart';
import 'package:common_codes/screens/address_and_location_icon_row.dart';


const buttonColor = const Color(0XFFd83e56);

class CartScreen extends StatefulWidget {
  final List<Restaurant> addingRestaurant;
  CartScreen({this.addingRestaurant});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Restaurants ordersList = new Restaurants();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: Cart.restaurants.length,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          SquareDesignImageContainer(
                              Cart.restaurants.elementAt(index).imageAsset),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    Cart.restaurants
                                        .elementAt(index)
                                        .restaurantName,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  DateAndTimeRow(
                                      Cart.restaurants
                                          .elementAt(index)
                                          .dateTime,
                                      Cart.restaurants
                                          .elementAt(index)
                                          .dateTime),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  AddressAndLocation(ordersList.stopOverflow(
                                      Cart.restaurants
                                          .elementAt(index)
                                          .restaurantAddress,
                                      size.width)),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: CartAddingFood.cartAddingFood.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text(CartAddingFood.cartAddingFood
                                .elementAt(index)
                                .foodName),
                            title: Text(
                                '(${CartAddingFood.cartAddingFood.elementAt(index).numberOfFood})'),
                            trailing: Text(
                                '${CartAddingFood.cartAddingFood.elementAt(index).priceOfFood}'),
                          );
                        }),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Continue shopping'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => buttonColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Cart.restaurants.remove(
                                      Cart.restaurants.elementAt(index));
                                });
                              },
                              child: Text('Remove Cart'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => buttonColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              decoration: myDecoration.myBoxDecoration(),
            ),
          );
        },
      ),
    );
  }
}
