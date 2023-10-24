// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pustak/Pages/login_details.dart';
import 'package:pustak/Pages/signup_details.dart';

class login_signUp extends StatefulWidget {
  const login_signUp({super.key});

  @override
  State<login_signUp> createState() => _login_signUpState();
}

class _login_signUpState extends State<login_signUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.network(
              'https://assets7.lottiefiles.com/packages/lf20_sop8cbmc.json',
              animate: true),
          Expanded(
            child: DefaultTabController(
                length: 2,
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    children: [
                      ButtonsTabBar(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 18, vertical: 12),
                          height: 75,
                          buttonMargin: EdgeInsets.all(12),
                          labelStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff36454F)),
                          backgroundColor: Colors.white,
                          unselectedBackgroundColor: Colors.white,
                          borderColor: Color(0xff36454F),
                          borderWidth: 1.3,
                          unselectedBorderColor: Colors.white,
                          tabs: [
                            Tab(
                              text: 'Login',
                            ),
                            Tab(text: 'Sign Up')
                          ]),
                      Expanded(
                          child: TabBarView(
                              children: [login_details(), signup_details()]))
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
