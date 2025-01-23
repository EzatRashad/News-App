import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/features/category/category_view.dart';
import 'package:news_app/features/home/home_view.dart';
import 'package:news_app/features/search/search_view.dart';
import 'package:news_app/features/settings/settings_view.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:news_app/models/category_model.dart';

import 'widgets/custom_drawer.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: ColorsManager.primaryLight,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: ColorsManager.white,
          ),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: Text(
          selectedIndex == 1
              ? S.of(context).settingsTitle
              : selectedCategory == null
                  ? S.of(context).newsApp
                  : selectedCategory!.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchView()));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: CustomDrawer(
            drawerClick: drawerClick,
          )),
      body: selectedIndex == 1
          ? const SettingsScreen()
          : selectedCategory != null
              ? HomeView(
                  selectedCategory: selectedCategory,
                )
              : CategoryView(
                  onCategoryItemClicked: onCategoryItemClicked,
                ),
    );
  }

  CategoryModel? selectedCategory;

  void onCategoryItemClicked(CategoryModel categoryModel) {
    selectedCategory = categoryModel;
    setState(() {});
  }

  int selectedIndex = 0;
  void drawerClick(int selected) {
    selectedIndex = selected;
    scaffoldKey.currentState!.closeDrawer();
    selectedCategory = null;
    setState(() {});
  }
}
