// ignore_for_file: must_be_immutable, camel_case_types, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pustak/Pages/Search_%20bar.dart';
import '../Pages/Trending.dart';
import '../Pages/book_rec.dart';
import '../Pages/explore.dart';


class Persistent_NavBar extends StatelessWidget {
  Persistent_NavBar({super.key});
  final bottom_controller = PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      backgroundColor: Colors.black,
      controller: bottom_controller,
      screens: _buildScreens(),
      items: _navBarItems(),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        // colorBehindNavBar: Colors.white,
      ),
      navBarStyle: NavBarStyle.style13,
    );
  }


  List<Widget> _buildScreens() {
    return [
      const Explore(),
      const bookrec(),
      const Trending(),
      const Search_Bar(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.amber,
        inactiveColorPrimary: CupertinoColors.systemGrey,
         textStyle: TextStyle(color: Colors.white),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: "Favs",
        activeColorPrimary: Colors.amber,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        textStyle: TextStyle(color: Colors.white),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.trending_up),
        title: "Search",
        activeColorPrimary: Colors.amber,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        textStyle: TextStyle(color: Colors.white),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: "Search",
        activeColorPrimary: Colors.amber,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        textStyle: TextStyle(color: Colors.white),
      ),
    ];
  }
}
