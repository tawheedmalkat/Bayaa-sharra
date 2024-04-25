import 'dart:io';

import 'package:ecomm/Modules/Auth/Sign-Up/sign-up-controller.dart';
import 'package:ecomm/Modules/Auth/VerficationCode/enterPIN.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constant/color&fonts.dart';
import '../../../widget/text-field-button.dart';
//
// class SignUpScreen extends StatelessWidget {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//   List<String> countries = ['Syria', 'USA', 'UK'];
//   Map<String, List<String>> cities = {
//     'Syria': ['Damascus', 'Aleppo', 'Homs'],
//     'USA': ['New York', 'Los Angeles', 'Chicago'],
//     'UK': ['London', 'Manchester', 'Birmingham']
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(SignUpController());
//     assert(countries.toSet().length == countries.length,
//         'Duplicate countries found');
//     cities.forEach((country, cityList) {
//       assert(cityList.toSet().length == cityList.length,
//           'Duplicate cities found in $country');
//     });
//     return GetBuilder<SignUpController>(
//       builder: (controller) => Scaffold(
//         body: SingleChildScrollView(
//           child: SafeArea(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   height: 150,
//                   width: 200,
//                   child: Image.asset(
//                     "assets/images/LogoBayaa.png",
//                   ),
//                 ),
//                 Text(
//                   "Create your account",
//                   style: TextStyle(
//                     color: Colori.DarkBlue,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                     fontFamily: "Anta",
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Text(
//                     textAlign: TextAlign.center,
//                     "You cannot know about product details without registering "
//                     "an account in our application.Register Now",
//                     style: TextStyle(color: Colors.blueGrey),
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 Form(
//                   key: _formKey,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Padding(
//                           //   padding: EdgeInsets.symmetric(
//                           //       horizontal:
//                           //       MediaQuery.of(context).size.width * 0.3),
//                           //   child: Stack(
//                           //     children: [
//                           //       CircleAvatar(
//                           //         backgroundColor: Colors.blueGrey.withOpacity(0.1),
//                           //         radius: 70,
//                           //         backgroundImage: controller.imagefile != null ? FileImage(controller.imagefile!) : null,
//                           //         child: controller.imagefile == null
//                           //             ? Icon(
//                           //           Icons.person,
//                           //           size: 80,
//                           //           color: Color( 0xFF1E2E5F),
//                           //         )
//                           //             : null,
//                           //       ),
//                           //       Padding(
//                           //         padding: const EdgeInsets.only(top: 90.0, left: 65),
//                           //         child: IconButton(
//                           //           onPressed: () async {
//                           //             File? imageFile = await controller.pickImage();
//                           //             if (imageFile != null) {
//                           //               // عرض الصورة المحددة للمستخدم (اختياري)
//                           //             }
//                           //           },
//                           //           icon: Icon(
//                           //             Icons.camera_alt,
//                           //             color: Color(0xFF662d91),
//                           //             size: 30,
//                           //           ),
//                           //         ),
//                           //       ),
//                           //     ],
//                           //   ),
//                           //
//                           //
//                           // ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text("First name"),
//                           ),
//                           BuildTextFormField(
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter name';
//                               }
//                               return null;
//                             },
//                             controlleri: controller.firstNameController,
//                             color: Colors.white,
//                             textHint: "Last Name",
//                             isPassword: false,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text("Last name"),
//                           ),
//                           BuildTextFormField(
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter name';
//                               }
//                               return null;
//                             },
//                             controlleri: controller.lastNameController,
//                             color: Colors.white,
//                             textHint: "Last Name",
//                             isPassword: false,
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsets.only(left: 8.0, top: 2, bottom: 2),
//                             child: Text("Phone OR Email"),
//                           ),
//                           SizedBox(height: 10),
//                           BuildTextFormField(
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter an email';
//                               }
//                               if (!emailRegex.hasMatch(value)) {
//                                 return 'Enter a correct email format';
//                               }
//                               return null;
//                             },
//                             controlleri: controller.emailController,
//                             color: Colors.white,
//                             textHint: "user@gmail.com",
//                             isPassword: false,
//                           ),
//
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text("Password"),
//                           ),
//                           SizedBox(height: 10),
//                           BuildTextFormField(
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Enter Password';
//                               } else if (value.length < 8) {
//                                 return 'Please enter password more than 6 letters';
//                               }
//                               return null;
//                             },
//                             controlleri: controller.passwordController,
//                             color: Colors.white,
//                             textHint: "*******",
//                             isPassword: true,
//                           ),
//                           SizedBox(height: 20),
//                           Text("Select Country"),
//                           BuildTextFormField(
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter name';
//                               }
//                               return null;
//                             },
//                             controlleri: controller.countryController,
//                             color: Colors.white,
//                             textHint: "Country",
//                             isPassword: false,
//                           ),
//                           SizedBox(height: 20),
//                           Text("Select City"),
//                           BuildTextFormField(
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter name';
//                               }
//                               return null;
//                             },
//                             controlleri: controller.cityController,
//                             color: Colors.white,
//                             textHint: "City",
//                             isPassword: false,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 GestureDetector(
//                   onTap: () async {
//                     if (_formKey.currentState!.validate()) {
//                       await controller.signupController(context);
//                       Get.to(EnterPIN());
//                     }
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     height: 50,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Sign Up",
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Icon(Icons.login, color: Colors.white),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 40),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: controller.firstNameController,
                  decoration: InputDecoration(labelText: 'First name'),
                ),
                TextField(
                  controller: controller.lastNameController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                ),
                TextField(
                  controller: controller.emailOrMobileController,
                  decoration: InputDecoration(labelText: 'Email or Mobile'),
                ),
                TextField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: controller.obscureText.value,
                ),
                // Other text fields...
                DropdownButtonFormField<String>(
                  value: controller.selectedCountry.value,
                  items: controller.countries
                      .map((country) => DropdownMenuItem(
                    child: Text(country),
                    value: country,
                  ))
                      .toList(),
                  onChanged: (String? value) {
                    controller.selectedCountry.value = value!;
                    controller.fetchCitiesForCountry(value);
                  },
                  decoration: InputDecoration(labelText: 'Country'),
                ),
                DropdownButtonFormField<String>(
                  value: controller.selectedCity.value,
                  items: controller.cities
                      .map((city) => DropdownMenuItem(
                    child: Text(city),
                    value: city,
                  ))
                      .toList(),
                  onChanged: (String? value) {
                    controller.selectedCity.value = value!;
                  },
                  decoration: InputDecoration(labelText: 'City'),
                ),
                ElevatedButton(
                  onPressed: ()async {
                   await controller.signupController(context);
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
