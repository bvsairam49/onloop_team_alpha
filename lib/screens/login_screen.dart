import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:team_alpha/screens/home_screen.dart';
import 'package:team_alpha/utils/misc/app_text_theme.dart';
import 'package:team_alpha/utils/shared/shared_button.dart';
import 'package:http/http.dart' as http;

import '../model/app_state.dart';
import '../utils/shared/app_navigation_page.dart';
import 'globals.dart' as globals;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  String email = '';
  String password = '';

  void _updateId() {
    setState(() {
      email = idController.text;
      globals.userEmail = email;
    });
  }

  void _updatePassword() {
    setState(() {
      password = passwordController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    globals.allCaptures = {};

    // Start listening to changes.
    idController.addListener(() {
      _updateId();
    });
    passwordController.addListener(() {
      _updatePassword();
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6FAFD),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 27,
          right: 27,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/onloop_logo_coloured.png',
              height: 44.0,
              width: 153.04,
            ),
            Text(
              'Making your team better.',
              style: AppTextTheme.poppins(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF4F697C),
              ),
            ),
            const SizedBox(height: 24.0),
            SizedBox(
              height: 48.0,
              child: TextField(
                controller: idController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(
                      color: const Color(0xffAFCDDB),
                      fontStyle: FontStyle.normal,
                      fontFamily: "Poppins"),
                ),
              ),
            ),
            const SizedBox(width: 200, height: 35.0),
            SizedBox(
                height: 48.0,
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(),
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                        color: const Color(0xffAFCDDB),
                        fontStyle: FontStyle.normal),
                  ),
                )),
            const SizedBox(height: 24.0),
            SizedBox(
                width: MediaQuery.of(context).size.width - 16,
                height: 48.0,
                child: SharedButtons.blueSaveButton(
                    enabled: ((email != null && email != '') &&
                            (password != null && password != ''))
                        ? true
                        : false,
                    onPressed: () => loginAuth()))
          ],
        ),
      ),
    );
  }

  loginAuth() {
    if (email.toLowerCase() == 'sairam@onloop.io') {
      globals.userPersona = 'Sairam';
      globals.profileAvator = 'https://i.ibb.co/wrSQJYp/sairam.jpg';
    } else if (email.toLowerCase() == 'vineet@onloop.io') {
      globals.userPersona = 'Vineet';
      globals.profileAvator = 'https://i.ibb.co/6Y936fD/vineet.png';
    }

    var res =
        http.get(Uri.parse("http://10.100.101.44:8080/v1/user?id=" + email));

    res
        .then((response) => {
              if (response.body != '[]')
                {
                  globals.isLoggedIn = true,
                  globals.userObject = json.decode(response.body),
                  res = http.get(Uri.parse("http://localhost:8080/v1/tags")),
                  res.then((response) =>
                      {globals.setAllAvailableTags(response.body)})
                }
            })
        .then((response) {
      if (globals.isLoggedIn == true) {
        var id = globals.userObject[0]['id'];
        storeCaptures(id);
        res = http.get(Uri.parse(

            "http://10.100.101.44:8080/v1/colleagues?id=" + id.toString()));

        res.then((colleagueList) => {
              globals.colleagueList = json.decode(colleagueList.body),
              globals.totalColleagueSize = globals.colleagueList.length,
              globals.colleagueList.forEach((element) {
                storeCaptures(element['id']);
              }),
              Future.delayed(const Duration(seconds: 1)).then((_) async {
                Navigator.of(context, rootNavigator: true)
                    .pushReplacement(AppNavigationPage.pageRoute());
              }),
            });
      }
    });
  }

  void storeCaptures(int id) {
    if (id != null) {
      Map<int, dynamic> capture;

      globals.currentUserid = id;
     
      var res = http.get(Uri.parse(
          "http://10.100.101.44:8080/v1/captures?id=" + id.toString()));


      res.then((response) => {
            capture = {id: response.body},
            globals.allCaptures.addAll(capture),
          });


      res = http.get(Uri.parse(
          "http://10.100.101.44:8080/v1/toptags?id=" + id.toString()));

      res.then((response) => {
            globals.setTopTags(id, response.body.toString()),
          });
    }
  }
}
