import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/utils.dart';
import 'package:news_app/features/details/widgets/article_image.dart';
import 'package:news_app/features/details/widgets/view_full_article_button.dart';
import 'package:news_app/models/NewsModel.dart';

import 'widgets/article_data.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.article});
  final Articles article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorsManager.primaryLight,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Colors.white)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ArticleImage(imageUrl: article.urlToImage),
            20.ph,
            ArticleData(
              sourceName: article.source?.name,
              title: article.title,
              publishedAt: article.publishedAt,
              description: article.description,
              content: article.content,
            ),
            20.ph,
            ViewFullArticleButton(url: article.url),
          ],
        ),
      ),
    );
  }
}
