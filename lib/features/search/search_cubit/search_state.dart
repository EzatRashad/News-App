 
 
import '../../../models/NewsModel.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Articles> articles;

  SearchSuccess(this.articles);
}

class SearchError extends SearchState {
  final String errorMessage;

  SearchError(this.errorMessage);
}

class SearchEmpty extends SearchState {}
