import 'package:flutter/cupertino.dart';
import 'package:common_codes/modules/foods.dart';

class Restaurant{
  String _imageAsset;
  Image _image;
  String _restaurantName;
  DateTime _dateTime;
  String _restaurantAddress;
  final int _rating;
  final List<Food> _menu;

  Restaurant(this._imageAsset,this._restaurantName,this._restaurantAddress,this._dateTime,this._rating,this._menu);

  String get imageAsset => _imageAsset;

  String get restaurantName => _restaurantName;

  DateTime get dateTime => _dateTime;

  Image get image => _image;

  int get rating => _rating;

  List<Food> get menu => _menu;

  String get restaurantAddress => _restaurantAddress;
}

class Restaurants{

  List<Food> buonoList = [

    Food(imageAsset: 'assets/images/pizza.jpg', name: 'Pizza', price: 11.99),
    Food(imageAsset: 'assets/images/pizza.jpg', name: 'Pizza', price: 11.99),

  ];

  List<Restaurant> _restaurantList = [

    Restaurant('assets/images/Buono.png', 'Buono Restaurant', 'Tehran Province, Tehran, 2nd St, Iran', DateTime.now().subtract(Duration(days: 20)),5,BuonoFood.buonoList),
    Restaurant('assets/images/Khoroos.jpg', 'Khoroos Restaurant', 'Tehran Province, Tehran, District 1, پلاک ۷۴/۳، Andarzgoo Blvd, Iran', DateTime.now().subtract(Duration(days: 10)),4,[]),
    Restaurant('assets/images/Lamiz.png', 'Lamiz Coffee','Tehran, District 3, Mirdamad Blvd, Iran', DateTime.now().subtract(Duration(days: 5)),4,[]),
    Restaurant('assets/images/Nayeb.jpg', 'Nayeb Restaurant', 'Tehran, St ,Vozara Ave, 11th, No. 30, Iran', DateTime.now().subtract(Duration(days: 30)),5,[]),
  ];

  List<Restaurant> get restaurantList => _restaurantList;


  String stopOverflow(String sentence, double size){
    int index = (size / 16).toInt();
    if(sentence.length > size / 16)
      return sentence.substring(0,index) + '...';
    return sentence;
  }

}