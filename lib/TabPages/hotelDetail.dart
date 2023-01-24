import 'package:flutter/material.dart';
import 'BookPage.dart';
import 'FavoriteTabPage.dart';
import 'SelectRoomPage.dart';
import 'HomeTabPage.dart';

class HotelDetail extends StatefulWidget {
 // const HotelDetail({Key? key}) : super(key: key);
  final String imageUrl;
  final String hotelName;
  final String hotelLocation;

  HotelDetail(this.imageUrl, this.hotelName, this.hotelLocation);

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}


class _HotelDetailState extends State<HotelDetail> {
  bool _hasBeenPressed = false;

  void _toggleFavorite(){
    setState(() {
      if(_hasBeenPressed){
        _hasBeenPressed = false;
      }else{
        _hasBeenPressed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.imageUrl), fit: BoxFit.cover)
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                            child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back, size: 30)),
                        ),
                        Container(
                            height: 50,
                            width: 50,
                            child: IconButton(
                              icon: (_hasBeenPressed
                                  ? Icon(Icons.favorite, size: 40, color: Colors.red,)
                                  : Icon(Icons.favorite_border, size: 40, color: Colors.white,)),
                              onPressed: _toggleFavorite,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.hotelName,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),),
                    const SizedBox(
                      height: 9,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                        size: 30),
                        Icon(
                            Icons.star,
                            color: Colors.orangeAccent,
                            size: 30),
                        Icon(
                            Icons.star,
                            color: Colors.orangeAccent,
                            size: 30),
                        Icon(
                            Icons.star,
                            color: Colors.orangeAccent,
                            size: 30),
                        Icon(
                            Icons.star,
                            color: Colors.orangeAccent,
                            size: 30),
                      ],
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 30, color: Colors.grey,),
                        Text(widget.hotelLocation,style: TextStyle(fontSize: 18,),),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Description",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text("Hotel is .......",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(height: 20),
                    Text("Facilities", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.wifi, size: 37),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.ac_unit, size: 37),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange[400],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.restaurant, size: 37),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.pool, size: 37),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  const Text("NRs.2000/night",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: 50,
                    child: MaterialButton(
                      minWidth: 180,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectRoomPage()));
                      },
                      color: Color(0xff2c51a4),
                      child: Text("Select room", style: TextStyle(fontSize: 18, color: Colors.white),),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}