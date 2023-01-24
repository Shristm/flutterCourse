import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_booking/Login/Login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  void validation(){
    if(emailController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter the email");
    }else
    {
      Fluttertoast.showToast(msg: "Email is sent");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2c51a4),
      ),
     body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
       child: SingleChildScrollView(
       scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, left: 30),
              child: const Text("Forgot Password?",
                style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,),
    ),
    ),
            Container(
              padding: const EdgeInsets.only(top: 16, left: 30, bottom: 30),
              child: const Text("Enter your email to reset your password.",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              height: 59,
              margin: const EdgeInsets.only(left: 20,right: 10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,
                      color: Colors.grey,),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Your email',
                    hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 17),
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 49,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left:20, right: 20),
              child: ElevatedButton(
                  onPressed: () {
                    validation();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),)),
                    backgroundColor: MaterialStateProperty.all(Color(0xff2c51a4),),
                  ),

                  child: const Text(
                    "Send",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )),
            ),
     ],
    ),
    ),
     ),
    );
  }
}
