import 'package:flutter/material.dart';
import 'package:customer_app/modules/restaurant_invoice_list.dart';
import 'package:common_codes/screens/decoration.dart';

const buttonColor = const Color(0XFFd83e56);

class FactorScreen extends StatefulWidget {
  static String factorScreenId = '/FactorScreenId';

  @override
  _FactorScreenState createState() => _FactorScreenState();
}

class _FactorScreenState extends State<FactorScreen> {

  RestaurantInvoiceList restaurantInvoiceList = new RestaurantInvoiceList();
  int rowNumber = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text('Row'),
                          ),
                          DataColumn(
                            label: Text('Order\'s name'),
                          ),
                          DataColumn(
                            label: Text('Number'),
                          ),
                          DataColumn(
                            label: Text('Price'),
                          ),
                        ],
                        rows: restaurantInvoiceList.restaurantInvoiceList
                            .map((e) => DataRow(cells: <DataCell>[
                              DataCell(Text((rowNumber++).toString())),
                              DataCell(Text(e.foodName)),
                              DataCell(Text(e.numberOfFood.toString())),
                              DataCell(Text(e.priceOfFood.toString())),
                        ]))
                            .toList()),
                SizedBox(
                  width: size.width,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: size.height / 2,
                    width: size.width ,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Total'),
                          trailing: Text('275000'),
                        ),
                        ListTile(
                          title: Text('Tax'),
                          trailing: Text('0'),
                        ),
                        ListTile(
                          title: Text('Delivering cost'),
                          trailing: Text('0'),
                        ),
                        Card(
                          color: buttonColor,
                          child: ListTile(
                            
                            title: myTextStyle(text: 'Total payment',textColor: Colors.white,),
                            trailing: myTextStyle(textColor: Colors.white,text: '275000',),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

