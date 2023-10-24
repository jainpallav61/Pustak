import 'package:hive/hive.dart';

class HiveDatabase {
  final box = Hive.box('my-box');

  bool isLogin = false;
  bool isFirst = true;
  List bookmarkedTitle = [];
  List bookmarkedImages = [];
  List bookmarkedIndex = [];
  List wishlistedBooks = [];
  String name = '';
  String email = '';
  String password = '';

  void OnboardUpdate(){
    box.put('isFirst', isFirst);
  }

  void LoginUpdate(){
    box.put('isLogin', isLogin);
  }

  void CredentialsUpdate(){
    box.put('name',name);
    box.put('email',email);
    box.put('password',password);
  }

  void BookmarkUpdate(){
    box.put('bookmarkedIndex', bookmarkedIndex);
    box.put('bookmarkedTitle', bookmarkedTitle);
    box.put('bookmarkedImages', bookmarkedImages);
  }

  void loadData(){
    wishlistedBooks = box.get('wishlistedBooks',defaultValue: []);
  }


  //* Getter function - Ain't no use

  void getLogin(){
    isLogin = box.get('isLogin');
  }

  void getName(){
    name = box.get('name');
  }

  void getBookmarked(){
    bookmarkedIndex = box.get('bookmarkedIndex');
    bookmarkedTitle = box.get('bookmarkedTitle');
    bookmarkedImages = box.get('bookmarkedImages');
  }

 
}
