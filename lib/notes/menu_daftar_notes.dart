import 'package:flutter/material.dart';
import 'buat_notes.dart';

class menu_daftar_notes extends StatefulWidget {
  const menu_daftar_notes({super.key});

  @override
  State<menu_daftar_notes> createState() => _menu_daftar_notesState();
}

class _menu_daftar_notesState extends State<menu_daftar_notes> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 100,
            width: screenWidth,
            margin: EdgeInsets.only(
              top: 30,
              left: 30,
            ),
            child: Text(
              "Notes",
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.only(
              top: 30,
              left: screenWidth - 80,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => buat_notes()),
                );
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Container(
            height: 80,
            width: screenWidth - 80,
            margin: EdgeInsets.only(
              top: 200,
              left: 30,
            ),
          ),
        ],
      ),
    );
  }
}
