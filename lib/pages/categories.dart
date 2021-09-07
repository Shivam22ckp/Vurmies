import 'package:flutter/material.dart';
import 'package:vurmies/pages/auto.dart';
import 'package:vurmies/pages/car.dart';
import 'package:vurmies/pages/commercial.dart';
import 'package:vurmies/pages/insurance.dart';
import 'package:vurmies/pages/item.dart';
import 'package:vurmies/pages/mobile.dart';
import 'package:vurmies/pages/traning.dart';

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Center(
                  child: Container(
                child: Text(
                  "What categories would you",
                  style: TextStyle(
                      color: Colors.lightGreenAccent[400],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              )),
              SizedBox(
                height: 10.0,
              ),
              Center(
                  child: Container(
                child: Text(
                  "like to post in?",
                  style: TextStyle(
                      color: Colors.lightGreenAccent[400],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              )),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Car(
                                    date: "Car",
                                  )));
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        "images/car.PNG",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Auto(
                                    date: "Auto",
                                  )));
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        "images/auto.PNG",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Insurance(date: "Insurance")));
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        "images/insurance.PNG",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Mobile(date: "Mobile")));
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        "images/mobile.PNG",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Commercial(date: "Commercial")));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      "images/commercial.PNG",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Item(date: "Item")));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      "images/item.PNG",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ]),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Training(date: "Training")));
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        "images/training.PNG",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Training(date: "mix")));
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        "images/mix.PNG",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
