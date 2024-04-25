import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileController extends GetxController with SingleGetTickerProviderMixin {
  late int myprofindex;
  late PageController pageControllere;
  late AnimationController animationController;


  @override
  void onInit() {
    super.onInit();
    myprofindex = 0;
    pageControllere = PageController(initialPage: myprofindex);
    animationController = AnimationController(
      vsync: this, // Use `this` since NavBarController now extends SingleGetTickerProviderMixin
      duration: Duration(milliseconds: 200), // Set the duration as needed
    );

  }

  void chagemrprofindex(int index) {
    myprofindex = index;
    pageControllere.jumpToPage(index);
    // pageControllere.animateToPage(index,
    //     duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    update();
  }

  @override
  void dispose() {
    pageControllere.dispose();
    animationController.dispose();
    super.dispose();
  }
}
