import 'package:uhuru_news/model/category_news_model.dart';
import 'package:uhuru_news/model/news_headline_model.dart';
import 'package:uhuru_news/repository/category_repository.dart';
import 'package:uhuru_news/repository/history_repository.dart';
import 'package:uhuru_news/repository/news_repository.dart';

class NewsViewModel {
  final _catRep = CategoryRepository();
  final _hist = HistoryRepository();
  final _rep = NewsRepository();

  Future<NewsChannnelHeadlineModel> fetchNewsHeadlineApi() async {
    final response = await _rep.fetchChannelheadline();
    return response;
  }

  Future<NewsChannnelHeadlineModel> fetchHistoryApi() async {
    final response = await _hist.fetchChannelheadline();
    return response;
  }

  Future<CategoryNewsModel> fetchCategorieNewsApi(String channelName) async {
    final response = await _catRep.fetchCategorieNewsApi(channelName);
    return response;
  }
}
