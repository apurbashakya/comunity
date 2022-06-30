import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as Latlng;
import 'package:location/location.dart';

class MapLocation extends StatelessWidget {
  const MapLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const apiKey = "GDkyA02ZxfGOkoinxIIAAmZ9Ny7lXIgE";

    final tomtomHQ = new Latlng.LatLng(52.376372, 4.908066);
    return MaterialApp(
        home: Scaffold(
      body: Center(
          child: Stack(
        children: <Widget>[
          FlutterMap(
            options: new MapOptions(center: tomtomHQ, zoom: 13.0),
            layers: [
              new TileLayerOptions(
                urlTemplate: "https://api.tomtom.com/map/1/tile/basic/main/"
                    "{z}/{x}/{y}.png?key={apiKey}",
                additionalOptions: {"apiKey": apiKey},
              )
            ],
          )
        ],
      )),
    ));
  }
}
