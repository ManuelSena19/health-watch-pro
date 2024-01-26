import 'package:flutter/material.dart';
import 'package:health_watch_pro/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Watch Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        primaryColor: Colors.lightBlue,
        primarySwatch: Colors.lightBlue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}


