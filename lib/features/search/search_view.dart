import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'package:news_app/features/home/widgets/shimer_article_item.dart';
import 'package:news_app/features/home/widgets/article_item.dart';
import 'package:news_app/features/search/search_cubit/search_cubit.dart';
import 'package:news_app/features/search/search_cubit/search_state.dart';
import 'package:news_app/generated/l10n.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Row(
          children: [
             
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: textController,
                  onChanged: (query) {
                    context.read<SearchCubit>().searchArticles(query);
                  },
                  decoration: InputDecoration(
                    hintText: S.of(context).searchTextField,
                    hintStyle: GoogleFonts.poppins(
                      color: const Color(0xff6B6B6B),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {
                        textController.clear();
                        context.read<SearchCubit>().searchArticles('');
                      },
                      icon: const Icon(Icons.close, color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchInitial) {
            return   Center(child: Text(S.of(context).search));
          } else if (state is SearchLoading) {
            return const ShimmerArticleItem();
          } else if (state is SearchSuccess) {
            if (state.articles.isEmpty) {
              return const Center(child: Text("No results found."));
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                return ArticleItem(article: state.articles[index]);
              },
            );
          } else if (state is SearchError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage),
                  ElevatedButton(
                    onPressed: () {
                      context.read<SearchCubit>().searchArticles(textController.text);
                    },
                    child: Center(child: Text(S.of(context).search)),
                  ),
                ],
              ),
            );
          } else if (state is SearchEmpty) {
            return   Center(child: Center(child: Text(S.of(context).search)));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
