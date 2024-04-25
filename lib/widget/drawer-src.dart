import 'dart:io';

import 'package:ecomm/Modules/Auth/Log%20Out/logout%20controller.dart';
import 'package:ecomm/Modules/start-screen/second-Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../Constant/color&fonts.dart';
import '../Modules/Auth/Sign-Up/sign-up-controller.dart';
import '../helpers/Local/local-controller.dart';

class DrawerWidget extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());
  final MyLocaleController controllers = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyLocaleController>(builder: (controllers) {
      Color drawerBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
      return Drawer(
        backgroundColor: drawerBackgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(width: 80,
                        height: 100,
                  decoration: BoxDecoration(
                        shape: BoxShape.circle, // جعل الـ Container دائريًا
                        color: Colors.white, // لون خلفية الصورة
                        border: Border.all(
                            color: Colori.mainblue,
                            width: 5.0), // إضافة الحدود
                      ),
                  child: CircleAvatar(
                        backgroundColor: Colors.blueGrey.withOpacity(0.1),
                        radius: 30,
                    child:  Icon(
                          IconlyBold.profile,
                          color: Colori.DarkBlue,
                          size: 40,
                        ),
                        ),
                        // Container(
                        //   width: 80,
                        //   // تحديد عرض الـ Container بحسب الحجم المطلوب لـ CircleAvatar
                        //   height: 100,
                        //   // تحديد ارتفاع الـ Container بحسب الحجم المطلوب لـ CircleAvatar
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle, // جعل الـ Container دائريًا
                        //     color: Colors.white, // لون خلفية الصورة
                        //     border: Border.all(
                        //         color: Colori.mainblue,
                        //         width: 5.0), // إضافة الحدود
                        //   ),
                        //   child: CircleAvatar(
                        //     backgroundColor: Colors.blueGrey.withOpacity(0.1),
                        //     radius: 50, // نصف قطر الـ CircleAvatar
                        //     backgroundImage: controller.imagefile != null
                        //         ? FileImage(controller.imagefile!)
                        //         : null,
                        //     child: controller.imagefile == null
                        //         ? Icon(
                        //             Icons.person,
                        //             size: 60,
                        //             color: Colori.DarkBlue,
                        //           )
                        //         : null,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 50.0, left: 30),
                        //   child: IconButton(
                        //     onPressed: () async {
                        //       File? imageFile = await controller.pickImage();
                        //       if (imageFile != null) {
                        //         // عرض الصورة المحددة للمستخدم (اختياري)
                        //       }
                        //     },
                        //     icon: Icon(
                        //       IconlyBold.camera,
                        //       color: Colors.blueGrey,
                        //       size: 40,
                        //     ),
                        //   ),
                        // ),
                        ) ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'User name'.tr,
                          style: TextStyle(
                              color: Colori.mainblue,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Anta"),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(MyLocaleController.theme
                              ? Icons.nightlight_outlined
                              : Icons.sunny),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colori.White,
              ),
            ),
            ListTile(
              title: Text(
                'Privacy policy',
                style: TextStyle(color: Colors.black, fontFamily: "Anta"),
              ),
              leading: Icon(
                Icons.privacy_tip_rounded,
                color: Colori.DarkBlue,
              ),
              // الايقونة تكون على اليسار من النص
              onTap: () {
                // Update UI based on Drawer Item 1
              },
            ),
            ListTile(
              title: Text(
                'FQAs'.tr,
                style: TextStyle(color: Colors.black, fontFamily: "Anta"),
              ),
              leading: Icon(
                IconlyBold.activity,
                color: Colori.DarkBlue,
              ),
              // الايقونة تكون على اليسار من النص
              onTap: () {
                // Update UI based on Drawer Item 1
              },
            ),
            ListTile(
              title: Text(
                'About us'.tr,
                style: TextStyle(color: Colors.black, fontFamily: "Anta"),
              ),
              leading: Icon(
                IconlyBold.info_circle,
                color: Colori.DarkBlue,
              ),
              // الايقونة تكون على اليسار من النص
              onTap: () {
                Get.to(SecondScreen());
              },
            ),

            ListTile(
              title: Text(
                'Support'.tr,
                style: TextStyle(color: Colors.black, fontFamily: "Anta"),
              ),
              leading: Icon(
                IconlyBold.call,
                color: Colori.DarkBlue,
              ),
              // الايقونة تكون على اليسار من النص
              onTap: () {
                // Update UI based on Drawer Item 1
              },
            ),
            // حالة الزر (on أو off)
            SwitchListTile(
              value: MyLocaleController.theme,
              onChanged: (v) {
                controllers.changeTheme();
              },
              activeColor: Colors.red,
              title: Text(MyLocaleController.theme ? 'Dark'.tr : 'Light'.tr),
              subtitle: Text('Theme'.tr),
              secondary: Icon(MyLocaleController.theme
                  ? Icons.nightlight_outlined
                  : Icons.sunny),
            ),
            SwitchListTile(
              value: MyLocaleController.isEn,
              onChanged: (v) {
                controllers.changeLanguage();
              },
              activeColor: Colors.red,
              title: Text('English'.tr),
              subtitle: Text('Language'.tr),
              secondary: Icon(Icons.translate),
            ),
            ListTile(
              title: Text(
                'Log Out'.tr,
                style: TextStyle(color: Colors.black, fontFamily: "Anta"),
              ),
              leading: Icon(
                IconlyBold.call,
                color: Colori.DarkBlue,
              ),
              onTap: () async {
                final LogoutController controllerLogout = Get.find<LogoutController>(); // استخدم Get.find للحصول على المثيل القائم مسبقًا لـ LogoutController
                await controllerLogout.logout(); // اتصل بوظيفة تسجيل الخروج من controllerLogout بدلاً من إنشاء مثيل جديد
                // Update UI based on Drawer Item 1
              },
            ),

          ],
        ),
      );
    });
  }
}
