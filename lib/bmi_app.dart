import 'package:bmi/bmi_theme.dart';
import 'package:bmi/screens/bmi_screen.dart';
import 'package:bmi/models/app_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<AppStateManager>(
        builder: (context, appStateManager, child) {
      ThemeMode themeMode;
      switch (appStateManager.isLightTheme) {
        case AppThemeState.light:
          themeMode = ThemeMode.light;
          break;
        case AppThemeState.dark:
          themeMode = ThemeMode.dark;
          break;
        case AppThemeState.system:
          themeMode = ThemeMode.system;
          break;
      }

      return MaterialApp(
        title: 'BMI App',
        debugShowCheckedModeBanner: false,
        theme: BMITheme.light(),
        darkTheme: BMITheme.dark(),
        themeMode: themeMode,
        home: const BMI(),
      );
    });
  }
}
