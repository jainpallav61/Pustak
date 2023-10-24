import 'package:flutter/material.dart';
import 'package:pustak/utils/Hive_database.dart';
import 'package:pustak/utils/constants.dart';
import 'package:pustak/utils/persistent_navBar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

HiveDatabase db = HiveDatabase();


class onboarding extends StatefulWidget {
  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.isFirst = false;
    db.OnboardUpdate();
  }

  final _onboardcont = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 500,
              height: 630,
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    onLastPage = (value == 2);
                  });
                },
                controller: _onboardcont,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 500,
                          height: 500,
                          margin: EdgeInsets.only(top: 60),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("android/assets/onb1.png"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("Welcome , Find New Books\n"),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 500,
                          height: 530,
                          margin: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("android/assets/onb2.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("Welcome , Find New Books\n"),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 500,
                          height: 530,
                          margin: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("android/assets/onb3.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("Welcome , Find New Books\n"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 0,
              ),
              // SizedBox(width: 0,),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: ((context) {
                      return Persistent_NavBar();
                    })));
                  },
                  child: Text("Skip")),
              SizedBox(
                width: 48,
              ),
              SmoothPageIndicator(controller: _onboardcont, count: 3),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                        onPressed: () {
                          action(context, _onboardcont);
                        },
                        child: text()),
                  )),
              SizedBox(
                width: 0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
