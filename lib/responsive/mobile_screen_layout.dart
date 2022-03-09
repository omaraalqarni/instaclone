// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
        child:Text("This is mobile screen layout"),
      ),
    );
  }
}