import 'package:epsi_chat/page/register_page.dart';
import 'package:flutter/material.dart';

import 'Home_Page.dart';
import 'LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context)=> RegisterPage(),
        '/login':(BuildContext context)=> LoginPage(),
        '/home_page':(BuildContext context)=> Home_Page(),
      }
    );
  }
}





