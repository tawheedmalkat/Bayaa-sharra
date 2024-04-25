import 'dart:convert';
import 'package:ecomm/helpers/Services/remot-services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:ecomm/Modules/Categories/productsmodel.dart';

import '../../Constant/apistring.dart';

class ProductsController extends GetxController {
  bool isLoading = true;
  var productsModel = <ProductsModel>[].obs;


  void getProduct() async {
    var product=await RemotServices.fetchData();
    if(product !=null){}
    productsModel.value=product!;

  }
  //   try {
  //     String url = "$baseUrl/products";
  //     var uri = Uri.parse(url);
  //
  //     var response = await http.get(uri);
  //
  //     if (response.statusCode == 200) {
  //       var dataResponse = jsonDecode(response.body);
  //
  //       if (dataResponse is List) {
  //         // productsModel = dataResponse
  //         //     .map((json) => ProductsModel.fromJson(json))
  //         //     .toList();
  //         isLoading = false;
  //       } else if (dataResponse is Map<String, dynamic>) {
  //         // productsModel = [ProductsModel.fromJson(dataResponse)];
  //         isLoading = false;
  //       } else {
  //         print('Invalid data format');
  //         isLoading = false;
  //       }
  //     } else {
  //       print('Failed to load data: ${response.statusCode}');
  //       isLoading = false;
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     isLoading = false;
  //   }
  //   update();
  // }
  //
  @override
  void onInit() {
    getProduct();
    super.onInit();
  }
}
