import 'package:flutter/material.dart';
import 'package:news_app/features/settings/app_config_provider.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:provider/provider.dart'; 

import '../../../core/colors.dart'; 


class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.of(context).pop();

            },
            child: provider.appTheme == ThemeMode.light
                ? getSelcted(S.of(context).light)
                : getunSelcted(S.of(context).light),
          ),
          const Divider(
            height: 30,
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.of(context).pop();

            },
            child: provider.appTheme == ThemeMode.dark
                ? getSelcted(S.of(context).dark)
                : getunSelcted(S.of(context).dark),
          ),
        ],
      ),
    );
  }

  Widget getSelcted(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontFamily: "Poppins",
            fontSize: 19,
            fontWeight: FontWeight.w300,
            color: ColorsManager.primaryLight,
          ),
        ),
        const Icon(
          Icons.check,
          color: ColorsManager.primaryLight,
        ),
      ],
    );
  }

  Widget getunSelcted(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
               fontSize: 19,
              fontWeight: FontWeight.w300,
              color: ColorsManager.black),
        ),
      ],
    );
  }
}