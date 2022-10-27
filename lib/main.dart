import 'package:bmi/models/app_state_manager.dart';
import 'package:bmi/screens/bmi_screen.dart';
import 'package:bmi/bmi_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  runApp( ChangeNotifierProvider(
    create: (context) => AppStateManager(),
    child: MyApp(),
  ));
}
