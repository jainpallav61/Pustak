// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:lottie/lottie.dart';
import 'package:pustak/Pages/signup_details.dart';
import 'package:pustak/utils/Hive_database.dart';
import 'package:pustak/utils/WishlistLogic.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';

import '../utils/DatabaseModel.dart';

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
HiveDatabase db = HiveDatabase();
final box = Hive.box('my-box');

Color _iconColor = Colors.grey;

// String title = '';
// String author = '';
// String image = '';
// String buyLink = '';
// String description = '';
// int pageCount = 0;
// String category = '';

class Search_Bar extends StatefulWidget {
  const Search_Bar({super.key});

  @override
  State<Search_Bar> createState() => _Search_BarState();
}

List data = [];
List img = [];
List dummy_data = [];
List cover_img = [];
List recommended = [];
List recommended_images = [];

class _Search_BarState extends State<Search_Bar> {
  @override
  void initState() {
    super.initState();
    fetch();
  }

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // List bookmarkSelectedIndex = box.get('bookmarkedIndex' , defaultValue: []);
    // print("index is -> ${db.bookmarkedIndex[0]}\n");
    return Scaffold(
      body: dummy_data.isNotEmpty
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    CupertinoSearchTextField(
                      controller: _controller,
                      onSubmitted: (value) => filter(value),
                      placeholder: "Search",
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            dummy_data.length > 15 ? 15 : dummy_data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.black,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  color: Colors.black,
                                  child: Container(
                                    color: Colors.black,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        leading: Container(
                                            height: 80,
                                            child: cover_img.length > 0
                                                ? Image.network(
                                                    cover_img[index],
                                                    fit: BoxFit.cover,
                                                  )
                                                : Text('')),
                                        title: Text(
                                          dummy_data[index],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        trailing: cover_img.length > 0
                                            ? Consumer<WishlistLogic>(
                                                builder:
                                                    (context, value, child) =>
                                                        IconButton(
                                                  icon: Icon(Icons.bookmark),
                                                  color:
                                                      db.bookmarkedIndex[index]
                                                          ? Colors.amber
                                                          : Colors.grey,
                                                  onPressed: () =>
                                                      _onBookmarkPressed(
                                                          index, value),
                                                ),
                                              )
                                            : Text(''),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(
            child: Lottie.network(
            'https://assets7.lottiefiles.com/packages/lf20_1a8dx7zj.json',
            animate: true),
          )
    );
  }

  void filter(String value) {
    dummy_data = data
        .where((element) => element.toLowerCase().contains(value.toLowerCase()))
        .toList();
    // _controller.value = _controller.value.copyWith(text: value);
    // print(dummy_data);
    List extracted_image = [];
    for (var i = 0; i < dummy_data.length; i++) {
      // loop through dummy_data
      int index =
          data.indexOf(dummy_data[i]); // get the index in the original data
      if (index != -1) {
        // make sure the index is valid
        extracted_image.add(img[index]); // add the corresponding cover image
      }
    }
    cover_img = extracted_image;
    _mlApi(value);
    if (dummy_data.length == 0) {
      // dummy_data = ['Not present in the list'];
      // cover_img = [];
      // print('hello');
      _fetchData(value);
    }
    setState(() {});
  }

  Future<void> fetch() async {
    final gsheets = GSheets(_credential);
    final ss = await gsheets.spreadsheet(_spreadsheetID);
    var sheet = ss.worksheetByTitle('Sheet1');
    final title = await sheet!.values.column(1);
    final images = await sheet.values.column(2);
    setState(() {
      data = title;
      img = images;
      dummy_data = title;
      cover_img = images;
      if (box.get('bookmarkedIndex') == null) {
        db.bookmarkedIndex = List.generate(dummy_data.length, (index) => false);
      } else {
        db.bookmarkedIndex = box.get('bookmarkedIndex', defaultValue: []);
      }
      dummy_data.removeAt(0);
      cover_img.removeAt(0);
    });
  }

  void _onBookmarkPressed(int index, value) {
    // print(index);

    db.bookmarkedIndex[index] = !db.bookmarkedIndex[index];
    if (db.bookmarkedIndex[index] == true) {
      database(dummy_data[index]);
      db.bookmarkedTitle.add(dummy_data[index]);
      db.bookmarkedImages.add(cover_img[index]);
      add(value, index);
    } else {
      db.bookmarkedTitle.remove(dummy_data[index]);
      db.bookmarkedImages.remove(cover_img[index]);
      value.del(index);
      // value.del(index);
    }
    db.BookmarkUpdate();

    setState(() {});
  }

  Future<void> _fetchData(query) async {
    query = query.replaceAll(' ', '');
    query = query.trim();
    final apiUrl =
        Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$query');
    final response = await http.get(apiUrl, headers: {
      'Access-Control-Allow-Origin': '*',
    });

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      dummy_data = [body['items'][0]['volumeInfo']['title']];
      cover_img = [
        body['items'][0]['volumeInfo']['imageLinks']['smallThumbnail']
      ];
      print(cover_img);
    } else {
      dummy_data = ['Not present in the list'];
      cover_img = [];
    }
    if (dummy_data.length == 0) {
      dummy_data = ['Not present in the list'];
      cover_img = [];
    }
    setState(() {});
  }

  void add(value, index) {
    for (int i = 0; i < value.list.length; i++) {
      if (value.list[i].id == index) {
        return;
      }
    }
    value.add(index, dummy_data[index], cover_img[index]);
  }

  Future<void> _mlApi(query) async {
    // query = query.replaceAll(' ', '');
    query = query.trim();

    final gsheets = GSheets(_credential);
    final ss = await gsheets.spreadsheet(_spreadsheetID);
    var sheet = ss.worksheetByTitle('Sheet1');
    final title = await sheet!.values.column(1);
    final images = await sheet!.values.column(2);
    final apiUrl =
        Uri.parse('https://jainpallav61.pythonanywhere.com/recommend/$query');
    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      print('hi');
      final body = jsonDecode(response.body);
      recommended = body['recommended_books'];
      for (int i = 0; i < recommended.length; i++) {
        int ind = title.indexOf(recommended[i]);
        if (ind != -1) {
          recommended_images.add(images[ind]);
        }
      }
      recommended_images.forEach((element) {
        cover_img.add(element);
      });
      recommended.forEach((element) {
        dummy_data.add(element);
      });
      setState(() {});
    }
  }

  Future<void> database(String title) async {
    try {
      final docRef = fireDb.collection('DbModel').doc();
      final name = box.get('name', defaultValue: 'user');
      DbModel obj = DbModel(name: name, title: title);
      await docRef.set(obj.toJson());
      print("Book saved successfully!");
    } catch (e) {
      print("Error saving : $e");
    }
  }

}
