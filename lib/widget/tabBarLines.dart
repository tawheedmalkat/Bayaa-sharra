import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../Constant/color&fonts.dart';

class TabBarLine extends StatelessWidget {
  const TabBarLine({
    super.key,
    required ScrollController scrollControllerLine,
    required this.titles,
    required this.currentIndex,

  }) : _scrollControllerLine = scrollControllerLine;

  final ScrollController _scrollControllerLine;
  final List<String> titles;
  final RxInt currentIndex;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollControllerLine,
      scrollDirection: Axis.horizontal,
      itemCount: titles.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            currentIndex.value = index;
          },
          child: Obx(
            () =>
              Text(
                  titles[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: currentIndex.value == index
                        ? Colori.mainblue
                        : Colors.black,
                    fontWeight: currentIndex.value == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: currentIndex.value == index ? 18 : 15,
                  ),
                ),
            ),


        );
      },
    );
  }
}
