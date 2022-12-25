import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {

   dynamic name;

   HomeScreen({Key? key,required this.name}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text(widget.name['name'].toString())),  //* <-- yah Hai constructor ka Data access Karne Ka Tarika
      body: Column(
        children: [

        ],
      ),
     );
  }
}