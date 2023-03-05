import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fyp_booking/Login/Login.dart';
import 'package:fyp_booking/models/menuScreen.dart';
import '../CategoryListRoom.dart';
import '../HomePage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../TopRatedHotels.dart';
import '../models/data_hotel.dart';
import 'FavoriteTabPage.dart';
import 'hotelDetail.dart';

enum MenuSelection{
  menu1,
  menu2,
  menu3,
  menu4,
  menu5,
}

class HomeTabPage extends StatefulWidget {
     const HomeTabPage({Key? key}) : super(key: key);

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
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

  DataHotel object = DataHotel();
  MenuSelection? selectedOne;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2c51a4),
        //centerTitle: true,
        title: Text("Book@t", style: TextStyle(fontSize: 23),),
        actions: [IconButton(icon: Icon(Icons.logout),
          onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));},),],
        elevation: 1,
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(height: 10),
                 Text("Welcome!",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.height/50, top: MediaQuery.of(context).size.height/60),
                  child: Text("Where do you want to stay at?",style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(
                  height: 6,
                ),
                Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.height/50, right:MediaQuery.of(context).size.height/50 ),
                child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            width: 2,
                            color: Color(0xffE8ECF4),
                          )
                        ),
                        hintText: "Search your destination",
                        hintStyle: Theme.of(context).textTheme
                          .subtitle1!
                          .copyWith(
                          fontSize: 18,
                          color: Color(0xff8391A1),

                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Icon(Icons.search, size: 39,),
                        ),
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        errorMaxLines: 4,
                      ),
                      autovalidateMode:
                      AutovalidateMode.onUserInteraction,
                      onChanged: (query){
                        setState(() {

                        });
                      },
                      textCapitalization: TextCapitalization.sentences,
                    ),
              ),

                Padding(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.height/3.1, top: MediaQuery.of(context).size.height/34),
                  child: const Text("Explore",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                CategoryListRoom(),
                TopRatedHotels(),
                /*Container(
                  child: CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage("asset/image/Kathmandu.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),

                          image: DecorationImage(
                            image: AssetImage("asset/image/Pokhara.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage("asset/image/Bhaktapur.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage("asset/image/Chitwan.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 150,
                      enlargeCenterPage: false,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ),*/
                const SizedBox(
                  height: 10,
                ),
                /*Container(
                  height: 40,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            selectedOne = MenuSelection.menu1;
                          });
                        },
                        child: MenuScreen(
                          "All",
                          selectedOne == MenuSelection.menu1
                              ?Color(0xff2c51a4)
                              :Color(0xffF0F1F3),
                          selectedOne == MenuSelection.menu1
                              ?Colors.white
                              :Color(0xff2c51a4)
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            selectedOne = MenuSelection.menu2;
                            selectedOne == MenuSelection.menu2;
                          });
                        },
                        child: MenuScreen(
                          "Kathmandu",
                          selectedOne == MenuSelection.menu2
                              ?Color(0xff2c51a4)
                              :Color(0xffF0F1F3),
                            selectedOne == MenuSelection.menu1
                                ?Colors.black
                                :Color(0xff2c51a4)
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            selectedOne = MenuSelection.menu3;
                          });
                        },
                        child: MenuScreen(
                          "Pokhara",
                          selectedOne == MenuSelection.menu3
                              ?Color(0xff2c51a4)
                              :Color(0xffF0F1F3),
                          selectedOne == MenuSelection.menu3
                              ?Color(0xff2c51a4)
                              :Colors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            selectedOne = MenuSelection.menu4;
                          });
                        },
                        child: MenuScreen(
                          "Bhaktapur",
                          selectedOne == MenuSelection.menu4
                              ?Color(0xff2c51a4)
                              :Color(0xffF0F1F3),
                          selectedOne == MenuSelection.menu4
                              ?Color(0xff2c51a4)
                              :Colors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            selectedOne = MenuSelection.menu5;
                          });
                        },
                        child: MenuScreen(
                          "Chitwan",
                          selectedOne == MenuSelection.menu5
                              ?Color(0xff2c51a4)
                              :Color(0xffF0F1F3),
                          selectedOne == MenuSelection.menu5
                              ?Color(0xff2c51a4)
                              :Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                  height: 370,
                    width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: DataHotel.getData.length,
                      itemBuilder: (context, index){
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HotelDetail(
                              DataHotel.getData[index].imageUrl,
                              DataHotel.getData[index].name,
                              DataHotel.getData[index].location
                          )));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: AssetImage(
                                      DataHotel.getData[index].imageUrl),
                                fit: BoxFit.cover),
                              ),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 0,
                                child: IconButton(
                                    icon: (_hasBeenPressed
                                    ? Icon(Icons.favorite, size: 40, color: Colors.red,)
                                    : Icon(Icons.favorite_border, size: 40, color: Colors.white,)),
                                    onPressed: _toggleFavorite,
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DataHotel.getData[index].name,
                                      style: const TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 10,),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on,
                                          size: 30,
                                        color: Colors.white,),
                                        Text(DataHotel.getData[index].location,
                                        style: TextStyle(fontSize: 22, color: Colors.white),)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      }),
                ),*/
            ]
            ),
        ),
      ),
    );
  }
}


