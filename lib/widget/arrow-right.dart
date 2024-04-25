import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../Constant/color&fonts.dart';

class ArrowRight extends StatelessWidget {
  const ArrowRight({
    super.key,
    required this.currentIndex,
    required this.tabs,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final RxInt currentIndex;
  final List<String> tabs;
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 90,
      bottom: 0,
      child: InkWell(
        onTap: () {
          if (currentIndex.value < tabs.length - 1) {
            currentIndex.value++;
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
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Icon(Icons.arrow_forward_ios, color: Colori.mainblue),
        ),
      ),
    );
  }
}
