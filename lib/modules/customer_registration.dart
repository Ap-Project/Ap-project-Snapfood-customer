import 'package:customer_app/modules/restaurant.dart';

class CustomersRegistration{
  String _name;
  String _lastName;
  List<String> _addresses;
  String phoneNumber;
  String password;
  double credit;
  List<Restaurant> cart;


  CustomersRegistration(this._name,this._lastName,this._addresses,this.password,this.phoneNumber,this.credit,this.cart);

  void addAddress(String address){
    _addresses.add(address);
  }


}