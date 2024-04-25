import 'package:ecomm/Modules/Auth/Sign-In/sign-in-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/text-field-button.dart';
import '';
import '../Sign-Up/sign-up-screen.dart';

class SignInScreen extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());

    return GetBuilder<SignInController>(
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                  ),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/images/Logo (2).png",),
                    ),
                  ),

                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          "assets/images/logo.png",
                          color: Color(0xFF662d91),
                        ),
                      ),
                      Text(
                        "LogIn to your account",
                        style: TextStyle(
                          color: Color(0xFF662d91),
                          fontSize: 20,
                          fontFamily: "Anta",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email"),
                      SizedBox(height: 10),
                      BuildTextFormField(

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          if (!emailRegex.hasMatch(value)) {
                            return 'Enter a correct email format';
                          }
                          return null;
                        },
                        controlleri: controller.emailcontroller,
                        color: Colors.white,
                        textHint: "user@gmail.com",
                        isPassword: false,
                      ),
                      SizedBox(height: 10),
                      Text("Password"),
                      SizedBox(height: 10),
                      BuildTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Password';
                          } else if (value.length < 6) {
                            return 'Please enter password more than 6 letter';
                          }
                          return null;
                        },

                        isPassword: true,
                        controlleri: controller.passwordcontroller,
                        color: Colors.white,
                        textHint: "*******",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                GestureDetector(
                  onTap: () async {
                    if (_formkey.currentState!.validate()) {
                      if (controller.isLoading.value) {
                        Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        await controller.signincontroller(context);
                      }
                      controller.isLoading.toggle();

                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF662d91),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.login,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "If you don't have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(SignUpPage());
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(color: Color(0xFF1E5631), fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}