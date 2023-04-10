import 'package:flutter/material.dart';
import 'package:todo_apps/home_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.red,
        appBarTheme: const AppBarTheme(
          elevation: 0,

        )
      ),
      debugShowCheckedModeBanner: false,
      home:  const HomePage(),
    );
  }
}