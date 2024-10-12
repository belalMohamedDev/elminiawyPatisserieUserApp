import '../../../../../core/common/shared/shared_imports.dart'; //

extension ContextExt on BuildContext {
  //Language
  String translate(String langkey) {
    return AppLocalizations.of(this)!.translate(langkey).toString();
  }

  //Navigation
  Future<dynamic> pushNamed(String routeName,
      {Object? arguments, rootNavigator = !false}) {
    return Navigator.of(this, rootNavigator: rootNavigator)
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName,
      {Object? arguments, rootNavigator = !false}) {
    return Navigator.of(this, rootNavigator: rootNavigator)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, rootNavigator = !false}) {
    return Navigator.of(this, rootNavigator: rootNavigator)
        .pushNamedAndRemoveUntil(routeName, (route) => false,
            arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
