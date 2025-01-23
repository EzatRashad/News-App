import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/cashe_helper.dart';
import 'package:news_app/core/theme.dart';
import 'package:news_app/features/home/home_cubit/bloc_observar.dart';
import 'package:news_app/features/layout/layout.dart';
import 'package:news_app/features/search/search_cubit/search_cubit.dart';
import 'package:news_app/features/settings/app_config_provider.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await CasheHelper.init();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppConfigProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return ScreenUtilInit(
        designSize: const Size(412, 870),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MultiBlocProvider(
                providers: [
                  BlocProvider<SearchCubit>(create: (_) => SearchCubit()),
                ],
                child: MaterialApp(
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  debugShowCheckedModeBanner: false,
                  locale: Locale(provider.applang),
                  theme: MyTheme.lightTheme,
                  darkTheme: MyTheme.darkTheme,
                  themeMode: provider.appTheme,
                  home: const Layout(),
                )));
  }
}
