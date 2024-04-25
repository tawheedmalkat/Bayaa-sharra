//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:ecomm/Modules/Categories/productsmodel.dart';
// import 'package:ecomm/Modules/NavBar/nav-controller.dart';
//
// import 'package:ecomm/Modules/Screens/add.dart';
// import 'package:ecomm/Modules/Screens/favoitre.dart';
// import 'package:ecomm/Modules/Screens/home.dart';
//
// import 'package:ecomm/Modules/Screens/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconly/iconly.dart';
//
// import '../Categories/productsscreen.dart';
// class NavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Get.put(NavBarController());
//     return GetBuilder<NavBarController>(
//       builder: (controller) => Scaffold(
//         body: IndexedStack(
//           index: controller.tabindex,
//           children: [
//             Home(),
//             Categoryee(),
//             Notify(),
//             Favorite(),
//             Add(),
//           ],
//         ),
//         bottomNavigationBar: CurvedNavigationBar(
//           backgroundColor: Colors.transparent,
//           color: Color(0xFF662d91),
//           buttonBackgroundColor: Colors.white,
//           height: 70,
//           animationDuration: Duration(milliseconds: 200),
//           index: controller.tabindex,
//           onTap: controller.chagetabindex,
//           items: [
//             Icon(IconlyBold.home, size: 30, color: controller.tabindex == 0 ? Color(0xFF662d91) : Colors.grey),
//             Icon(IconlyBold.category, size: 30, color: controller.tabindex == 1 ? Color(0xFF662d91) : Colors.grey),
//             Icon(IconlyBold.plus, size: 30, color: controller.tabindex == 2 ? Color(0xFF662d91) : Colors.grey),
//             Icon(IconlyBold.notification, size: 30, color: controller.tabindex == 3 ? Color(0xFF662d91) : Colors.grey),
//             Icon(IconlyBold.profile, size: 30, color: controller.tabindex == 4 ? Color(0xFF662d91) : Colors.grey),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecomm/Modules/Categories/MainGategory/maingateg.dart';
import 'package:ecomm/Modules/NavBar/nav-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../Constant/color&fonts.dart';
import '../../ScreensForProfile/Profilemycontroller/profile.dart';
import '../Categories/productsscreen.dart';
import '../Screens/add.dart';
import '../Screens/favoitre.dart';
import '../Screens/home.dart';


class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(NavBarController());
    return GetBuilder<NavBarController>(
      builder: (controller) => Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              children: [
                _buildPage(Home()),
                _buildPage(MainCategories()),
                _buildPage(Favorite()),
                _buildPage(Add()),
                _buildPage(Profile()),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CurvedNavigationBar(
                backgroundColor: Colors.transparent,
                // خلفية شفافة
                color: Colori.DarkBlue,
                buttonBackgroundColor: Colori.White,
                height: 70,
                animationDuration: Duration(milliseconds: 200),
                index: controller.tabindex,
                onTap: controller.chagetabindex,
                items: [
                  _buildNavigationItem(
                    controller: controller,
                    icon: IconlyBold.home,
                    isSelected: controller.tabindex == 0,
                    label: 'Home'.tr,
                  ),
                  _buildNavigationItem(
                    controller: controller,
                    icon: IconlyBold.category,
                    isSelected: controller.tabindex == 1,
                    label: 'Category'.tr,
                  ),
                  _buildNavigationItem(
                    controller: controller,
                    icon: IconlyBold.plus,
                    isSelected: controller.tabindex == 2,
                    label: 'Add'.tr,
                  ),
                  _buildNavigationItem(
                    controller: controller,
                    icon: Icons.favorite,
                    isSelected: controller.tabindex == 3,
                    label: 'Favorite'.tr,
                  ),
                  _buildNavigationItem(
                    controller: controller,
                    icon: IconlyBold.profile,
                    isSelected: controller.tabindex == 4,
                    label: 'Profile'.tr,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(Widget page) {
    return Container(
      color: Colors.transparent, // خلفية شفافة لكل شاشة
      child: page,
    );
  }

  Widget _buildNavigationItem({
    required NavBarController controller,
    required IconData icon,
    required bool isSelected,
    required String label,
  }) {
    return ScaleTransition(
      scale: isSelected
          ? Tween<double>(begin: 0.8, end: 1.0).animate(
              CurvedAnimation(
                parent: controller.animationController!,
                curve: Curves.slowMiddle,
              ),
            )
          : AlwaysStoppedAnimation<double>(1.0),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: isSelected
            ? Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: 35, // تعيين حجم أكبر للأيقونة المحددة
                    width: 35, // تعيين حجم أكبر للأيقونة المحددة
                    child: Icon(
                      icon,
                      size: 30,
                      color: Colori.mainblue,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    label,
                    style: TextStyle(
                      color: Colori.mainblue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : Icon(
                icon,
                size: 30,
                color: Colors.blueGrey.shade100,
              ),
      ),
    );
  }
}
