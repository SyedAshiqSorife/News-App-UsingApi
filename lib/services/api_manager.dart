import 'dart:convert';
import 'package:news_app/strings.dart';
import 'package:news_app/models/prothomalo.dart';
import 'package:http/http.dart' as http;

class APIManager {
  Future<Welcome> getNews(apiUrl) async {
    var client = http.Client();
    var newsModel;

    var response = await client.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      newsModel = Welcome.fromJson(jsonMap);
    }

    return newsModel;
  }
}
