import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ChoiceChipController extends GetxController {
  var selectedChips = <int>[].obs; // لتتمكن من اختيار أكثر من عنصر في نفس الوقت

  void selectChip(int index) {
    if (selectedChips.contains(index)) {
      selectedChips.remove(index);
    } else {
      selectedChips.add(index);
    }
  }
}