import 'dart:io';

import 'package:api/view/Home1_page.dart';
import 'package:api/view/Home_page.dart';
import 'package:api/view/Post/view/sigin_page.dart';
import 'package:api/view/Post/view/sussful_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api_servies/post_user_servies.dart';
import '../../../Comman_tax.dart';
import 'package:image_picker/image_picker.dart';
import '../../../model/Post_requctions_modal.dart';
import 'package:dio/dio.dart' as dio;

class Home_pagepost extends StatefulWidget {
  const Home_pagepost({Key? key}) : super(key: key);

  @override
  State<Home_pagepost> createState() => _Home_pagepostState();
}

class _Home_pagepostState extends State<Home_pagepost> {
  final global = GlobalKey<FormState>();
  bool _lorder = false;
  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();

  ImagePicker images = ImagePicker();
  File? select;

  chocesimage() async {
    final file = await images.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        select = File(file.path);
      });
    }
  }

  Future uploadimage() async {
    dio.FormData formData = dio.FormData.fromMap(
        {"avatar": await dio.MultipartFile.fromFile(select!.path)});

    dio.Response response = await dio.Dio().post(
        "https://codelineinfotech.com/student_api/User/user_avatar_upload.php",
        data: formData);
    return response.data['url'];
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _lorder == true
          ? Center(
              child: CupertinoActivityIndicator(
                radius: 30,
              ),
            )
          : Form(
              key: global,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      chocesimage();
                    },
                    child: Container(
                      height: height * 0.18,
                      width: width * 0.4,
                      child: ClipOval(
                        child: select == null
                            ? Icon(
                                Icons.camera_alt,
                                size: 40,
                              )
                            : Image.file(
                                select!,
                                fit: BoxFit.cover,
                              ),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey.shade300),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.035,
                  ),
                  Text(
                    "Login Page",
                    style: TextStyle(fontSize: width * 0.07),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Commen_tax(
                    controll: first,
                    hint: "FirstName",
                    validations: (value) {
                      if (value!.isEmpty) {
                        return "enter name valide";
                      }
                    },
                    onchange: (value) {
                      global.currentState!.validate();
                    },
                    ontap: () {},
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Commen_tax(
                    controll: last,
                    hint: "LastName",
                    validations: (value) {
                      if (value!.isEmpty) {
                        return "enter lastname valide";
                      }
                    },
                    onchange: (value) {
                      global.currentState!.validate();
                    },
                    ontap: () {},
                  ),
                  SizedBox(
                    height: height * 0.03,
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
                      global.currentState!.validate();
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
                      global.currentState!.validate();
                    },
                    ontap: () {},
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      if (global.currentState!.validate()) {
                        // withut  Userservies.postUservies(
                        //   firstname: first.text,
                        //   lastname: last.text,
                        //   username: user.text,
                        //   password: password.text,
                        // ).then((value) => Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => Sussful_page(),
                        //     )));

                        final imageIrl = await uploadimage();

                        SignupModel modal = SignupModel();
                        modal.firstName = first.text;
                        modal.lastName = last.text;
                        modal.username = user.text;
                        modal.password = password.text;
                        modal.avatar = "${imageIrl}";
                        setState(() {
                          _lorder = true;
                        });
                        bool strog =
                            await Userservies.Postmodalwith(modal.toJson());
                        if (strog == true) {
                          SharedPreferences pefer =
                              await SharedPreferences.getInstance();
                          pefer
                              .setString('usernamedata', user.text)
                              .then((value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home_page(),
                                  )));
                        } else {
                          setState(() {
                            _lorder = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Username oreadi exit")));
                        }
                      }
                    },
                    color: Colors.blue,
                    height: 60,
                    minWidth: 330,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Sing up",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Sigin_page(),
                            ));
                      },
                      child: Center(child: Text("Sing In"))),
                ],
              ),
            ),
    );
  }
}
