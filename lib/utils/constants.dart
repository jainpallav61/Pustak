import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pustak/Pages/Details.dart';
import 'package:pustak/utils/persistent_navBar.dart';

import 'ZenQuote.dart';

double progressvalue = 0.3;
int selectedItem = 0;
int currentTextIndex = 0;
List<Widget> WidgetList = const [
  Text(
      "Some wikis have an edit button or link directly on the page being viewed if the user has permission to edit the page. This can lead to a text-based editing page where participants can structure and format wiki pages with a simplified markup language, sometimes known as wikitext, wiki markup or wikicode (it can also lead to a WYSIWYG editing page; see the paragraph after the table below)."),
  Text(
      "The copyrights on it can be used without limit.[4] Copyright laws iwhich the entertainment and publishing industries have very strong lobbying power have been amended repeatedly since their inception, to extend the length of this fixed period where the work is exclusively controlled by the copyright holder."),
  Text(
      "A user r like Trnsumer reviews are in the form of several lines of text accompanied by a numerical rating. This text is meant to aid in shopping decision of a prospective buyer. A consumer review of a product usually comments on how well the product measures up to expectations based on the specifications provided by the manufacturer or seller. It talks about performance, reliability, quality defects, if any, and value for money.")
];

int currPageDot = 0;

int currCatDot = 0;

int _index = 0;

double height = 121;

bool onLastPage = false;

Widget row() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      currPageDot == 0
          ? Icon(
        FontAwesomeIcons.certificate,
        color: Colors.amber,
      )
          : Icon(
        Icons.circle_outlined,
        color: Colors.black,
      ),
      SizedBox(
        width: 10,
      ),
      currPageDot == 1
          ? Icon(
        FontAwesomeIcons.certificate,
        color: Colors.amber,
      )
          : Icon(
        Icons.circle_outlined,
        color: Colors.black,
      ),
      SizedBox(
        width: 10,
      ),
      currPageDot == 2
          ? Icon(
        FontAwesomeIcons.certificate,
        color: Colors.amber,
      )
          : Icon(
        Icons.circle_outlined,
        color: Colors.black,
      ),
    ],
  );
}

// List<Widget> arr = [
//   content(),
//   content1(),
//   content2(),
//   content3(),
//   content(),
//   content(),
//   content(),
//   content(),
//   content(),
// ];

// final _onboardcont  = PageController();

Widget content(String img, title, author, rating, desc, preview, pagecount,
    context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      color: Colors.black,
        child: ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Details_Page(title : title, author : author,rating :  rating, description :  desc, image : img,pagecount : pagecount,preview : preview,),));
          },
          leading: Image.network(img),
          title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white),),
          subtitle: Text(author, maxLines: 1, overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white)),
          trailing: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, border: Border.all(width: 2,color: Colors.blue)),
              child: Center(child: Text(rating.toString(),style: TextStyle(color: Colors.white)))),
        )),
  );
}

Widget content1() {
  return Container(
    width: 400,
    height: 230,
    // color: Colors.blue,
    child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 0,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  // image: NetworkImage(
                  //     "https://images.unsplash.com/photo-1627792089443-7350388a89aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                    image: AssetImage('android/assets/ali.png'),
                    fit: BoxFit.fitWidth)),
          ),
          SizedBox(
            height: 10,
          ),
          Text("At Home with Mohammed Ali"),
          Text("Hara Ali"),
          Text("Stars"),
        ],
      ),
    ),
  );
}

Widget content2() {
  return Container(
    width: 180,
    height: 230,
    // color: Colors.blue,
    child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 150,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  // image: NetworkImage(
                  //     "https://images.unsplash.com/photo-1627792089443-7350388a89aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                    image: AssetImage('assets/images/malcom.JPG'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Malcom X"),
          Text("Alex Haley"),
          Text("Stars"),
        ],
      ),
    ),
  );
}

Widget content3() {
  return Container(
    width: 180,
    height: 230,
    // color: Colors.blue,
    child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 150,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  // image: NetworkImage(
                  //     "https://images.unsplash.com/photo-1627792089443-7350388a89aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                    image: AssetImage('android/assets/marie.png'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 10,
          ),
          Text("The Story Of Marie Curie"),
          Text("Susan R Katy"),
          Text("Stars"),
        ],
      ),
    ),
  );
}

Widget text() {
  if (onLastPage == true) {
    return Text("Done");
  }

  return Text("Next");
}

action(context, _onboardcont) {
  if (onLastPage == true) {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return Persistent_NavBar();
      },
    ));
  }

  _onboardcont.nextPage(
      duration: Duration(milliseconds: 500), curve: Curves.easeInCirc);
}

// Widget onboard()
// {
//    return Align
//    (
//      alignment: Alignment.topCenter,
//      child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//        children: [
//          Container(
//           width: 500,
//           height: 500,
//           margin: EdgeInsets.only(top: 60),
//           decoration: BoxDecoration(
//             image: DecorationImage(image: AssetImage("android/assets/onb1.png") , fit: BoxFit.cover)
//           ),
//          ),
//          Text("Welcome , Find New Books\n"),
//          Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: [
//             Text("Skip"),
//              SmoothPageIndicator(controller: _onboardcont, count: 3 , effect: JumpingDotEffect(spacing: 10),),
//              TextButton(onPressed: (){}, child: Text("Next" , style: TextStyle(color: Colors.black,backgroundColor: Colors.blue.shade500),))
//            ],
//          )
//        ],
//      ),
//    );
// }

Widget tabbar() {
  return Container(
    color: Colors.black,
    child: DefaultTabController(
      length: 4,
      child: TabBar(
        tabs: [
          Tab(
            text: "Fiction",
          ),
          Tab(
            text: "Horror",
          ),
          Tab(
            text: "Children",
          ),
          Tab(
            text: "Economy",
          ),
        ],
      ),
    ),
  );
}

Future<ZenQuote> fetchZenQuote() async {
  final response =
  await http.get(Uri.parse('https://zenquotes.io/api/random'));

  if (response.statusCode == 200) {
    return ZenQuote.fromJson(jsonDecode(response.body)[0]);
  } else {
    throw Exception('Failed to load Zen quote');
  }
}

void showZenQuoteDialog(BuildContext context) async {
  final ZenQuote quote = await fetchZenQuote();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quote of the Moment',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '"${quote.text}"',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      'CLOSE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

