import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/home_cubit/home_cubit.dart';
import 'package:news_app/features/home/home_cubit/home_states.dart';
import 'package:news_app/features/home/widgets/shimer_tab_item.dart';
import 'package:news_app/models/category_model.dart';
import 'widgets/tab_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, this.selectedCategory});
  final CategoryModel? selectedCategory;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeCubit homeCubit = HomeCubit();
  @override
  void initState() {
    homeCubit.getSources(widget.selectedCategory!.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) => homeCubit,
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeErrorState) {
                  return Center(
                    child: Column(
                      children: [
                        Text(state.errorMessage!),
                        ElevatedButton(
                            onPressed: () {
                              homeCubit.getSources(widget.selectedCategory!.id);
                            },
                            child: const Text("try again"))
                      ],
                    ),
                  );
                } else if (state is HomeSuccessState) {
                  return TabWidget(
                    sources: state.sourcesList!,
                  );
                } else {
                  return const ShimmerTabItem();
                }
              },
              bloc: homeCubit,
            )));
  }
}
