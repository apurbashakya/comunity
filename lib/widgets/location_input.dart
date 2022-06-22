//Managing location
//preview of map and button to select in marker in app
//we point the imageloaction rather than image itself
import 'dart:ffi';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import '../helpers/locationHelper.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  late String _locationUrl = 'https://picsum.photos/250?image=9';
  Future getLocationInput() async {
    final locationInfo = await Location()
        .getLocation(); //asks for current location initally user permisisons
    final StaticImageUrl = LocationHelper.imageGenerated(
         locationInfo.latitude, locationInfo.longitude);
    setState(() {
      _locationUrl = StaticImageUrl;
    });
  } //selcting current location

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        TextButton.icon(
            onPressed: getLocationInput,
            icon: Icon(Icons.location_on_rounded),
            label: Text(" Current Location")),
        Container(
          height: 180,
          width: double.infinity,
          child: _locationUrl == Null
              ? Text('add location')
              : Image.network(_locationUrl,
                  width: double.infinity,
                  fit: BoxFit.cover), //to occupy full length
        )
      ],
    ));
  }
}
