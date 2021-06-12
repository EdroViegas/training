import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:training_app/constants/default.dart';
import 'package:training_app/model/api_response_model.dart';
import 'package:training_app/model/news_model.dart';

String url =
    "https://newsapi.org/v2/top-headlines?country=us&apiKey=5047548bf0464a1794e6aba70e458163";

Future<NewsModel> getNews() async {
  try {
    final response =
        await http.get("$url", headers: {"Content-Type": "application/json"});

    NewsModel news = newsModelFromJson(response.body);

    //print("RESPONSE > ${news.articles}");

    return newsModelFromJson(response.body);
  } catch (e) {
    print("Error getting orders");
    print(e);
    return null;
  }
}
