import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/search/search_cubit/search_state.dart';
import 'package:news_app/services/api_service.dart';

 
class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void searchArticles(String query) async {
    if (query.isEmpty) {
      emit(SearchEmpty());
      return;
    }

    emit(SearchLoading());

    try {
      final result = await ApiService.search(query);
      if (result.status == 'ok') {
        emit(SearchSuccess(result.articles ?? []));
      } else {
        emit(SearchError(result.message ?? 'Something went wrong.'));
      }
    } catch (error) {
      emit(SearchError('Local Error: $error'));
    }
  }
}
