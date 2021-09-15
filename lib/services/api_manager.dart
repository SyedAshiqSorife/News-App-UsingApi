import 'dart:convert';
import 'package:news_app/strings.dart';
import 'package:news_app/models/prothomalo.dart';
import 'package:http/http.dart' as http;

class APIManager {
  Future<Welcome> getProthomAloNews() async {
    var client = http.Client();
    var newsModel;

    var response = await client.get(Uri.parse(Strings.prothomaloUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      newsModel = Welcome.fromJson(jsonMap);
    }

    return newsModel;
  }
}
