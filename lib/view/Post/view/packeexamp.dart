import 'package:api/view/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

class Demo_packge extends StatefulWidget {
  const Demo_packge({Key? key}) : super(key: key);

  @override
  State<Demo_packge> createState() => _Demo_packgeState();
}

class _Demo_packgeState extends State<Demo_packge> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            child: LayoutBuilder(
              builder: (context, _) {
                return IconButton(
                  icon: Icon(Icons.play_circle_filled),
                  iconSize: height * 0.2,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Home_page(),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
