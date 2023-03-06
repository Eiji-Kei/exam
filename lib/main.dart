// ignore_for_file: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:exam/screens/start.dart';
import 'package:flutter/material.dart';

// com.example.exam
// 72:6E:C1:1C:FD:DF:BD:E3:E9:6C:FC:40:D8:EE:EF:EE:59:B0:5F:7D

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRAVELLER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Start(key: UniqueKey()),
    );
  }
}


      