import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:air/controller/progress_controller.dart';
import 'package:air/utils.dart';
import 'package:air/pages/search.dart';
import 'package:air/widgets/search_widget.dart';
import 'package:flutter/services.dart';

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

  double _testVal = .21;

  final _searchColor = Color(0xFF343434);

  @override
  void initState() {
    _progressController = ProgressController(value: _testVal);
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
      _progressController.playAnimation = true;
      _controller.forward();
    });
    
    super.initState();
  }

  _update() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));

    setState(() {
      _progressController.reset();
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
                "assets/progress.flr",
                controller: _progressController,
                alignment: Alignment.topCenter,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              alignment: Alignment.topCenter,
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage())).whenComplete(() =>_update()),
                child: Hero(
                  tag: "SearchBarTag",
                  child: SearchField(
                    enabled: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}