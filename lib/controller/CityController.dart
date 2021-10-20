import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prayertime/models/City.dart';

class CityController{
  late bool success;
  late String message;
  late City data;

  static String url = "http://localhost:6065";

  Future<City> getDecode(int index)async{
    final response = await http.get(Uri.parse("$url/api/dates/json/1.0/todaydate/?indexOfCity=$index"));
    if (response.statusCode == 200) {
      var rawData = jsonDecode(utf8.decode(response.bodyBytes));
      success = rawData['success'];
      message = rawData['message'];
      return City.fromJson(rawData['data']);
    } else {
      throw Exception('Exception');
    }
  }
}