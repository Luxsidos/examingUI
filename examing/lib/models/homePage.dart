import 'package:example_for_examing/models/allPages/menuPage.dart';
import 'package:example_for_examing/models/allPages/overView.dart';
import 'package:example_for_examing/models/allPages/profilePage.dart';
import 'package:example_for_examing/models/allPages/starsPage.dart';
import 'package:example_for_examing/models/databaseForImages.dart';
import 'package:example_for_examing/models/loginDatas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? pagesList;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pagesList = [MenuPage(), OverView(), StarsPage(), ProfilePage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagesList![_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _cIndex,
        elevation: 0.0,
        selectedItemColor: Color(0xFF0F1826),
        unselectedItemColor: Color(0xFF0F1826).withOpacity(0.5),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.square_split_2x2_fill,
            ),
            label: "",
            tooltip: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_notifications),
            label: "",
            tooltip: "Overview",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.star_fill,
            ),
            label: "",
            tooltip: "Star",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_fill),
            label: "",
            tooltip: "Profile",
          ),
        ],
      ),
    );
  }

  _cIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
