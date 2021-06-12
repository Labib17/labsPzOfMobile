import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 0, 0, 230);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget1()
        ),
      ),
    );
  }
}

class MyWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column (
          children: <Widget>[ 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 90.0),
                  child: Text("Start a Meeting", 
                     style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold)))
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("\n Start or join a video meeting on the go", 
                     style: TextStyle(fontSize: 15))
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(50),
                  padding: EdgeInsets.all(50),
                  color: Colors.pink,
                  child: Text("Image", 
                     style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)))
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Text("                  Join a Meeting                  ", 
                     style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                  
                  decoration: BoxDecoration(
                    color: darkBlue,
                    borderRadius: BorderRadius.circular(10))   )                 
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(30),
                  child: Text("Sign Up            Sign In", 
                     style: TextStyle(fontSize: 20, color: darkBlue, fontWeight: FontWeight.bold)))
              ]
            ),
          ]
        )        
      );
  }
}
