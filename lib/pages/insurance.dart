import 'package:flutter/material.dart';
import 'package:vurmies/post%20.dart';

class Insurance extends StatefulWidget {
  String date;
  Insurance({required this.date});
  @override
  _InsuranceState createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
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
                "images/insurance.PNG",
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
                              post: "Vechile",
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
                    "Vechile",
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
                              post: "Other",
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
                    "Other",
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
