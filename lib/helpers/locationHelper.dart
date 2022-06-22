import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../helpers/locationHelper.dart';
const apiKey = "GDkyA02ZxfGOkoinxIIAAmZ9Ny7lXIgE";

class LocationHelper {
  static String imageGenerated(double? latitude, double? longitude) {
    print(latitude);
    print(longitude);
    return "https://api.tomtom.com/map/1/staticimage?key=GDkyA02ZxfGOkoinxIIAAmZ9Ny7lXIgE&zoom=9&center=$longitude,$latitude&format=jpg&layer=basic&style=main&width=1305&height=748&view=Unified&language=en-GB";
  } //GENERATING IMAGE USING THE URL where we input our longitude and latitude and api
}
