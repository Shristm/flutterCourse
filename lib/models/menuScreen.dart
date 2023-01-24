import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
 // const MenuScreen({Key? key}) : super(key: key);
  final String text;
  final Color color;
  final textColor;
  MenuScreen(this.text, this.color, this.textColor);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 115,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: widget.color,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(15),
      ),
      
      child: Center(
        child: Text(
            "${widget.text}",
            style: TextStyle(fontSize: 15, color: Colors.black),
        ),
      ),
    );
  }
}
