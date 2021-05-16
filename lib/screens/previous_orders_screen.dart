import 'package:customer_app/modules/orders.dart';
import 'package:customer_app/screens/factor_screen.dart';
import 'package:flutter/material.dart';
import 'package:common_codes/screens/decoration.dart';
import 'package:common_codes/screens/square_image_design.dart';
import 'package:common_codes/screens/date_and_time_row.dart';
import 'package:common_codes/screens/address_and_location_icon_row.dart';
import 'package:common_codes/screens/expanding_row_container.dart';

const buttonColor = const Color(0XFFd83e56);

class PreviousOrders extends StatefulWidget {
  @override
  _PreviousOrdersState createState() => _PreviousOrdersState();
}

class _PreviousOrdersState extends State<PreviousOrders> {
  DateTime _dateTime = DateTime.now();
  OrdersList ordersList = new OrdersList();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: ordersList.ordersList.length,
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
                            ordersList.ordersList.elementAt(index).image),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                  ordersList.ordersList
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
                                    ordersList.ordersList
                                        .elementAt(index)
                                        .dateTime,
                                    ordersList.ordersList
                                        .elementAt(index)
                                        .dateTime),
                                SizedBox(
                                  height: 10.0,
                                ),
                                AddressAndLocation(ordersList.stopOverflow(
                                    ordersList.ordersList
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
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Reorder'),
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
    );
  }
}
