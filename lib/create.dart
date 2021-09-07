import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vurmies/details/autode.dart';
import 'package:vurmies/details/carde.dart';
import 'package:vurmies/details/commercialde.dart';
import 'package:vurmies/details/insurancede.dart';
import 'package:vurmies/details/itemde.dart';
import 'package:vurmies/details/mixde.dart';
import 'package:vurmies/details/mobilede.dart';
import 'package:vurmies/details/trainingde.dart';
import 'package:vurmies/pages/auto.dart';
import 'package:vurmies/pages/car.dart';

class Create extends StatefulWidget {
  Create({Key? key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
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
                height: 40.0,
              ),
              Center(
                child: Text(
                  "Explore",
                  style: TextStyle(
                      color: Colors.lightGreenAccent[400],
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Carde()));
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Autode()));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Insurancede()));
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Mobilede()));
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
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Commercialde()));
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Itemde()));
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
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Trainingde()));
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Mixde()));
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
