import '../Widgets/navigate_back.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {

  static const route = "/cart";

  TextStyle paymentIteamStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );

  TextStyle paymentDollarStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: NavigateBack(),
        title: Text(
          "Cart View",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        titleSpacing: 1.5,
        centerTitle: true,
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top : 10.0 ,bottom: 10),
                      child: Text(
                        "Orders",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                    Icon(Icons.menu),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "5 Dishes",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: List.generate(
                    4,
                    (index) => Card(
                      child: ListTile(
                        leading: Text("2"),
                        title: Text("The Smokin' Patty"),
                        // subtitle: Text("add some extra sauses"),
                        trailing: Text("\$100"),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0,bottom: 5.0),
                      child: Text(
                        "Delivery Address : ",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.my_location),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Zindabazar,Sylhet"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0,bottom: 5.0),
                      child: Text(
                        "Time to Delivery : ",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      // padding: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.av_timer),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("As soon as possible"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,bottom: 5.0),
                  child: Text(
                    "Add some special requests : ",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: TextField(
                    cursorColor: Theme.of(context).accentColor,
                    decoration: InputDecoration(
                        // fillColor: Colors.yellow,
                        hintText: "Write here"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Text(
                    "Payment Details : ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Item Total :",
                            style: paymentIteamStyle,
                          ),
                          Text(
                            "\$200",
                            style: paymentDollarStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Delivery fee :",
                            style: paymentIteamStyle,
                          ),
                          Text(
                            "\$0",
                            style: paymentDollarStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Taxes & Charges :",
                            style: paymentIteamStyle,
                          ),
                          Text(
                            "\$5",
                            style: paymentDollarStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                              cursorColor: Colors.green,
                              decoration: InputDecoration(
                                  hintText: "Coupon Code",
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                debugPrint("Coupon Applied!");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    color: Theme.of(context).accentColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Apply",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Discount :",
                            style: TextStyle(
                              color: Colors.lightGreen,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            "\$5",
                            style: TextStyle(
                              color: Colors.lightGreen,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 30.0,
                        thickness: 3.0,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "To Pay :",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "\$205",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 50.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Text(
                  "Place Order",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            onTap: () => debugPrint("Order Done!"),
          ),
        ],
      ),
    );
  }
}

// Card(
//   color: Colors.white70,
//   child: Container(
//     height: 200,
//     width: MediaQuery.of(context).size.width,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Icon(
//           Icons.timer,
//           color: Theme.of(context).accentColor,
//           size: 35.0,
//         ),
//         Text("45 Minutes"),
//         Expanded(
//           child: Text(
//             "Panshi Restaurant",
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 30.0,
//             ),
//           ),
//         ),
//         Card(
//           margin: const EdgeInsets.all(10),
//           child: Container(
//             padding: const EdgeInsets.all(20),
//             width: 250,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Image.asset(
//                   "assets/images/map.png",
//                   height: 50,
//                   width: 100,
//                 ),
//                 Expanded(
//                   child: Text(
//                     "Zindabazar,Sylhet asasasasasas",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 18.0,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
//     ),
//   ),
// ),
