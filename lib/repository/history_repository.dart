import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as ht;
import 'package:uhuru_news/model/news_headline_model.dart';

// apikey = '7d811f56ffa36a0534a945379b0bfc06';
// category = 'general';
// url = 'https://gnews.io/api/v4/top-headlines?category=' + category + '&lang=en&country=us&max=10&apikey=' + apikey;

// fetch(url)
//   .then(function (response) {
//     return response.json();
//   })
//   .then(function (data) {
//     articles = data.articles;

//     for (i = 0; i < articles.length; i++) {
//       // articles[i].title
//       console.log("Title: " + articles[i]['title']);
//       // articles[i].description
//       console.log("Description: " + articles[i]['description']);
//       // You can replace {property} below with any of the article properties returned by the API.
//       // articles[i].{property}
//       // console.log(articles[i]['{property}']);

//       // Delete this line to display all the articles returned by the request. Currently only the first article is displayed.
//       break;
//     }
//   });

class HistoryRepository {
  Future<NewsChannnelHeadlineModel> fetchChannelheadline() async {
    String url =
        "https://gnews.io/api/v4/top-headlines?category=world&lang=en&country=us&max=10&apikey=0d0decf3903f15568ec085d1509b53de";
    final response = await ht.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }

    // ignore: prefer_typing_uninitialized_variables
    var body;
    if (response.statusCode == 200) {
      body = jsonDecode(response.body);
    }
    return NewsChannnelHeadlineModel.fromJson(body);
  }
}
