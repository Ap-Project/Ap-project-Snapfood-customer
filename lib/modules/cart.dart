import 'package:customer_app/modules/restaurant.dart';
import 'restaurant_food_details.dart';

class Cart{
  static List<Restaurant> restaurants = [];

}

class CartAddingFood{
  static List<RestaurantFoodDetails> cartAddingFood = List.empty(growable: true);

  static void addNumber(int index){
    cartAddingFood[index].numberOfFood++;
  }

  static void changePrice(int index){
    cartAddingFood[index].priceOfFood++;
  }



}