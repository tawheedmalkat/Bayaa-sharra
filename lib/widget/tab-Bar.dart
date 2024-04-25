import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../Constant/color&fonts.dart';
class TabBarButton extends StatelessWidget {
  const TabBarButton({
    super.key,
    required ScrollController scrollController,
    required this.tabs,
    required this.currentIndex,
    required this.tabIcons,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final List<String> tabs;
  final RxInt currentIndex;
  final List<IconData> tabIcons;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: tabs.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            currentIndex.value = index;
          },
          child: Obx(() => Container(
            width: 200,
            height: 100,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: currentIndex.value == index
                  ? Colori.White
                  : Colors.white,
              border: Border.all(
                color: currentIndex.value == index
                    ? Colori.mainblue
                    : Colors.transparent ,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    size: currentIndex.value == index? 40:30,
                    tabIcons[index],
                    color: currentIndex.value == index
                        ? Colori.mainblue
                        : Colori.DarkBlue,
                  ),
                  SizedBox(height: 5),
                  Text(
                    tabs[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: currentIndex.value == index?Colori.mainblue:Colors.black,
                      fontWeight: currentIndex.value == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: currentIndex.value == index ? 18 : 15,
                    ),
                  ),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}