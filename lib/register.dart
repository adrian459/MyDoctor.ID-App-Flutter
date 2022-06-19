import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mydoctor/homepage.dart';
import 'package:mydoctor/landingpage.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:age_calculator/age_calculator.dart';
import 'package:mydoctor/splashscreen.dart';
class Register extends StatelessWidget{
  @override
  Widget build(BuildContext context){
     return MaterialApp(
        title: "Test App",
        home: __Register(),
    );
  }
}
class __Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Register();
  }
}
class _Register extends State<__Register>{
  //TextEditingController dateinput = TextEditingController(); 
  //text editing controller for text field
  final controllerName = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  final controllerAddress = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  late DateDuration duration;

  Future signUp() async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: controllerEmail.text.trim(), 
        password: controllerPassword.text.trim()
      );
    }on FirebaseAuthException catch (e){
      print(e);
    }
  }
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Image.asset('images/knight.gif'),
              ),
              Text('Sign Up', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              Text(""),
              ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                color: Colors.white,
                height: 50,
                width: 350,
                child: TextField(
                  controller: controllerName,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    icon: Icon(Icons.man_sharp, color: Colors.black),
                    hintText: 'name',
                  ),
                )
              ),
            ),
            Text(""),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                color: Colors.white,
                height: 50,
                width: 350,
                child: TextField(
                  //editing controller of this TextField
                  controller: dateinput,
                  decoration: InputDecoration( 
                    icon: Icon(Icons.calendar_today),
                    hintText: 'birthdate' //icon of text field //label text of field
                  ),
                  readOnly: true,  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101),
                    );
                    duration = AgeCalculator.age(pickedDate!);                
                    
                    if(pickedDate != null ){
                      //print(pickedDate);
                      DateFormat formatter = DateFormat('yyyy-MM-dd');
                      String formatted = formatter.format(pickedDate); 
                      print('Your age is $duration');
                      //print(formatted.runtimeType);
                      //print(duration.toString().runtimeType);
                      setState(() {
                        dateinput.text = formatted; //set output date to TextField value. 
                      });
                    }else{
                      print("Date is not selected");
                    }
                  }
                ),
              ),
            ),
            Text(""),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                color: Colors.white,
                height: 50,
                width: 350,
                child: TextField(
                  controller: controllerAddress,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    icon: Icon(Icons.house, color: Colors.black),
                    hintText: 'address',
                  ),
                )
              ),
            ),
            Text(""),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                color: Colors.white,
                height: 50,
                width: 350,
                child: TextField(
                  controller: controllerEmail,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    icon: Icon(Icons.mail,color: Colors.black),
                    hintText: 'email',
                  ),
                )
              ),
            ),
            Text(""),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                color: Colors.white,
                height: 50,
                width: 350,
                child: TextField(
                  controller: controllerPassword,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock, color: Colors.black),
                    hintText: 'password',
                  ),
                )
              ),
            ),
            Text(" "),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple, // background
                    onPrimary: Colors.white, // foreground                  
                  ),
                  onPressed: () {
                    
                    //createPatient(controllerName.text, dateinput.text, duration.toString(), controllerAddress.text, controllerEmail.text, controllerPassword.text); 
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
                  },
                  child: Text('      Back     '),
              ),
              Text(" "),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // background
                  onPrimary: Colors.white, // foreground                  
                ),
                onPressed: () {
                  
                  createPatient(controllerName.text, dateinput.text, duration.toString(), controllerAddress.text, controllerEmail.text, controllerPassword.text); 
                  signUp();
                  //child: Text('Registration Suceed');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen2()));
                },
                child: Text('     SignUp     '),
              ),
              Text("     ")
              ],
            ),
              
          ],
        )
      ),
    )
    );
  }
  Future createPatient(String name, String birthdate, String age, String address, String email, String password) async{
    final docPatient = FirebaseFirestore.instance.collection('patient').doc();
    //patient.id = docPatient.id;
    final patient = {
      'id': docPatient.id,
      'name': name,
      'birthdate': birthdate,
      'age': age,
      'address': address,
      'email': email,
      'password': password
    };
    //final json = patient.toJson();
    await docPatient.set(patient);
  }
}

