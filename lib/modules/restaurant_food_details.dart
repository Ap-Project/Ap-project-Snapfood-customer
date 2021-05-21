class RestaurantFoodDetails{
  String _foodName;
  int _numberOfFood;
  double _priceOfFood;
  RestaurantFoodDetails(this._foodName,this._numberOfFood,this._priceOfFood);

  double get priceOfFood => _priceOfFood;

  String get foodName => _foodName;

  int get numberOfFood => _numberOfFood;

  set numberOfFood(int value) {
    _numberOfFood = value;
  }

  set priceOfFood(double value) {
    _priceOfFood = value;
  }
}

