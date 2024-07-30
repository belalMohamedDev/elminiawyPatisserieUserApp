import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../routing/route_manger.dart';

class NavBarNavigator {
  static Future<T?> push<T>(
    final BuildContext context, {
    required final Widget screen,
    arguments,
    bool? withNavBar,
    final PageTransitionAnimation pageTransitionAnimation =
        PageTransitionAnimation.cupertino,
    final PageRoute<T>? customPageRoute,
  }) {
    withNavBar ??= true;

    return Navigator.of(context, rootNavigator: !withNavBar).push<T>(
        customPageRoute ??
            (getPageRoute(pageTransitionAnimation,
                enterPage: screen,
                settings: RouteSettings(arguments: arguments)) as Route<T>));
  }

  static Future<T?> pushNamed<T>(
    final BuildContext context,
    routeName, {
    arguments,
    bool? withNavBar,
    final PageTransitionAnimation pageTransitionAnimation =
        PageTransitionAnimation.cupertino,
    final PageRoute<T>? customPageRoute,
  }) {
    withNavBar ??= true;

    return Navigator.of(context, rootNavigator: !withNavBar)
        .push<T>(customPageRoute ??
            getPageRoute(
              pageTransitionAnimation,
              enterPage: RouteGenerator.getRoute(
                RouteSettings(name: routeName, arguments: arguments),
              ) as Widget,
              settings: RouteSettings(arguments: arguments),
            ) as Route<T>);
  }

  static Future<T?> pushReplacementNamed<T>(
    final BuildContext context,
    routeName, {
    arguments,
    bool? withNavBar,
    final PageTransitionAnimation pageTransitionAnimation =
        PageTransitionAnimation.cupertino,
    final PageRoute<T>? customPageRoute,
  }) {
    withNavBar ??= true;

    return Navigator.of(context, rootNavigator: !withNavBar)
        .pushReplacement(customPageRoute ??
            getPageRoute(
              pageTransitionAnimation,
              enterPage: RouteGenerator.getRoute(
                RouteSettings(name: routeName, arguments: arguments),
              ) as Widget,
              settings: RouteSettings(arguments: arguments),
            ) as Route<T>);
  }

  static Future pushNamedAndRemoveUntil(
    final BuildContext context,
    routeName, {
    bool? withNavBar,
    arguments,
  }) {
    withNavBar ??= true;
    return Navigator.of(context, rootNavigator: !withNavBar)
        .pushNamedAndRemoveUntil(routeName, (Route route) => false);
  }
}
