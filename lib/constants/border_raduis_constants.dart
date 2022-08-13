import 'package:flutter/material.dart';

class RadiusConstants {
  static RadiusConstants instance = RadiusConstants._init();
  RadiusConstants._init();
  final radiusCircularNormal =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0));
}
