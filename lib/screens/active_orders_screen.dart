import 'package:flutter/material.dart';
import 'package:customer_app/modules/restaurant.dart';
import 'package:customer_app/screens/factor_screen.dart';
import 'package:common_codes/screens/decoration.dart';
import 'package:common_codes/screens/square_image_design.dart';
import 'package:common_codes/screens/date_and_time_row.dart';
import 'package:common_codes/screens/address_and_location_icon_row.dart';
import 'package:common_codes/screens/expanding_row_container.dart';

const buttonColor = const Color(0XFFd83e56);

class ActiveOrders extends StatefulWidget {
  @override
  _ActiveOrdersState createState() => _ActiveOrdersState();
}

class _ActiveOrdersState extends State<ActiveOrders> {
  DateTime _dateTime = DateTime.now();
  Restaurants ordersList = new Restaurants();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: ordersList.restaurantList.length,
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
                            ordersList.restaurantList.elementAt(index).imageAsset),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                  ordersList.restaurantList
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
                                    ordersList.restaurantList
                                        .elementAt(index)
                                        .dateTime,
                                    ordersList.restaurantList
                                        .elementAt(index)
                                        .dateTime),
                                SizedBox(
                                  height: 10.0,
                                ),
                                AddressAndLocation(ordersList.stopOverflow(
                                    ordersList.restaurantList
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
                  ExpandingRowStyleContainer('Total',275000),
                  ExpandingRowStyleContainer('Tracking code',2647859026),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(
                            context, FactorScreen.factorScreenId);
                      });
                    },
                    child: Text('View invoice'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                              (states) => buttonColor),
                    ),
                  ),
                ],
              ),
            ),
            decoration: myDecoration.myBoxDecoration(),
          ),
        );
      },
    );
  }
}
