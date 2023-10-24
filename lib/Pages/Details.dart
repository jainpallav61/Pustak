import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pustak/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Details_Page extends StatefulWidget {
  String title = '';
  String author = '';
  String image = '';
  String preview = '';
  String description = '';
  String pagecount = '';
  String rating = '';

  Details_Page(
      {super.key,
      required this.title,
      required this.author,
      required this.rating,
      required this.description,
      required this.image,
      required this.pagecount,
      required this.preview});

  @override
  State<Details_Page> createState() => _Details_PageState();
}

List desc = [
  'This novel is a captivating adventure that follows the journey of a group of travelers who discover a mysterious island inhabited by the beautiful and deadly Mohini. Filled with action, romance, and supernatural elements, this book is a must-read for fans of Indian literature self-discovery that explores the personal and professional experiences of an individual. With honesty and vulnerability, the author shares their insights on love, family, career, and personal growth in life.,Set during the tumultuous period of Partition of violence and prejudice. Through the stories of ordinary people caught up in the chaos of historical events, Singh creates a moving and thought-provoking portrayal of a tragic moment in Indian history.'
];

class _Details_PageState extends State<Details_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(width: 10, color: Colors.blue)),
                   child: Image.network(widget.image)),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top : 8.0),
                                child: Text(widget.title,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  '${widget.author} |  ${widget.pagecount == 'null' ? '* Not Available *' : widget.pagecount}',style: TextStyle(color: Colors.white),),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  children: [

                    SizedBox(
                      height: 8,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: Colors.black,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(desc[0], overflow: TextOverflow.fade,style: TextStyle(fontSize: 18,color: Colors.white,wordSpacing: 2 , height: 1.5),),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Read Full book"),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ));
  }

// void _launchUrl() {
//   print(widget.preview);
//   html.window.open('${widget.preview}', "_self");
// }
}
