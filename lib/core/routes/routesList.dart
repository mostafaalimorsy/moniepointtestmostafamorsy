// ignore_for_file: constant_identifier_names, unnecessary_null_comparison, file_names, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moniepointtestmostafamorsy/core/routes/app_routes.dart';
import 'package:moniepointtestmostafamorsy/core/utilites/extensions.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/page/mainPage.dart';
import 'package:moniepointtestmostafamorsy/service/app_service.dart';

enum PageRouteAnimation { Fade, Scale, Rotate, Slide, SlideBottomTop }

class RouteManager {
  RouteManager._internal();
  PageRouteAnimation? pageRouteAnimationGlobal;

  static Duration pageRouteTransitionDurationGlobal = 400.milliseconds;
  static Route<dynamic>? getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.initial:
        return buildPageRoute(child: const MainPage(), routeSettings: routeSettings);
    }
    return buildPageRoute(
        child: const Center(
          child: Text("no route found"),
        ),
        routeSettings: routeSettings);
  }

  static Route<T> buildPageRoute<T>({
    required Widget child,
    PageRouteAnimation? pageRouteAnimation,
    Duration? duration,
    RouteSettings? routeSettings,
  }) {
    pageRouteAnimation = pageRouteAnimation ?? PageRouteAnimation.Scale;
    if (pageRouteAnimation != null) {
      if (pageRouteAnimation == PageRouteAnimation.Fade) {
        return PageRouteBuilder(
          settings: routeSettings,
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
          reverseTransitionDuration: const Duration(milliseconds: 50),
          pageBuilder: (context, a1, a2) =>
              Directionality(textDirection: Directionality.of(AppService().getContext), child: child),
          transitionsBuilder: (c, anim, a2, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        );
      } else if (pageRouteAnimation == PageRouteAnimation.Rotate) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, a1, a2) =>
              Directionality(textDirection: Directionality.of(AppService().getContext), child: child),
          transitionsBuilder: (c, anim, a2, child) {
            return RotationTransition(child: child, turns: ReverseAnimation(anim));
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      } else if (pageRouteAnimation == PageRouteAnimation.Scale) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, a1, a2) =>
              Directionality(textDirection: Directionality.of(AppService().getContext), child: child),
          transitionsBuilder: (c, anim, a2, child) {
            return ScaleTransition(child: child, scale: anim);
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      } else if (pageRouteAnimation == PageRouteAnimation.Slide) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, a1, a2) =>
              Directionality(textDirection: Directionality.of(AppService().getContext), child: child),
          transitionsBuilder: (c, anim, a2, child) {
            return SlideTransition(
              child: child,
              position: Tween(
                begin: const Offset(1.0, 0.0),
                end: const Offset(0.0, 0.0),
              ).animate(anim),
            );
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      } else if (pageRouteAnimation == PageRouteAnimation.SlideBottomTop) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, a1, a2) =>
              Directionality(textDirection: Directionality.of(AppService().getContext), child: child),
          transitionsBuilder: (c, anim, a2, child) {
            return SlideTransition(
              child: child,
              position: Tween(
                begin: const Offset(0.0, 1.0),
                end: const Offset(0.0, 0.0),
              ).animate(anim),
            );
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      }
    }
    return MaterialPageRoute<T>(
      builder: (context) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          child: Directionality(textDirection: Directionality.of(AppService().getContext), child: child)),
      settings: routeSettings,
    );
  }
}
