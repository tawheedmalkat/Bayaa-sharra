import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../Constant/color&fonts.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(

              itemBuilder: (BuildContext context, int index) {

                switch (index) {
                  case 0:
                    return ListTile(

                      title: Text("Your Location"),
                      trailing: IconButton(
                        icon: Icon(IconlyBold.arrow_right,color: Colori.DarkBlue,),
                        onPressed: (){
                          // Handle onPressed for Location
                        },
                      ),
                      leading: Icon(IconlyBold.location,color: Colori.mainblue,),
                    );
                  case 1:
                    return ListTile(
                      title: Text("Password"),
                      trailing: IconButton(
                        icon: Icon(IconlyBold.arrow_right,color: Colori.DarkBlue,),
                        onPressed: (){
                          // Handle onPressed for Password
                        },
                      ),
                      leading: Icon(IconlyBold.password,color: Colori.mainblue,),
                    );
                  case 2:
                    return ListTile(
                      title: Text("Products"),
                      trailing: IconButton(
                        icon: Icon(IconlyBold.arrow_right,color: Colori.DarkBlue,),
                        onPressed: (){
                          // Handle onPressed for Products
                        },
                      ),
                      leading: Icon(IconlyBold.activity,color: Colori.mainblue,),
                    );
                  case 3:
                    return ListTile(
                      title: Text("Your ads"),
                      trailing: IconButton(
                        icon: Icon(IconlyBold.arrow_right,color: Colori.DarkBlue,),
                        onPressed: (){
                          // Handle onPressed for Ads
                        },
                      ),
                      leading: Icon(Icons.wallet_giftcard,color: Colori.mainblue,),
                    );
                  case 4:
                    return ListTile(
                      title: Text("Email"),
                      trailing: IconButton(
                        icon: Icon(IconlyBold.arrow_right,color: Colori.DarkBlue,),
                        onPressed: (){
                          // Handle onPressed for Ads
                        },
                      ),
                      leading: Icon(IconlyBold.message,color: Colori.mainblue,),
                    );
                  case 5:
                    return ListTile(
                      trailing: IconButton(
                        icon: Icon(IconlyBold.arrow_right,color: Colori.DarkBlue,),
                        onPressed: (){
                          // Handle onPressed for Ads
                        },
                      ),
                title: Text(
                'Updates'.tr,
                style: TextStyle(color: Colors.black, fontFamily: "Anta"),
                ),
                leading: Icon(
                Icons.update,
                color: Colori.mainblue,
                ),

                onTap: () {

                },
                );
                  case 6:
                    return ListTile(
                      trailing: IconButton(
                        icon: Icon(IconlyBold.arrow_right,color: Colori.DarkBlue,),
                        onPressed: (){
                          // Handle onPressed for Ads
                        },
                      ),
                title: Text(
                'Log out'.tr,
                style: TextStyle(color: Colors.black, fontFamily: "Anta"),
                ),
                leading: Icon(
                size: 30,
                Icons.logout,
                color: Colori.mainblue,
                ),
// الايقونة تكون على اليسار من النص
                onTap: () {
// Update UI based on Drawer Item 1
                },
                );
                  default:
                    return SizedBox.shrink();
                }
              },

              itemCount: 7,
            ),
          ),
        ],
      ),
    );
  }
}

