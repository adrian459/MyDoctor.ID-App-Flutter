import 'dart:async';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mydoctor/landingpage.dart';
import 'package:mydoctor/main.dart';

class SplashScreen extends StatefulWidget{
  _SplashScreen createState() => _SplashScreen();
}
class _SplashScreen extends State<SplashScreen>{
  void initState(){
    super.initState();
    splashscreenStart();
  }
  splashscreenStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){  
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LandingPage()));
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/splash.png', height: 300, width: 300,),
            Text("MyDoctor", style: TextStyle(fontSize: 35, color: Colors.purpleAccent),),
          ]
        ),
      ),
    );
  }
}