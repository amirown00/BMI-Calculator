// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_local_variable, unused_field, prefer_final_fields, unnecessary_brace_in_string_interps

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

//implicit declaration using var (data type not specified)
//var a = 170 -> a will be implied as integer
//var a = 170.0 -> a will be implied as a double

//Implicit declaration using the data type - string, double, int, list, map, boolean
  
  var _heightSliderValue = 170.0;
  double _weightSliderValue = 30.0;
  var _message = "";
  var _bmi = 0;
  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      
      appBar: AppBar(backgroundColor: Colors.redAccent,
      title: Center(child: Text("BMI CALCULATOR", style: GoogleFonts.ubuntu(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),)),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Text("BMI CALCULATOR", style: GoogleFonts.ubuntu(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.redAccent),),
                SizedBox(height: 10,),
                Text("We care about your health", style: GoogleFonts.ubuntu(fontSize: 20, fontWeight: FontWeight.w400),),
                SizedBox(height: 10,),
                Image.asset("assets/bmi.png"),
                SizedBox(height: 10,),
                Text("Height: ${_heightSliderValue.round().toString()} cm", style: GoogleFonts.ubuntu(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Slider(
                  value: _heightSliderValue,
                  max: 250,
                  min: 100,
                  label: _heightSliderValue.round().toString(),
                  onChanged: (double value) {
                  setState(() {
                  _heightSliderValue = value;
                  });
                }),
                SizedBox(height: 10,),
                Text("Weight: ${_weightSliderValue.round().toString()} kg", style: GoogleFonts.ubuntu(fontSize: 20, fontWeight: FontWeight.bold)),
                Slider(
                  value: _weightSliderValue,
                  max: 300,
                  min: 30,
                  label: _weightSliderValue.round().toString(),
                  onChanged: (double value) {
                  setState(() {
                  _weightSliderValue = value;
                  });
                }),
                SizedBox(height: 10,),
                Text("Your BMI is ${_bmi}, you are ${_message}", style: GoogleFonts.ubuntu(fontSize: 20, fontWeight: FontWeight.w500),),
                SizedBox(height: 10,),
                TextButton.icon(onPressed: (){
                  var bmiTemp = _weightSliderValue.round() / pow((_heightSliderValue.round()/100),2);
                  var messageTemp = "";
                  
                  if (bmiTemp < 18){
                    messageTemp = "You are underweight";
                  }
                  else if(bmiTemp < 25){
                    messageTemp = "You are normal";
                  }
                  else if (bmiTemp < 30){
                    messageTemp = "You are overweight";
                  }
                  else{
                    messageTemp = "You are obese";
                  }
                  print("the bmi is ${bmiTemp.round()}");
                  print(messageTemp);
                  // _bmi = bmiTemp; //normal programmign
                  
                  setState(() {
                    _bmi = bmiTemp.round();
                    _message = messageTemp;
                  });

                }, icon: Icon(Icons.favorite, color: Colors.redAccent,), label: Text("Calculate BMI", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.redAccent) ))
        
        
              ],
            )),
        ),
      ),
      
      

    );
  }
}