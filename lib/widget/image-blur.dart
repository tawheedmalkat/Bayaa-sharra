import 'dart:ui';

import 'package:flutter/material.dart';
class ImageFilterBlur extends StatelessWidget {
  const ImageFilterBlur({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/LogoBayaa.png'), // استبدل بمسار صورتك
          fit: BoxFit.scaleDown,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // تحديد شدة المبهمة هنا
        child: Container(
          color: Colors.black.withOpacity(0.1), // لون الخلفية المبهمة
        ),
      ),
    );
  }
}
