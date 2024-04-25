import 'package:ecomm/Modules/Categories/productsscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constant/color&fonts.dart';
 // قم بتعديل هذا الاستيراد إلى المسار الصحيح

class MainCategories extends StatelessWidget {
  // List of icons
  final List<IconData> icons = [
    Icons.category,
    Icons.shopping_bag,
    Icons.phone_android,
    Icons.local_hospital,
    Icons.local_pizza,
    Icons.directions_car,
    Icons.fastfood,
    Icons.laptop,
    Icons.movie,
    Icons.sports_soccer,
    Icons.book,
    Icons.music_note,
  ];

  // List of texts
  final List<String> texts = [
    "Electronics",
    "Fashion",
    "Health",
    "Food",
    "Tech",
    "Automotive",
    "Restaurants",
    "Computers",
    "Entertainment",
    "Sports",
    "Books",
    "Music",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        iconTheme: IconThemeData(color: Colori.DarkBlue),
        title: Text(
          "Categories".tr,
          style: TextStyle(
            color: Colori.GreyLight,
            fontWeight: FontWeight.bold,
            fontFamily: "Anta",
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = constraints.maxWidth > 600 ? 6 : 3;
          final iconSize = constraints.maxWidth > 600 ? 60.0 : 40.0;
          final borderRadius = constraints.maxWidth > 600 ? 20.0 : 10.0;
          final textStyle = TextStyle(color: Colori.DarkBlue);

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 1.0,
            ),
            itemCount: icons.length,
            itemBuilder: (context, index) {
              return GridTile(
                child: GestureDetector(
                  onTap: () {
                    // Navigate to another page
                    Get.to(Categoryee());
                  },
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(icons[index], size: iconSize, color: Colori.mainblue),
                            SizedBox(height: 8),
                            Text(texts[index], style: textStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
