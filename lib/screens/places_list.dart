import 'package:flutter/material.dart';
import 'package:places/providers/great_places.dart';
import 'package:places/screens/add_place.dart';
import 'package:places/screens/place_detail.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AddPlaceScreen.routeName,
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: Text('Got no places yet, start adding some!'),
                ),
                builder: (ctx, greatplaces, ch) => greatplaces.items.length <= 0
                    ? ch
                    : ListView.builder(
                        itemCount: greatplaces.items.length,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              greatplaces.items[i].image,
                            ),
                          ),
                          title: Text(greatplaces.items[i].title),
                          subtitle: Text(greatplaces.items[i].location.address),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                PlaceDetailScreen.routeName,
                                arguments: greatplaces.items[i].id);
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}
