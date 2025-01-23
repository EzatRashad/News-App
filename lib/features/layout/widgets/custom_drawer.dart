import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/utils.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../settings/app_config_provider.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key, required this.drawerClick});
  final Function drawerClick;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  @override
  Widget build(BuildContext context) {
            var provider = Provider.of<AppConfigProvider>(context);

    return Drawer(
      child: Container(
        color: provider.appTheme == ThemeMode.dark? ColorsManager.black:ColorsManager.white,
        child: Column(
          children: [
            Container(
                color: ColorsManager.primaryLight,
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.2,
                alignment: Alignment.center,
                child:   Text(
                  S.of(context).newsApp,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 25),
                )),
            50.ph,
            GestureDetector(
                onTap: () {
                  widget.drawerClick(0);          
                },
                child:   DrawerItem(
                  icon: Icons.view_list,
                  txt: S.of(context).categories,
                )),
            20.ph,
            GestureDetector(
                onTap: () {
                  widget.drawerClick(1);              
                },
                child:   DrawerItem(
                  icon: Icons.settings,
                  txt: S.of(context).settingsPage,
                 )),
          ],
        ),
      ),
    );
  }
}
