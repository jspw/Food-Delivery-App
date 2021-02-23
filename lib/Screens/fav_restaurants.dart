import '../Widgets/navigate_back.dart';
import '../Widgets/restaurants.dart';
import 'package:flutter/material.dart';

class FavRestaurants extends StatelessWidget {
  static const route = "favourite-restaurants";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        leading: NavigateBack(),
        title: Text("Favourite Restaurants"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Choose Restaurant : ",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
          Restaurants(),
        ],
      ),
    );
  }
}
