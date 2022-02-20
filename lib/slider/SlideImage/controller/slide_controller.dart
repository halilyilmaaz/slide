import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderImageController extends GetxController {
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  late PageController pageController;
  late Rx<int> _imagePositionIndex;

  SliderImageController() {
    pageController = PageController();
    _imagePositionIndex = 0.obs;
  }

  bool isImage = false;

  int activePage = 0;

   int get imagePositionIndex => _imagePositionIndex.value;

  set imagePositionIndex(int value) {
    _imagePositionIndex.value = value;
  }

   List<String> images = [
    "https://static.remove.bg/remove-bg-web/bf16d3e558914c4f5e6b6bc5163ed745ee2977db/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png",
    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
    "https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg",
  ];

}
