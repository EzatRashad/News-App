import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/home_cubit/home_states.dart';
import 'package:news_app/services/api_service.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  void getSources(String categoryId) async {
    emit(HomeLoadingState());
    try {
      var response = await ApiService.getSources(categoryId);
      if (response.status == 'error') {
        emit(HomeErrorState(response.message!));
      } else {
        emit(HomeSuccessState(response.sources!));
      }
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
  
}
