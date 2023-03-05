import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyp_booking/Login/forgot_password.dart';
import '../../HomePage.dart';
import '../adminPanel.dart';
import 'SignUpPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = true;


  void validation(){
    if(usernameController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter the email");
    }
    else if(passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter the password");
    }else
    {
      //login();
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminPanel()));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
                  color: Color(0xff2c51a4)


        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 150, left: 30),
                child: const Text("Welcome!",
                  style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 30, bottom: 30),
                child: const Text("Login to explore best hotels",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                height: 59,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20,right: 10),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person,
                        color: Colors.grey,),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 17),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              SizedBox(height: 13,),
              Container(
                height: 59,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20,right: 10),
                child: TextField(
                  controller: passwordController,
                  obscureText: _passwordVisible,
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.lock
                              : Icons.lock_open,
                          color: Colors.grey,
                        ),
                        onPressed: (){
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 17),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.only(top: 8.0, right: 16, bottom: 8, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                        },
                        child: Text("Forgot password?",style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          decoration: TextDecoration.underline,
                        ))),
                  ],
                ),
              ),
              SizedBox(height: 38),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left:20, right: 20),
                child: ElevatedButton(
                    onPressed: () {
                      validation();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),

                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xff2c51a4),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, right: 16, bottom: 8, left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Text("New User? ",style: TextStyle(color: Colors.white),)),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                          },
                          child: Text("Create Account",style: TextStyle(color: Colors.white,decoration: TextDecoration.underline,),)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Future<void> login() async {
    var response = await http.post(
      Uri.parse("https://eazycare-api-staging.dipendranath.com.np/api/v1/public-app/user-app/login"),//this url is api
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',

      },
      body: (json.encode(
          {
            "userName": usernameController.text,
            "password": passwordController.text
          })),
    );
    // log(response.body);
    log("This is the response form backend"+response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      usernameController.clear();
      passwordController.clear();
      Fluttertoast.showToast(msg: "Success");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

    } else if(response.statusCode==401){
      usernameController.clear();
      passwordController.clear();
      Fluttertoast.showToast(msg: "${json.decode(response.body)}");
      Fluttertoast.showToast(msg: "Enter correct username or password");
    }

  }
}
