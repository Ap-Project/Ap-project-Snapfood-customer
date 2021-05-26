import 'package:customer_app/modules/cart.dart';
import 'package:customer_app/modules/customer_registration.dart';
import 'package:customer_app/modules/registered_customers.dart';
import 'package:customer_app/modules/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:common_codes/screens/decoration.dart';
import 'package:common_codes/screens/square_image_design.dart';
import 'package:common_codes/screens/date_and_time_row.dart';
import 'package:common_codes/screens/address_and_location_icon_row.dart';


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
      ),
      body: ListView.builder(
        itemCount: RegisteredCustomersList.registeredList.elementAt(0).cart.length,
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
                              RegisteredCustomersList.registeredList.elementAt(0).cart.elementAt(index).imageAsset),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                              RegisteredCustomersList.registeredList.elementAt(0).cart.elementAt(index)
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
                                    RegisteredCustomersList.registeredList.elementAt(0).cart.elementAt(index)
                                          .dateTime,
                                      RegisteredCustomersList.registeredList.elementAt(0).cart.elementAt(index)
                                          .dateTime),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  AddressAndLocation(ordersList.stopOverflow(
                                      RegisteredCustomersList.registeredList.elementAt(0).cart.elementAt(index)
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
                    // ListView.builder(
                    //     physics: NeverScrollableScrollPhysics(),
                    //     shrinkWrap: true,
                    //     itemCount: RegisteredCustomersList.registeredList.elementAt(0).cart.elementAt(index).chosenFood.length,
                    //     itemBuilder: (context, index) {
                    //       return ListTile(
                    //         leading: Text(RegisteredCustomersList.registeredList.elementAt(0).cart.elementAt(index).chosenFood.elementAt(index)
                    //             .name),
                    //         title: Text(
                    //             '(${CartAddingFood.cartAddingFood.elementAt(index).numberOfFood})'),
                    //         trailing: Text(
                    //             '${CartAddingFood.cartAddingFood.elementAt(index).priceOfFood}'),
                    //       );
                    //     }),
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
                                  RegisteredCustomersList.registeredList.elementAt(0).cart.remove(
                                      RegisteredCustomersList.registeredList.elementAt(0).cart.elementAt(index));
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
