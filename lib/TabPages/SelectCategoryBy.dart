import 'package:flutter/material.dart';

class SelectCategoryBy extends StatefulWidget {
  const SelectCategoryBy({Key? key}) : super(key: key);

  @override
  State<SelectCategoryBy> createState() => _SelectCategoryByState();
}

class _SelectCategoryByState extends State<SelectCategoryBy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category by: "),
      ),
        body: Container());
  }
}
