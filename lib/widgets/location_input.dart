//Managing location
//preview of map and button to select in marker in app
//we point the imageloaction rather than image itself
import 'dart:ffi';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import '../helpers/locationHelper.dart';
import 'package:comunity/screens/map_location.dart';
import 'package:comunity/screens/login.dart';
import 'package:comunity/helpers/getAddress.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  late String _locationUrl =
      "https://cdn.barbdelollis.com/wp-content/uploads/plain-black-screen-hdblackwallpaper_6159.jpg";
  Future getLocationInput() async {
    final locationInfo = await Location().getLocation();
    //asks for current location initally user permisisons
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
        Row(
          children: [
            TextButton.icon(
                onPressed: getLocationInput,
                icon: Icon(Icons.location_on_rounded),
                label: Text(" Current Location")),
          ],
        ),
        Row(
          children: [
            TextButton.icon(
                onPressed: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapLocation()));
                },
                icon: Icon(Icons.maps_home_work),
                label: Text("Select location on map")),
          ],
        ),
        Container(
          height: 180,
          width: double.infinity,
          child: _locationUrl == Null
              ? Text('add location')
              : Image.network(
                  _locationUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ), //to occupy full length
        ),
      ],
    ));
  }
}
