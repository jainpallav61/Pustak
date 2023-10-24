import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsheets/gsheets.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  State<Trending> createState() => _TrendingState();
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

List popBooks = [];
List cover_img = [];
List rate = [];

class _TrendingState extends State<Trending> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetch();
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
          child: popBooks.isNotEmpty
              ? SizedBox(
            height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: 22,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.black,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        color: Colors.black,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListTile(
                                            leading: SizedBox(
                                                height: 80,
                                                child: cover_img.isNotEmpty
                                                    ? Image.network(
                                                        cover_img[index],
                                                        fit: BoxFit.cover,
                                                      )
                                                    : const Text('')),
                                            title: Text(
                                              popBooks[index],
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            trailing: rate.isNotEmpty
                                                ? Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle, border: Border.all(width: 2,color: Colors.blue)),
                                                child: Center(child: Text(rate[index].toString(),style: TextStyle(color: Colors.white,),)))
                                                : const Text(''),
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            );
                          },
                        ),
                    ),
                  ],
                ),
              )
              : Container(
            color: Colors.amber,
            height: MediaQuery.of(context).size.height,
                child: Align(
                  alignment: Alignment.center,
                  child: Lottie.network(
                  'https://assets7.lottiefiles.com/packages/lf20_1a8dx7zj.json',
                  animate: true),
                ),
              ),
        ),
    );
  }

  Future<void> _fetch() async {
    final apiUrl = Uri.parse('https://pallavjain.pythonanywhere.com/popular');
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final body = response.body;
      popBooks = jsonDecode(body).toList();
    }
    if(popBooks.isNotEmpty){

      _fetchData();
    }
  }

  Future<void> _fetchData() async{
    final gsheets = GSheets(_credential);
    final ss = await gsheets.spreadsheet(_spreadsheetID);
    var sheet = ss.worksheetByTitle('Sheet1');
    final title = await sheet?.values.column(1);
    final images = await sheet?.values.column(2);
    final rating = await sheet?.values.column(4);
    title?.removeAt(0);
    images?.removeAt(0);
    rating?.removeAt(0);
    setState(() {
      for(int i = 0 ; i < popBooks.length ; i++){
        int ind = title!.indexOf(popBooks[i]);
        if(ind != -1){
          cover_img.add(images![ind]);
          rate.add(rating![ind]);
        }
      }
    });
  }
}
