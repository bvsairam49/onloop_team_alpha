import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:team_alpha/utils/misc/app_text_theme.dart';
import 'package:team_alpha/utils/shared/shared_button.dart';

import '../model/app_state.dart';
import '../utils/shared/app_navigation_page.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            const SizedBox(
              height: 48.0,
              child: TextField(
                decoration: InputDecoration(
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
            const SizedBox(
                height: 48.0,
                child: TextField(
                  decoration: InputDecoration(
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
                    enabled: true, onPressed: () {})),
          ],
        ),
      ),
    );
  }
}
