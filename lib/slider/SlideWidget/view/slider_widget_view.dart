import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide/slider/Options/widget_options.dart';
import 'package:slide/slider/SlideWidget/controller/slider_widget_controller.dart';

import '../../Options/slider_widgets_options.dart';

class SliderWidgetView extends StatelessWidget {
  const SliderWidgetView({
    Key? key,
    this.sliderWidgetOptions,
    this.widgetOptions,
  }) : super(key: key);
  final SliderWidgetOptions? sliderWidgetOptions;
  final WidgetOptions? widgetOptions;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SliderWidgetController());
    return Scaffold(
      key: controller.scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height *
                  widgetOptions!.widgetHeight!,
              width: MediaQuery.of(context).size.width *
                  widgetOptions!.widgetWidth!,
              child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (int _index) {
                    controller.imagePositionIndex = _index;
                  },
                  itemCount: widgetOptions!.widgets.length,
                  pageSnapping: true,
                  itemBuilder: (context, pagePosition) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: widgetOptions!.widgets[pagePosition],
                    );
                  }),
            ),
            Obx(() => indicators(context, 1, controller.imagePositionIndex))
          ],
        ),
      ),
    );
  }

  Widget indicators(BuildContext context, imagesLength, currentIndex) {
    double width = 0.935;
    return Container(
      height: sliderWidgetOptions!.barHeight,
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
          color: sliderWidgetOptions!.barColor,
          borderRadius: BorderRadius.circular(sliderWidgetOptions!.radius!)),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          AnimatedSlide(
              child: widgetOptions!.widgets.length == 1
                  ? Container(
                      height: sliderWidgetOptions!.barHeight! - (3.75),
                      width: MediaQuery.of(context).size.width *
                          (width - 0.020) /
                          widgetOptions!.widgets.length.toDouble(),
                      decoration: BoxDecoration(
                          color: sliderWidgetOptions!.barColor,
                          borderRadius: BorderRadius.circular(
                              sliderWidgetOptions!.radius!)),
                    )
                  : Container(
                      height: sliderWidgetOptions!.barHeight! - (3.75),
                      width: MediaQuery.of(context).size.width * 0.05,
                      decoration: BoxDecoration(
                          color: sliderWidgetOptions!.indicatorColor,
                          borderRadius: BorderRadius.circular(
                              sliderWidgetOptions!.radius!)),
                    ),
              curve: Curves.fastOutSlowIn,
              offset: Offset(currentIndex.toDouble(), 0),
              duration: Duration(milliseconds: 550))
        ],
      ),
    );
  }
}
