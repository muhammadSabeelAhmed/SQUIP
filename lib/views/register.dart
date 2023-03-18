import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:squip_assignment/constants/image_constants.dart';

import '../constants/color_constants.dart';
import '../constants/font_constants.dart';
import '../constants/string_constants.dart';
import '../helpers/Error.dart';
import '../helpers/Loading.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String role = "";

  registerUser() async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialog();
        },
      );
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      await FirebaseFirestore.instance.collection("users").add({
        "email": emailController.text,
        "role": role,
      });

      emailController.text = "";
      passwordController.text = "";
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              StringConstants.error = "The password provided is too weak.";
              return ErrorDialog();
            });
      } else if (e.code == 'email-already-in-use') {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              StringConstants.error =
                  "The account already exists for that email.";
              return ErrorDialog();
            });
      }
    } catch (e) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            StringConstants.error = "$e";
            return ErrorDialog();
          });
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  SystemNavigator.pop();
                },
                child: Container(
                  padding: EdgeInsets.only(top: 40, bottom: 10),
                  child: Icon(Icons.arrow_back),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Image.asset(
                  ImageConstants.logo,
                  height: 30,
                  width: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    StringConstants.appName.toUpperCase(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontConstants.Bold,
                      color: Color(ColorConstants.PrimaryColor),
                    ),
                  ),
                ),
              ]),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  StringConstants.register,
                  style: TextStyle(
                      fontSize: 28,
                      color: Color(ColorConstants.GreenColor),
                      fontFamily: FontConstants.Bold),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  StringConstants.loginDesc,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(ColorConstants.GreenColor),
                      fontFamily: FontConstants.Regular),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 5),
                child: Text(
                  StringConstants.username,
                  style: TextStyle(
                      fontFamily: FontConstants.Regular,
                      fontSize: 16,
                      color: Color(ColorConstants.GrayColor)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(ColorConstants.GrayColor)),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.email_outlined,
                        color: Color(ColorConstants.GrayColor),
                      ),
                      hintText: "Enter your email address"),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 5),
                child: Text(
                  StringConstants.password,
                  style: TextStyle(
                      fontFamily: FontConstants.Regular,
                      fontSize: 16,
                      color: Color(ColorConstants.GrayColor)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(ColorConstants.GrayColor)),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.password_outlined,
                        color: Color(ColorConstants.GrayColor),
                      ),
                      hintText: "Enter your password"),
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(top: 5, bottom: 20),
                child: Text(
                  StringConstants.forgotPassword,
                  style: TextStyle(
                      fontFamily: FontConstants.Regular,
                      fontSize: 16,
                      color: Color(ColorConstants.PrimaryColor)),
                ),
              ),
              Text(
                'Select Role',
                style: TextStyle(fontSize: 17.0),
              ),
              DropdownButton<String>(
                items: <String>['Police', 'Ambulance', 'Fire Fighter']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    registerUser();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(ColorConstants.GreenColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 15.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      StringConstants.register,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
