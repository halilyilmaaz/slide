import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide/slider/Options/image_options.dart';
import 'package:slide/slider/Options/slider_images_options.dart';
import 'package:slide/slider/SlideImage/controller/slide_controller.dart';
import 'package:slide/slider/SlideImage/view/slide_view.dart';

class SliderWithImage extends StatelessWidget {
  const SliderWithImage({Key? key, this.sliderImagesOptions, this.imageOptions})
      : super(key: key);
  final SliderImagesOptions? sliderImagesOptions;
  final ImageOptions? imageOptions;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SliderImageController(),
      builder: (_) {
        return SliderImageView(
            imageOptions: imageOptions,
            sliderImagesOptions: sliderImagesOptions);
      },
    );
  }
}
