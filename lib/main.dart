import 'package:flutter/material.dart';
import 'package:tezhealthcare/Auth/Main_Login_page.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Constant/Mediaquery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tez Health Care',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Primary),
        useMaterial3: true,
      ),
      home: MainLoginPage(),
    );
  }
}
