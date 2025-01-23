

import '../../../models/NewsModel.dart';

abstract class ArticleState {}

class ArticleInitialState extends ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ArticleErrorState extends ArticleState {
  String? errorMessage;
ArticleErrorState(this.errorMessage);
}

class ArticleSuccessState extends ArticleState {
  List<Articles>? articlesList;
ArticleSuccessState(this.articlesList);
}
