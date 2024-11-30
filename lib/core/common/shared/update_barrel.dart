import 'dart:io';
import 'package:yaml/yaml.dart';

void main() {
  const projectName = 'elminiawy';
  const barrelFilePath = 'lib/core/common/shared/shared_imports.dart';
  const targetDirectory = 'lib';
  const pubspecPath = 'pubspec.yaml';

  final barrelFile = File(barrelFilePath);
  final dir = Directory(targetDirectory);

  if (!dir.existsSync()) {
    return;
  }

  final pubspecFile = File(pubspecPath);
  if (!pubspecFile.existsSync()) {
    return;
  }

  final pubspecContent = pubspecFile.readAsStringSync();
  final yamlMap = loadYaml(pubspecContent) as Map;

  final dependencies = yamlMap['dependencies'] as Map? ?? {};
  final devDependencies = yamlMap['dev_dependencies'] as Map? ?? {};

  // قائمة المكتبات التي تريد استبعادها
  final excludedPackages = <String>{
    'retrofit',
    'intl',
    'easy_localization',
    'device_preview',
    'freezed',
    'iconly',
    'flutter_slidable',
    'http',
    'another_package_to_exclude',
    'flutter_google_maps_webservices',
    'lottie',
    'badges',
    'flutter_test',
    'flutter_lints',
    'flutter',
    'build_runner',
    'json_serializable',
    'retrofit_generator',
  };

  // إضافة المكتبات الأساسية يدويًا
  final essentialImports = <String>{
    "export 'package:flutter/material.dart';",
    //"export 'package:flutter/cupertino.dart';",
    "export 'package:flutter/services.dart';",
 

    "export 'package:flutter/foundation.dart';",
    "export 'dart:async';",
  };

  // استيرادات المكتبات الخارجية مع استبعاد المكتبات المحددة
  final externalImports = <String>{
    ...dependencies.keys
        .where((dep) => dep != projectName && !excludedPackages.contains(dep))
        .map((dep) {
      return "export 'package:$dep/$dep.dart';";
    }),
    ...devDependencies.keys
        .where((dep) => dep != projectName && !excludedPackages.contains(dep))
        .map((dep) {
      return "export 'package:$dep/$dep.dart';";
    }),
  };

  // استيرادات الملفات المحلية
  final localImports = <String>{
    ...dir
        .listSync(recursive: true)
        .where((entity) =>
            entity is File &&
            entity.path.endsWith('.dart') &&
            !entity.path.contains('.g.dart') &&
            !entity.path.contains('_state.dart') &&
            !entity.path.contains('_event.dart') &&
            !entity.path.contains('main.dart') &&
            !entity.path.contains('.freezed.dart'))
        .map((entity) {
      final relativePath =
          entity.path.replaceAll('\\', '/').replaceFirst('lib/', '');
      return "export 'package:$projectName/$relativePath';";
    }),
  };

  // كتابة المحتوى النهائي
  final content =
      [...essentialImports, ...externalImports, ...localImports].join('\n');
  barrelFile.writeAsStringSync(content);

}
