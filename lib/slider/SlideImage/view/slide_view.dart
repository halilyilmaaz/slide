import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide/slider/Options/image_options.dart';
import 'package:slide/slider/Options/slider_images_options.dart';
import 'package:slide/slider/SlideImage/controller/slide_controller.dart';


class SliderImageView extends StatelessWidget {
  const SliderImageView({Key? key, this.sliderImagesOptions, this.imageOptions})
      : super(key: key);
  final SliderImagesOptions? sliderImagesOptions;
  final ImageOptions? imageOptions;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SliderImageController());
    return Scaffold(
      key: controller.scaffoldKey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height:
                MediaQuery.of(context).size.height * imageOptions!.imageHeight!,
            width:
                MediaQuery.of(context).size.width * imageOptions!.imageWidth!,
            child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (int _index) {
                  controller.imagePositionIndex = _index;
                },
                itemCount:
                    imageOptions!.images.length, //controller.images.length,
                pageSnapping: true,
                itemBuilder: (context, pagePosition) {
                  return Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Image.network(imageOptions!.images[pagePosition]),
                  );
                }),
          ),
          Obx(() => indicators(context, 1, controller.imagePositionIndex))
        ],
      ),
    );
  }

  Widget indicators(BuildContext context, imagesLength, currentIndex) {
    return Container(
      height: sliderImagesOptions!.barHeight,
      width: MediaQuery.of(context).size.width * sliderImagesOptions!.barWidth!,
      decoration: BoxDecoration(
          color: sliderImagesOptions!.barColor,
          borderRadius: BorderRadius.circular(sliderImagesOptions!.radius!)),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          AnimatedSlide(
              child: imageOptions!.images.length != 0
                  ? Container(
                      height: sliderImagesOptions!.barHeight! - (5.75),
                      width: MediaQuery.of(context).size.width *
                          (sliderImagesOptions!.barWidth! - 0.023) /
                          imageOptions!.images.length.toDouble(),
                      decoration: BoxDecoration(
                          color: sliderImagesOptions!.indicatorColor,
                          borderRadius: BorderRadius.circular(sliderImagesOptions!.radius!)),
                    )
                  : SizedBox(),
              curve: Curves.fastOutSlowIn,
              offset: Offset(currentIndex.toDouble(), 0),
              duration: Duration(milliseconds: 550))
        ],
      ),
    );
  }
}
