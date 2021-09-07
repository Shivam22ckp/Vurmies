import 'package:flutter/material.dart';
import 'package:vurmies/post%20.dart';

class Car extends StatefulWidget {
  String date;
  Car({required this.date});

  @override
  _CarState createState() => _CarState();
}

class _CarState extends State<Car> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 40.0,
            ),
            Center(
                child: Container(
              child: Text(
                "What subcategories would you",
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
            Container(
              height: 150,
              width: 150,
              child: Image.asset(
                "images/car.PNG",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Post(
                              post: "Owner",
                              more: widget.date,
                            )));
              },
              child: Container(
                width: 110,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Owner",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Post(
                              post: "Dealer",
                              more: widget.date,
                            )));
              },
              child: Container(
                width: 110,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Dealer",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
