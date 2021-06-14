import 'package:customer_app/modules/registered_customers.dart';
import 'package:flutter/material.dart';
import 'previous_orders_screen.dart';
import 'active_orders_screen.dart';

class Orders extends StatefulWidget {

  @override
  _OrdersState createState() => _OrdersState();
  
}

class _OrdersState extends State<Orders> with SingleTickerProviderStateMixin{
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Previous orders'),
    Tab(text: 'َActive orders'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food'),
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
        actions: [
          Icon(Icons.wallet_membership_outlined),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 10.0),
            child: Text('${RegisteredCustomersList.registeredList.elementAt(0).credit}'),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PreviousOrders(),
          ActiveOrders(),
        ],
      ),
    );
  }
}
