// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `NEWS-APP`
  String get newsApp {
    return Intl.message(
      'NEWS-APP',
      name: 'newsApp',
      desc: '',
      args: [],
    );
  }

  /// `TODAY-NEWS`
  String get todayNews {
    return Intl.message(
      'TODAY-NEWS',
      name: 'todayNews',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `SETTINGS`
  String get settingsTitle {
    return Intl.message(
      'SETTINGS',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `SETTINGS`
  String get settingsPage {
    return Intl.message(
      'SETTINGS',
      name: 'settingsPage',
      desc: '',
      args: [],
    );
  }

  /// `SPORTS`
  String get sports {
    return Intl.message(
      'SPORTS',
      name: 'sports',
      desc: '',
      args: [],
    );
  }

  /// `GENERAL`
  String get general {
    return Intl.message(
      'GENERAL',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `HEALTH`
  String get health {
    return Intl.message(
      'HEALTH',
      name: 'health',
      desc: '',
      args: [],
    );
  }

  /// `BUSINESS`
  String get business {
    return Intl.message(
      'BUSINESS',
      name: 'business',
      desc: '',
      args: [],
    );
  }

  /// `ENTERTAINMENT`
  String get entertainment {
    return Intl.message(
      'ENTERTAINMENT',
      name: 'entertainment',
      desc: '',
      args: [],
    );
  }

  /// `SCIENCE`
  String get science {
    return Intl.message(
      'SCIENCE',
      name: 'science',
      desc: '',
      args: [],
    );
  }

  /// `TECHNOLOGY`
  String get technology {
    return Intl.message(
      'TECHNOLOGY',
      name: 'technology',
      desc: '',
      args: [],
    );
  }

  /// `No articles found, Please tey another search term`
  String get search {
    return Intl.message(
      'No articles found, Please tey another search term',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Search Articles`
  String get searchTextField {
    return Intl.message(
      'Search Articles',
      name: 'searchTextField',
      desc: '',
      args: [],
    );
  }

  /// `View Full Article`
  String get viewFullArticle {
    return Intl.message(
      'View Full Article',
      name: 'viewFullArticle',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
