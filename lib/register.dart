import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mydoctor/landingpage.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:age_calculator/age_calculator.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Register());
}

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
              Image.asset('images/doctor.gif', height: 300, width: 600,),
              Text('Sign Up', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              Text(""),
              ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                color: Colors.white,
                height: 50,
                width: 350,
                child: TextField(
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
                    print(pickedDate);
                    DateDuration duration;
                    duration = AgeCalculator.age(pickedDate!);
                    DateFormat formatter = DateFormat('yyyy-MM-dd');
                    String formatted = formatter.format(pickedDate); 
                    print('Your age is $duration');
                    //print(formatted.runtimeType);
                    print(duration.toString().runtimeType);               
                    // if(pickedDate != null ){
                    //     //print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                    //     String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                    //     print(formattedDate); //formatted date output using intl package =>  2021-03-16
                    //       //you can implement different kind of Date Format here according to your requirement

                    //     setState(() {
                    //       dateinput.text = formattedDate; //set output date to TextField value. 
                    //     });
                    // }else{
                    //   print("Date is not selected");
                    // }
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
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock, color: Colors.black),
                    hintText: 'password',
                  ),
                )
              ),
            ),
            Text(""),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent, // background
                  onPrimary: Colors.white, // foreground                  
                ),
                onPressed: () { 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
                },
                child: Text('     Login     '),
           ),
              
          ],
        )
      ),
    )
    );
  }
}