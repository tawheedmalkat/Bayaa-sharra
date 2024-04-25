import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
class ArrowLeft extends StatelessWidget {
  const ArrowLeft({
    super.key,
    required this.currentIndex,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final RxInt currentIndex;
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // تغيير هذه القيمة بناء على احتياجات التصميم الخاصة بك
      left: 20, // تحديد المسافة بين السهم والقائمة
      top: 90,
      bottom: 0,
      child: InkWell(
        onTap: () {
          if (currentIndex.value > 0) {
            currentIndex.value--;
            _scrollController.animateTo(
              currentIndex.value * 116.0,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
    );
  }
}