class RestaurantInvoice{
  String _foodName;
  int _numberOfFood;
  int _priceOfFood;
  RestaurantInvoice(this._foodName,this._numberOfFood,this._priceOfFood);

  int get priceOfFood => _priceOfFood;

  String get foodName => _foodName;

  int get numberOfFood => _numberOfFood;
}

class RestaurantInvoiceList{
  List<RestaurantInvoice> _restaurantInvoiceList = [
    RestaurantInvoice('NewYork Pizza', 2, 190000),
    RestaurantInvoice('Coca Cola', 2, 15000),
    RestaurantInvoice('Espresso', 1, 50000),

  ];

  List<RestaurantInvoice> get restaurantInvoiceList => _restaurantInvoiceList;
}