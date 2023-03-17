import 'dart:convert';
import 'dart:developer';

import 'package:newsproject/api_service/api_url.dart';
import 'package:http/http.dart' as http;
import '../model/home_screen.dart';

class ApiService {
  static Future<GetCategoryDatatResponseModel> getCategoryData(int id) async {
    var response = await http.post(
      Uri.parse(
          "https://milliondotsadmin.noviindus.co.in/api/news-and-blogs-catg"),
      body: json.encode({"category": id}),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    log("https://milliondotsadmin.noviindus.co.in/api/news-and-blogs-catg" +
        id.toString() +
        " ==>" +
        response.body.toString());
    if (response.statusCode == 200) {
      return getCategoryDatatResponseModelFromJson(response.body);
    } else {
      log(response.body);
      throw Exception(response.body);
    }
  }

  static Future<GetCategorytResponseModel> getCategory() async {
    var response = await http.get(
      Uri.parse("https://milliondotsadmin.noviindus.co.in/api/news-and-blogs"),
    );
    log("https://milliondotsadmin.noviindus.co.in/api/news-and-blogs" +
        " ==>" +
        response.body.toString() +
        response.statusCode.toString());
    if (response.statusCode == 202) {
      return getCategorytResponseModelFromJson(response.body);
    } else {
      log(response.body);
      throw Exception(response.body);
    }
  }
}
