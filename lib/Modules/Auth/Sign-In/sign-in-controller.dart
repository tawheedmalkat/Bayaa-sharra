import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Sign-Up/sign-up-model.dart';


class SignInController extends GetxController {
  late TextEditingController emailcontroller;
  late TextEditingController passwordcontroller;
  RxBool isLoading = false.obs;
  late String status = '';
  late String message = '';
  RxBool obscureText = true.obs;

  @override
  void onInit() {
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.onClose();
  }

  void toggleObscureText() {
    obscureText.toggle();
    update();
  }

  Future<void> signincontroller(BuildContext context) async {
    try {
      RxBool isLoading=true.obs;
      update();
      String url = "http://127.0.0.1:8000/api/mobile/login";
      final uri = Uri.parse(url);
      final response = await http.post(
        uri,
        body: jsonEncode({
          'email': emailcontroller.text,
          'password': passwordcontroller.text,
        }),
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
            print(response.body);
            message = dataResponse['message'] ?? '';
            final signUpModel = SignUpModel.fromJson(dataResponse);
            await saveUserData(signUpModel.data?.user);
            await saveToken(signUpModel.data?.token);

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

    Future<void> saveUserData(User? userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userData', jsonEncode(userData));
    }

    Future<void> saveToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token!);
    }
  }

