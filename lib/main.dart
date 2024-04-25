

import 'package:ecomm/helpers/Local/local-controller.dart';
import 'package:ecomm/helpers/Local/local-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'Constant/color&fonts.dart';
import 'Constant/routes.dart';
import 'Modules/Auth/Sign-In/sign-in-screen.dart';
import 'Modules/Auth/Sign-Up/sign-up-screen.dart';
import 'Modules/start-screen/begining-screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyLocaleController controller = Get.put(MyLocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.downToUp,
      locale: MyLocaleController.isEn ? Locale('en', 'us') : Locale('ar', 'sy'),
      translations: MyLocale(),
      theme: ThemeData.light().copyWith(

        appBarTheme: AppBarTheme(
          backgroundColor: Colori.DarkBlue,
          foregroundColor: Colori.GreyLight,
          centerTitle: true,

        ),
        primaryColor: Colors.red,

      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colori.GreyLight,
          centerTitle: true,

        ),

      ),
      themeMode: MyLocaleController.theme ? ThemeMode.dark : ThemeMode.light,

     initialRoute: AppPage.start,
      getPages: AppPage.routes,
    );
  }
}
