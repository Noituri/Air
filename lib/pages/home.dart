import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:air/controller/progress_controller.dart';
import 'package:air/utils.dart';
import 'package:air/pages/search.dart';
import 'package:air/widgets/search_widget.dart';
import 'package:flutter/services.dart';
import 'package:air/widgets/progressbar_widget.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  List<ProgressController> _progressControllers;

  Animation _animation;
  Color _progressColor;

  double _testVal = .21;

  @override
  void initState() {
    _progressControllers = [
      ProgressController(value: _testVal),
      ProgressController(value: 0.2),
      ProgressController(value: 0.4),
      ProgressController(value: 0.6),
      ProgressController(value: 1.0),
      ];

    _progressColor = Utils.getColor(_testVal);

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
      _progressControllers.forEach((item) {
        item.playAnimation = true;
      });

      _controller.forward();
    });
    
    super.initState();
  }

  _update() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));

    // FIXME: Also it should reset value number animation
    setState(() {
      _progressControllers.forEach((item) {
        item.reset();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: separate this
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container (
              margin: EdgeInsets.only(top: 305),
              alignment: Alignment.topCenter,
              child: Opacity(
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
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              alignment: Alignment.topCenter,
              child: FlareActor(
                "assets/progresscircle.flr",
                controller: _progressControllers[0],
                alignment: Alignment.topCenter,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              alignment: Alignment.topCenter,
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage())).whenComplete(() => _update()),
                child: Hero(
                  tag: "SearchBarTag",
                  child: SearchField(
                    enabled: false,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 450, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "New York",
                    style: TextStyle(
                      color: _animation.value,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GradientProgressBar(
                    _progressControllers[1],
                  ),
                  GradientProgressBar(
                    _progressControllers[2],
                  ),
                  GradientProgressBar(
                    _progressControllers[3],
                  ),
                  GradientProgressBar(
                    _progressControllers[4],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}