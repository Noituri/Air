import 'package:flutter/material.dart';
import 'package:air/widgets/search_widget.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF343434),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: "SearchBarTag",
              child: SafeArea(
                child: SearchField(
                  radius: 0,
                  active: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}