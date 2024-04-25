import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constant/color&fonts.dart';
import '../Modules/NavBar/nav-screen.dart';

class DayladFuture extends StatelessWidget {
  const DayladFuture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 15)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            width: 150,
            child: LinearProgressIndicator(
              backgroundColor: Colori.DarkBlue,
              valueColor: AlwaysStoppedAnimation<Color>(Colori.White),
              minHeight: 2,
            ),
          );
        } else {
          Future(() => Get.to(NavBar()));
          return SizedBox();
        }
      },
    );
  }
}
