import 'package:flutter/material.dart';

class Sussful_page extends StatefulWidget {
  const Sussful_page({Key? key}) : super(key: key);

  @override
  State<Sussful_page> createState() => _Sussful_pageState();
}

class _Sussful_pageState extends State<Sussful_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Hello",
            style: TextStyle(fontSize: 30),
          )),
        ],
      ),
    );
  }
}
