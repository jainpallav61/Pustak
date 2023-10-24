import 'package:flutter/material.dart';



class exp extends StatelessWidget {
  const exp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: DefaultTabController(
          length: 4,
          child: TabBar(
            tabs: [
              Tab(text: "Fiction",),
              Tab(text: "Horror",),
              Tab(text: "Children",),
              Tab(text: "Economy",),
            ],
          ),
        ),
      ),
    );
  }
}