import 'package:flutter/material.dart';
import 'package:mydoctor/landingpage.dart';

class HomePage extends StatefulWidget{
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
      children: [
        ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan, // background
                  onPrimary: Colors.white, // foreground                  
                ),
                onPressed: () { 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
                },
                child: Text('Back'),
              ),
        Image.asset('images/doctor.gif')
      ],
      )
    );
  }
}