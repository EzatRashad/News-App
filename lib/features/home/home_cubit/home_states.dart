import 'package:news_app/models/NewsModel.dart';
import 'package:news_app/models/source_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  String? errorMessage;
HomeErrorState(this.errorMessage);
}

class HomeSuccessState extends HomeState {
  List<Source>? sourcesList;
  HomeSuccessState(this.sourcesList);
}

class ChangeIndex extends HomeState {

}
