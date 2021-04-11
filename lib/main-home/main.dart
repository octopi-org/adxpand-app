import 'package:flutter/material.dart';
import 'package:applify/login/login.dart';
import 'package:applify/home.dart';

void main() {
  runApp(
      new MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue[900],
        ),
        home: Login(),
        debugShowCheckedModeBanner: false,
      ));

}