import 'package:flutter/cupertino.dart';

class Orders{
  Image _image;
  String _restaurantName;
  DateTime _dateTime;
  String _restaurantAddress;
  Orders(this._image,this._restaurantName,this._restaurantAddress,this._dateTime);

  String get restaurantName => _restaurantName;

  DateTime get dateTime => _dateTime;

  Image get image => _image;

  String get restaurantAddress => _restaurantAddress;
}

class OrdersList{

  List<Orders> _ordersList = [
    Orders(Image.asset('assets/images/Buono.png'), 'Buono Restaurant', 'Tehran Province, Tehran, 2nd St, Iran', DateTime.now().subtract(Duration(days: 20))),
    Orders(Image.asset('assets/images/Khoroos.jpg'), 'Khoroos Restaurant', 'Tehran Province, Tehran, District 1, پلاک ۷۴/۳، Andarzgoo Blvd, Iran', DateTime.now().subtract(Duration(days: 10))),
    Orders(Image.asset('assets/images/Lamiz.png'), 'Lamiz Coffee','Tehran, District 3, Mirdamad Blvd, Iran', DateTime.now().subtract(Duration(days: 5))),
    Orders(Image.asset('assets/images/Nayeb.jpg'), 'Nayeb Restaurant', 'Tehran, St ,Vozara Ave, 11th, No. 30, Iran', DateTime.now().subtract(Duration(days: 30))),
  ];

  List<Orders> get ordersList => _ordersList;

  String stopOverflow(String sentence, double size){
    int index = (size / 16).toInt();
    if(sentence.length > size / 16)
      return sentence.substring(0,index) + '...';
    return sentence;
  }

}