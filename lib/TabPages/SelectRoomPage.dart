import 'package:flutter/material.dart';
import 'package:fyp_booking/TabPages/BookPage.dart';

class SelectRoomPage extends StatefulWidget {
  const SelectRoomPage({Key? key}) : super(key: key);

  @override
  State<SelectRoomPage> createState() => _SelectRoomPageState();
}

class _SelectRoomPageState extends State<SelectRoomPage> {

  final _dateC = TextEditingController();
  final _timeC = TextEditingController();

  /// Date
  DateTime selected = DateTime.now();
  DateTime initial = DateTime(2023);
  DateTime last = DateTime(2024);

  /// Time
  TimeOfDay timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2c51a4),
        centerTitle: true,
        title: const Text("Select Rooms", style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    controller: _dateC,
                    decoration: const InputDecoration(
                      labelText: "Date",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xff2c51a4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _timeC,
                    decoration: const InputDecoration(
                      labelText: "Time",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xff2c51a4),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  ElevatedButton(
                      onPressed: () => displayDatePicker(context),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),),),
                        backgroundColor: MaterialStateProperty.all(
                            Color(0xff2c51a4)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(9),
                        child: const Text("Choose Date"),
                      )),
                  SizedBox(
                    height: 7,
                  ),
                  ElevatedButton(
                      onPressed: () => displayTimePicker(context),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),),),
                        backgroundColor: MaterialStateProperty.all(
                            Color(0xff2c51a4)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(9),
                        child: const Text("Choose Time"),
                      )),
                ],
              ),
            ),
            Container(
              child: Text("Rooms",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height/2.6,
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage("asset/image/room0.png"),
                            fit: BoxFit.fill),
                    ),),
                        Text("Single Room", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                          Container(
                          height: 50,
                          child: MaterialButton(
                            minWidth: 180,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookPage()));
                            },
                            color: Color(0xff2c51a4),
                            child: Text("Book room", style: TextStyle(fontSize: 18, color: Colors.white),),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height/2.6,
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage("asset/image/room1.png"),
                                fit: BoxFit.fill),
                          ),),
                        Text("Double Room", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        Container(
                          height: 50,
                          child: MaterialButton(
                            minWidth: 180,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookPage()));
                            },
                            color: Color(0xff2c51a4),
                            child: Text("Book room", style: TextStyle(fontSize: 18, color: Colors.white),),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height/2.6,
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage("asset/image/room2.png"),
                                fit: BoxFit.fill),
                          ),),
                        Text("Twin Room", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        Container(
                          height: 50,
                          child: MaterialButton(
                            minWidth: 180,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookPage()));
                            },
                            color: Color(0xff2c51a4),
                            child: Text("Book room", style: TextStyle(fontSize: 18, color: Colors.white),),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future displayDatePicker(BuildContext context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: selected,
      firstDate: initial,
      lastDate: last,
    );
    if (date != null) {
      setState(() {
        _dateC.text = date.toLocal().toString().split(" ") [0];
      });
    }
  }

  Future displayTimePicker(BuildContext context) async {
    var time = await showTimePicker(
      context: context,
      initialTime: timeOfDay,
    );
    if (time != null) {
      setState(() {
        _timeC.text = "${time.hour}: ${time.minute}";
      });
    }
  }
}