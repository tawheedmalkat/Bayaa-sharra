// import 'dart:io';
//
// import 'package:ecomm/ScreensForProfile/Profilemycontroller/profilecontroller.dart';
// import 'package:ecomm/widget/tab-Bar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
//
// import '../../Constant/color&fonts.dart';
//
// import '../../Modules/Auth/Sign-Up/sign-up-controller.dart';
// import '../favoritepage.dart';
// import '../myProfile.dart';
// import '../reviewspage.dart';
//
// class Profile extends StatelessWidget {
//   List<String> myprofile = [
//     "My Profile",
//     "Favorite",
//     "My reviews",
//   ];
//
//   final SignUpController controller = Get.put(SignUpController());
//   final ScrollController _scrollController = ScrollController();
//    final MyProfileController controllerProf = Get.put(MyProfileController());
//   @override
//   Widget build(BuildContext context) {
//
//     return GetBuilder<MyProfileController>(
//       builder: (controllerProf) => Scaffold(
//         appBar: AppBar(
//           elevation: 1.0,
//           shadowColor: Colors.white,
//           backgroundColor: Colors.white,
//           title: Text(
//             "Profile ".tr,
//             style: TextStyle(color: Colori.DarkBlue, fontSize: 20),
//           ),
//          leading:   IconButton(
//            onPressed: () {},
//            icon: Icon(
//              Icons.edit_note_outlined,
//              color: Colori.DarkBlue,
//              size: 35,
//            ),
//          ),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 20.0),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 80,
//                     height: 100,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                       border: Border.all(
//                         color: Colori.GreyLight,
//                         width: 5.0,
//                       ),
//                     ),
//                     child: InkWell(
//                       onTap: () async {
//                         File? imageFile = await controller.pickImage();
//                         if (imageFile != null) {}
//                       },
//                       child: CircleAvatar(
//                         backgroundColor: Colors.blueGrey.withOpacity(0.1),
//                         radius: 50,
//                         backgroundImage: controller.imagefile != null
//                             ? FileImage(controller.imagefile!)
//                             : null,
//                         child: controller.imagefile == null
//                             ? Icon(
//                           Icons.person,
//                           size: 50,
//                           color: Colori.DarkBlue,
//                         )
//                             : null,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Text(
//                     "User name",
//                     style: TextStyle(
//                       color: Colori.DarkBlue,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               width: double.infinity,
//               height: MediaQuery.of(context).size.height * 0.1,
//               child: ListView.builder(
//                 controller: _scrollController,
//                 shrinkWrap: true,
//                 physics: BouncingScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (BuildContext context, int index) {
//                   return InkWell(
//                     onTap: () {
//                       controllerProf.chagemrprofindex(index);
//
//                     },
//                     child:  Container(
//                         width: 150,
//                         height: 20,
//                         margin: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           color: controllerProf.myprofindex == index
//                               ? Colori.DarkBlue
//                               : Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.1),
//                               spreadRadius: 2,
//                               blurRadius: 7,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Center(
//                           child: Text(
//                             myprofile[index],
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: controllerProf.myprofindex == index
//                                   ? Colori.White
//                                   : Colors.black,
//                               fontWeight: controllerProf.myprofindex == index
//                                   ? FontWeight.bold
//                                   : FontWeight.normal,
//                               fontSize:
//                               controllerProf.myprofindex == index ? 18 : 15,
//                             ),
//                           ),
//                         ),
//                       ),
//
//                   );
//                 },
//                 itemCount: myprofile.length,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: PageView(
//                 controller: controllerProf.pageControllere,
//                 onPageChanged: (index) {
//                   controllerProf.chagemrprofindex(index);
//                 },
//                 children: [
//                   MyProfilePage(),
//                   FavoritePage(),
//                   MyReviewsPage(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
class Profile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
