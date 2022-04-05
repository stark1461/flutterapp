import 'dart:ui';

import 'package:flutter/material.dart';

class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  final TextEditingController _heightController=TextEditingController();
  final TextEditingController _weightController=TextEditingController();
  double _result=0;
  String _text='';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Height in cm',
                icon: Icon(Icons.accessibility_new_rounded),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Weight in kg',
                icon: Icon(Icons.scale_rounded),
              ),
            ),
            SizedBox(height: 20),
        ElevatedButton(
        onPressed: calculateBMI,
        child: const Text('Calculate'),
        ),
        SizedBox(height: 40),
        Text(
          _result==null?"Enter Value" : "BMI: ${_result.toStringAsFixed(2)}",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        Text(_text,
        style: TextStyle(
          fontSize: 20,
        ),
        ),
  ]
      ),
    ),
    ),
    );
  }
  void calculateBMI(){
    double height=double.parse(_heightController.text)/100;
    double weight=double.parse(_weightController.text);
    double heightSquare=height*height;
    double result=weight/heightSquare;
    if (result>=25){
      _text='Overweight';
    }
    else if (result>18.5){
      _text='Normal';
    }
    else{
      _text='Underweight';
    }
    _result=result;
    setState(() {});
  }
}
