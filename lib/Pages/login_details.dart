// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pustak/Pages/onboarding.dart';
import 'package:pustak/utils/Hive_database.dart';
import 'package:pustak/utils/persistent_navBar.dart';
import 'package:hive/hive.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class login_details extends StatefulWidget {
  const login_details({super.key});

  @override
  State<login_details> createState() => _login_detailsState();
}

HiveDatabase db = HiveDatabase();
final box = Hive.box('my-box');

class _login_detailsState extends State<login_details> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    borderSide: const BorderSide(color: Colors.blue, width: 1.0),
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
                height: 35,
              ),
              TextFormField(
                controller: _controller2,
                textAlign: TextAlign.justify,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Your Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 2.5)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 1.5),
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
                  onPressed: () {},
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff36454F),
                      fixedSize: Size(MediaQuery.of(context).size.width / 1.2, 45)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ElevatedButton.icon(
                  icon: FaIcon(FontAwesomeIcons.userNinja),
                  onPressed: () async {
                    await signInAnonymous();
                    // SharedPreferences sharedPref =
                    //     await SharedPreferences.getInstance();
                    // sharedPref.setBool('LoggedIn', true);
                    // sharedPref.setString('name', _controller.text.toString());
                    db.isLogin = true;
                    db.LoginUpdate();
                    bool firstTime = box.get('isFirst', defaultValue: true);
                    setState(() {
                      if (_auth.currentUser != null) {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return firstTime == true
                                ? onboarding()
                                : Persistent_NavBar();
                          },
                        ));
                      }
                    });
                  },
                  label: Text(
                    "Anonymously",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff36454F),
                      fixedSize: Size(MediaQuery.of(context).size.width / 1.2, 45)),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

Future<UserCredential> signInAnonymous() async {
  UserCredential userCredential = await _auth.signInAnonymously();
  return userCredential;
}
