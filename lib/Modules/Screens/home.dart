import 'dart:io';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecomm/Modules/Auth/Sign-Up/sign-up-screen.dart';
import 'package:ecomm/widget/tabBarLines.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../Constant/color&fonts.dart';
import '../../helpers/Search/search.dart';
import '../../widget/arrow-left.dart';
import '../../widget/arrow-right.dart';
import '../../widget/drawer-src.dart';
import '../../widget/search-appbar.dart';
import '../../widget/tab-Bar.dart';
import '../Auth/Sign-Up/sign-up-controller.dart';
import '../Categories/productscontroller.dart';

class Home extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());
  final ProductsController productsController = Get.put(ProductsController());
  final RxInt currentIndex = 0.obs;
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollControllerLine = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<String> tabs = [
      "all".tr,
      "car".tr,
      "mobile".tr,
      "cloth".tr,
      "furnit".tr,
      "job".tr,
      "electro".tr,
      "computer".tr,
      "trade".tr,
    ];
    List<IconData> tabIcons = [
      Icons.home,
      Icons.directions_car,
      Icons.phone_android,
      Icons.shopping_bag,
      Icons.chair,
      Icons.work,
      Icons.devices_other,
      Icons.computer,
      Icons.store
    ];

    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.align_horizontal_left_sharp,
                size: 30,
                color: Colori.DarkBlue,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                size: 30,
                Icons.notifications_none,
                color: Colori.DarkBlue,
              ),
            ),
          ),
          SizedBox(width: 95,),
          Image.asset(
            "assets/images/LogoBayaa.png",
            fit: BoxFit.cover,
            width: 60,
            height: 60,
          ),
          Padding(
            padding: EdgeInsets.only(right: 8, top: 10),
            child: Text(
              "Bayaa-Sharra",
              style: TextStyle(
                color: Colori.DarkBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
        leading: SizedBox.shrink(),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: DrawerWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Icon(Icons.shopping_bag, color: Colori.mainblue, size: 40,),
                SizedBox(width: 10,),
                InkWell(
                  onTap: () {
                    showSearch(context: context, delegate: Searching());
                  },
                  child: ContainerSearch(),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 20, bottom: 10),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Welcome with you:',
                  textStyle: TextStyle(
                    color: Colori.DarkBlue,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: Duration(milliseconds: 300),
                ),
              ],
              totalRepeatCount: 1,
              pause: Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.22,
            child: Stack(
              children: [
                TabBarButton(
                  scrollController: _scrollController,
                  tabs: tabs,
                  currentIndex: currentIndex,
                  tabIcons: tabIcons,
                ),
                ArrowRight(
                  currentIndex: currentIndex,
                  tabs: tabs,
                  scrollController: _scrollController,
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(SignUpPage());
                  },
                  child: ListTile(
                    leading: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: NetworkImage(productsController.productsModel[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      productsController.productsModel[index].title,
                      style: TextStyle(
                        color: Colori.DarkBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Row(children: [Text(
                      '\$${productsController.productsModel![index]?.price.toString() ?? ''}',
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                      SizedBox(width: 5),
                      Text(
                        '\$${productsController.productsModel![index]?.price.toString() ?? ''}',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),],),
                    trailing: SizedBox(
                      width: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: productsController.productsModel.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRatingStars(double rating) {
    int fullStars = rating.floor();
    int halfStars = (rating - fullStars > 0.5) ? 1 : 0;
    List<Widget> starIcons = [];
    for (int i = 0; i < fullStars; i++) {
      starIcons.add(Icon(Icons.star, color: Colors.amber));
    }
    if (halfStars == 1) {
      starIcons.add(Icon(Icons.star_half, color: Colors.amber));
    }
    while (starIcons.length < 5) {
      starIcons.add(Icon(Icons.star_border, color: Colors.amber));
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: starIcons,
    );
  }
}
