import 'package:common_codes/modules/restaurant_food_details.dart';

class RestaurantInvoiceList{
  List<RestaurantFoodDetails> _restaurantInvoiceList = [
    RestaurantFoodDetails('NewYork Pizza', 2, 190000),
    RestaurantFoodDetails('Coca Cola', 2, 15000),
    RestaurantFoodDetails('Espresso', 1, 50000),

  ];

  List<RestaurantFoodDetails> get restaurantInvoiceList => _restaurantInvoiceList;
}