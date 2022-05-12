import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculater/constants/color_constants.dart';
import 'package:bmi_calculater/widgets/lef_bar.dart';
import 'package:bmi_calculater/widgets/right_bar.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double _bmi = 0;
  String _result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculater",
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w300)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8)
                      )
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8)
                        )
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);

                setState(() {
                  _bmi = _w / (_h * _h);
                  if(_bmi > 25){
                    _result = "you\'r over weight";
                  }else if (_bmi >= 18.5 && _bmi <= 25){
                    _result = "you have normal weight";
                  } else {
                    _result = "you\'r under weight";
                  }
                });
              },
              child: Container(
                child: Text("Calculate" , style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold, color: accentHexColor
                ),),
              ),
            ),
            const SizedBox(height: 50,),
            Text(_bmi.toStringAsFixed(2) , style: TextStyle(
                fontSize: 90, fontWeight: FontWeight.bold, color: accentHexColor
            ),),
            const SizedBox(height: 30,),
            Visibility(
                visible: _result.isNotEmpty,
                child: Container(
                  child: Text(_result , style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w300, color: accentHexColor
                  ),),
                )
            ),

            const SizedBox(height: 30,),
            const LeftBar(barWidth: 30),
            const SizedBox(height: 20,),
            const LeftBar(barWidth: 90),
            const SizedBox(height: 20,),
            const LeftBar(barWidth: 40),

            const SizedBox(height: 30,),
            const RightBar(barWidth: 30),
            const SizedBox(height: 20,),
            const RightBar(barWidth: 90),
            const SizedBox(height: 20,),
            const RightBar(barWidth: 40),
          ],
        ),
      ),
    );
  }
}
