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
                      child: Center(
                child: Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: Colors.red[100],
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Image.asset(
                            'lib/addd.png',
                            width: 200,
                            height: 200,
                          ),
 //SizedBo
                          Text(
                            'Empty Directory',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red[900],
                              fontWeight: FontWeight.w500,
                            ), //Textstyle
                          ), //Text
                          //Text
                          //SizedBox
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddPlace()),
                                );
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red)),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  children: const [
                                    Icon(Icons.touch_app),
                                    Text('ADD')
                                  ],
                                ),
                              ),
                            ),
                            // RaisedButton is deprecated and should not be used
                            // Use ElevatedButton instead

                            // child: RaisedButton(
                            //   onPressed: () => null,
                            //   color: Colors.green,
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(4.0),
                            //     child: Row(
                            //       children: const [
                            //         Icon(Icons.touch_app),
                            //         Text('Visit'),
                            //       ],
                            //     ), //Row
                            //   ), //Padding
                            // ), //RaisedButton
                          ) //SizedBox
                        ],
                      ), //Column
                    ), //Padding
                  ), //SizedBox
                ),
              ),
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
                              ),
                            ),
                          
                    ),
        )
      );
  }
}