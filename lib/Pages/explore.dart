// ignore_for_file: unused_field
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsheets/gsheets.dart';
import 'package:lottie/lottie.dart';
import 'package:pustak/Pages/Details.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../utils/constants.dart';
import '../utils/model.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

const _credential = r''' {
  "type": "service_account",
  "project_id": "trim-sunlight-384408",
  "private_key_id": "c45ed877bca28a3bdc4b2b2ddb213572e0b72206",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCeG1anPEtBNl7q\nLQNsU1NV7KoB+KSBJcHygLoeXkQyyDxw4qLCO2yiW3JcaXi8qDJPr2rByd/X8m3Z\nlOqXYqq4rHmZ8WJKkDNf+utCkuuOEVJ+oyqdQfkDoJQUyCSE5nqAEUDcJIuyTanh\nrWzc2dMleeBMUH+8XmNqDeesOQKNGPCigHV/TxArrV/ne6qsko/EHAlv0K7KgPzt\n1SxH+xTNZ/QbJQ13o0vhSZZo/b4FMZdVKj69u2uBHy92uLE7QVGhMExrNyYxjKNr\nF3YoiJR/nLjur6j57M2sy/vbKqbP0gao7vMSC/nSN7s5K3z7BRl8Rrt60+1YQ4eb\ngiUlGrhHAgMBAAECggEABo/b6NT3yp0XE2EK41QSAV7xL2PCcBnBEu+Eyf3flrv4\nxjahyq3stFBXTr6R5EKW0/fT1ncqcyv8oysrEV1m+IMwCNOb4LxbZYBkgz7Vx++w\nHNFo014Jl7zyaGpmGZ33N5l/t6NMqPnQMy2fdwsTWFrWlFRC+O5x8dTh6KP1FyYB\nEZu/dc3ynK2nz7z8bBZAfapF1E3+R70YBM6pGrYIuSclquNO58d2wZ+8+MhJxNVu\noF906EgqSN/EjTR6FcRPQRf1qil/VWGg99RbF8V5Q5MZ65JNma6i/QpcCT89EbYN\nK4Oo/hL2idJ7bnREg/6jDkoxXC2KOVTuVOXAbtLNAQKBgQDcfLVQdOwHfiPlx2kc\ncpjFAdpApJHGxefyNpVmjrex1R9+1DxrSJVULkpk2zBIrMpwgk8xZhuO86UZsmwM\nxPrLvgbucRBp3+6SEFsUibIzzDG0ecx3bpXja+amJLgTQGMkataAgMhZutDFAPq4\nY8NcLYhp7LrZZrPHQ1JQvtUmqwKBgQC3koREhJt3HPJ3W9szBQSnwT5xli4ZLC+n\nJg5GWPfE7cEKKvVDxoyZeqr/DtA64wTxkkh8DJsaMi2G/i3WsqlwS+T3YKFTAziT\nedu61P7wafjOXqeZ0/ndG3+WIE3XPFDfFVvJvtJABHuMuDgEkO/CHU7qjjOUzX/4\npJo+4vSk1QKBgQC0Tp+Pzi3+6p68l9hTVTutUBiFaI919/34S77dgbSjDuCUvUcz\njMXhc4GO/Nh9diCO5WGRyiibPJA1dX1669MUrq/Ialm7206j0BBLuVcrmL7FEh2t\nRZf5xRF3qOuHgs4Qx/XmXGp7RpTXpjdiduMaDHpT9S3P/3bhayJzubthxQKBgA0s\nX3+HQJzQn/m+xsEniAj9zhxamZ5G1HibO4UC12zzXtn68TTW57oP2nuJNZo0NmOb\nisYUJYFAvpGkZee1VIFxgNHbxlftsD6tDP6gUFcyU5+DnWVll9WtJn/Ae7WJZ4hK\nwRZ+MhpT+AXGJob1W69DaSld4Qe5o4hVT5hZsxKtAoGBAKxN5+DEU7TAkIAxe+mj\nwkyUy/NB9Yh/p3uEjxR8Q7zXPAJOMNqLeUa9w0bg4OKRld2nXkiUlaVSMo31NUdy\nXAYU7UTUTHlBVEIZPAtgf7gp/y33Trm0tAu9gDdry3992KYtMcPUH3Qv7Uy1MeBj\nlWzI6eJ/VXrwXnMri4YBxXCz\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-google-sheets@trim-sunlight-384408.iam.gserviceaccount.com",
  "client_id": "104226012853070061593",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-google-sheets%40trim-sunlight-384408.iam.gserviceaccount.com"
}
''';

const _spreadsheetID = '1xllm71y6KV8mUHITrLQrEvNwp0CUeOV38MqJ1zelzgE';

List<Model> fiction = [];
List<Model> horror = [];
List<Model> romance = [];
List<Model> adv = [];

// List genre = ['Fiction', 'Horror', 'Romance', 'Adventure'];

class _ExploreState extends State<Explore> {
  static const List<Widget> _widgetOptions = <Widget>[Navigator()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _fetch();
    showZenQuoteDialog(context);
    _fiction();
    _adv();
    _horror();
    _romance();
  }

  final _controller = PageController();
  final _genre = PageController();
  final Random random = Random();
  List randomBook = [];
  List img = [];
  List author = [];
  List rating = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          FontAwesomeIcons.bars,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height,
                margin: const EdgeInsets.only(top: 5.0),
                child: PageView(
                  controller: _controller,
                  onPageChanged: (value) {
                    setState(() {
                      currPageDot = value;
                    });
                  },
                  children: [
                    Align(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.only(top : 8.0),
                          child: Container(
                            width: 350,
                            height: height,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    // image: NetworkImage(
                                    //     "https://images.unsplash.com/photo-1610296669228-602fa827fc1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1075&q=80"),
                                    image:
                                        AssetImage('android/assets/banner.png'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: 350,
                          height: height,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  // image: NetworkImage(
                                  //     "https://images.unsplash.com/photo-1528722828814-77b9b83aafb2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                                  image:
                                      AssetImage('android/assets/banner.png'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    Align(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: 350,
                          height: height,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  //   image: NetworkImage(
                                  //       "https://images.unsplash.com/photo-1494022299300-899b96e49893?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                                  image:
                                      AssetImage('android/assets/banner.png'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                  child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const WormEffect(),
              )),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Cateogories',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              DefaultTabController(
                  length: 4,
                  child: Container(
                    // color: Colors.red,
                    height: MediaQuery.of(context).size.height / 1.45,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        ButtonsTabBar(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            height: 50,
                            buttonMargin: const EdgeInsets.all(7),
                            unselectedLabelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            backgroundColor: Colors.black,
                            unselectedBackgroundColor: Colors.black,
                            borderColor: Colors.blue,
                            borderWidth: 2.5,
                            unselectedBorderColor: Colors.black,
                            tabs: const [
                              Tab(text: 'Fiction'),
                              Tab(text: 'Horror'),
                              Tab(
                                text: 'Romance',
                              ),
                              Tab(
                                text: 'Adventure',
                              )
                            ]),
                        Container(
                          height: MediaQuery.of(context).size.height / 1.65,
                          width: MediaQuery.of(context).size.width,
                          child: TabBarView(children: [
                            fiction.isNotEmpty
                                ? ListView.builder(
                                    itemCount: fiction.length,
                                    itemBuilder: (context, index) => content(
                                        fiction[index].image,
                                        fiction[index].title,
                                        fiction[index].author,
                                        fiction[index].rating,
                                        fiction[index].description,
                                        fiction[index].preview,
                                        fiction[index].pagecount,
                                        context),
                                  )
                                : Lottie.network(
                                    'https://assets7.lottiefiles.com/packages/lf20_1a8dx7zj.json',
                                    animate: true),
                            horror.isNotEmpty
                                ? ListView.builder(
                                    itemCount: horror.length,
                                    itemBuilder: (context, index) => content(
                                        horror[index].image,
                                        horror[index].title,
                                        horror[index].author,
                                        horror[index].rating,
                                        horror[index].description,
                                        horror[index].preview,
                                        horror[index].pagecount,
                                        context),
                                  )
                                : Lottie.network(
                                    'https://assets7.lottiefiles.com/packages/lf20_1a8dx7zj.json',
                                    animate: true),
                            romance.isNotEmpty
                                ? ListView.builder(
                                    itemCount: romance.length,
                                    itemBuilder: (context, index) => content(
                                        romance[index].image,
                                        romance[index].title,
                                        romance[index].author,
                                        romance[index].rating,
                                        romance[index].description,
                                        romance[index].preview,
                                        romance[index].pagecount,
                                        context),
                                  )
                                : Lottie.network(
                                    'https://assets7.lottiefiles.com/packages/lf20_1a8dx7zj.json',
                                    animate: true),
                            adv.isNotEmpty
                                ? ListView.builder(
                                    itemCount: adv.length,
                                    itemBuilder: (context, index) => content(
                                        adv[index].image,
                                        adv[index].title,
                                        adv[index].author,
                                        adv[index].rating,
                                        adv[index].description,
                                        adv[index].preview,
                                        adv[index].pagecount,
                                        context),
                                  )
                                : Lottie.network(
                                    'https://assets7.lottiefiles.com/packages/lf20_1a8dx7zj.json',
                                    animate: true),
                          ]),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _fetch() async {
    final gsheets = GSheets(_credential);
    final ss = await gsheets.spreadsheet(_spreadsheetID);
    var sheet = ss.worksheetByTitle('Sheet1');
    final title = await sheet!.values.column(1);
    final images = await sheet.values.column(2);
    final auth = await sheet.values.column(3);
    final rate = await sheet.values.column(4);
    for (var i = 1; i <= 12; i++) {
      randomBook.add(title[random.nextInt(title.length) + 2]);
      img.add(images[title.indexOf(randomBook[randomBook.length - 1])]);
      author.add(auth[title.indexOf(randomBook[randomBook.length - 1])]);
      rating.add(rate[title.indexOf(randomBook[randomBook.length - 1])]);
    }
    setState(() {});
  }

  Future<void> _fiction() async {
    final apiUrl = Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=subject:Fiction');
    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final items = body['items'] as List<dynamic>;
      final itemCount = items.length < 12 ? items.length : 12;
      for (int i = 0; i < itemCount; i++) {
        final item = items[i];
        fiction.add(Model(
          title: item['volumeInfo']['title'],
          author: item['volumeInfo']['authors'] != null &&
                  item['volumeInfo']['authors'].isNotEmpty
              ? item['volumeInfo']['authors'][0]
              : '',
          rating: item['volumeInfo']['averageRating'].toString()  == 'null' ? '~' : item['volumeInfo']['averageRating'].toString(),
          image: item['volumeInfo']['imageLinks']?['thumbnail'] ?? '',
          description: item['description'] ?? '',
          pagecount: item['pageCount'].toString() ?? '',
          preview: item['previewLink'] ?? '',
        ));
      }
      print(fiction[0].description.length);
    } else {
      throw Exception('Failed to load books');
    }

    setState(() {});
  }

  Future<void> _horror() async {
    final apiUrl = Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=horror+subject:fiction');
    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final items = body['items'] as List<dynamic>;
      final itemCount = items.length < 12 ? items.length : 12;
      for (int i = 0; i < itemCount; i++) {
        final item = items[i];
        horror.add(Model(
          title: item['volumeInfo']['title'],
          author: item['volumeInfo']['authors'] != null &&
                  item['volumeInfo']['authors'].isNotEmpty
              ? item['volumeInfo']['authors'][0]
              : '',
          rating: item['volumeInfo']['averageRating'].toString()  == 'null' ? '~' : item['volumeInfo']['averageRating'].toString(),
          image: item['volumeInfo']['imageLinks']?['thumbnail'] ?? '',
          description: item['description'] ?? '',
          pagecount: item['pageCount'].toString() ?? '',
          preview: item['previewLink'] ?? '',
        ));
      }
    } else {
      throw Exception('Failed to load books');
    }

    setState(() {});
  }

  Future<void> _romance() async {
    final apiUrl = Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=romance+subject:fiction');
    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final items = body['items'] as List<dynamic>;
      final itemCount = items.length < 12 ? items.length : 12;
      for (int i = 0; i < itemCount; i++) {
        final item = items[i];
        romance.add(Model(
          title: item['volumeInfo']['title'],
          author: item['volumeInfo']['authors'] != null &&
                  item['volumeInfo']['authors'].isNotEmpty
              ? item['volumeInfo']['authors'][0]
              : '',
          rating: item['volumeInfo']['averageRating'].toString()  == 'null' ? '~' : item['volumeInfo']['averageRating'].toString(),
          image: item['volumeInfo']['imageLinks']?['thumbnail'] ?? '',
          description: item['description'] ?? '',
          pagecount: item['pageCount'].toString() ?? '',
          preview: item['previewLink'] ?? '',
        ));
      }
    } else {
      throw Exception('Failed to load books');
    }

    setState(() {});
  }

  Future<void> _adv() async {
    final apiUrl = Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=adventure+subject:fiction');
    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final items = body['items'] as List<dynamic>;
      final itemCount = items.length < 12 ? items.length : 12;
      for (int i = 0; i < itemCount; i++) {
        final item = items[i];
        adv.add(Model(
          title: item['volumeInfo']['title'],
          author: item['volumeInfo']['authors'] != null &&
                  item['volumeInfo']['authors'].isNotEmpty
              ? item['volumeInfo']['authors'][0]
              : '',
          rating: item['volumeInfo']['averageRating'].toString()  == 'null' ? '~' : item['volumeInfo']['averageRating'].toString(),
          image: item['volumeInfo']['imageLinks']?['thumbnail'] ?? '',
          description: item['description'] ?? '',
          pagecount: item['pageCount'].toString() ?? '',
          preview: item['previewLink'] ?? '',
        ));
      }
    } else {
      throw Exception('Failed to load books');
    }

    setState(() {});
  }
}
