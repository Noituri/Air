import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:air/controller/progress_controller.dart';

class GradientProgressBar extends StatelessWidget {
  final EdgeInsets margin;
  final ProgressController progressController;

  GradientProgressBar(this.progressController, {Key key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 35,
      child: FlareActor(
        "assets/progressbar.flr",
        controller: progressController,
        alignment: Alignment.center,
      ),
    );
  }
}