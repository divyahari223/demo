import 'dart:async';

import'package:flutter/material.dart';
import 'package:pattom_cafe/onboarding/onboarding.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate to the main screen after 3 seconds
    Timer(Duration(seconds: 3), () {
       Navigator.of(context).pushReplacement(MaterialPageRoute(
         builder: (context) => onboarding(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height*1,
        width: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/splash3.jpg'),fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 600),
          child: Center(child: Text("Friuts And Vegetable Shop",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),
        ),
        ),
    );
  }
}
