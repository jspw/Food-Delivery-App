import 'dart:ui';

import '../Screens/cart.dart';
import '../Widgets/navigate_back.dart';
import 'package:flutter/material.dart';

final globalKey = GlobalKey<ScaffoldState>();

class Restaurant extends StatefulWidget {
  static const route = "/restaurant";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RestaurantState();
  }
}

class RestaurantState extends State with SingleTickerProviderStateMixin {
  
  bool favourite = false;

  bool offer = true;

  int order = 0;

  bool status = true;

  BoxFit bx = BoxFit.cover;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, int>;

    final int x = routeArgs['x'];

    return Scaffold(
      body: Column(
        // physics: NeverScrollableScrollPhysics(),
        // physics: BouncingScrollPhysics(),
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (bx == BoxFit.cover) {
                          bx = BoxFit.cover;
                        } else
                          bx = BoxFit.cover;
                      });
                    },
                    child: Hero(
                      tag: x,
                      child: Container(
                        height: 180.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/restaurant.jpg"),
                              fit: bx),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(50.0),
                          ),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: status == true ? 0.0 : 2.0,
                            sigmaY: status == true ? 0.0 : 2.0,
                          ),
                          child: new Container(
                            decoration: new BoxDecoration(
                              color: Colors.white.withOpacity(0.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10.0,
                    right: 0.0,
                    child: IconButton(
                        iconSize: 35.0,
                        icon: Icon(
                          Icons.favorite,
                          color: favourite ? Colors.pink : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            bool ck = favourite;
                            favourite = !ck;
                            print(favourite);
                          });
                        }),
                  ),
                  Positioned(
                    // left: 10.0,
                    top: 20.0,
                    child: NavigateBack(),
                  ),
                  Positioned(
                    bottom: 35.0,
                    left: 20.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              color: Colors.black38,
                              child: Text(
                                "Panshi Restaurant",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  Text(
                                    "4.2",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.gps_fixed,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              color: Colors.black87,
                              child: Text(
                                "Zindabazar,Sylhet",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10.0,
                    bottom: 30.0,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.timelapse,
                          size: 30.0,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          color: Colors.black38,
                          child: Text(
                            "30 - 40 min",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Ad | Offer Section and Check Restaurant Open or Closed

              if (offer == true && status == true)
                Container(
                  padding:
                      const EdgeInsets.only(left: 20, top: 10.0, bottom: 20),
                  height: 120.0,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "20% OFF",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 23.0,
                            ),
                          ),
                          Text(
                            "Enjoy 20% Off on Full Menu",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 20.0),
                        height: 60,
                        width: 120.0,
                        child: Image.asset(
                          "assets/images/offer_add.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                )
              else if (status == false)
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 10.0),
                        height: 100,
                        width: 200.0,
                        child: Image.asset(
                          "assets/images/closed.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Until 9.00AM",
                          style: TextStyle(
                            color: Colors.red[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                DefaultTabController(
                  length: 5,
                  child: Scaffold(
                    key: globalKey,
                    appBar: PreferredSize(
                      preferredSize: Size(double.infinity, 50),
                      child: TabBar(
                        isScrollable: true,
                        // indicator: BoxDecoration(

                        //   color: Theme.of(context).accentColor,
                        //   border: Border.all(
                        //     width: 0,
                        //   ),
                        // ),
                        // indicatorPadding: const EdgeInsets.all(20.0),
                        indicatorSize: TabBarIndicatorSize.label,

                        indicatorColor: Theme.of(context).accentColor,

                        unselectedLabelColor: Colors.grey,

                        unselectedLabelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                        labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 1.3),
                        tabs: List.generate(
                          5,
                          (index) {
                            return Container(
                              child: Text("Fast Food $index"),
                            );
                          },
                        ),
                      ),
                    ),
                    body: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(5, (index) {
                          return ListView(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            children: List.generate(10, (index) {
                              return Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Card(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        height: 80,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://i2.wp.com/dinepartner.com/blog/wp-content/uploads/2019/12/fastfood.jpg?fit=750%2C342&ssl=1"),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              "The Smokin' Patty",
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "\$100",
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20.0,
                                                ),
                                                if (order >= 1)
                                                  Container(
                                                    height: 40,
                                                    // width: 120,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                        border: Border.all(
                                                            width: 3.0,
                                                            color: Theme.of(
                                                                    context)
                                                                .accentColor)),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        IconButton(
                                                          icon: Icon(
                                                            Icons.remove,
                                                            color: Colors.red,
                                                            size: 20,
                                                          ),
                                                          onPressed: () =>
                                                              setState(
                                                            () {
                                                              if (order > 0)
                                                                order--;
                                                            },
                                                          ),
                                                        ),
                                                        Text(
                                                          order.toString(),
                                                          style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        IconButton(
                                                          icon: Icon(
                                                            Icons.add,
                                                            size: 20,
                                                            color: Theme.of(
                                                                    context)
                                                                .accentColor,
                                                          ),
                                                          onPressed: () =>
                                                              setState(
                                                            () {
                                                              order++;
                                                            },
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                else
                                                  FlatButton(
                                                    onPressed: () =>
                                                        setState(() {
                                                      if (status)
                                                        order++;
                                                      else {
                                                        final snackBar =
                                                            SnackBar(
                                                              
                                                              backgroundColor: Colors.white,
                                                          content: Text(
                                                              'Sorry Restaurant is Closed!',
                                                              style: TextStyle(
                                                                color: Colors.red,
                                                                fontSize: 20.0
                                                              ),
                                                              textAlign: TextAlign.center,
                                                              ),
                                                        );
                                                        globalKey.currentState
                                                            .showSnackBar(
                                                                snackBar);
                                                      }
                                                    }),
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 45,
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                            .accentColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                      ),
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                        size: 35.0,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          );
                        })),
                  ),
                ),
                if (order >= 1)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "\$200",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            "Checkout & Continue",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white70,
                                ),
                                child: Icon(
                                  Icons.navigate_next,
                                  color: Theme.of(context).accentColor,
                                  size: 40.0,
                                ),
                              ),
                            ),
                            onTap: () =>
                                Navigator.pushNamed(context, Cart.route),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
