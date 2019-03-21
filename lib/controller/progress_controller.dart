import 'dart:math';
import 'dart:ui';

import 'package:flare_flutter/flare.dart';
import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/animation.dart';

typedef void OnUpdated();

class ProgressController extends FlareController {
  final OnUpdated updated;
  double value;

  ProgressController({this.updated, this.value});

  bool playAnimation = false;

  FlutterActorArtboard _artboard;
  FlareAnimationLayer _progressAnimation;

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    if (value > _progressAnimation.duration)
      value = _progressAnimation.duration;

    if (_progressAnimation.time <= value && playAnimation) {
      _progressAnimation.time += easeOut(_progressAnimation.time + elapsed, 0, .02, value) % value;
      _progressAnimation.apply(artboard);        
    }

    return true;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    _artboard = artboard;

    _progressAnimation = FlareAnimationLayer()
      ..animation = _artboard.getAnimation("0to100")
      ..mix = 1.0;
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}

  easeOut(double t, double b, double c, double d) {
    return -c * (t /= d) * (t - 2) + b;
  }
	
}