import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:air/controller/progress_controller.dart';
import 'package:air/utils.dart';
import 'package:air/pages/search.dart';
import 'package:air/widgets/search_widget.dart';
import 'package:flutter/services.dart';
import 'package:air/widgets/progressbar_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  List<ProgressController> _progressControllers;
  ScrollController _scrollController = new ScrollController();

  Animation _animation;
  Color _progressColor;

  double _testVal = .21;

  @override
  void initState() {
    _progressControllers = [];

    for (var i = 0; i < 7; i++) {
      _progressControllers.add(ProgressController(value: i / 6));
    }
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
    _scrollController.animateTo(
      0.0,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
    );
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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
            Expanded(
              child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        alignment: Alignment.topCenter,
                        child: FlareActor(
                          "assets/progresscircle.flr",
                          controller: _progressControllers[0],
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      Container (
                        margin: EdgeInsets.only(top: 210),
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
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "New York",
                      style: TextStyle(
                        color: _animation.value,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 8.0, top: 8.0),
                          child: Text(
                            "PM25",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        GradientProgressBar(
                          _progressControllers[1],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.0, top: 8.0),
                          child: Text(
                            "PM10",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        GradientProgressBar(
                          _progressControllers[2],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.0, top: 8.0),
                          child: Text(
                            "SO\u2082",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        GradientProgressBar(
                          _progressControllers[3],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.0, top: 8.0),
                          child: Text(
                            "CO",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        GradientProgressBar(
                          _progressControllers[4],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.0, top: 8.0),
                           child: Text(
                            "NO\u2082",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        GradientProgressBar(
                          _progressControllers[5],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.0, top: 8.0),
                           child: Text(
                            "O\u2083",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        GradientProgressBar(
                          _progressControllers[6],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}