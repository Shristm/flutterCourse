import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);
  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  void validation(){
    if(firstNameController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter the First name");
    }
    else if(lastNameController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter the Last name");
    }
    else if(emailController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter the email");
    }else
    {
      Fluttertoast.showToast(msg: "Your room is booked.");
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2c51a4),
        centerTitle: true,
        title: const Text("Book Hotels", style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, left: 30),
              child: const Text("Enter your details for booking rooms!",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top:20,right: 200),
              child: const Text(
                "First name:",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
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
              padding: const EdgeInsets.only(top:20,right: 209),
              child: const Text(
                "Last name:",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
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
              padding: const EdgeInsets.only(top:20,right: 266),
              child: const Text(
                "Email:",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
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
              padding: const EdgeInsets.only(top:20,right: 246),
              child: const Text(
                "Address:",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
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
              padding: const EdgeInsets.only(top:20,right: 167),
              child: const Text(
                "Phone number:",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
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
            SizedBox(
              height: 15,
            ),
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
                          borderRadius: BorderRadius.circular(9),)),
                    backgroundColor: MaterialStateProperty.all(Color(0xff2c51a4)),
                  ),

                  child: const Text(
                    "Book now",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )),
            ),
          ],
        ),
      )
    );
  }
}
