import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopRatedHotels extends StatefulWidget {
  const TopRatedHotels({Key? key}) : super(key: key);

  @override
  State<TopRatedHotels> createState() => _TopRatedHotelsState();
}

class _TopRatedHotelsState extends State<TopRatedHotels> {

  List postData = [];

  Future showAllHotel() async{
    var url = "http://192.168.10.76/fyp_booking_app/postAll.php";
    var response = await http.get(
        Uri.parse(url), headers: {"Accept":"application/json"});//this url is api
    if(response.statusCode == 200){
      var jsonData = json.decode(response.body);
      setState(() {
        postData = jsonData;
      });
      print(jsonData);
      return jsonData;
    }
  }

  @override
  void initState() {
    super.initState();
    showAllHotel();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
         itemCount: postData.length,
          itemBuilder: (context, index){
          return NewHotelPost(
              hotel_name: postData[index]['hotel_name'],
              location: postData[index]['location'],
              phone_number: postData[index]['phone_number'],
              email: postData[index]['email'],
              photo: 'http://192.168.10.76/fyp_booking_app/uploads/${postData[index]['photo']}',
              hotel_description: postData[index]['hotel_description'],
              facilities: postData[index]['facilities'],
              status: postData[index]['status'],
          );
      },

        ),
      ),
    );
  }
}

class NewHotelPost extends StatefulWidget {


  final hotel_name;
  final location;
  final phone_number;
  final email;
  final photo;
  final hotel_description;
  final facilities;
  final status;

  NewHotelPost({this.hotel_name, this.location,
    this.phone_number, this.email, this.photo,
    this.hotel_description, this.facilities, this.status});

  @override
  State<NewHotelPost> createState() => _NewHotelPostState();
}

class _NewHotelPostState extends State<NewHotelPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.photo),
              ),
              color: Color(0xff8391A1),
          borderRadius: BorderRadius.circular(10),
          ),
          ),
        ),
        Positioned(
          top: 40,
          left: 35,
          child: Text(widget.hotel_name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 29,
                fontWeight: FontWeight.bold),
          )
        ),
        Positioned(
            top: 100,
            left: 35,
            child: Text(widget.location,
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )
        ),
        Positioned(
            top: 180,
            left: 50,
            child: Text(widget.phone_number, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )
        ),
        Positioned(
            top: 210,
            left: 50,
            child: Text(widget.email, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )
        ),
        Positioned(
            top: 240,
            left: 50,
            child: Text(widget.hotel_description, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )
        ),
        Positioned(
            top: 270,
            left: 50,
            child: Text(widget.facilities, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )
        ),
        Positioned(
            top: 300,
            left: 50,
            child: Text(widget.status, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )
        ),

      ],),);
  }
}

