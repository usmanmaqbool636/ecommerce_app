// import 'package:ecommerce_app/screens/bottom_bar.dart';
import 'package:ecommerce_app/screens/bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecomerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomBar(),
    );
  }
}
