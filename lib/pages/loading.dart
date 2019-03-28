import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final String testurl = "https://api.waqi.info/feed/krakow/?token=5662b13f69c61aae2df6a69a00732fffd218d10c";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: http.get(testurl),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return HomePage();
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}