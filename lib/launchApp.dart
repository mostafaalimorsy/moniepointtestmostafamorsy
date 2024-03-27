// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:moniepointtestmostafamorsy/core/routes/routesList.dart';
import 'package:moniepointtestmostafamorsy/core/style/theme.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/page/mainPage.dart';
import 'package:moniepointtestmostafamorsy/service/app_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppService().navigatorKey,
      onGenerateRoute: RouteManager.getRoute,
      title: 'Mostafa Morsy - task',
      theme: lightTheme(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
