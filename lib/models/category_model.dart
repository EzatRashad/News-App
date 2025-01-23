import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/generated/l10n.dart';

import '../core/assets.dart';

class CategoryModel {
  String id;
  String title;
  Color bgColor;
  String imagePath;

  CategoryModel(
      {required this.id,
      required this.title,
      required this.bgColor,
      required this.imagePath});
  static List<CategoryModel> getAllCategories(BuildContext context) => [
        CategoryModel(
          id: Constants.sportsId,
          title: S.of(context).sports,
          bgColor: ColorsManager.red,
          imagePath: AssetsManager.imagesSports,
        ),
        CategoryModel(
          id: Constants.generalId,
          title: S.of(context).general,
          bgColor: ColorsManager.brawn,
          imagePath: AssetsManager.imagesGeneral,
        ),
        CategoryModel(
          id: Constants.healthId,
          title: S.of(context).health,
          bgColor: ColorsManager.pink,
          imagePath: AssetsManager.imagesHealth,
        ),
        CategoryModel(
          id: Constants.businessId,
          title: S.of(context).business,
          bgColor: ColorsManager.primaryLight,
          imagePath: AssetsManager.imagesBussines,
        ),
        CategoryModel(
          id: Constants.entertainmentId,
          title: S.of(context).entertainment,
          bgColor: ColorsManager.blue,
          imagePath: AssetsManager.imagesEntertainment,
        ),
        CategoryModel(
          id: Constants.scienceId,
          title: S.of(context).science,
          bgColor: ColorsManager.yellow,
          imagePath: AssetsManager.imagesScience,
        ),
        CategoryModel(
          id: Constants.technologyId,
          title: S.of(context).technology,
          bgColor: ColorsManager.grey,
          imagePath: AssetsManager.imagesTechnology,
        ),
      ];
}
