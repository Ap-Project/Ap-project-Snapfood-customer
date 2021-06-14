import 'package:customer_app/modules/customer_registration.dart';
import 'package:customer_app/modules/registered_customers.dart';
import 'package:customer_app/modules/restaurant.dart';
import 'package:customer_app/screens/profile_screen.dart';
import 'package:customer_app/screens/restaurant_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common_codes/screens/decoration.dart';
import 'package:common_codes/screens/square_image_design.dart';
import 'package:common_codes/screens/date_and_time_row.dart';
import 'package:common_codes/screens/address_and_location_icon_row.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const buttonColor = const Color(0XFFd83e56);

class CartScreen extends StatefulWidget {
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
        actions: [
          Icon(Icons.wallet_membership_outlined),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
            child: Text(
                '${RegisteredCustomersList.registeredList.elementAt(0).credit}'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount:
            RegisteredCustomersList.registeredList.elementAt(0).cart.length,
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
                          SquareDesignImageContainer(RegisteredCustomersList
                              .registeredList
                              .elementAt(0)
                              .cart
                              .elementAt(index)
                              .imageAsset),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    RegisteredCustomersList.registeredList
                                        .elementAt(0)
                                        .cart
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
                                      RegisteredCustomersList.registeredList
                                          .elementAt(0)
                                          .cart
                                          .elementAt(index)
                                          .dateTime,
                                      RegisteredCustomersList.registeredList
                                          .elementAt(0)
                                          .cart
                                          .elementAt(index)
                                          .dateTime),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  AddressAndLocation(ordersList.stopOverflow(
                                      RegisteredCustomersList.registeredList
                                          .elementAt(0)
                                          .cart
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
                        itemCount: RegisteredCustomersList.registeredList
                            .elementAt(0)
                            .cart
                            .elementAt(RestaurantScreen.saveRestaurant)
                            .cartAddingFood
                            .length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text(RegisteredCustomersList.registeredList
                                .elementAt(0)
                                .cart
                                .elementAt(RestaurantScreen.saveRestaurant)
                                .cartAddingFood
                                .elementAt(index)
                                .foodName),
                            title: Text(
                                '(${RegisteredCustomersList.registeredList.elementAt(0).cart.elementAt(RestaurantScreen.saveRestaurant).cartAddingFood.elementAt(index).numberOfFood})'),
                            trailing: Text(
                                '${RegisteredCustomersList.registeredList.elementAt(0).cart.elementAt(RestaurantScreen.saveRestaurant).cartAddingFood.elementAt(index).priceOfFood}'),
                          );
                        }),
                    ListTile(
                      title: Text("total",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing:  Text(
                          '(${RegisteredCustomersList.registeredList.elementAt(0).cart.elementAt(RestaurantScreen.saveRestaurant).total()})',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if(RegisteredCustomersList.registeredList.elementAt(0).credit < RegisteredCustomersList.registeredList.elementAt(0).cart.elementAt(RestaurantScreen.saveRestaurant).total()){
                                    Alert(
                                      context: context,
                                      title: 'Couldn\'t purchase',
                                      type: AlertType.info,
                                      desc: "You don\'t have enough credit",
                                      style: myDecoration.myAlertStyle(),
                                      buttons: [
                                        DialogButton(
                                            color: buttonColor,
                                            child: Text(
                                              'Increase credit',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                              ),
                                            ),
                                            onPressed: () => Navigator.pushNamed(context, ProfilePage.profileId)),
                                      ],
                                    ).show();
                                  }
                                  else{
                                    RegisteredCustomersList.registeredList.elementAt(0).credit -= RegisteredCustomersList.registeredList.elementAt(0).cart.elementAt(RestaurantScreen.saveRestaurant).total();
                                  }

                                });

                              },
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
                                  RegisteredCustomersList.registeredList
                                      .elementAt(0)
                                      .cart
                                      .remove(RegisteredCustomersList
                                          .registeredList
                                          .elementAt(0)
                                          .cart
                                          .elementAt(index));
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
