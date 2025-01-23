import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/utils.dart';
import 'package:news_app/features/settings/app_config_provider.dart';
import 'package:news_app/features/settings/widgets/lang_bottom_sheet.dart';
import 'package:news_app/features/settings/widgets/theme_bottom_sheet.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:provider/provider.dart'; 

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.ph,
              Text(
                S.of(context).theme,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              10.ph,
              InkWell(
                onTap: () {
                  showThemeBottomSheet();
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        provider.appTheme == ThemeMode.light
                            ? S.of(context).light
                            : S.of(context).dark,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontFamily: "Poppins",
                                fontSize: 19,
                                fontWeight: FontWeight.w300),
                      ),
                      Icon(
                        Icons.arrow_drop_down_circle_rounded,
                        color: provider.appTheme == ThemeMode.light
                            ? ColorsManager.black
                            : ColorsManager.white,
                      )
                    ],
                  ),
                ),
              ),
              25.ph,
              Text(
                S.of(context).language,

                style: Theme.of(context).textTheme.titleLarge,
              ),
              10.ph,
              InkWell(
                onTap: () {
                  showLangBottomSheet();
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        provider.applang == 'en'
                            ? S.of(context).english
                            : S.of(context).arabic,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontFamily: "Poppins",
                            fontSize: 19,
                            fontWeight: FontWeight.w300),
                      ),
                      Icon(
                        Icons.arrow_drop_down_circle_rounded,
                        color: provider.appTheme == ThemeMode.light
                            ? ColorsManager.black
                            : ColorsManager.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ThemeBottomSheet(),
    );
  }

  void showLangBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LangBottomSheet(),
    );
  }
}