// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart';

import '../model/news_model.dart';

class ApiService {
  final all_news_url =
      "http://newsapi.org/v2/everything?q=bitcoin&apiKey=c52be9b54e3d477b9108c39dbdcc6d8c";

  final breaking_news_url =
      "http://newsapi.org/v2/top-headlines?country=us&apiKey=c52be9b54e3d477b9108c39dbdcc6d8c";

  Future<List<NewsModel>> getAllNews() async {
    try {
      Response response = await get(Uri.parse(all_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articlesList =
            body.map((item) => NewsModel.fromJson(item)).toList();
        return articlesList;
      } else {
        throw ("No message found");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      Response response = await get(Uri.parse(breaking_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articlesList =
            body.map((item) => NewsModel.fromJson(item)).toList();
        return articlesList;
      } else {
        throw ("No message found");
      }
    } catch (e) {
      //print(e.toString());
      rethrow;
    }
  }
}
