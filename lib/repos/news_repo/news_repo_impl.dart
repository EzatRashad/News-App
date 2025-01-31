import 'package:news_app/models/NewsModel.dart';
import 'package:news_app/repos/news_repo/news_repo.dart';

class NewsRepoImpl implements NewsRepo {
  NewsRemoteDataSource newsRemoteDataSource;
  NewsRepoImpl({required this.newsRemoteDataSource});
  @override
  Future<NewsModel> fetchNews(String sourceId) {
    return newsRemoteDataSource.getRemoteNews(sourceId);
  }
}
