import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:air/controller/progress_controller.dart';
import 'package:air/utils.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  ProgressController _progressController;
  Animation _animation;
  Color _progressColor;

  double testVal = .21;

  @override
  void initState() {
    _progressController = ProgressController(updated: _update(), value: testVal);
    _progressColor = Utils.getColor(testVal);

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = ColorTween(
      begin: Colors.blue,
      end: _progressColor,
    ).animate(_controller)
    ..addListener(() {
      setState(() {
        
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _progressController.playAnimation = true;
      _controller.forward();
    });
    
    super.initState();
  }

  _update() => setState((){});

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              margin: EdgeInsets.only(top: 255),
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Opacity(
                    opacity: .5,
                    child: Text(
                      "70",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: _animation.value,
                      ),
                    ),
                  )
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}