
import '../../../../../core/common/shared/shared_imports.dart'; //

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
