// // import 'dart:convert';
// // import 'dart:io';
// //
// // import 'package:ecomm/Modules/Auth/Sign-Up/sign-up-model.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // //
// // // class SignUpController extends GetxController {
// // //   late TextEditingController emailController;
// // //   late TextEditingController passwordController;
// // //   late TextEditingController firstNameController;
// // //   late TextEditingController lastNameController;
// // //   late TextEditingController countryController;
// // //   late TextEditingController cityController;
// // //   late TextEditingController addressController;
// // //
// // //   RxBool isLoading = false.obs;
// // //   RxBool obscureText = true.obs;
// // //   RxString selectedCountry = ''.obs;
// // //   RxString selectedCity = ''.obs;
// // //
// // //   @override
// // //   void onInit() {
// // //     emailController = TextEditingController();
// // //     passwordController = TextEditingController();
// // //     firstNameController = TextEditingController();
// // //     lastNameController = TextEditingController();
// // //     countryController = TextEditingController();
// // //     cityController = TextEditingController();
// // //     addressController = TextEditingController();
// // //     super.onInit();
// // //   }
// // //
// // //   @override
// // //   void onClose() {
// // //     emailController.dispose();
// // //     passwordController.dispose();
// // //     firstNameController.dispose();
// // //     lastNameController.dispose();
// // //     countryController.dispose();
// // //     cityController.dispose();
// // //     addressController.dispose();
// // //     super.onClose();
// // //   }
// // //
// // //   void toggleObscureText() {
// // //     obscureText.toggle();
// // //     update();
// // //   }
// // //
// // //   Future<void> signupController(BuildContext context) async {
// // //     try {
// // //       isLoading(true);
// // //       update();
// // //       String url = "http://127.0.0.1:8000/api/mobile/register";
// // //       final uri = Uri.parse(url);
// // //       Map<String, dynamic> addressData = jsonDecode(addressController.text);
// // //       final response = await http.post(
// // //         uri,
// // //         body: jsonEncode({
// // //           'email': emailController.text,
// // //           'password': passwordController.text,
// // //           'firstName': firstNameController.text,
// // //           'lastName': lastNameController.text,
// // //           'address': {
// // //             'country': selectedCountry.value,
// // //             'city': selectedCity.value,
// // //           },
// // //          // 'address': addressData,
// // //          //  'address': {
// // //          //    'country': countryController.text, // Dynamic country value
// // //          //    'city': cityController.text, // Dynamic city value
// // //          // },
// // //         }),
// // //         headers: {
// // //           'Accept': 'application/vnd.api+json',
// // //           'Content-Type': 'application/vnd.api+json',
// // //         },
// // //       );
// // //
// // //       isLoading(false);
// // //       update();
// // //
// // //       if (response.statusCode == 200) {
// // //         final dataResponse = jsonDecode(response.body);
// // //         if (dataResponse['status'] != null && dataResponse['status']!.isNotEmpty) {
// // //           showDialog(
// // //             context: context,
// // //             builder: (context) => AlertDialog(
// // //               title: Text("Sign Up Success"),
// // //               content: Text(dataResponse['status']),
// // //               actions: [
// // //                 TextButton(
// // //                   onPressed: () {
// // //                     // saveUserData(SignUpModel.fromJson(json ).data);
// // //                     // saveToken(SignUpModel.fromJson(json).data!.token);
// // //                     Get.back();
// // //                   },
// // //                   child: Text("Ok"),
// // //                 )
// // //               ],
// // //             ),
// // //           );
// // //         } else {
// // //           print("No status found in response.");
// // //         }
// // //       } else {
// // //         final dataResponse = jsonDecode(response.body);
// // //         String errorMessage = dataResponse['message'] ?? '';
// // //         print(response.body);
// // //         showDialog(
// // //           context: context,
// // //           builder: (context) => AlertDialog(
// // //             title: Text("Sign Up Error"),
// // //             content: Text(errorMessage),
// // //             actions: [
// // //               TextButton(
// // //                 onPressed: () => Get.back(),
// // //                 child: Text("Ok"),
// // //               )
// // //             ],
// // //           ),
// // //         );
// // //       }
// // //     } catch (e) {
// // //       isLoading(false);
// // //       print("Exception: $e");
// // //       throw Exception(e.toString());
// // //     }
// // //   }
// // //   Future<void> saveUserData(Data? userData) async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     await prefs.setString('userData', jsonEncode(userData));
// // //   }
// // //
// // //   // Function to save token to shared preferences
// // //   Future<void> saveToken(String? token) async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     await prefs.setString('token', token!);
// // //   }
// // // }
// // //
// //
// // class SignUpController extends GetxController {
// //   late TextEditingController emailController;
// //   late TextEditingController passwordController;
// //   late TextEditingController firstNameController;
// //   late TextEditingController lastNameController;
// //   late TextEditingController CityController;
// //   late TextEditingController CountryController;
// //
// //   RxBool isLoading = false.obs;
// //   RxBool obscureText = true.obs;
// //   RxString selectedCountry = ''.obs;
// //   RxString selectedCity = ''.obs;
// //
// //   @override
// //   void onInit() {
// //     emailController = TextEditingController();
// //     passwordController = TextEditingController();
// //     firstNameController = TextEditingController();
// //     lastNameController = TextEditingController();
// //     CityController = TextEditingController();
// //     CountryController = TextEditingController();
// //     super.onInit();
// //   }
// //
// //   @override
// //   void onClose() {
// //     emailController.dispose();
// //     passwordController.dispose();
// //     firstNameController.dispose();
// //     lastNameController.dispose();
// //     CityController.dispose();
// //     CountryController.dispose();
// //     super.onClose();
// //   }
// //
// //   void toggleObscureText() {
// //     obscureText.toggle();
// //     update();
// //   }
// //
// //   Future<void> signupController(BuildContext context) async {
// //     try {
// //       isLoading(true);
// //       update();
// //       String url = "http://127.0.0.1:8000/api/mobile/register";
// //       final uri = Uri.parse(url);
// //       final response = await http.post(
// //         uri,
// //         body: jsonEncode({
// //           'email': emailController.text,
// //           'password': passwordController.text,
// //           'firstName': firstNameController.text,
// //           'lastName': lastNameController.text,
// //           'address': {
// //             'country': CountryController.text,
// //             'city': CityController.text,
// //           },
// //         }),
// //         headers: {
// //           'Accept': 'application/vnd.api+json',
// //           'Content-Type': 'application/vnd.api+json',
// //         },
// //       );
// //
// //       isLoading(false);
// //       update();
// //
// //       if (response.statusCode == 200) {
// //         final dataResponse = jsonDecode(response.body);
// //         if (dataResponse['status'] != null &&
// //             dataResponse['status']!.isNotEmpty) {
// //           print("Address: ${CountryController.text}, ${CityController.text}");
// //           print("First Name: ${firstNameController.text}");
// //           print("Last Name: ${lastNameController.text}");
// //           print("Password: ${passwordController.text}");
// //
// //           showDialog(
// //             context: context,
// //             builder: (context) => AlertDialog(
// //               title: Text("Sign Up Success"),
// //               content: Text(dataResponse['status']),
// //               actions: [
// //                 TextButton(
// //                   onPressed: () {
// //                     // saveUserData(SignUpModel.fromJson(json ).data);
// //                     // saveToken(SignUpModel.fromJson(json).data!.token);
// //                     Get.back();
// //                   },
// //                   child: Text("Ok"),
// //                 )
// //               ],
// //             ),
// //           );
// //         } else {
// //           print("No status found in response.");
// //         }
// //       } else {
// //         final dataResponse = jsonDecode(response.body);
// //         String errorMessage = dataResponse['message'] ?? '';
// //         print(response.body);
// //         showDialog(
// //           context: context,
// //           builder: (context) => AlertDialog(
// //             title: Text("Sign Up Error"),
// //             content: Text(errorMessage),
// //             actions: [
// //               TextButton(
// //                 onPressed: () => Get.back(),
// //                 child: Text("Ok"),
// //               )
// //             ],
// //           ),
// //         );
// //       }
// //     } catch (e) {
// //       isLoading(false);
// //       print("Exception: $e");
// //       throw Exception(e.toString());
// //     }
// //   }
// //
// //   Future<void> saveUserData(Data? userData) async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.setString('userData', jsonEncode(userData));
// //   }
// //
// //   // Function to save token to shared preferences
// //   Future<void> saveToken(String? token) async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.setString('token', token!);
// //   }
// // }
// import 'dart:convert';
// import 'package:ecomm/Modules/Auth/Sign-Up/sign-up-model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//  // Use the correct model name here
//
// class SignUpController extends GetxController {
//   late TextEditingController emailController;
//   late TextEditingController passwordController;
//   late TextEditingController phoneController;
//   late TextEditingController firstNameController;
//   late TextEditingController lastNameController;
//   late TextEditingController cityController;
//   late TextEditingController countryController;
//
//   RxBool isLoading = false.obs;
//   RxBool obscureText = true.obs;
//
//   @override
//   void onInit() {
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//     firstNameController = TextEditingController();
//     lastNameController = TextEditingController();
//     phoneController=TextEditingController();
//     cityController = TextEditingController();
//     countryController = TextEditingController();
//     super.onInit();
//   }
//
//   @override
//   void onClose() {
//     emailController.dispose();
//     passwordController.dispose();
//     firstNameController.dispose();
//     lastNameController.dispose();
//     cityController.dispose();
//     countryController.dispose();
//     phoneController.dispose();
//     super.onClose();
//   }
//
//   void toggleObscureText() {
//     obscureText.toggle();
//     update();
//   }
//
//   Future<void> signupController(BuildContext context) async {
//     try {
//       isLoading(true);
//       update();
//
//       String url = "http://127.0.0.1:8000/api/mobile/register";
//       final uri = Uri.parse(url);
//
//       final response = await http.post(
//         uri,
//         body: jsonEncode({
//           'email': emailController.text,
//           'password': passwordController.text,
//           'firstName': firstNameController.text,
//           'lastName': lastNameController.text,
//           'address': {
//             'country': countryController.text,
//             'city': cityController.text,
//           },
//         }),
//         headers: {
//           'Accept': 'application/vnd.api+json',
//           'Content-Type': 'application/vnd.api+json',
//         },
//       );
//
//       isLoading(false);
//       update();
//
//       if (response.statusCode == 200) {
//         final dataResponse = jsonDecode(response.body);
//         if (dataResponse['status'] != null && dataResponse['status']!.isNotEmpty) {
//           final signUpModel = SignUpModel.fromJson(dataResponse);
//           await saveUserData(signUpModel.data?.user);
//           await saveToken(signUpModel.data?.token);
//
//           showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//               title: Text("Sign Up Success"),
//               content: Text(dataResponse['status']),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Get.back();
//                   },
//                   child: Text("Ok"),
//                 )
//               ],
//             ),
//           );
//         } else {
//           print("No status found in response.");
//         }
//       } else {
//         final dataResponse = jsonDecode(response.body);
//         String errorMessage = dataResponse['message'] ?? '';
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text("Sign Up Error"),
//             content: Text(errorMessage),
//             actions: [
//               TextButton(
//                 onPressed: () => Get.back(),
//                 child: Text("Ok"),
//               )
//             ],
//           ),
//         );
//       }
//     } catch (e) {
//       isLoading(false);
//       print("Exception: $e");
//       throw Exception(e.toString());
//     }
//   }
//
//   Future<void> saveUserData(User? userData) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('userData', jsonEncode(userData));
//   }
//
//   Future<void> saveToken(String? token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('token', token!);
//   }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  late TextEditingController emailOrMobileController;
  late TextEditingController passwordController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController cityController;
  late TextEditingController countryController;

  RxString selectedCountry = RxString('');
  RxString selectedCity = RxString('');

  RxBool isLoading = false.obs;
  RxBool obscureText = true.obs;

  List<String> countries = [];
  List<String> cities = [];

  @override
  void onInit() {
    emailOrMobileController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    cityController = TextEditingController();
    countryController = TextEditingController();
    selectedCountry.value = ''; // or whatever default value you want
    selectedCity.value = '';
    super.onInit();
  }

  @override
  void onClose() {
    emailOrMobileController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    cityController.dispose();
    countryController.dispose();

    super.onClose();
  }

  Future<void> signupController(BuildContext context) async {
    try {
      isLoading(true);
      update();

      String url = "http://127.0.0.1:8000/api/mobile/register";
      final uri = Uri.parse(url);

      Map<String, dynamic> addressData = {
        'country': selectedCountry,
        'city': selectedCity,
      };

      Map<String, dynamic> userData;
      if (isEmail(emailOrMobileController.text)) {
        userData = {
          'email': emailOrMobileController.text,
          'password': passwordController.text,
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'address': addressData,
        };
      } else if (isMobile(emailOrMobileController.text)) {
        userData = {
          'phone': emailOrMobileController.text,
          'password': passwordController.text,
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'address': addressData,
        };
      } else {
        // Handle invalid input
        // Maybe show a message to the user indicating that the input is invalid
        return;
      }

      final response = await http.post(
        uri,
        body: jsonEncode(userData),
        headers: {
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/vnd.api+json',
        },
      );

      isLoading(false);
      update();

      if (response.statusCode == 200) {
        final dataResponse = jsonDecode(response.body);
        if (dataResponse['status'] != null && dataResponse['status']!.isNotEmpty) {
          await saveUserData(dataResponse['data']['user']);
          await saveToken(dataResponse['data']['token']);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Sign Up Success"),
              content: Text(dataResponse['status']),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Ok"),
                )
              ],
            ),
          );
        } else {
          print("No status found in response.");
        }
      } else {
        final dataResponse = jsonDecode(response.body);
        String errorMessage = dataResponse['message'] ?? '';
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Sign Up Error"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: Text("Ok"),
              )
            ],
          ),
        );
      }
    } catch (e) {
      isLoading(false);
      print("Exception: $e");
      throw Exception(e.toString());
    }
  }

  Future<void> fetchCountries() async {
    // Simulate fetching countries from a server
    // Replace this with your actual function to fetch countries
    countries = ['Syria', 'Iraq', 'Egypt'];
    update();
  }

  Future<void> fetchCitiesForCountry(String country) async {
    // Simulate fetching cities for the selected country
    // Replace this with your actual function to fetch cities
    cities = ['Hama', 'Qahera', 'Bagdash'];
    update();
  }
}


Future<void> saveUserData(Map<String, dynamic> userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userData', jsonEncode(userData));
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  bool isEmail(String input) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(input);
  }

  bool isMobile(String input) {
    final mobileRegex = RegExp(r'^\d{10}$');
    return mobileRegex.hasMatch(input);
  }
