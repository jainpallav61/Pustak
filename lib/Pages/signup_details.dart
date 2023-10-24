// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pustak/utils/DatabaseModel.dart';
import 'package:pustak/utils/Hive_database.dart';
import 'package:hive/hive.dart';

import '../utils/persistent_navBar.dart';
import 'onboarding.dart';

HiveDatabase db = HiveDatabase();
final box = Hive.box('my-box');

final fireDb = FirebaseFirestore.instance;

class signup_details extends StatelessWidget {
  const signup_details({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller1 = TextEditingController();
    TextEditingController _controller2 = TextEditingController();
    TextEditingController _controller3 = TextEditingController();
    TextEditingController _controller4 = TextEditingController();
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _controller1,
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  hintText: "Your Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _controller2,
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  hintText: "Your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _controller3,
                textAlign: TextAlign.justify,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Your Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _controller4,
                textAlign: TextAlign.justify,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "verdana_regular",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ElevatedButton(
                  onPressed: () {
                    bool firstTime = box.get('isFirst', defaultValue: true);
                    box.put('isFirst', false);
                    db.OnboardUpdate();
                    if (_controller3.text.toString().trim() !=
                        _controller4.text.toString().trim()) {
                      //! Show SnackBar
                    }
                    db.name = _controller1.text.toString();
                    db.email = _controller2.text.toString();
                    db.password = _controller3.text.toString().trim();
                    db.CredentialsUpdate();
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return firstTime == true
                            ? onboarding()
                            : Persistent_NavBar();
                      },
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff36454F),
                      fixedSize: Size(MediaQuery.of(context).size.width / 1.2, 45)),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }


}
