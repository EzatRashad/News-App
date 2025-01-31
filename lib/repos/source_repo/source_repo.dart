import 'package:news_app/models/source_model.dart';

abstract class SourceRepo {
  Future<SourceModel> getSources(String categoryId);
}

abstract class SourceRemoteDataSource {
  Future<SourceModel> getRemoteSources(String categoryId);
}

abstract class SourceLocaleDataSource {
  Future<SourceModel> getLocaleSources(String categoryId);
}