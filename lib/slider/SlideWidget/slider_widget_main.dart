import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide/slider/Options/slider_widgets_options.dart';
import 'package:slide/slider/Options/widget_options.dart';
import 'package:slide/slider/SlideWidget/controller/slider_widget_controller.dart';
import 'package:slide/slider/SlideWidget/view/slider_widget_view.dart';


class SliderWithWidget extends StatelessWidget {
  const SliderWithWidget({Key? key, this.sliderWidgetOptions, this.widgetOptions}) : super(key: key);
  final SliderWidgetOptions? sliderWidgetOptions;
  final WidgetOptions? widgetOptions;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SliderWidgetController(),
      builder: (_) {
        return SliderWidgetView(
          widgetOptions: widgetOptions,
          sliderWidgetOptions: sliderWidgetOptions,
        );
      },
    );
  }
}
