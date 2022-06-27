import 'package:comunity/providers/placesDb.dart';
import 'package:flutter/material.dart';
import 'place_add.dart';
import 'package:provider/provider.dart';
import './place_add.dart';
import "package:latlong2/latlong.dart" as latLng;
import 'package:flutter_map/flutter_map.dart';
class PlacesList extends StatelessWidget {
  const PlacesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Scaffold be cause we want to render entire page

    return Scaffold(
        appBar: AppBar(
          title: Text('Directory'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPlace()),
                  );
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: FutureBuilder(
          future:
              Provider.of<PlacesDb>(context, listen: false).fetchAndSetPlaces(),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<PlacesDb>(
                      //child:Center(
                      child: Text('add some'),
                      //),as
                      builder: (ctx, placesDb, ch) => placesDb.items.isEmpty
                          ? ch!
                          : ListView.builder(
                              itemCount: placesDb.items.length,
                              itemBuilder: (ctx, i) => ListTile(
                                leading: CircleAvatar(
                                    backgroundImage: placesDb.items[i].image),
                                title: Text(placesDb.items[i].title),
                                subtitle: Text(placesDb.items[i].review),
                                trailing: Text(placesDb.items[i].review),
                              ),
                            ),
                          
                    ),
        )
      );
  }
}