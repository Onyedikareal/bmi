import 'package:bmi/models/app_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  BMIState createState() => BMIState();
}

class BMIData {
  double _height = 0.0;
  double _weight = 0.0;
}

class BMIState extends State<BMI> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  double? _result;
  String _status = '';
  late AppThemeState isLightTheme;
  late bool lightMode;
  BMIData data = BMIData();

 

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
    isLightTheme = Provider.of<AppStateManager>(context).isLightTheme;

   
    switch (isLightTheme) {
      case AppThemeState.light:
        lightMode = true;
        break;
      case AppThemeState.dark:
        lightMode = false;
        break;
      case AppThemeState.system:
        lightMode =
            MediaQuery.of(context).platformBrightness == Brightness.light;
        break;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 1.4,
        title: Text(
          'BMI',
          style: theme.primaryTextTheme.headline2,
        ),
        backgroundColor: theme.appBarTheme.backgroundColor,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                changeThemePopup(
                    context: context,
                    primaryTextTheme: theme.primaryTextTheme,
                    isLightTheme: isLightTheme);
              },
              padding: const EdgeInsets.only(right: 16.0),
              icon: lightMode
                  ? Icon(
                      Icons.dark_mode_outlined,
                      color: theme.iconTheme.color,
                    )
                  : Icon(
                      Icons.light_mode_outlined,
                      color: theme.iconTheme.color,
                    ))
        ],
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: SizedBox(
                  width: 130,
                  height: 90,
                  child: Image.asset('images/bmilogo.png'),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                ),
                height: 280,
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        labelStyle: theme.primaryTextTheme.bodyText1,
                        isDense: false,
                        contentPadding: EdgeInsets.only(bottom: 10),
                        icon: Icon(
                          Icons.person_outline,
                          color: theme.iconTheme.color,
                        ),
                      ),
                    ),
                    TextField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Height in centimeters',
                        labelStyle: theme.primaryTextTheme.bodyText1,
                        contentPadding: EdgeInsets.only(bottom: 10),
                        icon: Icon(Icons.assessment,
                            color: theme.iconTheme.color),
                      ),
                    ),
                    TextField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Weight in Kilograms',
                        labelStyle: theme.primaryTextTheme.bodyText1,
                        contentPadding: const EdgeInsets.only(bottom: 10),
                        icon: Icon(Icons.dehaze, color: theme.iconTheme.color),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _calculate,
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(2),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context)
                                  .buttonTheme
                                  .colorScheme!
                                  .background)),
                      child: const Text('Calculate'),
                    )
                  ],
                ),
              ),
              Text(
                _result == null
                    ? ''
                    : 'Your BMI: ${_result!.toStringAsFixed(1)}',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                    color: Colors.blue,
                    fontStyle: FontStyle.italic),
              ),
              Text(
                _result == null ? '' : _status,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Colors.redAccent),
              )
            ],
          ),
        ),
      ),
    );
  }

    void _calculate() {
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      data._height = double.parse(heightController.text) / 100;
      data._weight = double.parse(weightController.text);
      _result = (data._weight / (pow((data._height), 2)));
      if (_result! < 18.5) {
        _status = 'Underweight';
      } else if (_result! < 24.9) {
        _status = 'Normal weight';
      } else if (_result! < 29.9) {
        _status = 'Overweight';
      } else {
        _status = 'Obesity';
      }
    });
  }

  changeThemePopup(
      {required BuildContext context,
      required TextTheme primaryTextTheme,
      required AppThemeState isLightTheme}) async {

    return await showDialog(
        context: context,
        builder: (context) {
          AppThemeState isLight = isLightTheme;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              contentPadding: const EdgeInsets.all(16.0),
              title: Text("Choose theme", style: primaryTextTheme.headline2),
              content: SizedBox(
                height: 180,
                child: Column(
                  children: [
                    RadioListTile(
                        value: isLight == AppThemeState.system,
                        groupValue: true,
                        title: Text(
                          'System default',
                          style: primaryTextTheme.bodyText1,
                        ),
                        onChanged: (bool? change) {
                          setState(() {
                            isLight = AppThemeState.system;
                          });
                        }),
                    RadioListTile(
                        value: isLight == AppThemeState.light,
                        groupValue: true,
                        title: Text(
                          'Light mode',
                          style: primaryTextTheme.bodyText1,
                        ),
                        onChanged: (bool? change) {
                          setState(() {
                            isLight = AppThemeState.light;
                          });
                        }),
                    RadioListTile(
                        value: isLight == AppThemeState.dark,
                        title: Text(
                          'Dark mode',
                          style: primaryTextTheme.bodyText1,
                        ),
                        groupValue: true,
                        onChanged: (bool? change) {
                          setState(() {
                            isLight = AppThemeState.dark;
                          });
                        })
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Provider.of<AppStateManager>(context, listen: false)
                          .setAppThemeState = isLight;
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Ok',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            );
          });
        });
  }
}
