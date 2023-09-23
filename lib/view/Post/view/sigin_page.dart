import 'package:api/view/Home_page.dart';
import 'package:api/view/Post/view/sussful_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api_servies/singIn_user_servies.dart';
import '../../../Comman_tax.dart';
import '../../../model/Post_sigin_modal.dart';
import 'Home_page_post.dart';

class Sigin_page extends StatefulWidget {
  const Sigin_page({Key? key}) : super(key: key);

  @override
  State<Sigin_page> createState() => _Sigin_pageState();
}

class _Sigin_pageState extends State<Sigin_page> {
  final global1 = GlobalKey<FormState>();
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _selector = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: global1,
        child: _selector == true
            ? Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Text(
                    "Login Page",
                    style: TextStyle(fontSize: width * 0.07),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Commen_tax(
                    controll: user,
                    hint: "UserName",
                    validations: (value) {
                      if (value!.isEmpty) {
                        return "enter username valide";
                      }
                    },
                    onchange: (value) {
                      global1.currentState!.validate();
                    },
                    ontap: () {},
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Commen_tax(
                    controll: password,
                    hint: "Password",
                    validations: (value) {
                      final bool regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value!);
                      if (regex) {
                        return null;
                      } else {
                        return "Not valide password";
                      }
                    },
                    onchange: (value) {
                      global1.currentState!.validate();
                    },
                    ontap: () {},
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      if (global1.currentState!.validate()) {
                        SigninModel modal1 = SigninModel();
                        modal1.username = user.text;
                        modal1.password = password.text;
                        setState(() {
                          _selector = true;
                        });

                        bool stro =
                            await Siginservies.Signup_servies(modal1.toJson());

                        if (stro == true) {
                          SharedPreferences perfer1 =
                              await SharedPreferences.getInstance();
                          perfer1
                              .setString('usernamedata', user.text)
                              .then((value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home_page(),
                                  )));
                        } else {
                          setState(() {
                            _selector = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Invalid Username or Password!")));
                        }
                      }
                    },
                    color: Colors.blue,
                    height: 60,
                    minWidth: 330,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Sing In",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home_pagepost(),
                            ));
                      },
                      child: Center(child: Text("Sing In"))),
                ],
              ),
      ),
    );
  }
}
