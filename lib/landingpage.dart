import 'package:flutter/material.dart';
import 'package:mydoctor/homepage.dart';
import 'package:mydoctor/register.dart';
void main() {
  runApp(LandingPage());
}

class LandingPage extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset('images/Login.png', height: 300, width: 400,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("My Doctor", style: TextStyle(fontSize: 30,)),
              Icon(Icons.health_and_safety, size: 40, color: Colors.green,)
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: Colors.cyan,
              height: 50,
              width: 350,
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  icon: Icon(Icons.book, color: Colors.black),
                  hintText: 'username',
                  border: InputBorder.none
                ),
              )
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: Colors.cyanAccent,
              height: 50,
              width: 350,
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock, color: Colors.black),
                  hintText: 'password',
                  border: InputBorder.none
                ),
              )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent, // background
                  onPrimary: Colors.white, // foreground                  
                ),
                onPressed: () { 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text('    Login    '),
              ),              
              Text('          ')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("If you don't have any account please", style: TextStyle(fontSize: 15),),
            Text(''),
            TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blue, // background                 
                ),
                onPressed: () { 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                },
                child: Text('Register'),
              ),     
          ],)
        ],
      ),
    );
  }
}

