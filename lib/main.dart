import 'package:flutter/material.dart';
import 'package:islami_app/home/home_scree.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routrName: (context) => const HomeScreen()},
      initialRoute: HomeScreen.routrName,
    );
  }
}
