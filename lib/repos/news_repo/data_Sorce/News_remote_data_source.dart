import 'package:news_app/models/NewsModel.dart';
import 'package:news_app/repos/news_repo/news_repo.dart';
import 'package:news_app/services/api_service.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiService apiService;
  NewsRemoteDataSourceImpl({required this.apiService});
 

  @override
  Future<NewsModel> getRemoteNews(String sourceId)async {
    var response = await apiService.getNewsBySourceId(sourceId);

    return response;
  }
}
