import 'package:flutter/material.dart';

class Utils {
  static getColor(value) {
    if (value >= 1) {
      return Colors.red;
    } else if (value >= .80) {
      return Colors.orange;
    } else if (value >= .50) {
      return Colors.yellow;
    } else if (value >= .30) {
      return Colors.lightGreen;
    } else {
      return Colors.blue;
    }
  }
}