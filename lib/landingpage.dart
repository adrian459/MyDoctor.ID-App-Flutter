

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mydoctor/homepage.dart';
import 'package:mydoctor/register.dart';
import 'package:mydoctor/splashscreen.dart';

import 'main.dart';
// void main() {
//   runApp(LandingPage());
// }

class LandingPage extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  get context => null;
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
  }
  Future signIn() async{
    // //var context;
    // showDialog(
    //   //context: context, 
    //   barrierDismissible: false,
    //   builder: (context) => Center(child: CircularProgressIndicator(),)
    // );
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim()
      );
    } on FirebaseAuthException catch (e){
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen2()));
  }
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
                controller: emailController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  icon: Icon(Icons.mail, color: Colors.black),
                  hintText: 'email',
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
                controller: passwordController,
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
                onPressed: signIn,
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

