
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/app_theme.dart';
import 'package:news_app/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
   CategoryWidget({super.key,required this.categoryModel,required this.index});
CategoryModel categoryModel;
int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryModel.bgColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r),
            topLeft: Radius.circular(25.r),
            bottomLeft: Radius.circular(index.isEven?25:0),
          bottomRight: Radius.circular(index.isEven?0:25),
          ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categoryModel.imagePath,width: 142.w,height: 126.h,),
          Text(categoryModel.title,style: AppStyles.categoryTitle,),
        ],
      ),
    );
  }
}
