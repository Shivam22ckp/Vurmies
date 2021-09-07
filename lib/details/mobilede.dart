import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vurmies/services/database.dart';

class Mobilede extends StatefulWidget {
  Mobilede({Key? key}) : super(key: key);

  @override
  _MobiledeState createState() => _MobiledeState();
}

class _MobiledeState extends State<Mobilede> {
  Stream? serviceStream;

  @override
  void initState() {
    super.initState();
    doonthisLaunc();
  }

  getAdminOrders() async {
    serviceStream = await DatabaseMethods()
        .getServiceProvider(_isLoading ? "Mobile" : "Physical shop", "Mobile");
    setState(() {});
  }

  doonthisLaunc() {
    getAdminOrders();
  }

  Widget orderSoon() {
    return StreamBuilder(
      stream: serviceStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            child: Container(
                              height: 230,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(9),
                                  border: Border.all(
                                      color: Colors.lightGreenAccent,
                                      width: 3.0)),
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        width: 300,
                                        height: 130,
                                        child: Image.network(
                                          ds["imgUrl"],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          child: Container(
                                            height: 50.0,
                                            width: 50.0,
                                            child: Image.network(
                                              ds["Pic"],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              ds["Title"],
                                              style: TextStyle(
                                                  color: Colors
                                                      .lightGreenAccent[400],
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0),
                                            ),
                                            Text(
                                              ds["name"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  bool _isLoading = false, _regard = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 9.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Center(
                child: Container(
                  height: 190,
                  width: 190,
                  child: Image.asset(
                    "images/mobile.PNG",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(6),
                  height: 45,
                  width: 280,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      _isLoading
                          ? Center(
                              child: GestureDetector(
                                onTap: () {
                                  _regard = false;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "Mobile",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Center(
                              child: GestureDetector(
                                onTap: () {
                                  _isLoading = true;
                                  _regard = false;
                                  setState(() {
                                    doonthisLaunc();
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "Mobile",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      _regard
                          ? Center(
                              child: GestureDetector(
                                onTap: () {
                                  _regard = true;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "Physical shop",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Center(
                              child: GestureDetector(
                                onTap: () {
                                  _regard = true;
                                  _isLoading = false;
                                  setState(() {
                                    doonthisLaunc();
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "Physical shop",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Most Popular",
                style: TextStyle(
                    color: Colors.lightGreenAccent[400],
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              orderSoon(),
            ],
          ),
        ),
      ),
    );
  }
}
