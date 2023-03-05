import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SelectCategoryBy extends StatefulWidget {
  final categoryName;
  SelectCategoryBy({this.categoryName});

  @override
  State<SelectCategoryBy> createState() => _SelectCategoryByState();
}

class _SelectCategoryByState extends State<SelectCategoryBy> {

  List categoryByRoom = [];

  Future categoryByData() async{
    var url = "http://192.168.1.64/fyp_booking_app/CategoryByRoom.php";
    var response = await http.post(
        Uri.parse(url),
        body: {'name': widget.categoryName});
    //this url is api
    if(response.statusCode == 200){
      var jsonData = json.decode(response.body);
      setState(() {
        categoryByRoom = jsonData;
      });

    }
  }
  @override
  void initState() {
    super.initState();
    categoryByData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
        body: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: categoryByRoom.length != null ? categoryByRoom.length : 0,
            itemBuilder: (context,index){
              return Text(categoryByRoom[index]['hotel_name']);
        },
        ),
        ),
    );
  }
}
