import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/article_cubit/article_states.dart';
import 'package:news_app/features/home/article_cubit/article_cubit.dart';
import 'package:news_app/features/home/widgets/article_item.dart';
import 'package:news_app/features/home/widgets/shimer_article_item.dart';
import 'package:news_app/models/source_model.dart';

class ArticleWidget extends StatefulWidget {
  const ArticleWidget({super.key, required this.source});
  final Source source;

  @override
  State<ArticleWidget> createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  ArticleCubit articleCubit = ArticleCubit();
  @override
  void initState() {
    articleCubit.getNewsBySourceId(widget.source.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCubit, ArticleState>(
      buildWhen: (previous, current) {
        if (current is ArticleSuccessState) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state is ArticleErrorState) {
          return Center(
            child: Column(
              children: [
                Text(state.errorMessage!),
                ElevatedButton(
                    onPressed: () {
                      articleCubit.getNewsBySourceId(widget.source.id!);
                    },
                    child: const Text("try again"))
              ],
            ),
          );
        } else if (state is ArticleSuccessState) {
          return ListView.builder(
            itemCount: state.articlesList!.length,
            itemBuilder: (context, index) {
              return ArticleItem(article: state.articlesList![index]);
            },
          );
        } else {
          return const ShimmerArticleItem();
        }
      },
      bloc: articleCubit,
    );

    
  }
}
