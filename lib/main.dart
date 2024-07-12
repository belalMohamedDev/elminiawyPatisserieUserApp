import 'package:elminiawy/app.dart';
import 'package:flutter/material.dart';

import 'core/application/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initAppModule();
  runApp(MyApp());
}
