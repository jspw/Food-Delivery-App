import '../Screens/cart.dart';
import 'package:flutter/material.dart';
import '../Widgets/best_seller.dart';
import '../Widgets/restaurants.dart';
import '../Widgets/search_bar.dart';
import '../Widgets/title_location.dart';
import '../Widgets/drawer.dart';
import 'dart:io';
import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:latlong/latlong.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return HomeScreenState();
  }
}

class HomeScreenState extends State {

  static var center;

  bool internet = false;
  TextEditingController _controller;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        print(result);
        setState(() {
          internet = true;
        });
      }
    } on SocketException catch (_) {
      print('not connected');
    }
  }

  checkGpsStatus() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();

    print(_locationData);

    center = LatLng(_locationData.latitude, _locationData.longitude);

    print(center.latitude);

    setState(() {
      center = center;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _controller = TextEditingController();
    checkInternet();
    checkGpsStatus();
  }

  Future<void> getData() async {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: !internet || center == null
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text("Please ensure connection to Internet!"),
                ],
              ),
            )
          : RefreshIndicator(
              color: Theme.of(context).accentColor,
              onRefresh: getData,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    leading: IconButton(
                      icon: Icon(
                        Icons.person,
                        color: Theme.of(context).accentColor,
                      ),
                      onPressed: () => _scaffoldKey.currentState.openDrawer(),
                    ),
                    title: TitleLocation(),
                    centerTitle: true,
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Theme.of(context).accentColor,
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, Cart.route),
                      ),
                    ],
                    expandedHeight: 380.0,
                    flexibleSpace: new FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Container(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 50.0)),
                            SearchBar(_controller),
                            SizedBox(
                              height: 10.0,
                            ),
                            MostFavourite(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                          child: Text(
                            "Nearby Restaurants",
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
                  ),
                ],
              ),
            ),
      drawer: DrawerX(),
    );
  }
}
