import 'package:flutter/material.dart';

class BookTabPage extends StatefulWidget {
  const BookTabPage({Key? key}) : super(key: key);

  @override
  State<BookTabPage> createState() => _BookTabPageState();
}

class _BookTabPageState extends State<BookTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            backgroundColor: Color(0xff2c51a4),
            centerTitle: true,
            title: const Text("Booked Hotels", style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
    );
  }
}
