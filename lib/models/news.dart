import 'dart:convert';

import 'package:DNNewsApp/helper/keys/keys.dart';
import 'package:DNNewsApp/models/article_model.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class News {
  List<Article> news = new List<Article>();

  String key = Keys.apiKey;

  Future<void> getNews({category: String}) async {
    String apiURL =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=$key";

    if (category == "top headlines") {
      apiURL = "https://newsapi.org/v2/top-headlines?country=in&apiKey=$key";
    } else {
      debugPrint(category);
      apiURL =
          "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$key";
    }

    debugPrint(apiURL);
    if (category != "String") {
      var response = await http.get(apiURL);
      var jsonData = jsonDecode(response.body);

      if (jsonData['status'] == "ok") {
        jsonData['articles'].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            Article article = Article(
                element['author'],
                element['title'],
                element['description'],
                element['url'],
                element['urlToImage'],
                element['publishedAt'],
                element['content']);
            news.add(article);
          }
        });
      }
    }
  }
}
