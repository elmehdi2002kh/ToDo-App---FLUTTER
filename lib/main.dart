import 'package:first_app_1/pages/todo.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main()  async {
 await Hive.initFlutter();
 var box = await Hive.openBox('mon box');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Todo(),
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.red)),
     
      ) ;

  }
}