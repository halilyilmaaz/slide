import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SliderWidgetController extends GetxController {
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  late PageController pageController;
  late Rx<int> _imagePositionIndex;
  
  //static BuildContext context;

  SliderWidgetController() {
    pageController = PageController();
    _imagePositionIndex = 0.obs;
    
  }

  //double size = MediaQuery.of(scaffoldKey.currentContext!).size.width;

  bool isImage = false;

  int activePage = 0;
  int get imagePositionIndex => _imagePositionIndex.value;

  set imagePositionIndex(int value) {
    _imagePositionIndex.value = value;
  }

  List<Widget> widgets = [
    InkWell(
        onTap: () {
          print("tapped");
        },
        child: Placeholder()),
    Placeholder(),
    Placeholder(),
  ];
}
