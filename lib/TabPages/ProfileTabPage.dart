import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Login/Login.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  _ProfileTabPageState createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {


  String? userId;
  String? username;
  String? email;
  String? address;
  String? mobilenumber;
  int? gender;
  String? created_date_bs;

  File? imageFile;

  String Name = "";

  Future<void> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Name = prefs.getString("name").toString();
  }

  @override
  void initState() {
    getName();
    // TODO: implement initState
    super.initState();
  }

  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        padding: const EdgeInsets.only(left: 10, right: 10),
        color: Colors.white,
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [

                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(-1.0, -0.94),
                        end: Alignment(0.968, 1.0),
                        colors: [Color(0xff2c51a4), Color(0xff6b88e8)],
                        stops: [0.0, 1.0],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(70),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(65),
                              child: imageFile == null
                                  ? Image.network(
                                "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png",
                                fit: BoxFit.fill,
                              )
                                  : Image.file(
                                imageFile!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              _showImageDialog();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(width: 2, color: Colors.white),
                                  shape: BoxShape.circle,
                                  color: Colors.red),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              Text(
                "${Name}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "example@gmail.com",
                style: const TextStyle(color: Colors.blueGrey, fontSize: 14),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 160,
                margin: const EdgeInsets.only(right: 10, left: 10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x155665df),
                      spreadRadius: 5,
                      blurRadius: 17,
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                  color: Color(0x155665df),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Pokhara",
                                style: const TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Female",
                                style: const TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.date_range_rounded,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "2001/11/03",
                                style: const TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "9866344635",
                                  style: const TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: Container(
                        width: 170,
                        height: 51,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff2c51a4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          child: Text(
                            "Logout",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,),
                          ),
                        ),
                      ),
                    ),
                  ],

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Please choose an option"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    _getFromCamera();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.camera,
                          color: Color(0xff2c51a4),
                        ),
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(color: Color(0xff2c51a4)),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    _getFromGallery();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.image,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(color: Colors.blueAccent),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
    // _cropImage(pickedFile!.path);
    Navigator.pop(context);
  }

  void _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
    // _cropImage(pickedFile!.path);
    Navigator.pop(context);
  }
}
