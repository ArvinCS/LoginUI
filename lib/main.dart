import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login UI',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'Login UI'),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DateTime currenttime = DateTime.now();

  int period = 0;
  @override
  Widget build(BuildContext context) {
    // Get type of Time (Morning,Evening,Night) //
    if(currenttime.hour <= 12){
      period = 1;
    } else if (currenttime.hour < 18) {
      period = 2;
    } else {
      period = 3;
    }
    // Set variable for wallpaper //
    String wall;
    String greeting;
    Random random = new Random();
    if(period == 1) {
      wall = "assets/image/morning.jpg";
      greeting = "Good Morning";
    } else if (period == 2){
      wall = "assets/image/evening-"+random.nextInt(5).toString()+".jpg";
      greeting = "Good Evening";
    } else {
      wall = "assets/image/night-"+random.nextInt(5).toString()+".jpg";
      greeting = "Good Night";
    }
    return Scaffold(
      //appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title),
      //),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage(wall), 
              fit: BoxFit.cover)
            ),
          ),
          new Column(children: <Widget>[
              // Text //
              Text(
                greeting,
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                style: TextStyle(fontFamily: 'Gotham', fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
              ),
              // Text //
              Text(
                'Please login to continue to the app',
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                style: TextStyle(fontFamily: 'Gotham', fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white70),
              ),
              // Text Field //
              new Container(
                width: 320,
                child: TextField(
                  style: TextStyle(fontFamily: 'Gotham', fontSize: 18, color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(fontFamily: 'Gotham', fontSize: 20, color: Colors.white),
                    suffixIcon: new Padding(
                      padding: const EdgeInsetsDirectional.only(top: 5.0, bottom: 5.0),
                      child: new Icon(Icons.email, color: Colors.white),
                    ),
                  ),
                ),
              ),
              new Container(
                width: 320,
                child: TextField(
                  style: TextStyle(fontFamily: 'Gotham', fontSize: 18, color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(fontFamily: 'Gotham', fontSize: 20, color: Colors.white),
                    suffixIcon: new Padding(
                      padding: const EdgeInsetsDirectional.only(top: 5.0, bottom: 5.0),
                      child: new Icon(Icons.vpn_key, color: Colors.white),
                    ),
                  ),
                ),
              ),
              // Button //
              new Row(children: <Widget>[
                  RaisedButton(
                    child: const Text('Sign In'),
                    color: Colors.transparent,
                    textColor: Colors.white,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                    onPressed: (){
                      
                    },
                  ),
                  RaisedButton(
                    child: const Text('Sign Up'),
                    color: Colors.transparent,
                    textColor: Colors.white,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                    onPressed: (){
                      
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly
              ),
              // Forgot Password //
              Text(
                'Forgot password?',
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                style: TextStyle(fontFamily: 'Gotham', fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white54),
              ),
            ],
            mainAxisSize: MainAxisSize.min,
          )
        ],
      ),
    );
  }
}
