import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  
  final void Function() callback;
  final bool enabled;
  final bool active;
  final double radius;
  final _searchColor = Color(0xFF343434);

  SearchField({this.callback, this.enabled: true, this.active: false, this.radius: 30.0});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: TextField(
        enabled: enabled,
        textInputAction: TextInputAction.search,
        autofocus: active,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            borderSide: BorderSide(
              color: _searchColor,
              width: 0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            borderSide: BorderSide(
              color: _searchColor,
              width: 0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            borderSide: BorderSide(
              color: _searchColor,
              width: 0,
            ),
          ),
          filled: true,
          hintStyle: new TextStyle(color: Color(0xFF7A7A7A)),
          hintText: "Search",
          fillColor: _searchColor,
        ),
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
  }
}