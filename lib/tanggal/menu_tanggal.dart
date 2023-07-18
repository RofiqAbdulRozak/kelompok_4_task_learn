import 'package:flutter/material.dart';

class menu_tanggal extends StatefulWidget {
  const menu_tanggal({super.key});

  @override
  State<menu_tanggal> createState() => _menu_tanggalState();
}

class _menu_tanggalState extends State<menu_tanggal> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tanggal'),
      ),
      body: Center(
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextButton(
            onPressed: () => _selectDate(context),
            child: Text(
              'Lihat Kalender: ${selectedDate.toString().split(' ')[0]}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
