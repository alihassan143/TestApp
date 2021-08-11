import 'package:flutter/material.dart';
import 'package:testapp/constants.dart';

class Welcome extends StatefulWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: black,
      body: Center(child: Text("Welocme",style: TextStyle(color: white,fontSize: 35),),),
    );
  }
}