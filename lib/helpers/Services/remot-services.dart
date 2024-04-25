import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Constant/apistring.dart';
import '../../Modules/Categories/productsmodel.dart';
class RemotServices{
  static var client=http.Client();
  static Future <List<ProductsModel>?> fetchData() async{
    String url = "$baseUrl/products";
        var uri = Uri.parse(url);

        var response = await client.get(uri);
        if(response.statusCode==200){
          var data=response.body;
          return productsModelFromJson(data);
        }
        else{
          return
            null;
        }


}
}