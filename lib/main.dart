import 'package:flutter/material.dart';

import './pages/loginPage.dart';
import './pages/registerPage.dart';
import './pages/mainPage.dart';
import './pages/incomingCallPage.dart';
import './pages/ongoingCallPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.routeName,
      theme: ThemeData(
        fontFamily: 'Solway',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 24, color: Colors.blue),
          title: TextStyle(fontSize: 20, color: Colors.blue),
          body1: TextStyle(fontSize: 12),
          body2: TextStyle(fontSize: 12),
          button: TextStyle(fontSize: 12, color:Colors.blue),
        ),
      ),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        MainPage.routeName: (context) => MainPage(),
        RegisterPage.routeName: (context) => RegisterPage(),
        IncomingCall.routeName: (context) => IncomingCall(),
        OngoingCall.routeName: (context) => OngoingCall(),
      },
    );
  }
}