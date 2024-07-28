import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

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
}

//   static Future<T?> pushNamed<T>(
//     final BuildContext context,
//     routeName, {
//     arguments,
//     bool? withNavBar,
//     final PageTransitionAnimation pageTransitionAnimation =
//         PageTransitionAnimation.cupertino,
//     final PageRoute<T>? customPageRoute,
//   }) {
//     withNavBar ??= true;

//     return Navigator.of(context, rootNavigator: !withNavBar)
//         .push<T>(customPageRoute ??
//             getPageRoute(
//               pageTransitionAnimation,
//               enterPage: (RoutesPage.routes[routeName]!)(context),
//               settings: RouteSettings(arguments: arguments),
//             ) as Route<T>);
//   }

//   static Future<T?> pushReplacementNamed<T>(
//     final BuildContext context,
//     routeName, {
//     arguments,
//     bool? withNavBar,
//     final PageTransitionAnimation pageTransitionAnimation =
//         PageTransitionAnimation.cupertino,
//     final PageRoute<T>? customPageRoute,
//   }) {
//     withNavBar ??= true;

//     return Navigator.of(context, rootNavigator: !withNavBar)
//         .pushReplacement(customPageRoute ??
//             getPageRoute(
//               pageTransitionAnimation,
//               enterPage: (RoutesPage.routes[routeName]!)(context),
//               settings: RouteSettings(arguments: arguments),
//             ) as Route<T>);
//   }

//   static Future pushNamedAndRemoveUntil(
//     final BuildContext context,
//     routeName, {
//     bool? withNavBar,
//     arguments,
//     final PageTransitionAnimation pageTransitionAnimation =
//         PageTransitionAnimation.cupertino,
//     final PageRoute? customPageRoute,
//   }) {
//     withNavBar ??= true;
//     return Navigator.of(context, rootNavigator: !withNavBar).pushAndRemoveUntil(
//         customPageRoute ??
//             getPageRoute(
//               pageTransitionAnimation,
//               enterPage: (RoutesPage.routes[routeName]!)(context),
//               settings: RouteSettings(arguments: arguments),
//             ),
//         (route) => false);
//   }
// }
