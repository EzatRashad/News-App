import 'package:news_app/models/source_model.dart';
import 'package:news_app/repos/source_repo/source_repo.dart';
import 'package:news_app/services/api_service.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiService apiService;
  SourceRemoteDataSourceImpl({required this.apiService});
  @override
  Future<SourceModel> getRemoteSources(String categoryId) async {
    var response = await apiService.getSources(categoryId);

    return response;
  }
}
