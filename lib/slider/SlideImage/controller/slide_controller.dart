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



}
