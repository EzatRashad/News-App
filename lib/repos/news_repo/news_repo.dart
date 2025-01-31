import 'package:news_app/models/NewsModel.dart';

abstract class NewsRepo {
  Future<NewsModel> fetchNews(String sourceId);
}

abstract class NewsRemoteDataSource {
  Future<NewsModel> getRemoteNews(String sourceId);
}

abstract class NewsLocaleDataSource {
  Future<NewsModel> getLocaleNews(String sourceId);
}