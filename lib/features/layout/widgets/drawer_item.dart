import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/features/settings/app_config_provider.dart';
import 'package:provider/provider.dart';
import '../../../core/app_theme.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key,
     
      required this.txt,
      required this.icon});

  final String txt;
  final IconData icon;
   @override
  Widget build(BuildContext context) {
                var provider = Provider.of<AppConfigProvider>(context);

    return ListTile(
      leading: Icon(
        icon,
        size: 35,
        color: provider.appTheme == ThemeMode.dark? ColorsManager.white:ColorsManager.black,
      ),
      title: Text(
        txt,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
