import 'package:bmi/ui/bmi.dart';
import 'package:bmi/bmi_app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences prefs =await SharedPreferences.getInstance();
  runApp( MyApp(prefs:prefs));
}
