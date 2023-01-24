import 'package:flutter/material.dart';

class FavoriteTabPage extends StatefulWidget {
  const FavoriteTabPage({Key? key}) : super(key: key);

  @override
  State<FavoriteTabPage> createState() => _FavoriteTabPageState();
}

class _FavoriteTabPageState extends State<FavoriteTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2c51a4),
        centerTitle: true,
        title: const Text("Favorite Hotels", style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                ))
          ],
        ),
      ),
    );
  }
}
