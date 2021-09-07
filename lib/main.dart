import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vurmies/create.dart';
import 'package:vurmies/home.dart';
import 'package:vurmies/pages/bottomvan.dart';
import 'package:vurmies/pages/categories.dart';
import 'package:vurmies/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: AuthMethods().getCurrentUser(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Bottom();
          } else {
            return Home();
          }
        },
      ),
    );
  }
}
