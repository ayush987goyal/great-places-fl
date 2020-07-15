import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:great_places_app/providers/great_places.dart';
import 'package:great_places_app/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final places = context.watch<GreatPlaces>().items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: places.length <= 0
          ? Center(
              child: Text('Got no places yet, start adding some!'),
            )
          : ListView.builder(
              itemCount: places.length,
              itemBuilder: (ctx, i) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(places[i].image),
                ),
                title: Text(places[i].title),
                onTap: () {},
              ),
            ),
    );
  }
}
