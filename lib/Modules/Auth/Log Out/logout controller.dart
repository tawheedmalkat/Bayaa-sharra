import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogoutController extends GetxController {
  Future<void> logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token != null) {
        // إنشاء الطلب لتسجيل الخروج
        final response = await http.post(
          Uri.parse('http://127.0.0.1:8000/api/mobile/logout'),
          headers: {
            'Accept': 'application/vnd.api+json',
            'Content-Type': 'application/vnd.api+json',
            'Authorization': 'Bearer $token',
          },
        );

        // التحقق من نجاح الطلب
        if (response.statusCode == 200) {
          // حذف الـ token من التخزين المحلي
          await prefs.remove('token');

          final data = jsonDecode(response.body);
          String message = data['message'] ?? 'logout is don';
          Get.snackbar(
            'Logout Successful',
            message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          Get.offAllNamed('/signin');
          Get.offAllNamed('/signup');// انتقل إلى صفحة تسجيل الدخول بعد تسجيل الخروج
        } else {
          // في حالة فشل عملية تسجيل الخروج
          final data = jsonDecode(response.body);
          String errorMessage = data['message'] ?? 'Unknown error occurred.';
          // عرض رسالة الخطأ للمستخدم باستخدام Snackbar
          Get.snackbar(
            'Unauthenticated.',
            errorMessage,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        // إذا لم يتم العثور على token في التخزين المحلي
        Get.snackbar(
          'Logout Failed',
          'No token found. Please login again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      // في حالة حدوث استثناء أثناء الطلب
      Get.snackbar(
        'Error',
        'An error occurred while logging out. Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
