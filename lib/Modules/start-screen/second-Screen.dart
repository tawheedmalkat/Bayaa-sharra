import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecomm/Constant/color&fonts.dart';
import 'package:ecomm/Modules/NavBar/nav-screen.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconly/iconly.dart';

import '../../widget/first-Icon.dart';
import '../../widget/image-blur.dart';
class SecondScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        children: [
          ImageFilterBlur(),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2,
                right: MediaQuery.of(context).size.width*0.05,left: 40),
            child:
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.45),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "About app :",
                          textStyle: TextStyle(
                              color: Colori.mainblue,
                              fontFamily: "Anta",
                              fontWeight: FontWeight.bold,
                              fontSize: 24// جعل الخط bold
                          ),
                          speed: Duration(milliseconds: 50),
                        ),
                      ],
                      totalRepeatCount: 1,
                      pause: Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Our application aims"
                    "to facilitate online buying and selling between users."
                    " This application provides a centralized commerce platform "
                    "where individuals and businesses can display their products"
                    " for sale and reach a wider audience of potential buyers.",
                        textStyle: TextStyle(
                            color: Colori.DarkBlue,
                            fontFamily: "Anta",
                            fontWeight: FontWeight.bold,
                            fontSize: 20// جعل الخط bold
                        ),
                        speed: Duration(milliseconds: 50),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                  // Text("Our application aims "
                  //     "to facilitate online buying and selling between users."
                  //     " This application provides a centralized commerce platform "
                  //     "where individuals and businesses can display their products"
                  //     " for sale and reach a wider audience of potential buyers.",style: TextStyle(

                  //
                  // ),),
                  Padding(
                    padding:  EdgeInsets.only(right: 170.0,top: 20),
                    child:  InkWell(
                      onTap: () {

                       Get.back();
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colori.mainblue,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(
                          IconlyBold.arrow_right,
                          size: 30,
                          color: Colori.White,
                        ),
                      ),
                    ),
                  ),
                ],
              )

          ),

        ],
      ),
    );
  }
}
