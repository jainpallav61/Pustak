// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:pustak/utils/Hive_database.dart';
import 'package:pustak/utils/Wishlist.dart';
import 'package:hive/hive.dart';

class WishlistLogic extends ChangeNotifier {
  HiveDatabase db = HiveDatabase();
  final box = Hive.box('my-box');

  List<Wishlist> list = [];

  void add(id, title, image) {
    list.add(Wishlist(id: id, title: title, image: image));
    db.wishlistedBooks = box.get('wishlistedBooks', defaultValue: []);
    db.wishlistedBooks.add(list[list.length - 1]);
    box.put('wishlistedBooks', db.wishlistedBooks);
    db.loadData();
    notifyListeners();
  }

  void del(int index) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].id == index) {
        list.removeAt(i);
        break;
      }
    }
    db.wishlistedBooks = box.get('wishlistedBooks', defaultValue: []);
    for (int i = 0; i < db.wishlistedBooks.length; i++) {
      if (db.wishlistedBooks[i].id == index) {
        db.wishlistedBooks.removeAt(i);
        box.put('wishlistedBooks', db.wishlistedBooks);
        db.loadData();
        break;
      }
    }
    notifyListeners();
  }
}
