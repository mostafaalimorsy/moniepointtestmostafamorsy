// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:singleton/singleton.dart';

class AppService {
  factory AppService() => Singleton.lazy(() => AppService._());

  /// Private constructor
  AppService._() {}

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  get getContext => navigatorKey.currentState?.context;
  NavigatorState? get getCurrentState => navigatorKey.currentState;
  // AppLocalizations get lang =>
  //     Localizations.of<AppLocalizations>(navigatorKey.currentState!.context, AppLocalizations)!;
}
