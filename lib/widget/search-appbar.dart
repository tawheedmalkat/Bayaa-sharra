import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constant/color&fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constant/color&fonts.dart';

class ContainerSearch extends StatelessWidget {
  const ContainerSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colori.White,
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5, offset: Offset(0, 3))], // إضافة ظل
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Get.locale == Locale('ar') ? 0.0 : 5.0,
              right: Get.locale == Locale('ar') ? 0.0 : 10.0,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search_outlined,
                  color: Colori.DarkBlue,
                  size: 20,
                ),
                Text(
                  "Search ....".tr,
                  style: TextStyle(color: Colori.DarkBlue, fontSize: 12),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
