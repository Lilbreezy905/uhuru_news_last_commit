import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as ht;
import 'package:uhuru_news/model/news_headline_model.dart';

class NewsRepository {
  Future<NewsChannnelHeadlineModel> fetchChannelheadline() async {
    // 7d811f56ffa36a0534a945379b0bfc06
    String url =
        'https://gnews.io/api/v4/top-headlines?category=general&lang=en&country=us&max=10&apikey=0d0decf3903f15568ec085d1509b53de';
    final response = await ht.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }

    // ignore: prefer_typing_uninitialized_variables must, prefer_typing_uninitialized_variables
    var body;
    if (response.statusCode == 200) {
      body = jsonDecode(response.body);
    }
    return NewsChannnelHeadlineModel.fromJson(body);
  }
}
