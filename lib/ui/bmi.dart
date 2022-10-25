import 'package:flutter/material.dart';
import 'dart:math';


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
  String _status ='';
  BMIData data = BMIData();
  heightData(value){
    data._height =  value;
  }


  void _calculate(){
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      data._height = double.parse(heightController.text)/100;
      data._weight = double.parse(weightController.text);
      _result = (data._weight/(pow((data._height), 2)));
      if(_result! <18.5){
        _status = 'Underweight' ;
      }else if(_result! < 24.9){
        _status = 'Normal weight';
      } else if (_result! < 29.9){
        _status = 'Overweight';
      }else{
        _status = 'Obesity';
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('BMI'),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
          onTap: (){
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
                  margin:const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                  height: 280,
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     const TextField(
                        decoration: InputDecoration(labelText: 'Age',isDense: false, contentPadding: EdgeInsets.only( bottom: 10),
                            icon: Icon(Icons.person_outline),),


                      ),
                      TextField(
                        controller: heightController,
                        decoration: const InputDecoration(labelText: 'Height in centimeters',contentPadding: EdgeInsets.only( bottom: 10),
                          icon: Icon(Icons.assessment),),



                      ),
                      TextField(
                        controller: weightController,
                        decoration:const InputDecoration(labelText: 'Weight in Kilograms',contentPadding: EdgeInsets.only( bottom: 10),
                          icon: Icon(Icons.dehaze),),

                      ),
                      
                      ElevatedButton(
                        onPressed: _calculate,
                        style: ButtonStyle(elevation: MaterialStateProperty.all(2), backgroundColor: MaterialStateProperty.all(Colors.red)),
                       
                        child:const Text('Calculate'),


                      )
                    ],
                  ),
                ),
                Text(_result == null? '':'Your BMI: ${_result!.toStringAsFixed(1)}', style:const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  color: Colors.blue,
                  fontStyle: FontStyle.italic
                ),),
                Text(_result == null? '':_status, style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Colors.redAccent
                ),)
              ],
            ),
          ),
        ),
    );
  }
}
