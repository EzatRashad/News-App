import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/features/settings/app_config_provider.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:provider/provider.dart'; 


class LangBottomSheet extends StatefulWidget {
  const LangBottomSheet({super.key});

  @override
  State<LangBottomSheet> createState() => _LangBottomSheetState();
}

class _LangBottomSheetState extends State<LangBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //en
          InkWell(
            onTap: () {
              provider.changeLang('en');
              Navigator.of(context).pop();

            },
            child: provider.applang == 'en'
                ? getSelcted(S.of(context).english)
                : getunSelcted(S.of(context).english),
          ),
          const Divider(
            height: 30,
          ),
          //ar
          InkWell(
            onTap: () {
              provider.changeLang('ar');
              Navigator.of(context).pop();
            },
            child: provider.applang == 'ar'
                ? getSelcted(S.of(context).arabic)
                : getunSelcted(S.of(context).arabic),
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