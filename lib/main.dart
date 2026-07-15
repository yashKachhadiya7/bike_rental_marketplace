import 'package:flutter/material.dart';


import 'app.dart';
import 'core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();

  runApp(
    const MyApp(),
  );
}
