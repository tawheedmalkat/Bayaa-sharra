import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constant/color&fonts.dart';

// class ChoiceChipController extends GetxController {
//   var selectedChips = <int>[].obs; // لتتمكن من اختيار أكثر من عنصر في نفس الوقت
//
//   void selectChip(int index) {
//     if (selectedChips.contains(index)) {
//       selectedChips.remove(index);
//     } else {
//       selectedChips.add(index);
//     }
//   }
// }

class Add extends StatelessWidget {
  // final ChoiceChipController controller = Get.put(ChoiceChipController());
  //
  // final List<String> tabs = [
  //
  //   "Real estate".tr,
  //   "Vehicles".tr,
  //   "Animals".tr,
  //   "Jobs",
  //   "Electronic and electrical devices".tr,
  //   "Books,hobbies",
  //   "Furniture and furnishings".tr,
  //   " Personal belongings".tr,
  //   " Clothes, fashion ".tr,
  //   "Food and drinks".tr,
  //   "Sports",
  //
  //   "Baby supplies",
  //
  //   "Industrial and professional supplies",
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChoiceChip Example'),
      ),
      // body: SafeArea(
      //   child: Wrap(
      //     spacing:5.0,
      //     children: List<Widget>.generate(
      //       tabs.length,
      //           (int index) {
      //         return Obx(
      //               () => ChoiceChip(
      //                 shadowColor: Colors.white,
      //                 elevation: 5.0,
      //             label: Text(tabs[index]),
      //             selected: controller.selectedChips.contains(index),
      //             onSelected: (bool selected) {
      //               controller.selectChip(index);
      //             },
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(10.0),
      //                   side: BorderSide.none, // تعيين لا شيء لإزالة الحدود
      //                 ),
      //
      //             selectedColor: Colori.DarkBlue,
      //             backgroundColor: Colori.White,
      //                 checkmarkColor: Colors.white,
      //             labelStyle: TextStyle(
      //               color: controller.selectedChips.contains(index) ? Colors.white : Colors.black,
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
