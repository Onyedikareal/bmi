import 'package:bmi/bmi_theme.dart';
import 'package:bmi/ui/bmi.dart';
import 'package:bmi/util/cache.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  final SharedPreferences prefs;
  MyApp({super.key, required this.prefs});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  late final AppCache _appCache;
  @override
  void initState() {
    super.initState();
    _appCache = AppCache(prefs: widget.prefs);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme;

    if (_appCache.getCachedAppThemeState()) {
      theme = BMITheme.light();
    } else {
      theme = BMITheme.dark();
    }
    return MaterialApp(
      title: 'BMI App',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const BMI(),
    );
  }
}
