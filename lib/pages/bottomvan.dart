import 'package:flutter/material.dart';
import 'package:vurmies/create.dart';
import 'package:vurmies/home.dart';
import 'package:vurmies/pages/categories.dart';
import 'package:vurmies/pages/mypost.dart';
import 'package:vurmies/pages/profile.dart';

class Bottom extends StatefulWidget {
  Bottom({Key? key}) : super(key: key);

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int currentTabIndex = 0;
  late List<Widget> pages;

  late Widget currentPage;

  late Create homepage;

  late Profile getProfilePage;
  late MyPost newCart;
  @override
  void initState() {
    super.initState();

    homepage = Create();

    getProfilePage = Profile();
    newCart = MyPost();
    pages = [homepage, newCart, getProfilePage];
    currentPage = homepage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreenAccent[400],
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Categories()));
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.lightGreenAccent[400],
            ),
            label: "Home",
            backgroundColor: Colors.lightGreenAccent[400],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.post_add,
              color: Colors.lightGreenAccent[400],
            ),
            label: "My Post",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.lightGreenAccent[400]),
              label: "Profile"),
        ],
      ),
      body: currentPage,
    );
  }
}
