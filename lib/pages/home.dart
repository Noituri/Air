import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final Shader linearGradient = LinearGradient(colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit:StackFit.expand,
          children: <Widget>[
            Container (
              margin: EdgeInsets.only(top: 120),
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Text (
                    "Here's gonna be icon \n also circle must be bigger"
                  ),
                  Text(
                "0 / (light Color) 100",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient,
                ),
                ),
                ],
              ),
            ),
            FlareActor(
              "assets/progress.flr",
              alignment: Alignment.topCenter,
              animation: "0to100"
            ),
          ],
        ),
      ),
    );
  }
}