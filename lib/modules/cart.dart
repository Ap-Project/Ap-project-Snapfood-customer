import 'package:customer_app/modules/restaurant.dart';
import 'package:common_codes/modules/restaurant_food_details.dart';

class CartAddingFood{
  static List<RestaurantFoodDetails> cartAddingFood = List.empty(growable: true);

  static void addNumber(int index){
    cartAddingFood[index].numberOfFood++;
  }

  static void changePrice(int index){
    cartAddingFood[index].priceOfFood *= cartAddingFood[index].numberOfFood;
  }

}