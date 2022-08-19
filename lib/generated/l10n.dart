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

  /// `陳凌 Flutter測試 APP(英)`
  String get title {
    return Intl.message(
      '陳凌 Flutter測試 APP(英)',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `greet~`
  String get greet {
    return Intl.message(
      'greet~',
      name: 'greet',
      desc: '',
      args: [],
    );
  }

  /// `Pick a time`
  String get picktime {
    return Intl.message(
      'Pick a time',
      name: 'picktime',
      desc: '',
      args: [],
    );
  }

  /// `陳凌-學習APP`
  String get app_name {
    return Intl.message(
      '陳凌-學習APP',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `PageOWO`
  String get PageOWO {
    return Intl.message(
      'PageOWO',
      name: 'PageOWO',
      desc: '',
      args: [],
    );
  }

  /// `GoTo%sOWO`
  String get GoTo {
    return Intl.message(
      'GoTo%sOWO',
      name: 'GoTo',
      desc: '',
      args: [],
    );
  }

  /// `NextPage`
  String get NextPage {
    return Intl.message(
      'NextPage',
      name: 'NextPage',
      desc: '',
      args: [],
    );
  }

  /// `GuidePage`
  String get GuidePage {
    return Intl.message(
      'GuidePage',
      name: 'GuidePage',
      desc: '',
      args: [],
    );
  }

  /// `TabPage`
  String get TabPage {
    return Intl.message(
      'TabPage',
      name: 'TabPage',
      desc: '',
      args: [],
    );
  }

  /// `DrawerPage`
  String get DrawerPage {
    return Intl.message(
      'DrawerPage',
      name: 'DrawerPage',
      desc: '',
      args: [],
    );
  }

  /// `StackComponentsPage`
  String get StackComponentsPage {
    return Intl.message(
      'StackComponentsPage',
      name: 'StackComponentsPage',
      desc: '',
      args: [],
    );
  }

  /// `ListPage`
  String get ListPage {
    return Intl.message(
      'ListPage',
      name: 'ListPage',
      desc: '',
      args: [],
    );
  }

  /// `GridElementPage`
  String get GridElementPage {
    return Intl.message(
      'GridElementPage',
      name: 'GridElementPage',
      desc: '',
      args: [],
    );
  }

  /// `TableElementPage`
  String get TableElementPage {
    return Intl.message(
      'TableElementPage',
      name: 'TableElementPage',
      desc: '',
      args: [],
    );
  }

  /// `DynamicGenerationPage`
  String get DynamicGenerationPage {
    return Intl.message(
      'DynamicGenerationPage',
      name: 'DynamicGenerationPage',
      desc: '',
      args: [],
    );
  }

  /// `MixedPage`
  String get MixedPage {
    return Intl.message(
      'MixedPage',
      name: 'MixedPage',
      desc: '',
      args: [],
    );
  }

  /// `TurnBoxPage`
  String get TurnBoxPage {
    return Intl.message(
      'TurnBoxPage',
      name: 'TurnBoxPage',
      desc: '',
      args: [],
    );
  }

  /// `GradientCircularPage`
  String get GradientCircularPage {
    return Intl.message(
      'GradientCircularPage',
      name: 'GradientCircularPage',
      desc: '',
      args: [],
    );
  }

  /// `CustomCheckboxPage`
  String get CustomCheckboxPage {
    return Intl.message(
      'CustomCheckboxPage',
      name: 'CustomCheckboxPage',
      desc: '',
      args: [],
    );
  }

  /// `DoneWidgetTestPage`
  String get DoneWidgetTestPage {
    return Intl.message(
      'DoneWidgetTestPage',
      name: 'DoneWidgetTestPage',
      desc: '',
      args: [],
    );
  }

  /// `WaterMarkPage`
  String get WaterMarkPage {
    return Intl.message(
      'WaterMarkPage',
      name: 'WaterMarkPage',
      desc: '',
      args: [],
    );
  }

  /// `WaterMarkTestPage`
  String get WaterMarkTestPage {
    return Intl.message(
      'WaterMarkTestPage',
      name: 'WaterMarkTestPage',
      desc: '',
      args: [],
    );
  }

  /// `FileOperationRoutePage`
  String get FileOperationRoutePage {
    return Intl.message(
      'FileOperationRoutePage',
      name: 'FileOperationRoutePage',
      desc: '',
      args: [],
    );
  }

  /// `HttpTestRoutePage`
  String get HttpTestRoutePage {
    return Intl.message(
      'HttpTestRoutePage',
      name: 'HttpTestRoutePage',
      desc: '',
      args: [],
    );
  }

  /// `FutureBuilderRouteStatePage`
  String get FutureBuilderRouteStatePage {
    return Intl.message(
      'FutureBuilderRouteStatePage',
      name: 'FutureBuilderRouteStatePage',
      desc: '',
      args: [],
    );
  }

  /// `WithChunksPage`
  String get WithChunksPage {
    return Intl.message(
      'WithChunksPage',
      name: 'WithChunksPage',
      desc: '',
      args: [],
    );
  }

  /// `WebSocketsPage`
  String get WebSocketsPage {
    return Intl.message(
      'WebSocketsPage',
      name: 'WebSocketsPage',
      desc: '',
      args: [],
    );
  }

  /// `SocketRoutePage`
  String get SocketRoutePage {
    return Intl.message(
      'SocketRoutePage',
      name: 'SocketRoutePage',
      desc: '',
      args: [],
    );
  }

  /// `CustomPaintRoutePage`
  String get CustomPaintRoutePage {
    return Intl.message(
      'CustomPaintRoutePage',
      name: 'CustomPaintRoutePage',
      desc: '',
      args: [],
    );
  }

  /// `loginPage`
  String get loginPage {
    return Intl.message(
      'loginPage',
      name: 'loginPage',
      desc: '',
      args: [],
    );
  }

  /// `Pressed%s`
  String get NPressed {
    return Intl.message(
      'Pressed%s',
      name: 'NPressed',
      desc: '',
      args: [],
    );
  }

  /// `Hello %s`
  String get myFormattedString {
    return Intl.message(
      'Hello %s',
      name: 'myFormattedString',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `auto`
  String get auto {
    return Intl.message(
      'auto',
      name: 'auto',
      desc: '',
      args: [],
    );
  }

  /// `userName`
  String get userName {
    return Intl.message(
      'userName',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `userNameRequired`
  String get userNameRequired {
    return Intl.message(
      'userNameRequired',
      name: 'userNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `passwordRequired`
  String get passwordRequired {
    return Intl.message(
      'passwordRequired',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `userNameOrPasswordWrong`
  String get userNameOrPasswordWrong {
    return Intl.message(
      'userNameOrPasswordWrong',
      name: 'userNameOrPasswordWrong',
      desc: '',
      args: [],
    );
  }

  /// `theme`
  String get theme {
    return Intl.message(
      'theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `logout`
  String get logout {
    return Intl.message(
      'logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `logoutTip`
  String get logoutTip {
    return Intl.message(
      'logoutTip',
      name: 'logoutTip',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `noDescription`
  String get noDescription {
    return Intl.message(
      'noDescription',
      name: 'noDescription',
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
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(
          languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
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
