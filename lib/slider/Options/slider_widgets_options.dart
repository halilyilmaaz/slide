import 'package:flutter/material.dart';

class SliderWidgetOptions {
  /// [Slide]

  /// for list images [images]
  

  /// we wrote for the parent widget of the [indicator] function
  final Color? barColor;

  /// We wrote this property for in [AnimatedSlide] child [Container]
  final Color? indicatorColor;

  final double? barWidth;

  final double? barHeight;

  final double? radius;

  SliderWidgetOptions(
      {this.radius,
      this.barHeight,
      this.barWidth,
    
      this.barColor,
      this.indicatorColor});
}
