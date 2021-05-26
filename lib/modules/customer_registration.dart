import 'package:customer_app/modules/restaurant.dart';
import 'package:common_codes/modules/restaurant_food_details.dart';

class CustomersRegistration{
  String _name;
  String _lastName;
  List<String> _addresses;
  String phoneNumber;
  String password;
  double credit;
  List<Restaurant> cart;
  List<RestaurantFoodDetails> cartAddingFood;

  CustomersRegistration(this._name,this._lastName,this._addresses,this.password,this.phoneNumber,this.credit,this.cart,this.cartAddingFood);

  void addAddress(String address){
    _addresses.add(address);
  }



}