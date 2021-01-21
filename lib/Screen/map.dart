import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class EitaDekho extends StatefulWidget {
  final String latitude;
  final String longitude;

  const EitaDekho({
    Key key,
    this.latitude,
    this.longitude,
  }) : super(key: key);

  @override
  _EitaDekhoState createState() => _EitaDekhoState();
}

class _EitaDekhoState extends State<EitaDekho> {
  @override
  Widget build(BuildContext context) {
    var lat = double.parse(widget.latitude);
    assert(lat is double);
    var long = double.parse(widget.longitude);
    assert(long is double);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Location"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: new FlutterMap(
        options: new MapOptions(
          center: new LatLng(lat, long),
          zoom: 18.0,
        ),
        layers: [
          new TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          new MarkerLayerOptions(
            markers: [
              new Marker(
                width: 80.0,
                height: 80.0,
                point: new LatLng(lat, long),
                builder: (ctx) => new Container(
                  child: new Icon(
                    Icons.location_on_sharp,
                    color: Colors.deepOrangeAccent,
                    size: 50,
                  ),
                ),
              ),
              new Marker(
                width: 80.0,
                height: 80.0,
                point: new LatLng(23.626416952056175, 90.50342454021438),
                builder: (ctx) => new Container(
                  child: new Icon(
                    Icons.delivery_dining,
                    color: Colors.deepOrangeAccent,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
