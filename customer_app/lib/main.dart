
import 'package:flutter/material.dart';
import 'Screens/addresses.dart';
import 'Screens/preview_order.dart';
import 'Screens/fav_restaurants.dart';
import 'Screens/cart.dart';

import 'Screens/home_screen.dart';
import 'Screens/profile.dart';
import 'Screens/restaurant.dart';
import 'Screens/map.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: Colors.white,
          primaryColor: Colors.white,
          accentColor: Colors.green
          // canvasColor: Colors.lightGreen,
          ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        Profile.route: (context) => Profile(),
        Restaurant.route: (context) => Restaurant(),
        Cart.route: (context) => Cart(),
        Addresses.route: (context) => Addresses(),
        PreviewOrder.route: (context) => PreviewOrder(),
        FavRestaurants.route: (context) => FavRestaurants(),
        Map.route : (context) => Map(),
      },
    ),
  );
}
