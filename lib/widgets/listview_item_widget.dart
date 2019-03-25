import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin:EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            child: Text(
              "US",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            "New York",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          subtitle: Text(
            "Times Square",
            style: TextStyle(
              color: Colors.white,
            )
          ),
        ),
      ),
    );
  }
}