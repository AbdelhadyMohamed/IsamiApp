import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami_app/RadioModel.dart';

class ApiManager {
  static Future<RadioModel> getData() async {
    var url = Uri.parse("https://mp3quran.net/api/v3/radios?language=ar");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    return RadioModel.fromJson(json);
  }
}
