import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/article_cubit/article_states.dart';
import 'package:news_app/repos/news_repo/news_repo.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit({required this.newsRepo}) : super(ArticleInitialState());
    NewsRepo newsRepo;

  void getNewsBySourceId(String sourceId) async {
    emit(ArticleLoadingState());
    try {
      var response = await newsRepo.fetchNews(sourceId);
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
