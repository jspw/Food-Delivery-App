import 'package:flutter/material.dart';

class NavigateBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: Icon(
            Icons.navigate_before,
            color: Theme.of(context).accentColor,
            size: 40.0,
          ),
        ),
      ),
      onTap: () => Navigator.pop(context),
    );
  }
}
