import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mydoctor/landingpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget{
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    final user = FirebaseAuth.instance.currentUser!;
    String name = user.email!;
    return Scaffold(
      body: Column(
      children: [
        ClipPath(
          clipper: MyClipper(),        
          child: Container(
            padding: EdgeInsets.only(left: 40, top:50, right: 20),
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF3383CD),
                  Color(0XFF11249F)
                ]
              ),
              image: DecorationImage(
                image: AssetImage('images/virus.png') 
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(' My Doctor', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.yellow),),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Stack(
                    children: [
                      SvgPicture.asset('images/Drcorona.svg', width: 245, fit: BoxFit.fitWidth, alignment: Alignment.topCenter,),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Text('Welcome Back \n$name', style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),)
                      )
                    ],
                  )
                )
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("  "),
                Text('Make Appointment', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.blue),),
                Icon(Icons.bookmark, color: Colors.amberAccent,)
              ],  
            ),
            Text(' '),
            Container(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Text('   '),
                  Container(
                    width: 270,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: Offset(9,9)
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset('images/drDana.jpeg', width: 100,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(' '),
                            Text('dr.Dana Pramodya.SpPD', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Spesialis Penyakit Dalam           ', style: TextStyle(fontSize: 11),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.location_pin, color: Colors.red,),
                                Text('RS Internasional Surabaya          ', style: TextStyle(fontSize: 10),),

                              ],
                            ),
                            ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.cyan, // background
                              onPrimary: Colors.white, // foreground                  
                            ),
                            onPressed: () {},
                            child: Text('Daftar')
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text('   '),
                  Container(
                    width: 270,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(9,9)
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset('images/drgOlivia.jpg', width: 100,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(' '),
                            Text('drg.Olivia Paramitha', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Spesialis Gigi dan Gusi   ', style: TextStyle(fontSize: 11),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.location_pin, color: Colors.red,),
                                Text('RS Internasional Surabaya          ', style: TextStyle(fontSize: 10),),

                              ],
                            ),
                            ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.cyan, // background
                              onPrimary: Colors.white, // foreground                  
                            ),
                            onPressed: () {},
                            child: Text('Daftar')
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text('   '),
                  Container(
                    width: 270,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(9,9)
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset('images/drDana.jpeg', width: 100,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(' '),
                            Text('dr.Dana Pramodya.SpPD', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Spesialis Penyakit Dalam                 ', style: TextStyle(fontSize: 10),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.location_pin, color: Colors.red,),
                                Text('RS Internasional Surabaya          ', style: TextStyle(fontSize: 10),),

                              ],
                            ),
                            ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.cyan, // background
                              onPrimary: Colors.white, // foreground                  
                            ),
                            onPressed: () {},
                            child: Text('Daftar')
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text('   '),
                  Container(
                    width: 270,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(9,9)
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset('images/drDana.jpeg', width: 100,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(' '),
                            Text('dr.Dana Pramodya.SpPD', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Spesialis Penyakit Dalam                 ', style: TextStyle(fontSize: 10),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.location_pin, color: Colors.red,),
                                Text('RS Internasional Surabaya          ', style: TextStyle(fontSize: 10),),

                              ],
                            ),
                            ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.cyan, // background
                              onPrimary: Colors.white, // foreground                  
                            ),
                            onPressed: () {},
                            child: Text('Daftar')
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),                        
                  Text('   '),
                ],
              ),
            ),
            Text(" "),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan, // background
                onPrimary: Colors.white, // foreground                  
              ),
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: Text('Back'),
            ),
          ],
        ),
        
      ],
      )
    );
  }
}
class MyClipper extends CustomClipper<Path>{
  @override 
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;    
  }
  @override 
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return false;
  }
}