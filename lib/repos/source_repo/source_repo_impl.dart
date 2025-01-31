import 'package:news_app/models/source_model.dart';
import 'package:news_app/repos/source_repo/source_repo.dart';

class SourceRepoImpl implements SourceRepo {
  SourceRemoteDataSource sourceRemoteDataSource;
  SourceRepoImpl({required this.sourceRemoteDataSource});
  @override
  Future<SourceModel> getSources(String categoryId) {
    return sourceRemoteDataSource.getRemoteSources(categoryId);
  }
}
