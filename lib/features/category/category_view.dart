import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/category/widgets/category_widget.dart';
import 'package:news_app/models/category_model.dart';

 
class CategoryView extends StatefulWidget {
  const CategoryView({super.key, required this.onCategoryItemClicked});
  final Function onCategoryItemClicked;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
 
  @override
  Widget build(BuildContext context) {
        final allCategories = CategoryModel.getAllCategories(context);

    return Container(
      padding: REdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 25.w,
                  mainAxisSpacing: 20.h),
              itemCount: allCategories.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  widget.onCategoryItemClicked(allCategories[index]);
                },
                child: CategoryWidget(
                    categoryModel: allCategories[index], index: index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
