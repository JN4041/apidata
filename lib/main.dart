import 'dart:async';

import 'package:api/view/Home1_page.dart';
import 'package:api/view/Home_page.dart';
import 'package:api/view/Post/view/Home_page_post.dart';
import 'package:api/view/Post/view/sigin_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? userstor;
  Future Username() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final stor = sharedPreferences.getString('usernamedata');
    setState(() {
      userstor = stor;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    Username().whenComplete(() => Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      userstor == null ? Home_pagepost() : Home_page())),
        ));
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: Home_pagepost(),
    );
  }
}
