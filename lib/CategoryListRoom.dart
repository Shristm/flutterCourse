import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp_booking/TabPages/SelectCategoryBy.dart';
import 'package:http/http.dart' as http;

class CategoryListRoom extends StatefulWidget {
  const CategoryListRoom({Key? key}) : super(key: key);

  @override
  State<CategoryListRoom> createState() => _CategoryListRoomState();
}

class _CategoryListRoomState extends State<CategoryListRoom> {
///getting data from database
  List categories = [];

  Future getAllCategory() async{
    var url = "http://192.168.10.76/fyp_booking_app/CategoryRoomAll.php";
    var response = await http.get(
        Uri.parse(url), headers: {"Accept":"application/json"});//this url is api
    if(response.statusCode == 200){
      var jsonData = json.decode(response.body);
      setState(() {
        categories = jsonData;
      });
      print(jsonData);
      return jsonData;
    }
  }

  @override
  void initState() {
    super.initState();
    getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context,index){
        return RoomCategory(
            categoryName: categories[index]['name']);
    }),
    );
  }
}

class RoomCategory extends StatefulWidget {
  final categoryName;
  RoomCategory({this.categoryName});
 // const CategoryRoom({Key? key}) : super(key: key);

  @override
  State<RoomCategory> createState() => _RoomCategoryState();
}

class _RoomCategoryState extends State<RoomCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Text(widget.categoryName,
            style: TextStyle(color: Color(0xff2c51a4),
            fontWeight: FontWeight.w500, fontSize: 17),
          ),
          onTap: (){
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context)=>
                      SelectCategoryBy(categoryName: widget.categoryName,)));
          debugPrint(widget.categoryName);
          },),
      ),
    );
  }
}

