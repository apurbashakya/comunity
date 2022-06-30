import 'package:comunity/models/detailsDisplay.dart';
import 'package:comunity/providers/placesDb.dart';
import 'package:comunity/screens/place_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import './screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/place_add.dart';
import "package:latlong2/latlong.dart" as latLng;
import 'widgets/location_input.dart';
import 'screens/map_location.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: PlacesDb(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: Login()),
    );
  }
}
