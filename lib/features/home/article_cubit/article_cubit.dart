import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/article_cubit/article_states.dart';
 import 'package:news_app/services/api_service.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitialState());

  void getNewsBySourceId(String sourceId) async {
    emit(ArticleLoadingState());
    try {
      var response = await ApiService.getNewsBySourceId(sourceId);
      if (response.status == 'error') {
        emit(ArticleErrorState(response.message!));
      } else {
        emit(ArticleSuccessState(response.articles!));
      }
    } catch (e) {
      emit(ArticleErrorState(e.toString()));
    }
  }
}
