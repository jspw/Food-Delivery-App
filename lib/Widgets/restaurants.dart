import 'package:flutter/material.dart';
import '../Screens/restaurant.dart';
import 'starts.dart';

int x = 0;

class Restaurants extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return RestaurantsState();
  }
}

class RestaurantsState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return ListBody(
      children: <Widget>[
        ListView.builder(
            controller: ScrollController(),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10.0,bottom: 10.0),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Restaurant.route,
                      arguments: {"x": x}),
                      
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey[200],
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              // topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0)),
                          child: Hero(
                            tag: x++,
                            child: Image(
                              image: AssetImage("assets/images/restaurant.jpg"),
                              height: 110.0,
                              width: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Panchi Restaurant",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                RatingStars(5),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "Zinda Bazar",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "0.2 miles away",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
