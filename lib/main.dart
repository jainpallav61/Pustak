// ignore_for_file: unused_local_variable

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pustak/Pages/Details.dart';
import 'package:pustak/Pages/Search_%20bar.dart';
import 'package:pustak/Pages/Trending.dart';
import 'package:pustak/Pages/book_rec.dart';
import 'package:pustak/Pages/explore.dart';
import 'package:pustak/Pages/login_signUp.dart';
import 'package:pustak/Pages/splash_Screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pustak/utils/Wishlist.dart';
import 'package:pustak/utils/WishlistLogic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDDnxikm5NfrA52VlHvBMoQX64vsFZMZh8',
      appId: '1:353767821191:web:21e5d4ef433ab9bb538d22',
      messagingSenderId: '353767821191',
      projectId: 'fir-66cc4',
    ),
  );
  await Hive.initFlutter();
  Hive.registerAdapter(WishlistAdapter());
  var box = await Hive.openBox('my-box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WishlistLogic(),
      child: MaterialApp(
        title: "Pustak",
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFFBF00)),
        debugShowCheckedModeBanner: false,
        home: Splash_Screen(),
      ),
    );
  }
}
