import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../HomePage.dart';
import 'Login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = true;


  void validation(){
    if(firstNameController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter the First name");
    }
    else if(lastNameController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter the Last name");
    }
    else if(emailController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter the email");
    }
    else if(passwordController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter the password");
    }else
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
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
        decoration: BoxDecoration(
          color: Color(0xff2c51a4)
        ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40, left: 30),
                  child: const Text("Sign up",
                    style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                //first name
                Container(
                  padding: const EdgeInsets.only(top:20,left: 24),
                  child: const Text(
                    "First name:",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),
                Container(
                  height: 59,
                  margin: const EdgeInsets.only(left: 20,right: 10),
                  child: TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your first name',
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 17),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                //last name
                Container(
                  padding: const EdgeInsets.only(top:20,left: 24),
                  child: const Text(
                    "Last name:",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),
                Container(
                  height: 59,
                  margin: const EdgeInsets.only(left: 20,right: 10),
                  child: TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your last name',
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 17),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                //email
                Container(
                  padding: const EdgeInsets.only(top:20,left: 24),
                  child: const Text(
                    "Email:",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),
                Container(
                  height: 59,
                  margin: const EdgeInsets.only(left: 20,right: 10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email,
                          color: Colors.grey,),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your email',
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 17),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:20,left: 24),
                  child: const Text(
                    "Address:",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),
                Container(
                  height: 59,
                  margin: const EdgeInsets.only(left: 20,right: 10),
                  child: TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_on,
                          color: Colors.grey,),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your address',
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 17),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:20,left: 24),
                  child: const Text(
                    "Phone number:",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),
                Container(
                  height: 59,
                  margin: const EdgeInsets.only(left: 20,right: 10),
                  child: TextField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone,
                          color: Colors.grey,),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your phone number',
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 17),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:20,left: 24),
                  child: Column(
                    children: [
                      const Text(
                        "Password:",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 59,
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
                        hintText: 'Enter password',
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 17),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                SizedBox(height: 20),
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
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                      ),

                      child: const Text(
                        "Sign Up",
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
                        Center(child: Text("Already have an account? ",style: TextStyle(color: Colors.white),)),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                            },
                            child: Text("Login",style: TextStyle(color: Colors.white,decoration: TextDecoration.underline,),)),
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
}

