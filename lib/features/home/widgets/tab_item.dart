import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.isSelect, required this.name});
  final bool isSelect;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelect ? ColorsManager.primaryLight : Colors.transparent,
        border: Border.all(color: ColorsManager.primaryLight, width: 2),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        name  ,
        style: TextStyle(color: isSelect ? Colors.white : ColorsManager.primaryLight),
      ),
    );
  }
}
