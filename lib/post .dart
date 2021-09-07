import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:vurmies/pages/bottomvan.dart';
import 'package:vurmies/services/crud.dart';
import 'package:vurmies/services/shared_pref.dart';

class Post extends StatefulWidget {
  String post, more;
  Post({required this.post, required this.more});

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  String userName = "", userPic = "";
  getMyInfoFromSharedPreference() async {
    userName = await SharedPreferenceHelper().getDisplayName();
    userPic = await SharedPreferenceHelper().getUserProfileUrl();
  }

  doThisOnLaunch() async {
    await getMyInfoFromSharedPreference();
  }

  @override
  void initState() {
    super.initState();
    doThisOnLaunch();
  }

  File? selectedImage;
  bool _isLoading = false;

  var downloadUrl;
  CrudMethods crudMethods = new CrudMethods();

  final ImagePicker _picker = ImagePicker();

  bool imageSelected = false;
  TextEditingController usertitleditingcontroller = new TextEditingController();
  TextEditingController userdesceditingcontroller = new TextEditingController();

  uploadBlog() async {
    if (selectedImage != null &&
        usertitleditingcontroller.text != null &&
        userdesceditingcontroller != null) {
      setState(() {
        _isLoading = true;
      });

      /// uploading image to firebase storage
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("blogImages")
          .child("${randomAlphaNumeric(9)}.jpg");

      final UploadTask task = firebaseStorageRef.putFile(selectedImage);

      var downloadUrl = await (await task).ref.getDownloadURL();
      print("this is url $downloadUrl");

      //     task.whenComplete(() {
      //     var url = ref.getDownloadURL();
      //  }).catchError((onError) {
      //   print(onError);
      //   });

      Map<String, String> blogMap = {
        "imgUrl": downloadUrl,
        "Title": usertitleditingcontroller.text,
        "description": userdesceditingcontroller.text,
        "Post": widget.post,
        "Sub": widget.more,
        "name": userName,
        "Pic": userPic,
      };
      crudMethods.addData(blogMap).then((result) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Bottom()));
      });
    } else {}
  }

  Future getImage() async {
    ImagePicker imagePicker;
    var image = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 60.0,
              ),
              Center(
                child: Container(
                  height: 40,
                  width: 190,
                  child: Text(
                    "Create Post",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.white60,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(24)),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: usertitleditingcontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title....",
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Container(
                height: 150,
                margin: EdgeInsets.symmetric(vertical: 16),
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.white60,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(24)),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: userdesceditingcontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Description of Post....",
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              selectedImage != null
                  ? GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          height: 120,
                          width: 140,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          )),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          height: 120,
                          width: 140,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Select the Image",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 80.0,
              ),
              InkWell(
                onTap: () {
                  uploadBlog();
                },
                child: Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.lightGreenAccent[400],
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Post",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
