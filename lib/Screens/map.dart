// Custom

import '../Widgets/navigate_back.dart';

// Default

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';

class Map extends StatefulWidget {
  static const route = "/map";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return MapState();
  }
}

class MapState extends State {
  Placemark place;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  var _center;

  _getAddressFromLatLng(_center) async {
    try {
      print(_center);
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _center.latitude, _center.longitude);
      place = p[0];
      setState(() {
        place = place;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState\
    _getAddressFromLatLng(_center);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as List<dynamic>;
    print("In Map : ");
    print(routeArgs);

    setState(() {
      _center = routeArgs[0];
    });

    return Scaffold(
      appBar: AppBar(
        leading: NavigateBack(),
        title: Text("Current Location Info"),
      ),
      body: _center == null
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: <Widget>[
                Container(
                  height: 300.0,
                  child: FlutterMap(
                    options: MapOptions(
                      center: _center,
                      zoom: 2.0,
                    ),
                    children: <Widget>[
                      TileLayerWidget(
                        options: TileLayerOptions(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c'],
                        ),
                      ),
                      MarkerLayerWidget(
                        options: MarkerLayerOptions(
                          markers: [
                            Marker(
                              point: _center,
                              builder: (ctx) => Container(
                                child: Icon(
                                  Icons.location_on,
                                  color: Theme.of(context).accentColor,
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.my_location,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              // addressInName();
                              _getAddressFromLatLng(_center);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                place == null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                onPressed: _getAddressFromLatLng(_center),
                                child: Text("get current address")),
                          ),
                          CircularProgressIndicator(),
                        ],
                      )
                    : Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Country : " + place.country,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "administrativeArea : " +
                                    place.administrativeArea,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "subAdministrativeArea : " +
                                    place.subAdministrativeArea,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "locality : " + place.locality,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "subLocality : " + place.subLocality,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "name : " + place.name,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "isoCountryCode : " + place.isoCountryCode,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "postalCode : " + place.postalCode,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "position : " + place.position.toString(),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "subThoroughfare : " + place.subThoroughfare,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "thoroughfare : " + place.thoroughfare,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      )
              ],
            ),
    );
  }
}
