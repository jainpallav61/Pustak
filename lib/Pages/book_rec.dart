// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:pustak/utils/Hive_database.dart';
import 'package:hive/hive.dart';
import 'package:pustak/utils/WishlistLogic.dart';
import 'package:provider/provider.dart';

class bookrec extends StatefulWidget {
  const bookrec({super.key});

  @override
  State<bookrec> createState() => _bookrecState();
}

class _bookrecState extends State<bookrec> {
  HiveDatabase db = HiveDatabase();
  final box = Hive.box('my-box');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.loadData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String name = box.get('name', defaultValue: 'User');
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          FontAwesomeIcons.bars,
          color: Colors.black,
        ),
        actions: const [
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            FontAwesomeIcons.user,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            FontAwesomeIcons.bell,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        elevation: 3,
        centerTitle: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            // * before container
            // color: Colors.blue,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Hi $name,',
                    style: const TextStyle(
                      color: Colors.white,
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    // color: Colors.red,
                    child: const Text(
                      "Your Wishlist",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<WishlistLogic>(
                  builder: (context, value, child) => Expanded(
                    child: value.list.isNotEmpty
                        ? ListView.builder(
                            itemCount: value.list.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: Colors.black,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      color: Colors.black,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          leading: SizedBox(
                                              height: 80,
                                              child: value.list.isNotEmpty
                                                  ? Image.network(
                                                      value.list[index].image
                                                          .toString(),
                                                      fit: BoxFit.cover,
                                                    )
                                                  : const Text('')),
                                          title: Text(
                                            value.list[index].title
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          trailing:
                                          value.list.isNotEmpty
                                                  ? IconButton(
                                                      icon: const Icon(
                                                          Icons.bookmark),
                                                      color: Colors.amber,
                                                      onPressed: () {},
                                                    )
                                                  : const Text(''),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Align(
                      alignment: Alignment.topCenter,
                          child: Lottie.network(
                              'https://assets8.lottiefiles.com/packages/lf20_hl5n0bwb.json',
                              animate: true),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
