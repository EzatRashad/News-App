import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/home_cubit/home_states.dart';
import '../../../repos/source_repo/source_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.sourceRepo}) : super(HomeInitialState());
  SourceRepo sourceRepo;

  void getSources(String categoryId) async {
    emit(HomeLoadingState());
    try {
      var response = await sourceRepo.getSources(categoryId);
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
