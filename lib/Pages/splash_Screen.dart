// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, sized_box_for_whitespace, dead_code

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pustak/Pages/login_signUp.dart';
import 'package:pustak/utils/persistent_navBar.dart';
import 'package:hive/hive.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

final box = Hive.box("my-box");


class _Splash_ScreenState extends State<Splash_Screen> {
  late Timer _timer;
  bool isLogged = box.get('isLogin' , defaultValue: false);
  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  isLogged == true ? Persistent_NavBar() : login_signUp(),
          ),
        );
      }
    });
  }

  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (context.mounted) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset('android/assets/green.png')),
            Positioned(
                top: 0, left: 0, child: Image.asset('android/assets/red.png')),
            Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset('android/assets/yellow.png')),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                    width: 200,
                    height: 200,
                    child: Column(
                      children: [
                        Image.asset('android/assets/pustak.png'),
                        const Center(
                            child: Text(
                          "Pustak",
                          style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                      ],
                    )),
              ),
            ),
          ],
        ),
      );
    }
    return Text("Nothing here");
  }
}

// "https://images.unsplash.com/photo-1603484477859-abe6a73f9366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"