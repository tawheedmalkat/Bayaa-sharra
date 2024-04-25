import 'package:flutter/material.dart';

import '../Constant/color&fonts.dart';

class IconOne extends StatelessWidget {
  final Color color;
  final Color colorIcon;

  IconOne({
    Key? key,
    required this.color,
    required this.colorIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // لون الظل
            spreadRadius: 2, // انتشار الظل
            blurRadius: 5, // زوايا الظل
            offset: Offset(0, 3), // تحديد موقع الظل بالنسبة للعلبة
          ),
        ],
      ),
      child: Icon(
        Icons.arrow_forward_outlined,
        size: 25,
        color: colorIcon,
      ),
    );
  }
}
