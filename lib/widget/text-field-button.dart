import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Modules/Auth/Sign-In/sign-in-controller.dart';

class BuildTextFormField extends StatelessWidget {
  final String textHint;
  final Color color;
  final TextEditingController controlleri;
  final String? Function(String?)? validator;
  final bool isPassword;

  BuildTextFormField({
    required this.color,
    required this.textHint,
    required this.controlleri,
    this.validator,
    this.isPassword = true,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());

    return GetBuilder<SignInController>(
      builder: (controller) => Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              obscureText: isPassword ? controller.obscureText.value : false,
              validator: validator,
              controller: controlleri,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey.withOpacity(0.1),
                suffixIcon: isPassword
                    ? IconButton(
                  icon: Icon(controller!.obscureText.value
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    controller.toggleObscureText();
                  },
                )
                    : null,
                contentPadding: EdgeInsets.all(10),
                hintText: textHint,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}