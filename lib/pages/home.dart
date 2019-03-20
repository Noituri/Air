import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:air/controller/progress_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  final Shader linearGradient = LinearGradient(colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  ProgressController _progressController;

  @override
  void initState() {
    _progressController = ProgressController(updated: _update(), value: 1);
    WidgetsBinding.instance.addPostFrameCallback((_) => _progressController.playAnimation = true);

    super.initState();
  }

  _update() => setState((){});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Stack(
          fit:StackFit.expand,
          children: <Widget>[
            Container (
              margin: EdgeInsets.only(top: 170),
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Text (
                    "Here's gonna be icon \n also circle must be bigger"
                  ),
                  Text(
                    "70",
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
            Container(
              margin: EdgeInsets.only(top: 50),
              alignment: Alignment.topCenter,
              child: FlareActor(
                "assets/progress.flr",
                controller: _progressController,
                alignment: Alignment.topCenter,
                // animation: "0to100"
              ),
            ),
          ],
        ),
      ),
    );
  }
}