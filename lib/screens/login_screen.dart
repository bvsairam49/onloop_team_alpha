import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.blue,
          ),
          onPressed: () async {
            GetIt.instance<AppState>().navBarSelectedIndex = 0;
            Navigator.of(context, rootNavigator: true)
                .pushReplacement(AppNavigationPage.pageRoute());
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
