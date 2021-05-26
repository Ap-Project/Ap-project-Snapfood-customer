import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/services.dart';

class Map extends StatefulWidget {
  static String MapId = '/Map';


  @override
  State<StatefulWidget> createState() {
    return MapState();
  }
}

class MapState extends State<Map> {
  List<LatLng> tappedPoints = [];

  @override
  Widget build(BuildContext context) {
    var markers = tappedPoints.map((latlng) {
      return Marker(
        width: 80.0,
        height: 80.0,
        point: latlng,
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            size: 30.0,
            color: Colors.red,
          ),
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Address')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                    center: LatLng(35.6892, 51.3890),
                    zoom: 13.0,
                    onLongPress: _handleTap),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                    'https://api.mapbox.com/styles/v1/ghzl/ckoxbhdlq1edb17mh0o9fzh4g/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZ2h6bCIsImEiOiJja294YWVuNHUwZWRtMnVzZm1wYjR5NHluIn0.Yv0Fa8lixUAKEqGTsjzAzw',
                  ),
                  MarkerLayerOptions(markers: markers)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleTap(LatLng latlng) {
    setState(() {
      tappedPoints.add(latlng);
      print(latlng);
    });
  }

}
